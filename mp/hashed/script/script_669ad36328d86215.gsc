#using scripts\engine\utility.gsc;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\cp_mp\utility\omnvar_utility.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_quest_util.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\cp_mp\killstreaks\airdrop.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\gametypes\br_lootcache.gsc;

#namespace namespace_89521477a018e10a;

// Namespace namespace_89521477a018e10a / namespace_e0d8d479cc52b68f
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x59d
// Size: 0x20
function autoexec main() {
    if (getdvarint(@"hash_4aae7dd32e29d36", 1) == 0) {
        return;
    }
    thread function_566f849e77540164();
}

// Namespace namespace_89521477a018e10a / namespace_e0d8d479cc52b68f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x5c5
// Size: 0x60
function private function_566f849e77540164() {
    level endon("game_ended");
    level waittill("contractmanager_inittablets_done");
    function_fef4bd40f684ecad();
    function_df4cbc32c8f4b694();
    function_7c26f56cd299df9d();
    function_1dab7d1c826262ac();
    function_6ccce6577fcd5e27();
    thread function_9dde686b3c2dad5c();
    scripts\cp_mp\utility\omnvar_utility::function_d3cf7ff1a257e2c3("ui_br_legendary_contract_game_data", 0, 1, level.var_dc6636f4b2728b7d.size > 0 ? 1 : 0);
}

// Namespace namespace_89521477a018e10a / namespace_e0d8d479cc52b68f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x62d
// Size: 0x3fc
function private function_fef4bd40f684ecad() {
    level.var_6a82bbe1d7f1fde8 = spawnstruct();
    level.var_6a82bbe1d7f1fde8.spawntype = getdvarint(@"hash_978fb0ef0f0892c5", 2);
    level.var_6a82bbe1d7f1fde8.var_495b2f627ffbfe25 = getdvarint(@"hash_68ef05b80a2efa28", 10);
    level.var_6a82bbe1d7f1fde8.totalpercent = getdvarint(@"hash_85d2b0e8117f96d7", 7);
    if (level.var_6a82bbe1d7f1fde8.spawntype == 2) {
        level.var_6a82bbe1d7f1fde8.var_96c4a8c24e604cad = ceil(level.var_6a82bbe1d7f1fde8.totalpercent / 100 * level.contractmanager.activetablets.size);
    } else {
        level.var_6a82bbe1d7f1fde8.var_96c4a8c24e604cad = level.var_6a82bbe1d7f1fde8.var_495b2f627ffbfe25;
    }
    level.var_6a82bbe1d7f1fde8.var_93b2ce3b78fe33c5 = getdvarint(@"hash_320d0406fe2b2ca2", 1);
    level.var_6a82bbe1d7f1fde8.var_7d8b10ec1f9f17dd = getdvarint(@"hash_590de0aaa9df48df", 30);
    level.var_6a82bbe1d7f1fde8.var_39e41680223d4fe6 = getdvarint(@"hash_9de04bb50e7744fd", 20);
    level.var_6a82bbe1d7f1fde8.var_5bc5480ed9f02604 = getdvarint(@"hash_ebb574cfa6eca490", 7);
    level.var_6a82bbe1d7f1fde8.var_e717ede9597f2a74 = getdvarint(@"hash_a9fc7a15706e126e", 10);
    level.var_6a82bbe1d7f1fde8.var_10ccfc6b2e5d41cb = getdvarint(@"hash_3861d613ec2255d2", 1);
    level.var_6a82bbe1d7f1fde8.var_128b1f4d1fc9cb50 = 0;
    level.var_6a82bbe1d7f1fde8.exclusionradius = getdvarint(@"hash_9dc0c0dd8d3954a", 5000);
    level.var_6a82bbe1d7f1fde8.var_b007c0e8ff0781ff = getdvarint(@"hash_c19ce2cc426fe26b", 0);
    level.var_6a82bbe1d7f1fde8.var_c0c47af988dff6ce = getdvarint(@"hash_538f41540fa0afc0", 150);
    level.var_6a82bbe1d7f1fde8.var_d4618ceb0666a783 = getdvarfloat(@"hash_21f576fc819e1511", 0.8);
    level.var_6a82bbe1d7f1fde8.var_5fa3996ffda55c6 = getdvarint(@"hash_e87c8f63a5a5f08", 1);
    level.var_6a82bbe1d7f1fde8.var_4797e89ce6e68a59 = getdvarint(@"hash_c31c41f7e6f56001", 2);
    level.var_6a82bbe1d7f1fde8.var_d3d3928a04e38f95 = getdvarint(@"hash_b57b222dd392d0fd", 60);
    level.var_6a82bbe1d7f1fde8.var_fc543ce4cb2b8c5e = getdvarint(@"hash_53755e3fb2afafd6", 35);
    if (level.var_6a82bbe1d7f1fde8.var_4797e89ce6e68a59 == 2) {
        level.var_6a82bbe1d7f1fde8.var_e28366f9ed2a43f1 = level.var_6a82bbe1d7f1fde8.var_fc543ce4cb2b8c5e;
    } else {
        level.var_6a82bbe1d7f1fde8.var_e28366f9ed2a43f1 = level.var_6a82bbe1d7f1fde8.var_d3d3928a04e38f95;
    }
    level.var_6a82bbe1d7f1fde8.var_2127d8e6114a36ad = getdvarint(@"hash_e5e63f28a1e16b52", 0);
    level.var_6a82bbe1d7f1fde8.var_5c606368d744097d = 0;
    level.var_6a82bbe1d7f1fde8.var_e12e030746e5588b = 0;
    level.var_6a82bbe1d7f1fde8.var_8c34db33df8cd749 = getdvarint(@"hash_904b791d2c95b159", 2);
    function_a1265458782afed2();
    function_4eafca4dace2790();
}

