#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_64acb6ce534155b7;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\gametypes\br_weapons.gsc;
#using scripts\mp\gametypes\br_quest_util.gsc;
#using script_5762ac2f22202ba2;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using script_58f20490049af6ac;
#using scripts\common\devgui.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using script_4948cdf739393d2d;
#using scripts\common\values.gsc;
#using scripts\mp\ai_behavior.gsc;
#using scripts\common\debug.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_16ea1b94f0f381b3;
#using scripts\asm\shared\mp\utility.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\poi.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\asm\asm.gsc;
#using scripts\common\ai.gsc;
#using scripts\mp\utility\trigger.gsc;
#using scripts\cp_mp\gasmask.gsc;
#using script_7c40fa80892a721;
#using script_2d9d24f7c63ac143;
#using scripts\cp_mp\killstreaks\white_phosphorus.gsc;
#using scripts\common\vehicle.gsc;
#using scripts\common\powerups.gsc;
#using scripts\mp\equipment\decoy_grenade.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\engine\trace.gsc;

#namespace namespace_32e9b198f2c5f0d7;

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x1330
// Size: 0x18
function autoexec main() {
    utility::registersharedfunc("zombienest", "get_contract_data", &getcontractdata);
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1350
// Size: 0xdf
function getcontractdata(data) {
    function_68d77dfb2a1ed822();
    quest_init();
    data.funcs["onInit"] = &function_ad8fca4d9b728896;
    data.funcs["onTeamAssigned"] = &function_ebfec363bf53e486;
    data.funcs["onCancel"] = &function_37d55d69f07be56;
    data.funcs["onPlayerTearDown"] = &function_2fcaceec2fe03a0b;
    data.funcs["onPlayerAssimilated"] = &function_2f09930037714234;
    data.funcs["onPlayerDisconnect"] = &function_4e1e4a6b5320e6e4;
    data.funcs["onPlayerKilled"] = &function_bdff9369788219f7;
    data.var_2f8b14dbb63cc32a = getdvarfloat(@"hash_5b906c97e89d2ab7", 0);
    /#
        debug_init();
    #/
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1437
// Size: 0x33d
function function_68d77dfb2a1ed822() {
    team_size = game_utility::function_4fb37368ae3585bb();
    var_2cb3d2c4fce74721 = 3;
    if (team_size > 2) {
        var_2cb3d2c4fce74721 = 5;
    }
    level.var_de3cfce369a7d08f = {#var_2583679d5dd79218:[], #tablets_initialized:0, #loot_restricted:getdvarint(@"hash_62637c90e3bfdf39", 1), #var_de9144b3db577810:getdvarint(@"hash_1bec3867a2b201fc", 0), #var_147046baca64f322:getdvarint(@"hash_f9f299619d327dee", 2), #var_1fd2d389d7d1bc57:getdvarint(@"hash_5f124b02344eefcb", 1), #hellhound_tier:getdvarint(@"hash_6dca8b88b50276f5", 2), #var_ded465ae5000e22:getdvarint(@"hash_ebfd263ff1f329b6", 3), #var_91fb1860c884811f:getdvarint(@"hash_75834ab25e72255b", 4), #var_345c2d401a2d390b:getdvarint(@"hash_d90a063ace1b3c7f", 3), #var_c55617f6d9883a9b:getdvarint(@"hash_83569210c70fa9a7", 1), #num_crawlers:getdvarint(@"hash_fe4c18ebccbbb0e5", 1), #circle_radius:getdvarint(@"hash_e6d5f6cdb965d59", 750), #var_9849aa27e1b7f4f1:getdvarfloat(@"hash_2a66bb8081c9bca5", 1.6), #var_514691a3959d3432:getdvarfloat(@"hash_f2bc7feac5077b36", 3.6), #var_15d494fa46325346:getdvarint(@"hash_768d0bf76658e3a", var_2cb3d2c4fce74721), #var_c32336dbbd60b8d9:getdvarint(@"hash_690c32a4244d3ef5", 150), #var_46ace098313e8676:getdvarint(@"hash_30dbecb4fa0d55a2", 360), #footprint_buffer:getdvarint(@"hash_f26f2641d026279f", 2), #var_4f5e5f6b77e7df9c:getdvarint(@"hash_a9dd9389fb743f13", 1), #var_310519099b4e2f6e:getdvarint(@"hash_9c6b1988e4b3230a", 30), #time:getdvarint(@"hash_68cd46e539fa448c", 240), #enabled:getdvarint(@"hash_9e3454580b1b5e36", 0)};
    level.var_de3cfce369a7d08f.var_685e5c9a11350906 = level.var_de3cfce369a7d08f.var_15d494fa46325346 * level.var_de3cfce369a7d08f.var_c32336dbbd60b8d9;
    level.var_de3cfce369a7d08f.var_f8c730eecd8cb2ce = int(level.var_de3cfce369a7d08f.var_685e5c9a11350906 / 3);
    level.var_de3cfce369a7d08f.var_f8c72feecd8cb09b = int(level.var_de3cfce369a7d08f.var_f8c730eecd8cb2ce * 2);
    /#
        level.var_de3cfce369a7d08f.var_36977fbdb1c082ed = getdvarint(@"hash_831c4a6ec679c765", 0);
        level.var_de3cfce369a7d08f.var_b22c5e6755f6c29b = getdvarint(@"hash_2b377c67b83eb313", 0);
    #/
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x177c
// Size: 0x3b9
function quest_init() {
    if (!level.var_de3cfce369a7d08f.enabled) {
        return;
    }
    function_4d7f48287f0ebb9();
    utility::function_f3bb4f4911a1beb2("zombie_attractor", "init");
    level.var_de3cfce369a7d08f thread function_8edb31561e4db442();
    level.var_de3cfce369a7d08f.var_674ccca06e1c6205 = utility::getstructarray("zombienest_investigation_point", "script_noteworthy");
    foreach (nest in level.var_de3cfce369a7d08f.var_2583679d5dd79218) {
        targetname = nest.targetname;
        foreach (point in level.var_de3cfce369a7d08f.var_674ccca06e1c6205) {
            if (isdefined(point.target) && point.target == targetname) {
                point.nest = nest;
            }
        }
    }
    level._effect["zombie_footprint_right"] = loadfx("vfx/iw9_br/level/mp_jup_sm_island_2/vfx_zombienest_print_right.vfx");
    level._effect["zombie_footprint_left"] = loadfx("vfx/iw9_br/level/mp_jup_sm_island_2/vfx_zombienest_print_left.vfx");
    if (getdvarint(@"hash_6a647fc44191209d", 0) == 1) {
        level._effect["zombie_footprint_right"] = loadfx("vfx/jup/core/vfx_zombienest_print_right.vfx");
        level._effect["zombie_footprint_left"] = loadfx("vfx/jup/core/vfx_zombienest_print_left.vfx");
    }
    scriptable::scriptable_addusedcallbackbypart("zombienest_investigation_point_jup", &function_2d1327f6ce7982c0);
    scriptable::scriptable_adddamagedcallback(&function_c4b1f784c22038fe);
    scripts\mp\weapons::registerusedcallback("decoy_grenade", &function_a200944290c18eae);
    callback::add("player_laststand", &function_eb4fe8866f0936ea);
    callback::add("player_death", &function_eb4fe8866f0936ea);
    callback::add("player_revived", &function_6a619d1bed520646);
    callback::add("player_spawned", &function_6a619d1bed520646);
    function_be229415d666c835();
    /#
        if (level.var_de3cfce369a7d08f.var_36977fbdb1c082ed > 0) {
            foreach (point in level.var_de3cfce369a7d08f.var_674ccca06e1c6205) {
                point.scriptable = spawnscriptable("<dev string:x1c>", point.origin, point.angles);
                if (isdefined(point.targetname) && point.targetname == "<dev string:x3f>") {
                    point.scriptable.corpse_2 = 1;
                    point.scriptable setscriptablepartstate("<dev string:x1c>", "<dev string:x48>");
                } else {
                    point.scriptable setscriptablepartstate("<dev string:x1c>", "<dev string:x58>");
                }
                debug::debug_print3d(point.scriptable, "<dev string:x66>", undefined, undefined, undefined, undefined, undefined, undefined, 90);
            }
            level.var_de3cfce369a7d08f thread function_561ffdaca5b546d3();
        }
        setdvar(@"hash_b964c14b65456862", 0);
        setdvar(@"hash_3764f88c46b94cdf", 0);
        level.var_de3cfce369a7d08f thread function_4e34370c01cfc47b();
    #/
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b3d
// Size: 0xae
function function_4d7f48287f0ebb9() {
    assert(isdefined(game["<dev string:x6d>"]));
    game["dialog"]["mission_zombienest_accept"] = "zhco_grav_zmbh";
    game["dialog"]["mission_zombienest_success"] = "zhco_grav_zhcc";
    game["dialog"]["mission_zombienest_fail_time"] = "zhco_grav_zmcf";
    game["dialog"]["mission_zombienest_fail_gas"] = "zhco_grav_zmbg";
    game["dialog"]["mission_zombienest_fail_team"] = "zhco_grav_zmbp";
    game["dialog"]["mission_zombienest_timer"] = "zhco_grav_zmbc";
    game["dialog"]["mission_zombienest_nest"] = "zhco_grav_zmbn";
    game["dialog"]["mission_zombienest_nest_team"] = "zhco_grav_zmbw";
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bf3
// Size: 0x9f
function function_be229415d666c835() {
    if (isdefined(level.var_f721fc7d0d2d0f47)) {
        assertmsg("Region Difficulty Manager has already been initialized.");
        return;
    }
    level.var_f721fc7d0d2d0f47 = spawnstruct();
    level.starting_health = [];
    level.var_f721fc7d0d2d0f47.var_b9cd1d50a91eb69e = [];
    level.var_f721fc7d0d2d0f47.var_b9cd1d50a91eb69e["difficulty_easy"] = getdvarint(@"hash_bad65124142d0c9c", 3);
    level.var_f721fc7d0d2d0f47.var_b9cd1d50a91eb69e["difficulty_normal"] = getdvarint(@"hash_bad65424142d1335", 20);
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c9a
// Size: 0x1a3
function function_ad8fca4d9b728896() {
    if (!level.var_de3cfce369a7d08f.enabled) {
        return false;
    }
    init_limit = getdvarint(@"hash_f9e5d9bb7af4b6b1", -1);
    if (init_limit > -1 && level.var_de3cfce369a7d08f.tablets_initialized >= init_limit) {
        return false;
    }
    if (!level.br_circle_disabled) {
        var_d5e02e7b0dd7a828 = namespace_553788426d0f4133::function_60951b84c58915ab(self.tablet.origin);
        self.var_91d32f70a51031f9 = namespace_553788426d0f4133::function_7d8550b9a2c52852(var_d5e02e7b0dd7a828);
    }
    if (level.var_de3cfce369a7d08f.var_de9144b3db577810 < 1) {
        self.var_f59cdbf646c7ca3 = function_f2439ec57207ed9();
    } else {
        self.var_f59cdbf646c7ca3 = level.var_de3cfce369a7d08f function_e0f0e81d7ece078a();
    }
    self.var_6078eb76085c3221 = function_e2fa6e606a1be0d3();
    if (!isdefined(self.var_f59cdbf646c7ca3)) {
        return false;
    }
    if (!isdefined(self.var_6078eb76085c3221) || self.var_6078eb76085c3221.size < level.var_de3cfce369a7d08f.var_4f5e5f6b77e7df9c) {
        return false;
    }
    if (istrue(self.var_f59cdbf646c7ca3.used)) {
        return false;
    }
    self.var_f59cdbf646c7ca3.used = 1;
    thread function_11030274435e4ff7();
    thread function_c2767d1bd4f5c9e3();
    /#
        if (level.var_de3cfce369a7d08f.var_b22c5e6755f6c29b == 2) {
            thread function_8586c8d5c6dad9ec();
        }
    #/
    level.var_de3cfce369a7d08f.tablets_initialized++;
    return true;
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e46
// Size: 0x397
function function_f2439ec57207ed9() {
    location = scripts\mp\poi::function_bfb73de4decfe852(self.tablet.origin);
    if (!isdefined(location) || !isdefined(location.name)) {
        return undefined;
    }
    target = undefined;
    boss_type = undefined;
    switch (location.name) {
    case #"hash_796bb459ccd4e958": 
        if (getdvarint(@"hash_83baf86af015e43b", 1) == 1) {
            target = "ZOMBIENEST_APARTMENT";
            boss_type = "base_armored_heavy";
        }
        break;
    case #"hash_ea4710100dabfbca": 
        if (getdvarint(@"hash_bf02ef278577b107", 1) == 1) {
            target = "ZOMBIENEST_KEEP_DUNGEON";
            boss_type = "mimic";
        }
        break;
    case #"hash_c7f751358c7a68a6": 
        if (getdvarint(@"hash_a07e08c0000537d7", 1) == 1) {
            target = "ZOMBIENEST_SEWER_TUNNEL";
            boss_type = "hellhound";
        }
        break;
    case #"hash_6a2a4b8f66645d28": 
        if (getdvarint(@"hash_33b893ae872efd32", 1) == 1) {
            target = "ZOMBIENEST_KEEP_DESTROYED";
            boss_type = "hellhound";
        }
        break;
    case #"hash_c62ca67d7a04c8df": 
        if (getdvarint(@"hash_947bdbac67863e27", 1) == 1) {
            target = "ZOMBIENEST_CEMETARY_TUNNEL";
            boss_type = "base_armored_heavy";
        }
        break;
    case #"hash_3c3e216d9cb4f194": 
        if (getdvarint(@"hash_4be0e602cc9507db", 1) == 1) {
            target = "ZOMBIENEST_LABS";
            boss_type = "mimic";
        }
        break;
    case #"hash_1dd4a3090492e1f7": 
        if (getdvarint(@"hash_eeb5f31b41cea92f", 1) == 1) {
            target = "ZOMBIENEST_TOWN_UPSTAIRS";
            boss_type = "base_armored_heavy";
        }
        break;
    case #"hash_4af66c87c547ddbb": 
        if (getdvarint(@"hash_c408f0988d502a5c", 1) == 1) {
            target = "ZOMBIENEST_SNACK_SHOP";
            boss_type = "base_armored_heavy";
        }
        break;
    case #"hash_88c7b7ddf8ba43d6": 
        if (getdvarint(@"hash_a1b40ab8d7aa5e3e", 1) == 1) {
            target = "ZOMBIENEST_WINERY_TUNNEL";
            boss_type = "mimic";
        }
        break;
    case #"hash_8c5f7784935d24a5": 
        if (getdvarint(@"hash_64390199c38e62ab", 1) == 1) {
            target = "ZOMBIENEST_LIGHTHOUSE";
            boss_type = "hellhound";
        }
        break;
    case #"hash_a94e3fb46508510c": 
        if (getdvarint(@"hash_378741c1658a48e6", 1) == 1) {
            target = "ZOMBIENEST_GRANDMAS_BASEMENT";
            boss_type = "base_armored_heavy";
        }
        break;
    case #"hash_afbf303083acfce1": 
        if (getdvarint(@"hash_4e91afda68f6fa0d", 1) == 1) {
            target = "ZOMBIENEST_WINERY_STORAGE";
            boss_type = "base_armored_heavy";
        }
        break;
    default: 
        break;
    }
    var_97a18b707e09ac62 = undefined;
    if (isdefined(target)) {
        foreach (nest in level.var_de3cfce369a7d08f.var_2583679d5dd79218) {
            if (target == nest.targetname) {
                var_97a18b707e09ac62 = nest;
            }
        }
    }
    if (!isdefined(var_97a18b707e09ac62)) {
        return undefined;
    }
    if (!level.br_circle_disabled && !scripts\mp\gametypes\br_circle::ispointwithininitialdangercircle(var_97a18b707e09ac62.origin)) {
        return undefined;
    }
    var_97a18b707e09ac62.boss_data = function_a6f44376eecf9ec5(boss_type);
    return var_97a18b707e09ac62;
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21e6
// Size: 0x1d5
function function_e2fa6e606a1be0d3() {
    if (!isdefined(self.var_f59cdbf646c7ca3)) {
        return undefined;
    }
    var_e075a8cc5c9bfa63 = level.var_de3cfce369a7d08f;
    var_503c6887f9d9a2a7 = [];
    valid_points = [];
    targetname = self.var_f59cdbf646c7ca3.targetname;
    foreach (point in var_e075a8cc5c9bfa63.var_674ccca06e1c6205) {
        if (isdefined(point.target) && point.target == targetname) {
            valid_points[valid_points.size] = point;
        }
    }
    if (valid_points.size < var_e075a8cc5c9bfa63.var_4f5e5f6b77e7df9c) {
        return undefined;
    }
    valid_points = utility::array_randomize(valid_points);
    if (!level.br_circle_disabled) {
        for (i = 0; i < valid_points.size; i++) {
            var_176979084a7ed028 = namespace_553788426d0f4133::function_60951b84c58915ab(valid_points[i].origin);
            valid_points[i].var_5049402bbb117938 = namespace_553788426d0f4133::function_7d8550b9a2c52852(var_176979084a7ed028);
            if (valid_points[i].var_5049402bbb117938 <= self.var_91d32f70a51031f9) {
                continue;
            }
            if (!isdefined(var_503c6887f9d9a2a7[0])) {
                var_503c6887f9d9a2a7[0] = valid_points[i];
                continue;
            }
            if (var_e075a8cc5c9bfa63.var_4f5e5f6b77e7df9c > 1) {
                if (valid_points[i].var_5049402bbb117938 <= var_503c6887f9d9a2a7[0].var_5049402bbb117938) {
                    continue;
                }
                var_503c6887f9d9a2a7[1] = valid_points[i];
            }
        }
    } else {
        for (i = 0; i < var_e075a8cc5c9bfa63.var_4f5e5f6b77e7df9c; i++) {
            var_503c6887f9d9a2a7[i] = valid_points[i];
        }
    }
    return var_503c6887f9d9a2a7;
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23c4
// Size: 0x195
function function_e0f0e81d7ece078a() {
    target = undefined;
    switch (self.var_de9144b3db577810) {
    case 2: 
        target = "ZOMBIENEST_WINERY_STORAGE";
        break;
    case 1: 
        target = "ZOMBIENEST_WINERY_TUNNEL";
        break;
    case 3: 
        target = "ZOMBIENEST_TOWN_UPSTAIRS";
        break;
    case 4: 
        target = "ZOMBIENEST_SNACK_SHOP";
        break;
    case 5: 
        target = "ZOMBIENEST_SEWER_TUNNEL";
        break;
    case 6: 
        target = "ZOMBIENEST_APARTMENT";
        break;
    case 7: 
        target = "ZOMBIENEST_KEEP_DUNGEON";
        break;
    case 8: 
        target = "ZOMBIENEST_KEEP_DESTROYED";
        break;
    case 9: 
        target = "ZOMBIENEST_CEMETARY_TUNNEL";
        break;
    case 10: 
        target = "ZOMBIENEST_GRANDMAS_BASEMENT";
        break;
    case 11: 
        target = "ZOMBIENEST_LIGHTHOUSE";
        break;
    case 12: 
        target = "ZOMBIENEST_LABS";
        break;
    default: 
        break;
    }
    foreach (nest in self.var_2583679d5dd79218) {
        if (nest.targetname == target) {
            return nest;
        }
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2561
// Size: 0x1a5
function function_c2767d1bd4f5c9e3() {
    level endon("prematch_done");
    self.tablet waittill("show");
    self.var_f59cdbf646c7ca3 thread function_329019d15888feaf();
    self.var_f59cdbf646c7ca3.spawn_points = [];
    self.var_f59cdbf646c7ca3.var_2a7226733126fefe = [];
    self.var_f59cdbf646c7ca3.task = self;
    foreach (point in level.var_de3cfce369a7d08f.var_49297432fa59539f) {
        if (isdefined(point.target) && point.target == self.var_f59cdbf646c7ca3.targetname) {
            if (isdefined(point.script_noteworthy) && point.script_noteworthy == "boss_spawn") {
                self.var_f59cdbf646c7ca3.var_2a7226733126fefe = utility::array_add(self.var_f59cdbf646c7ca3.var_2a7226733126fefe, point);
            }
            self.var_f59cdbf646c7ca3.spawn_points = utility::array_add(self.var_f59cdbf646c7ca3.spawn_points, point);
        }
    }
    self.rewards = function_d0456c226b6afed();
    /#
        if (level.var_de3cfce369a7d08f.var_b22c5e6755f6c29b == 2) {
            thread function_8586c8d5c6dad9ec();
        }
    #/
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x270e
// Size: 0x156
function function_d0456c226b6afed() {
    rewards = [];
    rewards[rewards.size] = pickscriptablelootitem("weapon", 4, 4, "mp/loot/br/jup_sm_island_2/resurgence/lootset_cache_lege.csv");
    var_8f19495d6a0c9623 = ["brloot_equip_gasmask", "brloot_equip_gasmask_durable"];
    if (!level.var_de3cfce369a7d08f.loot_restricted) {
        var_8f19495d6a0c9623[var_8f19495d6a0c9623.size] = "brloot_offhand_deconstation";
    }
    rewards[rewards.size] = var_8f19495d6a0c9623[randomint(var_8f19495d6a0c9623.size)];
    var_6471bd83bf9773df = ["brloot_perkpack_technician_jup", "brloot_perkpack_commander_jup", "brloot_perkpack_huntsman_jup", "brloot_perkpack_legionnaire_jup", "brloot_perkpack_corporal_jup"];
    rewards[rewards.size] = var_6471bd83bf9773df[randomint(var_6471bd83bf9773df.size)];
    var_770e8c84df2927ac = ["brloot_munition_jup_lrad", "brloot_killstreak_cluster_spike", "brloot_super_soundveil"];
    if (!level.var_de3cfce369a7d08f.loot_restricted) {
        var_770e8c84df2927ac[var_770e8c84df2927ac.size] = "brloot_killstreak_bunker_buster";
    }
    rewards[rewards.size] = var_770e8c84df2927ac[randomint(var_770e8c84df2927ac.size)];
    if (randomint(100) < getdvarint(@"hash_b573fe45501beda8", 20)) {
        if (utility::cointoss()) {
            rewards[rewards.size] = scripts\cp_mp\utility\weapon_utility::function_eeaa22f0cd1ff845("jup_pi_raygun_mp");
        } else {
            rewards[rewards.size] = scripts\cp_mp\utility\weapon_utility::function_eeaa22f0cd1ff845("jup_ar_dg2_mp");
        }
    }
    return rewards;
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x286d
// Size: 0x2ad
function function_ebfec363bf53e486() {
    time = level.var_de3cfce369a7d08f.time;
    namespace_c133516bfc1d803c::uiobjectiveshowtoteam("zombienest", self.teams[0]);
    self.category = "zombienest";
    time = namespace_c133516bfc1d803c::function_9b6275085fbcb8f4(time);
    namespace_c133516bfc1d803c::function_5a15174d34f0670c(time, 0);
    thread function_e4a9b03d2930aafb();
    function_92c1e7e3136ad154();
    var_f45bb4ff6d8bb278 = self.var_6078eb76085c3221[0].origin + vectornormalize(utility::function_6174330574a2a273()) * 200;
    game_utility::function_6b6b6273f8180522("Zombienest_Br", var_f45bb4ff6d8bb278, level.var_de3cfce369a7d08f.circle_radius);
    foreach (player in teams::getteamdata(self.teams[0], "players")) {
        game_utility::function_cfd53c8f6878014f(player);
        player.active_task = self;
    }
    thread function_7667d54cafb43a31();
    thread function_8586c8d5c6dad9ec();
    namespace_c133516bfc1d803c::displayteamsplash(self.teams[0], "br_zombienest_quest_start_team", undefined, "splash_list_br_contract_zombienest");
    namespace_c133516bfc1d803c::displaysquadmessagetoteam(self.teams[0], self.var_d154ac2657c5f44, 6, namespace_c133516bfc1d803c::getquestindex("zombienest"));
    level thread br_public::brleaderdialogteam("mission_zombienest_accept", self.teams[0], 1, 2, undefined, "dx_br_smis_");
    if (!level.br_circle_disabled) {
        var_8be5f12ea9c17862 = namespace_553788426d0f4133::function_60951b84c58915ab(self.var_f59cdbf646c7ca3.origin);
        self.var_91d32f70a51031f9 = namespace_553788426d0f4133::function_7d8550b9a2c52852(var_8be5f12ea9c17862);
        if (self.var_91d32f70a51031f9 < time) {
            thread function_d19cefe52ef42c7b(self);
        }
        foreach (point in self.var_6078eb76085c3221) {
            var_176979084a7ed028 = namespace_553788426d0f4133::function_60951b84c58915ab(point.origin);
            point.scriptable.var_91d32f70a51031f9 = namespace_553788426d0f4133::function_7d8550b9a2c52852(var_176979084a7ed028);
            if (point.scriptable.var_91d32f70a51031f9 < time) {
                point.scriptable thread function_d19cefe52ef42c7b(self);
            }
        }
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b22
// Size: 0x24
function function_37d55d69f07be56(team) {
    if (istrue(self.teams[0] == team)) {
        function_ae065127a63b0829(0);
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b4e
// Size: 0x5c
function function_2fcaceec2fe03a0b(player, old_team, new_team) {
    if (old_team == self.teams[0]) {
        if (!br_quest_util::isteamvalid(old_team, level.contractmanager.defaultfilter)) {
            thread function_37d55d69f07be56(old_team);
            return;
        }
        function_43d761f725d3c7d3(player);
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bb2
// Size: 0x48
function function_2f09930037714234(player, old_team, new_team) {
    if (new_team == self.teams[0]) {
        function_5c243972c743674b(player);
        player setclientomnvar("ui_br_objective_countdown_timer", self.missiontime);
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c02
// Size: 0x1b
function function_bdff9369788219f7(attacker, victim) {
    function_56676d0409670380(victim);
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c25
// Size: 0x13
function function_4e1e4a6b5320e6e4(player) {
    function_56676d0409670380(player);
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c40
// Size: 0x55
function function_56676d0409670380(player) {
    if (player.team == self.teams[0]) {
        if (!scripts\mp\gametypes\br_quest_util::isteamvalid(self.teams[0], level.contractmanager.defaultfilter)) {
            function_ae065127a63b0829(0, 0);
        }
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c9d
// Size: 0xca
function function_e4a9b03d2930aafb() {
    self endon("task_ended");
    level endon("game_ended");
    wait level.var_de3cfce369a7d08f.time / 2;
    level thread br_public::brleaderdialogteam("mission_zombienest_timer", self.teams[0], 1, 2, undefined, "dx_br_smis_");
    wait level.var_de3cfce369a7d08f.time / 2;
    params = {#intvar:0};
    namespace_c133516bfc1d803c::displayteamsplash(self.teams[0], "br_zombienest_quest_timer_expired", params, "splash_list_br_contract_zombienest");
    level thread br_public::brleaderdialogteam("mission_zombienest_fail_time", self.teams[0], 1, 2, undefined, "dx_br_smis_");
    thread function_ae065127a63b0829(0, !self.gas_enabled);
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d6f
// Size: 0xa3
function function_d19cefe52ef42c7b(task) {
    level endon("game_ended");
    task endon("task_ended");
    self endon("end_watch_for_gas");
    wait self.var_91d32f70a51031f9 + level.var_de3cfce369a7d08f.var_310519099b4e2f6e;
    params = {#intvar:0};
    task namespace_c133516bfc1d803c::displayteamsplash(task.teams[0], "br_zombienest_quest_circle_failure", params, "splash_list_br_contract_zombienest");
    level thread br_public::brleaderdialogteam("mission_zombienest_fail_gas", task.teams[0], 1, 2, undefined, "dx_br_smis_");
    task thread function_ae065127a63b0829(0);
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e1a
// Size: 0x197
function function_ae065127a63b0829(complete_state, trigger_nuke) {
    if (!isdefined(trigger_nuke)) {
        trigger_nuke = 0;
    }
    self notify("task_ended");
    self.ended = 1;
    function_3979023c78a59382();
    if (!istrue(self.nest_started)) {
        thread crawler_drop();
    }
    wait 1;
    function_e9c99e047f9b76b2(trigger_nuke);
    namespace_c133516bfc1d803c::endcontract(ter_op(istrue(complete_state == 1), self.teams[0], undefined));
    foreach (player in teams::getteamdata(self.teams[0], "players")) {
        if (isdefined(player.active_task)) {
            player.active_task = undefined;
        }
    }
    var_9a6c1b85896a116e = {#hvt_type:self.var_f59cdbf646c7ca3.boss_data.type, #nest_location:self.var_f59cdbf646c7ca3.targetname, #completion_state:complete_state};
    level thread function_daf7a654755217f2(var_9a6c1b85896a116e);
    /#
        if (istrue(level.var_de3cfce369a7d08f.var_8296e7984a23912e)) {
            level.var_de3cfce369a7d08f.var_8296e7984a23912e = 0;
        }
        level notify("<dev string:x74>");
        level.var_de3cfce369a7d08f.var_5f9281806605c0b7 = undefined;
    #/
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fb9
// Size: 0x2f6
function function_e9c99e047f9b76b2(trigger_nuke) {
    if (!isdefined(trigger_nuke)) {
        trigger_nuke = 0;
    }
    game_utility::function_af5604ce591768e1();
    if (isdefined(self.var_6078eb76085c3221)) {
        foreach (point in self.var_6078eb76085c3221) {
            if (isdefined(point.trigger)) {
                point.trigger delete();
            }
            if (isdefined(point.scriptable)) {
                point.scriptable freescriptable();
            }
        }
    }
    if (isdefined(self.var_f59cdbf646c7ca3) && isdefined(self.var_f59cdbf646c7ca3.var_15ecf14670478f34)) {
        foreach (cyst in self.var_f59cdbf646c7ca3.var_15ecf14670478f34) {
            if (isdefined(cyst)) {
                if (isdefined(level.brgametype.cysts) && utility::array_contains(level.brgametype.cysts, cyst)) {
                    level.brgametype.cysts = utility::array_remove(level.brgametype.cysts, cyst);
                }
                cyst freescriptable();
            }
        }
    }
    if (trigger_nuke && getdvarint(@"hash_5f4c8ff726eb8e87", 0) == 1 && !getdvarint(@"hash_6d05eef17bf3efaa", 0) && getdvarint(@"hash_920497dcbb26e232", 1) == 1) {
        if (isdefined(self.active_zombies) && self.active_zombies.size > 0) {
            if (utility::issharedfuncdefined("powerup_nuke", "trigger_nuke")) {
                self.zombie_boss[0] thread utility::function_f3bb4f4911a1beb2("powerup_nuke", "trigger_nuke", self.zombie_boss[0].origin, 1, self.active_zombies);
            } else {
                assertmsg("<dev string:x8a>");
            }
        }
        trigger_cleanup();
    } else {
        function_49b9b39678c461bd();
        trigger_cleanup();
    }
    corpses = function_e3b3f0128f632da5(self.var_f59cdbf646c7ca3.origin, 1000);
    foreach (corpse in corpses) {
        corpse thread function_845a94db40b85c79();
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32b7
// Size: 0x1c
function function_87cfbfeba9393973() {
    return isdefined(self.active_zombies) && self.active_zombies.size > 0;
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x32dc
// Size: 0x29
function function_642f8a716120a16f() {
    level endon("game_ended");
    self.nuke_powerup endon("picked_up");
    wait 30;
    function_49b9b39678c461bd();
    trigger_cleanup();
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x330d
// Size: 0xff
function function_49b9b39678c461bd() {
    foreach (zombie in self.active_zombies) {
        if (zombie.health <= 0) {
            continue;
        }
        if (isdefined(zombie._blackboard) && istrue(zombie._blackboard.var_10cd2abcd916837e)) {
            continue;
        }
        if (zombie asmhasstate(zombie.asmname, "despawn_in")) {
            zombie.nocorpse = 1;
            zombie scripts\asm\asm::asm_setstate("despawn_in");
            continue;
        }
        if (istrue(zombie.magic_bullet_shield)) {
            zombie scripts\common\ai::stop_magic_bullet_shield();
        }
        zombie.nocorpse = 1;
        zombie.var_7e4b076a06c6df27 = 1;
        zombie kill();
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3414
// Size: 0x243
function function_ebe3e507046b2636(correct_team) {
    self notify("skip_investigation");
    self notify("footprint_loop_stop");
    namespace_c133516bfc1d803c::uiobjectiveshowtoteam("zombienest_cyst", self.teams[0]);
    namespace_c133516bfc1d803c::function_e2aa45e2c6b5dec1(0, level.var_de3cfce369a7d08f.var_15d494fa46325346);
    function_20553f0e04484a87(self.var_f59cdbf646c7ca3, 0, undefined, "nest");
    self.var_ee01b2d72e3aa653 = 1;
    if (istrue(correct_team)) {
        namespace_c133516bfc1d803c::displayteamsplash(self.teams[0], "br_zombienest_quest_nest_discovered", undefined, "splash_list_br_contract_zombienest");
        level thread br_public::brleaderdialogteam("mission_zombienest_nest", self.teams[0], 1, 2, undefined, "dx_br_smis_");
    } else {
        namespace_c133516bfc1d803c::displayteamsplash(self.teams[0], "br_zombienest_quest_nest_discovered_enemy", undefined, "splash_list_br_contract_zombienest");
        level thread br_public::brleaderdialogteam("mission_zombienest_nest_team", self.teams[0], 1, 2, undefined, "dx_br_smis_");
    }
    game_utility::function_af5604ce591768e1();
    if (isdefined(self.var_6078eb76085c3221)) {
        foreach (point in self.var_6078eb76085c3221) {
            if (isdefined(point.scriptable)) {
                if (point.scriptable getscriptablepartstate("zombienest_investigation_point_jup") == "usable_corpse") {
                    point.scriptable setscriptablepartstate("zombienest_investigation_point_jup", "unusable_corpse");
                }
            }
            if (isdefined(point.trigger)) {
                point.trigger delete();
            }
        }
    }
    foreach (player in teams::getteamdata(self.teams[0], "players")) {
        player notify("zombienest_tracking");
        player thread function_bb89532df150bca8();
    }
    if (!isdefined(self.var_e171f154ea4ec2c8)) {
        self.var_e171f154ea4ec2c8 = 0;
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x365f
// Size: 0xe5
function function_bb89532df150bca8() {
    level endon("game_ended");
    self.active_task endon("task_ended");
    self endon("disconnect");
    while (!isalive(self)) {
        wait 1;
    }
    dist = distance2dsquared(self.origin, self.active_task.var_f59cdbf646c7ca3.origin);
    if (dist < squared(1500)) {
        return;
    }
    self.active_task function_5225080b8f50d488(self);
    while (true) {
        if (isalive(self)) {
            dist = distance2dsquared(self.origin, self.active_task.var_f59cdbf646c7ca3.origin);
            if (dist < squared(1500)) {
                break;
            }
        }
        wait 1;
    }
    self.active_task function_ab05e129cba5d54c(self);
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x374c
// Size: 0x138
function function_397f9ef7d73e3d74() {
    self notify("zombienest_final_wave");
    self notify("end_watch_for_gas");
    namespace_c133516bfc1d803c::uiobjectiveshowtoteam("zombienest_eliminate", self.teams[0]);
    namespace_c133516bfc1d803c::displayteamsplash(self.teams[0], "br_zombienest_quest_eliminate", undefined, "splash_list_br_contract_zombienest");
    self.gas_enabled = 0;
    self notify("hvt_active");
    function_a6cbdfe5e2529a0(self.teams[0]);
    foreach (player in self.var_34eac412f9dd7c2b) {
        player function_2baa36d0d56e86a0();
        player setscriptablepartstate("nest_fx", "off");
    }
    foreach (prop in self.var_f59cdbf646c7ca3.var_dcbec0adc5c68ae8) {
        prop setscriptablepartstate("state", "hidden");
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x388c
// Size: 0xef
function function_8edb31561e4db442() {
    self.crawler_offset = (-8, 30, -40);
    self.var_10a2f6768996cda4 = (100, -100, 100);
    self.var_f97bc94b040ca27f = (6, -20, -47);
    self.var_bd0390fdfbffb524 = (100, -100, 0);
    self.var_2583679d5dd79218 = utility::getstructarray("zombienest_center", "script_noteworthy");
    self.var_38fa1f33c2fd0ffc = utility::getstructarray("zombienest_ceiling_spawner", "targetname");
    self.var_5b1136b59d854e78 = utility::getstructarray("zombienest_cyst_spawn", "script_noteworthy");
    self.var_a2ce95f2a3cda045 = function_f159c10d5cf8f0b4("zombienest_trigger", "targetname");
    self.var_49297432fa59539f = utility::getstructarray("zombienest_zombie_spawn", "targetname");
    self.var_35019ec0ea9172d2 = utility::getstructarray("zombienest_window_to_break", "targetname");
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3983
// Size: 0x112
function function_a6f44376eecf9ec5(boss_type) {
    boss_type = getdvar(@"hash_d105c10e8a7175c9", boss_type);
    num_to_spawn = 1;
    tier = "difficulty_easy";
    var_d97331f087aabebf = 65;
    switch (boss_type) {
    case #"hash_b84aa7095c40495c": 
        num_to_spawn = 3;
        if (level.var_de3cfce369a7d08f.hellhound_tier > 1) {
            tier = "difficulty_normal";
        }
        break;
    case #"hash_57f1e1130e644c8e": 
        var_d97331f087aabebf = 100;
        break;
    case #"hash_f68b3ed62e688225": 
        if (level.var_de3cfce369a7d08f.var_147046baca64f322 > 1) {
            tier = "difficulty_normal";
        }
        var_d97331f087aabebf = 90;
        break;
    default: 
        break;
    }
    boss_data = {#var_d97331f087aabebf:var_d97331f087aabebf, #tier:tier, #count:num_to_spawn, #type:"zombie_" + boss_type};
    return boss_data;
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a9e
// Size: 0x37a
function function_329019d15888feaf() {
    if (isdefined(self) && isdefined(self.target)) {
        self.var_86ca8e1c112dc232 = getentitylessscriptablearray(self.target, "targetname");
        self.var_dcbec0adc5c68ae8 = [];
        foreach (prop in self.var_86ca8e1c112dc232) {
            if (issubstr(prop.classname, "gas")) {
                self.var_dcbec0adc5c68ae8[self.var_dcbec0adc5c68ae8.size] = prop;
                self.var_86ca8e1c112dc232 = utility::array_remove(self.var_86ca8e1c112dc232, prop);
                continue;
            }
            prop setscriptablepartstate("state", "visible");
        }
    }
    foreach (spawner in level.var_de3cfce369a7d08f.var_38fa1f33c2fd0ffc) {
        if (isdefined(spawner) && spawner.target == self.targetname) {
            spawner.scriptable = spawnscriptable("ob_aethernest_toggleable_spawner", spawner.origin, spawner.angles);
            spawner.scriptable setscriptablepartstate("state", "visible");
            self.ceiling_spawner = spawner;
            break;
        }
    }
    self.var_6fb0b363cf0904af = [];
    foreach (cyst in level.var_de3cfce369a7d08f.var_5b1136b59d854e78) {
        if (isdefined(cyst) && cyst.target == self.targetname) {
            self.var_6fb0b363cf0904af[self.var_6fb0b363cf0904af.size] = cyst;
        }
        /#
            if (level.var_de3cfce369a7d08f.var_b22c5e6755f6c29b == 1) {
                cyst.scriptable = spawnscriptable("<dev string:xd0>", cyst.origin, cyst.angles);
                cyst.scriptable setscriptablepartstate("<dev string:xee>", "<dev string:xf5>");
                cyst.scriptable setscriptablepartstate("<dev string:xf9>", "<dev string:x100>");
            }
        #/
    }
    self.var_88d2a48b05e5df7e = [];
    foreach (window in level.var_de3cfce369a7d08f.var_35019ec0ea9172d2) {
        if (isdefined(window.script_noteworthy) && window.script_noteworthy == self.targetname) {
            self.var_88d2a48b05e5df7e[self.var_88d2a48b05e5df7e.size] = window;
        }
    }
    if (self.var_88d2a48b05e5df7e.size > 0) {
        thread function_5f7cc9ef230b2e44();
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e20
// Size: 0x77
function function_5f7cc9ef230b2e44() {
    level endon("game_ended");
    level waittill("infils_ready");
    foreach (window in self.var_88d2a48b05e5df7e) {
        glassradiusdamage(window.origin, 100, 10000, 9000);
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e9f
// Size: 0x321
function function_8586c8d5c6dad9ec() {
    nest = self.var_f59cdbf646c7ca3;
    nest.var_15ecf14670478f34 = [];
    groups = [];
    group_keys = [];
    foreach (cyst in nest.var_6fb0b363cf0904af) {
        if (isdefined(cyst.targetname)) {
            if (!isdefined(groups[cyst.targetname])) {
                groups[cyst.targetname] = [];
                group_keys[group_keys.size] = cyst.targetname;
            }
            groups[cyst.targetname][groups[cyst.targetname].size] = cyst;
        }
    }
    var_3494d265fa64df95 = [];
    if (group_keys.size > 0) {
        foreach (key in group_keys) {
            if (isdefined(groups[key])) {
                var_3494d265fa64df95[var_3494d265fa64df95.size] = utility::array_random(groups[key]);
            }
        }
    }
    var_3494d265fa64df95 = utility::array_randomize(var_3494d265fa64df95);
    for (i = 0; i < level.var_de3cfce369a7d08f.var_15d494fa46325346; i++) {
        cyst = spawnscriptable("ob_aethernest_cyst_scriptable", var_3494d265fa64df95[i].origin, var_3494d265fa64df95[i].angles);
        cyst.health = level.var_de3cfce369a7d08f.var_c32336dbbd60b8d9;
        cyst.task = self;
        cyst.loot_blocked = 0;
        if (isdefined(var_3494d265fa64df95[i].script_parameters) && var_3494d265fa64df95[i].script_parameters == "loot_blocked") {
            cyst.loot_blocked = 1;
        }
        cyst setscriptablepartstate("usable", "off");
        nest.var_15ecf14670478f34[i] = cyst;
        if (!isdefined(level.brgametype.cysts)) {
            level.brgametype.cysts = [];
        }
        level.brgametype.cysts = utility::array_add(level.brgametype.cysts, cyst);
    }
    nest.var_969e56ce1dd93031 = nest.var_15ecf14670478f34.size;
    foreach (prop in nest.var_dcbec0adc5c68ae8) {
        prop setscriptablepartstate("state", "visible");
    }
    thread trigger_init();
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41c8
// Size: 0x30e
function function_7667d54cafb43a31() {
    nest = self.var_f59cdbf646c7ca3;
    aitypes = namespace_2b1145f62aa835b8::get_aitype_by_subclass_sharedfunc("zombie_base_abom_crawler");
    var_ea3e656b50d22272 = aitypes[0];
    foreach (aitype in aitypes) {
        if (issubstr(aitype, "nest")) {
            var_ea3e656b50d22272 = aitype;
        }
    }
    self.active_zombies = [];
    if (level.var_de3cfce369a7d08f.num_crawlers > 0) {
        crawler = namespace_2b1145f62aa835b8::spawnnewaitype_sharedfunc(var_ea3e656b50d22272, nest.ceiling_spawner.origin + function_b92fe4518e875443(level.var_de3cfce369a7d08f.crawler_offset, anglestoaxis(nest.ceiling_spawner.angles)), nest.ceiling_spawner.angles + level.var_de3cfce369a7d08f.var_10a2f6768996cda4, "team_two_hundred");
        crawler function_7e6a015226d63d6d("difficulty_easy");
        if (isdefined(crawler)) {
            crawler val::set("idle_hang", "damage", 0);
            crawler.task = self;
            crawler.idle_anim = "nest_crawler_idle_two_drop_01";
            crawler thread function_9f61ce12bbb16cac();
            crawler callback::add("on_zombie_ai_damaged", &function_96ca7e470db74bdb);
            crawler callback::add("on_zombie_ai_killed", &function_2e8b80e841d8c57d);
        }
        nest.ceiling_spawner.crawler = crawler;
        self.active_zombies[self.active_zombies.size] = crawler;
    }
    if (level.var_de3cfce369a7d08f.num_crawlers > 1) {
        crawler = namespace_2b1145f62aa835b8::spawnnewaitype_sharedfunc(var_ea3e656b50d22272, nest.ceiling_spawner.origin + function_b92fe4518e875443(level.var_de3cfce369a7d08f.var_f97bc94b040ca27f, anglestoaxis(nest.ceiling_spawner.angles)), nest.ceiling_spawner.angles + level.var_de3cfce369a7d08f.var_bd0390fdfbffb524, "team_two_hundred");
        crawler function_7e6a015226d63d6d("difficulty_easy");
        if (isdefined(crawler)) {
            crawler val::set("idle_hang", "damage", 0);
            crawler.task = self;
            crawler.idle_anim = "nest_crawler_idle_two_drop_02";
            crawler thread function_9f61ce12bbb16cac();
            crawler callback::add("on_zombie_ai_damaged", &function_96ca7e470db74bdb);
            crawler callback::add("on_zombie_ai_killed", &function_2e8b80e841d8c57d);
        }
        nest.ceiling_spawner.crawler2 = crawler;
        self.active_zombies[self.active_zombies.size] = crawler;
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44de
// Size: 0x26f
function function_92c1e7e3136ad154() {
    for (i = 0; i < self.var_6078eb76085c3221.size; i++) {
        self.var_6078eb76085c3221[i].scriptable = spawnscriptable("zombienest_investigation_point_jup", self.var_6078eb76085c3221[i].origin, self.var_6078eb76085c3221[i].angles);
        self.var_6078eb76085c3221[i].scriptable.task = self;
        if (i == 0) {
            if (isdefined(self.var_6078eb76085c3221[i].targetname) && self.var_6078eb76085c3221[i].targetname == "corpse_2") {
                self.var_6078eb76085c3221[i].scriptable.corpse_2 = 1;
                self.var_6078eb76085c3221[i].scriptable setscriptablepartstate("zombienest_investigation_point_jup", "usable_corpse_2");
            } else {
                self.var_6078eb76085c3221[i].scriptable setscriptablepartstate("zombienest_investigation_point_jup", "usable_corpse");
            }
            continue;
        }
        self.var_6078eb76085c3221[i].scriptable setscriptablepartstate("zombienest_investigation_point_jup", "point_outline");
    }
    function_20553f0e04484a87(self.var_6078eb76085c3221[0], 0, undefined, "corpse");
    thread function_d037ccdb3b11447f(self.var_6078eb76085c3221[0]);
    foreach (player in level.players) {
        self.var_6078eb76085c3221[0].scriptable disablescriptableplayeruse(player);
    }
    foreach (player in teams::getteamdata(self.teams[0], "players")) {
        self.var_6078eb76085c3221[0].scriptable enablescriptableplayeruse(player);
    }
    self.var_fc58e9ab685e7742 = 0;
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4755
// Size: 0xcb
function function_d037ccdb3b11447f(point) {
    self endon("skip_investigation");
    self endon("task_ended");
    level endon("game_ended");
    objective_revealed = 0;
    while (!objective_revealed) {
        foreach (player in teams::getteamdata(self.teams[0], "players")) {
            if (utility::function_acb96530881571aa(player, point.origin, 500)) {
                function_516e4c50b671b284(player.team);
                game_utility::function_af5604ce591768e1();
                objective_revealed = 1;
                break;
            }
        }
        wait 0.5;
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4828
// Size: 0x16c
function function_2d1327f6ce7982c0(instance, part, state, player, auto_use, use_string) {
    if (!istrue(instance.corpse_2)) {
        instance setscriptablepartstate("zombienest_investigation_point_jup", "unusable_corpse");
    } else {
        instance setscriptablepartstate("zombienest_investigation_point_jup", "unusable_corpse_2");
    }
    task = instance.task;
    if (isdefined(task)) {
        instance notify("end_watch_for_gas");
        player points::doScoreEvent(#"hash_b7a40991c5c4bf8", undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, 1);
        task thread function_7d6b02a8a98e31b6();
    }
    /#
        if (level.var_de3cfce369a7d08f.var_36977fbdb1c082ed) {
            level notify("<dev string:x10e>");
            instance.path thread function_642f50e2994cc88a();
            level.var_de3cfce369a7d08f.var_5f9281806605c0b7 = instance.path;
            if (istrue(level.var_de3cfce369a7d08f.var_78e879ff07bbfd2f)) {
                level.var_de3cfce369a7d08f.var_5f9281806605c0b7 thread function_1b693b431c3259c9();
            }
            if (!istrue(instance.corpse_2)) {
                instance setscriptablepartstate("<dev string:x1c>", "<dev string:x58>");
                return;
            }
            instance setscriptablepartstate("<dev string:x1c>", "<dev string:x48>");
        }
    #/
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x499c
// Size: 0x18a
function function_7d6b02a8a98e31b6() {
    if (self.var_fc58e9ab685e7742 == 0) {
        function_a6cbdfe5e2529a0(self.teams[0]);
        game_utility::function_af5604ce591768e1();
        namespace_c133516bfc1d803c::uiobjectiveshowtoteam("zombienest_track", self.teams[0]);
    }
    if (isdefined(self.footstep_paths[self.var_fc58e9ab685e7742])) {
        self.active_path = self.footstep_paths[self.var_fc58e9ab685e7742];
    }
    self.var_fc58e9ab685e7742++;
    next_point = self.var_6078eb76085c3221[self.var_fc58e9ab685e7742];
    if (isdefined(next_point)) {
        next_point.trigger = spawn("noent_volume_trigger_radius", next_point.origin, 0, 150, 56);
        thread function_f8d2eaf695792fe3(next_point);
    }
    self.var_46cfa00a3c715d51 = 0;
    function_20553f0e04484a87(self.active_path.obj_locs[self.var_46cfa00a3c715d51], 0, undefined, "footprint");
    self notify("footprint_loop_stop");
    foreach (player in teams::getteamdata(self.teams[0], "players")) {
        thread function_fe6ed3e33642aeba(player, self.active_path);
        player thread function_2af5e50a915f1920(self.active_path);
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b2e
// Size: 0x8a
function function_f8d2eaf695792fe3(point) {
    self endon("skip_investigation");
    self endon("task_ended");
    level endon("game_ended");
    while (true) {
        player = point.trigger waittill("trigger");
        if (isplayer(player) && isdefined(player.active_task) && player.active_task == self) {
            break;
        }
    }
    function_7d6b02a8a98e31b6();
    point.trigger delete();
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4bc0
// Size: 0x19b
function function_11030274435e4ff7(dev_testing) {
    if (!isdefined(dev_testing)) {
        dev_testing = 0;
    }
    if (!istrue(dev_testing)) {
        level waittill("prematch_started");
    }
    self.footstep_paths = [];
    for (i = 0; i < self.var_6078eb76085c3221.size; i++) {
        path = undefined;
        if (isdefined(self.var_6078eb76085c3221[i + 1])) {
            path = level.players[0] findpath(self.var_6078eb76085c3221[i].origin, self.var_6078eb76085c3221[i + 1].origin);
            self.footstep_paths[i] = {#path:path};
        }
    }
    path = level.players[0] findpath(self.var_6078eb76085c3221[self.var_6078eb76085c3221.size - 1].origin, self.var_f59cdbf646c7ca3.origin);
    self.footstep_paths[self.footstep_paths.size] = {#path:path};
    for (i = 0; i < self.footstep_paths.size; i++) {
        self.footstep_paths[i].var_a5a1a3685b2cdfe7 = spawn("script_model", self.footstep_paths[i].path[0]);
        self.footstep_paths[i] thread function_ca0219b7de04f1c8();
        self.footstep_paths[i] thread function_9a387a79e023c865();
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d63
// Size: 0xf9
function function_ca0219b7de04f1c8() {
    i = 0;
    path = self.path;
    var_f14f5cb639c4a29 = self.path[i];
    ai = self.var_a5a1a3685b2cdfe7;
    while (true) {
        ai moveto(ai.origin + 25 * vectornormalize(var_f14f5cb639c4a29 - ai.origin), level.framedurationseconds);
        dist = distancesquared(ai.origin, var_f14f5cb639c4a29);
        if (dist <= squared(72)) {
            i++;
            if (isdefined(path[i])) {
                var_f14f5cb639c4a29 = path[i];
            }
        }
        dist = distancesquared(ai.origin, path[path.size - 1]);
        if (dist <= 4000) {
            break;
        }
        wait level.framedurationseconds;
    }
    self.var_a5a1a3685b2cdfe7 delete();
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e64
// Size: 0x3e5
function function_9a387a79e023c865(segmented) {
    if (!isdefined(segmented)) {
        segmented = 1;
    }
    footprint = undefined;
    ang = vectortoangles(self.path[1] - self.path[0]);
    var_199402a513815788 = {#angles:ang, #origin:self.var_a5a1a3685b2cdfe7.origin};
    self.footprints = [];
    var_c9274404926db738 = 0;
    to_right = 1;
    var_aa5e55cef453dda7 = undefined;
    var_b1db6a474a45cb61 = undefined;
    var_82da3574b8c57730 = 0;
    while (isdefined(self.var_a5a1a3685b2cdfe7)) {
        dist = distance2dsquared(self.var_a5a1a3685b2cdfe7.origin, var_199402a513815788.origin);
        if (!isdefined(var_b1db6a474a45cb61)) {
            var_b1db6a474a45cb61 = randomintrange(int(squared(20)), int(squared(28)));
        }
        if (dist >= var_b1db6a474a45cb61) {
            angles = vectortoangles(self.var_a5a1a3685b2cdfe7.origin - var_199402a513815788.origin);
            var_199402a513815788.origin = self.var_a5a1a3685b2cdfe7.origin;
            forward = vectornormalize(anglestoforward(angles) + (0, randomfloatrange(-0.35, 0.35), 0));
            right = vectornormalize(anglestoright(angles));
            left = vectornormalize(anglestoleft(angles));
            high_pos = var_199402a513815788.origin + (0, 0, 35);
            offset = randomfloatrange(3, 10);
            right_pos = getclosestpointonnavmesh(var_199402a513815788.origin + right * offset);
            var_199402a513815788.right = getgroundposition(right_pos + right * var_82da3574b8c57730, 5);
            left_pos = getclosestpointonnavmesh(var_199402a513815788.origin + left * offset);
            var_199402a513815788.left = getgroundposition(left_pos + left * var_82da3574b8c57730, 5);
            if (to_right) {
                var_aa5e55cef453dda7 = {#var_c9274404926db738:var_c9274404926db738, #print_type:level._effect["zombie_footprint_right"], #forward:forward, #origin:var_199402a513815788.right};
                var_82da3574b8c57730 = function_af25b6271b7d44de(offset, var_199402a513815788.origin, var_199402a513815788.right);
            } else {
                var_aa5e55cef453dda7 = {#var_c9274404926db738:var_c9274404926db738, #print_type:level._effect["zombie_footprint_left"], #forward:forward, #origin:var_199402a513815788.left};
                var_82da3574b8c57730 = function_af25b6271b7d44de(offset, var_199402a513815788.origin, var_199402a513815788.left);
            }
            self.footprints[self.footprints.size] = var_aa5e55cef453dda7;
            to_right = !to_right;
            var_c9274404926db738++;
            var_b1db6a474a45cb61 = undefined;
        }
        waitframe();
    }
    buffer = level.var_de3cfce369a7d08f.footprint_buffer;
    for (i = buffer - 1; i >= 0; i--) {
        self.footprints = utility::array_remove(self.footprints, self.footprints[i]);
    }
    if (segmented) {
        thread function_7727d09686112843(self.footprints);
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5251
// Size: 0x3c
function function_af25b6271b7d44de(offset_dist, var_e56d34a8fa112797, var_30491d3d1682ce39) {
    dist = distance2d(var_30491d3d1682ce39, var_e56d34a8fa112797);
    if (dist < offset_dist) {
        return (offset_dist - dist);
    }
    return 0;
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5295
// Size: 0xc4
function function_7727d09686112843(footprint_locs) {
    var_cde6230e36063067 = int(footprint_locs.size / 4);
    var_3f2c1be20a5acc3c = 0;
    var_41d3550fdc952918 = 0;
    self.obj_locs = [];
    for (i = 0; i < 4; i++) {
        var_3f2c1be20a5acc3c = var_41d3550fdc952918;
        var_41d3550fdc952918 = var_3f2c1be20a5acc3c + var_cde6230e36063067 - 1;
        obj_loc = int(var_41d3550fdc952918 - (var_41d3550fdc952918 - var_3f2c1be20a5acc3c) / 2);
        self.obj_locs[i] = footprint_locs[obj_loc];
        if (!isdefined(footprint_locs[var_41d3550fdc952918])) {
            var_41d3550fdc952918 = footprint_locs.size;
        }
        for (idx = var_3f2c1be20a5acc3c; idx <= var_41d3550fdc952918; idx++) {
            footprint_locs[idx].segment_id = i;
        }
        var_41d3550fdc952918++;
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5361
// Size: 0x113
function function_fe6ed3e33642aeba(player, path) {
    self endon("footprint_loop_stop");
    self endon("task_ended");
    level endon("game_ended");
    var_d88d1557532b50e5 = [];
    for (i = 0; i < path.footprints.size; i++) {
        footprint = path.footprints[i];
        if (isdefined(footprint.segment_id) && footprint.segment_id == self.var_46cfa00a3c715d51) {
            var_d88d1557532b50e5[var_d88d1557532b50e5.size] = footprint;
            continue;
        }
        if (!isdefined(footprint.segment_id)) {
            footprint.segment_id = 3;
        }
    }
    for (i = 0; i < var_d88d1557532b50e5.size; i++) {
        footprint = var_d88d1557532b50e5[i];
        playfx(footprint.print_type, footprint.origin, footprint.forward, undefined, player, 1);
        if (i == 0) {
            player thread function_e15e75f0ce6b8b2d(path);
        }
        wait 0.1;
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x547c
// Size: 0x46
function function_e15e75f0ce6b8b2d(path) {
    self.active_task endon("footprint_loop_stop");
    self.active_task endon("task_ended");
    level endon("game_ended");
    wait 10;
    self.active_task thread function_fe6ed3e33642aeba(self, path);
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54ca
// Size: 0x26a
function function_2af5e50a915f1920(current_path) {
    self notify("zombienest_tracking");
    self endon("zombienest_tracking");
    self.active_task endon("skip_investigation");
    self.active_task endon("task_ended");
    level endon("game_ended");
    self endon("disconnect");
    wait 1;
    while (true) {
        if (isalive(self)) {
            closest_prints = [];
            var_d88d1557532b50e5 = [];
            var_c313f64aeebdd08a = 1;
            foreach (footprint in current_path.footprints) {
                if (utility::function_44daa65837a12044(self, footprint.origin, level.var_de3cfce369a7d08f.var_46ace098313e8676)) {
                    closest_prints[closest_prints.size] = footprint;
                }
            }
            if (closest_prints.size > 0) {
                foreach (footprint in closest_prints) {
                    if (footprint.segment_id == self.active_task.var_46cfa00a3c715d51 && istrue(self.footprint_timer)) {
                        var_c313f64aeebdd08a = 0;
                        self.footprint_timer = 0;
                        self notify("zombienest_footprints_in_range");
                        self.active_task function_ab05e129cba5d54c(self);
                        self.var_c6e03a297c0e13b3 = 0;
                    } else if (footprint.segment_id > self.active_task.var_46cfa00a3c715d51) {
                        var_c313f64aeebdd08a = 0;
                        self.active_task function_915f8ce47f5fcfd4();
                        break;
                    }
                    if (istrue(var_c313f64aeebdd08a)) {
                        if (getdvarint(@"hash_957bdf29bdae1e58", 1) == 1 && !istrue(self.footprint_timer)) {
                            self.active_task thread function_b4480dbdff92e867(self);
                            self.footprint_timer = 1;
                        }
                    }
                }
            } else if (getdvarint(@"hash_957bdf29bdae1e58", 1) == 1 && !istrue(self.footprint_timer)) {
                self.active_task thread function_b4480dbdff92e867(self);
                self.footprint_timer = 1;
            }
        }
        wait 1;
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x573c
// Size: 0xc3
function function_915f8ce47f5fcfd4() {
    self.var_46cfa00a3c715d51++;
    function_20553f0e04484a87(self.active_path.obj_locs[self.var_46cfa00a3c715d51], 0, undefined, "footprint");
    self notify("footprint_loop_stop");
    foreach (player in teams::getteamdata(self.teams[0], "players")) {
        if (istrue(player.var_c6e03a297c0e13b3)) {
            player function_5225080b8f50d488(player);
        }
        thread function_fe6ed3e33642aeba(player, self.active_path);
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5807
// Size: 0x56
function function_b4480dbdff92e867(player) {
    player notify("zombienest_tracking_objective");
    player endon("zombienest_tracking_objective");
    self endon("skip_investigation");
    self endon("task_ended");
    level endon("game_ended");
    player endon("zombienest_footprints_in_range");
    player endon("death_or_disconnect");
    wait 5;
    function_5225080b8f50d488(player);
    player.var_c6e03a297c0e13b3 = 1;
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5865
// Size: 0x18
function function_5c243972c743674b(player) {
    player namespace_c133516bfc1d803c::uiobjectiveshow("zombienest");
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5885
// Size: 0x13
function function_43d761f725d3c7d3(player) {
    player namespace_c133516bfc1d803c::uiobjectivehide();
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58a0
// Size: 0xfe
function function_3979023c78a59382() {
    foreach (player in teams::getteamdata(self.teams[0], "players")) {
        function_43d761f725d3c7d3(player);
    }
    if (isdefined(self.objectiveiconid)) {
        namespace_c133516bfc1d803c::deletequestobjicon();
        self.objectiveiconid = undefined;
    }
    if (isdefined(self.zombie_boss)) {
        foreach (zombie in self.zombie_boss) {
            if (isdefined(zombie.objectiveiconid)) {
                zombie namespace_c133516bfc1d803c::deletequestobjicon();
                zombie.objectiveiconid = undefined;
            }
        }
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59a6
// Size: 0x165
function function_20553f0e04484a87(target, pulsate, z_offset, icon_type) {
    if (!isdefined(pulsate)) {
        pulsate = 0;
    }
    if (!isdefined(z_offset)) {
        z_offset = 65;
    }
    if (isdefined(target)) {
        if (!isdefined(self.objectiveiconid)) {
            namespace_c133516bfc1d803c::createquestobjicon("jup_ui_map_icon_activity_zombie_nest", "current");
        }
        if (isent(target)) {
            namespace_6c8a837ec98fe0b8::update_objective_onentity(self.objectiveiconid, target);
        } else {
            namespace_6c8a837ec98fe0b8::update_objective_position(self.objectiveiconid, target.origin);
        }
        objective_setzoffset(self.objectiveiconid, z_offset);
        objective_removeallfrommask(self.objectiveiconid);
        switch (icon_type) {
        case #"hash_a5ddf08edc92980d": 
            objective_setdescription(self.objectiveiconid, %MP_BR_INGAME/ZOMBIENEST_CORPSE_ICON);
            break;
        case #"hash_be50d9e05faa0574": 
            objective_setdescription(self.objectiveiconid, %MP_BR_INGAME/ZOMBIENEST_FOOTPRINT_ICON);
            break;
        case #"hash_928a11494cdce5eb": 
            objective_setdescription(self.objectiveiconid, %MP_BR_INGAME/ZOMBIENEST_NEST_ICON);
            break;
        case #"hash_4e47eb6c32f5b165": 
            objective_setdescription(self.objectiveiconid, %MP_BR_INGAME/ZOMBIENEST_HVT_ICON);
            break;
        default: 
            break;
        }
        namespace_6c8a837ec98fe0b8::objective_set_pulsate(self.objectiveiconid, pulsate);
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b13
// Size: 0x28
function function_5225080b8f50d488(player) {
    if (isdefined(self.objectiveiconid)) {
        objective_addclienttomask(self.objectiveiconid, player);
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b43
// Size: 0x28
function function_ab05e129cba5d54c(player) {
    if (isdefined(self.objectiveiconid)) {
        objective_removeclientfrommask(self.objectiveiconid, player);
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b73
// Size: 0x28
function function_516e4c50b671b284(team) {
    if (isdefined(self.objectiveiconid)) {
        objective_addteamtomask(self.objectiveiconid, team);
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ba3
// Size: 0x28
function function_a6cbdfe5e2529a0(team) {
    if (isdefined(self.objectiveiconid)) {
        objective_removeteamfrommask(self.objectiveiconid, team);
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5bd3
// Size: 0x1ce
function trigger_init() {
    self.trigger_volumes = [];
    self.var_34eac412f9dd7c2b = [];
    self.var_a67f8b76a32cd01a = [];
    self.var_e560db2951960f12 = undefined;
    foreach (trigger in level.var_de3cfce369a7d08f.var_a2ce95f2a3cda045) {
        if (isdefined(trigger.target) && trigger.target == self.var_f59cdbf646c7ca3.targetname) {
            self.trigger_volumes[self.trigger_volumes.size] = trigger;
            continue;
        }
        if (isdefined(trigger.script_noteworthy) && trigger.script_noteworthy == self.var_f59cdbf646c7ca3.targetname) {
            self.trigger_volumes[self.trigger_volumes.size] = trigger;
        }
    }
    foreach (volume in self.trigger_volumes) {
        volume.task = self;
        if (isdefined(volume.script_noteworthy) && volume.script_noteworthy == "zombie_range") {
            self.var_e560db2951960f12 = volume;
            scripts\mp\utility\trigger::makeenterexittrigger(volume, &function_6f43b30e1642a791, &function_2411949336ee55b1);
            continue;
        }
        scripts\mp\utility\trigger::makeenterexittrigger(volume, &trigger_enter, &trigger_exit);
    }
    self.gas_enabled = 1;
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5da9
// Size: 0x71
function function_6f43b30e1642a791(ent, trigger) {
    task = trigger.task;
    if (!isdefined(task) || !isdefined(task.var_a67f8b76a32cd01a)) {
        return;
    }
    if (!isplayer(ent)) {
        return;
    }
    task.var_a67f8b76a32cd01a = utility::function_6d6af8144a5131f1(task.var_a67f8b76a32cd01a, ent);
    task function_15b82c4d1c0ba4ff(ent);
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e22
// Size: 0xf4
function function_2411949336ee55b1(ent, trigger) {
    task = trigger.task;
    if (!isdefined(task) || !isdefined(task.var_a67f8b76a32cd01a)) {
        return;
    }
    if (!isplayer(ent)) {
        return;
    }
    task.var_a67f8b76a32cd01a = utility::array_remove(task.var_a67f8b76a32cd01a, ent);
    task function_5abdf1eee244921c(ent);
    if (task.var_a67f8b76a32cd01a.size > 0) {
        foreach (zombie in task.active_zombies) {
            task function_56854cb0c53ecb54(zombie);
        }
        return;
    }
    if (istrue(task.nest_started)) {
        task function_4d86cf7193d4a9c();
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f1e
// Size: 0x1c7
function trigger_enter(ent, trigger) {
    task = trigger.task;
    if (!isdefined(task) || !isdefined(task.var_34eac412f9dd7c2b)) {
        return;
    }
    if (isdefined(ent.unittype) && ent.unittype == "zombie" && !istrue(task.zombies_agitated)) {
        if (!isdefined(ent.var_286ece8bb32eb6a)) {
            ent.var_286ece8bb32eb6a = 0;
        }
        ent.var_286ece8bb32eb6a++;
        return;
    }
    if (!isplayer(ent)) {
        return;
    }
    if (isdefined(ent.active_task) && ent.active_task == task) {
        if (!istrue(task.var_ee01b2d72e3aa653)) {
            task function_ebe3e507046b2636(1);
        }
    }
    task function_97d7132fe8aa4c5c();
    foreach (player in task.var_34eac412f9dd7c2b) {
        if (ent == player) {
            if (!isdefined(player.var_fd91403088004b6f)) {
                player.var_fd91403088004b6f = 0;
            }
            player.var_fd91403088004b6f++;
            return;
        }
    }
    task.var_34eac412f9dd7c2b[task.var_34eac412f9dd7c2b.size] = ent;
    if (istrue(task.gas_enabled)) {
        ent setscriptablepartstate("nest_fx", "on");
        if (!istrue(ent.var_fd91403088004b6f)) {
            ent thread function_d96a86252fdca7cb(task);
            ent.var_fd91403088004b6f = 1;
        }
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60ed
// Size: 0x1da
function trigger_exit(ent, trigger) {
    task = trigger.task;
    if (!isdefined(task) || !isdefined(task.var_34eac412f9dd7c2b)) {
        return;
    }
    if (isdefined(ent.unittype) && ent.unittype == "zombie" && !istrue(task.zombies_agitated)) {
        if (isdefined(ent.var_286ece8bb32eb6a) && ent.var_286ece8bb32eb6a > 0) {
            ent.var_286ece8bb32eb6a--;
        }
        if (!isdefined(ent.var_286ece8bb32eb6a) || isdefined(ent.var_286ece8bb32eb6a) && ent.var_286ece8bb32eb6a == 0) {
            ent function_3150ab6d409750d7(2);
            return;
        }
    }
    if (!isplayer(ent)) {
        return;
    }
    foreach (player in task.var_34eac412f9dd7c2b) {
        if (ent == player) {
            if (isdefined(player.var_fd91403088004b6f) && player.var_fd91403088004b6f > 0) {
                player.var_fd91403088004b6f--;
            }
            if (!isdefined(player.var_fd91403088004b6f) || isdefined(player.var_fd91403088004b6f) && player.var_fd91403088004b6f == 0) {
                ent function_2baa36d0d56e86a0();
                player setscriptablepartstate("nest_fx", "off");
                player notify("zombienest_gas_exited");
                task.var_34eac412f9dd7c2b = utility::array_remove(task.var_34eac412f9dd7c2b, player);
            }
            break;
        }
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62cf
// Size: 0x152
function function_d96a86252fdca7cb(task) {
    self endon("death");
    self endon("zombienest_gas_exited");
    task endon("task_ended");
    level endon("game_ended");
    task endon("hvt_active");
    if (!isdefined(task.var_34eac412f9dd7c2b)) {
        return;
    }
    gas_damage = level.var_de3cfce369a7d08f.var_514691a3959d3432;
    while (true) {
        foreach (player in task.var_34eac412f9dd7c2b) {
            if (self == player) {
                if (isdefined(player) && istrue(player.inairpocket)) {
                    function_2baa36d0d56e86a0();
                    continue;
                }
                if (istrue(self.gasmaskequipped)) {
                    scripts\cp_mp\gasmask::processdamage(gas_damage);
                    function_2baa36d0d56e86a0();
                } else {
                    self dodamage(gas_damage, self.origin, self, undefined, "MOD_TRIGGER_HURT", "danger_circle_br");
                    namespace_f8d3520d3483c1::damagearmor(gas_damage, undefined, self, "MOD_TRIGGER_HURT");
                    function_42123cf8f56caa22();
                }
                if (namespace_aead94004cf4c147::isbackpackinventoryenabled()) {
                    namespace_aead94004cf4c147::function_5323bef1ad6244b9(gas_damage);
                }
                break;
            }
        }
        wait level.var_de3cfce369a7d08f.var_9849aa27e1b7f4f1;
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6429
// Size: 0x1fc
function trigger_cleanup() {
    foreach (prop in self.var_f59cdbf646c7ca3.var_dcbec0adc5c68ae8) {
        prop setscriptablepartstate("state", "hidden");
    }
    foreach (player in teams::getteamdata(self.teams[0], "players")) {
        player.active_task = undefined;
    }
    foreach (trigger in self.trigger_volumes) {
        if (isdefined(trigger)) {
            trigger delete();
        }
    }
    foreach (player in self.var_34eac412f9dd7c2b) {
        if (isdefined(player.var_fd91403088004b6f)) {
            player.var_fd91403088004b6f = undefined;
        }
        foreach (volume in self.trigger_volumes) {
            trigger_exit(player, volume);
        }
    }
    if (isdefined(self.var_e560db2951960f12)) {
        self.var_e560db2951960f12 delete();
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x662d
// Size: 0x16
function function_42123cf8f56caa22() {
    if (!istrue(self.loopingcoughaudio)) {
        scripts\cp_mp\killstreaks\white_phosphorus::enableloopingcoughaudio();
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x664b
// Size: 0x26
function function_2baa36d0d56e86a0() {
    if (isdefined(self.loopingcoughaudio) && self.loopingcoughaudio == 1) {
        scripts\cp_mp\killstreaks\white_phosphorus::disableloopingcoughaudio();
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6679
// Size: 0x1d8
function function_c4b1f784c22038fe(einflictor, eattacker, instance, idamage, idflags, smeansofdeath, objweapon, vdir, shitloc, modelindex, partname) {
    if (!is_equal(instance.type, "ob_aethernest_cyst_scriptable") || istrue(instance.destroyed)) {
        return;
    }
    task = instance.task;
    if (isdefined(task)) {
        if (istrue(task.ended)) {
            return;
        }
        if (!istrue(task.nest_started)) {
            task thread function_9c7aaf20668cac59();
            if (!istrue(task.var_ee01b2d72e3aa653)) {
                task function_ebe3e507046b2636(eattacker.team == task.teams[0]);
            }
        }
        if (isdefined(instance.health)) {
            idamage = int(min(idamage, instance.health));
            instance.health -= idamage;
            if (isplayer(eattacker)) {
                instance.var_f49149402765ecae = function_6d6af8144a5131f1(instance.var_f49149402765ecae, eattacker);
                eattacker damagefeedback::updatehitmarker("standard", instance.health <= 0, 0, 0, undefined);
            }
            if (instance.health <= 0) {
                task thread cyst_destroyed(instance, "aethernest_cyst_gas_burst", eattacker);
            }
            task function_8bad6dae81dcfb8a(idamage);
        }
        task function_97d7132fe8aa4c5c();
        if (task.var_f59cdbf646c7ca3.var_969e56ce1dd93031 <= 0) {
            task function_397f9ef7d73e3d74();
        }
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6859
// Size: 0xb7
function cyst_destroyed(cyst, effect_type, player) {
    cyst endon("death");
    level endon("game_ended");
    self endon("task_ended");
    cyst.destroyed = 1;
    self.var_f59cdbf646c7ca3.var_969e56ce1dd93031--;
    self.var_e171f154ea4ec2c8++;
    namespace_c133516bfc1d803c::function_e2aa45e2c6b5dec1(self.var_e171f154ea4ec2c8, level.var_de3cfce369a7d08f.var_15d494fa46325346);
    player points::doScoreEvent(#"hash_626189d6229d39b4", undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, 1);
    cyst thread function_365e93999510dd56("aethernest_cyst_gas_burst");
    wait 0.5;
    thread function_b6875acdbbd823c5(cyst);
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6918
// Size: 0x6e
function function_365e93999510dd56(effect_type) {
    self endon("death");
    level endon("game_ended");
    switch (effect_type) {
    case #"hash_2f0f62be9305365f": 
        self setscriptablepartstate("health", "ignore_damage");
        self setscriptablepartstate("body", "bursted");
        break;
    case #"hash_9a6d8b5ace91c19b":
    default: 
        break;
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x698e
// Size: 0x249
function function_b6875acdbbd823c5(cyst) {
    loot = [];
    if (!istrue(self.var_a1d6a75620a9cc0b) && !level.var_de3cfce369a7d08f.loot_restricted) {
        loot[0] = "brloot_offhand_deconstation";
        self.var_a1d6a75620a9cc0b = 1;
    } else {
        i = randomint(3);
        switch (i) {
        case 0: 
            loot[0] = pickscriptablelootitem("tactical");
            break;
        case 1: 
            loot[0] = pickscriptablelootitem("lethal");
            break;
        case 2: 
            loot[0] = "brloot_armor_plate";
            break;
        default: 
            break;
        }
    }
    if (istrue(cyst.loot_blocked)) {
        if (!isdefined(self.var_a4b1c86a7369642b) || self.var_a4b1c86a7369642b.size < 1) {
            self.var_a4b1c86a7369642b = loot;
            return;
        }
        self.var_a4b1c86a7369642b = utility::array_combine(self.var_a4b1c86a7369642b, loot);
        return;
    }
    if (isdefined(self.var_a4b1c86a7369642b) && self.var_a4b1c86a7369642b.size > 0) {
        loot = utility::array_combine(self.var_a4b1c86a7369642b, loot);
        self.var_a4b1c86a7369642b = undefined;
    }
    if (br_gametypes::isbrgametypefuncdefined("cyst_drop_hunt_item")) {
        loot = br_gametypes::runbrgametypefunc("cyst_drop_hunt_item", loot);
    }
    if (!isdefined(loot) || loot.size < 1) {
        return;
    }
    drop_struct = br_pickups::function_7b9f3966a7a42003();
    drop_origin = cyst.origin + anglestoup(cyst.angles) * 10;
    if (drop_origin[2] <= cyst.origin[2]) {
        drop_origin -= (0, 0, 40);
    }
    drop_info = {#itemsdropped:0, #angles:anglestoup(cyst.angles), #origin:drop_origin};
    dropped_items = drop_info br_lootcache::lootspawnitemlist(drop_struct, loot, 0, undefined, 15);
    br_gametypes::runbrgametypefunc("cyst_after_drop", dropped_items);
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6bdf
// Size: 0x95
function function_9c7aaf20668cac59() {
    self endon("task_ended");
    level endon("game_ended");
    self.nest_started = 1;
    if (!isdefined(self.active_zombies)) {
        self.active_zombies = [];
    }
    thread crawler_drop();
    thread function_e20dec8c17fa960b(0);
    self waittill("zombienest_new_wave");
    thread function_e20dec8c17fa960b(1);
    thread function_c116f3e640711c4a(1);
    self waittill("zombienest_new_wave");
    thread function_e20dec8c17fa960b(2);
    thread function_c116f3e640711c4a(2);
    self waittill("zombienest_final_wave");
    thread function_564978b158da0f02();
    thread function_c116f3e640711c4a(3);
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c7c
// Size: 0x15b
function function_e20dec8c17fa960b(wave_num) {
    self endon("task_ended");
    level endon("game_ended");
    var_e075a8cc5c9bfa63 = level.var_de3cfce369a7d08f;
    aitypes = namespace_2b1145f62aa835b8::get_aitype_by_subclass_sharedfunc("zombie_base");
    base_type = aitypes[0];
    wave_size = 0;
    switch (wave_num) {
    case 0: 
        wave_size = var_e075a8cc5c9bfa63.var_c55617f6d9883a9b;
        break;
    case 1: 
        wave_size = var_e075a8cc5c9bfa63.var_345c2d401a2d390b;
        break;
    case 2: 
        wave_size = var_e075a8cc5c9bfa63.var_91fb1860c884811f;
        break;
    }
    self.var_f59cdbf646c7ca3.spawn_points = utility::array_randomize(self.var_f59cdbf646c7ca3.spawn_points);
    for (i = 0; i < wave_size; i++) {
        wait randomfloat(0.75);
        origin = self.var_f59cdbf646c7ca3.spawn_points[i].origin;
        angles = (0, randomint(360), 0);
        function_9784862ab3ab535b(origin, angles, base_type, "difficulty_easy", 0);
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ddf
// Size: 0x1a5
function function_9784862ab3ab535b(origin, angles, spawn_type, tier, is_boss) {
    zombie = namespace_2b1145f62aa835b8::spawnnewaitype_sharedfunc(spawn_type, origin, angles, "team_two_hundred");
    if (isdefined(zombie)) {
        zombie callback::add("on_zombie_ai_damaged", &function_96ca7e470db74bdb);
        zombie.task = self;
        zombie function_7e6a015226d63d6d(tier);
        var_5bb577a0f2f9e0d3 = "spawn";
        if (istrue(is_boss)) {
            zombie callback::add("on_zombie_ai_killed", &function_3ff14d2ab9b6abc3);
            zombie function_20553f0e04484a87(zombie, 0, self.var_f59cdbf646c7ca3.boss_data.var_d97331f087aabebf, "hvt");
            zombie function_516e4c50b671b284(self.teams[0]);
            self.bosses_remaining++;
            self.zombie_boss[self.zombie_boss.size] = zombie;
        } else {
            zombie callback::add("on_zombie_ai_killed", &function_2e8b80e841d8c57d);
            spawn_anim = randomint(3);
            switch (spawn_anim) {
            case 0: 
                var_5bb577a0f2f9e0d3 = "spawn";
                break;
            case 1: 
                var_5bb577a0f2f9e0d3 = "spawn_hop";
                break;
            case 2: 
                var_5bb577a0f2f9e0d3 = "spawn_fast";
                break;
            default: 
                break;
            }
        }
        zombie function_df878316aedf095a(origin, angles, var_5bb577a0f2f9e0d3);
        function_56854cb0c53ecb54(zombie);
        self.active_zombies[self.active_zombies.size] = zombie;
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f8c
// Size: 0x1eb
function function_c116f3e640711c4a(wave_num) {
    foreach (cyst in self.var_f59cdbf646c7ca3.var_15ecf14670478f34) {
        if (!istrue(cyst.destroyed)) {
            cyst thread function_365e93999510dd56("aethernest_cyst_gas_expel");
        }
    }
    switch (wave_num) {
    case 0: 
        function_77482e3120e5e3a6("snd_aethernest_start", teams::getteamdata(self.teams[0], "players"));
        break;
    case 1: 
        function_77482e3120e5e3a6("snd_aethernest_healthchange", teams::getteamdata(self.teams[0], "players"));
        earthquake(0.35, 1.7, self.var_f59cdbf646c7ca3.origin, 500);
        break;
    case 2: 
        function_77482e3120e5e3a6("snd_aethernest_healthchange", teams::getteamdata(self.teams[0], "players"));
        earthquake(0.47, 1.7, self.var_f59cdbf646c7ca3.origin, 500);
        break;
    case 3: 
        function_77482e3120e5e3a6("snd_aethernest_cleared", teams::getteamdata(self.teams[0], "players"));
        earthquake(0.6, 1.7, self.var_f59cdbf646c7ca3.origin, 500);
        break;
    default: 
        break;
    }
    playrumbleonposition("grenade_rumble", self.var_f59cdbf646c7ca3.origin);
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x717f
// Size: 0x23e
function function_564978b158da0f02() {
    self endon("task_ended");
    level endon("game_ended");
    num_to_spawn = self.var_f59cdbf646c7ca3.boss_data.count;
    type = self.var_f59cdbf646c7ca3.boss_data.type;
    tier = self.var_f59cdbf646c7ca3.boss_data.tier;
    var_d97331f087aabebf = self.var_f59cdbf646c7ca3.boss_data.var_d97331f087aabebf;
    aitypes = namespace_2b1145f62aa835b8::get_aitype_by_subclass_sharedfunc(type);
    spawn_type = aitypes[0];
    var_d556242fefe4446e = 0;
    wait 2;
    if (!isdefined(self.zombie_boss)) {
        self.zombie_boss = [];
    }
    self.bosses_remaining = 0;
    self.var_f59cdbf646c7ca3.var_2a7226733126fefe = utility::array_randomize(self.var_f59cdbf646c7ca3.var_2a7226733126fefe);
    if (type == "zombie_mimic") {
        thread function_2364820daea4d4e5(self.var_f59cdbf646c7ca3.var_2a7226733126fefe[0]);
    } else if (type == "zombie_hellhound") {
        self.var_4a3095661d76fc18 = 1;
        num_to_spawn = 1;
        var_d556242fefe4446e = 2;
    }
    for (i = 0; i < num_to_spawn; i++) {
        origin = self.var_f59cdbf646c7ca3.var_2a7226733126fefe[i].origin;
        angles = (0, randomint(360), 0);
        function_9784862ab3ab535b(origin, angles, spawn_type, tier, 1);
    }
    if (istrue(self.var_4a3095661d76fc18)) {
        self waittill("boss_wave_complete");
        for (i = 0; i < var_d556242fefe4446e; i++) {
            origin = self.var_f59cdbf646c7ca3.var_2a7226733126fefe[i].origin;
            angles = (0, randomint(360), 0);
            function_9784862ab3ab535b(origin, angles, spawn_type, tier, 1);
        }
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x73c5
// Size: 0x177
function function_2364820daea4d4e5(var_a11500b342b30e89) {
    self endon("task_ended");
    level endon("game_ended");
    if (isdefined(self.active_zombies) && self.active_zombies.size < level.var_de3cfce369a7d08f.var_ded465ae5000e22) {
        num_to_spawn = level.var_de3cfce369a7d08f.var_ded465ae5000e22 - self.active_zombies.size;
        aitypes = namespace_2b1145f62aa835b8::get_aitype_by_subclass_sharedfunc("zombie_base");
        base_type = aitypes[0];
        var_907e19c5ef6df429 = utility::array_randomize(self.var_f59cdbf646c7ca3.spawn_points);
        foreach (point in var_907e19c5ef6df429) {
            if (point == var_a11500b342b30e89) {
                var_907e19c5ef6df429 = utility::array_remove(var_907e19c5ef6df429, point);
                break;
            }
        }
        for (i = 0; i < num_to_spawn; i++) {
            wait randomfloat(0.75);
            origin = var_907e19c5ef6df429[i].origin;
            angles = (0, randomint(360), 0);
            function_9784862ab3ab535b(origin, angles, base_type, "difficulty_easy", 0);
        }
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7544
// Size: 0x69
function function_77482e3120e5e3a6(sound, players) {
    foreach (player in players) {
        if (isplayer(player)) {
            player playsoundevent(sound);
        }
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75b5
// Size: 0x9f
function function_8bad6dae81dcfb8a(damage) {
    current_health = function_6e23c830cf22415e();
    prev_health = current_health + damage;
    if (prev_health >= level.var_de3cfce369a7d08f.var_f8c730eecd8cb2ce && current_health <= level.var_de3cfce369a7d08f.var_f8c730eecd8cb2ce) {
        self notify("zombienest_new_wave");
        return;
    }
    if (prev_health >= level.var_de3cfce369a7d08f.var_f8c72feecd8cb09b && current_health <= level.var_de3cfce369a7d08f.var_f8c72feecd8cb09b) {
        self notify("zombienest_new_wave");
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x765c
// Size: 0x7f
function function_6e23c830cf22415e() {
    current_health = 0;
    foreach (cyst in self.var_f59cdbf646c7ca3.var_15ecf14670478f34) {
        current_health += cyst.health;
    }
    self.var_ec031f5af338bc24 = current_health;
    return current_health;
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x76e4
// Size: 0x4d
function function_9f61ce12bbb16cac() {
    self.task endon("nest_started");
    self.task endon("task_ended");
    self endon("death");
    level endon("game_ended");
    while (true) {
        namespace_2b1145f62aa835b8::Animscripted_SharedFunc(self.idle_anim, "idle_end", undefined, undefined);
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7739
// Size: 0x101
function crawler_drop() {
    self notify("nest_started");
    nest = self.var_f59cdbf646c7ca3;
    if (isdefined(nest.ceiling_spawner)) {
        if (isdefined(nest.ceiling_spawner.crawler)) {
            nest.ceiling_spawner.crawler thread namespace_2b1145f62aa835b8::Animscripted_SharedFunc("spawn_nest_crawler_single", "spawn_end", undefined, undefined);
            nest.ceiling_spawner.crawler val::set("idle_hang", "damage", 1);
        }
        if (isdefined(nest.ceiling_spawner.crawler2)) {
            nest.ceiling_spawner.crawler2 thread namespace_2b1145f62aa835b8::Animscripted_SharedFunc("spawn_nest_crawler_single", "spawn_end", undefined, undefined);
            nest.ceiling_spawner.crawler2 val::set("idle_hang", "damage", 1);
        }
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7842
// Size: 0x5c
function function_b92fe4518e875443(offsets, axes) {
    x_axis = axes["forward"];
    y_axis = axes["right"];
    z_axis = axes["up"];
    return offsets[0] * x_axis + offsets[1] * y_axis + offsets[2] * z_axis;
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x78a7
// Size: 0x90
function function_df878316aedf095a(origin, angles, var_5bb577a0f2f9e0d3) {
    if (utility::function_8fa69650e33c84ef(var_5bb577a0f2f9e0d3)) {
        original_origin = origin;
        new_origin = getgroundposition(origin, 32, 720, 100);
        animscripted_origin = new_origin;
        var_5f41de053ae1fe72 = 10;
        if (abs(utility::function_8efc1cbdaa97f95e(var_5bb577a0f2f9e0d3)[2]) > var_5f41de053ae1fe72) {
            animscripted_origin = original_origin;
        }
        thread utility::function_577d8abff6067c23(var_5bb577a0f2f9e0d3, "spawn_end", animscripted_origin, angles, "spawn_animating");
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x793f
// Size: 0x93
function function_7e6a015226d63d6d(difficulty) {
    self.difficulty = difficulty;
    round_number = level.var_f721fc7d0d2d0f47.var_b9cd1d50a91eb69e[difficulty];
    self.difficulty_round = round_number;
    if (isdefined(self.zombieaisettings.healthscriptbundle)) {
        scripts\common\ai::function_dd21d67ede8ba22(function_d6b1df5b43145297(self.zombieaisettings.healthscriptbundle, round_number));
        self.health = self.maxhealth;
    }
    function_4fd50faaf7767e65(self, difficulty, round_number);
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x79da
// Size: 0x15a
function function_d6b1df5b43145297(scriptbundle_name, n_round) {
    health_bundle = getscriptbundle("healthscalinground:" + scriptbundle_name);
    assert(isdefined(health_bundle));
    var_fe0aad7efc61fcae = health_bundle.var_5fa2f1ef669d2826;
    base = default_to(self.basehealth, 100);
    max = default_to(health_bundle.maxhealth, base);
    var_3edf6b4eb93f6f0d = health_bundle.var_de69a4842af7b496;
    result_health = base;
    var_30d177f7b4f9f195 = 1;
    n_index = 0;
    while (var_30d177f7b4f9f195 < n_round) {
        if (isdefined(var_fe0aad7efc61fcae[n_index + 1].startround) && var_30d177f7b4f9f195 >= var_fe0aad7efc61fcae[n_index + 1].startround) {
            n_index++;
        }
        if (isdefined(var_fe0aad7efc61fcae[n_index].var_d9a25092bed9b107)) {
            result_health += var_fe0aad7efc61fcae[n_index].var_d9a25092bed9b107;
        }
        var_30d177f7b4f9f195++;
    }
    if (isdefined(max) && result_health > max) {
        result_health = max;
    }
    num_players = 3;
    if (isdefined(var_3edf6b4eb93f6f0d) && num_players > 1) {
        result_health += result_health * (num_players - 1) * var_3edf6b4eb93f6f0d;
    }
    return int(result_health);
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b3d
// Size: 0x224
function function_4fd50faaf7767e65(ai, difficulty, round_number) {
    damage_increase = 1;
    if (round_number > 10 && round_number <= 30) {
        damage_increase = 1.666;
    }
    if (istrue(ai.enablemelee)) {
        ai.melee_damage = int(ceil(ai.var_8b184e6eade0bc4f * damage_increase));
    }
    if (isdefined(ai.grenadeweapon)) {
        ai.var_b285453af8b7df75 = int(ceil(ai.grenadeweapon.maxdamage * damage_increase));
    }
    if (isdefined(ai._blackboard.var_c406031fea1f3214)) {
        ai._blackboard.var_c406031fea1f3214 = int(ceil(ai.zombieaisettings.var_3a54f74770e61046 * damage_increase));
    }
    if (is_equal(ai.aicategory, "normal")) {
        speed_str = "run";
        archetype = ai getbasearchetype();
        var_2a1d46d92ea44a14 = isdefined(getanimspeedthreshold(archetype, "sprint"));
        if (var_2a1d46d92ea44a14) {
            switch (difficulty) {
            case #"hash_7bb2cd766703d463": 
                speed_str = "run";
                if (randomint(100) <= 25) {
                    speed_str = "sprint";
                }
                break;
            case #"hash_af83e47edfa8900a": 
                speed_str = "run";
                if (randomint(100) <= 60) {
                    speed_str = "sprint";
                }
                break;
            }
        }
        ai utility::function_f3bb4f4911a1beb2("zombie_utils", "setMoveSpeed", speed_str, "difficulty_region", 1);
        params = spawnstruct();
        params.ai = ai;
        params.difficulty = difficulty;
        params.id = "difficulty_region";
        params.priority = 1;
        level callback::callback("set_region_difficulty_manager_speed", params);
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d69
// Size: 0x40
function function_96ca7e470db74bdb(params) {
    if (isdefined(self.task) && !istrue(self.task.ended)) {
        self.task function_97d7132fe8aa4c5c();
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7db1
// Size: 0x1dc
function function_2e8b80e841d8c57d(params) {
    if (isdefined(self.task) && !istrue(self.task.ended)) {
        self.task.active_zombies = utility::array_remove(self.task.active_zombies, self);
        if (isdefined(params.eattacker) && isdefined(params.smeansofdeath) && params.smeansofdeath != "MOD_SUICIDE") {
            params.eattacker points::doScoreEvent(#"zombie_kia", undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, 1);
            if (utility::cointoss()) {
                loot = [];
                i = randomint(3);
                switch (i) {
                case 0: 
                    loot[0] = pickscriptablelootitem("tactical");
                    break;
                case 1: 
                    loot[0] = pickscriptablelootitem("lethal");
                    break;
                case 2: 
                    loot[0] = "brloot_armor_plate";
                    break;
                default: 
                    break;
                }
                drop_struct = br_pickups::function_7b9f3966a7a42003();
                drop_info = {#itemsdropped:0, #angles:self.angles, #origin:self.origin};
                dropped_items = drop_info br_lootcache::lootspawnitemlist(drop_struct, loot, 1);
            }
            if (br_gametypes::isbrgametypefuncdefined("zombie_drop_hunt_item")) {
                br_gametypes::runbrgametypefunc("zombie_drop_hunt_item");
            }
            function_e08b4c9eee969ed0(self.origin, self.agent_type);
        }
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f95
// Size: 0x64f
function function_3ff14d2ab9b6abc3(params) {
    if (isdefined(self.task) && !istrue(self.task.ended)) {
        self.task.active_zombies = array_remove(self.task.active_zombies, self);
        self.task.bosses_remaining--;
        if (isdefined(params.eattacker) && isdefined(params.smeansofdeath) && params.smeansofdeath != "MOD_SUICIDE") {
            params.eattacker points::doScoreEvent(#"hash_d9eee31ed154db7f", undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, 1);
            function_e08b4c9eee969ed0(self.origin, self.agent_type);
        }
        if (self.task.bosses_remaining <= 0 && !istrue(self.task.var_4a3095661d76fc18)) {
            if (isdefined(params.eattacker) && params.eattacker scripts\common\vehicle::isvehicle()) {
                if (isdefined(params.eattacker.lastowner) && namespace_c133516bfc1d803c::function_22239d4cff05d0a1(params.eattacker.lastowner.team) == self.task) {
                    correct_team = 1;
                }
            }
            if (istrue(correct_team) || isdefined(params.eattacker) && isdefined(params.eattacker.team) && params.eattacker.team == self.task.teams[0]) {
                namespace_c133516bfc1d803c::displaysquadmessagetoteam(self.task.teams[0], teams::getteamdata(self.task.teams[0], "players")[0], 8, namespace_c133516bfc1d803c::getquestindex("zombienest"));
                level thread br_public::brleaderdialogteam("mission_zombienest_success", self.task.teams[0], 1, 2, undefined, "dx_br_smis_");
                rewards = namespace_c133516bfc1d803c::function_d212a5e7a40d7c8d("zombienest", self.task.teams[0], teams::getteamdata(self.task.teams[0], "players")[0]);
                if (!br_public::istutorial()) {
                    if (isdefined(rewards) && isdefined(rewards["plunder"])) {
                        namespace_c133516bfc1d803c::function_878ebcc241b54505("br_zombienest_quest_complete", namespace_c133516bfc1d803c::function_3d262d56274bd22e("zombienest"), rewards["plunder"], self.task.teams[0], undefined, "splash_list_br_contract_zombienest");
                    }
                }
                self.task thread function_ae065127a63b0829(1, 1);
            } else if (isdefined(params.eattacker) && isdefined(params.eattacker.team) && params.eattacker.team != self.task.teams[0]) {
                params = {#intvar:0};
                self.task namespace_c133516bfc1d803c::displayteamsplash(self.task.teams[0], "br_zombienest_quest_poached", params, "splash_list_br_contract_zombienest");
                level thread br_public::brleaderdialogteam("mission_zombienest_fail_team", self.task.teams[0], 1, 2, undefined, "dx_br_smis_");
                self.task thread function_ae065127a63b0829(2, 1);
            } else {
                assertmsg("<dev string:x12a>");
            }
            dropstruct = br_pickups::function_7b9f3966a7a42003();
            dropinfo = {#itemsdropped:0, #angles:self.angles, #origin:self.origin};
            dropinfo br_lootcache::lootspawnitemlist(dropstruct, self.task.rewards, 0);
            radius = 50;
            anglefrac = 180;
            powerups = ["full_armor", "full_ammo"];
            root = scripts\common\powerups::function_ecdae672c660149e();
            foreach (i, powerup in powerups) {
                angle = anglefrac * i;
                var_8a9f895755fd607e = cos(angle) * radius;
                var_d867033ab311670b = sin(angle) * radius;
                x = self.origin[0] + var_8a9f895755fd607e;
                y = self.origin[1] + var_d867033ab311670b;
                z = self.origin[2];
                spawn_location = getclosestpointonnavmesh((x, y, z)) + (0, 0, root.powerup_vars["drop_height_offset"]);
                if (utility::issharedfuncdefined("powerups", "dropPowerup")) {
                    utility::function_f3bb4f4911a1beb2("powerups", "dropPowerup", powerup, spawn_location);
                }
            }
        } else if (istrue(self.task.var_4a3095661d76fc18)) {
            self.task.var_4a3095661d76fc18 = 0;
            self.task notify("boss_wave_complete");
        }
        if (br_gametypes::isbrgametypefuncdefined("zombie_drop_hunt_item")) {
            br_gametypes::runbrgametypefunc("zombie_drop_hunt_item");
        }
    }
    if (isdefined(self.objectiveiconid)) {
        namespace_c133516bfc1d803c::deletequestobjicon();
        self.objectiveiconid = undefined;
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x85ec
// Size: 0x3b
function function_15b82c4d1c0ba4ff(player) {
    if (!isdefined(self.var_4ab29f5f9b31b3bc)) {
        self.var_4ab29f5f9b31b3bc = [];
    }
    self.var_4ab29f5f9b31b3bc = utility::function_6d6af8144a5131f1(self.var_4ab29f5f9b31b3bc, player);
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x862f
// Size: 0xd0
function function_5abdf1eee244921c(player) {
    if (isdefined(self.var_4ab29f5f9b31b3bc)) {
        self.var_4ab29f5f9b31b3bc = utility::array_remove(self.var_4ab29f5f9b31b3bc, player);
    }
    foreach (zombie in self.active_zombies) {
        zombie utility::function_f3bb4f4911a1beb2("zombie_utils", "setTarget", undefined, "player_" + player getentitynumber());
        zombie function_731a8d6c599a0a10(player);
        if (isdefined(zombie.favoriteenemy) && zombie.favoriteenemy == player) {
            zombie.favoriteenemy = undefined;
        }
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8707
// Size: 0x61
function function_4d86cf7193d4a9c() {
    self.zombies_agitated = 0;
    foreach (zombie in self.active_zombies) {
        zombie function_3150ab6d409750d7();
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8770
// Size: 0x68
function function_3150ab6d409750d7(priority) {
    if (!isdefined(priority)) {
        priority = 0;
    }
    if (isalive(self)) {
        utility::function_f3bb4f4911a1beb2("zombie_attractor", "addOnSelf", self.task.var_f59cdbf646c7ca3, priority);
        thread function_a2f60fa6657482a1(self.task.var_f59cdbf646c7ca3);
        self.ignoreall = 1;
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x87e0
// Size: 0x89
function function_a2f60fa6657482a1(nest) {
    level endon("game_ended");
    self.task endon("task_ended");
    self.task endon("zombies_agitated");
    while (true) {
        if (utility::function_acb96530881571aa(self, nest.origin, 50)) {
            break;
        }
        wait 0.5;
    }
    utility::function_f3bb4f4911a1beb2("zombie_attractor", "removeOnSelf", nest);
    self clearenemy();
    self aieventlistenerevent("idle", undefined, nest.origin);
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8871
// Size: 0xbc
function function_97d7132fe8aa4c5c() {
    if (istrue(self.nest_started) && !istrue(self.zombies_agitated)) {
        self notify("zombies_agitated");
        self.zombies_agitated = 1;
        foreach (zombie in self.active_zombies) {
            if (isdefined(zombie.var_1ab5d1f76bea23a5)) {
                zombie utility::function_f3bb4f4911a1beb2("zombie_attractor", "removeOnSelf", self.var_f59cdbf646c7ca3);
            }
            zombie.ignoreall = 0;
            function_56854cb0c53ecb54(zombie);
        }
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8935
// Size: 0xf4
function function_56854cb0c53ecb54(zombie) {
    if (isdefined(self.var_a67f8b76a32cd01a) && self.var_a67f8b76a32cd01a.size > 0) {
        if (isdefined(zombie.enemy)) {
            foreach (player in self.var_4ab29f5f9b31b3bc) {
                if (player == zombie.enemy) {
                    return;
                }
            }
        }
        var_a8e14e379ce5aef0 = sortbydistance(self.var_4ab29f5f9b31b3bc, zombie.origin)[0];
        if (isdefined(var_a8e14e379ce5aef0)) {
            zombie utility::function_f3bb4f4911a1beb2("zombie_utils", "setTarget", var_a8e14e379ce5aef0, "player_" + var_a8e14e379ce5aef0 getentitynumber(), 0);
        } else {
            function_4d86cf7193d4a9c();
        }
        return;
    }
    function_4d86cf7193d4a9c();
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a31
// Size: 0x18
function function_845a94db40b85c79() {
    level endon("game_ended");
    wait 5;
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a51
// Size: 0xb4
function function_eb4fe8866f0936ea(params) {
    val::set("br_death", "ignoreme", 1);
    var_f0fb6feb6569cd33 = function_77eba21ac8e52ca5(self.origin);
    if (isdefined(var_f0fb6feb6569cd33)) {
        task = var_f0fb6feb6569cd33.task;
        task function_5abdf1eee244921c(self);
        foreach (zombie in task.active_zombies) {
            task function_56854cb0c53ecb54(zombie);
        }
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b0d
// Size: 0xf1
function function_6a619d1bed520646(params) {
    val::reset("br_death", "ignoreme");
    var_f0fb6feb6569cd33 = function_77eba21ac8e52ca5(self.origin);
    if (isdefined(var_f0fb6feb6569cd33)) {
        task = var_f0fb6feb6569cd33.task;
        if (utility::array_contains(task.var_a67f8b76a32cd01a, self)) {
            task function_15b82c4d1c0ba4ff(self);
            if (utility::array_contains(task.var_34eac412f9dd7c2b, self)) {
                task function_97d7132fe8aa4c5c();
            }
            if (istrue(self.zombies_agitated)) {
                foreach (zombie in task.active_zombies) {
                    task function_56854cb0c53ecb54(zombie);
                }
            }
        }
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c06
// Size: 0xcb
function function_77eba21ac8e52ca5(search_origin) {
    var_be22b4569ccbb63f = [];
    foreach (nest in level.var_de3cfce369a7d08f.var_2583679d5dd79218) {
        if (isdefined(nest.task) && !istrue(nest.ended) && istrue(nest.task.var_ee01b2d72e3aa653)) {
            var_be22b4569ccbb63f[var_be22b4569ccbb63f.size] = nest;
        }
    }
    if (var_be22b4569ccbb63f.size == 0) {
        return undefined;
    }
    var_f0fb6feb6569cd33 = sortbydistance(var_be22b4569ccbb63f, search_origin)[0];
    return var_f0fb6feb6569cd33;
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8cda
// Size: 0x71
function function_daf7a654755217f2(params) {
    eventparams = [];
    eventparams[eventparams.size] = "completion_state";
    eventparams[eventparams.size] = params.completion_state;
    eventparams[eventparams.size] = "nest_location";
    eventparams[eventparams.size] = params.nest_location;
    eventparams[eventparams.size] = "hvt_type";
    eventparams[eventparams.size] = params.hvt_type;
    dlog_recordevent("dlog_event_br_eradication_contract_complete", eventparams);
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d53
// Size: 0x6b
function function_e08b4c9eee969ed0(position, zombie_type) {
    eventparams = ["pos_x", position[0], "pos_y", position[1], "pos_z", position[2], "zombie_type", zombie_type];
    dlog_recordevent("dlog_event_br_eradication_zombie_killed", eventparams);
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8dc6
// Size: 0xa0
function function_a200944290c18eae(grenade) {
    grenade endon("death");
    thread scripts\mp\equipment\decoy_grenade::decoy_used(grenade);
    grenade waittill("decoy_activated");
    var_f0fb6feb6569cd33 = sortbydistance(level.var_de3cfce369a7d08f.var_2583679d5dd79218, grenade.origin)[0];
    task = var_f0fb6feb6569cd33.task;
    grenade.attractor = utility::function_f3bb4f4911a1beb2("zombie_attractor", "addAttractor", grenade, 1, 1000, 0, undefined, &function_169df21202024d0, 0, undefined, 1);
    grenade thread function_bc40d6005e682b20(task);
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e6e
// Size: 0xa8
function function_bc40d6005e682b20(task) {
    self waittill("death");
    if (isdefined(self.attractor)) {
        utility::function_f3bb4f4911a1beb2("zombie_attractor", "removeAttractor", self.attractor);
    }
    if (isdefined(task) && task function_87cfbfeba9393973()) {
        task function_97d7132fe8aa4c5c();
        foreach (zombie in self.active_zombies) {
            task function_56854cb0c53ecb54(zombie);
        }
    }
}

// Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f1e
// Size: 0x8c
function function_169df21202024d0(attractor, ai) {
    if (issubstr(ai.subclass, "armored") || issubstr(ai.subclass, "hellhound") || issubstr(ai.subclass, "mimic")) {
        return false;
    }
    if (!isdefined(ai.task) || !ai.task.zombies_agitated) {
        return false;
    }
    return true;
}

/#

    // Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x8fb3
    // Size: 0xf9
    function function_4e34370c01cfc47b() {
        level endon("<dev string:x16a>");
        while (true) {
            if (getdvarint(@"hash_b964c14b65456862", 0) == 1) {
                if (!istrue(self.var_8296e7984a23912e)) {
                    task = function_14aaa6c0de93e71d();
                    self.var_8296e7984a23912e = 1;
                }
                waitframe();
                setdvar(@"hash_b964c14b65456862", 0);
            }
            if (getdvarint(@"hash_3764f88c46b94cdf", 0) == 1) {
                if (!istrue(self.var_8296e7984a23912e)) {
                    task = function_14aaa6c0de93e71d(1);
                    self.var_8296e7984a23912e = 1;
                }
                waitframe();
                setdvar(@"hash_3764f88c46b94cdf", 0);
            }
            if (getdvarint(@"hash_b514aa4f0bc70e91", 0) == 1) {
                task = level.players[0].active_task;
                if (isdefined(task)) {
                    task function_ae065127a63b0829(0);
                }
                waitframe();
                setdvar(@"hash_b514aa4f0bc70e91", 0);
            }
            wait 1;
        }
    }

    // Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x90b4
    // Size: 0x24c
    function function_14aaa6c0de93e71d(get_points) {
        if (!isdefined(get_points)) {
            get_points = 0;
        }
        task = spawnstruct();
        task.teams = [];
        task.type = {#ref:"<dev string:x175>"};
        task.tablet = {#angles:level.players[0].angles, #origin:level.players[0].origin};
        foreach (type in level.contractmanager.contractdata) {
            if (type.ref == task.type.ref) {
                task.type.index = type.index;
            }
        }
        task.var_f59cdbf646c7ca3 = sortbydistance(level.var_de3cfce369a7d08f.var_2583679d5dd79218, level.players[0].origin)[0];
        if (get_points) {
            task thread function_11030274435e4ff7(1);
        }
        if (isdefined(task.var_f59cdbf646c7ca3)) {
            if (function_7094c7010c5e3827(level.players[0].team)) {
                assertmsg(level.players[0].team + "<dev string:x180>");
                return;
            }
            task function_8ad1b4ddc1fd852a(level.players[0].team, level.players[0]);
            task.var_7ca287a82f54e4f6 = level.players[0];
            task function_dcc897cdf0a89369(get_points);
            if (br_gametypes::isbrgametypefuncdefined("<dev string:x1c0>")) {
                br_gametypes::runbrgametypefunc("<dev string:x1c0>", task, level.players[0].team);
            }
            return task;
        }
        return undefined;
    }

    // Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x9308
    // Size: 0x1ed
    function function_dcc897cdf0a89369(var_ce70646c225c170d) {
        if (!isdefined(var_ce70646c225c170d)) {
            var_ce70646c225c170d = 0;
        }
        time = level.var_de3cfce369a7d08f.time;
        if (var_ce70646c225c170d) {
            namespace_c133516bfc1d803c::uiobjectiveshowtoteam("<dev string:x175>", self.teams[0]);
            function_92c1e7e3136ad154();
            game_utility::function_6b6b6273f8180522("<dev string:x1ce>", self.var_6078eb76085c3221[0].origin, level.var_de3cfce369a7d08f.circle_radius);
            foreach (player in teams::getteamdata(self.teams[0], "<dev string:x1da>")) {
                game_utility::function_cfd53c8f6878014f(player);
                player.active_task = self;
                self.active_path = self.footstep_paths[0];
                self.var_46cfa00a3c715d51 = 0;
                thread function_fe6ed3e33642aeba(player, self.active_path);
                player thread function_2af5e50a915f1920(self.active_path);
            }
        } else {
            namespace_c133516bfc1d803c::uiobjectiveshowtoteam("<dev string:x1e2>", self.teams[0]);
            foreach (player in teams::getteamdata(self.teams[0], "<dev string:x1da>")) {
                player.active_task = self;
            }
        }
        self.category = "<dev string:x175>";
        time = namespace_c133516bfc1d803c::function_9b6275085fbcb8f4(time);
        namespace_c133516bfc1d803c::function_5a15174d34f0670c(time, 0);
        thread function_e4a9b03d2930aafb();
        thread function_7667d54cafb43a31();
        thread function_8586c8d5c6dad9ec();
    }

    // Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x94fd
    // Size: 0x13c
    function function_561ffdaca5b546d3() {
        level waittill("<dev string:x1f2>");
        foreach (point in self.var_674ccca06e1c6205) {
            path = level.players[0] findpath(point.origin, point.nest.origin);
            point.scriptable.path = {#path:path};
            point.scriptable.path.var_a5a1a3685b2cdfe7 = spawn("<dev string:x201>", point.scriptable.path.path[0]);
            point.scriptable.path thread function_ca0219b7de04f1c8();
            point.scriptable.path thread function_9a387a79e023c865(0);
        }
    }

    // Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x9641
    // Size: 0xa0
    function function_642f50e2994cc88a() {
        level endon("<dev string:x16a>");
        level endon("<dev string:x10e>");
        while (true) {
            foreach (footprint in self.footprints) {
                playfx(footprint.print_type, footprint.origin, footprint.forward, undefined, level.players[0], 1);
            }
            wait 8;
        }
    }

    // Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x96e9
    // Size: 0x1dd
    function debug_init() {
        devgui::function_6e7290c8ee4f558b("<dev string:x20e>");
        devgui::function_a9a864379a098ad6("<dev string:x22f>", "<dev string:x239>", &function_9bb82c8734a573e8);
        devgui::function_a9a864379a098ad6("<dev string:x24d>", "<dev string:x261>", &function_6b8f7e02363c5cfd);
        devgui::function_a9a864379a098ad6("<dev string:x278>", "<dev string:x287>", &function_34d74121eb62d0fe);
        devgui::function_a9a864379a098ad6("<dev string:x2a0>", "<dev string:x2b7>", &function_57ce3c8a1159b699);
        devgui::function_fe953f000498048f();
        devgui::function_6e7290c8ee4f558b("<dev string:x2d8>");
        devgui::function_a9a864379a098ad6("<dev string:x30b>", "<dev string:x318>", &function_4bac6cd9d73637eb);
        devgui::function_a9a864379a098ad6("<dev string:x32f>", "<dev string:x347>", &function_f058741abf76ef6e);
        devgui::function_fe953f000498048f();
        devgui::function_6e7290c8ee4f558b("<dev string:x35b>");
        devgui::function_a9a864379a098ad6("<dev string:x38b>", "<dev string:x39d>", &function_fd00c93f2b9a8e2b);
        devgui::function_a9a864379a098ad6("<dev string:x3b9>", "<dev string:x3c7>", &function_42fcb3035ec65ad3);
        devgui::function_a9a864379a098ad6("<dev string:x3df>", "<dev string:x3ef>", &function_bf455de9fd076428);
        devgui::function_a9a864379a098ad6("<dev string:x409>", "<dev string:x415>", &function_a54493cb8f101422);
        devgui::function_a9a864379a098ad6("<dev string:x42b>", "<dev string:x43b>", &function_a2a8e024544d03bf);
        devgui::function_a9a864379a098ad6("<dev string:x455>", "<dev string:x46e>", &function_cf50d7c9e197b5fc);
        devgui::function_fe953f000498048f();
        devgui::function_6e7290c8ee4f558b("<dev string:x489>");
        devgui::function_a9a864379a098ad6("<dev string:x4b9>", "<dev string:x4d2>", &function_30a6365c339c10f6);
        devgui::function_a9a864379a098ad6("<dev string:x4f4>", "<dev string:x509>", &function_3162064fda5fd39e);
        devgui::function_a9a864379a098ad6("<dev string:x527>", "<dev string:x53e>", &function_7d68cd7aad1e7091);
        devgui::function_a9a864379a098ad6("<dev string:x55e>", "<dev string:x571>", &function_de0230ec8403cc5f);
        devgui::function_a9a864379a098ad6("<dev string:x58d>", "<dev string:x5a4>", &function_a74ca1aa250e9122);
        devgui::function_a9a864379a098ad6("<dev string:x5c4>", "<dev string:x5e4>", &function_d1726523cbfb3b8d);
        devgui::function_fe953f000498048f();
    }

    // Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x98ce
    // Size: 0x7b
    function function_9bb82c8734a573e8() {
        poi = scripts\mp\poi::function_6cc445c02b5effac(level.players[0].origin);
        poi_sub = scripts\mp\poi::function_d795b532bedd6431(poi, level.players[0].origin);
        iprintln("<dev string:x605>" + poi);
        if (isdefined(poi_sub)) {
            iprintln("<dev string:x614>" + poi_sub.var_71ad22c5d093d90b);
        }
    }

    // Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x9951
    // Size: 0x16
    function function_6b8f7e02363c5cfd() {
        setdvar(@"hash_b514aa4f0bc70e91", 1);
    }

    // Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x996f
    // Size: 0x16
    function function_34d74121eb62d0fe() {
        setdvar(@"hash_3764f88c46b94cdf", 1);
    }

    // Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x998d
    // Size: 0x16
    function function_57ce3c8a1159b699() {
        setdvar(@"hash_b964c14b65456862", 1);
    }

    // Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x99ab
    // Size: 0x1a
    function function_4bac6cd9d73637eb() {
        level.player scripts\mp\utility\perk::giveperk("<dev string:x621>");
    }

    // Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x99cd
    // Size: 0x84
    function function_f058741abf76ef6e() {
        if (istrue(level.var_de3cfce369a7d08f.var_78e879ff07bbfd2f)) {
            level.var_de3cfce369a7d08f.var_78e879ff07bbfd2f = 0;
            level notify("<dev string:x74>");
            return;
        }
        if (isdefined(level.var_de3cfce369a7d08f.var_5f9281806605c0b7)) {
            level.var_de3cfce369a7d08f.var_5f9281806605c0b7 thread function_1b693b431c3259c9();
        }
        level.var_de3cfce369a7d08f.var_78e879ff07bbfd2f = 1;
    }

    // Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x9a59
    // Size: 0x7a
    function function_1b693b431c3259c9() {
        level notify("<dev string:x74>");
        level endon("<dev string:x74>");
        for (i = 0; i < self.path.size; i++) {
            if (isdefined(self.path[i + 1])) {
                debug::debug_line(self.path[i], self.path[i + 1], (0, 0, 1), undefined, "<dev string:x74>");
            }
        }
    }

    // Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
    // Params 4, eflags: 0x0
    // Checksum 0x0, Offset: 0x9adb
    // Size: 0x1cb
    function function_a6b562c4f6189323(type, var_5bb577a0f2f9e0d3, difficulty, boss) {
        var_e075a8cc5c9bfa63 = level.var_de3cfce369a7d08f;
        cameracenter = level.player getvieworigin();
        cameraorientation = level.player getplayerangles();
        cameraforward = anglestoforward(cameraorientation);
        cameratraceend = cameracenter + cameraforward * 1000;
        var_2fc7b90001702e5c = level.player;
        var_e76c084d206cfb7f = scripts\engine\trace::create_itemclip_contents();
        deploytrace = scripts\engine\trace::ray_trace(cameracenter, cameratraceend, var_2fc7b90001702e5c, var_e76c084d206cfb7f, 0, 0, 1);
        deploypos = deploytrace["<dev string:x633>"];
        deployorientation = vectortoangles(anglestoforward(level.player.angles) * -1);
        zombie = namespace_2b1145f62aa835b8::spawnnewaitype_sharedfunc(type, deploypos, deployorientation, "<dev string:x63c>");
        zombie.task = {#active_zombies:[zombie], #ended:0};
        if (istrue(boss)) {
            zombie callback::add("<dev string:x64d>", &function_3ff14d2ab9b6abc3);
            zombie.task.bosses_remaining = 10;
        } else {
            zombie callback::add("<dev string:x64d>", &function_2e8b80e841d8c57d);
        }
        zombie function_7e6a015226d63d6d(difficulty);
        if (isdefined(var_5bb577a0f2f9e0d3) && isdefined(zombie)) {
            zombie function_df878316aedf095a(deploypos, deploypos, var_5bb577a0f2f9e0d3);
        }
        level.var_de3cfce369a7d08f.debug_zombie = zombie;
    }

    // Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x9cae
    // Size: 0x3b
    function function_fd00c93f2b9a8e2b() {
        aitypes = namespace_2b1145f62aa835b8::get_aitype_by_subclass_sharedfunc("<dev string:x661>");
        var_9f578d49d039394b = aitypes[0];
        function_a6b562c4f6189323(var_9f578d49d039394b, "<dev string:x66d>", "<dev string:x673>");
    }

    // Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x9cf1
    // Size: 0x3b
    function function_30a6365c339c10f6() {
        aitypes = namespace_2b1145f62aa835b8::get_aitype_by_subclass_sharedfunc("<dev string:x661>");
        var_9f578d49d039394b = aitypes[0];
        function_a6b562c4f6189323(var_9f578d49d039394b, "<dev string:x66d>", "<dev string:x683>");
    }

    // Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x9d34
    // Size: 0x91
    function function_42fcb3035ec65ad3() {
        aitypes = namespace_2b1145f62aa835b8::get_aitype_by_subclass_sharedfunc("<dev string:x695>");
        var_ea3e656b50d22272 = aitypes[0];
        foreach (aitype in aitypes) {
            if (issubstr(aitype, "<dev string:x6ae>")) {
                var_ea3e656b50d22272 = aitype;
            }
        }
        function_a6b562c4f6189323(var_ea3e656b50d22272, "<dev string:x66d>", "<dev string:x673>");
    }

    // Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x9dcd
    // Size: 0x91
    function function_3162064fda5fd39e() {
        aitypes = namespace_2b1145f62aa835b8::get_aitype_by_subclass_sharedfunc("<dev string:x695>");
        var_ea3e656b50d22272 = aitypes[0];
        foreach (aitype in aitypes) {
            if (issubstr(aitype, "<dev string:x6ae>")) {
                var_ea3e656b50d22272 = aitype;
            }
        }
        function_a6b562c4f6189323(var_ea3e656b50d22272, "<dev string:x66d>", "<dev string:x683>");
    }

    // Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x9e66
    // Size: 0x3d
    function function_bf455de9fd076428() {
        aitypes = namespace_2b1145f62aa835b8::get_aitype_by_subclass_sharedfunc("<dev string:x6b3>");
        spawn_type = aitypes[0];
        function_a6b562c4f6189323(spawn_type, "<dev string:x66d>", "<dev string:x673>", 1);
    }

    // Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x9eab
    // Size: 0x3b
    function function_7d68cd7aad1e7091() {
        aitypes = namespace_2b1145f62aa835b8::get_aitype_by_subclass_sharedfunc("<dev string:x6b3>");
        spawn_type = aitypes[0];
        function_a6b562c4f6189323(spawn_type, "<dev string:x66d>", "<dev string:x683>");
    }

    // Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x9eee
    // Size: 0x3d
    function function_a54493cb8f101422() {
        aitypes = namespace_2b1145f62aa835b8::get_aitype_by_subclass_sharedfunc("<dev string:x6c4>");
        spawn_type = aitypes[0];
        function_a6b562c4f6189323(spawn_type, "<dev string:x66d>", "<dev string:x673>", 1);
    }

    // Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x9f33
    // Size: 0x3b
    function function_de0230ec8403cc5f() {
        aitypes = namespace_2b1145f62aa835b8::get_aitype_by_subclass_sharedfunc("<dev string:x6c4>");
        spawn_type = aitypes[0];
        function_a6b562c4f6189323(spawn_type, "<dev string:x66d>", "<dev string:x683>");
    }

    // Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x9f76
    // Size: 0x3b
    function function_a2a8e024544d03bf() {
        aitypes = namespace_2b1145f62aa835b8::get_aitype_by_subclass_sharedfunc("<dev string:x6d1>");
        spawn_type = aitypes[0];
        function_a6b562c4f6189323(spawn_type, "<dev string:x66d>", "<dev string:x673>");
    }

    // Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x9fb9
    // Size: 0x3b
    function function_a74ca1aa250e9122() {
        aitypes = namespace_2b1145f62aa835b8::get_aitype_by_subclass_sharedfunc("<dev string:x6d1>");
        spawn_type = aitypes[0];
        function_a6b562c4f6189323(spawn_type, "<dev string:x66d>", "<dev string:x683>");
    }

    // Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x9ffc
    // Size: 0x3d
    function function_cf50d7c9e197b5fc() {
        aitypes = namespace_2b1145f62aa835b8::get_aitype_by_subclass_sharedfunc("<dev string:x6e2>");
        spawn_type = aitypes[0];
        function_a6b562c4f6189323(spawn_type, "<dev string:x66d>", "<dev string:x673>", 1);
    }

    // Namespace namespace_32e9b198f2c5f0d7 / namespace_a8730b80ab5fc256
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xa041
    // Size: 0x3b
    function function_d1726523cbfb3b8d() {
        aitypes = namespace_2b1145f62aa835b8::get_aitype_by_subclass_sharedfunc("<dev string:x6e2>");
        spawn_type = aitypes[0];
        function_a6b562c4f6189323(spawn_type, "<dev string:x66d>", "<dev string:x683>");
    }

#/
