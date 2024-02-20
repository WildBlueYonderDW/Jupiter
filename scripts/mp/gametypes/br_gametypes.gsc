// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\utility\script.gsc;

#namespace namespace_b8ca654fc4c2dd79;

// Namespace namespace_b8ca654fc4c2dd79/namespace_71073fa38f11492
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb5
// Size: 0xef
function init() {
    level.brgametype = spawnstruct();
    level.brgametype.funcs = [];
    level.brgametype.disabledfeatures = [];
    level.brgametype.enabledfeatures = [];
    level.brgametype.data = [];
    level.brgametype.name = namespace_36f464722d326bbe::function_6c1fce6f6b8779d5();
    level.brgametype.var_88f31052c5135f3b = level.brgametype.name;
    if (getdvar(@"hash_8fe3271cd74f65a2") == "codmas") {
        level.brgametype.var_88f31052c5135f3b = "codmas";
    }
    if (isdefined(level.var_cdc15ee14362fbf)) {
        [[ level.var_cdc15ee14362fbf ]]();
    }
}

// Namespace namespace_b8ca654fc4c2dd79/namespace_71073fa38f11492
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ab
// Size: 0x58
function registerbrgametypefunc(funcname, function) {
    if (isdefined(level.brgametype.funcs[funcname])) {
        namespace_9c840bb9f2ecbf00::demoforcesre("registerBrGametypeFunc already has " + funcname + " defined.");
    }
    level.brgametype.funcs[funcname] = function;
}

// Namespace namespace_b8ca654fc4c2dd79/namespace_71073fa38f11492
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20a
// Size: 0x21
function function_ec416fa15d5fa6af(funcname) {
    level.brgametype.funcs[funcname] = undefined;
}

// Namespace namespace_b8ca654fc4c2dd79/namespace_71073fa38f11492
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x232
// Size: 0x5a
function runbrgametypefunc6(funcname, param1, param2, param3, param4, param5, param6) {
    return [[ level.brgametype.funcs[funcname] ]](param1, param2, param3, param4, param5, param6);
}

// Namespace namespace_b8ca654fc4c2dd79/namespace_71073fa38f11492
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x294
// Size: 0x9e
function runbrgametypefunc(funcname, param1, param2) {
    if (isdefined(level.brgametype) && isdefined(level.brgametype.funcs[funcname])) {
        if (isdefined(param2)) {
            return [[ level.brgametype.funcs[funcname] ]](param1, param2);
        } else if (isdefined(param1)) {
            return [[ level.brgametype.funcs[funcname] ]](param1);
        } else {
            return [[ level.brgametype.funcs[funcname] ]]();
        }
    }
}

// Namespace namespace_b8ca654fc4c2dd79/namespace_71073fa38f11492
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x339
// Size: 0x58
function function_d72afdccedfc9b07(funcname, param1, param2, param3) {
    if (isdefined(level.brgametype.funcs[funcname])) {
        return [[ level.brgametype.funcs[funcname] ]](param1, param2, param3);
    }
}

// Namespace namespace_b8ca654fc4c2dd79/namespace_71073fa38f11492
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x398
// Size: 0x61
function function_d72afaccedfc946e(funcname, param1, param2, param3, param4) {
    if (isdefined(level.brgametype.funcs[funcname])) {
        return [[ level.brgametype.funcs[funcname] ]](param1, param2, param3, param4);
    }
}

// Namespace namespace_b8ca654fc4c2dd79/namespace_71073fa38f11492
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x400
// Size: 0x7f
function function_d72af9ccedfc923b(funcname, param1, param2, param3, param4, param5, param6, param7) {
    if (isdefined(level.brgametype.funcs[funcname])) {
        return [[ level.brgametype.funcs[funcname] ]](param1, param2, param3, param4, param5, param6, param7);
    }
}

// Namespace namespace_b8ca654fc4c2dd79/namespace_71073fa38f11492
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x486
// Size: 0x30
function isbrgametypefuncdefined(funcname) {
    return isdefined(level.brgametype) && isdefined(level.brgametype.funcs[funcname]);
}

// Namespace namespace_b8ca654fc4c2dd79/namespace_71073fa38f11492
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4be
// Size: 0x24
function disablefeature(var_3f44c731fdddd082) {
    level.brgametype.disabledfeatures[var_3f44c731fdddd082] = 1;
}

// Namespace namespace_b8ca654fc4c2dd79/namespace_71073fa38f11492
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e9
// Size: 0x31
function isfeaturedisabled(var_3f44c731fdddd082) {
    return !isdefined(level.brgametype) || istrue(level.brgametype.disabledfeatures[var_3f44c731fdddd082]);
}

// Namespace namespace_b8ca654fc4c2dd79/namespace_71073fa38f11492
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x522
// Size: 0x24
function enablefeature(var_3f44c731fdddd082) {
    level.brgametype.enabledfeatures[var_3f44c731fdddd082] = 1;
}

// Namespace namespace_b8ca654fc4c2dd79/namespace_71073fa38f11492
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54d
// Size: 0x30
function isfeatureenabled(var_3f44c731fdddd082) {
    return isdefined(level.brgametype) && istrue(level.brgametype.enabledfeatures[var_3f44c731fdddd082]);
}

// Namespace namespace_b8ca654fc4c2dd79/namespace_71073fa38f11492
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x585
// Size: 0x2b
function registerbrgametypedata(var_ac85b79dfc4e45c6, data) {
    level.brgametype.data[var_ac85b79dfc4e45c6] = data;
}

// Namespace namespace_b8ca654fc4c2dd79/namespace_71073fa38f11492
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b7
// Size: 0x21
function getbrgametypedata(var_ac85b79dfc4e45c6) {
    return level.brgametype.data[var_ac85b79dfc4e45c6];
}

