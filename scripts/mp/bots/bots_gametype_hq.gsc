// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\bots\bots_util.gsc;
#using scripts\mp\bots\bots_strategy.gsc;
#using scripts\mp\bots\bots_gametype_common.gsc;
#using scripts\mp\gameobjects.gsc;

#namespace namespace_b437201ccd973e60;

// Namespace namespace_b437201ccd973e60/namespace_a34f667bb5bfc598
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13b
// Size: 0x11
function main() {
    setup_callbacks();
    bot_hq_start();
}

// Namespace namespace_b437201ccd973e60/namespace_a34f667bb5bfc598
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x153
// Size: 0x6
function function_e45e46b7c35deadb() {
    /#
    #/
}

// Namespace namespace_b437201ccd973e60/namespace_a34f667bb5bfc598
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x160
// Size: 0xa
function bot_hq_start() {
    setup_bot_hq();
}

// Namespace namespace_b437201ccd973e60/namespace_a34f667bb5bfc598
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x171
// Size: 0x2d
function setup_callbacks() {
    level.bot_funcs["gametype_think"] = &bot_hq_think;
    level.bot_funcs["should_start_cautious_approach"] = &should_start_cautious_approach_hq;
}

// Namespace namespace_b437201ccd973e60/namespace_a34f667bb5bfc598
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a5
// Size: 0x17c
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
                wait(5);
                if (objective.nodes.size < 3) {
                    var_794c62d4a40cacbd = 1;
                }
            }
        #/
    }
    level.bot_set_zone_nodes = 1;
    if (!var_794c62d4a40cacbd) {
        var_a8a529c46af43d6 = find_current_radio();
        if (!isdefined(var_a8a529c46af43d6)) {
            var_a8a529c46af43d6 = random(level.objectives);
        }
        bot_cache_entrances_to_zones([0:var_a8a529c46af43d6]);
        level.bot_gametype_radios_precached[var_a8a529c46af43d6.trigger getentitynumber()] = 1;
        level.bot_gametype_precaching_done = 1;
        thread bot_cache_entrances_to_other_radios(var_a8a529c46af43d6);
    }
}

// Namespace namespace_b437201ccd973e60/namespace_a34f667bb5bfc598
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x328
// Size: 0xa2
function bot_cache_entrances_to_other_radios(radio_done) {
    var_e82e204dba2ac737 = array_remove(level.objectives, radio_done);
    while (var_e82e204dba2ac737.size > 0) {
        var_4687ed96ec4dd607 = undefined;
        var_a8a529c46af43d6 = find_current_radio();
        if (isdefined(var_a8a529c46af43d6) && array_contains(var_e82e204dba2ac737, var_a8a529c46af43d6)) {
            var_4687ed96ec4dd607 = var_a8a529c46af43d6;
        } else {
            var_4687ed96ec4dd607 = random(var_e82e204dba2ac737);
        }
        bot_cache_entrances_to_zones([0:var_4687ed96ec4dd607]);
        level.bot_gametype_radios_precached[var_4687ed96ec4dd607.trigger getentitynumber()] = 1;
        var_e82e204dba2ac737 = array_remove(var_e82e204dba2ac737, var_4687ed96ec4dd607);
    }
}

