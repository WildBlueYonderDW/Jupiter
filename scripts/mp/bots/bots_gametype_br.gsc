// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\bots\bots_util.gsc;
#using scripts\mp\bots\bots_strategy.gsc;
#using script_3d2770dc09c1243;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_40e63dd222434655;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\bots\bots_personality.gsc;
#using scripts\mp\gametypes\br_c130.gsc;

#namespace namespace_b40b231ccd66de93;

// Namespace namespace_b40b231ccd66de93/namespace_a36a697bb5de283b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x368
// Size: 0x90
function main() {
    if (namespace_ef54497d29a56093::function_5a60778277d6ae4b()) {
        namespace_ef54497d29a56093::initialize();
    } else if (namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73()) {
        if (isdefined(level.var_7d43ccdc62f43db3)) {
            [[ level.var_7d43ccdc62f43db3 ]]();
        }
    } else if (namespace_36f464722d326bbe::function_6493ec89ae923684()) {
        namespace_bc2665cbe6cf4e1f::function_5865e18adb02de38();
        [[ level.var_7d43ccdc62f43db3 ]]();
    } else if (namespace_cd0b2d039510b38d::getsubgametype() == "plunder" && namespace_d3d40f75bb4e4c32::isdmzbotpracticematch()) {
        [[ level.dmz_bot_callback_func ]]();
    } else {
        setup_callbacks();
        setup_bot_br();
    }
}

// Namespace namespace_b40b231ccd66de93/namespace_a36a697bb5de283b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ff
// Size: 0x6
function function_e45e46b7c35deadb() {
    /#
    #/
}

// Namespace namespace_b40b231ccd66de93/namespace_a36a697bb5de283b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40c
// Size: 0x2d
function setup_callbacks() {
    level.bot_funcs["player_spawned_gamemode"] = &function_543a0a3113ff89f7;
    level.bot_funcs["gametype_think"] = &bot_br_think;
}

// Namespace namespace_b40b231ccd66de93/namespace_a36a697bb5de283b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x440
// Size: 0x17
function setup_bot_br() {
    setdvarifuninitialized(@"hash_6ea9d854913f0e36", 0.25);
}

// Namespace namespace_b40b231ccd66de93/namespace_a36a697bb5de283b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45e
// Size: 0x11
function function_543a0a3113ff89f7() {
    self botsetflag("ignore_nodes", 1);
}

