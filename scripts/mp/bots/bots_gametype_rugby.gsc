// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\bots\bots_gametype_common.gsc;
#using scripts\mp\bots\bots_util.gsc;
#using scripts\mp\bots\bots_strategy.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\gametypes\rugby.gsc;
#using scripts\mp\bots\bots.gsc;

#namespace namespace_8480f086ee7637a;

// Namespace namespace_8480f086ee7637a/namespace_97e8a2c4f806f582
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1fe
// Size: 0x11
function main() {
    setup_callbacks();
    function_7f19d11dbf8f7c20();
}

// Namespace namespace_8480f086ee7637a/namespace_97e8a2c4f806f582
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x216
// Size: 0x6
function function_e45e46b7c35deadb() {
    /#
    #/
}

// Namespace namespace_8480f086ee7637a/namespace_97e8a2c4f806f582
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x223
// Size: 0x51
function setup_callbacks() {
    level.bot_funcs["gametype_think"] = &bot_rugby_think;
    level.bot_funcs["crate_can_use"] = &crate_can_use;
    level.bot_funcs["know_enemies_on_start"] = undefined;
    level.bot_funcs["jugg_picked_up_cancel"] = &function_e1792f85cfa1c508;
}

// Namespace namespace_8480f086ee7637a/namespace_97e8a2c4f806f582
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27b
// Size: 0x50
function function_7f19d11dbf8f7c20() {
    function_789e1bb0f071af10();
    bot_waittill_bots_enabled();
    succeeded = function_770d1881c6adb8d0([0:"_allies", 1:"_axis"]);
    if (succeeded) {
        level.protect_radius = 1200;
        level.bot_gametype_precaching_done = 1;
    }
}

// Namespace namespace_8480f086ee7637a/namespace_97e8a2c4f806f582
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d2
// Size: 0x363
function bot_rugby_think() {
    self notify("bot_rugby_think");
    self endon("bot_rugby_think");
    self endon("death_or_disconnect");
    level endon("game_ended");
    self endon("death_or_disconnect");
    level endon("game_ended");
    /#
        setdevdvarifuninitialized(@"hash_54b3dbf61a166e11", 0);
        level thread function_a3f84b78c1204ba5();
    #/
    while (!isdefined(level.bot_gametype_precaching_done)) {
        wait(0.05);
    }
    function_9ec0e59b27b57a40();
    self botsetflag("separation", 0);
    self botsetflag("grenade_objectives", 1);
    self botsetflag("use_obj_path_style", 1);
    self.next_time_hunt_carrier = gettime();
    if (!isdefined(level.next_game_update_time)) {
        level.next_game_update_time = gettime() + 100;
    }
    for (;;) {
        wait(0.05);
        if (gettime() >= level.next_game_update_time) {
            level.next_game_update_time = gettime() + 100;
        }
        if (self.health <= 0) {
            continue;
        }
        if (!isdefined(level.var_9a453437a59c7a57)) {
            if (bot_has_tactical_goal("seek_rugby_jugg", undefined) == 0) {
                action_thread = &function_8830ce4efdc64403;
                var_4f3b05e382bb8c7c = spawnstruct();
                var_4f3b05e382bb8c7c.object = level.rugby.activejuggcrates[0];
                var_4f3b05e382bb8c7c.script_goal_radius = 16;
                var_4f3b05e382bb8c7c.should_abort = level.bot_funcs["jugg_picked_up_cancel"];
                var_4f3b05e382bb8c7c.action_thread = action_thread;
                var_4b1ced49f4dc2afb = getclosestpointonnavmesh(level.rugby.activejuggcrates[0].origin, self);
                bot_new_tactical_goal("seek_rugby_jugg", var_4b1ced49f4dc2afb, 99, var_4f3b05e382bb8c7c);
            }
        } else if (self == level.var_9a453437a59c7a57) {
            if (istrue(game["switchedsides"])) {
                var_54b003ce5d016238 = level.rugby.endzones[self.team][0];
            } else {
                var_54b003ce5d016238 = level.rugby.endzones[get_enemy_team(self.team)][0];
            }
            var_735fd56db96f509c = function_451fe89fc8f4f1b1(var_54b003ce5d016238.trigger);
            self botsetscriptgoal(var_735fd56db96f509c.origin, 0, "critical", var_735fd56db96f509c.angles[1]);
            var_2504da19c43fb0d3 = bot_waittill_goal_or_fail();
        } else if (level.var_9a453437a59c7a57.team == self.team) {
            if (!bot_is_defending()) {
                bot_guard_player(level.var_9a453437a59c7a57, 400);
            }
        } else if (gettime() > self.next_time_hunt_carrier || sighttracepassed(self.origin + (0, 0, 77), level.var_9a453437a59c7a57.origin + (0, 0, 77), 0, self)) {
            self botsetscriptgoal(level.var_9a453437a59c7a57.origin, 16, "hunt");
            self.next_time_hunt_carrier = gettime() + randomintrange(4500, 5500);
        }
    }
}

