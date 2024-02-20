// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\utility\game.gsc;
#using script_48814951e916af89;
#using script_120270bd0a747a35;
#using scripts\mp\utility\disconnect_event_aggregator.gsc;
#using script_371b4c2ab5861e62;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\challenges.gsc;
#using script_6a8ec730b2bfa844;
#using script_41ba451876d0900c;
#using script_1f97a44d1761c919;

#namespace poi;

// Namespace poi/namespace_37f0fb6355a4618a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f6
// Size: 0x2e9
function function_c08668fe290fc31a() {
    flag_init("poi_initialized");
    if (getdvarint(@"hash_2cc531e644d4fdb3", 1) == 0) {
        return;
    }
    level.var_b0eae20487331106 = getdvarint(@"hash_af96cbe00f226832", 0);
    level.var_d35175ec20b444c = getdvarint(@"hash_ad89f1c2b195eda2", 120) * 1000;
    level.poi = [];
    level.var_ab20b3a256911579 = [];
    level.var_a09459a429deb934 = [];
    if (!isdefined(level.var_dbb3dd5ab77ccd48)) {
        level.var_dbb3dd5ab77ccd48 = [];
    }
    var_36d912f3404efa8e = getdvarint(@"hash_7e7742c1722382ad", 1);
    if (var_36d912f3404efa8e) {
        var_24d0a40e728d8e62 = function_10007861f7386ad8();
        var_50ce8fef23b3faa8 = "mp/compass_regions/" + "compassregions_poi_regions_" + level.mapname + ".csv";
        var_71813f0216c57db8 = "mp/compass_regions/" + "compassregions_poi_regions_" + level.mapname + "_" + var_24d0a40e728d8e62 + ".csv";
        function_ce75c09cff4c1efb(var_71813f0216c57db8, var_50ce8fef23b3faa8, 1);
    }
    function_c916e503ca7fd810();
    function_86cc972493600938();
    script_func("pois_found");
    if (istrue(level.var_6df475909ffb403d) && isdefined(level.var_bedc3454dfa5e84f)) {
        [[ level.var_bedc3454dfa5e84f ]]();
    }
    level.var_9f0a2752e6e5371a = var_36d912f3404efa8e && function_afcbc7a4eac55f9e(1);
    if (level.var_9f0a2752e6e5371a) {
        function_6e049f322172e1d5();
    } else {
        function_c916e503ca7fd810();
        function_86cc972493600938();
    }
    if (!isdefined(level.var_dbb3dd5ab77ccd48)) {
        return;
    }
    var_f880f9dff6a5425 = 1;
    if (istrue(level.var_b0eae20487331106)) {
        var_f880f9dff6a5425 = 0;
    }
    foreach (poiName in level.var_dbb3dd5ab77ccd48) {
        var_eb5f2cffbf051614 = function_2ef675c13ca1c4af(@"hash_8a42e4da731a0a67", poiName);
        if (getdvarint(var_eb5f2cffbf051614, var_f880f9dff6a5425) == 0) {
            level.var_ab20b3a256911579[level.var_ab20b3a256911579.size] = poiName;
        }
        function_3d397c9451f80077(poiName);
    }
    if (level.var_9f0a2752e6e5371a) {
        function_b5c7469e80b1e8bd();
        function_9a051b4df049e90b();
    } else {
        function_1698577d68385123();
        function_f1894e1c6faff01();
    }
    level thread function_52cb931e1834f98b();
    namespace_3c37cb17ade254d::registersharedfunc("poi", "poi_isPOIActive", &poi_isPOIActive);
    namespace_f1d40c362677777e::registerondisconnecteventcallback(&function_fc5d5824570e8c21);
    function_68f5d2342ad95772();
    function_683e582efd2a8233();
    script_func("pois_init");
    flag_set("poi_initialized");
    registersharedfunc("poi", "get_poi_name_from_origin", &function_6cc445c02b5effac);
}

// Namespace poi/namespace_37f0fb6355a4618a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6e6
// Size: 0x298
function private function_c916e503ca7fd810() {
    level.var_da9edb0c15be1c3b = [];
    var_349bb06748e578c6 = [];
    foreach (volume in getentarray("trigger_multiple", "code_classname")) {
        if (isdefined(volume.targetname) && issubstr(volume.targetname, "poi_trigger_")) {
            var_349bb06748e578c6[var_349bb06748e578c6.size] = volume;
        }
    }
    foreach (volume in function_f159c10d5cf8f0b4("noent_volume_trigger", "classname")) {
        if (isdefined(volume.targetname) && issubstr(volume.targetname, "poi_trigger_")) {
            var_349bb06748e578c6[var_349bb06748e578c6.size] = volume;
        }
    }
    foreach (volume in function_f159c10d5cf8f0b4("noent_volume_info", "classname")) {
        if (isdefined(volume.targetname) && issubstr(volume.targetname, "poi_trigger_")) {
            var_349bb06748e578c6[var_349bb06748e578c6.size] = volume;
        }
    }
    if (isdefined(var_349bb06748e578c6) && var_349bb06748e578c6.size > 0) {
        foreach (volume in var_349bb06748e578c6) {
            poiName = tolower(getsubstr(volume.targetname, 12));
            if (!isdefined(level.var_dbb3dd5ab77ccd48)) {
                level.var_dbb3dd5ab77ccd48 = [];
            }
            volume.poi = poiName;
            if (!array_contains(level.var_dbb3dd5ab77ccd48, poiName)) {
                level.var_dbb3dd5ab77ccd48[level.var_dbb3dd5ab77ccd48.size] = poiName;
                level.var_da9edb0c15be1c3b[poiName] = volume;
            } else {
                if (!isdefined(level.var_ff89a1714af44c4e)) {
                    level.var_ff89a1714af44c4e = [];
                }
                level.var_ff89a1714af44c4e[poiName] = level.var_da9edb0c15be1c3b[poiName];
                level.var_da9edb0c15be1c3b[poiName] = volume;
            }
        }
    }
}

