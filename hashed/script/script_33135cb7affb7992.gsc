// mwiii decomp prototype
#using script_17dc47fb18ded931;
#using script_6b684505b9959a08;
#using script_5f71ed065b9cea1e;
#using scripts\engine\utility.gsc;

#namespace namespace_55960efed51f8481;

// Namespace namespace_55960efed51f8481 / namespace_cc8f7511992de84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x88
// Size: 0x4f
function function_18a04da230bdecbb(var_7ff959e229d749c3) {
    struct = function_dcbffa8a1a0be491(function_35f874585c5fcfe6(var_7ff959e229d749c3), function_1864c93384760910(var_7ff959e229d749c3), function_a4db25b7af304698(var_7ff959e229d749c3), function_f63abb63847ab316(var_7ff959e229d749c3), function_2dff7e1a10633ee1(var_7ff959e229d749c3), function_5b87e83d21054cb(var_7ff959e229d749c3), function_f29715a4f86830ed(var_7ff959e229d749c3));
    return struct;
}

// Namespace namespace_55960efed51f8481 / namespace_cc8f7511992de84
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf
// Size: 0xb8
function function_dcbffa8a1a0be491(var_de1f9176204264cf, var_c92e69a2dca65df1, perplayerloot, rewardgrouptype, var_2b5aa40272b0bbce, var_d701a569f30e890f, var_3c90b4a5ec990a09) {
    struct = spawnstruct();
    struct.var_fec7733a738249d6 = 1;
    struct.var_de1f9176204264cf = var_de1f9176204264cf;
    struct.var_c92e69a2dca65df1 = var_c92e69a2dca65df1;
    struct.perplayerloot = perplayerloot;
    struct.rewardgrouptype = rewardgrouptype;
    struct.var_2b5aa40272b0bbce = var_2b5aa40272b0bbce;
    struct.var_d701a569f30e890f = var_d701a569f30e890f;
    struct.var_3c90b4a5ec990a09 = var_3c90b4a5ec990a09;
    return struct;
}

// Namespace namespace_55960efed51f8481 / namespace_cc8f7511992de84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19f
// Size: 0x1e
function function_155ac29988933331(var_40bdc956443135c6) {
    if (isdefined(var_40bdc956443135c6)) {
        return var_40bdc956443135c6.var_de1f9176204264cf;
    }
    return undefined;
}

// Namespace namespace_55960efed51f8481 / namespace_cc8f7511992de84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c5
// Size: 0x1e
function function_57339c17a16d5b(var_40bdc956443135c6) {
    if (isdefined(var_40bdc956443135c6)) {
        return var_40bdc956443135c6.var_c92e69a2dca65df1;
    }
    return undefined;
}

// Namespace namespace_55960efed51f8481 / namespace_cc8f7511992de84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eb
// Size: 0x1e
function function_d2ce6c5a4f9d52e5(var_40bdc956443135c6) {
    if (isdefined(var_40bdc956443135c6)) {
        return var_40bdc956443135c6.perplayerloot;
    }
    return undefined;
}

// Namespace namespace_55960efed51f8481 / namespace_cc8f7511992de84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x211
// Size: 0x1e
function function_45864bd1ba317b7f(var_40bdc956443135c6) {
    if (isdefined(var_40bdc956443135c6)) {
        return var_40bdc956443135c6.rewardgrouptype;
    }
    return undefined;
}

// Namespace namespace_55960efed51f8481 / namespace_cc8f7511992de84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x237
// Size: 0x1e
function function_fe7983e3293f0584(var_40bdc956443135c6) {
    if (isdefined(var_40bdc956443135c6)) {
        return var_40bdc956443135c6.var_2b5aa40272b0bbce;
    }
    return undefined;
}

// Namespace namespace_55960efed51f8481 / namespace_cc8f7511992de84
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x25d
// Size: 0x1e
function function_bc4d3f90dc517d3d(var_40bdc956443135c6) {
    if (isdefined(var_40bdc956443135c6)) {
        return var_40bdc956443135c6.var_d701a569f30e890f;
    }
    return undefined;
}

// Namespace namespace_55960efed51f8481 / namespace_cc8f7511992de84
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x283
// Size: 0x1e
function function_9f3743cde2de21b(var_40bdc956443135c6) {
    if (isdefined(var_40bdc956443135c6)) {
        return var_40bdc956443135c6.var_3c90b4a5ec990a09;
    }
    return undefined;
}

// Namespace namespace_55960efed51f8481 / namespace_cc8f7511992de84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a9
// Size: 0x2c
function function_e7c2ecccbf00007e(var_40bdc956443135c6) {
    var_9710a742dddb8c07 = function_155ac29988933331(var_40bdc956443135c6);
    if (!isdefined(var_9710a742dddb8c07)) {
        return undefined;
    }
    return namespace_9a8748f9afa48155::function_ec54b8019f59c0ef(var_9710a742dddb8c07);
}

// Namespace namespace_55960efed51f8481 / namespace_cc8f7511992de84
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dd
// Size: 0x2c
function function_9e1216d6f33a3c78(var_40bdc956443135c6) {
    var_2adb829fe068100d = function_57339c17a16d5b(var_40bdc956443135c6);
    if (!isdefined(var_2adb829fe068100d)) {
        return undefined;
    }
    return namespace_81b7e1672a7e54da::function_4d6ae01e1e47320c(var_2adb829fe068100d);
}

