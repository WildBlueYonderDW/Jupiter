// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\bots\bots_gametype_common.gsc;
#using scripts\mp\bots\bots_util.gsc;
#using scripts\mp\bots\bots_strategy.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\bots\bots.gsc;

#namespace namespace_8e53028b1a3f7d8;

// Namespace namespace_8e53028b1a3f7d8/namespace_7c4b92719ee1e380
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x216
// Size: 0x11
function main() {
    setup_callbacks();
    setup_bot_cyber();
}

// Namespace namespace_8e53028b1a3f7d8/namespace_7c4b92719ee1e380
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22e
// Size: 0x6
function function_e45e46b7c35deadb() {
    /#
    #/
}

// Namespace namespace_8e53028b1a3f7d8/namespace_7c4b92719ee1e380
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23b
// Size: 0x66
function setup_callbacks() {
    level.bot_funcs["crate_can_use"] = &crate_can_use;
    level.bot_funcs["gametype_think"] = &bot_cyber_think;
    level.bot_funcs["know_enemies_on_start"] = undefined;
    level.bot_funcs["emp_picked_up_cancel"] = &bot_abort_emp_pickup;
    level.bot_funcs["tactical_revive_override"] = &bot_abort_tactical_goal_for_revive;
}

// Namespace namespace_8e53028b1a3f7d8/namespace_7c4b92719ee1e380
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a8
// Size: 0xa6
function setup_bot_cyber() {
    bot_setup_objective_bottargets();
    bot_waittill_bots_enabled();
    succeeded = bot_verify_and_cache_bombzones([0:"_allies", 1:"_axis"]);
    if (succeeded) {
        foreach (bombzone in level.objectives) {
            bombzone thread monitor_bombzone_control();
        }
        level.protect_radius = 600;
        level.bot_gametype_precaching_done = 1;
    }
}

// Namespace namespace_8e53028b1a3f7d8/namespace_7c4b92719ee1e380
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x355
// Size: 0x476
function bot_cyber_think() {
    self notify("bot_sab_think");
    self endon("bot_sab_think");
    self endon("death_or_disconnect");
    level endon("game_ended");
    while (!isdefined(level.bot_gametype_precaching_done)) {
        wait(0.05);
    }
    init_bot_game_cyber();
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
            update_game_cyber();
            level.next_game_update_time = gettime() + 100;
        }
        if (!namespace_7e17181d03156026::isreallyalive(self)) {
            continue;
        }
        if (!isdefined(level.team_planted_bomb)) {
            if (!isdefined(level.bomb_carrier)) {
                if (bot_has_tactical_goal("seek_cyber_emp", undefined) == 0) {
                    action_thread = &cyber_bot_pickup_emp;
                    var_4f3b05e382bb8c7c = spawnstruct();
                    var_4f3b05e382bb8c7c.object = level.cyberemp.trigger;
                    var_4f3b05e382bb8c7c.script_goal_radius = 16;
                    var_4f3b05e382bb8c7c.should_abort = level.bot_funcs["emp_picked_up_cancel"];
                    var_4f3b05e382bb8c7c.action_thread = action_thread;
                    var_db532bb6d3e2f8e6 = getclosestpointonnavmesh(level.cyberemp.curorigin, self);
                    bot_new_tactical_goal("seek_cyber_emp", var_db532bb6d3e2f8e6, 99, var_4f3b05e382bb8c7c);
                }
            } else if (self.isbombcarrier) {
                if (!bot_has_tactical_goal()) {
                    bombzone = level.objectives[get_enemy_team(self.team)];
                    var_735fd56db96f509c = get_bombzone_node_to_plant_on(bombzone, 1);
                    self botclearscriptgoal();
                    self botsetscriptgoal(var_735fd56db96f509c.origin, 0, "critical", var_735fd56db96f509c.angles[1]);
                    var_2504da19c43fb0d3 = bot_waittill_goal_or_fail();
                    if (var_2504da19c43fb0d3 == "goal") {
                        self botpressbutton("use", level.planttime + 2);
                        level waittill_any_timeout_1(level.planttime + 2, "bomb_planted");
                    }
                    self botclearscriptgoal();
                }
            } else if (level.bomb_carrier.team == self.team) {
                if (!bot_is_defending()) {
                    bot_guard_player(level.bomb_carrier, 400);
                }
            } else if (gettime() > self.next_time_hunt_carrier || sighttracepassed(self.origin + (0, 0, 77), level.bomb_carrier.origin + (0, 0, 77), 0, self)) {
                self botsetscriptgoal(level.bomb_carrier.origin, 16, "hunt");
                self.next_time_hunt_carrier = gettime() + randomintrange(4500, 5500);
            }
        } else {
            bombzone = level.objectives[get_enemy_team(level.team_planted_bomb)];
            if (self.team == level.team_planted_bomb) {
                if (!is_defending_bombzone()) {
                    bot_protect_point(bombzone.curorigin, 600);
                }
            } else if (isdefined(level.bomb_defuser) && level.bomb_defuser == self) {
                var_2fea4b3d4aab8868 = get_bombzone_node_to_defuse_on(bombzone).origin;
                self botsetscriptgoal(var_2fea4b3d4aab8868, 20, "critical");
                result = bot_waittill_goal_or_fail(undefined, "no_longer_bomb_defuser");
                if (result == "goal") {
                    self botpressbutton("use", level.defusetime + 2);
                    waittill_usebutton_released_or_time_or_bomb_planted(level.defusetime + 2);
                }
            } else if (!bot_is_defending()) {
                optional_params["entrance_points_index"] = "zone" + bombzone.label;
                bot_capture_point(bombzone.curorigin, 200, optional_params);
            }
        }
    }
}

