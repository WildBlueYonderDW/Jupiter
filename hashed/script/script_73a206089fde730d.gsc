// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\values.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_43971bbeefd98f05;
#using script_41387eecc35b88bf;
#using script_220d0eb95a8fab7d;
#using script_7956d56c4922bd1;
#using script_185660037b9236c1;
#using script_4fdefae8b7bcdf73;
#using script_5753ba9c28794a65;
#using script_3ab210ea917601e7;
#using script_6617e2f2bb62b52b;
#using script_1845b8a2edf19262;
#using script_638d701d263ee1ed;
#using script_d60e0219a7419e0;
#using script_9880b9dc28bc25e;
#using script_22f1701e151b9d12;
#using scripts\mp\ai_behavior.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\common\devgui.gsc;

#namespace namespace_62da3d9355108eea;

// Namespace namespace_62da3d9355108eea / namespace_4120027c8b7ee069
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f5
// Size: 0x135
function function_97386f131cccf1e6() {
    level.safecrack = spawnstruct();
    level.safecrack.revealradius = getdvarint(@"hash_de0487f3e5f484a3", 24000);
    level.safecrack.hideicons = getdvarint(@"hash_3cf3f91f9a2e76d8", 1);
    level.safecrack.enabledefenders = getdvarint(@"hash_d69ece7d8e88eaad", 1);
    level.safecrack.attractzombies = getdvarint(@"hash_134e75ab81aab7de", 1);
    level.safecrack.revealradiussq = squared(level.safecrack.revealradius);
    namespace_4a32b5725832011a::function_77a37b3f4896fc9b();
    /#
        level thread function_5f76fcafb2d10aa2();
        level thread function_cadf35090e17590();
    #/
    function_89384091f7a2dbd("REV_OB_SAFECRACK", 0, &function_c6335e6b5148073c);
    function_89384091f7a2dbd("REV_OB_SAFECRACK", 1, &function_bdfe768bd3eed7fc);
    function_89384091f7a2dbd("REV_OB_SAFECRACK", 2, &function_ed260c1f4a6de9f8);
    function_89384091f7a2dbd("REV_OB_SAFECRACK", 3, &function_f0f250986bb9d773);
}

