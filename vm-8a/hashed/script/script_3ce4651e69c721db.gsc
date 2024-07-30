#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\common\devgui.gsc;
#using scripts\engine\scriptable.gsc;
#using script_1f97a44d1761c919;

#namespace ob_intel;

// Namespace ob_intel / namespace_287c594b1c56aa67
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c7
// Size: 0x160
function function_d84b63f3cd2befe() {
    if (getdvarint(@"hash_1fbc80ee0748782c", 1) > 0) {
        level.var_d97f7ce3bb56f2a3 = [];
        var_15fed4ba62ea8650 = getstructarray("deadbolt_audio_intel", "targetname");
        level.var_d97f7ce3bb56f2a3["deadbolt_audio_intel"] = spawn_intel("ob_intel_deadbolt_audio", var_15fed4ba62ea8650);
        var_98d65298ad484da1 = getstructarray("deadbolt_radio_intel", "targetname");
        level.var_d97f7ce3bb56f2a3["deadbolt_radio_intel"] = spawn_intel("ob_intel_deadbolt_radio", var_98d65298ad484da1);
        var_86b84a8b93dd7bd0 = getstructarray("terminus_audio_intel", "targetname");
        level.var_d97f7ce3bb56f2a3["terminus_audio_intel"] = spawn_intel("ob_intel_terminus_audio", var_86b84a8b93dd7bd0);
        var_98fc869de3b4321 = getstructarray("terminus_radio_intel", "targetname");
        level.var_d97f7ce3bb56f2a3["terminus_radio_intel"] = spawn_intel("ob_intel_terminus_radio", var_98fc869de3b4321);
        var_455fcf129b9a4773 = getstructarray("terminus_audio_intel_warlord", "targetname");
        level.ob.var_3c0bad034d227d02 = var_455fcf129b9a4773;
        level.var_d97f7ce3bb56f2a3["note_intel"] = getentitylessscriptablearray("note_intel", "targetname");
        thread function_bcd3ff1413e1f37a();
        scripts\engine\scriptable::scriptable_addusedcallback(&function_d49b531543df8201);
    }
}

// Namespace ob_intel / namespace_287c594b1c56aa67
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x42f
// Size: 0xfe
function private spawn_intel(var_91839babd32261f4, struct_array) {
    var_96ddc4ea6dc265d4 = [];
    foreach (struct in struct_array) {
        if (isdefined(struct.season) && int(struct.season) > getdvarint(@"hash_ddc349005b4d9cbb", 1)) {
            return;
        }
        radio = spawnscriptable(var_91839babd32261f4, struct.origin, struct.angles);
        if (isdefined(struct.script_noteworthy)) {
            radio.var_84e2ca49013808d2 = struct.script_noteworthy;
            /#
                radio thread function_6e50624e2c06832b();
            #/
        }
        var_96ddc4ea6dc265d4 = array_add(var_96ddc4ea6dc265d4, radio);
    }
    return var_96ddc4ea6dc265d4;
}

// Namespace ob_intel / namespace_287c594b1c56aa67
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x536
// Size: 0x99
function private function_bcd3ff1413e1f37a() {
    if (isdefined(level.var_d97f7ce3bb56f2a3) && isdefined(level.var_d97f7ce3bb56f2a3["note_intel"])) {
        foreach (note in level.var_d97f7ce3bb56f2a3["note_intel"]) {
            note setscriptablepartstate("state", note.script_noteworthy);
            /#
                note thread function_b3212476aba49bc();
            #/
        }
    }
}

// Namespace ob_intel / namespace_287c594b1c56aa67
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5d7
// Size: 0x50
function function_6e50624e2c06832b() {
    while (true) {
        if (getdvarint(@"hash_d2512962a2cc1632", 0)) {
            /#
                print3d(self.origin + (0, 0, 10), self.var_84e2ca49013808d2, undefined, undefined, 0.5, undefined, 1);
            #/
        }
        waitframe();
    }
}

// Namespace ob_intel / namespace_287c594b1c56aa67
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x62f
// Size: 0x50
function function_b3212476aba49bc() {
    while (true) {
        if (getdvarint(@"hash_d2512962a2cc1632", 0)) {
            /#
                print3d(self.origin + (0, 0, 10), self.script_noteworthy, undefined, undefined, 0.5, undefined, 1);
            #/
        }
        waitframe();
    }
}

// Namespace ob_intel / namespace_287c594b1c56aa67
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x687
// Size: 0xcb
function function_d49b531543df8201(instance, part, state, player, var_a5b2c541413aa895, usestring) {
    if (!isdefined(instance) || !issubstr(instance.type, "ob_intel")) {
        return;
    }
    instance setscriptablepartstate("state", "unusable");
    function_ab1fd5a8c819c1bf(instance);
    wait 1;
    if (isdefined(instance.var_84e2ca49013808d2)) {
        namespace_446fc987a980892f::playconversation(instance.var_84e2ca49013808d2, undefined, undefined, 0, instance.origin + (0, 0, 10), "overlord_intel");
    }
    instance setscriptablepartstate("intel_sfx", "stop");
    instance thread function_9690c337583e3ab2();
}

// Namespace ob_intel / namespace_287c594b1c56aa67
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x75a
// Size: 0x1d
function private function_9690c337583e3ab2() {
    level endon("game_ended");
    wait 5;
    self setscriptablepartstate("state", "usable");
}

// Namespace ob_intel / namespace_287c594b1c56aa67
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x77f
// Size: 0xdb
function private function_ab1fd5a8c819c1bf(instance) {
    switch (instance.var_84e2ca49013808d2) {
    case #"hash_450ee5bc3bffa66b": 
        instance setscriptablepartstate("intel_sfx", "start_mistake");
        break;
    case #"hash_25899687670ee5e6": 
        instance setscriptablepartstate("intel_sfx", "start_mobilearmor");
        break;
    case #"hash_b04f01e7240b4bf6": 
        instance setscriptablepartstate("intel_sfx", "start_chaosdown");
        break;
    case #"hash_77e01a6cb42f6303": 
        instance setscriptablepartstate("intel_sfx", "start_testing");
        break;
    case #"hash_a202261611d5d72": 
        instance setscriptablepartstate("intel_sfx", "start_whoisthisguy");
        break;
    default: 
        instance setscriptablepartstate("intel_sfx", "start");
        break;
    }
}

