#using scripts\common\callbacks;
#using scripts\common\utility;
#using scripts\engine\utility;

#namespace namespace_4f3742cd39063b9;

// Namespace namespace_4f3742cd39063b9 / namespace_eb369ce7be7f0198
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf6
// Size: 0x107
function function_8df651a1b2728b15(blueprintname, weaponkey) {
    var_5a0f9e1af605f0f5 = function_98442f5bef361b2b("genericblueprint", blueprintname);
    if (!isdefined(var_5a0f9e1af605f0f5)) {
        /#
            errortext = "<dev string:x1c>" + function_3c8848a3a11b2553(blueprintname) + "<dev string:x45>";
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
        errortext = "<dev string:x4a>" + function_3c8848a3a11b2553(weaponkey) + "<dev string:x6d>" + function_3c8848a3a11b2553(blueprintname) + "<dev string:x45>";
        iprintln(errortext);
    #/
    return undefined;
}

// Namespace namespace_4f3742cd39063b9 / namespace_eb369ce7be7f0198
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x206
// Size: 0x107
function function_b9ff4b6230995332(blueprintname, weaponkey) {
    var_5a0f9e1af605f0f5 = function_98442f5bef361b2b("genericblueprint", blueprintname);
    if (!isdefined(var_5a0f9e1af605f0f5)) {
        /#
            errortext = "<dev string:x1c>" + function_3c8848a3a11b2553(blueprintname) + "<dev string:x45>";
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
        errortext = "<dev string:x4a>" + function_3c8848a3a11b2553(weaponkey) + "<dev string:x6d>" + function_3c8848a3a11b2553(blueprintname) + "<dev string:x45>";
        iprintln(errortext);
    #/
    return undefined;
}

// Namespace namespace_4f3742cd39063b9 / namespace_eb369ce7be7f0198
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x316
// Size: 0xbd
function getassetlist(bundle, assettype) {
    switch (assettype) {
    case #"xmodel":
        return bundle.xmodellist;
    case #"vfx":
        return bundle.var_3e8ea9dd090a091b;
    case #"string":
        return bundle.stringlist;
    case #"suit":
        return bundle.suitlist;
    case #"execution":
        return bundle.executionlist;
    default:
        /#
            errortext = "<dev string:x8d>";
            iprintln(errortext);
        #/
        return undefined;
    }
}

// Namespace namespace_4f3742cd39063b9 / namespace_eb369ce7be7f0198
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3db
// Size: 0x123
function function_29e16a88682086b2(blueprintname, assettype, key) {
    var_5a0f9e1af605f0f5 = function_98442f5bef361b2b("genericblueprint", blueprintname);
    if (!isdefined(var_5a0f9e1af605f0f5)) {
        /#
            errortext = "<dev string:x1c>" + function_3c8848a3a11b2553(blueprintname) + "<dev string:x45>";
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
        errortext = "<dev string:xb1>" + assettype + "<dev string:xd4>" + function_3c8848a3a11b2553(key) + "<dev string:xe8>" + function_3c8848a3a11b2553(blueprintname) + "<dev string:x45>";
        iprintln(errortext);
    #/
    return undefined;
}

// Namespace namespace_4f3742cd39063b9 / namespace_eb369ce7be7f0198
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x507
// Size: 0x13e
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
        foreach (name, index in var_349c4e254a2c12df) {
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
// Checksum 0x0, Offset: 0x64e
// Size: 0xb6
function function_71efed8bf57f1d39(bundle, blueprintindex) {
    var_9b32d1936831f5aa = undefined;
    if (isdefined(bundle.var_d96d3e6ceed581fd.blueprints) && bundle.var_d96d3e6ceed581fd.blueprints.size > 0 && blueprintindex > 0) {
        var_9b32d1936831f5aa = bundle.var_d96d3e6ceed581fd.blueprints[blueprintindex - 1].genericblueprint;
    } else if (isdefined(bundle.var_d96d3e6ceed581fd.blueprint_default)) {
        var_9b32d1936831f5aa = bundle.var_d96d3e6ceed581fd.blueprint_default;
    }
    return var_9b32d1936831f5aa;
}

// Namespace namespace_4f3742cd39063b9 / namespace_eb369ce7be7f0198
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x70d
// Size: 0x1ad
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
            /#
                error("<dev string:x105>" + function_3c8848a3a11b2553(blueprintname));
            #/
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

// Namespace namespace_4f3742cd39063b9 / namespace_eb369ce7be7f0198
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8c2
// Size: 0x9d
function function_a03b57f924bf9a77(var_9b32d1936831f5aa) {
    genericblueprint = function_98442f5bef361b2b("genericblueprint", var_9b32d1936831f5aa);
    foreach (vfx in getassetlist(genericblueprint, #"vfx")) {
        utility::add_fx(function_f28fd66285fa2c9(var_9b32d1936831f5aa) + ":" + vfx.key, vfx.value);
    }
}

// Namespace namespace_4f3742cd39063b9 / namespace_eb369ce7be7f0198
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x967
// Size: 0x9c
function function_b68fa1978a63823a(bundle) {
    var_c7cb5929a169886 = bundle.var_d96d3e6ceed581fd.blueprint_default;
    function_a03b57f924bf9a77(var_c7cb5929a169886);
    foreach (blueprint in bundle.var_d96d3e6ceed581fd.blueprints) {
        function_a03b57f924bf9a77(blueprint.genericblueprint);
    }
}

// Namespace namespace_4f3742cd39063b9 / namespace_eb369ce7be7f0198
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xa0b
// Size: 0x52
function function_1792d9f5ade0ae4a(bundle, blueprintindex, var_43942779fa79c40a, position) {
    var_9b32d1936831f5aa = function_71efed8bf57f1d39(bundle, blueprintindex);
    playfx(utility::getfx(function_f28fd66285fa2c9(var_9b32d1936831f5aa) + ":" + var_43942779fa79c40a), position);
}

// Namespace namespace_4f3742cd39063b9 / namespace_eb369ce7be7f0198
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa65
// Size: 0x38
function function_696473ef4d75f1d3(bundle, blueprintindex) {
    var_9b32d1936831f5aa = function_71efed8bf57f1d39(bundle, blueprintindex);
    var_810c15bb2f4abd89 = function_3948a353eff6c51a(var_9b32d1936831f5aa);
    return var_810c15bb2f4abd89;
}

