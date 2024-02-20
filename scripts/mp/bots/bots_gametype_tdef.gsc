// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\bots\bots_util.gsc;
#using scripts\mp\bots\bots_strategy.gsc;
#using scripts\mp\bots\bots_personality.gsc;
#using scripts\mp\bots\bots_gametype_common.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\script.gsc;

#namespace namespace_9b9a52f23dd26dfc;

// Namespace namespace_9b9a52f23dd26dfc/namespace_8ba2605500559cc4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15e
// Size: 0x19
function main() {
    setup_callbacks();
    setup_bot_flag();
    thread monitor_flag_carrier();
}

// Namespace namespace_9b9a52f23dd26dfc/namespace_8ba2605500559cc4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17e
// Size: 0x6
function function_e45e46b7c35deadb() {
    /#
    #/
}

// Namespace namespace_9b9a52f23dd26dfc/namespace_8ba2605500559cc4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18b
// Size: 0x18
function setup_callbacks() {
    level.bot_funcs["gametype_think"] = &bot_tdef_think;
}

// Namespace namespace_9b9a52f23dd26dfc/namespace_8ba2605500559cc4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1aa
// Size: 0x37
function setup_bot_flag() {
    bot_waittill_bots_enabled(1);
    level.protect_radius = 600;
    level.bodyguard_radius = 400;
    thread bot_flag_ai_director_update();
    level.bot_gametype_precaching_done = 1;
}

// Namespace namespace_9b9a52f23dd26dfc/namespace_8ba2605500559cc4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e8
// Size: 0xc
function bot_get_tdef_flag() {
    return level.defenderflag;
}

// Namespace namespace_9b9a52f23dd26dfc/namespace_8ba2605500559cc4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1fc
// Size: 0x2f
function bot_get_flag_carrier() {
    if (isdefined(level.defenderflag.carrier)) {
        return level.defenderflag.carrier;
    }
    return undefined;
}

// Namespace namespace_9b9a52f23dd26dfc/namespace_8ba2605500559cc4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x233
// Size: 0x20
function bot_get_enemy_team() {
    if (self.team == "allies") {
        return "axis";
    }
    return "allies";
}

// Namespace namespace_9b9a52f23dd26dfc/namespace_8ba2605500559cc4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25b
// Size: 0x2d9
function bot_tdef_think() {
    self notify("bot_flag_think");
    self endon("bot_flag_think");
    self endon("death_or_disconnect");
    level endon("game_ended");
    while (!isdefined(level.bot_gametype_precaching_done)) {
        wait(0.05);
    }
    self botsetflag("separation", 0);
    var_c51208294f4d77d1 = undefined;
    var_78bff961df1c9fbd = undefined;
    while (1) {
        wait(0.05);
        if (!isdefined(self.role)) {
            initialize_flag_role();
            var_c51208294f4d77d1 = undefined;
        }
        if (bot_has_tactical_goal()) {
            var_c51208294f4d77d1 = undefined;
            continue;
        }
        if (self.role != "carrier" && isdefined(self.carryobject)) {
            var_c51208294f4d77d1 = undefined;
            flag_set_role("carrier");
        }
        if (self.role == "carrier") {
            if (isdefined(self.carryobject)) {
                disttoenemysq = 0;
                if (isdefined(self.enemy)) {
                    disttoenemysq = distancesquared(self.enemy.origin, self.origin);
                }
                if (isdefined(self.enemy) && disttoenemysq < 9216) {
                    goto LOC_0000015a;
                }
            LOC_0000015a:
                self botclearscriptgoal();
                if (!isdefined(var_78bff961df1c9fbd)) {
                    var_78bff961df1c9fbd = gettime() + randomintrange(500, 1000);
                }
                if (gettime() > var_78bff961df1c9fbd) {
                    var_78bff961df1c9fbd = gettime() + randomintrange(500, 1000);
                }
            } else {
                var_cb042fafee68e950 = bot_get_tdef_flag();
                if (!isdefined(var_cb042fafee68e950)) {
                    carrier = bot_get_flag_carrier();
                    if (isdefined(carrier) && carrier != self) {
                        initialize_flag_role();
                    }
                } else {
                    self botsetscriptgoal(var_cb042fafee68e950.curorigin, 16, "objective");
                    continue;
                }
            }
        } else {
            var_c51208294f4d77d1 = undefined;
        }
        if (self.role == "attacker") {
            var_cb042fafee68e950 = bot_get_tdef_flag();
            if (!isdefined(var_cb042fafee68e950)) {
                carrier = bot_get_flag_carrier();
                if (isdefined(carrier)) {
                    if (!bot_is_guarding_player(carrier)) {
                        bot_guard_player(carrier, level.bodyguard_radius);
                    }
                }
            } else if (!istrue(var_cb042fafee68e950.isresetting) && !istrue(var_cb042fafee68e950.in_goal)) {
                var_702e9b4033ea2748 = getclosestpointonnavmesh(var_cb042fafee68e950.curorigin);
                if (!bot_is_defending_point(var_702e9b4033ea2748)) {
                    bot_protect_point(var_702e9b4033ea2748, level.protect_radius);
                }
            }
        } else if (self.role == "defender") {
            var_da0e11b0a9fa934b = level.defenderflag.carrier;
            goal = var_da0e11b0a9fa934b.origin;
            /#
            #/
            if (!bot_is_defending_point(goal)) {
                bot_protect_point(goal, level.protect_radius);
            }
        }
    }
}

