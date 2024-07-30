#using scripts\engine\utility.gsc;

#namespace uav_manager;

// Namespace uav_manager / namespace_4ad0bd66eaa05ae7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x94
// Size: 0x1e
function function_360128ec8c9d243() {
    level.var_34eacc4ba5c409a7 = [];
    level thread function_8371656cac31e3e5();
    level thread function_ee39a757e5ab8fbe();
}

// Namespace uav_manager / namespace_4ad0bd66eaa05ae7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba
// Size: 0x54
function function_8371656cac31e3e5() {
    level endon("game_ended");
    while (true) {
        uavowner, uavtype = level waittill("uav_started");
        if (!isdefined(uavowner) || isbot(uavowner)) {
            continue;
        }
        level.var_34eacc4ba5c409a7[uavowner getentitynumber()] = uavowner;
    }
}

// Namespace uav_manager / namespace_4ad0bd66eaa05ae7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x116
// Size: 0x5d
function function_ee39a757e5ab8fbe() {
    level endon("game_ended");
    while (true) {
        uavowner = level waittill("uav_finished");
        if (isbot(uavowner)) {
            continue;
        }
        if (isdefined(uavowner)) {
            level.var_34eacc4ba5c409a7[uavowner getentitynumber()] = undefined;
        }
        level.var_34eacc4ba5c409a7 = array_removeundefined(level.var_34eacc4ba5c409a7);
    }
}

// Namespace uav_manager / namespace_4ad0bd66eaa05ae7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17b
// Size: 0xe
function function_296623d26e11725() {
    return level.var_34eacc4ba5c409a7.size > 0;
}

