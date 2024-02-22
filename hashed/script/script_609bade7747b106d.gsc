// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_6df6604a74a7a9c7;
#using script_3b64eb40368c1450;
#using script_4c770a9a4ad7659c;
#using script_38eb8f4be20d54f4;
#using script_639bf783929acf9b;
#using script_22856b83897eaad8;
#using script_7c40fa80892a721;
#using script_64316dc775e91122;
#using script_398835140857d740;
#using script_7f5e7a3cb514aca5;
#using script_62a4f7a62643fe8;
#using script_443d99fe707f1d9f;
#using script_2583ee5680cf4736;
#using script_7b2517368c79e5bc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using script_16ea1b94f0f381b3;
#using script_22f1701e151b9d12;
#using script_3e2f8cc477d57433;

#namespace namespace_71b655df1f1b6d7d;

// Namespace namespace_71b655df1f1b6d7d/namespace_946ba58a8d1e7bfd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x813
// Size: 0xc
function init() {
    level thread function_5be6f854fd9386d8();
}

// Namespace namespace_71b655df1f1b6d7d/namespace_946ba58a8d1e7bfd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x826
// Size: 0x6
function function_1f22bdc2d41856b2() {
    /#
    #/
}

// Namespace namespace_71b655df1f1b6d7d/namespace_946ba58a8d1e7bfd
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x833
// Size: 0x54
function private function_8ca944706acb991e(player, var_c3cdffc23f23de67) {
    power_interact = namespace_5775ad2badedbcaa::function_90472496b91b94b3(player.origin, 128, &function_372b03587b1b4a47, "JUP_OB_OBJECTIVES/INTERACT_ACTIVATE");
    power_interact.var_c3cdffc23f23de67 = var_c3cdffc23f23de67;
    power_interact thread function_23834c47d25128fc(player);
    return power_interact;
}

// Namespace namespace_71b655df1f1b6d7d/namespace_946ba58a8d1e7bfd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x88f
// Size: 0x3b
function private function_23834c47d25128fc(player) {
    self endon("death");
    player endon("death");
    while (!isalive(player)) {
        waitframe();
    }
    self.origin = player.origin;
}

// Namespace namespace_71b655df1f1b6d7d/namespace_946ba58a8d1e7bfd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8d1
// Size: 0x69
function private function_372b03587b1b4a47(player) {
    if (!isplayer(player)) {
        return;
    }
    if (istrue(player.inlaststand) || !isalive(player)) {
        return;
    }
    if (player isreloading() || player isgestureplaying()) {
        return;
    }
    if (isdefined(self.var_c3cdffc23f23de67)) {
        function_1208466b550e2cdd(player, self.var_c3cdffc23f23de67);
    }
    self delete();
}