// Namespace namespace_8480f086ee7637a/namespace_97e8a2c4f806f582
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x63c
// Size: 0x4f
function function_451fe89fc8f4f1b1(trigger) {
    if (trigger.bottargets.size >= 2) {
        var_82d7851272ca820d = array_randomize(trigger.bottargets);
        return var_82d7851272ca820d[0];
    } else {
        return trigger.bottargets[0];
    }
}

// Namespace namespace_8480f086ee7637a/namespace_97e8a2c4f806f582
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x692
// Size: 0x1d
function function_e1792f85cfa1c508(goal) {
    if (isdefined(level.var_9a453437a59c7a57)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_8480f086ee7637a/namespace_97e8a2c4f806f582
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6b7
// Size: 0x43
function function_8830ce4efdc64403(goal) {
    succeeded = function_7ba961e259d98d3d(namespace_1775668e99dafe49::function_cca61180d8fdf0ea() + 2, "jugg_captured", randomint(100) > 50);
    self botclearscriptgoal();
    if (succeeded) {
        goto LOC_00000041;
    }
LOC_00000041:
}

// Namespace namespace_8480f086ee7637a/namespace_97e8a2c4f806f582
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x701
// Size: 0xe9
function function_7ba961e259d98d3d(time, var_206bf0ac411b2257, var_5b45d81d67839650, dont_prone) {
    var_8e7073e75873765a = 0;
    if (self botgetdifficultysetting("strategyLevel") == 1) {
        var_8e7073e75873765a = 40;
    } else if (self botgetdifficultysetting("strategyLevel") >= 2) {
        var_8e7073e75873765a = 80;
    }
    if (randomint(100) < var_8e7073e75873765a && !(isdefined(dont_prone) && dont_prone)) {
        self botsetstance("prone");
        wait(0.2);
    }
    if (self botgetdifficultysetting("strategyLevel") > 0 && !var_5b45d81d67839650) {
    }
    self botpressbutton("use", time);
    result = bot_usebutton_wait(time, var_206bf0ac411b2257, "use_interrupted");
    self botsetstance("none");
    self botclearbutton("use");
    succeeded = result == var_206bf0ac411b2257;
    return succeeded;
}

// Namespace namespace_8480f086ee7637a/namespace_97e8a2c4f806f582
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7f2
// Size: 0x5e
function waittill_usebutton_released_or_time_or_bomb_planted(time) {
    time_started = gettime();
    var_f36002d69d048db6 = time_started + time * 1000;
    wait(0.05);
    while (self usebuttonpressed() && gettime() < var_f36002d69d048db6 && level.bombplanted) {
        wait(0.05);
    }
}

// Namespace namespace_8480f086ee7637a/namespace_97e8a2c4f806f582
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x857
// Size: 0x9
function is_defending_bombzone() {
    return bot_is_protecting();
}

// Namespace namespace_8480f086ee7637a/namespace_97e8a2c4f806f582
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x868
// Size: 0x29
function function_9ec0e59b27b57a40() {
    if (isdefined(level.bots_gametype_initialized) && level.bots_gametype_initialized) {
        return;
    }
    level.bots_gametype_initialized = 1;
}

// Namespace namespace_8480f086ee7637a/namespace_97e8a2c4f806f582
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x898
// Size: 0x6c
function function_789e1bb0f071af10() {
    wait(1);
    function_9b8b9e0f9b6897e3(level.rugby.endzones["allies"][0].trigger);
    function_9b8b9e0f9b6897e3(level.rugby.endzones["axis"][0].trigger);
    level.bot_set_objective_bottargets = 1;
}

// Namespace namespace_8480f086ee7637a/namespace_97e8a2c4f806f582
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x90b
// Size: 0x2e
function function_9b8b9e0f9b6897e3(element) {
    if (!isdefined(element.bottargets)) {
        element.bottargets = bot_get_valid_nodes_in_trigger(element);
    }
}

// Namespace namespace_8480f086ee7637a/namespace_97e8a2c4f806f582
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x940
// Size: 0x33f
function function_ca798b60536c6b13() {
    if (!level.bombplanted) {
        if (isdefined(level.team_planted_bomb)) {
            level.team_planted_bomb = undefined;
            level.bomb_carrier = undefined;
        }
        var_a8ef80d127014d2b = level.bomb_carrier;
        level.bomb_carrier = undefined;
        foreach (player in level.participants) {
            if (isalive(player) && player.isbombcarrier) {
                level.bomb_carrier = player;
            }
        }
        var_af5fb37a7fbc388 = 0;
        if (!isdefined(var_a8ef80d127014d2b) && isdefined(level.bomb_carrier)) {
            /#
                assert(isteamparticipant(level.bomb_carrier));
            #/
            var_af5fb37a7fbc388 = 1;
            if (isai(level.bomb_carrier)) {
                level.bomb_carrier thread bomber_think();
            }
        } else if (isdefined(var_a8ef80d127014d2b) && !isdefined(level.bomb_carrier)) {
            var_af5fb37a7fbc388 = 1;
        }
        if (var_af5fb37a7fbc388) {
            foreach (player in level.participants) {
                if (isaiteamparticipant(player)) {
                    player bot_defend_stop();
                }
            }
        }
    } else {
        if (isdefined(level.bombowner) && !isdefined(level.team_planted_bomb)) {
            level.team_planted_bomb = level.bombowner.team;
            level.last_time_calc_defuser = gettime();
        }
        if (!isdefined(level.bomb_defuser) || !isalive(level.bomb_defuser) || gettime() > level.last_time_calc_defuser + 1000) {
            var_7ff1c428ccf12888 = [];
            foreach (player in level.participants) {
                if (isalive(player) && isaiteamparticipant(player) && player.team != level.team_planted_bomb) {
                    var_7ff1c428ccf12888[var_7ff1c428ccf12888.size] = player;
                }
            }
            if (var_7ff1c428ccf12888.size > 0) {
                bombzone = level.objectives[get_enemy_team(level.team_planted_bomb)];
                var_8518445c76f3e0b8 = get_array_of_closest(bombzone.curorigin, var_7ff1c428ccf12888);
                if (!isdefined(level.bomb_defuser) || level.bomb_defuser != var_8518445c76f3e0b8[0]) {
                    var_b78eba6af13c0e63 = level.bomb_defuser;
                    level.bomb_defuser = var_8518445c76f3e0b8[0];
                    level.bomb_defuser bot_defend_stop();
                    if (isdefined(var_b78eba6af13c0e63)) {
                        var_b78eba6af13c0e63 notify("no_longer_bomb_defuser");
                    }
                }
            }
        }
    }
}

// Namespace namespace_8480f086ee7637a/namespace_97e8a2c4f806f582
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc86
// Size: 0x1b2
function bomber_think() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    while (!level.bombplanted && self.isbombcarrier) {
        followers = [];
        foreach (player in level.participants) {
            if (isalive(player) && isaiteamparticipant(player) && player.team == self.team && player bot_is_defending()) {
                followers[followers.size] = player;
            }
        }
        var_f3b7188ae6b4cf5c = 0;
        foreach (follower in followers) {
            var_c267021f983a459b = distancesquared(self.origin, follower.origin);
            var_3a0de1e171a0895f = follower.bot_defending_radius * follower.bot_defending_radius;
            var_e7f967c527a728a7 = follower.bot_defending_radius * 2 * follower.bot_defending_radius * 2;
            if (var_c267021f983a459b > var_3a0de1e171a0895f && var_c267021f983a459b < var_e7f967c527a728a7) {
                var_f3b7188ae6b4cf5c++;
            }
        }
        self setmovespeedscale(1 - 0.15 * var_f3b7188ae6b4cf5c);
        wait(1);
    }
}

// Namespace namespace_8480f086ee7637a/namespace_97e8a2c4f806f582
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe3f
// Size: 0x63
function crate_can_use(crate) {
    if (isagent(self) && !isdefined(crate.boxtype)) {
        return 0;
    }
    if (!namespace_e4a5fcd525f0b19b::function_9bd84cede4fe8f24(crate)) {
        return 0;
    }
    if (self.isbombcarrier) {
        return 0;
    }
    if (!bot_is_defending() && !bot_is_protecting() && !bot_is_bodyguarding()) {
        return 1;
    }
    return 0;
}

// Namespace namespace_8480f086ee7637a/namespace_97e8a2c4f806f582
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xeaa
// Size: 0x144
function function_770d1881c6adb8d0(var_d36a7e987347e24d) {
    var_99e49ced1b12ab57 = 0;
    foreach (var_54b003ce5d016238 in level.rugby.endzones) {
        /#
            wait_time = 1;
            if (gettime() < 5000) {
                wait_time = max(1, 5 - gettime() / 1000);
            }
            if (!isdefined(var_54b003ce5d016238[0].trigger)) {
                wait(wait_time);
                return 0;
            } else if (var_54b003ce5d016238[0].trigger.bottargets.size < 3) {
                wait(wait_time);
                /#
                    assertmsg("<unknown string>" + "<unknown string>" + var_54b003ce5d016238[0].trigger.origin + "<unknown string>");
                #/
                if (var_54b003ce5d016238[0].trigger.bottargets.size < 1) {
                    var_99e49ced1b12ab57 = 1;
                }
            }
        #/
    }
    if (!var_99e49ced1b12ab57) {
        function_19b1cd86e58e30ce();
    }
    return !var_99e49ced1b12ab57;
}

// Namespace namespace_8480f086ee7637a/namespace_97e8a2c4f806f582
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xff6
// Size: 0xf3
function function_19b1cd86e58e30ce() {
    /#
        assert(isdefined(level.rugby.endzones));
    #/
    entrance_origin_points = [];
    var_31ac0f14318b785f = [];
    index = 0;
    foreach (var_54b003ce5d016238 in level.rugby.endzones) {
        entrance_origin_points[index] = random(var_54b003ce5d016238[0].trigger.bottargets).origin;
        var_31ac0f14318b785f[index] = "zone" + var_54b003ce5d016238[0].trigger.objectivekey;
        index++;
    }
    bot_cache_entrances(entrance_origin_points, var_31ac0f14318b785f);
}

// Namespace namespace_8480f086ee7637a/namespace_97e8a2c4f806f582
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10f0
// Size: 0x4d
function function_a3f84b78c1204ba5() {
    /#
        while (1) {
            if (getdvarint(@"hash_f66db1fdabed015d", 0) == 1) {
                setdevdvar(@"hash_54b3dbf61a166e11", 0);
                self botpressbutton("<unknown string>", 11);
                wait(0.05);
            }
            wait(0.05);
        }
    #/
}

