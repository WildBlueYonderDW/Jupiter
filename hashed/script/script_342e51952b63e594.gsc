// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_2d9d24f7c63ac143;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using script_b7a9ce0a2282b79;
#using script_600b944a95c3a7bf;
#using script_57d3850a12cf1d8f;
#using script_2391409ef7b431e1;
#using scripts\cp_mp\challenges.gsc;

#namespace namespace_88c3382d02472ceb;

// Namespace namespace_88c3382d02472ceb/namespace_25c7d0f5cb1e4346
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x185
// Size: 0x9d
function init() {
    level endon("game_ended");
    level.var_c153eac6e7c0e1a2 = getdvarint(@"hash_ae537ea74ad94bf6", 0);
    if (!level.var_c153eac6e7c0e1a2) {
        return;
    }
    level.var_78794c7cfbb450d5 = getdvar(@"hash_d02bf26d7b888c7b", "barter_recipe_list_iw9");
    level.var_cfd448bdaf563afa = function_98723716dbe58366(getdvar(@"hash_25dbdc95ff3e3da5", "barter_list_overrides_iw9"));
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    level.var_5b4fdabd6ff8ac60 = function_eee09bd49d34d254(level.var_78794c7cfbb450d5);
    /#
        level thread function_f1c3dc8c80e536c4();
    #/
}

// Namespace namespace_88c3382d02472ceb/namespace_25c7d0f5cb1e4346
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x229
// Size: 0x30
function function_b03a252f9ab9bcfd(player, index) {
    var_17d459426e3d4968 = function_4ae28d68dfc25dad(player);
    return function_2f1ef432df69a29b(player, var_17d459426e3d4968[index]);
}

// Namespace namespace_88c3382d02472ceb/namespace_25c7d0f5cb1e4346
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x261
// Size: 0x37
function function_2b4f0bea679346ef(player) {
    player notify("clear_barter");
    level endon("game_ended");
    player endon("death_or_disconnect");
    player endon("clear_barter");
    waitframe();
    player setclientomnvar("ui_barter_success", 0);
}

// Namespace namespace_88c3382d02472ceb/namespace_25c7d0f5cb1e4346
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x29f
// Size: 0x5e
function function_45eefc63956143ed(kiosk, var_78794c7cfbb450d5) {
    if (!isdefined(kiosk) || !isdefined(var_78794c7cfbb450d5) || !isdefined(level.var_cfd448bdaf563afa[var_78794c7cfbb450d5])) {
        return;
    }
    kiosk.var_9e3b77c6c3e95470 = level.var_cfd448bdaf563afa[var_78794c7cfbb450d5] + 1;
    kiosk.var_8165379c774fe8e3 = function_eee09bd49d34d254(var_78794c7cfbb450d5);
}

// Namespace namespace_88c3382d02472ceb/namespace_25c7d0f5cb1e4346
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x304
// Size: 0x6b
function function_fa0f2fcfc30f95a(players, kiosk, var_78794c7cfbb450d5) {
    foreach (player in players) {
        function_c661afd69dc6cb4d(player, kiosk, var_78794c7cfbb450d5);
    }
}

// Namespace namespace_88c3382d02472ceb/namespace_25c7d0f5cb1e4346
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x376
// Size: 0xd1
function function_c661afd69dc6cb4d(player, kiosk, var_78794c7cfbb450d5) {
    if (!isdefined(player) || !isdefined(kiosk) || !isdefined(var_78794c7cfbb450d5) || !isdefined(level.var_cfd448bdaf563afa[var_78794c7cfbb450d5])) {
        return;
    }
    if (!isdefined(kiosk.var_a713dcdd8d8d5d12)) {
        kiosk.var_a713dcdd8d8d5d12 = [];
    }
    kiosk.var_a713dcdd8d8d5d12[player.guid] = spawnstruct();
    kiosk.var_a713dcdd8d8d5d12[player.guid].var_9eb2829af566123b = level.var_cfd448bdaf563afa[var_78794c7cfbb450d5] + 1;
    kiosk.var_a713dcdd8d8d5d12[player.guid].var_5b4fdabd6ff8ac60 = function_eee09bd49d34d254(var_78794c7cfbb450d5);
}

