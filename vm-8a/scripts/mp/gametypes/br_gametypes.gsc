#using scripts\engine\utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\utility\script.gsc;

#namespace br_gametypes;

// Namespace br_gametypes / scripts\mp\gametypes\br_gametypes
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb5
// Size: 0xee
function init() {
    level.brgametype = spawnstruct();
    level.brgametype.funcs = [];
    level.brgametype.disabledfeatures = [];
    level.brgametype.enabledfeatures = [];
    level.brgametype.data = [];
    level.brgametype.name = scripts\cp_mp\utility\game_utility::function_6c1fce6f6b8779d5();
    level.brgametype.var_88f31052c5135f3b = level.brgametype.name;
    if (getdvar(@"hash_8fe3271cd74f65a2") == "codmas") {
        level.brgametype.var_88f31052c5135f3b = "codmas";
    }
    if (isdefined(level.var_cdc15ee14362fbf)) {
        [[ level.var_cdc15ee14362fbf ]]();
    }
}

// Namespace br_gametypes / scripts\mp\gametypes\br_gametypes
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ab
// Size: 0x57
function registerbrgametypefunc(funcname, function) {
    if (isdefined(level.brgametype.funcs[funcname])) {
        scripts\mp\utility\script::demoforcesre("registerBrGametypeFunc already has " + funcname + " defined.");
    }
    level.brgametype.funcs[funcname] = function;
}

// Namespace br_gametypes / scripts\mp\gametypes\br_gametypes
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20a
// Size: 0x20
function function_ec416fa15d5fa6af(funcname) {
    level.brgametype.funcs[funcname] = undefined;
}

// Namespace br_gametypes / scripts\mp\gametypes\br_gametypes
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x232
// Size: 0x59
function runbrgametypefunc6(funcname, param1, param2, param3, param4, param5, param6) {
    return [[ level.brgametype.funcs[funcname] ]](param1, param2, param3, param4, param5, param6);
}

// Namespace br_gametypes / scripts\mp\gametypes\br_gametypes
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x294
// Size: 0x9d
function runbrgametypefunc(funcname, param1, param2) {
    if (isdefined(level.brgametype) && isdefined(level.brgametype.funcs[funcname])) {
        if (isdefined(param2)) {
            return [[ level.brgametype.funcs[funcname] ]](param1, param2);
        }
        if (isdefined(param1)) {
            return [[ level.brgametype.funcs[funcname] ]](param1);
        }
        return [[ level.brgametype.funcs[funcname] ]]();
    }
}

// Namespace br_gametypes / scripts\mp\gametypes\br_gametypes
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x339
// Size: 0x57
function function_d72afdccedfc9b07(funcname, param1, param2, param3) {
    if (isdefined(level.brgametype.funcs[funcname])) {
        return [[ level.brgametype.funcs[funcname] ]](param1, param2, param3);
    }
}

// Namespace br_gametypes / scripts\mp\gametypes\br_gametypes
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x398
// Size: 0x60
function function_d72afaccedfc946e(funcname, param1, param2, param3, param4) {
    if (isdefined(level.brgametype.funcs[funcname])) {
        return [[ level.brgametype.funcs[funcname] ]](param1, param2, param3, param4);
    }
}

// Namespace br_gametypes / scripts\mp\gametypes\br_gametypes
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x400
// Size: 0x7e
function function_d72af9ccedfc923b(funcname, param1, param2, param3, param4, param5, param6, param7) {
    if (isdefined(level.brgametype.funcs[funcname])) {
        return [[ level.brgametype.funcs[funcname] ]](param1, param2, param3, param4, param5, param6, param7);
    }
}

// Namespace br_gametypes / scripts\mp\gametypes\br_gametypes
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x486
// Size: 0x2f
function isbrgametypefuncdefined(funcname) {
    return isdefined(level.brgametype) && isdefined(level.brgametype.funcs[funcname]);
}

// Namespace br_gametypes / scripts\mp\gametypes\br_gametypes
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4be
// Size: 0x23
function disablefeature(featurename) {
    level.brgametype.disabledfeatures[featurename] = 1;
}

// Namespace br_gametypes / scripts\mp\gametypes\br_gametypes
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e9
// Size: 0x30
function isfeaturedisabled(featurename) {
    return !isdefined(level.brgametype) || istrue(level.brgametype.disabledfeatures[featurename]);
}

// Namespace br_gametypes / scripts\mp\gametypes\br_gametypes
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x522
// Size: 0x23
function enablefeature(featurename) {
    level.brgametype.enabledfeatures[featurename] = 1;
}

// Namespace br_gametypes / scripts\mp\gametypes\br_gametypes
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54d
// Size: 0x2f
function isfeatureenabled(featurename) {
    return isdefined(level.brgametype) && istrue(level.brgametype.enabledfeatures[featurename]);
}

// Namespace br_gametypes / scripts\mp\gametypes\br_gametypes
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x585
// Size: 0x2a
function registerbrgametypedata(dataref, data) {
    level.brgametype.data[dataref] = data;
}

// Namespace br_gametypes / scripts\mp\gametypes\br_gametypes
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b7
// Size: 0x20
function getbrgametypedata(dataref) {
    return level.brgametype.data[dataref];
}

