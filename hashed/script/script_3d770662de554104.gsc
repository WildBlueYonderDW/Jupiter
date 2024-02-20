// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using script_10b6724c15a95e8;
#using scripts\asm\asm_bb.gsc;
#using script_4e1d4dd23699a8a4;

#namespace call_reinforcements;

// Namespace call_reinforcements/namespace_271f346b8e0c52cc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x310
// Size: 0x5b
function function_36ae2d2c117cdb23(var_cc4f2e0388379546) {
    switch (var_cc4f2e0388379546) {
    case #"hash_dab0d83df51da4d":
        return &function_3dbd361f74b442f9;
    case #"hash_722d767fd6d40f56":
        return &function_a157fbbc31d9eb1a;
    case #"hash_256644959193a6c7":
        return &function_844dfe93476d59ab;
        break;
    }
    /#
        assertmsg("Missing function pointer for " + var_cc4f2e0388379546);
    #/
}

// Namespace call_reinforcements/namespace_271f346b8e0c52cc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x372
// Size: 0xc
function function_3dbd361f74b442f9(var_f8d4ed108521e632) {
    
}

// Namespace call_reinforcements/namespace_271f346b8e0c52cc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x385
// Size: 0x1d
function function_a157fbbc31d9eb1a(var_f8d4ed108521e632) {
    self clearbtgoal(1);
    self notify("endcallreinforcements");
}

// Namespace call_reinforcements/namespace_271f346b8e0c52cc
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a9
// Size: 0xb1
function function_844dfe93476d59ab(statename, params) {
    self endon("death");
    self endon("endcallreinforcements");
    var_2f67a016c007b82b = getscriptbundle("ai_behavior_call_reinforcements:ai_behavior_call_reinforcements_default");
    if (!isdefined(var_2f67a016c007b82b)) {
        /#
            assertmsg("An AI is using the call reinforcements behavior but can't find the ai_behavior_call_reinforcements script bundle!");
        #/
        return;
    }
    self function_e64ea2b4e79c4b74(1);
    self setbtgoalradius(1, 12);
    var_3e38ee41dc326fdc = "cap_call_reinforcements";
    if (self.asmname != var_3e38ee41dc326fdc) {
        namespace_aebb27832287cd3a::cap_start(var_3e38ee41dc326fdc, "caps/interactions/cap_call_reinforcements");
    }
    self playsound("dx_br_dbos_dbli_dbtp_bitr");
    thread function_6cdcfd04e3704a8a(var_2f67a016c007b82b.var_1f76883e524b41a5);
    self waittill("cap_exit_completed");
}

// Namespace call_reinforcements/namespace_271f346b8e0c52cc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x461
// Size: 0x6d
function function_6cdcfd04e3704a8a(var_d409c918fa117965) {
    self endon("death");
    self endon("endcallreinforcements");
    wait(var_d409c918fa117965);
    if (isdefined(level.agent_funcs)) {
        var_65752f70ab196d34 = level.agent_funcs["spawn_reinforcements"];
        if (isdefined(var_65752f70ab196d34)) {
            [[ var_65752f70ab196d34 ]](self.origin, 0, 1);
        }
    }
    asm_fireevent(self.asmname, "call_reinforcements_loop_end");
}

// Namespace call_reinforcements/namespace_271f346b8e0c52cc
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4d5
// Size: 0x134
function function_73c90b8dc4dbc607(asmname, statename, params) {
    var_8d24703814510bf3 = params;
    if (!isdefined(var_8d24703814510bf3)) {
        /#
            assertmsg("Missing Reinforcements Anim section name ie start, loop, finish ");
        #/
        return;
    }
    stance = namespace_28edc79fcf2fe234::bb_getrequestedstance();
    coverstate = namespace_28edc79fcf2fe234::bb_getrequestedcoverstate();
    animname = "call_reinforcements";
    if (coverstate != "exposed") {
        covernode = namespace_28edc79fcf2fe234::bb_getcovernode();
        if (isdefined(covernode)) {
            covertype = covernode.type;
            switch (covertype) {
            case #"hash_cd3ffe799551db82":
                animname = animname + "_cover_right_" + stance;
                break;
            case #"hash_e1d8e1adebed5a61":
                animname = animname + "_cover_left_" + stance;
                break;
            case #"hash_c3b74422dec48736":
                animname = animname + "_cover_crouch";
                break;
            case #"hash_78b110033ccb68b0":
                animname = animname + "_cover_stand";
                break;
            }
        }
    }
    animname = animname + "_" + var_8d24703814510bf3;
    var_a2f6d22ed12031bf = namespace_dd3a5c61bf082e18::function_18e6c36c02a94dbd(statename, animname);
    return var_a2f6d22ed12031bf;
}

