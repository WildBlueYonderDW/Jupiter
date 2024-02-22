// mwiii decomp prototype
#using scripts\mp\loot.gsc;
#using script_600b944a95c3a7bf;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\hud_message.gsc;
#using script_b7a9ce0a2282b79;
#using scripts\mp\utility\weapon.gsc;
#using scripts\engine\utility.gsc;
#using script_2d9d24f7c63ac143;
#using script_2391409ef7b431e1;
#using scripts\mp\gametypes\br_public.gsc;

#namespace namespace_e40ee8b394ce404;

// Namespace namespace_e40ee8b394ce404/namespace_92fc655e328c1a9f
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17e
// Size: 0x82
function function_cf1b1f86951a9209(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    function_9cd7df4997aea4bf(player, instance);
    instance.var_2bc73315bd31809c[player.guid] = player;
    if (isdefined(instance.usedcallback)) {
        [[ instance.usedcallback ]](instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61);
    }
    function_30f5ea60517f9e06(player, instance);
}

// Namespace namespace_e40ee8b394ce404/namespace_92fc655e328c1a9f
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x207
// Size: 0x93
function function_6207d6f728cee51d(players, container, lootid, quantity, weaponobj, noextract, force) {
    foreach (player in players) {
        function_4df3c8d739c4b460(player, container, lootid, quantity, weaponobj, noextract, force);
    }
}

// Namespace namespace_e40ee8b394ce404/namespace_92fc655e328c1a9f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a1
// Size: 0x113
function function_9cd7df4997aea4bf(player, container) {
    if (!function_e3081772bbf7a51c(player, container)) {
        var_46a3a8565ac0c17c = function_b2ff0af91e5df8f4(container.type);
        function_cf0b3e7d1e5a3274(player, container, var_46a3a8565ac0c17c);
        container.var_556db0b72a96514e[player.guid].contents[0] = [];
        container.var_556db0b72a96514e[player.guid].contents[0]["quantity"] = 0;
        container.var_556db0b72a96514e[player.guid].contents[0]["lootID"] = 0;
        if (!istrue(container.var_febe9aacdd2e47b2)) {
            container.var_556db0b72a96514e[player.guid].var_4f6cde716e0c3d7 = 0;
            container.var_556db0b72a96514e[player.guid].var_6fb67c8525b1d79e = undefined;
        }
    }
}