// Namespace poi/namespace_37f0fb6355a4618a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x985
// Size: 0x14b
function private function_86cc972493600938() {
    level.var_acf99124377543bb = [];
    if (isdefined(level.var_da9edb0c15be1c3b) && level.var_da9edb0c15be1c3b.size > 0) {
        foreach (poiName, volume in level.var_da9edb0c15be1c3b) {
            level.var_acf99124377543bb[poiName] = volume.origin;
        }
    } else {
        var_c46a79729cba49de = [];
        var_c46a79729cba49de["saba_hydro"] = (-8968, 8225, 772);
        var_c46a79729cba49de["saba_oilfield"] = (-23684, 21737, 436);
        var_c46a79729cba49de["saba_fort"] = (18357, -54628, 2270);
        var_c46a79729cba49de["saba_exhume"] = (-49193, 14284, 1674);
        foreach (poiName in level.var_dbb3dd5ab77ccd48) {
            if (isdefined(var_c46a79729cba49de[poiName])) {
                level.var_acf99124377543bb[poiName] = var_c46a79729cba49de[poiName];
            }
        }
    }
}

// Namespace poi/namespace_37f0fb6355a4618a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xad7
// Size: 0x97
function private function_84291fc4abf2c2d() {
    foreach (poiName, poi in level.poi) {
        var_29260d0089df816 = spawnstruct();
        var_29260d0089df816.poiName = poiName;
        var_29260d0089df816.var_71ad22c5d093d90b = "orphan";
        function_d0e7647e5538eb9d(poiName, "subAreas", var_29260d0089df816, var_29260d0089df816.var_71ad22c5d093d90b);
    }
}

// Namespace poi/namespace_37f0fb6355a4618a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb75
// Size: 0xdd
function private function_28bfdfbf2b7b36c2() {
    foreach (poi in level.poi) {
        if (!isdefined(poi["subAreas"])) {
            continue;
        }
        foreach (subArea in poi["subAreas"]) {
            subArea.var_3ebb6024e3f220ca = [];
            subArea.var_25087194b5e05d51 = 0;
            subArea.var_d276b08c96430bfc = [];
            subArea.var_24a2cd19eed8f75d = [];
        }
    }
}

// Namespace poi/namespace_37f0fb6355a4618a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc59
// Size: 0x265
function private function_1698577d68385123() {
    ents = array_combine(getentarray("trigger_multiple", "classname"), function_f159c10d5cf8f0b4("noent_volume_trigger", "classname"), function_f159c10d5cf8f0b4("noent_volume_info", "classname"));
    var_78fa8d928a0c292 = [];
    function_44739fe1cf82e29a("subAreas");
    foreach (ent in ents) {
        if (isdefined(ent.script_noteworthy) && issubstr(ent.script_noteworthy, "subarea_")) {
            struct = spawnstruct();
            struct.trigger = ent;
            var_84a8c10c861d7ce0 = "saba_";
            if (isdefined(level.var_4d8386eca283e9c4)) {
                var_84a8c10c861d7ce0 = level.var_4d8386eca283e9c4;
            }
            tokens = strtok(ent.script_noteworthy, "_");
            poiName = var_84a8c10c861d7ce0 + tolower(function_996b01cd49d0128d(array_slice(tokens, 1, tokens.size - 1), "_"));
            var_6a01ff17267a7f86 = tokens[0].size + tokens[1].size + 2;
            if (issubstr(ent.script_noteworthy, "suburb_") || issubstr(ent.script_noteworthy, "suburbs_")) {
                var_6a01ff17267a7f86 = tokens[0].size + tokens[1].size + tokens[2].size + 3;
            }
            struct.var_71ad22c5d093d90b = tolower(getsubstr(ent.script_noteworthy, var_6a01ff17267a7f86));
            struct.poi = poiName;
            foreach (var_a0b37d5f4a050123, poi in level.poi) {
                if (issubstr(var_a0b37d5f4a050123, poiName)) {
                    function_d0e7647e5538eb9d(var_a0b37d5f4a050123, "subAreas", struct, struct.var_71ad22c5d093d90b);
                }
            }
        }
    }
    function_84291fc4abf2c2d();
    function_28bfdfbf2b7b36c2();
}

// Namespace poi/namespace_37f0fb6355a4618a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xec5
// Size: 0x82
function function_985798a13250c99a(poiName) {
    var_e995bb533046188d = undefined;
    if (level.var_9f0a2752e6e5371a) {
        var_e995bb533046188d = level.var_a8bf194418e9a8dd[poiName];
    } else {
        var_e995bb533046188d = tablelookup("mp/map_callouts/" + level.mapname + "_callouts.csv", 1, poiName, 0);
        if (isdefined(var_e995bb533046188d) && var_e995bb533046188d != "") {
            var_e995bb533046188d = int(var_e995bb533046188d);
        } else {
            var_e995bb533046188d = array_find(level.var_dbb3dd5ab77ccd48, poiName);
        }
    }
    return var_e995bb533046188d;
}

// Namespace poi/namespace_37f0fb6355a4618a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf4f
// Size: 0x16
function function_f9340f4b7f231bc1(var_d26bcec5b7ac16f1) {
    level.var_d26bcec5b7ac16f1 = var_d26bcec5b7ac16f1;
}

