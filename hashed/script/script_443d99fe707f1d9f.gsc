// mwiii decomp prototype
#using script_4c770a9a4ad7659c;
#using script_38eb8f4be20d54f4;
#using script_5032ed8da1128621;
#using script_16ea1b94f0f381b3;
#using script_3b64eb40368c1450;
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

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
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
    level.var_986acb83cc29ed77.var_37d10554e6936847 = [];
    level.var_986acb83cc29ed77.var_b8ba13385a2bb5 = strtok(getdvar(@"hash_56243d40ec08cee4", ""), ",");
    level.var_986acb83cc29ed77.var_feea62f594ad9284 = getdvarint(@"hash_ac1ee90233495500", 0);
    /#
        thread function_95cd4c99989f7140();
    #/
}

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa21
// Size: 0x16
function private function_88d309900aaee871(params) {
    self.var_dd3d589a27a0b26 = [];
}

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa3e
// Size: 0x2e1
function private function_94cbe3c6bcb49cb1(params) {
    if (namespace_2b1145f62aa835b8::function_61575e37b9200c0d() && isdefined(self.revivecount)) {
        var_3ebaf09514354f49 = self.primaryweapons;
        var_958c14c8fe2b530b = [];
        foreach (weapon in var_3ebaf09514354f49) {
            if (!isundefinedweapon(weapon)) {
                var_b3a62eaaf1a88c6a = spawnstruct();
                var_b3a62eaaf1a88c6a.clipammo = self getweaponammoclip(weapon);
                var_b3a62eaaf1a88c6a.stockammo = self getweaponammostock(weapon);
                if (weapon.hasalternate) {
                    altweapon = weapon getaltweapon();
                    var_b3a62eaaf1a88c6a.altclipammo = self getweaponammoclip(altweapon);
                    var_b3a62eaaf1a88c6a.altstockammo = self getweaponammostock(altweapon);
                }
                var_958c14c8fe2b530b[var_958c14c8fe2b530b.size] = var_b3a62eaaf1a88c6a;
                namespace_8b68a49ebf57ab74::_takeweapon(weapon);
            }
        }
        maxindex = 0;
        var_cd77ac1b769e9c52 = 0;
        var_be1684f3e95e1024 = [];
        var_e9bd5ef4af54882a = [];
        var_6e7f8de3c175173c = 0;
        while (var_6e7f8de3c175173c < var_3ebaf09514354f49.size) {
            var_5db61256ca3c39bd = 0;
            while (var_5db61256ca3c39bd < self.var_dd3d589a27a0b26.size) {
                if (var_3ebaf09514354f49[var_6e7f8de3c175173c].basename == self.var_dd3d589a27a0b26[var_5db61256ca3c39bd].baseweapon) {
                    var_be1684f3e95e1024[var_5db61256ca3c39bd] = var_3ebaf09514354f49[var_6e7f8de3c175173c];
                    var_e9bd5ef4af54882a[var_5db61256ca3c39bd] = var_958c14c8fe2b530b[var_6e7f8de3c175173c];
                    if (var_5db61256ca3c39bd > maxindex) {
                        maxindex = var_5db61256ca3c39bd;
                    }
                    if (var_6e7f8de3c175173c == 0) {
                        var_cd77ac1b769e9c52 = var_5db61256ca3c39bd;
                    }
                    break;
                }
                var_5db61256ca3c39bd = var_5db61256ca3c39bd + 1;
            }
            var_6e7f8de3c175173c = var_6e7f8de3c175173c + 1;
        }
        i = 0;
        while (i <= maxindex) {
            weapon = var_be1684f3e95e1024[i];
            var_b3a62eaaf1a88c6a = var_e9bd5ef4af54882a[i];
            if (isundefinedweapon(weapon)) {
                namespace_8b68a49ebf57ab74::_giveweapon(makeweapon("iw9_me_fists_mp"), undefined, undefined, 1);
            } else {
                namespace_8b68a49ebf57ab74::_giveweapon(weapon, undefined, undefined, 1);
                self setweaponammoclip(weapon, var_b3a62eaaf1a88c6a.clipammo);
                self setweaponammostock(weapon, var_b3a62eaaf1a88c6a.stockammo);
                if (weapon.hasalternate) {
                    altweapon = weapon getaltweapon();
                    self setweaponammoclip(altweapon, var_b3a62eaaf1a88c6a.altclipammo);
                    self setweaponammostock(altweapon, var_b3a62eaaf1a88c6a.altstockammo);
                }
            }
            i = i + 1;
        }
        var_cd77ac1b769e9c52 = var_cd77ac1b769e9c52 >= self.primaryweapons.size ? self.primaryweapons.size - 1 : var_cd77ac1b769e9c52;
        namespace_8b68a49ebf57ab74::_switchtoweapon(self.primaryweapons[var_cd77ac1b769e9c52]);
        self setspawnweapon(self.primaryweapons[var_cd77ac1b769e9c52]);
    }
}

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd26
// Size: 0x13
function private function_9942fa0e68e83f4c(params) {
    function_dcc83e7e97a52bf4();
}

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xd40
// Size: 0x146
function private function_dcc83e7e97a52bf4(weapon) {
    if (function_fe8f110892c02b38("ui_primary_weapon_rarity")) {
        primaryweaponobj = function_2aeaf88105d3b617(0);
        if (isdefined(primaryweaponobj)) {
            var_ec917ad57da8a00e = function_75e73212bbe447d9(primaryweaponobj);
            self setclientomnvar("ui_primary_weapon_rarity", var_ec917ad57da8a00e);
        } else {
            self setclientomnvar("ui_primary_weapon_rarity", 0);
        }
    }
    if (function_fe8f110892c02b38("ui_secondary_weapon_rarity")) {
        secondaryweaponobj = function_2aeaf88105d3b617(1);
        if (isdefined(secondaryweaponobj)) {
            var_e986f3662a9b0e4e = function_75e73212bbe447d9(secondaryweaponobj);
            self setclientomnvar("ui_secondary_weapon_rarity", var_e986f3662a9b0e4e);
        } else {
            self setclientomnvar("ui_secondary_weapon_rarity", 0);
        }
    }
    if (function_fe8f110892c02b38("ui_current_weapon_tier")) {
        weapon = isdefined(weapon) ? self getcurrentweapon() : weapon;
        if (isnullweapon(weapon) || weapon.basename == "iw9_me_fists_mp" || weapon.basename == "iw8_gunless") {
            self setclientomnvar("ui_current_weapon_tier", 0);
            return;
        }
        n_rarity = function_75e73212bbe447d9(weapon);
        if (isdefined(n_rarity)) {
            self setclientomnvar("ui_current_weapon_tier", n_rarity);
        } else {
            self setclientomnvar("ui_current_weapon_tier", 0);
        }
    }
}

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe8d
// Size: 0xd1
function function_f4e4fc18f92ec23b(lootid) {
    var_12c0f53a71c9bcc8 = function_64ccc54bdbae5cf6(lootid);
    if (isdefined(var_12c0f53a71c9bcc8) && var_12c0f53a71c9bcc8 != 0) {
        baseweapon = function_1cc3fd00b6ccc3ba(lootid);
        if (isdefined(baseweapon)) {
            if (isdefined(level.var_986acb83cc29ed77.var_37d10554e6936847[baseweapon]) && isdefined(level.var_986acb83cc29ed77.var_37d10554e6936847[baseweapon].bundles[var_12c0f53a71c9bcc8])) {
                return level.var_986acb83cc29ed77.var_37d10554e6936847[baseweapon].bundles[var_12c0f53a71c9bcc8][0];
            } else if (weaponinventorytype(baseweapon) == "offhand") {
                return namespace_f808ba0ae0debcf5::function_62fa129f91896347(lootid);
            }
        }
    }
    return level.var_986acb83cc29ed77.var_b09fc2aeb718c263[lootid];
}

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf66
// Size: 0x6b6
function function_b5be5fff64626153(var_fbe755f0978c0369) {
    itembundle = function_50f8a8f765bad85e("itemspawnentry:" + var_fbe755f0978c0369, [0:#"baseweapon", 1:#"weaponblueprint", 2:#"ref", 3:#"rarity", 4:#"hash_b9a3752dc7a3d626", 5:#"scriptable", 6:#"hash_2eb67660fdfdf8a7", 7:#"hash_ac804a3619667e5a"]);
    if (!isdefined(itembundle.baseweapon)) {
        return;
    }
    if (!isdefined(level.var_986acb83cc29ed77.var_37d10554e6936847[itembundle.baseweapon])) {
        level.var_986acb83cc29ed77.var_37d10554e6936847[itembundle.baseweapon] = {bundles:[]};
    }
    var_12c0f53a71c9bcc8 = 0;
    if (isdefined(itembundle.weaponblueprint) && isdefined(itembundle.ref)) {
        var_2715b66d7222159b = namespace_49e179ec476603d6::function_6d15e119c2779a93(itembundle);
        if (isdefined(var_2715b66d7222159b)) {
            var_12c0f53a71c9bcc8 = function_64ccc54bdbae5cf6(var_2715b66d7222159b);
            if (!isdefined(var_12c0f53a71c9bcc8)) {
                /#
                    assertmsg("CommonItemWeaponERROR: The item def [" + var_fbe755f0978c0369 + "] specifies blueprint weapon [" + function_f28fd66285fa2c9(itembundle.weaponblueprint) + "] which is not a blueprint weapon on the specified base weapon [" + itembundle.baseweapon + "].");
                #/
                return;
            }
        }
    }
    rarity = isdefined(itembundle.rarity) ? 0 : itembundle.rarity;
    if (!isdefined(level.var_986acb83cc29ed77.var_37d10554e6936847[itembundle.baseweapon].bundles[var_12c0f53a71c9bcc8])) {
        level.var_986acb83cc29ed77.var_37d10554e6936847[itembundle.baseweapon].bundles[var_12c0f53a71c9bcc8] = [];
    }
    if (!isdefined(level.var_986acb83cc29ed77.var_37d10554e6936847[itembundle.baseweapon].bundles[var_12c0f53a71c9bcc8][rarity])) {
        level.var_986acb83cc29ed77.var_37d10554e6936847[itembundle.baseweapon].bundles[var_12c0f53a71c9bcc8][rarity] = var_fbe755f0978c0369;
    } else {
        /#
            print("CommonItemERROR: Custom weapon scriptable could not be spawned by SpawnCustomWeaponScriptable()." + function_3c8848a3a11b2553(level.var_986acb83cc29ed77.var_37d10554e6936847[itembundle.baseweapon].bundles[var_12c0f53a71c9bcc8][rarity]) + "<unknown string>" + var_fbe755f0978c0369 + "<unknown string>" + function_3c8848a3a11b2553(itembundle.baseweapon) + "<unknown string>" + rarity + "<unknown string>");
        #/
    }
    if (!istrue(itembundle.var_5a5e50bc261c907a)) {
        if (!isdefined(level.var_986acb83cc29ed77.var_37d10554e6936847[itembundle.baseweapon].scriptable)) {
            level.var_986acb83cc29ed77.var_37d10554e6936847[itembundle.baseweapon].scriptable = itembundle.scriptable;
            /#
                level.var_986acb83cc29ed77.var_37d10554e6936847[itembundle.baseweapon].var_35799804650f8bea = var_fbe755f0978c0369;
            #/
        } else {
            /#
                print("CommonItemERROR: Custom weapon scriptable could not be spawned by SpawnCustomWeaponScriptable()." + function_3c8848a3a11b2553(level.var_986acb83cc29ed77.var_37d10554e6936847[itembundle.baseweapon].var_35799804650f8bea) + "<unknown string>" + var_fbe755f0978c0369 + "<unknown string>" + function_3c8848a3a11b2553(itembundle.baseweapon) + "<unknown string>" + rarity + "<unknown string>");
            #/
        }
        if (isdefined(itembundle.var_64a5f9f552b5c973) || isdefined(itembundle.var_89616f2bce6b4ee6)) {
            if (!isdefined(level.var_986acb83cc29ed77.var_37d10554e6936847[itembundle.baseweapon].transform)) {
                level.var_986acb83cc29ed77.var_37d10554e6936847[itembundle.baseweapon].transform = spawnstruct();
                if (isdefined(itembundle.var_64a5f9f552b5c973)) {
                    level.var_986acb83cc29ed77.var_37d10554e6936847[itembundle.baseweapon].transform.translation = (isdefined(itembundle.var_64a5f9f552b5c973.x) ? 0 : itembundle.var_64a5f9f552b5c973.x, isdefined(itembundle.var_64a5f9f552b5c973.y) ? 0 : itembundle.var_64a5f9f552b5c973.y, isdefined(itembundle.var_64a5f9f552b5c973.z) ? 0 : itembundle.var_64a5f9f552b5c973.z);
                }
                if (isdefined(itembundle.var_89616f2bce6b4ee6)) {
                    level.var_986acb83cc29ed77.var_37d10554e6936847[itembundle.baseweapon].transform.rotation = (isdefined(itembundle.var_89616f2bce6b4ee6.x) ? 0 : itembundle.var_89616f2bce6b4ee6.x, isdefined(itembundle.var_89616f2bce6b4ee6.y) ? 0 : itembundle.var_89616f2bce6b4ee6.y, isdefined(itembundle.var_89616f2bce6b4ee6.z) ? 0 : itembundle.var_89616f2bce6b4ee6.z);
                }
                /#
                    level.var_986acb83cc29ed77.var_37d10554e6936847[itembundle.baseweapon].transform.bundle = var_fbe755f0978c0369;
                #/
            } else {
                /#
                    print("CommonItemERROR: Custom weapon scriptable could not be spawned by SpawnCustomWeaponScriptable()." + function_3c8848a3a11b2553(level.var_986acb83cc29ed77.var_37d10554e6936847[itembundle.baseweapon].transform.bundle) + "<unknown string>" + function_3c8848a3a11b2553(var_fbe755f0978c0369) + "<unknown string>" + function_3c8848a3a11b2553(itembundle.baseweapon) + "<unknown string>");
                #/
            }
        }
    }
}

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1623
// Size: 0xa3
function function_70024d27cb2942f5(itembundle, item, var_b2635db617b09abd, var_8bd8fa2792aa0511) {
    if (!val::get("weapon_pickup")) {
        return 0;
    }
    if (istrue(self.insertingarmorplate)) {
        return 0;
    }
    currentweapon = self getcurrentweapon();
    if (istrue(namespace_e0ee43ef2dddadaa::iskillstreakweapon(currentweapon))) {
        return 0;
    }
    var_4781343684fdc257 = function_7d4684238ed31570(itembundle, item);
    if (function_a50a7be98d81e4fd()) {
        var_cc7e6ebb30ea246c = function_e2b4c63cab73c1f1();
        if (isdefined(var_cc7e6ebb30ea246c) && issameweapon(var_4781343684fdc257, var_cc7e6ebb30ea246c)) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16ce
// Size: 0x2e
function function_b9257704034d2b80(itembundle, item, var_b2635db617b09abd, var_8bd8fa2792aa0511) {
    return function_70024d27cb2942f5(itembundle, item, var_b2635db617b09abd, var_8bd8fa2792aa0511);
}

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1704
// Size: 0x5ad
function function_a8315d7427925f00(itembundle, item, var_b2635db617b09abd) {
    var_66b3db972ac1531e = undefined;
    if (isdefined(item.weaponobj)) {
        var_66b3db972ac1531e = item.weaponobj;
    } else if (isdefined(item.var_4f74f0aef2b2a8bf)) {
        var_66b3db972ac1531e = function_7d4684238ed31570(itembundle, item);
    } else {
        var_66b3db972ac1531e = function_777497d9d98fa0b8(itembundle);
    }
    if (!isdefined(var_66b3db972ac1531e)) {
        return;
    }
    var_d51b60896ba648e3 = 0;
    if (isdefined(item.var_5a57e79ae8d5ae67)) {
        var_d51b60896ba648e3 = item.var_5a57e79ae8d5ae67;
    } else {
        clipammo = function_b8bfea9514c89a77(item.count);
        var_a7be10e54a3a4b99 = weaponclipsize(var_66b3db972ac1531e);
        if (clipammo > var_a7be10e54a3a4b99) {
            var_d51b60896ba648e3 = clipammo - var_a7be10e54a3a4b99;
        }
    }
    if (function_d4246bdfe5eb28b5() > 1) {
        var_57acadc40b2f0a8 = function_90aed8ec6b3a7796(var_66b3db972ac1531e);
        var_ba5943944b6cba2f = var_57acadc40b2f0a8[1];
        var_a0bbe39439e5ed05 = var_57acadc40b2f0a8[0];
        if (isdefined(var_ba5943944b6cba2f) && self hasweapon(var_ba5943944b6cba2f)) {
            var_fd38dfc4e3653908 = undefined;
            if (namespace_dc2e59577d3a271f::has_ammo_mod(var_ba5943944b6cba2f)) {
                var_fd38dfc4e3653908 = namespace_dc2e59577d3a271f::get_ammo_mod_name(var_ba5943944b6cba2f);
                namespace_dc2e59577d3a271f::function_b4da81e43557ada1(var_ba5943944b6cba2f);
            }
            var_b4e4346fea6a4cfd = namespace_a4ff02beedc1bce8::get_pap_level(var_ba5943944b6cba2f);
            namespace_a4ff02beedc1bce8::function_2756cd1449650568(var_ba5943944b6cba2f, undefined);
            if (var_ba5943944b6cba2f.basename != "iw9_me_fists_mp") {
                var_e4bca3d2e20844aa = self getweaponammostock(var_ba5943944b6cba2f);
                var_e37e1e658de3f31c = getweaponammopoolname(var_ba5943944b6cba2f);
                var_96c1ababaeb1c163 = getweaponammopoolname(var_66b3db972ac1531e);
                if (var_e37e1e658de3f31c == var_96c1ababaeb1c163 && var_e4bca3d2e20844aa > 0) {
                    var_57acbdc40b2f2db = function_f3045c1e8c70d171(var_e4bca3d2e20844aa, var_66b3db972ac1531e, var_d51b60896ba648e3);
                    var_d51b60896ba648e3 = var_57acbdc40b2f2db[1];
                    var_e4bca3d2e20844aa = var_57acbdc40b2f2db[0];
                }
                var_2b7331baea302df8 = spawnstruct();
                var_2b7331baea302df8.var_e0116c5b8d303105 = self getweaponammoclip(var_ba5943944b6cba2f);
                var_2b7331baea302df8.var_734357a0b88e3a30 = self getweaponammoclip(var_ba5943944b6cba2f, "left");
                var_2b7331baea302df8.var_9bfd50804dd2553c = function_aedc908c4a79d05e(var_ba5943944b6cba2f) ? 0 : self getweaponammoclip(var_ba5943944b6cba2f getaltweapon());
                var_2b7331baea302df8.ammostock = var_e4bca3d2e20844aa;
                var_2b7331baea302df8.ammomod = var_fd38dfc4e3653908;
                var_2b7331baea302df8.var_91a6795b9c75d0e4 = var_b4e4346fea6a4cfd;
                var_2b7331baea302df8.rarity = function_75e73212bbe447d9(var_ba5943944b6cba2f);
                var_2b7331baea302df8.camo = var_ba5943944b6cba2f.camo;
                var_2b7331baea302df8.reticle = var_ba5943944b6cba2f.reticle;
                if (isdefined(self.var_c37e65eb7cc773eb)) {
                    var_2b7331baea302df8.var_dbd4f3fc1d4f4d53 = self.var_c37e65eb7cc773eb[var_ba5943944b6cba2f.var_9d7facbe889e667c];
                    self.var_c37e65eb7cc773eb[var_ba5943944b6cba2f.var_9d7facbe889e667c] = undefined;
                }
                if (isdefined(var_ba5943944b6cba2f.stickerslot0) && var_ba5943944b6cba2f.stickerslot0 != "none") {
                    var_2b7331baea302df8.stickerslot0 = var_ba5943944b6cba2f.stickerslot0;
                }
                if (isdefined(var_ba5943944b6cba2f.stickerslot1) && var_ba5943944b6cba2f.stickerslot1 != "none") {
                    var_2b7331baea302df8.stickerslot1 = var_ba5943944b6cba2f.stickerslot1;
                }
                if (isdefined(var_ba5943944b6cba2f.stickerslot2) && var_ba5943944b6cba2f.stickerslot2 != "none") {
                    var_2b7331baea302df8.stickerslot2 = var_ba5943944b6cba2f.stickerslot2;
                }
                if (isdefined(var_ba5943944b6cba2f.stickerslot3) && var_ba5943944b6cba2f.stickerslot3 != "none") {
                    var_2b7331baea302df8.stickerslot3 = var_ba5943944b6cba2f.stickerslot3;
                }
                if (isdefined(var_ba5943944b6cba2f.var_b39ac546cc8621f8) && var_ba5943944b6cba2f.var_b39ac546cc8621f8 != "none") {
                    var_2b7331baea302df8.var_b39ac546cc8621f8 = var_ba5943944b6cba2f.var_b39ac546cc8621f8;
                }
                function_23a822141e1e87f1(var_ba5943944b6cba2f, var_2b7331baea302df8);
            }
            function_ffe562ebbdab55fc(var_a0bbe39439e5ed05);
            _takeweapon(var_ba5943944b6cba2f);
        } else {
            /#
                assertmsg("CommonItemERROR: While attempting to use an item of base weapon type [" + var_66b3db972ac1531e.basename + "], a valid weapon to replace could not be retireved. Weapon item will not be used.");
            #/
            return;
        }
    }
    if (istrue(level.var_bfa98c9dd6edb929)) {
        if (isdefined(item.var_2632b2da60d34841)) {
            namespace_dc2e59577d3a271f::function_6c40f58b29a952a9(var_66b3db972ac1531e, item.var_2632b2da60d34841);
        }
    }
    if (isdefined(item.var_dbd4f3fc1d4f4d53)) {
        self.var_c37e65eb7cc773eb[var_66b3db972ac1531e.var_9d7facbe889e667c] = item.var_dbd4f3fc1d4f4d53;
    }
    if (isdefined(item.var_29a8ba8c9dd43fd2) && item.var_29a8ba8c9dd43fd2 > 0) {
        var_66b3db972ac1531e = namespace_a4ff02beedc1bce8::function_a0537467c5341047(var_66b3db972ac1531e, item.var_29a8ba8c9dd43fd2);
        namespace_a4ff02beedc1bce8::function_2756cd1449650568(var_66b3db972ac1531e, item.var_29a8ba8c9dd43fd2);
    }
    function_b2d47c265afcb72a(var_66b3db972ac1531e, item.count, var_d51b60896ba648e3);
    primaryweaponindex = function_2f5e1422c4b1932b(var_66b3db972ac1531e);
    if (isdefined(primaryweaponindex)) {
        if (isdefined(item.var_4f74f0aef2b2a8bf)) {
            self.var_dd3d589a27a0b26[primaryweaponindex] = item.var_4f74f0aef2b2a8bf;
        } else {
            var_4f74f0aef2b2a8bf = function_b5f358d46f69b20e(var_66b3db972ac1531e, itembundle.rarity, primaryweaponindex);
            var_4f74f0aef2b2a8bf.rarity = itembundle.rarity;
        }
    }
    return [0:0, 1:var_66b3db972ac1531e];
}

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
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
    return [0:itembundle, 1:quantity, 2:components];
}

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d59
// Size: 0x359
function function_d5143d7900e7160a(weapindex) {
    weapon = function_2aeaf88105d3b617(weapindex);
    if (!isdefined(weapon) || isnullweapon(weapon) || weapons::isfistweapon(weapon)) {
        return 0;
    }
    var_fd38dfc4e3653908 = undefined;
    if (namespace_dc2e59577d3a271f::has_ammo_mod(weapon)) {
        var_fd38dfc4e3653908 = namespace_dc2e59577d3a271f::get_ammo_mod_name(weapon);
        namespace_dc2e59577d3a271f::function_b4da81e43557ada1(weapon);
    }
    var_b4e4346fea6a4cfd = namespace_a4ff02beedc1bce8::get_pap_level(weapon);
    namespace_a4ff02beedc1bce8::function_2756cd1449650568(weapon, undefined);
    var_2b7331baea302df8 = spawnstruct();
    var_2b7331baea302df8.var_e0116c5b8d303105 = self getweaponammoclip(weapon);
    var_2b7331baea302df8.var_734357a0b88e3a30 = self getweaponammoclip(weapon, "left");
    var_2b7331baea302df8.var_9bfd50804dd2553c = function_aedc908c4a79d05e(weapon) ? 0 : self getweaponammoclip(weapon getaltweapon());
    var_2b7331baea302df8.ammostock = self getweaponammostock(weapon);
    var_2b7331baea302df8.ammomod = var_fd38dfc4e3653908;
    var_2b7331baea302df8.var_91a6795b9c75d0e4 = var_b4e4346fea6a4cfd;
    var_2b7331baea302df8.rarity = function_75e73212bbe447d9(weapon);
    var_2b7331baea302df8.camo = weapon.camo;
    var_2b7331baea302df8.reticle = weapon.reticle;
    if (isdefined(self.var_c37e65eb7cc773eb)) {
        var_2b7331baea302df8.var_dbd4f3fc1d4f4d53 = self.var_c37e65eb7cc773eb[weapon.var_9d7facbe889e667c];
        self.var_c37e65eb7cc773eb[weapon.var_9d7facbe889e667c] = undefined;
    }
    if (isdefined(weapon.stickerslot0) && weapon.stickerslot0 != "none") {
        var_2b7331baea302df8.stickerslot0 = weapon.stickerslot0;
    }
    if (isdefined(weapon.stickerslot1) && weapon.stickerslot1 != "none") {
        var_2b7331baea302df8.stickerslot1 = weapon.stickerslot1;
    }
    if (isdefined(weapon.stickerslot2) && weapon.stickerslot2 != "none") {
        var_2b7331baea302df8.stickerslot2 = weapon.stickerslot2;
    }
    if (isdefined(weapon.stickerslot3) && weapon.stickerslot3 != "none") {
        var_2b7331baea302df8.stickerslot3 = weapon.stickerslot3;
    }
    if (isdefined(weapon.var_b39ac546cc8621f8) && weapon.var_b39ac546cc8621f8 != "none") {
        var_2b7331baea302df8.var_b39ac546cc8621f8 = weapon.var_b39ac546cc8621f8;
    }
    function_23a822141e1e87f1(weapon, var_2b7331baea302df8);
    if (weapindex == 2) {
        function_bd059d6c2e0ece90();
        return 1;
    }
    function_ffe562ebbdab55fc(weapindex);
    _takeweapon(weapon);
    if (function_d4246bdfe5eb28b5() < 2) {
        var_3184653fdf31db44 = makeweapon("iw9_me_fists_mp");
        self giveweapon(var_3184653fdf31db44);
        var_d5adafa612d0ba43 = ter_op(weapindex == 1, 0, 1);
        var_929e81472980ec28 = function_2aeaf88105d3b617(var_d5adafa612d0ba43);
        if (!isdefined(var_929e81472980ec28)) {
            var_929e81472980ec28 = var_3184653fdf31db44;
        }
        _switchtoweaponimmediate(var_929e81472980ec28);
    }
    return 1;
}

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
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

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
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
    var_5b3f7d686c59ab97 = var_31b36738ff4eacd;
    if (isdefined(stockammo)) {
        var_5b3f7d686c59ab97 = stockammo;
    }
    var_5b3f7d686c59ab97 = int(min(var_5b3f7d686c59ab97, weaponmaxammo(weaponname)));
    self setweaponammostock(weaponname, var_5b3f7d686c59ab97);
    if (weaponobj.hasalternate && !function_aedc908c4a79d05e(weaponobj)) {
        var_a0f049fa949f48e9 = weaponobj getaltweapon();
        var_dfd1fd5d26dd4e12 = function_8fd389f931f45c66(ammocount);
        var_13e1d3280df9e6e7 = weaponclipsize(var_a0f049fa949f48e9);
        if (!isdefined(var_dfd1fd5d26dd4e12) || var_dfd1fd5d26dd4e12 > var_13e1d3280df9e6e7) {
            var_dfd1fd5d26dd4e12 = var_13e1d3280df9e6e7;
        }
        self setweaponammoclip(var_a0f049fa949f48e9, var_dfd1fd5d26dd4e12);
    }
    self assignweaponprimaryslot(weaponname);
    _switchtoweaponimmediate(weaponname);
}

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22f9
// Size: 0x229
function function_23a822141e1e87f1(weaponobj, var_2b7331baea302df8) {
    var_4f74f0aef2b2a8bf = function_b5f358d46f69b20e(weaponobj, var_2b7331baea302df8.rarity);
    if (!isdefined(var_4f74f0aef2b2a8bf)) {
        return undefined;
    }
    dropstruct = function_59a2e61d79065dca();
    dropstruct.var_8ee5ee589d379b1 = -30;
    dropstruct.var_91170e589f9e8ff = 30;
    dropstruct.var_82839e7264d5d15e = -30;
    dropstruct.var_8260b07264afb13c = 30;
    var_cb4fad49263e20c4 = function_49b86047c8a8b228(dropstruct, self.origin, self.angles, self);
    item = function_6cf4b48de9a4bc39(weaponobj, var_2b7331baea302df8, var_cb4fad49263e20c4.origin, var_cb4fad49263e20c4.angles, undefined, undefined, var_cb4fad49263e20c4.payload);
    if (!isdefined(item)) {
        return undefined;
    }
    if (isdefined(var_4f74f0aef2b2a8bf.var_fbe755f0978c0369)) {
        itembundle = getscriptbundle("itemspawnentry:" + var_4f74f0aef2b2a8bf.var_fbe755f0978c0369);
        lootid = function_6d15e119c2779a93(itembundle);
        self dlog_recordplayerevent("dlog_event_player_common_item", [0:"dropped", 1:lootid, 2:"stowed", 3:0, 4:"equipped", 5:0, 6:"bought", 7:0, 8:"sold", 9:0, 10:"type", 11:itembundle.type, 12:"from_cache", 13:0, 14:"from_rift_reward", 15:0]);
        function_43272b9595268864(itembundle, var_cb4fad49263e20c4.origin);
    }
    item.var_4f74f0aef2b2a8bf = var_4f74f0aef2b2a8bf;
    params = spawnstruct();
    params.item = item;
    params.var_fbe755f0978c0369 = item.var_4f74f0aef2b2a8bf.var_fbe755f0978c0369;
    callback::callback("player_item_drop", params);
    return item;
}

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x252a
// Size: 0x222
function function_c069cffb4cbd1707(itembundle, origin, angles, var_1d3bb1a1505a7fc7, var_763c4bec5399cf2e, var_14c85b39207719b8, var_57266f5ca6feebd7, var_d397bc63bc6b67b0, var_d397bf63bc6b6e49) {
    baseweapon = itembundle.baseweapon;
    if (!isdefined(baseweapon)) {
        return undefined;
    }
    weaponobj = function_777497d9d98fa0b8(itembundle);
    var_2b7331baea302df8 = spawnstruct();
    var_2b7331baea302df8.var_e0116c5b8d303105 = weaponclipsize(weaponobj);
    var_2b7331baea302df8.var_734357a0b88e3a30 = weaponclipsize(weaponobj);
    var_2b7331baea302df8.var_9bfd50804dd2553c = function_aedc908c4a79d05e(weaponobj) ? 0 : weaponclipsize(weaponobj getaltweapon());
    var_2b7331baea302df8.ammostock = weaponmaxammo(weaponobj);
    var_2b7331baea302df8.ammomod = var_1d3bb1a1505a7fc7;
    var_2b7331baea302df8.var_91a6795b9c75d0e4 = var_763c4bec5399cf2e;
    var_2b7331baea302df8.rarity = itembundle.rarity;
    angles = isdefined(angles) ? (0, 0, 0) : angles;
    item = function_6cf4b48de9a4bc39(weaponobj, var_2b7331baea302df8, origin, angles, var_14c85b39207719b8, var_57266f5ca6feebd7, var_d397bc63bc6b67b0, var_d397bf63bc6b6e49);
    if (!isdefined(item)) {
        return undefined;
    }
    function_43272b9595268864(itembundle, origin);
    item.var_4f74f0aef2b2a8bf = spawnstruct();
    item.var_4f74f0aef2b2a8bf.var_fbe755f0978c0369 = function_46423e80a0fa8f2(baseweapon, itembundle.rarity, weaponobj.variantid);
    item.var_4f74f0aef2b2a8bf.attachments = weaponobj.attachments;
    item.var_4f74f0aef2b2a8bf.rarity = itembundle.rarity;
    item.var_4f74f0aef2b2a8bf.baseweapon = baseweapon;
    item.var_4f74f0aef2b2a8bf.variantid = weaponobj.variantid;
    return item;
}

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2754
// Size: 0x28f
function function_6cf4b48de9a4bc39(weaponobj, var_2b7331baea302df8, origin, angles, nodrop, var_66053ca426d82316, var_d397bc63bc6b67b0, var_d397bf63bc6b6e49) {
    baseweapon = weaponobj.basename;
    if (!isdefined(baseweapon)) {
        return undefined;
    }
    var_37440ffb722076d8 = function_5898445f4e50bcdb(baseweapon);
    if (isdefined(var_37440ffb722076d8)) {
        if (isdefined(var_37440ffb722076d8.translation)) {
            origin = origin + var_37440ffb722076d8.translation;
        }
        if (isdefined(var_37440ffb722076d8.rotation)) {
            angles = angles + var_37440ffb722076d8.rotation;
        }
    }
    var_2f44e3b98c77c7cc = weapon::function_6faaa2882e3d2e4e(weaponobj) ? %"hash_730e20a5158e3a0d" : %"hash_15004fe9e3a7c88a";
    var_81411b434bf45184 = [0:#"hash_371d996051b67a4a", 1:isdefined(var_2b7331baea302df8.rarity) ? 0 : var_2b7331baea302df8.rarity, 2:0, 3:0, 4:0];
    item = spawncustomweaponscriptable(var_2f44e3b98c77c7cc, origin, angles, undefined, weaponobj, var_81411b434bf45184, var_d397bc63bc6b67b0, var_d397bf63bc6b6e49);
    if (isdefined(item)) {
        item.customweaponname = getcompleteweaponname(weaponobj);
    } else {
        /#
            assertmsg("CommonItemERROR: Custom weapon scriptable could not be spawned by SpawnCustomWeaponScriptable().");
        #/
        return undefined;
    }
    item.count = function_7209c8cd4b2e3afd(var_2b7331baea302df8.var_e0116c5b8d303105, var_2b7331baea302df8.var_734357a0b88e3a30, var_2b7331baea302df8.var_9bfd50804dd2553c, var_2b7331baea302df8.rarity);
    item.var_5a57e79ae8d5ae67 = var_2b7331baea302df8.ammostock;
    item.var_2632b2da60d34841 = var_2b7331baea302df8.ammomod;
    item.var_29a8ba8c9dd43fd2 = var_2b7331baea302df8.var_91a6795b9c75d0e4;
    item.var_dbd4f3fc1d4f4d53 = var_2b7331baea302df8.var_dbd4f3fc1d4f4d53;
    item.weaponobj = weaponobj;
    item callback::callback("scriptable_item_spawned", {angles:angles, origin:origin, itembundle:var_2b7331baea302df8, item:item});
    if (!istrue(nodrop)) {
        item setscriptablepartstate(item.type, "dropped");
    }
    function_476b3beecd82dcca("common_items", item);
    if (!istrue(var_66053ca426d82316)) {
        item thread function_33ee459f817ccf86(90);
    }
    return item;
}

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29eb
// Size: 0x1ff
function function_7d4684238ed31570(itembundle, item) {
    var_92fce7b1696254e3 = itembundle.baseweapon;
    var_7ce98c8199be3d76 = [];
    variantid = undefined;
    camo = undefined;
    reticle = undefined;
    if (isdefined(item.var_4f74f0aef2b2a8bf)) {
        if (isdefined(item.var_4f74f0aef2b2a8bf.baseweapon)) {
            var_92fce7b1696254e3 = item.var_4f74f0aef2b2a8bf.baseweapon;
        }
        if (isdefined(item.var_4f74f0aef2b2a8bf.attachments)) {
            var_7ce98c8199be3d76 = item.var_4f74f0aef2b2a8bf.attachments;
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
        return weapon::buildweapon_blueprint(weapon::getweaponrootname(var_92fce7b1696254e3), camo, reticle, variantid, undefined, stickers);
    } else {
        return weapon::buildweapon(var_92fce7b1696254e3, var_7ce98c8199be3d76, camo, reticle, undefined, undefined, undefined, stickers);
    }
}

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
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
    var_92fce7b1696254e3 = itembundle.baseweapon;
    if (isdefined(itembundle.weaponblueprint)) {
        var_a1cb298d90255f53 = function_ce5e32676f572482(itembundle);
        /#
            assertex(var_a1cb298d90255f53 != 0, "CommonItemWeaponERROR: Failed to build a blueprint weapon from the item bundle [" + namespace_49e179ec476603d6::function_467f0c241ad05cfb(itembundle.ref) + "] using the ref [" + itembundle.ref + "].");
        #/
        lootid = namespace_49e179ec476603d6::function_6d15e119c2779a93(itembundle);
        var_2739a39588539afc = function_c7771194200d360e(lootid);
        return weapon::buildweapon_blueprint(weapon::getweaponrootname(var_92fce7b1696254e3), var_2739a39588539afc, undefined, var_a1cb298d90255f53);
    }
    var_7ce98c8199be3d76 = [];
    if (getdvarint(@"hash_fe8c3a210d6855dd") == 0) {
        var_7ce98c8199be3d76 = function_4a20d0b8693d4656(itembundle);
    }
    return weapon::buildweapon(var_92fce7b1696254e3, var_7ce98c8199be3d76);
}

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d0f
// Size: 0x7a
function function_c9fa4fbe86fb1c75(var_fbe755f0978c0369) {
    if (!isdefined(var_fbe755f0978c0369)) {
        return [];
    }
    var_b91e11f33e2a122d = function_50f8a8f765bad85e("itemspawnentry:" + var_fbe755f0978c0369, [0:#"baseweapon", 1:#"maxattachments", 2:#"attachmentslots", 3:#"hash_b48a8e8b021298fc", 4:#"hash_582faf4b19c656ec"]);
    if (!isdefined(var_b91e11f33e2a122d)) {
        return [];
    }
    return function_4a20d0b8693d4656(var_b91e11f33e2a122d);
}

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d91
// Size: 0xad2
function function_4a20d0b8693d4656(itembundle) {
    weapon = itembundle.baseweapon;
    maxattachments = isdefined(itembundle.maxattachments) ? 0 : itembundle.maxattachments;
    if (maxattachments == 0) {
        return [];
    }
    var_89eb760f6b8df087 = [];
    var_4aed501ce3a50793 = [];
    var_f6aae36b60d6e67f = [];
    var_c228159a2bfd2b4c = [];
    if (isdefined(itembundle.var_a70439f6a789d930)) {
        var_5f4eeeb101be82b1 = 0;
        random = randomfloat(100);
        foreach (var_151f9918b41e699d in itembundle.var_a70439f6a789d930) {
            if (!isdefined(var_151f9918b41e699d.chance)) {
                var_4aed501ce3a50793[var_4aed501ce3a50793.size] = var_151f9918b41e699d.attachment;
            } else {
                if (random < var_5f4eeeb101be82b1 + var_151f9918b41e699d.chance && !function_fc64178f71375137(level.var_986acb83cc29ed77.var_b8ba13385a2bb5, var_151f9918b41e699d.attachment)) {
                    var_89eb760f6b8df087[var_89eb760f6b8df087.size] = var_151f9918b41e699d.attachment;
                    if (var_89eb760f6b8df087.size >= maxattachments) {
                        return var_89eb760f6b8df087;
                    }
                    var_f6aae36b60d6e67f[var_f6aae36b60d6e67f.size] = function_4add228b999c26aa(weapon, var_151f9918b41e699d.attachment);
                    foreach (var_3a7356eec5bf4552 in function_e843253d046ad859(weapon, var_151f9918b41e699d.attachment)) {
                        var_4aed501ce3a50793[var_4aed501ce3a50793.size] = var_3a7356eec5bf4552;
                    }
                    foreach (var_fcda8728d88b5c5b in function_c6d15635447865c5(weapon, var_151f9918b41e699d.attachment)) {
                        var_f6aae36b60d6e67f[var_f6aae36b60d6e67f.size] = var_fcda8728d88b5c5b;
                    }
                    foreach (var_c60000b703c5b2ea in function_e843253d046ad859(weapon, var_151f9918b41e699d.attachment)) {
                        var_c228159a2bfd2b4c[var_c228159a2bfd2b4c.size] = var_c60000b703c5b2ea;
                    }
                    break;
                } else {
                    var_4aed501ce3a50793[var_4aed501ce3a50793.size] = var_151f9918b41e699d.attachment;
                }
                var_5f4eeeb101be82b1 = var_5f4eeeb101be82b1 + var_151f9918b41e699d.chance;
            }
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
        if (function_fc64178f71375137(var_f6aae36b60d6e67f, var_b733f7b6e209a5ab.slot)) {
            continue;
        }
        var_6eb6799cfc6da135 = [];
        if (istrue(var_b733f7b6e209a5ab.var_d26676885cbb9f56)) {
            var_6eb6799cfc6da135 = function_75b035199842693d(weapon, var_b733f7b6e209a5ab.slot, level.var_986acb83cc29ed77.var_feea62f594ad9284);
        } else if (isdefined(var_b733f7b6e209a5ab.var_d18a2813800b518b)) {
            foreach (var_5831348c10f79ae8 in var_b733f7b6e209a5ab.var_d18a2813800b518b) {
                if (isdefined(var_5831348c10f79ae8.attachment) && var_5831348c10f79ae8.attachment != "") {
                    var_6eb6799cfc6da135[var_6eb6799cfc6da135.size] = var_5831348c10f79ae8.attachment;
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
            } else {
                if (function_fc64178f71375137(level.var_986acb83cc29ed77.var_b8ba13385a2bb5, var_b7febab1f5c4c2c8)) {
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
                    jumpiffalse(excluded) LOC_0000074e;
                } else {
                LOC_0000074e:
                    if (function_fc64178f71375137(var_4aed501ce3a50793, var_b7febab1f5c4c2c8)) {
                        continue;
                    }
                    var_1439f86640d42e34 = function_7c612ac92ba98dcb(weapon, var_b7febab1f5c4c2c8);
                    if (isdefined(var_1439f86640d42e34) && function_fc64178f71375137(var_c228159a2bfd2b4c, var_1439f86640d42e34)) {
                        continue;
                    }
                    var_ea9750936cb9726b = 0;
                    var_d30865ebf0ce910e = function_6dc98654fb071228(weapon, var_b7febab1f5c4c2c8);
                    foreach (var_8630243a2ab728c9 in var_d30865ebf0ce910e) {
                        if (!function_fc64178f71375137(var_89eb760f6b8df087, var_8630243a2ab728c9)) {
                            var_ea9750936cb9726b = 1;
                            break;
                        }
                    }
                    if (var_ea9750936cb9726b) {
                        continue;
                    }
                    var_a54649baf68ead4d[var_a54649baf68ead4d.size] = var_b7febab1f5c4c2c8;
                }
            }
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
                foreach (var_fcda8728d88b5c5b in function_c6d15635447865c5(weapon, attachment)) {
                    var_f6aae36b60d6e67f[var_f6aae36b60d6e67f.size] = var_fcda8728d88b5c5b;
                }
                foreach (var_c60000b703c5b2ea in function_e843253d046ad859(weapon, attachment)) {
                    var_c228159a2bfd2b4c[var_c228159a2bfd2b4c.size] = var_c60000b703c5b2ea;
                }
            } else {
                var_273875869946e27c[var_273875869946e27c.size] = var_b733f7b6e209a5ab.slot;
                var_b6f364a2adcb0e33[var_b733f7b6e209a5ab.slot] = var_a54649baf68ead4d;
            }
        }
    }
    var_273875869946e27c = utility::array_randomize(var_273875869946e27c);
    foreach (slot in var_273875869946e27c) {
        if (function_fc64178f71375137(var_f6aae36b60d6e67f, slot)) {
            continue;
        }
        var_b6f364a2adcb0e33[slot] = utility::array_randomize(var_b6f364a2adcb0e33[slot]);
        foreach (attachment in var_b6f364a2adcb0e33[slot]) {
            var_1439f86640d42e34 = function_7c612ac92ba98dcb(weapon, attachment);
            if (isdefined(var_1439f86640d42e34) && function_fc64178f71375137(var_c228159a2bfd2b4c, var_1439f86640d42e34) || function_fc64178f71375137(var_4aed501ce3a50793, attachment)) {
                continue;
            }
            var_ea9750936cb9726b = 0;
            var_d30865ebf0ce910e = function_6dc98654fb071228(weapon, attachment);
            foreach (var_8630243a2ab728c9 in var_d30865ebf0ce910e) {
                if (!function_fc64178f71375137(var_89eb760f6b8df087, var_8630243a2ab728c9)) {
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
            foreach (var_fcda8728d88b5c5b in function_c6d15635447865c5(weapon, attachment)) {
                var_f6aae36b60d6e67f[var_f6aae36b60d6e67f.size] = var_fcda8728d88b5c5b;
            }
            foreach (var_c60000b703c5b2ea in function_e843253d046ad859(weapon, attachment)) {
                var_c228159a2bfd2b4c[var_c228159a2bfd2b4c.size] = var_c60000b703c5b2ea;
            }
            break;
        }
    }
    return var_89eb760f6b8df087;
}

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x386b
// Size: 0xa4
function function_46e8a35ad122218e(itembundle) {
    weapondata = spawnstruct();
    weapondata.baseweapon = itembundle.baseweapon;
    weapondata.rarity = itembundle.rarity;
    weapondata.attachments = function_4a20d0b8693d4656(itembundle);
    weapondata.variantid = function_ce5e32676f572482(itembundle);
    weapondata.var_fbe755f0978c0369 = function_46423e80a0fa8f2(itembundle.baseweapon, itembundle.rarity, weapondata.variantid);
    return weapondata;
}

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3917
// Size: 0xc6
function private function_23cdd58f4d4fa1ba(weaponobject, rarity, primaryweaponindex) {
    weapondata = spawnstruct();
    weapondata.baseweapon = weaponobject.basename;
    weapondata.rarity = function_53c4c53197386572(rarity, 0);
    weapondata.attachments = weaponobject.attachments;
    weapondata.variantid = weaponobject.variantid;
    weapondata.var_fbe755f0978c0369 = function_46423e80a0fa8f2(weaponobject.basename, weapondata.rarity, weaponobject.variantid);
    self.var_dd3d589a27a0b26[primaryweaponindex] = weapondata;
    return weapondata;
}

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
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

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
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

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b0b
// Size: 0x88
function function_2c85d7675de2e251(weaponobject) {
    primaryweaponindex = function_2f5e1422c4b1932b(weaponobject);
    if (!isdefined(primaryweaponindex) || !isdefined(self.var_dd3d589a27a0b26[primaryweaponindex]) || !isdefined(self.var_dd3d589a27a0b26[primaryweaponindex].var_fbe755f0978c0369)) {
        return undefined;
    }
    var_fbe755f0978c0369 = self.var_dd3d589a27a0b26[primaryweaponindex].var_fbe755f0978c0369;
    itembundle = getscriptbundle("itemspawnentry:" + var_fbe755f0978c0369);
    return itembundle;
}

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
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

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3be3
// Size: 0x43
function function_75e73212bbe447d9(weapon) {
    weapondata = function_b5f358d46f69b20e(weapon);
    if (isdefined(weapondata)) {
        return (isdefined(weapondata.rarity) ? 0 : weapondata.rarity);
    }
    return 0;
}

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c2e
// Size: 0x85
function function_2aeaf88105d3b617(weapindex) {
    if (isdefined(weapindex)) {
        if (weapindex == 2) {
            return function_e2b4c63cab73c1f1();
        } else {
            var_8bc4e7c01cc3a2a9 = 0;
            for (i = 0; i < self.primaryweapons.size; i++) {
                weapon = self.primaryweapons[i];
                if (weapon.basename != "none") {
                    if (var_8bc4e7c01cc3a2a9 == weapindex) {
                        return weapon;
                    }
                    var_8bc4e7c01cc3a2a9++;
                }
            }
        }
    }
    return undefined;
}

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
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
    var_80eff6fc44248132 = self.primaryweapons;
    var_5ee0dd3a9ede9aa0 = weaponobject getnoaltweapon();
    for (i = 0; i < var_80eff6fc44248132.size; i++) {
        weapon = var_80eff6fc44248132[i];
        if (issameweapon(weaponobject, weapon) || isdefined(var_5ee0dd3a9ede9aa0) && !isnullweapon(var_5ee0dd3a9ede9aa0) && issameweapon(var_5ee0dd3a9ede9aa0, weapon)) {
            return i;
        }
    }
    return undefined;
}

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3d67
// Size: 0xeb
function private function_90aed8ec6b3a7796(newweapon) {
    var_80eff6fc44248132 = self.primaryweapons;
    for (i = 0; i < var_80eff6fc44248132.size; i++) {
        weapon = var_80eff6fc44248132[i];
        if (newweapon.basename == weapon.basename) {
            return [0:i, 1:weapon];
        }
    }
    for (i = 0; i < var_80eff6fc44248132.size; i++) {
        weapon = var_80eff6fc44248132[i];
        if (weapon.basename == "iw9_me_fists_mp") {
            return [0:i, 1:weapon];
        }
    }
    currentweapon = self getcurrentweapon();
    currentweaponindex = function_2f5e1422c4b1932b(currentweapon);
    if (isdefined(currentweaponindex) && currentweaponindex < var_80eff6fc44248132.size) {
        return [0:currentweaponindex, 1:var_80eff6fc44248132[currentweaponindex]];
    }
    return [0:undefined, 1:undefined];
}

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e5a
// Size: 0xc1
function function_c14b2cb6d5a65def(weapindex) {
    var_17d89f18c1d0eb4f = function_2aeaf88105d3b617(weapindex);
    var_d5adafa612d0ba43 = ter_op(weapindex == 1, 0, 1);
    if (!isdefined(var_17d89f18c1d0eb4f)) {
        return;
    }
    if (var_17d89f18c1d0eb4f.basename == "iw9_me_fists_mp") {
        return;
    }
    if (function_ced2abb96f1d86a5()) {
        function_ad6e2b653093328a();
    } else {
        var_3184653fdf31db44 = makeweapon("iw9_me_fists_mp");
        if (!self hasweapon("iw9_me_fists_mp")) {
            self giveweapon(var_3184653fdf31db44);
        }
        var_929e81472980ec28 = function_2aeaf88105d3b617(var_d5adafa612d0ba43);
        if (!isdefined(var_929e81472980ec28)) {
            var_929e81472980ec28 = var_3184653fdf31db44;
        }
        _switchtoweaponimmediate(var_929e81472980ec28);
    }
    function_ad55c4cd0426138d(var_17d89f18c1d0eb4f);
    self takeweapon(var_17d89f18c1d0eb4f);
}

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3f22
// Size: 0x72
function private function_d4246bdfe5eb28b5() {
    var_60012a0838191d7 = self.primaryweapons.size;
    foreach (weap in self.primaryweapons) {
        if (isnullweapon(weap)) {
            var_60012a0838191d7--;
        }
    }
    return var_60012a0838191d7;
}

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3f9c
// Size: 0x5f
function private function_f3045c1e8c70d171(var_e4bca3d2e20844aa, var_66b3db972ac1531e, var_d51b60896ba648e3) {
    var_315cd02a520438bf = weaponmaxammo(var_66b3db972ac1531e);
    var_d0de2243627d6414 = var_315cd02a520438bf - var_d51b60896ba648e3;
    if (var_e4bca3d2e20844aa > var_d0de2243627d6414) {
        var_e4bca3d2e20844aa = var_e4bca3d2e20844aa - var_d0de2243627d6414;
        var_d51b60896ba648e3 = var_315cd02a520438bf;
    } else {
        var_d51b60896ba648e3 = var_d51b60896ba648e3 + var_e4bca3d2e20844aa;
        var_e4bca3d2e20844aa = 0;
    }
    return [0:var_e4bca3d2e20844aa, 1:var_d51b60896ba648e3];
}

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4003
// Size: 0x34
function function_aedc908c4a79d05e(weaponobj) {
    if (istrue(weaponobj.hasalternate)) {
        return (function_7c612ac92ba98dcb(weaponobj, weaponobj.underbarrel) == "selectfire");
    }
    return 0;
}

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
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
    var_37d10554e6936847 = level.var_986acb83cc29ed77.var_37d10554e6936847[baseweapon];
    if (isdefined(var_37d10554e6936847)) {
        return var_37d10554e6936847.scriptable;
    }
    return undefined;
}

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
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
    var_37d10554e6936847 = level.var_986acb83cc29ed77.var_37d10554e6936847[baseweapon];
    if (isdefined(var_37d10554e6936847)) {
        return var_37d10554e6936847.transform;
    }
    return undefined;
}

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40f5
// Size: 0xac
function function_46423e80a0fa8f2(baseweapon, rarity, var_12c0f53a71c9bcc8) {
    if (!isdefined(baseweapon)) {
        /#
            assertmsg("CommonItemERROR: An undefined baseWeapon name was specified when trying to retrieve an item bundle name.");
        #/
        return undefined;
    }
    var_37d10554e6936847 = level.var_986acb83cc29ed77.var_37d10554e6936847[baseweapon];
    if (isdefined(var_37d10554e6936847)) {
        if (!isdefined(rarity)) {
            rarity = 0;
        }
        if (!isdefined(var_12c0f53a71c9bcc8)) {
            var_12c0f53a71c9bcc8 = 0;
        }
        if (isdefined(var_37d10554e6936847.bundles[var_12c0f53a71c9bcc8])) {
            return var_37d10554e6936847.bundles[var_12c0f53a71c9bcc8][rarity];
        } else if (isdefined(var_37d10554e6936847.bundles[0])) {
            return var_37d10554e6936847.bundles[0][rarity];
        }
    }
    return undefined;
}

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41a9
// Size: 0x4f
function function_ce5e32676f572482(itembundle) {
    if (isdefined(itembundle.ref)) {
        var_2715b66d7222159b = namespace_49e179ec476603d6::function_6d15e119c2779a93(itembundle);
        if (isdefined(var_2715b66d7222159b)) {
            var_12c0f53a71c9bcc8 = function_64ccc54bdbae5cf6(var_2715b66d7222159b);
            return (isdefined(var_12c0f53a71c9bcc8) ? 0 : var_12c0f53a71c9bcc8);
        }
    }
    return 0;
}

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
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
        level.var_61e6e1b83a8f3486.var_d5dc3a58c912aee7 = [];
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

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x43ca
// Size: 0x277
function private function_cb5a17997d502c15(var_9ec97bdad14a0a5b) {
    /#
        var_c1c3ecdd33dec5b7 = function_50f8a8f765bad85e("<unknown string>" + var_9ec97bdad14a0a5b, [0:#"ref", 1:#"subtype", 2:#"rarity"]);
        if (!isdefined(var_c1c3ecdd33dec5b7.ref) || getdvarint(@"hash_10f0811105fc2f93", 0) == 0) {
            return;
        }
        subtype = isdefined(var_c1c3ecdd33dec5b7.subtype) ? "<unknown string>" : var_c1c3ecdd33dec5b7.subtype;
        rarity = isdefined(var_c1c3ecdd33dec5b7.rarity) ? "<unknown string>" + var_c1c3ecdd33dec5b7.rarity : "<unknown string>";
        if (!isdefined(level.var_61e6e1b83a8f3486.var_d5dc3a58c912aee7[subtype])) {
            level.var_61e6e1b83a8f3486.var_d5dc3a58c912aee7[subtype] = {refs:[], var_ce41ec8e5a0a0e7e:0};
            devgui::function_b23a59dfb4ca49a1("<unknown string>" + subtype, "<unknown string>" + subtype, &function_acbdc55d88b2babd, 0, 0);
        }
        if (!isdefined(level.var_61e6e1b83a8f3486.var_d5dc3a58c912aee7[subtype].refs[var_c1c3ecdd33dec5b7.ref])) {
            level.var_61e6e1b83a8f3486.var_d5dc3a58c912aee7[subtype].refs[var_c1c3ecdd33dec5b7.ref] = {var_975fc3d190e40d36:[], var_ce41ec8e5a0a0e7e:0};
        }
        level.var_61e6e1b83a8f3486.var_d5dc3a58c912aee7[subtype].refs[var_c1c3ecdd33dec5b7.ref].var_975fc3d190e40d36[rarity] = var_9ec97bdad14a0a5b;
        if (level.var_61e6e1b83a8f3486.var_d5dc3a58c912aee7[subtype].var_ce41ec8e5a0a0e7e) {
            if (level.var_61e6e1b83a8f3486.var_d5dc3a58c912aee7[subtype].refs[var_c1c3ecdd33dec5b7.ref].var_ce41ec8e5a0a0e7e) {
                function_acbdc55d88b2babd([0:subtype, 1:var_c1c3ecdd33dec5b7.ref, 2:rarity]);
            } else {
                function_acbdc55d88b2babd([0:subtype, 1:var_c1c3ecdd33dec5b7.ref]);
            }
        }
    #/
}

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
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

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x46c1
// Size: 0x55e
function private function_acbdc55d88b2babd(params) {
    /#
        subtype = params[0];
        var_71ab5de6311eb0c0 = params[1];
        rarity = params[2];
        if (isdefined(rarity)) {
            var_9133608443729bd4 = "<unknown string>" + rarity + "<unknown string>";
            switch (rarity) {
            case #"hash_311010bc01bd3a0f":
                var_9133608443729bd4 = "<unknown string>";
                break;
            case #"hash_31100fbc01bd387c":
                var_9133608443729bd4 = "<unknown string>";
                break;
            case #"hash_311012bc01bd3d35":
                var_9133608443729bd4 = "<unknown string>";
                break;
            case #"hash_311011bc01bd3ba2":
                var_9133608443729bd4 = "<unknown string>";
                break;
            case #"hash_31100cbc01bd33c3":
                var_9133608443729bd4 = "<unknown string>";
                break;
            case #"hash_31100bbc01bd3230":
                var_9133608443729bd4 = "<unknown string>";
                break;
            }
            var_8e72daae56d504db = "<unknown string>" + subtype + "<unknown string>" + var_71ab5de6311eb0c0 + var_9133608443729bd4 + "<unknown string>";
            devgui::add_debug_command("<unknown string>" + var_8e72daae56d504db + "<unknown string>");
            var_9ec97bdad14a0a5b = level.var_61e6e1b83a8f3486.var_d5dc3a58c912aee7[subtype].refs[var_71ab5de6311eb0c0].var_975fc3d190e40d36[rarity];
            devgui::function_b23a59dfb4ca49a1(var_8e72daae56d504db + "<unknown string>", "<unknown string>" + var_9ec97bdad14a0a5b, &namespace_49e179ec476603d6::function_f8162124bbb6ece3, 0, 0);
            devgui::function_b23a59dfb4ca49a1(var_8e72daae56d504db + "<unknown string>", "<unknown string>" + var_9ec97bdad14a0a5b, &function_d26496ac40030d8a, 0, 1);
            devgui::function_b23a59dfb4ca49a1(var_8e72daae56d504db + "<unknown string>", "<unknown string>" + var_9ec97bdad14a0a5b, &function_9ea2acdd3cda26a2, 0, 2);
            devgui::function_b23a59dfb4ca49a1(var_8e72daae56d504db + "<unknown string>", "<unknown string>" + var_9ec97bdad14a0a5b, &function_c6fb716427c35c50, 0, 3);
            devgui::function_b23a59dfb4ca49a1(var_8e72daae56d504db + "<unknown string>", "<unknown string>" + var_9ec97bdad14a0a5b, &function_c6fb716427c35c50, 0, 4);
            devgui::function_b23a59dfb4ca49a1(var_8e72daae56d504db + "<unknown string>", "<unknown string>" + var_9ec97bdad14a0a5b, &function_c6fb716427c35c50, 0, 5);
            devgui::function_b23a59dfb4ca49a1(var_8e72daae56d504db + "<unknown string>", "<unknown string>" + var_9ec97bdad14a0a5b, &function_c6fb716427c35c50, 0, 6);
            devgui::add_debug_command("<unknown string>" + var_8e72daae56d504db + "<unknown string>");
            level.var_61e6e1b83a8f3486.var_d5dc3a58c912aee7[subtype].refs[var_71ab5de6311eb0c0].var_975fc3d190e40d36[rarity] = undefined;
        } else if (isdefined(var_71ab5de6311eb0c0)) {
            if (level.var_61e6e1b83a8f3486.var_d5dc3a58c912aee7[subtype].refs[var_71ab5de6311eb0c0].var_ce41ec8e5a0a0e7e) {
                return;
            }
            level.var_61e6e1b83a8f3486.var_d5dc3a58c912aee7[subtype].refs[var_71ab5de6311eb0c0].var_ce41ec8e5a0a0e7e = 1;
            var_8e72daae56d504db = "<unknown string>" + subtype + "<unknown string>" + var_71ab5de6311eb0c0 + "<unknown string>";
            devgui::add_debug_command("<unknown string>" + var_8e72daae56d504db + "<unknown string>");
            foreach (rarity, var_ae82a723405b6ad7 in level.var_61e6e1b83a8f3486.var_d5dc3a58c912aee7[subtype].refs[var_71ab5de6311eb0c0].var_975fc3d190e40d36) {
                var_9133608443729bd4 = "<unknown string>" + rarity + "<unknown string>";
                switch (rarity) {
                case #"hash_311010bc01bd3a0f":
                    var_9133608443729bd4 = "<unknown string>";
                    break;
                case #"hash_31100fbc01bd387c":
                    var_9133608443729bd4 = "<unknown string>";
                    break;
                case #"hash_311012bc01bd3d35":
                    var_9133608443729bd4 = "<unknown string>";
                    break;
                case #"hash_311011bc01bd3ba2":
                    var_9133608443729bd4 = "<unknown string>";
                    break;
                case #"hash_31100cbc01bd33c3":
                    var_9133608443729bd4 = "<unknown string>";
                    break;
                case #"hash_31100bbc01bd3230":
                    function_acbdc55d88b2babd([0:subtype, 1:var_71ab5de6311eb0c0, 2:rarity]);
                    return;
                }
                devgui::function_b23a59dfb4ca49a1(var_8e72daae56d504db + var_9133608443729bd4, "<unknown string>" + subtype + "<unknown string>" + var_71ab5de6311eb0c0 + "<unknown string>" + rarity, &function_acbdc55d88b2babd, 0, 0);
            }
            devgui::add_debug_command("<unknown string>" + var_8e72daae56d504db + "<unknown string>");
        } else {
            if (level.var_61e6e1b83a8f3486.var_d5dc3a58c912aee7[subtype].var_ce41ec8e5a0a0e7e) {
                return;
            }
            level.var_61e6e1b83a8f3486.var_d5dc3a58c912aee7[subtype].var_ce41ec8e5a0a0e7e = 1;
            var_8e72daae56d504db = "<unknown string>" + subtype + "<unknown string>";
            devgui::add_debug_command("<unknown string>" + var_8e72daae56d504db + "<unknown string>");
            foreach (var_71ab5de6311eb0c0, var_be17f5df3c10204f in level.var_61e6e1b83a8f3486.var_d5dc3a58c912aee7[subtype].refs) {
                devgui::function_b23a59dfb4ca49a1(var_8e72daae56d504db + "<unknown string>" + var_71ab5de6311eb0c0, "<unknown string>" + subtype + "<unknown string>" + var_71ab5de6311eb0c0, &function_acbdc55d88b2babd, 0, 0);
            }
            devgui::add_debug_command("<unknown string>" + var_8e72daae56d504db + "<unknown string>");
        }
    #/
}

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4c26
// Size: 0xa6
function private function_d26496ac40030d8a(params) {
    /#
        itembundle = getscriptbundle(function_2ef675c13ca1c4af(%"itemspawnentry:", params[0]));
        item = function_c069cffb4cbd1707(itembundle, (0, 0, 0));
        foreach (player in level.players) {
            player namespace_49e179ec476603d6::function_de489fa2ffdb7f2d(item, 0);
        }
    #/
}

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4cd3
// Size: 0xe2
function private function_9ea2acdd3cda26a2(params) {
    /#
        itembundle = getscriptbundle(function_2ef675c13ca1c4af(%"itemspawnentry:", params[0]));
        item = function_c069cffb4cbd1707(itembundle, (0, 0, 0));
        foreach (player in level.players) {
            var_b27047c65737f75b = player getcurrentweapon();
            currentweaponindex = player function_2f5e1422c4b1932b(var_b27047c65737f75b);
            if (isdefined(currentweaponindex)) {
                player function_ffe562ebbdab55fc(currentweaponindex);
            }
            player namespace_8b68a49ebf57ab74::_takeweapon(var_b27047c65737f75b);
            player namespace_49e179ec476603d6::function_de489fa2ffdb7f2d(item, 0);
        }
    #/
}

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
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
        } else if (command == "<unknown string>") {
            if (isdefined(level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b])) {
                level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].paused = 1;
            }
        } else if (command == "<unknown string>") {
            var_eeb7b350796a19c = level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822.size;
            var_1d1ce577b15998ec = 9999;
            foreach (index in level.var_61e6e1b83a8f3486.var_47020c5cf3e4b050) {
                if (index < var_1d1ce577b15998ec) {
                    var_1d1ce577b15998ec = index;
                    var_eeb7b350796a19c = index;
                }
            }
            level.var_61e6e1b83a8f3486.var_47020c5cf3e4b050 = utility::array_remove(level.var_61e6e1b83a8f3486.var_47020c5cf3e4b050, var_eeb7b350796a19c);
            if (!isdefined(level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b])) {
                level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b] = spawnstruct();
            }
            if (!isdefined(level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].iterations)) {
                level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].iterations = 0;
            }
            if (!isdefined(level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].index)) {
                level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].index = var_eeb7b350796a19c;
            }
            if (!isdefined(level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].bundle)) {
                level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].bundle = getscriptbundle(function_2ef675c13ca1c4af(%"itemspawnentry:", var_9ec97bdad14a0a5b));
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
        } else if (command == "<unknown string>") {
            if (isdefined(level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b])) {
                var_49f11cb535c18fd1 = level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].iterations;
                var_802aa4c930e40160 = "<unknown string>" + var_49f11cb535c18fd1 + (var_49f11cb535c18fd1 > 9 ? var_49f11cb535c18fd1 > 99 ? var_49f11cb535c18fd1 > 999 ? "<unknown string>" : "<unknown string>" : "<unknown string>" : "<unknown string>");
                print(var_802aa4c930e40160 + var_9ec97bdad14a0a5b);
                foreach (slot, attachments in level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].attachments) {
                    slot_count = level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].slots[slot];
                    var_802aa4c930e40160 = "<unknown string>" + slot_count + (slot_count > 9 ? slot_count > 99 ? slot_count > 999 ? "<unknown string>" : "<unknown string>" : "<unknown string>" : "<unknown string>");
                    var_33ed35b2b006d8ca = "<unknown string>" + 100 * float(slot_count) / float(var_49f11cb535c18fd1) + "<unknown string>";
                    print(var_802aa4c930e40160 + slot + var_33ed35b2b006d8ca);
                    foreach (attachment, var_38109d13cd551a44 in level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].attachments[slot]) {
                        var_802aa4c930e40160 = "<unknown string>" + var_38109d13cd551a44 + (var_38109d13cd551a44 > 9 ? var_38109d13cd551a44 > 99 ? var_38109d13cd551a44 > 999 ? "<unknown string>" : "<unknown string>" : "<unknown string>" : "<unknown string>");
                        var_33ed35b2b006d8ca = "<unknown string>" + 100 * float(var_38109d13cd551a44) / float(slot_count) + "<unknown string>";
                        print(var_802aa4c930e40160 + attachment + var_33ed35b2b006d8ca);
                    }
                }
            }
        }
    #/
}

