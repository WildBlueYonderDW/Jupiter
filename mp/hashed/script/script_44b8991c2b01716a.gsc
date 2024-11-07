#using scripts\engine\utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace namespace_2cf05cd755495a23;

// Namespace namespace_2cf05cd755495a23 / namespace_2db04a57a1b9bf62
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11e
// Size: 0x1eb
function init() {
    if (!function_5a758c8d306f92ed()) {
        return;
    }
    level.var_8336fb035950fe34 = spawnstruct();
    level.var_8336fb035950fe34.var_e4841d3c199d8c76 = [];
    level.var_8336fb035950fe34.var_477d6d6831833cef = [];
    level.var_8336fb035950fe34.var_9cd34562c355c3b7 = [];
    level.var_8336fb035950fe34.callbacks = [];
    level.var_8336fb035950fe34.chance = clamp(getdvarfloat(@"hash_642a00b7321feb16", 0.2), 0, 1);
    var_9395058a6122108 = function_7c3ca1e9f4969566();
    foreach (var_eda120484de9dc8f in var_9395058a6122108.var_86ebbc9e8822bff2) {
        level.var_8336fb035950fe34.var_9cd34562c355c3b7[var_eda120484de9dc8f.ref] = function_f5626cb7773f40cc(var_eda120484de9dc8f.ref, var_eda120484de9dc8f.bink, var_eda120484de9dc8f.var_919903b00986e1b6);
    }
    foreach (var_eda120484de9dc8f in var_9395058a6122108.var_33ce77c893269c05) {
        level.var_8336fb035950fe34.var_9cd34562c355c3b7[var_eda120484de9dc8f.ref] = function_f5626cb7773f40cc(var_eda120484de9dc8f.ref, var_eda120484de9dc8f.bink, var_eda120484de9dc8f.var_919903b00986e1b6);
    }
    scripts\engine\utility::flag_set("jump_scares_ready");
    /#
        thread function_914bd51020394455();
    #/
}

// Namespace namespace_2cf05cd755495a23 / namespace_2db04a57a1b9bf62
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x311
// Size: 0x4f
function function_5a758c8d306f92ed() {
    if (!isdefined(level.var_7a45642e3586f6d5)) {
        var_b2baf0c7d8cd6dac = getdvarint(@"hash_669ae0558e9a0a64", 0);
        level.var_7a45642e3586f6d5 = getdvarint(@"hash_2a5c47bb802c47ac", var_b2baf0c7d8cd6dac) == 1;
    }
    return istrue(level.var_7a45642e3586f6d5);
}

// Namespace namespace_2cf05cd755495a23 / namespace_2db04a57a1b9bf62
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x369
// Size: 0x65
function function_ccea398392b4bf1c(ref, callback) {
    assert(isdefined(ref) && ref != "<dev string:x1c>");
    assert(isdefined(callback));
    if (!function_5a758c8d306f92ed() || !scripts\engine\utility::flag("jump_scares_ready")) {
        return;
    }
    level.var_8336fb035950fe34.callbacks[ref] = callback;
}

// Namespace namespace_2cf05cd755495a23 / namespace_2db04a57a1b9bf62
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3d6
// Size: 0x50
function function_b9d0a8240617803b(ref) {
    assert(isdefined(ref) && ref != "<dev string:x1c>");
    if (!function_5a758c8d306f92ed() || !scripts\engine\utility::flag("jump_scares_ready")) {
        return;
    }
    level.var_8336fb035950fe34.callbacks[ref] = undefined;
}

// Namespace namespace_2cf05cd755495a23 / namespace_2db04a57a1b9bf62
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x42e
// Size: 0xa1
function function_4b08b735eb2c690a(ref, var_308ef4770401cc00, callback) {
    assert(isdefined(ref) && ref != "<dev string:x1c>");
    assert(isdefined(var_308ef4770401cc00) && var_308ef4770401cc00 != "<dev string:x1c>");
    assert(isdefined(callback));
    if (!function_5a758c8d306f92ed() || !scripts\engine\utility::flag("jump_scares_ready")) {
        return;
    }
    var_eda120484de9dc8f = level.var_8336fb035950fe34.var_9cd34562c355c3b7[var_308ef4770401cc00];
    if (isdefined(var_eda120484de9dc8f)) {
        var_eda120484de9dc8f.callbacks[ref] = callback;
    }
}

