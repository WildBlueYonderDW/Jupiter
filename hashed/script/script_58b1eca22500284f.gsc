// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using script_5def7af2a9f04234;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\flags.gsc;
#using script_342e51952b63e594;
#using scripts\mp\gametypes\br_armory_kiosk.gsc;
#using script_304f476283f6d36e;
#using script_6a8ec730b2bfa844;
#using script_600b944a95c3a7bf;
#using scripts\mp\gametypes\br_pickups.gsc;

#namespace namespace_bf5795f2ab4f8798;

// Namespace namespace_bf5795f2ab4f8798/namespace_17f974825fe19125
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x683
// Size: 0x21e
function function_88fbe091ebbda87c() {
    if (getdvarint(@"hash_f8b075119c563072", 1) == 0) {
        return;
    }
    level.var_c6d8a22182e47edd = spawnstruct();
    level.var_c6d8a22182e47edd.var_bd67aa0990219283 = 0;
    level.var_c6d8a22182e47edd.var_7039e552e73d25a1 = undefined;
    level.var_c6d8a22182e47edd.var_48c882aea7e3896f = -1;
    if (level.mapname == "mp_ai_firefight") {
        level.var_c6d8a22182e47edd.var_bba978aab35db160 = (1716, 1566, 200);
        level.var_c6d8a22182e47edd.var_9ed3f1945d363261 = (1716, 1566, 200);
    } else if (level.mapname == "mp_biobunker") {
        level.var_c6d8a22182e47edd.var_bba978aab35db160 = (-9085, 11650, 1695);
        level.var_c6d8a22182e47edd.var_9ed3f1945d363261 = (-9085, 11681, 1695);
    }
    level.var_c6d8a22182e47edd.var_35b62437221af0e5 = spawnscriptable("dmz_biobunker_shopkeeper_voice", level.var_c6d8a22182e47edd.var_bba978aab35db160, (0, 0, 0));
    level.var_c6d8a22182e47edd.var_4e6e1a3a72bd88d2 = getstructarray("shoppingListLoc", "targetname");
    level.var_c6d8a22182e47edd.var_e57f4a6f7e313e90 = undefined;
    if (getdvarint(@"hash_fbeb3e3edce37b14", 0)) {
        level.var_c6d8a22182e47edd.var_e57f4a6f7e313e90 = getstructarray("shoppingListDebugItem", "targetname");
    }
    level.var_c6d8a22182e47edd.var_3fa3e4e3abb61e4d = [];
    level.var_c6d8a22182e47edd.var_41701ef07a1f9fe8 = [];
    level.var_c6d8a22182e47edd.var_18685e9d0375a313 = [];
    level thread function_5b927062b844e007();
    level thread function_9dfc2bb48a54cd50();
    level thread function_68613df3dd9c24a1();
    level thread function_c17cfc74e781a94a();
}

// Namespace namespace_bf5795f2ab4f8798/namespace_17f974825fe19125
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8a8
// Size: 0xd2
function function_c17cfc74e781a94a() {
    level endon("game_ended");
    interval = 0.1;
    var_919026833c44ed10 = 0;
    while (1) {
        var_2c12590f73a533c9 = 0;
        combataround = function_a8501c6fe24440eb();
        if (istrue(combataround)) {
            var_2c12590f73a533c9 = function_d6c06e62befcf33f("CombatAround", 3);
            if (istrue(var_2c12590f73a533c9)) {
                var_919026833c44ed10 = 0;
            }
        }
        if (!istrue(var_2c12590f73a533c9)) {
            player = function_dea6a60b8e33598f(level.var_c6d8a22182e47edd.var_bba978aab35db160);
            if (isdefined(player)) {
                var_2c12590f73a533c9 = function_dd677378528c056f(player);
                if (istrue(var_2c12590f73a533c9)) {
                    var_919026833c44ed10 = 0;
                }
            }
        }
        if (!istrue(var_2c12590f73a533c9) && var_919026833c44ed10 > 7) {
            var_2c12590f73a533c9 = function_d6c06e62befcf33f("RandomIdle", 1);
            if (istrue(var_2c12590f73a533c9)) {
                var_919026833c44ed10 = 0;
            }
        }
        wait(interval);
        var_919026833c44ed10 = var_919026833c44ed10 + interval;
    }
}

