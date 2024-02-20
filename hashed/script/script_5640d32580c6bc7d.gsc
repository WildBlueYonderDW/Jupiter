// mwiii decomp prototype
#using script_43971bbeefd98f05;
#using script_7b2517368c79e5bc;
#using script_3e2f8cc477d57433;
#using script_1de396bd08617dd4;
#using script_3282f33bea60a32;
#using script_6f74c67411fcab41;
#using script_443d99fe707f1d9f;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\equipment.gsc;
#using script_2669878cf5a1b6bc;

#namespace namespace_e40ee8b394ce404;

// Namespace namespace_e40ee8b394ce404/namespace_c151592cef3b7123
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x270
// Size: 0xa0
function function_cf1b1f86951a9209(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    if (!istrue(instance.var_532eac3c428e5b9b)) {
        return;
    }
    player.var_605f6834e7492317 = 1;
    function_9cd7df4997aea4bf(player, instance);
    instance.var_2bc73315bd31809c[player.guid] = player;
    if (isdefined(instance.usedcallback)) {
        [[ instance.usedcallback ]](instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61);
    }
    function_8f75065bda6ee24a(player, instance);
}

// Namespace namespace_e40ee8b394ce404/namespace_c151592cef3b7123
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x317
// Size: 0x1df
function function_8f75065bda6ee24a(opener, container) {
    var_57accdc40b2f50e = function_438749eb7a7b738(container.contents, opener, container);
    var_77dc0a100921c5a7 = var_57accdc40b2f50e[1];
    items = var_57accdc40b2f50e[0];
    container.contents = items;
    opener.var_2fa5b49969def47 = container;
    opener.var_f2aa9ae949179907 = opener.origin;
    var_b77d74fc05206acd = function_54d1e54b22f3f1f6(container.var_46a3a8565ac0c17c);
    if (isdefined(container.var_bf8e5f003146af44)) {
        opener.var_f2aa9ae949179907 = opener.origin - container.var_bf8e5f003146af44.origin;
    }
    /#
        if (items.size > var_b77d74fc05206acd) {
            println("<unknown string>" + items.size + "<unknown string>" + var_b77d74fc05206acd + "<unknown string>");
        }
    #/
    for (itemindex = 0; itemindex < var_b77d74fc05206acd; itemindex++) {
        if (itemindex <= var_77dc0a100921c5a7) {
            namespace_9b83895815d12835::function_446c7ad7bcc70992(opener, itemindex, items[itemindex].lootid, items[itemindex].quantity, items[itemindex].weapondata);
        } else {
            namespace_9b83895815d12835::function_c7294f5b9b5006d5(opener, itemindex);
        }
    }
    if (!istrue(container.var_febe9aacdd2e47b2) && isdefined(container.contents.var_4f6cde716e0c3d7)) {
        opener setclientomnvar("loot_container_weapon", container.contents.var_4f6cde716e0c3d7);
    }
    opener setclientomnvar("loot_container_open", container.var_46a3a8565ac0c17c);
    container thread namespace_9b83895815d12835::function_71a59f067d5fe986(opener);
    container thread namespace_9b83895815d12835::function_47b931d76ffd028f(opener);
    opener namespace_a655003e419fc731::function_faa3cbec7243fe72();
}

// Namespace namespace_e40ee8b394ce404/namespace_c151592cef3b7123
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x4fd
// Size: 0x93
function function_6207d6f728cee51d(players, container, lootid, quantity, weaponobj, noExtract, force) {
    foreach (player in players) {
        function_4df3c8d739c4b460(player, container, lootid, quantity, weaponobj, noExtract, force);
    }
}

// Namespace namespace_e40ee8b394ce404/namespace_c151592cef3b7123
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x597
// Size: 0xed
function function_9cd7df4997aea4bf(player, container) {
    if (!isdefined(container.contents)) {
        container.contents = [];
    }
    if (!isdefined(container.contents[0])) {
        container.contents[0] = spawnstruct();
        container.contents[0].quantity = 0;
        container.contents[0].lootid = 0;
        if (!istrue(container.var_febe9aacdd2e47b2)) {
            container.contents.var_4f6cde716e0c3d7 = 0;
            container.contents.var_6fb67c8525b1d79e = undefined;
        }
    }
    if (!isdefined(container.var_46a3a8565ac0c17c)) {
        container.var_46a3a8565ac0c17c = function_b2ff0af91e5df8f4(container.type);
    }
}

