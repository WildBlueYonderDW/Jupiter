// mwiii decomp prototype
#using script_41387eecc35b88bf;
#using scripts\engine\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_43971bbeefd98f05;
#using script_46c7c73b1a7e4773;
#using script_5f501fbedf0953f;
#using script_638d701d263ee1ed;
#using scripts\common\utility.gsc;
#using script_58be75c518bf0d40;
#using script_3ab210ea917601e7;

#namespace namespace_57a329915670ffdc;

// Namespace namespace_57a329915670ffdc/namespace_acf59d30b1f3eca5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44e
// Size: 0x153
function function_729f6e368df801f4() {
    function_89384091f7a2dbd("REV_OB_ARMORED_CONVOY", 0, &namespace_16464fbff4c4f003::function_21672171040d6aae);
    function_89384091f7a2dbd("REV_OB_ARMORED_CONVOY", 1, &namespace_16464fbff4c4f003::function_c4da40d7e3056ed6);
    function_89384091f7a2dbd("REV_OB_ARMORED_CONVOY", 2, &namespace_16464fbff4c4f003::function_1f2529d9fe2f4432);
    function_89384091f7a2dbd("REV_OB_ARMORED_CONVOY", 3, &namespace_16464fbff4c4f003::function_ee03881506b0073d);
    function_89384091f7a2dbd("REV_OB_ARMORED_CONVOY", 4, &namespace_16464fbff4c4f003::function_5b846516c4a7f320);
    function_8b5b2a3392fc7e2a("PlayerJoin", &namespace_16464fbff4c4f003::function_7aa120c6895b1b0, "REV_OB_ARMORED_CONVOY");
    function_8b5b2a3392fc7e2a("PlayerLeave", &namespace_16464fbff4c4f003::function_53ecaed01e5352a0, "REV_OB_ARMORED_CONVOY");
    registersharedfunc("armored_convoy_activity", "CustomParseParams", &function_25cf76d3ad5a9a0e);
    registersharedfunc("armored_convoy_activity", "GetMaxVehicles", &function_f59e21c58d674dc1);
    registersharedfunc("armored_convoy_activity", "GetRiderEncounterFromIndex", &function_4c8727d4f35931a1);
    registersharedfunc("armored_convoy_activity", "GetVehicleRefFromIndex", &function_c45e80be17065ee9);
    registersharedfunc("armored_convoy_activity", "SpawnLootCache", &function_7c279c038503812f);
    registersharedfunc("armored_convoy_activity", "PlayApproachConvoyVO", &PlayApproachConvoyVO);
    registersharedfunc("armored_convoy_activity", "PlayEngageVO", &PlayEngageVO);
    registersharedfunc("armored_convoy_activity", "PlayVehDestroyedVO", &PlayVehDestroyedVO);
    registersharedfunc("armored_convoy_activity", "OnPlayerLeftActivity", &OnPlayerLeftActivity);
}

// Namespace namespace_57a329915670ffdc/namespace_acf59d30b1f3eca5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a8
// Size: 0x64
function function_25cf76d3ad5a9a0e(var_28af8e747331e08d) {
    self.var_71ad773e63984917 = namespace_4df2ab39b0e96ec7::function_4d8bb2d866771a10(self.var_d9a91303aea799de.origin);
    if (self.var_71ad773e63984917 == "difficulty_undefined") {
        self.var_71ad773e63984917 = getdvar(@"hash_600f124219762287", "difficulty_easy");
    }
    namespace_16464fbff4c4f003::function_219e012faa65219d(var_28af8e747331e08d);
}

// Namespace namespace_57a329915670ffdc/namespace_acf59d30b1f3eca5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x613
// Size: 0x9
function function_f59e21c58d674dc1() {
    return namespace_16464fbff4c4f003::function_c7989b2ed75d1228();
}

// Namespace namespace_57a329915670ffdc/namespace_acf59d30b1f3eca5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x624
// Size: 0x13
function function_4c8727d4f35931a1(vehicleposition) {
    return namespace_16464fbff4c4f003::function_a23b8410030b26d0(vehicleposition);
}