// Namespace namespace_9b9a52f23dd26dfc/namespace_8ba2605500559cc4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x53b
// Size: 0x221
function initialize_flag_role() {
    attackers = get_allied_attackers_for_team(self.team);
    defenders = get_allied_defenders_for_team(self.team);
    var_dd81f3b223f70502 = flag_bot_attacker_limit_for_team(self.team);
    var_c3fe770ab5fb04ee = flag_bot_defender_limit_for_team(self.team);
    var_30f9ca2fa8449648 = level.bot_personality_type[self.personality];
    if (var_30f9ca2fa8449648 == "active") {
        if (attackers.size >= var_dd81f3b223f70502) {
            var_8668b3fa2350c9b3 = 0;
            foreach (attacker in attackers) {
                if (isai(attacker) && level.bot_personality_type[attacker.personality] == "stationary") {
                    attacker.role = undefined;
                    var_8668b3fa2350c9b3 = 1;
                    break;
                }
            }
            if (var_8668b3fa2350c9b3) {
                flag_set_role("attacker");
            } else {
                flag_set_role("defender");
            }
        } else {
            flag_set_role("attacker");
        }
    } else if (var_30f9ca2fa8449648 == "stationary") {
        if (defenders.size >= var_c3fe770ab5fb04ee) {
            var_8668b3fa2350c9b3 = 0;
            foreach (defender in defenders) {
                if (isai(defender) && level.bot_personality_type[defender.personality] == "active") {
                    defender.role = undefined;
                    var_8668b3fa2350c9b3 = 1;
                    break;
                }
            }
            if (var_8668b3fa2350c9b3) {
                flag_set_role("defender");
            } else {
                flag_set_role("attacker");
            }
        } else {
            flag_set_role("defender");
        }
    }
}

// Namespace namespace_9b9a52f23dd26dfc/namespace_8ba2605500559cc4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x763
// Size: 0x326
function bot_flag_ai_director_update() {
    level notify("bot_flag_ai_director_update");
    level endon("bot_flag_ai_director_update");
    level endon("game_ended");
    teams[0] = "allies";
    teams[1] = "axis";
    var_352c449f6f15c3c8 = [];
    while (1) {
        foreach (team in teams) {
            var_dd81f3b223f70502 = flag_bot_attacker_limit_for_team(team);
            var_c3fe770ab5fb04ee = flag_bot_defender_limit_for_team(team);
            attackers = get_allied_attackers_for_team(team);
            defenders = get_allied_defenders_for_team(team);
            if (attackers.size > var_dd81f3b223f70502) {
                var_3e2f5d10887aeb24 = [];
                var_76912c7979e5a46b = 0;
                foreach (attacker in attackers) {
                    if (isai(attacker)) {
                        if (level.bot_personality_type[attacker.personality] == "stationary") {
                            attacker flag_set_role("defender");
                            var_76912c7979e5a46b = 1;
                            break;
                        } else {
                            var_3e2f5d10887aeb24 = array_add(var_3e2f5d10887aeb24, attacker);
                        }
                    }
                }
                if (!var_76912c7979e5a46b && var_3e2f5d10887aeb24.size > 0) {
                    random(var_3e2f5d10887aeb24) flag_set_role("defender");
                }
            }
            if (defenders.size > var_c3fe770ab5fb04ee) {
                var_ead9b3cbcf05416c = [];
                var_75e6cf655a01f333 = 0;
                foreach (defender in defenders) {
                    if (isai(defender)) {
                        if (level.bot_personality_type[defender.personality] == "active") {
                            defender flag_set_role("attacker");
                            var_75e6cf655a01f333 = 1;
                            break;
                        } else {
                            var_ead9b3cbcf05416c = array_add(var_ead9b3cbcf05416c, defender);
                        }
                    }
                }
                if (!var_75e6cf655a01f333 && var_ead9b3cbcf05416c.size > 0) {
                    random(var_ead9b3cbcf05416c) flag_set_role("attacker");
                }
            }
            var_cb042fafee68e950 = bot_get_tdef_flag();
            if (isdefined(var_cb042fafee68e950)) {
                var_7480beb51df7a34e = pick_flagcarrier(team, var_cb042fafee68e950);
                if (isdefined(var_7480beb51df7a34e) && isdefined(var_7480beb51df7a34e.role) && var_7480beb51df7a34e.role != "carrier") {
                    if (!isdefined(var_7480beb51df7a34e.carryobject)) {
                        previouscarrier = var_352c449f6f15c3c8[team];
                        if (isdefined(previouscarrier)) {
                            previouscarrier flag_set_role(undefined);
                        }
                        var_7480beb51df7a34e flag_set_role("carrier");
                        var_352c449f6f15c3c8[var_7480beb51df7a34e.team] = var_7480beb51df7a34e;
                    }
                }
            }
        }
        wait(1);
    }
}