// Namespace namespace_b40b231ccd66de93/namespace_a36a697bb5de283b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x476
// Size: 0x3de
function bot_br_think() {
    self notify("bot_br_think");
    self endon("bot_br_think");
    self endon("death_or_disconnect");
    level endon("game_ended");
    var_7da10f5ca0899c16 = randomfloat(1) < getdvarfloat(@"hash_6ea9d854913f0e36", 0);
    thread ammo_manager();
    while (1) {
        /#
            if (getdvarint(@"hash_c2de8ca6dc8512c1") || self.sessionstate == "none") {
                wait(0.05);
                continue;
            }
        #/
        if (namespace_d3d40f75bb4e4c32::isBrPracticeMode() && !namespace_4b0406965e556711::gameflag("graceperiod_done")) {
            self.ignoreall = 0;
            wait(0.05);
            continue;
        }
        if (isdefined(self.br_infil_type)) {
            if (namespace_d3d40f75bb4e4c32::isBrPracticeMode() && !isdefined(self.infil_complete)) {
                self.ignoreall = 1;
                self botclearscriptgoal();
            }
            self botsetflag("disable_all_ai", 1);
            if ((namespace_d3d40f75bb4e4c32::isplayerbrsquadleader() || var_7da10f5ca0899c16) && istrue(level.c130inbounds)) {
                var_4fa3d43b222d0428 = function_a4091ef2be7e55b0();
                wait(var_4fa3d43b222d0428);
                if (namespace_d3d40f75bb4e4c32::isplayerbrsquadleader()) {
                    self notify("halo_jump_c130");
                } else {
                    self notify("halo_jump_solo_c130");
                }
                self.gulaguses = 1;
                if (getdvarint(@"hash_3ff738f6200e3a65", 1) > 0) {
                    self.gulaguses = 0;
                }
                self.jumped = 1;
                while (isdefined(self.br_infil_type)) {
                    wait(0.05);
                }
            }
            wait(0.05);
            continue;
        }
        if (namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
            thread bot_gulag_think();
            self waittill("gulag_end");
            wait(3);
        } else {
            self botclearscriptenemy();
        }
        if (isdefined(level.br_circle) && isnavmeshloaded()) {
            var_4cbd8ae83804749c = undefined;
            var_f8cd7c50ce12c857 = self bothasscriptgoal();
            if (var_f8cd7c50ce12c857) {
                var_4cbd8ae83804749c = self botgetscriptgoal();
            }
            if (!bot_has_tactical_goal() && !bot_is_remote_or_linked()) {
                if ((istrue(self isskydiving()) || istrue(self isparachuting())) && istrue(self.jumped) && istrue(namespace_d3d40f75bb4e4c32::isBrPracticeMode())) {
                    self botsetflag("disable_all_ai", 0);
                    self botclearscriptgoal();
                    bot_parachute_into_map();
                }
                if (namespace_d3d40f75bb4e4c32::isBrPracticeMode() && !isdefined(self.infil_complete)) {
                    self.ignoreall = 1;
                    wait(1);
                    continue;
                }
                var_1c7c7a4edf52593f = self botpathexists();
                needs_new_goal = !var_f8cd7c50ce12c857 || !var_1c7c7a4edf52593f || !namespace_c5622898120e827f::ispointincurrentsafecircle(var_4cbd8ae83804749c);
                if (var_f8cd7c50ce12c857) {
                    distsq = distancesquared(self.origin, var_4cbd8ae83804749c);
                    goalradius = self botgetscriptgoalradius();
                    var_531b6f0c0441a69 = distsq < goalradius * goalradius;
                    if (!var_531b6f0c0441a69) {
                        self.lasttimereachedscriptgoal = undefined;
                    } else if (!isdefined(self.lasttimereachedscriptgoal)) {
                        self.lasttimereachedscriptgoal = gettime();
                    }
                }
                var_7268d1b7d5e3bcdf = level.bot_personality_type[self.personality] == "stationary";
                if (isdefined(self.lasttimereachedscriptgoal)) {
                    var_1f511711d810114a = 0;
                    if (var_7268d1b7d5e3bcdf) {
                        var_1f511711d810114a = 20000;
                    }
                    needs_new_goal = needs_new_goal || gettime() - self.lasttimereachedscriptgoal >= var_1f511711d810114a;
                }
                if (needs_new_goal) {
                    random_point = namespace_c5622898120e827f::getrandompointincurrentcircle();
                    var_5d3fe0fc4ce4a392 = self getclosestreachablepointonnavmesh(random_point);
                    if (isdefined(var_5d3fe0fc4ce4a392)) {
                        self botsetscriptgoal(var_5d3fe0fc4ce4a392, 1024, "hunt", undefined, undefined, !var_7268d1b7d5e3bcdf);
                        self.lasttimereachedscriptgoal = gettime();
                    }
                }
            }
        } else {
            namespace_a89b0064fb8d2078::update_personality_default();
        }
        wait(0.05);
    }
}

// Namespace namespace_b40b231ccd66de93/namespace_a36a697bb5de283b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x85b
// Size: 0x1d4
function function_a4091ef2be7e55b0() {
    var_293fbe5226705d6f = level.br_ac130.origin;
    var_11b7e7d7f8fb6a6d = vectornormalize(level.infilstruct.c130pathstruct.endpt - var_293fbe5226705d6f);
    var_b4af06317fcb3871 = (level.br_level.br_mapbounds[0][0] - var_293fbe5226705d6f[0]) / var_11b7e7d7f8fb6a6d[0];
    var_b4d218317ff1a7bf = (level.br_level.br_mapbounds[0][1] - var_293fbe5226705d6f[0]) / var_11b7e7d7f8fb6a6d[0];
    var_e659401cd955f3d8 = (level.br_level.br_mapbounds[0][1] - var_293fbe5226705d6f[1]) / var_11b7e7d7f8fb6a6d[1];
    var_e67c561cd97c6bf2 = (level.br_level.br_mapbounds[1][1] - var_293fbe5226705d6f[1]) / var_11b7e7d7f8fb6a6d[1];
    var_dd109c4f8bcc9684 = [0:var_b4af06317fcb3871, 1:var_b4d218317ff1a7bf, 2:var_e659401cd955f3d8, 3:var_e67c561cd97c6bf2];
    var_858f6ee61ae10b78 = -1;
    foreach (var_820ffebf5ea17ef1 in var_dd109c4f8bcc9684) {
        if (var_820ffebf5ea17ef1 > 0) {
            if (var_858f6ee61ae10b78 < 0 || var_820ffebf5ea17ef1 < var_858f6ee61ae10b78) {
                var_858f6ee61ae10b78 = var_820ffebf5ea17ef1;
            }
        }
    }
    var_544e266d9bc7fbc2 = var_293fbe5226705d6f + var_11b7e7d7f8fb6a6d * var_858f6ee61ae10b78;
    var_9f749890212a1229 = namespace_ad389306d44fc6b4::getc130speed();
    var_fdefbfd6d1c30ea6 = var_858f6ee61ae10b78 / var_9f749890212a1229;
    return randomfloatrange(0.1, 0.9) * var_fdefbfd6d1c30ea6;
}

