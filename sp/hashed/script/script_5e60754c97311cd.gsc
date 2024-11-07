#using scripts\engine\utility.gsc;

#namespace namespace_e8ef20a56b8dd183;

// Namespace namespace_e8ef20a56b8dd183 / namespace_5f525a317698965f
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x9c
// Size: 0x179
function function_b9e130d444d299c9(exploder_id, zones, var_f561532d7d9555b9, stop_fx) {
    assert(isdefined(exploder_id));
    assert(isdefined(zones));
    function_605874f5b079939e();
    if (!isarray(zones)) {
        zones = [zones];
    }
    foreach (zone in zones) {
        flag_init(zone);
    }
    flag_init("vfx_zone_" + exploder_id + "_active");
    if (isdefined(var_f561532d7d9555b9)) {
        if (!isarray(var_f561532d7d9555b9)) {
            var_f561532d7d9555b9 = [var_f561532d7d9555b9];
            foreach (var_d7c211b499759410 in var_f561532d7d9555b9) {
                if (!flag_exist(var_d7c211b499759410)) {
                    flag_init(var_d7c211b499759410);
                }
            }
        }
    }
    if (!isdefined(stop_fx)) {
        stop_fx = 0;
    }
    waitframe();
    var_2bc7b1a5cea0c302 = spawnstruct();
    var_2bc7b1a5cea0c302.playing = 0;
    var_2bc7b1a5cea0c302.stop = stop_fx;
    if (isdefined(var_f561532d7d9555b9)) {
        var_2bc7b1a5cea0c302 thread function_6e68ec1667a60118(exploder_id, var_f561532d7d9555b9, zones);
    }
    var_2bc7b1a5cea0c302 thread function_840df183a03cf7f6(exploder_id, zones);
}

// Namespace namespace_e8ef20a56b8dd183 / namespace_5f525a317698965f
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x21d
// Size: 0x54
function private function_605874f5b079939e() {
    if (!isdefined(level._fx)) {
        level._fx = spawnstruct();
    }
    /#
        if (!isdefined(level._fx.var_a1986b7fa363399a)) {
            level._fx.var_a1986b7fa363399a = 1;
            init_dvars();
        }
    #/
}

/#

    // Namespace namespace_e8ef20a56b8dd183 / namespace_5f525a317698965f
    // Params 0, eflags: 0x4
    // Checksum 0x0, Offset: 0x279
    // Size: 0x15
    function private init_dvars() {
        setdvarifuninitialized(@"hash_6db7cb3d747e8695", 0);
    }

#/

// Namespace namespace_e8ef20a56b8dd183 / namespace_5f525a317698965f
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x296
// Size: 0x45
function private function_840df183a03cf7f6(exploder_id, zones) {
    while (true) {
        thread function_dea7cc77ad90ba55(exploder_id, zones);
        level waittill("vfx_zone_" + exploder_id + "_deactivating");
        level waittill("vfx_zone_" + exploder_id + "_activating");
    }
}

// Namespace namespace_e8ef20a56b8dd183 / namespace_5f525a317698965f
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x2e3
// Size: 0x95
function private function_dea7cc77ad90ba55(exploder_id, zones) {
    level endon("vfx_zone_" + exploder_id + "_deactivating");
    for (;;) {
        function_665d474ff040b446(zones);
        /#
            if (getdvarint(@"hash_6db7cb3d747e8695", 0)) {
                iprintln("<dev string:x1c>" + exploder_id + "<dev string:x27>");
            }
        #/
        function_dd68bfc87e15605b(exploder_id);
        flag_waitopen_all_array(zones);
        /#
            if (getdvarint(@"hash_6db7cb3d747e8695", 0)) {
                iprintln("<dev string:x1c>" + exploder_id + "<dev string:x2b>");
            }
        #/
        exploder_stop(exploder_id);
    }
}

// Namespace namespace_e8ef20a56b8dd183 / namespace_5f525a317698965f
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x380
// Size: 0x9c
function private function_6e68ec1667a60118(exploder_id, var_f561532d7d9555b9, zones) {
    for (;;) {
        function_665d474ff040b446(var_f561532d7d9555b9);
        function_62691cef5a23cc3c(exploder_id);
        exploder_stop(exploder_id);
        flag_waitopen_all_array(var_f561532d7d9555b9);
        function_a1b55e334a14c24d(exploder_id);
        foreach (zone in zones) {
            if (flag(zone)) {
                function_dd68bfc87e15605b(exploder_id);
                break;
            }
        }
    }
}

// Namespace namespace_e8ef20a56b8dd183 / namespace_5f525a317698965f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x424
// Size: 0x2f
function private function_a1b55e334a14c24d(exploder_id) {
    level notify("vfx_zone_" + exploder_id + "_activating");
    flag_set("vfx_zone_" + exploder_id + "_active");
}

// Namespace namespace_e8ef20a56b8dd183 / namespace_5f525a317698965f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x45b
// Size: 0x2f
function private function_62691cef5a23cc3c(exploder_id) {
    level notify("vfx_zone_" + exploder_id + "_deactivating");
    flag_clear("vfx_zone_" + exploder_id + "_active");
}

// Namespace namespace_e8ef20a56b8dd183 / namespace_5f525a317698965f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x492
// Size: 0x2b
function private function_dd68bfc87e15605b(exploder_id) {
    if (self.playing) {
        return;
    }
    self.playing = 1;
    exploder(exploder_id);
}

// Namespace namespace_e8ef20a56b8dd183 / namespace_5f525a317698965f
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4c5
// Size: 0x41
function private exploder_stop(exploder_id) {
    if (!self.playing) {
        return;
    }
    self.playing = 0;
    if (self.stop) {
        stop_exploder(exploder_id);
        return;
    }
    kill_exploder(exploder_id);
}