// Namespace namespace_71b655df1f1b6d7d/namespace_946ba58a8d1e7bfd
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x941
// Size: 0x75b
function private function_5be6f854fd9386d8() {
    var_2b0e2c3554ec752e = 0;
    var_acb83eb42c42aea3 = 0;
    var_1a4d93eb2cf29ffa = [];
    while (1) {
        if (!isdefined(level.players) || level.players.size <= 0) {
            waitframe();
            continue;
        }
        var_f2d5a9abbf44eddb = getdvarint(@"hash_89f5285b9abcc3b2", -1);
        if (var_f2d5a9abbf44eddb != var_2b0e2c3554ec752e) {
            var_2b0e2c3554ec752e = var_f2d5a9abbf44eddb;
            if (var_2b0e2c3554ec752e > 3 || var_2b0e2c3554ec752e < 1) {
                waitframe();
                continue;
            }
            foreach (player in level.players) {
                function_1208466b550e2cdd(player, var_2b0e2c3554ec752e);
            }
        }
        var_fa8bbcce8526ae26 = getdvarint(@"hash_e9161181da8e368d", -1);
        if (var_fa8bbcce8526ae26 != -1) {
            setdvar(@"hash_e9161181da8e368d", -1);
            if (var_fa8bbcce8526ae26 > 3 || var_fa8bbcce8526ae26 < 1) {
                waitframe();
                continue;
            }
            foreach (power_interact in var_1a4d93eb2cf29ffa) {
                if (isent(power_interact)) {
                    power_interact delete();
                }
            }
            var_1a4d93eb2cf29ffa = [];
            foreach (player in level.players) {
                var_1a4d93eb2cf29ffa = utility::array_add(var_1a4d93eb2cf29ffa, function_8ca944706acb991e(player, var_fa8bbcce8526ae26));
            }
        }
        var_3551c5b4c049f89f = getdvarint(@"hash_60a7c4fa4b51e27f", -1);
        if (var_3551c5b4c049f89f != -1) {
            setdvar(@"hash_60a7c4fa4b51e27f", -1);
            foreach (power_interact in var_1a4d93eb2cf29ffa) {
                if (isent(power_interact)) {
                    power_interact delete();
                }
            }
            var_1a4d93eb2cf29ffa = [];
        }
        waitframe();
        cash_amount = getdvarint(@"hash_2ae4ec9bce607d9f", -1);
        if (cash_amount != -1) {
            setdvar(@"hash_2ae4ec9bce607d9f", -1);
            foreach (player in level.players) {
                function_bb25bcf1cd97e7e6(player, cash_amount);
            }
        }
        give_weapon = getdvar(@"hash_7a55852a2a48bec8", "");
        if (give_weapon != "") {
            setdvar(@"hash_7a55852a2a48bec8", "");
            var_ab9868b0589a6052 = function_fafbb41e088ecb77(give_weapon, ",");
            foreach (player in level.players) {
                function_5db5161c26cbc7f5(player, var_ab9868b0589a6052[0], var_ab9868b0589a6052[1]);
            }
        }
        give_equipment = getdvar(@"hash_45176cb4c5bdb564", "");
        if (give_equipment != "") {
            setdvar(@"hash_45176cb4c5bdb564", "");
            foreach (player in level.players) {
                function_bb443142fce62d83(player, give_equipment);
            }
        }
        give_killstreak = getdvar(@"hash_e532bab5613d3666", "");
        if (give_killstreak != "") {
            setdvar(@"hash_e532bab5613d3666", "");
            foreach (player in level.players) {
                function_418ea3263145bfeb(player, give_killstreak);
            }
        }
        var_bd437e647db702f9 = getdvar(@"hash_1409424c8c9fc5b8", "");
        if (var_bd437e647db702f9 != "") {
            setdvar(@"hash_1409424c8c9fc5b8", "");
            player = level.players[0];
            function_8146e3872f2d0640(player, var_bd437e647db702f9);
        }
        ai_type = getdvar(@"hash_46f4229f30dc1316", "");
        if (ai_type != "") {
            setdvar(@"hash_46f4229f30dc1316", "");
            player = level.players[0];
            function_e52113d9e4cd99f5(player, ai_type);
        }
        difficulty = getdvar(@"hash_3e2c81d9efbcdc6f", "");
        if (difficulty != "") {
            setdvar(@"hash_3e2c81d9efbcdc6f", "");
            player = level.players[0];
            function_2d15fb31fc1f1590(player, difficulty);
        }
        if (getdvarint(@"hash_d43d9df4f7077b8f", 0)) {
            setdvar(@"hash_d43d9df4f7077b8f", 0);
            if (namespace_24b61da48c7bdf06::function_1f1b9a49f43638d0()) {
                function_b54b90237acc6e52(level.var_24b61da48c7bdf06.var_4355367c3316786c);
            }
        }
        if (getdvarint(@"hash_f55c880f7c1feaaa", 0)) {
            setdvar(@"hash_f55c880f7c1feaaa", 0);
            if (namespace_24b61da48c7bdf06::function_1f1b9a49f43638d0()) {
                var_9688e423e1fe5a46 = level.var_24b61da48c7bdf06.radiation.radius;
                function_b54b90237acc6e52(var_9688e423e1fe5a46);
            }
        }
        if (getdvarint(@"hash_42c4d96f20c9f088", 0)) {
            setdvar(@"hash_42c4d96f20c9f088", 0);
            if (!namespace_24b61da48c7bdf06::function_1f1b9a49f43638d0()) {
                namespace_24b61da48c7bdf06::function_6cbfd9827af0e6d1();
            }
        }
        var_11c8fb56bcd11155 = getdvarint(@"hash_5033fa56c727d890", -1);
        if (var_11c8fb56bcd11155 != -1) {
            setdvar(@"hash_5033fa56c727d890", -1);
            if (isdefined(level.var_b4afbe308b4c542a)) {
                [[ level.var_b4afbe308b4c542a ]]();
            }
        }
        var_fbe755f0978c0369 = getdvar(@"hash_17fff40f43ad95d0", "");
        if (var_fbe755f0978c0369 != "") {
            setdvar(@"hash_17fff40f43ad95d0", "");
            foreach (player in level.players) {
                if (!isbot(player)) {
                    function_36c67c8305fdfa8(player, var_fbe755f0978c0369);
                }
            }
        }
        waitframe();
    }
}