// Namespace namespace_e40ee8b394ce404/namespace_c151592cef3b7123
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68b
// Size: 0x3f7
function function_4df3c8d739c4b460(player, container, lootid, quantity, weaponobj, noExtract, force) {
    function_9cd7df4997aea4bf(player, container);
    var_57acbdc40b2f2db = function_438749eb7a7b738(container.contents, player, container);
    var_77dc0a100921c5a7 = var_57acbdc40b2f2db[1];
    items = var_57acbdc40b2f2db[0];
    container.contents = items;
    var_b77d74fc05206acd = function_54d1e54b22f3f1f6(container.var_46a3a8565ac0c17c);
    for (i = var_77dc0a100921c5a7 + 1; i < var_b77d74fc05206acd; i++) {
        container.contents[i] = undefined;
    }
    if (lootid == 0 || quantity == 0) {
        return;
    }
    if (isdefined(weaponobj) && !istrue(container.var_febe9aacdd2e47b2)) {
        return;
    }
    var_d54a79024c228770 = container.contents.size;
    var_7745d84dfcf3f0fb = undefined;
    foreach (index, item in container.contents) {
        if (!isdefined(item) || !isdefined(item.quantity) || !isdefined(item.lootid)) {
            continue;
        }
        if (item.lootid == 8395 && lootid == item.lootid) {
            var_d54a79024c228770 = index;
            quantity = quantity + item.quantity;
            var_7745d84dfcf3f0fb = 1;
            break;
        }
        bundlename = namespace_49e179ec476603d6::function_fc925a153c7fd55c(lootid);
        itembundle = getscriptbundle("itemspawnentry:" + bundlename);
        scriptablename = itembundle.scriptable;
        maxcount = itembundle.maxcount;
        if (!isdefined(maxcount) || maxcount == 0) {
            continue;
        }
        if (item.lootid == lootid && quantity + item.quantity <= maxcount) {
            var_d54a79024c228770 = index;
            quantity = quantity + item.quantity;
            var_7745d84dfcf3f0fb = 1;
            break;
        }
    }
    if (var_d54a79024c228770 >= var_b77d74fc05206acd && !isdefined(weaponobj) && !istrue(var_7745d84dfcf3f0fb)) {
        if (istrue(force)) {
            var_879d3e9d5c72b703 = container.contents[0].lootid;
            bundlename = namespace_49e179ec476603d6::function_fc925a153c7fd55c(var_879d3e9d5c72b703);
            itembundle = getscriptbundle("itemspawnentry:" + bundlename);
            namespace_49e179ec476603d6::function_c465d27f3f6066b4(itembundle, container.origin, container.angles);
        } else {
            player hud_message::showerrormessage("MP/BALLOON_EXTRACT_DENY_NO_ROOM");
            return;
        }
    }
    if (isdefined(container.var_6978a4b328fd33b3)) {
        var_57ad1dc40b3000d = [[ container.var_6978a4b328fd33b3 ]](container, player, lootid, quantity);
        var_83d63b00fa6616e7 = var_57ad1dc40b3000d[1];
        lootid = var_57ad1dc40b3000d[0];
        if (isdefined(var_83d63b00fa6616e7)) {
            noExtract = var_83d63b00fa6616e7;
        }
    }
    if (!isdefined(container.contents[var_d54a79024c228770])) {
        namespace_9b83895815d12835::function_6eee0ede493b44e8(container, quantity, lootid);
    } else {
        container.contents[var_d54a79024c228770].quantity = quantity;
        container.contents[var_d54a79024c228770].lootid = lootid;
    }
    if (isdefined(noExtract)) {
        container.contents[var_d54a79024c228770].noExtract = 1;
    } else {
        container.contents[var_d54a79024c228770].noExtract = undefined;
    }
    player function_ce9b69fc041571d2(player, container);
}

