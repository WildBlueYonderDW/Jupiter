// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace namespace_cef36c220d97822f;

// Namespace namespace_cef36c220d97822f/namespace_7ee767bbb40971f1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x79
// Size: 0x1c
function system_init() {
    if (isdefined(level.scriptable_door_initialized)) {
        return;
    }
    level.scriptable_door_initialized = 1;
}

// Namespace namespace_cef36c220d97822f/namespace_7ee767bbb40971f1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c
// Size: 0x16
function function_29ba88e5ce21f3fd(var_8886a1f80d549ed) {
    level.var_be09cad9b5d91063 = var_8886a1f80d549ed;
}

// Namespace namespace_cef36c220d97822f/namespace_7ee767bbb40971f1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb9
// Size: 0x16
function function_e37078f3d00ef312(var_90b8bda8e925efa2) {
    level.var_d9a4b8ae6fa68979 = var_90b8bda8e925efa2;
}

// Namespace namespace_cef36c220d97822f/namespace_7ee767bbb40971f1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd6
// Size: 0x16
function function_87d7be37d61cbae3(var_3cad3873b0f5153) {
    level.door_unlocked = var_3cad3873b0f5153;
}

// Namespace namespace_cef36c220d97822f/namespace_7ee767bbb40971f1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf3
// Size: 0x34
function function_9f2d576809f96d2e(instance, player) {
    if (isdefined(level.var_be09cad9b5d91063)) {
        return [[ level.var_be09cad9b5d91063 ]](instance, player);
    }
    return "";
}

// Namespace namespace_cef36c220d97822f/namespace_7ee767bbb40971f1
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12f
// Size: 0x39
function function_47a1e5b6a230d71f(instance, player, var_85e3240d30e184e7) {
    if (isdefined(level.var_d9a4b8ae6fa68979)) {
        return [[ level.var_d9a4b8ae6fa68979 ]](instance, player, var_85e3240d30e184e7);
    }
    return 0;
}

// Namespace namespace_cef36c220d97822f/namespace_7ee767bbb40971f1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x170
// Size: 0x2f
function function_7e3b4de29e022cea(instance, player) {
    if (isdefined(level.door_unlocked)) {
        [[ level.door_unlocked ]](instance, player);
    }
}