// Namespace namespace_71b655df1f1b6d7d/namespace_946ba58a8d1e7bfd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x10a3
// Size: 0xb9
function private function_b54b90237acc6e52(radius) {
    level.var_24b61da48c7bdf06.radiation radiation::destroy();
    level.var_24b61da48c7bdf06.radiation = radiation::create(level.var_24b61da48c7bdf06.var_5712319afa086cc8, radius, level.var_24b61da48c7bdf06.var_8f7178eaf2132d21, level.var_24b61da48c7bdf06.var_e36b6de5b64686ca, 1);
    level.var_24b61da48c7bdf06.radiation radiation::function_70c6bcd3c644aad9(level.var_24b61da48c7bdf06.var_4d864f4a66650347);
    thread namespace_24b61da48c7bdf06::function_db25872d3eb4f360();
    thread namespace_24b61da48c7bdf06::function_ebf8ee98cf7a3be0();
}

// Namespace namespace_71b655df1f1b6d7d/namespace_946ba58a8d1e7bfd
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1163
// Size: 0x7b
function private function_1208466b550e2cdd(player, lvl, wait_time) {
    if (isdefined(wait_time)) {
        wait(wait_time);
    }
    function_3f8595344f40b9c9(player, lvl);
    function_30590af066390cb(player, int(min(lvl + 1, 4)));
    function_ab1878d670d738d9(player);
    waitframe();
    function_4da00feaa9f7ebc9(player, lvl);
    function_321aa1e84b5fd453(player, lvl);
    if (getdvarint(@"hash_cd4ab555eb22ea4", 1)) {
        function_376cc7d8d36560b7(player, lvl);
    }
}