// Namespace namespace_bf5795f2ab4f8798/namespace_17f974825fe19125
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x981
// Size: 0x27
function function_d89d7e1fa23f3cee() {
    level.var_c6d8a22182e47edd.var_35b62437221af0e5 setscriptablepartstate("speaker", "off");
    waitframe();
}

// Namespace namespace_bf5795f2ab4f8798/namespace_17f974825fe19125
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9af
// Size: 0x55
function function_f3756f0695358fe3() {
    level endon("game_ended");
    level.var_c6d8a22182e47edd.var_35b62437221af0e5 notify("speaking_priority_reset");
    level.var_c6d8a22182e47edd.var_35b62437221af0e5 endon("speaking_priority_reset");
    wait(8);
    level.var_c6d8a22182e47edd.var_bd67aa0990219283 = 0;
}

// Namespace namespace_bf5795f2ab4f8798/namespace_17f974825fe19125
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa0b
// Size: 0xe1
function function_dd677378528c056f(player) {
    if (!isdefined(player)) {
        return;
    }
    if (array_contains(level.var_c6d8a22182e47edd.var_3fa3e4e3abb61e4d, player) && array_contains(level.var_c6d8a22182e47edd.var_18685e9d0375a313, player)) {
        level.var_c6d8a22182e47edd.var_18685e9d0375a313 = array_remove(level.var_c6d8a22182e47edd.var_18685e9d0375a313, player);
        return function_d6c06e62befcf33f("PlayersApproachAgain", 2);
    } else if (!array_contains(level.var_c6d8a22182e47edd.var_3fa3e4e3abb61e4d, player)) {
        level.var_c6d8a22182e47edd.var_3fa3e4e3abb61e4d[level.var_c6d8a22182e47edd.var_3fa3e4e3abb61e4d.size] = player;
        return function_d6c06e62befcf33f("ApproachFirstTime", 2);
    }
}

// Namespace namespace_bf5795f2ab4f8798/namespace_17f974825fe19125
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaf3
// Size: 0x1d7
function function_dea6a60b8e33598f(origin) {
    players = namespace_7e17181d03156026::getplayersinradius(level.var_c6d8a22182e47edd.var_bba978aab35db160, 512);
    var_f693db2b79ee3819 = 256;
    var_67e54dc8917a5918 = [];
    foreach (player in players) {
        if (!isalive(player)) {
            continue;
        }
        if (abs(player.origin[2] - level.var_c6d8a22182e47edd.var_bba978aab35db160[0] < var_f693db2b79ee3819)) {
            var_67e54dc8917a5918[var_67e54dc8917a5918.size] = player;
        }
    }
    players = sortbydistance(var_67e54dc8917a5918, level.var_c6d8a22182e47edd.var_bba978aab35db160);
    var_41701ef07a1f9fe8 = [];
    foreach (player in players) {
        var_b9352a31fdb74279 = sighttracepassed(level.var_c6d8a22182e47edd.var_9ed3f1945d363261, player geteye(), 0, undefined);
        if (var_b9352a31fdb74279) {
            var_41701ef07a1f9fe8[var_41701ef07a1f9fe8.size] = player;
        } else if (array_contains(level.var_c6d8a22182e47edd.var_41701ef07a1f9fe8, player)) {
            level.var_c6d8a22182e47edd.var_18685e9d0375a313[level.var_c6d8a22182e47edd.var_18685e9d0375a313.size] = player;
        }
    }
    level.var_c6d8a22182e47edd.var_41701ef07a1f9fe8 = var_41701ef07a1f9fe8;
    return var_41701ef07a1f9fe8[0];
}