// Namespace poi/namespace_37f0fb6355a4618a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf6c
// Size: 0x38
function function_80cdaea4bd3ecf70(poiName) {
    var_d455648308e34f3f = 0;
    if (isdefined(poiName)) {
        var_c70bfaffc89d58af = function_985798a13250c99a(poiName);
        if (isdefined(var_c70bfaffc89d58af)) {
            var_d455648308e34f3f = var_c70bfaffc89d58af;
        }
    }
    return var_d455648308e34f3f;
}

// Namespace poi/namespace_37f0fb6355a4618a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xfac
// Size: 0x158
function private function_f1894e1c6faff01() {
    if (!isdefined(level.var_da9edb0c15be1c3b)) {
        return;
    }
    if (istrue(level.var_f257b1e13dcc1bad)) {
        return;
    }
    foreach (pname in level.var_dbb3dd5ab77ccd48) {
        if (!isdefined(level.poi[pname])) {
            continue;
        }
        level.poi[pname]["otherPoiByDist"] = [];
        curorigin = level.var_acf99124377543bb[pname];
        var_b75d6c3b38c167d9 = sortbydistance(level.var_da9edb0c15be1c3b, curorigin);
        foreach (volume in var_b75d6c3b38c167d9) {
            if (array_contains_key(level.poi, volume.poi)) {
                level.poi[pname]["otherPoiByDist"][level.poi[pname]["otherPoiByDist"].size] = volume.poi;
            }
        }
    }
}

// Namespace poi/namespace_37f0fb6355a4618a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x110b
// Size: 0x85
function function_3d397c9451f80077(poiName) {
    if (!function_47d356083884f913()) {
        return;
    }
    if (isdefined(level.poi[poiName])) {
        return level.poi[poiName];
    }
    if (!poi_isPOIActive(poiName)) {
        return;
    }
    level.poi[poiName] = function_183a2f183e4a605b();
    level.poi[poiName]["name"] = poiName;
    level.poi[poiName]["calloutIndex"] = function_985798a13250c99a(poiName);
    return level.poi[poiName];
}

// Namespace poi/namespace_37f0fb6355a4618a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1198
// Size: 0x6e
function private function_183a2f183e4a605b(poi) {
    if (!isdefined(poi)) {
        poi = [];
    }
    foreach (var_3f44c731fdddd082 in level.var_a09459a429deb934) {
        if (!isdefined(poi[var_3f44c731fdddd082])) {
            poi[var_3f44c731fdddd082] = [];
        }
    }
    return poi;
}

// Namespace poi/namespace_37f0fb6355a4618a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x120e
// Size: 0x9f
function function_44739fe1cf82e29a(var_3f44c731fdddd082) {
    if (!function_47d356083884f913()) {
        return;
    }
    if (!array_contains(level.var_a09459a429deb934, var_3f44c731fdddd082)) {
        level.var_a09459a429deb934[level.var_a09459a429deb934.size] = var_3f44c731fdddd082;
    }
    foreach (index, poi in level.poi) {
        level.poi[index] = function_183a2f183e4a605b(poi);
    }
}

// Namespace poi/namespace_37f0fb6355a4618a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12b4
// Size: 0x4c
function function_1af8a41e4c1252c7(poiName, var_3f44c731fdddd082) {
    if (!function_47d356083884f913()) {
        return;
    }
    if (!isdefined(poiName) || !isdefined(var_3f44c731fdddd082)) {
        return;
    }
    if (!array_contains(level.var_a09459a429deb934, var_3f44c731fdddd082)) {
        return;
    }
    return level.poi[poiName][var_3f44c731fdddd082];
}

// Namespace poi/namespace_37f0fb6355a4618a
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1308
// Size: 0xde
function function_d0e7647e5538eb9d(poiName, var_3f44c731fdddd082, var_f8ff5670b74761d2, var_ec51fe53d55f33a1) {
    if (!function_47d356083884f913()) {
        return;
    }
    if (!isdefined(poiName)) {
        return;
    }
    if (!poi_isPOIActive(poiName)) {
        return;
    }
    if (!isdefined(level.poi[poiName])) {
        return;
    }
    if (isdefined(var_ec51fe53d55f33a1)) {
        level.poi[poiName][var_3f44c731fdddd082][var_ec51fe53d55f33a1] = var_f8ff5670b74761d2;
    } else {
        level.poi[poiName][var_3f44c731fdddd082][level.poi[poiName][var_3f44c731fdddd082].size] = var_f8ff5670b74761d2;
    }
    if (isdefined(var_f8ff5670b74761d2.origin)) {
        subArea = function_a44e168e8cced18(var_f8ff5670b74761d2.origin, poiName);
        if (isdefined(subArea) && isdefined(subArea.var_71ad22c5d093d90b)) {
            var_f8ff5670b74761d2.var_71ad22c5d093d90b = subArea.var_71ad22c5d093d90b;
        }
    }
}

// Namespace poi/namespace_37f0fb6355a4618a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13ed
// Size: 0x2c
function function_d2ed76e2bedd339e(poiName) {
    if (isdefined(poiName) && isdefined(level.var_acf99124377543bb)) {
        return level.var_acf99124377543bb[poiName];
    }
    return undefined;
}

// Namespace poi/namespace_37f0fb6355a4618a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1421
// Size: 0x6f
function function_ab3b7f9663bc2e89(subArea) {
    origin = undefined;
    if (isdefined(subArea)) {
        if (level.var_9f0a2752e6e5371a) {
            if (isdefined(subArea.origin)) {
                origin = subArea.origin;
            }
        } else if (isdefined(subArea.trigger)) {
            origin = subArea.trigger.origin;
        }
    }
    return origin;
}

