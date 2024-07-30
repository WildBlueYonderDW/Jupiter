#using scripts\engine\utility.gsc;
#using scripts\mp\bots\bots_util.gsc;
#using scripts\mp\bots\bots_strategy.gsc;
#using scripts\mp\bots\bots_gametype_common.gsc;
#using scripts\mp\gameobjects.gsc;

#namespace bots_gametype_hq;

// Namespace bots_gametype_hq / scripts\mp\bots\bots_gametype_hq
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13b
// Size: 0x10
function main() {
    setup_callbacks();
    bot_hq_start();
}

/#

    // Namespace bots_gametype_hq / scripts\mp\bots\bots_gametype_hq
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x153
    // Size: 0x5
    function function_e45e46b7c35deadb() {
        
    }

#/

// Namespace bots_gametype_hq / scripts\mp\bots\bots_gametype_hq
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x160
// Size: 0x9
function bot_hq_start() {
    setup_bot_hq();
}

// Namespace bots_gametype_hq / scripts\mp\bots\bots_gametype_hq
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x171
// Size: 0x2c
function setup_callbacks() {
    level.bot_funcs["gametype_think"] = &bot_hq_think;
    level.bot_funcs["should_start_cautious_approach"] = &should_start_cautious_approach_hq;
}

// Namespace bots_gametype_hq / scripts\mp\bots\bots_gametype_hq
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a5
// Size: 0x17b
function setup_bot_hq() {
    bot_waittill_bots_enabled();
    var_794c62d4a40cacbd = 0;
    foreach (objective in level.objectives) {
        objective thread monitor_zone_control();
        var_c24b62a774e2496b = 0;
        if (istrue(objective.trigger.trigger_off)) {
            objective.trigger trigger_on();
            var_c24b62a774e2496b = 1;
        }
        objective.nodes = bot_get_valid_nodes_in_trigger(objective.trigger);
        if (var_c24b62a774e2496b) {
            objective.trigger trigger_off();
        }
        /#
            if (objective.nodes.size < 5) {
                wait 5;
                if (objective.nodes.size < 3) {
                    var_794c62d4a40cacbd = 1;
                }
            }
        #/
    }
    level.bot_set_zone_nodes = 1;
    if (!var_794c62d4a40cacbd) {
        current_radio = find_current_radio();
        if (!isdefined(current_radio)) {
            current_radio = random(level.objectives);
        }
        bot_cache_entrances_to_zones([current_radio]);
        level.bot_gametype_radios_precached[current_radio.trigger getentitynumber()] = 1;
        level.bot_gametype_precaching_done = 1;
        thread bot_cache_entrances_to_other_radios(current_radio);
    }
}

// Namespace bots_gametype_hq / scripts\mp\bots\bots_gametype_hq
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x328
// Size: 0xa1
function bot_cache_entrances_to_other_radios(radio_done) {
    for (radios_left = array_remove(level.objectives, radio_done); radios_left.size > 0; radios_left = array_remove(radios_left, radio_precaching)) {
        radio_precaching = undefined;
        current_radio = find_current_radio();
        if (isdefined(current_radio) && array_contains(radios_left, current_radio)) {
            radio_precaching = current_radio;
        } else {
            radio_precaching = random(radios_left);
        }
        bot_cache_entrances_to_zones([radio_precaching]);
        level.bot_gametype_radios_precached[radio_precaching.trigger getentitynumber()] = 1;
    }
}

