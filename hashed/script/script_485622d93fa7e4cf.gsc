#using script_247745a526421ba7;
#using scripts\common\callbacks.gsc;
#using scripts\common\devgui.gsc;
#using script_16ea1b94f0f381b3;
#using script_3e2f8cc477d57433;
#using script_7b2517368c79e5bc;
#using script_443d99fe707f1d9f;
#using script_64457324b9cce77;
#using script_6775ad452d13858;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_600b944a95c3a7bf;
#using script_2669878cf5a1b6bc;
#using scripts\engine\utility.gsc;

#namespace namespace_9571f642f38c8169;

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4b3
// Size: 0x11c
function function_9c1a92865568b559() {
    if (!function_a6172e49f7313fd8()) {
        return;
    }
    function_d2c13fc95e4e8962(1);
    callback::add("player_connect", &function_fe62eb696aaf7d47);
    callback::add("player_spawned", &function_b9aff90f8226c917);
    callback::add("player_death", &function_8736033b9b41f872);
    callback::add("player_disconnect", &function_65fe8e9157854159);
    utility::registersharedfunc("instanceInventory", "isEnabled", &function_a6172e49f7313fd8);
    utility::registersharedfunc("instanceInventory", "inventoryIsValid", &function_be000b0b3db20f5d);
    utility::registersharedfunc("instanceInventory", "updateCustomClassStruct", &function_f9d6e71a677be0bf);
    utility::registersharedfunc("instanceInventory", "updateDefaultClassStruct", &function_18c12529b048abea);
    utility::registersharedfunc("instanceInventory", "updateInstanceInventoryFromDefault", &function_5bee5ced081d48c0);
    if (function_d1df77dc341aa4e5()) {
        utility::registersharedfunc("instanceInventory", "getActiveOperatorLootID", &function_25c00f7dd055c100);
        utility::registersharedfunc("instanceInventory", "getActiveOperatorSkinLootID", &function_5c97e8ce13fa6a89);
        utility::registersharedfunc("instanceInventory", "getActiveOperatorExecutionLootID", &function_6e550258f79b1ef0);
    }
    /#
        thread function_85f5c72ab2951d3b();
    #/
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5d7
// Size: 0x6a
function function_a6172e49f7313fd8() {
    if (!isdefined(level.var_f86a8dcd08547317)) {
        level.var_f86a8dcd08547317 = getdvarint(@"hash_a31e837c3d3a9c9", 0);
        if (getdvarint(@"hash_8a3e66f8380bb284", 0)) {
            level.var_f86a8dcd08547317 = 0;
            println("<dev string:x1c>");
            setdvar(@"hash_a31e837c3d3a9c9", 0);
        }
    }
    return level.var_f86a8dcd08547317;
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x64a
// Size: 0x91
function function_f9dea9ba0820dc12(player) {
    if (!isdefined(level.var_dedf2039edee97d0)) {
        level.var_dedf2039edee97d0 = getdvarint(@"hash_effdf75f46ecb806", 1);
    }
    var_277e5a7de395bb2e = getdvarint(@"hash_5c869b8df5b17357", 0);
    if (level.var_dedf2039edee97d0 && var_277e5a7de395bb2e > 0 && !player ent_flag("dropped_item")) {
        var_e365b05d502e5c27 = gettime() > function_a5b14435e3229bed(var_277e5a7de395bb2e);
        return var_e365b05d502e5c27;
    }
    return level.var_dedf2039edee97d0;
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6e4
// Size: 0x15
function function_6aa0d0467dfd4624(keeploot) {
    self.var_63878ea2f83352cf = keeploot;
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x701
// Size: 0xc
function function_c82e8cdc726067e() {
    return istrue(self.var_63878ea2f83352cf);
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x716
// Size: 0x11
function function_be000b0b3db20f5d(player) {
    return player function_f6c07d6ea7d83a5a();
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x730
// Size: 0x15
function private function_fe62eb696aaf7d47(params) {
    self.var_c59a9ab288f6a9bf = [];
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x74d
// Size: 0x177
function private function_b9aff90f8226c917(params) {
    if (istrue(self.var_2fa22f24b82c4469)) {
        return;
    }
    if (isdefined(self.primaryweapons)) {
        foreach (weapon in self.primaryweapons) {
            if (!isnullweapon(weapon) && isdefined(weapon) && isdefined(weapon.receiverblueprint) && isdefined(weapon.receiverblueprint.attachmentdata) && weapon.receiverblueprint.attachmentdata == "iw9_rec_mike4_v35") {
                itembundle = getscriptbundle("itemspawnentry:" + "ob_jup_item_ammomod_deadwire");
                if (isdefined(itembundle)) {
                    item = spawnstruct();
                    item.type = itembundle.scriptable;
                    item.count = 1;
                    function_450e4cf17da1bc5(weapon, itembundle, item);
                }
            }
        }
    }
    common_inventory::function_389d4cd85d174957();
    common_inventory::function_32c79be2384f10fb(common_inventory::function_286713f0349afb22());
    function_7afe055995edf844();
    function_c5c2af56b6e31c74();
    callback::add("player_item_drop", &function_9023be583859d461);
    callback::add("player_item_pickup", &function_c9de41def051c9fc);
    self.var_2fa22f24b82c4469 = 1;
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x8cc
// Size: 0x685
function private function_7afe055995edf844() {
    if (!isdefined(level.var_19cc064ef4f4f035)) {
        level.var_19cc064ef4f4f035 = 0;
    }
    if (!isdefined(self.var_87f0698dc7ac0a09)) {
        self.var_87f0698dc7ac0a09 = level.var_19cc064ef4f4f035;
        level.var_19cc064ef4f4f035 += 1;
    }
    var_ba3c9899fa64c6f2 = [];
    primaryweaponinstance = self function_644ed519cac9722b(1, 0);
    if (function_3f8c62126708afe6(primaryweaponinstance) && primaryweaponinstance.kind != 11) {
        var_ba3c9899fa64c6f2[var_ba3c9899fa64c6f2.size] = {#weaponindex:0, #instance:primaryweaponinstance, #sublocation:0, #location:1};
    }
    secondaryweaponinstance = self function_644ed519cac9722b(1, 1);
    if (function_3f8c62126708afe6(secondaryweaponinstance) && secondaryweaponinstance.kind != 11) {
        var_ba3c9899fa64c6f2[var_ba3c9899fa64c6f2.size] = {#weaponindex:1, #instance:secondaryweaponinstance, #sublocation:1, #location:1};
    }
    var_6267a5ad12c5e4d4 = self function_644ed519cac9722b(2, 0);
    if (function_3f8c62126708afe6(var_6267a5ad12c5e4d4) && var_6267a5ad12c5e4d4.kind != 11) {
        var_ba3c9899fa64c6f2[var_ba3c9899fa64c6f2.size] = {#weaponindex:2, #instance:var_6267a5ad12c5e4d4, #sublocation:0, #location:2};
    }
    if (getdvarint(@"hash_1b1ec093041f3814", 1) != 0) {
        var_760480dc8b6f2623 = [];
        isMapToMapInfil = istrue(utility::function_f3bb4f4911a1beb2("instanceInventory", "isMapToMapInfil"));
        for (backpackindex = 0; backpackindex < 10; backpackindex++) {
            iteminstance = self function_644ed519cac9722b(2, 1 + backpackindex);
            if (!function_3f8c62126708afe6(iteminstance) || iteminstance.kind != 17) {
                continue;
            }
            if (isMapToMapInfil) {
                continue;
            }
            var_85166da84e55de25 = function_f6c6c8920a5333e7(15, iteminstance, 1);
            if (!isdefined(var_85166da84e55de25)) {
                self function_dd5661ebe3c9a5a2(iteminstance.instanceid);
                assertmsg("<dev string:x8a>" + self.name + "<dev string:xb4>" + iteminstance.instanceid + "<dev string:xdd>" + iteminstance.lootid + "<dev string:xf0>" + "<dev string:x145>");
                continue;
            }
            var_b0bee880705ae6be = function_c37d02edd52c6892(iteminstance);
            if (isdefined(var_b0bee880705ae6be.var_b34159f22f6379c9) && var_b0bee880705ae6be.var_b34159f22f6379c9 > getsystemtime()) {
                self function_dd5661ebe3c9a5a2(iteminstance.instanceid);
                assertmsg("<dev string:x8a>" + self.name + "<dev string:x1a7>" + iteminstance.instanceid + "<dev string:x1e9>");
                continue;
            }
            if (isdefined(var_760480dc8b6f2623[var_85166da84e55de25])) {
                self function_dd5661ebe3c9a5a2(iteminstance.instanceid);
                assertmsg("<dev string:x8a>" + self.name + "<dev string:xb4>" + var_b0bee880705ae6be.instanceid + "<dev string:x22d>" + var_760480dc8b6f2623[var_85166da84e55de25] + "<dev string:x272>");
                continue;
            }
            itembundle = function_f4a303d532b044a7(iteminstance.lootid);
            if (!isdefined(itembundle) || !isdefined(itembundle.var_b5ccd2f88ca30aef) || itembundle.var_b5ccd2f88ca30aef == 0) {
                continue;
            }
            newcooldown = getsystemtime() + itembundle.var_b5ccd2f88ca30aef;
            self function_4e8d00b0ee5d3bbb(var_b0bee880705ae6be.instanceid, int(newcooldown));
            var_760480dc8b6f2623[var_85166da84e55de25] = var_b0bee880705ae6be.instanceid;
            /#
                function_221fabd6ffdb8013(var_b0bee880705ae6be, self, "<dev string:x29b>");
            #/
        }
    }
    var_760480dc8b6f2623 = [];
    self.var_42cd6df38ee20402 = [];
    foreach (var_3cd9588dc8609a1 in var_ba3c9899fa64c6f2) {
        var_85166da84e55de25 = function_f6c6c8920a5333e7(15, var_3cd9588dc8609a1.instance, 1);
        if (!isdefined(var_85166da84e55de25)) {
            continue;
        }
        var_b0bee880705ae6be = function_1e863c336474bb99(var_3cd9588dc8609a1.instance);
        if (isdefined(var_b0bee880705ae6be.var_b34159f22f6379c9) && var_b0bee880705ae6be.var_b34159f22f6379c9 > getsystemtime()) {
            self function_dd5661ebe3c9a5a2(var_3cd9588dc8609a1.instance.instanceid);
            assertmsg("<dev string:x8a>" + self.name + "<dev string:x2c1>" + "<dev string:x317>" + var_3cd9588dc8609a1.instance.instanceid + "<dev string:x349>");
            continue;
        }
        if (isdefined(var_760480dc8b6f2623[var_85166da84e55de25])) {
            self function_dd5661ebe3c9a5a2(var_3cd9588dc8609a1.instance.instanceid);
            assertmsg("<dev string:x8a>" + self.name + "<dev string:x34e>" + "<dev string:x3b6>" + var_760480dc8b6f2623[var_85166da84e55de25] + "<dev string:x3da>" + var_3cd9588dc8609a1.instance.instanceid + "<dev string:x349>");
            continue;
        }
        function_8715433c6e64940b([1], [self.var_87f0698dc7ac0a09], var_3cd9588dc8609a1.instance, 0);
        var_3cd9588dc8609a1.instance = self function_644ed519cac9722b(var_3cd9588dc8609a1.location, var_3cd9588dc8609a1.sublocation);
        self.var_42cd6df38ee20402[self.var_42cd6df38ee20402.size] = var_3cd9588dc8609a1.instance;
        if (isdefined(var_3cd9588dc8609a1.weaponindex)) {
            self.var_c59a9ab288f6a9bf[var_3cd9588dc8609a1.weaponindex] = {#var_cb06779b5d45f25f:function_2c7fe4b882b6d63e(var_3cd9588dc8609a1.instance.var_d3c548c09bb62da2), #secure:function_2c7fe4b882b6d63e(var_3cd9588dc8609a1.instance.metadata)};
        }
        var_760480dc8b6f2623[var_85166da84e55de25] = var_3cd9588dc8609a1.instance.instanceid;
        /#
            function_221fabd6ffdb8013(var_3cd9588dc8609a1.instance, self, "<dev string:x402>");
        #/
    }
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xf59
// Size: 0x10
function private function_c5c2af56b6e31c74() {
    function_451eefc39146b820();
    function_1100308907e5eb6a();
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xf71
// Size: 0x37e
function private function_451eefc39146b820() {
    if (function_d1df77dc341aa4e5()) {
        operatorSkinRef = loot::function_793e8a72cedb8ef3(function_5c97e8ce13fa6a89(self));
        for (var_2663a30351d5b1ab = 0; var_2663a30351d5b1ab < 6; var_2663a30351d5b1ab += 1) {
            if (var_2663a30351d5b1ab == 5) {
                continue;
            }
            iteminstance = self function_644ed519cac9722b(65535, var_2663a30351d5b1ab);
            if (function_3f8c62126708afe6(iteminstance)) {
                var_9ec3e3e77fa5f56c = function_2b10ba6fb19dccd9(iteminstance.lootid);
                if (!isdefined(var_9ec3e3e77fa5f56c) || function_633f07e180b6ec8f(var_9ec3e3e77fa5f56c)) {
                    continue;
                }
                itembundle = getscriptbundle(var_9ec3e3e77fa5f56c);
                if (isdefined(itembundle)) {
                    if (!istrue(itembundle.var_8464122fb6575536)) {
                        assertmsg("<dev string:x8a>" + self.name + "<dev string:x436>" + function_b4dd67b39cbb2f31(iteminstance.lootid) + "<dev string:x45c>" + iteminstance.instanceid + "<dev string:x4a6>");
                        continue;
                    }
                    params = spawnstruct();
                    params.type = itembundle.scriptable;
                    params.count = function_7209c8cd4b2e3afd(isdefined(itembundle.spawncount) ? itembundle.spawncount : 1);
                    params.bundle = itembundle;
                    function_de489fa2ffdb7f2d(params, 0);
                    callback::callback("instance_inventory_item_equipped", params);
                }
                continue;
            }
            if (isdefined(operatorSkinRef)) {
                var_7d921c0ed68ea7a6 = function_e8e46cba4fcc05f7(self, var_2663a30351d5b1ab);
                if (isdefined(var_7d921c0ed68ea7a6) && var_7d921c0ed68ea7a6 != 0) {
                    var_9ec3e3e77fa5f56c = function_2b10ba6fb19dccd9(var_7d921c0ed68ea7a6);
                    if (!isdefined(var_9ec3e3e77fa5f56c) || function_633f07e180b6ec8f(var_9ec3e3e77fa5f56c)) {
                        continue;
                    }
                    itembundle = getscriptbundle(var_9ec3e3e77fa5f56c);
                    if (isdefined(itembundle)) {
                        params = spawnstruct();
                        params.type = itembundle.scriptable;
                        params.count = function_7209c8cd4b2e3afd(isdefined(itembundle.spawncount) ? itembundle.spawncount : 1);
                        params.bundle = itembundle;
                        function_de489fa2ffdb7f2d(params, 0);
                        callback::callback("instance_inventory_item_equipped", params);
                    }
                }
            }
        }
        return;
    }
    for (var_2e534774289cc46d = 7; var_2e534774289cc46d < 12; var_2e534774289cc46d += 1) {
        iteminstance = self function_644ed519cac9722b(1, var_2e534774289cc46d);
        if (!function_3f8c62126708afe6(iteminstance)) {
            continue;
        }
        var_9ec3e3e77fa5f56c = function_2b10ba6fb19dccd9(iteminstance.lootid);
        if (!isdefined(var_9ec3e3e77fa5f56c) || function_633f07e180b6ec8f(var_9ec3e3e77fa5f56c)) {
            continue;
        }
        itembundle = getscriptbundle(var_9ec3e3e77fa5f56c);
        if (!isdefined(itembundle)) {
            continue;
        }
        if (!istrue(itembundle.var_8464122fb6575536)) {
            assertmsg("<dev string:x8a>" + self.name + "<dev string:x436>" + function_b4dd67b39cbb2f31(iteminstance.lootid) + "<dev string:x45c>" + iteminstance.instanceid + "<dev string:x4a6>");
            continue;
        }
        params = spawnstruct();
        params.type = itembundle.scriptable;
        params.count = function_7209c8cd4b2e3afd(isdefined(itembundle.spawncount) ? itembundle.spawncount : 1);
        params.bundle = itembundle;
        function_de489fa2ffdb7f2d(params, 0);
        callback::callback("instance_inventory_item_equipped", params);
    }
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x12f7
// Size: 0x368
function private function_1100308907e5eb6a() {
    isMapToMapInfil = istrue(utility::function_f3bb4f4911a1beb2("instanceInventory", "isMapToMapInfil"));
    for (backpackindex = 0; backpackindex < 10; backpackindex++) {
        lootinstance = self function_644ed519cac9722b(2, 1 + backpackindex);
        if (function_3f8c62126708afe6(lootinstance)) {
            var_9ec3e3e77fa5f56c = function_2b10ba6fb19dccd9(lootinstance.lootid);
            if (!isdefined(var_9ec3e3e77fa5f56c) || function_633f07e180b6ec8f(var_9ec3e3e77fa5f56c)) {
                function_ca3bbb1070436540(backpackindex, 0, 1);
                continue;
            }
            itembundle = getscriptbundle(var_9ec3e3e77fa5f56c);
            if (!isdefined(itembundle)) {
                function_ca3bbb1070436540(backpackindex, 0, 1);
                continue;
            }
            if (!isMapToMapInfil && !istrue(itembundle.var_72340ceb276c0f64)) {
                assertmsg("<dev string:x8a>" + self.name + "<dev string:x436>" + function_b4dd67b39cbb2f31(lootinstance.lootid) + "<dev string:x45c>" + lootinstance.instanceid + "<dev string:x4a6>");
                function_ca3bbb1070436540(backpackindex, 0, 1);
                continue;
            }
            if (isdefined(itembundle) && itembundle.type == "schematic" && getdvarint(@"hash_1b1ec093041f3814", 1) != 0) {
                if (isMapToMapInfil) {
                    function_ca3bbb1070436540(backpackindex, lootinstance.lootid, 1);
                    continue;
                }
                var_1c791d7dca27482a = itembundle.var_a7141a24829dc197;
                if (!isdefined(var_1c791d7dca27482a)) {
                    assertmsg("<dev string:x4ac>" + function_b4dd67b39cbb2f31(lootinstance.lootid) + "<dev string:x4f0>");
                    function_ca3bbb1070436540(backpackindex, 0, 1);
                    continue;
                }
                var_edd8960f9ec52b5f = getscriptbundle(var_1c791d7dca27482a);
                if (!isdefined(var_edd8960f9ec52b5f)) {
                    assertmsg("<dev string:x528>" + function_3c8848a3a11b2553(var_1c791d7dca27482a) + "<dev string:x576>" + "<dev string:x5c6>");
                    function_ca3bbb1070436540(backpackindex, 0, 1);
                    continue;
                }
                var_6014c760d9adff2f = function_6d15e119c2779a93(var_edd8960f9ec52b5f);
                if (!isdefined(var_6014c760d9adff2f)) {
                    function_ca3bbb1070436540(backpackindex, 0, 1);
                    continue;
                }
                if (lootinstance.kind != 17) {
                    assertmsg("<dev string:x605>" + lootinstance.instanceid + "<dev string:x349>" + "<dev string:x63a>" + function_b4dd67b39cbb2f31(lootinstance.lootid) + "<dev string:x349>" + "<dev string:x64e>");
                    function_ca3bbb1070436540(backpackindex, 0, 1);
                    continue;
                }
                function_ca3bbb1070436540(backpackindex, var_6014c760d9adff2f, 1);
            } else {
                if (!isMapToMapInfil && lootinstance.kind == 17) {
                    assertmsg("<dev string:x605>" + lootinstance.instanceid + "<dev string:x349>" + "<dev string:x6a4>" + lootinstance.lootid + "<dev string:x6b5>" + "<dev string:x6ea>");
                    function_ca3bbb1070436540(backpackindex, 0, 1);
                    continue;
                }
                quantity = 1;
                if (isMapToMapInfil) {
                    itemquantity = function_f6c6c8920a5333e7(6, lootinstance, 0);
                    if (isdefined(itemquantity)) {
                        itemquantity = int(itemquantity);
                        if (itemquantity > 1) {
                            quantity = itemquantity;
                        }
                    }
                }
                function_ca3bbb1070436540(backpackindex, lootinstance.lootid, quantity);
            }
            continue;
        }
        function_ca3bbb1070436540(backpackindex, 0, 1);
    }
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1667
// Size: 0x1c
function private function_8736033b9b41f872(params) {
    if (function_f9dea9ba0820dc12(self)) {
        function_dd9df8b3dd285733();
    }
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x168b
// Size: 0x1f
function private function_65fe8e9157854159(params) {
    if (!istrue(self.var_84d661ff601a2f9f)) {
        function_80c587026fbc6e0d();
    }
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16b2
// Size: 0xa0
function function_80c587026fbc6e0d() {
    if (!function_a6172e49f7313fd8()) {
        return;
    }
    if (istrue(self.var_84d661ff601a2f9f)) {
        assertmsg("<dev string:x741>" + self.name + "<dev string:x79b>");
        return;
    }
    if (function_c82e8cdc726067e()) {
        utility::function_f3bb4f4911a1beb2("instanceInventory", "preExtractItems", self);
        function_ab1ee99079e4c5a0();
        utility::function_f3bb4f4911a1beb2("instanceInventory", "postExtractItems", self);
        function_340f746f0eb455d9();
    } else if (function_f9dea9ba0820dc12(self)) {
        function_dd9df8b3dd285733();
        common_inventory::function_389d4cd85d174957();
    }
    function_d2e72de8b468cffa();
    self.var_84d661ff601a2f9f = 1;
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x175a
// Size: 0x348
function private function_ab1ee99079e4c5a0() {
    function_dbaac60172658dcf(0, 1, 0);
    function_dbaac60172658dcf(1, 1, 1);
    function_dbaac60172658dcf(2, 2, 0);
    function_e26d5c543a147a8d("lethal", 13, 1, 2);
    function_e26d5c543a147a8d("tactical", 13, 1, 3);
    function_e26d5c543a147a8d("super", 13, 1, 4);
    if (!function_3f8c62126708afe6(self function_644ed519cac9722b(1, 4))) {
        if (isdefined(self.super) && isdefined(self.super.staticdata) && isdefined(self.super.staticdata.ref)) {
            lootid = function_2c836ad05e5f634c(self.super.staticdata.ref);
            if (isdefined(lootid) && lootid != 0) {
                function_b1fcbec168284539(lootid, 13, 1, 4, []);
            }
        }
    }
    if (function_d1df77dc341aa4e5()) {
        function_e26d5c543a147a8d("killstreak", 13, 65535, 0);
        function_e26d5c543a147a8d("backpack", 13, 65535, 1);
        function_e26d5c543a147a8d("plate_carrier", 13, 65535, 2);
        function_e26d5c543a147a8d("revive", 13, 65535, 3);
        function_e26d5c543a147a8d("gasmask", 13, 65535, 4);
    } else {
        function_e26d5c543a147a8d("killstreak", 13, 1, 5);
        function_e26d5c543a147a8d("backpack", 13, 1, 7);
        function_e26d5c543a147a8d("plate_carrier", 13, 1, 8);
        function_e26d5c543a147a8d("revive", 13, 1, 9);
        function_e26d5c543a147a8d("gasmask", 13, 1, 10);
    }
    isMapToMapExfil = istrue(utility::function_f3bb4f4911a1beb2("instanceInventory", "isMapToMapExfil", self));
    for (backpackindex = 0; backpackindex < 10; backpackindex++) {
        sublocation = 1 + backpackindex;
        function_5a62e05c264fbe50(2, sublocation);
        lootid = function_d870b2c45335bd88(backpackindex);
        if (!isdefined(lootid) || lootid == 0) {
            continue;
        }
        itembundle = function_f4a303d532b044a7(lootid);
        if (!isdefined(itembundle)) {
            continue;
        }
        if (!isMapToMapExfil && !istrue(itembundle.var_72340ceb276c0f64)) {
            continue;
        }
        kind = 13;
        if (isdefined(itembundle.var_95d6d970efccc96d)) {
            switch (itembundle.var_95d6d970efccc96d) {
            case #"hash_78e8e9a60d7025a7": 
                kind = 13;
                break;
            case #"hash_61d9379cb6db8320": 
                kind = 12;
                break;
            case #"hash_5fe9df5902455824": 
                kind = 18;
                break;
            }
        }
        function_b1fcbec168284539(lootid, kind, 2, sublocation, []);
        if (isMapToMapExfil) {
            instance = self function_644ed519cac9722b(2, sublocation);
            if (function_3f8c62126708afe6(instance)) {
                quantity = function_5ce7fe3dca9c1a22(backpackindex);
                if (isdefined(quantity) && quantity > 1) {
                    keys = [6];
                    values = [quantity];
                    function_8715433c6e64940b(keys, values, instance);
                }
            }
        }
    }
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x1aaa
// Size: 0x284
function private function_dbaac60172658dcf(weaponindex, location, sublocation) {
    function_5a62e05c264fbe50(location, sublocation);
    weaponobj = function_2aeaf88105d3b617(weaponindex);
    if (!isdefined(weaponobj)) {
        return;
    }
    var_57ad0dc40b2fdda = function_61f99d560d896d24(weaponindex);
    components = var_57ad0dc40b2fdda[2];
    ammo = var_57ad0dc40b2fdda[1];
    itembundle = var_57ad0dc40b2fdda[0];
    lootid = weapon::getweaponlootid(weaponobj);
    if (lootid == 0) {
        lootid = function_6d15e119c2779a93(itembundle);
        if (!isdefined(lootid) || lootid == 0) {
            return;
        }
    }
    if (isdefined(itembundle) && !istrue(utility::function_f3bb4f4911a1beb2("instanceInventory", "isMapToMapExfil", self))) {
        if (weaponindex == 2 && !istrue(itembundle.var_72340ceb276c0f64) || weaponindex != 2 && !istrue(itembundle.var_8464122fb6575536)) {
            return;
        }
    }
    function_b1fcbec168284539(lootid, 11, location, sublocation, isdefined(components) ? components : []);
    instance = self function_644ed519cac9722b(location, sublocation);
    if (isdefined(self.var_c59a9ab288f6a9bf[weaponindex])) {
        self function_e70c1fc3c2e5e05f(instance.instanceid, 0, self.var_c59a9ab288f6a9bf[weaponindex].secure);
        self function_e70c1fc3c2e5e05f(instance.instanceid, 1, self.var_c59a9ab288f6a9bf[weaponindex].var_cb06779b5d45f25f);
    }
    var_ae326d1d2b95b12c = 0;
    if (isdefined(weaponobj.stickerslot0) && weaponobj.stickerslot0 != "none") {
        var_ae326d1d2b95b12c |= 1;
    }
    if (isdefined(weaponobj.stickerslot1) && weaponobj.stickerslot1 != "none") {
        var_ae326d1d2b95b12c |= 2;
    }
    if (isdefined(weaponobj.stickerslot2) && weaponobj.stickerslot2 != "none") {
        var_ae326d1d2b95b12c |= 4;
    }
    if (isdefined(weaponobj.stickerslot3) && weaponobj.stickerslot3 != "none") {
        var_ae326d1d2b95b12c |= 8;
    }
    if (isdefined(weaponobj.var_b39ac546cc8621f8) && weaponobj.var_b39ac546cc8621f8 != "none") {
        var_ae326d1d2b95b12c |= 16;
    }
    if (var_ae326d1d2b95b12c > 0) {
        function_8715433c6e64940b([13], [var_ae326d1d2b95b12c], instance, 1);
    }
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 5, eflags: 0x4
// Checksum 0x0, Offset: 0x1d36
// Size: 0x1a6
function private function_e26d5c543a147a8d(itemtype, kind, location, sublocation, optionalindex) {
    function_5a62e05c264fbe50(location, sublocation);
    itemtypecallbacks = function_cca8bbe88a39ad41(itemtype);
    if (!isdefined(itemtypecallbacks.var_df9b308efe82294a)) {
        assertmsg("<dev string:x7d1>" + itemtype + "<dev string:x4a6>" + "<dev string:x819>");
        return;
    }
    var_57ad1dc40b3000d = isdefined(optionalindex) ? self [[ itemtypecallbacks.var_df9b308efe82294a ]](optionalindex) : self [[ itemtypecallbacks.var_df9b308efe82294a ]]();
    components = var_57ad1dc40b3000d[2];
    quantity = var_57ad1dc40b3000d[1];
    itembundle = var_57ad1dc40b3000d[0];
    lootid = function_6d15e119c2779a93(itembundle);
    if (!isdefined(lootid) || lootid == 0 || !isdefined(quantity)) {
        return;
    }
    if (quantity == 0) {
        var_e3c2810e6e51420c = istrue(self.var_ded04cdd264a7e00) && (sublocation == 2 || sublocation == 3);
        if (!istrue(var_e3c2810e6e51420c)) {
            return;
        }
    }
    if (!istrue(itembundle.var_8464122fb6575536) && !istrue(utility::function_f3bb4f4911a1beb2("instanceInventory", "isMapToMapExfil", self))) {
        return;
    }
    if (isdefined(self.var_a6dd5c7e74106ce3) && isdefined(self.var_a6dd5c7e74106ce3[itembundle.ref])) {
        lootid = self.var_1c84eeaf9507fb4e[itembundle.ref];
    }
    function_b1fcbec168284539(lootid, kind, location, sublocation, isdefined(components) ? components : []);
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1ee4
// Size: 0x2c6
function private function_340f746f0eb455d9() {
    if (!isdefined(level.gametypebundle.var_a9ffb4dcf1c85e0f)) {
        return;
    }
    if (istrue(utility::function_f3bb4f4911a1beb2("instanceInventory", "isMapToMapExfil", self))) {
        return;
    }
    aeeventname = level.gametypebundle.var_a9ffb4dcf1c85e0f;
    aeeventid = function_6e2deb013c9ca85e(aeeventname);
    unlockeventparams = [];
    unlockeventparams[unlockeventparams.size] = function_d6f771aedba70ce7(aeeventname, #"version");
    unlockeventparams[unlockeventparams.size] = 1;
    var_6be6ee2c96b9685d = function_d6f771aedba70ce7(aeeventname, #"loot_id");
    var_21341c7142d7e704 = var_6be6ee2c96b9685d;
    primaryinstance = self function_644ed519cac9722b(1, 0);
    var_57acedc40b2f974 = function_e85d625960aadaaa(primaryinstance, var_21341c7142d7e704, unlockeventparams);
    var_21341c7142d7e704 = var_57acedc40b2f974[1];
    unlockeventparams = var_57acedc40b2f974[0];
    secondaryinstance = self function_644ed519cac9722b(1, 1);
    var_57acfdc40b2fba7 = function_e85d625960aadaaa(secondaryinstance, var_21341c7142d7e704, unlockeventparams);
    var_21341c7142d7e704 = var_57acfdc40b2fba7[1];
    unlockeventparams = var_57acfdc40b2fba7[0];
    var_6267a5ad12c5e4d4 = self function_644ed519cac9722b(2, 0);
    var_57ac4dc40b2e376 = function_e85d625960aadaaa(var_6267a5ad12c5e4d4, var_21341c7142d7e704, unlockeventparams);
    var_21341c7142d7e704 = var_57ac4dc40b2e376[1];
    unlockeventparams = var_57ac4dc40b2e376[0];
    lethalinstance = self function_644ed519cac9722b(1, 2);
    if (function_3f8c62126708afe6(lethalinstance)) {
        unlockeventparams[unlockeventparams.size] = var_21341c7142d7e704;
        unlockeventparams[unlockeventparams.size] = lethalinstance.lootid;
        var_21341c7142d7e704 += 1;
    }
    tacticalinstance = self function_644ed519cac9722b(1, 3);
    if (function_3f8c62126708afe6(tacticalinstance)) {
        unlockeventparams[unlockeventparams.size] = var_21341c7142d7e704;
        unlockeventparams[unlockeventparams.size] = tacticalinstance.lootid;
        var_21341c7142d7e704 += 1;
    }
    var_bed94c5e8ba6c57e = self function_644ed519cac9722b(1, 4);
    if (function_3f8c62126708afe6(var_bed94c5e8ba6c57e)) {
        unlockeventparams[unlockeventparams.size] = var_21341c7142d7e704;
        unlockeventparams[unlockeventparams.size] = var_bed94c5e8ba6c57e.lootid;
        var_21341c7142d7e704 += 1;
    }
    killstreakinstance = undefined;
    if (function_d1df77dc341aa4e5()) {
        killstreakinstance = self function_644ed519cac9722b(65535, 0);
    } else {
        killstreakinstance = self function_644ed519cac9722b(1, 5);
    }
    if (function_3f8c62126708afe6(killstreakinstance)) {
        unlockeventparams[unlockeventparams.size] = var_21341c7142d7e704;
        unlockeventparams[unlockeventparams.size] = killstreakinstance.lootid;
        var_21341c7142d7e704 += 1;
    }
    for (backpackindex = 1; backpackindex <= 10; backpackindex++) {
        backpackinstance = self function_644ed519cac9722b(2, backpackindex);
        if (function_3f8c62126708afe6(backpackinstance)) {
            unlockeventparams[unlockeventparams.size] = var_21341c7142d7e704;
            unlockeventparams[unlockeventparams.size] = backpackinstance.lootid;
            var_21341c7142d7e704 += 1;
        }
    }
    self function_db073176839d77fb(aeeventid, unlockeventparams);
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x21b2
// Size: 0x192
function private function_e85d625960aadaaa(instance, paramoffset, unlockeventparams) {
    if (!function_3f8c62126708afe6(instance)) {
        return [unlockeventparams, paramoffset];
    }
    weaponlootid = instance.lootid;
    if (!getdvarint(@"hash_a79d3b965878a390", 0)) {
        baseweapon = function_1cc3fd00b6ccc3ba(instance.lootid);
        if (isdefined(baseweapon)) {
            baseweaponref = weapon::getweaponrootname(baseweapon);
            iteminfo = function_e4f08713dc9c53b3(baseweaponref);
            if (isdefined(iteminfo)) {
                weaponlootid = iteminfo.itemid;
            }
        }
    }
    unlockeventparams[unlockeventparams.size] = paramoffset;
    unlockeventparams[unlockeventparams.size] = weaponlootid;
    paramoffset += 1;
    baseweapon = function_1cc3fd00b6ccc3ba(instance.lootid);
    attachments = function_6527364c1ecca6c6(baseweapon);
    foreach (attachment in attachments) {
        attachmentscriptbundle = getscriptbundle(hashcat(%"hash_3c2c9813bb16552f", attachment));
        if (isdefined(attachmentscriptbundle)) {
            attachmentlootid = attachmentscriptbundle.lootid;
        }
        if (!isdefined(attachmentlootid)) {
            continue;
        }
        unlockeventparams[unlockeventparams.size] = paramoffset;
        unlockeventparams[unlockeventparams.size] = attachmentlootid;
        paramoffset += 1;
    }
    return [unlockeventparams, paramoffset];
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x234d
// Size: 0x3ec
function private function_d2e72de8b468cffa() {
    if (!isdefined(self.var_42cd6df38ee20402)) {
        assertmsg("<dev string:x864>");
        return;
    }
    var_92bb70c6e0e628c2 = [];
    primaryweaponinstance = self function_644ed519cac9722b(1, 0);
    if (function_3f8c62126708afe6(primaryweaponinstance)) {
        var_92bb70c6e0e628c2[var_92bb70c6e0e628c2.size] = primaryweaponinstance;
    }
    secondaryweaponinstance = self function_644ed519cac9722b(1, 1);
    if (function_3f8c62126708afe6(secondaryweaponinstance)) {
        var_92bb70c6e0e628c2[var_92bb70c6e0e628c2.size] = secondaryweaponinstance;
    }
    var_6267a5ad12c5e4d4 = self function_644ed519cac9722b(2, 0);
    if (function_3f8c62126708afe6(var_6267a5ad12c5e4d4)) {
        var_92bb70c6e0e628c2[var_92bb70c6e0e628c2.size] = var_6267a5ad12c5e4d4;
    }
    foreach (var_a5a2044e2fff7d85 in self.var_42cd6df38ee20402) {
        var_4e321aa57754ccdb = undefined;
        foreach (var_88da409373096bea in var_92bb70c6e0e628c2) {
            var_3d9c20cb7f54fda1 = function_f6c6c8920a5333e7(1, var_a5a2044e2fff7d85, 0);
            var_a6c28942eabdff3f = function_f6c6c8920a5333e7(1, var_88da409373096bea, 0);
            var_1855fb62fc0cce3d = function_f6c6c8920a5333e7(15, var_a5a2044e2fff7d85, 1);
            var_bb5bdf5ca593d807 = function_f6c6c8920a5333e7(15, var_88da409373096bea, 1);
            if (isdefined(var_3d9c20cb7f54fda1) && isdefined(var_a6c28942eabdff3f) && var_3d9c20cb7f54fda1 == var_a6c28942eabdff3f && isdefined(var_1855fb62fc0cce3d) && isdefined(var_bb5bdf5ca593d807) && var_1855fb62fc0cce3d == var_bb5bdf5ca593d807) {
                var_4e321aa57754ccdb = var_88da409373096bea;
                break;
            }
        }
        if (!isdefined(var_4e321aa57754ccdb)) {
            var_b0bee880705ae6be = function_1e863c336474bb99(var_a5a2044e2fff7d85);
            if ((!isdefined(var_b0bee880705ae6be.var_b34159f22f6379c9) || var_b0bee880705ae6be.var_b34159f22f6379c9 <= getsystemtime()) && !istrue(self.var_d0cbbb1229fbc61c)) {
                newcooldown = getdvarint(@"hash_40eb514e313dd3ef", 14400);
                if (getdvarint(@"hash_6dc2f0452c76707d", 1)) {
                    var_85166da84e55de25 = function_f6c6c8920a5333e7(15, var_a5a2044e2fff7d85, 1);
                    if (isdefined(var_85166da84e55de25)) {
                        switch (var_85166da84e55de25) {
                        case #"hash_31100fbc01bd387c": 
                            newcooldown = getdvarint(@"hash_618c3ca8c4897d2c", 7200);
                            break;
                        case #"hash_311012bc01bd3d35": 
                            newcooldown = getdvarint(@"hash_618c3fa8c48983c5", 14400);
                            break;
                        case #"hash_311011bc01bd3ba2": 
                            newcooldown = getdvarint(@"hash_618c3ea8c4898192", 21600);
                            break;
                        }
                    }
                }
                newcooldown = getsystemtime() + newcooldown;
                self function_4e8d00b0ee5d3bbb(var_b0bee880705ae6be.instanceid, int(newcooldown));
            }
            continue;
        }
        if (var_4e321aa57754ccdb.kind != 14) {
            self function_dd5661ebe3c9a5a2(var_4e321aa57754ccdb.instanceid);
            function_b1fcbec168284539(var_4e321aa57754ccdb.lootid, 14, var_4e321aa57754ccdb.location, var_4e321aa57754ccdb.sublocation, var_4e321aa57754ccdb.var_6cb812578f7d9ae7);
            var_e46e4713dc6a8b15 = self function_644ed519cac9722b(var_4e321aa57754ccdb.location, var_4e321aa57754ccdb.sublocation);
            if (isdefined(var_4e321aa57754ccdb.metadata) && function_3f8c62126708afe6(var_e46e4713dc6a8b15)) {
                var_aec4aa940dba4949 = function_2c7fe4b882b6d63e(var_4e321aa57754ccdb.metadata);
                self function_e70c1fc3c2e5e05f(var_e46e4713dc6a8b15.instanceid, 0, var_aec4aa940dba4949);
            }
            if (isdefined(var_4e321aa57754ccdb.var_d3c548c09bb62da2) && function_3f8c62126708afe6(var_e46e4713dc6a8b15)) {
                var_aec4aa940dba4949 = function_2c7fe4b882b6d63e(var_4e321aa57754ccdb.var_d3c548c09bb62da2);
                self function_e70c1fc3c2e5e05f(var_e46e4713dc6a8b15.instanceid, 1, var_aec4aa940dba4949);
            }
        }
    }
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x2741
// Size: 0x5e4
function private function_f9d6e71a677be0bf(player, struct, class) {
    if (isdefined(player.changedarchetypeinfo)) {
        struct.loadoutarchetype = player.changedarchetypeinfo.archetype;
    } else {
        struct.loadoutarchetype = "archetype_assault";
    }
    if (istrue(player.var_2fa22f24b82c4469)) {
        return;
    }
    isMapToMapInfil = istrue(utility::function_f3bb4f4911a1beb2("instanceInventory", "isMapToMapInfil"));
    iteminstance = player function_644ed519cac9722b(1, 0);
    if (function_3f8c62126708afe6(iteminstance)) {
        var_536283c1339f8f41 = 1;
        blueprintindex = function_64ccc54bdbae5cf6(iteminstance.lootid);
        if (isdefined(blueprintindex) && blueprintindex == 0) {
            var_9ec3e3e77fa5f56c = function_2b10ba6fb19dccd9(iteminstance.lootid);
            if (isdefined(var_9ec3e3e77fa5f56c)) {
                if (function_633f07e180b6ec8f(var_9ec3e3e77fa5f56c)) {
                    var_536283c1339f8f41 = 0;
                } else {
                    itembundle = getscriptbundle(var_9ec3e3e77fa5f56c);
                    if (isdefined(itembundle)) {
                        if (!isMapToMapInfil && !istrue(itembundle.var_8464122fb6575536)) {
                            assertmsg("<dev string:x8a>" + self.name + "<dev string:x436>" + function_b4dd67b39cbb2f31(iteminstance.lootid) + "<dev string:x45c>" + iteminstance.instanceid + "<dev string:x4a6>");
                            var_536283c1339f8f41 = 0;
                        }
                    }
                }
            }
        }
        if (var_536283c1339f8f41) {
            primaryweaponstruct = player function_77046e6abbff19e5(iteminstance, blueprintindex);
            struct.loadoutprimary = primaryweaponstruct.weaponref;
            for (attachmentindex = 0; attachmentindex < 7; attachmentindex++) {
                struct.loadoutprimaryattachments[attachmentindex] = primaryweaponstruct.attachmentrefs[attachmentindex];
                struct.loadoutprimaryattachmentids[attachmentindex] = primaryweaponstruct.attachmentids[attachmentindex];
                tuningvalues = primaryweaponstruct.var_eae5a591e200672[attachmentindex];
                if (isdefined(tuningvalues)) {
                    struct.var_193bf3cfb8aeaf0f[struct.loadoutprimaryattachments[attachmentindex]] = tuningvalues;
                }
            }
            struct.loadoutprimarycamo = primaryweaponstruct.weaponcamo;
            struct.loadoutprimaryreticle = primaryweaponstruct.weaponreticle;
            struct.loadoutprimarylootitemid = primaryweaponstruct.lootItemID;
            struct.loadoutprimaryvariantid = primaryweaponstruct.weaponvariant;
            struct.loadoutprimarycosmeticattachment = primaryweaponstruct.var_67dfd35699ba2d3e;
            for (var_36d2abbdcbcb186c = 0; var_36d2abbdcbcb186c < 5; var_36d2abbdcbcb186c++) {
                struct.loadoutprimarystickers[var_36d2abbdcbcb186c] = primaryweaponstruct.var_3a585b7543f910c5[var_36d2abbdcbcb186c];
            }
            if (isdefined(primaryweaponstruct.blueprinttuning)) {
                struct.var_c4c1f56f0ddbeeff = primaryweaponstruct.blueprinttuning;
            }
            player.var_c59a9ab288f6a9bf[0] = {#var_cb06779b5d45f25f:function_2c7fe4b882b6d63e(iteminstance.var_d3c548c09bb62da2), #secure:function_2c7fe4b882b6d63e(iteminstance.metadata)};
        }
    }
    iteminstance = player function_644ed519cac9722b(1, 1);
    if (function_3f8c62126708afe6(iteminstance)) {
        var_828567794c1e4685 = 1;
        blueprintindex = function_64ccc54bdbae5cf6(iteminstance.lootid);
        if (isdefined(blueprintindex) && blueprintindex == 0) {
            var_9ec3e3e77fa5f56c = function_2b10ba6fb19dccd9(iteminstance.lootid);
            if (isdefined(var_9ec3e3e77fa5f56c)) {
                if (function_633f07e180b6ec8f(var_9ec3e3e77fa5f56c)) {
                    var_536283c1339f8f41 = 0;
                } else {
                    itembundle = getscriptbundle(var_9ec3e3e77fa5f56c);
                    if (isdefined(itembundle)) {
                        if (!isMapToMapInfil && !istrue(itembundle.var_8464122fb6575536)) {
                            assertmsg("<dev string:x8a>" + self.name + "<dev string:x436>" + function_b4dd67b39cbb2f31(iteminstance.lootid) + "<dev string:x45c>" + iteminstance.instanceid + "<dev string:x4a6>");
                            var_828567794c1e4685 = 0;
                        }
                    }
                }
            }
        }
        if (var_828567794c1e4685) {
            secondaryweaponstruct = player function_77046e6abbff19e5(iteminstance, blueprintindex);
            struct.loadoutsecondary = secondaryweaponstruct.weaponref;
            for (attachmentindex = 0; attachmentindex < 7; attachmentindex++) {
                struct.loadoutsecondaryattachments[attachmentindex] = secondaryweaponstruct.attachmentrefs[attachmentindex];
                struct.loadoutsecondaryattachmentids[attachmentindex] = secondaryweaponstruct.attachmentids[attachmentindex];
                tuningvalues = secondaryweaponstruct.var_eae5a591e200672[attachmentindex];
                if (isdefined(tuningvalues)) {
                    struct.var_ead3720e647f74a3[struct.loadoutsecondaryattachments[attachmentindex]] = tuningvalues;
                }
            }
            struct.loadoutsecondarycamo = secondaryweaponstruct.weaponcamo;
            struct.loadoutsecondaryreticle = secondaryweaponstruct.weaponreticle;
            struct.loadoutsecondarylootitemid = secondaryweaponstruct.lootItemID;
            struct.loadoutsecondaryvariantid = secondaryweaponstruct.weaponvariant;
            struct.loadoutsecondarycosmeticattachment = secondaryweaponstruct.var_67dfd35699ba2d3e;
            for (var_36d2abbdcbcb186c = 0; var_36d2abbdcbcb186c < 5; var_36d2abbdcbcb186c++) {
                struct.loadoutsecondarystickers[var_36d2abbdcbcb186c] = secondaryweaponstruct.var_3a585b7543f910c5[var_36d2abbdcbcb186c];
            }
            if (isdefined(secondaryweaponstruct.blueprinttuning)) {
                struct.var_f440bb0f08482d83 = secondaryweaponstruct.blueprinttuning;
            }
            player.var_c59a9ab288f6a9bf[1] = {#var_cb06779b5d45f25f:function_2c7fe4b882b6d63e(iteminstance.var_d3c548c09bb62da2), #secure:function_2c7fe4b882b6d63e(iteminstance.metadata)};
        }
    }
    function_18c12529b048abea(player, struct);
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x2d2d
// Size: 0x2db
function private function_18c12529b048abea(player, struct) {
    if (istrue(self.var_2fa22f24b82c4469)) {
        return;
    }
    iteminstance = player function_644ed519cac9722b(1, 2);
    if (function_3f8c62126708afe6(iteminstance)) {
        var_9ec3e3e77fa5f56c = function_2b10ba6fb19dccd9(iteminstance.lootid);
        if (isdefined(var_9ec3e3e77fa5f56c) && !function_633f07e180b6ec8f(var_9ec3e3e77fa5f56c)) {
            itembundle = getscriptbundle(var_9ec3e3e77fa5f56c);
            if (isdefined(itembundle)) {
                struct.loadoutequipmentprimary = itembundle.ref;
                struct.var_b68e3a0a9c628d23 = function_64ccc54bdbae5cf6(iteminstance.lootid);
                if (!isdefined(struct.var_b68e3a0a9c628d23)) {
                    struct.var_b68e3a0a9c628d23 = 0;
                }
                if (struct.var_b68e3a0a9c628d23 > 0) {
                    if (!isdefined(player.var_a6dd5c7e74106ce3)) {
                        player.var_a6dd5c7e74106ce3 = [];
                    }
                    if (!isdefined(player.var_1c84eeaf9507fb4e)) {
                        player.var_1c84eeaf9507fb4e = [];
                    }
                    player.var_a6dd5c7e74106ce3[itembundle.ref] = struct.var_b68e3a0a9c628d23;
                    player.var_1c84eeaf9507fb4e[itembundle.ref] = iteminstance.lootid;
                }
            }
        }
    }
    iteminstance = player function_644ed519cac9722b(1, 3);
    if (function_3f8c62126708afe6(iteminstance)) {
        var_9ec3e3e77fa5f56c = function_2b10ba6fb19dccd9(iteminstance.lootid);
        if (isdefined(var_9ec3e3e77fa5f56c) && !function_633f07e180b6ec8f(var_9ec3e3e77fa5f56c)) {
            itembundle = getscriptbundle(var_9ec3e3e77fa5f56c);
            if (isdefined(itembundle)) {
                struct.loadoutequipmentsecondary = itembundle.ref;
                struct.var_a1dfc5ce15795a3 = function_64ccc54bdbae5cf6(iteminstance.lootid);
                if (!isdefined(struct.var_a1dfc5ce15795a3)) {
                    struct.var_a1dfc5ce15795a3 = 0;
                }
                if (struct.var_a1dfc5ce15795a3 > 0) {
                    if (!isdefined(player.var_a6dd5c7e74106ce3)) {
                        player.var_a6dd5c7e74106ce3 = [];
                    }
                    if (!isdefined(player.var_1c84eeaf9507fb4e)) {
                        player.var_1c84eeaf9507fb4e = [];
                    }
                    player.var_a6dd5c7e74106ce3[itembundle.ref] = struct.var_a1dfc5ce15795a3;
                    player.var_1c84eeaf9507fb4e[itembundle.ref] = iteminstance.lootid;
                }
            }
        }
    }
    iteminstance = player function_644ed519cac9722b(1, 4);
    if (function_3f8c62126708afe6(iteminstance)) {
        var_9ec3e3e77fa5f56c = function_2b10ba6fb19dccd9(iteminstance.lootid);
        if (isdefined(var_9ec3e3e77fa5f56c) && !function_633f07e180b6ec8f(var_9ec3e3e77fa5f56c)) {
            itembundle = getscriptbundle(var_9ec3e3e77fa5f56c);
            if (isdefined(itembundle)) {
                struct.loadoutfieldupgrade1 = itembundle.ref;
            }
        }
    }
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x3010
// Size: 0x7c0
function private function_77046e6abbff19e5(instance, blueprintindex) {
    struct = spawnstruct();
    struct.attachmentrefs = [];
    struct.attachmentids = [];
    struct.var_eae5a591e200672 = [];
    struct.weaponcamo = "none";
    struct.weaponreticle = "none";
    struct.var_67dfd35699ba2d3e = "none";
    struct.var_3a585b7543f910c5 = [];
    lootinfo = function_3475769c002400f7(instance.lootid);
    var_c7bd95b10c89cff8 = function_1cc3fd00b6ccc3ba(instance.lootid);
    if (isdefined(blueprintindex) && isdefined(lootinfo.itemref)) {
        struct.lootItemID = instance.lootid;
        struct.weaponref = weapon::getweaponrootname(var_c7bd95b10c89cff8);
        struct.weaponvariant = blueprintindex;
    } else {
        itembundle = function_f4a303d532b044a7(instance.lootid);
        if (isdefined(itembundle)) {
            if (itembundle.type == "weapon") {
                struct.lootItemID = instance.lootid;
                struct.weaponref = itembundle.ref;
                struct.weaponvariant = function_64ccc54bdbae5cf6(instance.lootid);
            } else {
                assertmsg("<dev string:x8da>" + "<dev string:x952>" + instance.lootid + "<dev string:x96d>" + (isdefined(itembundle.type) ? itembundle.type : "<dev string:x97f>") + "<dev string:x4a6>");
            }
        }
    }
    if (!isdefined(struct.lootItemID) || struct.lootItemID == 0) {
        struct.lootItemID = 0;
        struct.weaponref = "iw9_me_fists_mp";
        struct.weaponvariant = 0;
        return struct;
    }
    if (isdefined(instance.var_6cb812578f7d9ae7)) {
        var_ae326d1d2b95b12c = int(isdefined(function_f6c6c8920a5333e7(13, instance, 1)) ? function_f6c6c8920a5333e7(13, instance, 1) : 0);
        for (var_e26e310b5f042288 = 0; var_e26e310b5f042288 < 22; var_e26e310b5f042288 += 1) {
            childlootid = instance.var_6cb812578f7d9ae7[var_e26e310b5f042288];
            if (childlootid == 0) {
                continue;
            }
            var_c53056bdc968817b = loot::function_282cf83c9eeda744(childlootid);
            if (!isdefined(var_c53056bdc968817b)) {
                continue;
            }
            var_d2682c57da143e9c = loot::function_793e8a72cedb8ef3(childlootid);
            if (!isdefined(var_d2682c57da143e9c)) {
                assertmsg("<dev string:x98c>" + var_c53056bdc968817b + "<dev string:x9c7>" + childlootid + "<dev string:x9d4>" + instance.instanceid + "<dev string:x4a6>");
                continue;
            }
            switch (var_c53056bdc968817b) {
            case #"hash_4a01666eb6c388c8": 
                attachmentref = loot::function_2f80e9272a2074d(childlootid, var_c7bd95b10c89cff8);
                if (!isdefined(attachmentref)) {
                    assertmsg("<dev string:xa0d>" + childlootid + "<dev string:xa5b>" + var_c7bd95b10c89cff8 + "<dev string:x9d4>" + instance.instanceid + "<dev string:x4a6>");
                    break;
                }
                var_1cb4c40a8480a13c = weapon::function_a622d54bb517923a(attachmentref, [#"lootid"]);
                if (!isdefined(var_1cb4c40a8480a13c)) {
                    assertmsg("<dev string:xa70>" + attachmentref + "<dev string:x9d4>" + instance.instanceid + "<dev string:x4a6>");
                    break;
                }
                attachmentslot = function_4add228b999c26aa(var_c7bd95b10c89cff8, attachmentref);
                if (attachmentslot == "") {
                    assertmsg("<dev string:xac4>" + attachmentref + "<dev string:xa5b>" + var_c7bd95b10c89cff8 + "<dev string:x9d4>" + instance.instanceid + "<dev string:x4a6>");
                    break;
                }
                if (struct.attachmentrefs.size >= 7) {
                    assertmsg("<dev string:xb05>" + instance.instanceid + "<dev string:xb49>");
                    break;
                }
                struct.attachmentrefs[struct.attachmentrefs.size] = attachmentref;
                struct.attachmentids[struct.attachmentids.size] = function_15abe90be101ffc8(var_c7bd95b10c89cff8, attachmentref, childlootid);
                break;
            case #"hash_a12afa2995fb2059": 
                if (struct.weaponcamo != "none") {
                    assertmsg("<dev string:xb05>" + instance.instanceid + "<dev string:xb87>");
                    break;
                }
                bundledata = function_50f8a8f765bad85e(hashcat(%"hash_1345cc24140e89b8", var_d2682c57da143e9c), [#"ref"]);
                if (!isdefined(bundledata) || !isdefined(bundledata.ref)) {
                    assertmsg("<dev string:xbaa>" + childlootid + "<dev string:x9d4>" + instance.instanceid + "<dev string:x4a6>");
                    break;
                }
                struct.weaponcamo = bundledata.ref;
                break;
            case #"hash_3945637d52ccf689":
            case #"hash_aca593b48f7018c2": 
                if (struct.var_67dfd35699ba2d3e != "none") {
                    assertmsg("<dev string:xb05>" + instance.instanceid + "<dev string:xbf2>");
                    break;
                }
                struct.var_67dfd35699ba2d3e = var_d2682c57da143e9c;
                break;
            case #"hash_4b155f83e05788f7": 
                if (struct.weaponreticle != "none") {
                    assertmsg("<dev string:xb05>" + instance.instanceid + "<dev string:xc19>");
                }
                struct.weaponreticle = var_d2682c57da143e9c;
                break;
            case #"hash_249ba0b9f7d065fc": 
                if (struct.var_3a585b7543f910c5.size >= 5) {
                    assertmsg("<dev string:xb05>" + instance.instanceid + "<dev string:xc3f>");
                    break;
                }
                while (!(var_ae326d1d2b95b12c & 1 << struct.var_3a585b7543f910c5.size) && struct.var_3a585b7543f910c5.size < 5) {
                    struct.var_3a585b7543f910c5[struct.var_3a585b7543f910c5.size] = "none";
                }
                struct.var_3a585b7543f910c5[struct.var_3a585b7543f910c5.size] = var_d2682c57da143e9c;
                break;
            default: 
                assertmsg("<dev string:xc6f>" + var_c53056bdc968817b + "<dev string:xcac>" + instance.instanceid + "<dev string:x4a6>");
                break;
            }
        }
    }
    if (isdefined(instance.var_d3c548c09bb62da2)) {
        for (i = 2; i <= 6; i++) {
            value = function_f6c6c8920a5333e7(i, instance, 1);
            if (isdefined(value) && int(value) != 0) {
                value = int(value);
                valuex = value & 255;
                valuey = value >> 8;
                struct.var_eae5a591e200672[i - 2] = [function_f76ff66a6601d9c9(valuex), function_f76ff66a6601d9c9(valuey)];
            }
        }
        value = function_f6c6c8920a5333e7(7, instance, 1);
        if (isdefined(value) && int(value) != 0) {
            struct.blueprinttuning = int(value);
        }
    }
    return struct;
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x37d9
// Size: 0x96
function private function_15abe90be101ffc8(var_c7bd95b10c89cff8, attachment, variantlootid) {
    blueprints = function_4527f44d851c9afd(var_c7bd95b10c89cff8, attachment);
    foreach (variantindex, attachmentdata in blueprints) {
        attachmentlootid = attachmentdata.lootid;
        if (isdefined(attachmentlootid) && variantlootid == attachmentlootid) {
            return variantindex;
        }
    }
    return 0;
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x3878
// Size: 0x84
function private function_1c6803f36c2ea0a6(var_c7bd95b10c89cff8, attachment, variantid) {
    blueprints = function_4527f44d851c9afd(var_c7bd95b10c89cff8, attachment);
    foreach (variantindex, attachmentdata in blueprints) {
        if (variantindex == variantid) {
            return attachmentdata.lootid;
        }
    }
    return undefined;
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3905
// Size: 0xf6
function private function_5bee5ced081d48c0(player) {
    if (!player getplayerdata(level.var_5d69837cf4db0407, "enableDefaultDMZLoadouts")) {
        return;
    }
    if (isdefined(player.primaryweaponobj)) {
        player function_ab4ddb325aae30a5(11, 1, 0, player.primaryweaponobj);
    }
    if (isdefined(player.secondaryweaponobj)) {
        player function_ab4ddb325aae30a5(11, 1, 1, player.secondaryweaponobj);
    }
    var_d3d292d1c22c4da6 = namespace_38b993c4618e76cd::getlootidfromref(player.loadoutequipmentprimary);
    if (isdefined(var_d3d292d1c22c4da6) && var_d3d292d1c22c4da6 != 0) {
        player function_4f1027e74d5073c4(var_d3d292d1c22c4da6, 13, 1, 2, []);
    }
    var_351274b426e46e37 = namespace_38b993c4618e76cd::getlootidfromref(player.loadoutequipmentsecondary);
    if (isdefined(var_351274b426e46e37) && var_351274b426e46e37 != 0) {
        player function_4f1027e74d5073c4(var_351274b426e46e37, 13, 1, 3, []);
    }
    player setplayerdata(level.var_5d69837cf4db0407, "enableDefaultDMZLoadouts", 0);
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a03
// Size: 0x51
function function_d1df77dc341aa4e5() {
    if (!isdefined(level.var_fb27023dc5eaa1c0)) {
        gametypescriptbundle = function_90b5b6e99aef29d6();
        level.var_fb27023dc5eaa1c0 = isdefined(gametypescriptbundle.var_bd6d1a66d695958f) ? gametypescriptbundle.var_bd6d1a66d695958f : 1;
    }
    return level.var_fb27023dc5eaa1c0;
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3a5d
// Size: 0x39
function function_25c00f7dd055c100(player) {
    operatorinstance = self function_644ed519cac9722b(65535, 6);
    if (function_3f8c62126708afe6(operatorinstance)) {
        return operatorinstance.lootid;
    }
    return 0;
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3a9f
// Size: 0x5c
function function_5c97e8ce13fa6a89(player) {
    operatorinstance = self function_644ed519cac9722b(65535, 6);
    if (function_3f8c62126708afe6(operatorinstance)) {
        if (isdefined(operatorinstance.var_6cb812578f7d9ae7) && isdefined(operatorinstance.var_6cb812578f7d9ae7[0])) {
            return operatorinstance.var_6cb812578f7d9ae7[0];
        }
    }
    return 0;
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3b04
// Size: 0x5e
function function_6e550258f79b1ef0(player) {
    operatorinstance = self function_644ed519cac9722b(65535, 6);
    if (function_3f8c62126708afe6(operatorinstance)) {
        if (isdefined(operatorinstance.var_6cb812578f7d9ae7) && isdefined(operatorinstance.var_6cb812578f7d9ae7[1])) {
            return operatorinstance.var_6cb812578f7d9ae7[1];
        }
    }
    return 0;
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3b6b
// Size: 0x1a4
function function_e8e46cba4fcc05f7(player, var_5c6aca696200f252) {
    var_d947b7e87c7243ab = function_5c97e8ce13fa6a89(player);
    if (player isplayerheadless() && (!isdefined(var_d947b7e87c7243ab) || var_d947b7e87c7243ab == 0)) {
        return 0;
    }
    operatorSkinRef = loot::function_793e8a72cedb8ef3(var_d947b7e87c7243ab);
    if (!isdefined(operatorSkinRef)) {
        return 0;
    }
    var_dd7fedd7250ed944 = operator::function_a2f84a43b99f877a(operatorSkinRef);
    if (!isdefined(var_dd7fedd7250ed944)) {
        return 0;
    }
    gametype = game_utility::getgametype();
    if (isdefined(gametype)) {
        return 0;
    }
    if (gametype == "br") {
        switch (var_5c6aca696200f252) {
        case 0: 
            return var_dd7fedd7250ed944.var_887c00efb656cce0;
        case 1: 
            return var_dd7fedd7250ed944.var_6012de269b5278ac;
        case 2: 
            return var_dd7fedd7250ed944.var_c32ff41e38b39322;
        case 3: 
            return var_dd7fedd7250ed944.var_942d00befa8c1d9;
        case 4: 
            return var_dd7fedd7250ed944.var_e2ce402981e2259d;
        }
        return;
    }
    if (gametype == "ob") {
        switch (var_5c6aca696200f252) {
        case 0: 
            return var_dd7fedd7250ed944.var_6d622ccbd9629cf4;
        case 1: 
            return var_dd7fedd7250ed944.var_aa3785a9b9735e90;
        case 2: 
            return var_dd7fedd7250ed944.var_90896b7a4a801c26;
        case 3: 
            return var_dd7fedd7250ed944.var_6b924a188a58b435;
        case 4: 
            return var_dd7fedd7250ed944.var_b54661020c13b2c9;
        }
        return;
    }
    return 0;
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3d17
// Size: 0xf3
function function_f6c6c8920a5333e7(key, instance, var_469244507bbe1b12, var_7f24f2a49f4715f7) {
    if (!isdefined(key) || !isdefined(instance)) {
        return undefined;
    }
    metadata = instance.metadata;
    if (istrue(var_469244507bbe1b12)) {
        metadata = instance.var_d3c548c09bb62da2;
    }
    foreach (data in metadata) {
        if (key == data.key) {
            if (istrue(var_7f24f2a49f4715f7)) {
                return [data.value, data.valuelow, data.valuehigh];
            }
            return data.value;
        }
    }
    return undefined;
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x3e13
// Size: 0x277
function function_8715433c6e64940b(keys, values, instance, var_469244507bbe1b12) {
    if (!isdefined(keys) || !isdefined(values) || !isdefined(instance)) {
        /#
            assertex(isdefined(keys), "<dev string:xce7>");
            assertex(isdefined(values), "<dev string:xd5a>");
            assertex(isdefined(instance), "<dev string:xdcf>");
        #/
        return;
    }
    if (!isarray(keys)) {
        keys = [keys];
    }
    if (!isarray(values)) {
        values = [values];
    }
    assertex(keys.size == values.size, "<dev string:xe40>");
    var_a7efdaacbd89567 = instance.metadata;
    var_aa532d60c3f3d00c = 0;
    var_11e7b05668d732b9 = 0;
    if (istrue(var_469244507bbe1b12)) {
        var_a7efdaacbd89567 = instance.var_d3c548c09bb62da2;
        var_aa532d60c3f3d00c = 1;
        var_11e7b05668d732b9 = 0;
    }
    var_5170a7c15b09f348 = [];
    foreach (data in var_a7efdaacbd89567) {
        if (data.key == var_11e7b05668d732b9) {
            continue;
        }
        var_cd7e1619a7043999 = var_5170a7c15b09f348.size;
        var_5170a7c15b09f348[var_cd7e1619a7043999] = [];
        var_5170a7c15b09f348[var_cd7e1619a7043999][0] = data.key;
        var_5170a7c15b09f348[var_cd7e1619a7043999][1] = int(data.value);
    }
    foreach (keyindex, key in keys) {
        overriden = 0;
        foreach (index, kvp in var_5170a7c15b09f348) {
            if (key == kvp[0]) {
                var_5170a7c15b09f348[index][1] = values[keyindex];
                overriden = 1;
                break;
            }
        }
        if (!overriden) {
            var_cd7e1619a7043999 = var_5170a7c15b09f348.size;
            var_5170a7c15b09f348[var_cd7e1619a7043999] = [];
            var_5170a7c15b09f348[var_cd7e1619a7043999][0] = key;
            var_5170a7c15b09f348[var_cd7e1619a7043999][1] = values[keyindex];
        }
    }
    self function_e70c1fc3c2e5e05f(instance.instanceid, var_aa532d60c3f3d00c, var_5170a7c15b09f348);
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4092
// Size: 0x94
function function_2c7fe4b882b6d63e(var_eda1e1681182223b) {
    var_61395e7c9194e412 = [];
    foreach (data in var_eda1e1681182223b) {
        offset = var_61395e7c9194e412.size;
        var_61395e7c9194e412[offset] = [];
        var_61395e7c9194e412[offset][0] = data.key;
        var_61395e7c9194e412[offset][1] = int(data.value);
    }
    return var_61395e7c9194e412;
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x412f
// Size: 0x77
function function_ab4ddb325aae30a5(kind, location, sublocation, weaponobj) {
    lootid = weapon::function_79d6e6c22245687a(weapon::getweaponrootname(weaponobj), isdefined(weaponobj.variantid) ? weaponobj.variantid : 0);
    subcomponents = function_dec054b294d48a5c(weaponobj);
    self function_4f1027e74d5073c4(lootid, kind, location, sublocation, subcomponents);
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x41ae
// Size: 0x193
function private function_9023be583859d461(params) {
    ent_flag_set("dropped_item");
    if (isdefined(params.item) && isdefined(params.item.weaponobj)) {
        weaponobj = function_2aeaf88105d3b617(0);
        if (isdefined(weaponobj) && issameweapon(weaponobj, params.item.weaponobj, 1)) {
            if (isdefined(self.var_c59a9ab288f6a9bf[0])) {
                params.item.var_c59a9ab288f6a9bf = self.var_c59a9ab288f6a9bf[0];
                self.var_c59a9ab288f6a9bf[0] = undefined;
            }
            return;
        }
        weaponobj = function_2aeaf88105d3b617(1);
        if (isdefined(weaponobj) && issameweapon(weaponobj, params.item.weaponobj, 1)) {
            if (isdefined(self.var_c59a9ab288f6a9bf[1])) {
                params.item.var_c59a9ab288f6a9bf = self.var_c59a9ab288f6a9bf[1];
                self.var_c59a9ab288f6a9bf[1] = undefined;
            }
            return;
        }
        weaponobj = function_2aeaf88105d3b617(2);
        if (isdefined(weaponobj) && issameweapon(weaponobj, params.item.weaponobj, 1)) {
            if (isdefined(self.var_c59a9ab288f6a9bf[2])) {
                params.item.var_c59a9ab288f6a9bf = self.var_c59a9ab288f6a9bf[2];
                self.var_c59a9ab288f6a9bf[2] = undefined;
            }
            return;
        }
    }
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4349
// Size: 0x146
function private function_c9de41def051c9fc(params) {
    if (isdefined(params.item) && isdefined(params.item.var_c59a9ab288f6a9bf)) {
        if (params.tobackpack) {
            weaponobj = function_2aeaf88105d3b617(2);
            if (isdefined(weaponobj) && issameweapon(weaponobj, params.item.weaponobj, 1)) {
                self.var_c59a9ab288f6a9bf[2] = params.item.var_c59a9ab288f6a9bf;
                return;
            }
            return;
        }
        weaponobj = function_2aeaf88105d3b617(0);
        if (isdefined(weaponobj) && issameweapon(weaponobj, params.item.weaponobj, 1)) {
            self.var_c59a9ab288f6a9bf[0] = params.item.var_c59a9ab288f6a9bf;
            return;
        }
        weaponobj = function_2aeaf88105d3b617(1);
        if (isdefined(weaponobj) && issameweapon(weaponobj, params.item.weaponobj, 1)) {
            self.var_c59a9ab288f6a9bf[1] = params.item.var_c59a9ab288f6a9bf;
            return;
        }
    }
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4497
// Size: 0x17
function function_dd9df8b3dd285733() {
    function_7912e187e23451eb();
    function_eb3f359f9bd87c16();
    function_a38bb104e7769055();
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x44b6
// Size: 0x80
function function_7912e187e23451eb() {
    for (var_997ca5393ca50d80 = 0; var_997ca5393ca50d80 < 13; var_997ca5393ca50d80 += 1) {
        if (var_997ca5393ca50d80 == 4) {
            continue;
        }
        function_5a62e05c264fbe50(1, var_997ca5393ca50d80);
    }
    if (function_d1df77dc341aa4e5()) {
        for (var_5c6aca696200f252 = 0; var_5c6aca696200f252 < 6; var_5c6aca696200f252 += 1) {
            if (var_5c6aca696200f252 == 5 && !getdvarint(@"hash_217c1962ed5bdee3", 1)) {
                continue;
            }
            function_5a62e05c264fbe50(65535, var_5c6aca696200f252);
        }
    }
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x453e
// Size: 0x29
function function_eb3f359f9bd87c16() {
    for (backpackindex = 0; backpackindex < 10; backpackindex++) {
        function_5a62e05c264fbe50(2, 1 + backpackindex);
    }
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x456f
// Size: 0x17
function function_a38bb104e7769055() {
    function_5a62e05c264fbe50(9, 0);
    function_5a62e05c264fbe50(9, 1);
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x458e
// Size: 0x1b
function function_213e09add40997f4(location, sublocation) {
    return self function_644ed519cac9722b(location, sublocation);
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x45b2
// Size: 0x43
function function_5a62e05c264fbe50(location, sublocation) {
    instance = self function_644ed519cac9722b(location, sublocation);
    if (function_3f8c62126708afe6(instance)) {
        self function_dd5661ebe3c9a5a2(instance.instanceid);
    }
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x45fd
// Size: 0x37
function function_b1fcbec168284539(lootid, kind, location, sublocation, components) {
    self function_4f1027e74d5073c4(lootid, kind, location, sublocation, components);
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x463c
// Size: 0x1b
function function_31e22109050ae853() {
    return {#lootid:0, #instanceid:"0"};
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4660
// Size: 0x33
function function_3f8c62126708afe6(instance) {
    return isdefined(instance) && instance.instanceid != "0" && instance.lootid != 0;
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x469c
// Size: 0xca
function private function_1e863c336474bb99(iteminstance) {
    if (isdefined(iteminstance) && isdefined(iteminstance.var_d3c548c09bb62da2)) {
        if (iteminstance.kind == 17) {
            assertmsg("<dev string:xed3>");
            return function_31e22109050ae853();
        }
        foreach (metadata in iteminstance.var_d3c548c09bb62da2) {
            if (metadata.key == 15) {
                return self function_644ed519cac9722b(5, int(metadata.value) - 1);
            }
        }
    }
    return function_31e22109050ae853();
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x476f
// Size: 0xc7
function private function_c37d02edd52c6892(iteminstance) {
    if (isdefined(iteminstance) && isdefined(iteminstance.var_d3c548c09bb62da2)) {
        if (iteminstance.kind != 17) {
            assertmsg("<dev string:xf66>");
            return function_31e22109050ae853();
        }
        foreach (metadata in iteminstance.var_d3c548c09bb62da2) {
            if (metadata.key == 15) {
                return self function_644ed519cac9722b(6, int(metadata.value) - 1);
            }
        }
    }
    return function_31e22109050ae853();
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x483f
// Size: 0x3c
function function_f1cc6a55aace03aa(iteminstance) {
    if (!function_3f8c62126708afe6(iteminstance)) {
        return undefined;
    }
    itembundle = function_f4a303d532b044a7(iteminstance.lootid);
    if (!isdefined(itembundle)) {
        return undefined;
    }
    return itembundle;
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4884
// Size: 0x10f
function function_7cce337c4902cbb6(weaponslotindex) {
    if (!isdefined(self.var_c59a9ab288f6a9bf)) {
        self.var_c59a9ab288f6a9bf = [];
    }
    weaponmetadata = self.var_c59a9ab288f6a9bf[weaponslotindex];
    if (isdefined(weaponmetadata)) {
        var_b474ce3041e2eb66 = 0;
        foreach (data in weaponmetadata.secure) {
            if (data[0] == 1) {
                if (data[1] == self.var_87f0698dc7ac0a09) {
                    var_b474ce3041e2eb66 = 1;
                }
                break;
            }
        }
        if (var_b474ce3041e2eb66) {
            foreach (data in weaponmetadata.var_cb06779b5d45f25f) {
                if (data[0] == 15) {
                    return data[1];
                }
            }
        }
    }
    return undefined;
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x499c
// Size: 0x8d
function function_874d25a7167d2051(location, sublocation, reductionseconds) {
    instance = self function_644ed519cac9722b(location, sublocation);
    if (!function_3f8c62126708afe6(instance)) {
        return;
    }
    currentcooldown = isdefined(instance.var_b34159f22f6379c9) ? instance.var_b34159f22f6379c9 : 0;
    if (currentcooldown <= getsystemtime()) {
        return;
    }
    self function_4e8d00b0ee5d3bbb(instance.instanceid, int(max(currentcooldown - reductionseconds, 0)));
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4a31
// Size: 0x31
function private function_9488239f459b656d() {
    if (!isdefined(level.var_aeafecbe7219387e)) {
        level.var_aeafecbe7219387e = getdvarint(@"hash_9f2df0e295940dc4", 0);
    }
    return istrue(level.var_aeafecbe7219387e);
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4a6b
// Size: 0x44
function function_3bb8b73991355a1(var_7c870fc702057b7b) {
    if (!isplayer(self)) {
        assertmsg("<dev string:x100c>");
        return false;
    }
    if (function_9488239f459b656d()) {
        return true;
    }
    if (!function_a6172e49f7313fd8()) {
        return false;
    }
    return function_1291b99db1d57936(var_7c870fc702057b7b) > 0;
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4ab8
// Size: 0x29
function function_1291b99db1d57936(var_7c870fc702057b7b) {
    if (function_9488239f459b656d()) {
        return 1;
    }
    if (!function_a6172e49f7313fd8()) {
        return 0;
    }
    return self function_bcefd279b6133b74(var_7c870fc702057b7b);
}

// Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4aea
// Size: 0x2c2
function function_dec054b294d48a5c(weaponobj) {
    var_49e6ef3edadd524e = weapon::getweaponrootname(weaponobj);
    subcomponents = [];
    if (isdefined(weaponobj.attachments)) {
        foreach (attachment in weaponobj.attachments) {
            if (weapon::attachmentiscosmetic(attachment)) {
                subcomponents[subcomponents.size] = loot::getlootidfromref(attachment);
                continue;
            }
            if (utility::function_f3bb4f4911a1beb2("weapons", "attachmentIsSelectable", weaponobj, attachment)) {
                if (isdefined(weaponobj.attachmentvarindices) && isdefined(weaponobj.attachmentvarindices[attachment])) {
                    attachmentlootid = function_1c6803f36c2ea0a6(weaponobj.basename, attachment, weaponobj.attachmentvarindices[attachment]);
                    if (!isdefined(attachmentlootid)) {
                        attachmentlootid = weapon::function_693e108cb61ceeb5(var_49e6ef3edadd524e, attachment);
                    }
                    subcomponents[subcomponents.size] = attachmentlootid;
                    continue;
                }
                subcomponents[subcomponents.size] = weapon::function_693e108cb61ceeb5(var_49e6ef3edadd524e, attachment);
            }
        }
    }
    if (isdefined(weaponobj.camo)) {
        subcomponents[subcomponents.size] = loot::getlootidfromref(weaponobj.camo);
    }
    if (isdefined(weaponobj.reticle)) {
        subcomponents[subcomponents.size] = loot::getlootidfromref(weaponobj.reticle);
    }
    if (isdefined(weaponobj.stickerslot0) && weaponobj.stickerslot0 != "none") {
        subcomponents[subcomponents.size] = loot::getlootidfromref(function_2e84a570d6af300a(weaponobj.stickerslot0, "i/"));
    }
    if (isdefined(weaponobj.stickerslot1) && weaponobj.stickerslot1 != "none") {
        subcomponents[subcomponents.size] = loot::getlootidfromref(function_2e84a570d6af300a(weaponobj.stickerslot1, "i/"));
    }
    if (isdefined(weaponobj.stickerslot2) && weaponobj.stickerslot2 != "none") {
        subcomponents[subcomponents.size] = loot::getlootidfromref(function_2e84a570d6af300a(weaponobj.stickerslot2, "i/"));
    }
    if (isdefined(weaponobj.stickerslot3) && weaponobj.stickerslot3 != "none") {
        subcomponents[subcomponents.size] = loot::getlootidfromref(function_2e84a570d6af300a(weaponobj.stickerslot3, "i/"));
    }
    if (isdefined(weaponobj.var_b39ac546cc8621f8) && weaponobj.var_b39ac546cc8621f8 != "none") {
        subcomponents[subcomponents.size] = loot::getlootidfromref(function_2e84a570d6af300a(weaponobj.var_b39ac546cc8621f8, "i/"));
    }
    return subcomponents;
}

/#

    // Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x4db5
    // Size: 0x2e
    function private function_85f5c72ab2951d3b() {
        function_6e7290c8ee4f558b("<dev string:x105c>");
        function_a9a864379a098ad6("<dev string:x107d>", "<dev string:x109a>", &function_b34a4271751db584);
        function_fe953f000498048f();
    }

    // Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x4deb
    // Size: 0x77
    function function_b34a4271751db584() {
        foreach (player in level.players) {
            player.var_84d661ff601a2f9f = 0;
            player function_6aa0d0467dfd4624(1);
            player function_80c587026fbc6e0d();
            player function_78ec884c707a6adc();
        }
    }

    // Namespace namespace_9571f642f38c8169 / namespace_510e82113265fae9
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x4e6a
    // Size: 0x1b4
    function function_221fabd6ffdb8013(instance, player, context) {
        if (getdvarint(@"hash_613933303e1174d5", 0) == 0) {
            return;
        }
        println("<dev string:x10c5>" + instance.instanceid + "<dev string:x10e7>");
        if (isdefined(player)) {
            println("<dev string:x10f1>" + player.name);
        }
        if (isdefined(context)) {
            println("<dev string:x10fd>" + context);
        }
        if (isdefined(instance.metadata)) {
            println("<dev string:x110a>");
            foreach (data in instance.metadata) {
                println("<dev string:x111e>" + data.key + "<dev string:x1127>" + data.value);
            }
        }
        if (isdefined(instance.var_d3c548c09bb62da2)) {
            println("<dev string:x1134>");
            foreach (data in instance.var_d3c548c09bb62da2) {
                println("<dev string:x111e>" + data.key + "<dev string:x1127>" + data.value);
            }
        }
        println("<dev string:x114a>" + instance.instanceid + "<dev string:x10e7>");
    }

#/
