#using script_16ea1b94f0f381b3;
#using script_22856b83897eaad8;
#using script_22f1701e151b9d12;
#using script_2583ee5680cf4736;
#using script_2669878cf5a1b6bc;
#using script_398835140857d740;
#using script_3e2f8cc477d57433;
#using script_443d99fe707f1d9f;
#using script_62a4f7a62643fe8;
#using script_639bf783929acf9b;
#using script_64316dc775e91122;
#using script_6df6604a74a7a9c7;
#using script_6f65366f542f6627;
#using script_7b2517368c79e5bc;
#using script_7c40fa80892a721;
#using script_7f5e7a3cb514aca5;
#using scripts\common\callbacks;
#using scripts\common\devgui;
#using scripts\common\utility;
#using scripts\common\values;
#using scripts\cp_mp\vehicles\vehicle;
#using scripts\engine\utility;
#using scripts\mp\utility\player;

#namespace namespace_71b655df1f1b6d7d;

// Namespace namespace_71b655df1f1b6d7d / namespace_946ba58a8d1e7bfd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa1d
// Size: 0xb
function init() {
    level thread function_5be6f854fd9386d8();
}

/#

    // Namespace namespace_71b655df1f1b6d7d / namespace_946ba58a8d1e7bfd
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xa30
    // Size: 0x5
    function function_1f22bdc2d41856b2() {
        
    }

#/

// Namespace namespace_71b655df1f1b6d7d / namespace_946ba58a8d1e7bfd
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xa3d
// Size: 0x54
function private function_8ca944706acb991e(player, power_level) {
    power_interact = namespace_5775ad2badedbcaa::register_interact(player.origin, 128, &function_372b03587b1b4a47, %JUP_OB_OBJECTIVES/INTERACT_ACTIVATE);
    power_interact.power_level = power_level;
    power_interact thread function_23834c47d25128fc(player);
    return power_interact;
}

// Namespace namespace_71b655df1f1b6d7d / namespace_946ba58a8d1e7bfd
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xa9a
// Size: 0x3a
function private function_23834c47d25128fc(player) {
    self endon("death");
    player endon("death");
    while (!isalive(player)) {
        waitframe();
    }
    self.origin = player.origin;
}

// Namespace namespace_71b655df1f1b6d7d / namespace_946ba58a8d1e7bfd
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xadc
// Size: 0x68
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
    if (isdefined(self.power_level)) {
        function_1208466b550e2cdd(player, self.power_level);
    }
    self delete();
}