// Namespace namespace_8e53028b1a3f7d8/namespace_7c4b92719ee1e380
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7d2
// Size: 0x27
function bot_abort_emp_pickup(goal) {
    if (isdefined(level.cyberemp.carrier)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_8e53028b1a3f7d8/namespace_7c4b92719ee1e380
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x801
// Size: 0x49
function cyber_bot_pickup_emp(goal) {
    self botpressbutton("use", 0.5);
    var_bce1cf9927e810f2 = self botgetpersonality();
    if (var_bce1cf9927e810f2 == "default" || var_bce1cf9927e810f2 == "camper") {
        wait(0.5);
    }
}

// Namespace namespace_8e53028b1a3f7d8/namespace_7c4b92719ee1e380
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x851
// Size: 0x5e
function waittill_usebutton_released_or_time_or_bomb_planted(time) {
    time_started = gettime();
    var_f36002d69d048db6 = time_started + time * 1000;
    wait(0.05);
    while (self usebuttonpressed() && gettime() < var_f36002d69d048db6 && level.bombplanted) {
        wait(0.05);
    }
}

// Namespace namespace_8e53028b1a3f7d8/namespace_7c4b92719ee1e380
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8b6
// Size: 0x9
function is_defending_bombzone() {
    return bot_is_protecting();
}

// Namespace namespace_8e53028b1a3f7d8/namespace_7c4b92719ee1e380
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8c7
// Size: 0x29
function init_bot_game_cyber() {
    if (isdefined(level.bots_gametype_initialized) && level.bots_gametype_initialized) {
        return;
    }
    level.bots_gametype_initialized = 1;
}

// Namespace namespace_8e53028b1a3f7d8/namespace_7c4b92719ee1e380
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8f7
// Size: 0x33f
function update_game_cyber() {
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

// Namespace namespace_8e53028b1a3f7d8/namespace_7c4b92719ee1e380
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc3d
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

// Namespace namespace_8e53028b1a3f7d8/namespace_7c4b92719ee1e380
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdf6
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

// Namespace namespace_8e53028b1a3f7d8/namespace_7c4b92719ee1e380
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe61
// Size: 0x186
function bot_abort_tactical_goal_for_revive() {
    if (level.bombplanted) {
        return 0;
    }
    if (isdefined(level.cyberemp.carrier) && self == level.cyberemp.carrier) {
        return 0;
    }
    if (istrue(self.isbotmedicrole)) {
        return 0;
    }
    var_f9c0ea4126cebf58 = getteamdata(self.team, "aliveCount");
    var_557d59ebff7d41b2 = getteamdata(self.team, "teamCount");
    var_266071535f1e555b = var_557d59ebff7d41b2 - var_f9c0ea4126cebf58;
    if (var_266071535f1e555b == 0) {
        return 0;
    }
    var_8f493be601dd5562 = 0;
    var_365ca68607befb50 = 0;
    foreach (player in getteamdata(self.team, "players")) {
        if (istrue(self.isbotmedicrole)) {
            var_8f493be601dd5562++;
        }
    }
    var_698a5ae4108aaa6b = int(clamp(var_557d59ebff7d41b2 - 2, 1, 3));
    if (var_8f493be601dd5562 < var_698a5ae4108aaa6b + 1) {
        var_365ca68607befb50 = 1;
    }
    if (var_365ca68607befb50) {
        if (var_557d59ebff7d41b2 == 2) {
            var_51ca3cc37c90bcb3 = 1;
        } else {
            var_51ca3cc37c90bcb3 = var_f9c0ea4126cebf58 / var_557d59ebff7d41b2 <= 0.7;
        }
        if (var_51ca3cc37c90bcb3) {
            return 1;
        }
    }
    return 0;
}

