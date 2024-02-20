// mwiii decomp prototype
#using script_b7a9ce0a2282b79;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\mp\gametypes\br_analytics.gsc;
#using script_3bf3f0172d4a2247;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using script_12668187dcf15b96;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using script_600b944a95c3a7bf;
#using script_2d9d24f7c63ac143;
#using script_6fc415ff6a905dc1;

#namespace namespace_55d169675fb220b4;

// Namespace namespace_55d169675fb220b4/namespace_6499f2212dc52bbd
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x4bb
// Size: 0xc1
function private function_d220ff97de9bb9e9(lootid, var_a06806243448e2c7) {
    if (getdvarint(@"hash_fb7f8a822cd99fc", 1) == 0) {
        return 0;
    }
    var_f9b6541ac6e9f8b9 = namespace_cb965d2f71fefddc::isvaluable(var_a06806243448e2c7) || namespace_cb965d2f71fefddc::function_eac097ce4c683ab9(var_a06806243448e2c7);
    if (!var_f9b6541ac6e9f8b9) {
        return 0;
    }
    if (function_10440574d3361667(lootid) <= 0) {
        return 0;
    }
    var_c899bf54d501193c = [0:"brloot_valuable_goldbar"];
    foreach (entry in var_c899bf54d501193c) {
        if (entry == var_a06806243448e2c7) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_55d169675fb220b4/namespace_6499f2212dc52bbd
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x584
// Size: 0x92
function private setBackpackItem(lootid, pickup) {
    if (function_d220ff97de9bb9e9(lootid, pickup.scriptablename)) {
        var_95ba1f30ea5d8a76 = function_10440574d3361667(lootid);
        var_fec4228317afe4ff = var_95ba1f30ea5d8a76 * pickup.count;
        namespace_c6ccccd95254983f::playerplunderpickup(var_fec4228317afe4ff);
        namespace_a011fbf6d93f25e5::trackcashevent(self, "loot", var_fec4228317afe4ff);
        return 0;
    } else if (namespace_cb965d2f71fefddc::function_9e686ab118ac7725(pickup.scriptablename)) {
        namespace_5aecb7b921208f15::function_94a5ca57b9bc1d23(pickup);
        return 0;
    } else {
        return -1;
    }
}

// Namespace namespace_55d169675fb220b4/namespace_6499f2212dc52bbd
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x61d
// Size: 0x56
function private shouldRevokeBackpackItemOnExfil(var_25978461c6e4f61b) {
    return !(namespace_cb965d2f71fefddc::function_82d45592d750d388(var_25978461c6e4f61b) || namespace_cb965d2f71fefddc::function_a38e261031751c09(var_25978461c6e4f61b) || namespace_cb965d2f71fefddc::function_16a5ebe82e3f2286(var_25978461c6e4f61b) || namespace_cb965d2f71fefddc::function_b989edd9af4f42c7(var_25978461c6e4f61b) || namespace_cb965d2f71fefddc::function_d7c5786a0c42ef6c(var_25978461c6e4f61b) || namespace_cb965d2f71fefddc::issuperpickup(var_25978461c6e4f61b) || namespace_cb965d2f71fefddc::iskillstreak(var_25978461c6e4f61b));
}

// Namespace namespace_55d169675fb220b4/namespace_6499f2212dc52bbd
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x67b
// Size: 0x37
function private canItemFitInBackpack(lootid, var_a06806243448e2c7, quantity, maxcount) {
    if (function_d220ff97de9bb9e9(lootid, var_a06806243448e2c7)) {
        return 1;
    } else {
        return undefined;
    }
}

// Namespace namespace_55d169675fb220b4/namespace_6499f2212dc52bbd
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x6b9
// Size: 0x36
function private getAutoPickupQuantity(lootid, var_a06806243448e2c7, quantity, maxcount) {
    if (function_d220ff97de9bb9e9(lootid, var_a06806243448e2c7)) {
        return 0;
    } else {
        return undefined;
    }
}

// Namespace namespace_55d169675fb220b4/namespace_6499f2212dc52bbd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6f6
// Size: 0x69
function init() {
    namespace_71073fa38f11492::registerbrgametypefunc("setBackpackItem", &setBackpackItem);
    namespace_71073fa38f11492::registerbrgametypefunc("getAutoPickupQuantity", &getAutoPickupQuantity);
    namespace_71073fa38f11492::registerbrgametypefunc("canItemFitInBackpack", &canItemFitInBackpack);
    namespace_71073fa38f11492::registerbrgametypefunc("shouldRevokeBackpackItemOnExfil", &shouldRevokeBackpackItemOnExfil);
    if (namespace_a38a2e1fe7519183::function_e0fc1230452cf4e7()) {
        function_d2c13fc95e4e8962(1);
        namespace_a38a2e1fe7519183::init();
    }
    /#
        function_225667c119b5512d();
    #/
}

// Namespace namespace_55d169675fb220b4/namespace_6499f2212dc52bbd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x766
// Size: 0x4a
function function_c227bd210d16e07c(player, context) {
    namespace_36be7f9eab6ca7bc::function_e1b1d2af636da618("EXGM Inventory (finalizeInstanceInventory): player='%s' context='%s', .inventoryFinalized='%s', .extracted='%s'", player.name, context, player.var_84d661ff601a2f9f, player.extracted);
    namespace_d696adde758cbe79::function_c227bd210d16e07c(player);
}

// Namespace namespace_55d169675fb220b4/namespace_6499f2212dc52bbd
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x7b7
// Size: 0x3
function private function_63bffcbc307b499() {
    
}

// Namespace namespace_55d169675fb220b4/namespace_6499f2212dc52bbd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7c1
// Size: 0x209
function function_3d69400b651b76da(player) {
    namespace_36be7f9eab6ca7bc::function_e1b1d2af636da618("EXGM Inventory (onInfil): player '%s' BEGIN", player.name);
    if (namespace_a38a2e1fe7519183::function_e0fc1230452cf4e7()) {
        namespace_b16531563568eaba::function_33366ade5697aa38(player);
        namespace_b16531563568eaba::function_8d65122ea2e88ecd(player);
        /#
            namespace_36be7f9eab6ca7bc::function_e1b1d2af636da618("EXGM Inventory (sellPlayerItems): player '%s' had $%s loose cash", player.name);
            player namespace_a38a2e1fe7519183::function_e64d9a42c66018c9(player);
        #/
    }
    var_78311d69ed34c252 = function_d5a68db48f43ba18(player);
    /#
        foreach (var_7e40f334147fa597, itemlist in var_78311d69ed34c252) {
            foreach (item in itemlist) {
                scriptablename = namespace_38b993c4618e76cd::getScriptableFromLootID(item.lootid);
                namespace_36be7f9eab6ca7bc::function_e1b1d2af636da618("<unknown string>", player.name, item.quantity, scriptablename, item.lootid, var_7e40f334147fa597);
            }
        }
    #/
    var_a14b720d29c34b48 = function_d4da37abcaec5fca(var_78311d69ed34c252);
    player dlog_recordplayerevent("dlog_event_exgm_player_infil", [0:"inventory", 1:var_a14b720d29c34b48.var_f2d8b23b08f684cb, 2:"inventory_quantity", 3:var_a14b720d29c34b48.var_c03ff9876291acd3, 4:"infil_pos_x", 5:player.origin[0], 6:"infil_pos_y", 7:player.origin[1], 8:"infil_pos_z", 9:player.origin[2]]);
    namespace_36be7f9eab6ca7bc::function_e1b1d2af636da618("EXGM Inventory (onInfil): player '%s' END", player.name);
}

// Namespace namespace_55d169675fb220b4/namespace_6499f2212dc52bbd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9d1
// Size: 0x26
function function_8b39e363ca709341() {
    if (namespace_a38a2e1fe7519183::function_e0fc1230452cf4e7()) {
        namespace_a38a2e1fe7519183::function_c1bb256c7473f345(self);
    } else {
        namespace_aead94004cf4c147::function_bab1a10b3fdaae51();
        namespace_aead94004cf4c147::function_590202daf6a1d4d7(self);
    }
}

// Namespace namespace_55d169675fb220b4/namespace_6499f2212dc52bbd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9fe
// Size: 0x15d
function onSuccessfulExtract(player) {
    namespace_36be7f9eab6ca7bc::function_e1b1d2af636da618("EXGM Inventory (onSuccessfulExtract): player '%s' BEGIN", player.name);
    /#
        if (namespace_a38a2e1fe7519183::function_e0fc1230452cf4e7()) {
            namespace_36be7f9eab6ca7bc::function_e1b1d2af636da618("<unknown string>", player.name);
            player namespace_a38a2e1fe7519183::function_e64d9a42c66018c9(player);
        }
    #/
    var_78311d69ed34c252 = function_d5a68db48f43ba18(player);
    var_fec4228317afe4ff = function_dfa39169979c22d8(player, var_78311d69ed34c252);
    var_a14b720d29c34b48 = function_d4da37abcaec5fca(var_78311d69ed34c252);
    player dlog_recordplayerevent("dlog_event_exgm_player_exfil", [0:"total_cash_value", 1:var_fec4228317afe4ff, 2:"cash", 3:player.plundercount, 4:"inventory", 5:var_a14b720d29c34b48.var_f2d8b23b08f684cb, 6:"inventory_quantity", 7:var_a14b720d29c34b48.var_c03ff9876291acd3, 8:"exfil_pos_x", 9:player.origin[0], 10:"exfil_pos_y", 11:player.origin[1], 12:"exfil_pos_z", 13:player.origin[2]]);
    function_c227bd210d16e07c(player, "onSuccessfulExtract");
    namespace_36be7f9eab6ca7bc::function_e1b1d2af636da618("EXGM Inventory (onSuccessfulExtract): player '%s' END", player.name);
}

// Namespace namespace_55d169675fb220b4/namespace_6499f2212dc52bbd
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xb62
// Size: 0x37
function private function_d5a68db48f43ba18(player) {
    var_287cbf8914b9d46c = [];
    var_287cbf8914b9d46c["loadout"] = player namespace_512200f0f9e6ebc9::function_9cd290910c24d4d3();
    var_287cbf8914b9d46c["backpack"] = player namespace_aead94004cf4c147::function_254150d1e667dee7();
    return var_287cbf8914b9d46c;
}

// Namespace namespace_55d169675fb220b4/namespace_6499f2212dc52bbd
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xba1
// Size: 0x167
function private function_d4da37abcaec5fca(var_78311d69ed34c252) {
    result = spawnstruct();
    result.var_f2d8b23b08f684cb = [];
    result.var_c03ff9876291acd3 = [];
    foreach (itemlist in var_78311d69ed34c252) {
        foreach (item in itemlist) {
            scriptablename = namespace_38b993c4618e76cd::getScriptableFromLootID(item.lootid);
            if (isdefined(scriptablename)) {
                result.var_f2d8b23b08f684cb[result.var_f2d8b23b08f684cb.size] = scriptablename;
            } else {
                result.var_f2d8b23b08f684cb[result.var_f2d8b23b08f684cb.size] = "Invalid scriptable name, loot ID: " + item.lootid;
            }
            result.var_c03ff9876291acd3[result.var_c03ff9876291acd3.size] = item.quantity;
        }
    }
    /#
        assert(result.var_f2d8b23b08f684cb.size < 21);
    #/
    return result;
}

// Namespace namespace_55d169675fb220b4/namespace_6499f2212dc52bbd
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xd10
// Size: 0x247
function private function_dfa39169979c22d8(player, var_78311d69ed34c252) {
    namespace_36be7f9eab6ca7bc::function_e1b1d2af636da618("EXGM Inventory (sellPlayerItems): player '%s' BEGIN", player.name);
    var_fec4228317afe4ff = 0;
    namespace_36be7f9eab6ca7bc::function_e1b1d2af636da618("EXGM Inventory (sellPlayerItems): player '%s' had $%s loose cash", player.name, player.plundercount);
    var_fec4228317afe4ff = var_fec4228317afe4ff + player.plundercount;
    player setplayerdata("jupiter_exgm", "lootedCash", player.plundercount);
    foreach (var_7e40f334147fa597, itemlist in var_78311d69ed34c252) {
        foreach (item in itemlist) {
            scriptablename = namespace_38b993c4618e76cd::getScriptableFromLootID(item.lootid);
            var_38aa5958a501629d = isdefined(scriptablename) && (namespace_cb965d2f71fefddc::isvaluable(scriptablename) || namespace_cb965d2f71fefddc::function_eac097ce4c683ab9(scriptablename));
            if (!var_38aa5958a501629d) {
                itemtype = undefined;
                if (isdefined(scriptablename)) {
                    itemtype = level.br_pickups.br_itemtype[scriptablename];
                }
                /#
                    namespace_36be7f9eab6ca7bc::function_e1b1d2af636da618("<unknown string>", scriptablename, item.lootid, var_7e40f334147fa597, player.name, itemtype);
                #/
            } else {
                var_95ba1f30ea5d8a76 = function_10440574d3361667(item.lootid);
                var_12740f4650a020e2 = var_95ba1f30ea5d8a76 * item.quantity;
                var_fec4228317afe4ff = var_fec4228317afe4ff + var_12740f4650a020e2;
                /#
                    namespace_36be7f9eab6ca7bc::function_e1b1d2af636da618("<unknown string>", player.name, item.quantity, scriptablename, item.lootid, var_7e40f334147fa597, var_12740f4650a020e2, var_95ba1f30ea5d8a76, item.quantity);
                #/
            }
        }
    }
    function_b59c29bc25734ddf(player, var_fec4228317afe4ff);
    namespace_36be7f9eab6ca7bc::function_e1b1d2af636da618("EXGM Inventory (sellPlayerItems): player '%s' END", player.name);
    return var_fec4228317afe4ff;
}

// Namespace namespace_55d169675fb220b4/namespace_6499f2212dc52bbd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf5f
// Size: 0x4d
function function_10440574d3361667(lootid) {
    scriptablename = namespace_38b993c4618e76cd::getScriptableFromLootID(lootid);
    if (!isdefined(scriptablename)) {
        return 0;
    }
    var_b87f7fae01ce754f = level.br_pickups.var_d93566a78e29d583[scriptablename];
    if (!isdefined(var_b87f7fae01ce754f)) {
        return 0;
    }
    return var_b87f7fae01ce754f;
}

// Namespace namespace_55d169675fb220b4/namespace_6499f2212dc52bbd
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xfb4
// Size: 0x3
function private function_1c18fdd44dc52444() {
    
}

// Namespace namespace_55d169675fb220b4/namespace_6499f2212dc52bbd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfbe
// Size: 0x28
function function_d5fef0fcb4508f0a(player) {
    var_9384de78bb3039fb = player getplayerdata("jupiter_exgm", "dollars");
    return var_9384de78bb3039fb;
}

// Namespace namespace_55d169675fb220b4/namespace_6499f2212dc52bbd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xfee
// Size: 0x3e
function function_56476767182e6c0e(player, var_68a57894bd5c848) {
    namespace_36be7f9eab6ca7bc::function_e1b1d2af636da618("EXGM Inventory (setWalletAmount): player '%s', newWalletAmount=%s", player.name, var_68a57894bd5c848);
    player setplayerdata("jupiter_exgm", "dollars", var_68a57894bd5c848);
}

// Namespace namespace_55d169675fb220b4/namespace_6499f2212dc52bbd
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1033
// Size: 0x60
function function_b59c29bc25734ddf(player, var_64ad08fc292d8716) {
    var_9384de78bb3039fb = function_d5fef0fcb4508f0a(player);
    var_68a57894bd5c848 = var_9384de78bb3039fb + var_64ad08fc292d8716;
    if (var_68a57894bd5c848 < 0) {
        var_68a57894bd5c848 = 0;
    }
    namespace_36be7f9eab6ca7bc::function_e1b1d2af636da618("EXGM Inventory (adjustWalletAmount): player '%s', cur=%s delta=%s new=%s", player.name, var_9384de78bb3039fb, var_64ad08fc292d8716, var_68a57894bd5c848);
    function_56476767182e6c0e(player, var_68a57894bd5c848);
}

// Namespace namespace_55d169675fb220b4/namespace_6499f2212dc52bbd
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x109a
// Size: 0x3
function private function_7d2c407c71fe805b() {
    
}

// Namespace namespace_55d169675fb220b4/namespace_6499f2212dc52bbd
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x10a4
// Size: 0x1aa
function function_a2415c12f0dccc7b(player, var_2b465f51da1e8fcf, var_2b465e51da1e8d9c, var_6b92729cd2d4b6a6) {
    /#
        var_2aeb10326cc4122b = "<unknown string>" + player.name;
        var_cd8110645a9a2632 = [0:"<unknown string>", 1:"<unknown string>", 2:"<unknown string>", 3:"<unknown string>", 4:"<unknown string>", 5:"<unknown string>"];
        var_871bdbc7e5abb341 = [];
        for (i = 0; i < 50; i++) {
            lootid = player getplayerdata(level.var_5d69837cf4db0407, "<unknown string>", i, "<unknown string>");
            quantity = player getplayerdata(level.var_5d69837cf4db0407, "<unknown string>", i, "<unknown string>");
            var_6a2f907d62daf47b = player getplayerdata(level.var_5d69837cf4db0407, "<unknown string>", i, "<unknown string>");
            scriptablename = namespace_38b993c4618e76cd::getScriptableFromLootID(lootid);
            value = function_10440574d3361667(lootid);
            var_871bdbc7e5abb341[var_871bdbc7e5abb341.size] = [0:i, 1:lootid, 2:scriptablename, 3:quantity, 4:var_6a2f907d62daf47b, 5:value];
        }
        textcolor = (1, 0, 0);
        textscale = 1;
        return namespace_36be7f9eab6ca7bc::function_b1ea22d278623807(var_2b465f51da1e8fcf, var_2b465e51da1e8d9c, var_2aeb10326cc4122b, var_cd8110645a9a2632, var_871bdbc7e5abb341, textcolor, textscale, var_6b92729cd2d4b6a6);
    #/
}

// Namespace namespace_55d169675fb220b4/namespace_6499f2212dc52bbd
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1255
// Size: 0x194
function function_408da9b4e0f08fb2(player, var_2b465f51da1e8fcf, var_2b465e51da1e8d9c, var_6b92729cd2d4b6a6) {
    /#
        var_2aeb10326cc4122b = "<unknown string>" + player.name;
        var_cd8110645a9a2632 = [0:"<unknown string>", 1:"<unknown string>", 2:"<unknown string>", 3:"<unknown string>", 4:"<unknown string>"];
        var_871bdbc7e5abb341 = [];
        var_4ff6e95896e65939 = player namespace_aead94004cf4c147::function_254150d1e667dee7();
        foreach (item in var_4ff6e95896e65939) {
            var_d53771808585d4da = namespace_38b993c4618e76cd::getScriptableFromLootID(item.lootid);
            itemvalue = function_10440574d3361667(item.lootid);
            var_871bdbc7e5abb341[var_871bdbc7e5abb341.size] = [0:item.index, 1:item.lootid, 2:var_d53771808585d4da, 3:item.quantity, 4:itemvalue];
        }
        textcolor = (1, 0, 0);
        textscale = 1;
        return namespace_36be7f9eab6ca7bc::function_b1ea22d278623807(var_2b465f51da1e8fcf, var_2b465e51da1e8d9c, var_2aeb10326cc4122b, var_cd8110645a9a2632, var_871bdbc7e5abb341, textcolor, textscale, var_6b92729cd2d4b6a6);
    #/
}

// Namespace namespace_55d169675fb220b4/namespace_6499f2212dc52bbd
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x13f0
// Size: 0x17c
function function_3d87fb81fa720ae2(player, var_2b465f51da1e8fcf, var_2b465e51da1e8d9c, var_6b92729cd2d4b6a6) {
    /#
        var_2aeb10326cc4122b = "<unknown string>" + player.name;
        var_cd8110645a9a2632 = [0:"<unknown string>", 1:"<unknown string>", 2:"<unknown string>", 3:"<unknown string>"];
        var_871bdbc7e5abb341 = [];
        var_bf23a60678978c19 = player namespace_512200f0f9e6ebc9::function_9cd290910c24d4d3();
        foreach (item in var_bf23a60678978c19) {
            var_d53771808585d4da = namespace_38b993c4618e76cd::getScriptableFromLootID(item.lootid);
            itemvalue = function_10440574d3361667(item.lootid);
            var_871bdbc7e5abb341[var_871bdbc7e5abb341.size] = [0:item.lootid, 1:var_d53771808585d4da, 2:item.quantity, 3:itemvalue];
        }
        textcolor = (1, 0, 0);
        textscale = 1;
        return namespace_36be7f9eab6ca7bc::function_b1ea22d278623807(var_2b465f51da1e8fcf, var_2b465e51da1e8d9c, var_2aeb10326cc4122b, var_cd8110645a9a2632, var_871bdbc7e5abb341, textcolor, textscale, var_6b92729cd2d4b6a6);
    #/
}

// Namespace namespace_55d169675fb220b4/namespace_6499f2212dc52bbd
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1573
// Size: 0x3
function private function_7262087a8dc78555() {
    
}

// Namespace namespace_55d169675fb220b4/namespace_6499f2212dc52bbd
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x157d
// Size: 0x6
function private function_225667c119b5512d() {
    /#
    #/
}

