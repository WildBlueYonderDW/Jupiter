#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\bots\bots_util.gsc;
#using scripts\mp\bots\bots_strategy.gsc;
#using scripts\mp\bots\bots_gametype_war.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\gameobjects.gsc;

#namespace bots_gametype_siege;

// Namespace bots_gametype_siege / scripts\mp\bots\bots_gametype_siege
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x176
// Size: 0x39
function main() {
    setup_callbacks();
    if (level.isgroundwarsiege) {
        scripts\mp\bots\bots_gametype_war::setup_bot_war();
        return;
    }
    thread bot_siege_manager_think();
    setup_bot_siege();
    /#
        thread function_89500208d81a6b6e();
    #/
}

/#

    // Namespace bots_gametype_siege / scripts\mp\bots\bots_gametype_siege
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1b7
    // Size: 0x5
    function function_e45e46b7c35deadb() {
        
    }

#/

// Namespace bots_gametype_siege / scripts\mp\bots\bots_gametype_siege
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c4
// Size: 0x17
function setup_callbacks() {
    level.bot_funcs["gametype_think"] = &bot_siege_think;
}

// Namespace bots_gametype_siege / scripts\mp\bots\bots_gametype_siege
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e3
// Size: 0xd
function setup_bot_siege() {
    level.bot_gametype_precaching_done = 1;
}

/#

    // Namespace bots_gametype_siege / scripts\mp\bots\bots_gametype_siege
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1f8
    // Size: 0xf0
    function function_89500208d81a6b6e() {
        while (!isdefined(level.bot_gametype_precaching_done)) {
            wait 0.05;
        }
        while (true) {
            if (getdvarint(@"hash_371d0b254090fbda", 0) == 1) {
                foreach (player in level.participants) {
                    if (isai(player) && isdefined(player.goalflag) && player scripts\cp_mp\utility\player_utility::_isalive()) {
                        line(player.origin, player.goalflag.trigger.origin, (0, 255, 0), 1, 0, 1);
                    }
                }
            }
            wait 0.05;
        }
    }

#/

// Namespace bots_gametype_siege / scripts\mp\bots\bots_gametype_siege
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f0
// Size: 0x253
function bot_siege_manager_think() {
    level.siege_bot_team_need_flags = [];
    scripts\mp\flags::gameflagwait("prematch_done");
    level.siege_bot_team_triple_cap_check = [];
    level.siege_bot_team_had_advantage = [];
    for (;;) {
        level.siege_bot_team_need_flags = [];
        foreach (player in level.players) {
            if (!isreallyalive(player) && player.hasspawned) {
                if (player.team != "spectator" && player.team != "neutral") {
                    level.siege_bot_team_need_flags[player.team] = 1;
                }
            }
        }
        flagcounts = [];
        foreach (objective in level.objectives) {
            team = objective scripts\mp\gameobjects::getownerteam();
            if (team != "neutral") {
                if (!isdefined(flagcounts[team])) {
                    flagcounts[team] = 1;
                    continue;
                }
                flagcounts[team]++;
            }
        }
        foreach (team, count in flagcounts) {
            if (count >= 2) {
                enemyteam = getotherteam(team)[0];
                level.siege_bot_team_need_flags[enemyteam] = 1;
                if (count == 2 && !istrue(level.siege_bot_team_triple_cap_check[team])) {
                    if (randomint(100) > 75) {
                        level.siege_bot_team_need_flags[team] = 1;
                    } else {
                        level.siege_bot_team_triple_cap_check[team] = 0;
                    }
                    level.siege_bot_team_had_advantage[team] = 1;
                }
                continue;
            }
            if (count < 2 && istrue(level.siege_bot_team_had_advantage[team])) {
                level.siege_bot_team_had_advantage[team] = 0;
                level.siege_bot_team_triple_cap_check[team] = 0;
            }
        }
        wait 1;
    }
}

// Namespace bots_gametype_siege / scripts\mp\bots\bots_gametype_siege
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x54b
// Size: 0xce
function bot_siege_think() {
    self notify("bot_siege_think");
    self endon("bot_siege_think");
    self endon("death_or_disconnect");
    level endon("game_ended");
    while (!isdefined(level.bot_gametype_precaching_done)) {
        wait 0.05;
    }
    while (!isdefined(level.siege_bot_team_need_flags)) {
        wait 0.05;
    }
    self botsetflag("separation", 0);
    self botsetflag("use_obj_path_style", 1);
    for (;;) {
        if (isdefined(level.siege_bot_team_need_flags[self.team]) && level.siege_bot_team_need_flags[self.team]) {
            bot_choose_flag();
        } else if (isdefined(self.goalflag)) {
            if (bot_is_defending()) {
                bot_defend_stop();
            }
            self.goalflag = undefined;
        }
        wait 1;
    }
}

// Namespace bots_gametype_siege / scripts\mp\bots\bots_gametype_siege
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x621
// Size: 0x110
function bot_choose_flag() {
    goalflag = undefined;
    shortestdistsq = undefined;
    foreach (objective in level.objectives) {
        team = objective scripts\mp\gameobjects::getownerteam();
        if (team != self.team) {
            var_b995b947954eff32 = distancesquared(self.origin, objective.trigger.origin);
            if (!isdefined(shortestdistsq) || var_b995b947954eff32 < shortestdistsq) {
                shortestdistsq = var_b995b947954eff32;
                goalflag = objective;
            }
        }
    }
    if (isdefined(goalflag)) {
        if (!isdefined(self.goalflag) || self.goalflag != goalflag) {
            self.goalflag = goalflag;
            bot_capture_point(goalflag.trigger.origin, 100);
        }
    }
}