// Namespace namespace_71b655df1f1b6d7d/namespace_946ba58a8d1e7bfd
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x11e5
// Size: 0x341
function private function_376cc7d8d36560b7(player, lvl) {
    var_808b1c2970df2dd4 = [0:"ob_jup_item_killstreak_sentrygun", 1:"ob_jup_item_killstreak_cluster_spike", 2:"ob_jup_item_killstreak_precision_airstrike", 3:"ob_jup_item_killstreak_juggernaut", 4:"ob_jup_item_killstreak_clusterstrike"];
    var_cf4e7b98057c823 = [0:"ob_jup_item_weapon_pi_raygun", 1:"ob_jup_item_weapon_la_plasmagun", 2:"ob_jup_item_weapon_ar_dg2"];
    var_92e89639152b09d2 = [0:"ob_jup_item_ammomod_napalmburst", 1:"ob_jup_item_ammomod_deadwire", 2:"ob_jup_item_ammomod_cryofreeze", 3:"ob_jup_item_ammomod_brainrot", 4:"ob_jup_item_ammomod_shatterblast"];
    switch (lvl) {
    case 3:
        a_items = [0:"ob_jup_item_gasmask_durable", 1:"ob_jup_item_backpack_large", 2:"ob_jup_item_revive_self_revive", 3:random(var_92e89639152b09d2), 4:random(var_808b1c2970df2dd4), 5:random(var_808b1c2970df2dd4), 6:random(var_cf4e7b98057c823), 7:"ob_jup_item_aether_crystal_3", 8:"ob_jup_item_generic_valuable_turret_trap_circuit", 9:"ob_jup_item_lethal_thermite", 10:"ob_jup_item_lethal_thermite", 11:"ob_jup_item_lethal_c4", 12:"ob_jup_item_lethal_c4", 13:"ob_jup_item_tactical_blackhole_bomb", 14:"ob_jup_item_tactical_blackhole_bomb", 15:"ob_jup_item_tactical_monkey_bomb", 16:"ob_jup_item_tactical_monkey_bomb", 17:"ob_jup_item_armor_plate", 18:"ob_jup_item_armor_plate", 19:"ob_jup_item_armor_plate", 20:"ob_jup_item_armor_plate", 21:"ob_jup_item_armor_plate", 22:"ob_jup_item_armor_plate"];
        break;
    case 2:
        a_items = [0:"ob_jup_item_gasmask", 1:"ob_jup_item_backpack_medium", 2:"ob_jup_item_revive_self_revive", 3:random(var_808b1c2970df2dd4), 4:"ob_jup_item_lethal_semtex", 5:"ob_jup_item_lethal_semtex", 6:random(var_92e89639152b09d2), 7:"ob_jup_item_tactical_blackhole_bomb", 8:"ob_jup_item_tactical_monkey_bomb", 9:"ob_jup_item_armor_plate", 10:"ob_jup_item_armor_plate", 11:"ob_jup_item_armor_plate", 12:"ob_jup_item_armor_plate"];
        break;
    case 1:
        a_items = [0:"ob_jup_item_gasmask", 1:"ob_jup_item_revive_self_revive", 2:random(var_808b1c2970df2dd4), 3:"ob_jup_item_lethal_semtex", 4:"ob_jup_item_lethal_semtex", 5:"ob_jup_item_tactical_shockstick", 6:"ob_jup_item_tactical_shockstick", 7:"ob_jup_item_armor_plate", 8:"ob_jup_item_armor_plate", 9:"ob_jup_item_armor_plate"];
    default:
        a_items = [];
        break;
    }
    foreach (item in a_items) {
        itembundle = getscriptbundle("itemspawnentry:" + item);
        if (isdefined(itembundle)) {
            namespace_2abc885019e1956::function_c465d27f3f6066b4(itembundle, player.origin);
        } else {
            /#
                /#
                    assertmsg("ob_jup_item_backpack_medium" + item);
                #/
            #/
        }
        waitframe();
    }
}

// Namespace namespace_71b655df1f1b6d7d/namespace_946ba58a8d1e7bfd
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x152d
// Size: 0x5e
function private function_321aa1e84b5fd453(player, lvl) {
    player endon("death_or_disconnect");
    player.var_bed158a6dfac230d = lvl;
    player.var_8790c077c95db752 = player.var_bed158a6dfac230d * level.var_4b78859bacc88808;
    player setarmorhealth(player.var_8790c077c95db752, 1);
}

// Namespace namespace_71b655df1f1b6d7d/namespace_946ba58a8d1e7bfd
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1592
// Size: 0xef
function private function_3f8595344f40b9c9(player, lvl) {
    foreach (player in level.players) {
        var_849c1df4114e0a37 = player getweaponslistall();
        foreach (weap in var_849c1df4114e0a37) {
            var_ce56f1ad6fb6521b = player pack_a_punch::get_pap_level(weap);
            if (player pack_a_punch::function_251fcd097206e347(weap) || var_ce56f1ad6fb6521b == 3 && lvl < 3) {
                player pack_a_punch::pap_weapon(weap, lvl - 1);
            }
        }
    }
}

// Namespace namespace_71b655df1f1b6d7d/namespace_946ba58a8d1e7bfd
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1688
// Size: 0x74
function private function_30590af066390cb(player, lvl) {
    var_849c1df4114e0a37 = player getweaponslistall();
    foreach (weap in var_849c1df4114e0a37) {
        player namespace_736197e4d378b91b::function_3a0412b800f3331d(weap, lvl);
    }
}

