// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\bots\bots_util.gsc;
#using scripts\mp\bots\bots_strategy.gsc;
#using scripts\mp\bots\bots_gametype_common.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\bots\bots.gsc;

#namespace bots_gametype_cmd;

// Namespace bots_gametype_cmd / scripts/mp/bots/bots_gametype_cmd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bb
// Size: 0x11
function main() {
    setup_callbacks();
    setup_hardpoint();
}

// Namespace bots_gametype_cmd / scripts/mp/bots/bots_gametype_cmd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d3
// Size: 0x6
function function_e45e46b7c35deadb() {
    /#
    #/
}

// Namespace bots_gametype_cmd / scripts/mp/bots/bots_gametype_cmd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e0
// Size: 0x36
function setup_hardpoint() {
    bot_waittill_bots_enabled(1);
    thread bot_hardpoint_ai_director_update();
    level.protect_radius = 128;
    level.patrol_radius = 800;
    level.bot_gametype_precaching_done = 1;
}

// Namespace bots_gametype_cmd / scripts/mp/bots/bots_gametype_cmd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21d
// Size: 0x18
function setup_callbacks() {
    level.bot_funcs["gametype_think"] = &bot_hardpoint_think;
}

// Namespace bots_gametype_cmd / scripts/mp/bots/bots_gametype_cmd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23c
// Size: 0x221
function initialize_role() {
    attackers = get_allied_attackers_for_team(self.team);
    defenders = get_allied_defenders_for_team(self.team);
    attacker_limit = bot_attacker_limit_for_team(self.team);
    defender_limit = bot_defender_limit_for_team(self.team);
    personality_type = level.bot_personality_type[self.personality];
    if (personality_type == "active") {
        if (attackers.size >= attacker_limit) {
            var_8668b3fa2350c9b3 = 0;
            foreach (attacker in attackers) {
                if (isai(attacker) && level.bot_personality_type[attacker.personality] == "stationary") {
                    attacker.role = undefined;
                    var_8668b3fa2350c9b3 = 1;
                    break;
                }
            }
            if (var_8668b3fa2350c9b3) {
                bot_set_role("attacker");
            } else {
                bot_set_role("defender");
            }
        } else {
            bot_set_role("attacker");
        }
        return;
    }
    if (personality_type == "stationary") {
        if (defenders.size >= defender_limit) {
            var_8668b3fa2350c9b3 = 0;
            foreach (defender in defenders) {
                if (isai(defender) && level.bot_personality_type[defender.personality] == "active") {
                    defender.role = undefined;
                    var_8668b3fa2350c9b3 = 1;
                    break;
                }
            }
            if (var_8668b3fa2350c9b3) {
                bot_set_role("defender");
            } else {
                bot_set_role("attacker");
            }
            return;
        }
        bot_set_role("defender");
    }
}

// Namespace bots_gametype_cmd / scripts/mp/bots/bots_gametype_cmd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x464
// Size: 0x27e
function bot_hardpoint_think() {
    self notify("bot_grnd_think");
    self endon("bot_grnd_think");
    self endon("death_or_disconnect");
    level endon("game_ended");
    self botclearscriptgoal();
    while (!isdefined(level.bot_gametype_precaching_done)) {
        wait(0.05);
    }
    self botsetflag("separation", 0);
    var_b8c1e1e55c9691e4 = undefined;
    for (var_bc9376a31c216786 = undefined; true; var_bc9376a31c216786 = level.currentobjective.trigger) {
        wait(0.05);
        if (!isdefined(level.currentobjective)) {
            continue;
        }
        if (bot_has_tactical_goal()) {
            continue;
        }
        if (!isdefined(self.role)) {
            initialize_role();
        }
        if (!istrue(self.bot_defending)) {
            var_b8c1e1e55c9691e4 = undefined;
            var_bc9376a31c216786 = undefined;
        }
        if (self.role == "attacker") {
            var_7d8b092bacf8a8d8 = 0;
            var_bc9376a31c216786 = undefined;
            if (!isdefined(var_b8c1e1e55c9691e4)) {
                var_7d8b092bacf8a8d8 = 1;
            } else if (isdefined(level.currentobjective.trigger)) {
                if (var_b8c1e1e55c9691e4 != level.currentobjective.trigger) {
                    var_7d8b092bacf8a8d8 = 1;
                }
            }
            if (var_7d8b092bacf8a8d8) {
                zoneorigin = getclosestpointonnavmesh(level.currentobjective.trigger.origin, self);
                optional_params["min_goal_time"] = 1;
                optional_params["max_goal_time"] = 4;
                bot_patrol_area(zoneorigin, level.patrol_radius, optional_params);
                var_b8c1e1e55c9691e4 = level.currentobjective.trigger;
            }
            continue;
        }
        if (self.role == "defender") {
            var_b8c1e1e55c9691e4 = undefined;
            var_d6180d62096f9cdc = 0;
            if (!isdefined(var_bc9376a31c216786)) {
                var_d6180d62096f9cdc = 1;
            } else if (isdefined(level.currentobjective.trigger)) {
                if (var_bc9376a31c216786 != level.currentobjective.trigger) {
                    var_d6180d62096f9cdc = 1;
                }
            }
            if (var_d6180d62096f9cdc) {
                nodes = getnodesintrigger(level.currentobjective.trigger);
                if (nodes.size > 0) {
                    optional_params["min_goal_time"] = 3;
                    optional_params["max_goal_time"] = 6;
                    bot_capture_zone(level.currentobjective.trigger.origin, nodes, level.currentobjective.trigger, optional_params);
                }
            }
        }
    }
}

