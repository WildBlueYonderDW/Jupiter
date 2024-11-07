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

// Namespace namespace_e40ee8b394ce404 / namespace_c151592cef3b7123
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x2a7
// Size: 0x9f
function function_cf1b1f86951a9209(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    if (!istrue(instance.var_532eac3c428e5b9b)) {
        return;
    }
    player.var_605f6834e7492317 = 1;
    function_9cd7df4997aea4bf(player, instance);
    instance.playeropen[player.guid] = player;
    if (isdefined(instance.usedcallback)) {
        [[ instance.usedcallback ]](instance, part, state, player, var_a5b2c541413aa895, usestring);
    }
    function_8f75065bda6ee24a(player, instance);
}

// Namespace namespace_e40ee8b394ce404 / namespace_c151592cef3b7123
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x34e
// Size: 0x1db
function function_8f75065bda6ee24a(opener, container) {
    var_57accdc40b2f50e = function_438749eb7a7b738(container.contents, opener, container);
    lastvalidindex = var_57accdc40b2f50e[1];
    items = var_57accdc40b2f50e[0];
    container.contents = items;
    opener.var_2fa5b49969def47 = container;
    opener.var_f2aa9ae949179907 = opener.origin;
    containersize = function_54d1e54b22f3f1f6(container.containertype);
    if (isdefined(container.linkedparent)) {
        opener.var_f2aa9ae949179907 = opener.origin - container.linkedparent.origin;
    }
    /#
        if (items.size > containersize) {
            println("<dev string:x1c>" + items.size + "<dev string:x53>" + containersize + "<dev string:x6f>");
        }
    #/
    for (itemindex = 0; itemindex < containersize; itemindex++) {
        if (itemindex <= lastvalidindex) {
            common_cache::function_446c7ad7bcc70992(opener, itemindex, items[itemindex].lootid, items[itemindex].quantity, items[itemindex].weapondata);
            continue;
        }
        common_cache::function_c7294f5b9b5006d5(opener, itemindex);
    }
    if (!istrue(container.noweaponslot) && isdefined(container.contents.weaponslotcontents)) {
        opener setclientomnvar("loot_container_weapon", container.contents.weaponslotcontents);
    }
    opener setclientomnvar("loot_container_open", container.containertype);
    container thread common_cache::function_71a59f067d5fe986(opener);
    container thread common_cache::function_47b931d76ffd028f(opener);
    opener calloutmarkerping::function_faa3cbec7243fe72();
}

// Namespace namespace_e40ee8b394ce404 / namespace_c151592cef3b7123
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x531
// Size: 0x91
function function_6207d6f728cee51d(players, container, lootid, quantity, weaponobj, noextract, force) {
    foreach (player in players) {
        function_4df3c8d739c4b460(player, container, lootid, quantity, weaponobj, noextract, force);
    }
}

// Namespace namespace_e40ee8b394ce404 / namespace_c151592cef3b7123
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5ca
// Size: 0xec
function function_9cd7df4997aea4bf(player, container) {
    if (!isdefined(container.contents)) {
        container.contents = [];
    }
    if (!isdefined(container.contents[0])) {
        container.contents[0] = spawnstruct();
        container.contents[0].quantity = 0;
        container.contents[0].lootid = 0;
        if (!istrue(container.noweaponslot)) {
            container.contents.weaponslotcontents = 0;
            container.contents.weaponslotobj = undefined;
        }
    }
    if (!isdefined(container.containertype)) {
        container.containertype = function_b2ff0af91e5df8f4(container.type);
    }
}