// Namespace namespace_e40ee8b394ce404/namespace_92fc655e328c1a9f
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bb
// Size: 0x52b
function function_4df3c8d739c4b460(player, container, lootid, quantity, weaponobj, noextract, force, var_30f9866cd8907775) {
    function_9cd7df4997aea4bf(player, container);
    var_57acadc40b2f0a8 = function_438749eb7a7b738(container.var_556db0b72a96514e[player.guid].contents, player, container);
    var_77dc0a100921c5a7 = var_57acadc40b2f0a8[1];
    items = var_57acadc40b2f0a8[0];
    container.var_556db0b72a96514e[player.guid].contents = items;
    var_b77d74fc05206acd = function_54d1e54b22f3f1f6(container);
    for (i = var_77dc0a100921c5a7 + 1; i < var_b77d74fc05206acd; i++) {
        container.var_556db0b72a96514e[player.guid].contents[i] = undefined;
    }
    if (lootid == 0 || quantity == 0) {
        return;
    }
    if (isdefined(weaponobj) && !istrue(container.var_febe9aacdd2e47b2)) {
        if (function_3689ee4697dd6347(player, container)) {
            function_a0952bc59c9afa3f(player, container.var_556db0b72a96514e[player.guid], weaponobj, lootid, quantity, undefined, noextract);
        } else {
            function_67be8d119fa22135(container.var_556db0b72a96514e[player.guid], lootid, weaponobj, undefined, noextract, quantity, undefined);
        }
        return;
    }
    var_d54a79024c228770 = container.var_556db0b72a96514e[player.guid].contents.size;
    var_7745d84dfcf3f0fb = undefined;
    foreach (index, item in container.var_556db0b72a96514e[player.guid].contents) {
        if (!isdefined(item) || !isdefined(item["quantity"]) || !isdefined(item["lootID"])) {
            continue;
        }
        if (item["lootID"] == 8395 && lootid == item["lootID"]) {
            var_d54a79024c228770 = index;
            quantity = quantity + item["quantity"];
            var_7745d84dfcf3f0fb = 1;
            break;
        }
        scriptablename = namespace_38b993c4618e76cd::getscriptablefromlootid(lootid);
        maxcount = level.br_pickups.var_4138f9ddc1cd22d[scriptablename];
        if (!isdefined(maxcount) || maxcount == 0) {
            maxcount = level.br_pickups.maxcounts[scriptablename];
        }
        if (!isdefined(maxcount) || maxcount == 0) {
            continue;
        }
        if (item["lootID"] == lootid && quantity + item["quantity"] <= maxcount) {
            var_d54a79024c228770 = index;
            quantity = quantity + item["quantity"];
            var_7745d84dfcf3f0fb = 1;
            break;
        }
    }
    if (var_d54a79024c228770 >= var_b77d74fc05206acd && !isdefined(weaponobj) && !istrue(var_7745d84dfcf3f0fb)) {
        if (istrue(force)) {
            var_d54a79024c228770 = 0;
            var_879d3e9d5c72b703 = container.var_556db0b72a96514e[player.guid].contents[var_d54a79024c228770]["lootID"];
            var_ea1dcc638e88b8c9 = container.var_556db0b72a96514e[player.guid].contents[var_d54a79024c228770]["quantity"];
            scriptablename = namespace_38b993c4618e76cd::getscriptablefromlootid(var_879d3e9d5c72b703);
            dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
            var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, container.origin, container.angles);
            namespace_cb965d2f71fefddc::spawnpickup(scriptablename, var_cb4fad49263e20c4, var_ea1dcc638e88b8c9);
        } else {
            player namespace_44abc05161e2e2cb::showerrormessage("MP/BALLOON_EXTRACT_DENY_NO_ROOM");
            return;
        }
    }
    if (isdefined(container.var_6978a4b328fd33b3)) {
        var_57ad0dc40b2fdda = [[ container.var_6978a4b328fd33b3 ]](container, player, lootid, quantity, undefined, undefined, var_d54a79024c228770);
        var_83d63b00fa6616e7 = var_57ad0dc40b2fdda[1];
        lootid = var_57ad0dc40b2fdda[0];
        if (istrue(var_83d63b00fa6616e7)) {
            noextract = var_83d63b00fa6616e7;
        }
    }
    container.var_556db0b72a96514e[player.guid].contents[var_d54a79024c228770]["quantity"] = quantity;
    container.var_556db0b72a96514e[player.guid].contents[var_d54a79024c228770]["lootID"] = lootid;
    if (istrue(noextract)) {
        container.var_556db0b72a96514e[player.guid].contents[var_d54a79024c228770]["noExtract"] = 1;
    } else {
        container.var_556db0b72a96514e[player.guid].contents[var_d54a79024c228770]["noExtract"] = undefined;
    }
}