// Namespace namespace_62da3d9355108eea / namespace_4120027c8b7ee069
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x431
// Size: 0x557
function function_c6335e6b5148073c() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    self.variant_definition = function_4188e118731a30f4();
    self.variant_settings = function_b9c4aa88ad97ee68(self);
    self.capture_radius = default_to(self.variant_settings.captureradius, 150);
    self.attract_radius = default_to(self.variant_settings.attractradius, 2048);
    self.lose_progress = default_to(self.variant_settings.var_bbb79d5c4f2a37d0, 1);
    self.encounter_bundle = default_to(self.variant_settings.encounter, "jup_ob_safecrack_encounter");
    var_76903f9b275f23d4 = getstruct(self.varianttag, "target");
    /#
        assertex(isdefined(var_76903f9b275f23d4), "A safecrack activity instance must have a script_struct for the safe spawn with its 'target' KVP set to the variant tag:" + self.varianttag);
    #/
    self.origin = var_76903f9b275f23d4.origin;
    self.angles = var_76903f9b275f23d4.angles;
    self.poi = var_76903f9b275f23d4.poi;
    self.region_difficulty = namespace_4df2ab39b0e96ec7::function_4d8bb2d866771a10(self.origin);
    switch (self.region_difficulty) {
    default:
        self.region_difficulty = "difficulty_easy";
    case #"hash_7bb2cd766703d463":
        self.capture_time = default_to(self.variant_settings.var_7d62d3a3e7495df8.capturetime, 75);
        self.var_48c4ba670a4f33fc = default_to(self.variant_settings.var_7d62d3a3e7495df8.lootlist, "ob_jup_items_activity_safecrack_green");
        break;
    case #"hash_af83e47edfa8900a":
        self.capture_time = default_to(self.variant_settings.var_470d2e794702714d.capturetime, 75);
        self.var_48c4ba670a4f33fc = default_to(self.variant_settings.var_470d2e794702714d.lootlist, "ob_jup_items_activity_safecrack_green");
        break;
    case #"hash_5343b465e56ec9a4":
        self.capture_time = default_to(self.variant_settings.var_a9c21290ef4bfa93.capturetime, 75);
        self.var_48c4ba670a4f33fc = default_to(self.variant_settings.var_a9c21290ef4bfa93.lootlist, "ob_jup_items_activity_safecrack_green");
        break;
    case #"hash_651f76c0ad6741ec":
        self.capture_time = default_to(self.variant_settings.var_eabd5412051ca0b8.capturetime, 75);
        self.var_48c4ba670a4f33fc = default_to(self.variant_settings.var_eabd5412051ca0b8.lootlist, "ob_jup_items_activity_safecrack_green");
        break;
    }
    self.capture_radius = getdvarint(hashcat(@"hash_f72308758abea239", self.varianttag), self.capture_radius);
    self.attract_radius = getdvarint(hashcat(@"hash_c4827b6b41a3159e", self.varianttag), self.attract_radius);
    self.lose_progress = getdvarint(hashcat(@"hash_406af6bb3dff6667", self.varianttag), self.lose_progress);
    self.capture_time = getdvarint(hashcat(@"hash_4795d743464e3550", self.varianttag), self.capture_time);
    self.var_48c4ba670a4f33fc = getdvar(hashcat(@"hash_66f7a80db137f8e9", self.varianttag), self.var_48c4ba670a4f33fc);
    self.encounter_bundle = getdvar(hashcat(@"hash_1c069aa79535cca4", self.varianttag), self.encounter_bundle);
    self.capture_time = float(self.capture_time);
    self.var_82fe1c44f0e59dd5 = squared(self.capture_radius);
    self.var_287c8f447c48c9aa = squared(self.attract_radius);
    self.var_614385c59920cb82 = 5;
    self.var_999c4a8370c90a74 = &function_99b95e1bcf411ecd;
    self.var_f6bc8fb4bf53a955 = &function_2ffbd407e258b1f4;
    self.safeunlocked = &function_10ff236142531478;
    self.safe = namespace_4a32b5725832011a::function_12920ead9cafd0e1(self.origin, self.angles);
    if (level.safecrack.enabledefenders) {
        self.safe thread function_74717c53a1ed7f5();
    }
    if (!isdefined(level.safes)) {
        level.safes = [];
    }
    level.safes[level.safes.size] = self.safe;
    self.safe waittill("safe_unlocking");
    function_b6fc2c96b463c007(self);
}

// Namespace namespace_62da3d9355108eea / namespace_4120027c8b7ee069
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x98f
// Size: 0x2b
function function_bdfe768bd3eed7fc() {
    self endon("activity_ended");
    self endon("instance_destroyed");
    self.safe waittill("safe_looted");
    endactivity(self, 1);
}

// Namespace namespace_62da3d9355108eea / namespace_4120027c8b7ee069
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c1
// Size: 0x36
function function_ed260c1f4a6de9f8(activity_succeeded) {
    self endon("instance_destroyed");
    namespace_40713433c91dd86c::function_c402ecda1e84ba27(self.var_6c29f2fdb0054bbe, 0, self.difficulty_region, self.origin);
}

// Namespace namespace_62da3d9355108eea / namespace_4120027c8b7ee069
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9fe
// Size: 0xa
function function_f0f250986bb9d773() {
    self endon("instance_destroyed");
}

// Namespace namespace_62da3d9355108eea / namespace_4120027c8b7ee069
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xa0f
// Size: 0x8a
function function_58ab5bffacda35c3(safe, part, state, player) {
    if (level.safecrack.attractzombies) {
        safe.zombie_attractor = namespace_5381a59d140f4df8::add_attractor({origin:safe.origin, safe:safe}, 1, safe.activity.attract_radius, 0, undefined, &function_7d06997663e2b19f, 0);
    }
}

