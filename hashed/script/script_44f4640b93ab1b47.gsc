// mwiii decomp prototype
#using scripts\engine\utility.gsc;

#namespace namespace_d033e1c685c63a9b;

// Namespace namespace_d033e1c685c63a9b/namespace_4ad0bd66eaa05ae7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x94
// Size: 0x1f
function function_360128ec8c9d243() {
    level.var_34eacc4ba5c409a7 = [];
    level thread function_8371656cac31e3e5();
    level thread function_ee39a757e5ab8fbe();
}

// Namespace namespace_d033e1c685c63a9b/namespace_4ad0bd66eaa05ae7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba
// Size: 0x55
function function_8371656cac31e3e5() {
    level endon("game_ended");
    while (1) {
        uavtype = var_cdc9bee1ecfe4526 = level waittill("uav_started");
        if (!isdefined(var_cdc9bee1ecfe4526) || isbot(var_cdc9bee1ecfe4526)) {
            continue;
        }
        level.var_34eacc4ba5c409a7[var_cdc9bee1ecfe4526 getentitynumber()] = var_cdc9bee1ecfe4526;
    }
}

// Namespace namespace_d033e1c685c63a9b/namespace_4ad0bd66eaa05ae7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x116
// Size: 0x5e
function function_ee39a757e5ab8fbe() {
    level endon("game_ended");
    while (1) {
        var_cdc9bee1ecfe4526 = level waittill("uav_finished");
        if (isbot(var_cdc9bee1ecfe4526)) {
            continue;
        }
        if (isdefined(var_cdc9bee1ecfe4526)) {
            level.var_34eacc4ba5c409a7[var_cdc9bee1ecfe4526 getentitynumber()] = undefined;
        }
        level.var_34eacc4ba5c409a7 = array_removeundefined(level.var_34eacc4ba5c409a7);
    }
}

// Namespace namespace_d033e1c685c63a9b/namespace_4ad0bd66eaa05ae7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17b
// Size: 0xf
function function_296623d26e11725() {
    return level.var_34eacc4ba5c409a7.size > 0;
}