// Namespace namespace_e40ee8b394ce404/namespace_c151592cef3b7123
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa89
// Size: 0xe1
function function_7de9a54614a594c3(container, index, var_70e72b82c1885f58) {
    quantity = 1;
    if (!isdefined(var_70e72b82c1885f58)) {
        var_70e72b82c1885f58 = 0;
    }
    lootid = container.contents[index].lootid;
    if (var_70e72b82c1885f58) {
        quantity = container.contents[index].quantity;
    }
    if (container.contents[index].quantity - quantity == 0) {
        container.contents[index].lootid = 0;
    }
    container.contents[index].quantity = container.contents[index].quantity - quantity;
    function_ce9b69fc041571d2(self, container);
}

// Namespace namespace_e40ee8b394ce404/namespace_c151592cef3b7123
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb71
// Size: 0x46d
function function_80bada2833945a7a(itemtype, itemindex, noExtract, var_53aaae2c915f815b) {
    if (!isdefined(var_53aaae2c915f815b)) {
        var_53aaae2c915f815b = 0;
    }
    var_57acedc40b2f974 = function_438749eb7a7b738(self.var_2fa5b49969def47.contents, self, self.var_2fa5b49969def47);
    var_77dc0a100921c5a7 = var_57acedc40b2f974[1];
    items = var_57acedc40b2f974[0];
    self.var_2fa5b49969def47.contents = items;
    var_b77d74fc05206acd = function_54d1e54b22f3f1f6(self.var_2fa5b49969def47.var_46a3a8565ac0c17c);
    for (i = var_77dc0a100921c5a7 + 1; i < var_b77d74fc05206acd; i++) {
        self.var_2fa5b49969def47.contents[i] = undefined;
    }
    container = self.var_2fa5b49969def47;
    if (istrue(self getclientomnvar("loot_container_weapon")) && itemtype == 1) {
        hud_message::showerrormessage("MP/BALLOON_EXTRACT_DENY_NO_ROOM");
        return;
    }
    var_57acfdc40b2fba7 = function_4b1ea8143efb9dd(itemtype, itemindex, var_53aaae2c915f815b);
    weaponobj = var_57acfdc40b2fba7[2];
    quantity = var_57acfdc40b2fba7[1];
    lootid = var_57acfdc40b2fba7[0];
    if (!isdefined(lootid)) {
        return;
    }
    if (lootid == 0 || quantity == 0 && !isdefined(weaponobj)) {
        return;
    }
    var_d54a79024c228770 = container.contents.size;
    var_7745d84dfcf3f0fb = undefined;
    var_94c9b55b80b148ac = quantity;
    foreach (index, item in container.contents) {
        if (!isdefined(item) || !isdefined(item.quantity) || !isdefined(item.lootid)) {
            continue;
        }
        bundlename = namespace_49e179ec476603d6::function_fc925a153c7fd55c(lootid);
        itembundle = getscriptbundle("itemspawnentry:" + bundlename);
        scriptablename = itembundle.scriptable;
        var_7f32fef084a25f04 = quantity + item.quantity;
        if (itembundle.type == "currency" && lootid == item.lootid && var_7f32fef084a25f04 < 2048) {
            var_d54a79024c228770 = index;
            quantity = var_7f32fef084a25f04;
            var_7745d84dfcf3f0fb = 1;
            break;
        }
        maxcount = itembundle.maxcount;
        if (!isdefined(maxcount) || maxcount == 0) {
            continue;
        }
        if (item.lootid == lootid && var_7f32fef084a25f04 <= maxcount) {
            var_d54a79024c228770 = index;
            quantity = var_7f32fef084a25f04;
            var_7745d84dfcf3f0fb = 1;
            break;
        }
    }
    if (var_d54a79024c228770 >= var_b77d74fc05206acd && itemtype != 1 && !istrue(var_7745d84dfcf3f0fb)) {
        hud_message::showerrormessage("MP/BALLOON_EXTRACT_DENY_NO_ROOM");
        return;
    }
    if (isdefined(self.var_2fa5b49969def47.var_6978a4b328fd33b3)) {
        var_57ac5dc40b2e5a9 = [[ self.var_2fa5b49969def47.var_6978a4b328fd33b3 ]](self.var_2fa5b49969def47, self, lootid, quantity, itemtype, itemindex);
        var_83d63b00fa6616e7 = var_57ac5dc40b2e5a9[1];
        lootid = var_57ac5dc40b2e5a9[0];
        if (isdefined(var_83d63b00fa6616e7)) {
            noExtract = var_83d63b00fa6616e7;
        }
    }
    if (!isdefined(self.var_2fa5b49969def47.contents[var_d54a79024c228770])) {
        namespace_9b83895815d12835::function_6eee0ede493b44e8(self.var_2fa5b49969def47, quantity, lootid);
    } else {
        self.var_2fa5b49969def47.contents[var_d54a79024c228770].quantity = quantity;
        self.var_2fa5b49969def47.contents[var_d54a79024c228770].lootid = lootid;
    }
    if (isdefined(noExtract)) {
        self.var_2fa5b49969def47.contents[var_d54a79024c228770].noExtract = 1;
    } else {
        self.var_2fa5b49969def47.contents[var_d54a79024c228770].noExtract = undefined;
    }
    function_ce9b69fc041571d2(self, self.var_2fa5b49969def47);
}

