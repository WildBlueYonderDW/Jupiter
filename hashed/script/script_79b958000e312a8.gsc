// mwiii decomp prototype
#namespace namespace_af91bb24f58a4a7d;

// Namespace namespace_af91bb24f58a4a7d / namespace_b3073f6a21b8a0a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc9
// Size: 0x1b
function function_6481fdd7c2eb7d5c() {
    function_aadc3bf2875b3408(0.2);
    function_4c70ed79848813ab("mgl_ftue_tutorial_loop_01");
}

// Namespace namespace_af91bb24f58a4a7d / namespace_b3073f6a21b8a0a6
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xeb
// Size: 0x46
function function_ae00f22f048a1f57(soundalias, loop) {
    /#
        assert(isdefined(soundalias));
    #/
    if (isdefined(loop)) {
        if (loop) {
            self playloopsound(soundalias);
        } else {
            self playlocalsound(soundalias);
        }
        return;
    }
    self playlocalsound(soundalias);
}

// Namespace namespace_af91bb24f58a4a7d / namespace_b3073f6a21b8a0a6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x138
// Size: 0x1e
function function_4c70ed79848813ab(musicstate) {
    /#
        assert(isdefined(musicstate));
    #/
    setmusicstate(musicstate);
}

// Namespace namespace_af91bb24f58a4a7d / namespace_b3073f6a21b8a0a6
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15d
// Size: 0x6f
function function_aadc3bf2875b3408(volume) {
    if (getdvarint(@"hash_4b32f268c08cd4e8", 0) == 1) {
        return;
    }
    clamp(volume, 0, 1);
    function_adfd4002c83fe6b2("wpn_plr", volume);
    function_adfd4002c83fe6b2("wpn_plr_atmo", volume);
    function_adfd4002c83fe6b2("wpn_plr_mech", volume);
    function_adfd4002c83fe6b2("wpn_reflections", volume);
    function_adfd4002c83fe6b2("wpn_reflections_dist", volume);
}