// Namespace namespace_bf5795f2ab4f8798/namespace_17f974825fe19125
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcd2
// Size: 0x158
function function_a8501c6fe24440eb() {
    if (isdefined(level.radiation) && istrue(level.radiation.var_9badbb469626f6)) {
        if (distance2d(level.var_c6d8a22182e47edd.var_bba978aab35db160, level.radiation.origin) - level.radiation.radius < 1500) {
            return 0;
        }
    }
    var_e3fda941919216d6 = namespace_235de5057ddc58e0::function_d9ce8fb00f0e5fa1(level.var_c6d8a22182e47edd.var_bba978aab35db160, 768);
    foreach (ent in var_e3fda941919216d6) {
        if (!isdefined(ent)) {
            continue;
        }
        if (isalive(ent)) {
            if (isplayer(ent)) {
                if (ent namespace_7e17181d03156026::isincombat() || istrue(ent.inlaststand)) {
                    return 1;
                }
            } else if (isagent(ent)) {
                if (!istrue(ent.stealth_enabled)) {
                    if (isdefined(ent.enemy)) {
                        return 1;
                    }
                } else if (ent [[ ent.fnisinstealthcombat ]]()) {
                    return 1;
                }
            }
        }
    }
    return 0;
}

// Namespace namespace_bf5795f2ab4f8798/namespace_17f974825fe19125
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe32
// Size: 0xa9
function function_9dfc2bb48a54cd50() {
    namespace_4b0406965e556711::function_1240434f4201ac9d("prematch_done");
    waitframe();
    foreach (buystation in level.br_armory_kiosk.scriptables) {
        if (isdefined(buystation.var_5ea299587b551f9f) && buystation.var_5ea299587b551f9f == "dmz_biobunker") {
            level.var_c6d8a22182e47edd.buystation = buystation;
        }
    }
    level thread function_d49ef0c9db01ce16();
}

// Namespace namespace_bf5795f2ab4f8798/namespace_17f974825fe19125
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xee2
// Size: 0xe6
function function_d49ef0c9db01ce16() {
    level endon("game_ended");
    while (1) {
        state = level.var_c6d8a22182e47edd.buystation getscriptablepartstate("br_plunder_box");
        if (state == "opening" || state == "open") {
            break;
        }
        waitframe();
    }
    function_d6c06e62befcf33f("PlayerOpenFreeBuyStation", 3);
    var_ad62e88241ed114d = level.var_c6d8a22182e47edd.buystation.playersusing.size;
    while (1) {
        if (level.var_c6d8a22182e47edd.buystation.playersusing.size > var_ad62e88241ed114d) {
            function_d6c06e62befcf33f("PlayerOpenFreeBuyStation", 2);
        }
        var_ad62e88241ed114d = level.var_c6d8a22182e47edd.buystation.playersusing.size;
        wait(1);
    }
}

// Namespace namespace_bf5795f2ab4f8798/namespace_17f974825fe19125
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfcf
// Size: 0x148
function function_68613df3dd9c24a1() {
    namespace_4b0406965e556711::function_1240434f4201ac9d("prematch_done");
    waitframe();
    foreach (buystation in level.br_armory_kiosk.scriptables) {
        if (isdefined(buystation.var_5ea299587b551f9f) && buystation.var_5ea299587b551f9f == "dmz_biobunker_high_tier") {
            level.var_c6d8a22182e47edd.var_6f3dab194c75e802 = buystation;
            if (isdefined(level.var_c6d8a22182e47edd.var_6f3dab194c75e802.var_afc028d00356e443)) {
                level.var_c6d8a22182e47edd.var_6f3dab194c75e802.var_afc028d00356e443 = level.var_c6d8a22182e47edd.var_6f3dab194c75e802.var_afc028d00356e443 + (0, 0, -2.5);
            }
            buystation.var_8b199355950fb72 = 1;
            namespace_25c7d0f5cb1e4346::function_45eefc63956143ed(buystation, "barter_recipe_list_iw9_biobunker_shopkeeper");
        }
    }
    namespace_a4b43c1cf86c6fe5::function_233a7adc7a673be(level.var_c6d8a22182e47edd.var_6f3dab194c75e802);
    level thread function_36186f6bc0210d19();
}