// Namespace namespace_e40ee8b394ce404 / namespace_c151592cef3b7123
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x6be
// Size: 0x3e7
function function_4df3c8d739c4b460(player, container, lootid, quantity, weaponobj, noextract, force) {
    function_9cd7df4997aea4bf(player, container);
    var_57acbdc40b2f2db = function_438749eb7a7b738(container.contents, player, container);
    lastvalidindex = var_57acbdc40b2f2db[1];
    items = var_57acbdc40b2f2db[0];
    container.contents = items;
    containersize = function_54d1e54b22f3f1f6(container.containertype);
    for (i = lastvalidindex + 1; i < containersize; i++) {
        container.contents[i] = undefined;
    }
    if (lootid == 0 || quantity == 0) {
        return;
    }
    if (isdefined(weaponobj) && !istrue(container.noweaponslot)) {
        return;
    }
    containerindex = container.contents.size;
    canstack = undefined;
    foreach (index, item in container.contents) {
        if (!isdefined(item) || !isdefined(item.quantity) || !isdefined(item.lootid)) {
            continue;
        }
        if (item.lootid == 8395 && lootid == item.lootid) {
            containerindex = index;
            quantity += item.quantity;
            canstack = 1;
            break;
        }
        bundlename = common_item::function_fc925a153c7fd55c(lootid);
        itembundle = getscriptbundle("itemspawnentry:" + bundlename);
        scriptablename = itembundle.scriptable;
        maxcount = itembundle.maxcount;
        if (!isdefined(maxcount) || maxcount == 0) {
            continue;
        }
        if (item.lootid == lootid && quantity + item.quantity <= maxcount) {
            containerindex = index;
            quantity += item.quantity;
            canstack = 1;
            break;
        }
    }
    if (containerindex >= containersize && !isdefined(weaponobj) && !istrue(canstack)) {
        if (istrue(force)) {
            containerlootid = container.contents[0].lootid;
            bundlename = common_item::function_fc925a153c7fd55c(containerlootid);
            itembundle = getscriptbundle("itemspawnentry:" + bundlename);
            common_item::function_c465d27f3f6066b4(itembundle, container.origin, container.angles);
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
            noextract = var_83d63b00fa6616e7;
        }
    }
    if (!isdefined(container.contents[containerindex])) {
        common_cache::function_6eee0ede493b44e8(container, quantity, lootid);
    } else {
        container.contents[containerindex].quantity = quantity;
        container.contents[containerindex].lootid = lootid;
    }
    if (isdefined(noextract)) {
        container.contents[containerindex].noextract = 1;
    } else {
        container.contents[containerindex].noextract = undefined;
    }
    player function_ce9b69fc041571d2(player, container);
}

// Namespace namespace_e40ee8b394ce404 / namespace_c151592cef3b7123
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xaad
// Size: 0xe0
function function_7de9a54614a594c3(container, index, removeall) {
    quantity = 1;
    if (!isdefined(removeall)) {
        removeall = 0;
    }
    lootid = container.contents[index].lootid;
    if (removeall) {
        quantity = container.contents[index].quantity;
    }
    if (container.contents[index].quantity - quantity == 0) {
        container.contents[index].lootid = 0;
    }
    container.contents[index].quantity = container.contents[index].quantity - quantity;
    function_ce9b69fc041571d2(self, container);
}

// Namespace namespace_e40ee8b394ce404 / namespace_c151592cef3b7123
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xb95
// Size: 0x457
function function_80bada2833945a7a(itemtype, itemindex, noextract, dropall) {
    if (!isdefined(dropall)) {
        dropall = 0;
    }
    var_57acedc40b2f974 = function_438749eb7a7b738(self.var_2fa5b49969def47.contents, self, self.var_2fa5b49969def47);
    lastvalidindex = var_57acedc40b2f974[1];
    items = var_57acedc40b2f974[0];
    self.var_2fa5b49969def47.contents = items;
    containersize = function_54d1e54b22f3f1f6(self.var_2fa5b49969def47.containertype);
    for (i = lastvalidindex + 1; i < containersize; i++) {
        self.var_2fa5b49969def47.contents[i] = undefined;
    }
    container = self.var_2fa5b49969def47;
    if (istrue(self getclientomnvar("loot_container_weapon")) && itemtype == 1) {
        hud_message::showerrormessage("MP/BALLOON_EXTRACT_DENY_NO_ROOM");
        return;
    }
    var_57acfdc40b2fba7 = function_4b1ea8143efb9dd(itemtype, itemindex, dropall);
    weaponobj = var_57acfdc40b2fba7[2];
    quantity = var_57acfdc40b2fba7[1];
    lootid = var_57acfdc40b2fba7[0];
    if (!isdefined(lootid)) {
        return;
    }
    if (lootid == 0 || quantity == 0 && !isdefined(weaponobj)) {
        return;
    }
    containerindex = container.contents.size;
    canstack = undefined;
    droppedquantity = quantity;
    foreach (index, item in container.contents) {
        if (!isdefined(item) || !isdefined(item.quantity) || !isdefined(item.lootid)) {
            continue;
        }
        bundlename = common_item::function_fc925a153c7fd55c(lootid);
        itembundle = getscriptbundle("itemspawnentry:" + bundlename);
        scriptablename = itembundle.scriptable;
        totalquantity = quantity + item.quantity;
        if (itembundle.type == "currency" && lootid == item.lootid && totalquantity < 2048) {
            containerindex = index;
            quantity = totalquantity;
            canstack = 1;
            break;
        }
        maxcount = itembundle.maxcount;
        if (!isdefined(maxcount) || maxcount == 0) {
            continue;
        }
        if (item.lootid == lootid && totalquantity <= maxcount) {
            containerindex = index;
            quantity = totalquantity;
            canstack = 1;
            break;
        }
    }
    if (containerindex >= containersize && itemtype != 1 && !istrue(canstack)) {
        hud_message::showerrormessage("MP/BALLOON_EXTRACT_DENY_NO_ROOM");
        return;
    }
    if (isdefined(self.var_2fa5b49969def47.var_6978a4b328fd33b3)) {
        var_57ac5dc40b2e5a9 = [[ self.var_2fa5b49969def47.var_6978a4b328fd33b3 ]](self.var_2fa5b49969def47, self, lootid, quantity, itemtype, itemindex);
        var_83d63b00fa6616e7 = var_57ac5dc40b2e5a9[1];
        lootid = var_57ac5dc40b2e5a9[0];
        if (isdefined(var_83d63b00fa6616e7)) {
            noextract = var_83d63b00fa6616e7;
        }
    }
    if (!isdefined(self.var_2fa5b49969def47.contents[containerindex])) {
        common_cache::function_6eee0ede493b44e8(self.var_2fa5b49969def47, quantity, lootid);
    } else {
        self.var_2fa5b49969def47.contents[containerindex].quantity = quantity;
        self.var_2fa5b49969def47.contents[containerindex].lootid = lootid;
    }
    if (isdefined(noextract)) {
        self.var_2fa5b49969def47.contents[containerindex].noextract = 1;
    } else {
        self.var_2fa5b49969def47.contents[containerindex].noextract = undefined;
    }
    function_ce9b69fc041571d2(self, self.var_2fa5b49969def47);
}