// Namespace namespace_2cf05cd755495a23 / namespace_2db04a57a1b9bf62
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4d7
// Size: 0x8c
function function_1fd0cf48d61cfb71(ref, var_308ef4770401cc00) {
    assert(isdefined(ref) && ref != "<dev string:x1c>");
    assert(isdefined(var_308ef4770401cc00) && var_308ef4770401cc00 != "<dev string:x1c>");
    if (!function_5a758c8d306f92ed() || !scripts\engine\utility::flag("jump_scares_ready")) {
        return;
    }
    var_eda120484de9dc8f = level.var_8336fb035950fe34.var_9cd34562c355c3b7[var_308ef4770401cc00];
    if (isdefined(var_eda120484de9dc8f)) {
        var_eda120484de9dc8f.callbacks[ref] = undefined;
    }
}

// Namespace namespace_2cf05cd755495a23 / namespace_2db04a57a1b9bf62
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x56b
// Size: 0x198
function function_f7fe427d574911c(ref, player, var_7421408d2c5f4f2f, var_998e44aa54f46731) {
    assert(isdefined(player));
    assert(isdefined(ref) && ref != "<dev string:x1c>");
    var_2c35ea0587c2a25f = player scripts\engine\utility::requestgamerprofile("jumpScareDisable");
    if (!function_5a758c8d306f92ed() || !scripts\engine\utility::flag("jump_scares_ready") || istrue(var_2c35ea0587c2a25f)) {
        return false;
    }
    if (function_43add3ab185f3e51(ref, player, var_7421408d2c5f4f2f)) {
        var_eda120484de9dc8f = level.var_8336fb035950fe34.var_9cd34562c355c3b7[ref];
        thread function_d1e23c923958f6b9(player, var_eda120484de9dc8f.video, var_eda120484de9dc8f.audio, var_eda120484de9dc8f.var_c641ce6eb2db06c);
        if (!istrue(var_998e44aa54f46731)) {
            thread function_edf2c8bda9343e81(player);
        }
        foreach (callback in level.var_8336fb035950fe34.callbacks) {
            thread [[ callback ]](ref, player);
        }
        foreach (callback in var_eda120484de9dc8f.callbacks) {
            thread [[ callback ]](player);
        }
        return true;
    }
    return false;
}

// Namespace namespace_2cf05cd755495a23 / namespace_2db04a57a1b9bf62
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x70c
// Size: 0x1c6
function function_b67f0b02f25b1af(player, var_7421408d2c5f4f2f, var_998e44aa54f46731) {
    assert(isdefined(player));
    if (!function_5a758c8d306f92ed() || !scripts\engine\utility::flag("jump_scares_ready")) {
        return false;
    }
    entityid = player getentitynumber();
    if (!isdefined(level.var_8336fb035950fe34.var_477d6d6831833cef[entityid])) {
        var_477d6d6831833cef = spawnstruct();
        var_477d6d6831833cef.var_9cd34562c355c3b7 = [];
        var_477d6d6831833cef.var_bb75696cf7617115 = 0;
        index = 0;
        foreach (var_308ef4770401cc00, var_8e195b75d2195ea4 in level.var_8336fb035950fe34.var_9cd34562c355c3b7) {
            var_477d6d6831833cef.var_9cd34562c355c3b7[index] = var_308ef4770401cc00;
            index++;
        }
        var_477d6d6831833cef.var_9cd34562c355c3b7 = scripts\engine\utility::array_randomize(var_477d6d6831833cef.var_9cd34562c355c3b7);
        level.var_8336fb035950fe34.var_477d6d6831833cef[entityid] = var_477d6d6831833cef;
    }
    var_477d6d6831833cef = level.var_8336fb035950fe34.var_477d6d6831833cef[entityid];
    var_308ef4770401cc00 = var_477d6d6831833cef.var_9cd34562c355c3b7[var_477d6d6831833cef.var_bb75696cf7617115];
    if (function_f7fe427d574911c(var_308ef4770401cc00, player, var_7421408d2c5f4f2f, var_998e44aa54f46731)) {
        var_477d6d6831833cef.var_bb75696cf7617115++;
        if (var_477d6d6831833cef.var_bb75696cf7617115 >= var_477d6d6831833cef.var_9cd34562c355c3b7.size) {
            var_477d6d6831833cef.var_bb75696cf7617115 = 0;
            scripts\engine\utility::array_randomize(var_477d6d6831833cef.var_9cd34562c355c3b7);
        }
        return true;
    }
    return false;
}

// Namespace namespace_2cf05cd755495a23 / namespace_2db04a57a1b9bf62
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x8db
// Size: 0xe8
function private function_d1e23c923958f6b9(player, video, audio, var_c641ce6eb2db06c) {
    level endon("game_ended");
    assert(isdefined(player));
    assert(isdefined(video) && video != "<dev string:x1c>");
    assert(isdefined(audio) && audio != "<dev string:x1c>");
    assert(isdefined(var_c641ce6eb2db06c));
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        player setclientomnvar("ui_br_bink_overlay_state", 12);
    } else {
        player setclientomnvar("ui_mp_bink_overlay_state", 2);
    }
    player playcinematicforplayer(video);
    if (soundexists(audio)) {
        player playlocalsound(audio);
    }
    player scripts\engine\utility::waittill_any_timeout_1(var_c641ce6eb2db06c, "death_or_disconnect");
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        player setclientomnvar("ui_br_bink_overlay_state", 0);
    } else {
        player setclientomnvar("ui_mp_bink_overlay_state", 0);
    }
    player stopcinematicforplayer();
}

