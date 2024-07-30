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

#namespace bots_gametype_tdef;

// Namespace bots_gametype_tdef / scripts\mp\bots\bots_gametype_tdef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a8
// Size: 0x18
function main() {
    setup_callbacks();
    setup_bot_flag();
    thread monitor_flag_carrier();
}

/#

    // Namespace bots_gametype_tdef / scripts\mp\bots\bots_gametype_tdef
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1c8
    // Size: 0x5
    function function_e45e46b7c35deadb() {
        
    }

#/

// Namespace bots_gametype_tdef / scripts\mp\bots\bots_gametype_tdef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d5
// Size: 0x17
function setup_callbacks() {
    level.bot_funcs["gametype_think"] = &bot_tdef_think;
}

// Namespace bots_gametype_tdef / scripts\mp\bots\bots_gametype_tdef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f4
// Size: 0x36
function setup_bot_flag() {
    bot_waittill_bots_enabled(1);
    level.protect_radius = 600;
    level.bodyguard_radius = 400;
    thread bot_flag_ai_director_update();
    level.bot_gametype_precaching_done = 1;
}

// Namespace bots_gametype_tdef / scripts\mp\bots\bots_gametype_tdef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x232
// Size: 0xb
function bot_get_tdef_flag() {
    return level.defenderflag;
}

// Namespace bots_gametype_tdef / scripts\mp\bots\bots_gametype_tdef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x246
// Size: 0x2e
function bot_get_flag_carrier() {
    if (isdefined(level.defenderflag.carrier)) {
        return level.defenderflag.carrier;
    }
    return undefined;
}

// Namespace bots_gametype_tdef / scripts\mp\bots\bots_gametype_tdef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27d
// Size: 0x1f
function bot_get_enemy_team() {
    if (self.team == "allies") {
        return "axis";
    }
    return "allies";
}

// Namespace bots_gametype_tdef / scripts\mp\bots\bots_gametype_tdef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a5
// Size: 0x2d2
function bot_tdef_think() {
    self notify("bot_flag_think");
    self endon("bot_flag_think");
    self endon("death_or_disconnect");
    level endon("game_ended");
    while (!isdefined(level.bot_gametype_precaching_done)) {
        wait 0.05;
    }
    self botsetflag("separation", 0);
    snappedgoalpos = undefined;
    var_78bff961df1c9fbd = undefined;
    while (true) {
        wait 0.05;
        if (!isdefined(self.role)) {
            initialize_flag_role();
            snappedgoalpos = undefined;
        }
        if (bot_has_tactical_goal()) {
            snappedgoalpos = undefined;
            continue;
        }
        if (self.role != "carrier" && isdefined(self.carryobject)) {
            snappedgoalpos = undefined;
            flag_set_role("carrier");
        }
        if (self.role == "carrier") {
            if (isdefined(self.carryobject)) {
                disttoenemysq = 0;
                if (isdefined(self.enemy)) {
                    disttoenemysq = distancesquared(self.enemy.origin, self.origin);
                }
                if (isdefined(self.enemy) && disttoenemysq < 9216) {
                }
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
            snappedgoalpos = undefined;
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
                defend_point = getclosestpointonnavmesh(var_cb042fafee68e950.curorigin);
                if (!bot_is_defending_point(defend_point)) {
                    bot_protect_point(defend_point, level.protect_radius);
                }
            }
            continue;
        }
        if (self.role == "defender") {
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

// Namespace bots_gametype_tdef / scripts\mp\bots\bots_gametype_tdef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x57f
// Size: 0x216
function initialize_flag_role() {
    attackers = get_allied_attackers_for_team(self.team);
    defenders = get_allied_defenders_for_team(self.team);
    attacker_limit = flag_bot_attacker_limit_for_team(self.team);
    defender_limit = flag_bot_defender_limit_for_team(self.team);
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
                flag_set_role("attacker");
            } else {
                flag_set_role("defender");
            }
        } else {
            flag_set_role("attacker");
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
                flag_set_role("defender");
            } else {
                flag_set_role("attacker");
            }
            return;
        }
        flag_set_role("defender");
    }
}