// Namespace namespace_89521477a018e10a / namespace_e0d8d479cc52b68f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xa31
// Size: 0x64
function private function_a1265458782afed2() {
    level.var_6a82bbe1d7f1fde8.var_2a72db519adc403d = strtok(getdvar(@"hash_bcf2cd4ec62d229", "assassination hacker_phone intel scavenger spy_drones master_assassination"), " ");
    level.var_6a82bbe1d7f1fde8.exclusionlist = strtok(getdvar(@"hash_d4b86b03fb1d1e8b", "vip"), " ");
}

// Namespace namespace_89521477a018e10a / namespace_e0d8d479cc52b68f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xa9d
// Size: 0xc0
function private function_4eafca4dace2790() {
    level.var_6a82bbe1d7f1fde8.var_c45b4eca6c755786 = [];
    pairs = strtok(getdvar(@"hash_961025554e3ae74a", ""), ",");
    foreach (pair in pairs) {
        tokens = strtok(pair, " ");
        if (tokens.size == 2) {
            level.var_6a82bbe1d7f1fde8.var_c45b4eca6c755786[tokens[0]] = int(tokens[1]);
        }
    }
}

// Namespace namespace_89521477a018e10a / namespace_e0d8d479cc52b68f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xb65
// Size: 0x2a
function private function_df4cbc32c8f4b694() {
    scripts\cp_mp\utility\omnvar_utility::function_d3cf7ff1a257e2c3("ui_br_legendary_contract_game_data", 1, 8, int(level.var_6a82bbe1d7f1fde8.var_c0c47af988dff6ce));
}

// Namespace namespace_89521477a018e10a / namespace_e0d8d479cc52b68f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xb97
// Size: 0x28
function private function_7c26f56cd299df9d() {
    game["dialog"]["legendary_contract_newcontracts"] = "blcs_grav_aaa20";
    game["dialog"]["legendary_contract_pickup"] = "blcs_grav_aaa19";
}

// Namespace namespace_89521477a018e10a / namespace_e0d8d479cc52b68f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xbc7
// Size: 0xdf
function private function_1dab7d1c826262ac() {
    scripts\mp\gametypes\br_gametypes::registerbrgametypefunc("setCloseByContractStatusOmnvar", &function_b6b01c915e24dc93);
    scripts\mp\gametypes\br_gametypes::registerbrgametypefunc("setActiveContractStatusOmnvar", &function_b2687585d0a01882);
    scripts\mp\gametypes\br_gametypes::registerbrgametypefunc("playAdditionalContractVOOnPickup", &function_7873864250068e11);
    scripts\mp\gametypes\br_gametypes::registerbrgametypefunc("getContractPlunderBonus", &function_316611d82a794d9f);
    scripts\mp\gametypes\br_gametypes::registerbrgametypefunc("getContractXpMultiplier", &function_7f174cc0cde438dd);
    scripts\mp\gametypes\br_gametypes::registerbrgametypefunc("modifyBaseContractRewards", &function_301b8bb0f3666e59);
    scripts\mp\gametypes\br_gametypes::registerbrgametypefunc("giveContractAdditionalRewards", &function_b7a451b29899ba9);
    scripts\mp\gametypes\br_gametypes::registerbrgametypefunc("onOpenLegendaryCrate", &function_d4d8942eae92d253);
    scripts\mp\gametypes\br_gametypes::registerbrgametypefunc("getSupplyDropCrateUsedFunction", &function_a750847beab4180e);
    scripts\mp\gametypes\br_gametypes::registerbrgametypefunc("additionalRewardsOnContractPickup", &function_b033457dc1ba1562);
    scripts\mp\gametypes\br_gametypes::registerbrgametypefunc("getSpecialContractTime", &function_f0b97d400eaa80d8);
    scripts\mp\gametypes\br_gametypes::registerbrgametypefunc("onContractTabletHide", &function_c6c43c079365df8d);
    scripts\mp\gametypes\br_gametypes::registerbrgametypefunc("getContractSplashRefOverride", &function_31c343a0e4ad9300);
}

