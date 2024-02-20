// mwiii decomp prototype
#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;

#namespace namespace_b5e5499241eef72f;

// Namespace namespace_b5e5499241eef72f/namespace_d1fa53aa5515f8aa
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x7f
// Size: 0xd6
function bctable_setfiles(category, var_466b5c66cb068edf, var_466b5d66cb069112, var_466b5e66cb069345, var_466b5766cb0683e0, var_466b5866cb068613, var_466b5966cb068846) {
    anim.bctable[category] = [];
    if (isdefined(anim.bctabledeck)) {
        anim.bctabledeck[category] = undefined;
    }
    if (isdefined(anim.bctablelast)) {
        anim.bctablelast[category] = undefined;
    }
    if (isdefined(var_466b5c66cb068edf)) {
        bctable_addfile(category, var_466b5c66cb068edf);
    }
    if (isdefined(var_466b5d66cb069112)) {
        bctable_addfile(category, var_466b5d66cb069112);
    }
    if (isdefined(var_466b5e66cb069345)) {
        bctable_addfile(category, var_466b5e66cb069345);
    }
    if (isdefined(var_466b5766cb0683e0)) {
        bctable_addfile(category, var_466b5766cb0683e0);
    }
    if (isdefined(var_466b5866cb068613)) {
        bctable_addfile(category, var_466b5866cb068613);
    }
    if (isdefined(var_466b5966cb068846)) {
        bctable_addfile(category, var_466b5966cb068846);
    }
}

// Namespace namespace_b5e5499241eef72f/namespace_d1fa53aa5515f8aa
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15c
// Size: 0x148
function bctable_addfile(category, filename) {
    for (row = 0; 1; row++) {
        var_e37a12d937d7dad9 = tolower(tablelookupbyrow(filename, row, 0));
        var_1a7bd761bf8e6ad4 = tolower(tablelookupbyrow(filename, row, 1));
        var_37bccd17fea9d291 = [];
        while (1) {
            alias = tolower(tablelookupbyrow(filename, row, var_37bccd17fea9d291.size + 2));
            if (alias == "") {
                break;
            }
            var_37bccd17fea9d291[var_37bccd17fea9d291.size] = alias;
        }
        if (var_e37a12d937d7dad9 == "" && var_1a7bd761bf8e6ad4 == "" && var_37bccd17fea9d291.size == 0) {
            break;
        }
        if (var_e37a12d937d7dad9 == "") {
            var_e37a12d937d7dad9 = "all";
        }
        if (var_1a7bd761bf8e6ad4 == "") {
            var_1a7bd761bf8e6ad4 = "all";
        }
        key = bctable_categorykey(var_e37a12d937d7dad9, var_1a7bd761bf8e6ad4);
        if (!isdefined(anim.bctable[category][key])) {
            anim.bctable[category][key] = [];
        }
        size = anim.bctable[category][key].size;
        anim.bctable[category][key][size] = var_37bccd17fea9d291;
    }
}

// Namespace namespace_b5e5499241eef72f/namespace_d1fa53aa5515f8aa
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2ab
// Size: 0x27f
function bctable_pickaliasset(category, type, modifier) {
    key = bctable_categorykey(type, modifier);
    if (!bctable_exists(category, type, modifier)) {
        /#
            println("<unknown string>" + modifier);
        #/
        return undefined;
    }
    if (!isdefined(anim.bctabledeck) || !isdefined(anim.bctabledeck[category]) || !isdefined(anim.bctabledeck[category][key])) {
        anim.bctabledeck[category][key] = [];
        for (index = 0; index < anim.bctable[category][key].size; index++) {
            anim.bctabledeck[category][key][index] = index;
        }
        var_99675918f5aa101d = anim.bctabledeck[category][key].size;
        if (var_99675918f5aa101d >= 3) {
            anim.bctabledeck[category][key] = array_randomize(anim.bctabledeck[category][key]);
        }
        if (var_99675918f5aa101d >= 2) {
            if (isdefined(anim.bctablelast) && isdefined(anim.bctablelast[category][key]) && anim.bctablelast[category][key] == anim.bctabledeck[category][key][var_99675918f5aa101d - 1]) {
                temp = anim.bctabledeck[category][key][0];
                anim.bctabledeck[category][key][0] = anim.bctabledeck[category][key][var_99675918f5aa101d - 1];
                anim.bctabledeck[category][key][var_99675918f5aa101d - 1] = temp;
            }
        }
    }
    if (anim.bctabledeck[category][key].size == 0) {
        return undefined;
    }
    var_7f5b77ff7b97ac80 = anim.bctabledeck[category][key].size - 1;
    tableindex = anim.bctabledeck[category][key][var_7f5b77ff7b97ac80];
    result = anim.bctable[category][key][tableindex];
    /#
        assert(isdefined(result));
    #/
    anim.bctabledeck[category][key][var_7f5b77ff7b97ac80] = undefined;
    if (anim.bctabledeck[category][key].size == 0) {
        anim.bctabledeck[category][key] = undefined;
    }
    anim.bctablelast[category][key] = tableindex;
    return result;
}

// Namespace namespace_b5e5499241eef72f/namespace_d1fa53aa5515f8aa
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x532
// Size: 0x79
function bctable_exists(category, type, modifier) {
    if (!isdefined(anim.bctable) || !isdefined(anim.bctable[category])) {
        return 0;
    }
    key = bctable_categorykey(type, modifier);
    if (!isdefined(anim.bctable[category][key])) {
        return 0;
    }
    if (anim.bctable[category][key].size == 0) {
        return 0;
    }
    return 1;
}

// Namespace namespace_b5e5499241eef72f/namespace_d1fa53aa5515f8aa
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b3
// Size: 0x3f
function bctable_categorykey(type, modifier) {
    if (!isdefined(type)) {
        type = "all";
    }
    if (!isdefined(modifier)) {
        modifier = "all";
    }
    return tolower(type) + "_" + tolower(modifier);
}