// Namespace poi/namespace_37f0fb6355a4618a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1498
// Size: 0x45
function function_9c93e67f90980177(origin) {
    poi = function_6cc445c02b5effac(origin, 1);
    return isdefined(poi) && (!isdefined(level.var_ab20b3a256911579) || !array_contains(level.var_ab20b3a256911579, poi));
}

// Namespace poi/namespace_37f0fb6355a4618a
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14e5
// Size: 0x8c
function function_6cc445c02b5effac(origin, var_b0068b35c79ea7fa, var_9d9d80abb79138bb, var_db259b7e9331b0a0) {
    poiName = undefined;
    if (!function_47d356083884f913()) {
        return poiName;
    }
    if (level.var_9f0a2752e6e5371a) {
        var_303ce5a5cea462cd = function_3db4b97c31efed0b(1, origin);
        if (isdefined(var_303ce5a5cea462cd)) {
            poiName = level.var_e124a5f0a9bfc600[var_303ce5a5cea462cd];
        }
    } else {
        poiName = function_1cbc1b619b924e7a(origin, var_b0068b35c79ea7fa, var_db259b7e9331b0a0);
    }
    if (!isdefined(poiName)) {
        poiName = function_55cf921efa4cbd09(origin, var_b0068b35c79ea7fa, var_9d9d80abb79138bb, var_db259b7e9331b0a0);
    }
    return poiName;
}

// Namespace poi/namespace_37f0fb6355a4618a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1579
// Size: 0x12a
function function_d795b532bedd6431(poiName, origin) {
    if (level.var_9f0a2752e6e5371a) {
        var_9dc07c2ea03a5012 = function_3db4b97c31efed0b(2, origin);
        foreach (subArea in level.poi[poiName]["subAreas"]) {
            if (isdefined(subArea.site) && isdefined(var_9dc07c2ea03a5012) && var_9dc07c2ea03a5012 == subArea.site) {
                return subArea;
            }
        }
    } else {
        foreach (subArea in level.poi[poiName]["subAreas"]) {
            if (isdefined(subArea.trigger) && ispointinvolume(origin, subArea.trigger)) {
                return subArea;
            }
        }
    }
    return undefined;
}

// Namespace poi/namespace_37f0fb6355a4618a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16ab
// Size: 0x66
function function_150af7f3a2874667(poiName) {
    if (level.var_9f0a2752e6e5371a) {
        /#
            assert(isdefined(level.var_a8bf194418e9a8dd));
        #/
        var_9690281e1623b6ae = level.var_a8bf194418e9a8dd[poiName];
        if (isdefined(var_9690281e1623b6ae)) {
            var_319cf60cfbcd082f = function_7fdd7f9d54666e5f(1, var_9690281e1623b6ae);
            return var_319cf60cfbcd082f.name;
        }
    }
    return poiName;
}

// Namespace poi/namespace_37f0fb6355a4618a
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1719
// Size: 0x109
function private function_1cbc1b619b924e7a(origin, var_b0068b35c79ea7fa, var_9d9d80abb79138bb, var_db259b7e9331b0a0) {
    if (!function_47d356083884f913()) {
        return undefined;
    }
    if (!isdefined(var_b0068b35c79ea7fa)) {
        var_b0068b35c79ea7fa = 0;
    }
    if (!isdefined(var_9d9d80abb79138bb)) {
        var_9d9d80abb79138bb = 1;
    }
    if (!isdefined(var_db259b7e9331b0a0)) {
        var_db259b7e9331b0a0 = 0;
    }
    var_5d0bb59f45d65c1c = ter_op(var_b0068b35c79ea7fa, level.var_dbb3dd5ab77ccd48, getarraykeys(level.poi));
    foreach (poiName in var_5d0bb59f45d65c1c) {
        if (!var_9d9d80abb79138bb && issubstr(poiName, "suburb")) {
            continue;
        }
        if (var_db259b7e9331b0a0 && !isdefined(level.poi[poiName]["calloutIndex"])) {
            continue;
        }
        if (isdefined(level.var_da9edb0c15be1c3b[poiName])) {
            if (function_7e8fc13f3d0d5c87(origin, poiName)) {
                return poiName;
            }
        }
    }
}

// Namespace poi/namespace_37f0fb6355a4618a
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1829
// Size: 0x8b
function private function_7e8fc13f3d0d5c87(origin, poiName) {
    if (function_47d356083884f913()) {
        var_6e80031ce7163196 = isdefined(level.var_da9edb0c15be1c3b[poiName]) && ispointinvolume(origin, level.var_da9edb0c15be1c3b[poiName]);
        var_dd4dff0b187cb059 = isdefined(level.var_ff89a1714af44c4e) && isdefined(level.var_ff89a1714af44c4e[poiName]) && ispointinvolume(origin, level.var_ff89a1714af44c4e[poiName]);
        return (var_6e80031ce7163196 || var_dd4dff0b187cb059);
    }
    return undefined;
}