// Namespace namespace_bf5795f2ab4f8798/namespace_17f974825fe19125
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x111e
// Size: 0x163
function function_36186f6bc0210d19() {
    level endon("game_ended");
    var_e78f7f72026b2759 = 0;
    while (1) {
        state = level.var_c6d8a22182e47edd.var_6f3dab194c75e802 getscriptablepartstate("br_plunder_box");
        if (state == "opening" || state == "open") {
            break;
        }
        if (isdefined(level.var_c6d8a22182e47edd.var_6f3dab194c75e802.var_8d6dbcf5443a11f0) && level.var_c6d8a22182e47edd.var_6f3dab194c75e802.var_8d6dbcf5443a11f0 > var_e78f7f72026b2759) {
            function_d6c06e62befcf33f("UseLockedRewardStation", 3);
            var_e78f7f72026b2759 = level.var_c6d8a22182e47edd.var_6f3dab194c75e802.var_8d6dbcf5443a11f0;
        }
        waitframe();
    }
    function_d6c06e62befcf33f("UseUnlockedRewardStation", 4);
    var_ad62e88241ed114d = level.var_c6d8a22182e47edd.var_6f3dab194c75e802.playersusing.size;
    while (1) {
        if (level.var_c6d8a22182e47edd.var_6f3dab194c75e802.playersusing.size > var_ad62e88241ed114d) {
            function_d6c06e62befcf33f("UseUnlockedRewardStation", 2);
        }
        var_ad62e88241ed114d = level.var_c6d8a22182e47edd.var_6f3dab194c75e802.playersusing.size;
        wait(1);
    }
}

// Namespace namespace_bf5795f2ab4f8798/namespace_17f974825fe19125
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1288
// Size: 0x1d
function function_2693581ed81d3cdb() {
    namespace_a4b43c1cf86c6fe5::function_3b1235b668cb5c71(level.var_c6d8a22182e47edd.var_6f3dab194c75e802);
}