// Namespace namespace_b40b231ccd66de93/namespace_a36a697bb5de283b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa37
// Size: 0x1d0
function bot_parachute_into_map() {
    self endon("death_or_disconnect");
    self.ignoreall = 1;
    self.desired_landing_spot = bot_get_landing_spot();
    /#
        if (getdvarint(@"hash_451b67b44f0ded25") > 0) {
            thread draw_debug_sphere();
        }
    #/
    var_5c8080b93191e9a4 = gettime() + randomfloatrange(5, 10) * 1000;
    var_ee69440f3c9f1e1 = 0;
    while (istrue(self isskydiving()) || istrue(self isparachuting())) {
        if (level.br_circle.circleindex > 0 && istrue(level.circleclosing) && !namespace_c5622898120e827f::ispointincurrentsafecircle(self.desired_landing_spot)) {
            self.desired_landing_spot = bot_get_landing_spot();
        }
        var_c23dd335ab7d9857 = bot_get_angles_to_goal(self, self.desired_landing_spot);
        speed = 1;
        var_26555d95dc188e56 = self.desired_landing_spot - self geteye();
        if (var_26555d95dc188e56[2] > 0 && vectordot(vectornormalize(var_26555d95dc188e56), (0, 0, 1)) > 0.939693) {
            self.desired_landing_spot = self.origin - (0, 0, 100);
        }
        self botlookatpoint(self.desired_landing_spot, 0.05, "script_forced");
        self botsetscriptmove(var_c23dd335ab7d9857[1], 0.05, speed);
        if (gettime() > var_5c8080b93191e9a4 && !var_ee69440f3c9f1e1) {
            self botpressbutton("jump", 1);
            var_ee69440f3c9f1e1 = 1;
        }
        wait(0.05);
    }
    self.infil_complete = 1;
    self botlookatpoint(undefined);
    self.ignoreall = 0;
    bot_go_to_destination();
}

// Namespace namespace_b40b231ccd66de93/namespace_a36a697bb5de283b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc0e
// Size: 0xd3
function bot_get_landing_spot(var_26ba07cc43e5f46) {
    if (!isdefined(level.free_landing_spots) || level.free_landing_spots.size < 1) {
        level.free_landing_spots = function_7580ae3d6694d93(level.bot_landing_spots);
        level.free_landing_spots = array_randomize(level.free_landing_spots);
    }
    if (isdefined(level.br_circle) && isnavmeshloaded()) {
        landing_spot = random(level.free_landing_spots);
        if (isdefined(landing_spot)) {
            random_point = landing_spot.origin;
            level.free_landing_spots = array_remove(level.free_landing_spots, landing_spot);
        } else {
            random_point = namespace_c5622898120e827f::getrandompointincurrentcircle();
        }
        return getclosestpointonnavmesh(random_point, self);
    }
    return undefined;
}

// Namespace namespace_b40b231ccd66de93/namespace_a36a697bb5de283b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xce9
// Size: 0x39
function function_7580ae3d6694d93(var_d845b94e50a75d37) {
    radius = namespace_c5622898120e827f::getdangercircleradius();
    origin = namespace_c5622898120e827f::getdangercircleorigin();
    return get_array_of_closest(origin, var_d845b94e50a75d37, undefined, undefined, radius);
}

