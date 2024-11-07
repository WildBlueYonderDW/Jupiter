#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\callbacks.gsc;

#namespace namespace_4f3742cd39063b9;

// Namespace namespace_4f3742cd39063b9 / namespace_eb369ce7be7f0198
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x115
// Size: 0xf7
function function_8df651a1b2728b15(blueprintname, weaponkey) {
    var_5a0f9e1af605f0f5 = function_98442f5bef361b2b("genericblueprint", blueprintname);
    if (!isdefined(var_5a0f9e1af605f0f5)) {
        /#
            errortext = "<dev string:x1c>" + blueprintname + "<dev string:x42>";
            iprintln(errortext);
        #/
        return undefined;
    }
    foreach (entry in var_5a0f9e1af605f0f5.weaponlist) {
        if (entry.key == weaponkey) {
            if (entry.weapon == "") {
                return undefined;
            }
            return entry.weapon;
        }
    }
    /#
        errortext = "<dev string:x44>" + weaponkey + "<dev string:x64>" + blueprintname + "<dev string:x42>";
        iprintln(errortext);
    #/
    return undefined;
}

// Namespace namespace_4f3742cd39063b9 / namespace_eb369ce7be7f0198
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x215
// Size: 0xf7
function function_b9ff4b6230995332(blueprintname, weaponkey) {
    var_5a0f9e1af605f0f5 = function_98442f5bef361b2b("genericblueprint", blueprintname);
    if (!isdefined(var_5a0f9e1af605f0f5)) {
        /#
            errortext = "<dev string:x1c>" + blueprintname + "<dev string:x42>";
            iprintln(errortext);
        #/
        return undefined;
    }
    foreach (entry in var_5a0f9e1af605f0f5.weaponlist) {
        if (entry.key == weaponkey) {
            if (entry.weaponblueprint == "") {
                return undefined;
            }
            return entry.weaponblueprint;
        }
    }
    /#
        errortext = "<dev string:x44>" + weaponkey + "<dev string:x64>" + blueprintname + "<dev string:x42>";
        iprintln(errortext);
    #/
    return undefined;
}

// Namespace namespace_4f3742cd39063b9 / namespace_eb369ce7be7f0198
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x315
// Size: 0xa4
function getassetlist(bundle, assettype) {
    switch (assettype) {
    case #"hash_769eb8a21188fc4":
        return bundle.xmodellist;
    case #"hash_2ac140ce3b5ea398":
        return bundle.stringlist;
    case #"hash_2b36138a33884fe0":
        return bundle.suitlist;
    case #"hash_bfc3667f5f819e35":
        return bundle.executionlist;
    default:
        /#
            errortext = "<dev string:x81>";
            iprintln(errortext);
        #/
        return undefined;
    }
}

// Namespace namespace_4f3742cd39063b9 / namespace_eb369ce7be7f0198
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3c1
// Size: 0x114
function function_29e16a88682086b2(blueprintname, assettype, key) {
    var_5a0f9e1af605f0f5 = function_98442f5bef361b2b("genericblueprint", blueprintname);
    if (!isdefined(var_5a0f9e1af605f0f5)) {
        /#
            errortext = "<dev string:x1c>" + blueprintname + "<dev string:x42>";
            iprintln(errortext);
        #/
        return undefined;
    }
    assetlist = getassetlist(var_5a0f9e1af605f0f5, assettype);
    foreach (entry in assetlist) {
        if (entry.key == key) {
            if (entry.value == "") {
                return undefined;
            }
            return entry.value;
        }
    }
    /#
        errortext = "<dev string:xa2>" + assettype + "<dev string:xc2>" + key + "<dev string:xd3>" + blueprintname + "<dev string:x42>";
        iprintln(errortext);
    #/
    return undefined;
}

// Namespace namespace_4f3742cd39063b9 / namespace_eb369ce7be7f0198
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x4de
// Size: 0x13d
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
    attachmentarray = [];
    if (isdefined(attachmentname)) {
        attachmentarray = [attachmentname];
    }
    var_e658498427cc5a29 = [];
    if (isdefined(attachmentname) && isdefined(var_1fe8655c442492dc) && isdefined(var_85b2a5343fc91ccb)) {
        var_e658498427cc5a29 = [0];
        var_349c4e254a2c12df = function_3211981142ec5aee(weaponname, var_85b2a5343fc91ccb);
        foreach (index in var_349c4e254a2c12df) {
            if (name == attachmentname) {
                var_e658498427cc5a29 = [index];
                break;
            }
        }
    }
    return makeweapon(weaponname, attachmentarray, undefined, undefined, var_9be202c49cdf67ec, var_e658498427cc5a29);
}

// Namespace namespace_4f3742cd39063b9 / namespace_eb369ce7be7f0198
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x624
// Size: 0x1a8
function function_dd2a4fb3522f314(blueprintname, weaponkey) {
    if (isdefined(blueprintname) && isdefined(weaponkey)) {
        var_5a0f9e1af605f0f5 = function_98442f5bef361b2b("genericblueprint", blueprintname);
        weaponentry = undefined;
        foreach (weaponlistentry in var_5a0f9e1af605f0f5.weaponlist) {
            if (weaponlistentry.key == weaponkey) {
                weaponentry = weaponlistentry;
                break;
            }
        }
        if (!isdefined(weaponentry)) {
            error("could not find weaponIndex for generic blueprint " + blueprintname);
            return;
        }
        weaponname = ter_op(weaponentry.weapon != "", weaponentry.weapon, undefined);
        var_85b2a5343fc91ccb = ter_op(weaponentry.weaponblueprint != "", weaponentry.weaponblueprint, undefined);
        attachmentname = ter_op(weaponentry.attachment != "", weaponentry.attachment, undefined);
        var_1fe8655c442492dc = ter_op(weaponentry.attachmentblueprint != "", weaponentry.attachmentblueprint, undefined);
        return function_b9bd0a3d37510bfd(weaponname, var_85b2a5343fc91ccb, attachmentname, var_1fe8655c442492dc);
    }
    if (!isdefined(blueprintname)) {
        error("blueprintName not specified");
    }
    if (!isdefined(blueprintname)) {
        error("weaponKey not specified");
    }
    return undefined;
}