// Namespace bots_gametype_cmd / scripts/mp/bots/bots_gametype_cmd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6e9
// Size: 0x39
function bot_attacker_limit_for_team(team) {
    team_limit = get_num_players_on_team(team);
    return int(int(team_limit) / 2) + 1 + int(team_limit) % 2;
}

// Namespace bots_gametype_cmd / scripts/mp/bots/bots_gametype_cmd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x72a
// Size: 0x35
function bot_defender_limit_for_team(team) {
    team_limit = get_num_players_on_team(team);
    return max(int(int(team_limit) / 2) - 1, 0);
}

// Namespace bots_gametype_cmd / scripts/mp/bots/bots_gametype_cmd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x767
// Size: 0x94
function get_num_players_on_team(team) {
    var_35b2ace44b93c013 = 0;
    foreach (player in level.participants) {
        if (isteamparticipant(player) && isdefined(player.team) && player.team == team) {
            var_35b2ace44b93c013++;
        }
    }
    return var_35b2ace44b93c013;
}

// Namespace bots_gametype_cmd / scripts/mp/bots/bots_gametype_cmd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x803
// Size: 0xd9
function get_allied_attackers_for_team(team) {
    attackers = get_players_by_role("attacker", team);
    if (isdefined(level.currentobjective.trigger)) {
        foreach (player in level.players) {
            if (!isai(player) && isdefined(player.team) && player.team == team) {
                if (!player istouching(level.currentobjective.trigger)) {
                    attackers = array_add(attackers, player);
                }
            }
        }
    }
    return attackers;
}

// Namespace bots_gametype_cmd / scripts/mp/bots/bots_gametype_cmd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8e4
// Size: 0xd9
function get_allied_defenders_for_team(team) {
    defenders = get_players_by_role("defender", team);
    if (isdefined(level.currentobjective.trigger)) {
        foreach (player in level.players) {
            if (!isai(player) && isdefined(player.team) && player.team == team) {
                if (player istouching(level.currentobjective.trigger)) {
                    defenders = array_add(defenders, player);
                }
            }
        }
    }
    return defenders;
}

// Namespace bots_gametype_cmd / scripts/mp/bots/bots_gametype_cmd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9c5
// Size: 0xcc
function get_players_by_role(role, team) {
    players = [];
    foreach (player in level.participants) {
        if (!isdefined(player.team)) {
            continue;
        }
        if (isalive(player) && isteamparticipant(player) && player.team == team && isdefined(player.role) && player.role == role) {
            players[players.size] = player;
        }
    }
    return players;
}

// Namespace bots_gametype_cmd / scripts/mp/bots/bots_gametype_cmd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa99
// Size: 0x24
function bot_set_role(new_role) {
    self.role = new_role;
    self botclearscriptgoal();
    bot_defend_stop();
}

// Namespace bots_gametype_cmd / scripts/mp/bots/bots_gametype_cmd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xac4
// Size: 0x11c
function is_b_better_defender(a, b) {
    atouching = a istouching(level.currentobjective.trigger);
    btouching = b istouching(level.currentobjective.trigger);
    if (atouching != btouching) {
        if (atouching) {
            return false;
        }
        return true;
    }
    if (atouching) {
        if (a.role != b.role) {
            if (b.role == "defender") {
                return true;
            }
            return false;
        }
    }
    adistsqrd = distance2dsquared(a.origin, level.currentobjective.trigger.origin);
    bdistsqrd = distance2dsquared(b.origin, level.currentobjective.trigger.origin);
    if (adistsqrd < bdistsqrd) {
        return true;
    }
    return false;
}

