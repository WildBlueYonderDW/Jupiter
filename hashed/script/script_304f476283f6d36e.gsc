// mwiii decomp prototype
#using script_77c18cdedec620b3;
#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using script_5def7af2a9f04234;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\flags.gsc;
#using scripts\cp_mp\challenges.gsc;
#using script_6a8ec730b2bfa844;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace namespace_7915293a5d949011;

// Namespace namespace_7915293a5d949011/namespace_18e0fd353e69a0b2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eb
// Size: 0xe0
function function_d197edbd2618c9d1() {
    if (getdvarint(@"hash_219e4eb52e9a22d8", 1) == 0) {
        return;
    }
    flag_wait("create_script_initialized");
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("stationary_note", &function_c4a730f3fc3d42f5);
    level.var_ad243d07c52c2843 = spawnstruct();
    level.var_ad243d07c52c2843.var_4cc11ef35eb39ae8 = [];
    var_e596eca4a0dd77c5 = getstructarray("stationary_note", "script_noteworthy");
    namespace_4b0406965e556711::function_1240434f4201ac9d("prematch_done");
    waitframe();
    foreach (loc in var_e596eca4a0dd77c5) {
        if (!isdefined(loc.targetname)) {
            continue;
        }
        function_f915120f9b1ad6e(loc);
    }
}

// Namespace namespace_7915293a5d949011/namespace_18e0fd353e69a0b2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d2
// Size: 0x7d
function function_597067d183e31ed9(loc) {
    switch (loc.targetname) {
    case #"hash_3eeac6c8aeddd4c9":
        return "stationary_note_computer";
        break;
    }
    if (!isdefined(loc.model)) {
        return "stationary_note_paper";
    }
    switch (loc.model) {
    case #"hash_5dcc1e3a006a7e07":
        return "stationary_note_paper";
    default:
        return "stationary_note_paper";
        break;
    }
}

// Namespace namespace_7915293a5d949011/namespace_18e0fd353e69a0b2
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x356
// Size: 0x2b
function function_466d1fc9a557d7c9(key, var_5fc921ca5df09e7e) {
    level.var_ad243d07c52c2843.var_4cc11ef35eb39ae8[key] = var_5fc921ca5df09e7e;
}

// Namespace namespace_7915293a5d949011/namespace_18e0fd353e69a0b2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x388
// Size: 0x51
function function_793a7b85ffb737d1(var_5fc921ca5df09e7e) {
    rownum = tablelookuprownum("mp/immovablenotes.csv", 1, var_5fc921ca5df09e7e);
    if (!isdefined(rownum) || rownum == -1) {
        return undefined;
    }
    id = tablelookupbyrow("mp/immovablenotes.csv", rownum, 0);
    return int(id);
}

// Namespace namespace_7915293a5d949011/namespace_18e0fd353e69a0b2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e1
// Size: 0xe5
function function_f915120f9b1ad6e(loc) {
    var_5fc921ca5df09e7e = loc.targetname;
    if (isdefined(level.var_ad243d07c52c2843.var_4cc11ef35eb39ae8[var_5fc921ca5df09e7e])) {
        var_5fc921ca5df09e7e = level.var_ad243d07c52c2843.var_4cc11ef35eb39ae8[var_5fc921ca5df09e7e];
    }
    scriptablename = function_597067d183e31ed9(loc);
    if (!isdefined(loc.angles)) {
        loc.angles = (0, 0, 0);
    }
    var_70b5fd7365f6b50c = function_793a7b85ffb737d1(var_5fc921ca5df09e7e);
    if (isdefined(var_70b5fd7365f6b50c)) {
        scriptable = spawnscriptable(scriptablename, loc.origin, loc.angles + (90, 0, 0));
        scriptable.var_70b5fd7365f6b50c = var_70b5fd7365f6b50c;
    }
}

// Namespace namespace_7915293a5d949011/namespace_18e0fd353e69a0b2
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cd
// Size: 0x42
function function_c4a730f3fc3d42f5(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    thread function_528ace3eb332dc64(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61);
}

// Namespace namespace_7915293a5d949011/namespace_18e0fd353e69a0b2
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x516
// Size: 0x8e
function private function_528ace3eb332dc64(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    level thread function_226b3d98df5eda63(instance);
    if (instance.type == "stationary_note_computer") {
        namespace_aad14af462a74d08::function_8359cadd253f9604(player, "pmc_read_email", 1);
    }
    namespace_8361bad7391de074::function_2b7cc5d62043202e(player);
    player setclientomnvar("ui_immovable_note", instance.var_70b5fd7365f6b50c);
    waitframe();
    player setclientomnvar("ui_immovable_note", 0);
}

// Namespace namespace_7915293a5d949011/namespace_18e0fd353e69a0b2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5ab
// Size: 0xbb
function private function_226b3d98df5eda63(instance) {
    position = (0, 0, 0);
    if (isdefined(instance) && isdefined(instance.origin)) {
        position = instance.origin;
    }
    eventparams = [0:"pos_x", 1:position[0], 2:"pos_y", 3:position[1], 4:"pos_z", 5:position[2], 6:"time_since_match_start_ms", 7:namespace_36f464722d326bbe::gettimepassed(), 8:"id", 9:instance.var_70b5fd7365f6b50c];
    dlog_recordevent("dlog_event_br_snote_used", eventparams);
}