// Namespace namespace_e40ee8b394ce404/namespace_c151592cef3b7123
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfe5
// Size: 0x4c
function function_daa9df3be019b879(lootid) {
    bundlename = namespace_49e179ec476603d6::function_fc925a153c7fd55c(lootid);
    itembundle = getscriptbundle("itemspawnentry:" + bundlename);
    return isdefined(lootid) && itembundle.type == "currency";
}

// Namespace namespace_e40ee8b394ce404/namespace_c151592cef3b7123
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1039
// Size: 0x108
function function_ce9b69fc041571d2(opener, container) {
    var_c00a2c6249962d83 = function_438749eb7a7b738(container.contents, opener, container);
    var_77dc0a100921c5a7 = var_c00a2c6249962d83[1];
    items = var_c00a2c6249962d83[0];
    container.contents = items;
    var_b77d74fc05206acd = function_54d1e54b22f3f1f6(container.var_46a3a8565ac0c17c);
    /#
        if (items.size > var_b77d74fc05206acd) {
            println("<unknown string>" + items.size + "<unknown string>" + var_b77d74fc05206acd + "<unknown string>");
        }
    #/
    for (itemindex = 0; itemindex < var_b77d74fc05206acd; itemindex++) {
        namespace_9b83895815d12835::function_c7294f5b9b5006d5(opener, itemindex);
    }
    for (itemindex = 0; itemindex < var_b77d74fc05206acd; itemindex++) {
        if (itemindex <= var_77dc0a100921c5a7) {
            namespace_9b83895815d12835::function_446c7ad7bcc70992(opener, itemindex, items[itemindex].lootid, items[itemindex].quantity, items[itemindex].weapondata);
        }
    }
}

// Namespace namespace_e40ee8b394ce404/namespace_c151592cef3b7123
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1148
// Size: 0x156
function function_438749eb7a7b738(items, opener, container) {
    /#
        assert(isdefined(items));
    #/
    var_542ab2415c42e657 = [];
    var_47868f432c8fcb6b = 0;
    lastindex = items.size - 1;
    foreach (item in items) {
        quantity = item.quantity;
        lootid = item.lootid;
        team = item.team;
        visibilityCondition = item.visibilityCondition;
        if (isdefined(quantity) && quantity > 0 && isdefined(lootid) && lootid > 0 && (!isdefined(team) || team == opener.team) && (!isdefined(visibilityCondition) || [[ visibilityCondition ]](opener, container))) {
            var_542ab2415c42e657[var_47868f432c8fcb6b] = item;
            var_47868f432c8fcb6b++;
        } else {
            var_542ab2415c42e657[lastindex] = item;
            lastindex--;
        }
    }
    return [0:var_542ab2415c42e657, 1:lastindex];
}

// Namespace namespace_e40ee8b394ce404/namespace_c151592cef3b7123
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12a6
// Size: 0x91
function function_b2ff0af91e5df8f4(scriptablename) {
    var_46a3a8565ac0c17c = 1;
    switch (scriptablename) {
    case #"hash_8387e0bfe22abc5d":
        var_46a3a8565ac0c17c = 15;
        break;
    case #"hash_884fc5db10bac9b3":
        var_46a3a8565ac0c17c = 13;
        break;
    case #"hash_c4e1cdfcbfebe45e":
        var_46a3a8565ac0c17c = 18;
        break;
    case #"hash_7a9b70fe784edb0b":
        var_46a3a8565ac0c17c = 17;
        break;
    case #"hash_cc9e0ca88d6cbd9b":
        var_46a3a8565ac0c17c = 19;
        break;
    default:
        break;
    }
    return var_46a3a8565ac0c17c;
}