// Namespace namespace_62da3d9355108eea / namespace_4120027c8b7ee069
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaa0
// Size: 0xad
function function_74717c53a1ed7f5() {
    self.agents = [];
    self.encounterid = namespace_614554f86e52695c::spawn_request("ai_encounter:" + self.activity.encounter_bundle, self.origin, 1024, 1, 1, 0);
    if (isdefined(self.encounterid)) {
        function_d37068aac7785c04(self.encounterid, self.activity.region_difficulty, 1);
        namespace_614554f86e52695c::function_e4a67fe4ddca7ed5(self.encounterid, &function_111b3e11bf99b915, [self]);
        namespace_614554f86e52695c::function_7a2920be35f4386(self.encounterid, &function_6d930ef0e465d1c6, [self]);
    }
}

// Namespace namespace_62da3d9355108eea / namespace_4120027c8b7ee069
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb54
// Size: 0xbc
function function_111b3e11bf99b915(requestid, userdata, agent, data) {
    agent endon("death");
    safe = userdata[0];
    if (isalive(agent)) {
        safe.agents[safe.agents.size] = agent;
        if (safe.agents.size <= 2) {
            childthread scripts/mp/ai_behavior::function_b11c1964f528574b(agent, 0);
        } else {
            childthread scripts/mp/ai_behavior::function_9bbf1713a14fa580(agent, 512, 256, safe.origin);
        }
        agent function_65cdab0fc78aba8f(safe.origin, safe.activity.capture_radius);
    }
}

// Namespace namespace_62da3d9355108eea / namespace_4120027c8b7ee069
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc17
// Size: 0x5c
function function_6d930ef0e465d1c6(requestid, userdata, wavenumber) {
    safe = userdata[0];
    if (!istrue(safe.reinforcementscalled) && istrue(safe.shouldreinforce)) {
        safe.reinforcementscalled = 1;
        return true;
    }
    return false;
}

// Namespace namespace_62da3d9355108eea / namespace_4120027c8b7ee069
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc7b
// Size: 0x62
function function_2ffbd407e258b1f4() {
    if (level.safecrack.attractzombies) {
        self.zombie_attractor = namespace_5381a59d140f4df8::add_attractor({origin:self.origin, safe:self}, 1, self.activity.attract_radius, 0, undefined, &function_7d06997663e2b19f, 0);
    }
}

// Namespace namespace_62da3d9355108eea / namespace_4120027c8b7ee069
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xce4
// Size: 0x38
function function_10ff236142531478() {
    function_2169641d6a403864(self.encounterid);
    if (level.safecrack.attractzombies) {
        namespace_5381a59d140f4df8::remove_attractor(self.zombie_attractor);
    }
}

// Namespace namespace_62da3d9355108eea / namespace_4120027c8b7ee069
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd23
// Size: 0x11a
function function_99b95e1bcf411ecd() {
    agents = scripts/mp/utility/entity::function_d9ce8fb00f0e5fa1(self.origin, self.activity.attract_radius, "team_hundred_ninety");
    attracted = [];
    foreach (agent in agents) {
        if (!isplayer(agent)) {
            attracted[attracted.size] = agent;
        }
    }
    agents = attracted;
    foreach (agent in agents) {
        agent thread scripts/mp/ai_behavior::function_a5117518725da028(agent, self.origin, 128, 64, undefined, 1, agents, 0);
        agent ent_flag_init("activity_safe_attracted");
    }
    self.agents = array_combine_unique(self.agents, agents);
}

// Namespace namespace_62da3d9355108eea / namespace_4120027c8b7ee069
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe44
// Size: 0xb7
function function_7d06997663e2b19f(attractor, zombie) {
    safe = attractor.source.safe;
    if (is_equal(zombie.aicategory, "normal") && distance(zombie.origin, safe.origin) > safe.activity.capture_radius / 2) {
        if (zombie.team == "team_two_hundred") {
            safe.agents[safe.agents.size] = zombie;
            return true;
        }
    }
    return false;
}