// Namespace namespace_e40ee8b394ce404/namespace_92fc655e328c1a9f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ed
// Size: 0x608
function function_80bada2833945a7a(itemtype, itemindex, noextract, var_53aaae2c915f815b) {
    var_57ad1dc40b3000d = function_438749eb7a7b738(self.var_2fa5b49969def47.var_556db0b72a96514e[self.guid].contents, self, self.var_2fa5b49969def47);
    var_77dc0a100921c5a7 = var_57ad1dc40b3000d[1];
    items = var_57ad1dc40b3000d[0];
    self.var_2fa5b49969def47.var_556db0b72a96514e[self.guid].contents = items;
    var_b77d74fc05206acd = function_54d1e54b22f3f1f6(self.var_2fa5b49969def47);
    for (i = var_77dc0a100921c5a7 + 1; i < var_b77d74fc05206acd; i++) {
        self.var_2fa5b49969def47.var_556db0b72a96514e[self.guid].contents[i] = undefined;
    }
    container = self.var_2fa5b49969def47.var_556db0b72a96514e[self.guid];
    var_98f7ce981bb1f93c = namespace_3f0ea7483345a2c0::function_d6a3266145bab76d("loot_container_weapon");
    if (istrue(var_98f7ce981bb1f93c) && itemtype == 1) {
        namespace_44abc05161e2e2cb::showerrormessage("MP/BALLOON_EXTRACT_DENY_NO_ROOM");
        return;
    }
    var_57acedc40b2f974 = function_4b1ea8143efb9dd(itemtype, itemindex, var_53aaae2c915f815b);
    weaponobj = var_57acedc40b2f974[2];
    quantity = var_57acedc40b2f974[1];
    lootid = var_57acedc40b2f974[0];
    if (!isdefined(lootid) || namespace_a38a2e1fe7519183::function_a3bbd9874f6a5599(lootid)) {
        return;
    }
    if (lootid == 0 || quantity == 0 && !isdefined(weaponobj)) {
        return;
    }
    if (itemtype == 1 && isdefined(weaponobj)) {
        if (namespace_68e641469fde3fa7::function_1e9278ba699927f7(weaponobj)) {
            return;
        }
        metadata = undefined;
        if (namespace_a38a2e1fe7519183::function_e0fc1230452cf4e7()) {
            metadata = namespace_a38a2e1fe7519183::function_74031e3249a6f69e(self, itemindex);
        }
        var_d00f368c9df807cf = undefined;
        if (weaponobj.hasalternate) {
            altweapon = weaponobj getaltweapon();
            if (isdefined(altweapon)) {
                var_d00f368c9df807cf = self getweaponammoclip(altweapon);
            }
        }
        var_9bfc8a67e4e991bc = undefined;
        if (namespace_68e641469fde3fa7::isakimbo(weaponobj)) {
            var_9bfc8a67e4e991bc = self getweaponammoclip(weaponobj, "left");
        }
        function_a0952bc59c9afa3f(self, self.var_2fa5b49969def47.var_556db0b72a96514e[self.guid], weaponobj, lootid, itemtype, itemindex, quantity, metadata, noextract, var_d00f368c9df807cf, var_9bfc8a67e4e991bc);
        return;
    }
    var_d54a79024c228770 = container.contents.size;
    var_7745d84dfcf3f0fb = undefined;
    var_94c9b55b80b148ac = quantity;
    foreach (index, item in container.contents) {
        if (!isdefined(item) || !isdefined(item["quantity"]) || !isdefined(item["lootID"])) {
            continue;
        }
        var_7f32fef084a25f04 = quantity + item["quantity"];
        if (item["lootID"] == 8395 && lootid == item["lootID"] && var_7f32fef084a25f04 < 4095) {
            var_d54a79024c228770 = index;
            quantity = var_7f32fef084a25f04;
            var_7745d84dfcf3f0fb = 1;
            break;
        }
        scriptablename = namespace_38b993c4618e76cd::getscriptablefromlootid(lootid);
        maxcount = level.br_pickups.var_4138f9ddc1cd22d[scriptablename];
        if (!isdefined(maxcount) || maxcount == 0) {
            maxcount = level.br_pickups.maxcounts[scriptablename];
        }
        if (!isdefined(maxcount) || maxcount == 0) {
            continue;
        }
        if (item["lootID"] == lootid && var_7f32fef084a25f04 <= maxcount && var_7f32fef084a25f04 < 4095) {
            var_d54a79024c228770 = index;
            quantity = var_7f32fef084a25f04;
            var_7745d84dfcf3f0fb = 1;
            break;
        }
    }
    if (var_d54a79024c228770 >= var_b77d74fc05206acd && itemtype != 1 && !istrue(var_7745d84dfcf3f0fb)) {
        namespace_44abc05161e2e2cb::showerrormessage("MP/BALLOON_EXTRACT_DENY_NO_ROOM");
        return;
    }
    if (isdefined(self.var_2fa5b49969def47.var_6978a4b328fd33b3)) {
        var_57ac4dc40b2e376 = [[ self.var_2fa5b49969def47.var_6978a4b328fd33b3 ]](self.var_2fa5b49969def47, self, lootid, quantity, itemtype, itemindex, var_d54a79024c228770);
        var_83d63b00fa6616e7 = var_57ac4dc40b2e376[1];
        lootid = var_57ac4dc40b2e376[0];
        if (istrue(var_83d63b00fa6616e7)) {
            noextract = var_83d63b00fa6616e7;
        }
    }
    if (namespace_cb965d2f71fefddc::function_34af0f77c1668dba(lootid)) {
        thread namespace_cb965d2f71fefddc::function_8aab3cda02f81c09(self, itemtype, undefined, 1, var_94c9b55b80b148ac);
    } else if (istrue(var_53aaae2c915f815b) && !namespace_cb965d2f71fefddc::function_f96674ba1a1ec2b3(lootid)) {
        thread namespace_cb965d2f71fefddc::quickdropall(itemtype, itemindex, 1);
    } else {
        thread namespace_cb965d2f71fefddc::quickdropitem(itemtype, itemindex, 1);
    }
    self.var_2fa5b49969def47.var_556db0b72a96514e[self.guid].contents[var_d54a79024c228770]["quantity"] = quantity;
    self.var_2fa5b49969def47.var_556db0b72a96514e[self.guid].contents[var_d54a79024c228770]["lootID"] = lootid;
    if (istrue(noextract)) {
        self.var_2fa5b49969def47.var_556db0b72a96514e[self.guid].contents[var_d54a79024c228770]["noExtract"] = 1;
    } else {
        self.var_2fa5b49969def47.var_556db0b72a96514e[self.guid].contents[var_d54a79024c228770]["noExtract"] = undefined;
    }
    function_ce9b69fc041571d2(self, self.var_2fa5b49969def47);
    scriptablename = namespace_38b993c4618e76cd::getscriptablefromlootid(lootid);
    if (namespace_cb965d2f71fefddc::function_282d89f7705a2d63(scriptablename)) {
        namespace_cb965d2f71fefddc::function_bfc82c27ed3d9308(undefined, undefined, scriptablename, itemindex);
    }
}

