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

// Namespace namespace_e40ee8b394ce404 / namespace_92fc655e328c1a9f
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x19f
// Size: 0x81
function function_cf1b1f86951a9209(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    function_9cd7df4997aea4bf(player, instance);
    instance.playeropen[player.guid] = player;
    if (isdefined(instance.usedcallback)) {
        [[ instance.usedcallback ]](instance, part, state, player, var_a5b2c541413aa895, usestring);
    }
    function_30f5ea60517f9e06(player, instance);
}

// Namespace namespace_e40ee8b394ce404 / namespace_92fc655e328c1a9f
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x228
// Size: 0x91
function function_6207d6f728cee51d(players, container, lootid, quantity, weaponobj, noextract, force) {
    foreach (player in players) {
        function_4df3c8d739c4b460(player, container, lootid, quantity, weaponobj, noextract, force);
    }
}

// Namespace namespace_e40ee8b394ce404 / namespace_92fc655e328c1a9f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2c1
// Size: 0x113
function function_9cd7df4997aea4bf(player, container) {
    if (!function_e3081772bbf7a51c(player, container)) {
        containertype = function_b2ff0af91e5df8f4(container.type);
        function_cf0b3e7d1e5a3274(player, container, containertype);
        container.playercontents[player.guid].contents[0] = [];
        container.playercontents[player.guid].contents[0]["quantity"] = 0;
        container.playercontents[player.guid].contents[0]["lootID"] = 0;
        if (!istrue(container.noweaponslot)) {
            container.playercontents[player.guid].weaponslotcontents = 0;
            container.playercontents[player.guid].weaponslotobj = undefined;
        }
    }
}

// Namespace namespace_e40ee8b394ce404 / namespace_92fc655e328c1a9f
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x3dc
// Size: 0x51a
function function_4df3c8d739c4b460(player, container, lootid, quantity, weaponobj, noextract, force, var_30f9866cd8907775) {
    function_9cd7df4997aea4bf(player, container);
    var_57acadc40b2f0a8 = function_438749eb7a7b738(container.playercontents[player.guid].contents, player, container);
    lastvalidindex = var_57acadc40b2f0a8[1];
    items = var_57acadc40b2f0a8[0];
    container.playercontents[player.guid].contents = items;
    containersize = function_54d1e54b22f3f1f6(container);
    for (i = lastvalidindex + 1; i < containersize; i++) {
        container.playercontents[player.guid].contents[i] = undefined;
    }
    if (lootid == 0 || quantity == 0) {
        return;
    }
    if (isdefined(weaponobj) && !istrue(container.noweaponslot)) {
        if (function_3689ee4697dd6347(player, container)) {
            function_a0952bc59c9afa3f(player, container.playercontents[player.guid], weaponobj, lootid, quantity, undefined, noextract);
            return;
        }
        function_67be8d119fa22135(container.playercontents[player.guid], lootid, weaponobj, undefined, noextract, quantity, undefined);
        return;
    }
    containerindex = container.playercontents[player.guid].contents.size;
    canstack = undefined;
    foreach (index, item in container.playercontents[player.guid].contents) {
        if (!isdefined(item) || !isdefined(item["quantity"]) || !isdefined(item["lootID"])) {
            continue;
        }
        if (item["lootID"] == 8395 && lootid == item["lootID"]) {
            containerindex = index;
            quantity += item["quantity"];
            canstack = 1;
            break;
        }
        scriptablename = namespace_38b993c4618e76cd::getScriptableFromLootID(lootid);
        maxcount = level.br_pickups.var_4138f9ddc1cd22d[scriptablename];
        if (!isdefined(maxcount) || maxcount == 0) {
            maxcount = level.br_pickups.maxcounts[scriptablename];
        }
        if (!isdefined(maxcount) || maxcount == 0) {
            continue;
        }
        if (item["lootID"] == lootid && quantity + item["quantity"] <= maxcount) {
            containerindex = index;
            quantity += item["quantity"];
            canstack = 1;
            break;
        }
    }
    if (containerindex >= containersize && !isdefined(weaponobj) && !istrue(canstack)) {
        if (istrue(force)) {
            containerindex = 0;
            containerlootid = container.playercontents[player.guid].contents[containerindex]["lootID"];
            containerquantity = container.playercontents[player.guid].contents[containerindex]["quantity"];
            scriptablename = namespace_38b993c4618e76cd::getScriptableFromLootID(containerlootid);
            dropstruct = scripts\mp\gametypes\br_pickups::function_7b9f3966a7a42003();
            dropinfo = scripts\mp\gametypes\br_pickups::getitemdroporiginandangles(dropstruct, container.origin, container.angles);
            scripts\mp\gametypes\br_pickups::spawnpickup(scriptablename, dropinfo, containerquantity);
        } else {
            player scripts\mp\hud_message::showerrormessage("MP/BALLOON_EXTRACT_DENY_NO_ROOM");
            return;
        }
    }
    if (isdefined(container.var_6978a4b328fd33b3)) {
        var_57ad0dc40b2fdda = [[ container.var_6978a4b328fd33b3 ]](container, player, lootid, quantity, undefined, undefined, containerindex);
        var_83d63b00fa6616e7 = var_57ad0dc40b2fdda[1];
        lootid = var_57ad0dc40b2fdda[0];
        if (istrue(var_83d63b00fa6616e7)) {
            noextract = var_83d63b00fa6616e7;
        }
    }
    container.playercontents[player.guid].contents[containerindex]["quantity"] = quantity;
    container.playercontents[player.guid].contents[containerindex]["lootID"] = lootid;
    if (istrue(noextract)) {
        container.playercontents[player.guid].contents[containerindex]["noExtract"] = 1;
        return;
    }
    container.playercontents[player.guid].contents[containerindex]["noExtract"] = undefined;
}