// Namespace bots_gametype_cmd / scripts/mp/bots/bots_gametype_cmd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbe8
// Size: 0x508
function bot_hardpoint_ai_director_update() {
    level notify("bot_hardpoint_ai_director_update");
    level endon("bot_hardpoint_ai_director_update");
    level endon("game_ended");
    teams[0] = "allies";
    teams[1] = "axis";
    var_315ada03f3555768["allies"] = 0;
    var_315ada03f3555768["axis"] = 0;
    while (true) {
        var_e0ce35063064fb94 = "neutral";
        if (!isdefined(level.currentobjective)) {
            wait(1);
            continue;
        }
        if (isdefined(level.currentobjective.trigger)) {
            var_e0ce35063064fb94 = level.currentobjective scripts/mp/gameobjects::getownerteam();
        }
        foreach (team in teams) {
            var_3e2f5d10887aeb24 = [];
            ai_defenders = [];
            if (team != var_e0ce35063064fb94) {
                var_315ada03f3555768[team] = 0;
                foreach (player in level.participants) {
                    if (isteamparticipant(player) && isdefined(player.team) && player.team == team) {
                        if (isbot(player) && (!isdefined(player.role) || player.role != "defender")) {
                            player bot_set_role("defender");
                        }
                    }
                }
                continue;
            }
            attacker_limit = bot_attacker_limit_for_team(team);
            defender_limit = bot_defender_limit_for_team(team);
            if (!var_315ada03f3555768[team]) {
                var_315ada03f3555768[team] = 1;
                var_2857a3996fb3fa53 = [];
                foreach (player in level.participants) {
                    if (isteamparticipant(player) && isdefined(player.team) && player.team == team) {
                        if (isbot(player)) {
                            var_2857a3996fb3fa53[var_2857a3996fb3fa53.size] = player;
                        }
                    }
                }
                var_8b00f8b964fc840a = array_sort_with_func(var_2857a3996fb3fa53, &is_b_better_defender);
                if (var_2857a3996fb3fa53.size < defender_limit) {
                    defender_limit = var_2857a3996fb3fa53.size;
                }
                defender_limit = int(defender_limit);
                for (i = 0; i < defender_limit; i++) {
                    var_2857a3996fb3fa53[i] bot_set_role("defender");
                }
                for (i = defender_limit; i < var_2857a3996fb3fa53.size; i++) {
                    var_2857a3996fb3fa53[i] bot_set_role("attacker");
                }
                wait(1);
                continue;
            }
            attackers = get_allied_attackers_for_team(team);
            defenders = get_allied_defenders_for_team(team);
            if (attackers.size > attacker_limit) {
                var_76912c7979e5a46b = 0;
                foreach (attacker in attackers) {
                    if (isai(attacker)) {
                        if (level.bot_personality_type[attacker.personality] == "stationary") {
                            attacker bot_set_role("defender");
                            var_76912c7979e5a46b = 1;
                            break;
                        }
                        var_3e2f5d10887aeb24 = array_add(var_3e2f5d10887aeb24, attacker);
                    }
                }
                if (!var_76912c7979e5a46b && var_3e2f5d10887aeb24.size > 0) {
                    random(var_3e2f5d10887aeb24) bot_set_role("defender");
                }
            }
            if (defenders.size > defender_limit) {
                removed_defender = 0;
                foreach (defender in defenders) {
                    if (isai(defender)) {
                        if (level.bot_personality_type[defender.personality] == "active") {
                            defender bot_set_role("attacker");
                            removed_defender = 1;
                            break;
                        }
                        ai_defenders = array_add(ai_defenders, defender);
                    }
                }
                if (!removed_defender && ai_defenders.size > 0) {
                    random(ai_defenders) bot_set_role("attacker");
                }
            }
            if (defenders.size == 0) {
                replacements = get_players_by_role("attacker", team);
                if (replacements.size > 0) {
                    random(replacements) bot_set_role("defender");
                }
            }
        }
        wait(1);
    }
}

// Namespace bots_gametype_cmd / scripts/mp/bots/bots_gametype_cmd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10f7
// Size: 0x44
function crate_can_use(crate) {
    if (isagent(self) && !isdefined(crate.boxtype)) {
        return false;
    }
    if (!scripts/mp/bots/bots::function_9bd84cede4fe8f24(crate)) {
        return false;
    }
    return !bot_is_defending() || bot_is_protecting();
}