// Namespace namespace_b40b231ccd66de93/namespace_a36a697bb5de283b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd2a
// Size: 0x37
function bot_get_angles_to_goal(bot, var_672f20a520d6c841) {
    var_2d1d4d719dbc9554 = vectornormalize(var_672f20a520d6c841 - bot.origin);
    return vectortoangles(var_2d1d4d719dbc9554);
}

// Namespace namespace_b40b231ccd66de93/namespace_a36a697bb5de283b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd69
// Size: 0x25
function bot_get_distance_to_goal(bot, var_672f20a520d6c841) {
    return distance(bot.origin, var_672f20a520d6c841);
}

// Namespace namespace_b40b231ccd66de93/namespace_a36a697bb5de283b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd96
// Size: 0x1c0
function bot_give_weapon() {
    if (!isdefined(level.bot_allowed_weapons)) {
        level.bot_allowed_weapons = [0:"iw8_sm_papa90_mp", 1:"iw8_sh_charlie725_mp", 2:"iw8_ar_akilo47_mp+acog", 3:"iw8_lm_mgolf34_mp", 4:"iw8_sn_kilo98_mp+scope", 5:"iw8_sm_beta_mp+reflexmini2", 6:"iw8_sm_augolf_mp+acog", 7:"iw8_sm_mpapa7_mp+acog", 8:"iw8_ar_falima_mp+reflexmini", 9:"iw8_ar_kilo433_mp+acog", 10:"iw8_ar_scharlie_mp+reflexmini2", 11:"iw8_lm_lima86_mp+acog"];
    }
    random_weapon = random(level.bot_allowed_weapons);
    switch (random_weapon) {
    case #"hash_f3248b9b1283bc96":
        if (!isdefined(level.bot_shotguns)) {
            level.bot_shotguns = 0;
        }
        level.bot_shotguns++;
        if (level.bot_shotguns >= 1) {
            level.bot_allowed_weapons = array_remove(level.bot_allowed_weapons, "iw8_sh_charlie725_mp");
        }
        break;
    case #"hash_8f2294a118c6d741":
        if (!isdefined(level.bot_snipers)) {
            level.bot_snipers = 0;
        }
        level.bot_snipers++;
        if (level.bot_snipers >= 1) {
            level.bot_allowed_weapons = array_remove(level.bot_allowed_weapons, "iw8_sn_kilo98_mp+scope");
        }
        break;
    }
    weapon_obj = [[ level.fnbuildweapon ]]([[ level.fngetweaponrootname ]](random_weapon), [], "none", "none", -1);
    self giveweapon(weapon_obj);
    self setweaponammoclip(weapon_obj, weaponclipsize(weapon_obj));
    self setweaponammostock(weapon_obj, weaponclipsize(weapon_obj));
    self switchtoweapon("none");
}

// Namespace namespace_b40b231ccd66de93/namespace_a36a697bb5de283b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf5d
// Size: 0xcb
function bot_go_to_destination() {
    self switchtoweapon("none");
    destination = get_destination_in_current_circle();
    if (!isdefined(destination)) {
        destination = spawnstruct();
        destination.origin = getrandompointinsafecirclenearby();
    }
    destination.claimed = 1;
    var_7268d1b7d5e3bcdf = level.bot_personality_type[self.personality] == "stationary";
    self botsetscriptgoal(self getclosestreachablepointonnavmesh(destination.origin), 256, "guard", undefined, undefined, !var_7268d1b7d5e3bcdf);
    waittill_any_2("goal", "last_stand_start");
    destination.claimed = undefined;
    if (!istrue(self.inlaststand)) {
        bot_give_weapon();
    }
    bot_br_circle_think();
}

// Namespace namespace_b40b231ccd66de93/namespace_a36a697bb5de283b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x102f
// Size: 0x4f
function get_destination_in_current_circle() {
    destinations = function_7580ae3d6694d93(level.bot_destination_spots);
    destinations = sortbydistance(destinations, self.origin);
    destination = get_closest_unclaimed_destination(destinations);
    if (!isdefined(destination)) {
        destination = get_closest_destination(destinations);
    }
    return destination;
}