// Namespace namespace_736197e4d378b91b/namespace_b4f2af6fa775d9b
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x543c
// Size: 0x694
function private function_a99e8a91fa0b3b39(var_9ec97bdad14a0a5b) {
    /#
        while (1) {
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
                    } else {
                        level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].attachments[slot][attachment] = 1;
                    }
                }
            }
            if (getdvarint(@"hash_8b93e6e651c920bb", 1)) {
                scale = getdvarfloat(@"hash_aac79e2ab4af9ee7", 1);
                space = int(8 * scale);
                var_93893423a11228df = int(12 * scale);
                x = getdvarint(@"hash_e981f2369f02b682", 350);
                x = x + 350 * scale * level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].index;
                y = getdvarint(@"hash_21adc9eb44b3d7ed", 20);
                frames = int(1000 * getdvarfloat(@"hash_33348a07cb3e791b", 0.1) / function_676cfe2ab64ea758()) + 1;
                var_49f11cb535c18fd1 = level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].iterations;
                printtoscreen2d(x, y, "<unknown string>" + var_49f11cb535c18fd1, (1, 1, 1), scale, frames);
                printtoscreen2d(x + 4 * space, y, "<unknown string>", (1, 1, 1), scale, frames);
                printtoscreen2d(x + 5 * space, y, var_9ec97bdad14a0a5b, (1, 1, 1), scale, frames);
                y = y + var_93893423a11228df;
                foreach (slot, attachments in level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].attachments) {
                    slot_count = level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].slots[slot];
                    percent = "<unknown string>" + 100 * float(slot_count) / float(var_49f11cb535c18fd1) + "<unknown string>";
                    printtoscreen2d(x, y, "<unknown string>" + slot_count, (1, 1, 1), scale, frames);
                    printtoscreen2d(x + 5 * space, y, "<unknown string>", (1, 1, 1), scale, frames);
                    printtoscreen2d(x + 6 * space, y, slot + percent, (1, 1, 1), scale, frames);
                    y = y + var_93893423a11228df;
                    foreach (attachment, var_38109d13cd551a44 in level.var_61e6e1b83a8f3486.var_bdbda066e5e5a822[var_9ec97bdad14a0a5b].attachments[slot]) {
                        percent = "<unknown string>" + 100 * float(var_38109d13cd551a44) / float(slot_count) + "<unknown string>";
                        printtoscreen2d(x, y, "<unknown string>" + var_38109d13cd551a44, (1, 1, 1), scale, frames);
                        printtoscreen2d(x + 6 * space, y, "<unknown string>", (1, 1, 1), scale, frames);
                        printtoscreen2d(x + 7 * space, y, attachment + percent, (1, 1, 1), scale, frames);
                        y = y + var_93893423a11228df;
                    }
                }
            }
            wait(getdvarfloat(@"hash_33348a07cb3e791b", 0.1));
        }
    #/
}