// Namespace namespace_e40ee8b394ce404/namespace_c151592cef3b7123
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x133f
// Size: 0x105
function function_54d1e54b22f3f1f6(var_46a3a8565ac0c17c) {
    switch (var_46a3a8565ac0c17c) {
    case 15:
        return (getdvarint(@"hash_823c57ec4dac4069", 4) - getdvarint(@"hash_1d7f857b2cd9dba2", 0));
    case 13:
        return (getdvarint(@"hash_780b498909ad7b76", 4) - getdvarint(@"hash_6ee9465e13d271e5", 0));
    case 18:
        return (getdvarint(@"hash_ca5506ebef1c08c6", 4) - getdvarint(@"hash_e5044e04d13e3266", 0));
    case 17:
        return (getdvarint(@"hash_16335f8c9a65d30f", 4) - getdvarint(@"hash_f09fed6023f0158b", 0));
    case 19:
        return (getdvarint(@"hash_60725a15df4c8b17", 4) - getdvarint(@"hash_ab124095978e89eb", 0));
    default:
        return 10;
        break;
    }
}

// Namespace namespace_e40ee8b394ce404/namespace_c151592cef3b7123
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x144b
// Size: 0x45c
function function_4b1ea8143efb9dd(itemtype, itemindex, var_53aaae2c915f815b) {
    switch (itemtype) {
    case 0:
        break;
    case 1:
        if (itemindex == 2) {
            if (!function_ced2abb96f1d86a5()) {
                return [0:0, 1:0, 2:undefined];
            }
            lootid = function_69df855efa3b5b9e();
            var_ec22a950f210e39 = function_e2b4c63cab73c1f1();
            return [0:lootid, 1:self getweaponammoclip(var_ec22a950f210e39), 2:var_ec22a950f210e39];
        }
        var_ec22a950f210e39 = function_61f99d560d896d24(itemindex);
        if (!isdefined(var_ec22a950f210e39)) {
            return [0:0, 1:0, 2:undefined];
        }
        rootname = namespace_e0ee43ef2dddadaa::getweaponrootname(var_ec22a950f210e39);
        variantid = var_ec22a950f210e39.variantid;
        if (!isdefined(var_ec22a950f210e39.variantid)) {
            variantid = 0;
        }
        lootid = namespace_e0ee43ef2dddadaa::function_79d6e6c22245687a(rootname, variantid);
        return [0:lootid, 1:self getweaponammoclip(var_ec22a950f210e39), 2:var_ec22a950f210e39];
    case 10:
        lootid = function_d870b2c45335bd88(itemindex);
        if (!isdefined(lootid)) {
            return [0:0, 1:0];
        }
        bundlename = function_fc925a153c7fd55c(lootid);
        if (!isdefined(bundlename)) {
            /#
                assertmsg("An item bundle name could not be retrieved for lootID [ " + lootid + " ]");
            #/
            return [0:0, 1:0];
        }
        itembundle = getscriptbundle("itemspawnentry:" + bundlename);
        if (!isdefined(itembundle)) {
            /#
                assertmsg("An item bundle could not be retrieved for the item bundle name [ " + bundlename + " ]");
            #/
            return [0:0, 1:0];
        }
        scriptablename = itembundle.scriptable;
        quantity = 1;
        if (istrue(var_53aaae2c915f815b) || isdefined(scriptablename) && isgasmask(scriptablename)) {
            quantity = namespace_fe9526a81c458d8f::function_5ce7fe3dca9c1a22(itemindex);
        } else {
            quantity = 1;
        }
        return [0:lootid, 1:quantity];
    case 6:
        callbacks = namespace_49e179ec476603d6::function_cca8bbe88a39ad41("gasmask");
        var_c00a2d6249962fb6 = self [[ callbacks.var_df9b308efe82294a ]]();
        quantity = var_c00a2d6249962fb6[1];
        itembundle = var_c00a2d6249962fb6[0];
        lootid = namespace_49e179ec476603d6::function_6d15e119c2779a93(itembundle);
        return [0:lootid, 1:quantity];
    case 7:
        callbacks = namespace_49e179ec476603d6::function_cca8bbe88a39ad41("revive");
        var_c00a30624996364f = self [[ callbacks.var_df9b308efe82294a ]]();
        quantity = var_c00a30624996364f[1];
        itembundle = var_c00a30624996364f[0];
        lootid = namespace_49e179ec476603d6::function_6d15e119c2779a93(itembundle);
        return [0:lootid, 1:quantity];
    case 2:
        slot = equipment::function_4967838290cb31b9(itemindex);
        item_type = "lethal";
        if (slot == "secondary") {
            item_type = "tactical";
        }
        if (slot == "health") {
            item_type = "armor";
        }
        callbacks = namespace_49e179ec476603d6::function_cca8bbe88a39ad41(item_type);
        var_c00a2f624996341c = self [[ callbacks.var_df9b308efe82294a ]]();
        var_ff239359935aa777 = var_c00a2f624996341c[1];
        itembundle = var_c00a2f624996341c[0];
        lootid = namespace_49e179ec476603d6::function_6d15e119c2779a93(itembundle);
        quantity = 0;
        if (var_ff239359935aa777 >= 1) {
            quantity = 1;
        }
        if (istrue(var_53aaae2c915f815b)) {
            quantity = var_ff239359935aa777;
        }
        return [0:lootid, 1:quantity];
    case 3:
        var_c00a326249963ab5 = namespace_de169b8ad93c38b5::function_d6029511a9d0984();
        quantity = var_c00a326249963ab5[1];
        itembundle = var_c00a326249963ab5[0];
        lootid = namespace_49e179ec476603d6::function_6d15e119c2779a93(itembundle);
        return [0:lootid, 1:quantity];
    case 4:
        item_type = "super";
        callbacks = namespace_49e179ec476603d6::function_cca8bbe88a39ad41(item_type);
        var_c00a316249963882 = self [[ callbacks.var_df9b308efe82294a ]]();
        quantity = var_c00a316249963882[1];
        itembundle = var_c00a316249963882[0];
        lootid = namespace_49e179ec476603d6::function_6d15e119c2779a93(itembundle);
        if (!isdefined(lootid)) {
            return [0:undefined, 1:undefined, 2:undefined];
        }
        return [0:lootid, 1:quantity];
    default:
        /#
            assertmsg("Invalid quick drop item type: " + itemtype);
        #/
        return;
    }
}