// Namespace namespace_71b655df1f1b6d7d/namespace_946ba58a8d1e7bfd
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1703
// Size: 0x11d
function private function_4da00feaa9f7ebc9(player, var_2b0e2c3554ec752e) {
    perks = [];
    switch (var_2b0e2c3554ec752e) {
    case 3:
        perks = utility::array_add(perks, "specialty_elemental_pop");
        perks = utility::array_add(perks, "specialty_death_perception");
        perks = utility::array_add(perks, "specialty_tombstone");
    case 2:
        perks = utility::array_add(perks, "specialty_staminup");
        perks = utility::array_add(perks, "specialty_deadshot");
        perks = utility::array_add(perks, "specialty_phd_flopper");
    case 1:
        perks = utility::array_add(perks, "specialty_juggernog");
        perks = utility::array_add(perks, "specialty_quickrevive");
        perks = utility::array_add(perks, "specialty_speedcola");
        break;
    }
    foreach (perk in perks) {
        function_3f1f9022f97b3660(player, perk);
        waitframe();
    }
}

// Namespace namespace_71b655df1f1b6d7d/namespace_946ba58a8d1e7bfd
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1827
// Size: 0x88
function private function_5db5161c26cbc7f5(player, weaponname, weaponref) {
    var_636981592f381ebf = spawnstruct();
    var_d7732d0238eae9ff = weaponmaxammo(weaponname);
    var_c1c3ecdd33dec5b7 = getscriptbundle("itemspawnentry:" + weaponref);
    var_bf2d5e2704ee3910 = var_c1c3ecdd33dec5b7.scriptable;
    var_636981592f381ebf.count = namespace_49e179ec476603d6::function_7209c8cd4b2e3afd(var_d7732d0238eae9ff);
    player namespace_49e179ec476603d6::function_7f6f62ba8dfd0da0(var_c1c3ecdd33dec5b7, var_636981592f381ebf);
}

// Namespace namespace_71b655df1f1b6d7d/namespace_946ba58a8d1e7bfd
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x18b6
// Size: 0x5a
function private function_bb443142fce62d83(player, item) {
    var_c1c3ecdd33dec5b7 = getscriptbundle("itemspawnentry:" + item);
    if (isdefined(var_c1c3ecdd33dec5b7)) {
        namespace_2abc885019e1956::function_c465d27f3f6066b4(var_c1c3ecdd33dec5b7, player.origin);
    } else {
        /#
            /#
                assertmsg("<unknown string>" + item);
            #/
        #/
    }
    waitframe();
}

// Namespace namespace_71b655df1f1b6d7d/namespace_946ba58a8d1e7bfd
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1917
// Size: 0xed
function private function_418ea3263145bfeb(player, item) {
    if (item == "all") {
        var_808b1c2970df2dd4 = [0:"ob_jup_item_killstreak_sentrygun", 1:"ob_jup_item_killstreak_cluster_spike", 2:"ob_jup_item_killstreak_precision_airstrike", 3:"ob_jup_item_killstreak_juggernaut", 4:"ob_jup_item_killstreak_clusterstrike"];
    } else {
        var_808b1c2970df2dd4 = [0:item];
    }
    foreach (item_spawn in var_808b1c2970df2dd4) {
        var_c1c3ecdd33dec5b7 = getscriptbundle("itemspawnentry:" + item_spawn);
        if (isdefined(var_c1c3ecdd33dec5b7)) {
            namespace_2abc885019e1956::function_c465d27f3f6066b4(var_c1c3ecdd33dec5b7, player.origin);
        } else {
            /#
                /#
                    assertmsg("<unknown string>" + item_spawn);
                #/
            #/
        }
        waitframe();
    }
}

// Namespace namespace_71b655df1f1b6d7d/namespace_946ba58a8d1e7bfd
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1a0b
// Size: 0x2a
function private function_3f1f9022f97b3660(player, perk_name) {
    if (player zombie_perks::has_perk(perk_name)) {
        return;
    }
    player zombie_perks::give_perk(perk_name, 0);
}

// Namespace namespace_71b655df1f1b6d7d/namespace_946ba58a8d1e7bfd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1a3c
// Size: 0x80
function private function_ab1878d670d738d9(player) {
    keys = getarraykeys(level._custom_perks);
    foreach (key in keys) {
        str_notify = key + "_stop";
        player notify(str_notify);
    }
}