// Namespace namespace_89521477a018e10a / namespace_e0d8d479cc52b68f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xcae
// Size: 0x44
function private function_6ccce6577fcd5e27() {
    level.var_dc6636f4b2728b7d = [];
    function_9ebbdb8a9d2f9ef5(level.var_6a82bbe1d7f1fde8.var_96c4a8c24e604cad);
    level.var_6a82bbe1d7f1fde8.var_e12e030746e5588b = level.var_dc6636f4b2728b7d.size;
}

// Namespace namespace_89521477a018e10a / namespace_e0d8d479cc52b68f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xcfa
// Size: 0xc5
function private function_9ebbdb8a9d2f9ef5(quantity) {
    var_1928488550d79445 = array_randomize_objects(level.contractmanager.activetablets);
    var_8d6db73a7a5889f7 = level.var_dc6636f4b2728b7d.size + quantity;
    foreach (tablet in var_1928488550d79445) {
        if (level.var_dc6636f4b2728b7d.size >= var_8d6db73a7a5889f7) {
            break;
        }
        contract = tablet.task;
        if (!function_2db5dd0cda747ee(contract)) {
            continue;
        }
        function_7ae03d4e75a6e6ea(contract);
    }
}

// Namespace namespace_89521477a018e10a / namespace_e0d8d479cc52b68f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xdc7
// Size: 0x1ac
function private function_2db5dd0cda747ee(contract) {
    if (!isdefined(contract) || istrue(contract.var_fcd717aeda26cf4c)) {
        return false;
    }
    if (!level.var_6a82bbe1d7f1fde8.var_2127d8e6114a36ad) {
        if (level.var_6a82bbe1d7f1fde8.exclusionlist.size > 0) {
            if (array_contains(level.var_6a82bbe1d7f1fde8.exclusionlist, contract.type.ref)) {
                return false;
            }
        }
        if (level.var_6a82bbe1d7f1fde8.var_2a72db519adc403d.size > 0) {
            if (!array_contains(level.var_6a82bbe1d7f1fde8.var_2a72db519adc403d, contract.type.ref)) {
                return false;
            }
        }
    }
    if (!level.var_6a82bbe1d7f1fde8.var_b007c0e8ff0781ff) {
        foreach (var_6952266be626bfc in level.var_dc6636f4b2728b7d) {
            if (isdefined(var_6952266be626bfc) && isdefined(var_6952266be626bfc.tablet) && isdefined(var_6952266be626bfc.tablet.origin)) {
                if (distance2d(var_6952266be626bfc.tablet.origin, contract.tablet.origin) < level.var_6a82bbe1d7f1fde8.exclusionradius) {
                    return false;
                }
            }
        }
    }
    return true;
}

// Namespace namespace_89521477a018e10a / namespace_e0d8d479cc52b68f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xf7c
// Size: 0x79
function private function_7ae03d4e75a6e6ea(contract) {
    level.var_dc6636f4b2728b7d = array_add(level.var_dc6636f4b2728b7d, contract);
    tablet = contract.tablet;
    if (tablet getscriptableparthasstate(tablet.type, "visible_legendary")) {
        tablet setscriptablepartstate(tablet.type, "visible_legendary");
    }
    contract.var_fcd717aeda26cf4c = 1;
}

