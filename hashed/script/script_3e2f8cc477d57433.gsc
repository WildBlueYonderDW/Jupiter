// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_4c770a9a4ad7659c;
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

#namespace namespace_fe9526a81c458d8f;

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9de
// Size: 0x52
function inventory_init() {
    if (!function_a50a7be98d81e4fd()) {
        return;
    }
    if (!isdefined(level.var_986acb83cc29ed77)) {
        /#
            assertmsg("CommonInventoryERROR: Common Item not initialized! Do not call common_inventory::init() directly");
        #/
        return;
    }
    function_d3405ff387ff4f2e();
    namespace_3846cfb60b2ef12f::registeronluieventcallback(&function_893d47a3b0d1dfe2);
    registersharedfunc("game", "removeFirstFromBackpack", &function_181a584e4a68d5d6);
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa37
// Size: 0x456
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
                function_bbb84c7aefef705(itemtype, itemindex, 1);
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
                function_bbb84c7aefef705(itemtype, itemindex);
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
                /#
                    assertmsg("CommonInventoryERROR: attempted to move an invalid item of type [" + itemtype + "] from the loadout to the backpack");
                #/
                break;
            }
            itemcount = function_7209c8cd4b2e3afd(quantity);
            remainder = function_4b5b6b5953138fe7(itembundle, itemcount);
            if (remainder == 0) {
                break;
            }
            var_4a6f8d42ee3c45b = function_7209c8cd4b2e3afd(remainder);
            function_1a95cb90efa117b8(itembundle, var_4a6f8d42ee3c45b);
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
                /#
                    /#
                        assertmsg(" did not return a valid remainder" + lootid + "<unknown string>");
                    #/
                #/
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
            var_cbff58f20636601e = var_57acddc40b2f741[1];
            var_632d9a80cbdc3a50 = var_57acddc40b2f741[0];
            item = spawnstruct();
            item.count = var_cbff58f20636601e;
            item.var_9c44eb334c225d45 = 2;
            lootid = function_6d15e119c2779a93(var_632d9a80cbdc3a50);
            function_86d7576fb0f41e09(item, lootid);
            break;
        default:
            break;
        }
    }
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe94
// Size: 0x1a
function private function_a46acbfe17ad9a54(var_421750c958bd3064) {
    return (var_421750c958bd3064 & 256 - 1 << 8) >> 8;
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xeb6
// Size: 0x14
function private function_4953ec8e37aa67b8(var_421750c958bd3064) {
    return var_421750c958bd3064 & 256 - 1;
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xed2
// Size: 0x69
function private function_bbb84c7aefef705(itemtype, itemindex, quantity) {
    var_57acadc40b2f0a8 = function_80fcd9b9bddea7a9(itemtype, itemindex, quantity);
    var_cbff58f20636601e = var_57acadc40b2f0a8[1];
    var_632d9a80cbdc3a50 = var_57acadc40b2f0a8[0];
    if (isdefined(var_632d9a80cbdc3a50) && isdefined(var_cbff58f20636601e) && var_cbff58f20636601e > 0) {
        function_a2560fe66d697e02(var_632d9a80cbdc3a50, var_cbff58f20636601e);
    }
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf42
// Size: 0x3d5
function private function_80fcd9b9bddea7a9(itemtype, itemindex, quantity) {
    var_632d9a80cbdc3a50 = undefined;
    var_cbff58f20636601e = 0;
    switch (itemtype) {
    case 0:
        if (function_ceee9e1f4c8d1135()) {
            callbacks = function_cca8bbe88a39ad41("currency");
            var_57acbdc40b2f2db = self [[ callbacks.var_df9b308efe82294a ]]();
            var_ff239359935aa777 = var_57acbdc40b2f2db[1];
            var_632d9a80cbdc3a50 = var_57acbdc40b2f2db[0];
            var_74806f0c4caa7e55 = var_ff239359935aa777;
            if (isdefined(quantity)) {
                var_74806f0c4caa7e55 = quantity * getmatchrulesdata("brData", "plunderDropSomeAmount");
            }
            var_cbff58f20636601e = self [[ callbacks.var_bd286dd0c1f53098 ]](var_74806f0c4caa7e55);
        }
        break;
    case 1:
        callbacks = function_cca8bbe88a39ad41("weapon");
        self [[ callbacks.var_bd286dd0c1f53098 ]](itemindex);
        break;
    case 2:
        slot = namespace_1a507865f681850e::function_4967838290cb31b9(itemindex);
        item_type = "lethal";
        if (slot == "secondary") {
            item_type = "tactical";
        }
        if (slot == "health") {
            item_type = "armor";
        }
        callbacks = function_cca8bbe88a39ad41(item_type);
        var_57ad0dc40b2fdda = self [[ callbacks.var_df9b308efe82294a ]]();
        var_ff239359935aa777 = var_57ad0dc40b2fdda[1];
        var_632d9a80cbdc3a50 = var_57ad0dc40b2fdda[0];
        var_cbff58f20636601e = self [[ callbacks.var_bd286dd0c1f53098 ]](quantity);
        break;
    case 3:
        item_type = "killstreak";
        callbacks = function_cca8bbe88a39ad41(item_type);
        var_57ad1dc40b3000d = self [[ callbacks.var_df9b308efe82294a ]]();
        var_cbff58f20636601e = var_57ad1dc40b3000d[1];
        var_632d9a80cbdc3a50 = var_57ad1dc40b3000d[0];
        self [[ callbacks.var_bd286dd0c1f53098 ]]();
        break;
    case 4:
        item_type = "super";
        callbacks = function_cca8bbe88a39ad41(item_type);
        var_57acedc40b2f974 = self [[ callbacks.var_df9b308efe82294a ]]();
        var_cbff58f20636601e = var_57acedc40b2f974[1];
        var_632d9a80cbdc3a50 = var_57acedc40b2f974[0];
        self [[ callbacks.var_bd286dd0c1f53098 ]]();
        break;
    case 6:
        item_type = "gasmask";
        callbacks = function_cca8bbe88a39ad41(item_type);
        var_57acfdc40b2fba7 = self [[ callbacks.var_df9b308efe82294a ]]();
        var_cbff58f20636601e = var_57acfdc40b2fba7[1];
        var_632d9a80cbdc3a50 = var_57acfdc40b2fba7[0];
        self [[ callbacks.var_bd286dd0c1f53098 ]]();
        break;
    case 7:
        item_type = "revive";
        callbacks = function_cca8bbe88a39ad41(item_type);
        var_57ac4dc40b2e376 = self [[ callbacks.var_df9b308efe82294a ]]();
        var_cbff58f20636601e = var_57ac4dc40b2e376[1];
        var_632d9a80cbdc3a50 = var_57ac4dc40b2e376[0];
        self [[ callbacks.var_bd286dd0c1f53098 ]]();
        break;
    case 5:
    case 10:
        var_85c5e39d7ff5976c = function_d870b2c45335bd88(itemindex);
        var_ff239359935aa777 = function_5ce7fe3dca9c1a22(itemindex);
        var_e0ceabe179f1f193 = function_fc925a153c7fd55c(var_85c5e39d7ff5976c);
        if (!isdefined(var_e0ceabe179f1f193)) {
            /#
                assertmsg("CommonInventoryERROR: itemspawnentry not found for lootID [" + var_85c5e39d7ff5976c + "] when attempting to remove an item from a rucksack or ammo slot.");
            #/
            break;
        }
        var_632d9a80cbdc3a50 = getscriptbundle("itemspawnentry:" + var_e0ceabe179f1f193);
        var_699de62155c8c832 = 0;
        var_a28bd7f30254c8a0 = 0;
        var_cbff58f20636601e = var_ff239359935aa777;
        if (isdefined(quantity) && quantity > 0 && quantity < var_ff239359935aa777 && !istrue(var_632d9a80cbdc3a50.var_ec7430d9ed0b6e64)) {
            var_cbff58f20636601e = quantity;
            var_699de62155c8c832 = var_85c5e39d7ff5976c;
            var_a28bd7f30254c8a0 = var_ff239359935aa777 - var_cbff58f20636601e;
        }
        function_ca3bbb1070436540(itemindex, var_699de62155c8c832, var_a28bd7f30254c8a0);
        break;
    case 11:
        break;
    }
    return [0:var_632d9a80cbdc3a50, 1:var_cbff58f20636601e];
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x131f
// Size: 0xab
function function_400fb193601d3a21() {
    var_17d89f18c1d0eb4f = self getcurrentweapon();
    function_ad6e2b653093328a();
    if (var_17d89f18c1d0eb4f.basename != "iw9_me_fists_mp" && !issameweapon(var_17d89f18c1d0eb4f, level.weaponnone)) {
        function_ad55c4cd0426138d(var_17d89f18c1d0eb4f);
    }
    self takeweapon(var_17d89f18c1d0eb4f);
    params = spawnstruct();
    params.var_ddf96c1d743bee31 = "backpack";
    params.var_d84bffa3178eec97 = 0;
    params.newlocation = "loadout";
    params.var_1e6cc7248a40392e = 0;
    callback::callback("inventory_item_moved", params);
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13d1
// Size: 0x49
function function_777092be5abab355(itemslotindex) {
    lootid = function_d870b2c45335bd88(itemslotindex);
    quantity = function_5ce7fe3dca9c1a22(itemslotindex);
    if (lootid == 0 || quantity == 0) {
        return;
    }
    function_b9d2aee928c46b5f(lootid, quantity, itemslotindex, undefined);
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1421
// Size: 0x26e
function function_b9d2aee928c46b5f(lootid, quantity, var_521c08b41ba6f145, var_e97d731bedd44c63, var_cbc0ab512152abfc) {
    var_5c8082e48f1a6bfd = function_fc925a153c7fd55c(lootid);
    var_a8856d1c2cbf78f6 = "itemspawnentry:" + var_5c8082e48f1a6bfd;
    if (function_633f07e180b6ec8f(var_a8856d1c2cbf78f6)) {
        return 0;
    }
    var_ffe2f7bc3157d1de = getscriptbundle(var_a8856d1c2cbf78f6);
    var_2aac741db0d5fe2e = var_ffe2f7bc3157d1de.scriptable;
    if (!isdefined(var_2aac741db0d5fe2e)) {
        return 0;
    }
    var_c2434c5c042d5216 = function_cca8bbe88a39ad41(var_ffe2f7bc3157d1de.type);
    if (!isdefined(var_c2434c5c042d5216)) {
        /#
            assertmsg("CommonInventoryERROR: attempted to equip invalid item type [" + var_ffe2f7bc3157d1de.type + "] from inventory");
        #/
        return 0;
    }
    if (isdefined(var_c2434c5c042d5216.var_86af96fe008c96ee) && !self [[ var_c2434c5c042d5216.var_86af96fe008c96ee ]](var_ffe2f7bc3157d1de, undefined, 0, 1)) {
        function_fbfd7096a2dbc7e7(var_ffe2f7bc3157d1de, 0);
        return 0;
    }
    var_57ac5dc40b2e5a9 = self [[ var_c2434c5c042d5216.var_df9b308efe82294a ]]();
    var_e579c2c25060c270 = var_57ac5dc40b2e5a9[1];
    var_c8072c59ba873dc1 = var_57ac5dc40b2e5a9[0];
    var_c4c781308ba64c2 = var_e579c2c25060c270;
    var_4887bb4c8348dddc = function_7209c8cd4b2e3afd(quantity, undefined, var_e97d731bedd44c63);
    var_891df1426c6fffe5 = function_1a95cb90efa117b8(var_ffe2f7bc3157d1de, var_4887bb4c8348dddc);
    if (isarray(var_891df1426c6fffe5)) {
        var_891df1426c6fffe5 = var_891df1426c6fffe5[0];
    }
    if (var_891df1426c6fffe5 >= var_4887bb4c8348dddc) {
        function_fbfd7096a2dbc7e7(var_ffe2f7bc3157d1de, 0);
        return 0;
    }
    /#
        assertex(isdefined(var_891df1426c6fffe5), "CommonInventoryERROR: Equipping item of type " + var_ffe2f7bc3157d1de.type + " did not return a valid remainder");
    #/
    if (isstruct(var_c8072c59ba873dc1) && isdefined(var_c8072c59ba873dc1.ref) && var_c8072c59ba873dc1.ref == var_ffe2f7bc3157d1de.ref && !istrue(var_ffe2f7bc3157d1de.var_6fdd94841e93829f)) {
        var_c4c781308ba64c2 = var_891df1426c6fffe5;
        var_e579c2c25060c270 = var_891df1426c6fffe5;
        goto LOC_00000209;
    }
LOC_00000209:
    if (isdefined(var_521c08b41ba6f145)) {
        var_72371d0de2680b76 = 0;
        if (isdefined(var_c8072c59ba873dc1) && var_c4c781308ba64c2 > 0) {
            var_72371d0de2680b76 = function_6d15e119c2779a93(var_c8072c59ba873dc1);
        }
        function_ca3bbb1070436540(var_521c08b41ba6f145, var_72371d0de2680b76, var_c4c781308ba64c2);
    }
    if (isdefined(var_cbc0ab512152abfc) && var_cbc0ab512152abfc && !isdefined(var_521c08b41ba6f145) && isdefined(var_c8072c59ba873dc1) && var_e579c2c25060c270 > 0) {
        function_a2560fe66d697e02(var_c8072c59ba873dc1, var_e579c2c25060c270);
    }
    function_fbfd7096a2dbc7e7(var_ffe2f7bc3157d1de, 1);
    return 1;
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1697
// Size: 0x125
function function_f64964e50cc34c47(var_fbe755f0978c0369, itembundle, item, var_b2635db617b09abd) {
    lootid = function_6d15e119c2779a93(itembundle);
    if (!isdefined(lootid)) {
        /#
            assertmsg("CommonInventoryERROR: Attempting to add item [" + var_fbe755f0978c0369 + "] to inventory but lootID is undefined");
        #/
        return item.count;
    }
    count = function_b8bfea9514c89a77(item.count);
    if (function_3298f1ad0b756cbd(itembundle, count, var_b2635db617b09abd)) {
        params = spawnstruct();
        params.item = item;
        params.var_fbe755f0978c0369 = var_fbe755f0978c0369;
        params.itembundle = itembundle;
        params.var_a64e5e1ee95c7b96 = 1;
        callback::callback("player_item_pickup", params);
        remainder = function_4b5b6b5953138fe7(itembundle, item.count);
        if (remainder <= 0) {
            self notify("self_pickedupitem", function_40fd49171fad19d3(item.type));
        }
        return remainder;
    }
    return item.count;
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17c4
// Size: 0xf1
function function_3298f1ad0b756cbd(itembundle, quantity, var_b2635db617b09abd) {
    backpackSize = function_1b35b10884bd8d67();
    lootid = function_6d15e119c2779a93(itembundle);
    for (i = 0; i < backpackSize; i++) {
        var_eeeae9defa0c1e95 = function_d870b2c45335bd88(i);
        if (var_eeeae9defa0c1e95 == 0 && var_eeeae9defa0c1e95 != lootid && (!istrue(var_b2635db617b09abd) || istrue(itembundle.var_bbae53787b1abf3e) && istrue(itembundle.var_515391a9c294e239))) {
            return 1;
        }
        if (var_eeeae9defa0c1e95 == lootid && !istrue(itembundle.var_6fdd94841e93829f) && (!istrue(var_b2635db617b09abd) || istrue(itembundle.var_bbae53787b1abf3e))) {
            var_ff239359935aa777 = function_5ce7fe3dca9c1a22(i);
            if (var_ff239359935aa777 < function_c7171bcea41dd66f(itembundle)) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18bd
// Size: 0x48
function function_4f73be3d1273e86b() {
    backpackSize = function_1b35b10884bd8d67();
    for (i = 0; i < backpackSize; i++) {
        var_eeeae9defa0c1e95 = function_d870b2c45335bd88(i);
        if (var_eeeae9defa0c1e95 == 0) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x190d
// Size: 0x67
function function_4776284a348ebb6a(var_b7e583d90618fed3) {
    if (!isdefined(var_b7e583d90618fed3)) {
        /#
            assert("CommonInventoryERROR: Undefined target lootID.");
        #/
        return -1;
    }
    backpackSize = function_1b35b10884bd8d67();
    for (i = 0; i < backpackSize; i++) {
        var_eeeae9defa0c1e95 = function_d870b2c45335bd88(i);
        if (var_eeeae9defa0c1e95 == var_b7e583d90618fed3) {
            return i;
        }
    }
    return -1;
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x197c
// Size: 0x1cd
function function_4b5b6b5953138fe7(itembundle, itemcount) {
    if (!isdefined(itembundle) || !isdefined(itemcount)) {
        /#
            assertmsg("CommonInventoryERROR: Attempting to add undefined item object to backpack");
        #/
        return 0;
    }
    /#
        var_f693719c5cddff8c = ter_op(isdefined(itembundle.ref), itembundle.ref, "<unknown string>");
    #/
    lootid = function_6d15e119c2779a93(itembundle);
    if (!isdefined(lootid)) {
        /#
            /#
                assertmsg("<unknown string>" + function_2cdc55ba39d97d70(var_f693719c5cddff8c) + "<unknown string>");
            #/
        #/
        return itemcount;
    }
    quantity = function_b8bfea9514c89a77(itemcount);
    maxcount = function_c7171bcea41dd66f(itembundle);
    if (!istrue(itembundle.var_6fdd94841e93829f)) {
        for (i = 0; i < function_1b35b10884bd8d67(); i++) {
            var_eeeae9defa0c1e95 = function_d870b2c45335bd88(i);
            if (var_eeeae9defa0c1e95 == lootid) {
                var_e30b916adc1e2dc8 = function_5ce7fe3dca9c1a22(i);
                if (var_e30b916adc1e2dc8 <= maxcount) {
                    var_332e8d61868c5681 = maxcount - var_e30b916adc1e2dc8;
                    var_a17f14f68ba0defc = min(maxcount, var_e30b916adc1e2dc8 + quantity);
                    function_ca3bbb1070436540(i, lootid, var_a17f14f68ba0defc);
                    quantity = int(max(0, quantity - var_332e8d61868c5681));
                }
            }
            if (quantity <= 0) {
                return 0;
            }
        }
    }
    for (i = 0; i < function_1b35b10884bd8d67(); i++) {
        var_eeeae9defa0c1e95 = function_d870b2c45335bd88(i);
        if (var_eeeae9defa0c1e95 == 0 && var_eeeae9defa0c1e95 != lootid) {
            var_514fa029a62f1e60 = min(maxcount, quantity);
            function_ca3bbb1070436540(i, lootid, var_514fa029a62f1e60);
            quantity = quantity - var_514fa029a62f1e60;
            if (quantity <= 0) {
                return 0;
            }
        }
    }
    return function_7209c8cd4b2e3afd(quantity);
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b51
// Size: 0x214
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
            var_fbe755f0978c0369 = function_fc925a153c7fd55c(lootid);
            if (isdefined(var_fbe755f0978c0369)) {
                itembundle = getscriptbundle("itemspawnentry:" + var_fbe755f0978c0369);
                scriptable = itembundle.scriptable;
                item = spawnstruct();
                item.type = scriptable;
                item.count = function_7209c8cd4b2e3afd(quantity);
                function_de489fa2ffdb7f2d(item, 0);
            }
        }
    }
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d6c
// Size: 0x254
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

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1fc7
// Size: 0x1f3
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
        function_a2560fe66d697e02(itembundle, quantity, dropstruct);
    }
    callbacks = function_cca8bbe88a39ad41("tactical");
    var_bffcbb624987207b = self [[ callbacks.var_df9b308efe82294a ]]();
    quantity = var_bffcbb624987207b[1];
    itembundle = var_bffcbb624987207b[0];
    if (isdefined(itembundle)) {
        function_a2560fe66d697e02(itembundle, quantity, dropstruct);
    }
    callbacks = function_cca8bbe88a39ad41("super");
    var_bffcbc62498722ae = self [[ callbacks.var_df9b308efe82294a ]]();
    quantity = var_bffcbc62498722ae[1];
    itembundle = var_bffcbc62498722ae[0];
    if (isdefined(itembundle)) {
        function_a2560fe66d697e02(itembundle, quantity, dropstruct);
    }
    callbacks = function_cca8bbe88a39ad41("killstreak");
    var_bffcbd62498724e1 = self [[ callbacks.var_df9b308efe82294a ]]();
    quantity = var_bffcbd62498724e1[1];
    itembundle = var_bffcbd62498724e1[0];
    if (isdefined(itembundle)) {
        function_a2560fe66d697e02(itembundle, quantity, dropstruct);
    }
    for (i = 0; i < function_1b35b10884bd8d67(); i++) {
        lootid = function_d870b2c45335bd88(i);
        quantity = function_5ce7fe3dca9c1a22(i);
        if (isdefined(lootid) && lootid > 0) {
            bundlename = function_fc925a153c7fd55c(lootid);
            itembundle = getscriptbundle("itemspawnentry:" + bundlename);
            function_a2560fe66d697e02(itembundle, quantity, dropstruct);
        }
    }
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21c1
// Size: 0x5
function function_ceee9e1f4c8d1135() {
    return 1;
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x21ce
// Size: 0x23
function private function_39d074eb019a124c(itembundle, quantity) {
    return isdefined(itembundle) && isdefined(quantity) && quantity > 0;
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21f9
// Size: 0x8f
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
    function_a2560fe66d697e02(itembundle, quantity, dropstruct);
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x228f
// Size: 0x31e
function function_2166e0fab7a3263(itemtype, dropstruct, itemindex, var_26b448211c62d57a) {
    if (!isdefined(itemtype)) {
        /#
            assertmsg("[common_inventory] itemType is undefined!");
        #/
        return;
    }
    callbacks = function_cca8bbe88a39ad41(itemtype);
    if (!isdefined(callbacks)) {
        /#
            assertmsg("[common_inventory] Get callbacks fail for itemType " + itemtype);
        #/
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
        var_25f0d68ee22434eb = function_39d074eb019a124c(itembundle, var_987ea9f2095b357a);
        if (var_25f0d68ee22434eb) {
            while (quantity > 0) {
                var_cbff58f20636601e = self [[ callbacks.var_bd286dd0c1f53098 ]](quantity);
                quantity = max(quantity - var_cbff58f20636601e, 0);
            }
            while (var_987ea9f2095b357a > 0) {
                item = function_a2560fe66d697e02(itembundle, var_987ea9f2095b357a, dropstruct);
                if (!isdefined(item)) {
                    break;
                }
                var_987ea9f2095b357a = var_987ea9f2095b357a - item.count;
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
        var_25f0d68ee22434eb = function_39d074eb019a124c(itembundle, quantity);
        if (var_25f0d68ee22434eb) {
            self [[ callbacks.var_bd286dd0c1f53098 ]](quantity);
            function_a2560fe66d697e02(itembundle, quantity, dropstruct);
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
        var_25f0d68ee22434eb = function_39d074eb019a124c(itembundle, quantity);
        if (var_25f0d68ee22434eb) {
            self [[ callbacks.var_bd286dd0c1f53098 ]]();
            function_a2560fe66d697e02(itembundle, quantity, dropstruct);
        }
        break;
    case #"hash_37276153aa1bb01d":
    case #"hash_3f28cec865ad2857":
    case #"hash_4c21f84c42d4988e":
    case #"hash_ab671284a3fc4e3d":
    case #"hash_ca90ddd937cbc83a":
    case #"hash_ee5a421e18a58c0f":
    case #"hash_f1a23e97c35685da":
        /#
            assertmsg("[Inventory_DropEquippedItem] Should not equip items with type " + itemtype);
        #/
        break;
    default:
        break;
    }
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25b4
// Size: 0x179
function function_10e55eeb4c15dd5a(item, var_b2635db617b09abd, var_95484d8d503de3b8) {
    if (!function_a50a7be98d81e4fd()) {
        return 0;
    }
    scriptablename = item.type;
    if (function_f0c15201c9f7e1db(scriptablename)) {
        var_fbe755f0978c0369 = function_2cdc55ba39d97d70(scriptablename);
        var_9ec3e3e77fa5f56c = "itemspawnentry:" + var_fbe755f0978c0369;
        if (function_633f07e180b6ec8f(var_9ec3e3e77fa5f56c)) {
            return 0;
        }
        itembundle = getscriptbundle(var_9ec3e3e77fa5f56c);
        if (!function_b343caad692916aa(itembundle)) {
            return 0;
        }
        if (!istrue(var_b2635db617b09abd) && function_4f73be3d1273e86b() && !function_3298f1ad0b756cbd(itembundle, function_b8bfea9514c89a77(item.count))) {
            lootid = function_6d15e119c2779a93(itembundle);
            function_354e083223035de2(item, lootid);
            return 0;
        }
        var_c3051697735d1320 = item.var_4f74f0aef2b2a8bf;
        remainder = function_f64964e50cc34c47(var_fbe755f0978c0369, itembundle, item, var_b2635db617b09abd);
        var_dadb14c9ec5baea0 = item.count - remainder;
        if (remainder) {
            item.count = remainder;
        } else {
            item.count = 0;
            function_c14962ea14e58968(item);
        }
        if (var_dadb14c9ec5baea0 > 0) {
            function_61e26b275dfa50e0(itembundle, var_dadb14c9ec5baea0, var_c3051697735d1320, 0, item, var_95484d8d503de3b8);
            return 1;
        }
        if (!istrue(var_95484d8d503de3b8)) {
            function_fbfd7096a2dbc7e7(itembundle, 0);
        }
    }
    return 0;
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2735
// Size: 0x180
function function_354e083223035de2(item, lootid) {
    scriptablename = item.type;
    var_fbe755f0978c0369 = function_2cdc55ba39d97d70(scriptablename);
    if (!isdefined(var_fbe755f0978c0369)) {
        /#
            /#
                assertmsg("<unknown string>" + scriptablename + "<unknown string>");
            #/
        #/
        return 0;
    }
    var_9ec3e3e77fa5f56c = "itemspawnentry:" + var_fbe755f0978c0369;
    if (function_633f07e180b6ec8f(var_9ec3e3e77fa5f56c)) {
        return 0;
    }
    itembundle = getscriptbundle(var_9ec3e3e77fa5f56c);
    if (!isdefined(itembundle)) {
        /#
            /#
                assertmsg("<unknown string>" + var_fbe755f0978c0369 + "<unknown string>");
            #/
        #/
        return 0;
    }
    self.var_34f110a584482e9 = gettime();
    if (!function_b343caad692916aa(itembundle) || istrue(itembundle.var_8fef629751f7f080)) {
        return 0;
    }
    if (function_3298f1ad0b756cbd(itembundle, item.count)) {
        var_c3051697735d1320 = item.var_4f74f0aef2b2a8bf;
        remainder = function_f64964e50cc34c47(var_fbe755f0978c0369, itembundle, item);
        var_5d6757c066404a1d = item.count - remainder;
        if (remainder) {
            item.count = remainder;
        } else {
            item.count = 0;
            function_c14962ea14e58968(item);
        }
        function_61e26b275dfa50e0(itembundle, var_5d6757c066404a1d, var_c3051697735d1320, 0, item);
        return;
    }
    item.var_9c44eb334c225d45 = 1;
    function_86d7576fb0f41e09(item, lootid);
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28bc
// Size: 0x158
function function_86d7576fb0f41e09(item, lootid) {
    if (!isdefined(item.var_9c44eb334c225d45)) {
        /#
            assertmsg("CommonInventoryERROR: Decision layer cannot be opened for a cache that has no defined decisionLayerSource parameter. It is required to define the behavior of the decision layer.");
        #/
        return;
    }
    var_93480c91cabfda51 = item;
    var_93480c91cabfda51.contents = [];
    var_93480c91cabfda51.var_46a3a8565ac0c17c = 14;
    var_93480c91cabfda51.contents[0] = spawnstruct();
    var_93480c91cabfda51.contents[0].quantity = item.count;
    var_93480c91cabfda51.contents[0].lootid = lootid;
    var_93480c91cabfda51.var_978407de904a5fd1 = 1;
    if (isdefined(item.var_4f74f0aef2b2a8bf)) {
        var_93480c91cabfda51.contents[0].weapondata = spawnstruct();
        var_93480c91cabfda51.contents[0].weapondata.rarity = item.var_4f74f0aef2b2a8bf.rarity;
        var_93480c91cabfda51.contents[0].weapondata.attachments = item.var_4f74f0aef2b2a8bf.attachments;
    }
    function_7ea0601f1375d4c7(var_93480c91cabfda51);
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a1b
// Size: 0x1f2
function function_7ea0601f1375d4c7(var_93480c91cabfda51) {
    if (!isdefined(var_93480c91cabfda51.var_9c44eb334c225d45)) {
        /#
            assertmsg("CommonInventoryERROR: Decision layer cannot be opened for a cache that has no defined decisionLayerSource parameter. It is required to define the behavior of the decision layer.");
        #/
        return;
    }
    if (var_93480c91cabfda51.var_9c44eb334c225d45 == 0 || istrue(var_93480c91cabfda51.var_a6293f3144240b99)) {
        /#
            assertmsg("CommonInventoryERROR: Decision layer cannot be opened from the Common Inventory script for an item that is from a cache. The UI should open the decision layer internally.");
        #/
        return;
    }
    itemcount = var_93480c91cabfda51.contents[0].quantity;
    var_5834757d8993ae9 = var_93480c91cabfda51.contents[0].lootid;
    var_f401dbbbc7ec92fa = var_93480c91cabfda51.contents[0].weapondata;
    var_93480c91cabfda51.var_6a32bedb4200b578 = self.var_2fa5b49969def47;
    var_93480c91cabfda51.var_d8667251a92de6f2 = self.var_f2aa9ae949179907;
    self.var_2fa5b49969def47 = var_93480c91cabfda51;
    self.var_f2aa9ae949179907 = self.origin;
    if (var_93480c91cabfda51.var_9c44eb334c225d45 == 1 && !isstruct(var_93480c91cabfda51) && var_93480c91cabfda51 function_73cc0f04c4c5001d()) {
        foreach (player in level.players) {
            var_93480c91cabfda51 disablescriptableplayeruse(player);
        }
    }
    namespace_3883e3399f2870b5::function_446c7ad7bcc70992(self, 0, var_5834757d8993ae9, function_b8bfea9514c89a77(itemcount), var_f401dbbbc7ec92fa);
    for (itemindex = 1; itemindex < 10; itemindex++) {
        namespace_3883e3399f2870b5::function_c7294f5b9b5006d5(self, itemindex);
    }
    self setclientomnvar("loot_container_weapon", 0);
    self setclientomnvar("loot_container_open", var_93480c91cabfda51.var_46a3a8565ac0c17c);
    thread function_833716900e3b8d89(var_93480c91cabfda51);
    var_93480c91cabfda51 thread function_ceec15c03350d7d3(self);
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c14
// Size: 0x18a
function function_cc518f9c6e1d9543(var_93480c91cabfda51) {
    if (!isdefined(var_93480c91cabfda51.var_9c44eb334c225d45)) {
        /#
            assertmsg("CommonInventoryERROR: Decision layer cannot be opened for a cache that has no defined decisionLayerSource parameter. It is required to define the behavior of the decision layer.");
        #/
        return;
    }
    self setclientomnvar("loot_container_open", 0);
    if (var_93480c91cabfda51.var_9c44eb334c225d45 == 1 && !isstruct(var_93480c91cabfda51) && var_93480c91cabfda51 function_73cc0f04c4c5001d()) {
        if (namespace_3883e3399f2870b5::isContainerEmpty(var_93480c91cabfda51)) {
            function_c14962ea14e58968(var_93480c91cabfda51);
        } else {
            foreach (player in level.players) {
                var_93480c91cabfda51 enablescriptableplayeruse(player);
            }
        }
    }
    if (var_93480c91cabfda51.var_9c44eb334c225d45 == 2 && isstruct(var_93480c91cabfda51) && !namespace_3883e3399f2870b5::isContainerEmpty(var_93480c91cabfda51)) {
        lootid = var_93480c91cabfda51.contents[0].lootid;
        quantity = var_93480c91cabfda51.contents[0].quantity;
        function_b9d2aee928c46b5f(lootid, quantity);
        function_eff2aed88a59ccfd(self, 0, 0, 0);
    }
    self.var_2fa5b49969def47 = var_93480c91cabfda51.var_6a32bedb4200b578;
    self.var_f2aa9ae949179907 = var_93480c91cabfda51.var_d8667251a92de6f2;
    var_93480c91cabfda51.var_6a32bedb4200b578 = undefined;
    var_93480c91cabfda51.var_d8667251a92de6f2 = undefined;
    var_93480c91cabfda51 notify("closed");
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2da5
// Size: 0x4a
function function_833716900e3b8d89(cache) {
    level endon("game_ended");
    self endon("death");
    self endon("disconnect");
    cache endon("death");
    cache endon("closed");
    while (function_d47564d30fb44889(cache)) {
        wait(0.05);
    }
    function_cc518f9c6e1d9543(cache);
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2df6
// Size: 0x86
function function_d47564d30fb44889(cache) {
    if (istrue(self.isdisconnecting)) {
        return 0;
    }
    if (self playerads() >= 0.5) {
        return 0;
    }
    if (cache.var_9c44eb334c225d45 != 2) {
        if (distancesquared(self.origin, self.var_f2aa9ae949179907) > level.var_de221bfb117f1fd1 * level.var_de221bfb117f1fd1) {
            return 0;
        }
        if (!function_7ccc263b372af2bc(cache)) {
            return 0;
        }
        if (!namespace_3883e3399f2870b5::function_d6041f45fee8083d()) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e84
// Size: 0x51
function function_ceec15c03350d7d3(player) {
    level endon("game_ended");
    self endon("death");
    player endon("death");
    player endon("disconnect");
    waittill_any_5("closed", "close_container", "flashbang", "concussed", "weapon_fired");
    player function_cc518f9c6e1d9543(self);
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2edc
// Size: 0xe8
function function_2d05d3354917445b(var_65b695f0c0d909ed, lootid, quantity) {
    var_5c8082e48f1a6bfd = function_fc925a153c7fd55c(lootid);
    var_a8856d1c2cbf78f6 = undefined;
    if (isdefined(var_5c8082e48f1a6bfd)) {
        var_a8856d1c2cbf78f6 = "itemspawnentry:" + var_5c8082e48f1a6bfd;
        if (function_633f07e180b6ec8f(var_a8856d1c2cbf78f6)) {
            return;
        }
    }
    var_f27898e4afd922b4 = function_d870b2c45335bd88(var_65b695f0c0d909ed);
    var_dfab44d4d8d10b36 = function_5ce7fe3dca9c1a22(var_65b695f0c0d909ed);
    var_359fc7feb8dcc591 = function_fc925a153c7fd55c(var_f27898e4afd922b4);
    var_c8072c59ba873dc1 = getscriptbundle("itemspawnentry:" + var_359fc7feb8dcc591);
    function_a2560fe66d697e02(var_c8072c59ba873dc1, var_dfab44d4d8d10b36);
    function_ca3bbb1070436540(var_65b695f0c0d909ed, lootid, quantity);
    if (isdefined(var_a8856d1c2cbf78f6)) {
        var_ffe2f7bc3157d1de = function_50f8a8f765bad85e(var_a8856d1c2cbf78f6, [0:#"hash_cf3a656289908ddc"]);
        function_fbfd7096a2dbc7e7(var_ffe2f7bc3157d1de, 1);
    }
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fcb
// Size: 0x72
function function_a50a7be98d81e4fd() {
    if (isdefined(level.var_62f6f7640e4431e3) && istrue(level.var_62f6f7640e4431e3.var_d651598a91f20ae3)) {
        if (istrue(level.var_62f6f7640e4431e3.var_a3f121ced843d5e)) {
            return (isdefined(level.var_62f6f7640e4431e3.var_27273802aef3243e) && level.var_62f6f7640e4431e3.var_27273802aef3243e != "");
        }
    }
    return 0;
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3045
// Size: 0x16
function function_9bb27db31cac473d() {
    return level.var_62f6f7640e4431e3.var_27273802aef3243e;
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3063
// Size: 0x8
function function_2205ef8e9a67e1be() {
    return "backpackSize";
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3073
// Size: 0x8
function function_5f55af0d9c99908b() {
    return "dmzWeapon";
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3083
// Size: 0x83
function function_d3405ff387ff4f2e() {
    var_3c9f8c2767b62f9 = function_53c4c53197386572(level.var_62f6f7640e4431e3.backpackSize, 8);
    setdvarifuninitialized(@"hash_4449685517101675", istrue(level.var_62f6f7640e4431e3.var_413ebee422ca9e3c));
    if (istrue(level.var_62f6f7640e4431e3.var_413ebee422ca9e3c)) {
        setdvarifuninitialized(@"hash_5fcbce13ef8d5f", var_3c9f8c2767b62f9);
    }
    setdvarifuninitialized(@"hash_a384f4621ba11550", var_3c9f8c2767b62f9);
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x310d
// Size: 0x13
function function_286713f0349afb22() {
    return getdvarint(@"hash_a384f4621ba11550", 8);
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3128
// Size: 0x76
function function_181a584e4a68d5d6(lootid, quantity) {
    if (!isdefined(quantity)) {
        quantity = 1;
    }
    var_65b695f0c0d909ed = function_4776284a348ebb6a(lootid);
    if (var_65b695f0c0d909ed == -1) {
        return 0;
    }
    var_dfab44d4d8d10b36 = function_5ce7fe3dca9c1a22(var_65b695f0c0d909ed);
    if (quantity <= 0) {
        return 0;
    }
    var_dfab44d4d8d10b36 = var_dfab44d4d8d10b36 - quantity;
    if (var_dfab44d4d8d10b36 <= 0) {
        function_ca3bbb1070436540(var_65b695f0c0d909ed, 0, 0);
    } else {
        function_ca3bbb1070436540(var_65b695f0c0d909ed, lootid, var_dfab44d4d8d10b36);
    }
    return 1;
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31a6
// Size: 0x3f
function function_1b35b10884bd8d67() {
    result = self getplayerdata(level.var_5d69837cf4db0407, function_2205ef8e9a67e1be());
    if (!isdefined(result)) {
        result = function_286713f0349afb22();
        /#
            assertmsg("CommonInventoryError: Failed to get the backpackSize from the player data; returning the default instead.");
        #/
    }
    return result;
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31ed
// Size: 0x7a
function function_32c79be2384f10fb(size, itembundle) {
    if (istrue(level.var_62f6f7640e4431e3.var_413ebee422ca9e3c)) {
        return;
    }
    if (isdefined(size)) {
        self setplayerdata(level.var_5d69837cf4db0407, function_2205ef8e9a67e1be(), size);
    } else {
        self setplayerdata(level.var_5d69837cf4db0407, function_2205ef8e9a67e1be(), function_286713f0349afb22());
    }
    self setclientomnvar("ui_loot_backpack_type", function_afb28406eb20d361(itembundle));
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x326e
// Size: 0x66
function function_afb28406eb20d361(itembundle) {
    if (!isdefined(itembundle)) {
        return 0;
    }
    var_cb325ddb4a764623 = itembundle.ref;
    if (!isdefined(var_cb325ddb4a764623)) {
        return 0;
    }
    switch (var_cb325ddb4a764623) {
    case #"hash_75ca97f27fab119c":
        return 1;
    case #"hash_5cdbaa0bf3e5ebfe":
        return 2;
    default:
        return 0;
        break;
    }
    return 0;
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32dc
// Size: 0x27
function function_d870b2c45335bd88(index) {
    return self getplayerdata(level.var_5d69837cf4db0407, function_9bb27db31cac473d(), index, "lootID");
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x330b
// Size: 0x27
function function_5ce7fe3dca9c1a22(index) {
    return self getplayerdata(level.var_5d69837cf4db0407, function_9bb27db31cac473d(), index, "quantity");
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x333a
// Size: 0xc2
function function_ca3bbb1070436540(index, lootid, quantity) {
    if (!isint(index) || index < 0 || index >= 256) {
        /#
            /#
                assertmsg("<unknown string>" + (isdefined(index) ? index : "<unknown string>") + "<unknown string>");
            #/
        #/
        return;
    }
    if (!isdefined(quantity)) {
        quantity = 0;
    }
    if (!isdefined(lootid) || lootid != 0 && quantity == 0) {
        lootid = 0;
    }
    var_27273802aef3243e = function_9bb27db31cac473d();
    self setplayerdata(level.var_5d69837cf4db0407, var_27273802aef3243e, index, "lootID", lootid);
    self setplayerdata(level.var_5d69837cf4db0407, var_27273802aef3243e, index, "quantity", int(quantity));
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3403
// Size: 0xde
function function_e2b4c63cab73c1f1() {
    weapon = self getplayerdata(level.var_5d69837cf4db0407, function_5f55af0d9c99908b(), "weapon");
    if (weapon == "none") {
        return undefined;
    }
    variantid = self getplayerdata(level.var_5d69837cf4db0407, function_5f55af0d9c99908b(), "variantID");
    attachments = [];
    var_f3464d71f01f614e = [];
    for (attachmentindex = 0; attachmentindex < 7; attachmentindex++) {
        attachments[attachmentindex] = self getplayerdata(level.var_5d69837cf4db0407, function_5f55af0d9c99908b(), "attachmentSetup", attachmentindex, "attachment");
        var_f3464d71f01f614e[attachmentindex] = self getplayerdata(level.var_5d69837cf4db0407, function_5f55af0d9c99908b(), "attachmentSetup", attachmentindex, "variantID");
    }
    return namespace_e0ee43ef2dddadaa::buildweapon(weapon, attachments, undefined, undefined, variantid, var_f3464d71f01f614e);
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34e9
// Size: 0x1bd
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
        var_b6ff735c3690cc44 = weapon getaltweapon();
        self.var_86b32aff94b5714e = self getweaponammoclip(var_b6ff735c3690cc44);
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

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36ad
// Size: 0x23
function function_ced2abb96f1d86a5() {
    return self getplayerdata(level.var_5d69837cf4db0407, function_5f55af0d9c99908b(), "weapon") != "none";
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36d8
// Size: 0x1d
function function_69df855efa3b5b9e() {
    return self getplayerdata(level.var_5d69837cf4db0407, function_5f55af0d9c99908b(), "lootItemID");
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36fd
// Size: 0x176
function function_bd059d6c2e0ece90() {
    self setplayerdata(level.var_5d69837cf4db0407, function_5f55af0d9c99908b(), "weapon", "none");
    self setplayerdata(level.var_5d69837cf4db0407, function_5f55af0d9c99908b(), "lootItemID", 0);
    self setplayerdata(level.var_5d69837cf4db0407, function_5f55af0d9c99908b(), "camo", "none");
    self setplayerdata(level.var_5d69837cf4db0407, function_5f55af0d9c99908b(), "reticle", "none");
    self setplayerdata(level.var_5d69837cf4db0407, function_5f55af0d9c99908b(), "cosmeticAttachment", "none");
    self setplayerdata(level.var_5d69837cf4db0407, function_5f55af0d9c99908b(), "variantID", 0);
    self setplayerdata(level.var_5d69837cf4db0407, function_5f55af0d9c99908b(), "blueprintName", "");
    for (var_40e4b9c48b36c9ec = 0; var_40e4b9c48b36c9ec < 5; var_40e4b9c48b36c9ec++) {
        self setplayerdata(level.var_5d69837cf4db0407, function_5f55af0d9c99908b(), "attachmentSetup", var_40e4b9c48b36c9ec, "attachment", "none");
        self setplayerdata(level.var_5d69837cf4db0407, function_5f55af0d9c99908b(), "attachmentSetup", var_40e4b9c48b36c9ec, "variantID", 0);
    }
    for (var_36d2abbdcbcb186c = 0; var_36d2abbdcbcb186c < 4; var_36d2abbdcbcb186c++) {
        self setplayerdata(level.var_5d69837cf4db0407, function_5f55af0d9c99908b(), "sticker", var_36d2abbdcbcb186c, "none");
    }
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x387a
// Size: 0x3d
function function_389d4cd85d174957() {
    backpackSize = function_1b35b10884bd8d67();
    for (i = 0; i < backpackSize; i++) {
        function_ca3bbb1070436540(i, 0, 0);
    }
    function_bd059d6c2e0ece90();
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x38be
// Size: 0x5d
function function_e70feddd94ade74f() {
    var_9af1a32f9da4983e = function_2c836ad05e5f634c("iw9_pi_golf17");
    function_9ac814eecef8b3af(0, 0, "iw9_pi_golf17", var_9af1a32f9da4983e);
    function_9ac814eecef8b3af(0, 1);
    function_cf99f67e363f5d6c(0, 0, "none");
    function_cf99f67e363f5d6c(0, 1, "none");
    function_b10833eee9e6a55f(0, 0, "none");
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3922
// Size: 0x261
function function_9ac814eecef8b3af(classindex, weaponindex, var_565892db3acd5876, var_5bf829797309448b) {
    if (isdefined(var_565892db3acd5876) && isdefined(var_5bf829797309448b)) {
        self setplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "weapon", var_565892db3acd5876);
        self setplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "lootItemID", var_5bf829797309448b);
    } else {
        self setplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "weapon", "iw9_me_fists");
        self setplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "lootItemID", 0);
    }
    self setplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "camo", "none");
    self setplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "reticle", "none");
    self setplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "cosmeticAttachment", "none");
    self setplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "variantID", 0);
    self setplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "blueprintName", "");
    for (var_40e4b9c48b36c9ec = 0; var_40e4b9c48b36c9ec < 5; var_40e4b9c48b36c9ec++) {
        self setplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "attachmentSetup", var_40e4b9c48b36c9ec, "attachment", "none");
        self setplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "attachmentSetup", var_40e4b9c48b36c9ec, "variantID", 0);
    }
    for (var_36d2abbdcbcb186c = 0; var_36d2abbdcbcb186c < 4; var_36d2abbdcbcb186c++) {
        self setplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "weaponSetups", weaponindex, "sticker", var_36d2abbdcbcb186c, "none");
    }
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b8a
// Size: 0x43
function function_cf99f67e363f5d6c(classindex, var_50b79e19f823671d, ref) {
    self setplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "equipmentSetups", var_50b79e19f823671d, "equipment", ref);
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3bd4
// Size: 0x3e
function function_b10833eee9e6a55f(classindex, var_a780f473a6275df4, ref) {
    self setplayerdata(level.loadoutdata, "squadMembers", "loadouts", classindex, "fieldUpgrades", var_a780f473a6275df4, ref);
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3c19
// Size: 0x35
function function_9000524cb245fdbe(index, ref) {
    self setplayerdata(level.loadoutdata, "squadMembers", "killstreakSetups", index, "killstreak", ref);
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c55
// Size: 0x22
function function_4df538728f6d3815(var_2bee281754374f2f) {
    if (namespace_9571f642f38c8169::function_a6172e49f7313fd8()) {
        return namespace_9571f642f38c8169::function_7cce337c4902cbb6(var_2bee281754374f2f);
    } else {
        return undefined;
    }
}

// Namespace namespace_fe9526a81c458d8f/namespace_feea61bc660e9e0f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c7e
// Size: 0xda
function function_852cd6dd29c274bd(currentweapon) {
    if (!isweapon(currentweapon) || isnullweapon(currentweapon)) {
        return 0;
    }
    /#
        assertex(isplayer(self), "Inventory_IsWeaponObjInsured needs to be called on a player");
    #/
    var_bbec008369304198 = [0:0, 1:1, 2:2];
    foreach (var_fb4895ca57fbf227 in var_bbec008369304198) {
        var_e9eabaf871b51ab = namespace_736197e4d378b91b::function_2aeaf88105d3b617(var_fb4895ca57fbf227);
        if (isdefined(currentweapon) && isdefined(var_e9eabaf871b51ab) && currentweapon == var_e9eabaf871b51ab) {
            var_f0ee9ada549b5763 = function_4df538728f6d3815(var_fb4895ca57fbf227);
            if (isdefined(var_f0ee9ada549b5763)) {
                return 1;
            }
        }
    }
    return 0;
}