// Namespace namespace_57a329915670ffdc/namespace_acf59d30b1f3eca5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63f
// Size: 0x6d
function function_c45e80be17065ee9(vehicleposition) {
    switch (self.var_71ad773e63984917) {
    case #"hash_5343b465e56ec9a4":
    case #"hash_651f76c0ad6741ec":
    case #"hash_7bb2cd766703d463":
    case #"hash_af83e47edfa8900a":
    default:
        var_bd437e647db702f9 = "veh9_techo_rebel_armor";
        break;
    }
    return var_bd437e647db702f9;
}

// Namespace namespace_57a329915670ffdc/namespace_acf59d30b1f3eca5
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b4
// Size: 0x16b
function function_7c279c038503812f(vehicle) {
    var_b67c5086cfc7b5ef = spawnscriptable(self.var_cb2499e4e9d175a2, vehicle.origin);
    switch (vehicle.classname_mp) {
    case #"hash_d088afbf21032120":
        var_e432cf43d26401c8 = (-60, 0, -10);
        break;
    case #"hash_535a330be104394c":
        var_e432cf43d26401c8 = (-50, 0, -10);
        break;
    default:
        var_e432cf43d26401c8 = (-50, 0, -10);
        break;
    }
    var_b67c5086cfc7b5ef namespace_448ccf1ca136fbbe::function_6e506f39f121ea8a(vehicle, var_e432cf43d26401c8, (0, 90, 0));
    var_b67c5086cfc7b5ef setscriptablepartstate("body", "closed_usable_no_collision");
    if (istrue(self.var_73069b4add1e8094)) {
        if (self.var_71ad773e63984917 == "difficulty_easy") {
            var_c74c6d429c18a6f2 = 3;
            var_65679c5d6eb02b4c = self.var_66ddec9f303229cc;
        } else {
            var_c74c6d429c18a6f2 = 4;
            var_65679c5d6eb02b4c = self.var_21873f8a5b64ae45;
        }
    } else {
        var_c74c6d429c18a6f2 = 3;
        var_65679c5d6eb02b4c = self.var_66ddec9f303229cc;
    }
    namespace_9b83895815d12835::function_d71a41afca697376(var_b67c5086cfc7b5ef, var_65679c5d6eb02b4c, var_c74c6d429c18a6f2);
    thread function_96f15b75346c0661(vehicle);
    vehicle.loot_crate = var_b67c5086cfc7b5ef;
    self.var_9009411bf4edf20b = array_add(self.var_9009411bf4edf20b, var_b67c5086cfc7b5ef);
}

// Namespace namespace_57a329915670ffdc/namespace_acf59d30b1f3eca5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x826
// Size: 0xab
function PlayApproachConvoyVO(var_2f5d509d7b71ce9a, var_2a29b237dcc66fe5) {
    foreach (player in var_2a29b237dcc66fe5) {
        squadmembers = player namespace_ca7b90256548aa40::getSquadMembers();
        var_8c4ed29f8594fb86 = namespace_9dcaa84266dc73e2::function_f578373042c34e16(16095, "quest_s0a1t2_cnvy_approach", squadmembers);
        if (!var_8c4ed29f8594fb86) {
            var_2f5d509d7b71ce9a thread namespace_277c27ef297ef569::function_1281c7fff9456e18("activity_armored_convoy_approach_broadcast", [0:player]);
        }
        player callback::callback("on_approach_convoy");
    }
}

// Namespace namespace_57a329915670ffdc/namespace_acf59d30b1f3eca5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d8
// Size: 0xd8
function PlayEngageVO(var_2f5d509d7b71ce9a, var_2a7b538f984af574) {
    foreach (player in var_2f5d509d7b71ce9a.var_6c29f2fdb0054bbe) {
        squadmembers = player namespace_ca7b90256548aa40::getSquadMembers();
        var_8c4ed29f8594fb86 = namespace_9dcaa84266dc73e2::function_f578373042c34e16(16095, "quest_s0a1t2_cnvy_engage", squadmembers);
        if (!var_8c4ed29f8594fb86 && istrue(var_2a7b538f984af574)) {
            var_2f5d509d7b71ce9a thread namespace_277c27ef297ef569::function_1281c7fff9456e18("activity_armored_convoy_engage_enemy_broadcast", [0:player]);
        } else if (!var_8c4ed29f8594fb86) {
            var_2f5d509d7b71ce9a thread namespace_277c27ef297ef569::function_1281c7fff9456e18("activity_armored_convoy_engage_player_broadcast", [0:player]);
        }
        player callback::callback("on_engage_convoy");
    }
}

