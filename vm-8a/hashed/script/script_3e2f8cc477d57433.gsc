#using scripts\engine\utility.gsc;
#using scripts\common\callbacks.gsc;
#using script_7b2517368c79e5bc;
#using script_443d99fe707f1d9f;
#using script_485622d93fa7e4cf;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using script_5640d32580c6bc7d;
#using scripts\mp\utility\lui_game_event_aggregator.gsc;
#using script_43971bbeefd98f05;
#using scripts\mp\equipment.gsc;
#using script_600b944a95c3a7bf;
#using script_2669878cf5a1b6bc;
#using script_6fc415ff6a905dc1;

#namespace common_inventory;

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9de
// Size: 0x51
function inventory_init() {
    if (!inventory_isenabled()) {
        return;
    }
    if (!isdefined(level.commonitem)) {
        assertmsg("CommonInventoryERROR: Common Item not initialized! Do not call common_inventory::init() directly");
        return;
    }
    function_d3405ff387ff4f2e();
    scripts\mp\utility\lui_game_event_aggregator::registeronluieventcallback(&function_893d47a3b0d1dfe2);
    registersharedfunc("game", "removeFirstFromBackpack", &function_181a584e4a68d5d6);
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa37
// Size: 0x455
function private function_893d47a3b0d1dfe2(notification, var_421750c958bd3064) {
    if (istrue(level.infilcinematicactive)) {
        return;
    }
    if (isdefined(notification) && isdefined(var_421750c958bd3064) && !istrue(self.isjuggernaut)) {
        switch (notification) {
        case #"hash_f9442c17e42ea782": 
            itemtype = function_a46acbfe17ad9a54(var_421750c958bd3064);
            if ((itemtype == 3 || itemtype == 1) && (isdefined(self.triggeringstreak) || istrue(self.enabledequipdeployvfx))) {
                break;
            }
            itemindex = function_4953ec8e37aa67b8(var_421750c958bd3064);
            if (function_5711a00587f71794(self) && (!is_equal(itemtype, 0) || is_equal(itemtype, 0) && function_c44440af852c483(self)) && (function_1225f23a18664f4c(self) || itemtype != 1)) {
                function_80bada2833945a7a(itemtype, itemindex);
                function_80fcd9b9bddea7a9(itemtype, itemindex, 1);
            } else {
                uidropitem(itemtype, itemindex, 1);
            }
            break;
        case #"hash_24d3e929a240e2d7": 
            itemtype = function_a46acbfe17ad9a54(var_421750c958bd3064);
            if ((itemtype == 3 || itemtype == 1) && (isdefined(self.triggeringstreak) || istrue(self.enabledequipdeployvfx))) {
                break;
            }
            itemindex = function_4953ec8e37aa67b8(var_421750c958bd3064);
            if (function_5711a00587f71794(self) && (function_1225f23a18664f4c(self) || itemtype != 1)) {
                function_80bada2833945a7a(itemtype, itemindex, undefined, 1);
                function_80fcd9b9bddea7a9(itemtype, itemindex);
            } else {
                uidropitem(itemtype, itemindex);
            }
            break;
        case #"hash_344a8be1e67f4848": 
            itemtype = function_a46acbfe17ad9a54(var_421750c958bd3064);
            if (itemtype == 3 && isdefined(self.triggeringstreak)) {
                break;
            }
            itemindex = function_4953ec8e37aa67b8(var_421750c958bd3064);
            if (itemtype == 1 && itemindex == 2) {
                function_400fb193601d3a21();
            } else {
                function_777092be5abab355(itemindex);
            }
            break;
        case #"hash_1e7d2b97f26d79a5": 
            itemtype = function_a46acbfe17ad9a54(var_421750c958bd3064);
            if (itemtype == 3 && isdefined(self.triggeringstreak)) {
                break;
            }
            itemindex = function_4953ec8e37aa67b8(var_421750c958bd3064);
            var_57accdc40b2f50e = function_80fcd9b9bddea7a9(itemtype, itemindex);
            quantity = var_57accdc40b2f50e[1];
            itembundle = var_57accdc40b2f50e[0];
            if (!isdefined(itembundle) || quantity <= 0) {
                assertmsg("CommonInventoryERROR: attempted to move an invalid item of type [" + itemtype + "] from the loadout to the backpack");
                break;
            }
            itemcount = function_7209c8cd4b2e3afd(quantity);
            remainder = function_4b5b6b5953138fe7(itembundle, itemcount);
            if (remainder == 0) {
                break;
            }
            remaindercount = function_7209c8cd4b2e3afd(remainder);
            function_1a95cb90efa117b8(itembundle, remaindercount);
            break;
        case #"hash_df97645422cac8a6": 
            itemtype = function_a46acbfe17ad9a54(var_421750c958bd3064);
            if (itemtype != 1) {
                break;
            }
            itemindex = function_4953ec8e37aa67b8(var_421750c958bd3064);
            function_c14b2cb6d5a65def(itemindex);
            break;
        case #"hash_21120d09fe99acc5": 
            lootid = var_421750c958bd3064;
            item = function_23a72b496d4206c9(lootid);
            if (!isdefined(item)) {
                assertmsg("<dev string:x1c>" + lootid + "<dev string:x57>");
                break;
            }
            function_354e083223035de2(item, lootid);
            break;
        case #"hash_970fe96b5f1fa60b": 
            itemtype = function_a46acbfe17ad9a54(var_421750c958bd3064);
            if (itemtype == 3 && isdefined(self.triggeringstreak)) {
                break;
            }
            itemindex = function_4953ec8e37aa67b8(var_421750c958bd3064);
            if (isdefined(self.var_2fa5b49969def47)) {
                namespace_3883e3399f2870b5::function_68085c72d7b628ec(self.var_2fa5b49969def47, self);
            }
            var_57acddc40b2f741 = function_80fcd9b9bddea7a9(itemtype, itemindex);
            removedquantity = var_57acddc40b2f741[1];
            var_632d9a80cbdc3a50 = var_57acddc40b2f741[0];
            item = spawnstruct();
            item.count = removedquantity;
            item.var_9c44eb334c225d45 = 2;
            lootid = function_6d15e119c2779a93(var_632d9a80cbdc3a50);
            function_86d7576fb0f41e09(item, lootid);
            break;
        default: 
            break;
        }
    }
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe94
// Size: 0x19
function private function_a46acbfe17ad9a54(var_421750c958bd3064) {
    return (var_421750c958bd3064 & 256 - 1 << 8) >> 8;
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xeb6
// Size: 0x13
function private function_4953ec8e37aa67b8(var_421750c958bd3064) {
    return var_421750c958bd3064 & 256 - 1;
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xed2
// Size: 0x68
function private uidropitem(itemtype, itemindex, quantity) {
    var_57acadc40b2f0a8 = function_80fcd9b9bddea7a9(itemtype, itemindex, quantity);
    removedquantity = var_57acadc40b2f0a8[1];
    var_632d9a80cbdc3a50 = var_57acadc40b2f0a8[0];
    if (isdefined(var_632d9a80cbdc3a50) && isdefined(removedquantity) && removedquantity > 0) {
        items_dropitem(var_632d9a80cbdc3a50, removedquantity);
    }
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf42
// Size: 0x3d4
function private function_80fcd9b9bddea7a9(itemtype, itemindex, quantity) {
    var_632d9a80cbdc3a50 = undefined;
    removedquantity = 0;
    switch (itemtype) {
    case 0: 
        if (function_ceee9e1f4c8d1135()) {
            callbacks = function_cca8bbe88a39ad41("currency");
            var_57acbdc40b2f2db = self [[ callbacks.var_df9b308efe82294a ]]();
            currentquantity = var_57acbdc40b2f2db[1];
            var_632d9a80cbdc3a50 = var_57acbdc40b2f2db[0];
            var_74806f0c4caa7e55 = currentquantity;
            if (isdefined(quantity)) {
                var_74806f0c4caa7e55 = quantity * getmatchrulesdata("brData", "plunderDropSomeAmount");
            }
            removedquantity = self [[ callbacks.var_bd286dd0c1f53098 ]](var_74806f0c4caa7e55);
        }
        break;
    case 1: 
        callbacks = function_cca8bbe88a39ad41("weapon");
        self [[ callbacks.var_bd286dd0c1f53098 ]](itemindex);
        break;
    case 2: 
        slot = scripts\mp\equipment::function_4967838290cb31b9(itemindex);
        item_type = "lethal";
        if (slot == "secondary") {
            item_type = "tactical";
        }
        if (slot == "health") {
            item_type = "armor";
        }
        callbacks = function_cca8bbe88a39ad41(item_type);
        var_57ad0dc40b2fdda = self [[ callbacks.var_df9b308efe82294a ]]();
        currentquantity = var_57ad0dc40b2fdda[1];
        var_632d9a80cbdc3a50 = var_57ad0dc40b2fdda[0];
        removedquantity = self [[ callbacks.var_bd286dd0c1f53098 ]](quantity);
        break;
    case 3: 
        item_type = "killstreak";
        callbacks = function_cca8bbe88a39ad41(item_type);
        var_57ad1dc40b3000d = self [[ callbacks.var_df9b308efe82294a ]]();
        removedquantity = var_57ad1dc40b3000d[1];
        var_632d9a80cbdc3a50 = var_57ad1dc40b3000d[0];
        self [[ callbacks.var_bd286dd0c1f53098 ]]();
        break;
    case 4: 
        item_type = "super";
        callbacks = function_cca8bbe88a39ad41(item_type);
        var_57acedc40b2f974 = self [[ callbacks.var_df9b308efe82294a ]]();
        removedquantity = var_57acedc40b2f974[1];
        var_632d9a80cbdc3a50 = var_57acedc40b2f974[0];
        self [[ callbacks.var_bd286dd0c1f53098 ]]();
        break;
    case 6: 
        item_type = "gasmask";
        callbacks = function_cca8bbe88a39ad41(item_type);
        var_57acfdc40b2fba7 = self [[ callbacks.var_df9b308efe82294a ]]();
        removedquantity = var_57acfdc40b2fba7[1];
        var_632d9a80cbdc3a50 = var_57acfdc40b2fba7[0];
        self [[ callbacks.var_bd286dd0c1f53098 ]]();
        break;
    case 7: 
        item_type = "revive";
        callbacks = function_cca8bbe88a39ad41(item_type);
        var_57ac4dc40b2e376 = self [[ callbacks.var_df9b308efe82294a ]]();
        removedquantity = var_57ac4dc40b2e376[1];
        var_632d9a80cbdc3a50 = var_57ac4dc40b2e376[0];
        self [[ callbacks.var_bd286dd0c1f53098 ]]();
        break;
    case 5:
    case 10: 
        removedlootid = function_d870b2c45335bd88(itemindex);
        currentquantity = function_5ce7fe3dca9c1a22(itemindex);
        var_e0ceabe179f1f193 = function_fc925a153c7fd55c(removedlootid);
        if (!isdefined(var_e0ceabe179f1f193)) {
            assertmsg("CommonInventoryERROR: itemspawnentry not found for lootID [" + removedlootid + "] when attempting to remove an item from a rucksack or ammo slot.");
            break;
        }
        var_632d9a80cbdc3a50 = getscriptbundle("itemspawnentry:" + var_e0ceabe179f1f193);
        newlootid = 0;
        newquantity = 0;
        removedquantity = currentquantity;
        if (isdefined(quantity) && quantity > 0 && quantity < currentquantity && !istrue(var_632d9a80cbdc3a50.var_ec7430d9ed0b6e64)) {
            removedquantity = quantity;
            newlootid = removedlootid;
            newquantity = currentquantity - removedquantity;
        }
        function_ca3bbb1070436540(itemindex, newlootid, newquantity);
        break;
    case 11: 
        break;
    }
    return [var_632d9a80cbdc3a50, removedquantity];
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x131f
// Size: 0xaa
function function_400fb193601d3a21() {
    var_17d89f18c1d0eb4f = self getcurrentweapon();
    function_ad6e2b653093328a();
    if (var_17d89f18c1d0eb4f.basename != "iw9_me_fists_mp" && !issameweapon(var_17d89f18c1d0eb4f, level.weaponnone)) {
        function_ad55c4cd0426138d(var_17d89f18c1d0eb4f);
    }
    self takeweapon(var_17d89f18c1d0eb4f);
    params = spawnstruct();
    params.oldlocation = "backpack";
    params.var_d84bffa3178eec97 = 0;
    params.newlocation = "loadout";
    params.var_1e6cc7248a40392e = 0;
    callback::callback("inventory_item_moved", params);
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13d1
// Size: 0x48
function function_777092be5abab355(itemslotindex) {
    lootid = function_d870b2c45335bd88(itemslotindex);
    quantity = function_5ce7fe3dca9c1a22(itemslotindex);
    if (lootid == 0 || quantity == 0) {
        return;
    }
    function_b9d2aee928c46b5f(lootid, quantity, itemslotindex, undefined);
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1421
// Size: 0x26d
function function_b9d2aee928c46b5f(lootid, quantity, inventoryslotindex, var_e97d731bedd44c63, var_cbc0ab512152abfc) {
    newitembundlename = function_fc925a153c7fd55c(lootid);
    var_a8856d1c2cbf78f6 = "itemspawnentry:" + newitembundlename;
    if (function_633f07e180b6ec8f(var_a8856d1c2cbf78f6)) {
        return false;
    }
    newitembundle = getscriptbundle(var_a8856d1c2cbf78f6);
    var_2aac741db0d5fe2e = newitembundle.scriptable;
    if (!isdefined(var_2aac741db0d5fe2e)) {
        return false;
    }
    newitemcallbacks = function_cca8bbe88a39ad41(newitembundle.type);
    if (!isdefined(newitemcallbacks)) {
        assertmsg("CommonInventoryERROR: attempted to equip invalid item type [" + newitembundle.type + "] from inventory");
        return false;
    }
    if (isdefined(newitemcallbacks.canusefunc) && !self [[ newitemcallbacks.canusefunc ]](newitembundle, undefined, 0, 1)) {
        function_fbfd7096a2dbc7e7(newitembundle, 0);
        return false;
    }
    var_57ac5dc40b2e5a9 = self [[ newitemcallbacks.var_df9b308efe82294a ]]();
    olditemcount = var_57ac5dc40b2e5a9[1];
    var_c8072c59ba873dc1 = var_57ac5dc40b2e5a9[0];
    var_c4c781308ba64c2 = olditemcount;
    packedcount = function_7209c8cd4b2e3afd(quantity, undefined, var_e97d731bedd44c63);
    newitemremainder = function_1a95cb90efa117b8(newitembundle, packedcount);
    if (isarray(newitemremainder)) {
        newitemremainder = newitemremainder[0];
    }
    if (newitemremainder >= packedcount) {
        function_fbfd7096a2dbc7e7(newitembundle, 0);
        return false;
    }
    assertex(isdefined(newitemremainder), "CommonInventoryERROR: Equipping item of type " + newitembundle.type + " did not return a valid remainder");
    if (isstruct(var_c8072c59ba873dc1) && isdefined(var_c8072c59ba873dc1.ref) && var_c8072c59ba873dc1.ref == newitembundle.ref && !istrue(newitembundle.disablestacking)) {
        var_c4c781308ba64c2 = newitemremainder;
        olditemcount = newitemremainder;
    }
    if (isdefined(inventoryslotindex)) {
        var_72371d0de2680b76 = 0;
        if (isdefined(var_c8072c59ba873dc1) && var_c4c781308ba64c2 > 0) {
            var_72371d0de2680b76 = function_6d15e119c2779a93(var_c8072c59ba873dc1);
        }
        function_ca3bbb1070436540(inventoryslotindex, var_72371d0de2680b76, var_c4c781308ba64c2);
    }
    if (isdefined(var_cbc0ab512152abfc) && var_cbc0ab512152abfc && !isdefined(inventoryslotindex) && isdefined(var_c8072c59ba873dc1) && olditemcount > 0) {
        items_dropitem(var_c8072c59ba873dc1, olditemcount);
    }
    function_fbfd7096a2dbc7e7(newitembundle, 1);
    return true;
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1697
// Size: 0x124
function function_f64964e50cc34c47(itembundlename, itembundle, item, autouse) {
    lootid = function_6d15e119c2779a93(itembundle);
    if (!isdefined(lootid)) {
        assertmsg("CommonInventoryERROR: Attempting to add item [" + itembundlename + "] to inventory but lootID is undefined");
        return item.count;
    }
    count = function_b8bfea9514c89a77(item.count);
    if (function_3298f1ad0b756cbd(itembundle, count, autouse)) {
        params = spawnstruct();
        params.item = item;
        params.itembundlename = itembundlename;
        params.itembundle = itembundle;
        params.tobackpack = 1;
        callback::callback("player_item_pickup", params);
        remainder = function_4b5b6b5953138fe7(itembundle, item.count);
        if (remainder <= 0) {
            self notify("self_pickedupitem", function_40fd49171fad19d3(item.type));
        }
        return remainder;
    }
    return item.count;
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17c4
// Size: 0xf0
function function_3298f1ad0b756cbd(itembundle, quantity, autouse) {
    backpacksize = function_1b35b10884bd8d67();
    lootid = function_6d15e119c2779a93(itembundle);
    for (i = 0; i < backpacksize; i++) {
        currentlootid = function_d870b2c45335bd88(i);
        if (currentlootid == 0 && currentlootid != lootid && (!istrue(autouse) || istrue(itembundle.var_bbae53787b1abf3e) && istrue(itembundle.var_515391a9c294e239))) {
            return true;
        }
        if (currentlootid == lootid && !istrue(itembundle.disablestacking) && (!istrue(autouse) || istrue(itembundle.var_bbae53787b1abf3e))) {
            currentquantity = function_5ce7fe3dca9c1a22(i);
            if (currentquantity < function_c7171bcea41dd66f(itembundle)) {
                return true;
            }
        }
    }
    return false;
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18bd
// Size: 0x47
function function_4f73be3d1273e86b() {
    backpacksize = function_1b35b10884bd8d67();
    for (i = 0; i < backpacksize; i++) {
        currentlootid = function_d870b2c45335bd88(i);
        if (currentlootid == 0) {
            return false;
        }
    }
    return true;
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x190d
// Size: 0x66
function function_4776284a348ebb6a(targetlootid) {
    if (!isdefined(targetlootid)) {
        assert("CommonInventoryERROR: Undefined target lootID.");
        return -1;
    }
    backpacksize = function_1b35b10884bd8d67();
    for (i = 0; i < backpacksize; i++) {
        currentlootid = function_d870b2c45335bd88(i);
        if (currentlootid == targetlootid) {
            return i;
        }
    }
    return -1;
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x197c
// Size: 0x1cc
function function_4b5b6b5953138fe7(itembundle, itemcount) {
    if (!isdefined(itembundle) || !isdefined(itemcount)) {
        assertmsg("CommonInventoryERROR: Attempting to add undefined item object to backpack");
        return 0;
    }
    /#
        itemnamestring = ter_op(isdefined(itembundle.ref), itembundle.ref, "<dev string:x70>");
    #/
    lootid = function_6d15e119c2779a93(itembundle);
    if (!isdefined(lootid)) {
        assertmsg("<dev string:x7d>" + function_2cdc55ba39d97d70(itemnamestring) + "<dev string:xac>");
        return itemcount;
    }
    quantity = function_b8bfea9514c89a77(itemcount);
    maxcount = function_c7171bcea41dd66f(itembundle);
    if (!istrue(itembundle.disablestacking)) {
        for (i = 0; i < function_1b35b10884bd8d67(); i++) {
            currentlootid = function_d870b2c45335bd88(i);
            if (currentlootid == lootid) {
                slotquantity = function_5ce7fe3dca9c1a22(i);
                if (slotquantity <= maxcount) {
                    slotsavailable = maxcount - slotquantity;
                    var_a17f14f68ba0defc = min(maxcount, slotquantity + quantity);
                    function_ca3bbb1070436540(i, lootid, var_a17f14f68ba0defc);
                    quantity = int(max(0, quantity - slotsavailable));
                }
            }
            if (quantity <= 0) {
                return 0;
            }
        }
    }
    for (i = 0; i < function_1b35b10884bd8d67(); i++) {
        currentlootid = function_d870b2c45335bd88(i);
        if (currentlootid == 0 && currentlootid != lootid) {
            var_514fa029a62f1e60 = min(maxcount, quantity);
            function_ca3bbb1070436540(i, lootid, var_514fa029a62f1e60);
            quantity -= var_514fa029a62f1e60;
            if (quantity <= 0) {
                return 0;
            }
        }
    }
    return function_7209c8cd4b2e3afd(quantity);
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b51
// Size: 0x213
function function_dbd1a6ad7182a0da() {
    if (isdefined(self.var_8bebfe2a52f10bf7)) {
        foreach (weapon in self.primaryweapons) {
            if (weapon.basename != "none") {
                _takeweapon(weapon);
            }
        }
        foreach (weapon in self.var_8bebfe2a52f10bf7) {
            if (weapon.basename != "none") {
                self giveweapon(weapon);
                _switchtoweaponimmediate(weapon);
            }
        }
        self.var_8bebfe2a52f10bf7 = undefined;
    }
    for (index = 0; index < 50; index++) {
        lootid = self getplayerdata(level.var_5d69837cf4db0407, "dmzInventory", index, "lootID");
        quantity = self getplayerdata(level.var_5d69837cf4db0407, "dmzInventory", index, "quantity");
        type = namespace_38b993c4618e76cd::function_282cf83c9eeda744(lootid);
        ref = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(lootid);
        if (isdefined(lootid) && lootid > 0) {
            if (type == "weapon") {
                continue;
            }
            itembundlename = function_fc925a153c7fd55c(lootid);
            if (isdefined(itembundlename)) {
                itembundle = getscriptbundle("itemspawnentry:" + itembundlename);
                scriptable = itembundle.scriptable;
                item = spawnstruct();
                item.type = scriptable;
                item.count = function_7209c8cd4b2e3afd(quantity);
                function_de489fa2ffdb7f2d(item, 0);
            }
        }
    }
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d6c
// Size: 0x253
function function_a342582cc42f28cb() {
    self.var_8bebfe2a52f10bf7 = arraycopy(self.primaryweapons);
    foreach (weapon in self.var_8bebfe2a52f10bf7) {
        variantid = weapon.variantid;
        if (!isdefined(weapon.variantid)) {
            variantid = 0;
        }
        rootname = namespace_e0ee43ef2dddadaa::getweaponrootname(weapon);
        ref = rootname;
        if (variantid) {
            ref = rootname + "_v" + variantid;
        }
        lootid = function_2c836ad05e5f634c(ref);
        if (isdefined(lootid) && lootid > 0) {
            namespace_512200f0f9e6ebc9::function_c324d060cde743e3(lootid, 1);
        }
    }
    callbacks = function_cca8bbe88a39ad41("tactical");
    var_c00a326249963ab5 = self [[ callbacks.var_df9b308efe82294a ]]();
    quantity = var_c00a326249963ab5[1];
    itembundle = var_c00a326249963ab5[0];
    lootid = function_6d15e119c2779a93(itembundle);
    if (isdefined(lootid) && lootid > 0) {
        namespace_512200f0f9e6ebc9::function_c324d060cde743e3(lootid, quantity);
    }
    callbacks = function_cca8bbe88a39ad41("lethal");
    var_c00a316249963882 = self [[ callbacks.var_df9b308efe82294a ]]();
    quantity = var_c00a316249963882[1];
    itembundle = var_c00a316249963882[0];
    lootid = function_6d15e119c2779a93(itembundle);
    if (isdefined(lootid) && lootid > 0) {
        namespace_512200f0f9e6ebc9::function_c324d060cde743e3(lootid, quantity);
    }
    callbacks = function_cca8bbe88a39ad41("super");
    var_c00a346249963f1b = self [[ callbacks.var_df9b308efe82294a ]]();
    quantity = var_c00a346249963f1b[1];
    itembundle = var_c00a346249963f1b[0];
    lootid = function_6d15e119c2779a93(itembundle);
    if (isdefined(lootid) && lootid > 0) {
        namespace_512200f0f9e6ebc9::function_c324d060cde743e3(lootid, quantity);
    }
    callbacks = function_cca8bbe88a39ad41("killstreak");
    var_c00a336249963ce8 = self [[ callbacks.var_df9b308efe82294a ]]();
    quantity = var_c00a336249963ce8[1];
    itembundle = var_c00a336249963ce8[0];
    lootid = function_6d15e119c2779a93(itembundle);
    if (isdefined(lootid) && lootid > 0) {
        namespace_512200f0f9e6ebc9::function_c324d060cde743e3(lootid, quantity);
    }
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1fc7
// Size: 0x1f2
function function_48b99b38763ac68c() {
    dropstruct = function_59a2e61d79065dca();
    callbacks = function_cca8bbe88a39ad41("weapon");
    self [[ callbacks.var_bd286dd0c1f53098 ]](0);
    self [[ callbacks.var_bd286dd0c1f53098 ]](1);
    self [[ callbacks.var_bd286dd0c1f53098 ]](2);
    callbacks = function_cca8bbe88a39ad41("lethal");
    var_bffcba6249871e48 = self [[ callbacks.var_df9b308efe82294a ]]();
    quantity = var_bffcba6249871e48[1];
    itembundle = var_bffcba6249871e48[0];
    if (isdefined(itembundle)) {
        items_dropitem(itembundle, quantity, dropstruct);
    }
    callbacks = function_cca8bbe88a39ad41("tactical");
    var_bffcbb624987207b = self [[ callbacks.var_df9b308efe82294a ]]();
    quantity = var_bffcbb624987207b[1];
    itembundle = var_bffcbb624987207b[0];
    if (isdefined(itembundle)) {
        items_dropitem(itembundle, quantity, dropstruct);
    }
    callbacks = function_cca8bbe88a39ad41("super");
    var_bffcbc62498722ae = self [[ callbacks.var_df9b308efe82294a ]]();
    quantity = var_bffcbc62498722ae[1];
    itembundle = var_bffcbc62498722ae[0];
    if (isdefined(itembundle)) {
        items_dropitem(itembundle, quantity, dropstruct);
    }
    callbacks = function_cca8bbe88a39ad41("killstreak");
    var_bffcbd62498724e1 = self [[ callbacks.var_df9b308efe82294a ]]();
    quantity = var_bffcbd62498724e1[1];
    itembundle = var_bffcbd62498724e1[0];
    if (isdefined(itembundle)) {
        items_dropitem(itembundle, quantity, dropstruct);
    }
    for (i = 0; i < function_1b35b10884bd8d67(); i++) {
        lootid = function_d870b2c45335bd88(i);
        quantity = function_5ce7fe3dca9c1a22(i);
        if (isdefined(lootid) && lootid > 0) {
            bundlename = function_fc925a153c7fd55c(lootid);
            itembundle = getscriptbundle("itemspawnentry:" + bundlename);
            items_dropitem(itembundle, quantity, dropstruct);
        }
    }
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21c1
// Size: 0x4
function function_ceee9e1f4c8d1135() {
    return true;
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x21ce
// Size: 0x22
function private shoulddropitem(itembundle, quantity) {
    return isdefined(itembundle) && isdefined(quantity) && quantity > 0;
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21f9
// Size: 0x8e
function function_4433fa5f0f02ffd8(dropstruct, itemindex) {
    lootid = function_d870b2c45335bd88(itemindex);
    if (!isdefined(lootid) || lootid <= 0) {
        return;
    }
    bundlename = function_fc925a153c7fd55c(lootid);
    if (!isdefined(bundlename)) {
        return;
    }
    itembundle = getscriptbundle("itemspawnentry:" + bundlename);
    if (!isdefined(itembundle)) {
        return;
    }
    quantity = function_5ce7fe3dca9c1a22(itemindex);
    function_ca3bbb1070436540(itemindex, lootid, 0);
    items_dropitem(itembundle, quantity, dropstruct);
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x228f
// Size: 0x31d
function function_2166e0fab7a3263(itemtype, dropstruct, itemindex, var_26b448211c62d57a) {
    if (!isdefined(itemtype)) {
        assertmsg("[common_inventory] itemType is undefined!");
        return;
    }
    callbacks = function_cca8bbe88a39ad41(itemtype);
    if (!isdefined(callbacks)) {
        assertmsg("[common_inventory] Get callbacks fail for itemType " + itemtype);
        return;
    }
    switch (itemtype) {
    case #"hash_27124c6c97ccffa1": 
        self [[ callbacks.var_bd286dd0c1f53098 ]](itemindex);
        break;
    case #"hash_a2937f8adf677a96": 
        if (!function_ceee9e1f4c8d1135()) {
            break;
        }
        var_bffcbe6249872714 = self [[ callbacks.var_df9b308efe82294a ]]();
        quantity = var_bffcbe6249872714[1];
        itembundle = var_bffcbe6249872714[0];
        var_987ea9f2095b357a = quantity;
        if (isdefined(var_26b448211c62d57a)) {
            var_987ea9f2095b357a = [[ var_26b448211c62d57a ]](var_987ea9f2095b357a);
        }
        shoulddrop = shoulddropitem(itembundle, var_987ea9f2095b357a);
        if (shoulddrop) {
            while (quantity > 0) {
                removedquantity = self [[ callbacks.var_bd286dd0c1f53098 ]](quantity);
                quantity = max(quantity - removedquantity, 0);
            }
            while (var_987ea9f2095b357a > 0) {
                item = items_dropitem(itembundle, var_987ea9f2095b357a, dropstruct);
                if (!isdefined(item)) {
                    break;
                }
                var_987ea9f2095b357a -= item.count;
            }
        }
        break;
    case #"hash_25789111b74943b4":
    case #"hash_339227cb650975db":
    case #"hash_850999d7864fa3b4":
    case #"hash_c04d8180feb92b2b":
    case #"hash_cce09c1231d104b7": 
        var_bffcbf6249872947 = self [[ callbacks.var_df9b308efe82294a ]]();
        quantity = var_bffcbf6249872947[1];
        itembundle = var_bffcbf6249872947[0];
        shoulddrop = shoulddropitem(itembundle, quantity);
        if (shoulddrop) {
            self [[ callbacks.var_bd286dd0c1f53098 ]](quantity);
            items_dropitem(itembundle, quantity, dropstruct);
        }
        break;
    case #"hash_1cac65e1b8bf24a7":
    case #"hash_936cd4f623c2d2db":
    case #"hash_9bb0b5639d19444a":
    case #"hash_b06d15a59bd8ea50":
    case #"hash_d80af4621c199350":
    case #"hash_e534fd8ec73eafb4": 
        var_bffcc06249872b7a = self [[ callbacks.var_df9b308efe82294a ]]();
        quantity = var_bffcc06249872b7a[1];
        itembundle = var_bffcc06249872b7a[0];
        shoulddrop = shoulddropitem(itembundle, quantity);
        if (shoulddrop) {
            self [[ callbacks.var_bd286dd0c1f53098 ]]();
            items_dropitem(itembundle, quantity, dropstruct);
        }
        break;
    case #"hash_37276153aa1bb01d":
    case #"hash_3f28cec865ad2857":
    case #"hash_4c21f84c42d4988e":
    case #"hash_ab671284a3fc4e3d":
    case #"hash_ca90ddd937cbc83a":
    case #"hash_ee5a421e18a58c0f":
    case #"hash_f1a23e97c35685da": 
        assertmsg("[Inventory_DropEquippedItem] Should not equip items with type " + itemtype);
        break;
    default: 
        break;
    }
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25b4
// Size: 0x178
function function_10e55eeb4c15dd5a(item, autouse, var_95484d8d503de3b8) {
    if (!inventory_isenabled()) {
        return false;
    }
    scriptablename = item.type;
    if (function_f0c15201c9f7e1db(scriptablename)) {
        itembundlename = function_2cdc55ba39d97d70(scriptablename);
        var_9ec3e3e77fa5f56c = "itemspawnentry:" + itembundlename;
        if (function_633f07e180b6ec8f(var_9ec3e3e77fa5f56c)) {
            return false;
        }
        itembundle = getscriptbundle(var_9ec3e3e77fa5f56c);
        if (!function_b343caad692916aa(itembundle)) {
            return false;
        }
        if (!istrue(autouse) && function_4f73be3d1273e86b() && !function_3298f1ad0b756cbd(itembundle, function_b8bfea9514c89a77(item.count))) {
            lootid = function_6d15e119c2779a93(itembundle);
            function_354e083223035de2(item, lootid);
            return false;
        }
        var_c3051697735d1320 = item.var_4f74f0aef2b2a8bf;
        remainder = function_f64964e50cc34c47(itembundlename, itembundle, item, autouse);
        quantitystowed = item.count - remainder;
        if (remainder) {
            item.count = remainder;
        } else {
            item.count = 0;
            function_c14962ea14e58968(item);
        }
        if (quantitystowed > 0) {
            function_61e26b275dfa50e0(itembundle, quantitystowed, var_c3051697735d1320, 0, item, var_95484d8d503de3b8);
            return true;
        }
        if (!istrue(var_95484d8d503de3b8)) {
            function_fbfd7096a2dbc7e7(itembundle, 0);
        }
    }
    return false;
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2735
// Size: 0x17f
function function_354e083223035de2(item, lootid) {
    scriptablename = item.type;
    itembundlename = function_2cdc55ba39d97d70(scriptablename);
    if (!isdefined(itembundlename)) {
        assertmsg("<dev string:xd3>" + scriptablename + "<dev string:x113>");
        return 0;
    }
    var_9ec3e3e77fa5f56c = "itemspawnentry:" + itembundlename;
    if (function_633f07e180b6ec8f(var_9ec3e3e77fa5f56c)) {
        return 0;
    }
    itembundle = getscriptbundle(var_9ec3e3e77fa5f56c);
    if (!isdefined(itembundle)) {
        assertmsg("<dev string:x146>" + itembundlename + "<dev string:x113>");
        return 0;
    }
    self.var_34f110a584482e9 = gettime();
    if (!function_b343caad692916aa(itembundle) || istrue(itembundle.notbackpack)) {
        return 0;
    }
    if (function_3298f1ad0b756cbd(itembundle, item.count)) {
        var_c3051697735d1320 = item.var_4f74f0aef2b2a8bf;
        remainder = function_f64964e50cc34c47(itembundlename, itembundle, item);
        stowed_count = item.count - remainder;
        if (remainder) {
            item.count = remainder;
        } else {
            item.count = 0;
            function_c14962ea14e58968(item);
        }
        function_61e26b275dfa50e0(itembundle, stowed_count, var_c3051697735d1320, 0, item);
        return;
    }
    item.var_9c44eb334c225d45 = 1;
    function_86d7576fb0f41e09(item, lootid);
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28bc
// Size: 0x157
function function_86d7576fb0f41e09(item, lootid) {
    if (!isdefined(item.var_9c44eb334c225d45)) {
        assertmsg("CommonInventoryERROR: Decision layer cannot be opened for a cache that has no defined decisionLayerSource parameter. It is required to define the behavior of the decision layer.");
        return;
    }
    stubcache = item;
    stubcache.contents = [];
    stubcache.containertype = 14;
    stubcache.contents[0] = spawnstruct();
    stubcache.contents[0].quantity = item.count;
    stubcache.contents[0].lootid = lootid;
    stubcache.var_978407de904a5fd1 = 1;
    if (isdefined(item.var_4f74f0aef2b2a8bf)) {
        stubcache.contents[0].weapondata = spawnstruct();
        stubcache.contents[0].weapondata.rarity = item.var_4f74f0aef2b2a8bf.rarity;
        stubcache.contents[0].weapondata.attachments = item.var_4f74f0aef2b2a8bf.attachments;
    }
    function_7ea0601f1375d4c7(stubcache);
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a1b
// Size: 0x1f1
function function_7ea0601f1375d4c7(stubcache) {
    if (!isdefined(stubcache.var_9c44eb334c225d45)) {
        assertmsg("CommonInventoryERROR: Decision layer cannot be opened for a cache that has no defined decisionLayerSource parameter. It is required to define the behavior of the decision layer.");
        return;
    }
    if (stubcache.var_9c44eb334c225d45 == 0 || istrue(stubcache.fromcache)) {
        assertmsg("CommonInventoryERROR: Decision layer cannot be opened from the Common Inventory script for an item that is from a cache. The UI should open the decision layer internally.");
        return;
    }
    itemcount = stubcache.contents[0].quantity;
    itemlootid = stubcache.contents[0].lootid;
    itemweapondata = stubcache.contents[0].weapondata;
    stubcache.var_6a32bedb4200b578 = self.var_2fa5b49969def47;
    stubcache.var_d8667251a92de6f2 = self.var_f2aa9ae949179907;
    self.var_2fa5b49969def47 = stubcache;
    self.var_f2aa9ae949179907 = self.origin;
    if (stubcache.var_9c44eb334c225d45 == 1 && !isstruct(stubcache) && stubcache function_73cc0f04c4c5001d()) {
        foreach (player in level.players) {
            stubcache disablescriptableplayeruse(player);
        }
    }
    namespace_3883e3399f2870b5::function_446c7ad7bcc70992(self, 0, itemlootid, function_b8bfea9514c89a77(itemcount), itemweapondata);
    for (itemindex = 1; itemindex < 10; itemindex++) {
        namespace_3883e3399f2870b5::function_c7294f5b9b5006d5(self, itemindex);
    }
    self setclientomnvar("loot_container_weapon", 0);
    self setclientomnvar("loot_container_open", stubcache.containertype);
    thread function_833716900e3b8d89(stubcache);
    stubcache thread function_ceec15c03350d7d3(self);
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c14
// Size: 0x189
function function_cc518f9c6e1d9543(stubcache) {
    if (!isdefined(stubcache.var_9c44eb334c225d45)) {
        assertmsg("CommonInventoryERROR: Decision layer cannot be opened for a cache that has no defined decisionLayerSource parameter. It is required to define the behavior of the decision layer.");
        return;
    }
    self setclientomnvar("loot_container_open", 0);
    if (stubcache.var_9c44eb334c225d45 == 1 && !isstruct(stubcache) && stubcache function_73cc0f04c4c5001d()) {
        if (namespace_3883e3399f2870b5::isContainerEmpty(stubcache)) {
            function_c14962ea14e58968(stubcache);
        } else {
            foreach (player in level.players) {
                stubcache enablescriptableplayeruse(player);
            }
        }
    }
    if (stubcache.var_9c44eb334c225d45 == 2 && isstruct(stubcache) && !namespace_3883e3399f2870b5::isContainerEmpty(stubcache)) {
        lootid = stubcache.contents[0].lootid;
        quantity = stubcache.contents[0].quantity;
        function_b9d2aee928c46b5f(lootid, quantity);
        function_eff2aed88a59ccfd(self, 0, 0, 0);
    }
    self.var_2fa5b49969def47 = stubcache.var_6a32bedb4200b578;
    self.var_f2aa9ae949179907 = stubcache.var_d8667251a92de6f2;
    stubcache.var_6a32bedb4200b578 = undefined;
    stubcache.var_d8667251a92de6f2 = undefined;
    stubcache notify("closed");
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2da5
// Size: 0x49
function function_833716900e3b8d89(cache) {
    level endon("game_ended");
    self endon("death");
    self endon("disconnect");
    cache endon("death");
    cache endon("closed");
    while (function_d47564d30fb44889(cache)) {
        wait 0.05;
    }
    function_cc518f9c6e1d9543(cache);
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2df6
// Size: 0x85
function function_d47564d30fb44889(cache) {
    if (istrue(self.isdisconnecting)) {
        return false;
    }
    if (self playerads() >= 0.5) {
        return false;
    }
    if (cache.var_9c44eb334c225d45 != 2) {
        if (distancesquared(self.origin, self.var_f2aa9ae949179907) > level.var_de221bfb117f1fd1 * level.var_de221bfb117f1fd1) {
            return false;
        }
        if (!function_7ccc263b372af2bc(cache)) {
            return false;
        }
        if (!namespace_3883e3399f2870b5::function_d6041f45fee8083d()) {
            return false;
        }
    }
    return true;
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e84
// Size: 0x50
function function_ceec15c03350d7d3(player) {
    level endon("game_ended");
    self endon("death");
    player endon("death");
    player endon("disconnect");
    waittill_any_5("closed", "close_container", "flashbang", "concussed", "weapon_fired");
    player function_cc518f9c6e1d9543(self);
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2edc
// Size: 0xe7
function function_2d05d3354917445b(backpackindex, lootid, quantity) {
    newitembundlename = function_fc925a153c7fd55c(lootid);
    var_a8856d1c2cbf78f6 = undefined;
    if (isdefined(newitembundlename)) {
        var_a8856d1c2cbf78f6 = "itemspawnentry:" + newitembundlename;
        if (function_633f07e180b6ec8f(var_a8856d1c2cbf78f6)) {
            return;
        }
    }
    backpacklootid = function_d870b2c45335bd88(backpackindex);
    backpackquantity = function_5ce7fe3dca9c1a22(backpackindex);
    oldbundlename = function_fc925a153c7fd55c(backpacklootid);
    var_c8072c59ba873dc1 = getscriptbundle("itemspawnentry:" + oldbundlename);
    items_dropitem(var_c8072c59ba873dc1, backpackquantity);
    function_ca3bbb1070436540(backpackindex, lootid, quantity);
    if (isdefined(var_a8856d1c2cbf78f6)) {
        newitembundle = function_50f8a8f765bad85e(var_a8856d1c2cbf78f6, [#"pickupsfx"]);
        function_fbfd7096a2dbc7e7(newitembundle, 1);
    }
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fcb
// Size: 0x71
function inventory_isenabled() {
    if (isdefined(level.gametypebundle) && istrue(level.gametypebundle.var_d651598a91f20ae3)) {
        if (istrue(level.gametypebundle.var_a3f121ced843d5e)) {
            return (isdefined(level.gametypebundle.backpackkey) && level.gametypebundle.backpackkey != "");
        }
    }
    return false;
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3045
// Size: 0x15
function function_9bb27db31cac473d() {
    return level.gametypebundle.backpackkey;
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3063
// Size: 0x7
function function_2205ef8e9a67e1be() {
    return "backpackSize";
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3073
// Size: 0x7
function function_5f55af0d9c99908b() {
    return "dmzWeapon";
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3083
// Size: 0x82
function function_d3405ff387ff4f2e() {
    backpack_size = default_to(level.gametypebundle.backpacksize, 8);
    setdvarifuninitialized(@"hash_4449685517101675", istrue(level.gametypebundle.var_413ebee422ca9e3c));
    if (istrue(level.gametypebundle.var_413ebee422ca9e3c)) {
        setdvarifuninitialized(@"hash_5fcbce13ef8d5f", backpack_size);
    }
    setdvarifuninitialized(@"hash_a384f4621ba11550", backpack_size);
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x310d
// Size: 0x12
function function_286713f0349afb22() {
    return getdvarint(@"hash_a384f4621ba11550", 8);
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3128
// Size: 0x75
function function_181a584e4a68d5d6(lootid, quantity) {
    if (!isdefined(quantity)) {
        quantity = 1;
    }
    backpackindex = function_4776284a348ebb6a(lootid);
    if (backpackindex == -1) {
        return false;
    }
    backpackquantity = function_5ce7fe3dca9c1a22(backpackindex);
    if (quantity <= 0) {
        return false;
    }
    backpackquantity -= quantity;
    if (backpackquantity <= 0) {
        function_ca3bbb1070436540(backpackindex, 0, 0);
    } else {
        function_ca3bbb1070436540(backpackindex, lootid, backpackquantity);
    }
    return true;
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31a6
// Size: 0x3e
function function_1b35b10884bd8d67() {
    result = self getplayerdata(level.var_5d69837cf4db0407, function_2205ef8e9a67e1be());
    if (!isdefined(result)) {
        result = function_286713f0349afb22();
        assertmsg("CommonInventoryError: Failed to get the backpackSize from the player data; returning the default instead.");
    }
    return result;
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31ed
// Size: 0x79
function function_32c79be2384f10fb(size, itembundle) {
    if (istrue(level.gametypebundle.var_413ebee422ca9e3c)) {
        return;
    }
    if (isdefined(size)) {
        self setplayerdata(level.var_5d69837cf4db0407, function_2205ef8e9a67e1be(), size);
    } else {
        self setplayerdata(level.var_5d69837cf4db0407, function_2205ef8e9a67e1be(), function_286713f0349afb22());
    }
    self setclientomnvar("ui_loot_backpack_type", function_afb28406eb20d361(itembundle));
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x326e
// Size: 0x65
function function_afb28406eb20d361(itembundle) {
    if (!isdefined(itembundle)) {
        return 0;
    }
    itemref = itembundle.ref;
    if (!isdefined(itemref)) {
        return 0;
    }
    switch (itemref) {
    case #"hash_75ca97f27fab119c": 
        return 1;
    case #"hash_5cdbaa0bf3e5ebfe": 
        return 2;
    default: 
        return 0;
    }
    return 0;
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32dc
// Size: 0x26
function function_d870b2c45335bd88(index) {
    return self getplayerdata(level.var_5d69837cf4db0407, function_9bb27db31cac473d(), index, "lootID");
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x330b
// Size: 0x26
function function_5ce7fe3dca9c1a22(index) {
    return self getplayerdata(level.var_5d69837cf4db0407, function_9bb27db31cac473d(), index, "quantity");
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x333a
// Size: 0xc1
function function_ca3bbb1070436540(index, lootid, quantity) {
    if (!isint(index) || index < 0 || index >= 256) {
        assertmsg("<dev string:x189>" + (isdefined(index) ? index : "<dev string:x1b1>") + "<dev string:x1bb>");
        return;
    }
    if (!isdefined(quantity)) {
        quantity = 0;
    }
    if (!isdefined(lootid) || lootid != 0 && quantity == 0) {
        lootid = 0;
    }
    backpackkey = function_9bb27db31cac473d();
    self setplayerdata(level.var_5d69837cf4db0407, backpackkey, index, "lootID", lootid);
    self setplayerdata(level.var_5d69837cf4db0407, backpackkey, index, "quantity", int(quantity));
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3403
// Size: 0xdd
function function_e2b4c63cab73c1f1() {
    weapon = self getplayerdata(level.var_5d69837cf4db0407, function_5f55af0d9c99908b(), "weapon");
    if (weapon == "none") {
        return undefined;
    }
    variantid = self getplayerdata(level.var_5d69837cf4db0407, function_5f55af0d9c99908b(), "variantID");
    attachments = [];
    attachmentids = [];
    for (attachmentindex = 0; attachmentindex < 7; attachmentindex++) {
        attachments[attachmentindex] = self getplayerdata(level.var_5d69837cf4db0407, function_5f55af0d9c99908b(), "attachmentSetup", attachmentindex, "attachment");
        attachmentids[attachmentindex] = self getplayerdata(level.var_5d69837cf4db0407, function_5f55af0d9c99908b(), "attachmentSetup", attachmentindex, "variantID");
    }
    return namespace_e0ee43ef2dddadaa::buildweapon(weapon, attachments, undefined, undefined, variantid, attachmentids);
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34e9
// Size: 0x1bc
function function_ad55c4cd0426138d(weapon) {
    rootname = namespace_e0ee43ef2dddadaa::getweaponrootname(weapon);
    variantid = weapon.variantid;
    if (!isdefined(weapon.variantid)) {
        variantid = 0;
    }
    ref = rootname;
    if (variantid) {
        ref = rootname + "_v" + variantid;
    }
    lootid = function_2c836ad05e5f634c(ref);
    self setplayerdata(level.var_5d69837cf4db0407, function_5f55af0d9c99908b(), "weapon", rootname);
    self setplayerdata(level.var_5d69837cf4db0407, function_5f55af0d9c99908b(), "variantID", variantid);
    self setplayerdata(level.var_5d69837cf4db0407, function_5f55af0d9c99908b(), "lootItemID", lootid);
    self.var_8a265f7b950a8d5d = self getweaponammoclip(weapon) + self getweaponammostock(weapon);
    if (weapon.hasalternate) {
        weaponalt = weapon getaltweapon();
        self.var_86b32aff94b5714e = self getweaponammoclip(weaponalt);
    }
    attachments = getweaponattachments(weapon);
    var_f957368a964a7504 = namespace_e0ee43ef2dddadaa::function_792bacb194f6f862(rootname);
    var_428a6c7cd65625c0 = 0;
    for (attachmentindex = 0; attachmentindex < attachments.size && var_428a6c7cd65625c0 < 7; attachmentindex++) {
        if (!isdefined(var_f957368a964a7504[attachments[attachmentindex]])) {
            self setplayerdata(level.var_5d69837cf4db0407, function_5f55af0d9c99908b(), "attachmentSetup", var_428a6c7cd65625c0, "attachment", attachments[attachmentindex]);
            self setplayerdata(level.var_5d69837cf4db0407, function_5f55af0d9c99908b(), "attachmentSetup", var_428a6c7cd65625c0, "variantID", 0);
            var_428a6c7cd65625c0++;
        }
    }
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36ad
// Size: 0x22
function function_ced2abb96f1d86a5() {
    return self getplayerdata(level.var_5d69837cf4db0407, function_5f55af0d9c99908b(), "weapon") != "none";
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36d8
// Size: 0x1c
function function_69df855efa3b5b9e() {
    return self getplayerdata(level.var_5d69837cf4db0407, function_5f55af0d9c99908b(), "lootItemID");
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36fd
// Size: 0x175
function function_bd059d6c2e0ece90() {
    self setplayerdata(level.var_5d69837cf4db0407, function_5f55af0d9c99908b(), "weapon", "none");
    self setplayerdata(level.var_5d69837cf4db0407, function_5f55af0d9c99908b(), "lootItemID", 0);
    self setplayerdata(level.var_5d69837cf4db0407, function_5f55af0d9c99908b(), "camo", "none");
    self setplayerdata(level.var_5d69837cf4db0407, function_5f55af0d9c99908b(), "reticle", "none");
    self setplayerdata(level.var_5d69837cf4db0407, function_5f55af0d9c99908b(), "cosmeticAttachment", "none");
    self setplayerdata(level.var_5d69837cf4db0407, function_5f55af0d9c99908b(), "variantID", 0);
    self setplayerdata(level.var_5d69837cf4db0407, function_5f55af0d9c99908b(), "blueprintName", "");
    for (attachindex = 0; attachindex < 5; attachindex++) {
        self setplayerdata(level.var_5d69837cf4db0407, function_5f55af0d9c99908b(), "attachmentSetup", attachindex, "attachment", "none");
        self setplayerdata(level.var_5d69837cf4db0407, function_5f55af0d9c99908b(), "attachmentSetup", attachindex, "variantID", 0);
    }
    for (var_36d2abbdcbcb186c = 0; var_36d2abbdcbcb186c < 4; var_36d2abbdcbcb186c++) {
        self setplayerdata(level.var_5d69837cf4db0407, function_5f55af0d9c99908b(), "sticker", var_36d2abbdcbcb186c, "none");
    }
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x387a
// Size: 0x3c
function function_389d4cd85d174957() {
    backpacksize = function_1b35b10884bd8d67();
    for (i = 0; i < backpacksize; i++) {
        function_ca3bbb1070436540(i, 0, 0);
    }
    function_bd059d6c2e0ece90();
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x38be
// Size: 0x5c
function function_e70feddd94ade74f() {
    primaryweaponlootid = function_2c836ad05e5f634c("iw9_pi_golf17");
    function_9ac814eecef8b3af(0, 0, "iw9_pi_golf17", primaryweaponlootid);
    function_9ac814eecef8b3af(0, 1);
    function_cf99f67e363f5d6c(0, 0, "none");
    function_cf99f67e363f5d6c(0, 1, "none");
    function_b10833eee9e6a55f(0, 0, "none");
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3922
// Size: 0x260
function function_9ac814eecef8b3af(classindex, weaponindex, clearweapon, clearweaponid) {
    if (isdefined(clearweapon) && isdefined(clearweaponid)) {
        self setplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "weapon", clearweapon);
        self setplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "lootItemID", clearweaponid);
    } else {
        self setplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "weapon", "iw9_me_fists");
        self setplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "lootItemID", 0);
    }
    self setplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "camo", "none");
    self setplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "reticle", "none");
    self setplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "cosmeticAttachment", "none");
    self setplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "variantID", 0);
    self setplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "blueprintName", "");
    for (attachindex = 0; attachindex < 5; attachindex++) {
        self setplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "attachmentSetup", attachindex, "attachment", "none");
        self setplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "attachmentSetup", attachindex, "variantID", 0);
    }
    for (var_36d2abbdcbcb186c = 0; var_36d2abbdcbcb186c < 4; var_36d2abbdcbcb186c++) {
        self setplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "sticker", var_36d2abbdcbcb186c, "none");
    }
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b8a
// Size: 0x42
function function_cf99f67e363f5d6c(classindex, equipindex, ref) {
    self setplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "equipmentSetups", equipindex, "equipment", ref);
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bd4
// Size: 0x3d
function function_b10833eee9e6a55f(classindex, superindex, ref) {
    self setplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "fieldUpgrades", superindex, ref);
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3c19
// Size: 0x34
function function_9000524cb245fdbe(index, ref) {
    self setplayerdata(level.loadoutdata, "squadMembers", "killstreakSetups", index, "killstreak", ref);
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c55
// Size: 0x21
function function_4df538728f6d3815(weaponslotindex) {
    if (namespace_9571f642f38c8169::function_a6172e49f7313fd8()) {
        return namespace_9571f642f38c8169::function_7cce337c4902cbb6(weaponslotindex);
    }
    return undefined;
}

// Namespace common_inventory / namespace_feea61bc660e9e0f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c7e
// Size: 0xd9
function function_852cd6dd29c274bd(currentweapon) {
    if (!isweapon(currentweapon) || isnullweapon(currentweapon)) {
        return false;
    }
    assertex(isplayer(self), "Inventory_IsWeaponObjInsured needs to be called on a player");
    var_bbec008369304198 = [0, 1, 2];
    foreach (var_fb4895ca57fbf227 in var_bbec008369304198) {
        w_slot = namespace_736197e4d378b91b::function_2aeaf88105d3b617(var_fb4895ca57fbf227);
        if (isdefined(currentweapon) && isdefined(w_slot) && currentweapon == w_slot) {
            var_f0ee9ada549b5763 = function_4df538728f6d3815(var_fb4895ca57fbf227);
            if (isdefined(var_f0ee9ada549b5763)) {
                return true;
            }
        }
    }
    return false;
}