// Namespace namespace_9b9a52f23dd26dfc/namespace_8ba2605500559cc4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa90
// Size: 0x1f
function flag_bot_attacker_limit_for_team(team) {
    var_6ace8681f94cdc7c = flag_num_players_on_team(team);
    return var_6ace8681f94cdc7c;
}

// Namespace namespace_9b9a52f23dd26dfc/namespace_8ba2605500559cc4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xab7
// Size: 0xd
function flag_bot_defender_limit_for_team(team) {
    return 0;
}

// Namespace namespace_9b9a52f23dd26dfc/namespace_8ba2605500559cc4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xacc
// Size: 0x94
function flag_num_players_on_team(team) {
    var_35b2ace44b93c013 = 0;
    foreach (player in level.participants) {
        if (isteamparticipant(player) && isdefined(player.team) && player.team == team) {
            var_35b2ace44b93c013++;
        }
    }
    return var_35b2ace44b93c013;
}

// Namespace namespace_9b9a52f23dd26dfc/namespace_8ba2605500559cc4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb68
// Size: 0x11f
function pick_flagcarrier(team, var_cb042fafee68e950) {
    var_df206c6f376359fd = undefined;
    closestdistsq = undefined;
    foreach (player in level.participants) {
        if (!isdefined(player.team)) {
            continue;
        }
        if (player.team != team) {
            continue;
        }
        if (!isalive(player)) {
            continue;
        }
        if (!isai(player)) {
            continue;
        }
        if (isdefined(player.role) && player.role == "defender") {
            continue;
        }
        distsq = distancesquared(player.origin, var_cb042fafee68e950.curorigin);
        if (!isdefined(closestdistsq) || distsq < closestdistsq) {
            closestdistsq = distsq;
            var_df206c6f376359fd = player;
        }
    }
    if (isdefined(var_df206c6f376359fd)) {
        return var_df206c6f376359fd;
    }
    return undefined;
}

// Namespace namespace_9b9a52f23dd26dfc/namespace_8ba2605500559cc4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc8f
// Size: 0x24
function get_allied_attackers_for_team(team) {
    attackers = get_players_by_role("attacker", team);
    return attackers;
}

// Namespace namespace_9b9a52f23dd26dfc/namespace_8ba2605500559cc4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcbb
// Size: 0x24
function get_allied_defenders_for_team(team) {
    defenders = get_players_by_role("defender", team);
    return defenders;
}

// Namespace namespace_9b9a52f23dd26dfc/namespace_8ba2605500559cc4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xce7
// Size: 0x24
function flag_set_role(var_b7eac42471ac7fae) {
    self.role = var_b7eac42471ac7fae;
    self botclearscriptgoal();
    bot_defend_stop();
}

// Namespace namespace_9b9a52f23dd26dfc/namespace_8ba2605500559cc4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd12
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

// Namespace namespace_9b9a52f23dd26dfc/namespace_8ba2605500559cc4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xde6
// Size: 0x95
function monitor_flag_carrier() {
    level endon("game_ended");
    var_1c29730020f199ce = undefined;
    while (1) {
        carrier = bot_get_flag_carrier();
        if (!isdefined(var_1c29730020f199ce) || !isdefined(carrier) || carrier != var_1c29730020f199ce) {
            if (isdefined(var_1c29730020f199ce) && var_1c29730020f199ce.threatbias == 505) {
                var_1c29730020f199ce.threatbias = 0;
            }
            var_1c29730020f199ce = carrier;
        }
        if (isdefined(carrier) && carrier.threatbias == 0) {
            carrier.threatbias = 505;
        }
        wait(0.05);
    }
}