// Namespace namespace_e40ee8b394ce404/namespace_92fc655e328c1a9f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xefc
// Size: 0x135
function function_ce9b69fc041571d2(opener, container) {
    var_57ac5dc40b2e5a9 = function_438749eb7a7b738(container.var_556db0b72a96514e[opener.guid].contents, opener, container);
    var_77dc0a100921c5a7 = var_57ac5dc40b2e5a9[1];
    items = var_57ac5dc40b2e5a9[0];
    container.var_556db0b72a96514e[opener.guid].contents = items;
    var_b77d74fc05206acd = function_54d1e54b22f3f1f6(container);
    /#
        if (items.size > var_b77d74fc05206acd) {
            println("<unknown string>" + items.size + "<unknown string>" + var_b77d74fc05206acd + "<unknown string>");
        }
    #/
    for (itemindex = 0; itemindex < var_b77d74fc05206acd; itemindex++) {
        function_c7294f5b9b5006d5(opener, itemindex);
    }
    for (itemindex = 0; itemindex < var_b77d74fc05206acd; itemindex++) {
        if (itemindex <= var_77dc0a100921c5a7) {
            function_446c7ad7bcc70992(opener, container.var_556db0b72a96514e[opener.guid], itemindex, items[itemindex]["lootID"], items[itemindex]["quantity"], items[itemindex]["ref"]);
        }
    }
}

// Namespace namespace_e40ee8b394ce404/namespace_92fc655e328c1a9f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1038
// Size: 0x64
function function_b2ff0af91e5df8f4(scriptablename) {
    var_46a3a8565ac0c17c = 1;
    switch (scriptablename) {
    case #"hash_8387e0bfe22abc5d":
    case #"hash_f1db14019ca6a516":
        var_46a3a8565ac0c17c = 15;
        break;
    case #"hash_884fc5db10bac9b3":
        var_46a3a8565ac0c17c = 13;
        break;
    default:
        break;
    }
    return var_46a3a8565ac0c17c;
}

// Namespace namespace_e40ee8b394ce404/namespace_92fc655e328c1a9f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10a4
// Size: 0x99
function function_54d1e54b22f3f1f6(container) {
    var_46a3a8565ac0c17c = container.var_46a3a8565ac0c17c;
    var_697150cb1ffefabb = namespace_3c37cb17ade254d::ter_op(!istrue(container.var_febe9aacdd2e47b2), 1, 0);
    switch (var_46a3a8565ac0c17c) {
    case 15:
        return (getdvarint(@"hash_823c57ec4dac4069", 4) - var_697150cb1ffefabb);
    case 13:
        return (getdvarint(@"hash_780b498909ad7b76", 4) - var_697150cb1ffefabb);
    default:
        return 10;
        break;
    }
}