// Namespace namespace_e40ee8b394ce404 / namespace_c151592cef3b7123
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xff4
// Size: 0x4b
function function_daa9df3be019b879(lootid) {
    bundlename = common_item::function_fc925a153c7fd55c(lootid);
    itembundle = getscriptbundle("itemspawnentry:" + bundlename);
    return isdefined(lootid) && itembundle.type == "currency";
}

// Namespace namespace_e40ee8b394ce404 / namespace_c151592cef3b7123
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1048
// Size: 0x104
function function_ce9b69fc041571d2(opener, container) {
    var_c00a2c6249962d83 = function_438749eb7a7b738(container.contents, opener, container);
    lastvalidindex = var_c00a2c6249962d83[1];
    items = var_c00a2c6249962d83[0];
    container.contents = items;
    containersize = function_54d1e54b22f3f1f6(container.containertype);
    /#
        if (items.size > containersize) {
            println("<dev string:x1c>" + items.size + "<dev string:x53>" + containersize + "<dev string:x6f>");
        }
    #/
    for (itemindex = 0; itemindex < containersize; itemindex++) {
        common_cache::function_c7294f5b9b5006d5(opener, itemindex);
    }
    for (itemindex = 0; itemindex < containersize; itemindex++) {
        if (itemindex <= lastvalidindex) {
            common_cache::function_446c7ad7bcc70992(opener, itemindex, items[itemindex].lootid, items[itemindex].quantity, items[itemindex].weapondata);
        }
    }
}

// Namespace namespace_e40ee8b394ce404 / namespace_c151592cef3b7123
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1154
// Size: 0x14d
function function_438749eb7a7b738(items, opener, container) {
    assert(isdefined(items));
    validitems = [];
    firstindex = 0;
    lastindex = items.size - 1;
    foreach (item in items) {
        quantity = item.quantity;
        lootid = item.lootid;
        team = item.team;
        visibilityCondition = item.visibilityCondition;
        if (isdefined(quantity) && quantity > 0 && isdefined(lootid) && lootid > 0 && (!isdefined(team) || team == opener.team) && (!isdefined(visibilityCondition) || [[ visibilityCondition ]](opener, container))) {
            validitems[firstindex] = item;
            firstindex++;
            continue;
        }
        validitems[lastindex] = item;
        lastindex--;
    }
    return [validitems, lastindex];
}