// Namespace poi/namespace_37f0fb6355a4618a
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18bc
// Size: 0x152
function function_55cf921efa4cbd09(origin, var_b0068b35c79ea7fa, var_9d9d80abb79138bb, var_db259b7e9331b0a0) {
    if (!isdefined(origin)) {
        return;
    }
    if (function_47d356083884f913()) {
        var_574b367a589e1f37 = undefined;
        var_ea5672010d764ebc = undefined;
        if (!isdefined(var_b0068b35c79ea7fa)) {
            var_b0068b35c79ea7fa = 0;
        }
        if (!isdefined(var_9d9d80abb79138bb)) {
            var_9d9d80abb79138bb = 1;
        }
        if (!isdefined(var_db259b7e9331b0a0)) {
            var_db259b7e9331b0a0 = 0;
        }
        var_5d0bb59f45d65c1c = ter_op(var_b0068b35c79ea7fa, level.var_dbb3dd5ab77ccd48, getarraykeys(level.poi));
        foreach (poiName in var_5d0bb59f45d65c1c) {
            if (!var_9d9d80abb79138bb && issubstr(poiName, "suburb")) {
                continue;
            }
            if (!isdefined(level.var_acf99124377543bb[poiName])) {
                continue;
            }
            if (var_db259b7e9331b0a0 && !isdefined(level.poi[poiName]["calloutIndex"])) {
                continue;
            }
            dist = distance2dsquared(level.var_acf99124377543bb[poiName], origin);
            if (!isdefined(var_ea5672010d764ebc) || dist < var_ea5672010d764ebc) {
                var_574b367a589e1f37 = poiName;
                var_ea5672010d764ebc = dist;
            }
        }
        return var_574b367a589e1f37;
    }
}

// Namespace poi/namespace_37f0fb6355a4618a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a15
// Size: 0x6d
function function_80dd9d6a6bf6bbc1(agent, poiName, origin) {
    if (!isdefined(poiName)) {
        poiName = undefined;
        var_3a6b42ab825a103e = agent.origin;
        if (isdefined(origin)) {
            var_3a6b42ab825a103e = origin;
        }
        poiName = function_6cc445c02b5effac(var_3a6b42ab825a103e);
    }
    agent.poi = poiName;
    if (isdefined(poiName)) {
        agent namespace_14d36171baccf528::agentPers_setAgentPersData(agent, "poiName", poiName);
    }
    return poiName;
}

// Namespace poi/namespace_37f0fb6355a4618a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a8a
// Size: 0x8c
function function_9656b61cc8a37cba(array, poiName) {
    var_50f783a5617f8940 = [];
    foreach (item in array) {
        if (isdefined(item.poi) && item.poi == poiName) {
            var_50f783a5617f8940[var_50f783a5617f8940.size] = item;
        }
    }
    return var_50f783a5617f8940;
}

// Namespace poi/namespace_37f0fb6355a4618a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b1e
// Size: 0xd
function function_47d356083884f913() {
    return isdefined(level.poi);
}

// Namespace poi/namespace_37f0fb6355a4618a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b33
// Size: 0x16
function function_53c14fe145417e51(array) {
    level.var_dbb3dd5ab77ccd48 = array;
}

// Namespace poi/namespace_37f0fb6355a4618a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b50
// Size: 0x40
function poi_isPOIActive(poiName) {
    return isdefined(poiName) && function_47d356083884f913() && array_contains(level.var_dbb3dd5ab77ccd48, poiName) && !array_contains(level.var_ab20b3a256911579, poiName);
}

// Namespace poi/namespace_37f0fb6355a4618a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b98
// Size: 0x22
function function_7e9cbc0f32de6578() {
    return function_47d356083884f913() && level.var_ab20b3a256911579.size < level.var_dbb3dd5ab77ccd48.size;
}

// Namespace poi/namespace_37f0fb6355a4618a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1bc2
// Size: 0x3f1
function private function_52cb931e1834f98b() {
    level waittill_either("matchStartTimer_done", "br_ready_to_jump");
    while (!isdefined(level.players) || level.poi.size == 0) {
        waitframe();
    }
    var_3a1b9192a1f0b3c4 = istrue(level.var_2690bfebdead0396);
    var_6370de220eb9ec35 = getdvarint(@"hash_a9f6d0e41ea4bc32", 0);
    var_a45bd8f911724ada = getdvarint(@"hash_57b012f2c429bcb9", 1);
    var_a015167b01a60f17 = getdvarint(@"hash_88e87d9d935136d0", 5000);
    frameduration = level.frameduration;
    var_ff85928e34f7eb79 = floor(var_a015167b01a60f17 / frameduration);
    if (var_3a1b9192a1f0b3c4 && var_a45bd8f911724ada) {
        foreach (player in level.players) {
            poiName = function_1cbc1b619b924e7a(player.origin);
            if (isdefined(poiName)) {
                difficulty = function_6c8458742f557952(poiName);
                if (namespace_d696adde758cbe79::function_7a7aa3b5455f0412(poiName)) {
                    difficulty = 4;
                }
                player setclientomnvar("ui_dmz_poi_difficulty_rating", difficulty);
            }
        }
    }
    foreach (poiName, poi in level.poi) {
        level.poi[poiName]["players"] = [];
    }
    while (1) {
        players = level.players;
        var_e0e025c067d6a3aa = ceil(players.size / var_ff85928e34f7eb79);
        var_9f35e6303fc62b58 = 0;
        var_5b3bc73feda97439 = 0;
        for (var_99594a4d67fef20b = 0; var_99594a4d67fef20b < players.size; var_99594a4d67fef20b++) {
            player = players[var_99594a4d67fef20b];
            if (!isdefined(player)) {
                continue;
            }
            player.var_fb6bafb61d5c3d4a = undefined;
            if (var_3a1b9192a1f0b3c4 && isdefined(level.var_a524a11dadc4d9fb)) {
                foreach (name, trigger in level.var_a524a11dadc4d9fb) {
                    if (ispointinvolume(player.origin, trigger)) {
                        player.var_fb6bafb61d5c3d4a = name;
                        break;
                    }
                }
            }
            var_4642e4e356a13e50 = player.var_da28916e7827af7c;
            if (isdefined(var_4642e4e356a13e50)) {
                player.var_26c06c4a02fd70e7 = var_4642e4e356a13e50;
                level.poi[var_4642e4e356a13e50]["players"] = array_remove(level.poi[var_4642e4e356a13e50]["players"], player);
            }
            poiName = function_6cc445c02b5effac(player.origin);
            player.var_da28916e7827af7c = poiName;
            if (!isdefined(poiName)) {
                continue;
            }
            level.poi[poiName]["players"][level.poi[poiName]["players"].size] = player;
            var_1e8a1d9f5d0a3c9e = poiName;
            if (var_6370de220eb9ec35) {
                var_1e8a1d9f5d0a3c9e = function_150af7f3a2874667(poiName);
            }
            var_132c9f8d05cfd = !isdefined(var_4642e4e356a13e50) || var_4642e4e356a13e50 != player.var_da28916e7827af7c;
            player thread function_db35c17120dbfb4a(poiName, var_1e8a1d9f5d0a3c9e, var_132c9f8d05cfd, var_3a1b9192a1f0b3c4, var_a45bd8f911724ada);
            var_9f35e6303fc62b58++;
            if (var_9f35e6303fc62b58 >= var_e0e025c067d6a3aa) {
                var_9f35e6303fc62b58 = 0;
                var_5b3bc73feda97439++;
                waitframe();
            }
        }
        waittime = max(0, var_a015167b01a60f17 - var_5b3bc73feda97439 * frameduration) / 1000;
        wait(waittime);
    }
}

