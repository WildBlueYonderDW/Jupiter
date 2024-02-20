// mwiii decomp prototype
#namespace namespace_9a8c945fe45c8e5;

// Namespace namespace_9a8c945fe45c8e5/namespace_296c793a004e81b3
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x97
// Size: 0x90
function dvarintvalue(dvar, var_a10706ca944ecd97, minval, maxval) {
    dvar = function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", level.gametype, "_", dvar);
    if (getdvar(dvar) == "") {
        setdvar(dvar, var_a10706ca944ecd97);
        return var_a10706ca944ecd97;
    }
    value = getdvarint(dvar);
    if (value > maxval) {
        value = maxval;
    } else if (value < minval) {
        value = minval;
    } else {
        return value;
    }
    setdvar(dvar, value);
    return value;
}

// Namespace namespace_9a8c945fe45c8e5/namespace_296c793a004e81b3
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12f
// Size: 0x90
function dvarfloatvalue(dvar, var_a10706ca944ecd97, minval, maxval) {
    dvar = function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", level.gametype, "_", dvar);
    if (getdvar(dvar) == "") {
        setdvar(dvar, var_a10706ca944ecd97);
        return var_a10706ca944ecd97;
    }
    value = getdvarfloat(dvar);
    if (value > maxval) {
        value = maxval;
    } else if (value < minval) {
        value = minval;
    } else {
        return value;
    }
    setdvar(dvar, value);
    return value;
}

// Namespace namespace_9a8c945fe45c8e5/namespace_296c793a004e81b3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c7
// Size: 0xb8
function registerwatchdvarint(var_f184c2d57255363, defaultvalue) {
    dvarstring = function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", level.gametype, "_", var_f184c2d57255363);
    if (getdvarint(dvarstring, -1) == -1) {
        setdvar(dvarstring, defaultvalue);
    }
    level.watchdvars[dvarstring] = spawnstruct();
    level.watchdvars[dvarstring].value = getdvarint(dvarstring, defaultvalue);
    level.watchdvars[dvarstring].type = "int";
    level.watchdvars[dvarstring].notifystring = "update_" + var_f184c2d57255363;
}

// Namespace namespace_9a8c945fe45c8e5/namespace_296c793a004e81b3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x286
// Size: 0xb8
function registerwatchdvarfloat(var_f184c2d57255363, defaultvalue) {
    dvarstring = function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", level.gametype, "_", var_f184c2d57255363);
    if (getdvarfloat(dvarstring, -1) == -1) {
        setdvar(dvarstring, defaultvalue);
    }
    level.watchdvars[dvarstring] = spawnstruct();
    level.watchdvars[dvarstring].value = getdvarfloat(dvarstring, defaultvalue);
    level.watchdvars[dvarstring].type = "float";
    level.watchdvars[dvarstring].notifystring = "update_" + var_f184c2d57255363;
}

// Namespace namespace_9a8c945fe45c8e5/namespace_296c793a004e81b3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x345
// Size: 0xbe
function registerwatchdvar(var_f184c2d57255363, defaultvalue) {
    dvarstring = function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", level.gametype, "_", var_f184c2d57255363);
    if (getdvar(dvarstring, "") == "") {
        setdvar(dvarstring, defaultvalue);
    }
    level.watchdvars[dvarstring] = spawnstruct();
    level.watchdvars[dvarstring].value = getdvar(dvarstring, defaultvalue);
    level.watchdvars[dvarstring].type = "string";
    level.watchdvars[dvarstring].notifystring = "update_" + var_f184c2d57255363;
}

// Namespace namespace_9a8c945fe45c8e5/namespace_296c793a004e81b3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40a
// Size: 0x49
function setoverridewatchdvar(dvarstring, value) {
    var_eb5f2cffbf051614 = function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", level.gametype, "_", dvarstring);
    level.overridewatchdvars[var_eb5f2cffbf051614] = value;
}

// Namespace namespace_9a8c945fe45c8e5/namespace_296c793a004e81b3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45a
// Size: 0x9c
function getwatcheddvar(dvarstring) {
    var_eb5f2cffbf051614 = function_3514ae5d09f47ed2(dvarstring);
    if (isdefined(level.overridewatchdvars) && isdefined(level.overridewatchdvars[var_eb5f2cffbf051614])) {
        return level.overridewatchdvars[var_eb5f2cffbf051614];
    } else if (isdefined(level.watchdvars) && isdefined(level.watchdvars[var_eb5f2cffbf051614]) && isdefined(level.watchdvars[var_eb5f2cffbf051614].value)) {
        return level.watchdvars[var_eb5f2cffbf051614].value;
    } else {
        return undefined;
    }
}

// Namespace namespace_9a8c945fe45c8e5/namespace_296c793a004e81b3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4fd
// Size: 0x29
function function_3514ae5d09f47ed2(dvarstring) {
    return function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", level.gametype, "_", dvarstring);
}

