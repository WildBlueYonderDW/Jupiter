#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\bots\bots_util.gsc;
#using scripts\mp\bots\bots_strategy.gsc;
#using scripts\mp\bots\bots.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace bots_gametype_infect;

// Namespace bots_gametype_infect / scripts\mp\bots\bots_gametype_infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x206
// Size: 0x10
function main() {
    setup_callbacks();
    setup_bot_infect();
}

/#

    // Namespace bots_gametype_infect / scripts\mp\bots\bots_gametype_infect
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x21e
    // Size: 0x5
    function function_e45e46b7c35deadb() {
        
    }

#/

// Namespace bots_gametype_infect / scripts\mp\bots\bots_gametype_infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22b
// Size: 0x2c
function setup_callbacks() {
    level.bot_funcs["gametype_think"] = &bot_infect_think;
    level.bot_funcs["should_pickup_weapons"] = &bot_should_pickup_weapons_infect;
}

// Namespace bots_gametype_infect / scripts\mp\bots\bots_gametype_infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25f
// Size: 0x2b
function setup_bot_infect() {
    level.bots_gametype_handles_class_choice = 1;
    level.bots_ignore_team_balance = 1;
    level.bots_gametype_handles_team_choice = 1;
    thread bot_infect_ai_director_update();
}

// Namespace bots_gametype_infect / scripts\mp\bots\bots_gametype_infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x292
// Size: 0x29
function bot_should_pickup_weapons_infect() {
    if (level.infect_chosefirstinfected && self.team == "axis") {
        return 0;
    }
    return scripts\mp\bots\bots::bot_should_pickup_weapons();
}

// Namespace bots_gametype_infect / scripts\mp\bots\bots_gametype_infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c4
// Size: 0xda
function bot_infect_think() {
    self notify("bot_infect_think");
    self endon("bot_infect_think");
    self endon("death_or_disconnect");
    level endon("game_ended");
    childthread bot_infect_retrieve_knife();
    while (true) {
        if (level.infect_chosefirstinfected) {
            if (self.team == "axis" && self botgetpersonality() != "run_and_gun") {
                bot_set_personality("run_and_gun");
            }
        }
        if (self.bot_team != self.team) {
            self.bot_team = self.team;
        }
        if (self.team == "axis") {
            result = bot_melee_tactical_insertion_check();
            if (!isdefined(result) || result) {
                self botclearscriptgoal();
            }
        }
        self [[ self.personality_update_function ]]();
        wait 0.05;
    }
}

// Namespace bots_gametype_infect / scripts\mp\bots\bots_gametype_infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a6
// Size: 0x3b8
function bot_infect_ai_director_update() {
    level notify("bot_infect_ai_director_update");
    level endon("bot_infect_ai_director_update");
    level endon("game_ended");
    while (true) {
        infected_players = [];
        var_4de221da8f9b25c8 = [];
        foreach (player in level.players) {
            if (!isdefined(player.initial_spawn_time) && player.health > 0 && isdefined(player.team) && (player.team == "allies" || player.team == "axis")) {
                player.initial_spawn_time = gettime();
            }
            if (isdefined(player.initial_spawn_time) && gettime() - player.initial_spawn_time > 5000) {
                if (!isdefined(player.team)) {
                    continue;
                }
                if (player.team == "axis") {
                    infected_players[infected_players.size] = player;
                    continue;
                }
                if (player.team == "allies") {
                    var_4de221da8f9b25c8[var_4de221da8f9b25c8.size] = player;
                }
            }
        }
        if (infected_players.size > 0 && var_4de221da8f9b25c8.size > 0) {
            var_b284217fe817ca2f = 1;
            foreach (var_a58ff4a65b324b6b in var_4de221da8f9b25c8) {
                if (isbot(var_a58ff4a65b324b6b)) {
                    var_b284217fe817ca2f = 0;
                }
            }
            if (var_b284217fe817ca2f) {
                foreach (player in var_4de221da8f9b25c8) {
                    if (!isdefined(player.last_infected_hiding_time)) {
                        player.last_infected_hiding_time = gettime();
                        player.last_infected_hiding_loc = player.origin;
                        player.time_spent_hiding = 0;
                    }
                    if (gettime() >= player.last_infected_hiding_time + 5000) {
                        player.last_infected_hiding_time = gettime();
                        var_3b4519d9e6ffac2c = distancesquared(player.origin, player.last_infected_hiding_loc);
                        player.last_infected_hiding_loc = player.origin;
                        if (var_3b4519d9e6ffac2c < 90000) {
                            player.time_spent_hiding += 5000;
                            if (player.time_spent_hiding >= 20000) {
                                var_c1edadbdae2b698c = get_array_of_closest(player.origin, infected_players);
                                foreach (infected_player in var_c1edadbdae2b698c) {
                                    if (isbot(infected_player)) {
                                        goal_type = infected_player botgetscriptgoaltype();
                                        if (goal_type != "tactical" && goal_type != "critical") {
                                            infected_player thread hunt_human(player);
                                            break;
                                        }
                                    }
                                }
                            }
                            continue;
                        }
                        player.time_spent_hiding = 0;
                        player.last_infected_hiding_loc = player.origin;
                    }
                }
            }
        }
        wait 1;
    }
}