// Namespace namespace_89521477a018e10a / namespace_e0d8d479cc52b68f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xffd
// Size: 0x68
function function_b6b01c915e24dc93(player, contract) {
    if (!isdefined(contract)) {
        return;
    }
    player scripts\cp_mp\utility\omnvar_utility::function_63437fca39c681dc("ui_br_legendary_contract_client_data", 0, 1, istrue(contract.var_fcd717aeda26cf4c) ? 1 : 0);
    modifier = function_cf7b2f45657ac7e2(contract);
    player scripts\cp_mp\utility\omnvar_utility::function_63437fca39c681dc("ui_br_legendary_contract_client_data", 2, 8, int(modifier));
}

// Namespace namespace_89521477a018e10a / namespace_e0d8d479cc52b68f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x106d
// Size: 0x86
function function_cf7b2f45657ac7e2(contract) {
    if (!isdefined(contract) || !isdefined(contract.type.basetime) || !istrue(contract.var_fcd717aeda26cf4c)) {
        return 0;
    }
    modifier = function_cb3bbd9496078cc2(contract);
    if (level.var_6a82bbe1d7f1fde8.var_4797e89ce6e68a59 == 2) {
        modifier = modifier / 100 * contract.type.basetime;
    }
    return modifier;
}

// Namespace namespace_89521477a018e10a / namespace_e0d8d479cc52b68f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10fc
// Size: 0x91
function function_cb3bbd9496078cc2(contract) {
    if (!isdefined(contract) || !istrue(contract.var_fcd717aeda26cf4c)) {
        return 0;
    }
    if (isdefined(level.var_6a82bbe1d7f1fde8.var_c45b4eca6c755786[contract.type.ref])) {
        return level.var_6a82bbe1d7f1fde8.var_c45b4eca6c755786[contract.type.ref];
    }
    return level.var_6a82bbe1d7f1fde8.var_e28366f9ed2a43f1;
}

// Namespace namespace_89521477a018e10a / namespace_e0d8d479cc52b68f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1195
// Size: 0xa7
function function_b2687585d0a01882(team, contract) {
    value = 0;
    if (isdefined(contract)) {
        value = istrue(contract.var_fcd717aeda26cf4c) ? 1 : 0;
    }
    teammates = scripts\mp\utility\teams::getteamdata(team, "players");
    foreach (player in teammates) {
        player scripts\cp_mp\utility\omnvar_utility::function_63437fca39c681dc("ui_br_legendary_contract_client_data", 1, 1, value);
    }
}

// Namespace namespace_89521477a018e10a / namespace_e0d8d479cc52b68f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1244
// Size: 0x17f
function function_9dde686b3c2dad5c() {
    level endon("game_ended");
    if (!istrue(level.var_6a82bbe1d7f1fde8.var_93b2ce3b78fe33c5)) {
        return;
    }
    while (true) {
        level waittill("br_circle_set");
        if (level.br_circle.circleindex == 0) {
            continue;
        }
        chance = level.var_6a82bbe1d7f1fde8.var_7d8b10ec1f9f17dd + level.var_6a82bbe1d7f1fde8.var_39e41680223d4fe6 * level.var_6a82bbe1d7f1fde8.var_128b1f4d1fc9cb50;
        if (istrue(percent_chance(chance))) {
            wait level.var_6a82bbe1d7f1fde8.var_e717ede9597f2a74;
            maximum = level.var_6a82bbe1d7f1fde8.var_e12e030746e5588b - level.var_dc6636f4b2728b7d.size;
            quantity = level.var_6a82bbe1d7f1fde8.var_5bc5480ed9f02604 / 100 * level.contractmanager.activetablets.size;
            quantity = ceil(min(maximum, quantity));
            function_9ebbdb8a9d2f9ef5(quantity);
            level.var_6a82bbe1d7f1fde8.var_128b1f4d1fc9cb50 = 0;
            if (istrue(level.var_6a82bbe1d7f1fde8.var_10ccfc6b2e5d41cb)) {
                scripts\mp\gametypes\br_public::brleaderdialog("legendary_contract_newcontracts", 1, undefined, 0, 0, undefined, "dx_br_brlc_");
            }
            continue;
        }
        level.var_6a82bbe1d7f1fde8.var_128b1f4d1fc9cb50++;
    }
}

// Namespace namespace_89521477a018e10a / namespace_e0d8d479cc52b68f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13cb
// Size: 0x3b
function function_c6c43c079365df8d(contract) {
    if (!isdefined(contract) || !istrue(contract.var_fcd717aeda26cf4c)) {
        return;
    }
    level.var_dc6636f4b2728b7d = array_remove(level.var_dc6636f4b2728b7d, contract);
}