// Namespace namespace_e40ee8b394ce404 / namespace_92fc655e328c1a9f
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x8fe
// Size: 0x5ef
function function_80bada2833945a7a(itemtype, itemindex, noextract, dropall) {
    var_57ad1dc40b3000d = function_438749eb7a7b738(self.var_2fa5b49969def47.playercontents[self.guid].contents, self, self.var_2fa5b49969def47);
    lastvalidindex = var_57ad1dc40b3000d[1];
    items = var_57ad1dc40b3000d[0];
    self.var_2fa5b49969def47.playercontents[self.guid].contents = items;
    containersize = function_54d1e54b22f3f1f6(self.var_2fa5b49969def47);
    for (i = lastvalidindex + 1; i < containersize; i++) {
        self.var_2fa5b49969def47.playercontents[self.guid].contents[i] = undefined;
    }
    container = self.var_2fa5b49969def47.playercontents[self.guid];
    weaponslotid = scripts\mp\loot::function_d6a3266145bab76d("loot_container_weapon");
    if (istrue(weaponslotid) && itemtype == 1) {
        scripts\mp\hud_message::showerrormessage("MP/BALLOON_EXTRACT_DENY_NO_ROOM");
        return;
    }
    var_57acedc40b2f974 = function_4b1ea8143efb9dd(itemtype, itemindex, dropall);
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
        if (scripts\mp\utility\weapon::function_1e9278ba699927f7(weaponobj)) {
            return;
        }
        metadata = undefined;
        if (namespace_a38a2e1fe7519183::function_e0fc1230452cf4e7()) {
            metadata = namespace_a38a2e1fe7519183::function_74031e3249a6f69e(self, itemindex);
        }
        altcount = undefined;
        if (weaponobj.hasalternate) {
            altweapon = weaponobj getaltweapon();
            if (isdefined(altweapon)) {
                altcount = self getweaponammoclip(altweapon);
            }
        }
        lefthandcount = undefined;
        if (scripts\mp\utility\weapon::isakimbo(weaponobj)) {
            lefthandcount = self getweaponammoclip(weaponobj, "left");
        }
        function_a0952bc59c9afa3f(self, self.var_2fa5b49969def47.playercontents[self.guid], weaponobj, lootid, itemtype, itemindex, quantity, metadata, noextract, altcount, lefthandcount);
        return;
    }
    containerindex = container.contents.size;
    canstack = undefined;
    droppedquantity = quantity;
    foreach (index, item in container.contents) {
        if (!isdefined(item) || !isdefined(item["quantity"]) || !isdefined(item["lootID"])) {
            continue;
        }
        totalquantity = quantity + item["quantity"];
        if (item["lootID"] == 8395 && lootid == item["lootID"] && totalquantity < 4095) {
            containerindex = index;
            quantity = totalquantity;
            canstack = 1;
            break;
        }
        scriptablename = namespace_38b993c4618e76cd::getScriptableFromLootID(lootid);
        maxcount = level.br_pickups.var_4138f9ddc1cd22d[scriptablename];
        if (!isdefined(maxcount) || maxcount == 0) {
            maxcount = level.br_pickups.maxcounts[scriptablename];
        }
        if (!isdefined(maxcount) || maxcount == 0) {
            continue;
        }
        if (item["lootID"] == lootid && totalquantity <= maxcount && totalquantity < 4095) {
            containerindex = index;
            quantity = totalquantity;
            canstack = 1;
            break;
        }
    }
    if (containerindex >= containersize && itemtype != 1 && !istrue(canstack)) {
        scripts\mp\hud_message::showerrormessage("MP/BALLOON_EXTRACT_DENY_NO_ROOM");
        return;
    }
    if (isdefined(self.var_2fa5b49969def47.var_6978a4b328fd33b3)) {
        var_57ac4dc40b2e376 = [[ self.var_2fa5b49969def47.var_6978a4b328fd33b3 ]](self.var_2fa5b49969def47, self, lootid, quantity, itemtype, itemindex, containerindex);
        var_83d63b00fa6616e7 = var_57ac4dc40b2e376[1];
        lootid = var_57ac4dc40b2e376[0];
        if (istrue(var_83d63b00fa6616e7)) {
            noextract = var_83d63b00fa6616e7;
        }
    }
    if (scripts\mp\gametypes\br_pickups::function_34af0f77c1668dba(lootid)) {
        thread scripts\mp\gametypes\br_pickups::function_8aab3cda02f81c09(self, itemtype, undefined, 1, droppedquantity);
    } else if (istrue(dropall) && !scripts\mp\gametypes\br_pickups::function_f96674ba1a1ec2b3(lootid)) {
        thread scripts\mp\gametypes\br_pickups::quickdropall(itemtype, itemindex, 1);
    } else {
        thread scripts\mp\gametypes\br_pickups::quickdropitem(itemtype, itemindex, 1);
    }
    self.var_2fa5b49969def47.playercontents[self.guid].contents[containerindex]["quantity"] = quantity;
    self.var_2fa5b49969def47.playercontents[self.guid].contents[containerindex]["lootID"] = lootid;
    if (istrue(noextract)) {
        self.var_2fa5b49969def47.playercontents[self.guid].contents[containerindex]["noExtract"] = 1;
    } else {
        self.var_2fa5b49969def47.playercontents[self.guid].contents[containerindex]["noExtract"] = undefined;
    }
    function_ce9b69fc041571d2(self, self.var_2fa5b49969def47);
    scriptablename = namespace_38b993c4618e76cd::getScriptableFromLootID(lootid);
    if (scripts\mp\gametypes\br_pickups::function_282d89f7705a2d63(scriptablename)) {
        scripts\mp\gametypes\br_pickups::function_bfc82c27ed3d9308(undefined, undefined, scriptablename, itemindex);
    }
}