// Namespace namespace_b40b231ccd66de93/namespace_a36a697bb5de283b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1086
// Size: 0x63
function get_closest_unclaimed_destination(destinations) {
    foreach (destination in destinations) {
        if (!istrue(destination.claimed)) {
            return destination;
        }
    }
    return undefined;
}

// Namespace namespace_b40b231ccd66de93/namespace_a36a697bb5de283b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10f1
// Size: 0x1c
function get_closest_destination(destinations) {
    return getclosest(self.origin, destinations);
}

// Namespace namespace_b40b231ccd66de93/namespace_a36a697bb5de283b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1115
// Size: 0x3c
function draw_debug_sphere() {
    /#
        self endon("iw9_me_fists_mp");
        while (1) {
            sphere(self.desired_landing_spot, 128, (1, 1, 0), 0, 5);
            wait(0.05);
        }
    #/
}

// Namespace namespace_b40b231ccd66de93/namespace_a36a697bb5de283b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1158
// Size: 0x1e5
function bot_br_circle_think() {
    var_7268d1b7d5e3bcdf = level.bot_personality_type[self.personality] == "stationary";
    IN_GAS = 0;
    while (1) {
        var_6b81b7b2626279ec = getrandompointincirclenearby();
        IN_GAS = bot_is_in_gas() || istrue(level.circleclosing);
        if (IN_GAS) {
            var_6b81b7b2626279ec = getrandompointinsafecirclenearby();
        }
        if (isdefined(var_6b81b7b2626279ec)) {
            player_enemy = bot_get_player_enemy();
            if (istrue(level.bots_seek_player) && isdefined(player_enemy) && !IN_GAS) {
                thread update_player_enemy_on_death();
                self getenemyinfo(player_enemy);
                if (self botgetpersonality() != "run_and_gun") {
                    bot_set_personality("run_and_gun");
                }
                if (self bothasscriptgoal()) {
                    self botclearscriptgoal();
                }
                if (!bot_has_player_enemy()) {
                    function_e858f82b38107a7c(player_enemy);
                }
            } else {
                function_6465d473e19215e3();
                if (self bothasscriptgoal()) {
                    self botclearscriptgoal();
                }
                if (IN_GAS) {
                    self botsetscriptgoal(var_6b81b7b2626279ec, 128, "critical", undefined, undefined, 0);
                } else {
                    self botsetscriptgoal(var_6b81b7b2626279ec, 400, "guard", undefined, undefined, 0);
                }
                if (istrue(IN_GAS)) {
                    IN_GAS = 0;
                }
                thread path_timeout();
                result = waittill_any_ents_return(self, "goal", self, "bad_path", level, "br_circle_started", self, "last_stand_start", self, "path_timeout");
                if (isdefined(result) && result != "bad_path" && result != "br_circle_started" && result != "path_timeout" && result != "last_stand_start") {
                    timetowait = gettime() + randomintrange(3, 8) * 1000;
                    while (gettime() < timetowait) {
                        if (bot_is_in_gas()) {
                            function_6465d473e19215e3();
                            break;
                        }
                        wait(0.1);
                    }
                }
            }
        }
        wait(1);
    }
}

// Namespace namespace_b40b231ccd66de93/namespace_a36a697bb5de283b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1344
// Size: 0x31
function path_timeout() {
    self endon("last_stand_start");
    level endon("game_ended");
    self endon("goal");
    self endon("bad_path");
    level endon("br_circle_started");
    wait(15);
    self notify("path_timeout");
}

// Namespace namespace_b40b231ccd66de93/namespace_a36a697bb5de283b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x137c
// Size: 0x1f7
function bot_gulag_think() {
    self endon("death_or_disconnect");
    self endon("gulag_end");
    level endon("game_ended");
    var_7268d1b7d5e3bcdf = level.bot_personality_type[self.personality] == "stationary";
    function_6465d473e19215e3(1);
    self.ignoreme = 1;
    self.ignoreall = 1;
    self botclearscriptgoal();
    while (!istrue(self.gulagarena)) {
        wait(1);
    }
    self.ignoreme = 0;
    self.ignoreall = 0;
    bot_set_personality("run_and_gun");
    while (1) {
        arena = self.arena;
        if (isdefined(arena)) {
            foreach (player in arena.arenaplayers) {
                if (player == self) {
                    continue;
                }
                if (istrue(arena.overtime) && isdefined(arena.dom) && isdefined(arena.dom.arenaflag) && isdefined(arena.dom.arenaflag.flagmodel)) {
                    self botsetscriptgoal(arena.dom.arenaflag.flagmodel.origin, 64, "objective");
                    self botclearscriptenemy();
                } else {
                    self getenemyinfo(player);
                    self botsetscriptgoal(self getclosestreachablepointonnavmesh(player.origin), 256, "guard");
                    if (self.team != player.team) {
                        self botsetscriptenemy(player);
                    }
                }
            }
        }
        wait(3);
    }
}