// Namespace poi/namespace_37f0fb6355a4618a
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1fba
// Size: 0x2ae
function private function_db35c17120dbfb4a(poiName, var_1e8a1d9f5d0a3c9e, var_132c9f8d05cfd, var_3a1b9192a1f0b3c4, var_a45bd8f911724ada) {
    player = self;
    if (var_132c9f8d05cfd) {
        vehicle = player namespace_f8065cafc523dba5::getvehicle();
        if (isdefined(vehicle) && isdefined(player.team)) {
            if (!isdefined(level.var_7352a1221b306395)) {
                level.var_7352a1221b306395 = [];
            }
            if (!isdefined(level.var_7352a1221b306395[var_1e8a1d9f5d0a3c9e])) {
                level.var_7352a1221b306395[var_1e8a1d9f5d0a3c9e] = [];
            }
            if (!isdefined(level.var_7352a1221b306395[var_1e8a1d9f5d0a3c9e][player.team])) {
                level.var_7352a1221b306395[var_1e8a1d9f5d0a3c9e][player.team] = 1;
                player namespace_aad14af462a74d08::function_5c3aa65db46763ff(vehicle, "poi_travel");
            }
        }
        var_d455648308e34f3f = -1;
        var_c70bfaffc89d58af = level.poi[poiName]["calloutIndex"];
        if (isdefined(var_c70bfaffc89d58af)) {
            var_d455648308e34f3f = var_c70bfaffc89d58af;
        }
        player setclientomnvar("ui_callout_area_id", var_d455648308e34f3f);
    }
    if (var_3a1b9192a1f0b3c4) {
        if (!isdefined(player.var_df1204f47f6f0067)) {
            player.var_df1204f47f6f0067 = [];
        }
        if (!isdefined(player.var_df1204f47f6f0067[var_1e8a1d9f5d0a3c9e])) {
            player.var_df1204f47f6f0067[var_1e8a1d9f5d0a3c9e] = {exittime:-99999999};
        }
        if (isdefined(player.var_26c06c4a02fd70e7) && player.var_26c06c4a02fd70e7 != player.var_da28916e7827af7c) {
            var_22d742bab072905a = gettime() - player.var_df1204f47f6f0067[var_1e8a1d9f5d0a3c9e].exittime;
            if (var_22d742bab072905a > level.var_d35175ec20b444c) {
                splash = "br_poi_entry_" + var_1e8a1d9f5d0a3c9e;
                if (issharedfuncdefined("hud", "showDMZSplash")) {
                    [[ getsharedfunc("hud", "showDMZSplash") ]](splash, [0:player]);
                }
            }
        }
        if (var_132c9f8d05cfd) {
            if (var_a45bd8f911724ada) {
                difficulty = function_6c8458742f557952(poiName);
                if (namespace_d696adde758cbe79::function_7a7aa3b5455f0412(poiName)) {
                    difficulty = 4;
                }
                player setclientomnvar("ui_dmz_poi_difficulty_rating", difficulty);
                player function_2c353ba60e43ecda(poiName);
            }
            namespace_8361bad7391de074::function_d10645afed0f00fe(player, var_1e8a1d9f5d0a3c9e);
            waitframe();
        }
        if (isalive(player) && isdefined(player.var_df1204f47f6f0067) && isdefined(player.var_df1204f47f6f0067[var_1e8a1d9f5d0a3c9e])) {
            player.var_df1204f47f6f0067[var_1e8a1d9f5d0a3c9e].exittime = gettime();
        }
    }
}

// Namespace poi/namespace_37f0fb6355a4618a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x226f
// Size: 0x7c
function private function_6c8458742f557952(poiName) {
    starlevel = namespace_6a3f8c14894f44be::function_5cc0c507e92f7b47(poiName);
    relativeDifficulty = 0;
    if (isdefined(level.poi[poiName]["relativeDifficulty"])) {
        relativeDifficulty = level.poi[poiName]["relativeDifficulty"];
    }
    if (relativeDifficulty == 3) {
        return 3;
    }
    if (starlevel > 3) {
        return 3;
    }
    if (relativeDifficulty == 2) {
        return 2;
    }
    if (starlevel >= 2) {
        return 2;
    }
    return 1;
}

// Namespace poi/namespace_37f0fb6355a4618a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x22f3
// Size: 0x59
function private function_fc5d5824570e8c21(player) {
    if (isdefined(player.var_da28916e7827af7c)) {
        level.poi[player.var_da28916e7827af7c]["players"] = array_remove(level.poi[player.var_da28916e7827af7c]["players"], player);
    }
}

