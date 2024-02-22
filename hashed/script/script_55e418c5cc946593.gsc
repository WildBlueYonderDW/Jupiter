// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\hud_util.gsc;
#using script_451a1a9bd9613164;
#using scripts\mp\utility\disconnect_event_aggregator.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\perks\perks.gsc;
#using script_2d9d24f7c63ac143;
#using script_600b944a95c3a7bf;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\class.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\player.gsc;

#namespace namespace_126f4192a2d090c4;

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ef
// Size: 0x22
function function_9fd92851e68a5662() {
    namespace_bc0abb78a303bb78::function_8ece37593311858a(&onplayerconnect);
    namespace_f1d40c362677777e::registerondisconnecteventcallback(&onplayerdisconnect);
    function_b950d479e0b6a443();
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x218
// Size: 0x71
function function_ca7e33035f7f102f() {
    if (!function_56f3d322e17b9974()) {
        return;
    }
    level.var_767653d4d33e973 = [];
    for (i = 0; i <= 4; i++) {
        if (i >= 1) {
            level.var_767653d4d33e973[i] = getdvarint(function_2ef675c13ca1c4af(@"hash_ab797bdab019e7f3", i, "_unlock_points"), i * 500);
        } else {
            level.var_767653d4d33e973[i] = 0;
        }
    }
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x290
// Size: 0x24
function function_c0d385a09d173a36() {
    if (namespace_36f464722d326bbe::isbrstylegametype()) {
        return (getdvarint(@"hash_9b611cf0cb4bf80e", 1) > 0);
    } else {
        return 0;
    }
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bb
// Size: 0x1d
function function_2980f22fb01f43e6() {
    return function_c0d385a09d173a36() && getdvarint(@"hash_a8b771882e2fbc7a", 1);
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e0
// Size: 0x58
function function_53b52a367576cbe3() {
    function_19868614946c4df4();
    if (function_56f3d322e17b9974() && !isdefined(self.var_eaaa77e5f0f34045)) {
        self.var_eaaa77e5f0f34045 = [];
        for (i = 1; i <= 4; i++) {
            self.var_eaaa77e5f0f34045["slot" + i] = 0;
        }
    }
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x33f
// Size: 0x20b
function private function_b950d479e0b6a443() {
    if (!isdefined(level.var_952400f520b7f68d)) {
        level.var_952400f520b7f68d = [];
    }
    bundlename = getdvar(@"hash_23b1b8f92f4a2d96", "perkpackagelist_wz");
    scriptbundle = getscriptbundle(function_2ef675c13ca1c4af(%"perkpackagelist:", bundlename));
    if (isdefined(scriptbundle)) {
        foreach (var_3516ac40ed0e076e in scriptbundle.var_1dace216d1a32d14) {
            var_94301e72b910a4e0 = var_3516ac40ed0e076e.package;
            if (isdefined(var_94301e72b910a4e0)) {
                var_b65f7e354b049957 = getscriptbundle(function_2ef675c13ca1c4af(%"perkpackage:", var_94301e72b910a4e0));
                if (isdefined(var_b65f7e354b049957)) {
                    if (function_3f643d9c78963ad5(var_b65f7e354b049957.perks.var_89ba9d57a95da53b)) {
                        level.var_952400f520b7f68d[var_94301e72b910a4e0]["perk" + 1] = var_b65f7e354b049957.perks.var_89ba9d57a95da53b;
                    }
                    if (function_3f643d9c78963ad5(var_b65f7e354b049957.perks.var_89ba9e57a95da76e)) {
                        level.var_952400f520b7f68d[var_94301e72b910a4e0]["perk" + 2] = var_b65f7e354b049957.perks.var_89ba9e57a95da76e;
                    }
                    if (function_3f643d9c78963ad5(var_b65f7e354b049957.perks.var_13db3ca1ad2db644)) {
                        level.var_952400f520b7f68d[var_94301e72b910a4e0]["perk" + 3] = var_b65f7e354b049957.perks.var_13db3ca1ad2db644;
                    }
                    if (function_3f643d9c78963ad5(var_b65f7e354b049957.perks.var_34fdca49e62d81ee)) {
                        level.var_952400f520b7f68d[var_94301e72b910a4e0]["perk" + 4] = var_b65f7e354b049957.perks.var_34fdca49e62d81ee;
                    }
                }
            }
        }
    }
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x551
// Size: 0xf
function function_f9311648de44de28() {
    return function_7513b765bcfd9658(function_2f886a8000750771());
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x568
// Size: 0x6c
function function_7513b765bcfd9658(perks) {
    if (isdefined(perks) && perks.size > 0) {
        foreach (perk in perks) {
            if (function_3f643d9c78963ad5(perk)) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5dc
// Size: 0x60
function private function_2f886a8000750771() {
    if (isdefined(self.var_28c944f222f4814) && isdefined(self.var_28c944f222f4814.perks) && self.var_28c944f222f4814.perks.size > 0) {
        return self.var_28c944f222f4814.perks;
    } else {
        return getloadoutperks();
    }
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x643
// Size: 0x6a
function private function_cdddff2c50ec5768(var_ed28bcc7797e2f2a) {
    if (isdefined(var_ed28bcc7797e2f2a)) {
        arr = [];
        foreach (item in var_ed28bcc7797e2f2a) {
            arr[arr.size] = item;
        }
        return arr;
    }
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b4
// Size: 0x95
function getloadoutperks() {
    if (!isdefined(self.pers)) {
        return;
    }
    perks = [];
    if (isdefined(self.loadoutperks)) {
        foreach (perk in self.loadoutperks) {
            slot = namespace_b6a8027f477010e1::getperkslot(perk);
            if (isdefined(slot)) {
                perks[perks.size] = perk;
            }
        }
    }
    return perks;
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x751
// Size: 0xdc
function private function_3af287ce55291889(var_65b695f0c0d909ed) {
    var_a1093166de09e6b8 = undefined;
    var_57acfdc40b2fba7 = namespace_aead94004cf4c147::function_6738846da50730f1(var_65b695f0c0d909ed);
    quantity = var_57acfdc40b2fba7[1];
    lootid = var_57acfdc40b2fba7[0];
    if (isdefined(lootid)) {
        var_a1093166de09e6b8 = namespace_38b993c4618e76cd::getscriptablefromlootid(lootid);
        if (!isdefined(var_a1093166de09e6b8)) {
            var_a1093166de09e6b8 = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(lootid);
        }
        if (function_43044da0ed44d79f(var_a1093166de09e6b8)) {
            var_a991642854217164 = function_3634d41e203bc04e(var_65b695f0c0d909ed);
            if (isdefined(var_a991642854217164) && isdefined(var_a991642854217164.perks)) {
                return [0:var_a1093166de09e6b8, 1:var_a991642854217164.perks];
            }
        } else {
            perks = function_bd6e1a518e1998db(var_a1093166de09e6b8);
            if (isdefined(perks) && perks.size > 0) {
                return [0:var_a1093166de09e6b8, 1:perks];
            }
        }
    }
    return undefined;
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x835
// Size: 0xc2
function private function_b28e5ac58e164cac(var_3e89258ccb54eb4b) {
    entname = var_3e89258ccb54eb4b.scriptablename;
    var_ca5ad0c2334c4a6c = undefined;
    if (isdefined(var_3e89258ccb54eb4b.perks)) {
        var_ca5ad0c2334c4a6c = var_3e89258ccb54eb4b.perks;
    } else if (isdefined(var_3e89258ccb54eb4b.instance) && isdefined(var_3e89258ccb54eb4b.instance.perks)) {
        var_ca5ad0c2334c4a6c = var_3e89258ccb54eb4b.instance.perks;
    } else if (isdefined(entname)) {
        perks = function_bd6e1a518e1998db(entname);
        if (isdefined(perks) && perks.size > 0) {
            var_ca5ad0c2334c4a6c = perks;
        }
    }
    return [0:entname, 1:var_ca5ad0c2334c4a6c];
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8ff
// Size: 0x32
function private function_c32b469bb2b68ece() {
    return [0:self.var_28c944f222f4814.var_183ec729c8876d57, 1:self.var_28c944f222f4814.perks];
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x939
// Size: 0x2f
function private function_3f643d9c78963ad5(perk) {
    return isdefined(perk) && perk != "" && perk != "none" && perk != "specialty_null";
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x970
// Size: 0x10c
function function_bd6e1a518e1998db(var_a0ce8000d303764c) {
    if (isdefined(var_a0ce8000d303764c) && isdefined(level.br_pickups) && isdefined(level.br_pickups.var_14bd11727c4b6629) && array_contains_key(level.br_pickups.var_14bd11727c4b6629, var_a0ce8000d303764c)) {
        var_7b6f6c397311ce2f = level.br_pickups.var_14bd11727c4b6629[var_a0ce8000d303764c];
        if (isdefined(var_7b6f6c397311ce2f) && isdefined(level.var_952400f520b7f68d) && array_contains_key(level.var_952400f520b7f68d, var_7b6f6c397311ce2f) && isdefined(level.var_952400f520b7f68d[var_7b6f6c397311ce2f])) {
            perks = [];
            for (i = 1; i <= 4; i++) {
                key = "perk" + i;
                if (array_contains_key(level.var_952400f520b7f68d[var_7b6f6c397311ce2f], key)) {
                    perks[key] = level.var_952400f520b7f68d[var_7b6f6c397311ce2f][key];
                }
            }
            return perks;
        }
    }
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa83
// Size: 0xc3
function private giveperk(perk) {
    if (function_3f643d9c78963ad5(perk) && !namespace_82dcd1d5ae30ff7::_hasperk(perk)) {
        namespace_d19129e4fa5d176::loadout_giveperk(perk);
    }
    slot = namespace_b6a8027f477010e1::getperkslot(perk);
    if (isdefined(slot)) {
        if (isdefined(self.pers)) {
            if (!array_contains(self.pers["loadoutPerks"], perk)) {
                self.pers["loadoutPerks"][self.pers["loadoutPerks"].size] = perk;
            }
            if (!array_contains(self.pers["loadoutStandardPerks"], perk)) {
                self.pers["loadoutStandardPerks"][self.pers["loadoutStandardPerks"].size] = perk;
            }
        }
    }
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb4d
// Size: 0x10a
function private removeperk(perk) {
    if (function_3f643d9c78963ad5(perk) && namespace_82dcd1d5ae30ff7::_hasperk(perk)) {
        if (isdefined(self.loadoutperks) && array_contains(self.loadoutperks, perk)) {
            namespace_d19129e4fa5d176::loadout_removeperk(perk);
        } else {
            namespace_82dcd1d5ae30ff7::removeperk(perk);
        }
        if (!_hasperk(perk)) {
            if (isdefined(self.pers)) {
                foreach (var_b70c878de3673730 in [0:"loadoutPerks", 1:"loadoutStandardPerks"]) {
                    if (array_contains_key(self.pers, var_b70c878de3673730) && array_contains(self.pers[var_b70c878de3673730], perk)) {
                        self.pers[var_b70c878de3673730] = array_remove(self.pers[var_b70c878de3673730], perk);
                    }
                }
            }
        }
    }
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc5e
// Size: 0x19
function function_fb59c1d91c97a058(player) {
    return function_98f34de164fb4757(player function_2f886a8000750771());
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc7f
// Size: 0x16d
function function_98f34de164fb4757(perks) {
    if (!function_7513b765bcfd9658(perks)) {
        return;
    }
    foreach (var_702112e41b1fa351, perkpack in level.var_952400f520b7f68d) {
        var_737f2981593f274f = 1;
        if (isdefined(perkpack) && perkpack.size > 0) {
            for (i = 0; i + 1 <= 4; i++) {
                var_88c57175dc881598 = "none";
                var_f1ced1fc8297b8d2 = "none";
                key = "perk" + i + 1;
                if (array_contains_key(perkpack, key) && function_3f643d9c78963ad5(perkpack[key])) {
                    var_88c57175dc881598 = perkpack[key];
                } else if (i < perkpack.size && function_3f643d9c78963ad5(perkpack[i])) {
                    var_88c57175dc881598 = perkpack[i];
                }
                if (array_contains_key(perks, key) && function_3f643d9c78963ad5(perks[key])) {
                    var_f1ced1fc8297b8d2 = perks[key];
                } else if (i < perks.size && function_3f643d9c78963ad5(perks[i])) {
                    var_f1ced1fc8297b8d2 = perks[i];
                }
                if (var_88c57175dc881598 != var_f1ced1fc8297b8d2) {
                    var_737f2981593f274f = 0;
                    break;
                }
            }
        } else {
            var_737f2981593f274f = 0;
        }
        if (istrue(var_737f2981593f274f)) {
            return function_cf81579b65f85dcf(var_702112e41b1fa351);
        }
    }
    return "brloot_perkpack_custom";
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf4
// Size: 0x14e
function function_40d138c40bd87f37(perks, isspecialistbonus) {
    if (!isdefined(self.var_28c944f222f4814)) {
        self.var_28c944f222f4814 = spawnstruct();
    }
    if (!isdefined(self.var_28c944f222f4814.perks)) {
        self.var_28c944f222f4814.perks = [];
    } else {
        function_f7d6c69e277fb3d4();
    }
    if (isdefined(perks) && perks.size > 0) {
        var_a746cf0b1aac05a1 = function_98f34de164fb4757(perks);
        self.var_28c944f222f4814.var_183ec729c8876d57 = var_a746cf0b1aac05a1;
        for (i = 0; i + 1 <= 4; i++) {
            key = "perk" + i + 1;
            if (array_contains_key(perks, key) && function_3f643d9c78963ad5(perks[key])) {
                self.var_28c944f222f4814.perks[key] = perks[key];
            } else if (i < perks.size && function_3f643d9c78963ad5(perks[i])) {
                self.var_28c944f222f4814.perks[key] = perks[i];
            }
        }
        function_bae19a088f61b99a(isspecialistbonus);
        function_1296419d9c62a9a8();
        /#
            function_e95ed23f86785c82();
        #/
    } else {
        function_19868614946c4df4();
    }
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf49
// Size: 0xaa
function function_19868614946c4df4() {
    function_f7d6c69e277fb3d4();
    if (!isdefined(self.var_28c944f222f4814)) {
        self.var_28c944f222f4814 = spawnstruct();
    }
    if (!isdefined(self.var_28c944f222f4814.perks)) {
        self.var_28c944f222f4814.perks = [];
    }
    self.var_28c944f222f4814.var_183ec729c8876d57 = undefined;
    for (i = 1; i <= 4; i++) {
        self.var_28c944f222f4814.perks["perk" + i] = undefined;
    }
    function_1296419d9c62a9a8();
    /#
        function_e95ed23f86785c82();
    #/
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xffa
// Size: 0x30
function function_1296419d9c62a9a8() {
    perksarray = function_cdddff2c50ec5768(function_2f886a8000750771());
    namespace_b6a8027f477010e1::function_7c8cc44b58093ce4(perksarray);
    namespace_b6a8027f477010e1::setomnvarsforperklist("ui_spawn_perk_", perksarray, []);
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1031
// Size: 0xcc
function private function_bae19a088f61b99a(isspecialistbonus) {
    if (istrue(isspecialistbonus)) {
        namespace_b6a8027f477010e1::addspecialistbonus();
        return;
    }
    if (!isdefined(self.var_28c944f222f4814) || !isdefined(self.var_28c944f222f4814.perks)) {
        return;
    }
    for (i = 1; i <= 4; i++) {
        if (istrue(function_ee52068fbb9b0dec(i)) && array_contains_key(self.var_28c944f222f4814.perks, "perk" + i)) {
            perk = self.var_28c944f222f4814.perks["perk" + i];
            if (function_3f643d9c78963ad5(perk) && !namespace_82dcd1d5ae30ff7::_hasperk(perk)) {
                giveperk(perk);
            }
        }
    }
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1104
// Size: 0xb3
function private function_f7d6c69e277fb3d4() {
    if (namespace_82dcd1d5ae30ff7::_hasperk("specialty_specialist_bonus")) {
        namespace_b6a8027f477010e1::removespecialistbonus();
    }
    if (!isdefined(self.var_28c944f222f4814) || !isdefined(self.var_28c944f222f4814.perks)) {
        return;
    }
    foreach (perk in self.var_28c944f222f4814.perks) {
        removeperk(perk);
    }
    self.var_28c944f222f4814.perks = [];
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11be
// Size: 0x57
function function_cf81579b65f85dcf(ref) {
    if (isdefined(level.br_pickups.var_838863c4848d4c26) && array_contains_key(level.br_pickups.var_838863c4848d4c26, ref)) {
        return level.br_pickups.var_838863c4848d4c26[ref];
    }
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x121c
// Size: 0x13
function function_bdd930eee0042052() {
    return getdvarint(@"hash_faa72ede42ea5faa", 1);
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1237
// Size: 0x26c
function function_c3023358dc648bf1(var_3e89258ccb54eb4b, var_a24f1824f93081a8, var_a5b2c541413aa895, var_65b695f0c0d909ed, var_44ee85dcf52b4001) {
    var_a1093166de09e6b8 = undefined;
    perks = undefined;
    if (isdefined(var_65b695f0c0d909ed)) {
        if (istrue(var_a5b2c541413aa895) && (!isdefined(var_44ee85dcf52b4001) || var_44ee85dcf52b4001 == 0)) {
            var_c00a2d6249962fb6 = function_b28e5ac58e164cac(var_3e89258ccb54eb4b);
            perks = var_c00a2d6249962fb6[1];
            var_a1093166de09e6b8 = var_c00a2d6249962fb6[0];
        } else {
            var_c00a30624996364f = function_3af287ce55291889(var_65b695f0c0d909ed);
            perks = var_c00a30624996364f[1];
            var_a1093166de09e6b8 = var_c00a30624996364f[0];
        }
    } else if (isdefined(var_3e89258ccb54eb4b)) {
        var_c00a2f624996341c = function_b28e5ac58e164cac(var_3e89258ccb54eb4b);
        perks = var_c00a2f624996341c[1];
        var_a1093166de09e6b8 = var_c00a2f624996341c[0];
    }
    if (isdefined(var_3e89258ccb54eb4b)) {
        if (var_a24f1824f93081a8) {
            origin = undefined;
            angles = (0, 0, 0);
            if (isdefined(var_3e89258ccb54eb4b.origin)) {
                origin = var_3e89258ccb54eb4b.origin;
            } else if (isdefined(var_3e89258ccb54eb4b.instance) && isdefined(var_3e89258ccb54eb4b.instance.origin)) {
                origin = var_3e89258ccb54eb4b.instance.origin;
            } else if (isdefined(self.origin)) {
                origin = self.origin;
            }
            if (isdefined(var_3e89258ccb54eb4b.angles)) {
                angles = var_3e89258ccb54eb4b.angles;
            } else if (isdefined(var_3e89258ccb54eb4b.instance) && isdefined(var_3e89258ccb54eb4b.instance.angles)) {
                angles = var_3e89258ccb54eb4b.instance.angles;
            } else if (isdefined(self.angles)) {
                angles = self.angles;
            }
            dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
            function_3af23b0bfaf91dbd(dropstruct, origin, angles);
        } else if (isdefined(self.var_28c944f222f4814.var_183ec729c8876d57)) {
            if (function_43044da0ed44d79f(self.var_28c944f222f4814.var_183ec729c8876d57)) {
                function_222999aad19f5b52(var_65b695f0c0d909ed, function_2f886a8000750771());
            }
        }
    }
    isspecialistbonus = istrue(var_a1093166de09e6b8 == "brloot_perkpack_specialist_jup");
    function_40d138c40bd87f37(perks, isspecialistbonus);
    return 1;
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14ab
// Size: 0x222
function function_3af23b0bfaf91dbd(dropstruct, position, angles, var_65b695f0c0d909ed) {
    /#
        assertex(isdefined(self), "Expected player to be passed as self.");
    #/
    scriptablename = undefined;
    item = undefined;
    if (function_2980f22fb01f43e6()) {
        if (!isdefined(var_65b695f0c0d909ed)) {
            scriptablename = function_fb59c1d91c97a058(self);
        } else {
            lootid = namespace_aead94004cf4c147::function_6196d9ea9a30e609(var_65b695f0c0d909ed);
            scriptablename = namespace_38b993c4618e76cd::function_793e8a72cedb8ef3(lootid);
        }
        if (isdefined(scriptablename)) {
            var_cb4fad49263e20c4 = getitemdroporiginandangles(dropstruct, self.origin, self.angles, self, level.br_pickups.var_ad49a38dd7c4c10f);
            var_cf2abec2f25bae27 = undefined;
            if (function_43044da0ed44d79f(scriptablename)) {
                if (isdefined(var_65b695f0c0d909ed)) {
                    perkdata = function_3634d41e203bc04e(var_65b695f0c0d909ed);
                    if (isdefined(perkdata)) {
                        var_cf2abec2f25bae27 = perkdata.perks;
                    }
                    function_e8fd3389a3f6433a(var_65b695f0c0d909ed);
                } else if (isdefined(self.var_28c944f222f4814.perks) && self.var_28c944f222f4814.perks.size > 0) {
                    var_cf2abec2f25bae27 = self.var_28c944f222f4814.perks;
                } else {
                    var_cf2abec2f25bae27 = getloadoutperks();
                }
                var_cb4fad49263e20c4.var_a0597a25c511b0ac = [0:#"customperkpackage"];
                if (isdefined(var_cf2abec2f25bae27)) {
                    foreach (perk in var_cf2abec2f25bae27) {
                        var_cb4fad49263e20c4.var_a0597a25c511b0ac[var_cb4fad49263e20c4.var_a0597a25c511b0ac.size] = namespace_38b993c4618e76cd::getlootidfromref(perk);
                    }
                }
            }
            item = namespace_cb965d2f71fefddc::spawnpickup(scriptablename, var_cb4fad49263e20c4, 1, 1);
            if (isdefined(item) && isdefined(var_cf2abec2f25bae27)) {
                item.perks = arraycopy(var_cf2abec2f25bae27);
            }
        }
    }
    if (!isdefined(var_65b695f0c0d909ed)) {
        function_19868614946c4df4();
    }
    return item;
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16d5
// Size: 0x32
function onplayerconnect() {
    function_53b52a367576cbe3();
    thread function_2fbbdfa540bdfb59();
    /#
        if (getdvarint(@"hash_157ce918a8602734", 0) == 1) {
            thread function_d6a5c9019b66d5d3();
        }
    #/
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x170e
// Size: 0x1d
function onplayerdisconnect(player) {
    if (!isbot(player)) {
        player function_6b534b98c34f9610();
    }
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1732
// Size: 0x35
function onplayerkilled(attacker, victim) {
    if (isbot(victim)) {
        return;
    }
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        return;
    }
    victim function_19868614946c4df4();
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x176e
// Size: 0x1e
function onplayerscore() {
    if (!function_56f3d322e17b9974()) {
        return;
    }
    function_f2dbab6f947771f2();
    /#
        function_e95ed23f86785c82();
    #/
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1793
// Size: 0x12
function function_56f3d322e17b9974() {
    return getdvarint(@"hash_b2a4fa1894b756bf", 0);
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17ad
// Size: 0x60
function function_ee52068fbb9b0dec(index) {
    if (!function_56f3d322e17b9974()) {
        return 1;
    }
    if (!isdefined(self.pers["score"]) || index < 0 || index >= level.var_767653d4d33e973.size) {
        return 0;
    }
    return self.pers["score"] >= level.var_767653d4d33e973[index];
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1815
// Size: 0x11a
function function_f2dbab6f947771f2() {
    if (!isplayer(self)) {
        return;
    }
    if (!function_c0d385a09d173a36() || !function_56f3d322e17b9974()) {
        return;
    }
    if (!isdefined(self.pers["score"])) {
        return;
    }
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        return;
    }
    var_c00a346249963f1b = function_c32b469bb2b68ece();
    perks = var_c00a346249963f1b[1];
    var_a0ce8000d303764c = var_c00a346249963f1b[0];
    for (i = 1; i <= 4; i++) {
        if (!self.var_eaaa77e5f0f34045["slot" + i] && function_ee52068fbb9b0dec(i)) {
            self.var_eaaa77e5f0f34045["slot" + i] = 1;
            if (isdefined(perks) && array_contains_key(perks, "perk" + i)) {
                perk = perks["perk" + i];
                if (isdefined(perk) && perk != "" && !namespace_82dcd1d5ae30ff7::_hasperk(perk)) {
                    giveperk(perk);
                    /#
                        function_e95ed23f86785c82();
                    #/
                }
            }
        }
    }
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1936
// Size: 0xd
function function_31ea444c3cecf0fb() {
    self.var_28c944f222f4814 = undefined;
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x194a
// Size: 0xd
function function_54410113b73d012() {
    self.var_eaaa77e5f0f34045 = undefined;
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x195e
// Size: 0xa3
function function_be64b439107f4392() {
    if (!isdefined(self.var_a1adcd8ba70c9723)) {
        return;
    }
    if (self.var_a1adcd8ba70c9723.size > 0) {
        foreach (elem in self.var_a1adcd8ba70c9723) {
            if (isdefined(elem.parent)) {
                elem.parent removechild(elem);
            }
        }
    }
    self.var_a1adcd8ba70c9723 = undefined;
    self.var_9dc07720609cc75b = undefined;
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a08
// Size: 0x1f
function function_6b534b98c34f9610() {
    function_31ea444c3cecf0fb();
    function_54410113b73d012();
    function_4b84c1e093769ddf();
    function_be64b439107f4392();
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a2e
// Size: 0x1a
function function_43044da0ed44d79f(ref) {
    if (!isdefined(ref)) {
        return 0;
    }
    return ref == "brloot_perkpack_custom";
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a50
// Size: 0x25
function function_8a2768bc7f7c63ec(lootid) {
    scriptablename = namespace_38b993c4618e76cd::getscriptablefromlootid(lootid);
    return function_43044da0ed44d79f(scriptablename);
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a7d
// Size: 0xb8
function function_36de08ea672b354c(var_a0ce8000d303764c) {
    if (function_43044da0ed44d79f(var_a0ce8000d303764c)) {
        return 1;
    }
    if (isdefined(var_a0ce8000d303764c) && isdefined(level.br_pickups) && isdefined(level.br_pickups.var_14bd11727c4b6629) && array_contains_key(level.br_pickups.var_14bd11727c4b6629, var_a0ce8000d303764c)) {
        var_7b6f6c397311ce2f = level.br_pickups.var_14bd11727c4b6629[var_a0ce8000d303764c];
        return (isdefined(var_7b6f6c397311ce2f) && isdefined(level.var_952400f520b7f68d) && array_contains_key(level.var_952400f520b7f68d, var_7b6f6c397311ce2f) && isdefined(level.var_952400f520b7f68d[var_7b6f6c397311ce2f]));
    }
    return 0;
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b3d
// Size: 0x25
function function_f647113719f5139b(lootid) {
    scriptablename = namespace_38b993c4618e76cd::getscriptablefromlootid(lootid);
    return function_36de08ea672b354c(scriptablename);
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b6a
// Size: 0x90
function function_2fbbdfa540bdfb59() {
    level endon("game_ended");
    self endon("disconnect");
    while (1) {
        self waittill("giveLoadout");
        if (!istrue(level.br_prematchffa) || namespace_4b0406965e556711::gameflagexists("prematch_done") && namespace_4b0406965e556711::gameflag("prematch_done")) {
            if (namespace_7e17181d03156026::isreallyalive(self) && function_f9311648de44de28()) {
                perks = getloadoutperks();
                function_40d138c40bd87f37(perks);
            } else {
                function_19868614946c4df4();
            }
            /#
                thread function_e95ed23f86785c82();
            #/
        }
        waitframe();
    }
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c01
// Size: 0x45
function function_bbb44bd3b8347efc(var_65b695f0c0d909ed, var_4740eadae93e17e7) {
    perkdata = function_3634d41e203bc04e(var_65b695f0c0d909ed);
    var_4740eadae93e17e7.perks = perkdata.perks;
    function_e8fd3389a3f6433a(var_65b695f0c0d909ed);
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c4d
// Size: 0x37
function function_1ca82d98d7519e1f(var_65b695f0c0d909ed, var_4740eadae93e17e7) {
    if (!isdefined(var_4740eadae93e17e7.perks)) {
        return;
    }
    function_222999aad19f5b52(var_65b695f0c0d909ed, var_4740eadae93e17e7.perks);
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1c8b
// Size: 0xb6
function function_446a16d58f290ca6(var_4598840b8e42c901, var_db86a856ddba5113) {
    if (!isdefined(var_4598840b8e42c901.scriptablename) || var_4598840b8e42c901.scriptablename != "brloot_perkpack_custom") {
        return;
    }
    if (!isdefined(var_db86a856ddba5113) || var_db86a856ddba5113.size <= 0) {
        var_bffcbb624987207b = function_c32b469bb2b68ece();
        perks = var_bffcbb624987207b[1];
        var_a0ce8000d303764c = var_bffcbb624987207b[0];
        if (isdefined(perks) && perks.size > 0) {
            var_4598840b8e42c901.perks = perks;
        } else {
            var_4598840b8e42c901.perks = getloadoutperks();
        }
    } else {
        var_4598840b8e42c901.perks = var_db86a856ddba5113;
    }
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d48
// Size: 0x6a
function function_3634d41e203bc04e(var_65b695f0c0d909ed) {
    if (!isdefined(self.var_b9d1aae41a5e8d70) || !isdefined(var_65b695f0c0d909ed)) {
        return undefined;
    }
    for (i = 0; i < self.var_b9d1aae41a5e8d70.size; i++) {
        if (self.var_b9d1aae41a5e8d70[i].index == var_65b695f0c0d909ed) {
            return self.var_b9d1aae41a5e8d70[i];
        }
    }
    return undefined;
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dba
// Size: 0x135
function function_222999aad19f5b52(index, perks) {
    if (isdefined(function_3634d41e203bc04e(index))) {
        function_e8fd3389a3f6433a(index);
    }
    if (!isdefined(self.var_b9d1aae41a5e8d70)) {
        self.var_b9d1aae41a5e8d70 = [];
    }
    var_ca58d54671e2640d = [];
    var_ca5ad0c2334c4a6c = perks;
    if ((!isdefined(var_ca5ad0c2334c4a6c) || var_ca5ad0c2334c4a6c.size <= 0) && function_f9311648de44de28()) {
        var_ca5ad0c2334c4a6c = getloadoutperks();
    }
    if (isdefined(var_ca5ad0c2334c4a6c) && var_ca5ad0c2334c4a6c.size > 0) {
        for (i = 0; i + 1 <= 4; i++) {
            key = "perk" + i + 1;
            if (array_contains_key(var_ca5ad0c2334c4a6c, key)) {
                var_ca58d54671e2640d[key] = var_ca5ad0c2334c4a6c[key];
            } else if (i < var_ca5ad0c2334c4a6c.size) {
                var_ca58d54671e2640d[key] = var_ca5ad0c2334c4a6c[i];
            }
        }
    }
    if (var_ca58d54671e2640d.size > 0) {
        var_c9288ad70e172698 = self.var_b9d1aae41a5e8d70.size;
        self.var_b9d1aae41a5e8d70[var_c9288ad70e172698] = spawnstruct();
        self.var_b9d1aae41a5e8d70[var_c9288ad70e172698].index = index;
        self.var_b9d1aae41a5e8d70[var_c9288ad70e172698].perks = var_ca58d54671e2640d;
    }
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ef6
// Size: 0xdd
function function_e8fd3389a3f6433a(var_65b695f0c0d909ed) {
    if (!isdefined(self.var_b9d1aae41a5e8d70) || !isdefined(var_65b695f0c0d909ed)) {
        return;
    }
    var_e61dd137e1dec54b = [];
    for (i = 0; i < self.var_b9d1aae41a5e8d70.size; i++) {
        if (self.var_b9d1aae41a5e8d70[i].index == var_65b695f0c0d909ed) {
            var_e61dd137e1dec54b[var_e61dd137e1dec54b.size] = self.var_b9d1aae41a5e8d70[i];
        }
    }
    if (var_e61dd137e1dec54b.size > 0) {
        foreach (item in var_e61dd137e1dec54b) {
            self.var_b9d1aae41a5e8d70 = array_remove(self.var_b9d1aae41a5e8d70, item);
        }
    }
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fda
// Size: 0x1b
function function_4b84c1e093769ddf() {
    if (!isdefined(self.var_b9d1aae41a5e8d70)) {
        return;
    }
    self.var_b9d1aae41a5e8d70 = undefined;
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ffc
// Size: 0x10d
function function_d6a5c9019b66d5d3() {
    /#
        level endon("<unknown string>");
        self endon("<unknown string>");
        if (isbot(self) || getdvarint(@"hash_157ce918a8602734", 0) != 1) {
            return;
        }
        xoffset = 5;
        yoffset = -80;
        var_f5e8ec7a74aa2028 = 10;
        var_75599bf3d6abf81f = createfontstring("<unknown string>", 1);
        var_75599bf3d6abf81f setpoint("<unknown string>", "<unknown string>", xoffset, yoffset);
        self.var_a1adcd8ba70c9723["<unknown string>"] = var_75599bf3d6abf81f;
        for (i = 1; i <= 4; i++) {
            var_d523d0a459b67453 = createfontstring("<unknown string>", 1);
            var_d523d0a459b67453 setpoint("<unknown string>", "<unknown string>", xoffset, yoffset + var_f5e8ec7a74aa2028 * (i - 1 + 1));
            self.var_a1adcd8ba70c9723["<unknown string>" + i] = var_d523d0a459b67453;
        }
        self.var_9dc07720609cc75b = 1;
        function_e95ed23f86785c82();
    #/
}

// Namespace namespace_126f4192a2d090c4/namespace_708f627020de59d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2110
// Size: 0x251
function function_e95ed23f86785c82() {
    /#
        if (!isplayer(self) || isbot(self)) {
            return;
        }
        if (!function_c0d385a09d173a36() || getdvarint(@"hash_157ce918a8602734", 0) != 1) {
            return;
        }
        if (!isdefined(self.pers["<unknown string>"])) {
            return;
        }
        if (!namespace_4b0406965e556711::gameflag("<unknown string>")) {
            return;
        }
        if (!istrue(self.var_9dc07720609cc75b)) {
            function_d6a5c9019b66d5d3();
        }
        var_bffcbe6249872714 = function_c32b469bb2b68ece();
        perks = var_bffcbe6249872714[1];
        var_a0ce8000d303764c = var_bffcbe6249872714[0];
        var_b904c15f8ea08a65 = 0;
        if (isdefined(var_a0ce8000d303764c)) {
            self.var_a1adcd8ba70c9723["<unknown string>"] setdevtext("<unknown string>" + var_a0ce8000d303764c);
        } else {
            self.var_a1adcd8ba70c9723["<unknown string>"] setdevtext("<unknown string>");
        }
        for (i = 1; i <= 4; i++) {
            perkname = "<unknown string>";
            if (isdefined(perks) && array_contains_key(perks, "<unknown string>" + i)) {
                perkname = perks["<unknown string>" + i];
            }
            if (function_56f3d322e17b9974()) {
                var_15c1b390043be459 = level.var_767653d4d33e973[i];
                statustext = "<unknown string>";
                if (function_ee52068fbb9b0dec(i)) {
                    statustext = "<unknown string>";
                } else if (self.pers["<unknown string>"] < var_15c1b390043be459 && self.pers["<unknown string>"] > var_b904c15f8ea08a65) {
                    var_5b8746879610e54b = round((self.pers["<unknown string>"] - var_b904c15f8ea08a65) / (var_15c1b390043be459 - var_b904c15f8ea08a65) * 100);
                    statustext = var_5b8746879610e54b + "<unknown string>";
                } else if (self.pers["<unknown string>"] >= var_15c1b390043be459) {
                    statustext = "<unknown string>";
                }
                self.var_a1adcd8ba70c9723["<unknown string>" + i] setdevtext("<unknown string>" + i + "<unknown string>" + perkname + "<unknown string>" + statustext);
                var_b904c15f8ea08a65 = var_15c1b390043be459;
            } else {
                self.var_a1adcd8ba70c9723["<unknown string>" + i] setdevtext("<unknown string>" + i + "<unknown string>" + perkname);
            }
        }
    #/
}