// Namespace namespace_62da3d9355108eea / namespace_4120027c8b7ee069
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf03
// Size: 0xb9
function function_e34b2762fa082dcc(player) {
    wait(4);
    player thread scripts/mp/hud_message::showsplash("safecrack_revealed", undefined, undefined, undefined, 1, "splash_list_jup_ob");
    foreach (safe in level.safes) {
        if (distance2dsquared(safe.origin, player.origin) <= level.safecrack.revealradiussq) {
            scripts/mp/objidpoolmanager::objective_playermask_addshowplayer(safe.objidnum, player);
        }
    }
}

// Namespace namespace_62da3d9355108eea / namespace_4120027c8b7ee069
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xfc3
// Size: 0xd6
function private function_5f76fcafb2d10aa2() {
    /#
        scripts/common/devgui::function_6e7290c8ee4f558b("<unknown string>");
        scripts/common/devgui::function_b2159fbbd7ac094e("<unknown string>", @"hash_e0bb32a9a7b2f71d");
        scripts/common/devgui::function_b2159fbbd7ac094e("<unknown string>", @"hash_4f2cd88d61f31a05");
        scripts/common/devgui::function_b2159fbbd7ac094e("<unknown string>", @"hash_7bba049efb029baa");
        scripts/common/devgui::function_b2159fbbd7ac094e("<unknown string>", @"hash_3ec6799528b8c3a3");
        scripts/common/devgui::function_b2159fbbd7ac094e("<unknown string>", @"hash_e80ff5758ab695aa");
        scripts/common/devgui::function_b2159fbbd7ac094e("<unknown string>", @"hash_ecc9f2ec79830d8");
        scripts/common/devgui::function_b2159fbbd7ac094e("<unknown string>", @"hash_3cf803c8fb8e7b16");
        scripts/common/devgui::function_b2159fbbd7ac094e("<unknown string>", @"hash_95bcb70ae8cbe4cf");
        scripts/common/devgui::function_b2159fbbd7ac094e("<unknown string>", @"hash_1902f346336c9d19");
        scripts/common/devgui::function_fe953f000498048f();
    #/
}

// Namespace namespace_62da3d9355108eea / namespace_4120027c8b7ee069
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x10a0
// Size: 0x63e
function private function_cadf35090e17590() {
    /#
        timer = 0;
        var_fd5a08e385a75f6c = 10;
        while (true) {
            if (!isdefined(level.safes) || !isdefined(level.players)) {
                wait(5);
                continue;
            }
            if (getdvarint(@"hash_e0bb32a9a7b2f71d", 0)) {
                setdvar(@"hash_e0bb32a9a7b2f71d", 0);
                foreach (player in level.players) {
                    thread function_e34b2762fa082dcc(player);
                }
            }
            if (getdvarint(@"hash_4f2cd88d61f31a05", 0)) {
                setdvar(@"hash_4f2cd88d61f31a05", 0);
                foreach (safe in level.safes) {
                    foreach (player in level.players) {
                        scripts/mp/objidpoolmanager::objective_playermask_addshowplayer(safe.objidnum, player);
                    }
                }
            }
            if (getdvarint(@"hash_7bba049efb029baa", 0)) {
                foreach (safe in level.safes) {
                    function_32d74f3fc1994781(safe, var_fd5a08e385a75f6c);
                    function_bc558b6c272c65e4(safe, var_fd5a08e385a75f6c);
                    function_1071c808c36a9066(safe, var_fd5a08e385a75f6c);
                }
            }
            if (getdvarint(@"hash_3ec6799528b8c3a3", 0) && timer == 0) {
                foreach (safe in level.safes) {
                    function_32d74f3fc1994781(safe, var_fd5a08e385a75f6c);
                }
            }
            if (getdvarint(@"hash_e80ff5758ab695aa", 0) && timer == 0) {
                foreach (safe in level.safes) {
                    function_bc558b6c272c65e4(safe, var_fd5a08e385a75f6c);
                }
            }
            if (getdvarint(@"hash_ecc9f2ec79830d8", 0) && timer == 0) {
                foreach (safe in level.safes) {
                    function_1071c808c36a9066(safe, var_fd5a08e385a75f6c);
                }
            }
            if (getdvarint(@"hash_3cf803c8fb8e7b16", 0)) {
                setdvar(@"hash_3cf803c8fb8e7b16", 0);
                safe_found = 0;
                foreach (player in level.players) {
                    sorted_safes = sortbydistance(level.safes, player.origin);
                    foreach (safe in sorted_safes) {
                        if (!isdefined(safe.progress)) {
                            safe function_d5622642498f5a6f(player);
                            safe_found = 1;
                            break;
                        }
                    }
                }
                if (!safe_found) {
                    iprintln("<unknown string>");
                }
            }
            if (getdvarint(@"hash_95bcb70ae8cbe4cf", 0)) {
                setdvar(@"hash_95bcb70ae8cbe4cf", 0);
                safe_found = 0;
                foreach (player in level.players) {
                    sorted_safes = sortbydistance(level.safes, player.origin);
                    foreach (safe in sorted_safes) {
                        if (isdefined(safe.progress) && !istrue(safe.unlocked)) {
                            safe function_8048ff4bc7646aa();
                            safe_found = 1;
                            break;
                        }
                    }
                }
                if (!safe_found) {
                    iprintln("<unknown string>");
                }
            }
            if (getdvarint(@"hash_1902f346336c9d19", 0)) {
                setdvar(@"hash_1902f346336c9d19", 0);
                safe_found = 0;
                foreach (player in level.players) {
                    sorted_safes = sortbydistance(level.safes, player.origin);
                    foreach (safe in sorted_safes) {
                        if (istrue(safe.unlocked)) {
                            safe function_a7c6874cd9ee87de();
                            safe_found = 1;
                            break;
                        }
                    }
                }
                if (!safe_found) {
                    iprintln("<unknown string>");
                }
            }
            waitframe();
            timer++;
            if (timer >= var_fd5a08e385a75f6c) {
                timer = 0;
            }
        }
    #/
}