// Namespace namespace_e40ee8b394ce404 / namespace_c151592cef3b7123
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12aa
// Size: 0xca
function function_b2ff0af91e5df8f4(scriptablename) {
    containertype = 1;
    switch (scriptablename) {
    case #"hash_8387e0bfe22abc5d":
        containertype = 15;
        break;
    case #"hash_884fc5db10bac9b3":
        containertype = 13;
        break;
    case #"hash_c4e1cdfcbfebe45e":
        containertype = 18;
        break;
    case #"hash_7a9b70fe784edb0b":
        containertype = 17;
        break;
    case #"hash_cc9e0ca88d6cbd9b":
        containertype = 19;
        break;
    case #"hash_70401edca74af4ba":
        containertype = 19;
        break;
    case #"hash_c3bde42c4152cd33":
        containertype = 19;
        break;
    case #"hash_415e65d890f08790":
        containertype = 19;
        break;
    default:
        break;
    }
    return containertype;
}

// Namespace namespace_e40ee8b394ce404 / namespace_c151592cef3b7123
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x137d
// Size: 0x104
function function_54d1e54b22f3f1f6(containertype) {
    switch (containertype) {
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
    }
}

// Namespace namespace_e40ee8b394ce404 / namespace_c151592cef3b7123
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1489
// Size: 0x458
function function_4b1ea8143efb9dd(itemtype, itemindex, dropall) {
    switch (itemtype) {
    case 0:
        return [0, 0];
    case 1:
        if (itemindex == 2) {
            if (!function_ced2abb96f1d86a5()) {
                return [0, 0, undefined];
            }
            lootid = function_69df855efa3b5b9e();
            var_ec22a950f210e39 = function_e2b4c63cab73c1f1();
            return [lootid, self getweaponammoclip(var_ec22a950f210e39), var_ec22a950f210e39];
        }
        var_ec22a950f210e39 = function_61f99d560d896d24(itemindex);
        if (!isdefined(var_ec22a950f210e39)) {
            return [0, 0, undefined];
        }
        rootname = namespace_e0ee43ef2dddadaa::getweaponrootname(var_ec22a950f210e39);
        variantid = var_ec22a950f210e39.variantid;
        if (!isdefined(var_ec22a950f210e39.variantid)) {
            variantid = 0;
        }
        lootid = namespace_e0ee43ef2dddadaa::function_79d6e6c22245687a(rootname, variantid);
        return [lootid, self getweaponammoclip(var_ec22a950f210e39), var_ec22a950f210e39];
    case 10:
        lootid = function_d870b2c45335bd88(itemindex);
        if (!isdefined(lootid)) {
            return [0, 0];
        }
        bundlename = function_fc925a153c7fd55c(lootid);
        if (!isdefined(bundlename)) {
            assertmsg("<dev string:x74>" + lootid + "<dev string:xb0>");
            return [0, 0];
        }
        itembundle = getscriptbundle("itemspawnentry:" + bundlename);
        if (!isdefined(itembundle)) {
            assertmsg("<dev string:xb6>" + bundlename + "<dev string:xb0>");
            return [0, 0];
        }
        scriptablename = itembundle.scriptable;
        quantity = 1;
        if (istrue(dropall) || isdefined(scriptablename) && isgasmask(scriptablename)) {
            quantity = common_inventory::function_5ce7fe3dca9c1a22(itemindex);
        } else {
            quantity = 1;
        }
        return [lootid, quantity];
    case 6:
        callbacks = common_item::function_cca8bbe88a39ad41("gasmask");
        var_c00a2d6249962fb6 = self [[ callbacks.var_df9b308efe82294a ]]();
        quantity = var_c00a2d6249962fb6[1];
        itembundle = var_c00a2d6249962fb6[0];
        lootid = common_item::function_6d15e119c2779a93(itembundle);
        return [lootid, quantity];
    case 7:
        callbacks = common_item::function_cca8bbe88a39ad41("revive");
        var_c00a30624996364f = self [[ callbacks.var_df9b308efe82294a ]]();
        quantity = var_c00a30624996364f[1];
        itembundle = var_c00a30624996364f[0];
        lootid = common_item::function_6d15e119c2779a93(itembundle);
        return [lootid, quantity];
    case 2:
        slot = equipment::function_4967838290cb31b9(itemindex);
        item_type = "lethal";
        if (slot == "secondary") {
            item_type = "tactical";
        }
        if (slot == "health") {
            item_type = "armor";
        }
        callbacks = common_item::function_cca8bbe88a39ad41(item_type);
        var_c00a2f624996341c = self [[ callbacks.var_df9b308efe82294a ]]();
        currentquantity = var_c00a2f624996341c[1];
        itembundle = var_c00a2f624996341c[0];
        lootid = common_item::function_6d15e119c2779a93(itembundle);
        quantity = 0;
        if (currentquantity >= 1) {
            quantity = 1;
        }
        if (istrue(dropall)) {
            quantity = currentquantity;
        }
        return [lootid, quantity];
    case 3:
        var_c00a326249963ab5 = namespace_de169b8ad93c38b5::function_d6029511a9d0984();
        quantity = var_c00a326249963ab5[1];
        itembundle = var_c00a326249963ab5[0];
        lootid = common_item::function_6d15e119c2779a93(itembundle);
        return [lootid, quantity];
    case 4:
        item_type = "super";
        callbacks = common_item::function_cca8bbe88a39ad41(item_type);
        var_c00a316249963882 = self [[ callbacks.var_df9b308efe82294a ]]();
        quantity = var_c00a316249963882[1];
        itembundle = var_c00a316249963882[0];
        lootid = common_item::function_6d15e119c2779a93(itembundle);
        if (!isdefined(lootid)) {
            return [undefined, undefined, undefined];
        }
        return [lootid, quantity];
    default:
        assertmsg("<dev string:xfb>" + itemtype);
        return;
    }
}

