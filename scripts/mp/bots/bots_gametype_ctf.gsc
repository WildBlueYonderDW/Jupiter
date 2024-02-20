// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\bots\bots_util.gsc;
#using scripts\mp\bots\bots_strategy.gsc;
#using scripts\mp\bots\bots_personality.gsc;
#using scripts\mp\bots\bots_gametype_common.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\gameobjects.gsc;

#namespace namespace_4e9b1257b086176e;

// Namespace namespace_4e9b1257b086176e/namespace_3005fd10ea05d166
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x229
// Size: 0x11
function main() {
    setup_callbacks();
    setup_bot_ctf();
}

// Namespace namespace_4e9b1257b086176e/namespace_3005fd10ea05d166
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x241
// Size: 0x6
function function_e45e46b7c35deadb() {
    /#
    #/
}

// Namespace namespace_4e9b1257b086176e/namespace_3005fd10ea05d166
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x24e
// Size: 0x42
function setup_callbacks() {
    level.bot_funcs["crate_can_use"] = &crate_can_use;
    level.bot_funcs["gametype_think"] = &bot_ctf_think;
    level.bot_funcs["get_watch_node_chance"] = &bot_ctf_get_node_chance;
}

// Namespace namespace_4e9b1257b086176e/namespace_3005fd10ea05d166
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x297
// Size: 0x1d1
function setup_bot_ctf() {
    /#
        if (0) {
            level.var_5c7085cb60319b4 = 1;
        }
    #/
    level.bot_gametype_attacker_limit_for_team = &ctf_bot_attacker_limit_for_team;
    level.bot_gametype_defender_limit_for_team = &ctf_bot_defender_limit_for_team;
    level.bot_gametype_allied_attackers_for_team = &get_allied_attackers_for_team;
    level.bot_gametype_allied_defenders_for_team = &get_allied_defenders_for_team;
    level.bot_gametype_allowed_to_switch_to_defender = &bot_ctf_can_switch_to_defender;
    level.bot_gametype_human_player_always_attacker = &bot_ctf_player_always_attacker;
    bot_waittill_bots_enabled();
    while (!isdefined(level.teamflags)) {
        wait(0.05);
    }
    level.teamflags["allies"].objectivekey = "allies";
    level.teamflags["axis"].objectivekey = "axis";
    bot_cache_entrances_to_gametype_array(level.teamflags, "flag_");
    zone = getzonenearest(level.teamflags["allies"].curorigin);
    if (isdefined(zone)) {
        botzonesetteam(zone, "allies");
    }
    zone = getzonenearest(level.teamflags["axis"].curorigin);
    if (isdefined(zone)) {
        botzonesetteam(zone, "axis");
    }
    level.capzones["allies"].nearest_node = level.teamflags["allies"].trigger.nearest_node;
    level.capzones["axis"].nearest_node = level.teamflags["axis"].trigger.nearest_node;
    thread bot_ctf_ai_director_update();
    level.bot_gametype_precaching_done = 1;
}

// Namespace namespace_4e9b1257b086176e/namespace_3005fd10ea05d166
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x46f
// Size: 0x41
function crate_can_use(crate) {
    if (isagent(self) && !isdefined(crate.boxtype)) {
        return 0;
    }
    if (bot_ctf_player_has_flag()) {
        return 0;
    }
    return bot_ctf_flag_is_home_of_team(self.team);
}

