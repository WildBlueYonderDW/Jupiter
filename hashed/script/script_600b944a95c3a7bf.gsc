// mwiii decomp prototype
#using script_16ea1b94f0f381b3;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_2669878cf5a1b6bc;

#namespace loot;

// Namespace loot/namespace_38b993c4618e76cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x61d
// Size: 0xb1
function init() {
    level.var_f984ba508ae5bcb1 = [];
    for (row = 0; 1; row++) {
        typename = tablelookupbyrow("loot/loot_types.csv", row, 0);
        if (!isdefined(typename) || typename == "") {
            break;
        }
        var_3a436bd812a2b86 = int(tablelookupbyrow("loot/loot_types.csv", row, 1));
        data = spawnstruct();
        data.typename = typename;
        data.var_3a436bd812a2b86 = var_3a436bd812a2b86;
        level.var_f984ba508ae5bcb1[typename] = data;
    }
    function_7d267b05c8f10c00();
    function_f6b6d73054e210b1();
}

// Namespace loot/namespace_38b993c4618e76cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d5
// Size: 0xa4
function function_f6b6d73054e210b1() {
    level.var_b8122168a1d73b08 = [];
    var_197b05400b063f0a = getdvar(@"hash_531b2ab282f3dbab");
    if (isdefined(var_197b05400b063f0a)) {
        var_9846f3da68a7d5bc = strtok(var_197b05400b063f0a, "|");
        foreach (itemid in var_9846f3da68a7d5bc) {
            level.var_b8122168a1d73b08 = array_add(level.var_b8122168a1d73b08, int(itemid));
        }
    }
}

// Namespace loot/namespace_38b993c4618e76cd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x780
// Size: 0x160
function function_7d267b05c8f10c00() {
    if (isdefined(level.var_1a37f44229729be9)) {
        return;
    }
    level.var_1a37f44229729be9 = [];
    level.var_fb669fe7caba3cf2 = [];
    var_95e750bc139e9da9 = level.var_21e8a7768c0260f2;
    var_ffa92a8d5e47d362 = getscriptbundle(function_2ef675c13ca1c4af(%"hash_6da2812724ad07ed", var_95e750bc139e9da9.var_9c3b29ac37364baa));
    /#
        if (!isdefined(var_ffa92a8d5e47d362)) {
            println("super_battlerage" + var_95e750bc139e9da9.var_9c3b29ac37364baa);
        }
    #/
    var_9c3b29ac37364baa = var_ffa92a8d5e47d362.var_9c3b29ac37364baa;
    for (i = 0; i < var_9c3b29ac37364baa.size; i++) {
        if (!isdefined(var_9c3b29ac37364baa[i].bundle)) {
            continue;
        }
        var_f271cc2a8fd55e1e = getscriptbundle(function_2ef675c13ca1c4af(%"hash_2d4d7620ade90519", var_9c3b29ac37364baa[i].bundle));
        if (!isdefined(var_f271cc2a8fd55e1e)) {
            /#
                println("<unknown string>" + var_95e750bc139e9da9.var_9c3b29ac37364baa + "<unknown string>" + var_9c3b29ac37364baa[i].bundle);
            #/
        } else {
            var_28b456cad740d9ef = var_9c3b29ac37364baa[i].bundle;
            level.var_1a37f44229729be9[var_28b456cad740d9ef] = var_f271cc2a8fd55e1e;
            level.var_fb669fe7caba3cf2[level.var_fb669fe7caba3cf2.size] = var_28b456cad740d9ef;
        }
    }
}

// Namespace loot/namespace_38b993c4618e76cd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8e7
// Size: 0x43
function function_43b02b62387ec23e(var_28b456cad740d9ef) {
    function_7d267b05c8f10c00();
    if (array_contains_key(level.var_1a37f44229729be9, var_28b456cad740d9ef)) {
        return level.var_1a37f44229729be9[var_28b456cad740d9ef];
    }
    /#
        println("<unknown string>" + var_28b456cad740d9ef);
    #/
    return undefined;
}

// Namespace loot/namespace_38b993c4618e76cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x932
// Size: 0x83
function function_b481a180dac1c1cc(lootid) {
    function_7d267b05c8f10c00();
    foreach (consumable in level.var_1a37f44229729be9) {
        if (consumable.lootid == lootid) {
            return consumable;
        }
    }
    /#
        println("<unknown string>" + lootid);
    #/
    return undefined;
}