// Namespace namespace_e40ee8b394ce404/namespace_c151592cef3b7123
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18ae
// Size: 0xd
function isgasmask(scriptablename) {
    return 0;
}

// Namespace namespace_e40ee8b394ce404/namespace_c151592cef3b7123
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18c3
// Size: 0xc6
function function_5711a00587f71794(player) {
    var_a5dd524a90e1907c = player namespace_9b83895815d12835::function_d6041f45fee8083d();
    if (!var_a5dd524a90e1907c) {
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
    case 17:
    case 18:
    case 19:
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace namespace_e40ee8b394ce404/namespace_c151592cef3b7123
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1990
// Size: 0xae
function function_c44440af852c483(player) {
    var_a5dd524a90e1907c = player namespace_9b83895815d12835::function_d6041f45fee8083d();
    if (!var_a5dd524a90e1907c) {
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
    case 17:
    case 18:
    case 19:
        return 0;
    default:
        return 1;
        break;
    }
}

// Namespace namespace_e40ee8b394ce404/namespace_c151592cef3b7123
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a45
// Size: 0xbf
function function_1225f23a18664f4c(player) {
    var_a5dd524a90e1907c = player namespace_9b83895815d12835::function_d6041f45fee8083d();
    if (!var_a5dd524a90e1907c) {
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

// Namespace namespace_e40ee8b394ce404/namespace_c151592cef3b7123
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b0b
// Size: 0xda
function function_564c579ae581a82d(contents) {
    var_1c1dd30a3c77139c = [];
    foreach (key, item in contents) {
        var_1c1dd30a3c77139c[key] = spawnstruct();
        var_1c1dd30a3c77139c[key].lootid = item.lootid;
        var_1c1dd30a3c77139c[key].quantity = item.quantity;
        var_1c1dd30a3c77139c[key].index = item.index;
        if (isdefined(item.noExtract)) {
            var_1c1dd30a3c77139c[key].noExtract = item.noExtract;
        }
    }
    return var_1c1dd30a3c77139c;
}