// Namespace namespace_57a329915670ffdc/namespace_acf59d30b1f3eca5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b7
// Size: 0xd8
function PlayVehDestroyedVO(var_2f5d509d7b71ce9a, var_7a4fd332f67e105e) {
    foreach (player in var_2f5d509d7b71ce9a.var_6c29f2fdb0054bbe) {
        squadmembers = player namespace_ca7b90256548aa40::getSquadMembers();
        var_8c4ed29f8594fb86 = namespace_9dcaa84266dc73e2::function_f578373042c34e16(16095, "quest_s0a1t2_cnvy_vehicledestroyed", squadmembers);
        if (!var_8c4ed29f8594fb86 && istrue(var_7a4fd332f67e105e)) {
            var_2f5d509d7b71ce9a thread namespace_277c27ef297ef569::function_1281c7fff9456e18("activity_armored_convoy_vehicles_remain_broadcast", [0:player]);
        } else if (!var_8c4ed29f8594fb86) {
            var_2f5d509d7b71ce9a thread namespace_277c27ef297ef569::function_1281c7fff9456e18("activity_armored_convoy_vehicles_destroyed_broadcast", [0:player]);
        }
        player callback::callback("on_destroy_convoy");
    }
}

// Namespace namespace_57a329915670ffdc/namespace_acf59d30b1f3eca5
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa96
// Size: 0x86
function OnPlayerLeftActivity(var_2f5d509d7b71ce9a, var_b381b0883bcd4847) {
    if (isdefined(var_2f5d509d7b71ce9a) && var_2f5d509d7b71ce9a.state != "EndedState") {
        foreach (player in var_b381b0883bcd4847.playerlist) {
            player thread function_4a508fcbbea05afd();
        }
    }
}

// Namespace namespace_57a329915670ffdc/namespace_acf59d30b1f3eca5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb23
// Size: 0x5a
function function_4a508fcbbea05afd() {
    self endon("death_or_disconnect");
    wait(120);
    player = self;
    if (function_5acc35fc66331385(player, 16095)) {
        player ent_flag_clear("quest_s0a1t2_cnvy_approach");
        player ent_flag_clear("quest_s0a1t2_cnvy_engage");
        player ent_flag_clear("quest_s0a1t2_cnvy_vehicledestroyed");
        player ent_flag_clear("quest_s0a1t2_cnvy_closedestconvoy");
    }
}

// Namespace namespace_57a329915670ffdc/namespace_acf59d30b1f3eca5
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb84
// Size: 0x103
function private function_96f15b75346c0661(vehicle) {
    vehicle waittill("death");
    waitframe();
    if (isdefined(vehicle.loot_crate)) {
        var_bf307f746e1eae1a = 1;
        vehicle.loot_crate namespace_448ccf1ca136fbbe::function_cefc758e6b25a243();
        v_angles = vehicle.angles;
        v_pos = vehicle.origin;
        var_4c0c68c6d3b63abf = ter_op(cointoss(), -90, 90);
        var_2211bd79139e0883 = (96, 0, 0);
        var_a0bf28f44f823d04 = v_angles + (0, var_4c0c68c6d3b63abf, 0);
        var_7cf8be75342ca87a = v_pos + rotatevector(var_2211bd79139e0883, var_a0bf28f44f823d04);
        var_839f515b361331f9 = getgroundposition(var_7cf8be75342ca87a, 32, 720, 0);
        vehicle.loot_crate.origin = var_839f515b361331f9;
    }
}

