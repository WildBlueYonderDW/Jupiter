#using scripts\cp\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace namespace_4702bec955c39947;

// Namespace namespace_4702bec955c39947 / scripts\cp\cp_quest
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x80
// Size: 0x2a
function init_quest_system() {
    level.zombie_quests = [];
    level.zombie_current_quest_step_index = [];
    level.zombie_quest_complete_up_to_quest_step_index = [];
    level.num_of_quest_pieces_completed = 0;
}

// Namespace namespace_4702bec955c39947 / scripts\cp\cp_quest
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb2
// Size: 0x79
function start_quest_system() {
    /#
        level thread function_699304dd575765c9(@"hash_e9b5bb932cba9edc", &function_b537ff3784cebcc6);
    #/
    if (is_codxp()) {
        return;
    }
    foreach (var_509f0abe2daf407f in level.zombie_quests) {
        level thread start_quest_line(quest_name);
    }
}

// Namespace namespace_4702bec955c39947 / scripts\cp\cp_quest
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x133
// Size: 0xb2
function start_quest_line(quest_name) {
    var_509f0abe2daf407f = level.zombie_quests[quest_name];
    level.zombie_quest_complete_up_to_quest_step_index[quest_name] = -1;
    foreach (step_index, var_d785e0bc38b7afad in var_509f0abe2daf407f) {
        level.zombie_current_quest_step_index[quest_name] = step_index;
        [[ var_d785e0bc38b7afad.init_func ]]();
        if (should_do_quest_step_func(quest_name, step_index)) {
            [[ var_d785e0bc38b7afad.quest_step_func ]]();
        }
        [[ var_d785e0bc38b7afad.complete_func ]]();
    }
}

// Namespace namespace_4702bec955c39947 / scripts\cp\cp_quest
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1ed
// Size: 0xc4
function register_quest_step(quest_name, step_index, init_func, quest_step_func, complete_func, debug_beat_func) {
    if (!isdefined(level.zombie_quests[quest_name])) {
        level.zombie_quests[quest_name] = [];
    }
    if (!isdefined(level.zombie_quest_complete_up_to_quest_step_index[quest_name])) {
        level.zombie_quest_complete_up_to_quest_step_index[quest_name] = -1;
    }
    var_d785e0bc38b7afad = spawnstruct();
    var_d785e0bc38b7afad.init_func = init_func;
    var_d785e0bc38b7afad.quest_step_func = quest_step_func;
    var_d785e0bc38b7afad.complete_func = complete_func;
    var_d785e0bc38b7afad.debug_beat_func = debug_beat_func;
    level.zombie_quests[quest_name][step_index] = var_d785e0bc38b7afad;
}

// Namespace namespace_4702bec955c39947 / scripts\cp\cp_quest
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2b9
// Size: 0x20
function should_do_quest_step_func(quest_name, step_index) {
    return step_index > level.zombie_quest_complete_up_to_quest_step_index[quest_name];
}

// Namespace namespace_4702bec955c39947 / scripts\cp\cp_quest
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e2
// Size: 0x17
function quest_line_exist(quest_name) {
    return isdefined(level.zombie_quests[quest_name]);
}

/#

    // Namespace namespace_4702bec955c39947 / scripts\cp\cp_quest
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x302
    // Size: 0xb0
    function function_b537ff3784cebcc6(var_989eaba483ac52da) {
        var_989eaba483ac52da = strtok(var_989eaba483ac52da, "<dev string:x1c>");
        quest_name = var_989eaba483ac52da[0];
        var_c64793010cb99ef9 = int(var_989eaba483ac52da[1]);
        if (!isdefined(level.zombie_current_quest_step_index[quest_name])) {
            return;
        }
        var_afcd20f76476b231 = level.zombie_current_quest_step_index[quest_name];
        if (var_afcd20f76476b231 > var_c64793010cb99ef9) {
            iprintlnbold("<dev string:x1e>" + quest_name + "<dev string:x42>");
            return;
        }
        level.zombie_quest_complete_up_to_quest_step_index[quest_name] = var_c64793010cb99ef9;
        var_92e889285ed0b482 = level.zombie_quests[quest_name][var_afcd20f76476b231];
        [[ var_92e889285ed0b482.debug_beat_func ]]();
    }

#/