// Namespace namespace_e40ee8b394ce404 / namespace_c151592cef3b7123
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18e9
// Size: 0xc
function isgasmask(scriptablename) {
    return false;
}

// Namespace namespace_e40ee8b394ce404 / namespace_c151592cef3b7123
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18fe
// Size: 0xc5
function function_5711a00587f71794(player) {
    var_a5dd524a90e1907c = player common_cache::function_d6041f45fee8083d();
    if (!var_a5dd524a90e1907c) {
        return 0;
    }
    if (!isdefined(player.var_2fa5b49969def47)) {
        return 0;
    }
    if (!isdefined(player.var_2fa5b49969def47.containertype)) {
        return 0;
    }
    containertype = player.var_2fa5b49969def47.containertype;
    switch (containertype) {
    case 13:
    case 15:
    case 17:
    case 18:
    case 19:
        return 1;
    default:
        return 0;
    }
}

// Namespace namespace_e40ee8b394ce404 / namespace_c151592cef3b7123
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x19cb
// Size: 0xad
function function_c44440af852c483(player) {
    var_a5dd524a90e1907c = player common_cache::function_d6041f45fee8083d();
    if (!var_a5dd524a90e1907c) {
        return 0;
    }
    if (!isdefined(player.var_2fa5b49969def47)) {
        return 0;
    }
    if (!isdefined(player.var_2fa5b49969def47.containertype)) {
        return 0;
    }
    containertype = player.var_2fa5b49969def47.containertype;
    switch (containertype) {
    case 17:
    case 18:
    case 19:
        return 0;
    default:
        return 1;
    }
}

// Namespace namespace_e40ee8b394ce404 / namespace_c151592cef3b7123
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a80
// Size: 0xbe
function function_1225f23a18664f4c(player) {
    var_a5dd524a90e1907c = player common_cache::function_d6041f45fee8083d();
    if (!var_a5dd524a90e1907c) {
        return 0;
    }
    if (!isdefined(player.var_2fa5b49969def47)) {
        return 0;
    }
    if (!isdefined(player.var_2fa5b49969def47.containertype)) {
        return 0;
    }
    containertype = player.var_2fa5b49969def47.containertype;
    switch (containertype) {
    case 15:
        return getdvarint(@"hash_6ee9465e13d271e5", 0);
    case 13:
        return getdvarint(@"hash_1d7f857b2cd9dba2", 0);
    default:
        return 0;
    }
}

// Namespace namespace_e40ee8b394ce404 / namespace_c151592cef3b7123
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b46
// Size: 0xd7
function function_564c579ae581a82d(contents) {
    var_1c1dd30a3c77139c = [];
    foreach (key, item in contents) {
        var_1c1dd30a3c77139c[key] = spawnstruct();
        var_1c1dd30a3c77139c[key].lootid = item.lootid;
        var_1c1dd30a3c77139c[key].quantity = item.quantity;
        var_1c1dd30a3c77139c[key].index = item.index;
        if (isdefined(item.noextract)) {
            var_1c1dd30a3c77139c[key].noextract = item.noextract;
        }
    }
    return var_1c1dd30a3c77139c;
}