// Namespace namespace_bf5795f2ab4f8798/namespace_17f974825fe19125
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12ac
// Size: 0x307
function function_5b927062b844e007() {
    var_8ebbf5d649145ab9 = [];
    if (getdvarint(@"hash_dd86e03ec61b9dd6", 0)) {
        var_8ebbf5d649145ab9["test"] = [0:"equip_frag", 1:"equip_smoke"];
    } else {
        var_8ebbf5d649145ab9["bb_shopkeeper_list_01"] = [0:"brloot_valuable_bunker_notes_common", 1:"brloot_valuable_bunker_server_tape_uncommon", 2:"brloot_valuable_bunker_board_common"];
        var_8ebbf5d649145ab9["bb_shopkeeper_list_02"] = [0:"brloot_valuable_bunker_notes_uncommon", 1:"brloot_valuable_bunker_server_tape_common", 2:"brloot_valuable_bunker_chlorine"];
        var_8ebbf5d649145ab9["bb_shopkeeper_list_03"] = [0:"brloot_valuable_bunker_formaldehyde", 1:"brloot_valuable_bunker_acetic_acid", 2:"brloot_valuable_bunker_server_tape_uncommon"];
        var_8ebbf5d649145ab9["bb_shopkeeper_list_04"] = [0:"brloot_valuable_bunker_notes_rare", 1:"brloot_valuable_bunker_server_tape_rare"];
        var_8ebbf5d649145ab9["bb_shopkeeper_list_05"] = [0:"brloot_valuable_bunker_sulfuric_acid", 1:"brloot_valuable_bunker_notes_uncommon"];
        var_8ebbf5d649145ab9["bb_shopkeeper_list_06"] = [0:"brloot_valuable_bunker_notes_epic", 1:"brloot_valuable_bunker_board_uncommon"];
        var_8ebbf5d649145ab9["bb_shopkeeper_list_07"] = [0:"brloot_valuable_bunker_board_epic", 1:"brloot_valuable_bunker_notes_rare"];
    }
    var_a1165e9078bc3654 = getarraykeys(var_8ebbf5d649145ab9);
    var_e22d4969cb9f2bfe = random(var_a1165e9078bc3654);
    namespace_4b0406965e556711::function_1240434f4201ac9d("prematch_done");
    namespace_18e0fd353e69a0b2::function_466d1fc9a557d7c9("bb_shoppingListLoc", var_e22d4969cb9f2bfe);
    waitframe();
    foreach (var_5793a0cf9d352c92 in level.var_ced78996bbf1b2d3) {
        if (isdefined(var_5793a0cf9d352c92.type) && var_5793a0cf9d352c92.type == "dmz_dead_drop_transaction_drawer") {
            level.var_c6d8a22182e47edd.var_5793a0cf9d352c92 = var_5793a0cf9d352c92;
        }
    }
    level.var_c6d8a22182e47edd.var_5793a0cf9d352c92.var_5c7408f4a44005e6 = var_8ebbf5d649145ab9[var_e22d4969cb9f2bfe];
    if (isdefined(level.var_c6d8a22182e47edd.var_e57f4a6f7e313e90)) {
        function_53cb4b428d14444e();
    }
    function_471c5970300e0cb0([0:"brloot_valuable_sealion_luckycat", 1:"brloot_valuable_sealion_dogbank"], &namespace_8361bad7391de074::function_38d565bd866ced0e);
    function_471c5970300e0cb0([0:"brloot_valuable_liquor"], &namespace_8361bad7391de074::function_c543832fab9303cb);
    function_471c5970300e0cb0([0:"brloot_valuable_rare_dogbank"], &namespace_8361bad7391de074::function_f3f7cf5aa591a391);
    level.var_c6d8a22182e47edd.var_5793a0cf9d352c92.playersused = [];
    level.var_c6d8a22182e47edd.var_5793a0cf9d352c92.var_465361013186aa4c = [];
    level.var_c6d8a22182e47edd.var_5793a0cf9d352c92.var_2cc2b26893d5a8b6 = [];
    level.var_c6d8a22182e47edd.var_5793a0cf9d352c92.var_50657bcf5bb1ed14 = &function_400a665f959f1c4;
    level.var_c6d8a22182e47edd.var_5793a0cf9d352c92.var_7ff4adf1a6c36a48 = &function_c7ea55d0e15707e6;
}

// Namespace namespace_bf5795f2ab4f8798/namespace_17f974825fe19125
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15ba
// Size: 0x90
function function_400a665f959f1c4(player) {
    if (!array_contains(level.var_c6d8a22182e47edd.var_5793a0cf9d352c92.playersused, player)) {
        level.var_c6d8a22182e47edd.var_5793a0cf9d352c92.playersused[level.var_c6d8a22182e47edd.var_5793a0cf9d352c92.playersused.size] = player;
        function_d6c06e62befcf33f("PlayerUseBoxFirstTime", 4);
    } else {
        function_d6c06e62befcf33f("PlayersUseGeneral", 3);
    }
}