// Namespace namespace_e40ee8b394ce404 / namespace_92fc655e328c1a9f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xef5
// Size: 0x131
function function_ce9b69fc041571d2(opener, container) {
    var_57ac5dc40b2e5a9 = function_438749eb7a7b738(container.playercontents[opener.guid].contents, opener, container);
    lastvalidindex = var_57ac5dc40b2e5a9[1];
    items = var_57ac5dc40b2e5a9[0];
    container.playercontents[opener.guid].contents = items;
    containersize = function_54d1e54b22f3f1f6(container);
    /#
        if (items.size > containersize) {
            println("<dev string:x1c>" + items.size + "<dev string:x53>" + containersize + "<dev string:x6f>");
        }
    #/
    for (itemindex = 0; itemindex < containersize; itemindex++) {
        function_c7294f5b9b5006d5(opener, itemindex);
    }
    for (itemindex = 0; itemindex < containersize; itemindex++) {
        if (itemindex <= lastvalidindex) {
            function_446c7ad7bcc70992(opener, container.playercontents[opener.guid], itemindex, items[itemindex]["lootID"], items[itemindex]["quantity"], items[itemindex]["ref"]);
        }
    }
}

// Namespace namespace_e40ee8b394ce404 / namespace_92fc655e328c1a9f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x102e
// Size: 0x64
function function_b2ff0af91e5df8f4(scriptablename) {
    containertype = 1;
    switch (scriptablename) {
    case #"hash_8387e0bfe22abc5d":
    case #"hash_f1db14019ca6a516": 
        containertype = 15;
        break;
    case #"hash_884fc5db10bac9b3": 
        containertype = 13;
        break;
    default: 
        break;
    }
    return containertype;
}

