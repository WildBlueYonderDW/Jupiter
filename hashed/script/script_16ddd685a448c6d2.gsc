#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace namespace_450f844eafbe20d6;

// Namespace namespace_450f844eafbe20d6 / namespace_e2a930dc2e127364
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x78
// Size: 0x15
function function_de7ceb99406215a9(var_aaf3b1aac118b944) {
    level.var_53dde20ce19c6235 = var_aaf3b1aac118b944;
}

// Namespace namespace_450f844eafbe20d6 / namespace_e2a930dc2e127364
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x95
// Size: 0x15
function function_605a755fde14133a(canusecallback) {
    level.var_72e0f43095476f99 = canusecallback;
}

// Namespace namespace_450f844eafbe20d6 / namespace_e2a930dc2e127364
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb2
// Size: 0x3b
function function_547c48dc070b2109(usedcallback) {
    if (!isdefined(level.var_c4182f04fdada4a4)) {
        level.var_c4182f04fdada4a4 = [];
    }
    level.var_c4182f04fdada4a4 = array_add(level.var_c4182f04fdada4a4, usedcallback);
}

// Namespace namespace_450f844eafbe20d6 / namespace_e2a930dc2e127364
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xf5
// Size: 0x53
function function_1f97e923f41ddf92(instance, player, edgeindex, isvertical, isinverted, var_9cb491b9ab8ea354) {
    if (isdefined(level.var_53dde20ce19c6235)) {
        return [[ level.var_53dde20ce19c6235 ]](instance, player, edgeindex, isvertical, isinverted, var_9cb491b9ab8ea354);
    }
    return undefined;
}

// Namespace namespace_450f844eafbe20d6 / namespace_e2a930dc2e127364
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x151
// Size: 0x42
function function_f3f393d3efa1edd1(instance, player, edgeindex, isinverted) {
    if (isdefined(level.var_72e0f43095476f99)) {
        return [[ level.var_72e0f43095476f99 ]](instance, player, edgeindex, isinverted);
    }
    return 1;
}

// Namespace namespace_450f844eafbe20d6 / namespace_e2a930dc2e127364
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x19c
// Size: 0x96
function function_65a30198614e57d1(instance, player, edgeindex, isinverted, isvertical, var_7bd9fd9d3e7c7aa) {
    if (isdefined(level.var_c4182f04fdada4a4)) {
        foreach (used_func in level.var_c4182f04fdada4a4) {
            [[ used_func ]](instance, player, edgeindex, isinverted, isvertical, var_7bd9fd9d3e7c7aa);
        }
    }
}

