// mwiii decomp prototype
#using scripts\asm\asm_bb.gsc;
#using scripts\asm\asm.gsc;
#using script_10b6724c15a95e8;

#namespace namespace_ee40130089e5429f;

// Namespace namespace_ee40130089e5429f/namespace_6930af0ec0bf4a3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x199
// Size: 0x7f
function function_36ae2d2c117cdb23(var_cc4f2e0388379546) {
    switch (var_cc4f2e0388379546) {
    case #"hash_dab0d83df51da4d":
        return &function_3dbd361f74b442f9;
    case #"hash_722d767fd6d40f56":
        return &function_a157fbbc31d9eb1a;
    case #"hash_902f9e79d5e57c83":
        return &function_d9a30a0827fab997;
    case #"hash_1637227a26307eb5":
        return &function_46a6cb991c2a5d49;
    case #"hash_6279e013ab5c4fdd":
        return &usearmorplate;
        break;
    }
    /#
        assertmsg("Missing function pointer for " + var_cc4f2e0388379546);
    #/
}

// Namespace namespace_ee40130089e5429f/namespace_6930af0ec0bf4a3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21f
// Size: 0xc
function function_3dbd361f74b442f9(var_f8d4ed108521e632) {
    
}

// Namespace namespace_ee40130089e5429f/namespace_6930af0ec0bf4a3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x232
// Size: 0xa1
function function_a157fbbc31d9eb1a(var_f8d4ed108521e632) {
    self clearbtgoal(1);
    self notify("endusearmorplate");
    /#
        if (isagent(self)) {
            /#
                assertex(self isscriptable(), "<unknown string>" + self.agent_type + "<unknown string>");
            #/
        }
    #/
    var_8a46c62f0a756dd3 = "armor_plate";
    if (self isscriptable() && self getscriptablehaspart(var_8a46c62f0a756dd3)) {
        self setscriptablepartstate(var_8a46c62f0a756dd3, "default");
    }
    if (isalive(self) && self.asmname == "cap_use_armor_plate_solo") {
        namespace_aebb27832287cd3a::function_b6af4ade50626e90();
    }
}

// Namespace namespace_ee40130089e5429f/namespace_6930af0ec0bf4a3f
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2da
// Size: 0x66
function function_d9a30a0827fab997(receiver, info, origin) {
    if (info == "focused_on") {
        distsq = distancesquared(receiver.origin, origin);
        var_63233bca53efdd98 = 150;
        if (distsq < var_63233bca53efdd98 * var_63233bca53efdd98) {
            self notify("endusearmorplate");
            return 1;
        }
        return 1;
    }
    return 0;
}

// Namespace namespace_ee40130089e5429f/namespace_6930af0ec0bf4a3f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x348
// Size: 0x29
function function_46a6cb991c2a5d49(statename, params) {
    self function_e64ea2b4e79c4b74(1);
    self setbtgoalradius(1, params[0]);
}

// Namespace namespace_ee40130089e5429f/namespace_6930af0ec0bf4a3f
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x378
// Size: 0x72
function usearmorplate(statename, params) {
    self endon("death");
    self endon("endusearmorplate");
    var_3e38ee41dc326fdc = "cap_use_armor_plate_solo";
    if (self.asmname != var_3e38ee41dc326fdc) {
        namespace_aebb27832287cd3a::cap_start(var_3e38ee41dc326fdc, "caps/interactions/cap_use_armor_plate_solo");
    }
    function_30b70873a0937989("Using Armor Plate!");
    self waittill("cap_exit_completed");
    asm_fireephemeralevent("use_armor_plate", "end");
}

// Namespace namespace_ee40130089e5429f/namespace_6930af0ec0bf4a3f
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f1
// Size: 0x64
function function_30b70873a0937989(var_22e9090a351646e9) {
    debug = getdvarint(@"hash_3e267ec6e066e2b", 0);
    if (istrue(debug)) {
        /#
            print3d(self.origin + (0, 0, 80), var_22e9090a351646e9, (1, 1, 1), 1, 0.8, 1, 1);
        #/
    }
}