// Namespace namespace_4e9b1257b086176e/namespace_3005fd10ea05d166
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4b8
// Size: 0x49e
function bot_ctf_think() {
    self notify("bot_ctf_think");
    self endon("bot_ctf_think");
    self endon("death_or_disconnect");
    level endon("game_ended");
    while (!isdefined(level.bot_gametype_precaching_done)) {
        wait(0.05);
    }
    self.next_flag_hide_time = 0;
    self botsetflag("separation", 0);
    self botsetflag("use_obj_path_style", 1);
    set_scripted_pathing_style = 0;
    var_a4775e629f031993 = 0;
    for (;;) {
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
        if (!isdefined(self.role)) {
            bot_gametype_initialize_attacker_defender_role();
        }
        enemy_team = getotherteam(self.team)[0];
        if (bot_ctf_flag_is_home_of_team(self.team)) {
            if (isdefined(level.bot_known_flag_carrier_loc) && isdefined(level.bot_known_flag_carrier_loc[enemy_team])) {
                level.bot_known_flag_carrier_loc[enemy_team] = undefined;
            }
        }
        var_b3e8aeb3e9fe5518 = 0;
        if (self.role == "attacker") {
            if (bot_ctf_player_has_flag()) {
                var_b3e8aeb3e9fe5518 = 1;
            } else if (!bot_ctf_enemy_team_flag_is_picked_up()) {
                var_b3e8aeb3e9fe5518 = distancesquared(self.origin, level.teamflags[enemy_team].curorigin) < squared(get_flag_protect_radius());
            }
        } else if (!bot_ctf_flag_is_home_of_team(self.team)) {
            var_b3e8aeb3e9fe5518 = !bot_ctf_my_team_flag_is_picked_up();
        }
        self botsetflag("force_sprint", var_b3e8aeb3e9fe5518);
        var_a4775e629f031993 = 0;
        if (bot_ctf_player_has_flag()) {
            if (bot_ctf_flag_is_home_of_team(self.team)) {
                clear_defend();
                var_a4775e629f031993 = 1;
                if (!set_scripted_pathing_style) {
                    set_scripted_pathing_style = 1;
                    self botsetpathingstyle("scripted");
                }
                self botsetscriptgoal(level.capzones[self.team].curorigin, 16, "critical");
            } else if (bot_gametype_get_num_players_on_team(self.team) == 1) {
                bot_ctf_recover_flag();
            } else if (gettime() > self.next_flag_hide_time) {
                clear_defend();
                nodes = getnodesinradius(level.capzones[self.team].curorigin, 900, 0, 300);
                var_7e939d9754fb78de = self botnodepick(nodes, nodes.size * 0.15, "node_hide_anywhere");
                if (!isdefined(var_7e939d9754fb78de)) {
                    var_7e939d9754fb78de = level.capzones[self.team].nearest_node;
                }
                /#
                    assert(isdefined(var_7e939d9754fb78de));
                #/
                success = self botsetscriptgoalnode(var_7e939d9754fb78de, "critical");
                if (success) {
                    self.next_flag_hide_time = gettime() + 15000;
                }
            }
        } else if (self.role == "attacker") {
            if (bot_ctf_enemy_team_flag_is_picked_up()) {
                if (!bot_is_bodyguarding()) {
                    clear_defend();
                    self botclearscriptgoal();
                    var_85ba43086f4dde82 = level.teamflags[enemy_team].carrier;
                    bot_guard_player(var_85ba43086f4dde82, 500);
                }
            } else {
                clear_defend();
                if (self botgetscriptgoaltype() == "critical") {
                    self botclearscriptgoal();
                }
                self botsetscriptgoal(level.teamflags[enemy_team].curorigin, 16, "objective", undefined, 300);
            }
        } else {
            /#
                assert(self.role == "defender");
            #/
            if (!bot_ctf_flag_is_home_of_team(self.team)) {
                bot_ctf_recover_flag();
            } else if (!is_protecting_flag()) {
                self botclearscriptgoal();
                optional_params["score_flags"] = "strict_los";
                optional_params["entrance_points_index"] = "flag_" + level.teamflags[self.team].objectivekey;
                optional_params["nearest_node_to_center"] = level.teamflags[self.team].trigger.nearest_node;
                bot_protect_point(level.teamflags[self.team].curorigin, get_flag_protect_radius(), optional_params);
            }
        }
        if (set_scripted_pathing_style && !var_a4775e629f031993) {
            set_scripted_pathing_style = 0;
            self botsetpathingstyle(undefined);
        }
    }
}

