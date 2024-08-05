#using scripts\engine\sp\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\sp\spawner.gsc;

#namespace ai;

// Namespace ai / namespace_eb38a630f7c5a462
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x37e
// Size: 0x40
function function_b1e9f30ceb841994(var_89514ad8a764d9b4) {
    assertex(isdefined(var_89514ad8a764d9b4), "get_group_touching_volume: aigroup_name is undefined to get group");
    guys = get_ai_group_ai(var_89514ad8a764d9b4);
    var_e79103f230b3329f = function_359a5497e23b8f79(guys);
    return var_e79103f230b3329f;
}

// Namespace ai / namespace_eb38a630f7c5a462
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3c7
// Size: 0x87
function function_359a5497e23b8f79(array) {
    var_e79103f230b3329f = [];
    assertex(isarray(array), "array_touching_volume: array is undefined or not an array");
    foreach (guy in array) {
        if (isalive(guy) && self istouching(guy)) {
            var_e79103f230b3329f[var_e79103f230b3329f.size] = guy;
        }
    }
    return var_e79103f230b3329f;
}

// Namespace ai / namespace_eb38a630f7c5a462
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x457
// Size: 0x35
function function_b602e9a854dcd12f(array, var_ba3a10cac7a316fa, flagname, timeout) {
    if (isdefined(flagname)) {
        level endon(flagname);
    }
    waittill_dead_or_dying(array, var_ba3a10cac7a316fa, timeout);
}

// Namespace ai / namespace_eb38a630f7c5a462
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x494
// Size: 0x69
function go_to_node_targetname(targetname) {
    self endon("death");
    assertex(isdefined(targetname), "go_to_node_targetname: targetname is undefined");
    self cleargoalvolume();
    goals = get_target_goals(targetname);
    assertex(goals.size > 0, "go_to_node_targetname: could not find goal of any type with targetname: " + targetname);
    thread go_to_node(goals);
    waittill_either("goal", "stop_going_to_node");
}

// Namespace ai / namespace_eb38a630f7c5a462
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x505
// Size: 0xb2
function function_70c375ef912c3fc1(array, targetname, randomdelay) {
    assertex(isdefined(array), "array_set_goal: array is undefined");
    assertex(isdefined(targetname), "array_set_goal: targetname is undefined");
    foreach (ai in array) {
        if (isalive(ai)) {
            if (isdefined(randomdelay) && randomdelay > 0) {
                ai delaythread(randomfloat(randomdelay), &go_to_node_targetname, targetname);
                continue;
            }
            ai thread go_to_node_targetname(targetname);
        }
    }
}

// Namespace ai / namespace_eb38a630f7c5a462
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x5bf
// Size: 0x6f
function function_12c55fcbaa7c5346(array, targetname, var_ba3a10cac7a316fa, flagname, timeout, randomdelay) {
    assertex(isdefined(targetname), "array_set_goal_on_death: targetname is undefined");
    if (isdefined(var_ba3a10cac7a316fa) && var_ba3a10cac7a316fa > 0) {
        function_b602e9a854dcd12f(array, var_ba3a10cac7a316fa, flagname, timeout);
    }
    array = array_removedead_or_dying(array);
    level thread function_70c375ef912c3fc1(array, targetname, randomdelay);
}

// Namespace ai / namespace_eb38a630f7c5a462
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x636
// Size: 0x91
function function_f2222194b84d7787(team, species, targetname, var_ba3a10cac7a316fa, flagname, timeout, randomdelay) {
    assertex(isdefined(team) || isdefined(species), "team_set_goal: team and species is undefined");
    assertex(isdefined(targetname), "team_set_goal: targetname is undefined");
    if (!isdefined(species)) {
        species = "all";
    }
    guys = getaispeciesarray(team, species);
    function_12c55fcbaa7c5346(guys, targetname, var_ba3a10cac7a316fa, flagname, timeout, randomdelay);
}

// Namespace ai / namespace_eb38a630f7c5a462
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x6cf
// Size: 0x74
function function_105b3c0f7ba8cd09(var_89514ad8a764d9b4, targetname, var_ba3a10cac7a316fa, flagname, timeout, randomdelay) {
    assertex(isdefined(var_89514ad8a764d9b4), "group_ai_set_goal: aigroup_name for group_ai is undefined");
    assertex(isdefined(targetname), "group_ai_set_goal: targetname is undefined");
    guys = get_ai_group_ai(var_89514ad8a764d9b4);
    function_12c55fcbaa7c5346(guys, targetname, var_ba3a10cac7a316fa, flagname, timeout, randomdelay);
}

// Namespace ai / namespace_eb38a630f7c5a462
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x74b
// Size: 0x6d
function function_807f22c65e631b07(array, var_ba3a10cac7a316fa, flagname) {
    assertex(isdefined(array) && isarray(array), "flag_set_on_group_ai_count: array is undefined or not an array");
    assertex(isdefined(var_ba3a10cac7a316fa) && var_ba3a10cac7a316fa >= 0, "flag_set_on_group_ai_count: deadCount is undefined or less than 0");
    assertex(isdefined(flagname), "flag_set_on_group_ai_count: flagName is undefined");
    waittill_dead_or_dying(array, var_ba3a10cac7a316fa);
    flag_set(flagname);
}