// Namespace namespace_bf5795f2ab4f8798/namespace_17f974825fe19125
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1651
// Size: 0x123
function function_471c5970300e0cb0(itemlist, callback) {
    if (!isdefined(level.var_c6d8a22182e47edd.var_5793a0cf9d352c92.var_2084ab8d06fc75f3)) {
        level.var_c6d8a22182e47edd.var_5793a0cf9d352c92.var_2084ab8d06fc75f3 = [];
    }
    var_5de46adbb510f463 = level.var_c6d8a22182e47edd.var_5793a0cf9d352c92.var_2084ab8d06fc75f3.size;
    level.var_c6d8a22182e47edd.var_5793a0cf9d352c92.var_2084ab8d06fc75f3[var_5de46adbb510f463] = spawnstruct();
    level.var_c6d8a22182e47edd.var_5793a0cf9d352c92.var_2084ab8d06fc75f3[var_5de46adbb510f463].list = itemlist;
    level.var_c6d8a22182e47edd.var_5793a0cf9d352c92.var_2084ab8d06fc75f3[var_5de46adbb510f463].callback = callback;
    level.var_c6d8a22182e47edd.var_5793a0cf9d352c92.var_2084ab8d06fc75f3[var_5de46adbb510f463].var_c82dfe214c069c6c = [];
}