// Namespace poi/namespace_37f0fb6355a4618a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2353
// Size: 0xc2
function private function_2c353ba60e43ecda(poiName) {
    if (!isdefined(poiName)) {
        poiName = self.var_da28916e7827af7c;
    }
    if (istrue(level.var_b76e1acdf15010d2)) {
        return;
    }
    difficulty = function_6c8458742f557952(poiName);
    if (namespace_d696adde758cbe79::function_7a7aa3b5455f0412(poiName)) {
        difficulty = 4;
    }
    switch (difficulty) {
    case 1:
        namespace_446fc987a980892f::function_d87d5deb069bf8e5("ai_density_low", [0:self]);
        break;
    case 2:
        namespace_446fc987a980892f::function_d87d5deb069bf8e5("ai_density_med", [0:self]);
        break;
    case 3:
    case 4:
        namespace_446fc987a980892f::function_d87d5deb069bf8e5("ai_density_high", [0:self]);
        break;
    }
}

// Namespace poi/namespace_37f0fb6355a4618a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x241c
// Size: 0x1c4
function private function_6e049f322172e1d5() {
    level.var_e124a5f0a9bfc600 = [];
    var_96e38bcf1337d181 = function_c3d63e6778e39f83(1);
    for (var_303ce5a5cea462cd = 0; var_303ce5a5cea462cd < var_96e38bcf1337d181; var_303ce5a5cea462cd++) {
        site = function_d0ed84c86e823a7c(1, var_303ce5a5cea462cd);
        region = function_7fdd7f9d54666e5f(1, site.region);
        poiName = region.name + " site_" + var_303ce5a5cea462cd;
        var_c720431da1c3945e = function_95c6391212a25f7c(tolower(region.name), " ");
        if (!isdefined(level.var_dbb3dd5ab77ccd48)) {
            level.var_dbb3dd5ab77ccd48 = [];
        }
        /#
            assert(!array_contains(level.var_dbb3dd5ab77ccd48, poiName));
        #/
        level.var_dbb3dd5ab77ccd48[level.var_dbb3dd5ab77ccd48.size] = poiName;
        level.var_acf99124377543bb[poiName] = site.origin;
        var_5a676af18f596e5 = "";
        if (isdefined(level.mapname)) {
            switch (level.mapname) {
            case #"hash_aeddd44c5b27b2d":
            case #"hash_bce1a7274538a78":
            case #"hash_73e90c896fdaebc3":
            case #"hash_9ae3f9a4f2372775":
                var_5a676af18f596e5 = "jup_bigmap_";
                break;
            default:
                var_5a676af18f596e5 = level.mapname + "_";
                break;
            }
        }
        level.var_93d766d265995ec6[poiName] = var_5a676af18f596e5 + var_c720431da1c3945e;
        level.var_e124a5f0a9bfc600[var_303ce5a5cea462cd] = poiName;
        level.var_a8bf194418e9a8dd[poiName] = site.region;
    }
}

// Namespace poi/namespace_37f0fb6355a4618a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x25e7
// Size: 0x151
function private function_9a051b4df049e90b() {
    if (!isdefined(level.var_e124a5f0a9bfc600)) {
        return;
    }
    if (istrue(level.var_f257b1e13dcc1bad)) {
        return;
    }
    foreach (poiName in level.var_dbb3dd5ab77ccd48) {
        if (!isdefined(level.poi[poiName])) {
            continue;
        }
        level.poi[poiName]["otherPoiByDist"] = [];
        curorigin = level.var_acf99124377543bb[poiName];
        var_b08c6727f8fd4cfa = function_215f81b58e38d670(1, curorigin);
        foreach (site in var_b08c6727f8fd4cfa) {
            if (array_contains_key(level.poi, level.var_e124a5f0a9bfc600[site])) {
                level.poi[poiName]["otherPoiByDist"][level.poi[poiName]["otherPoiByDist"].size] = level.var_e124a5f0a9bfc600[site];
            }
        }
    }
}

// Namespace poi/namespace_37f0fb6355a4618a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x273f
// Size: 0x187
function private function_b5c7469e80b1e8bd() {
    function_44739fe1cf82e29a("subAreas");
    gametype = namespace_cd0b2d039510b38d::getsubgametype() + "_";
    var_d8c79ee51c9021b6 = "mp/compass_regions/" + "compassregions_poi_sub_regions_" + gametype + level.mapname + ".csv";
    function_ce75c09cff4c1efb(var_d8c79ee51c9021b6, 2);
    if (function_afcbc7a4eac55f9e(2)) {
        var_96e38bcf1337d181 = function_c3d63e6778e39f83(2);
        for (var_303ce5a5cea462cd = 0; var_303ce5a5cea462cd < var_96e38bcf1337d181; var_303ce5a5cea462cd++) {
            var_849898b69efd7593 = function_d0ed84c86e823a7c(2, var_303ce5a5cea462cd);
            var_3851e646d941dcbb = function_3db4b97c31efed0b(1, var_849898b69efd7593.origin);
            if (isdefined(var_3851e646d941dcbb)) {
                var_bcf8a8aaf3e931fc = function_7fdd7f9d54666e5f(2, var_849898b69efd7593.region);
                subArea = spawnstruct();
                subArea.site = var_303ce5a5cea462cd;
                subArea.origin = var_849898b69efd7593.origin;
                subArea.var_71ad22c5d093d90b = var_bcf8a8aaf3e931fc.name + " site_" + var_303ce5a5cea462cd;
                subArea.poiName = var_bcf8a8aaf3e931fc.name;
                poiName = level.var_e124a5f0a9bfc600[var_3851e646d941dcbb];
                function_d0e7647e5538eb9d(poiName, "subAreas", subArea, subArea.var_71ad22c5d093d90b);
            }
        }
    }
    function_84291fc4abf2c2d();
    function_28bfdfbf2b7b36c2();
}