// Namespace namespace_88c3382d02472ceb/namespace_25c7d0f5cb1e4346
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44e
// Size: 0x69
function function_cf93c66f1f68b32b(player, kiosk) {
    if (!istrue(level.var_c153eac6e7c0e1a2)) {
        return 0;
    }
    if (!isdefined(player) || !isdefined(kiosk)) {
        return 0;
    }
    return isdefined(kiosk.var_a713dcdd8d8d5d12) && isdefined(kiosk.var_a713dcdd8d8d5d12[player.guid]) || isdefined(kiosk.var_9e3b77c6c3e95470);
}

// Namespace namespace_88c3382d02472ceb/namespace_25c7d0f5cb1e4346
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4bf
// Size: 0x79
function function_6b9fb04b51e91720(player, kiosk) {
    if (!function_cf93c66f1f68b32b(player, kiosk)) {
        return 0;
    }
    if (isdefined(kiosk.var_a713dcdd8d8d5d12) && isdefined(kiosk.var_a713dcdd8d8d5d12[player.guid])) {
        return kiosk.var_a713dcdd8d8d5d12[player.guid].var_9eb2829af566123b;
    }
    return kiosk.var_9e3b77c6c3e95470;
}

// Namespace namespace_88c3382d02472ceb/namespace_25c7d0f5cb1e4346
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x540
// Size: 0xb1
function private function_eee09bd49d34d254(var_78794c7cfbb450d5) {
    var_2e6cde9123966491 = getscriptbundle(function_2ef675c13ca1c4af(%"hash_6c8907a65a40a6a9", var_78794c7cfbb450d5));
    var_5b4fdabd6ff8ac60 = [];
    foreach (var_a242355f9b40388b in var_2e6cde9123966491.var_13736fc9faa3bcf3) {
        if (isdefined(var_a242355f9b40388b.var_a242355f9b40388b)) {
            var_5b4fdabd6ff8ac60[var_5b4fdabd6ff8ac60.size] = getscriptbundle("barterrecipes:" + var_a242355f9b40388b.var_a242355f9b40388b);
        }
    }
    return var_5b4fdabd6ff8ac60;
}

// Namespace namespace_88c3382d02472ceb/namespace_25c7d0f5cb1e4346
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5f9
// Size: 0xa5
function private function_98723716dbe58366(var_1493da49a2631455) {
    var_b609ef20b3d0fd99 = getscriptbundle(function_2ef675c13ca1c4af(%"hash_283f419bc25a568b", var_1493da49a2631455));
    var_8ee856c796c0fe41 = [];
    foreach (index, list in var_b609ef20b3d0fd99.var_a43d35f01fe54f92) {
        if (isdefined(list.list)) {
            var_8ee856c796c0fe41[list.list] = index;
        }
    }
    return var_8ee856c796c0fe41;
}

// Namespace namespace_88c3382d02472ceb/namespace_25c7d0f5cb1e4346
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6a6
// Size: 0xcf
function private function_4ae28d68dfc25dad(player) {
    if (!isdefined(player) || !isdefined(player.br_kiosk)) {
        return level.var_5b4fdabd6ff8ac60;
    }
    if (isdefined(player.br_kiosk.var_a713dcdd8d8d5d12) && isdefined(player.br_kiosk.var_a713dcdd8d8d5d12[player.guid])) {
        return player.br_kiosk.var_a713dcdd8d8d5d12[player.guid].var_5b4fdabd6ff8ac60;
    }
    if (isdefined(player.br_kiosk.var_8165379c774fe8e3)) {
        return player.br_kiosk.var_8165379c774fe8e3;
    }
    return level.var_5b4fdabd6ff8ac60;
}

