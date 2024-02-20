// mwiii decomp prototype
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

#namespace namespace_225423f512d5ed26;

// Namespace namespace_225423f512d5ed26/namespace_6698dab3389f82ae
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13c
// Size: 0x3a
function main() {
    setup_callbacks();
    if (level.isgroundwarsiege) {
        namespace_52715711bf01a187::setup_bot_war();
    } else {
        thread bot_siege_manager_think();
        setup_bot_siege();
        /#
            thread function_89500208d81a6b6e();
        #/
    }
}

// Namespace namespace_225423f512d5ed26/namespace_6698dab3389f82ae
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17d
// Size: 0x6
function function_e45e46b7c35deadb() {
    /#
    #/
}

// Namespace namespace_225423f512d5ed26/namespace_6698dab3389f82ae
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18a
// Size: 0x18
function setup_callbacks() {
    level.bot_funcs["gametype_think"] = &bot_siege_think;
}

// Namespace namespace_225423f512d5ed26/namespace_6698dab3389f82ae
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a9
// Size: 0xe
function setup_bot_siege() {
    level.bot_gametype_precaching_done = 1;
}

// Namespace namespace_225423f512d5ed26/namespace_6698dab3389f82ae
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1be
// Size: 0xf2
function function_89500208d81a6b6e() {
    /#
        while (!isdefined(level.bot_gametype_precaching_done)) {
            wait(0.05);
        }
        while (1) {
            if (getdvarint(@"hash_371d0b254090fbda", 0) == 1) {
                foreach (player in level.participants) {
                    if (isai(player) && isdefined(player.goalflag) && player namespace_f8065cafc523dba5::_isalive()) {
                        line(player.origin, player.goalflag.trigger.origin, (0, 255, 0), 1, 0, 1);
                    }
                }
            }
            wait(0.05);
        }
    #/
}

// Namespace namespace_225423f512d5ed26/namespace_6698dab3389f82ae
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b7
// Size: 0x25d
function bot_siege_manager_think() {
    level.siege_bot_team_need_flags = [];
    namespace_4b0406965e556711::gameflagwait("prematch_done");
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
        var_b13458786205dc2b = [];
        foreach (objective in level.objectives) {
            team = objective namespace_19b4203b51d56488::getownerteam();
            if (team != "neutral") {
                if (!isdefined(var_b13458786205dc2b[team])) {
                    var_b13458786205dc2b[team] = 1;
                } else {
                    var_b13458786205dc2b[team]++;
                }
            }
        }
        foreach (team, count in var_b13458786205dc2b) {
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
            } else if (count < 2 && istrue(level.siege_bot_team_had_advantage[team])) {
                level.siege_bot_team_had_advantage[team] = 0;
                level.siege_bot_team_triple_cap_check[team] = 0;
            }
        }
        wait(1);
    }
}

// Namespace namespace_225423f512d5ed26/namespace_6698dab3389f82ae
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x51b
// Size: 0xcf
function bot_siege_think() {
    self notify("bot_siege_think");
    self endon("bot_siege_think");
    self endon("death_or_disconnect");
    level endon("game_ended");
    while (!isdefined(level.bot_gametype_precaching_done)) {
        wait(0.05);
    }
    while (!isdefined(level.siege_bot_team_need_flags)) {
        wait(0.05);
    }
    self botsetflag("separation", 0);
    self botsetflag("use_obj_path_style", 1);
    for (;;) {
        for (;;) {
            if (isdefined(level.siege_bot_team_need_flags[self.team]) && level.siege_bot_team_need_flags[self.team]) {
                bot_choose_flag();
            } else if (isdefined(self.goalflag)) {
                if (bot_is_defending()) {
                    bot_defend_stop();
                }
                self.goalflag = undefined;
            }
        }
    }
}

// Namespace namespace_225423f512d5ed26/namespace_6698dab3389f82ae
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5f1
// Size: 0x116
function bot_choose_flag() {
    goalflag = undefined;
    var_f355c50166ca2903 = undefined;
    foreach (objective in level.objectives) {
        team = objective namespace_19b4203b51d56488::getownerteam();
        if (team != self.team) {
            var_b995b947954eff32 = distancesquared(self.origin, objective.trigger.origin);
            if (!isdefined(var_f355c50166ca2903) || var_b995b947954eff32 < var_f355c50166ca2903) {
                var_f355c50166ca2903 = var_b995b947954eff32;
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