// Namespace namespace_b40b231ccd66de93/namespace_a36a697bb5de283b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x157a
// Size: 0xc9
function ammo_manager(isdisabled) {
    self endon("death_or_disconnect");
    while (1) {
        var_bc9da38a4bab4ce2 = self getweaponslistprimaries();
        if (var_bc9da38a4bab4ce2.size == 1 && var_bc9da38a4bab4ce2[0].basename == "iw9_me_fists_mp" || isdefined(isdisabled) && self [[ isdisabled ]]()) {
            wait(1);
            continue;
        }
        foreach (weapon in var_bc9da38a4bab4ce2) {
            if (self getweaponammostock(weapon) < weaponclipsize(weapon)) {
                self setweaponammostock(weapon, weaponclipsize(weapon));
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_b40b231ccd66de93/namespace_a36a697bb5de283b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x164a
// Size: 0x3e
function bot_get_player_enemy() {
    if (isdefined(level.player_enemy_cooldown) && gettime() <= level.player_enemy_cooldown) {
        return undefined;
    }
    player_enemy = get_player_enemy();
    if (!isdefined(player_enemy)) {
        return undefined;
    }
    return player_enemy;
}

// Namespace namespace_b40b231ccd66de93/namespace_a36a697bb5de283b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1690
// Size: 0x76
function bots_with_player_enemy() {
    count = 0;
    foreach (bot in level.players) {
        if (!isbot(bot)) {
            continue;
        }
        if (bot bot_has_player_enemy()) {
            count++;
        }
    }
    return count;
}

// Namespace namespace_b40b231ccd66de93/namespace_a36a697bb5de283b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x170e
// Size: 0x1e
function function_e858f82b38107a7c(enemy) {
    self.player_enemy = enemy;
    self botsetscriptenemy(enemy);
}

// Namespace namespace_b40b231ccd66de93/namespace_a36a697bb5de283b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1733
// Size: 0x2a
function function_6465d473e19215e3(var_c716028a11310807) {
    self.player_enemy = undefined;
    self botclearscriptenemy();
    if (!istrue(var_c716028a11310807)) {
        self notify("update_on_death");
    }
}

// Namespace namespace_b40b231ccd66de93/namespace_a36a697bb5de283b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1764
// Size: 0xd
function bot_has_player_enemy() {
    return isdefined(self.player_enemy);
}

// Namespace namespace_b40b231ccd66de93/namespace_a36a697bb5de283b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1779
// Size: 0xdc
function get_player_enemy() {
    player_enemy = get_player();
    var_41dc9e8631a11f9c = squared(3000);
    if (istrue(self.inlaststand) || namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
        return undefined;
    }
    if (!isdefined(player_enemy) || istrue(player_enemy.inlaststand) || !isalive(player_enemy) || player_enemy namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
        return undefined;
    }
    if (bot_is_in_gas()) {
        return undefined;
    }
    var_f39b75731ab66d7d = get_alive_bots();
    if (var_f39b75731ab66d7d >= 3) {
        if (distancesquared(player_enemy.origin, self.origin) > var_41dc9e8631a11f9c) {
            return undefined;
        }
        var_a7f6dd4c7bff569c = bots_with_player_enemy();
        if (bot_has_player_enemy()) {
            return player_enemy;
        }
        if (var_a7f6dd4c7bff569c >= 1) {
            return undefined;
        }
        return player_enemy;
    } else {
        return player_enemy;
    }
}

// Namespace namespace_b40b231ccd66de93/namespace_a36a697bb5de283b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x185c
// Size: 0x5b
function get_player() {
    foreach (player in level.players) {
        if (!isbot(player)) {
            return player;
        }
    }
}

// Namespace namespace_b40b231ccd66de93/namespace_a36a697bb5de283b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18be
// Size: 0x47
function update_player_enemy_on_death() {
    self notify("update_on_death");
    self endon("update_on_death");
    waittill_any_3("death", "death_or_disconnect", "last_stand_start");
    if (isdefined(self)) {
        function_6465d473e19215e3(1);
    }
    level.player_enemy_cooldown = gettime() + 7;
}

// Namespace namespace_b40b231ccd66de93/namespace_a36a697bb5de283b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x190c
// Size: 0x8e
function bot_is_in_gas() {
    if (!namespace_4b0406965e556711::gameflag("graceperiod_done")) {
        return 0;
    }
    circleorigin = namespace_c5622898120e827f::getdangercircleorigin();
    circleradius = namespace_c5622898120e827f::getdangercircleradius();
    if (istrue(level.circleclosing)) {
        circleorigin = namespace_c5622898120e827f::getsafecircleorigin();
        circleradius = namespace_c5622898120e827f::getsafecircleradius();
    }
    if (namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
        return 0;
    }
    if (!isalive(self) || self.sessionstate != "playing") {
        return 0;
    }
    return !ispointinsidecircle(self.origin, circleorigin, circleradius);
}

// Namespace namespace_b40b231ccd66de93/namespace_a36a697bb5de283b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x19a2
// Size: 0x7d
function getrandompointincirclewithindistance(maxdistance) {
    random_point = namespace_c5622898120e827f::getrandompointincurrentcircle();
    if (!isdefined(maxdistance)) {
        maxdistance = 1000;
    }
    if (distance2d(self.origin, random_point) > maxdistance) {
        dir = vectortoangles(random_point - self.origin);
        fwd = anglestoforward(dir);
        random_point = self.origin + fwd * maxdistance;
    }
    return self getclosestreachablepointonnavmesh(random_point);
}

// Namespace namespace_b40b231ccd66de93/namespace_a36a697bb5de283b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a27
// Size: 0x4d
function getrandompointinsafecirclenearby() {
    var_add4fd7502a75a8a = namespace_c5622898120e827f::getsafecircleorigin();
    dist = namespace_c5622898120e827f::getsafecircleradius();
    random_point = namespace_c5622898120e827f::getrandompointincircle(var_add4fd7502a75a8a, dist, 0.75, 0.9, 1, 1);
    return self getclosestreachablepointonnavmesh(random_point);
}

// Namespace namespace_b40b231ccd66de93/namespace_a36a697bb5de283b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a7c
// Size: 0x88
function getrandompointincirclenearby() {
    timeout = gettime() + 5000;
    while (gettime() < timeout) {
        point = namespace_c5622898120e827f::getrandompointincircle(self.origin, 750, 0.6, 1, 1, 1);
        var_3863887fed6f155 = self getclosestreachablepointonnavmesh(point);
        if (ispointincurrentcircle(var_3863887fed6f155)) {
            return var_3863887fed6f155;
        }
        wait(0.05);
    }
    random_point = namespace_c5622898120e827f::getrandompointincurrentcircle();
    return self getclosestreachablepointonnavmesh(random_point);
}

// Namespace namespace_b40b231ccd66de93/namespace_a36a697bb5de283b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b0c
// Size: 0x37
function ispointincurrentcircle(point) {
    circleorigin = namespace_c5622898120e827f::getdangercircleorigin();
    circleradius = namespace_c5622898120e827f::getdangercircleradius();
    return ispointinsidecircle(point, circleorigin, circleradius);
}

// Namespace namespace_b40b231ccd66de93/namespace_a36a697bb5de283b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b4b
// Size: 0x8c
function get_alive_bots() {
    var_f39b75731ab66d7d = 0;
    foreach (player in level.players) {
        if (!isbot(player) || !isalive(player) || player.sessionstate != "playing") {
            continue;
        }
        var_f39b75731ab66d7d++;
    }
    return var_f39b75731ab66d7d;
}

// Namespace namespace_b40b231ccd66de93/namespace_a36a697bb5de283b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1bdf
// Size: 0x41
function botisonplayerteam(player) {
    alive_players = level.teamdata[player.team]["alivePlayers"];
    if (array_contains(alive_players, self)) {
        return 1;
    }
    return 0;
}