// Namespace namespace_88c3382d02472ceb/namespace_25c7d0f5cb1e4346
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x77d
// Size: 0x21
function private function_dde2ba6e3e9a30f8(player) {
    if (!isdefined(player)) {
        return 0;
    }
    if (!namespace_7e17181d03156026::isreallyalive(player)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_88c3382d02472ceb/namespace_25c7d0f5cb1e4346
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7a6
// Size: 0x13e
function private function_90e06d23e15ccc43(player, var_3771ca82b40bc649) {
    var_8919314d1df8d669 = player namespace_aead94004cf4c147::function_88a168912191ec3e(1, 1, 1);
    if (isdefined(var_8919314d1df8d669)) {
        foreach (indextype, itemtype in var_8919314d1df8d669) {
            if (!itemtype.size) {
                continue;
            }
            foreach (var_e1d097c517c3af5b, slot in itemtype) {
                if (!isdefined(slot)) {
                    continue;
                }
                lootid = slot[0];
                quantity = slot[1];
                if (!istrue(lootid) || !istrue(quantity)) {
                    continue;
                }
                if (lootid != var_3771ca82b40bc649) {
                    continue;
                }
                if (namespace_cb965d2f71fefddc::function_d345eec68e01361f(var_3771ca82b40bc649) && quantity > 0) {
                    quantity = 1;
                }
                return [0:quantity, 1:indextype, 2:var_e1d097c517c3af5b];
            }
        }
    }
    return [0:0, 1:0, 2:0];
}

// Namespace namespace_88c3382d02472ceb/namespace_25c7d0f5cb1e4346
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8ec
// Size: 0x12b
function private function_e59cc32a4f43c5d8(player, amount, itemtype, itemindex) {
    switch (itemtype) {
    case 0:
        plundercount = player.plundercount - amount;
        player namespace_c6ccccd95254983f::playersetplundercount(plundercount);
        break;
    case 1:
        break;
    case 2:
        slot = namespace_1a507865f681850e::function_4967838290cb31b9(itemindex);
        player namespace_1a507865f681850e::decrementequipmentslotammo(slot, amount);
        break;
    case 3:
        player namespace_58a74e7d54b56e8d::removekillstreak(1);
        break;
    case 4:
        player namespace_cb965d2f71fefddc::resetsuper();
        player.equipment["super"] = undefined;
        break;
    case 6:
        player namespace_cb965d2f71fefddc::function_75520ea44545c906();
        namespace_a38a2e1fe7519183::function_777c89585478357b(player);
        break;
    case 7:
        player namespace_cb965d2f71fefddc::removeselfrevivetoken();
        break;
    default:
        /#
            assertmsg("Invalid loadout barter item type: " + itemtype);
        #/
        return;
    }
}

// Namespace namespace_88c3382d02472ceb/namespace_25c7d0f5cb1e4346
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa1e
// Size: 0x5c6
function private function_2f1ef432df69a29b(player, var_a242355f9b40388b) {
    if (!function_dde2ba6e3e9a30f8(player)) {
        return 0;
    }
    var_2e72cf01652b5bd = [];
    if (isdefined(var_a242355f9b40388b.var_41f94bca374ed58a) && var_a242355f9b40388b.var_41f94bca374ed58a > 0) {
        if (!namespace_a38a2e1fe7519183::function_59352c09a417a5e2(player, var_a242355f9b40388b.var_41f94bca374ed58a)) {
            return 0;
        }
    }
    foreach (item in var_a242355f9b40388b.materials) {
        scriptablename = namespace_38b993c4618e76cd::getscriptablefromlootid(item.lootid);
        var_8f0a45a0f5b42b90 = item.lootid;
        if (namespace_cb965d2f71fefddc::function_82d45592d750d388(scriptablename)) {
            var_b835958ce1825933 = namespace_58dcf42cf567f34f::function_475482bfe3feb25(scriptablename);
            var_57ac5dc40b2e5a9 = namespace_58dcf42cf567f34f::function_7d321a63bc56c65c(var_b835958ce1825933, player, 1);
            var_2053e168b46caa6e = var_57ac5dc40b2e5a9[1];
            scriptablename = var_57ac5dc40b2e5a9[0];
            var_8f0a45a0f5b42b90 = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(scriptablename);
        }
        var_99ca2650c284f5c3 = player function_93f02514431a1f5d(var_8f0a45a0f5b42b90);
        var_c00a2c6249962d83 = function_90e06d23e15ccc43(player, var_8f0a45a0f5b42b90);
        loadoutindex = var_c00a2c6249962d83[2];
        loadouttype = var_c00a2c6249962d83[1];
        var_b834cfed17d314a3 = var_c00a2c6249962d83[0];
        var_f53ae6184f353b7 = undefined;
        if (namespace_85cd45b4fe0d86fb::function_c07675f2ce32fcb5(player) && namespace_cb965d2f71fefddc::isdogtag(scriptablename)) {
            var_e6ffedc06591faa4 = namespace_85cd45b4fe0d86fb::function_59771b0cc100410a(player);
            if (var_e6ffedc06591faa4 == scriptablename) {
                var_b834cfed17d314a3++;
                var_f53ae6184f353b7 = 1;
            }
        }
        if (var_99ca2650c284f5c3 + var_b834cfed17d314a3 < item.quantity) {
            return 0;
        }
        var_89955e781d50267a = player function_aeb6f176059d98f5(var_8f0a45a0f5b42b90);
        if (var_89955e781d50267a.size == 0 && var_b834cfed17d314a3 < item.quantity) {
            return 0;
        }
        if (var_99ca2650c284f5c3 >= item.quantity) {
            var_b834cfed17d314a3 = undefined;
            loadoutindex = undefined;
            loadouttype = undefined;
            var_f53ae6184f353b7 = undefined;
        } else {
            var_b834cfed17d314a3 = item.quantity - var_99ca2650c284f5c3;
        }
        var_99ca2650c284f5c3 = int(min(var_99ca2650c284f5c3, item.quantity));
        if (isdefined(var_b834cfed17d314a3)) {
            var_b834cfed17d314a3 = int(min(var_b834cfed17d314a3, item.quantity));
        }
        var_2e72cf01652b5bd[var_2e72cf01652b5bd.size] = [0:var_99ca2650c284f5c3, 1:var_89955e781d50267a, 2:var_b834cfed17d314a3, 3:loadoutindex, 4:loadouttype, 5:var_f53ae6184f353b7];
    }
    foreach (item in var_2e72cf01652b5bd) {
        var_a4f8448f29141288 = item[0];
        foreach (index in item[1]) {
            var_c00a2f624996341c = player function_6738846da50730f1(index);
            quantity = var_c00a2f624996341c[1];
            lootid = var_c00a2f624996341c[0];
            if (namespace_cb965d2f71fefddc::function_d345eec68e01361f(lootid)) {
                var_a4f8448f29141288 = quantity;
            }
            player function_db1dd76061352e5b(index, var_a4f8448f29141288);
            var_a4f8448f29141288 = var_a4f8448f29141288 - quantity;
            if (var_a4f8448f29141288 <= 0) {
                break;
            }
        }
        if (istrue(item[5])) {
            namespace_85cd45b4fe0d86fb::function_bc03aa369196f2bf(player, 0);
        } else {
            if (!isdefined(item[2]) || !isdefined(item[3]) || !isdefined(item[4])) {
                continue;
            }
            function_e59cc32a4f43c5d8(player, item[2], item[4], item[3]);
        }
    }
    scriptablename = var_a242355f9b40388b.var_289245099af802f6;
    if (!isdefined(scriptablename)) {
        scriptablename = namespace_38b993c4618e76cd::getscriptablefromlootid(var_a242355f9b40388b.lootid);
    }
    result = undefined;
    if (!istrue(var_a242355f9b40388b.permanent)) {
        result = player namespace_cb965d2f71fefddc::function_d8cd9c1941a88194(var_a242355f9b40388b.lootid, var_a242355f9b40388b.quantity, var_a242355f9b40388b.var_289245099af802f6);
    }
    if (!istrue(result) && !istrue(var_a242355f9b40388b.permanent)) {
        dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
        if (isdefined(player.br_kiosk)) {
            var_e1d097c517c3af5b = player.br_kiosk namespace_cb965d2f71fefddc::function_4f4d537c794b2bf5();
            player.br_kiosk.dropstruct.var_dfba5a2c3c6f0a07 = var_e1d097c517c3af5b;
            dropstruct = player.br_kiosk.dropstruct;
        }
        baseorigin = player.origin;
        baseangles = player.angles;
        if (isdefined(player.br_kiosk)) {
            baseorigin = function_53c4c53197386572(player.br_kiosk.var_afc028d00356e443, player.br_kiosk.origin);
            baseangles = player.br_kiosk.angles;
        }
        var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, baseorigin, baseangles, player);
        pickup = player namespace_cb965d2f71fefddc::spawnpickup(scriptablename, var_cb4fad49263e20c4, var_a242355f9b40388b.quantity, 1, undefined, 0);
    }
    player namespace_aad14af462a74d08::function_7ba17fb69c312e2c(undefined, scriptablename, var_a242355f9b40388b.lootid, var_a242355f9b40388b.quantity, 0);
    return 1;
}

// Namespace namespace_88c3382d02472ceb/namespace_25c7d0f5cb1e4346
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xfec
// Size: 0x2bc
function private function_f1c3dc8c80e536c4() {
    /#
        level endon("<unknown string>");
        player = level.players[0];
        while (1) {
            var_a073d6e49197691f = getdvarint(@"hash_d0372976df17d33a", 0);
            var_93a9a394196ad59a = getdvarint(@"hash_df5d1d642bd121d0", 0);
            var_27de9f03f6194b9a = getdvarint(@"hash_f77ca612090e125b", 0);
            var_d9acb3895ab8440b = getdvar(@"hash_d61b2e700fcd4a9", "<unknown string>");
            if (var_a073d6e49197691f) {
                setdvar(@"hash_ac9266111b154414", 0);
                if (!isdefined(level.var_5b4fdabd6ff8ac60[var_a073d6e49197691f - 1])) {
                    waitframe();
                    continue;
                }
                var_541d95a3bfa40a1f = level.var_5b4fdabd6ff8ac60[var_a073d6e49197691f - 1];
                function_2f1ef432df69a29b(player, var_541d95a3bfa40a1f);
            } else if (var_93a9a394196ad59a) {
                setdvar(@"hash_df5d1d642bd121d0", 0);
                if (!function_dde2ba6e3e9a30f8(player)) {
                    waitframe();
                    continue;
                }
                var_541d95a3bfa40a1f = level.var_5b4fdabd6ff8ac60[var_93a9a394196ad59a - 1];
                foreach (item in var_541d95a3bfa40a1f.materials) {
                    player namespace_cb965d2f71fefddc::function_d8cd9c1941a88194(item.lootid, item.quantity, undefined, 1);
                }
            } else if (var_d9acb3895ab8440b != "<unknown string>") {
                setdvar(@"hash_d61b2e700fcd4a9", "<unknown string>");
                if (!isdefined(level.br_armory_kiosk) || !isdefined(level.br_armory_kiosk.scriptables)) {
                    waitframe();
                    continue;
                }
                mindist = 999999999999;
                var_1d1479e278ab33db = undefined;
                foreach (kiosk in level.br_armory_kiosk.scriptables) {
                    if (!isdefined(kiosk.origin)) {
                        continue;
                    }
                    var_556b31282abcb132 = distance(kiosk.origin, player.origin);
                    if (var_556b31282abcb132 < mindist) {
                        mindist = var_556b31282abcb132;
                        var_1d1479e278ab33db = kiosk;
                    }
                }
                if (isdefined(var_1d1479e278ab33db)) {
                    if (var_27de9f03f6194b9a) {
                        function_c661afd69dc6cb4d(player, var_1d1479e278ab33db, var_d9acb3895ab8440b);
                    } else {
                        function_45eefc63956143ed(var_1d1479e278ab33db, var_d9acb3895ab8440b);
                    }
                }
            }
            waitframe();
        }
    #/
}