// Namespace namespace_89521477a018e10a / namespace_e0d8d479cc52b68f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x140e
// Size: 0x5a
function function_7873864250068e11(team, contract) {
    if (!isdefined(contract) || !istrue(contract.var_fcd717aeda26cf4c)) {
        return;
    }
    players = scripts\mp\utility\teams::getteamdata(team, "players");
    scripts\mp\gametypes\br_public::brleaderdialog("legendary_contract_pickup", 1, players, 0, 6, undefined, "dx_br_brlc_");
}

// Namespace namespace_89521477a018e10a / namespace_e0d8d479cc52b68f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1470
// Size: 0x35
function function_316611d82a794d9f(contract) {
    if (!isdefined(contract) || !istrue(contract.var_fcd717aeda26cf4c)) {
        return;
    }
    return level.var_6a82bbe1d7f1fde8.var_c0c47af988dff6ce;
}

// Namespace namespace_89521477a018e10a / namespace_e0d8d479cc52b68f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14ae
// Size: 0x38
function function_7f174cc0cde438dd(contract) {
    if (!isdefined(contract) || !istrue(contract.var_fcd717aeda26cf4c)) {
        return;
    }
    return 1 + level.var_6a82bbe1d7f1fde8.var_d4618ceb0666a783;
}

// Namespace namespace_89521477a018e10a / namespace_e0d8d479cc52b68f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x14ef
// Size: 0xfc
function function_301b8bb0f3666e59(team, contract, rewards) {
    if (!isdefined(contract) || !istrue(contract.var_fcd717aeda26cf4c)) {
        return;
    }
    if (isdefined(rewards["plunder"])) {
        scripts\mp\gametypes\br_quest_util::giveteamplunderflat(team, level.var_6a82bbe1d7f1fde8.var_c0c47af988dff6ce, 1);
    }
    if (isdefined(rewards["xp"])) {
        xp = rewards["xp"] * level.var_6a82bbe1d7f1fde8.var_d4618ceb0666a783;
        players = scripts\mp\utility\teams::getteamdata(team, "players");
        foreach (player in players) {
            player thread scripts\mp\utility\points::doScoreEvent(#"hash_47cdccc3c293e02b", undefined, undefined, xp);
        }
    }
}

// Namespace namespace_89521477a018e10a / namespace_e0d8d479cc52b68f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x15f3
// Size: 0x4a
function function_b7a451b29899ba9(team, contract) {
    if (!isdefined(contract) || !istrue(contract.var_fcd717aeda26cf4c)) {
        return;
    }
    if (istrue(level.var_6a82bbe1d7f1fde8.var_5fa3996ffda55c6)) {
        function_e5019bc27a9e875f(contract, team);
    }
}

// Namespace namespace_89521477a018e10a / namespace_e0d8d479cc52b68f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1645
// Size: 0x96
function function_b033457dc1ba1562(team, contract) {
    if (!isdefined(contract) || !istrue(contract.var_fcd717aeda26cf4c)) {
        return;
    }
    players = scripts\mp\utility\teams::getteamdata(team, "players");
    foreach (player in players) {
        player thread scripts\mp\utility\points::doScoreEvent(#"hash_3ddec4ba686bed68");
    }
}

// Namespace namespace_89521477a018e10a / namespace_e0d8d479cc52b68f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x16e3
// Size: 0x6f
function function_f0b97d400eaa80d8(contract, time) {
    if (!isdefined(contract) || !istrue(contract.var_fcd717aeda26cf4c)) {
        return time;
    }
    modifier = function_cf7b2f45657ac7e2(contract);
    if (contract.type.ref == "vip") {
        time += modifier;
    } else {
        time -= modifier;
    }
    return int(time);
}

// Namespace namespace_89521477a018e10a / namespace_e0d8d479cc52b68f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x175b
// Size: 0x244
function function_e5019bc27a9e875f(contract, team) {
    if (!isdefined(contract) || !istrue(contract.var_fcd717aeda26cf4c)) {
        return;
    }
    var_8850d9f771525016 = undefined;
    players = scripts\mp\utility\teams::getteamdata(team, "players");
    foreach (player in players) {
        if (scripts\mp\utility\player::isreallyalive(player) && !player scripts\mp\gametypes\br_public::isplayeringulag()) {
            var_8850d9f771525016 = player;
            break;
        }
    }
    if (!isdefined(var_8850d9f771525016)) {
        return;
    }
    forward = anglestoforward(var_8850d9f771525016.angles);
    var_88b83b0d7a43ea72 = randomfloatrange(0, 360);
    offset = rotatepointaroundvector((0, 0, 1), forward, var_88b83b0d7a43ea72) + (0, 200, 0);
    drop_point = getclosestpointonnavmesh(var_8850d9f771525016.origin + offset);
    data = spawnstruct();
    data.var_4191ace1612a5376 = "military_carepackage_01_sidequest_main_scan";
    crate = scripts\cp_mp\killstreaks\airdrop::dropcrate(undefined, var_8850d9f771525016.team, "legendary_supply_drop", drop_point + (0, 0, 4096), (0, randomfloat(360), 0), drop_point, data);
    crate.source = "";
    crate.skipminimapicon = 1;
    crate.var_d8c7850294c61e9f = 1;
    crate.item_rewards = getscriptcachecontents("br_legendary_crate", level.var_6a82bbe1d7f1fde8.var_5c606368d744097d);
    thread function_373f9e44ad714223(crate, players, var_8850d9f771525016);
    level.var_6a82bbe1d7f1fde8.var_5c606368d744097d += 1;
    if (level.var_6a82bbe1d7f1fde8.var_5c606368d744097d >= 21) {
        level.var_6a82bbe1d7f1fde8.var_5c606368d744097d = 0;
    }
}

// Namespace namespace_89521477a018e10a / namespace_e0d8d479cc52b68f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x19a7
// Size: 0x15c
function function_373f9e44ad714223(crate, players, var_8850d9f771525016) {
    id = scripts\mp\objidpoolmanager::requestobjectiveid(1);
    if (id > -1) {
        crate setscriptablepartstate("objective_map", "inactive");
        scripts\mp\objidpoolmanager::objective_add_objective(id, "current", crate.origin, "ui_map_icon_supply_drop_legendary_contract");
        objective_addalltomask(id);
        objective_showtoplayersinmask(id);
        objective_setbackground(id, 1);
        objective_onentity(id, crate);
        objective_setzoffset(id, 75);
        objective_setdescription(id, %MP_BR_INGAME/REWARD_ICON_NAME_LEGENDARYCONTRACT);
        function_c047d7ffe7a83501(id, 4921, 5906);
        function_865f9c5d005f9a08(id, 1);
        crate.scriptedobjid = id;
    }
    waitframe();
    foreach (player in players) {
        if (player br_public::isplayerinorgoingtogulag()) {
            continue;
        }
        player calloutmarkerping::calloutmarkerping_createcallout(11, crate.origin, crate.scriptedobjid);
        break;
    }
    wait level.var_6a82bbe1d7f1fde8.var_8c34db33df8cd749;
    showsplashtoteam(var_8850d9f771525016.team, "br_legendary_contract_crate_inbound", undefined);
}

// Namespace namespace_89521477a018e10a / namespace_e0d8d479cc52b68f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b0b
// Size: 0x120
function function_d4d8942eae92d253(player) {
    if (isdefined(self.item_rewards)) {
        dropstruct = scripts\mp\gametypes\br_pickups::function_7b9f3966a7a42003(self.item_rewards.size);
        foreach (item in self.item_rewards) {
            if (scripts\mp\gametypes\br_lootcache::canspawnitemname(item)) {
                raritynum = level.br_pickups.br_itemrarity[item];
                legendary = isdefined(raritynum) && raritynum == 4;
                scripts\mp\gametypes\br_lootcache::lootspawnitem(item, dropstruct, self.origin, self.angles, 0, legendary);
            }
        }
    }
    player thread scripts\mp\utility\points::doScoreEvent(#"hash_f396d39fee1a8054");
    player playsoundtoplayer("uin_loot_container_open_epic", player);
    player dlog_recordplayerevent("dlog_event_br_legendary_contract_crate_opened", ["team", player.team]);
}

// Namespace namespace_89521477a018e10a / namespace_e0d8d479cc52b68f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c33
// Size: 0x27
function function_a750847beab4180e(crate) {
    if (isdefined(crate) && istrue(crate.var_d8c7850294c61e9f)) {
        return &function_d4d8942eae92d253;
    }
    return undefined;
}

// Namespace namespace_89521477a018e10a / namespace_e0d8d479cc52b68f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1c63
// Size: 0x2c
function function_31c343a0e4ad9300(contract, splashref) {
    if (istrue(contract.var_fcd717aeda26cf4c)) {
        splashref += "_legendary";
    }
    return splashref;
}