// Namespace bots_gametype_infect / scripts\mp\bots\bots_gametype_infect
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x766
// Size: 0x38
function hunt_human(var_df757d4ca3bebed8) {
    self endon("death_or_disconnect");
    self botsetscriptgoal(var_df757d4ca3bebed8.origin, 0, "critical");
    bot_waittill_goal_or_fail();
    self botclearscriptgoal();
}

// Namespace bots_gametype_infect / scripts\mp\bots\bots_gametype_infect
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7a6
// Size: 0x2e0
function bot_infect_retrieve_knife() {
    if (self.team == "axis") {
        self.can_melee_enemy_time = 0;
        self.melee_enemy = undefined;
        self.melee_enemy_node = undefined;
        self.melee_enemy_new_node_time = 0;
        self.melee_self_node = undefined;
        self.melee_self_new_node_time = 0;
        throwKnifeChance = self botgetdifficultysetting("throwKnifeChance");
        if (throwKnifeChance < 0.25) {
            self botsetdifficultysetting("throwKnifeChance", 0.25);
        }
        self botsetdifficultysetting("allowGrenades", 1);
        while (true) {
            if (self hasweapon("throwingknife_mp")) {
                if (scripts\cp_mp\utility\game_utility::isgameparticipant(self.enemy)) {
                    time = gettime();
                    if (!isdefined(self.melee_enemy) || self.melee_enemy != self.enemy) {
                        self.melee_enemy = self.enemy;
                        self.melee_enemy_node = self.enemy getnearestnode();
                        self.melee_enemy_new_node_time = time;
                    } else {
                        meleedistsq = squared(self botgetdifficultysetting("meleeDist"));
                        if (distancesquared(self.enemy.origin, self.origin) <= meleedistsq) {
                            self.can_melee_enemy_time = time;
                        }
                        melee_enemy_node = self.enemy getnearestnode();
                        melee_self_node = self getnearestnode();
                        if (!isdefined(self.melee_enemy_node) || self.melee_enemy_node != melee_enemy_node) {
                            self.melee_enemy_new_node_time = time;
                            self.melee_enemy_node = melee_enemy_node;
                        }
                        if (!isdefined(self.melee_self_node) || self.melee_self_node != melee_self_node) {
                            self.melee_self_new_node_time = time;
                            self.melee_self_node = melee_self_node;
                        } else if (distancesquared(self.origin, self.melee_self_node.origin) > 9216) {
                            self.melee_self_at_same_node_time = time;
                        }
                        if (self.can_melee_enemy_time + 3000 < time) {
                            if (self.melee_self_new_node_time + 3000 < time) {
                                if (self.melee_enemy_new_node_time + 3000 < time) {
                                    if (bot_infect_angle_too_steep_for_knife_throw(self.origin, self.enemy.origin)) {
                                        bot_queued_process("find_node_can_see_ent", &bot_infect_find_node_can_see_ent, self.enemy, self.melee_self_node);
                                    }
                                    if (!self getammocount("throwingknife_mp")) {
                                        self setweaponammoclip("throwingknife_mp", 1);
                                    }
                                    waittill_any_timeout_no_endon_death_1(30, "enemy");
                                    self botclearscriptgoal();
                                }
                            }
                        }
                    }
                }
            }
            wait 0.25;
        }
    }
}

// Namespace bots_gametype_infect / scripts\mp\bots\bots_gametype_infect
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa8e
// Size: 0x3d
function bot_infect_angle_too_steep_for_knife_throw(testorigin, testdest) {
    if (abs(testorigin[2] - testdest[2]) > 56 && distance2dsquared(testorigin, testdest) < 2304) {
        return true;
    }
    return false;
}

// Namespace bots_gametype_infect / scripts\mp\bots\bots_gametype_infect
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xad4
// Size: 0x19d
function bot_infect_find_node_can_see_ent(targetent, startnode) {
    if (!isdefined(targetent) || !isdefined(startnode)) {
        return;
    }
    var_23ee3d0eb96ab147 = 0;
    if (issubstr(startnode.type, "Begin")) {
        var_23ee3d0eb96ab147 = 1;
    }
    neighbornodes = getlinkednodes(startnode);
    if (isdefined(neighbornodes) && neighbornodes.size) {
        var_3c953e7596ad9543 = array_randomize(neighbornodes);
        foreach (nnode in var_3c953e7596ad9543) {
            if (var_23ee3d0eb96ab147 && issubstr(nnode.type, "End")) {
                continue;
            }
            if (bot_infect_angle_too_steep_for_knife_throw(nnode.origin, targetent.origin)) {
                continue;
            }
            var_ab4876cb0361ae34 = self geteye() - self.origin;
            start = nnode.origin + var_ab4876cb0361ae34;
            end = targetent.origin;
            if (isplayer(targetent)) {
                end = targetent getstancecenter();
            }
            if (sighttracepassed(start, end, 0, self, targetent)) {
                yaw = vectortoyaw(end - start);
                self botsetscriptgoalnode(nnode, "critical", yaw);
                bot_waittill_goal_or_fail(3);
                return;
            }
            wait 0.05;
        }
    }
}