// Namespace loot/namespace_38b993c4618e76cd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9bd
// Size: 0x76
function function_6fb104d58e745d61(var_3a436bd812a2b86) {
    foreach (data in level.var_f984ba508ae5bcb1) {
        if (var_3a436bd812a2b86 == data.var_3a436bd812a2b86) {
            return data.typename;
        }
    }
    return undefined;
}

// Namespace loot/namespace_38b993c4618e76cd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa3b
// Size: 0x76
function function_8662a0aef570ff4b(typename) {
    foreach (data in level.var_f984ba508ae5bcb1) {
        if (typename == data.typename) {
            return data.var_3a436bd812a2b86;
        }
    }
    return undefined;
}

// Namespace loot/namespace_38b993c4618e76cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab9
// Size: 0x5f
function function_282cf83c9eeda744(lootid) {
    if (!isdefined(lootid)) {
        return undefined;
    }
    var_60ce74182e7c83a7 = function_3475769c002400f7(lootid);
    if (!isdefined(var_60ce74182e7c83a7) || !isdefined(var_60ce74182e7c83a7.category)) {
        return undefined;
    }
    typename = var_60ce74182e7c83a7.category;
    if (typename == "") {
        return undefined;
    }
    return typename;
}

// Namespace loot/namespace_38b993c4618e76cd
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb20
// Size: 0x2a4
function function_2f80e9272a2074d(lootid, var_49e6ef3edadd524e) {
    var_ee60a5391583079b = function_793e8a72cedb8ef3(lootid);
    var_a3f7381340cf06d9 = namespace_e0ee43ef2dddadaa::function_a622d54bb517923a(var_ee60a5391583079b, [0:#"hash_3be72d7e1d0b16e5", 1:#"category"]);
    var_6d996aceed8c8ee8 = undefined;
    if (isdefined(var_a3f7381340cf06d9) && isdefined(var_a3f7381340cf06d9.category) && var_a3f7381340cf06d9.category == "CONVERSIONKIT") {
        var_6d996aceed8c8ee8 = var_ee60a5391583079b;
    }
    if (isdefined(var_a3f7381340cf06d9) && isdefined(var_a3f7381340cf06d9.var_fb5397c466f84c61) && var_a3f7381340cf06d9.var_fb5397c466f84c61 != "") {
        if (var_a3f7381340cf06d9.var_fb5397c466f84c61 != var_ee60a5391583079b) {
            var_39dd70c4a332b134 = namespace_e0ee43ef2dddadaa::function_a622d54bb517923a(var_a3f7381340cf06d9.var_fb5397c466f84c61, [0:#"lootid", 1:#"category"]);
            /#
                assertex(isdefined(var_39dd70c4a332b134), "Unable to retrieve base bundle data for: " + var_a3f7381340cf06d9.var_fb5397c466f84c61);
            #/
            if (isdefined(var_39dd70c4a332b134) && var_39dd70c4a332b134.lootid != 0) {
                lootid = var_39dd70c4a332b134.lootid;
                if (isdefined(var_39dd70c4a332b134.category) && var_39dd70c4a332b134.category == "CONVERSIONKIT") {
                    var_6d996aceed8c8ee8 = var_a3f7381340cf06d9.var_fb5397c466f84c61;
                } else {
                    var_6d996aceed8c8ee8 = undefined;
                }
            }
        }
    }
    /#
        assert(isarray(level.var_c7008cff883cd615));
    #/
    foreach (slot in level.var_c7008cff883cd615) {
        var_e1ffc4455c6c4f8a = function_75b035199842693d(var_49e6ef3edadd524e, slot);
        if (isdefined(var_e1ffc4455c6c4f8a)) {
            foreach (attachment in var_e1ffc4455c6c4f8a) {
                id = function_6a36b14e6b79459(function_2ef675c13ca1c4af(%"hash_3c2c9813bb16552f", attachment), #"lootid");
                if (!isdefined(id)) {
                    logprint("^3Failed to find attachment data with a valid id for [", attachment, "] despite the weapon [", var_49e6ef3edadd524e, "] listing it as a possible attachment.");
                } else {
                    if (id != lootid) {
                        continue;
                    }
                    if (isdefined(var_6d996aceed8c8ee8) && var_6d996aceed8c8ee8 != attachment) {
                        continue;
                    }
                    return attachment;
                }
            }
        }
    }
    return var_ee60a5391583079b;
}

// Namespace loot/namespace_38b993c4618e76cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdcc
// Size: 0x127
function function_793e8a72cedb8ef3(lootid) {
    if (!isdefined(lootid)) {
        return;
    }
    if (!isdefined(level.var_f41abe634712663c)) {
        level.var_f41abe634712663c = [];
    }
    if (isdefined(level.var_f41abe634712663c[lootid])) {
        return level.var_f41abe634712663c[lootid];
    }
    var_cb325ddb4a764623 = undefined;
    var_60ce74182e7c83a7 = function_3475769c002400f7(lootid);
    if (isdefined(var_60ce74182e7c83a7) && isdefined(var_60ce74182e7c83a7.var_cb325ddb4a764623)) {
        var_cb325ddb4a764623 = var_60ce74182e7c83a7.var_cb325ddb4a764623;
    }
    if (!isdefined(var_cb325ddb4a764623)) {
        if (getdvarint(@"hash_6d4a21dadd19744d", 0) == 1 && getdvar(@"hash_e38e16d9fbf3fc43", "mp/loot/br/default/loot_item_defs.csv") == "mp/loot/br/default/loot_item_defs.csv") {
            var_cb325ddb4a764623 = "";
            if (isdefined(level.br_pickups.var_b13dc7e63676bbe7[lootid])) {
                var_cb325ddb4a764623 = level.br_pickups.var_b13dc7e63676bbe7[lootid];
            }
        } else {
            var_cb325ddb4a764623 = tablelookup(level.brloottablename, 5, lootid, 1);
        }
    }
    if (isdefined(var_cb325ddb4a764623) && var_cb325ddb4a764623 != "") {
        level.var_f41abe634712663c[lootid] = var_cb325ddb4a764623;
    }
    return var_cb325ddb4a764623;
}

// Namespace loot/namespace_38b993c4618e76cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xefb
// Size: 0x92
function getlootidfromref(ref) {
    if (!isdefined(ref)) {
        return undefined;
    }
    if (!isdefined(level.var_782b4804d4e2d690)) {
        level.var_782b4804d4e2d690 = [];
    }
    if (isdefined(level.var_782b4804d4e2d690[ref])) {
        return level.var_782b4804d4e2d690[ref];
    }
    var_60ce74182e7c83a7 = function_e4f08713dc9c53b3(ref);
    if (!isdefined(var_60ce74182e7c83a7) || !isdefined(var_60ce74182e7c83a7.itemid)) {
        return 0;
    }
    lootid = var_60ce74182e7c83a7.itemid;
    level.var_782b4804d4e2d690[ref] = lootid;
    return lootid;
}

// Namespace loot/namespace_38b993c4618e76cd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf95
// Size: 0x185
function function_c2c9fb447c203cb2(type) {
    if (!isdefined(type)) {
        return undefined;
    }
    switch (type) {
    case #"hash_27124c6c97ccffa1":
    case #"hash_325cb2e66f67d5b9":
    case #"hash_511d3c24fcedcdb1":
        return "weapon";
    case #"hash_933827ed049cbeb9":
        return "special_weapon";
    case #"hash_339227cb650975db":
    case #"hash_850999d7864fa3b4":
    case #"hash_93c71e7b6c0b81d7":
        return "equipment";
    case #"hash_9b65aa0f76e2e865":
    case #"hash_b60679835e82a584":
    case #"hash_e534fd8ec73eafb4":
        return "super";
    case #"hash_1cac65e1b8bf24a7":
        return "killstreak";
    case #"hash_ab671284a3fc4e3d":
        return "perk";
    case #"hash_4a01666eb6c388c8":
        return "attachment";
    case #"hash_59b8e9d05b31ff9":
    case #"hash_7d516d84d0a82f2":
    case #"hash_d42d44f53610ee5":
    case #"hash_13d1f84d0ae96a5f":
    case #"hash_55425b6c36803a4c":
    case #"hash_5e0a8ff36bce5106":
    case #"hash_6287e3a709aed1ed":
    case #"hash_68f4eeaa46e980a8":
    case #"hash_69146251ab5ca13a":
    case #"hash_7142f43f1e6394cf":
    case #"hash_7b7fff9980d178cf":
    case #"hash_8499464a48c4e157":
    case #"hash_bf5597954aaed3d7":
        return "consumable";
        break;
    }
    return undefined;
}

// Namespace loot/namespace_38b993c4618e76cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1122
// Size: 0xbd
function function_b88cfb4893ceedac(ref) {
    if (!isdefined(ref)) {
        return undefined;
    }
    if (!isdefined(level.br_pickups)) {
        return;
    }
    if (!isdefined(level.br_pickups)) {
        return undefined;
    }
    if (isdefined(level.br_pickups.br_weapontoscriptable[ref])) {
        return level.br_pickups.br_weapontoscriptable[ref];
    }
    if (isdefined(level.br_pickups.br_equipnametoscriptable[ref])) {
        return level.br_pickups.br_equipnametoscriptable[ref];
    }
    if (isdefined(level.br_pickups.var_838863c4848d4c26[ref])) {
        return level.br_pickups.var_838863c4848d4c26[ref];
    }
}

// Namespace loot/namespace_38b993c4618e76cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11e6
// Size: 0x7f
function getscriptablefromlootid(lootid) {
    scriptable = function_e0a57e47b2947bc(lootid);
    if (isdefined(scriptable)) {
        return scriptable;
    }
    if (isdefined(level.br_pickups) && isdefined(level.br_pickups.var_b13dc7e63676bbe7[lootid])) {
        return level.br_pickups.var_b13dc7e63676bbe7[lootid];
    } else {
        ref = function_793e8a72cedb8ef3(lootid);
        return function_b88cfb4893ceedac(ref);
    }
}

// Namespace loot/namespace_38b993c4618e76cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x126c
// Size: 0x12a
function function_fae5e1d3de32d3f7(ref) {
    if (!isdefined(ref)) {
        return undefined;
    }
    if (issharedfuncdefined("game", "getLootIDFromRef")) {
        return level [[ getsharedfunc("game", "getLootIDFromRef") ]](ref);
    } else if (isdefined(level.br_pickups.var_7b2bff2d04ee1017[ref])) {
        return level.br_pickups.var_7b2bff2d04ee1017[ref];
    }
    if (isdefined(level.br_pickups.var_14bd11727c4b6629[ref]) && isdefined(level.br_pickups.br_itemtype[ref])) {
        itemtype = level.br_pickups.br_itemtype[ref];
        if (itemtype == #"health") {
            itemtype = #"consumable";
        }
        return getlootidfromref(level.br_pickups.var_14bd11727c4b6629[ref]);
    }
    if (isdefined(level.br_pickups.br_equipname[ref])) {
        return getlootidfromref(level.br_pickups.br_equipname[ref]);
    }
}

// Namespace loot/namespace_38b993c4618e76cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x139d
// Size: 0x29
function function_afa71c22d9dcfdc5(lootid) {
    cost = function_b481a180dac1c1cc(lootid).cost;
    return cost;
}

// Namespace loot/namespace_38b993c4618e76cd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13ce
// Size: 0x2c
function function_4068c937ebaa0ebd(scriptablename) {
    lootid = function_fae5e1d3de32d3f7(scriptablename);
    if (!isdefined(lootid)) {
        return 0;
    }
    return function_c02e0fb782d242f2(lootid);
}

// Namespace loot/namespace_38b993c4618e76cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1402
// Size: 0x3b
function function_c02e0fb782d242f2(lootid) {
    var_4b67a123f86227ce = function_b481a180dac1c1cc(lootid).var_4b67a123f86227ce;
    if (!isdefined(var_4b67a123f86227ce)) {
        return 1;
    }
    if (var_4b67a123f86227ce == 1) {
        return 0;
    }
    return 1;
}

// Namespace loot/namespace_38b993c4618e76cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1445
// Size: 0x49
function function_9ca10c69808b00a5(var_25978461c6e4f61b) {
    if (!isdefined(var_25978461c6e4f61b)) {
        return 0;
    }
    return issubstr(getdvar(@"hash_90b976de573aecf2", ""), var_25978461c6e4f61b) || issubstr(getdvar(@"hash_ac347c5a6346b8ac", ""), var_25978461c6e4f61b);
}

// Namespace loot/namespace_38b993c4618e76cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1496
// Size: 0x2c
function function_5d47301f7bb7a6ba(lootid) {
    if (!isdefined(lootid)) {
        return 0;
    }
    var_25978461c6e4f61b = getscriptablefromlootid(lootid);
    return function_9ca10c69808b00a5(var_25978461c6e4f61b);
}

// Namespace loot/namespace_38b993c4618e76cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14ca
// Size: 0x37
function function_54b046aa3ba2678a(var_9023cea8f03e72d2) {
    var_3d329ebb0d03d6db = tablelookup("mp/buyStation/buyStationDefs.csv", 1, var_9023cea8f03e72d2, 0);
    if (var_3d329ebb0d03d6db != "") {
        return int(var_3d329ebb0d03d6db);
    }
    return undefined;
}

// Namespace loot/namespace_38b993c4618e76cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1509
// Size: 0x1cd
function function_151b82e1257f4cde(ref) {
    if (!isdefined(ref)) {
        return undefined;
    }
    switch (ref) {
    case #"hash_aa60ec2aec479ec8":
        return "super_tac_cover";
    case #"hash_c848458cca24d656":
        return "super_trophy";
    case #"hash_de0fbd002a2503b7":
        return "super_recon_drone";
    case #"hash_8bb4a7de3879026d":
        return "super_deadsilence";
    case #"hash_b593201e2eae5dcd":
        return "super_support_box";
    case #"hash_ecd28780631ff043":
        return "super_ammo_drop";
    case #"hash_91076f076ee682f4":
        return "super_armor_drop";
    case #"hash_b3d0752364b0193d":
        return "super_utility_drop";
    case #"hash_4d6bb233bacb2d87":
        return "super_battlerage";
    case #"hash_2ee3956fc66771d2":
        return "super_stimpistol";
    case #"hash_8e058a166a2a6049":
        return "super_deployed_decoy";
    case #"hash_1eeb976ed8edf3e2":
        return "super_tac_camera";
    case #"hash_ac9ba190f352c1f":
        return "super_emp_pulse";
    case #"hash_4cbb2e16d7934fbc":
        return "super_supply_drop";
    case #"hash_9abd51e099d625":
        return "super_fulton";
    case #"hash_59c61d6301a0c38f":
        return "super_vehicle_drop";
    case #"hash_f4e4d96da65cbe0c":
        return "super_sound_veil";
    case #"hash_7c09786dbc292c05":
        return "super_sonar_pulse";
    case #"hash_221cbd05ce8eda95":
        return "super_suppression_rounds";
    case #"hash_1a66514788f13506":
        return "super_reinforcement_flare";
    case #"hash_d83c44d7d3de6d4a":
        return "super_personal_redeploy_drone";
    case #"hash_d7c0526ce6fa6664":
        return "super_oxygen_mask";
    case #"hash_26da5d1481b16057":
        return "super_squadrage";
    case #"hash_4b4a6458f00d9319":
        return "super_hb_sensor";
        break;
    }
    return undefined;
}

// Namespace loot/namespace_38b993c4618e76cd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16de
// Size: 0x19
function function_2ce015d8f99a66e0(lootid) {
    return function_e025bb823276187(getscriptablefromlootid(lootid));
}

// Namespace loot/namespace_38b993c4618e76cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16ff
// Size: 0x5c
function function_e025bb823276187(scriptablename) {
    if (!isdefined(scriptablename)) {
        return 0;
    }
    if (!isdefined(level.br_pickups.counts) || !isdefined(level.br_pickups.counts[scriptablename])) {
        return 0;
    }
    return level.br_pickups.counts[scriptablename];
}

// Namespace loot/namespace_38b993c4618e76cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1763
// Size: 0x30
function function_20be2251dd0a8076(lootid) {
    if (!isdefined(level.var_b8122168a1d73b08)) {
        function_f6b6d73054e210b1();
    }
    return array_contains(level.var_b8122168a1d73b08, lootid);
}

// Namespace loot/namespace_38b993c4618e76cd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x179b
// Size: 0x36
function function_8c610908c0e9c6e4(ref) {
    if (!isdefined(level.var_b8122168a1d73b08)) {
        function_f6b6d73054e210b1();
    }
    return array_contains(level.var_b8122168a1d73b08, getlootidfromref(ref));
}