// Namespace namespace_9a8c945fe45c8e5/namespace_296c793a004e81b3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52e
// Size: 0x150
function updatewatcheddvarsexecute() {
    watchdvars = getarraykeys(level.watchdvars);
    foreach (dvarstring in watchdvars) {
        if (level.watchdvars[dvarstring].type == "string") {
            dvarvalue = getproperty(dvarstring, level.watchdvars[dvarstring].value);
        } else if (level.watchdvars[dvarstring].type == "float") {
            dvarvalue = getfloatproperty(dvarstring, level.watchdvars[dvarstring].value);
        } else {
            dvarvalue = getintproperty(dvarstring, level.watchdvars[dvarstring].value);
        }
        if (dvarvalue != level.watchdvars[dvarstring].value) {
            level.watchdvars[dvarstring].value = dvarvalue;
            level notify(level.watchdvars[dvarstring].notifystring, dvarvalue);
        }
    }
}

// Namespace namespace_9a8c945fe45c8e5/namespace_296c793a004e81b3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x685
// Size: 0x23
function updatewatcheddvars() {
    while (game["state"] == "playing") {
        updatewatcheddvarsexecute();
        wait(1);
    }
}

// Namespace namespace_9a8c945fe45c8e5/namespace_296c793a004e81b3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6af
// Size: 0x35
function getproperty(dvar, var_628828a6d842b1b9) {
    value = var_628828a6d842b1b9;
    /#
        setdevdvarifuninitialized(dvar, var_628828a6d842b1b9);
    #/
    value = getdvar(dvar, var_628828a6d842b1b9);
    return value;
}

// Namespace namespace_9a8c945fe45c8e5/namespace_296c793a004e81b3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ec
// Size: 0x35
function getintproperty(dvar, var_628828a6d842b1b9) {
    value = var_628828a6d842b1b9;
    /#
        setdevdvarifuninitialized(dvar, var_628828a6d842b1b9);
    #/
    value = getdvarint(dvar, var_628828a6d842b1b9);
    return value;
}

// Namespace namespace_9a8c945fe45c8e5/namespace_296c793a004e81b3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x729
// Size: 0x35
function getfloatproperty(dvar, var_628828a6d842b1b9) {
    value = var_628828a6d842b1b9;
    /#
        setdevdvarifuninitialized(dvar, var_628828a6d842b1b9);
    #/
    value = getdvarfloat(dvar, var_628828a6d842b1b9);
    return value;
}

// Namespace namespace_9a8c945fe45c8e5/namespace_296c793a004e81b3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x766
// Size: 0x20
function getoverridedvarintexceptmatchrulesvalues(override, fallback) {
    return getdvarint(override, getdvarint(fallback));
}

// Namespace namespace_9a8c945fe45c8e5/namespace_296c793a004e81b3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x78e
// Size: 0x20
function getoverridedvarfloatexceptmatchrulesvalues(override, fallback) {
    return getdvarfloat(override, getdvarfloat(fallback));
}

// Namespace namespace_9a8c945fe45c8e5/namespace_296c793a004e81b3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7b6
// Size: 0x20
function getoverridedvarexceptmatchrulesvalues(override, fallback) {
    return getdvar(override, getdvar(fallback));
}

// Namespace namespace_9a8c945fe45c8e5/namespace_296c793a004e81b3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7de
// Size: 0x82
function function_18581799c48cc262(class, member) {
    /#
        assert(isusingmatchrulesdata());
    #/
    dvar = function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", level.gametype, "_", member);
    data = getmatchrulesdata(class, member);
    if (getbuildversion() == "SHIP" || getdvar(dvar) == "") {
        setdynamicdvar(dvar, data);
    }
}

// Namespace namespace_9a8c945fe45c8e5/namespace_296c793a004e81b3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x867
// Size: 0x43
function function_29227adb79acc568(member, var_628828a6d842b1b9) {
    dvar = function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", level.gametype, "_", member);
    return getdvarint(dvar, var_628828a6d842b1b9);
}

// Namespace namespace_9a8c945fe45c8e5/namespace_296c793a004e81b3
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b2
// Size: 0x43
function function_ef4d323f56385843(member, var_628828a6d842b1b9) {
    dvar = function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", level.gametype, "_", member);
    return getdvarfloat(dvar, var_628828a6d842b1b9);
}

// Namespace namespace_9a8c945fe45c8e5/namespace_296c793a004e81b3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8fd
// Size: 0x43
function function_36fd7e50e2a25847(member, var_628828a6d842b1b9) {
    dvar = function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", level.gametype, "_", member);
    return getdvar(dvar, var_628828a6d842b1b9);
}

// Namespace namespace_9a8c945fe45c8e5/namespace_296c793a004e81b3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x948
// Size: 0x9b
function function_a972e013c8f2f2d4() {
    /#
        level notify("<unknown string>");
        level endon("<unknown string>");
        while (1) {
            level waittill("<unknown string>");
            setdevdvarifuninitialized(@"hash_7ae9abc841dc9c4b", 15);
            setdevdvarifuninitialized(@"hash_fe0a46289ab091e1", level.radarviewtime);
            setdevdvarifuninitialized(@"hash_5bded6d7c75e5248", "<unknown string>");
            setdevdvarifuninitialized(@"hash_b1f216df6049c46a", -1);
            setdevdvarifuninitialized(@"hash_681596f27a5e0f7a", 30);
            setdevdvarifuninitialized(@"hash_9d27a693c0c7d81b", 60);
        }
    #/
}

