#using scripts\common\debug.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\poi.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\flags.gsc;
#using scripts\cp_mp\challenges.gsc;
#using script_6a8ec730b2bfa844;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace stationary_notes;

// Namespace stationary_notes / scripts\mp\stationary_notes
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23e
// Size: 0xdd
function function_d197edbd2618c9d1() {
    if (getdvarint(@"hash_219e4eb52e9a22d8", 1) == 0) {
        return;
    }
    flag_wait("create_script_initialized");
    scripts\engine\scriptable::scriptable_addusedcallbackbypart("stationary_note", &function_c4a730f3fc3d42f5);
    level.snotes = spawnstruct();
    level.snotes.var_4cc11ef35eb39ae8 = [];
    var_e596eca4a0dd77c5 = getstructarray("stationary_note", "script_noteworthy");
    scripts\mp\flags::function_1240434f4201ac9d("prematch_done");
    waitframe();
    foreach (loc in var_e596eca4a0dd77c5) {
        if (!isdefined(loc.targetname)) {
            continue;
        }
        function_f915120f9b1ad6e(loc);
    }
}

// Namespace stationary_notes / scripts\mp\stationary_notes
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x323
// Size: 0x7c
function function_597067d183e31ed9(loc) {
    switch (loc.targetname) {
    case #"hash_3eeac6c8aeddd4c9":
        return "stationary_note_computer";
    }
    if (!isdefined(loc.model)) {
        return "stationary_note_paper";
    }
    switch (loc.model) {
    case #"hash_5dcc1e3a006a7e07":
        return "stationary_note_paper";
    default:
        return "stationary_note_paper";
    }
}

// Namespace stationary_notes / scripts\mp\stationary_notes
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3a7
// Size: 0x2a
function function_466d1fc9a557d7c9(key, noteref) {
    level.snotes.var_4cc11ef35eb39ae8[key] = noteref;
}

// Namespace stationary_notes / scripts\mp\stationary_notes
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3d9
// Size: 0x50
function function_793a7b85ffb737d1(noteref) {
    rownum = tablelookuprownum("mp/immovablenotes.csv", 1, noteref);
    if (!isdefined(rownum) || rownum == -1) {
        return undefined;
    }
    id = tablelookupbyrow("mp/immovablenotes.csv", rownum, 0);
    return int(id);
}

// Namespace stationary_notes / scripts\mp\stationary_notes
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x432
// Size: 0xe2
function function_f915120f9b1ad6e(loc) {
    noteref = loc.targetname;
    if (isdefined(level.snotes.var_4cc11ef35eb39ae8[noteref])) {
        noteref = level.snotes.var_4cc11ef35eb39ae8[noteref];
    }
    scriptablename = function_597067d183e31ed9(loc);
    if (!isdefined(loc.angles)) {
        loc.angles = (0, 0, 0);
    }
    noteid = function_793a7b85ffb737d1(noteref);
    if (isdefined(noteid)) {
        scriptable = spawnscriptable(scriptablename, loc.origin, loc.angles + (90, 0, 0));
        scriptable.noteid = noteid;
    }
}

// Namespace stationary_notes / scripts\mp\stationary_notes
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x51c
// Size: 0x41
function function_c4a730f3fc3d42f5(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    thread function_528ace3eb332dc64(instance, part, state, player, var_a5b2c541413aa895, usestring);
}

// Namespace stationary_notes / scripts\mp\stationary_notes
// Params 6, eflags: 0x4
// Checksum 0x0, Offset: 0x565
// Size: 0x8d
function private function_528ace3eb332dc64(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    level thread function_226b3d98df5eda63(instance);
    if (instance.type == "stationary_note_computer") {
        scripts\cp_mp\challenges::function_8359cadd253f9604(player, "pmc_read_email", 1);
    }
    namespace_8361bad7391de074::function_2b7cc5d62043202e(player);
    player setclientomnvar("ui_immovable_note", instance.noteid);
    waitframe();
    player setclientomnvar("ui_immovable_note", 0);
}

// Namespace stationary_notes / scripts\mp\stationary_notes
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x5fa
// Size: 0xba
function private function_226b3d98df5eda63(instance) {
    position = (0, 0, 0);
    if (isdefined(instance) && isdefined(instance.origin)) {
        position = instance.origin;
    }
    eventparams = ["pos_x", position[0], "pos_y", position[1], "pos_z", position[2], "time_since_match_start_ms", scripts\cp_mp\utility\game_utility::gettimepassed(), "id", instance.noteid];
    dlog_recordevent("dlog_event_br_snote_used", eventparams);
}

