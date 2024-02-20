// mwiii decomp prototype
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
#using script_38eb8f4be20d54f4;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using script_4948cdf739393d2d;
#using script_3b64eb40368c1450;
#using script_120270bd0a747a35;
#using script_77c18cdedec620b3;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_16ea1b94f0f381b3;
#using scripts\asm\shared\mp\utility.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\weapons.gsc;
#using script_5def7af2a9f04234;
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
#using script_427ce33ec0c820cf;
#using scripts\mp\equipment\decoy_grenade.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\engine\trace.gsc;

#namespace namespace_32e9b198f2c5f0d7;

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x1330
// Size: 0x19
function autoexec main() {
    utility::registersharedfunc("zombienest", "get_contract_data", &function_fb7271d5ee18b98d);
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1350
// Size: 0xe0
function function_fb7271d5ee18b98d(data) {
    function_68d77dfb2a1ed822();
    function_30a591676d601c38();
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

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1437
// Size: 0x33e
function function_68d77dfb2a1ed822() {
    var_90a9cd95ef6496b4 = game_utility::function_4fb37368ae3585bb();
    var_2cb3d2c4fce74721 = 3;
    if (var_90a9cd95ef6496b4 > 2) {
        var_2cb3d2c4fce74721 = 5;
    }
    level.var_de3cfce369a7d08f = {var_2583679d5dd79218:[], var_680cba222d7b8363:0, var_9eff6e89930f11c5:getdvarint(@"hash_62637c90e3bfdf39", 1), var_de9144b3db577810:getdvarint(@"hash_1bec3867a2b201fc", 0), var_147046baca64f322:getdvarint(@"hash_f9f299619d327dee", 2), var_1fd2d389d7d1bc57:getdvarint(@"hash_5f124b02344eefcb", 1), var_a4e8900997cbe859:getdvarint(@"hash_6dca8b88b50276f5", 2), var_ded465ae5000e22:getdvarint(@"hash_ebfd263ff1f329b6", 3), var_91fb1860c884811f:getdvarint(@"hash_75834ab25e72255b", 4), var_345c2d401a2d390b:getdvarint(@"hash_d90a063ace1b3c7f", 3), var_c55617f6d9883a9b:getdvarint(@"hash_83569210c70fa9a7", 1), num_crawlers:getdvarint(@"hash_fe4c18ebccbbb0e5", 1), circle_radius:getdvarint(@"hash_e6d5f6cdb965d59", 750), var_9849aa27e1b7f4f1:getdvarfloat(@"hash_2a66bb8081c9bca5", 1.6), var_514691a3959d3432:getdvarfloat(@"hash_f2bc7feac5077b36", 3.6), var_15d494fa46325346:getdvarint(@"hash_768d0bf76658e3a", var_2cb3d2c4fce74721), var_c32336dbbd60b8d9:getdvarint(@"hash_690c32a4244d3ef5", 150), var_46ace098313e8676:getdvarint(@"hash_30dbecb4fa0d55a2", 360), var_393fc35cb347ea0b:getdvarint(@"hash_f26f2641d026279f", 2), var_4f5e5f6b77e7df9c:getdvarint(@"hash_a9dd9389fb743f13", 1), var_310519099b4e2f6e:getdvarint(@"hash_9c6b1988e4b3230a", 30), time:getdvarint(@"hash_68cd46e539fa448c", 240), enabled:getdvarint(@"hash_9e3454580b1b5e36", 0)};
    level.var_de3cfce369a7d08f.var_685e5c9a11350906 = level.var_de3cfce369a7d08f.var_15d494fa46325346 * level.var_de3cfce369a7d08f.var_c32336dbbd60b8d9;
    level.var_de3cfce369a7d08f.var_f8c730eecd8cb2ce = int(level.var_de3cfce369a7d08f.var_685e5c9a11350906 / 3);
    level.var_de3cfce369a7d08f.var_f8c72feecd8cb09b = int(level.var_de3cfce369a7d08f.var_f8c730eecd8cb2ce * 2);
    /#
        level.var_de3cfce369a7d08f.var_36977fbdb1c082ed = getdvarint(@"hash_831c4a6ec679c765", 0);
        level.var_de3cfce369a7d08f.var_b22c5e6755f6c29b = getdvarint(@"hash_2b377c67b83eb313", 0);
    #/
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x177c
// Size: 0x3ba
function function_30a591676d601c38() {
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
    namespace_3bbb5a98b932c46f::function_1bacc798ac81809a("decoy_grenade", &function_a200944290c18eae);
    callback::add("player_laststand", &function_eb4fe8866f0936ea);
    callback::add("player_death", &function_eb4fe8866f0936ea);
    callback::add("player_revived", &function_6a619d1bed520646);
    callback::add("player_spawned", &function_6a619d1bed520646);
    function_be229415d666c835();
    /#
        if (level.var_de3cfce369a7d08f.var_36977fbdb1c082ed > 0) {
            foreach (point in level.var_de3cfce369a7d08f.var_674ccca06e1c6205) {
                point.scriptable = spawnscriptable("zhco_grav_zhcc", point.origin, point.angles);
                if (isdefined(point.targetname) && point.targetname == "mp/loot/br/jup_sm_island_2/resurgence/lootset_cache_lege.csv") {
                    point.scriptable.corpse_2 = 1;
                    point.scriptable setscriptablepartstate("zhco_grav_zhcc", "brloot_perkpack_corporal_jup");
                } else {
                    point.scriptable setscriptablepartstate("zhco_grav_zhcc", "end_watch_for_gas");
                }
                debug::debug_print3d(point.scriptable, "zombienest_tracking", undefined, undefined, undefined, undefined, undefined, undefined, 90);
            }
            level.var_de3cfce369a7d08f thread function_561ffdaca5b546d3();
        }
        setdvar(@"hash_b964c14b65456862", 0);
        setdvar(@"hash_3764f88c46b94cdf", 0);
        level.var_de3cfce369a7d08f thread function_4e34370c01cfc47b();
    #/
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b3d
// Size: 0xaf
function function_4d7f48287f0ebb9() {
    /#
        /#
            assert(isdefined(game["nest_fx"]));
        #/
    #/
    game["dialog"]["mission_zombienest_accept"] = "zhco_grav_zmbh";
    game["dialog"]["mission_zombienest_success"] = "zhco_grav_zhcc";
    game["dialog"]["mission_zombienest_fail_time"] = "zhco_grav_zmcf";
    game["dialog"]["mission_zombienest_fail_gas"] = "zhco_grav_zmbg";
    game["dialog"]["mission_zombienest_fail_team"] = "zhco_grav_zmbp";
    game["dialog"]["mission_zombienest_timer"] = "zhco_grav_zmbc";
    game["dialog"]["mission_zombienest_nest"] = "zhco_grav_zmbn";
    game["dialog"]["mission_zombienest_nest_team"] = "zhco_grav_zmbw";
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bf3
// Size: 0xa0
function function_be229415d666c835() {
    if (isdefined(level.var_f721fc7d0d2d0f47)) {
        /#
            assertmsg("Region Difficulty Manager has already been initialized.");
        #/
        return;
    }
    level.var_f721fc7d0d2d0f47 = spawnstruct();
    level.starting_health = [];
    level.var_f721fc7d0d2d0f47.var_b9cd1d50a91eb69e = [];
    level.var_f721fc7d0d2d0f47.var_b9cd1d50a91eb69e["difficulty_easy"] = getdvarint(@"hash_bad65124142d0c9c", 3);
    level.var_f721fc7d0d2d0f47.var_b9cd1d50a91eb69e["difficulty_normal"] = getdvarint(@"hash_bad65424142d1335", 20);
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c9a
// Size: 0x1a4
function function_ad8fca4d9b728896() {
    if (!level.var_de3cfce369a7d08f.enabled) {
        return 0;
    }
    var_89d67632514aeab3 = getdvarint(@"hash_f9e5d9bb7af4b6b1", -1);
    if (var_89d67632514aeab3 > -1 && level.var_de3cfce369a7d08f.var_680cba222d7b8363 >= var_89d67632514aeab3) {
        return 0;
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
        return 0;
    }
    if (!isdefined(self.var_6078eb76085c3221) || self.var_6078eb76085c3221.size < level.var_de3cfce369a7d08f.var_4f5e5f6b77e7df9c) {
        return 0;
    }
    if (istrue(self.var_f59cdbf646c7ca3.used)) {
        return 0;
    }
    self.var_f59cdbf646c7ca3.used = 1;
    thread function_11030274435e4ff7();
    thread function_c2767d1bd4f5c9e3();
    /#
        if (level.var_de3cfce369a7d08f.var_b22c5e6755f6c29b == 2) {
            thread function_8586c8d5c6dad9ec();
        }
    #/
    level.var_de3cfce369a7d08f.var_680cba222d7b8363++;
    return 1;
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e46
// Size: 0x398
function function_f2439ec57207ed9() {
    location = namespace_37f0fb6355a4618a::function_bfb73de4decfe852(self.tablet.origin);
    if (!isdefined(location) || !isdefined(location.name)) {
        return undefined;
    }
    target = undefined;
    var_d3e56584c1ba1725 = undefined;
    switch (location.name) {
    case #"hash_796bb459ccd4e958":
        if (getdvarint(@"hash_83baf86af015e43b", 1) == 1) {
            target = "ZOMBIENEST_APARTMENT";
            var_d3e56584c1ba1725 = "base_armored_heavy";
        }
        break;
    case #"hash_ea4710100dabfbca":
        if (getdvarint(@"hash_bf02ef278577b107", 1) == 1) {
            target = "ZOMBIENEST_KEEP_DUNGEON";
            var_d3e56584c1ba1725 = "mimic";
        }
        break;
    case #"hash_c7f751358c7a68a6":
        if (getdvarint(@"hash_a07e08c0000537d7", 1) == 1) {
            target = "ZOMBIENEST_SEWER_TUNNEL";
            var_d3e56584c1ba1725 = "hellhound";
        }
        break;
    case #"hash_6a2a4b8f66645d28":
        if (getdvarint(@"hash_33b893ae872efd32", 1) == 1) {
            target = "ZOMBIENEST_KEEP_DESTROYED";
            var_d3e56584c1ba1725 = "hellhound";
        }
        break;
    case #"hash_c62ca67d7a04c8df":
        if (getdvarint(@"hash_947bdbac67863e27", 1) == 1) {
            target = "ZOMBIENEST_CEMETARY_TUNNEL";
            var_d3e56584c1ba1725 = "base_armored_heavy";
        }
        break;
    case #"hash_3c3e216d9cb4f194":
        if (getdvarint(@"hash_4be0e602cc9507db", 1) == 1) {
            target = "ZOMBIENEST_LABS";
            var_d3e56584c1ba1725 = "mimic";
        }
        break;
    case #"hash_1dd4a3090492e1f7":
        if (getdvarint(@"hash_eeb5f31b41cea92f", 1) == 1) {
            target = "ZOMBIENEST_TOWN_UPSTAIRS";
            var_d3e56584c1ba1725 = "base_armored_heavy";
        }
        break;
    case #"hash_4af66c87c547ddbb":
        if (getdvarint(@"hash_c408f0988d502a5c", 1) == 1) {
            target = "ZOMBIENEST_SNACK_SHOP";
            var_d3e56584c1ba1725 = "base_armored_heavy";
        }
        break;
    case #"hash_88c7b7ddf8ba43d6":
        if (getdvarint(@"hash_a1b40ab8d7aa5e3e", 1) == 1) {
            target = "ZOMBIENEST_WINERY_TUNNEL";
            var_d3e56584c1ba1725 = "mimic";
        }
        break;
    case #"hash_8c5f7784935d24a5":
        if (getdvarint(@"hash_64390199c38e62ab", 1) == 1) {
            target = "ZOMBIENEST_LIGHTHOUSE";
            var_d3e56584c1ba1725 = "hellhound";
        }
        break;
    case #"hash_a94e3fb46508510c":
        if (getdvarint(@"hash_378741c1658a48e6", 1) == 1) {
            target = "ZOMBIENEST_GRANDMAS_BASEMENT";
            var_d3e56584c1ba1725 = "base_armored_heavy";
        }
        break;
    case #"hash_afbf303083acfce1":
        if (getdvarint(@"hash_4e91afda68f6fa0d", 1) == 1) {
            target = "ZOMBIENEST_WINERY_STORAGE";
            var_d3e56584c1ba1725 = "base_armored_heavy";
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
    if (!level.br_circle_disabled && !namespace_c5622898120e827f::function_d449927f9683e871(var_97a18b707e09ac62.origin)) {
        return undefined;
    }
    var_97a18b707e09ac62.var_12305012233f8d4d = function_a6f44376eecf9ec5(var_d3e56584c1ba1725);
    return var_97a18b707e09ac62;
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21e6
// Size: 0x1d6
function function_e2fa6e606a1be0d3() {
    if (!isdefined(self.var_f59cdbf646c7ca3)) {
        return undefined;
    }
    var_e075a8cc5c9bfa63 = level.var_de3cfce369a7d08f;
    var_503c6887f9d9a2a7 = [];
    var_46edfbf5c8ec3711 = [];
    targetname = self.var_f59cdbf646c7ca3.targetname;
    foreach (point in var_e075a8cc5c9bfa63.var_674ccca06e1c6205) {
        if (isdefined(point.target) && point.target == targetname) {
            var_46edfbf5c8ec3711[var_46edfbf5c8ec3711.size] = point;
        }
    }
    if (var_46edfbf5c8ec3711.size < var_e075a8cc5c9bfa63.var_4f5e5f6b77e7df9c) {
        return undefined;
    }
    var_46edfbf5c8ec3711 = utility::array_randomize(var_46edfbf5c8ec3711);
    if (!level.br_circle_disabled) {
        for (i = 0; i < var_46edfbf5c8ec3711.size; i++) {
            var_176979084a7ed028 = namespace_553788426d0f4133::function_60951b84c58915ab(var_46edfbf5c8ec3711[i].origin);
            var_46edfbf5c8ec3711[i].var_5049402bbb117938 = namespace_553788426d0f4133::function_7d8550b9a2c52852(var_176979084a7ed028);
            if (var_46edfbf5c8ec3711[i].var_5049402bbb117938 <= self.var_91d32f70a51031f9) {
                continue;
            }
            if (!isdefined(var_503c6887f9d9a2a7[0])) {
                var_503c6887f9d9a2a7[0] = var_46edfbf5c8ec3711[i];
            } else if (var_e075a8cc5c9bfa63.var_4f5e5f6b77e7df9c > 1) {
                if (var_46edfbf5c8ec3711[i].var_5049402bbb117938 <= var_503c6887f9d9a2a7[0].var_5049402bbb117938) {
                    continue;
                }
                var_503c6887f9d9a2a7[1] = var_46edfbf5c8ec3711[i];
            }
        }
    } else {
        for (i = 0; i < var_e075a8cc5c9bfa63.var_4f5e5f6b77e7df9c; i++) {
            var_503c6887f9d9a2a7[i] = var_46edfbf5c8ec3711[i];
        }
    }
    return var_503c6887f9d9a2a7;
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23c4
// Size: 0x196
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

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2561
// Size: 0x1a6
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

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x270e
// Size: 0x157
function function_d0456c226b6afed() {
    rewards = [];
    rewards[rewards.size] = pickscriptablelootitem("weapon", 4, 4, "mp/loot/br/jup_sm_island_2/resurgence/lootset_cache_lege.csv");
    var_8f19495d6a0c9623 = [0:"brloot_equip_gasmask", 1:"brloot_equip_gasmask_durable"];
    if (!level.var_de3cfce369a7d08f.var_9eff6e89930f11c5) {
        var_8f19495d6a0c9623[var_8f19495d6a0c9623.size] = "brloot_offhand_deconstation";
    }
    rewards[rewards.size] = var_8f19495d6a0c9623[randomint(var_8f19495d6a0c9623.size)];
    var_6471bd83bf9773df = [0:"brloot_perkpack_technician_jup", 1:"brloot_perkpack_commander_jup", 2:"brloot_perkpack_huntsman_jup", 3:"brloot_perkpack_legionnaire_jup", 4:"brloot_perkpack_corporal_jup"];
    rewards[rewards.size] = var_6471bd83bf9773df[randomint(var_6471bd83bf9773df.size)];
    var_770e8c84df2927ac = [0:"brloot_munition_jup_lrad", 1:"brloot_killstreak_cluster_spike", 2:"brloot_super_soundveil"];
    if (!level.var_de3cfce369a7d08f.var_9eff6e89930f11c5) {
        var_770e8c84df2927ac[var_770e8c84df2927ac.size] = "brloot_killstreak_bunker_buster";
    }
    rewards[rewards.size] = var_770e8c84df2927ac[randomint(var_770e8c84df2927ac.size)];
    if (randomint(100) < getdvarint(@"hash_b573fe45501beda8", 20)) {
        if (utility::cointoss()) {
            rewards[rewards.size] = namespace_d325722f2754c2c4::function_eeaa22f0cd1ff845("jup_pi_raygun_mp");
        } else {
            rewards[rewards.size] = namespace_d325722f2754c2c4::function_eeaa22f0cd1ff845("jup_ar_dg2_mp");
        }
    }
    return rewards;
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x286d
// Size: 0x2ae
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
        player.var_623c5d9542306d1 = self;
    }
    thread function_7667d54cafb43a31();
    thread function_8586c8d5c6dad9ec();
    namespace_c133516bfc1d803c::displayteamsplash(self.teams[0], "br_zombienest_quest_start_team", undefined, "splash_list_br_contract_zombienest");
    namespace_c133516bfc1d803c::displaysquadmessagetoteam(self.teams[0], self.var_d154ac2657c5f44, 6, namespace_c133516bfc1d803c::getquestindex("zombienest"));
    level thread namespace_a548bd428a566cf3::brleaderdialogteam("mission_zombienest_accept", self.teams[0], 1, 2, undefined, "dx_br_smis_");
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

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b22
// Size: 0x25
function function_37d55d69f07be56(team) {
    if (istrue(self.teams[0] == team)) {
        function_ae065127a63b0829(0);
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b4e
// Size: 0x5d
function function_2fcaceec2fe03a0b(player, var_799e4572480a9446, var_59d3c1f3438e77ef) {
    if (var_799e4572480a9446 == self.teams[0]) {
        if (!namespace_bd5b51637804dbad::isteamvalid(var_799e4572480a9446, level.var_41f4bc9ee8c7c9c6.defaultfilter)) {
            thread function_37d55d69f07be56(var_799e4572480a9446);
        } else {
            function_43d761f725d3c7d3(player);
        }
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bb2
// Size: 0x49
function function_2f09930037714234(player, var_799e4572480a9446, var_59d3c1f3438e77ef) {
    if (var_59d3c1f3438e77ef == self.teams[0]) {
        function_5c243972c743674b(player);
        player setclientomnvar("ui_br_objective_countdown_timer", self.missiontime);
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c02
// Size: 0x1c
function function_bdff9369788219f7(attacker, victim) {
    function_56676d0409670380(victim);
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c25
// Size: 0x14
function function_4e1e4a6b5320e6e4(player) {
    function_56676d0409670380(player);
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c40
// Size: 0x56
function function_56676d0409670380(player) {
    if (player.team == self.teams[0]) {
        if (!namespace_4bc0ead8d2af3d84::isteamvalid(self.teams[0], level.var_41f4bc9ee8c7c9c6.defaultfilter)) {
            function_ae065127a63b0829(0, 0);
        }
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c9d
// Size: 0xcb
function function_e4a9b03d2930aafb() {
    self endon("task_ended");
    level endon("game_ended");
    wait(level.var_de3cfce369a7d08f.time / 2);
    level thread namespace_a548bd428a566cf3::brleaderdialogteam("mission_zombienest_timer", self.teams[0], 1, 2, undefined, "dx_br_smis_");
    wait(level.var_de3cfce369a7d08f.time / 2);
    params = {intvar:0};
    namespace_c133516bfc1d803c::displayteamsplash(self.teams[0], "br_zombienest_quest_timer_expired", params, "splash_list_br_contract_zombienest");
    level thread namespace_a548bd428a566cf3::brleaderdialogteam("mission_zombienest_fail_time", self.teams[0], 1, 2, undefined, "dx_br_smis_");
    thread function_ae065127a63b0829(0, !self.var_85fd31604998e408);
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d6f
// Size: 0xa4
function function_d19cefe52ef42c7b(task) {
    level endon("game_ended");
    task endon("task_ended");
    self endon("end_watch_for_gas");
    wait(self.var_91d32f70a51031f9 + level.var_de3cfce369a7d08f.var_310519099b4e2f6e);
    params = {intvar:0};
    task namespace_c133516bfc1d803c::displayteamsplash(task.teams[0], "br_zombienest_quest_circle_failure", params, "splash_list_br_contract_zombienest");
    level thread namespace_a548bd428a566cf3::brleaderdialogteam("mission_zombienest_fail_gas", task.teams[0], 1, 2, undefined, "dx_br_smis_");
    task thread function_ae065127a63b0829(0);
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e1a
// Size: 0x198
function function_ae065127a63b0829(complete_state, trigger_nuke) {
    if (!isdefined(trigger_nuke)) {
        trigger_nuke = 0;
    }
    self notify("task_ended");
    self.ended = 1;
    function_3979023c78a59382();
    if (!istrue(self.nest_started)) {
        thread function_bf394a392efabeb1();
    }
    wait(1);
    function_e9c99e047f9b76b2(trigger_nuke);
    namespace_c133516bfc1d803c::function_93663fe58d95f174(ter_op(istrue(complete_state == 1), self.teams[0], undefined));
    foreach (player in teams::getteamdata(self.teams[0], "players")) {
        if (isdefined(player.var_623c5d9542306d1)) {
            player.var_623c5d9542306d1 = undefined;
        }
    }
    var_9a6c1b85896a116e = {hvt_type:self.var_f59cdbf646c7ca3.var_12305012233f8d4d.type, nest_location:self.var_f59cdbf646c7ca3.targetname, completion_state:complete_state};
    level thread function_daf7a654755217f2(var_9a6c1b85896a116e);
    /#
        if (istrue(level.var_de3cfce369a7d08f.var_8296e7984a23912e)) {
            level.var_de3cfce369a7d08f.var_8296e7984a23912e = 0;
        }
        level notify("zombienest_trigger");
        level.var_de3cfce369a7d08f.var_5f9281806605c0b7 = undefined;
    #/
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fb9
// Size: 0x2f7
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
        foreach (var_db662a244a03025a in self.var_f59cdbf646c7ca3.var_15ecf14670478f34) {
            if (isdefined(var_db662a244a03025a)) {
                if (isdefined(level.brgametype.var_84b0d6cec49dc02b) && utility::array_contains(level.brgametype.var_84b0d6cec49dc02b, var_db662a244a03025a)) {
                    level.brgametype.var_84b0d6cec49dc02b = utility::array_remove(level.brgametype.var_84b0d6cec49dc02b, var_db662a244a03025a);
                }
                var_db662a244a03025a freescriptable();
            }
        }
    }
    if (trigger_nuke && getdvarint(@"hash_5f4c8ff726eb8e87", 0) == 1 && !getdvarint(@"hash_6d05eef17bf3efaa", 0) && getdvarint(@"hash_920497dcbb26e232", 1) == 1) {
        if (isdefined(self.var_795ccd62187df177) && self.var_795ccd62187df177.size > 0) {
            if (utility::issharedfuncdefined("powerup_nuke", "trigger_nuke")) {
                self.var_cd619f76679fd9ad[0] thread utility::function_f3bb4f4911a1beb2("powerup_nuke", "trigger_nuke", self.var_cd619f76679fd9ad[0].origin, 1, self.var_795ccd62187df177);
            } else {
                /#
                    /#
                        assertmsg("corpse");
                    #/
                #/
            }
        }
        function_142cc83609cf06a4();
    } else {
        function_49b9b39678c461bd();
        function_142cc83609cf06a4();
    }
    corpses = function_e3b3f0128f632da5(self.var_f59cdbf646c7ca3.origin, 1000);
    foreach (corpse in corpses) {
        corpse thread function_845a94db40b85c79();
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32b7
// Size: 0x1d
function function_87cfbfeba9393973() {
    return isdefined(self.var_795ccd62187df177) && self.var_795ccd62187df177.size > 0;
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x32dc
// Size: 0x2a
function function_642f8a716120a16f() {
    level endon("game_ended");
    self.nuke_powerup endon("picked_up");
    wait(30);
    function_49b9b39678c461bd();
    function_142cc83609cf06a4();
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x330d
// Size: 0x100
function function_49b9b39678c461bd() {
    foreach (zombie in self.var_795ccd62187df177) {
        if (zombie.health <= 0) {
            continue;
        }
        if (isdefined(zombie._blackboard) && istrue(zombie._blackboard.var_10cd2abcd916837e)) {
            continue;
        }
        if (zombie asmhasstate(zombie.asmname, "despawn_in")) {
            zombie.nocorpse = 1;
            zombie namespace_bf5a1761a8d1bb07::asm_setstate("despawn_in");
        } else {
            if (istrue(zombie.magic_bullet_shield)) {
                zombie namespace_6205bc7c5e394598::stop_magic_bullet_shield();
            }
            zombie.nocorpse = 1;
            zombie.var_7e4b076a06c6df27 = 1;
            zombie kill();
        }
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3414
// Size: 0x244
function function_ebe3e507046b2636(var_a960304617f022cf) {
    self notify("skip_investigation");
    self notify("footprint_loop_stop");
    namespace_c133516bfc1d803c::uiobjectiveshowtoteam("zombienest_cyst", self.teams[0]);
    namespace_c133516bfc1d803c::function_e2aa45e2c6b5dec1(0, level.var_de3cfce369a7d08f.var_15d494fa46325346);
    function_20553f0e04484a87(self.var_f59cdbf646c7ca3, 0, undefined, "nest");
    self.var_ee01b2d72e3aa653 = 1;
    if (istrue(var_a960304617f022cf)) {
        namespace_c133516bfc1d803c::displayteamsplash(self.teams[0], "br_zombienest_quest_nest_discovered", undefined, "splash_list_br_contract_zombienest");
        level thread namespace_a548bd428a566cf3::brleaderdialogteam("mission_zombienest_nest", self.teams[0], 1, 2, undefined, "dx_br_smis_");
    } else {
        namespace_c133516bfc1d803c::displayteamsplash(self.teams[0], "br_zombienest_quest_nest_discovered_enemy", undefined, "splash_list_br_contract_zombienest");
        level thread namespace_a548bd428a566cf3::brleaderdialogteam("mission_zombienest_nest_team", self.teams[0], 1, 2, undefined, "dx_br_smis_");
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

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x365f
// Size: 0xe6
function function_bb89532df150bca8() {
    level endon("game_ended");
    self.var_623c5d9542306d1 endon("task_ended");
    self endon("disconnect");
    while (!isalive(self)) {
        wait(1);
    }
    dist = distance2dsquared(self.origin, self.var_623c5d9542306d1.var_f59cdbf646c7ca3.origin);
    if (dist < squared(1500)) {
        return;
    }
    self.var_623c5d9542306d1 function_5225080b8f50d488(self);
    while (1) {
        if (isalive(self)) {
            dist = distance2dsquared(self.origin, self.var_623c5d9542306d1.var_f59cdbf646c7ca3.origin);
            if (dist < squared(1500)) {
                break;
            }
        }
        wait(1);
    }
    self.var_623c5d9542306d1 function_ab05e129cba5d54c(self);
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x374c
// Size: 0x139
function function_397f9ef7d73e3d74() {
    self notify("zombienest_final_wave");
    self notify("end_watch_for_gas");
    namespace_c133516bfc1d803c::uiobjectiveshowtoteam("zombienest_eliminate", self.teams[0]);
    namespace_c133516bfc1d803c::displayteamsplash(self.teams[0], "br_zombienest_quest_eliminate", undefined, "splash_list_br_contract_zombienest");
    self.var_85fd31604998e408 = 0;
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

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x388c
// Size: 0xf0
function function_8edb31561e4db442() {
    self.var_4d1b2ec391a3baff = (-8, 30, -40);
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

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3983
// Size: 0x113
function function_a6f44376eecf9ec5(var_d3e56584c1ba1725) {
    var_d3e56584c1ba1725 = getdvar(@"hash_d105c10e8a7175c9", var_d3e56584c1ba1725);
    num_to_spawn = 1;
    tier = "difficulty_easy";
    var_d97331f087aabebf = 65;
    switch (var_d3e56584c1ba1725) {
    case #"hash_b84aa7095c40495c":
        num_to_spawn = 3;
        if (level.var_de3cfce369a7d08f.var_a4e8900997cbe859 > 1) {
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
    var_12305012233f8d4d = {var_d97331f087aabebf:var_d97331f087aabebf, tier:tier, count:num_to_spawn, type:"zombie_" + var_d3e56584c1ba1725};
    return var_12305012233f8d4d;
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a9e
// Size: 0x37b
function function_329019d15888feaf() {
    if (isdefined(self) && isdefined(self.target)) {
        self.var_86ca8e1c112dc232 = getentitylessscriptablearray(self.target, "targetname");
        self.var_dcbec0adc5c68ae8 = [];
        foreach (prop in self.var_86ca8e1c112dc232) {
            if (issubstr(prop.classname, "gas")) {
                self.var_dcbec0adc5c68ae8[self.var_dcbec0adc5c68ae8.size] = prop;
                self.var_86ca8e1c112dc232 = utility::array_remove(self.var_86ca8e1c112dc232, prop);
            } else {
                prop setscriptablepartstate("state", "visible");
            }
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
    foreach (var_db662a244a03025a in level.var_de3cfce369a7d08f.var_5b1136b59d854e78) {
        if (isdefined(var_db662a244a03025a) && var_db662a244a03025a.target == self.targetname) {
            self.var_6fb0b363cf0904af[self.var_6fb0b363cf0904af.size] = var_db662a244a03025a;
        }
        /#
            if (level.var_de3cfce369a7d08f.var_b22c5e6755f6c29b == 1) {
                var_db662a244a03025a.scriptable = spawnscriptable("full_armor", var_db662a244a03025a.origin, var_db662a244a03025a.angles);
                var_db662a244a03025a.scriptable setscriptablepartstate("<unknown string>", "<unknown string>");
                var_db662a244a03025a.scriptable setscriptablepartstate("<unknown string>", "<unknown string>");
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

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e20
// Size: 0x78
function function_5f7cc9ef230b2e44() {
    level endon("game_ended");
    level waittill("infils_ready");
    foreach (window in self.var_88d2a48b05e5df7e) {
        glassradiusdamage(window.origin, 100, 10000, 9000);
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e9f
// Size: 0x322
function function_8586c8d5c6dad9ec() {
    nest = self.var_f59cdbf646c7ca3;
    nest.var_15ecf14670478f34 = [];
    groups = [];
    var_5e88a18223b1019d = [];
    foreach (var_db662a244a03025a in nest.var_6fb0b363cf0904af) {
        if (isdefined(var_db662a244a03025a.targetname)) {
            if (!isdefined(groups[var_db662a244a03025a.targetname])) {
                groups[var_db662a244a03025a.targetname] = [];
                var_5e88a18223b1019d[var_5e88a18223b1019d.size] = var_db662a244a03025a.targetname;
            }
            groups[var_db662a244a03025a.targetname][groups[var_db662a244a03025a.targetname].size] = var_db662a244a03025a;
        }
    }
    var_3494d265fa64df95 = [];
    if (var_5e88a18223b1019d.size > 0) {
        foreach (key in var_5e88a18223b1019d) {
            if (isdefined(groups[key])) {
                var_3494d265fa64df95[var_3494d265fa64df95.size] = utility::function_7a2aaa4a09a4d250(groups[key]);
            }
        }
    }
    var_3494d265fa64df95 = utility::array_randomize(var_3494d265fa64df95);
    for (i = 0; i < level.var_de3cfce369a7d08f.var_15d494fa46325346; i++) {
        var_db662a244a03025a = spawnscriptable("ob_aethernest_cyst_scriptable", var_3494d265fa64df95[i].origin, var_3494d265fa64df95[i].angles);
        var_db662a244a03025a.health = level.var_de3cfce369a7d08f.var_c32336dbbd60b8d9;
        var_db662a244a03025a.task = self;
        var_db662a244a03025a.loot_blocked = 0;
        if (isdefined(var_3494d265fa64df95[i].script_parameters) && var_3494d265fa64df95[i].script_parameters == "loot_blocked") {
            var_db662a244a03025a.loot_blocked = 1;
        }
        var_db662a244a03025a setscriptablepartstate("usable", "off");
        nest.var_15ecf14670478f34[i] = var_db662a244a03025a;
        if (!isdefined(level.brgametype.var_84b0d6cec49dc02b)) {
            level.brgametype.var_84b0d6cec49dc02b = [];
        }
        level.brgametype.var_84b0d6cec49dc02b = utility::array_add(level.brgametype.var_84b0d6cec49dc02b, var_db662a244a03025a);
    }
    nest.var_969e56ce1dd93031 = nest.var_15ecf14670478f34.size;
    foreach (prop in nest.var_dcbec0adc5c68ae8) {
        prop setscriptablepartstate("state", "visible");
    }
    thread function_8cccf13ebffd574a();
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41c8
// Size: 0x30f
function function_7667d54cafb43a31() {
    nest = self.var_f59cdbf646c7ca3;
    aitypes = namespace_2b1145f62aa835b8::get_aitype_by_subclass_SharedFunc("zombie_base_abom_crawler");
    var_ea3e656b50d22272 = aitypes[0];
    foreach (aitype in aitypes) {
        if (issubstr(aitype, "nest")) {
            var_ea3e656b50d22272 = aitype;
        }
    }
    self.var_795ccd62187df177 = [];
    if (level.var_de3cfce369a7d08f.num_crawlers > 0) {
        crawler = namespace_2b1145f62aa835b8::spawnNewAIType_SharedFunc(var_ea3e656b50d22272, nest.ceiling_spawner.origin + function_b92fe4518e875443(level.var_de3cfce369a7d08f.var_4d1b2ec391a3baff, anglestoaxis(nest.ceiling_spawner.angles)), nest.ceiling_spawner.angles + level.var_de3cfce369a7d08f.var_10a2f6768996cda4, "team_two_hundred");
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
        self.var_795ccd62187df177[self.var_795ccd62187df177.size] = crawler;
    }
    if (level.var_de3cfce369a7d08f.num_crawlers > 1) {
        crawler = namespace_2b1145f62aa835b8::spawnNewAIType_SharedFunc(var_ea3e656b50d22272, nest.ceiling_spawner.origin + function_b92fe4518e875443(level.var_de3cfce369a7d08f.var_f97bc94b040ca27f, anglestoaxis(nest.ceiling_spawner.angles)), nest.ceiling_spawner.angles + level.var_de3cfce369a7d08f.var_bd0390fdfbffb524, "team_two_hundred");
        crawler function_7e6a015226d63d6d("difficulty_easy");
        if (isdefined(crawler)) {
            crawler val::set("idle_hang", "damage", 0);
            crawler.task = self;
            crawler.idle_anim = "nest_crawler_idle_two_drop_02";
            crawler thread function_9f61ce12bbb16cac();
            crawler callback::add("on_zombie_ai_damaged", &function_96ca7e470db74bdb);
            crawler callback::add("on_zombie_ai_killed", &function_2e8b80e841d8c57d);
        }
        nest.ceiling_spawner.var_fc7043523edbc993 = crawler;
        self.var_795ccd62187df177[self.var_795ccd62187df177.size] = crawler;
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44de
// Size: 0x270
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
        } else {
            self.var_6078eb76085c3221[i].scriptable setscriptablepartstate("zombienest_investigation_point_jup", "point_outline");
        }
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

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4755
// Size: 0xcc
function function_d037ccdb3b11447f(point) {
    self endon("skip_investigation");
    self endon("task_ended");
    level endon("game_ended");
    var_a83857669141084d = 0;
    while (!var_a83857669141084d) {
        foreach (player in teams::getteamdata(self.teams[0], "players")) {
            if (utility::function_acb96530881571aa(player, point.origin, 500)) {
                function_516e4c50b671b284(player.team);
                game_utility::function_af5604ce591768e1();
                var_a83857669141084d = 1;
                break;
            }
        }
        wait(0.5);
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4828
// Size: 0x16d
function function_2d1327f6ce7982c0(instance, part, state, player, var_11648d9cb3869a36, var_7babf251c31514d8) {
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
            level notify("<unknown string>");
            instance.path thread function_642f50e2994cc88a();
            level.var_de3cfce369a7d08f.var_5f9281806605c0b7 = instance.path;
            if (istrue(level.var_de3cfce369a7d08f.var_78e879ff07bbfd2f)) {
                level.var_de3cfce369a7d08f.var_5f9281806605c0b7 thread function_1b693b431c3259c9();
            }
            if (!istrue(instance.corpse_2)) {
                instance setscriptablepartstate("zhco_grav_zhcc", "end_watch_for_gas");
            } else {
                instance setscriptablepartstate("zhco_grav_zhcc", "brloot_perkpack_corporal_jup");
            }
        }
    #/
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x499c
// Size: 0x18b
function function_7d6b02a8a98e31b6() {
    if (self.var_fc58e9ab685e7742 == 0) {
        function_a6cbdfe5e2529a0(self.teams[0]);
        game_utility::function_af5604ce591768e1();
        namespace_c133516bfc1d803c::uiobjectiveshowtoteam("zombienest_track", self.teams[0]);
    }
    if (isdefined(self.var_9b0bb673329d19ac[self.var_fc58e9ab685e7742])) {
        self.var_f7f0bd3198024da3 = self.var_9b0bb673329d19ac[self.var_fc58e9ab685e7742];
    }
    self.var_fc58e9ab685e7742++;
    var_be27b40782202cf5 = self.var_6078eb76085c3221[self.var_fc58e9ab685e7742];
    if (isdefined(var_be27b40782202cf5)) {
        var_be27b40782202cf5.trigger = spawn("noent_volume_trigger_radius", var_be27b40782202cf5.origin, 0, 150, 56);
        thread function_f8d2eaf695792fe3(var_be27b40782202cf5);
    }
    self.var_46cfa00a3c715d51 = 0;
    function_20553f0e04484a87(self.var_f7f0bd3198024da3.var_f72966079a1774ec[self.var_46cfa00a3c715d51], 0, undefined, "footprint");
    self notify("footprint_loop_stop");
    foreach (player in teams::getteamdata(self.teams[0], "players")) {
        thread function_fe6ed3e33642aeba(player, self.var_f7f0bd3198024da3);
        player thread function_2af5e50a915f1920(self.var_f7f0bd3198024da3);
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b2e
// Size: 0x8b
function function_f8d2eaf695792fe3(point) {
    self endon("skip_investigation");
    self endon("task_ended");
    level endon("game_ended");
    while (1) {
        player = point.trigger waittill("trigger");
        if (isplayer(player) && isdefined(player.var_623c5d9542306d1) && player.var_623c5d9542306d1 == self) {
            break;
        }
    }
    function_7d6b02a8a98e31b6();
    point.trigger delete();
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4bc0
// Size: 0x19c
function function_11030274435e4ff7(var_cb2519ce9411971b) {
    if (!isdefined(var_cb2519ce9411971b)) {
        var_cb2519ce9411971b = 0;
    }
    if (!istrue(var_cb2519ce9411971b)) {
        level waittill("prematch_started");
    }
    self.var_9b0bb673329d19ac = [];
    for (i = 0; i < self.var_6078eb76085c3221.size; i++) {
        path = undefined;
        if (isdefined(self.var_6078eb76085c3221[i + 1])) {
            path = level.players[0] findpath(self.var_6078eb76085c3221[i].origin, self.var_6078eb76085c3221[i + 1].origin);
            self.var_9b0bb673329d19ac[i] = {path:path};
        }
    }
    path = level.players[0] findpath(self.var_6078eb76085c3221[self.var_6078eb76085c3221.size - 1].origin, self.var_f59cdbf646c7ca3.origin);
    self.var_9b0bb673329d19ac[self.var_9b0bb673329d19ac.size] = {path:path};
    for (i = 0; i < self.var_9b0bb673329d19ac.size; i++) {
        self.var_9b0bb673329d19ac[i].var_a5a1a3685b2cdfe7 = spawn("script_model", self.var_9b0bb673329d19ac[i].path[0]);
        self.var_9b0bb673329d19ac[i] thread function_ca0219b7de04f1c8();
        self.var_9b0bb673329d19ac[i] thread function_9a387a79e023c865();
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d63
// Size: 0xfa
function function_ca0219b7de04f1c8() {
    i = 0;
    path = self.path;
    var_f14f5cb639c4a29 = self.path[i];
    ai = self.var_a5a1a3685b2cdfe7;
    while (1) {
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
        wait(level.framedurationseconds);
    }
    self.var_a5a1a3685b2cdfe7 delete();
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e64
// Size: 0x3e6
function function_9a387a79e023c865(var_aae007c97e5990bb) {
    if (!isdefined(var_aae007c97e5990bb)) {
        var_aae007c97e5990bb = 1;
    }
    footprint = undefined;
    ang = vectortoangles(self.path[1] - self.path[0]);
    var_199402a513815788 = {angles:ang, origin:self.var_a5a1a3685b2cdfe7.origin};
    self.var_95b16bd23e059f21 = [];
    var_c9274404926db738 = 0;
    var_8c13709ea092624d = 1;
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
            var_2b63642fb1583200 = var_199402a513815788.origin + (0, 0, 35);
            offset = randomfloatrange(3, 10);
            var_8d5d032ec9bc0f78 = getclosestpointonnavmesh(var_199402a513815788.origin + right * offset);
            var_199402a513815788.right = getgroundposition(var_8d5d032ec9bc0f78 + right * var_82da3574b8c57730, 5);
            var_356534a9032db60d = getclosestpointonnavmesh(var_199402a513815788.origin + left * offset);
            var_199402a513815788.left = getgroundposition(var_356534a9032db60d + left * var_82da3574b8c57730, 5);
            if (var_8c13709ea092624d) {
                var_aa5e55cef453dda7 = {var_c9274404926db738:var_c9274404926db738, var_22d604a09adb7131:level._effect["zombie_footprint_right"], forward:forward, origin:var_199402a513815788.right};
                var_82da3574b8c57730 = function_af25b6271b7d44de(offset, var_199402a513815788.origin, var_199402a513815788.right);
            } else {
                var_aa5e55cef453dda7 = {var_c9274404926db738:var_c9274404926db738, var_22d604a09adb7131:level._effect["zombie_footprint_left"], forward:forward, origin:var_199402a513815788.left};
                var_82da3574b8c57730 = function_af25b6271b7d44de(offset, var_199402a513815788.origin, var_199402a513815788.left);
            }
            self.var_95b16bd23e059f21[self.var_95b16bd23e059f21.size] = var_aa5e55cef453dda7;
            var_8c13709ea092624d = !var_8c13709ea092624d;
            var_c9274404926db738++;
            var_b1db6a474a45cb61 = undefined;
        }
        waitframe();
    }
    buffer = level.var_de3cfce369a7d08f.var_393fc35cb347ea0b;
    for (i = buffer - 1; i >= 0; i--) {
        self.var_95b16bd23e059f21 = utility::array_remove(self.var_95b16bd23e059f21, self.var_95b16bd23e059f21[i]);
    }
    if (var_aae007c97e5990bb) {
        thread function_7727d09686112843(self.var_95b16bd23e059f21);
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5251
// Size: 0x3d
function function_af25b6271b7d44de(var_d7fc78b482432d93, var_e56d34a8fa112797, var_30491d3d1682ce39) {
    dist = distance2d(var_30491d3d1682ce39, var_e56d34a8fa112797);
    if (dist < var_d7fc78b482432d93) {
        return (var_d7fc78b482432d93 - dist);
    } else {
        return 0;
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5295
// Size: 0xc5
function function_7727d09686112843(var_61e98bc9e6c912fa) {
    var_cde6230e36063067 = int(var_61e98bc9e6c912fa.size / 4);
    var_3f2c1be20a5acc3c = 0;
    var_41d3550fdc952918 = 0;
    self.var_f72966079a1774ec = [];
    for (i = 0; i < 4; i++) {
        var_3f2c1be20a5acc3c = var_41d3550fdc952918;
        var_41d3550fdc952918 = var_3f2c1be20a5acc3c + var_cde6230e36063067 - 1;
        var_56854bf08db00317 = int(var_41d3550fdc952918 - (var_41d3550fdc952918 - var_3f2c1be20a5acc3c) / 2);
        self.var_f72966079a1774ec[i] = var_61e98bc9e6c912fa[var_56854bf08db00317];
        if (!isdefined(var_61e98bc9e6c912fa[var_41d3550fdc952918])) {
            var_41d3550fdc952918 = var_61e98bc9e6c912fa.size;
        }
        for (idx = var_3f2c1be20a5acc3c; idx <= var_41d3550fdc952918; idx++) {
            var_61e98bc9e6c912fa[idx].var_4a71032271dddc82 = i;
        }
        var_41d3550fdc952918++;
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5361
// Size: 0x114
function function_fe6ed3e33642aeba(player, path) {
    self endon("footprint_loop_stop");
    self endon("task_ended");
    level endon("game_ended");
    var_d88d1557532b50e5 = [];
    for (i = 0; i < path.var_95b16bd23e059f21.size; i++) {
        footprint = path.var_95b16bd23e059f21[i];
        if (isdefined(footprint.var_4a71032271dddc82) && footprint.var_4a71032271dddc82 == self.var_46cfa00a3c715d51) {
            var_d88d1557532b50e5[var_d88d1557532b50e5.size] = footprint;
        } else if (!isdefined(footprint.var_4a71032271dddc82)) {
            footprint.var_4a71032271dddc82 = 3;
        }
    }
    for (i = 0; i < var_d88d1557532b50e5.size; i++) {
        footprint = var_d88d1557532b50e5[i];
        playfx(footprint.var_22d604a09adb7131, footprint.origin, footprint.forward, undefined, player, 1);
        if (i == 0) {
            player thread function_e15e75f0ce6b8b2d(path);
        }
        wait(0.1);
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x547c
// Size: 0x47
function function_e15e75f0ce6b8b2d(path) {
    self.var_623c5d9542306d1 endon("footprint_loop_stop");
    self.var_623c5d9542306d1 endon("task_ended");
    level endon("game_ended");
    wait(10);
    self.var_623c5d9542306d1 thread function_fe6ed3e33642aeba(self, path);
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54ca
// Size: 0x26b
function function_2af5e50a915f1920(current_path) {
    self notify("zombienest_tracking");
    self endon("zombienest_tracking");
    self.var_623c5d9542306d1 endon("skip_investigation");
    self.var_623c5d9542306d1 endon("task_ended");
    level endon("game_ended");
    self endon("disconnect");
    wait(1);
    while (1) {
        if (isalive(self)) {
            var_d0e0201a98e5c2f9 = [];
            var_d88d1557532b50e5 = [];
            var_c313f64aeebdd08a = 1;
            foreach (footprint in current_path.var_95b16bd23e059f21) {
                if (utility::function_44daa65837a12044(self, footprint.origin, level.var_de3cfce369a7d08f.var_46ace098313e8676)) {
                    var_d0e0201a98e5c2f9[var_d0e0201a98e5c2f9.size] = footprint;
                }
            }
            if (var_d0e0201a98e5c2f9.size > 0) {
                foreach (footprint in var_d0e0201a98e5c2f9) {
                    if (footprint.var_4a71032271dddc82 == self.var_623c5d9542306d1.var_46cfa00a3c715d51 && istrue(self.var_3d84bdede86299b2)) {
                        var_c313f64aeebdd08a = 0;
                        self.var_3d84bdede86299b2 = 0;
                        self notify("zombienest_footprints_in_range");
                        self.var_623c5d9542306d1 function_ab05e129cba5d54c(self);
                        self.var_c6e03a297c0e13b3 = 0;
                    } else if (footprint.var_4a71032271dddc82 > self.var_623c5d9542306d1.var_46cfa00a3c715d51) {
                        var_c313f64aeebdd08a = 0;
                        self.var_623c5d9542306d1 function_915f8ce47f5fcfd4();
                        break;
                    }
                    if (istrue(var_c313f64aeebdd08a)) {
                        if (getdvarint(@"hash_957bdf29bdae1e58", 1) == 1 && !istrue(self.var_3d84bdede86299b2)) {
                            self.var_623c5d9542306d1 thread function_b4480dbdff92e867(self);
                            self.var_3d84bdede86299b2 = 1;
                        }
                    }
                }
            } else if (getdvarint(@"hash_957bdf29bdae1e58", 1) == 1 && !istrue(self.var_3d84bdede86299b2)) {
                self.var_623c5d9542306d1 thread function_b4480dbdff92e867(self);
                self.var_3d84bdede86299b2 = 1;
            }
        }
        wait(1);
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x573c
// Size: 0xc4
function function_915f8ce47f5fcfd4() {
    self.var_46cfa00a3c715d51++;
    function_20553f0e04484a87(self.var_f7f0bd3198024da3.var_f72966079a1774ec[self.var_46cfa00a3c715d51], 0, undefined, "footprint");
    self notify("footprint_loop_stop");
    foreach (player in teams::getteamdata(self.teams[0], "players")) {
        if (istrue(player.var_c6e03a297c0e13b3)) {
            player function_5225080b8f50d488(player);
        }
        thread function_fe6ed3e33642aeba(player, self.var_f7f0bd3198024da3);
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5807
// Size: 0x57
function function_b4480dbdff92e867(player) {
    player notify("zombienest_tracking_objective");
    player endon("zombienest_tracking_objective");
    self endon("skip_investigation");
    self endon("task_ended");
    level endon("game_ended");
    player endon("zombienest_footprints_in_range");
    player endon("death_or_disconnect");
    wait(5);
    function_5225080b8f50d488(player);
    player.var_c6e03a297c0e13b3 = 1;
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5865
// Size: 0x19
function function_5c243972c743674b(player) {
    player namespace_c133516bfc1d803c::uiobjectiveshow("zombienest");
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5885
// Size: 0x14
function function_43d761f725d3c7d3(player) {
    player namespace_c133516bfc1d803c::uiobjectivehide();
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58a0
// Size: 0xff
function function_3979023c78a59382() {
    foreach (player in teams::getteamdata(self.teams[0], "players")) {
        function_43d761f725d3c7d3(player);
    }
    if (isdefined(self.objectiveiconid)) {
        namespace_c133516bfc1d803c::deletequestobjicon();
        self.objectiveiconid = undefined;
    }
    if (isdefined(self.var_cd619f76679fd9ad)) {
        foreach (zombie in self.var_cd619f76679fd9ad) {
            if (isdefined(zombie.objectiveiconid)) {
                zombie namespace_c133516bfc1d803c::deletequestobjicon();
                zombie.objectiveiconid = undefined;
            }
        }
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59a6
// Size: 0x166
function function_20553f0e04484a87(target, var_630cc7e8a4141d21, z_offset, var_9334aaa158b20071) {
    if (!isdefined(var_630cc7e8a4141d21)) {
        var_630cc7e8a4141d21 = 0;
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
        switch (var_9334aaa158b20071) {
        case #"hash_a5ddf08edc92980d":
            objective_setdescription(self.objectiveiconid, "MP_BR_INGAME/ZOMBIENEST_CORPSE_ICON");
            break;
        case #"hash_be50d9e05faa0574":
            objective_setdescription(self.objectiveiconid, "MP_BR_INGAME/ZOMBIENEST_FOOTPRINT_ICON");
            break;
        case #"hash_928a11494cdce5eb":
            objective_setdescription(self.objectiveiconid, "MP_BR_INGAME/ZOMBIENEST_NEST_ICON");
            break;
        case #"hash_4e47eb6c32f5b165":
            objective_setdescription(self.objectiveiconid, "MP_BR_INGAME/ZOMBIENEST_HVT_ICON");
            break;
        default:
            break;
        }
        namespace_6c8a837ec98fe0b8::objective_set_pulsate(self.objectiveiconid, var_630cc7e8a4141d21);
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b13
// Size: 0x29
function function_5225080b8f50d488(player) {
    if (isdefined(self.objectiveiconid)) {
        objective_addclienttomask(self.objectiveiconid, player);
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b43
// Size: 0x29
function function_ab05e129cba5d54c(player) {
    if (isdefined(self.objectiveiconid)) {
        objective_removeclientfrommask(self.objectiveiconid, player);
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b73
// Size: 0x29
function function_516e4c50b671b284(team) {
    if (isdefined(self.objectiveiconid)) {
        objective_addteamtomask(self.objectiveiconid, team);
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ba3
// Size: 0x29
function function_a6cbdfe5e2529a0(team) {
    if (isdefined(self.objectiveiconid)) {
        objective_removeteamfrommask(self.objectiveiconid, team);
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5bd3
// Size: 0x1cf
function function_8cccf13ebffd574a() {
    self.var_5c2a54b6e701a80b = [];
    self.var_34eac412f9dd7c2b = [];
    self.var_a67f8b76a32cd01a = [];
    self.var_e560db2951960f12 = undefined;
    foreach (trigger in level.var_de3cfce369a7d08f.var_a2ce95f2a3cda045) {
        if (isdefined(trigger.target) && trigger.target == self.var_f59cdbf646c7ca3.targetname) {
            self.var_5c2a54b6e701a80b[self.var_5c2a54b6e701a80b.size] = trigger;
        } else if (isdefined(trigger.script_noteworthy) && trigger.script_noteworthy == self.var_f59cdbf646c7ca3.targetname) {
            self.var_5c2a54b6e701a80b[self.var_5c2a54b6e701a80b.size] = trigger;
        }
    }
    foreach (volume in self.var_5c2a54b6e701a80b) {
        volume.task = self;
        if (isdefined(volume.script_noteworthy) && volume.script_noteworthy == "zombie_range") {
            self.var_e560db2951960f12 = volume;
            namespace_f1565a2788ab1e89::makeenterexittrigger(volume, &function_6f43b30e1642a791, &function_2411949336ee55b1);
        } else {
            namespace_f1565a2788ab1e89::makeenterexittrigger(volume, &function_42c43c7d637d63fe, &function_8790745ab2a06a28);
        }
    }
    self.var_85fd31604998e408 = 1;
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5da9
// Size: 0x72
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

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e22
// Size: 0xf5
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
        foreach (zombie in task.var_795ccd62187df177) {
            task function_56854cb0c53ecb54(zombie);
        }
    } else if (istrue(task.nest_started)) {
        task function_4d86cf7193d4a9c();
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f1e
// Size: 0x1c8
function function_42c43c7d637d63fe(ent, trigger) {
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
    if (isdefined(ent.var_623c5d9542306d1) && ent.var_623c5d9542306d1 == task) {
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
    if (istrue(task.var_85fd31604998e408)) {
        ent setscriptablepartstate("nest_fx", "on");
        if (!istrue(ent.var_fd91403088004b6f)) {
            ent thread function_d96a86252fdca7cb(task);
            ent.var_fd91403088004b6f = 1;
        }
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60ed
// Size: 0x1db
function function_8790745ab2a06a28(ent, trigger) {
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

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62cf
// Size: 0x153
function function_d96a86252fdca7cb(task) {
    self endon("death");
    self endon("zombienest_gas_exited");
    task endon("task_ended");
    level endon("game_ended");
    task endon("hvt_active");
    if (!isdefined(task.var_34eac412f9dd7c2b)) {
        return;
    }
    var_313b418d39c68662 = level.var_de3cfce369a7d08f.var_514691a3959d3432;
    while (1) {
        foreach (player in task.var_34eac412f9dd7c2b) {
            if (self == player) {
                if (isdefined(player) && istrue(player.var_a6637f42471575bc)) {
                    function_2baa36d0d56e86a0();
                } else {
                    if (istrue(self.gasmaskequipped)) {
                        namespace_9c6cddd872ad75f7::processdamage(var_313b418d39c68662);
                        function_2baa36d0d56e86a0();
                    } else {
                        self dodamage(var_313b418d39c68662, self.origin, self, undefined, "MOD_TRIGGER_HURT", "danger_circle_br");
                        namespace_f8d3520d3483c1::damagearmor(var_313b418d39c68662, undefined, self, "MOD_TRIGGER_HURT");
                        function_42123cf8f56caa22();
                    }
                    if (namespace_aead94004cf4c147::isBackpackInventoryEnabled()) {
                        namespace_aead94004cf4c147::function_5323bef1ad6244b9(var_313b418d39c68662);
                    }
                    break;
                }
            }
        }
        wait(level.var_de3cfce369a7d08f.var_9849aa27e1b7f4f1);
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6429
// Size: 0x1fd
function function_142cc83609cf06a4() {
    foreach (prop in self.var_f59cdbf646c7ca3.var_dcbec0adc5c68ae8) {
        prop setscriptablepartstate("state", "hidden");
    }
    foreach (player in teams::getteamdata(self.teams[0], "players")) {
        player.var_623c5d9542306d1 = undefined;
    }
    foreach (trigger in self.var_5c2a54b6e701a80b) {
        if (isdefined(trigger)) {
            trigger delete();
        }
    }
    foreach (player in self.var_34eac412f9dd7c2b) {
        if (isdefined(player.var_fd91403088004b6f)) {
            player.var_fd91403088004b6f = undefined;
        }
        foreach (volume in self.var_5c2a54b6e701a80b) {
            function_8790745ab2a06a28(player, volume);
        }
    }
    if (isdefined(self.var_e560db2951960f12)) {
        self.var_e560db2951960f12 delete();
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x662d
// Size: 0x17
function function_42123cf8f56caa22() {
    if (!istrue(self.loopingcoughaudio)) {
        namespace_e765f0aad2368473::enableloopingcoughaudio();
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x664b
// Size: 0x27
function function_2baa36d0d56e86a0() {
    if (isdefined(self.loopingcoughaudio) && self.loopingcoughaudio == 1) {
        namespace_e765f0aad2368473::disableloopingcoughaudio();
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6679
// Size: 0x1d9
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
            instance.health = instance.health - idamage;
            if (isplayer(eattacker)) {
                instance.var_f49149402765ecae = function_6d6af8144a5131f1(instance.var_f49149402765ecae, eattacker);
                eattacker damagefeedback::updatehitmarker("standard", instance.health <= 0, 0, 0, undefined);
            }
            if (instance.health <= 0) {
                task thread function_2ccf1383d0d48a4e(instance, "aethernest_cyst_gas_burst", eattacker);
            }
            task function_8bad6dae81dcfb8a(idamage);
        }
        task function_97d7132fe8aa4c5c();
        if (task.var_f59cdbf646c7ca3.var_969e56ce1dd93031 <= 0) {
            task function_397f9ef7d73e3d74();
        }
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6859
// Size: 0xb8
function function_2ccf1383d0d48a4e(var_db662a244a03025a, var_ad6fa7af5ed7c23d, player) {
    var_db662a244a03025a endon("death");
    level endon("game_ended");
    self endon("task_ended");
    var_db662a244a03025a.destroyed = 1;
    self.var_f59cdbf646c7ca3.var_969e56ce1dd93031--;
    self.var_e171f154ea4ec2c8++;
    namespace_c133516bfc1d803c::function_e2aa45e2c6b5dec1(self.var_e171f154ea4ec2c8, level.var_de3cfce369a7d08f.var_15d494fa46325346);
    player points::doScoreEvent(#"hash_626189d6229d39b4", undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, 1);
    var_db662a244a03025a thread function_365e93999510dd56("aethernest_cyst_gas_burst");
    wait(0.5);
    thread function_b6875acdbbd823c5(var_db662a244a03025a);
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6918
// Size: 0x6f
function function_365e93999510dd56(var_ad6fa7af5ed7c23d) {
    self endon("death");
    level endon("game_ended");
    switch (var_ad6fa7af5ed7c23d) {
    case #"hash_2f0f62be9305365f":
        self setscriptablepartstate("health", "ignore_damage");
        self setscriptablepartstate("body", "bursted");
        break;
    case #"hash_9a6d8b5ace91c19b":
    default:
        break;
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x698e
// Size: 0x24a
function function_b6875acdbbd823c5(var_db662a244a03025a) {
    loot = [];
    if (!istrue(self.var_a1d6a75620a9cc0b) && !level.var_de3cfce369a7d08f.var_9eff6e89930f11c5) {
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
    if (istrue(var_db662a244a03025a.loot_blocked)) {
        if (!isdefined(self.var_a4b1c86a7369642b) || self.var_a4b1c86a7369642b.size < 1) {
            self.var_a4b1c86a7369642b = loot;
        } else {
            self.var_a4b1c86a7369642b = utility::array_combine(self.var_a4b1c86a7369642b, loot);
        }
        return;
    }
    if (isdefined(self.var_a4b1c86a7369642b) && self.var_a4b1c86a7369642b.size > 0) {
        loot = utility::array_combine(self.var_a4b1c86a7369642b, loot);
        self.var_a4b1c86a7369642b = undefined;
    }
    if (namespace_b8ca654fc4c2dd79::isbrgametypefuncdefined("cyst_drop_hunt_item")) {
        loot = namespace_b8ca654fc4c2dd79::runbrgametypefunc("cyst_drop_hunt_item", loot);
    }
    if (!isdefined(loot) || loot.size < 1) {
        return;
    }
    var_b681301677cf6180 = br_pickups::function_7b9f3966a7a42003();
    drop_origin = var_db662a244a03025a.origin + anglestoup(var_db662a244a03025a.angles) * 10;
    if (drop_origin[2] <= var_db662a244a03025a.origin[2]) {
        drop_origin = drop_origin - (0, 0, 40);
    }
    var_6fe80416b4be165 = {itemsdropped:0, angles:anglestoup(var_db662a244a03025a.angles), origin:drop_origin};
    var_ed3fb99a313de8e = var_6fe80416b4be165 namespace_676729240d83fb4e::lootspawnitemlist(var_b681301677cf6180, loot, 0, undefined, 15);
    namespace_b8ca654fc4c2dd79::runbrgametypefunc("cyst_after_drop", var_ed3fb99a313de8e);
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6bdf
// Size: 0x96
function function_9c7aaf20668cac59() {
    self endon("task_ended");
    level endon("game_ended");
    self.nest_started = 1;
    if (!isdefined(self.var_795ccd62187df177)) {
        self.var_795ccd62187df177 = [];
    }
    thread function_bf394a392efabeb1();
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

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c7c
// Size: 0x15c
function function_e20dec8c17fa960b(wave_num) {
    self endon("task_ended");
    level endon("game_ended");
    var_e075a8cc5c9bfa63 = level.var_de3cfce369a7d08f;
    aitypes = namespace_2b1145f62aa835b8::get_aitype_by_subclass_SharedFunc("zombie_base");
    var_607d8b932b767cd1 = aitypes[0];
    var_6300d91870cc53fc = 0;
    switch (wave_num) {
    case 0:
        var_6300d91870cc53fc = var_e075a8cc5c9bfa63.var_c55617f6d9883a9b;
        break;
    case 1:
        var_6300d91870cc53fc = var_e075a8cc5c9bfa63.var_345c2d401a2d390b;
        break;
    case 2:
        var_6300d91870cc53fc = var_e075a8cc5c9bfa63.var_91fb1860c884811f;
        break;
    }
    self.var_f59cdbf646c7ca3.spawn_points = utility::array_randomize(self.var_f59cdbf646c7ca3.spawn_points);
    for (i = 0; i < var_6300d91870cc53fc; i++) {
        wait(randomfloat(0.75));
        origin = self.var_f59cdbf646c7ca3.spawn_points[i].origin;
        angles = (0, randomint(360), 0);
        function_9784862ab3ab535b(origin, angles, var_607d8b932b767cd1, "difficulty_easy", 0);
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ddf
// Size: 0x1a6
function function_9784862ab3ab535b(origin, angles, spawn_type, tier, var_8a6a97d1c2ef8363) {
    zombie = namespace_2b1145f62aa835b8::spawnNewAIType_SharedFunc(spawn_type, origin, angles, "team_two_hundred");
    if (isdefined(zombie)) {
        zombie callback::add("on_zombie_ai_damaged", &function_96ca7e470db74bdb);
        zombie.task = self;
        zombie function_7e6a015226d63d6d(tier);
        var_5bb577a0f2f9e0d3 = "spawn";
        if (istrue(var_8a6a97d1c2ef8363)) {
            zombie callback::add("on_zombie_ai_killed", &function_3ff14d2ab9b6abc3);
            zombie function_20553f0e04484a87(zombie, 0, self.var_f59cdbf646c7ca3.var_12305012233f8d4d.var_d97331f087aabebf, "hvt");
            zombie function_516e4c50b671b284(self.teams[0]);
            self.var_fa0d486bf600247f++;
            self.var_cd619f76679fd9ad[self.var_cd619f76679fd9ad.size] = zombie;
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
        self.var_795ccd62187df177[self.var_795ccd62187df177.size] = zombie;
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f8c
// Size: 0x1ec
function function_c116f3e640711c4a(wave_num) {
    foreach (var_db662a244a03025a in self.var_f59cdbf646c7ca3.var_15ecf14670478f34) {
        if (!istrue(var_db662a244a03025a.destroyed)) {
            var_db662a244a03025a thread function_365e93999510dd56("aethernest_cyst_gas_expel");
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

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x717f
// Size: 0x23f
function function_564978b158da0f02() {
    self endon("task_ended");
    level endon("game_ended");
    num_to_spawn = self.var_f59cdbf646c7ca3.var_12305012233f8d4d.count;
    type = self.var_f59cdbf646c7ca3.var_12305012233f8d4d.type;
    tier = self.var_f59cdbf646c7ca3.var_12305012233f8d4d.tier;
    var_d97331f087aabebf = self.var_f59cdbf646c7ca3.var_12305012233f8d4d.var_d97331f087aabebf;
    aitypes = namespace_2b1145f62aa835b8::get_aitype_by_subclass_SharedFunc(type);
    spawn_type = aitypes[0];
    var_d556242fefe4446e = 0;
    wait(2);
    if (!isdefined(self.var_cd619f76679fd9ad)) {
        self.var_cd619f76679fd9ad = [];
    }
    self.var_fa0d486bf600247f = 0;
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

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x73c5
// Size: 0x178
function function_2364820daea4d4e5(var_a11500b342b30e89) {
    self endon("task_ended");
    level endon("game_ended");
    if (isdefined(self.var_795ccd62187df177) && self.var_795ccd62187df177.size < level.var_de3cfce369a7d08f.var_ded465ae5000e22) {
        num_to_spawn = level.var_de3cfce369a7d08f.var_ded465ae5000e22 - self.var_795ccd62187df177.size;
        aitypes = namespace_2b1145f62aa835b8::get_aitype_by_subclass_SharedFunc("zombie_base");
        var_607d8b932b767cd1 = aitypes[0];
        var_907e19c5ef6df429 = utility::array_randomize(self.var_f59cdbf646c7ca3.spawn_points);
        foreach (point in var_907e19c5ef6df429) {
            if (point == var_a11500b342b30e89) {
                var_907e19c5ef6df429 = utility::array_remove(var_907e19c5ef6df429, point);
                break;
            }
        }
        for (i = 0; i < num_to_spawn; i++) {
            wait(randomfloat(0.75));
            origin = var_907e19c5ef6df429[i].origin;
            angles = (0, randomint(360), 0);
            function_9784862ab3ab535b(origin, angles, var_607d8b932b767cd1, "difficulty_easy", 0);
        }
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7544
// Size: 0x6a
function function_77482e3120e5e3a6(sound, players) {
    foreach (player in players) {
        if (isplayer(player)) {
            player function_c664a2459d6f3eaa(sound);
        }
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75b5
// Size: 0xa0
function function_8bad6dae81dcfb8a(damage) {
    current_health = function_6e23c830cf22415e();
    prev_health = current_health + damage;
    if (prev_health >= level.var_de3cfce369a7d08f.var_f8c730eecd8cb2ce && current_health <= level.var_de3cfce369a7d08f.var_f8c730eecd8cb2ce) {
        self notify("zombienest_new_wave");
    } else if (prev_health >= level.var_de3cfce369a7d08f.var_f8c72feecd8cb09b && current_health <= level.var_de3cfce369a7d08f.var_f8c72feecd8cb09b) {
        self notify("zombienest_new_wave");
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x765c
// Size: 0x80
function function_6e23c830cf22415e() {
    current_health = 0;
    foreach (var_db662a244a03025a in self.var_f59cdbf646c7ca3.var_15ecf14670478f34) {
        current_health = current_health + var_db662a244a03025a.health;
    }
    self.var_ec031f5af338bc24 = current_health;
    return current_health;
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x76e4
// Size: 0x4e
function function_9f61ce12bbb16cac() {
    self.task endon("nest_started");
    self.task endon("task_ended");
    self endon("death");
    level endon("game_ended");
    while (1) {
        namespace_2b1145f62aa835b8::Animscripted_SharedFunc(self.idle_anim, "idle_end", undefined, undefined);
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7739
// Size: 0x102
function function_bf394a392efabeb1() {
    self notify("nest_started");
    nest = self.var_f59cdbf646c7ca3;
    if (isdefined(nest.ceiling_spawner)) {
        if (isdefined(nest.ceiling_spawner.crawler)) {
            nest.ceiling_spawner.crawler thread namespace_2b1145f62aa835b8::Animscripted_SharedFunc("spawn_nest_crawler_single", "spawn_end", undefined, undefined);
            nest.ceiling_spawner.crawler val::set("idle_hang", "damage", 1);
        }
        if (isdefined(nest.ceiling_spawner.var_fc7043523edbc993)) {
            nest.ceiling_spawner.var_fc7043523edbc993 thread namespace_2b1145f62aa835b8::Animscripted_SharedFunc("spawn_nest_crawler_single", "spawn_end", undefined, undefined);
            nest.ceiling_spawner.var_fc7043523edbc993 val::set("idle_hang", "damage", 1);
        }
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7842
// Size: 0x5d
function function_b92fe4518e875443(offsets, var_996a07fd7388db1c) {
    x_axis = var_996a07fd7388db1c["forward"];
    y_axis = var_996a07fd7388db1c["right"];
    z_axis = var_996a07fd7388db1c["up"];
    return offsets[0] * x_axis + offsets[1] * y_axis + offsets[2] * z_axis;
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x78a7
// Size: 0x91
function function_df878316aedf095a(origin, angles, var_5bb577a0f2f9e0d3) {
    if (utility::function_8fa69650e33c84ef(var_5bb577a0f2f9e0d3)) {
        original_origin = origin;
        new_origin = getgroundposition(origin, 32, 720, 100);
        var_111d3f28b61a4075 = new_origin;
        var_5f41de053ae1fe72 = 10;
        if (abs(utility::function_8efc1cbdaa97f95e(var_5bb577a0f2f9e0d3)[2]) > var_5f41de053ae1fe72) {
            var_111d3f28b61a4075 = original_origin;
        }
        thread utility::function_577d8abff6067c23(var_5bb577a0f2f9e0d3, "spawn_end", var_111d3f28b61a4075, angles, "spawn_animating");
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x793f
// Size: 0x94
function function_7e6a015226d63d6d(difficulty) {
    self.difficulty = difficulty;
    round_number = level.var_f721fc7d0d2d0f47.var_b9cd1d50a91eb69e[difficulty];
    self.var_d10755c0244b1937 = round_number;
    if (isdefined(self.var_47399212b3052720.var_27c2dce37c7b4774)) {
        namespace_6205bc7c5e394598::function_dd21d67ede8ba22(function_d6b1df5b43145297(self.var_47399212b3052720.var_27c2dce37c7b4774, round_number));
        self.health = self.maxhealth;
    }
    function_4fd50faaf7767e65(self, difficulty, round_number);
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x79da
// Size: 0x15b
function function_d6b1df5b43145297(var_b9125cd792d6e378, n_round) {
    var_d7edf55d81f7f944 = getscriptbundle("healthscalinground:" + var_b9125cd792d6e378);
    /#
        assert(isdefined(var_d7edf55d81f7f944));
    #/
    var_fe0aad7efc61fcae = var_d7edf55d81f7f944.var_5fa2f1ef669d2826;
    base = function_53c4c53197386572(self.basehealth, 100);
    max = function_53c4c53197386572(var_d7edf55d81f7f944.maxhealth, base);
    var_3edf6b4eb93f6f0d = var_d7edf55d81f7f944.var_de69a4842af7b496;
    var_557ce280ab90d427 = base;
    var_30d177f7b4f9f195 = 1;
    n_index = 0;
    while (var_30d177f7b4f9f195 < n_round) {
        if (isdefined(var_fe0aad7efc61fcae[n_index + 1].startround) && var_30d177f7b4f9f195 >= var_fe0aad7efc61fcae[n_index + 1].startround) {
            n_index++;
        }
        if (isdefined(var_fe0aad7efc61fcae[n_index].var_d9a25092bed9b107)) {
            var_557ce280ab90d427 = var_557ce280ab90d427 + var_fe0aad7efc61fcae[n_index].var_d9a25092bed9b107;
        }
        var_30d177f7b4f9f195++;
    }
    if (isdefined(max) && var_557ce280ab90d427 > max) {
        var_557ce280ab90d427 = max;
    }
    num_players = 3;
    if (isdefined(var_3edf6b4eb93f6f0d) && num_players > 1) {
        var_557ce280ab90d427 = var_557ce280ab90d427 + var_557ce280ab90d427 * (num_players - 1) * var_3edf6b4eb93f6f0d;
    }
    return int(var_557ce280ab90d427);
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b3d
// Size: 0x225
function function_4fd50faaf7767e65(ai, difficulty, round_number) {
    var_493b21b5a38a3cb9 = 1;
    if (round_number > 10 && round_number <= 30) {
        var_493b21b5a38a3cb9 = 1.666;
    }
    if (istrue(ai.var_919affbe236da4f2)) {
        ai.var_36ae73026dcdd0f9 = int(ceil(ai.var_8b184e6eade0bc4f * var_493b21b5a38a3cb9));
    }
    if (isdefined(ai.grenadeweapon)) {
        ai.var_b285453af8b7df75 = int(ceil(ai.grenadeweapon.maxdamage * var_493b21b5a38a3cb9));
    }
    if (isdefined(ai._blackboard.var_c406031fea1f3214)) {
        ai._blackboard.var_c406031fea1f3214 = int(ceil(ai.var_47399212b3052720.var_3a54f74770e61046 * var_493b21b5a38a3cb9));
    }
    if (is_equal(ai.aicategory, "normal")) {
        var_eb8e0cb3f13faa74 = "run";
        archetype = ai getbasearchetype();
        var_2a1d46d92ea44a14 = isdefined(getanimspeedthreshold(archetype, "sprint"));
        if (var_2a1d46d92ea44a14) {
            switch (difficulty) {
            case #"hash_7bb2cd766703d463":
                var_eb8e0cb3f13faa74 = "run";
                if (randomint(100) <= 25) {
                    var_eb8e0cb3f13faa74 = "sprint";
                }
                break;
            case #"hash_af83e47edfa8900a":
                var_eb8e0cb3f13faa74 = "run";
                if (randomint(100) <= 60) {
                    var_eb8e0cb3f13faa74 = "sprint";
                }
                break;
            }
        }
        ai utility::function_f3bb4f4911a1beb2("zombie_utils", "setMoveSpeed", var_eb8e0cb3f13faa74, "difficulty_region", 1);
        params = spawnstruct();
        params.ai = ai;
        params.difficulty = difficulty;
        params.id = "difficulty_region";
        params.priority = 1;
        level callback::callback("set_region_difficulty_manager_speed", params);
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d69
// Size: 0x41
function function_96ca7e470db74bdb(params) {
    if (isdefined(self.task) && !istrue(self.task.ended)) {
        self.task function_97d7132fe8aa4c5c();
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7db1
// Size: 0x1dd
function function_2e8b80e841d8c57d(params) {
    if (isdefined(self.task) && !istrue(self.task.ended)) {
        self.task.var_795ccd62187df177 = utility::array_remove(self.task.var_795ccd62187df177, self);
        if (isdefined(params.eattacker) && isdefined(params.smeansofdeath) && params.smeansofdeath != "MOD_SUICIDE") {
            params.eattacker points::doScoreEvent(#"hash_7296a029a7f526ab", undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, 1);
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
                var_b681301677cf6180 = br_pickups::function_7b9f3966a7a42003();
                var_6fe80416b4be165 = {itemsdropped:0, angles:self.angles, origin:self.origin};
                var_ed3fb99a313de8e = var_6fe80416b4be165 namespace_676729240d83fb4e::lootspawnitemlist(var_b681301677cf6180, loot, 1);
            }
            if (namespace_b8ca654fc4c2dd79::isbrgametypefuncdefined("zombie_drop_hunt_item")) {
                namespace_b8ca654fc4c2dd79::runbrgametypefunc("zombie_drop_hunt_item");
            }
            function_e08b4c9eee969ed0(self.origin, self.agent_type);
        }
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f95
// Size: 0x650
function function_3ff14d2ab9b6abc3(params) {
    if (isdefined(self.task) && !istrue(self.task.ended)) {
        self.task.var_795ccd62187df177 = array_remove(self.task.var_795ccd62187df177, self);
        self.task.var_fa0d486bf600247f--;
        if (isdefined(params.eattacker) && isdefined(params.smeansofdeath) && params.smeansofdeath != "MOD_SUICIDE") {
            params.eattacker points::doScoreEvent(#"hash_d9eee31ed154db7f", undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, 1);
            function_e08b4c9eee969ed0(self.origin, self.agent_type);
        }
        if (self.task.var_fa0d486bf600247f <= 0 && !istrue(self.task.var_4a3095661d76fc18)) {
            if (isdefined(params.eattacker) && params.eattacker namespace_dbbb37eb352edf96::isvehicle()) {
                if (isdefined(params.eattacker.var_628a2eba2e3d4af4) && namespace_c133516bfc1d803c::function_22239d4cff05d0a1(params.eattacker.var_628a2eba2e3d4af4.team) == self.task) {
                    var_a960304617f022cf = 1;
                }
            }
            if (istrue(var_a960304617f022cf) || isdefined(params.eattacker) && isdefined(params.eattacker.team) && params.eattacker.team == self.task.teams[0]) {
                namespace_c133516bfc1d803c::displaysquadmessagetoteam(self.task.teams[0], teams::getteamdata(self.task.teams[0], "players")[0], 8, namespace_c133516bfc1d803c::getquestindex("zombienest"));
                level thread namespace_a548bd428a566cf3::brleaderdialogteam("mission_zombienest_success", self.task.teams[0], 1, 2, undefined, "dx_br_smis_");
                rewards = namespace_c133516bfc1d803c::function_d212a5e7a40d7c8d("zombienest", self.task.teams[0], teams::getteamdata(self.task.teams[0], "players")[0]);
                if (!namespace_a548bd428a566cf3::istutorial()) {
                    if (isdefined(rewards) && isdefined(rewards["plunder"])) {
                        namespace_c133516bfc1d803c::function_878ebcc241b54505("br_zombienest_quest_complete", namespace_c133516bfc1d803c::function_3d262d56274bd22e("zombienest"), rewards["plunder"], self.task.teams[0], undefined, "splash_list_br_contract_zombienest");
                    }
                }
                self.task thread function_ae065127a63b0829(1, 1);
            } else if (isdefined(params.eattacker) && isdefined(params.eattacker.team) && params.eattacker.team != self.task.teams[0]) {
                params = {intvar:0};
                self.task namespace_c133516bfc1d803c::displayteamsplash(self.task.teams[0], "br_zombienest_quest_poached", params, "splash_list_br_contract_zombienest");
                level thread namespace_a548bd428a566cf3::brleaderdialogteam("mission_zombienest_fail_team", self.task.teams[0], 1, 2, undefined, "dx_br_smis_");
                self.task thread function_ae065127a63b0829(2, 1);
            } else {
                /#
                    /#
                        assertmsg("<unknown string>");
                    #/
                #/
            }
            dropstruct = br_pickups::function_7b9f3966a7a42003();
            var_cb4fad49263e20c4 = {itemsdropped:0, angles:self.angles, origin:self.origin};
            var_cb4fad49263e20c4 namespace_676729240d83fb4e::lootspawnitemlist(dropstruct, self.task.rewards, 0);
            radius = 50;
            anglefrac = 180;
            powerups = [0:"full_armor", 1:"full_ammo"];
            root = namespace_55af56d47545b2f7::function_ecdae672c660149e();
            foreach (i, powerup in powerups) {
                angle = anglefrac * i;
                var_8a9f895755fd607e = cos(angle) * radius;
                var_d867033ab311670b = sin(angle) * radius;
                x = self.origin[0] + var_8a9f895755fd607e;
                y = self.origin[1] + var_d867033ab311670b;
                z = self.origin[2];
                spawn_location = getclosestpointonnavmesh((x, y, z)) + (0, 0, root.var_cbdbd30a8ab88456["drop_height_offset"]);
                if (utility::issharedfuncdefined("powerups", "dropPowerup")) {
                    utility::function_f3bb4f4911a1beb2("powerups", "dropPowerup", powerup, spawn_location);
                }
            }
        } else if (istrue(self.task.var_4a3095661d76fc18)) {
            self.task.var_4a3095661d76fc18 = 0;
            self.task notify("boss_wave_complete");
        }
        if (namespace_b8ca654fc4c2dd79::isbrgametypefuncdefined("zombie_drop_hunt_item")) {
            namespace_b8ca654fc4c2dd79::runbrgametypefunc("zombie_drop_hunt_item");
        }
    }
    if (isdefined(self.objectiveiconid)) {
        namespace_c133516bfc1d803c::deletequestobjicon();
        self.objectiveiconid = undefined;
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x85ec
// Size: 0x3c
function function_15b82c4d1c0ba4ff(player) {
    if (!isdefined(self.var_4ab29f5f9b31b3bc)) {
        self.var_4ab29f5f9b31b3bc = [];
    }
    self.var_4ab29f5f9b31b3bc = utility::function_6d6af8144a5131f1(self.var_4ab29f5f9b31b3bc, player);
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x862f
// Size: 0xd1
function function_5abdf1eee244921c(player) {
    if (isdefined(self.var_4ab29f5f9b31b3bc)) {
        self.var_4ab29f5f9b31b3bc = utility::array_remove(self.var_4ab29f5f9b31b3bc, player);
    }
    foreach (zombie in self.var_795ccd62187df177) {
        zombie utility::function_f3bb4f4911a1beb2("zombie_utils", "setTarget", undefined, "player_" + player getentitynumber());
        zombie function_731a8d6c599a0a10(player);
        if (isdefined(zombie.favoriteenemy) && zombie.favoriteenemy == player) {
            zombie.favoriteenemy = undefined;
        }
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8707
// Size: 0x62
function function_4d86cf7193d4a9c() {
    self.zombies_agitated = 0;
    foreach (zombie in self.var_795ccd62187df177) {
        zombie function_3150ab6d409750d7();
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8770
// Size: 0x69
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

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x87e0
// Size: 0x8a
function function_a2f60fa6657482a1(nest) {
    level endon("game_ended");
    self.task endon("task_ended");
    self.task endon("zombies_agitated");
    while (1) {
        if (utility::function_acb96530881571aa(self, nest.origin, 50)) {
            break;
        }
        wait(0.5);
    }
    utility::function_f3bb4f4911a1beb2("zombie_attractor", "removeOnSelf", nest);
    self clearenemy();
    self aieventlistenerevent("idle", undefined, nest.origin);
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8871
// Size: 0xbd
function function_97d7132fe8aa4c5c() {
    if (istrue(self.nest_started) && !istrue(self.zombies_agitated)) {
        self notify("zombies_agitated");
        self.zombies_agitated = 1;
        foreach (zombie in self.var_795ccd62187df177) {
            if (isdefined(zombie.var_1ab5d1f76bea23a5)) {
                zombie utility::function_f3bb4f4911a1beb2("zombie_attractor", "removeOnSelf", self.var_f59cdbf646c7ca3);
            }
            zombie.ignoreall = 0;
            function_56854cb0c53ecb54(zombie);
        }
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8935
// Size: 0xf5
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
    } else {
        function_4d86cf7193d4a9c();
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a31
// Size: 0x19
function function_845a94db40b85c79() {
    level endon("game_ended");
    wait(5);
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a51
// Size: 0xb5
function function_eb4fe8866f0936ea(params) {
    val::set("br_death", "ignoreme", 1);
    var_f0fb6feb6569cd33 = function_77eba21ac8e52ca5(self.origin);
    if (isdefined(var_f0fb6feb6569cd33)) {
        task = var_f0fb6feb6569cd33.task;
        task function_5abdf1eee244921c(self);
        foreach (zombie in task.var_795ccd62187df177) {
            task function_56854cb0c53ecb54(zombie);
        }
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b0d
// Size: 0xf2
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
                foreach (zombie in task.var_795ccd62187df177) {
                    task function_56854cb0c53ecb54(zombie);
                }
            }
        }
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c06
// Size: 0xcc
function function_77eba21ac8e52ca5(var_fd9375a04ce74360) {
    var_be22b4569ccbb63f = [];
    foreach (nest in level.var_de3cfce369a7d08f.var_2583679d5dd79218) {
        if (isdefined(nest.task) && !istrue(nest.ended) && istrue(nest.task.var_ee01b2d72e3aa653)) {
            var_be22b4569ccbb63f[var_be22b4569ccbb63f.size] = nest;
        }
    }
    if (var_be22b4569ccbb63f.size == 0) {
        return undefined;
    }
    var_f0fb6feb6569cd33 = sortbydistance(var_be22b4569ccbb63f, var_fd9375a04ce74360)[0];
    return var_f0fb6feb6569cd33;
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8cda
// Size: 0x72
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

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d53
// Size: 0x6c
function function_e08b4c9eee969ed0(position, zombie_type) {
    eventparams = [0:"pos_x", 1:position[0], 2:"pos_y", 3:position[1], 4:"pos_z", 5:position[2], 6:"zombie_type", 7:zombie_type];
    dlog_recordevent("dlog_event_br_eradication_zombie_killed", eventparams);
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8dc6
// Size: 0xa1
function function_a200944290c18eae(grenade) {
    grenade endon("death");
    thread namespace_85b18538a4f2be70::decoy_used(grenade);
    grenade waittill("decoy_activated");
    var_f0fb6feb6569cd33 = sortbydistance(level.var_de3cfce369a7d08f.var_2583679d5dd79218, grenade.origin)[0];
    task = var_f0fb6feb6569cd33.task;
    grenade.attractor = utility::function_f3bb4f4911a1beb2("zombie_attractor", "addAttractor", grenade, 1, 1000, 0, undefined, &function_169df21202024d0, 0, undefined, 1);
    grenade thread function_bc40d6005e682b20(task);
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e6e
// Size: 0xa9
function function_bc40d6005e682b20(task) {
    self waittill("death");
    if (isdefined(self.attractor)) {
        utility::function_f3bb4f4911a1beb2("zombie_attractor", "removeAttractor", self.attractor);
    }
    if (isdefined(task) && task function_87cfbfeba9393973()) {
        task function_97d7132fe8aa4c5c();
        foreach (zombie in self.var_795ccd62187df177) {
            task function_56854cb0c53ecb54(zombie);
        }
    }
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f1e
// Size: 0x8d
function function_169df21202024d0(attractor, ai) {
    if (issubstr(ai.subclass, "armored") || issubstr(ai.subclass, "hellhound") || issubstr(ai.subclass, "mimic")) {
        return 0;
    }
    if (!isdefined(ai.task) || !ai.task.zombies_agitated) {
        return 0;
    }
    return 1;
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8fb3
// Size: 0xfa
function function_4e34370c01cfc47b() {
    /#
        level endon("<unknown string>");
        while (1) {
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
                task = level.players[0].var_623c5d9542306d1;
                if (isdefined(task)) {
                    task function_ae065127a63b0829(0);
                }
                waitframe();
                setdvar(@"hash_b514aa4f0bc70e91", 0);
            }
            wait(1);
        }
    #/
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x90b4
// Size: 0x24d
function function_14aaa6c0de93e71d(get_points) {
    /#
        if (!isdefined(get_points)) {
            get_points = 0;
        }
        task = spawnstruct();
        task.teams = [];
        task.type = {ref:"<unknown string>"};
        task.tablet = {angles:level.players[0].angles, origin:level.players[0].origin};
        foreach (type in level.var_41f4bc9ee8c7c9c6.var_7ba7458b5fc820f7) {
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
                /#
                    assertmsg(level.players[0].team + "<unknown string>");
                #/
                return;
            }
            task function_8ad1b4ddc1fd852a(level.players[0].team, level.players[0]);
            task.var_7ca287a82f54e4f6 = level.players[0];
            task function_dcc897cdf0a89369(get_points);
            if (namespace_b8ca654fc4c2dd79::isbrgametypefuncdefined("<unknown string>")) {
                namespace_b8ca654fc4c2dd79::runbrgametypefunc("<unknown string>", task, level.players[0].team);
            }
            return task;
        }
        return undefined;
    #/
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9308
// Size: 0x1ee
function function_dcc897cdf0a89369(var_ce70646c225c170d) {
    /#
        if (!isdefined(var_ce70646c225c170d)) {
            var_ce70646c225c170d = 0;
        }
        time = level.var_de3cfce369a7d08f.time;
        if (var_ce70646c225c170d) {
            namespace_c133516bfc1d803c::uiobjectiveshowtoteam("<unknown string>", self.teams[0]);
            function_92c1e7e3136ad154();
            game_utility::function_6b6b6273f8180522("<unknown string>", self.var_6078eb76085c3221[0].origin, level.var_de3cfce369a7d08f.circle_radius);
            foreach (player in teams::getteamdata(self.teams[0], "<unknown string>")) {
                game_utility::function_cfd53c8f6878014f(player);
                player.var_623c5d9542306d1 = self;
                self.var_f7f0bd3198024da3 = self.var_9b0bb673329d19ac[0];
                self.var_46cfa00a3c715d51 = 0;
                thread function_fe6ed3e33642aeba(player, self.var_f7f0bd3198024da3);
                player thread function_2af5e50a915f1920(self.var_f7f0bd3198024da3);
            }
        } else {
            namespace_c133516bfc1d803c::uiobjectiveshowtoteam("<unknown string>", self.teams[0]);
            foreach (player in teams::getteamdata(self.teams[0], "<unknown string>")) {
                player.var_623c5d9542306d1 = self;
            }
        }
        self.category = "<unknown string>";
        time = namespace_c133516bfc1d803c::function_9b6275085fbcb8f4(time);
        namespace_c133516bfc1d803c::function_5a15174d34f0670c(time, 0);
        thread function_e4a9b03d2930aafb();
        thread function_7667d54cafb43a31();
        thread function_8586c8d5c6dad9ec();
    #/
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x94fd
// Size: 0x13d
function function_561ffdaca5b546d3() {
    /#
        level waittill("<unknown string>");
        foreach (point in self.var_674ccca06e1c6205) {
            path = level.players[0] findpath(point.origin, point.nest.origin);
            point.scriptable.path = {path:path};
            point.scriptable.path.var_a5a1a3685b2cdfe7 = spawn("<unknown string>", point.scriptable.path.path[0]);
            point.scriptable.path thread function_ca0219b7de04f1c8();
            point.scriptable.path thread function_9a387a79e023c865(0);
        }
    #/
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9641
// Size: 0xa1
function function_642f50e2994cc88a() {
    /#
        level endon("<unknown string>");
        level endon("<unknown string>");
        while (1) {
            foreach (footprint in self.var_95b16bd23e059f21) {
                playfx(footprint.var_22d604a09adb7131, footprint.origin, footprint.forward, undefined, level.players[0], 1);
            }
            wait(8);
        }
    #/
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x96e9
// Size: 0x1de
function debug_init() {
    /#
        devgui::function_6e7290c8ee4f558b("<unknown string>");
        devgui::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_9bb82c8734a573e8);
        devgui::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_6b8f7e02363c5cfd);
        devgui::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_34d74121eb62d0fe);
        devgui::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_57ce3c8a1159b699);
        devgui::function_fe953f000498048f();
        devgui::function_6e7290c8ee4f558b("<unknown string>");
        devgui::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_4bac6cd9d73637eb);
        devgui::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_f058741abf76ef6e);
        devgui::function_fe953f000498048f();
        devgui::function_6e7290c8ee4f558b("<unknown string>");
        devgui::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_fd00c93f2b9a8e2b);
        devgui::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_42fcb3035ec65ad3);
        devgui::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_bf455de9fd076428);
        devgui::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_a54493cb8f101422);
        devgui::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_a2a8e024544d03bf);
        devgui::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_cf50d7c9e197b5fc);
        devgui::function_fe953f000498048f();
        devgui::function_6e7290c8ee4f558b("<unknown string>");
        devgui::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_30a6365c339c10f6);
        devgui::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_3162064fda5fd39e);
        devgui::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_7d68cd7aad1e7091);
        devgui::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_de0230ec8403cc5f);
        devgui::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_a74ca1aa250e9122);
        devgui::function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_d1726523cbfb3b8d);
        devgui::function_fe953f000498048f();
    #/
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x98ce
// Size: 0x7c
function function_9bb82c8734a573e8() {
    /#
        poi = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(level.players[0].origin);
        var_d402f234ec79541a = namespace_37f0fb6355a4618a::function_d795b532bedd6431(poi, level.players[0].origin);
        iprintln("<unknown string>" + poi);
        if (isdefined(var_d402f234ec79541a)) {
            iprintln("<unknown string>" + var_d402f234ec79541a.var_71ad22c5d093d90b);
        }
    #/
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9951
// Size: 0x17
function function_6b8f7e02363c5cfd() {
    /#
        setdvar(@"hash_b514aa4f0bc70e91", 1);
    #/
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x996f
// Size: 0x17
function function_34d74121eb62d0fe() {
    /#
        setdvar(@"hash_3764f88c46b94cdf", 1);
    #/
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x998d
// Size: 0x17
function function_57ce3c8a1159b699() {
    /#
        setdvar(@"hash_b964c14b65456862", 1);
    #/
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x99ab
// Size: 0x1b
function function_4bac6cd9d73637eb() {
    /#
        level.player namespace_82dcd1d5ae30ff7::giveperk("<unknown string>");
    #/
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x99cd
// Size: 0x85
function function_f058741abf76ef6e() {
    /#
        if (istrue(level.var_de3cfce369a7d08f.var_78e879ff07bbfd2f)) {
            level.var_de3cfce369a7d08f.var_78e879ff07bbfd2f = 0;
            level notify("zombienest_trigger");
        } else {
            if (isdefined(level.var_de3cfce369a7d08f.var_5f9281806605c0b7)) {
                level.var_de3cfce369a7d08f.var_5f9281806605c0b7 thread function_1b693b431c3259c9();
            }
            level.var_de3cfce369a7d08f.var_78e879ff07bbfd2f = 1;
        }
    #/
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9a59
// Size: 0x7b
function function_1b693b431c3259c9() {
    /#
        level notify("zombienest_trigger");
        level endon("zombienest_trigger");
        for (i = 0; i < self.path.size; i++) {
            if (isdefined(self.path[i + 1])) {
                debug::debug_line(self.path[i], self.path[i + 1], (0, 0, 1), undefined, "zombienest_trigger");
            }
        }
    #/
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x9adb
// Size: 0x1cc
function function_a6b562c4f6189323(type, var_5bb577a0f2f9e0d3, difficulty, boss) {
    /#
        var_e075a8cc5c9bfa63 = level.var_de3cfce369a7d08f;
        var_c9e94f33fd62d9cf = level.player getvieworigin();
        var_655f4170c63b668c = level.player getplayerangles();
        var_738a7094c7bfde17 = anglestoforward(var_655f4170c63b668c);
        var_3eb394d231fb9c74 = var_c9e94f33fd62d9cf + var_738a7094c7bfde17 * 1000;
        var_2fc7b90001702e5c = level.player;
        var_e76c084d206cfb7f = namespace_2a184fc4902783dc::create_itemclip_contents();
        var_f17a61afb63dfd27 = namespace_2a184fc4902783dc::ray_trace(var_c9e94f33fd62d9cf, var_3eb394d231fb9c74, var_2fc7b90001702e5c, var_e76c084d206cfb7f, 0, 0, 1);
        var_a0377a1daf3300d0 = var_f17a61afb63dfd27["<unknown string>"];
        var_3a43d29b943aaf0c = vectortoangles(anglestoforward(level.player.angles) * -1);
        zombie = namespace_2b1145f62aa835b8::spawnNewAIType_SharedFunc(type, var_a0377a1daf3300d0, var_3a43d29b943aaf0c, "<unknown string>");
        zombie.task = {var_795ccd62187df177:[0:zombie], ended:0};
        if (istrue(boss)) {
            zombie callback::add("<unknown string>", &function_3ff14d2ab9b6abc3);
            zombie.task.var_fa0d486bf600247f = 10;
        } else {
            zombie callback::add("<unknown string>", &function_2e8b80e841d8c57d);
        }
        zombie function_7e6a015226d63d6d(difficulty);
        if (isdefined(var_5bb577a0f2f9e0d3) && isdefined(zombie)) {
            zombie function_df878316aedf095a(var_a0377a1daf3300d0, var_a0377a1daf3300d0, var_5bb577a0f2f9e0d3);
        }
        level.var_de3cfce369a7d08f.var_d3f80afc75b74e8b = zombie;
    #/
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9cae
// Size: 0x3c
function function_fd00c93f2b9a8e2b() {
    /#
        aitypes = namespace_2b1145f62aa835b8::get_aitype_by_subclass_SharedFunc("<unknown string>");
        var_9f578d49d039394b = aitypes[0];
        function_a6b562c4f6189323(var_9f578d49d039394b, "<unknown string>", "<unknown string>");
    #/
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9cf1
// Size: 0x3c
function function_30a6365c339c10f6() {
    /#
        aitypes = namespace_2b1145f62aa835b8::get_aitype_by_subclass_SharedFunc("<unknown string>");
        var_9f578d49d039394b = aitypes[0];
        function_a6b562c4f6189323(var_9f578d49d039394b, "<unknown string>", "<unknown string>");
    #/
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9d34
// Size: 0x92
function function_42fcb3035ec65ad3() {
    /#
        aitypes = namespace_2b1145f62aa835b8::get_aitype_by_subclass_SharedFunc("<unknown string>");
        var_ea3e656b50d22272 = aitypes[0];
        foreach (aitype in aitypes) {
            if (issubstr(aitype, "<unknown string>")) {
                var_ea3e656b50d22272 = aitype;
            }
        }
        function_a6b562c4f6189323(var_ea3e656b50d22272, "<unknown string>", "<unknown string>");
    #/
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9dcd
// Size: 0x92
function function_3162064fda5fd39e() {
    /#
        aitypes = namespace_2b1145f62aa835b8::get_aitype_by_subclass_SharedFunc("<unknown string>");
        var_ea3e656b50d22272 = aitypes[0];
        foreach (aitype in aitypes) {
            if (issubstr(aitype, "<unknown string>")) {
                var_ea3e656b50d22272 = aitype;
            }
        }
        function_a6b562c4f6189323(var_ea3e656b50d22272, "<unknown string>", "<unknown string>");
    #/
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9e66
// Size: 0x3e
function function_bf455de9fd076428() {
    /#
        aitypes = namespace_2b1145f62aa835b8::get_aitype_by_subclass_SharedFunc("<unknown string>");
        spawn_type = aitypes[0];
        function_a6b562c4f6189323(spawn_type, "<unknown string>", "<unknown string>", 1);
    #/
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9eab
// Size: 0x3c
function function_7d68cd7aad1e7091() {
    /#
        aitypes = namespace_2b1145f62aa835b8::get_aitype_by_subclass_SharedFunc("<unknown string>");
        spawn_type = aitypes[0];
        function_a6b562c4f6189323(spawn_type, "<unknown string>", "<unknown string>");
    #/
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9eee
// Size: 0x3e
function function_a54493cb8f101422() {
    /#
        aitypes = namespace_2b1145f62aa835b8::get_aitype_by_subclass_SharedFunc("<unknown string>");
        spawn_type = aitypes[0];
        function_a6b562c4f6189323(spawn_type, "<unknown string>", "<unknown string>", 1);
    #/
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9f33
// Size: 0x3c
function function_de0230ec8403cc5f() {
    /#
        aitypes = namespace_2b1145f62aa835b8::get_aitype_by_subclass_SharedFunc("<unknown string>");
        spawn_type = aitypes[0];
        function_a6b562c4f6189323(spawn_type, "<unknown string>", "<unknown string>");
    #/
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9f76
// Size: 0x3c
function function_a2a8e024544d03bf() {
    /#
        aitypes = namespace_2b1145f62aa835b8::get_aitype_by_subclass_SharedFunc("<unknown string>");
        spawn_type = aitypes[0];
        function_a6b562c4f6189323(spawn_type, "<unknown string>", "<unknown string>");
    #/
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9fb9
// Size: 0x3c
function function_a74ca1aa250e9122() {
    /#
        aitypes = namespace_2b1145f62aa835b8::get_aitype_by_subclass_SharedFunc("<unknown string>");
        spawn_type = aitypes[0];
        function_a6b562c4f6189323(spawn_type, "<unknown string>", "<unknown string>");
    #/
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9ffc
// Size: 0x3e
function function_cf50d7c9e197b5fc() {
    /#
        aitypes = namespace_2b1145f62aa835b8::get_aitype_by_subclass_SharedFunc("<unknown string>");
        spawn_type = aitypes[0];
        function_a6b562c4f6189323(spawn_type, "<unknown string>", "<unknown string>", 1);
    #/
}

// Namespace namespace_32e9b198f2c5f0d7/namespace_a8730b80ab5fc256
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa041
// Size: 0x3c
function function_d1726523cbfb3b8d() {
    /#
        aitypes = namespace_2b1145f62aa835b8::get_aitype_by_subclass_SharedFunc("<unknown string>");
        spawn_type = aitypes[0];
        function_a6b562c4f6189323(spawn_type, "<unknown string>", "<unknown string>");
    #/
}