// Namespace namespace_62da3d9355108eea / namespace_4120027c8b7ee069
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x16e5
// Size: 0x52
function function_32d74f3fc1994781(safe, var_fd5a08e385a75f6c) {
    /#
        line(safe.origin, safe.origin + (0, 0, 3000), (1, 0, 1), 1, 0, var_fd5a08e385a75f6c);
    #/
}

// Namespace namespace_62da3d9355108eea / namespace_4120027c8b7ee069
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x173e
// Size: 0x4a
function function_bc558b6c272c65e4(safe, var_fd5a08e385a75f6c) {
    /#
        orientedbox(safe scriptablegetmidpoint(), 2 * function_abf76cc289cf03a3("<unknown string>"), safe.angles, (1, 1, 1), 0, var_fd5a08e385a75f6c);
    #/
}

// Namespace namespace_62da3d9355108eea / namespace_4120027c8b7ee069
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x178f
// Size: 0x81
function function_1071c808c36a9066(safe, var_fd5a08e385a75f6c) {
    /#
        sphere(safe.origin, safe.activity.capture_radius, (0, 1, 0), 0, var_fd5a08e385a75f6c);
        sphere(safe.origin, safe.activity.attract_radius, (1, 1, 0), 0, var_fd5a08e385a75f6c);
    #/
}

// Namespace namespace_62da3d9355108eea / namespace_4120027c8b7ee069
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1817
// Size: 0x24
function function_d5622642498f5a6f(player) {
    /#
        level thread function_58ab5bffacda35c3(self, "<unknown string>", "<unknown string>", player);
    #/
}

// Namespace namespace_62da3d9355108eea / namespace_4120027c8b7ee069
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1842
// Size: 0x22
function function_8048ff4bc7646aa() {
    /#
        self.progress = self.activity.capture_time;
    #/
}

// Namespace namespace_62da3d9355108eea / namespace_4120027c8b7ee069
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x186b
// Size: 0x37
function function_a7c6874cd9ee87de() {
    /#
        self.contents = [];
        self.weaponslotcontents = undefined;
        common_cache::function_d71a41afca697376(self, self.activity.var_48c4ba670a4f33fc, 5);
    #/
}