// Namespace namespace_e40ee8b394ce404/namespace_92fc655e328c1a9f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1144
// Size: 0x1a7
function function_4b1ea8143efb9dd(itemtype, itemindex, var_53aaae2c915f815b) {
    switch (itemtype) {
    case 10:
        lootid = namespace_aead94004cf4c147::function_6196d9ea9a30e609(itemindex);
        if (!isdefined(lootid)) {
            return [0:0, 1:0];
        }
        scriptablename = namespace_38b993c4618e76cd::getscriptablefromlootid(lootid);
        quantity = 1;
        if (namespace_85cd45b4fe0d86fb::function_3c17a26ce6a4668(lootid)) {
            var_c00a2c6249962d83 = namespace_85cd45b4fe0d86fb::function_379463a84adb07b4(quantity);
            var_dab81ead77442a10 = var_c00a2c6249962d83[2];
            var_59bd51afc73df2cd = var_c00a2c6249962d83[1];
            quantity = var_c00a2c6249962d83[0];
        } else if (istrue(var_53aaae2c915f815b) || namespace_cb965d2f71fefddc::function_d345eec68e01361f(lootid)) {
            quantity = namespace_aead94004cf4c147::function_897b29adb37f06a7(itemindex);
        } else if (isdefined(scriptablename) && namespace_d3d40f75bb4e4c32::isammo(scriptablename)) {
            quantity = int(min(namespace_aead94004cf4c147::function_897b29adb37f06a7(itemindex), level.br_pickups.counts[scriptablename]));
        } else {
            quantity = 1;
        }
        return [0:lootid, 1:quantity];
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 6:
    case 7:
        return namespace_aead94004cf4c147::function_cf1bef64e94f2d1a(itemtype, itemindex, 1, 1, !istrue(var_53aaae2c915f815b));
    default:
        /#
            assertmsg("Invalid quick drop item type: " + itemtype);
        #/
        return;
    }
}

// Namespace namespace_e40ee8b394ce404/namespace_92fc655e328c1a9f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12f2
// Size: 0x96
function function_5711a00587f71794(player) {
    if (!function_6f45e7311f77eac4(player)) {
        return 0;
    }
    if (!isdefined(player.var_2fa5b49969def47)) {
        return 0;
    }
    if (!isdefined(player.var_2fa5b49969def47.var_46a3a8565ac0c17c)) {
        return 0;
    }
    var_46a3a8565ac0c17c = player.var_2fa5b49969def47.var_46a3a8565ac0c17c;
    switch (var_46a3a8565ac0c17c) {
    case 13:
    case 15:
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace namespace_e40ee8b394ce404/namespace_92fc655e328c1a9f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x138f
// Size: 0x76
function function_3689ee4697dd6347(player, container) {
    if (!function_5711a00587f71794(player)) {
        return 0;
    }
    if (player.var_2fa5b49969def47.var_46a3a8565ac0c17c != container.var_46a3a8565ac0c17c) {
        return 0;
    }
    if (!isdefined(container.var_2bc73315bd31809c) || !isdefined(container.var_2bc73315bd31809c[player.guid])) {
        return 0;
    }
    return 1;
}

// Namespace namespace_e40ee8b394ce404/namespace_92fc655e328c1a9f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x140d
// Size: 0xb3
function function_1225f23a18664f4c(player) {
    if (!function_6f45e7311f77eac4(player)) {
        return 0;
    }
    if (!isdefined(player.var_2fa5b49969def47)) {
        return 0;
    }
    if (!isdefined(player.var_2fa5b49969def47.var_46a3a8565ac0c17c)) {
        return 0;
    }
    var_46a3a8565ac0c17c = player.var_2fa5b49969def47.var_46a3a8565ac0c17c;
    switch (var_46a3a8565ac0c17c) {
    case 15:
        return getdvarint(@"hash_6ee9465e13d271e5", 0);
    case 13:
        return getdvarint(@"hash_1d7f857b2cd9dba2", 0);
    default:
        return 0;
        break;
    }
}

// Namespace namespace_e40ee8b394ce404/namespace_92fc655e328c1a9f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14c7
// Size: 0xc6
function function_564c579ae581a82d(contents) {
    var_1c1dd30a3c77139c = [];
    foreach (key, item in contents) {
        var_1c1dd30a3c77139c[key] = spawnstruct();
        var_1c1dd30a3c77139c[key].lootid = item["lootID"];
        var_1c1dd30a3c77139c[key].quantity = item["quantity"];
        var_1c1dd30a3c77139c[key].index = item["index"];
        if (isdefined(item["noExtract"])) {
            var_1c1dd30a3c77139c[key].noextract = item["noExtract"];
        }
    }
    return var_1c1dd30a3c77139c;
}

