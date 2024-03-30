// mwiii decomp prototype
#using scripts\common\callbacks.gsc;
#using scripts\common\devgui.gsc;
#using script_5032ed8da1128621;
#using script_16ea1b94f0f381b3;
#using scripts\common\values.gsc;
#using scripts\engine\utility.gsc;
#using script_7b2517368c79e5bc;
#using script_cbdac3b4a48bb8f;
#using script_3e2f8cc477d57433;
#using script_485622d93fa7e4cf;
#using script_64316dc775e91122;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\weapons.gsc;
#using script_6bffae1b97f70547;

#namespace namespace_736197e4d378b91b;

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e1
// Size: 0x139
function function_cbd6a7a14d9bb07b() {
    function_900f562c61c6a5d6("weapon", &function_a8315d7427925f00, &function_70024d27cb2942f5, &function_b9257704034d2b80, &function_61f99d560d896d24, &function_d5143d7900e7160a);
    function_5958815b72ad58a0("weapon", #"hash_c94d2b323951a101", &function_f4e4fc18f92ec23b);
    /#
        function_5958815b72ad58a0("bought", #"hash_3483a973fd1fe5b8", &function_cb5a17997d502c15);
    #/
    function_5958815b72ad58a0("weapon", #"hash_79cd484b40e882b", &function_b5be5fff64626153);
    level callback::add("player_connect", &function_88d309900aaee871);
    level callback::add("player_spawned", &function_94cbe3c6bcb49cb1);
    level callback::add("player_weapon_change", &function_9942fa0e68e83f4c);
    utility::registersharedfunc("zombie", "GetPlayerWeaponRarity", &function_75e73212bbe447d9);
    level.commonitem.var_37d10554e6936847 = [];
    level.commonitem.var_b8ba13385a2bb5 = strtok(getdvar(@"hash_56243d40ec08cee4", ""), ",");
    level.commonitem.var_feea62f594ad9284 = getdvarint(@"hash_ac1ee90233495500", 0);
    /#
        thread function_95cd4c99989f7140();
    #/
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa21
// Size: 0x16
function private function_88d309900aaee871(params) {
    self.var_dd3d589a27a0b26 = [];
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa3e
// Size: 0x2e1
function private function_94cbe3c6bcb49cb1(params) {
    if (namespace_2b1145f62aa835b8::function_61575e37b9200c0d() && isdefined(self.revivecount)) {
        reviveweapons = self.primaryweapons;
        var_958c14c8fe2b530b = [];
        foreach (weapon in reviveweapons) {
            if (!isundefinedweapon(weapon)) {
                ammostruct = spawnstruct();
                ammostruct.clipammo = self getweaponammoclip(weapon);
                ammostruct.stockammo = self getweaponammostock(weapon);
                if (weapon.hasalternate) {
                    altweapon = weapon getaltweapon();
                    ammostruct.altclipammo = self getweaponammoclip(altweapon);
                    ammostruct.altstockammo = self getweaponammostock(altweapon);
                }
                var_958c14c8fe2b530b[var_958c14c8fe2b530b.size] = ammostruct;
                inventory_utility::_takeweapon(weapon);
            }
        }
        maxindex = 0;
        var_cd77ac1b769e9c52 = 0;
        var_be1684f3e95e1024 = [];
        var_e9bd5ef4af54882a = [];
        for (reviveweaponindex = 0; reviveweaponindex < reviveweapons.size; reviveweaponindex = reviveweaponindex + 1) {
            for (var_5db61256ca3c39bd = 0; var_5db61256ca3c39bd < self.var_dd3d589a27a0b26.size; var_5db61256ca3c39bd = var_5db61256ca3c39bd + 1) {
                if (reviveweapons[reviveweaponindex].basename == self.var_dd3d589a27a0b26[var_5db61256ca3c39bd].baseweapon) {
                    var_be1684f3e95e1024[var_5db61256ca3c39bd] = reviveweapons[reviveweaponindex];
                    var_e9bd5ef4af54882a[var_5db61256ca3c39bd] = var_958c14c8fe2b530b[reviveweaponindex];
                    if (var_5db61256ca3c39bd > maxindex) {
                        maxindex = var_5db61256ca3c39bd;
                    }
                    if (reviveweaponindex == 0) {
                        var_cd77ac1b769e9c52 = var_5db61256ca3c39bd;
                    }
                    break;
                }
            }
        }
        for (i = 0; i <= maxindex; i = i + 1) {
            weapon = var_be1684f3e95e1024[i];
            ammostruct = var_e9bd5ef4af54882a[i];
            if (isundefinedweapon(weapon)) {
                inventory_utility::_giveweapon(makeweapon("iw9_me_fists_mp"), undefined, undefined, 1);
                continue;
            }
            inventory_utility::_giveweapon(weapon, undefined, undefined, 1);
            self setweaponammoclip(weapon, ammostruct.clipammo);
            self setweaponammostock(weapon, ammostruct.stockammo);
            if (weapon.hasalternate) {
                altweapon = weapon getaltweapon();
                self setweaponammoclip(altweapon, ammostruct.altclipammo);
                self setweaponammostock(altweapon, ammostruct.altstockammo);
            }
        }
        var_cd77ac1b769e9c52 = var_cd77ac1b769e9c52 >= self.primaryweapons.size ? self.primaryweapons.size - 1 : var_cd77ac1b769e9c52;
        inventory_utility::_switchtoweapon(self.primaryweapons[var_cd77ac1b769e9c52]);
        self setspawnweapon(self.primaryweapons[var_cd77ac1b769e9c52]);
    }
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd26
// Size: 0x13
function private function_9942fa0e68e83f4c(params) {
    function_dcc83e7e97a52bf4();
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd40
// Size: 0x146
function private function_dcc83e7e97a52bf4(weapon) {
    if (function_fe8f110892c02b38("ui_primary_weapon_rarity")) {
        primaryweaponobj = function_2aeaf88105d3b617(0);
        if (isdefined(primaryweaponobj)) {
            primaryweaponrarity = function_75e73212bbe447d9(primaryweaponobj);
            self setclientomnvar("ui_primary_weapon_rarity", primaryweaponrarity);
        } else {
            self setclientomnvar("ui_primary_weapon_rarity", 0);
        }
    }
    if (function_fe8f110892c02b38("ui_secondary_weapon_rarity")) {
        secondaryweaponobj = function_2aeaf88105d3b617(1);
        if (isdefined(secondaryweaponobj)) {
            secondaryweaponrarity = function_75e73212bbe447d9(secondaryweaponobj);
            self setclientomnvar("ui_secondary_weapon_rarity", secondaryweaponrarity);
        } else {
            self setclientomnvar("ui_secondary_weapon_rarity", 0);
        }
    }
    if (function_fe8f110892c02b38("ui_current_weapon_tier")) {
        weapon = isdefined(weapon) ? weapon : self getcurrentweapon();
        if (isnullweapon(weapon) || weapon.basename == "iw9_me_fists_mp" || weapon.basename == "iw8_gunless") {
            self setclientomnvar("ui_current_weapon_tier", 0);
            return;
        }
        n_rarity = function_75e73212bbe447d9(weapon);
        if (isdefined(n_rarity)) {
            self setclientomnvar("ui_current_weapon_tier", n_rarity);
            return;
        }
        self setclientomnvar("ui_current_weapon_tier", 0);
    }
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe8d
// Size: 0xd1
function function_f4e4fc18f92ec23b(lootid) {
    blueprintindex = function_64ccc54bdbae5cf6(lootid);
    if (isdefined(blueprintindex) && blueprintindex != 0) {
        baseweapon = function_1cc3fd00b6ccc3ba(lootid);
        if (isdefined(baseweapon)) {
            if (isdefined(level.commonitem.var_37d10554e6936847[baseweapon]) && isdefined(level.commonitem.var_37d10554e6936847[baseweapon].bundles[blueprintindex])) {
                return level.commonitem.var_37d10554e6936847[baseweapon].bundles[blueprintindex][0];
            } else if (weaponinventorytype(baseweapon) == "offhand") {
                return namespace_f808ba0ae0debcf5::function_62fa129f91896347(lootid);
            }
        }
    }
    return level.commonitem.var_b09fc2aeb718c263[lootid];
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf66
// Size: 0x6b6
function function_b5be5fff64626153(itembundlename) {
    itembundle = function_50f8a8f765bad85e("itemspawnentry:" + itembundlename, [#"baseweapon", #"weaponblueprint", #"ref", #"rarity", #"hash_b9a3752dc7a3d626", #"scriptable", #"hash_2eb67660fdfdf8a7", #"hash_ac804a3619667e5a"]);
    if (!isdefined(itembundle.baseweapon)) {
        return;
    }
    if (!isdefined(level.commonitem.var_37d10554e6936847[itembundle.baseweapon])) {
        level.commonitem.var_37d10554e6936847[itembundle.baseweapon] = {bundles:[]};
    }
    blueprintindex = 0;
    if (isdefined(itembundle.weaponblueprint) && isdefined(itembundle.ref)) {
        blueprintlootid = common_item::function_6d15e119c2779a93(itembundle);
        if (isdefined(blueprintlootid)) {
            blueprintindex = function_64ccc54bdbae5cf6(blueprintlootid);
            if (!isdefined(blueprintindex)) {
                /#
                    assertmsg("CommonItemWeaponERROR: The item def [" + itembundlename + "] specifies blueprint weapon [" + function_f28fd66285fa2c9(itembundle.weaponblueprint) + "] which is not a blueprint weapon on the specified base weapon [" + itembundle.baseweapon + "].");
                #/
                return;
            }
        }
    }
    rarity = isdefined(itembundle.rarity) ? itembundle.rarity : 0;
    if (!isdefined(level.commonitem.var_37d10554e6936847[itembundle.baseweapon].bundles[blueprintindex])) {
        level.commonitem.var_37d10554e6936847[itembundle.baseweapon].bundles[blueprintindex] = [];
    }
    if (!isdefined(level.commonitem.var_37d10554e6936847[itembundle.baseweapon].bundles[blueprintindex][rarity])) {
        level.commonitem.var_37d10554e6936847[itembundle.baseweapon].bundles[blueprintindex][rarity] = itembundlename;
    } else {
        /#
            print("CommonItemERROR: Custom weapon scriptable could not be spawned by SpawnCustomWeaponScriptable()." + function_3c8848a3a11b2553(level.commonitem.var_37d10554e6936847[itembundle.baseweapon].bundles[blueprintindex][rarity]) + "<unknown string>" + itembundlename + "<unknown string>" + function_3c8848a3a11b2553(itembundle.baseweapon) + "<unknown string>" + rarity + "<unknown string>");
        #/
    }
    if (!istrue(itembundle.var_5a5e50bc261c907a)) {
        if (!isdefined(level.commonitem.var_37d10554e6936847[itembundle.baseweapon].scriptable)) {
            level.commonitem.var_37d10554e6936847[itembundle.baseweapon].scriptable = itembundle.scriptable;
            /#
                level.commonitem.var_37d10554e6936847[itembundle.baseweapon].var_35799804650f8bea = itembundlename;
            #/
        } else {
            /#
                print("CommonItemERROR: Custom weapon scriptable could not be spawned by SpawnCustomWeaponScriptable()." + function_3c8848a3a11b2553(level.commonitem.var_37d10554e6936847[itembundle.baseweapon].var_35799804650f8bea) + "<unknown string>" + itembundlename + "<unknown string>" + function_3c8848a3a11b2553(itembundle.baseweapon) + "<unknown string>" + rarity + "<unknown string>");
            #/
        }
        if (isdefined(itembundle.var_64a5f9f552b5c973) || isdefined(itembundle.var_89616f2bce6b4ee6)) {
            if (!isdefined(level.commonitem.var_37d10554e6936847[itembundle.baseweapon].transform)) {
                level.commonitem.var_37d10554e6936847[itembundle.baseweapon].transform = spawnstruct();
                if (isdefined(itembundle.var_64a5f9f552b5c973)) {
                    level.commonitem.var_37d10554e6936847[itembundle.baseweapon].transform.translation = (isdefined(itembundle.var_64a5f9f552b5c973.x) ? itembundle.var_64a5f9f552b5c973.x : 0, isdefined(itembundle.var_64a5f9f552b5c973.y) ? itembundle.var_64a5f9f552b5c973.y : 0, isdefined(itembundle.var_64a5f9f552b5c973.z) ? itembundle.var_64a5f9f552b5c973.z : 0);
                }
                if (isdefined(itembundle.var_89616f2bce6b4ee6)) {
                    level.commonitem.var_37d10554e6936847[itembundle.baseweapon].transform.rotation = (isdefined(itembundle.var_89616f2bce6b4ee6.x) ? itembundle.var_89616f2bce6b4ee6.x : 0, isdefined(itembundle.var_89616f2bce6b4ee6.y) ? itembundle.var_89616f2bce6b4ee6.y : 0, isdefined(itembundle.var_89616f2bce6b4ee6.z) ? itembundle.var_89616f2bce6b4ee6.z : 0);
                }
                /#
                    level.commonitem.var_37d10554e6936847[itembundle.baseweapon].transform.bundle = itembundlename;
                #/
                return;
            }
            /#
                print("CommonItemERROR: Custom weapon scriptable could not be spawned by SpawnCustomWeaponScriptable()." + function_3c8848a3a11b2553(level.commonitem.var_37d10554e6936847[itembundle.baseweapon].transform.bundle) + "<unknown string>" + function_3c8848a3a11b2553(itembundlename) + "<unknown string>" + function_3c8848a3a11b2553(itembundle.baseweapon) + "<unknown string>");
            #/
        }
    }
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1623
// Size: 0xa3
function function_70024d27cb2942f5(itembundle, item, autouse, allowswap) {
    if (!val::get("weapon_pickup")) {
        return false;
    }
    if (istrue(self.insertingarmorplate)) {
        return false;
    }
    currentweapon = self getcurrentweapon();
    if (istrue(namespace_e0ee43ef2dddadaa::iskillstreakweapon(currentweapon))) {
        return false;
    }
    var_4781343684fdc257 = function_7d4684238ed31570(itembundle, item);
    if (inventory_isenabled()) {
        var_cc7e6ebb30ea246c = function_e2b4c63cab73c1f1();
        if (isdefined(var_cc7e6ebb30ea246c) && issameweapon(var_4781343684fdc257, var_cc7e6ebb30ea246c)) {
            return false;
        }
    }
    return true;
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16ce
// Size: 0x2e
function function_b9257704034d2b80(itembundle, item, autouse, allowswap) {
    return function_70024d27cb2942f5(itembundle, item, autouse, allowswap);
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1704
// Size: 0x5ad
function function_a8315d7427925f00(itembundle, item, autouse) {
    newweaponobj = undefined;
    if (isdefined(item.weaponobj)) {
        newweaponobj = item.weaponobj;
    } else if (isdefined(item.var_4f74f0aef2b2a8bf)) {
        newweaponobj = function_7d4684238ed31570(itembundle, item);
    } else {
        newweaponobj = function_777497d9d98fa0b8(itembundle);
    }
    if (!isdefined(newweaponobj)) {
        return;
    }
    newweaponstockammo = 0;
    if (isdefined(item.weaponstockammo)) {
        newweaponstockammo = item.weaponstockammo;
    } else {
        clipammo = function_b8bfea9514c89a77(item.count);
        maxclipammo = weaponclipsize(newweaponobj);
        if (clipammo > maxclipammo) {
            newweaponstockammo = clipammo - maxclipammo;
        }
    }
    if (function_d4246bdfe5eb28b5() > 1) {
        var_57acadc40b2f0a8 = function_90aed8ec6b3a7796(newweaponobj);
        oldweaponobj = var_57acadc40b2f0a8[1];
        oldweaponidx = var_57acadc40b2f0a8[0];
        if (isdefined(oldweaponobj) && self hasweapon(oldweaponobj)) {
            oldammomod = undefined;
            if (namespace_dc2e59577d3a271f::has_ammo_mod(oldweaponobj)) {
                oldammomod = namespace_dc2e59577d3a271f::get_ammo_mod_name(oldweaponobj);
                namespace_dc2e59577d3a271f::function_b4da81e43557ada1(oldweaponobj);
            }
            var_b4e4346fea6a4cfd = namespace_a4ff02beedc1bce8::get_pap_level(oldweaponobj);
            namespace_a4ff02beedc1bce8::function_2756cd1449650568(oldweaponobj, undefined);
            if (oldweaponobj.basename != "iw9_me_fists_mp") {
                oldweaponstockammo = self getweaponammostock(oldweaponobj);
                var_e37e1e658de3f31c = getweaponammopoolname(oldweaponobj);
                var_96c1ababaeb1c163 = getweaponammopoolname(newweaponobj);
                if (var_e37e1e658de3f31c == var_96c1ababaeb1c163 && oldweaponstockammo > 0) {
                    var_57acbdc40b2f2db = function_f3045c1e8c70d171(oldweaponstockammo, newweaponobj, newweaponstockammo);
                    newweaponstockammo = var_57acbdc40b2f2db[1];
                    oldweaponstockammo = var_57acbdc40b2f2db[0];
                }
                weaponinfostruct = spawnstruct();
                weaponinfostruct.ammoclipright = self getweaponammoclip(oldweaponobj);
                weaponinfostruct.ammoclipleft = self getweaponammoclip(oldweaponobj, "left");
                weaponinfostruct.var_9bfd50804dd2553c = function_aedc908c4a79d05e(oldweaponobj) ? 0 : self getweaponammoclip(oldweaponobj getaltweapon());
                weaponinfostruct.ammostock = oldweaponstockammo;
                weaponinfostruct.ammomod = oldammomod;
                weaponinfostruct.paplv = var_b4e4346fea6a4cfd;
                weaponinfostruct.rarity = function_75e73212bbe447d9(oldweaponobj);
                weaponinfostruct.camo = oldweaponobj.camo;
                weaponinfostruct.reticle = oldweaponobj.reticle;
                if (isdefined(self.var_c37e65eb7cc773eb)) {
                    weaponinfostruct.var_dbd4f3fc1d4f4d53 = self.var_c37e65eb7cc773eb[oldweaponobj.var_9d7facbe889e667c];
                    self.var_c37e65eb7cc773eb[oldweaponobj.var_9d7facbe889e667c] = undefined;
                }
                if (isdefined(oldweaponobj.stickerslot0) && oldweaponobj.stickerslot0 != "none") {
                    weaponinfostruct.stickerslot0 = oldweaponobj.stickerslot0;
                }
                if (isdefined(oldweaponobj.stickerslot1) && oldweaponobj.stickerslot1 != "none") {
                    weaponinfostruct.stickerslot1 = oldweaponobj.stickerslot1;
                }
                if (isdefined(oldweaponobj.stickerslot2) && oldweaponobj.stickerslot2 != "none") {
                    weaponinfostruct.stickerslot2 = oldweaponobj.stickerslot2;
                }
                if (isdefined(oldweaponobj.stickerslot3) && oldweaponobj.stickerslot3 != "none") {
                    weaponinfostruct.stickerslot3 = oldweaponobj.stickerslot3;
                }
                if (isdefined(oldweaponobj.var_b39ac546cc8621f8) && oldweaponobj.var_b39ac546cc8621f8 != "none") {
                    weaponinfostruct.var_b39ac546cc8621f8 = oldweaponobj.var_b39ac546cc8621f8;
                }
                function_23a822141e1e87f1(oldweaponobj, weaponinfostruct);
            }
            function_ffe562ebbdab55fc(oldweaponidx);
            _takeweapon(oldweaponobj);
        } else {
            /#
                assertmsg("CommonItemERROR: While attempting to use an item of base weapon type [" + newweaponobj.basename + "], a valid weapon to replace could not be retireved. Weapon item will not be used.");
            #/
            return;
        }
    }
    if (istrue(level.var_bfa98c9dd6edb929)) {
        if (isdefined(item.var_2632b2da60d34841)) {
            namespace_dc2e59577d3a271f::function_6c40f58b29a952a9(newweaponobj, item.var_2632b2da60d34841);
        }
    }
    if (isdefined(item.var_dbd4f3fc1d4f4d53)) {
        self.var_c37e65eb7cc773eb[newweaponobj.var_9d7facbe889e667c] = item.var_dbd4f3fc1d4f4d53;
    }
    if (isdefined(item.var_29a8ba8c9dd43fd2) && item.var_29a8ba8c9dd43fd2 > 0) {
        newweaponobj = namespace_a4ff02beedc1bce8::function_a0537467c5341047(newweaponobj, item.var_29a8ba8c9dd43fd2);
        namespace_a4ff02beedc1bce8::function_2756cd1449650568(newweaponobj, item.var_29a8ba8c9dd43fd2);
    }
    function_b2d47c265afcb72a(newweaponobj, item.count, newweaponstockammo);
    primaryweaponindex = function_2f5e1422c4b1932b(newweaponobj);
    if (isdefined(primaryweaponindex)) {
        if (isdefined(item.var_4f74f0aef2b2a8bf)) {
            self.var_dd3d589a27a0b26[primaryweaponindex] = item.var_4f74f0aef2b2a8bf;
        } else {
            var_4f74f0aef2b2a8bf = function_b5f358d46f69b20e(newweaponobj, itembundle.rarity, primaryweaponindex);
            var_4f74f0aef2b2a8bf.rarity = itembundle.rarity;
        }
    }
    return [0, newweaponobj];
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cb9
// Size: 0x98
function function_61f99d560d896d24(weapindex) {
    itembundle = undefined;
    quantity = 0;
    components = [];
    weapon = function_2aeaf88105d3b617(weapindex);
    if (isdefined(weapon) && !isnullweapon(weapon) && !weapons::isfistweapon(weapon)) {
        itembundle = function_2c85d7675de2e251(weapon);
        quantity = self getweaponammostock(weapon) + self getweaponammoclip(weapon);
        if (namespace_9571f642f38c8169::function_a6172e49f7313fd8()) {
            components = namespace_9571f642f38c8169::function_dec054b294d48a5c(weapon);
        }
    }
    return [itembundle, quantity, components];
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d59
// Size: 0x359
function function_d5143d7900e7160a(weapindex) {
    weapon = function_2aeaf88105d3b617(weapindex);
    if (!isdefined(weapon) || isnullweapon(weapon) || weapons::isfistweapon(weapon)) {
        return false;
    }
    oldammomod = undefined;
    if (namespace_dc2e59577d3a271f::has_ammo_mod(weapon)) {
        oldammomod = namespace_dc2e59577d3a271f::get_ammo_mod_name(weapon);
        namespace_dc2e59577d3a271f::function_b4da81e43557ada1(weapon);
    }
    var_b4e4346fea6a4cfd = namespace_a4ff02beedc1bce8::get_pap_level(weapon);
    namespace_a4ff02beedc1bce8::function_2756cd1449650568(weapon, undefined);
    weaponinfostruct = spawnstruct();
    weaponinfostruct.ammoclipright = self getweaponammoclip(weapon);
    weaponinfostruct.ammoclipleft = self getweaponammoclip(weapon, "left");
    weaponinfostruct.var_9bfd50804dd2553c = function_aedc908c4a79d05e(weapon) ? 0 : self getweaponammoclip(weapon getaltweapon());
    weaponinfostruct.ammostock = self getweaponammostock(weapon);
    weaponinfostruct.ammomod = oldammomod;
    weaponinfostruct.paplv = var_b4e4346fea6a4cfd;
    weaponinfostruct.rarity = function_75e73212bbe447d9(weapon);
    weaponinfostruct.camo = weapon.camo;
    weaponinfostruct.reticle = weapon.reticle;
    if (isdefined(self.var_c37e65eb7cc773eb)) {
        weaponinfostruct.var_dbd4f3fc1d4f4d53 = self.var_c37e65eb7cc773eb[weapon.var_9d7facbe889e667c];
        self.var_c37e65eb7cc773eb[weapon.var_9d7facbe889e667c] = undefined;
    }
    if (isdefined(weapon.stickerslot0) && weapon.stickerslot0 != "none") {
        weaponinfostruct.stickerslot0 = weapon.stickerslot0;
    }
    if (isdefined(weapon.stickerslot1) && weapon.stickerslot1 != "none") {
        weaponinfostruct.stickerslot1 = weapon.stickerslot1;
    }
    if (isdefined(weapon.stickerslot2) && weapon.stickerslot2 != "none") {
        weaponinfostruct.stickerslot2 = weapon.stickerslot2;
    }
    if (isdefined(weapon.stickerslot3) && weapon.stickerslot3 != "none") {
        weaponinfostruct.stickerslot3 = weapon.stickerslot3;
    }
    if (isdefined(weapon.var_b39ac546cc8621f8) && weapon.var_b39ac546cc8621f8 != "none") {
        weaponinfostruct.var_b39ac546cc8621f8 = weapon.var_b39ac546cc8621f8;
    }
    function_23a822141e1e87f1(weapon, weaponinfostruct);
    if (weapindex == 2) {
        function_bd059d6c2e0ece90();
        return true;
    }
    function_ffe562ebbdab55fc(weapindex);
    _takeweapon(weapon);
    if (function_d4246bdfe5eb28b5() < 2) {
        fistsweapon = makeweapon("iw9_me_fists_mp");
        self giveweapon(fistsweapon);
        switchindex = ter_op(weapindex == 1, 0, 1);
        weapontoswitch = function_2aeaf88105d3b617(switchindex);
        if (!isdefined(weapontoswitch)) {
            weapontoswitch = fistsweapon;
        }
        _switchtoweaponimmediate(weapontoswitch);
    }
    return true;
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20ba
// Size: 0xb7
function function_ad6e2b653093328a() {
    weaponobj = function_e2b4c63cab73c1f1();
    if (!isdefined(weaponobj)) {
        return;
    }
    weaponname = getcompleteweaponname(weaponobj);
    count = ter_op(isdefined(self.var_8a265f7b950a8d5d), self.var_8a265f7b950a8d5d, weaponclipsize(weaponobj));
    var_daa197e6c4b920ee = ter_op(weaponobj.hasalternate && isdefined(self.var_86b32aff94b5714e), self.var_86b32aff94b5714e, weaponclipsize(weaponobj getaltweapon()));
    ammocount = function_7209c8cd4b2e3afd(count, undefined, var_daa197e6c4b920ee);
    function_bd059d6c2e0ece90();
    function_b2d47c265afcb72a(weaponobj, ammocount);
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2178
// Size: 0x17a
function private function_b2d47c265afcb72a(weaponobj, ammocount, stockammo) {
    weaponname = getcompleteweaponname(weaponobj);
    self giveweapon(weaponname);
    self notify("pickedupweapon", weaponname);
    var_c1192c297bbf292f = function_b8bfea9514c89a77(ammocount);
    var_7b7b94efe2e96d4b = function_9f9adbfb9db3d2ab(ammocount);
    clipsize = weaponclipsize(weaponobj);
    var_31b36738ff4eacd = 0;
    if (var_c1192c297bbf292f > clipsize) {
        var_31b36738ff4eacd = var_31b36738ff4eacd + var_c1192c297bbf292f - clipsize;
        var_c1192c297bbf292f = clipsize;
    }
    if (isdefined(var_7b7b94efe2e96d4b) && var_7b7b94efe2e96d4b > clipsize) {
        var_31b36738ff4eacd = var_31b36738ff4eacd + var_7b7b94efe2e96d4b - clipsize;
        var_7b7b94efe2e96d4b = clipsize;
    }
    self setweaponammoclip(weaponname, var_c1192c297bbf292f);
    self setweaponammoclip(weaponname, var_7b7b94efe2e96d4b, "left");
    newstockammo = var_31b36738ff4eacd;
    if (isdefined(stockammo)) {
        newstockammo = stockammo;
    }
    newstockammo = int(min(newstockammo, weaponmaxammo(weaponname)));
    self setweaponammostock(weaponname, newstockammo);
    if (weaponobj.hasalternate && !function_aedc908c4a79d05e(weaponobj)) {
        altweaponobj = weaponobj getaltweapon();
        var_dfd1fd5d26dd4e12 = function_8fd389f931f45c66(ammocount);
        altclipsize = weaponclipsize(altweaponobj);
        if (!isdefined(var_dfd1fd5d26dd4e12) || var_dfd1fd5d26dd4e12 > altclipsize) {
            var_dfd1fd5d26dd4e12 = altclipsize;
        }
        self setweaponammoclip(altweaponobj, var_dfd1fd5d26dd4e12);
    }
    self assignweaponprimaryslot(weaponname);
    _switchtoweaponimmediate(weaponname);
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22f9
// Size: 0x229
function function_23a822141e1e87f1(weaponobj, weaponinfostruct) {
    var_4f74f0aef2b2a8bf = function_b5f358d46f69b20e(weaponobj, weaponinfostruct.rarity);
    if (!isdefined(var_4f74f0aef2b2a8bf)) {
        return undefined;
    }
    dropstruct = function_59a2e61d79065dca();
    dropstruct.var_8ee5ee589d379b1 = -30;
    dropstruct.var_91170e589f9e8ff = 30;
    dropstruct.var_82839e7264d5d15e = -30;
    dropstruct.var_8260b07264afb13c = 30;
    dropinfo = function_49b86047c8a8b228(dropstruct, self.origin, self.angles, self);
    item = function_6cf4b48de9a4bc39(weaponobj, weaponinfostruct, dropinfo.origin, dropinfo.angles, undefined, undefined, dropinfo.payload);
    if (!isdefined(item)) {
        return undefined;
    }
    if (isdefined(var_4f74f0aef2b2a8bf.itembundlename)) {
        itembundle = getscriptbundle("itemspawnentry:" + var_4f74f0aef2b2a8bf.itembundlename);
        lootid = function_6d15e119c2779a93(itembundle);
        self dlog_recordplayerevent("dlog_event_player_common_item", ["dropped", lootid, "stowed", 0, "equipped", 0, "bought", 0, "sold", 0, "type", itembundle.type, "from_cache", 0, "from_rift_reward", 0]);
        function_43272b9595268864(itembundle, dropinfo.origin);
    }
    item.var_4f74f0aef2b2a8bf = var_4f74f0aef2b2a8bf;
    params = spawnstruct();
    params.item = item;
    params.itembundlename = item.var_4f74f0aef2b2a8bf.itembundlename;
    callback::callback("player_item_drop", params);
    return item;
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x252a
// Size: 0x222
function function_c069cffb4cbd1707(itembundle, origin, angles, var_1d3bb1a1505a7fc7, var_763c4bec5399cf2e, var_14c85b39207719b8, var_57266f5ca6feebd7, payload1, payload2) {
    baseweapon = itembundle.baseweapon;
    if (!isdefined(baseweapon)) {
        return undefined;
    }
    weaponobj = function_777497d9d98fa0b8(itembundle);
    weaponinfostruct = spawnstruct();
    weaponinfostruct.ammoclipright = weaponclipsize(weaponobj);
    weaponinfostruct.ammoclipleft = weaponclipsize(weaponobj);
    weaponinfostruct.var_9bfd50804dd2553c = function_aedc908c4a79d05e(weaponobj) ? 0 : weaponclipsize(weaponobj getaltweapon());
    weaponinfostruct.ammostock = weaponmaxammo(weaponobj);
    weaponinfostruct.ammomod = var_1d3bb1a1505a7fc7;
    weaponinfostruct.paplv = var_763c4bec5399cf2e;
    weaponinfostruct.rarity = itembundle.rarity;
    angles = isdefined(angles) ? angles : (0, 0, 0);
    item = function_6cf4b48de9a4bc39(weaponobj, weaponinfostruct, origin, angles, var_14c85b39207719b8, var_57266f5ca6feebd7, payload1, payload2);
    if (!isdefined(item)) {
        return undefined;
    }
    function_43272b9595268864(itembundle, origin);
    item.var_4f74f0aef2b2a8bf = spawnstruct();
    item.var_4f74f0aef2b2a8bf.itembundlename = function_46423e80a0fa8f2(baseweapon, itembundle.rarity, weaponobj.variantid);
    item.var_4f74f0aef2b2a8bf.attachments = weaponobj.attachments;
    item.var_4f74f0aef2b2a8bf.rarity = itembundle.rarity;
    item.var_4f74f0aef2b2a8bf.baseweapon = baseweapon;
    item.var_4f74f0aef2b2a8bf.variantid = weaponobj.variantid;
    return item;
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2754
// Size: 0x28f
function function_6cf4b48de9a4bc39(weaponobj, weaponinfostruct, origin, angles, nodrop, nocleanup, payload1, payload2) {
    baseweapon = weaponobj.basename;
    if (!isdefined(baseweapon)) {
        return undefined;
    }
    spawntransform = function_5898445f4e50bcdb(baseweapon);
    if (isdefined(spawntransform)) {
        if (isdefined(spawntransform.translation)) {
            origin = origin + spawntransform.translation;
        }
        if (isdefined(spawntransform.rotation)) {
            angles = angles + spawntransform.rotation;
        }
    }
    lootscriptable = weapon::iswonderweapon(weaponobj) ? %"hash_730e20a5158e3a0d" : %"hash_15004fe9e3a7c88a";
    raritypayload = [#"customperkpackage", isdefined(weaponinfostruct.rarity) ? weaponinfostruct.rarity : 0, 0, 0, 0];
    item = spawncustomweaponscriptable(lootscriptable, origin, angles, undefined, weaponobj, raritypayload, payload1, payload2);
    if (isdefined(item)) {
        item.customweaponname = getcompleteweaponname(weaponobj);
    } else {
        /#
            assertmsg("CommonItemERROR: Custom weapon scriptable could not be spawned by SpawnCustomWeaponScriptable().");
        #/
        return undefined;
    }
    item.count = function_7209c8cd4b2e3afd(weaponinfostruct.ammoclipright, weaponinfostruct.ammoclipleft, weaponinfostruct.var_9bfd50804dd2553c, weaponinfostruct.rarity);
    item.weaponstockammo = weaponinfostruct.ammostock;
    item.var_2632b2da60d34841 = weaponinfostruct.ammomod;
    item.var_29a8ba8c9dd43fd2 = weaponinfostruct.paplv;
    item.var_dbd4f3fc1d4f4d53 = weaponinfostruct.var_dbd4f3fc1d4f4d53;
    item.weaponobj = weaponobj;
    item callback::callback("scriptable_item_spawned", {angles:angles, origin:origin, itembundle:weaponinfostruct, item:item});
    if (!istrue(nodrop)) {
        item setscriptablepartstate(item.type, "dropped");
    }
    function_476b3beecd82dcca("common_items", item);
    if (!istrue(nocleanup)) {
        item thread function_33ee459f817ccf86(90);
    }
    return item;
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29eb
// Size: 0x1ff
function function_7d4684238ed31570(itembundle, item) {
    baseweaponname = itembundle.baseweapon;
    attachmentsarray = [];
    variantid = undefined;
    camo = undefined;
    reticle = undefined;
    if (isdefined(item.var_4f74f0aef2b2a8bf)) {
        if (isdefined(item.var_4f74f0aef2b2a8bf.baseweapon)) {
            baseweaponname = item.var_4f74f0aef2b2a8bf.baseweapon;
        }
        if (isdefined(item.var_4f74f0aef2b2a8bf.attachments)) {
            attachmentsarray = item.var_4f74f0aef2b2a8bf.attachments;
        }
        if (isdefined(item.var_4f74f0aef2b2a8bf.variantid)) {
            variantid = item.var_4f74f0aef2b2a8bf.variantid;
        }
        camo = item.var_4f74f0aef2b2a8bf.camo;
        reticle = item.var_4f74f0aef2b2a8bf.reticle;
    }
    stickers = [];
    if (isdefined(item.stickerslot0)) {
        stickers[stickers.size] = item.stickerslot0;
    }
    if (isdefined(item.stickerslot1)) {
        stickers[stickers.size] = item.stickerslot1;
    }
    if (isdefined(item.stickerslot2)) {
        stickers[stickers.size] = item.stickerslot2;
    }
    if (isdefined(item.stickerslot3)) {
        stickers[stickers.size] = item.stickerslot3;
    }
    if (isdefined(item.var_b39ac546cc8621f8)) {
        stickers[stickers.size] = item.var_b39ac546cc8621f8;
    }
    if (isdefined(variantid) && variantid != 0) {
        return weapon::buildweapon_blueprint(weapon::getweaponrootname(baseweaponname), camo, reticle, variantid, undefined, stickers);
    }
    return weapon::buildweapon(baseweaponname, attachmentsarray, camo, reticle, undefined, undefined, undefined, stickers);
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bf1
// Size: 0x116
function function_777497d9d98fa0b8(itembundle) {
    if (!isdefined(itembundle)) {
        /#
            assertmsg("CommonItemERROR: An invalid itemBundle was specified when attempting to build weapon object from an item bundle.");
        #/
        return undefined;
    }
    if (!isdefined(itembundle.baseweapon)) {
        /#
            assertmsg("CommonItemERROR: An itemBundle with an invalid baseWeapon was specified when attempting to build weapon object from an item bundle.");
        #/
        return undefined;
    }
    baseweaponname = itembundle.baseweapon;
    if (isdefined(itembundle.weaponblueprint)) {
        var_a1cb298d90255f53 = function_ce5e32676f572482(itembundle);
        /#
            assertex(var_a1cb298d90255f53 != 0, "CommonItemWeaponERROR: Failed to build a blueprint weapon from the item bundle [" + common_item::function_467f0c241ad05cfb(itembundle.ref) + "] using the ref [" + itembundle.ref + "].");
        #/
        lootid = common_item::function_6d15e119c2779a93(itembundle);
        blueprintcamo = function_c7771194200d360e(lootid);
        return weapon::buildweapon_blueprint(weapon::getweaponrootname(baseweaponname), blueprintcamo, undefined, var_a1cb298d90255f53);
    }
    attachmentsarray = [];
    if (getdvarint(@"hash_fe8c3a210d6855dd") == 0) {
        attachmentsarray = function_4a20d0b8693d4656(itembundle);
    }
    return weapon::buildweapon(baseweaponname, attachmentsarray);
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d0f
// Size: 0x7a
function function_c9fa4fbe86fb1c75(itembundlename) {
    if (!isdefined(itembundlename)) {
        return [];
    }
    var_b91e11f33e2a122d = function_50f8a8f765bad85e("itemspawnentry:" + itembundlename, [#"baseweapon", #"maxattachments", #"attachmentslots", #"hash_b48a8e8b021298fc", #"hash_582faf4b19c656ec"]);
    if (!isdefined(var_b91e11f33e2a122d)) {
        return [];
    }
    return function_4a20d0b8693d4656(var_b91e11f33e2a122d);
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d91
// Size: 0xad2
function function_4a20d0b8693d4656(itembundle) {
    weapon = itembundle.baseweapon;
    maxattachments = isdefined(itembundle.maxattachments) ? itembundle.maxattachments : 0;
    if (maxattachments == 0) {
        return [];
    }
    var_89eb760f6b8df087 = [];
    var_4aed501ce3a50793 = [];
    var_f6aae36b60d6e67f = [];
    var_c228159a2bfd2b4c = [];
    if (isdefined(itembundle.var_a70439f6a789d930)) {
        chance_offset = 0;
        random = randomfloat(100);
        foreach (var_151f9918b41e699d in itembundle.var_a70439f6a789d930) {
            if (!isdefined(var_151f9918b41e699d.chance)) {
                var_4aed501ce3a50793[var_4aed501ce3a50793.size] = var_151f9918b41e699d.attachment;
                continue;
            }
            if (random < chance_offset + var_151f9918b41e699d.chance && !arraycontains(level.commonitem.var_b8ba13385a2bb5, var_151f9918b41e699d.attachment)) {
                var_89eb760f6b8df087[var_89eb760f6b8df087.size] = var_151f9918b41e699d.attachment;
                if (var_89eb760f6b8df087.size >= maxattachments) {
                    return var_89eb760f6b8df087;
                }
                var_f6aae36b60d6e67f[var_f6aae36b60d6e67f.size] = function_4add228b999c26aa(weapon, var_151f9918b41e699d.attachment);
                foreach (var_3a7356eec5bf4552 in function_e843253d046ad859(weapon, var_151f9918b41e699d.attachment)) {
                    var_4aed501ce3a50793[var_4aed501ce3a50793.size] = var_3a7356eec5bf4552;
                }
                foreach (blockedslot in function_c6d15635447865c5(weapon, var_151f9918b41e699d.attachment)) {
                    var_f6aae36b60d6e67f[var_f6aae36b60d6e67f.size] = blockedslot;
                }
                foreach (var_c60000b703c5b2ea in function_e843253d046ad859(weapon, var_151f9918b41e699d.attachment)) {
                    var_c228159a2bfd2b4c[var_c228159a2bfd2b4c.size] = var_c60000b703c5b2ea;
                }
                break;
            } else {
                var_4aed501ce3a50793[var_4aed501ce3a50793.size] = var_151f9918b41e699d.attachment;
            }
            chance_offset = chance_offset + var_151f9918b41e699d.chance;
        }
    }
    if (!isdefined(itembundle.attachmentslots)) {
        return var_89eb760f6b8df087;
    }
    var_52e58fb32a89b835 = [];
    if (!isdefined(itembundle.var_71f90b307a0c6978) || itembundle.var_71f90b307a0c6978 == 1) {
        var_51dbe1a1c3d8bf04 = function_6527364c1ecca6c6(weapon);
        foreach (attachment in var_51dbe1a1c3d8bf04) {
            var_52e58fb32a89b835[function_4add228b999c26aa(weapon, attachment)] = attachment;
        }
    }
    var_273875869946e27c = [];
    var_b6f364a2adcb0e33 = [];
    foreach (var_b733f7b6e209a5ab in itembundle.attachmentslots) {
        if (arraycontains(var_f6aae36b60d6e67f, var_b733f7b6e209a5ab.slot)) {
            continue;
        }
        var_6eb6799cfc6da135 = [];
        if (istrue(var_b733f7b6e209a5ab.includeall)) {
            var_6eb6799cfc6da135 = function_75b035199842693d(weapon, var_b733f7b6e209a5ab.slot, level.commonitem.var_feea62f594ad9284);
        } else if (isdefined(var_b733f7b6e209a5ab.includelist)) {
            foreach (attachmententry in var_b733f7b6e209a5ab.includelist) {
                if (isdefined(attachmententry.attachment) && attachmententry.attachment != "") {
                    var_6eb6799cfc6da135[var_6eb6799cfc6da135.size] = attachmententry.attachment;
                }
            }
        } else {
            continue;
        }
        var_a54649baf68ead4d = [];
        foreach (var_b7febab1f5c4c2c8 in var_6eb6799cfc6da135) {
            if (isdefined(var_52e58fb32a89b835[var_b733f7b6e209a5ab.slot]) && var_b7febab1f5c4c2c8 == var_52e58fb32a89b835[var_b733f7b6e209a5ab.slot]) {
                continue;
            }
            var_c79c00b942994a52 = function_4add228b999c26aa(weapon, var_b7febab1f5c4c2c8);
            if (var_c79c00b942994a52 != var_b733f7b6e209a5ab.slot) {
                if (var_c79c00b942994a52 == "") {
                    /#
                        assertmsg("CommonItemWeaponERROR: [" + var_b7febab1f5c4c2c8 + "] is not a valid attachment for [" + weapon + "].");
                    #/
                } else {
                    /#
                        assertmsg("CommonItemWeaponERROR: [" + var_b7febab1f5c4c2c8 + "] was listed in the [" + var_b733f7b6e209a5ab.slot + "] attachment slot for randomization, but it's listed in the [" + var_c79c00b942994a52 + "] attachment slot on [" + weapon + "].");
                    #/
                }
                continue;
            }
            if (arraycontains(level.commonitem.var_b8ba13385a2bb5, var_b7febab1f5c4c2c8)) {
                continue;
            }
            if (isdefined(var_b733f7b6e209a5ab.excludelist)) {
                excluded = 0;
                foreach (var_d352968aae470c76 in var_b733f7b6e209a5ab.excludelist) {
                    if (var_d352968aae470c76.attachment == var_b7febab1f5c4c2c8) {
                        excluded = 1;
                        break;
                    }
                }
                if (excluded) {
                    continue;
                }
            }
            if (arraycontains(var_4aed501ce3a50793, var_b7febab1f5c4c2c8)) {
                continue;
            }
            basetype = function_7c612ac92ba98dcb(weapon, var_b7febab1f5c4c2c8);
            if (isdefined(basetype) && arraycontains(var_c228159a2bfd2b4c, basetype)) {
                continue;
            }
            var_ea9750936cb9726b = 0;
            var_d30865ebf0ce910e = function_6dc98654fb071228(weapon, var_b7febab1f5c4c2c8);
            foreach (var_8630243a2ab728c9 in var_d30865ebf0ce910e) {
                if (!arraycontains(var_89eb760f6b8df087, var_8630243a2ab728c9)) {
                    var_ea9750936cb9726b = 1;
                    break;
                }
            }
            if (var_ea9750936cb9726b) {
                continue;
            }
            var_a54649baf68ead4d[var_a54649baf68ead4d.size] = var_b7febab1f5c4c2c8;
        }
        if (var_a54649baf68ead4d.size > 0) {
            if (istrue(var_b733f7b6e209a5ab.forced)) {
                attachment = var_a54649baf68ead4d[randomint(var_a54649baf68ead4d.size)];
                var_89eb760f6b8df087[var_89eb760f6b8df087.size] = attachment;
                if (var_89eb760f6b8df087.size >= maxattachments) {
                    return var_89eb760f6b8df087;
                }
                foreach (var_3a7356eec5bf4552 in function_e843253d046ad859(weapon, attachment)) {
                    var_4aed501ce3a50793[var_4aed501ce3a50793.size] = var_3a7356eec5bf4552;
                }
                foreach (blockedslot in function_c6d15635447865c5(weapon, attachment)) {
                    var_f6aae36b60d6e67f[var_f6aae36b60d6e67f.size] = blockedslot;
                }
                foreach (var_c60000b703c5b2ea in function_e843253d046ad859(weapon, attachment)) {
                    var_c228159a2bfd2b4c[var_c228159a2bfd2b4c.size] = var_c60000b703c5b2ea;
                }
                continue;
            }
            var_273875869946e27c[var_273875869946e27c.size] = var_b733f7b6e209a5ab.slot;
            var_b6f364a2adcb0e33[var_b733f7b6e209a5ab.slot] = var_a54649baf68ead4d;
        }
    }
    var_273875869946e27c = utility::array_randomize(var_273875869946e27c);
    foreach (slot in var_273875869946e27c) {
        if (arraycontains(var_f6aae36b60d6e67f, slot)) {
            continue;
        }
        var_b6f364a2adcb0e33[slot] = utility::array_randomize(var_b6f364a2adcb0e33[slot]);
        foreach (attachment in var_b6f364a2adcb0e33[slot]) {
            basetype = function_7c612ac92ba98dcb(weapon, attachment);
            if (isdefined(basetype) && arraycontains(var_c228159a2bfd2b4c, basetype) || arraycontains(var_4aed501ce3a50793, attachment)) {
                continue;
            }
            var_ea9750936cb9726b = 0;
            var_d30865ebf0ce910e = function_6dc98654fb071228(weapon, attachment);
            foreach (var_8630243a2ab728c9 in var_d30865ebf0ce910e) {
                if (!arraycontains(var_89eb760f6b8df087, var_8630243a2ab728c9)) {
                    var_ea9750936cb9726b = 1;
                    break;
                }
            }
            if (var_ea9750936cb9726b) {
                continue;
            }
            var_89eb760f6b8df087[var_89eb760f6b8df087.size] = attachment;
            if (var_89eb760f6b8df087.size >= maxattachments) {
                return var_89eb760f6b8df087;
            }
            foreach (var_3a7356eec5bf4552 in function_e843253d046ad859(weapon, attachment)) {
                var_4aed501ce3a50793[var_4aed501ce3a50793.size] = var_3a7356eec5bf4552;
            }
            foreach (blockedslot in function_c6d15635447865c5(weapon, attachment)) {
                var_f6aae36b60d6e67f[var_f6aae36b60d6e67f.size] = blockedslot;
            }
            foreach (var_c60000b703c5b2ea in function_e843253d046ad859(weapon, attachment)) {
                var_c228159a2bfd2b4c[var_c228159a2bfd2b4c.size] = var_c60000b703c5b2ea;
            }
            break;
        }
    }
    return var_89eb760f6b8df087;
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x386b
// Size: 0xa4
function function_46e8a35ad122218e(itembundle) {
    weapondata = spawnstruct();
    weapondata.baseweapon = itembundle.baseweapon;
    weapondata.rarity = itembundle.rarity;
    weapondata.attachments = function_4a20d0b8693d4656(itembundle);
    weapondata.variantid = function_ce5e32676f572482(itembundle);
    weapondata.itembundlename = function_46423e80a0fa8f2(itembundle.baseweapon, itembundle.rarity, weapondata.variantid);
    return weapondata;
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3917
// Size: 0xc6
function private function_23cdd58f4d4fa1ba(weaponobject, rarity, primaryweaponindex) {
    weapondata = spawnstruct();
    weapondata.baseweapon = weaponobject.basename;
    weapondata.rarity = default_to(rarity, 0);
    weapondata.attachments = weaponobject.attachments;
    weapondata.variantid = weaponobject.variantid;
    weapondata.itembundlename = function_46423e80a0fa8f2(weaponobject.basename, weapondata.rarity, weaponobject.variantid);
    self.var_dd3d589a27a0b26[primaryweaponindex] = weapondata;
    return weapondata;
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39e5
// Size: 0xd9
function function_b5f358d46f69b20e(weaponobject, rarity, primaryweaponindex) {
    if (!isdefined(weaponobject)) {
        /#
            assertmsg("CommonItemERROR: An invalid weaponObject was specified when attempting to retrieve player weapon data.");
        #/
        return undefined;
    }
    if (!isplayer(self)) {
        /#
            assertmsg("CommonItemWeaponERROR: A non-player was specified when attempting to retrieve player weapon data.");
        #/
        return undefined;
    }
    if (!isdefined(primaryweaponindex)) {
        primaryweaponindex = function_2f5e1422c4b1932b(weaponobject);
    }
    if (!isdefined(primaryweaponindex) || primaryweaponindex < 0 || primaryweaponindex >= 2) {
        /#
            println("<unknown string>" + (isdefined(weaponobject.basename) ? weaponobject.basename : "<unknown string>") + "<unknown string>" + (isdefined(primaryweaponindex) ? primaryweaponindex : "<unknown string>"));
        #/
        return undefined;
    }
    if (!isdefined(self.var_dd3d589a27a0b26[primaryweaponindex])) {
        function_23cdd58f4d4fa1ba(weaponobject, rarity, primaryweaponindex);
    }
    return self.var_dd3d589a27a0b26[primaryweaponindex];
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ac6
// Size: 0x3e
function function_ffe562ebbdab55fc(primaryweaponindex) {
    if (!isdefined(primaryweaponindex) || primaryweaponindex < 0 || primaryweaponindex >= 2) {
        /#
            assertmsg("CommonItemERROR: Trying to remove weapon data from commonItemPlayerWeaponData at an invalid index: " + primaryweaponindex);
        #/
        return undefined;
    }
    self.var_dd3d589a27a0b26[primaryweaponindex] = undefined;
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b0b
// Size: 0x88
function function_2c85d7675de2e251(weaponobject) {
    primaryweaponindex = function_2f5e1422c4b1932b(weaponobject);
    if (!isdefined(primaryweaponindex) || !isdefined(self.var_dd3d589a27a0b26[primaryweaponindex]) || !isdefined(self.var_dd3d589a27a0b26[primaryweaponindex].itembundlename)) {
        return undefined;
    }
    itembundlename = self.var_dd3d589a27a0b26[primaryweaponindex].itembundlename;
    itembundle = getscriptbundle("itemspawnentry:" + itembundlename);
    return itembundle;
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b9b
// Size: 0x41
function function_3a0412b800f3331d(weapon, rarity) {
    weapondata = function_b5f358d46f69b20e(weapon, rarity);
    if (isdefined(weapondata)) {
        weapondata.rarity = rarity;
        function_dcc83e7e97a52bf4(weapon);
    }
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3be3
// Size: 0x43
function function_75e73212bbe447d9(weapon) {
    weapondata = function_b5f358d46f69b20e(weapon);
    if (isdefined(weapondata)) {
        return (isdefined(weapondata.rarity) ? weapondata.rarity : 0);
    }
    return 0;
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c2e
// Size: 0x85
function function_2aeaf88105d3b617(weapindex) {
    if (isdefined(weapindex)) {
        if (weapindex == 2) {
            return function_e2b4c63cab73c1f1();
        } else {
            indexcounter = 0;
            for (i = 0; i < self.primaryweapons.size; i++) {
                weapon = self.primaryweapons[i];
                if (weapon.basename != "none") {
                    if (indexcounter == weapindex) {
                        return weapon;
                    }
                    indexcounter++;
                }
            }
        }
    }
    return undefined;
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cbb
// Size: 0xa4
function function_2f5e1422c4b1932b(weaponobject) {
    if (!isdefined(weaponobject)) {
        return undefined;
    }
    if (!isdefined(self.primaryweapons)) {
        /#
            assertmsg("CommonItemWeaponERROR: Failed to get the primary weapons of a player. Is this really a player?");
        #/
        return undefined;
    }
    primaryweaponslist = self.primaryweapons;
    var_5ee0dd3a9ede9aa0 = weaponobject getnoaltweapon();
    for (i = 0; i < primaryweaponslist.size; i++) {
        weapon = primaryweaponslist[i];
        if (issameweapon(weaponobject, weapon) || isdefined(var_5ee0dd3a9ede9aa0) && !isnullweapon(var_5ee0dd3a9ede9aa0) && issameweapon(var_5ee0dd3a9ede9aa0, weapon)) {
            return i;
        }
    }
    return undefined;
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3d67
// Size: 0xeb
function private function_90aed8ec6b3a7796(newweapon) {
    primaryweaponslist = self.primaryweapons;
    for (i = 0; i < primaryweaponslist.size; i++) {
        weapon = primaryweaponslist[i];
        if (newweapon.basename == weapon.basename) {
            return [i, weapon];
        }
    }
    for (i = 0; i < primaryweaponslist.size; i++) {
        weapon = primaryweaponslist[i];
        if (weapon.basename == "iw9_me_fists_mp") {
            return [i, weapon];
        }
    }
    currentweapon = self getcurrentweapon();
    currentweaponindex = function_2f5e1422c4b1932b(currentweapon);
    if (isdefined(currentweaponindex) && currentweaponindex < primaryweaponslist.size) {
        return [currentweaponindex, primaryweaponslist[currentweaponindex]];
    }
    return [undefined, undefined];
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e5a
// Size: 0xc1
function function_c14b2cb6d5a65def(weapindex) {
    var_17d89f18c1d0eb4f = function_2aeaf88105d3b617(weapindex);
    switchindex = ter_op(weapindex == 1, 0, 1);
    if (!isdefined(var_17d89f18c1d0eb4f)) {
        return;
    }
    if (var_17d89f18c1d0eb4f.basename == "iw9_me_fists_mp") {
        return;
    }
    if (function_ced2abb96f1d86a5()) {
        function_ad6e2b653093328a();
    } else {
        fistsweapon = makeweapon("iw9_me_fists_mp");
        if (!self hasweapon("iw9_me_fists_mp")) {
            self giveweapon(fistsweapon);
        }
        weapontoswitch = function_2aeaf88105d3b617(switchindex);
        if (!isdefined(weapontoswitch)) {
            weapontoswitch = fistsweapon;
        }
        _switchtoweaponimmediate(weapontoswitch);
    }
    function_ad55c4cd0426138d(var_17d89f18c1d0eb4f);
    self takeweapon(var_17d89f18c1d0eb4f);
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3f22
// Size: 0x72
function private function_d4246bdfe5eb28b5() {
    numprimaries = self.primaryweapons.size;
    foreach (weap in self.primaryweapons) {
        if (isnullweapon(weap)) {
            numprimaries--;
        }
    }
    return numprimaries;
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3f9c
// Size: 0x5f
function private function_f3045c1e8c70d171(oldweaponstockammo, newweaponobj, newweaponstockammo) {
    var_315cd02a520438bf = weaponmaxammo(newweaponobj);
    var_d0de2243627d6414 = var_315cd02a520438bf - newweaponstockammo;
    if (oldweaponstockammo > var_d0de2243627d6414) {
        oldweaponstockammo = oldweaponstockammo - var_d0de2243627d6414;
        newweaponstockammo = var_315cd02a520438bf;
    } else {
        newweaponstockammo = newweaponstockammo + oldweaponstockammo;
        oldweaponstockammo = 0;
    }
    return [oldweaponstockammo, newweaponstockammo];
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4003
// Size: 0x34
function function_aedc908c4a79d05e(weaponobj) {
    if (istrue(weaponobj.hasalternate)) {
        return (function_7c612ac92ba98dcb(weaponobj, weaponobj.underbarrel) == "selectfire");
    }
    return false;
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x403f
// Size: 0x53
function function_9f04c40e25433451(baseweapon) {
    if (!isdefined(baseweapon)) {
        /#
            assertmsg("CommonItemERROR: An undefined baseWeapon name was specified when trying to get the scriptable from base weapon.");
        #/
        return undefined;
    }
    var_37d10554e6936847 = level.commonitem.var_37d10554e6936847[baseweapon];
    if (isdefined(var_37d10554e6936847)) {
        return var_37d10554e6936847.scriptable;
    }
    return undefined;
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x409a
// Size: 0x53
function function_5898445f4e50bcdb(baseweapon) {
    if (!isdefined(baseweapon)) {
        /#
            assertmsg("CommonItemERROR: An undefined baseWeapon name was specified when trying to get the spawn scriptable from base weapon.");
        #/
        return undefined;
    }
    var_37d10554e6936847 = level.commonitem.var_37d10554e6936847[baseweapon];
    if (isdefined(var_37d10554e6936847)) {
        return var_37d10554e6936847.transform;
    }
    return undefined;
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40f5
// Size: 0xac
function function_46423e80a0fa8f2(baseweapon, rarity, blueprintindex) {
    if (!isdefined(baseweapon)) {
        /#
            assertmsg("CommonItemERROR: An undefined baseWeapon name was specified when trying to retrieve an item bundle name.");
        #/
        return undefined;
    }
    var_37d10554e6936847 = level.commonitem.var_37d10554e6936847[baseweapon];
    if (isdefined(var_37d10554e6936847)) {
        if (!isdefined(rarity)) {
            rarity = 0;
        }
        if (!isdefined(blueprintindex)) {
            blueprintindex = 0;
        }
        if (isdefined(var_37d10554e6936847.bundles[blueprintindex])) {
            return var_37d10554e6936847.bundles[blueprintindex][rarity];
        } else if (isdefined(var_37d10554e6936847.bundles[0])) {
            return var_37d10554e6936847.bundles[0][rarity];
        }
    }
    return undefined;
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41a9
// Size: 0x4f
function function_ce5e32676f572482(itembundle) {
    if (isdefined(itembundle.ref)) {
        blueprintlootid = common_item::function_6d15e119c2779a93(itembundle);
        if (isdefined(blueprintlootid)) {
            blueprintindex = function_64ccc54bdbae5cf6(blueprintlootid);
            return (isdefined(blueprintindex) ? blueprintindex : 0);
        }
    }
    return 0;
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4200
// Size: 0x1c3
function private function_95cd4c99989f7140() {
    /#
        if (getdvarint(@"hash_10f0811105fc2f93", 0) == 0) {
            return;
        }
        setdvarifuninitialized(@"hash_e981f2369f02b682", 350);
        setdvarifuninitialized(@"hash_21adc9eb44b3d7ed", 20);
        setdvarifuninitialized(@"hash_aac79e2ab4af9ee7", 1);
        setdvarifuninitialized(@"hash_8b93e6e651c920bb", 1);
        if (!isdefined(level.var_61e6e1b83a8f3486)) {
            level.var_61e6e1b83a8f3486 = spawnstruct();
        }
        level.var_61e6e1b83a8f3486.weapondevgui = [];
        level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822 = [];
        level.var_61e6e1b83a8f3486.var_47020c5cf3e4b050 = [];
        devgui::function_6e7290c8ee4f558b("<unknown string>");
        devgui::function_b2159fbbd7ac094e("<unknown string>", @"hash_d1415bb7a04b48f9");
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_2388563f2076e75e, 0);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_2388563f2076e75e, 1);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_2388563f2076e75e, 2);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_2388563f2076e75e, 3);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_2388563f2076e75e, 4);
        devgui::function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_c6fb716427c35c50, 0);
        devgui::function_b2159fbbd7ac094e("<unknown string>", @"hash_8b93e6e651c920bb", 1);
        devgui::function_df648211d66cd3dd("<unknown string>", "<unknown string>", 2);
        devgui::function_df648211d66cd3dd("<unknown string>", "<unknown string>", 3);
        devgui::function_df648211d66cd3dd("<unknown string>", "<unknown string>", 4);
        devgui::function_fe953f000498048f();
    #/
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x43ca
// Size: 0x277
function private function_cb5a17997d502c15(var_9ec97bdad14a0a5b) {
    /#
        item_bundle = function_50f8a8f765bad85e("<unknown string>" + var_9ec97bdad14a0a5b, [#"ref", #"subtype", #"rarity"]);
        if (!isdefined(item_bundle.ref) || getdvarint(@"hash_10f0811105fc2f93", 0) == 0) {
            return;
        }
        subtype = isdefined(item_bundle.subtype) ? item_bundle.subtype : "<unknown string>";
        rarity = isdefined(item_bundle.rarity) ? "<unknown string>" + item_bundle.rarity : "<unknown string>";
        if (!isdefined(level.var_61e6e1b83a8f3486.weapondevgui[subtype])) {
            level.var_61e6e1b83a8f3486.weapondevgui[subtype] = {refs:[], generated:0};
            devgui::function_b23a59dfb4ca49a1("<unknown string>" + subtype, "<unknown string>" + subtype, &function_acbdc55d88b2babd, 0, 0);
        }
        if (!isdefined(level.var_61e6e1b83a8f3486.weapondevgui[subtype].refs[item_bundle.ref])) {
            level.var_61e6e1b83a8f3486.weapondevgui[subtype].refs[item_bundle.ref] = {rarities:[], generated:0};
        }
        level.var_61e6e1b83a8f3486.weapondevgui[subtype].refs[item_bundle.ref].rarities[rarity] = var_9ec97bdad14a0a5b;
        if (level.var_61e6e1b83a8f3486.weapondevgui[subtype].generated) {
            if (level.var_61e6e1b83a8f3486.weapondevgui[subtype].refs[item_bundle.ref].generated) {
                function_acbdc55d88b2babd([subtype, item_bundle.ref, rarity]);
                return;
            }
            function_acbdc55d88b2babd([subtype, item_bundle.ref]);
        }
    #/
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4648
// Size: 0x72
function private function_2388563f2076e75e(params) {
    /#
        foreach (player in level.players) {
            player function_3a0412b800f3331d(player getcurrentweapon(), int(params[0]));
        }
    #/
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x46c1
// Size: 0x55e
function private function_acbdc55d88b2babd(params) {
    /#
        subtype = params[0];
        item_ref = params[1];
        rarity = params[2];
        if (isdefined(rarity)) {
            rarity_menu = "<unknown string>" + rarity + "<unknown string>";
            switch (rarity) {
            case #"hash_311010bc01bd3a0f":
                rarity_menu = "<unknown string>";
                break;
            case #"hash_31100fbc01bd387c":
                rarity_menu = "<unknown string>";
                break;
            case #"hash_311012bc01bd3d35":
                rarity_menu = "<unknown string>";
                break;
            case #"hash_311011bc01bd3ba2":
                rarity_menu = "<unknown string>";
                break;
            case #"hash_31100cbc01bd33c3":
                rarity_menu = "<unknown string>";
                break;
            case #"hash_31100bbc01bd3230":
                rarity_menu = "<unknown string>";
                break;
            }
            devgui_menu = "<unknown string>" + subtype + "<unknown string>" + item_ref + rarity_menu + "<unknown string>";
            devgui::add_debug_command("<unknown string>" + devgui_menu + "<unknown string>");
            var_9ec97bdad14a0a5b = level.var_61e6e1b83a8f3486.weapondevgui[subtype].refs[item_ref].rarities[rarity];
            devgui::function_b23a59dfb4ca49a1(devgui_menu + "<unknown string>", "<unknown string>" + var_9ec97bdad14a0a5b, &common_item::function_f8162124bbb6ece3, 0, 0);
            devgui::function_b23a59dfb4ca49a1(devgui_menu + "<unknown string>", "<unknown string>" + var_9ec97bdad14a0a5b, &function_d26496ac40030d8a, 0, 1);
            devgui::function_b23a59dfb4ca49a1(devgui_menu + "<unknown string>", "<unknown string>" + var_9ec97bdad14a0a5b, &function_9ea2acdd3cda26a2, 0, 2);
            devgui::function_b23a59dfb4ca49a1(devgui_menu + "<unknown string>", "<unknown string>" + var_9ec97bdad14a0a5b, &function_c6fb716427c35c50, 0, 3);
            devgui::function_b23a59dfb4ca49a1(devgui_menu + "<unknown string>", "<unknown string>" + var_9ec97bdad14a0a5b, &function_c6fb716427c35c50, 0, 4);
            devgui::function_b23a59dfb4ca49a1(devgui_menu + "<unknown string>", "<unknown string>" + var_9ec97bdad14a0a5b, &function_c6fb716427c35c50, 0, 5);
            devgui::function_b23a59dfb4ca49a1(devgui_menu + "<unknown string>", "<unknown string>" + var_9ec97bdad14a0a5b, &function_c6fb716427c35c50, 0, 6);
            devgui::add_debug_command("<unknown string>" + devgui_menu + "<unknown string>");
            level.var_61e6e1b83a8f3486.weapondevgui[subtype].refs[item_ref].rarities[rarity] = undefined;
            return;
        }
        if (isdefined(item_ref)) {
            if (level.var_61e6e1b83a8f3486.weapondevgui[subtype].refs[item_ref].generated) {
                return;
            }
            level.var_61e6e1b83a8f3486.weapondevgui[subtype].refs[item_ref].generated = 1;
            devgui_menu = "<unknown string>" + subtype + "<unknown string>" + item_ref + "<unknown string>";
            devgui::add_debug_command("<unknown string>" + devgui_menu + "<unknown string>");
            foreach (rarity, rarity_info in level.var_61e6e1b83a8f3486.weapondevgui[subtype].refs[item_ref].rarities) {
                rarity_menu = "<unknown string>" + rarity + "<unknown string>";
                switch (rarity) {
                case #"hash_311010bc01bd3a0f":
                    rarity_menu = "<unknown string>";
                    break;
                case #"hash_31100fbc01bd387c":
                    rarity_menu = "<unknown string>";
                    break;
                case #"hash_311012bc01bd3d35":
                    rarity_menu = "<unknown string>";
                    break;
                case #"hash_311011bc01bd3ba2":
                    rarity_menu = "<unknown string>";
                    break;
                case #"hash_31100cbc01bd33c3":
                    rarity_menu = "<unknown string>";
                    break;
                case #"hash_31100bbc01bd3230":
                    function_acbdc55d88b2babd([subtype, item_ref, rarity]);
                    return;
                }
                devgui::function_b23a59dfb4ca49a1(devgui_menu + rarity_menu, "<unknown string>" + subtype + "<unknown string>" + item_ref + "<unknown string>" + rarity, &function_acbdc55d88b2babd, 0, 0);
            }
            devgui::add_debug_command("<unknown string>" + devgui_menu + "<unknown string>");
            return;
        }
        if (level.var_61e6e1b83a8f3486.weapondevgui[subtype].generated) {
            return;
        }
        level.var_61e6e1b83a8f3486.weapondevgui[subtype].generated = 1;
        devgui_menu = "<unknown string>" + subtype + "<unknown string>";
        devgui::add_debug_command("<unknown string>" + devgui_menu + "<unknown string>");
        foreach (item_ref, ref_info in level.var_61e6e1b83a8f3486.weapondevgui[subtype].refs) {
            devgui::function_b23a59dfb4ca49a1(devgui_menu + "<unknown string>" + item_ref, "<unknown string>" + subtype + "<unknown string>" + item_ref, &function_acbdc55d88b2babd, 0, 0);
        }
        devgui::add_debug_command("<unknown string>" + devgui_menu + "<unknown string>");
    #/
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4c26
// Size: 0xa6
function private function_d26496ac40030d8a(params) {
    /#
        itembundle = getscriptbundle(hashcat(%"itemspawnentry:", params[0]));
        item = function_c069cffb4cbd1707(itembundle, (0, 0, 0));
        foreach (player in level.players) {
            player common_item::function_de489fa2ffdb7f2d(item, 0);
        }
    #/
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4cd3
// Size: 0xe2
function private function_9ea2acdd3cda26a2(params) {
    /#
        itembundle = getscriptbundle(hashcat(%"itemspawnentry:", params[0]));
        item = function_c069cffb4cbd1707(itembundle, (0, 0, 0));
        foreach (player in level.players) {
            currentweaponobj = player getcurrentweapon();
            currentweaponindex = player function_2f5e1422c4b1932b(currentweaponobj);
            if (isdefined(currentweaponindex)) {
                player function_ffe562ebbdab55fc(currentweaponindex);
            }
            player inventory_utility::_takeweapon(currentweaponobj);
            player common_item::function_de489fa2ffdb7f2d(item, 0);
        }
    #/
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4dbc
// Size: 0x679
function private function_c6fb716427c35c50(params) {
    /#
        command = params[0];
        var_9ec97bdad14a0a5b = params[1];
        if (command == "<unknown string>") {
            if (isdefined(var_9ec97bdad14a0a5b)) {
                if (isdefined(level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b])) {
                    level.var_61e6e1b83a8f3486.var_47020c5cf3e4b050[level.var_61e6e1b83a8f3486.var_47020c5cf3e4b050.size] = level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].index;
                    level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b] = undefined;
                }
            } else {
                level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822 = [];
                level.var_61e6e1b83a8f3486.var_f06c14a7fd07855 = [];
            }
            return;
        }
        if (command == "<unknown string>") {
            if (isdefined(level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b])) {
                level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].paused = 1;
            }
            return;
        }
        if (command == "<unknown string>") {
            free_index = level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822.size;
            lowest_index = 9999;
            foreach (index in level.var_61e6e1b83a8f3486.var_47020c5cf3e4b050) {
                if (index < lowest_index) {
                    lowest_index = index;
                    free_index = index;
                }
            }
            level.var_61e6e1b83a8f3486.var_47020c5cf3e4b050 = utility::array_remove(level.var_61e6e1b83a8f3486.var_47020c5cf3e4b050, free_index);
            if (!isdefined(level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b])) {
                level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b] = spawnstruct();
            }
            if (!isdefined(level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].iterations)) {
                level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].iterations = 0;
            }
            if (!isdefined(level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].index)) {
                level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].index = free_index;
            }
            if (!isdefined(level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].bundle)) {
                level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].bundle = getscriptbundle(hashcat(%"itemspawnentry:", var_9ec97bdad14a0a5b));
            }
            if (!isdefined(level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].attachments)) {
                level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].attachments = [];
            }
            if (!isdefined(level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].slots)) {
                level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].slots = [];
            }
            level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].paused = 0;
            if (level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].iterations == 0) {
                thread function_a99e8a91fa0b3b39(var_9ec97bdad14a0a5b);
            }
            return;
        }
        if (command == "<unknown string>") {
            if (isdefined(level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b])) {
                total_count = level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].iterations;
                count_str = "<unknown string>" + total_count + (total_count > 9 ? total_count > 99 ? total_count > 999 ? "<unknown string>" : "<unknown string>" : "<unknown string>" : "<unknown string>");
                print(count_str + var_9ec97bdad14a0a5b);
                foreach (slot, attachments in level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].attachments) {
                    slot_count = level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].slots[slot];
                    count_str = "<unknown string>" + slot_count + (slot_count > 9 ? slot_count > 99 ? slot_count > 999 ? "<unknown string>" : "<unknown string>" : "<unknown string>" : "<unknown string>");
                    percent_str = "<unknown string>" + 100 * float(slot_count) / float(total_count) + "<unknown string>";
                    print(count_str + slot + percent_str);
                    foreach (attachment, att_count in level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].attachments[slot]) {
                        count_str = "<unknown string>" + att_count + (att_count > 9 ? att_count > 99 ? att_count > 999 ? "<unknown string>" : "<unknown string>" : "<unknown string>" : "<unknown string>");
                        percent_str = "<unknown string>" + 100 * float(att_count) / float(slot_count) + "<unknown string>";
                        print(count_str + attachment + percent_str);
                    }
                }
            }
        }
    #/
}

// Namespace namespace_736197e4d378b91b / namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x543c
// Size: 0x694
function private function_a99e8a91fa0b3b39(var_9ec97bdad14a0a5b) {
    /#
        while (true) {
            if (!isdefined(level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b])) {
                return;
            }
            if (!istrue(level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].paused)) {
                level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].iterations = level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].iterations + 1;
                var_aa3d2a34a5a7ab67 = function_4a20d0b8693d4656(level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].bundle);
                foreach (attachment in var_aa3d2a34a5a7ab67) {
                    slot = function_4add228b999c26aa(level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].bundle.baseweapon, attachment);
                    if (!isdefined(level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].attachments[slot])) {
                        level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].attachments[slot] = [];
                    }
                    if (isdefined(level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].slots[slot])) {
                        level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].slots[slot] = level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].slots[slot] + 1;
                    } else {
                        level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].slots[slot] = 1;
                    }
                    if (isdefined(level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].attachments[slot][attachment])) {
                        level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].attachments[slot][attachment] = level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].attachments[slot][attachment] + 1;
                        continue;
                    }
                    level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].attachments[slot][attachment] = 1;
                }
            }
            if (getdvarint(@"hash_8b93e6e651c920bb", 1)) {
                scale = getdvarfloat(@"hash_aac79e2ab4af9ee7", 1);
                space = int(8 * scale);
                line_height = int(12 * scale);
                x = getdvarint(@"hash_e981f2369f02b682", 350);
                x = x + 350 * scale * level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].index;
                y = getdvarint(@"hash_21adc9eb44b3d7ed", 20);
                frames = int(1000 * getdvarfloat(@"hash_33348a07cb3e791b", 0.1) / function_676cfe2ab64ea758()) + 1;
                total_count = level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].iterations;
                printtoscreen2d(x, y, "<unknown string>" + total_count, (1, 1, 1), scale, frames);
                printtoscreen2d(x + 4 * space, y, "<unknown string>", (1, 1, 1), scale, frames);
                printtoscreen2d(x + 5 * space, y, var_9ec97bdad14a0a5b, (1, 1, 1), scale, frames);
                y = y + line_height;
                foreach (slot, attachments in level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].attachments) {
                    slot_count = level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].slots[slot];
                    percent = "<unknown string>" + 100 * float(slot_count) / float(total_count) + "<unknown string>";
                    printtoscreen2d(x, y, "<unknown string>" + slot_count, (1, 1, 1), scale, frames);
                    printtoscreen2d(x + 5 * space, y, "<unknown string>", (1, 1, 1), scale, frames);
                    printtoscreen2d(x + 6 * space, y, slot + percent, (1, 1, 1), scale, frames);
                    y = y + line_height;
                    foreach (attachment, att_count in level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].attachments[slot]) {
                        percent = "<unknown string>" + 100 * float(att_count) / float(slot_count) + "<unknown string>";
                        printtoscreen2d(x, y, "<unknown string>" + att_count, (1, 1, 1), scale, frames);
                        printtoscreen2d(x + 6 * space, y, "<unknown string>", (1, 1, 1), scale, frames);
                        printtoscreen2d(x + 7 * space, y, attachment + percent, (1, 1, 1), scale, frames);
                        y = y + line_height;
                    }
                }
            }
            wait(getdvarfloat(@"hash_33348a07cb3e791b", 0.1));
        }
    #/
}