// Namespace namespace_71b655df1f1b6d7d / namespace_946ba58a8d1e7bfd
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xb4c
// Size: 0x9f0
function private function_5be6f854fd9386d8() {
    cached_lvl = 0;
    var_acb83eb42c42aea3 = 0;
    power_interactables = [];
    while (true) {
        if (!isdefined(level.players) || level.players.size <= 0) {
            waitframe();
            continue;
        }
        power_lvl = getdvarint(@"hash_89f5285b9abcc3b2", -1);
        if (power_lvl != cached_lvl) {
            cached_lvl = power_lvl;
            if (cached_lvl > 3 || cached_lvl < 1) {
                waitframe();
                continue;
            }
            foreach (player in level.players) {
                function_1208466b550e2cdd(player, cached_lvl);
            }
        }
        var_fa8bbcce8526ae26 = getdvarint(@"hash_e9161181da8e368d", -1);
        if (var_fa8bbcce8526ae26 != -1) {
            setdvar(@"hash_e9161181da8e368d", -1);
            if (var_fa8bbcce8526ae26 > 3 || var_fa8bbcce8526ae26 < 1) {
                waitframe();
                continue;
            }
            foreach (power_interact in power_interactables) {
                if (isent(power_interact)) {
                    power_interact delete();
                }
            }
            power_interactables = [];
            foreach (player in level.players) {
                power_interactables = utility::array_add(power_interactables, function_8ca944706acb991e(player, var_fa8bbcce8526ae26));
            }
        }
        var_3551c5b4c049f89f = getdvarint(@"hash_60a7c4fa4b51e27f", -1);
        if (var_3551c5b4c049f89f != -1) {
            setdvar(@"hash_60a7c4fa4b51e27f", -1);
            foreach (power_interact in power_interactables) {
                if (isent(power_interact)) {
                    power_interact delete();
                }
            }
            power_interactables = [];
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
            string_array = strtoksubstr(give_weapon, ",");
            foreach (player in level.players) {
                function_5db5161c26cbc7f5(player, string_array[0], string_array[1]);
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
        vehicle_ref = getdvar(@"hash_1409424c8c9fc5b8", "");
        if (vehicle_ref != "") {
            setdvar(@"hash_1409424c8c9fc5b8", "");
            player = level.players[0];
            cheat_spawnvehicle(player, vehicle_ref);
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
            if (aether_storm::expansion_started()) {
                function_b54b90237acc6e52(level.aether_storm.starting_radius);
            }
        }
        if (getdvarint(@"hash_f55c880f7c1feaaa", 0)) {
            setdvar(@"hash_f55c880f7c1feaaa", 0);
            if (aether_storm::expansion_started()) {
                cached_radius = level.aether_storm.radiation.radius;
                function_b54b90237acc6e52(cached_radius);
            }
        }
        if (getdvarint(@"hash_42c4d96f20c9f088", 0)) {
            setdvar(@"hash_42c4d96f20c9f088", 0);
            if (!aether_storm::expansion_started()) {
                aether_storm::start_expansion();
            }
        }
        give_keys = getdvarint(@"hash_5033fa56c727d890", -1);
        if (give_keys != -1) {
            setdvar(@"hash_5033fa56c727d890", -1);
            if (isdefined(level.var_b4afbe308b4c542a)) {
                [[ level.var_b4afbe308b4c542a ]]();
            }
        }
        itembundlename = getdvar(@"hash_17fff40f43ad95d0", "");
        if (itembundlename != "") {
            setdvar(@"hash_17fff40f43ad95d0", "");
            foreach (player in level.players) {
                if (!isbot(player)) {
                    function_36c67c8305fdfa8(player, itembundlename);
                }
            }
        }
        if (getdvarint(@"hash_282ce09d6e1279d", 0)) {
            setdvar(@"hash_282ce09d6e1279d", 0);
            foreach (player in level.players) {
                if (isdefined(player) && !isbot(player)) {
                    currentweapon = player getcurrentweapon();
                    if (isdefined(currentweapon) && currentweapon.basename == "iw9_me_fists_mp") {
                        function_80105532df7fb53f(player);
                    }
                }
            }
        }
        if (getdvarint(@"hash_c71b67e0a3ba8ac6", 0)) {
            setdvar(@"hash_c71b67e0a3ba8ac6", 0);
            setdvar(@"hash_e9161181da8e368d", 3);
            foreach (player in level.players) {
                if (!isbot(player)) {
                    function_4a8b7b0534a25c3(player);
                }
            }
        }
        if (getdvarint(@"hash_e169afa3c29fa095", 0)) {
            setdvar(@"hash_e169afa3c29fa095", 0);
            foreach (player in level.players) {
                if (!isbot(player)) {
                    function_99bd868e2b6e5c7c(player);
                }
            }
        }
        if (getdvarint(@"hash_73cb4ab372e0194a", 0)) {
            setdvar(@"hash_73cb4ab372e0194a", 0);
            foreach (player in level.players) {
                if (!isbot(player)) {
                    function_cead5cc6874e2f37(player);
                }
            }
        }
        if (getdvarint(@"hash_259a050a7f354c6", 0) > 0) {
            var_d2ed7438fd2e5e39 = getdvarint(@"hash_259a050a7f354c6", 0);
            setdvar(@"hash_259a050a7f354c6", 0);
            foreach (player in level.players) {
                if (!isbot(player)) {
                    namespace_cddd3ad399b210ff::function_5ab36fe089f88f56(player, var_d2ed7438fd2e5e39);
                }
            }
        }
        waitframe();
    }
}

// Namespace namespace_71b655df1f1b6d7d / namespace_946ba58a8d1e7bfd
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1544
// Size: 0xb8
function private function_b54b90237acc6e52(radius) {
    level.aether_storm.radiation radiation::destroy();
    level.aether_storm.radiation = radiation::create(level.aether_storm.starting_origin, radius, level.aether_storm.var_8f7178eaf2132d21, level.aether_storm.quest_circle, 1);
    level.aether_storm.radiation radiation::set_damage(level.aether_storm.damage_initial);
    thread aether_storm::function_db25872d3eb4f360();
    thread aether_storm::function_ebf8ee98cf7a3be0();
}

// Namespace namespace_71b655df1f1b6d7d / namespace_946ba58a8d1e7bfd
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x1604
// Size: 0xa2
function private function_1208466b550e2cdd(player, lvl, wait_time) {
    if (!player::isAliveAndNotInLastStand(player)) {
        return;
    }
    player endon("death_or_disconnect");
    if (isdefined(wait_time)) {
        wait wait_time;
        if (!player::isAliveAndNotInLastStand(player)) {
            return;
        }
    }
    function_3f8595344f40b9c9(player, lvl);
    function_30590af066390cb(player, int(min(lvl + 1, 4)));
    function_ab1878d670d738d9(player);
    waitframe();
    cheat_giveperks(player, lvl);
    function_321aa1e84b5fd453(player, lvl);
    if (getdvarint(@"hash_cd4ab555eb22ea4", 1)) {
        if (!player::isAliveAndNotInLastStand(player)) {
            return;
        }
        function_376cc7d8d36560b7(player, lvl);
    }
}

// Namespace namespace_71b655df1f1b6d7d / namespace_946ba58a8d1e7bfd
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x16ae
// Size: 0xc9
function private function_80105532df7fb53f(player) {
    fakeitem = spawnstruct();
    var_d7732d0238eae9ff = 50;
    item_entry = "ob_jup_item_weapon_ar_acharlie_blue";
    item_bundle = getscriptbundle("itemspawnentry:" + item_entry);
    item_scriptable = item_bundle.scriptable;
    fakeitem.count = namespace_2abc885019e1956::function_7209c8cd4b2e3afd(var_d7732d0238eae9ff);
    player namespace_2abc885019e1956::function_7f6f62ba8dfd0da0(item_bundle, fakeitem);
    fakeitem = spawnstruct();
    var_d7732d0238eae9ff = 50;
    item_entry = "ob_jup_item_weapon_sm_coscar635_blue";
    item_bundle = getscriptbundle("itemspawnentry:" + item_entry);
    item_scriptable = item_bundle.scriptable;
    fakeitem.count = namespace_2abc885019e1956::function_7209c8cd4b2e3afd(var_d7732d0238eae9ff);
    player namespace_2abc885019e1956::function_7f6f62ba8dfd0da0(item_bundle, fakeitem);
}

// Namespace namespace_71b655df1f1b6d7d / namespace_946ba58a8d1e7bfd
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x177f
// Size: 0x135
function private function_4a8b7b0534a25c3(player) {
    a_items = [%"hash_6fd492b25b28ca0b", %"hash_2ff1ee4bbcb45a46", %"hash_735715c0c4cf9966", %"hash_384ad83f13780680", %"hash_682cee9aefe6f28f", %"hash_163a4aa68cffef85", %"hash_20435ab245f6c7e9", %"hash_6a28dfaf8547100a", %"hash_437ede19689bfbd4", %"hash_50e8774afd9f98", %"hash_3022f25d2dbb5cb5", %"hash_341cca18f1c9170"];
    foreach (item in a_items) {
        itembundle = getscriptbundle(item);
        if (isdefined(itembundle)) {
            namespace_2abc885019e1956::function_c465d27f3f6066b4(itembundle, player.origin);
        } else {
            assertmsg("<dev string:x1c>" + item);
        }
        waitframe();
    }
}

// Namespace namespace_71b655df1f1b6d7d / namespace_946ba58a8d1e7bfd
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x18bc
// Size: 0xcc
function private function_cead5cc6874e2f37(player) {
    a_items = ["ob_jup_item_ammomod_napalmburst", "ob_jup_item_ammomod_deadwire", "ob_jup_item_ammomod_cryofreeze", "ob_jup_item_ammomod_brainrot", "ob_jup_item_ammomod_shatterblast"];
    foreach (item in a_items) {
        itembundle = getscriptbundle("itemspawnentry:" + item);
        if (isdefined(itembundle)) {
            namespace_2abc885019e1956::function_c465d27f3f6066b4(itembundle, player.origin);
        } else {
            assertmsg("<dev string:xb3>" + item);
        }
        waitframe();
    }
}

// Namespace namespace_71b655df1f1b6d7d / namespace_946ba58a8d1e7bfd
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1990
// Size: 0x11b
function private function_99bd868e2b6e5c7c(player) {
    a_items = [%"hash_7b5026350868f2fd", %"hash_c2482e659bf4cdc", %"hash_28a7a15e15519ef2", %"hash_6c3ddd0bd899075d", %"hash_5f87da2346acd89b", %"hash_7ddd8ebd7c50fc9f", %"hash_608e713bb22ef6f5"];
    foreach (item in a_items) {
        itembundle = getscriptbundle(item);
        if (isdefined(itembundle)) {
            payload = [#"teamselect", player getentitynumber()];
            namespace_2abc885019e1956::function_c465d27f3f6066b4(itembundle, player.origin, undefined, 0, 0, payload);
        } else {
            assertmsg("<dev string:x14a>" + item);
        }
        waitframe();
    }
}

// Namespace namespace_71b655df1f1b6d7d / namespace_946ba58a8d1e7bfd
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1ab3
// Size: 0x346
function private function_376cc7d8d36560b7(player, lvl) {
    spawn_org = player.origin;
    a_killstreaks = ["ob_jup_item_killstreak_sentrygun", "ob_jup_item_killstreak_cluster_spike", "ob_jup_item_killstreak_precision_airstrike", "ob_jup_item_killstreak_juggernaut", "ob_jup_item_killstreak_clusterstrike"];
    var_cf4e7b98057c823 = ["ob_jup_item_weapon_pi_raygun", "ob_jup_item_weapon_la_plasmagun", "ob_jup_item_weapon_ar_dg2"];
    var_92e89639152b09d2 = ["ob_jup_item_ammomod_napalmburst", "ob_jup_item_ammomod_deadwire", "ob_jup_item_ammomod_cryofreeze", "ob_jup_item_ammomod_brainrot", "ob_jup_item_ammomod_shatterblast"];
    switch (lvl) {
    case 3:
        a_items = ["ob_jup_item_gasmask_durable", "ob_jup_item_backpack_large", "ob_jup_item_revive_self_revive", random(var_92e89639152b09d2), random(a_killstreaks), random(a_killstreaks), random(var_cf4e7b98057c823), "ob_jup_item_aether_crystal_3", "ob_jup_item_generic_valuable_turret_trap_circuit", "ob_jup_item_lethal_thermite", "ob_jup_item_lethal_thermite", "ob_jup_item_lethal_c4", "ob_jup_item_lethal_c4", "ob_jup_item_tactical_blackhole_bomb", "ob_jup_item_tactical_blackhole_bomb", "ob_jup_item_tactical_monkey_bomb", "ob_jup_item_tactical_monkey_bomb", "ob_jup_item_armor_plate", "ob_jup_item_armor_plate", "ob_jup_item_armor_plate", "ob_jup_item_armor_plate", "ob_jup_item_armor_plate", "ob_jup_item_armor_plate"];
        break;
    case 2:
        a_items = ["ob_jup_item_gasmask", "ob_jup_item_backpack_medium", "ob_jup_item_revive_self_revive", random(a_killstreaks), "ob_jup_item_lethal_semtex", "ob_jup_item_lethal_semtex", random(var_92e89639152b09d2), "ob_jup_item_tactical_blackhole_bomb", "ob_jup_item_tactical_monkey_bomb", "ob_jup_item_armor_plate", "ob_jup_item_armor_plate", "ob_jup_item_armor_plate", "ob_jup_item_armor_plate"];
        break;
    case 1:
        a_items = ["ob_jup_item_gasmask", "ob_jup_item_revive_self_revive", random(a_killstreaks), "ob_jup_item_lethal_semtex", "ob_jup_item_lethal_semtex", "ob_jup_item_tactical_shockstick", "ob_jup_item_tactical_shockstick", "ob_jup_item_armor_plate", "ob_jup_item_armor_plate", "ob_jup_item_armor_plate"];
    default:
        a_items = [];
        break;
    }
    foreach (item in a_items) {
        itembundle = getscriptbundle("itemspawnentry:" + item);
        if (isdefined(itembundle)) {
            namespace_2abc885019e1956::function_c465d27f3f6066b4(itembundle, spawn_org);
        } else {
            assertmsg("<dev string:xb3>" + item);
        }
        waitframe();
    }
}

// Namespace namespace_71b655df1f1b6d7d / namespace_946ba58a8d1e7bfd
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1e01
// Size: 0x68
function private function_321aa1e84b5fd453(player, lvl) {
    if (!player::isAliveAndNotInLastStand(player)) {
        return;
    }
    player endon("death_or_disconnect");
    player.var_bed158a6dfac230d = lvl;
    player.maxarmorhealth = player.var_bed158a6dfac230d * level.var_4b78859bacc88808;
    player setArmorHealth(player.maxarmorhealth, 1);
}

// Namespace namespace_71b655df1f1b6d7d / namespace_946ba58a8d1e7bfd
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1e71
// Size: 0xc2
function private function_3f8595344f40b9c9(player, lvl) {
    if (isdefined(player) && isplayer(player) && player::isAliveAndNotInLastStand(player)) {
        currentweapons = player getweaponslistall();
        foreach (weap in currentweapons) {
            pap_lvl = player pack_a_punch::get_pap_level(weap);
            if (player pack_a_punch::can_pap(weap) || pap_lvl == 3 && lvl < 3) {
                player pack_a_punch::pap_weapon(weap, lvl - 1);
            }
        }
    }
}

// Namespace namespace_71b655df1f1b6d7d / namespace_946ba58a8d1e7bfd
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1f3b
// Size: 0x7b
function private function_30590af066390cb(player, lvl) {
    currentweapons = player getweaponslistall();
    foreach (weap in currentweapons) {
        if (!weapon::iswonderweapon(weap)) {
            player namespace_736197e4d378b91b::function_3a0412b800f3331d(weap, lvl);
        }
    }
}

// Namespace namespace_71b655df1f1b6d7d / namespace_946ba58a8d1e7bfd
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x1fbe
// Size: 0x11a
function private cheat_giveperks(player, cached_lvl) {
    perks = [];
    switch (cached_lvl) {
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
        cheat_giveperk(player, perk);
        waitframe();
    }
}

// Namespace namespace_71b655df1f1b6d7d / namespace_946ba58a8d1e7bfd
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x20e0
// Size: 0x85
function private function_5db5161c26cbc7f5(player, weaponname, weaponref) {
    fakeitem = spawnstruct();
    var_d7732d0238eae9ff = weaponmaxammo(weaponname);
    item_bundle = getscriptbundle("itemspawnentry:" + weaponref);
    item_scriptable = item_bundle.scriptable;
    fakeitem.count = common_item::function_7209c8cd4b2e3afd(var_d7732d0238eae9ff);
    player common_item::function_7f6f62ba8dfd0da0(item_bundle, fakeitem);
}

// Namespace namespace_71b655df1f1b6d7d / namespace_946ba58a8d1e7bfd
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x216d
// Size: 0x5a
function private function_bb443142fce62d83(player, item) {
    item_bundle = getscriptbundle("itemspawnentry:" + item);
    if (isdefined(item_bundle)) {
        namespace_2abc885019e1956::function_c465d27f3f6066b4(item_bundle, player.origin);
    } else {
        assertmsg("<dev string:x1df>" + item);
    }
    waitframe();
}

// Namespace namespace_71b655df1f1b6d7d / namespace_946ba58a8d1e7bfd
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x21cf
// Size: 0xe9
function private function_418ea3263145bfeb(player, item) {
    if (item == "all") {
        a_killstreaks = ["ob_jup_item_killstreak_sentrygun", "ob_jup_item_killstreak_cluster_spike", "ob_jup_item_killstreak_precision_airstrike", "ob_jup_item_killstreak_juggernaut", "ob_jup_item_killstreak_clusterstrike"];
    } else {
        a_killstreaks = [item];
    }
    foreach (item_spawn in a_killstreaks) {
        item_bundle = getscriptbundle("itemspawnentry:" + item_spawn);
        if (isdefined(item_bundle)) {
            namespace_2abc885019e1956::function_c465d27f3f6066b4(item_bundle, player.origin);
        } else {
            assertmsg("<dev string:x26f>" + item_spawn);
        }
        waitframe();
    }
}

// Namespace namespace_71b655df1f1b6d7d / namespace_946ba58a8d1e7bfd
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x22c0
// Size: 0x34
function private cheat_giveperk(player, perk_name) {
    if (!player::isAliveAndNotInLastStand(player)) {
        return;
    }
    if (player zombie_perks::has_perk(perk_name)) {
        return;
    }
    player zombie_perks::give_perk(perk_name, 0);
}

// Namespace namespace_71b655df1f1b6d7d / namespace_946ba58a8d1e7bfd
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x22fc
// Size: 0x7c
function private function_ab1878d670d738d9(player) {
    keys = getarraykeys(level._custom_perks);
    foreach (key in keys) {
        str_notify = key + "_stop";
        player notify(str_notify);
    }
}

// Namespace namespace_71b655df1f1b6d7d / namespace_946ba58a8d1e7bfd
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x2380
// Size: 0x21
function private function_bb25bcf1cd97e7e6(player, amount) {
    player currency::function_3036cef61495210f("essence", amount);
}

// Namespace namespace_71b655df1f1b6d7d / namespace_946ba58a8d1e7bfd
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x23a9
// Size: 0xf4
function private cheat_spawnvehicle(player, vehicle_ref) {
    valid_vehicles = ["atv", "veh_jup_pickup_2014", "veh9_techo_rebel_armor", "veh9_mil_cargo_truck", "veh9_motorcycle_blood_burner", "veh_jup_suv_1996", "veh9_sedan_hatchback_1985", "veh9_jltv_mg", "veh9_utv"];
    if (array_contains(valid_vehicles, vehicle_ref)) {
        spawndata = spawnstruct();
        spawndata.origin = player.origin + (0, 0, 100);
        spawndata.angles = player.angles;
        spawndata.initai = 0;
        spawndata.preventrespawn = 1;
        vehicle = scripts\cp_mp\vehicles\vehicle::vehicle_spawn(vehicle_ref, spawndata);
    }
}

// Namespace namespace_71b655df1f1b6d7d / namespace_946ba58a8d1e7bfd
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x24a5
// Size: 0x113
function private function_e52113d9e4cd99f5(player, ai_type) {
    ai_types = ["jup_spawner_zombie_mimic", "jup_spawner_zombie_mangler", "jup_spawner_zombie_disciple", "jup_spawner_zombie_abom", "jup_spawner_zombie_hellhound", "jup_spawner_zombie_base_abom_crawler", "jup_spawner_zombie_mimic_hvt", "jup_spawner_zombie_mangler_hvt", "jup_spawner_zombie_disciple_hvt", "jup_spawner_zombie_abom_hvt", "jup_spawner_zombie_base_abom_crawler_hvt", "jup_spawner_zombie_disciple_hvt_stormcaller", "jup_spawner_zombie_disciple_s3_rr", "jup_spawner_zombie_disciple_s3_rr_quest", "jup_spawner_zombie_disciple_s3_rr_unlock", "jup_spawner_zombie_entity"];
    if (array_contains(ai_types, ai_type)) {
        location = player.origin + anglestoforward(player.angles) * 300;
        location = getclosestpointonnavmesh(location);
        special_ai = namespace_53fc9ddbb516e6e1::spawnnewaitype_sharedfunc(ai_type, location, (0, 0, 0), "team_two_hundred");
    }
}

// Namespace namespace_71b655df1f1b6d7d / namespace_946ba58a8d1e7bfd
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x25c0
// Size: 0xb7
function private function_2d15fb31fc1f1590(player, difficulty) {
    difficulties = ["difficulty_easy", "difficulty_normal", "difficulty_hard", "difficulty_darkaether"];
    if (array_contains(difficulties, difficulty)) {
        encounter = "ai_encounter:enc_ob_large_ambush_escort_bigmap";
        location = player.origin + anglestoforward(player.angles) * 600;
        location = getclosestpointonnavmesh(location);
        request_id = namespace_614554f86e52695c::spawn_request(encounter, location, 400, 1, 1, 0);
        request_id = function_d37068aac7785c04(request_id, difficulty, 1);
    }
}

// Namespace namespace_71b655df1f1b6d7d / namespace_946ba58a8d1e7bfd
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x267f
// Size: 0x52
function private function_36c67c8305fdfa8(player, itemname) {
    itembundlename = itemname;
    itembundle = getscriptbundle("itemspawnentry:" + itembundlename);
    itemcount = common_item::function_7209c8cd4b2e3afd(1);
    player namespace_feea61bc660e9e0f::function_4b5b6b5953138fe7(itembundle, itemcount);
}