// Namespace namespace_2cf05cd755495a23 / namespace_2db04a57a1b9bf62
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x9cb
// Size: 0xd8
function private function_f5626cb7773f40cc(ref, video, audio) {
    assert(isdefined(ref) && ref != "<dev string:x1c>");
    assert(isdefined(video) && video != "<dev string:x1c>");
    assert(isdefined(audio) && audio != "<dev string:x1c>");
    var_4c0f90de4334210e = spawnstruct();
    var_4c0f90de4334210e.video = video;
    var_4c0f90de4334210e.audio = audio;
    var_4c0f90de4334210e.var_c641ce6eb2db06c = 1;
    var_4c0f90de4334210e.callbacks = [];
    var_4c0f90de4334210e.chance = clamp(getdvarfloat(hashcat(@"hash_684adbe33c32718b", ref), 1), 0, 1);
    return var_4c0f90de4334210e;
}

// Namespace namespace_2cf05cd755495a23 / namespace_2db04a57a1b9bf62
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0xaac
// Size: 0xfe
function private function_43add3ab185f3e51(ref, player, var_7421408d2c5f4f2f) {
    assert(isdefined(ref) && ref != "<dev string:x1c>");
    if (!function_5a758c8d306f92ed()) {
        return false;
    }
    if (istrue(level.var_8336fb035950fe34.var_e4841d3c199d8c76[player getentitynumber()])) {
        return false;
    }
    var_eda120484de9dc8f = level.var_8336fb035950fe34.var_9cd34562c355c3b7[ref];
    if (!isdefined(var_eda120484de9dc8f)) {
        return false;
    }
    if (!istrue(var_7421408d2c5f4f2f)) {
        if (var_eda120484de9dc8f.chance < 1 && randomfloat(1) > var_eda120484de9dc8f.chance) {
            return false;
        } else if (level.var_8336fb035950fe34.chance < 1 && randomfloat(1) > level.var_8336fb035950fe34.chance) {
            return false;
        }
    }
    return true;
}

// Namespace namespace_2cf05cd755495a23 / namespace_2db04a57a1b9bf62
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xbb3
// Size: 0x2d
function private function_7c3ca1e9f4969566() {
    scriptbundle = getscriptbundle(%"hash_78460d3d1adb5865");
    assertex(isdefined(scriptbundle), "<dev string:x20>");
    return scriptbundle;
}

// Namespace namespace_2cf05cd755495a23 / namespace_2db04a57a1b9bf62
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xbe9
// Size: 0x77
function private function_edf2c8bda9343e81(player) {
    level endon("game_ended");
    player endon("death_or_disconnect");
    entitynumber = player getentitynumber();
    var_80a38f44b08d29b = getdvarfloat(@"hash_7a2b51f4615759d3", 30);
    level.var_8336fb035950fe34.var_e4841d3c199d8c76[entitynumber] = 1;
    wait var_80a38f44b08d29b;
    level.var_8336fb035950fe34.var_e4841d3c199d8c76[entitynumber] = undefined;
}

/#

    // Namespace namespace_2cf05cd755495a23 / namespace_2db04a57a1b9bf62
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0xc68
    // Size: 0x137
    function private function_914bd51020394455() {
        level endon("<dev string:x50>");
        setdvar(@"hash_f7f763de555c63f", "<dev string:x1c>");
        while (true) {
            waitframe();
            dvarvalue = getdvar(@"hash_f7f763de555c63f", "<dev string:x1c>");
            if (dvarvalue == "<dev string:x1c>") {
                continue;
            }
            setdvar(@"hash_f7f763de555c63f", "<dev string:x1c>");
            tokens = strtok(dvarvalue, "<dev string:x5e>");
            if (!isdefined(tokens) || tokens.size == 0) {
                continue;
            }
            command = tokens[0];
            arglist = scripts\engine\utility::array_slice(tokens, 1);
            switch (command) {
            case #"hash_ee66a2867a3477e3":
                if (arglist.size == 0) {
                    iprintlnbold("<dev string:x6e>");
                } else {
                    foreach (player in level.players) {
                        function_f7fe427d574911c(arglist[0], player, 1, 1);
                    }
                }
                break;
            }
        }
    }

#/
