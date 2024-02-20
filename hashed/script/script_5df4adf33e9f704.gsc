// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\asm\asm.gsc;
#using script_429c2a03090c1ea1;

#namespace namespace_f9bd77bdb620b914;

// Namespace namespace_f9bd77bdb620b914/namespace_8c27fa2259102300
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x145
// Size: 0x9e
function autoexec main() {
    var_601bcee5d276f46d = "zombie_abom";
    function_d6736c5ef5ac2990(var_601bcee5d276f46d, &function_b9f4b7206d76e7ce);
    level.var_586f05706c6d0cab = [];
    level.var_586f05706c6d0cab["head_le"] = 0;
    level.var_586f05706c6d0cab["head_mid"] = 1;
    level.var_586f05706c6d0cab["head_ri"] = 2;
    level.var_28e4ea2998e3439b = [];
    level.var_28e4ea2998e3439b[0] = "head_le";
    level.var_28e4ea2998e3439b[1] = "head_mid";
    level.var_28e4ea2998e3439b[2] = "head_ri";
}

// Namespace namespace_f9bd77bdb620b914/namespace_8c27fa2259102300
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1ea
// Size: 0x1e
function private function_b9f4b7206d76e7ce(params) {
    function_ebb83c1efeaae2c7(params.var_c02b1f6c1721c844);
}

// Namespace namespace_f9bd77bdb620b914/namespace_8c27fa2259102300
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x20f
// Size: 0x196
function private function_ebb83c1efeaae2c7(var_c02b1f6c1721c844) {
    if (self getscriptablehaspart(var_c02b1f6c1721c844)) {
        self setscriptablepartstate(var_c02b1f6c1721c844, "destroyed");
        function_3d2728c0e2252a1d(var_c02b1f6c1721c844, "destroyed");
        function_7380ccd6f2c49392(var_c02b1f6c1721c844, 1);
        function_ac90fa5cc0a80298("head_destroyed_in");
        self notify("head_destroyed_" + level.var_586f05706c6d0cab[var_c02b1f6c1721c844]);
        var_5f8654b3994ce1ff = function_2789dbcb483fa601(self);
        params = spawnstruct();
        params.var_c02b1f6c1721c844 = var_c02b1f6c1721c844;
        params.var_5f8654b3994ce1ff = var_5f8654b3994ce1ff;
        callback::callback("head_destroyed", params);
        if (var_5f8654b3994ce1ff.size == 2) {
            foreach (var_763e5dec061ae843 in var_5f8654b3994ce1ff) {
                function_3d2875316eed616d(var_763e5dec061ae843, self.maxhealth * 0.15, "open");
            }
        } else if (var_5f8654b3994ce1ff.size == 1) {
            foreach (var_763e5dec061ae843 in var_5f8654b3994ce1ff) {
                function_5f2c6624e43cd8e(var_763e5dec061ae843, self.health, "open");
            }
        } else {
            self.var_cbee08d81e41 = 1;
        }
    } else {
        /#
            assertmsg("Trying to destroy invalid metabone. Name: " + var_c02b1f6c1721c844);
        #/
    }
}

// Namespace namespace_f9bd77bdb620b914/namespace_8c27fa2259102300
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ac
// Size: 0x5d
function function_2789dbcb483fa601(entity) {
    var_a944e6747ca96762 = [];
    for (head_index = 0; head_index <= 2; head_index++) {
        if (function_b2fae60b8f9f98b2(entity, head_index)) {
            var_20237ca8e4edbc82 = level.var_28e4ea2998e3439b[head_index];
            var_a944e6747ca96762 = array_add(var_a944e6747ca96762, var_20237ca8e4edbc82);
        }
    }
    return var_a944e6747ca96762;
}

// Namespace namespace_f9bd77bdb620b914/namespace_8c27fa2259102300
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x411
// Size: 0x47
function function_68d5f1122bc3fa26(entity) {
    var_a944e6747ca96762 = [];
    for (head_index = 0; head_index <= 2; head_index++) {
        if (function_b2fae60b8f9f98b2(entity, head_index)) {
            var_a944e6747ca96762 = array_add(var_a944e6747ca96762, head_index);
        }
    }
    return var_a944e6747ca96762;
}

// Namespace namespace_f9bd77bdb620b914/namespace_8c27fa2259102300
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x460
// Size: 0x51
function function_b2fae60b8f9f98b2(entity, head_index) {
    /#
        assertex(head_index >= 0 && head_index <= 2, "Invalid Abomination Head Index passed");
    #/
    var_20237ca8e4edbc82 = level.var_28e4ea2998e3439b[head_index];
    return entity function_8ddba5bfa85f8cc9(var_20237ca8e4edbc82) != "destroyed";
}

// Namespace namespace_f9bd77bdb620b914/namespace_8c27fa2259102300
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b9
// Size: 0x78
function function_da059a185d59d999(entity, head_index, is_open) {
    /#
        assertex(head_index >= 0 && head_index <= 2, "Invalid Abomination Head Index passed");
    #/
    var_71f4ec7058b74008 = ter_op(istrue(is_open), "open", "closed");
    if (!function_b2fae60b8f9f98b2(entity, head_index)) {
        var_71f4ec7058b74008 = "destroyed";
    }
    entity function_3d2728c0e2252a1d(level.var_28e4ea2998e3439b[head_index], var_71f4ec7058b74008);
}

// Namespace namespace_f9bd77bdb620b914/namespace_8c27fa2259102300
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x538
// Size: 0x23
function function_e5db29e6fd6f6a88(var_c02b1f6c1721c844) {
    if (self getscriptablehaspart(var_c02b1f6c1721c844)) {
        return level.var_586f05706c6d0cab[var_c02b1f6c1721c844];
    }
    return undefined;
}

