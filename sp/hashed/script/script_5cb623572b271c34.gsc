#using scripts\cp\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace namespace_c8ac91d321f30090;

// Namespace namespace_c8ac91d321f30090 / namespace_8784b0174836bc50
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x80
// Size: 0x87
function function_962089c12b654934(player) {
    if (!isdefined(level.var_f78fb7634e3797c4)) {
        return false;
    }
    foreach (soldier in level.var_f78fb7634e3797c4) {
        if (isdefined(soldier.var_d219af81a2a0505b) && soldier.var_d219af81a2a0505b == player) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_c8ac91d321f30090 / namespace_8784b0174836bc50
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x110
// Size: 0xbd
function function_5c6c98e7d15b8d4a(player) {
    if (!isdefined(level.var_f78fb7634e3797c4)) {
        return undefined;
    }
    var_14dc09926e8e1b2f = [];
    foreach (soldier in level.var_f78fb7634e3797c4) {
        owner = soldier.owner;
        if (isdefined(soldier.var_d219af81a2a0505b)) {
            owner = soldier.var_d219af81a2a0505b;
        }
        if (isdefined(owner) && owner == player) {
            var_14dc09926e8e1b2f[var_14dc09926e8e1b2f.size] = soldier;
        }
    }
    if (var_14dc09926e8e1b2f.size > 0) {
        return var_14dc09926e8e1b2f;
    }
    return undefined;
}

// Namespace namespace_c8ac91d321f30090 / namespace_8784b0174836bc50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d6
// Size: 0xad
function function_5bd736549f8d4441() {
    if (!isdefined(level.var_f78fb7634e3797c4)) {
        return undefined;
    }
    var_14dc09926e8e1b2f = [];
    foreach (soldier in level.var_f78fb7634e3797c4) {
        owner = soldier.owner;
        if (isdefined(soldier.var_d219af81a2a0505b)) {
            owner = soldier.var_d219af81a2a0505b;
        }
        if (isdefined(owner)) {
            var_14dc09926e8e1b2f[var_14dc09926e8e1b2f.size] = soldier;
        }
    }
    if (var_14dc09926e8e1b2f.size > 0) {
        return var_14dc09926e8e1b2f;
    }
    return undefined;
}

// Namespace namespace_c8ac91d321f30090 / namespace_8784b0174836bc50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28c
// Size: 0x1b
function function_110f112431c654dc() {
    if (!isdefined(level.var_f78fb7634e3797c4)) {
        return 0;
    }
    return level.var_f78fb7634e3797c4.size;
}

// Namespace namespace_c8ac91d321f30090 / namespace_8784b0174836bc50
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b0
// Size: 0x1b
function function_87ac668a043af5dd() {
    if (isdefined(level.var_506605f16efce39a)) {
        return level.var_506605f16efce39a;
    }
    return 8;
}