// Namespace poi/namespace_37f0fb6355a4618a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28cd
// Size: 0xf5
function function_68f5d2342ad95772() {
    if (!isdefined(level.var_9fab40ed3326f8b)) {
        return;
    }
    table = level.var_9fab40ed3326f8b;
    numrows = tablelookupgetnumrows(table);
    var_bfd57d442dee737f = undefined;
    for (i = 0; i < numrows; i++) {
        poiName = tablelookupbyrow(table, i, 0);
        if (!array_contains(level.var_dbb3dd5ab77ccd48, poiName)) {
            continue;
        }
        if (isdefined(var_bfd57d442dee737f) && isdefined(level.poi[poiName]) && isdefined(level.poi[poiName]["relativeDifficulty"]) && poiName == var_bfd57d442dee737f) {
            continue;
        }
        relativeDifficulty = int(tablelookupbyrow(table, i, 10));
        if (relativeDifficulty > 0 && relativeDifficulty <= 3) {
            level.poi[poiName]["relativeDifficulty"] = relativeDifficulty;
            var_bfd57d442dee737f = poiName;
        }
    }
}

// Namespace poi/namespace_37f0fb6355a4618a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29c9
// Size: 0x1ad
function function_683e582efd2a8233() {
    if (!isdefined(level.var_9fab40ed3326f8b)) {
        return;
    }
    table = level.var_9fab40ed3326f8b;
    numrows = tablelookupgetnumrows(table);
    var_bfd57d442dee737f = undefined;
    for (i = 0; i < numrows; i++) {
        poiName = tablelookupbyrow(table, i, 0);
        if (!array_contains(level.var_dbb3dd5ab77ccd48, poiName)) {
            continue;
        }
        if (isdefined(var_bfd57d442dee737f) && isdefined(level.poi[poiName]) && isdefined(level.poi[poiName]["minExtraBuyStations"]) && poiName == var_bfd57d442dee737f) {
            continue;
        }
        var_139fc69cc262b8e9 = tablelookupbyrow(table, i, 11);
        if (var_139fc69cc262b8e9 == "") {
            continue;
        }
        minExtraBuyStations = int(var_139fc69cc262b8e9);
        level.poi[poiName]["minExtraBuyStations"] = minExtraBuyStations;
        var_bfd57d442dee737f = poiName;
    }
    var_bfd57d442dee737f = undefined;
    for (i = 0; i < numrows; i++) {
        poiName = tablelookupbyrow(table, i, 0);
        if (!array_contains(level.var_dbb3dd5ab77ccd48, poiName)) {
            continue;
        }
        if (isdefined(var_bfd57d442dee737f) && isdefined(level.poi[poiName]) && isdefined(level.poi[poiName]["maxExtraBuyStations"]) && poiName == var_bfd57d442dee737f) {
            continue;
        }
        var_139fc69cc262b8e9 = tablelookupbyrow(table, i, 12);
        if (var_139fc69cc262b8e9 == "") {
            continue;
        }
        maxExtraBuyStations = int(var_139fc69cc262b8e9);
        level.poi[poiName]["maxExtraBuyStations"] = maxExtraBuyStations;
        var_bfd57d442dee737f = poiName;
    }
}

// Namespace poi/namespace_37f0fb6355a4618a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b7d
// Size: 0x132
function function_fab5ad80fd5ad70e() {
    if (!isdefined(level.var_523ca8329062da93)) {
        level.var_523ca8329062da93 = [];
    }
    var_d8c79ee51c9021b6 = "mp/compass_regions/" + "compassregions_misc_regions_" + level.mapname + ".csv";
    function_ce75c09cff4c1efb(var_d8c79ee51c9021b6, 4);
    if (function_afcbc7a4eac55f9e(4)) {
        var_96e38bcf1337d181 = function_c3d63e6778e39f83(4);
        for (var_303ce5a5cea462cd = 0; var_303ce5a5cea462cd < var_96e38bcf1337d181; var_303ce5a5cea462cd++) {
            var_7d2faedfb4e72797 = function_d0ed84c86e823a7c(4, var_303ce5a5cea462cd);
            var_195a4d0ab2c13079 = function_3db4b97c31efed0b(4, var_7d2faedfb4e72797.origin);
            if (isdefined(var_195a4d0ab2c13079)) {
                var_aafaf947d31a3ba0 = function_7fdd7f9d54666e5f(4, var_7d2faedfb4e72797.region);
                var_e363d4f8f7edbf6c = spawnstruct();
                var_e363d4f8f7edbf6c.site = var_303ce5a5cea462cd;
                var_e363d4f8f7edbf6c.origin = var_7d2faedfb4e72797.origin;
                var_e363d4f8f7edbf6c.name = var_aafaf947d31a3ba0.name;
                level.var_523ca8329062da93[var_aafaf947d31a3ba0.name] = var_e363d4f8f7edbf6c;
            }
        }
    }
}

// Namespace poi/namespace_37f0fb6355a4618a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cb6
// Size: 0xa2
function function_bfb73de4decfe852(origin) {
    if (isdefined(level.var_523ca8329062da93)) {
        var_1e0f91acb54fe361 = function_3db4b97c31efed0b(4, origin);
        foreach (region in level.var_523ca8329062da93) {
            if (isdefined(region.site) && isdefined(var_1e0f91acb54fe361) && var_1e0f91acb54fe361 == region.site) {
                return region;
            }
        }
    }
    return undefined;
}