// Namespace bots_gametype_hq / scripts\mp\bots\bots_gametype_hq
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3d1
// Size: 0x1aa
function bot_hq_think() {
    self notify("bot_hq_think");
    self endon("bot_hq_think");
    self endon("death_or_disconnect");
    level endon("game_ended");
    while (!isdefined(level.bot_gametype_precaching_done)) {
        wait 0.05;
    }
    self botsetflag("separation", 0);
    self botsetflag("grenade_objectives", 1);
    while (true) {
        /#
            if (getdvarint(@"hash_c2de8ca6dc8512c1")) {
                wait 0.05;
                continue;
            }
        #/
        wait 0.05;
        if (self.health <= 0) {
            continue;
        }
        current_radio = find_current_radio();
        if (!isdefined(current_radio) || !istrue(current_radio.active) || !isdefined(level.bot_gametype_radios_precached[current_radio.trigger getentitynumber()])) {
            bot_clear_hq_zone();
            self [[ self.personality_update_function ]]();
            continue;
        }
        hqowningteam = level.zone scripts\mp\gameobjects::getownerteam();
        if (self.team != hqowningteam) {
            if (!bot_is_capturing_hq_zone(current_radio)) {
                bot_capture_hq_zone(current_radio);
            }
            continue;
        }
        enemy_team = get_enemy_team(self.team);
        var_5c16102fdff3e853 = level.zone.touchlist[enemy_team].size > 0;
        if (var_5c16102fdff3e853) {
            if (!bot_is_capturing_hq_zone(current_radio)) {
                bot_capture_hq_zone(current_radio);
            }
            continue;
        }
        if (!bot_is_protecting_hq_zone(current_radio)) {
            if (bot_is_capturing_hq_zone(current_radio)) {
                wait randomfloat(2);
                bot_clear_hq_zone();
                continue;
            }
            bot_protect_hq_zone(current_radio);
        }
    }
}

// Namespace bots_gametype_hq / scripts\mp\bots\bots_gametype_hq
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x583
// Size: 0x81
function find_current_radio() {
    foreach (radio in level.objectives) {
        if (isdefined(level.zone) && radio.trigger == level.zone.trigger) {
            return radio;
        }
    }
}

// Namespace bots_gametype_hq / scripts\mp\bots\bots_gametype_hq
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x60c
// Size: 0x2f
function bot_is_capturing_hq_zone(zone) {
    if (!bot_is_capturing()) {
        return false;
    }
    return isdefined(self.current_zone) && self.current_zone == zone;
}

// Namespace bots_gametype_hq / scripts\mp\bots\bots_gametype_hq
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x644
// Size: 0x2f
function bot_is_protecting_hq_zone(zone) {
    if (!bot_is_protecting()) {
        return false;
    }
    return isdefined(self.current_zone) && self.current_zone == zone;
}

// Namespace bots_gametype_hq / scripts\mp\bots\bots_gametype_hq
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x67c
// Size: 0x77
function bot_capture_hq_zone(zone) {
    self.current_zone = zone;
    optional_params["entrance_points_index"] = zone.entrance_indices;
    optional_params["override_origin_node"] = zone.center_node;
    bot_capture_zone(zone.trigger.origin, zone.nodes, zone.trigger, optional_params);
}

// Namespace bots_gametype_hq / scripts\mp\bots\bots_gametype_hq
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6fb
// Size: 0x77
function bot_protect_hq_zone(zone) {
    self.current_zone = zone;
    zone_radius = length(zone.zone_bounds.half_size) * 2;
    optional_params["override_origin_node"] = zone.center_node;
    bot_protect_point(zone.center_node.origin, zone_radius, optional_params);
}

// Namespace bots_gametype_hq / scripts\mp\bots\bots_gametype_hq
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x77a
// Size: 0x1c
function bot_clear_hq_zone() {
    if (bot_is_defending()) {
        bot_defend_stop();
    }
    self.current_zone = undefined;
}

// Namespace bots_gametype_hq / scripts\mp\bots\bots_gametype_hq
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x79e
// Size: 0x4b
function should_start_cautious_approach_hq(firstcheck) {
    if (firstcheck) {
        team = level.zone scripts\mp\gameobjects::getownerteam();
        if (team == "neutral" || team == self.team) {
            return 0;
        }
    }
    return should_start_cautious_approach_default(firstcheck);
}

