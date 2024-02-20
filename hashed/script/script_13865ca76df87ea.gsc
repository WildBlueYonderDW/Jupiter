// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;

#namespace namespace_4f3742cd39063b9;

// Namespace namespace_4f3742cd39063b9/namespace_eb369ce7be7f0198
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x115
// Size: 0xfc
function function_8df651a1b2728b15(var_2a169c65850e1a47, var_5dc27a5bf459c504) {
    var_5a0f9e1af605f0f5 = function_98442f5bef361b2b("genericblueprint", var_2a169c65850e1a47);
    if (!isdefined(var_5a0f9e1af605f0f5)) {
        /#
            errortext = "<unknown string>" + var_2a169c65850e1a47 + "<unknown string>";
            iprintln(errortext);
        #/
        return undefined;
    }
    foreach (entry in var_5a0f9e1af605f0f5.weaponlist) {
        if (entry.key == var_5dc27a5bf459c504) {
            if (entry.weapon == "") {
                return undefined;
            } else {
                return entry.weapon;
            }
        }
    }
    /#
        errortext = "<unknown string>" + var_5dc27a5bf459c504 + "<unknown string>" + var_2a169c65850e1a47 + "<unknown string>";
        iprintln(errortext);
    #/
    return undefined;
}

// Namespace namespace_4f3742cd39063b9/namespace_eb369ce7be7f0198
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x219
// Size: 0xfc
function function_b9ff4b6230995332(var_2a169c65850e1a47, var_5dc27a5bf459c504) {
    var_5a0f9e1af605f0f5 = function_98442f5bef361b2b("genericblueprint", var_2a169c65850e1a47);
    if (!isdefined(var_5a0f9e1af605f0f5)) {
        /#
            errortext = "<unknown string>" + var_2a169c65850e1a47 + "<unknown string>";
            iprintln(errortext);
        #/
        return undefined;
    }
    foreach (entry in var_5a0f9e1af605f0f5.weaponlist) {
        if (entry.key == var_5dc27a5bf459c504) {
            if (entry.weaponblueprint == "") {
                return undefined;
            } else {
                return entry.weaponblueprint;
            }
        }
    }
    /#
        errortext = "<unknown string>" + var_5dc27a5bf459c504 + "<unknown string>" + var_2a169c65850e1a47 + "<unknown string>";
        iprintln(errortext);
    #/
    return undefined;
}

// Namespace namespace_4f3742cd39063b9/namespace_eb369ce7be7f0198
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31d
// Size: 0xa5
function getassetlist(bundle, assettype) {
    switch (assettype) {
    case #"hash_769eb8a21188fc4":
        return bundle.var_2004aae53b34a590;
    case #"hash_2ac140ce3b5ea398":
        return bundle.stringlist;
    case #"hash_2b36138a33884fe0":
        return bundle.var_a8eaa1a5b93277a4;
    case #"hash_bfc3667f5f819e35":
        return bundle.executionlist;
    default:
        /#
            errortext = "<unknown string>";
            iprintln(errortext);
        #/
        return undefined;
        break;
    }
}

// Namespace namespace_4f3742cd39063b9/namespace_eb369ce7be7f0198
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c9
// Size: 0x119
function function_29e16a88682086b2(var_2a169c65850e1a47, assettype, key) {
    var_5a0f9e1af605f0f5 = function_98442f5bef361b2b("genericblueprint", var_2a169c65850e1a47);
    if (!isdefined(var_5a0f9e1af605f0f5)) {
        /#
            errortext = "<unknown string>" + var_2a169c65850e1a47 + "<unknown string>";
            iprintln(errortext);
        #/
        return undefined;
    }
    assetlist = getassetlist(var_5a0f9e1af605f0f5, assettype);
    foreach (entry in assetlist) {
        if (entry.key == key) {
            if (entry.value == "") {
                return undefined;
            } else {
                return entry.value;
            }
        }
    }
    /#
        errortext = "<unknown string>" + assettype + "<unknown string>" + key + "<unknown string>" + var_2a169c65850e1a47 + "<unknown string>";
        iprintln(errortext);
    #/
    return undefined;
}

// Namespace namespace_4f3742cd39063b9/namespace_eb369ce7be7f0198
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ea
// Size: 0x146
function function_b9bd0a3d37510bfd(weaponname, var_85b2a5343fc91ccb, attachmentname, var_1fe8655c442492dc) {
    var_9be202c49cdf67ec = undefined;
    if (isdefined(var_85b2a5343fc91ccb)) {
        var_d0fe09e8474a28a8 = function_bb92a5000082832a(weaponname);
        foreach (name, index in var_d0fe09e8474a28a8) {
            if (name == var_85b2a5343fc91ccb) {
                var_9be202c49cdf67ec = index;
                break;
            }
        }
    }
    var_18f0a5759a8e40d9 = [];
    if (isdefined(attachmentname)) {
        var_18f0a5759a8e40d9 = [0:attachmentname];
    }
    var_e658498427cc5a29 = [];
    if (isdefined(attachmentname) && isdefined(var_1fe8655c442492dc) && isdefined(var_85b2a5343fc91ccb)) {
        var_e658498427cc5a29 = [0:0];
        var_349c4e254a2c12df = function_3211981142ec5aee(weaponname, var_85b2a5343fc91ccb);
        foreach (name, index in var_349c4e254a2c12df) {
            if (name == attachmentname) {
                var_e658498427cc5a29 = [0:index];
                break;
            }
        }
    }
    return makeweapon(weaponname, var_18f0a5759a8e40d9, undefined, undefined, var_9be202c49cdf67ec, var_e658498427cc5a29);
}

// Namespace namespace_4f3742cd39063b9/namespace_eb369ce7be7f0198
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x638
// Size: 0x1ad
function function_dd2a4fb3522f314(var_2a169c65850e1a47, var_5dc27a5bf459c504) {
    if (isdefined(var_2a169c65850e1a47) && isdefined(var_5dc27a5bf459c504)) {
        var_5a0f9e1af605f0f5 = function_98442f5bef361b2b("genericblueprint", var_2a169c65850e1a47);
        var_49f9de7947f961eb = undefined;
        foreach (var_8030b649c10983c7 in var_5a0f9e1af605f0f5.weaponlist) {
            if (var_8030b649c10983c7.key == var_5dc27a5bf459c504) {
                var_49f9de7947f961eb = var_8030b649c10983c7;
                break;
            }
        }
        if (!isdefined(var_49f9de7947f961eb)) {
            error("could not find weaponIndex for generic blueprint " + var_2a169c65850e1a47);
            return;
        }
        weaponname = ter_op(var_49f9de7947f961eb.weapon != "", var_49f9de7947f961eb.weapon, undefined);
        var_85b2a5343fc91ccb = ter_op(var_49f9de7947f961eb.weaponblueprint != "", var_49f9de7947f961eb.weaponblueprint, undefined);
        attachmentname = ter_op(var_49f9de7947f961eb.attachment != "", var_49f9de7947f961eb.attachment, undefined);
        var_1fe8655c442492dc = ter_op(var_49f9de7947f961eb.var_61a3f233cfd1669f != "", var_49f9de7947f961eb.var_61a3f233cfd1669f, undefined);
        return function_b9bd0a3d37510bfd(weaponname, var_85b2a5343fc91ccb, attachmentname, var_1fe8655c442492dc);
    } else {
        if (!isdefined(var_2a169c65850e1a47)) {
            error("blueprintName not specified");
        }
        if (!isdefined(var_2a169c65850e1a47)) {
            error("weaponKey not specified");
        }
        return undefined;
    }
}