// Namespace namespace_4e9b1257b086176e/namespace_3005fd10ea05d166
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x95d
// Size: 0x2ad
function bot_ctf_recover_flag() {
    var_db965920aa486082 = undefined;
    var_f1826f769cfe617a = level.teamflags[self.team];
    var_c80369fc0f449358 = var_f1826f769cfe617a.carrier;
    if (!isdefined(var_c80369fc0f449358)) {
        var_db965920aa486082 = var_f1826f769cfe617a.curorigin;
    } else if (self botcanseeentity(var_c80369fc0f449358)) {
        var_db965920aa486082 = var_c80369fc0f449358.origin;
        if (self botgetdifficultysetting("strategyLevel") > 0 && !bot_ctf_flag_is_home_of_team(self.team)) {
            if (!isdefined(level.bot_known_flag_carrier_loc)) {
                level.bot_known_flag_carrier_loc = [];
            }
            if (!isdefined(level.bot_known_flag_carrier_loc[var_c80369fc0f449358.team])) {
                level.bot_known_flag_carrier_loc[var_c80369fc0f449358.team] = [];
            }
            level.bot_known_flag_carrier_loc[var_c80369fc0f449358.team]["origin"] = var_db965920aa486082;
            level.bot_known_flag_carrier_loc[var_c80369fc0f449358.team]["time"] = gettime();
        }
    } else if (isdefined(var_f1826f769cfe617a.curcarrierorigin)) {
        if (isdefined(var_f1826f769cfe617a.compassicons["friendly"])) {
            if (var_f1826f769cfe617a.objidpingfriendly) {
                var_db965920aa486082 = var_f1826f769cfe617a.curcarrierorigin;
            } else {
                var_db965920aa486082 = var_c80369fc0f449358.origin;
            }
        }
    } else {
        var_db965920aa486082 = var_f1826f769cfe617a.curorigin;
    }
    if (isdefined(var_db965920aa486082)) {
        clear_defend();
        self botsetscriptgoal(var_db965920aa486082, 16, "critical");
    } else {
        var_c74e2e565ee3fe18 = undefined;
        var_3ad830dc9d89106d = undefined;
        if (self botgetdifficultysetting("strategyLevel") > 0) {
            if (isdefined(level.bot_known_flag_carrier_loc) && isdefined(level.bot_known_flag_carrier_loc[var_c80369fc0f449358.team])) {
                var_3ad830dc9d89106d = gettime() - level.bot_known_flag_carrier_loc[var_c80369fc0f449358.team]["time"];
                if (var_3ad830dc9d89106d < 10000) {
                    var_c74e2e565ee3fe18 = level.bot_known_flag_carrier_loc[var_c80369fc0f449358.team]["origin"];
                }
            }
        }
        if (isdefined(var_c74e2e565ee3fe18)) {
            if (var_3ad830dc9d89106d < 5000) {
                clear_defend();
                self botsetscriptgoal(var_c74e2e565ee3fe18, 16, "critical");
            } else if (!bot_is_patrolling()) {
                bot_defend_stop();
                bot_patrol_area(var_c74e2e565ee3fe18, 400);
            }
        } else {
            clear_defend();
            var_e7073093c8c51701 = self botgetscriptgoaltype();
            if (var_e7073093c8c51701 == "objective" || var_e7073093c8c51701 == "critical") {
                self botclearscriptgoal();
            }
            update_personality_default();
        }
    }
}

// Namespace namespace_4e9b1257b086176e/namespace_3005fd10ea05d166
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc11
// Size: 0x13
function clear_defend() {
    if (bot_is_defending()) {
        bot_defend_stop();
    }
}

// Namespace namespace_4e9b1257b086176e/namespace_3005fd10ea05d166
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc2b
// Size: 0x9
function is_protecting_flag() {
    return bot_is_protecting();
}

// Namespace namespace_4e9b1257b086176e/namespace_3005fd10ea05d166
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc3c
// Size: 0x73
function get_flag_protect_radius() {
    if (isalive(self) && !isdefined(level.protect_radius)) {
        var_fa52693cf4679c62 = self botgetworldsize();
        var_dd6786927bde6332 = (var_fa52693cf4679c62[0] + var_fa52693cf4679c62[1]) / 2;
        level.protect_radius = min(800, var_dd6786927bde6332 / 5.5);
    }
    if (!isdefined(level.protect_radius)) {
        return 900;
    }
    return level.protect_radius;
}