// Namespace bots_gametype_tdef / scripts\mp\bots\bots_gametype_tdef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x79d
// Size: 0x311
function bot_flag_ai_director_update() {
    level notify("bot_flag_ai_director_update");
    level endon("bot_flag_ai_director_update");
    level endon("game_ended");
    teams[0] = "allies";
    teams[1] = "axis";
    var_352c449f6f15c3c8 = [];
    while (true) {
        foreach (team in teams) {
            attacker_limit = flag_bot_attacker_limit_for_team(team);
            defender_limit = flag_bot_defender_limit_for_team(team);
            attackers = get_allied_attackers_for_team(team);
            defenders = get_allied_defenders_for_team(team);
            if (attackers.size > attacker_limit) {
                var_3e2f5d10887aeb24 = [];
                var_76912c7979e5a46b = 0;
                foreach (attacker in attackers) {
                    if (isai(attacker)) {
                        if (level.bot_personality_type[attacker.personality] == "stationary") {
                            attacker flag_set_role("defender");
                            var_76912c7979e5a46b = 1;
                            break;
                        }
                        var_3e2f5d10887aeb24 = array_add(var_3e2f5d10887aeb24, attacker);
                    }
                }
                if (!var_76912c7979e5a46b && var_3e2f5d10887aeb24.size > 0) {
                    random(var_3e2f5d10887aeb24) flag_set_role("defender");
                }
            }
            if (defenders.size > defender_limit) {
                ai_defenders = [];
                removed_defender = 0;
                foreach (defender in defenders) {
                    if (isai(defender)) {
                        if (level.bot_personality_type[defender.personality] == "active") {
                            defender flag_set_role("attacker");
                            removed_defender = 1;
                            break;
                        }
                        ai_defenders = array_add(ai_defenders, defender);
                    }
                }
                if (!removed_defender && ai_defenders.size > 0) {
                    random(ai_defenders) flag_set_role("attacker");
                }
            }
            var_cb042fafee68e950 = bot_get_tdef_flag();
            if (isdefined(var_cb042fafee68e950)) {
                idealcarrier = pick_flagcarrier(team, var_cb042fafee68e950);
                if (isdefined(idealcarrier) && isdefined(idealcarrier.role) && idealcarrier.role != "carrier") {
                    if (!isdefined(idealcarrier.carryobject)) {
                        previouscarrier = var_352c449f6f15c3c8[team];
                        if (isdefined(previouscarrier)) {
                            previouscarrier flag_set_role(undefined);
                        }
                        idealcarrier flag_set_role("carrier");
                        var_352c449f6f15c3c8[idealcarrier.team] = idealcarrier;
                    }
                }
            }
        }
        wait 1;
    }
}

// Namespace bots_gametype_tdef / scripts\mp\bots\bots_gametype_tdef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xab6
// Size: 0x1f
function flag_bot_attacker_limit_for_team(team) {
    team_limit = flag_num_players_on_team(team);
    return team_limit;
}

// Namespace bots_gametype_tdef / scripts\mp\bots\bots_gametype_tdef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xade
// Size: 0xc
function flag_bot_defender_limit_for_team(team) {
    return false;
}

// Namespace bots_gametype_tdef / scripts\mp\bots\bots_gametype_tdef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaf3
// Size: 0x91
function flag_num_players_on_team(team) {
    var_35b2ace44b93c013 = 0;
    foreach (player in level.participants) {
        if (isteamparticipant(player) && isdefined(player.team) && player.team == team) {
            var_35b2ace44b93c013++;
        }
    }
    return var_35b2ace44b93c013;
}

// Namespace bots_gametype_tdef / scripts\mp\bots\bots_gametype_tdef
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb8d
// Size: 0x11a
function pick_flagcarrier(team, var_cb042fafee68e950) {
    closestbot = undefined;
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
            closestbot = player;
        }
    }
    if (isdefined(closestbot)) {
        return closestbot;
    }
    return undefined;
}

// Namespace bots_gametype_tdef / scripts\mp\bots\bots_gametype_tdef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcb0
// Size: 0x24
function get_allied_attackers_for_team(team) {
    attackers = get_players_by_role("attacker", team);
    return attackers;
}

// Namespace bots_gametype_tdef / scripts\mp\bots\bots_gametype_tdef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcdd
// Size: 0x24
function get_allied_defenders_for_team(team) {
    defenders = get_players_by_role("defender", team);
    return defenders;
}

// Namespace bots_gametype_tdef / scripts\mp\bots\bots_gametype_tdef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd0a
// Size: 0x23
function flag_set_role(new_role) {
    self.role = new_role;
    self botclearscriptgoal();
    bot_defend_stop();
}

// Namespace bots_gametype_tdef / scripts\mp\bots\bots_gametype_tdef
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd35
// Size: 0xc9
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

// Namespace bots_gametype_tdef / scripts\mp\bots\bots_gametype_tdef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe07
// Size: 0x94
function monitor_flag_carrier() {
    level endon("game_ended");
    last_carrier = undefined;
    while (true) {
        carrier = bot_get_flag_carrier();
        if (!isdefined(last_carrier) || !isdefined(carrier) || carrier != last_carrier) {
            if (isdefined(last_carrier) && last_carrier.threatbias == 505) {
                last_carrier.threatbias = 0;
            }
            last_carrier = carrier;
        }
        if (isdefined(carrier) && carrier.threatbias == 0) {
            carrier.threatbias = 505;
        }
        wait 0.05;
    }
}