// Namespace namespace_e40ee8b394ce404 / namespace_92fc655e328c1a9f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x109b
// Size: 0x98
function function_54d1e54b22f3f1f6(container) {
    containertype = container.containertype;
    hasweaponslot = scripts\engine\utility::ter_op(!istrue(container.noweaponslot), 1, 0);
    switch (containertype) {
    case 15: 
        return (getdvarint(@"hash_823c57ec4dac4069", 4) - hasweaponslot);
    case 13: 
        return (getdvarint(@"hash_780b498909ad7b76", 4) - hasweaponslot);
    default: 
        return 10;
    }
}

// Namespace namespace_e40ee8b394ce404 / namespace_92fc655e328c1a9f
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x113b
// Size: 0x1a2
function function_4b1ea8143efb9dd(itemtype, itemindex, dropall) {
    switch (itemtype) {
    case 10: 
        lootid = namespace_aead94004cf4c147::function_6196d9ea9a30e609(itemindex);
        if (!isdefined(lootid)) {
            return [0, 0];
        }
        scriptablename = namespace_38b993c4618e76cd::getScriptableFromLootID(lootid);
        quantity = 1;
        if (namespace_85cd45b4fe0d86fb::function_3c17a26ce6a4668(lootid)) {
            var_c00a2c6249962d83 = namespace_85cd45b4fe0d86fb::function_379463a84adb07b4(quantity);
            var_dab81ead77442a10 = var_c00a2c6249962d83[2];
            itemcountlefthand = var_c00a2c6249962d83[1];
            quantity = var_c00a2c6249962d83[0];
        } else if (istrue(dropall) || scripts\mp\gametypes\br_pickups::function_d345eec68e01361f(lootid)) {
            quantity = namespace_aead94004cf4c147::function_897b29adb37f06a7(itemindex);
        } else if (isdefined(scriptablename) && scripts\mp\gametypes\br_public::isammo(scriptablename)) {
            quantity = int(min(namespace_aead94004cf4c147::function_897b29adb37f06a7(itemindex), level.br_pickups.counts[scriptablename]));
        } else {
            quantity = 1;
        }
        return [lootid, quantity];
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 6:
    case 7: 
        return namespace_aead94004cf4c147::function_cf1bef64e94f2d1a(itemtype, itemindex, 1, 1, !istrue(dropall));
    default: 
        assertmsg("<dev string:x74>" + itemtype);
        return;
    }
}

// Namespace namespace_e40ee8b394ce404 / namespace_92fc655e328c1a9f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12e5
// Size: 0x96
function function_5711a00587f71794(player) {
    if (!function_6f45e7311f77eac4(player)) {
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
        return 1;
    default: 
        return 0;
    }
}

// Namespace namespace_e40ee8b394ce404 / namespace_92fc655e328c1a9f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1383
// Size: 0x75
function function_3689ee4697dd6347(player, container) {
    if (!function_5711a00587f71794(player)) {
        return false;
    }
    if (player.var_2fa5b49969def47.containertype != container.containertype) {
        return false;
    }
    if (!isdefined(container.playeropen) || !isdefined(container.playeropen[player.guid])) {
        return false;
    }
    return true;
}

// Namespace namespace_e40ee8b394ce404 / namespace_92fc655e328c1a9f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1401
// Size: 0xb3
function function_1225f23a18664f4c(player) {
    if (!function_6f45e7311f77eac4(player)) {
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

// Namespace namespace_e40ee8b394ce404 / namespace_92fc655e328c1a9f
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14bc
// Size: 0xc3
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