// Namespace namespace_71b655df1f1b6d7d/namespace_946ba58a8d1e7bfd
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1ac3
// Size: 0x22
function private function_bb25bcf1cd97e7e6(player, amount) {
    player currency::function_3036cef61495210f("essence", amount);
}

// Namespace namespace_71b655df1f1b6d7d/namespace_946ba58a8d1e7bfd
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1aec
// Size: 0xf6
function private function_8146e3872f2d0640(player, var_bd437e647db702f9) {
    valid_vehicles = [0:"atv", 1:"veh_jup_pickup_2014", 2:"veh9_techo_rebel_armor", 3:"veh9_mil_cargo_truck", 4:"veh9_motorcycle_blood_burner", 5:"veh_jup_suv_1996", 6:"veh9_sedan_hatchback_1985", 7:"veh9_jltv_mg", 8:"veh9_utv"];
    if (array_contains(valid_vehicles, var_bd437e647db702f9)) {
        spawndata = spawnstruct();
        spawndata.origin = player.origin + (0, 0, 100);
        spawndata.angles = player.angles;
        spawndata.var_f16652e1462a3739 = 0;
        spawndata.var_22aa4aa0cf0aa6bb = 1;
        vehicle = namespace_1f188a13f7e79610::vehicle_spawn(var_bd437e647db702f9, spawndata);
    }
}

// Namespace namespace_71b655df1f1b6d7d/namespace_946ba58a8d1e7bfd
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1be9
// Size: 0xf1
function private function_e52113d9e4cd99f5(player, ai_type) {
    var_c68454d783b47ef5 = [0:"jup_spawner_zombie_mimic", 1:"jup_spawner_zombie_mangler", 2:"jup_spawner_zombie_disciple", 3:"jup_spawner_zombie_abom", 4:"jup_spawner_zombie_hellhound", 5:"jup_spawner_zombie_base_abom_crawler", 6:"jup_spawner_zombie_mimic_hvt", 7:"jup_spawner_zombie_mangler_hvt", 8:"jup_spawner_zombie_disciple_hvt", 9:"jup_spawner_zombie_abom_hvt", 10:"jup_spawner_zombie_base_abom_crawler_hvt", 11:"jup_spawner_zombie_disciple_hvt_stormcaller"];
    if (array_contains(var_c68454d783b47ef5, ai_type)) {
        location = player.origin + anglestoforward(player.angles) * 300;
        location = getclosestpointonnavmesh(location);
        special_ai = namespace_53fc9ddbb516e6e1::spawnnewaitype_sharedfunc(ai_type, location, (0, 0, 0), "team_two_hundred");
    }
}

// Namespace namespace_71b655df1f1b6d7d/namespace_946ba58a8d1e7bfd
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1ce1
// Size: 0xba
function private function_2d15fb31fc1f1590(player, difficulty) {
    var_11bfc6b0e47d4408 = [0:"difficulty_easy", 1:"difficulty_normal", 2:"difficulty_hard", 3:"difficulty_darkaether"];
    if (array_contains(var_11bfc6b0e47d4408, difficulty)) {
        encounter = "ai_encounter:enc_ob_large_ambush_escort_bigmap";
        location = player.origin + anglestoforward(player.angles) * 600;
        location = getclosestpointonnavmesh(location);
        var_be8ebaf932e93656 = namespace_614554f86e52695c::function_54da428ad4a96f2e(encounter, location, 400, 1, 1, 0);
        var_be8ebaf932e93656 = function_d37068aac7785c04(var_be8ebaf932e93656, difficulty, 1);
    }
}

// Namespace namespace_71b655df1f1b6d7d/namespace_946ba58a8d1e7bfd
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1da2
// Size: 0x54
function private function_36c67c8305fdfa8(player, itemname) {
    var_fbe755f0978c0369 = itemname;
    itembundle = getscriptbundle("itemspawnentry:" + var_fbe755f0978c0369);
    itemcount = namespace_49e179ec476603d6::function_7209c8cd4b2e3afd(1);
    player namespace_feea61bc660e9e0f::function_4b5b6b5953138fe7(itembundle, itemcount);
}