// Namespace namespace_bf5795f2ab4f8798/namespace_17f974825fe19125
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x177b
// Size: 0x86
function function_cdd53bcf36c9dfe4(item) {
    foreach (var_d89286db53d9fe8a in level.var_c6d8a22182e47edd.var_5793a0cf9d352c92.var_2084ab8d06fc75f3) {
        if (array_contains(var_d89286db53d9fe8a.list, item)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_bf5795f2ab4f8798/namespace_17f974825fe19125
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1809
// Size: 0xe8
function function_d7dcff7d37237950(player, var_5793a0cf9d352c92) {
    foreach (var_d89286db53d9fe8a in level.var_c6d8a22182e47edd.var_5793a0cf9d352c92.var_2084ab8d06fc75f3) {
        if (function_338f5de6d3ecb78b(player.team, var_d89286db53d9fe8a.list) && !array_contains(var_d89286db53d9fe8a.var_c82dfe214c069c6c, player.team)) {
            [[ var_d89286db53d9fe8a.callback ]](player, var_5793a0cf9d352c92);
            var_d89286db53d9fe8a.var_c82dfe214c069c6c[var_d89286db53d9fe8a.var_c82dfe214c069c6c.size] = player.team;
        }
    }
}

// Namespace namespace_bf5795f2ab4f8798/namespace_17f974825fe19125
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x18f8
// Size: 0x6b
function function_1f4431c20da8b(team, items) {
    var_1a6d3b0183f59962 = [];
    foreach (item in items) {
        var_1a6d3b0183f59962[item] = 0;
    }
    return var_1a6d3b0183f59962;
}

// Namespace namespace_bf5795f2ab4f8798/namespace_17f974825fe19125
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x196b
// Size: 0x63
function function_2667078cd7d32e65(team, array) {
    foreach (var_57734db0da4fb01b in array[team]) {
        if (!var_57734db0da4fb01b) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_bf5795f2ab4f8798/namespace_17f974825fe19125
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x19d6
// Size: 0xca
function function_338f5de6d3ecb78b(team, array) {
    if (!isdefined(level.var_c6d8a22182e47edd.var_5793a0cf9d352c92.var_2cc2b26893d5a8b6) || !isdefined(level.var_c6d8a22182e47edd.var_5793a0cf9d352c92.var_2cc2b26893d5a8b6[team])) {
        return 0;
    }
    foreach (item in array) {
        if (!istrue(level.var_c6d8a22182e47edd.var_5793a0cf9d352c92.var_2cc2b26893d5a8b6[team][item])) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_bf5795f2ab4f8798/namespace_17f974825fe19125
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1aa8
// Size: 0x3c0
function function_c7ea55d0e15707e6(var_e1cf43f3ae9d77e7, player) {
    var_45161b0cc87eaced = 0;
    foreach (struct in var_e1cf43f3ae9d77e7) {
        if (struct.lootid != 0) {
            var_45161b0cc87eaced = 1;
            break;
        }
    }
    if (!var_45161b0cc87eaced) {
        return;
    }
    if (!level.var_c6d8a22182e47edd.var_6f3dab194c75e802.locked) {
        function_d6c06e62befcf33f("DepositGeneral", 2);
    }
    if (!isdefined(level.var_c6d8a22182e47edd.var_5793a0cf9d352c92.var_465361013186aa4c[player.team])) {
        level.var_c6d8a22182e47edd.var_5793a0cf9d352c92.var_465361013186aa4c[player.team] = function_1f4431c20da8b(player.team, level.var_c6d8a22182e47edd.var_5793a0cf9d352c92.var_5c7408f4a44005e6);
    }
    if (!isdefined(level.var_c6d8a22182e47edd.var_5793a0cf9d352c92.var_2cc2b26893d5a8b6[player.team])) {
        level.var_c6d8a22182e47edd.var_5793a0cf9d352c92.var_2cc2b26893d5a8b6[player.team] = [];
    }
    var_b7a23086776412ad = 0;
    var_b3a9e27fff924c96 = 0;
    var_4726ca55b7eb6c19 = namespace_8361bad7391de074::function_16ae6d8b5f25f31b("trade_keycode");
    var_aadfb8482b27ea43 = namespace_8361bad7391de074::function_c5e0bac8f123cc88(player.team, var_4726ca55b7eb6c19);
    foreach (item in var_e1cf43f3ae9d77e7) {
        ref = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(item.lootid);
        if (array_contains(level.var_c6d8a22182e47edd.var_5793a0cf9d352c92.var_5c7408f4a44005e6, ref)) {
            if (!level.var_c6d8a22182e47edd.var_5793a0cf9d352c92.var_465361013186aa4c[player.team][ref]) {
                level.var_c6d8a22182e47edd.var_5793a0cf9d352c92.var_465361013186aa4c[player.team][ref] = 1;
                var_b7a23086776412ad = 1;
            } else {
                var_b3a9e27fff924c96 = 1;
            }
        }
        if (function_cdd53bcf36c9dfe4(ref)) {
            level.var_c6d8a22182e47edd.var_5793a0cf9d352c92.var_2cc2b26893d5a8b6[player.team][ref] = 1;
        }
    }
    var_5ae592d099951346 = function_2667078cd7d32e65(player.team, level.var_c6d8a22182e47edd.var_5793a0cf9d352c92.var_465361013186aa4c);
    function_d7dcff7d37237950(player, level.var_c6d8a22182e47edd.var_5793a0cf9d352c92);
    if (var_5ae592d099951346 || var_b7a23086776412ad || var_b3a9e27fff924c96) {
        namespace_8361bad7391de074::function_93ab9968bf96e2b0(player);
    }
    if (var_5ae592d099951346) {
        function_d6c06e62befcf33f("DepositRewardStationUnlockComplete", 4);
        function_2693581ed81d3cdb();
        return;
    }
    if (var_b7a23086776412ad) {
        function_d6c06e62befcf33f("DepositRewardStationUnlockPartial", 2);
        return;
    }
    if (var_b3a9e27fff924c96) {
        function_d6c06e62befcf33f("DepositRewardStationUnlockRepeat", 2);
        return;
    }
    function_d6c06e62befcf33f("DepositGeneral", 2);
}

// Namespace namespace_bf5795f2ab4f8798/namespace_17f974825fe19125
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e6f
// Size: 0xa7
function function_a5a6e50f5442f0fe(var_49dcce316989a19c) {
    if (!isdefined(var_49dcce316989a19c)) {
        return;
    }
    foreach (loc in level.var_c6d8a22182e47edd.var_4e6e1a3a72bd88d2) {
        var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(loc.origin, loc.angles + (90, 0, 0));
        namespace_cb965d2f71fefddc::spawnpickup(var_49dcce316989a19c, var_cb4fad49263e20c4);
    }
}

// Namespace namespace_bf5795f2ab4f8798/namespace_17f974825fe19125
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f1d
// Size: 0xd5
function function_53cb4b428d14444e() {
    foreach (loc in level.var_c6d8a22182e47edd.var_e57f4a6f7e313e90) {
        offset = (0, 0, 0);
        if (issubstr(loc.var_2b7395b3855ce24f, "note")) {
            offset = (90, 0, 0);
        }
        var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(loc.origin, loc.angles + offset);
        namespace_cb965d2f71fefddc::spawnpickup(loc.var_2b7395b3855ce24f, var_cb4fad49263e20c4);
    }
}

// Namespace namespace_bf5795f2ab4f8798/namespace_17f974825fe19125
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1ff9
// Size: 0x54
function function_d6c06e62befcf33f(var_c7b61f413ad4ec68, priority, var_cd40ac65a2951f58, var_cd63c265a2bb9772) {
    return level.var_c6d8a22182e47edd.var_35b62437221af0e5 function_2477cc89494291a1(level.var_c6d8a22182e47edd.var_35b62437221af0e5, var_c7b61f413ad4ec68, priority, var_cd40ac65a2951f58, var_cd63c265a2bb9772);
}

// Namespace namespace_bf5795f2ab4f8798/namespace_17f974825fe19125
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x2055
// Size: 0x14b
function private function_2477cc89494291a1(speaker, var_c7b61f413ad4ec68, priority, var_cd40ac65a2951f58, var_cd63c265a2bb9772) {
    if (!isdefined(var_cd40ac65a2951f58)) {
        var_cd40ac65a2951f58 = 0.05;
    }
    if (!isdefined(var_cd63c265a2bb9772)) {
        var_cd63c265a2bb9772 = 0.07;
    }
    if (!isdefined(priority)) {
        priority = 1;
    }
    if (level.var_c6d8a22182e47edd.var_bd67aa0990219283 > priority) {
        return;
    }
    if (isdefined(level.var_c6d8a22182e47edd.var_7039e552e73d25a1) && level.var_c6d8a22182e47edd.var_7039e552e73d25a1 == var_c7b61f413ad4ec68 && level.var_c6d8a22182e47edd.var_48c882aea7e3896f + 8000 >= gettime()) {
        return;
    }
    wait(randomfloatrange(var_cd40ac65a2951f58, var_cd63c265a2bb9772));
    function_d89d7e1fa23f3cee();
    if (0) {
        /#
            printtoscreen2d(250, 250, "brloot_valuable_bunker_server_tape_uncommon" + var_c7b61f413ad4ec68, (0, 0, 0), 2, 60);
        #/
    }
    level.var_c6d8a22182e47edd.var_bd67aa0990219283 = priority;
    level.var_c6d8a22182e47edd.var_48c882aea7e3896f = gettime();
    level.var_c6d8a22182e47edd.var_7039e552e73d25a1 = var_c7b61f413ad4ec68;
    speaker setscriptablepartstate("speaker", var_c7b61f413ad4ec68);
    speaker thread function_f3756f0695358fe3();
    return 1;
}

// Namespace namespace_bf5795f2ab4f8798/namespace_17f974825fe19125
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x21a8
// Size: 0x72
function function_3136e267cbf2a63c(buystation, playersused) {
    foreach (player in buystation.playersusing) {
        if (!array_contains(playersused, player)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_bf5795f2ab4f8798/namespace_17f974825fe19125
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2222
// Size: 0x68
function function_a06bc7f3d6e3cb4b() {
    speaker = spawnscriptable("dmz_biobunker_shopkeeper_voice", (1716, 1566, 200), (0, 0, 0));
    while (1) {
        speaker setscriptablepartstate("speaker", "RandomIdle");
        wait(0.2);
        speaker setscriptablepartstate("speaker", "off");
        wait(0.2);
    }
}