// Namespace namespace_b437201ccd973e60/namespace_a34f667bb5bfc598
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3d1
// Size: 0x1ab
function bot_hq_think() {
    self notify("bot_hq_think");
    self endon("bot_hq_think");
    self endon("death_or_disconnect");
    level endon("game_ended");
    while (!isdefined(level.bot_gametype_precaching_done)) {
        wait(0.05);
    }
    self botsetflag("separation", 0);
    self botsetflag("grenade_objectives", 1);
    while (1) {
        /#
            if (getdvarint(@"hash_c2de8ca6dc8512c1")) {
                wait(0.05);
                continue;
            }
        #/
        wait(0.05);
        if (self.health <= 0) {
            continue;
        }
        var_a8a529c46af43d6 = find_current_radio();
        if (!isdefined(var_a8a529c46af43d6) || !istrue(var_a8a529c46af43d6.active) || !isdefined(level.bot_gametype_radios_precached[var_a8a529c46af43d6.trigger getentitynumber()])) {
            bot_clear_hq_zone();
            self [[ self.personality_update_function ]]();
        } else {
            var_b3757acf241cf25b = level.zone namespace_19b4203b51d56488::getownerteam();
            if (self.team != var_b3757acf241cf25b) {
                if (!bot_is_capturing_hq_zone(var_a8a529c46af43d6)) {
                    bot_capture_hq_zone(var_a8a529c46af43d6);
                }
            } else {
                enemy_team = get_enemy_team(self.team);
                var_5c16102fdff3e853 = level.zone.touchlist[enemy_team].size > 0;
                if (var_5c16102fdff3e853) {
                    if (!bot_is_capturing_hq_zone(var_a8a529c46af43d6)) {
                        bot_capture_hq_zone(var_a8a529c46af43d6);
                    }
                } else if (!bot_is_protecting_hq_zone(var_a8a529c46af43d6)) {
                    if (bot_is_capturing_hq_zone(var_a8a529c46af43d6)) {
                        wait(randomfloat(2));
                        bot_clear_hq_zone();
                        continue;
                    }
                    bot_protect_hq_zone(var_a8a529c46af43d6);
                }
            }
        }
    }
}

// Namespace namespace_b437201ccd973e60/namespace_a34f667bb5bfc598
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x583
// Size: 0x82
function find_current_radio() {
    foreach (radio in level.objectives) {
        if (isdefined(level.zone) && radio.trigger == level.zone.trigger) {
            return radio;
        }
    }
}

// Namespace namespace_b437201ccd973e60/namespace_a34f667bb5bfc598
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x60c
// Size: 0x30
function bot_is_capturing_hq_zone(zone) {
    if (!bot_is_capturing()) {
        return 0;
    }
    return isdefined(self.current_zone) && self.current_zone == zone;
}

// Namespace namespace_b437201ccd973e60/namespace_a34f667bb5bfc598
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x644
// Size: 0x30
function bot_is_protecting_hq_zone(zone) {
    if (!bot_is_protecting()) {
        return 0;
    }
    return isdefined(self.current_zone) && self.current_zone == zone;
}

// Namespace namespace_b437201ccd973e60/namespace_a34f667bb5bfc598
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x67c
// Size: 0x78
function bot_capture_hq_zone(zone) {
    self.current_zone = zone;
    optional_params["entrance_points_index"] = zone.entrance_indices;
    optional_params["override_origin_node"] = zone.center_node;
    bot_capture_zone(zone.trigger.origin, zone.nodes, zone.trigger, optional_params);
}

// Namespace namespace_b437201ccd973e60/namespace_a34f667bb5bfc598
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6fb
// Size: 0x78
function bot_protect_hq_zone(zone) {
    self.current_zone = zone;
    var_376b1e7b1e7525f2 = length(zone.zone_bounds.half_size) * 2;
    optional_params["override_origin_node"] = zone.center_node;
    bot_protect_point(zone.center_node.origin, var_376b1e7b1e7525f2, optional_params);
}

// Namespace namespace_b437201ccd973e60/namespace_a34f667bb5bfc598
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x77a
// Size: 0x1d
function bot_clear_hq_zone() {
    if (bot_is_defending()) {
        bot_defend_stop();
    }
    self.current_zone = undefined;
}

// Namespace namespace_b437201ccd973e60/namespace_a34f667bb5bfc598
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x79e
// Size: 0x4c
function should_start_cautious_approach_hq(var_44770b14726e7a47) {
    if (var_44770b14726e7a47) {
        team = level.zone namespace_19b4203b51d56488::getownerteam();
        if (team == "neutral" || team == self.team) {
            return 0;
        }
    }
    return should_start_cautious_approach_default(var_44770b14726e7a47);
}