// Namespace bots_gametype_cmd / scripts/mp/bots/bots_gametype_cmd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1143
// Size: 0xa6
function setup_bot_koth() {
    bot_waittill_bots_enabled();
    while (!isdefined(level.objectives)) {
        wait(0.05);
    }
    bot_setup_objective_bottargets();
    foreach (objective in level.objectives) {
        objective thread monitor_zone_control();
    }
    bot_cache_entrances_to_gametype_array(level.objectives, "radio", level.bot_ignore_precalc_paths);
    level.bot_gametype_precaching_done = 1;
}

// Namespace bots_gametype_cmd / scripts/mp/bots/bots_gametype_cmd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11f0
// Size: 0x1c3
function bot_headquarters_think() {
    self notify("bot_hq_think");
    self endon("bot_hq_think");
    self endon("death_or_disconnect");
    level endon("game_ended");
    while (!isdefined(level.bot_gametype_precaching_done)) {
        wait(0.05);
    }
    self botsetflag("grenade_objectives", 1);
    init_bot_game_headquarters();
    for (;;) {
        wait_time = randomintrange(1, 11) * 0.05;
        wait(wait_time);
        if (self.health <= 0) {
            continue;
        }
        if (!isdefined(level.radioobject)) {
            if (bot_is_defending()) {
                bot_defend_stop();
            }
            var_5db2b7f3a1e635c4 = 1;
            if (self botgetscriptgoaltype() != "none") {
                distsq = distancesquared(self botgetscriptgoal(), self.origin);
                radius = self botgetscriptgoalradius();
                if (distsq > radius * radius) {
                    var_5db2b7f3a1e635c4 = 0;
                }
            }
            if (var_5db2b7f3a1e635c4) {
                randompos = self botfindrandomgoal();
                if (isdefined(randompos)) {
                    self botsetscriptgoal(randompos, 128, "hunt");
                }
            }
            continue;
        }
        hqowningteam = level.radioobject scripts/mp/gameobjects::getownerteam();
        if (self.team != hqowningteam) {
            if (!is_capturing_current_headquarters()) {
                num_capturing = get_num_ai_capturing_headquarters();
                var_f3d4ce970fbcd5b7 = find_current_radio().bot_nodes.size;
                if (num_capturing < var_f3d4ce970fbcd5b7) {
                    capture_current_headquarters();
                } else if (!is_protecting_current_headquarters()) {
                    protect_current_headquarters();
                }
            }
            continue;
        }
        if (!is_protecting_current_headquarters()) {
            wait(randomfloat(2));
            if (isdefined(level.radioobject)) {
                protect_current_headquarters();
            }
        }
    }
}

// Namespace bots_gametype_cmd / scripts/mp/bots/bots_gametype_cmd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13ba
// Size: 0x74
function find_current_radio() {
    foreach (radio in level.radios) {
        if (radio.trig == level.radioobject.trigger) {
            return radio;
        }
    }
}

// Namespace bots_gametype_cmd / scripts/mp/bots/bots_gametype_cmd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1435
// Size: 0x9
function is_capturing_current_headquarters() {
    return bot_is_capturing();
}

// Namespace bots_gametype_cmd / scripts/mp/bots/bots_gametype_cmd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1446
// Size: 0x9e
function get_num_ai_capturing_headquarters() {
    total = 0;
    foreach (player in level.participants) {
        if (isai(player) && player.health > 0 && player.team == self.team && player is_capturing_current_headquarters()) {
            total++;
        }
    }
    return total;
}

// Namespace bots_gametype_cmd / scripts/mp/bots/bots_gametype_cmd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14ec
// Size: 0x55
function capture_current_headquarters() {
    current_radio = find_current_radio();
    optional_params["entrance_points_index"] = "radio" + current_radio.objectivekey;
    bot_capture_zone(current_radio.origin, current_radio.bot_nodes, undefined, optional_params);
}

// Namespace bots_gametype_cmd / scripts/mp/bots/bots_gametype_cmd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1548
// Size: 0x9
function is_protecting_current_headquarters() {
    return bot_is_protecting();
}

// Namespace bots_gametype_cmd / scripts/mp/bots/bots_gametype_cmd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1559
// Size: 0x59
function protect_current_headquarters() {
    worldbounds = self botgetworldsize();
    average_side = (worldbounds[0] + worldbounds[1]) / 2;
    protect_radius = min(1000, average_side / 4);
    bot_protect_point(find_current_radio().origin, protect_radius);
}

// Namespace bots_gametype_cmd / scripts/mp/bots/bots_gametype_cmd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15b9
// Size: 0x92
function init_bot_game_headquarters() {
    if (isdefined(level.bots_gametype_initialized) && level.bots_gametype_initialized) {
        return;
    }
    level.bots_gametype_initialized = 1;
    foreach (radio in level.radios) {
        radio.bot_nodes = getnodesintrigger(radio.trig);
    }
}

