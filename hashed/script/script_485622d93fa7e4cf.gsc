// mwiii decomp prototype
#using script_247745a526421ba7;
#using script_4c770a9a4ad7659c;
#using script_38eb8f4be20d54f4;
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

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1039
// Size: 0x11d
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

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x115d
// Size: 0x6b
function function_a6172e49f7313fd8() {
    if (!isdefined(level.var_f86a8dcd08547317)) {
        level.var_f86a8dcd08547317 = getdvarint(@"hash_a31e837c3d3a9c9", 0);
        if (getdvarint(@"hash_8a3e66f8380bb284", 0)) {
            level.var_f86a8dcd08547317 = 0;
            /#
                println("]. Revoking the schematic's instance.");
            #/
            setdvar(@"hash_a31e837c3d3a9c9", 0);
        }
    }
    return level.var_f86a8dcd08547317;
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11d0
// Size: 0x92
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

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x126a
// Size: 0x16
function function_6aa0d0467dfd4624(var_2ef2d7a2159d760e) {
    self.var_63878ea2f83352cf = var_2ef2d7a2159d760e;
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1287
// Size: 0xd
function function_c82e8cdc726067e() {
    return istrue(self.var_63878ea2f83352cf);
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x129c
// Size: 0x12
function private function_be000b0b3db20f5d(player) {
    return player function_f6c07d6ea7d83a5a();
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12b6
// Size: 0x16
function private function_fe62eb696aaf7d47(params) {
    self.var_c59a9ab288f6a9bf = [];
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12d3
// Size: 0x17b
function private function_b9aff90f8226c917(params) {
    if (istrue(self.var_2fa22f24b82c4469)) {
        return;
    }
    if (isdefined(self.primaryweapons)) {
        foreach (weapon in self.primaryweapons) {
            if (!isnullweapon(weapon) && isdefined(weapon) && isdefined(weapon.var_9c12f2e2022a8fc7) && isdefined(weapon.var_9c12f2e2022a8fc7.attachmentdata) && weapon.var_9c12f2e2022a8fc7.attachmentdata == "iw9_rec_mike4_v35") {
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
    namespace_fe9526a81c458d8f::function_389d4cd85d174957();
    namespace_fe9526a81c458d8f::function_32c79be2384f10fb(namespace_fe9526a81c458d8f::function_286713f0349afb22());
    function_7afe055995edf844();
    function_c5c2af56b6e31c74();
    callback::add("player_item_drop", &function_9023be583859d461);
    callback::add("player_item_pickup", &function_c9de41def051c9fc);
    self.var_2fa22f24b82c4469 = 1;
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1455
// Size: 0x693
function private function_7afe055995edf844() {
    if (!isdefined(level.var_19cc064ef4f4f035)) {
        level.var_19cc064ef4f4f035 = 0;
    }
    if (!isdefined(self.var_87f0698dc7ac0a09)) {
        self.var_87f0698dc7ac0a09 = level.var_19cc064ef4f4f035;
        level.var_19cc064ef4f4f035 = level.var_19cc064ef4f4f035 + 1;
    }
    var_ba3c9899fa64c6f2 = [];
    var_de79dbea8c4f970e = self function_644ed519cac9722b(1, 0);
    if (function_3f8c62126708afe6(var_de79dbea8c4f970e) && var_de79dbea8c4f970e.var_207098e76bcac40f != 11) {
        var_ba3c9899fa64c6f2[var_ba3c9899fa64c6f2.size] = {weaponindex:0, instance:var_de79dbea8c4f970e, var_fb6bafb61d5c3d4a:0, location:1};
    }
    var_6585928b9413484e = self function_644ed519cac9722b(1, 1);
    if (function_3f8c62126708afe6(var_6585928b9413484e) && var_6585928b9413484e.var_207098e76bcac40f != 11) {
        var_ba3c9899fa64c6f2[var_ba3c9899fa64c6f2.size] = {weaponindex:1, instance:var_6585928b9413484e, var_fb6bafb61d5c3d4a:1, location:1};
    }
    var_6267a5ad12c5e4d4 = self function_644ed519cac9722b(2, 0);
    if (function_3f8c62126708afe6(var_6267a5ad12c5e4d4) && var_6267a5ad12c5e4d4.var_207098e76bcac40f != 11) {
        var_ba3c9899fa64c6f2[var_ba3c9899fa64c6f2.size] = {weaponindex:2, instance:var_6267a5ad12c5e4d4, var_fb6bafb61d5c3d4a:0, location:2};
    }
    if (getdvarint(@"hash_1b1ec093041f3814", 1) != 0) {
        var_760480dc8b6f2623 = [];
        isMapToMapInfil = istrue(utility::function_f3bb4f4911a1beb2("instanceInventory", "isMapToMapInfil"));
        for (var_65b695f0c0d909ed = 0; var_65b695f0c0d909ed < 10; var_65b695f0c0d909ed++) {
            var_787d331022c70035 = self function_644ed519cac9722b(2, 1 + var_65b695f0c0d909ed);
            if (!function_3f8c62126708afe6(var_787d331022c70035) || var_787d331022c70035.var_207098e76bcac40f != 17) {
                continue;
            }
            if (isMapToMapInfil) {
                continue;
            }
            var_85166da84e55de25 = function_f6c6c8920a5333e7(15, var_787d331022c70035, 1);
            if (!isdefined(var_85166da84e55de25)) {
                self function_dd5661ebe3c9a5a2(var_787d331022c70035.var_fb5fdfafc29f4513);
                /#
                    assertmsg("CommonInstanceInventoryERROR: Player [" + self.name + "] entered the game with a schematic [" + var_787d331022c70035.var_fb5fdfafc29f4513 + "] with lootID [" + var_787d331022c70035.lootid + "] that was not insured. This is not allowed as the only way a schematic can enter" + " the backpack on the frontend is through the insured slots. Revoking the schematic's instance.");
                #/
            } else {
                var_b0bee880705ae6be = function_c37d02edd52c6892(var_787d331022c70035);
                if (isdefined(var_b0bee880705ae6be.var_b34159f22f6379c9) && var_b0bee880705ae6be.var_b34159f22f6379c9 > getsystemtime()) {
                    self function_dd5661ebe3c9a5a2(var_787d331022c70035.var_fb5fdfafc29f4513);
                    /#
                        assertmsg("CommonInstanceInventoryERROR: Player [" + self.name + "] entered the game with a schematic using the schematic slot [" + var_787d331022c70035.var_fb5fdfafc29f4513 + "] which is still on cooldown. Revoking the schematic's instance.");
                    #/
                } else if (isdefined(var_760480dc8b6f2623[var_85166da84e55de25])) {
                    self function_dd5661ebe3c9a5a2(var_787d331022c70035.var_fb5fdfafc29f4513);
                    /#
                        assertmsg("CommonInstanceInventoryERROR: Player [" + self.name + "] entered the game with a schematic [" + var_b0bee880705ae6be.var_fb5fdfafc29f4513 + "] which points the to same schematic slot as another schematic: [" + var_760480dc8b6f2623[var_85166da84e55de25] + "]. Revoking the schematic's instance.");
                    #/
                } else {
                    itembundle = function_f4a303d532b044a7(var_787d331022c70035.lootid);
                    if (!isdefined(itembundle) || !isdefined(itembundle.var_b5ccd2f88ca30aef) || itembundle.var_b5ccd2f88ca30aef == 0) {
                        continue;
                    }
                    var_963b1b6e92e4db70 = getsystemtime() + itembundle.var_b5ccd2f88ca30aef;
                    self function_4e8d00b0ee5d3bbb(var_b0bee880705ae6be.var_fb5fdfafc29f4513, int(var_963b1b6e92e4db70));
                    var_760480dc8b6f2623[var_85166da84e55de25] = var_b0bee880705ae6be.var_fb5fdfafc29f4513;
                    /#
                        function_221fabd6ffdb8013(var_b0bee880705ae6be, self, "<unknown string>");
                    #/
                }
            }
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
            self function_dd5661ebe3c9a5a2(var_3cd9588dc8609a1.instance.var_fb5fdfafc29f4513);
            /#
                assertmsg("CommonInstanceInventoryERROR: Player [" + self.name + "] entered the game with an insured item from the instance inventory which is still" + " on cooldown. Revoking that item's instance: [" + var_3cd9588dc8609a1.instance.var_fb5fdfafc29f4513 + "]");
            #/
        } else if (isdefined(var_760480dc8b6f2623[var_85166da84e55de25])) {
            self function_dd5661ebe3c9a5a2(var_3cd9588dc8609a1.instance.var_fb5fdfafc29f4513);
            /#
                assertmsg("CommonInstanceInventoryERROR: Player [" + self.name + "] entered the game with an insured item from the instance inventory which points the to same insured" + " slot as another insured item: [" + var_760480dc8b6f2623[var_85166da84e55de25] + "]. Revoking this items's instance: [" + var_3cd9588dc8609a1.instance.var_fb5fdfafc29f4513 + "]");
            #/
        } else {
            function_8715433c6e64940b([0:1], [0:self.var_87f0698dc7ac0a09], var_3cd9588dc8609a1.instance, 0);
            var_3cd9588dc8609a1.instance = self function_644ed519cac9722b(var_3cd9588dc8609a1.location, var_3cd9588dc8609a1.var_fb6bafb61d5c3d4a);
            self.var_42cd6df38ee20402[self.var_42cd6df38ee20402.size] = var_3cd9588dc8609a1.instance;
            if (isdefined(var_3cd9588dc8609a1.weaponindex)) {
                self.var_c59a9ab288f6a9bf[var_3cd9588dc8609a1.weaponindex] = {var_cb06779b5d45f25f:function_2c7fe4b882b6d63e(var_3cd9588dc8609a1.instance.var_d3c548c09bb62da2), secure:function_2c7fe4b882b6d63e(var_3cd9588dc8609a1.instance.metadata)};
            }
            var_760480dc8b6f2623[var_85166da84e55de25] = var_3cd9588dc8609a1.instance.var_fb5fdfafc29f4513;
            /#
                function_221fabd6ffdb8013(var_3cd9588dc8609a1.instance, self, "<unknown string>");
            #/
        }
    }
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1aef
// Size: 0x11
function private function_c5c2af56b6e31c74() {
    function_451eefc39146b820();
    function_1100308907e5eb6a();
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1b07
// Size: 0x385
function private function_451eefc39146b820() {
    if (function_d1df77dc341aa4e5()) {
        operatorSkinRef = loot::function_793e8a72cedb8ef3(function_5c97e8ce13fa6a89(self));
        var_2663a30351d5b1ab = 0;
        while (var_2663a30351d5b1ab < 6) {
            if (var_2663a30351d5b1ab == 5) {
                goto LOC_00000248;
            }
            var_787d331022c70035 = self function_644ed519cac9722b(65535, var_2663a30351d5b1ab);
            if (function_3f8c62126708afe6(var_787d331022c70035)) {
                var_9ec3e3e77fa5f56c = function_2b10ba6fb19dccd9(var_787d331022c70035.lootid);
                if (!isdefined(var_9ec3e3e77fa5f56c) || function_633f07e180b6ec8f(var_9ec3e3e77fa5f56c)) {
                    goto LOC_00000248;
                }
                itembundle = getscriptbundle(var_9ec3e3e77fa5f56c);
                if (isdefined(itembundle)) {
                    if (!istrue(itembundle.var_8464122fb6575536)) {
                        /#
                            assertmsg("CommonInstanceInventoryERROR: Player [" + self.name + "] entered the game with the item [" + function_b4dd67b39cbb2f31(var_787d331022c70035.lootid) + "] which is not marked as extractable. Revoking that item's instance: [" + var_787d331022c70035.var_fb5fdfafc29f4513 + "].");
                        #/
                        goto LOC_00000248;
                    }
                    params = spawnstruct();
                    params.type = itembundle.scriptable;
                    params.count = function_7209c8cd4b2e3afd(isdefined(itembundle.spawncount) ? 1 : itembundle.spawncount);
                    params.bundle = itembundle;
                    function_de489fa2ffdb7f2d(params, 0);
                    callback::callback("instance_inventory_item_equipped", params);
                }
            } else if (isdefined(operatorSkinRef)) {
                var_7d921c0ed68ea7a6 = function_e8e46cba4fcc05f7(self, var_2663a30351d5b1ab);
                if (isdefined(var_7d921c0ed68ea7a6) && var_7d921c0ed68ea7a6 != 0) {
                    var_9ec3e3e77fa5f56c = function_2b10ba6fb19dccd9(var_7d921c0ed68ea7a6);
                    if (!isdefined(var_9ec3e3e77fa5f56c) || function_633f07e180b6ec8f(var_9ec3e3e77fa5f56c)) {
                        goto LOC_00000248;
                    }
                    itembundle = getscriptbundle(var_9ec3e3e77fa5f56c);
                    if (isdefined(itembundle)) {
                        params = spawnstruct();
                        params.type = itembundle.scriptable;
                        params.count = function_7209c8cd4b2e3afd(isdefined(itembundle.spawncount) ? 1 : itembundle.spawncount);
                        params.bundle = itembundle;
                        function_de489fa2ffdb7f2d(params, 0);
                        callback::callback("instance_inventory_item_equipped", params);
                    LOC_00000248:
                    }
                LOC_00000248:
                }
            LOC_00000248:
            }
        LOC_00000248:
            var_2663a30351d5b1ab = var_2663a30351d5b1ab + 1;
        }
    } else {
        var_2e534774289cc46d = 7;
        while (var_2e534774289cc46d < 12) {
            var_787d331022c70035 = self function_644ed519cac9722b(1, var_2e534774289cc46d);
            if (!function_3f8c62126708afe6(var_787d331022c70035)) {
                goto LOC_0000037a;
            }
            var_9ec3e3e77fa5f56c = function_2b10ba6fb19dccd9(var_787d331022c70035.lootid);
            if (!isdefined(var_9ec3e3e77fa5f56c) || function_633f07e180b6ec8f(var_9ec3e3e77fa5f56c)) {
                goto LOC_0000037a;
            }
            itembundle = getscriptbundle(var_9ec3e3e77fa5f56c);
            if (!isdefined(itembundle)) {
                goto LOC_0000037a;
            }
            if (!istrue(itembundle.var_8464122fb6575536)) {
                /#
                    assertmsg("CommonInstanceInventoryERROR: Player [" + self.name + "] entered the game with the item [" + function_b4dd67b39cbb2f31(var_787d331022c70035.lootid) + "] which is not marked as extractable. Revoking that item's instance: [" + var_787d331022c70035.var_fb5fdfafc29f4513 + "].");
                #/
            } else {
                params = spawnstruct();
                params.type = itembundle.scriptable;
                params.count = function_7209c8cd4b2e3afd(isdefined(itembundle.spawncount) ? 1 : itembundle.spawncount);
                params.bundle = itembundle;
                function_de489fa2ffdb7f2d(params, 0);
                callback::callback("instance_inventory_item_equipped", params);
            LOC_0000037a:
            }
        LOC_0000037a:
            var_2e534774289cc46d = var_2e534774289cc46d + 1;
        }
    }
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1e93
// Size: 0x371
function private function_1100308907e5eb6a() {
    isMapToMapInfil = istrue(utility::function_f3bb4f4911a1beb2("instanceInventory", "isMapToMapInfil"));
    for (var_65b695f0c0d909ed = 0; var_65b695f0c0d909ed < 10; var_65b695f0c0d909ed++) {
        var_65d040b6fa76f410 = self function_644ed519cac9722b(2, 1 + var_65b695f0c0d909ed);
        if (function_3f8c62126708afe6(var_65d040b6fa76f410)) {
            var_9ec3e3e77fa5f56c = function_2b10ba6fb19dccd9(var_65d040b6fa76f410.lootid);
            if (!isdefined(var_9ec3e3e77fa5f56c) || function_633f07e180b6ec8f(var_9ec3e3e77fa5f56c)) {
                function_ca3bbb1070436540(var_65b695f0c0d909ed, 0, 1);
                continue;
            }
            itembundle = getscriptbundle(var_9ec3e3e77fa5f56c);
            if (!isdefined(itembundle)) {
                function_ca3bbb1070436540(var_65b695f0c0d909ed, 0, 1);
                continue;
            }
            if (!isMapToMapInfil && !istrue(itembundle.var_72340ceb276c0f64)) {
                /#
                    assertmsg("CommonInstanceInventoryERROR: Player [" + self.name + "] entered the game with the item [" + function_b4dd67b39cbb2f31(var_65d040b6fa76f410.lootid) + "] which is not marked as extractable. Revoking that item's instance: [" + var_65d040b6fa76f410.var_fb5fdfafc29f4513 + "].");
                #/
                function_ca3bbb1070436540(var_65b695f0c0d909ed, 0, 1);
                continue;
            }
            if (isdefined(itembundle) && itembundle.type == "schematic" && getdvarint(@"hash_1b1ec093041f3814", 1) != 0) {
                if (isMapToMapInfil) {
                    function_ca3bbb1070436540(var_65b695f0c0d909ed, var_65d040b6fa76f410.lootid, 1);
                    continue;
                }
                var_1c791d7dca27482a = itembundle.var_a7141a24829dc197;
                if (!isdefined(var_1c791d7dca27482a)) {
                    /#
                        assertmsg("CommonInstanceInventoryERROR: The itemspawnentry for schematic [" + function_b4dd67b39cbb2f31(var_65d040b6fa76f410.lootid) + "] does not specify an acquisition to grant on infil.");
                    #/
                    function_ca3bbb1070436540(var_65b695f0c0d909ed, 0, 1);
                    continue;
                }
                var_edd8960f9ec52b5f = getscriptbundle(var_1c791d7dca27482a);
                if (!isdefined(var_edd8960f9ec52b5f)) {
                    /#
                        assertmsg("CommonInstanceInventoryERROR: Script bundle not found for itemspawnentry [" + function_3c8848a3a11b2553(var_1c791d7dca27482a) + "]. The itemspawnentry might not be added to the gametype's Item Include List" + " (gametypebundle -> Common Item Data -> Item Include List).");
                    #/
                    function_ca3bbb1070436540(var_65b695f0c0d909ed, 0, 1);
                    continue;
                }
                var_6014c760d9adff2f = function_6d15e119c2779a93(var_edd8960f9ec52b5f);
                if (!isdefined(var_6014c760d9adff2f)) {
                    function_ca3bbb1070436540(var_65b695f0c0d909ed, 0, 1);
                    continue;
                }
                if (var_65d040b6fa76f410.var_207098e76bcac40f != 17) {
                    /#
                        assertmsg("CommonInstanceInventoryERROR: The item instance [" + var_65d040b6fa76f410.var_fb5fdfafc29f4513 + "]" + " for schematic [" + function_b4dd67b39cbb2f31(var_65d040b6fa76f410.lootid) + "]" + " did not have the CONST_INVENTORY_KIND_SCHEMATIC which is required for schematics.");
                    #/
                    function_ca3bbb1070436540(var_65b695f0c0d909ed, 0, 1);
                    continue;
                }
                function_ca3bbb1070436540(var_65b695f0c0d909ed, var_6014c760d9adff2f, 1);
            } else {
                if (!isMapToMapInfil && var_65d040b6fa76f410.var_207098e76bcac40f == 17) {
                    /#
                        assertmsg("CommonInstanceInventoryERROR: The item instance [" + var_65d040b6fa76f410.var_fb5fdfafc29f4513 + "]" + " for lootID [" + var_65d040b6fa76f410.lootid + "] was of the kind CONST_INVENTORY_KIND_SCHEMATIC." + " Schematics are not allowed to be in the backpack on infil, revoking that instance.");
                    #/
                    function_ca3bbb1070436540(var_65b695f0c0d909ed, 0, 1);
                    continue;
                }
                quantity = 1;
                if (isMapToMapInfil) {
                    var_35eabffb2f0f31e3 = function_f6c6c8920a5333e7(6, var_65d040b6fa76f410, 0);
                    if (isdefined(var_35eabffb2f0f31e3)) {
                        var_35eabffb2f0f31e3 = int(var_35eabffb2f0f31e3);
                        if (var_35eabffb2f0f31e3 > 1) {
                            quantity = var_35eabffb2f0f31e3;
                        }
                    }
                }
                function_ca3bbb1070436540(var_65b695f0c0d909ed, var_65d040b6fa76f410.lootid, quantity);
            }
        } else {
            function_ca3bbb1070436540(var_65b695f0c0d909ed, 0, 1);
        }
    }
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x220b
// Size: 0x1d
function private function_8736033b9b41f872(params) {
    if (function_f9dea9ba0820dc12(self)) {
        function_dd9df8b3dd285733();
    }
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x222f
// Size: 0x20
function private function_65fe8e9157854159(params) {
    if (!istrue(self.var_84d661ff601a2f9f)) {
        function_80c587026fbc6e0d();
    }
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2256
// Size: 0xa1
function function_80c587026fbc6e0d() {
    if (!function_a6172e49f7313fd8()) {
        return;
    }
    if (istrue(self.var_84d661ff601a2f9f)) {
        /#
            assertmsg("CommonInstanceInventoryERROR: InstanceInventory_FinalizeForPlayer() called on player [" + self.name + "], but their inventory has already been finalized!");
        #/
        return;
    }
    if (function_c82e8cdc726067e()) {
        utility::function_f3bb4f4911a1beb2("instanceInventory", "preExtractItems", self);
        function_ab1ee99079e4c5a0();
        utility::function_f3bb4f4911a1beb2("instanceInventory", "postExtractItems", self);
        function_340f746f0eb455d9();
    } else if (function_f9dea9ba0820dc12(self)) {
        function_dd9df8b3dd285733();
        namespace_fe9526a81c458d8f::function_389d4cd85d174957();
    }
    function_d2e72de8b468cffa();
    self.var_84d661ff601a2f9f = 1;
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x22fe
// Size: 0x34f
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
    for (var_65b695f0c0d909ed = 0; var_65b695f0c0d909ed < 10; var_65b695f0c0d909ed++) {
        var_fb6bafb61d5c3d4a = 1 + var_65b695f0c0d909ed;
        function_5a62e05c264fbe50(2, var_fb6bafb61d5c3d4a);
        lootid = function_d870b2c45335bd88(var_65b695f0c0d909ed);
        if (!isdefined(lootid) || lootid == 0) {
            continue;
        }
        itembundle = function_f4a303d532b044a7(lootid);
        if (!isdefined(itembundle)) {
            continue;
        }
        var_207098e76bcac40f = 13;
        if (!isMapToMapExfil) {
            if (!istrue(itembundle.var_72340ceb276c0f64)) {
                continue;
            }
            if (isdefined(itembundle.var_95d6d970efccc96d)) {
                switch (itembundle.var_95d6d970efccc96d) {
                case #"hash_78e8e9a60d7025a7":
                    var_207098e76bcac40f = 13;
                    break;
                case #"hash_61d9379cb6db8320":
                    var_207098e76bcac40f = 12;
                    break;
                case #"hash_5fe9df5902455824":
                    var_207098e76bcac40f = 18;
                    break;
                }
            }
        }
        function_b1fcbec168284539(lootid, var_207098e76bcac40f, 2, var_fb6bafb61d5c3d4a, []);
        if (isMapToMapExfil) {
            instance = self function_644ed519cac9722b(2, var_fb6bafb61d5c3d4a);
            if (function_3f8c62126708afe6(instance)) {
                quantity = function_5ce7fe3dca9c1a22(var_65b695f0c0d909ed);
                if (isdefined(quantity) && quantity > 1) {
                    keys = [0:6];
                    values = [0:quantity];
                    function_8715433c6e64940b(keys, values, instance);
                }
            }
        }
    }
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2654
// Size: 0x28b
function private function_dbaac60172658dcf(weaponindex, location, var_fb6bafb61d5c3d4a) {
    function_5a62e05c264fbe50(location, var_fb6bafb61d5c3d4a);
    weaponobj = function_2aeaf88105d3b617(weaponindex);
    if (!isdefined(weaponobj)) {
        return;
    }
    var_57ad0dc40b2fdda = function_61f99d560d896d24(weaponindex);
    components = var_57ad0dc40b2fdda[2];
    ammo = var_57ad0dc40b2fdda[1];
    itembundle = var_57ad0dc40b2fdda[0];
    lootid = weapon::function_9c331f88be5a1478(weaponobj);
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
    function_b1fcbec168284539(lootid, 11, location, var_fb6bafb61d5c3d4a, isdefined(components) ? [] : components);
    instance = self function_644ed519cac9722b(location, var_fb6bafb61d5c3d4a);
    if (isdefined(self.var_c59a9ab288f6a9bf[weaponindex])) {
        self function_e70c1fc3c2e5e05f(instance.var_fb5fdfafc29f4513, 0, self.var_c59a9ab288f6a9bf[weaponindex].secure);
        self function_e70c1fc3c2e5e05f(instance.var_fb5fdfafc29f4513, 1, self.var_c59a9ab288f6a9bf[weaponindex].var_cb06779b5d45f25f);
    }
    var_ae326d1d2b95b12c = 0;
    if (isdefined(weaponobj.stickerslot0) && weaponobj.stickerslot0 != "none") {
        var_ae326d1d2b95b12c = var_ae326d1d2b95b12c | 1;
    }
    if (isdefined(weaponobj.stickerslot1) && weaponobj.stickerslot1 != "none") {
        var_ae326d1d2b95b12c = var_ae326d1d2b95b12c | 2;
    }
    if (isdefined(weaponobj.stickerslot2) && weaponobj.stickerslot2 != "none") {
        var_ae326d1d2b95b12c = var_ae326d1d2b95b12c | 4;
    }
    if (isdefined(weaponobj.stickerslot3) && weaponobj.stickerslot3 != "none") {
        var_ae326d1d2b95b12c = var_ae326d1d2b95b12c | 8;
    }
    if (isdefined(weaponobj.var_b39ac546cc8621f8) && weaponobj.var_b39ac546cc8621f8 != "none") {
        var_ae326d1d2b95b12c = var_ae326d1d2b95b12c | 16;
    }
    if (var_ae326d1d2b95b12c > 0) {
        function_8715433c6e64940b([0:13], [0:var_ae326d1d2b95b12c], instance, 1);
    }
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x28e6
// Size: 0x180
function private function_e26d5c543a147a8d(itemtype, var_207098e76bcac40f, location, var_fb6bafb61d5c3d4a, var_f97c456989bea293) {
    function_5a62e05c264fbe50(location, var_fb6bafb61d5c3d4a);
    var_c43af6f7502b943a = function_cca8bbe88a39ad41(itemtype);
    if (!isdefined(var_c43af6f7502b943a.var_df9b308efe82294a)) {
        /#
            assertmsg("CommonInstanceInventoryERROR: Can't identify equipped item of type [" + itemtype + "]." + " The item type was probably not registered with the common item system.");
        #/
        return;
    }
    var_57ad1dc40b3000d = isdefined(var_f97c456989bea293) ? self [[ var_c43af6f7502b943a.var_df9b308efe82294a ]](var_f97c456989bea293) : self [[ var_c43af6f7502b943a.var_df9b308efe82294a ]]();
    components = var_57ad1dc40b3000d[2];
    quantity = var_57ad1dc40b3000d[1];
    itembundle = var_57ad1dc40b3000d[0];
    lootid = function_6d15e119c2779a93(itembundle);
    if (!isdefined(lootid) || lootid == 0 || !isdefined(quantity) || quantity == 0) {
        return;
    }
    if (!istrue(itembundle.var_8464122fb6575536) && !istrue(utility::function_f3bb4f4911a1beb2("instanceInventory", "isMapToMapExfil", self))) {
        return;
    }
    if (isdefined(self.var_a6dd5c7e74106ce3) && isdefined(self.var_a6dd5c7e74106ce3[itembundle.ref])) {
        lootid = self.var_1c84eeaf9507fb4e[itembundle.ref];
    }
    function_b1fcbec168284539(lootid, var_207098e76bcac40f, location, var_fb6bafb61d5c3d4a, isdefined(components) ? [] : components);
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2a6d
// Size: 0x2d6
function private function_340f746f0eb455d9() {
    if (!isdefined(level.var_62f6f7640e4431e3.var_a9ffb4dcf1c85e0f)) {
        return;
    }
    if (istrue(utility::function_f3bb4f4911a1beb2("instanceInventory", "isMapToMapExfil", self))) {
        return;
    }
    var_7c6183ce9e04512e = level.var_62f6f7640e4431e3.var_a9ffb4dcf1c85e0f;
    var_a7a6077754bbc2f8 = function_6e2deb013c9ca85e(var_7c6183ce9e04512e);
    var_fd52a3922167ea1 = [];
    var_fd52a3922167ea1[var_fd52a3922167ea1.size] = function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"version");
    var_fd52a3922167ea1[var_fd52a3922167ea1.size] = 1;
    var_6be6ee2c96b9685d = function_d6f771aedba70ce7(var_7c6183ce9e04512e, #"loot_id");
    var_21341c7142d7e704 = var_6be6ee2c96b9685d;
    var_333f404612f8d562 = self function_644ed519cac9722b(1, 0);
    var_57acedc40b2f974 = function_e85d625960aadaaa(var_333f404612f8d562, var_21341c7142d7e704, var_fd52a3922167ea1);
    var_21341c7142d7e704 = var_57acedc40b2f974[1];
    var_fd52a3922167ea1 = var_57acedc40b2f974[0];
    var_20debc67d125a6a2 = self function_644ed519cac9722b(1, 1);
    var_57acfdc40b2fba7 = function_e85d625960aadaaa(var_20debc67d125a6a2, var_21341c7142d7e704, var_fd52a3922167ea1);
    var_21341c7142d7e704 = var_57acfdc40b2fba7[1];
    var_fd52a3922167ea1 = var_57acfdc40b2fba7[0];
    var_6267a5ad12c5e4d4 = self function_644ed519cac9722b(2, 0);
    var_57ac4dc40b2e376 = function_e85d625960aadaaa(var_6267a5ad12c5e4d4, var_21341c7142d7e704, var_fd52a3922167ea1);
    var_21341c7142d7e704 = var_57ac4dc40b2e376[1];
    var_fd52a3922167ea1 = var_57ac4dc40b2e376[0];
    var_b2721cf177f915e4 = self function_644ed519cac9722b(1, 2);
    if (function_3f8c62126708afe6(var_b2721cf177f915e4)) {
        var_fd52a3922167ea1[var_fd52a3922167ea1.size] = var_21341c7142d7e704;
        var_fd52a3922167ea1[var_fd52a3922167ea1.size] = var_b2721cf177f915e4.lootid;
        var_21341c7142d7e704 = var_21341c7142d7e704 + 1;
    }
    var_2230de25f8635c83 = self function_644ed519cac9722b(1, 3);
    if (function_3f8c62126708afe6(var_2230de25f8635c83)) {
        var_fd52a3922167ea1[var_fd52a3922167ea1.size] = var_21341c7142d7e704;
        var_fd52a3922167ea1[var_fd52a3922167ea1.size] = var_2230de25f8635c83.lootid;
        var_21341c7142d7e704 = var_21341c7142d7e704 + 1;
    }
    var_bed94c5e8ba6c57e = self function_644ed519cac9722b(1, 4);
    if (function_3f8c62126708afe6(var_bed94c5e8ba6c57e)) {
        var_fd52a3922167ea1[var_fd52a3922167ea1.size] = var_21341c7142d7e704;
        var_fd52a3922167ea1[var_fd52a3922167ea1.size] = var_bed94c5e8ba6c57e.lootid;
        var_21341c7142d7e704 = var_21341c7142d7e704 + 1;
    }
    var_8862c20cffb85370 = undefined;
    if (function_d1df77dc341aa4e5()) {
        var_8862c20cffb85370 = self function_644ed519cac9722b(65535, 0);
    } else {
        var_8862c20cffb85370 = self function_644ed519cac9722b(1, 5);
    }
    if (function_3f8c62126708afe6(var_8862c20cffb85370)) {
        var_fd52a3922167ea1[var_fd52a3922167ea1.size] = var_21341c7142d7e704;
        var_fd52a3922167ea1[var_fd52a3922167ea1.size] = var_8862c20cffb85370.lootid;
        var_21341c7142d7e704 = var_21341c7142d7e704 + 1;
    }
    for (var_65b695f0c0d909ed = 1; var_65b695f0c0d909ed <= 10; var_65b695f0c0d909ed++) {
        var_5dd11d67a8ffe194 = self function_644ed519cac9722b(2, var_65b695f0c0d909ed);
        if (function_3f8c62126708afe6(var_5dd11d67a8ffe194)) {
            var_fd52a3922167ea1[var_fd52a3922167ea1.size] = var_21341c7142d7e704;
            var_fd52a3922167ea1[var_fd52a3922167ea1.size] = var_5dd11d67a8ffe194.lootid;
            var_21341c7142d7e704 = var_21341c7142d7e704 + 1;
        }
    }
    self function_db073176839d77fb(var_a7a6077754bbc2f8, var_fd52a3922167ea1);
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2d4a
// Size: 0x1c2
function private function_e85d625960aadaaa(instance, var_6537d9855fb64bf9, var_fd52a3922167ea1) {
    if (!function_3f8c62126708afe6(instance)) {
        return [0:var_fd52a3922167ea1, 1:var_6537d9855fb64bf9];
    }
    var_904c82687ddfeb02 = instance.lootid;
    if (!getdvarint(@"hash_a79d3b965878a390", 0)) {
        baseweapon = function_1cc3fd00b6ccc3ba(instance.lootid);
        if (isdefined(baseweapon)) {
            var_7956cc8a3f6e983d = weapon::getweaponrootname(baseweapon);
            iteminfo = function_e4f08713dc9c53b3(var_7956cc8a3f6e983d);
            if (isdefined(iteminfo)) {
                var_904c82687ddfeb02 = iteminfo.itemid;
            }
        }
    }
    var_fd52a3922167ea1[var_fd52a3922167ea1.size] = var_6537d9855fb64bf9;
    var_fd52a3922167ea1[var_fd52a3922167ea1.size] = var_904c82687ddfeb02;
    var_6537d9855fb64bf9 = var_6537d9855fb64bf9 + 1;
    var_93b3002ebef628b = loot::function_793e8a72cedb8ef3(var_904c82687ddfeb02);
    rootname = weapon::getweaponrootname(var_93b3002ebef628b);
    assetname = weapon::function_72376783a92be46(rootname);
    attachments = function_6527364c1ecca6c6(assetname);
    foreach (attachment in attachments) {
        var_3b55819c1ebec007 = getscriptbundle(function_2ef675c13ca1c4af(%"hash_3c2c9813bb16552f", attachment));
        if (isdefined(var_3b55819c1ebec007)) {
            var_4f13b964ab82fe13 = var_3b55819c1ebec007.lootid;
        }
        if (!isdefined(var_4f13b964ab82fe13)) {
            continue;
        }
        var_fd52a3922167ea1[var_fd52a3922167ea1.size] = var_6537d9855fb64bf9;
        var_fd52a3922167ea1[var_fd52a3922167ea1.size] = var_4f13b964ab82fe13;
        var_6537d9855fb64bf9 = var_6537d9855fb64bf9 + 1;
    }
    return [0:var_fd52a3922167ea1, 1:var_6537d9855fb64bf9];
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2f14
// Size: 0x3f1
function private function_d2e72de8b468cffa() {
    if (!isdefined(self.var_42cd6df38ee20402)) {
        /#
            assertmsg("CommonInstanceInventoryERROR: A player entered the game without having their items considered for insured caching.");
        #/
        return;
    }
    var_92bb70c6e0e628c2 = [];
    var_de79dbea8c4f970e = self function_644ed519cac9722b(1, 0);
    if (function_3f8c62126708afe6(var_de79dbea8c4f970e)) {
        var_92bb70c6e0e628c2[var_92bb70c6e0e628c2.size] = var_de79dbea8c4f970e;
    }
    var_6585928b9413484e = self function_644ed519cac9722b(1, 1);
    if (function_3f8c62126708afe6(var_6585928b9413484e)) {
        var_92bb70c6e0e628c2[var_92bb70c6e0e628c2.size] = var_6585928b9413484e;
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
            if (!isdefined(var_b0bee880705ae6be.var_b34159f22f6379c9) || var_b0bee880705ae6be.var_b34159f22f6379c9 <= getsystemtime()) {
                var_963b1b6e92e4db70 = getdvarint(@"hash_40eb514e313dd3ef", 14400);
                if (getdvarint(@"hash_6dc2f0452c76707d", 1)) {
                    var_85166da84e55de25 = function_f6c6c8920a5333e7(15, var_a5a2044e2fff7d85, 1);
                    if (isdefined(var_85166da84e55de25)) {
                        switch (var_85166da84e55de25) {
                        case #"hash_31100fbc01bd387c":
                            var_963b1b6e92e4db70 = getdvarint(@"hash_618c3ca8c4897d2c", 7200);
                            break;
                        case #"hash_311012bc01bd3d35":
                            var_963b1b6e92e4db70 = getdvarint(@"hash_618c3fa8c48983c5", 14400);
                            break;
                        case #"hash_311011bc01bd3ba2":
                            var_963b1b6e92e4db70 = getdvarint(@"hash_618c3ea8c4898192", 21600);
                            break;
                        }
                    }
                }
                var_963b1b6e92e4db70 = getsystemtime() + var_963b1b6e92e4db70;
                self function_4e8d00b0ee5d3bbb(var_b0bee880705ae6be.var_fb5fdfafc29f4513, int(var_963b1b6e92e4db70));
            }
        } else if (var_4e321aa57754ccdb.var_207098e76bcac40f != 14) {
            self function_dd5661ebe3c9a5a2(var_4e321aa57754ccdb.var_fb5fdfafc29f4513);
            function_b1fcbec168284539(var_4e321aa57754ccdb.lootid, 14, var_4e321aa57754ccdb.location, var_4e321aa57754ccdb.var_fb6bafb61d5c3d4a, var_4e321aa57754ccdb.var_6cb812578f7d9ae7);
            var_e46e4713dc6a8b15 = self function_644ed519cac9722b(var_4e321aa57754ccdb.location, var_4e321aa57754ccdb.var_fb6bafb61d5c3d4a);
            if (isdefined(var_4e321aa57754ccdb.metadata) && function_3f8c62126708afe6(var_e46e4713dc6a8b15)) {
                var_aec4aa940dba4949 = function_2c7fe4b882b6d63e(var_4e321aa57754ccdb.metadata);
                self function_e70c1fc3c2e5e05f(var_e46e4713dc6a8b15.var_fb5fdfafc29f4513, 0, var_aec4aa940dba4949);
            }
            if (isdefined(var_4e321aa57754ccdb.var_d3c548c09bb62da2) && function_3f8c62126708afe6(var_e46e4713dc6a8b15)) {
                var_aec4aa940dba4949 = function_2c7fe4b882b6d63e(var_4e321aa57754ccdb.var_d3c548c09bb62da2);
                self function_e70c1fc3c2e5e05f(var_e46e4713dc6a8b15.var_fb5fdfafc29f4513, 1, var_aec4aa940dba4949);
            }
        }
    }
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x330c
// Size: 0x5ef
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
    var_787d331022c70035 = player function_644ed519cac9722b(1, 0);
    if (function_3f8c62126708afe6(var_787d331022c70035)) {
        var_536283c1339f8f41 = 1;
        var_12c0f53a71c9bcc8 = function_64ccc54bdbae5cf6(var_787d331022c70035.lootid);
        if (isdefined(var_12c0f53a71c9bcc8) && var_12c0f53a71c9bcc8 == 0) {
            var_9ec3e3e77fa5f56c = function_2b10ba6fb19dccd9(var_787d331022c70035.lootid);
            if (isdefined(var_9ec3e3e77fa5f56c)) {
                if (function_633f07e180b6ec8f(var_9ec3e3e77fa5f56c)) {
                    var_536283c1339f8f41 = 0;
                } else {
                    itembundle = getscriptbundle(var_9ec3e3e77fa5f56c);
                    if (isdefined(itembundle)) {
                        if (!isMapToMapInfil && !istrue(itembundle.var_8464122fb6575536)) {
                            /#
                                assertmsg("CommonInstanceInventoryERROR: Player [" + self.name + "] entered the game with the item [" + function_b4dd67b39cbb2f31(var_787d331022c70035.lootid) + "] which is not marked as extractable. Revoking that item's instance: [" + var_787d331022c70035.var_fb5fdfafc29f4513 + "].");
                            #/
                            var_536283c1339f8f41 = 0;
                        }
                    }
                }
            }
        }
        if (var_536283c1339f8f41) {
            var_85fb3582623df614 = player function_77046e6abbff19e5(var_787d331022c70035, var_12c0f53a71c9bcc8);
            struct.loadoutprimary = var_85fb3582623df614.weaponref;
            for (attachmentindex = 0; attachmentindex < 7; attachmentindex++) {
                struct.loadoutprimaryattachments[attachmentindex] = var_85fb3582623df614.var_31553e68a5164e3e[attachmentindex];
                struct.loadoutprimaryattachmentids[attachmentindex] = var_85fb3582623df614.var_f3464d71f01f614e[attachmentindex];
                var_c19231fe2990712e = var_85fb3582623df614.var_eae5a591e200672[attachmentindex];
                if (isdefined(var_c19231fe2990712e)) {
                    struct.var_193bf3cfb8aeaf0f[struct.loadoutprimaryattachments[attachmentindex]] = var_c19231fe2990712e;
                }
            }
            struct.loadoutprimarycamo = var_85fb3582623df614.weaponcamo;
            struct.loadoutprimaryreticle = var_85fb3582623df614.weaponreticle;
            struct.loadoutprimarylootitemid = var_85fb3582623df614.lootItemID;
            struct.loadoutprimaryvariantid = var_85fb3582623df614.var_9da910194dabeabe;
            struct.loadoutprimarycosmeticattachment = var_85fb3582623df614.var_67dfd35699ba2d3e;
            for (var_36d2abbdcbcb186c = 0; var_36d2abbdcbcb186c < 5; var_36d2abbdcbcb186c++) {
                struct.loadoutprimarystickers[var_36d2abbdcbcb186c] = var_85fb3582623df614.var_3a585b7543f910c5[var_36d2abbdcbcb186c];
            }
            if (isdefined(var_85fb3582623df614.var_eb30bdf1f971a3cd)) {
                struct.var_c4c1f56f0ddbeeff = var_85fb3582623df614.var_eb30bdf1f971a3cd;
            }
            player.var_c59a9ab288f6a9bf[0] = {var_cb06779b5d45f25f:function_2c7fe4b882b6d63e(var_787d331022c70035.var_d3c548c09bb62da2), secure:function_2c7fe4b882b6d63e(var_787d331022c70035.metadata)};
        }
    }
    var_787d331022c70035 = player function_644ed519cac9722b(1, 1);
    if (function_3f8c62126708afe6(var_787d331022c70035)) {
        var_828567794c1e4685 = 1;
        var_12c0f53a71c9bcc8 = function_64ccc54bdbae5cf6(var_787d331022c70035.lootid);
        if (isdefined(var_12c0f53a71c9bcc8) && var_12c0f53a71c9bcc8 == 0) {
            var_9ec3e3e77fa5f56c = function_2b10ba6fb19dccd9(var_787d331022c70035.lootid);
            if (isdefined(var_9ec3e3e77fa5f56c)) {
                if (function_633f07e180b6ec8f(var_9ec3e3e77fa5f56c)) {
                    var_536283c1339f8f41 = 0;
                } else {
                    itembundle = getscriptbundle(var_9ec3e3e77fa5f56c);
                    if (isdefined(itembundle)) {
                        if (!isMapToMapInfil && !istrue(itembundle.var_8464122fb6575536)) {
                            /#
                                assertmsg("CommonInstanceInventoryERROR: Player [" + self.name + "] entered the game with the item [" + function_b4dd67b39cbb2f31(var_787d331022c70035.lootid) + "] which is not marked as extractable. Revoking that item's instance: [" + var_787d331022c70035.var_fb5fdfafc29f4513 + "].");
                            #/
                            var_828567794c1e4685 = 0;
                        }
                    }
                }
            }
        }
        if (var_828567794c1e4685) {
            var_fc0fae08675e1054 = player function_77046e6abbff19e5(var_787d331022c70035, var_12c0f53a71c9bcc8);
            struct.loadoutsecondary = var_fc0fae08675e1054.weaponref;
            for (attachmentindex = 0; attachmentindex < 7; attachmentindex++) {
                struct.loadoutsecondaryattachments[attachmentindex] = var_fc0fae08675e1054.var_31553e68a5164e3e[attachmentindex];
                struct.loadoutsecondaryattachmentids[attachmentindex] = var_fc0fae08675e1054.var_f3464d71f01f614e[attachmentindex];
                var_c19231fe2990712e = var_fc0fae08675e1054.var_eae5a591e200672[attachmentindex];
                if (isdefined(var_c19231fe2990712e)) {
                    struct.var_ead3720e647f74a3[struct.loadoutsecondaryattachments[attachmentindex]] = var_c19231fe2990712e;
                }
            }
            struct.loadoutsecondarycamo = var_fc0fae08675e1054.weaponcamo;
            struct.loadoutsecondaryreticle = var_fc0fae08675e1054.weaponreticle;
            struct.loadoutsecondarylootitemid = var_fc0fae08675e1054.lootItemID;
            struct.loadoutsecondaryvariantid = var_fc0fae08675e1054.var_9da910194dabeabe;
            struct.loadoutsecondarycosmeticattachment = var_fc0fae08675e1054.var_67dfd35699ba2d3e;
            for (var_36d2abbdcbcb186c = 0; var_36d2abbdcbcb186c < 5; var_36d2abbdcbcb186c++) {
                struct.loadoutsecondarystickers[var_36d2abbdcbcb186c] = var_fc0fae08675e1054.var_3a585b7543f910c5[var_36d2abbdcbcb186c];
            }
            if (isdefined(var_fc0fae08675e1054.var_eb30bdf1f971a3cd)) {
                struct.var_f440bb0f08482d83 = var_fc0fae08675e1054.var_eb30bdf1f971a3cd;
            }
            player.var_c59a9ab288f6a9bf[1] = {var_cb06779b5d45f25f:function_2c7fe4b882b6d63e(var_787d331022c70035.var_d3c548c09bb62da2), secure:function_2c7fe4b882b6d63e(var_787d331022c70035.metadata)};
        }
    }
    function_18c12529b048abea(player, struct);
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3902
// Size: 0x2dd
function private function_18c12529b048abea(player, struct) {
    if (istrue(self.var_2fa22f24b82c4469)) {
        return;
    }
    var_787d331022c70035 = player function_644ed519cac9722b(1, 2);
    if (function_3f8c62126708afe6(var_787d331022c70035)) {
        var_9ec3e3e77fa5f56c = function_2b10ba6fb19dccd9(var_787d331022c70035.lootid);
        if (isdefined(var_9ec3e3e77fa5f56c) && !function_633f07e180b6ec8f(var_9ec3e3e77fa5f56c)) {
            itembundle = getscriptbundle(var_9ec3e3e77fa5f56c);
            if (isdefined(itembundle)) {
                struct.loadoutequipmentprimary = itembundle.ref;
                struct.var_b68e3a0a9c628d23 = function_64ccc54bdbae5cf6(var_787d331022c70035.lootid);
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
                    player.var_1c84eeaf9507fb4e[itembundle.ref] = var_787d331022c70035.lootid;
                }
            }
        }
    }
    var_787d331022c70035 = player function_644ed519cac9722b(1, 3);
    if (function_3f8c62126708afe6(var_787d331022c70035)) {
        var_9ec3e3e77fa5f56c = function_2b10ba6fb19dccd9(var_787d331022c70035.lootid);
        if (isdefined(var_9ec3e3e77fa5f56c) && !function_633f07e180b6ec8f(var_9ec3e3e77fa5f56c)) {
            itembundle = getscriptbundle(var_9ec3e3e77fa5f56c);
            if (isdefined(itembundle)) {
                struct.loadoutequipmentsecondary = itembundle.ref;
                struct.var_a1dfc5ce15795a3 = function_64ccc54bdbae5cf6(var_787d331022c70035.lootid);
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
                    player.var_1c84eeaf9507fb4e[itembundle.ref] = var_787d331022c70035.lootid;
                }
            }
        }
    }
    var_787d331022c70035 = player function_644ed519cac9722b(1, 4);
    if (function_3f8c62126708afe6(var_787d331022c70035)) {
        var_9ec3e3e77fa5f56c = function_2b10ba6fb19dccd9(var_787d331022c70035.lootid);
        if (isdefined(var_9ec3e3e77fa5f56c) && !function_633f07e180b6ec8f(var_9ec3e3e77fa5f56c)) {
            itembundle = getscriptbundle(var_9ec3e3e77fa5f56c);
            if (isdefined(itembundle)) {
                struct.loadoutfieldupgrade1 = itembundle.ref;
            }
        }
    }
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3be6
// Size: 0x7f2
function private function_77046e6abbff19e5(instance, var_12c0f53a71c9bcc8) {
    struct = spawnstruct();
    struct.var_31553e68a5164e3e = [];
    struct.var_f3464d71f01f614e = [];
    struct.var_eae5a591e200672 = [];
    struct.weaponcamo = "none";
    struct.weaponreticle = "none";
    struct.var_67dfd35699ba2d3e = "none";
    struct.var_3a585b7543f910c5 = [];
    var_60ce74182e7c83a7 = function_3475769c002400f7(instance.lootid);
    if (isdefined(var_12c0f53a71c9bcc8) && isdefined(var_60ce74182e7c83a7.var_cb325ddb4a764623)) {
        struct.lootItemID = instance.lootid;
        struct.weaponref = var_60ce74182e7c83a7.var_cb325ddb4a764623;
        struct.var_9da910194dabeabe = var_12c0f53a71c9bcc8;
    } else {
        itembundle = function_f4a303d532b044a7(instance.lootid);
        if (isdefined(itembundle)) {
            if (itembundle.type == "weapon") {
                struct.lootItemID = instance.lootid;
                struct.weaponref = itembundle.ref;
                struct.var_9da910194dabeabe = function_64ccc54bdbae5cf6(instance.lootid);
            } else {
                /#
                    assertmsg("CommonInstanceInventoryERROR: Expected an item of type [weapon] for a instance inventory loadout weapon sublocation," + " but the item with ID [" + instance.lootid + "] is of type [" + (isdefined(itembundle.type) ? itembundle.type : "undefined") + "].");
                #/
            }
        }
    }
    if (!isdefined(struct.lootItemID) || struct.lootItemID == 0) {
        struct.lootItemID = 0;
        struct.weaponref = "iw9_me_fists_mp";
        struct.var_9da910194dabeabe = 0;
        return struct;
    }
    rootname = getweaponrootname(struct.weaponref);
    var_c7bd95b10c89cff8 = weaponassetnamemap(rootname, struct.var_9da910194dabeabe);
    if (isdefined(instance.var_6cb812578f7d9ae7)) {
        var_ae326d1d2b95b12c = int(isdefined(function_f6c6c8920a5333e7(13, instance, 1)) ? 0 : function_f6c6c8920a5333e7(13, instance, 1));
        var_e26e310b5f042288 = 0;
        while (var_e26e310b5f042288 < 22) {
            var_99b9b0b10959580e = instance.var_6cb812578f7d9ae7[var_e26e310b5f042288];
            if (var_99b9b0b10959580e == 0) {
                goto LOC_0000073b;
            }
            var_c53056bdc968817b = loot::function_282cf83c9eeda744(var_99b9b0b10959580e);
            if (!isdefined(var_c53056bdc968817b)) {
                goto LOC_0000073b;
            }
            var_d2682c57da143e9c = loot::function_793e8a72cedb8ef3(var_99b9b0b10959580e);
            if (!isdefined(var_d2682c57da143e9c)) {
                /#
                    assertmsg("CommonInstanceInventoryERROR: Failed to find a ref for " + var_c53056bdc968817b + " lootID [" + var_99b9b0b10959580e + "] when parsing the subcomponents of weapon instance [" + instance.var_fb5fdfafc29f4513 + "].");
                #/
            } else {
                switch (var_c53056bdc968817b) {
                case #"hash_4a01666eb6c388c8":
                    attachmentref = loot::function_2f80e9272a2074d(var_99b9b0b10959580e, var_c7bd95b10c89cff8);
                    if (!isdefined(attachmentref)) {
                        /#
                            assertmsg("CommonInstanceInventoryERROR: Failed to find a ref for attachment lootID [" + var_99b9b0b10959580e + "] on the weapon [" + var_c7bd95b10c89cff8 + "] when parsing the subcomponents of weapon instance [" + instance.var_fb5fdfafc29f4513 + "].");
                        #/
                        break;
                    }
                    var_1cb4c40a8480a13c = weapon::function_a622d54bb517923a(attachmentref, [0:#"lootid"]);
                    if (!isdefined(var_1cb4c40a8480a13c)) {
                        /#
                            assertmsg("CommonInstanceInventoryERROR: Failed to find an attachment data bundle for ref [" + attachmentref + "] when parsing the subcomponents of weapon instance [" + instance.var_fb5fdfafc29f4513 + "].");
                        #/
                        break;
                    }
                    attachmentslot = function_4add228b999c26aa(var_c7bd95b10c89cff8, attachmentref);
                    if (attachmentslot == "") {
                        /#
                            assertmsg("CommonInstanceInventoryERROR: Failed to find the attachment [" + attachmentref + "] on the weapon [" + var_c7bd95b10c89cff8 + "] when parsing the subcomponents of weapon instance [" + instance.var_fb5fdfafc29f4513 + "].");
                        #/
                        break;
                    }
                    if (struct.var_31553e68a5164e3e.size >= 7) {
                        /#
                            assertmsg("CommonInstanceInventoryERROR: Subcomponents of weapon instance [" + instance.var_fb5fdfafc29f4513 + "] contained more than MAX_PRIMARY_ATTACHMENTS attachments.");
                        #/
                        break;
                    }
                    struct.var_31553e68a5164e3e[struct.var_31553e68a5164e3e.size] = attachmentref;
                    struct.var_f3464d71f01f614e[struct.var_f3464d71f01f614e.size] = function_15abe90be101ffc8(var_c7bd95b10c89cff8, attachmentref, var_99b9b0b10959580e);
                    break;
                case #"hash_a12afa2995fb2059":
                    if (struct.weaponcamo != "none") {
                        /#
                            assertmsg("CommonInstanceInventoryERROR: Subcomponents of weapon instance [" + instance.var_fb5fdfafc29f4513 + "] contained more than one camo.");
                        #/
                        break;
                    }
                    var_a3f7381340cf06d9 = function_50f8a8f765bad85e(function_2ef675c13ca1c4af(%"hash_1345cc24140e89b8", var_d2682c57da143e9c), [0:#"ref"]);
                    if (!isdefined(var_a3f7381340cf06d9) || !isdefined(var_a3f7381340cf06d9.ref)) {
                        /#
                            assertmsg("CommonInstanceInventoryERROR: Failed to find a ref for camo lootID [" + var_99b9b0b10959580e + "] when parsing the subcomponents of weapon instance [" + instance.var_fb5fdfafc29f4513 + "].");
                        #/
                        break;
                    }
                    struct.weaponcamo = var_a3f7381340cf06d9.ref;
                    break;
                case #"hash_3945637d52ccf689":
                case #"hash_aca593b48f7018c2":
                    if (struct.var_67dfd35699ba2d3e != "none") {
                        /#
                            assertmsg("CommonInstanceInventoryERROR: Subcomponents of weapon instance [" + instance.var_fb5fdfafc29f4513 + "] contained more than one cosmetic.");
                        #/
                        break;
                    }
                    struct.var_67dfd35699ba2d3e = var_d2682c57da143e9c;
                    break;
                case #"hash_4b155f83e05788f7":
                    if (struct.weaponreticle != "none") {
                        /#
                            assertmsg("CommonInstanceInventoryERROR: Subcomponents of weapon instance [" + instance.var_fb5fdfafc29f4513 + "] contained more than one reticle.");
                        #/
                    }
                    struct.weaponreticle = var_d2682c57da143e9c;
                    break;
                case #"hash_249ba0b9f7d065fc":
                    if (struct.var_3a585b7543f910c5.size >= 5) {
                        /#
                            assertmsg("CommonInstanceInventoryERROR: Subcomponents of weapon instance [" + instance.var_fb5fdfafc29f4513 + "] contained more than MAX_STICKERS stickers.");
                        #/
                        break;
                    }
                    while (!(var_ae326d1d2b95b12c & 1 << struct.var_3a585b7543f910c5.size) && struct.var_3a585b7543f910c5.size < 5) {
                        struct.var_3a585b7543f910c5[struct.var_3a585b7543f910c5.size] = "none";
                    }
                    struct.var_3a585b7543f910c5[struct.var_3a585b7543f910c5.size] = var_d2682c57da143e9c;
                    break;
                default:
                    /#
                        assertmsg("CommonInstanceInventoryERROR: Unhandled lootID category [" + var_c53056bdc968817b + "] when parsing the subcomponents of a weapon instance [" + instance.var_fb5fdfafc29f4513 + "].");
                    #/
                    break;
                }
            LOC_0000073b:
            }
        LOC_0000073b:
            var_e26e310b5f042288 = var_e26e310b5f042288 + 1;
        }
    }
    if (isdefined(instance.var_d3c548c09bb62da2)) {
        for (i = 2; i <= 6; i++) {
            value = function_f6c6c8920a5333e7(i, instance, 1);
            if (isdefined(value) && int(value) != 0) {
                value = int(value);
                valuex = value & 255;
                valuey = value >> 8;
                struct.var_eae5a591e200672[i - 2] = [0:function_f76ff66a6601d9c9(valuex), 1:function_f76ff66a6601d9c9(valuey)];
            }
        }
        value = function_f6c6c8920a5333e7(7, instance, 1);
        if (isdefined(value) && int(value) != 0) {
            struct.var_eb30bdf1f971a3cd = int(value);
        }
    }
    return struct;
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x43e0
// Size: 0x9a
function private function_15abe90be101ffc8(var_c7bd95b10c89cff8, attachment, var_d7305e20a538a9a1) {
    blueprints = function_4527f44d851c9afd(var_c7bd95b10c89cff8, attachment);
    foreach (variantindex, attachmentdata in blueprints) {
        var_4f13b964ab82fe13 = attachmentdata.lootid;
        if (isdefined(var_4f13b964ab82fe13) && var_d7305e20a538a9a1 == var_4f13b964ab82fe13) {
            return variantindex;
        }
    }
    return 0;
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4482
// Size: 0x87
function private function_1c6803f36c2ea0a6(var_c7bd95b10c89cff8, attachment, variantid) {
    blueprints = function_4527f44d851c9afd(var_c7bd95b10c89cff8, attachment);
    foreach (variantindex, attachmentdata in blueprints) {
        if (variantindex == variantid) {
            return attachmentdata.lootid;
        }
    }
    return undefined;
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4511
// Size: 0xf7
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
    var_d3d292d1c22c4da6 = namespace_38b993c4618e76cd::function_a50b607d2500dda5(player.loadoutequipmentprimary);
    if (isdefined(var_d3d292d1c22c4da6) && var_d3d292d1c22c4da6 != 0) {
        player function_4f1027e74d5073c4(var_d3d292d1c22c4da6, 13, 1, 2, []);
    }
    var_351274b426e46e37 = namespace_38b993c4618e76cd::function_a50b607d2500dda5(player.loadoutequipmentsecondary);
    if (isdefined(var_351274b426e46e37) && var_351274b426e46e37 != 0) {
        player function_4f1027e74d5073c4(var_351274b426e46e37, 13, 1, 3, []);
    }
    player setplayerdata(level.var_5d69837cf4db0407, "enableDefaultDMZLoadouts", 0);
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x460f
// Size: 0x51
function function_d1df77dc341aa4e5() {
    if (!isdefined(level.var_fb27023dc5eaa1c0)) {
        var_f1da87c2ea603754 = function_90b5b6e99aef29d6();
        level.var_fb27023dc5eaa1c0 = isdefined(var_f1da87c2ea603754.var_bd6d1a66d695958f) ? 1 : var_f1da87c2ea603754.var_bd6d1a66d695958f;
    }
    return level.var_fb27023dc5eaa1c0;
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4668
// Size: 0x39
function private function_25c00f7dd055c100(player) {
    var_2b33b070c1f877e6 = self function_644ed519cac9722b(65535, 6);
    if (function_3f8c62126708afe6(var_2b33b070c1f877e6)) {
        return var_2b33b070c1f877e6.lootid;
    }
    return 0;
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x46a9
// Size: 0x5c
function private function_5c97e8ce13fa6a89(player) {
    var_2b33b070c1f877e6 = self function_644ed519cac9722b(65535, 6);
    if (function_3f8c62126708afe6(var_2b33b070c1f877e6)) {
        if (isdefined(var_2b33b070c1f877e6.var_6cb812578f7d9ae7) && isdefined(var_2b33b070c1f877e6.var_6cb812578f7d9ae7[0])) {
            return var_2b33b070c1f877e6.var_6cb812578f7d9ae7[0];
        }
    }
    return 0;
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x470d
// Size: 0x5e
function private function_6e550258f79b1ef0(player) {
    var_2b33b070c1f877e6 = self function_644ed519cac9722b(65535, 6);
    if (function_3f8c62126708afe6(var_2b33b070c1f877e6)) {
        if (isdefined(var_2b33b070c1f877e6.var_6cb812578f7d9ae7) && isdefined(var_2b33b070c1f877e6.var_6cb812578f7d9ae7[1])) {
            return var_2b33b070c1f877e6.var_6cb812578f7d9ae7[1];
        }
    }
    return 0;
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4773
// Size: 0x1a7
function private function_e8e46cba4fcc05f7(player, var_5c6aca696200f252) {
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
            break;
        }
    } else if (gametype == "ob") {
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
            break;
        }
    } else {
        return 0;
    }
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4921
// Size: 0xf6
function private function_f6c6c8920a5333e7(key, instance, var_469244507bbe1b12, var_7f24f2a49f4715f7) {
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
                return [0:data.value, 1:data.var_64c2ffaa2c43ce24, 2:data.var_355199fd29c935e];
            } else {
                return data.value;
            }
        }
    }
    return undefined;
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4a1f
// Size: 0x285
function private function_8715433c6e64940b(keys, values, instance, var_469244507bbe1b12) {
    if (!isdefined(keys) || !isdefined(values) || !isdefined(instance)) {
        /#
            /#
                assertex(isdefined(keys), "<unknown string>");
            #/
            /#
                assertex(isdefined(values), "<unknown string>");
            #/
            /#
                assertex(isdefined(instance), "<unknown string>");
            #/
        #/
        return;
    }
    if (!isarray(keys)) {
        keys = [0:keys];
    }
    if (!isarray(values)) {
        values = [0:values];
    }
    /#
        /#
            assertex(keys.size == values.size, "<unknown string>");
        #/
    #/
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
    foreach (var_12c0d74b848d3c14, key in keys) {
        var_84637205791e95dd = 0;
        foreach (index, kvp in var_5170a7c15b09f348) {
            if (key == kvp[0]) {
                var_5170a7c15b09f348[index][1] = values[var_12c0d74b848d3c14];
                var_84637205791e95dd = 1;
                break;
            }
        }
        if (!var_84637205791e95dd) {
            var_cd7e1619a7043999 = var_5170a7c15b09f348.size;
            var_5170a7c15b09f348[var_cd7e1619a7043999] = [];
            var_5170a7c15b09f348[var_cd7e1619a7043999][0] = key;
            var_5170a7c15b09f348[var_cd7e1619a7043999][1] = values[var_12c0d74b848d3c14];
        }
    }
    self function_e70c1fc3c2e5e05f(instance.var_fb5fdfafc29f4513, var_aa532d60c3f3d00c, var_5170a7c15b09f348);
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4cab
// Size: 0x98
function private function_2c7fe4b882b6d63e(var_eda1e1681182223b) {
    var_61395e7c9194e412 = [];
    foreach (data in var_eda1e1681182223b) {
        offset = var_61395e7c9194e412.size;
        var_61395e7c9194e412[offset] = [];
        var_61395e7c9194e412[offset][0] = data.key;
        var_61395e7c9194e412[offset][1] = int(data.value);
    }
    return var_61395e7c9194e412;
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4d4b
// Size: 0x78
function private function_ab4ddb325aae30a5(var_207098e76bcac40f, location, var_fb6bafb61d5c3d4a, weaponobj) {
    lootid = weapon::function_79d6e6c22245687a(weapon::getweaponrootname(weaponobj), isdefined(weaponobj.variantid) ? 0 : weaponobj.variantid);
    var_282ed072c12d4d4d = function_dec054b294d48a5c(weaponobj);
    self function_4f1027e74d5073c4(lootid, var_207098e76bcac40f, location, var_fb6bafb61d5c3d4a, var_282ed072c12d4d4d);
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4dca
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

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4f64
// Size: 0x146
function private function_c9de41def051c9fc(params) {
    if (isdefined(params.item) && isdefined(params.item.var_c59a9ab288f6a9bf)) {
        if (params.var_a64e5e1ee95c7b96) {
            weaponobj = function_2aeaf88105d3b617(2);
            if (isdefined(weaponobj) && issameweapon(weaponobj, params.item.weaponobj, 1)) {
                self.var_c59a9ab288f6a9bf[2] = params.item.var_c59a9ab288f6a9bf;
                return;
            }
        } else {
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
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x50b1
// Size: 0x18
function private function_dd9df8b3dd285733() {
    function_7912e187e23451eb();
    function_eb3f359f9bd87c16();
    function_a38bb104e7769055();
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x50d0
// Size: 0x63
function private function_7912e187e23451eb() {
    var_997ca5393ca50d80 = 0;
    while (var_997ca5393ca50d80 < 13) {
        if (var_997ca5393ca50d80 == 4) {
            goto LOC_00000031;
        }
        function_5a62e05c264fbe50(1, var_997ca5393ca50d80);
    LOC_00000031:
        var_997ca5393ca50d80 = var_997ca5393ca50d80 + 1;
    }
    if (function_d1df77dc341aa4e5()) {
        var_5c6aca696200f252 = 0;
        while (var_5c6aca696200f252 < 6) {
            function_5a62e05c264fbe50(65535, var_5c6aca696200f252);
            var_5c6aca696200f252 = var_5c6aca696200f252 + 1;
        }
    }
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x513a
// Size: 0x29
function private function_eb3f359f9bd87c16() {
    for (var_65b695f0c0d909ed = 0; var_65b695f0c0d909ed < 10; var_65b695f0c0d909ed++) {
        function_5a62e05c264fbe50(2, 1 + var_65b695f0c0d909ed);
    }
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x516a
// Size: 0x18
function private function_a38bb104e7769055() {
    function_5a62e05c264fbe50(9, 0);
    function_5a62e05c264fbe50(9, 1);
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5189
// Size: 0x43
function private function_5a62e05c264fbe50(location, var_fb6bafb61d5c3d4a) {
    instance = self function_644ed519cac9722b(location, var_fb6bafb61d5c3d4a);
    if (function_3f8c62126708afe6(instance)) {
        self function_dd5661ebe3c9a5a2(instance.var_fb5fdfafc29f4513);
    }
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x51d3
// Size: 0x38
function private function_b1fcbec168284539(lootid, var_207098e76bcac40f, location, var_fb6bafb61d5c3d4a, components) {
    self function_4f1027e74d5073c4(lootid, var_207098e76bcac40f, location, var_fb6bafb61d5c3d4a, components);
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5212
// Size: 0x1c
function private function_31e22109050ae853() {
    return {lootid:0, var_fb5fdfafc29f4513:"0"};
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5236
// Size: 0x34
function private function_3f8c62126708afe6(instance) {
    return isdefined(instance) && instance.var_fb5fdfafc29f4513 != "0" && instance.lootid != 0;
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5272
// Size: 0xcc
function private function_1e863c336474bb99(var_787d331022c70035) {
    if (isdefined(var_787d331022c70035) && isdefined(var_787d331022c70035.var_d3c548c09bb62da2)) {
        if (var_787d331022c70035.var_207098e76bcac40f == 17) {
            /#
                /#
                    assertmsg("<unknown string>");
                #/
            #/
            return function_31e22109050ae853();
        }
        foreach (metadata in var_787d331022c70035.var_d3c548c09bb62da2) {
            if (metadata.key == 15) {
                return self function_644ed519cac9722b(5, int(metadata.value) - 1);
            }
        }
    }
    return function_31e22109050ae853();
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5346
// Size: 0xc9
function private function_c37d02edd52c6892(var_787d331022c70035) {
    if (isdefined(var_787d331022c70035) && isdefined(var_787d331022c70035.var_d3c548c09bb62da2)) {
        if (var_787d331022c70035.var_207098e76bcac40f != 17) {
            /#
                assertmsg("CommonInstanceInventoryERROR: InstanceInventory_GetInsuredInstanceForSchematic() called on an instance that does not have the CONST_INVENTORY_KIND_SCHEMATIC kind.");
            #/
            return function_31e22109050ae853();
        }
        foreach (metadata in var_787d331022c70035.var_d3c548c09bb62da2) {
            if (metadata.key == 15) {
                return self function_644ed519cac9722b(6, int(metadata.value) - 1);
            }
        }
    }
    return function_31e22109050ae853();
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x5417
// Size: 0x3c
function private function_f1cc6a55aace03aa(var_787d331022c70035) {
    if (!function_3f8c62126708afe6(var_787d331022c70035)) {
        return undefined;
    }
    itembundle = function_f4a303d532b044a7(var_787d331022c70035.lootid);
    if (!isdefined(itembundle)) {
        return undefined;
    }
    return itembundle;
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x545b
// Size: 0x115
function function_7cce337c4902cbb6(var_2bee281754374f2f) {
    if (!isdefined(self.var_c59a9ab288f6a9bf)) {
        self.var_c59a9ab288f6a9bf = [];
    }
    var_96c4059aa2eabfb8 = self.var_c59a9ab288f6a9bf[var_2bee281754374f2f];
    if (isdefined(var_96c4059aa2eabfb8)) {
        var_b474ce3041e2eb66 = 0;
        foreach (data in var_96c4059aa2eabfb8.secure) {
            if (data[0] == 1) {
                if (data[1] == self.var_87f0698dc7ac0a09) {
                    var_b474ce3041e2eb66 = 1;
                }
                break;
            }
        }
        if (var_b474ce3041e2eb66) {
            foreach (data in var_96c4059aa2eabfb8.var_cb06779b5d45f25f) {
                if (data[0] == 15) {
                    return data[1];
                }
            }
        }
    }
    return undefined;
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5578
// Size: 0x8e
function function_874d25a7167d2051(location, var_fb6bafb61d5c3d4a, var_44ec843fbcba0013) {
    instance = self function_644ed519cac9722b(location, var_fb6bafb61d5c3d4a);
    if (!function_3f8c62126708afe6(instance)) {
        return;
    }
    var_79bf9868c4b11727 = isdefined(instance.var_b34159f22f6379c9) ? 0 : instance.var_b34159f22f6379c9;
    if (var_79bf9868c4b11727 <= getsystemtime()) {
        return;
    }
    self function_4e8d00b0ee5d3bbb(instance.var_fb5fdfafc29f4513, int(max(var_79bf9868c4b11727 - var_44ec843fbcba0013, 0)));
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x560d
// Size: 0x32
function private function_9488239f459b656d() {
    if (!isdefined(level.var_aeafecbe7219387e)) {
        level.var_aeafecbe7219387e = getdvarint(@"hash_9f2df0e295940dc4", 0);
    }
    return istrue(level.var_aeafecbe7219387e);
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5647
// Size: 0x45
function private function_3bb8b73991355a1(var_7c870fc702057b7b) {
    if (!isplayer(self)) {
        /#
            assertmsg("Calling InstanceInventory_IsOBFeatureUnlocked on object that is not a player");
        #/
        return 0;
    }
    if (function_9488239f459b656d()) {
        return 1;
    }
    if (!function_a6172e49f7313fd8()) {
        return 0;
    }
    return function_1291b99db1d57936(var_7c870fc702057b7b) > 0;
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5694
// Size: 0x2a
function private function_1291b99db1d57936(var_7c870fc702057b7b) {
    if (function_9488239f459b656d()) {
        return 1;
    }
    if (!function_a6172e49f7313fd8()) {
        return 0;
    }
    return self function_bcefd279b6133b74(var_7c870fc702057b7b);
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56c6
// Size: 0x2c7
function function_dec054b294d48a5c(weaponobj) {
    var_49e6ef3edadd524e = weapon::getweaponrootname(weaponobj);
    var_282ed072c12d4d4d = [];
    if (isdefined(weaponobj.attachments)) {
        foreach (attachment in weaponobj.attachments) {
            if (weapon::attachmentiscosmetic(attachment)) {
                var_282ed072c12d4d4d[var_282ed072c12d4d4d.size] = loot::function_a50b607d2500dda5(attachment);
            } else if (utility::function_f3bb4f4911a1beb2("weapons", "attachmentIsSelectable", weaponobj, attachment)) {
                if (isdefined(weaponobj.attachmentvarindices) && isdefined(weaponobj.attachmentvarindices[attachment])) {
                    var_4f13b964ab82fe13 = function_1c6803f36c2ea0a6(weaponobj.basename, attachment, weaponobj.attachmentvarindices[attachment]);
                    if (!isdefined(var_4f13b964ab82fe13)) {
                        var_4f13b964ab82fe13 = weapon::function_693e108cb61ceeb5(var_49e6ef3edadd524e, attachment);
                    }
                    var_282ed072c12d4d4d[var_282ed072c12d4d4d.size] = var_4f13b964ab82fe13;
                } else {
                    var_282ed072c12d4d4d[var_282ed072c12d4d4d.size] = weapon::function_693e108cb61ceeb5(var_49e6ef3edadd524e, attachment);
                }
            }
        }
    }
    if (isdefined(weaponobj.camo)) {
        var_282ed072c12d4d4d[var_282ed072c12d4d4d.size] = loot::function_a50b607d2500dda5(weaponobj.camo);
    }
    if (isdefined(weaponobj.reticle)) {
        var_282ed072c12d4d4d[var_282ed072c12d4d4d.size] = loot::function_a50b607d2500dda5(weaponobj.reticle);
    }
    if (isdefined(weaponobj.stickerslot0) && weaponobj.stickerslot0 != "none") {
        var_282ed072c12d4d4d[var_282ed072c12d4d4d.size] = loot::function_a50b607d2500dda5(function_2e84a570d6af300a(weaponobj.stickerslot0, "i/"));
    }
    if (isdefined(weaponobj.stickerslot1) && weaponobj.stickerslot1 != "none") {
        var_282ed072c12d4d4d[var_282ed072c12d4d4d.size] = loot::function_a50b607d2500dda5(function_2e84a570d6af300a(weaponobj.stickerslot1, "i/"));
    }
    if (isdefined(weaponobj.stickerslot2) && weaponobj.stickerslot2 != "none") {
        var_282ed072c12d4d4d[var_282ed072c12d4d4d.size] = loot::function_a50b607d2500dda5(function_2e84a570d6af300a(weaponobj.stickerslot2, "i/"));
    }
    if (isdefined(weaponobj.stickerslot3) && weaponobj.stickerslot3 != "none") {
        var_282ed072c12d4d4d[var_282ed072c12d4d4d.size] = loot::function_a50b607d2500dda5(function_2e84a570d6af300a(weaponobj.stickerslot3, "i/"));
    }
    if (isdefined(weaponobj.var_b39ac546cc8621f8) && weaponobj.var_b39ac546cc8621f8 != "none") {
        var_282ed072c12d4d4d[var_282ed072c12d4d4d.size] = loot::function_a50b607d2500dda5(function_2e84a570d6af300a(weaponobj.var_b39ac546cc8621f8, "i/"));
    }
    return var_282ed072c12d4d4d;
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x5995
// Size: 0x2f
function private function_85f5c72ab2951d3b() {
    /#
        function_6e7290c8ee4f558b("<unknown string>");
        function_a9a864379a098ad6("<unknown string>", "<unknown string>", &function_b34a4271751db584);
        function_fe953f000498048f();
    #/
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x59cb
// Size: 0x79
function function_b34a4271751db584() {
    /#
        foreach (player in level.players) {
            player.var_84d661ff601a2f9f = 0;
            player function_6aa0d0467dfd4624(1);
            player function_80c587026fbc6e0d();
            player function_78ec884c707a6adc();
        }
    #/
}

// Namespace namespace_9571f642f38c8169/namespace_510e82113265fae9
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5a4b
// Size: 0x1b8
function function_221fabd6ffdb8013(instance, player, context) {
    /#
        if (getdvarint(@"hash_613933303e1174d5", 0) == 0) {
            return;
        }
        println("<unknown string>" + instance.var_fb5fdfafc29f4513 + "<unknown string>");
        if (isdefined(player)) {
            println("<unknown string>" + player.name);
        }
        if (isdefined(context)) {
            println("<unknown string>" + context);
        }
        if (isdefined(instance.metadata)) {
            println("<unknown string>");
            foreach (data in instance.metadata) {
                println("<unknown string>" + data.key + "<unknown string>" + data.value);
            }
        }
        if (isdefined(instance.var_d3c548c09bb62da2)) {
            println("<unknown string>");
            foreach (data in instance.var_d3c548c09bb62da2) {
                println("<unknown string>" + data.key + "<unknown string>" + data.value);
            }
        }
        println("<unknown string>" + instance.var_fb5fdfafc29f4513 + "<unknown string>");
    #/
}