// Namespace namespace_4e9b1257b086176e/namespace_3005fd10ea05d166
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcb7
// Size: 0xdf
function ctf_bot_attacker_limit_for_team(team) {
    var_6ace8681f94cdc7c = bot_gametype_get_num_players_on_team(team);
    if (var_6ace8681f94cdc7c == 1) {
        return 1;
    }
    if (bot_ctf_flag_is_home_of_team(team)) {
        var_5995918ec569a5b3 = var_6ace8681f94cdc7c * 0.67;
    } else {
        enemy_team = getotherteam(team)[0];
        if (bot_ctf_flag_is_home_of_team(enemy_team)) {
            var_5995918ec569a5b3 = var_6ace8681f94cdc7c * 0.5;
        } else {
            var_5995918ec569a5b3 = var_6ace8681f94cdc7c * 0.4;
        }
    }
    var_363da16eb06140fe = int(roundup(var_5995918ec569a5b3));
    var_cd5052914e11eb6a = game["teamScores"][team];
    var_5a293d5e08a8b462 = game["teamScores"][get_enemy_team(team)];
    if (var_cd5052914e11eb6a + 1 < var_5a293d5e08a8b462) {
        var_363da16eb06140fe = int(min(var_363da16eb06140fe + 1, var_6ace8681f94cdc7c));
    }
    return var_363da16eb06140fe;
}

// Namespace namespace_4e9b1257b086176e/namespace_3005fd10ea05d166
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd9e
// Size: 0x27
function ctf_bot_defender_limit_for_team(team) {
    var_6ace8681f94cdc7c = bot_gametype_get_num_players_on_team(team);
    return var_6ace8681f94cdc7c - ctf_bot_attacker_limit_for_team(team);
}

// Namespace namespace_4e9b1257b086176e/namespace_3005fd10ea05d166
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdcd
// Size: 0x2e
function get_allied_attackers_for_team(team) {
    return bot_gametype_get_allied_attackers_for_team(team, level.capzones[team].curorigin, get_flag_protect_radius());
}

// Namespace namespace_4e9b1257b086176e/namespace_3005fd10ea05d166
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe03
// Size: 0x2e
function get_allied_defenders_for_team(team) {
    return bot_gametype_get_allied_defenders_for_team(team, level.capzones[team].curorigin, get_flag_protect_radius());
}

// Namespace namespace_4e9b1257b086176e/namespace_3005fd10ea05d166
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe39
// Size: 0x21
function bot_ctf_ai_director_update() {
    level notify("bot_ctf_ai_director_update");
    level endon("bot_ctf_ai_director_update");
    level endon("game_ended");
    thread bot_gametype_attacker_defender_ai_director_update();
}

// Namespace namespace_4e9b1257b086176e/namespace_3005fd10ea05d166
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe61
// Size: 0x5a
function bot_ctf_get_node_chance(node) {
    if (node == self.node_closest_to_defend_center) {
        return 1;
    }
    if (!is_protecting_flag()) {
        return 1;
    }
    var_4db0bb626fc52479 = node node_is_on_path_from_labels("flag_allies", "flag_axis");
    if (var_4db0bb626fc52479) {
        return 1;
    }
    return 0.2;
}

// Namespace namespace_4e9b1257b086176e/namespace_3005fd10ea05d166
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xec3
// Size: 0x1d
function bot_ctf_flag_is_home_of_team(team) {
    return level.teamflags[team] namespace_19b4203b51d56488::ishome();
}

// Namespace namespace_4e9b1257b086176e/namespace_3005fd10ea05d166
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xee8
// Size: 0x22
function bot_ctf_flag_picked_up_of_team(team) {
    return isdefined(level.teamflags[team].carrier);
}

// Namespace namespace_4e9b1257b086176e/namespace_3005fd10ea05d166
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf12
// Size: 0x12
function bot_ctf_my_team_flag_is_picked_up() {
    return bot_ctf_flag_picked_up_of_team(self.team);
}

// Namespace namespace_4e9b1257b086176e/namespace_3005fd10ea05d166
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf2c
// Size: 0x26
function bot_ctf_enemy_team_flag_is_picked_up() {
    enemy_team = getotherteam(self.team)[0];
    return bot_ctf_flag_picked_up_of_team(enemy_team);
}

// Namespace namespace_4e9b1257b086176e/namespace_3005fd10ea05d166
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf5a
// Size: 0xd
function bot_ctf_player_has_flag() {
    return isdefined(self.carryflag);
}

// Namespace namespace_4e9b1257b086176e/namespace_3005fd10ea05d166
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf6f
// Size: 0x10
function bot_ctf_can_switch_to_defender() {
    if (bot_ctf_player_has_flag()) {
        return 0;
    }
    return 1;
}

// Namespace namespace_4e9b1257b086176e/namespace_3005fd10ea05d166
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf87
// Size: 0x10
function bot_ctf_player_always_attacker() {
    if (bot_ctf_player_has_flag()) {
        return 1;
    }
    return 0;
}

