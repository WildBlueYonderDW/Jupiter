#using script_429c2a03090c1ea1;
#using scripts\asm\asm;
#using scripts\common\callbacks;
#using scripts\engine\utility;

#namespace namespace_f9bd77bdb620b914;

// Namespace namespace_f9bd77bdb620b914 / namespace_8c27fa2259102300
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x131
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

// Namespace namespace_f9bd77bdb620b914 / namespace_8c27fa2259102300
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1d7
// Size: 0x1d
function private function_b9f4b7206d76e7ce(params) {
    function_ebb83c1efeaae2c7(params.var_c02b1f6c1721c844);
}

// Namespace namespace_f9bd77bdb620b914 / namespace_8c27fa2259102300
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1fc
// Size: 0x190
function private function_ebb83c1efeaae2c7(var_c02b1f6c1721c844) {
    if (self getscriptablehaspart(var_c02b1f6c1721c844)) {
        self setscriptablepartstate(var_c02b1f6c1721c844, "destroyed");
        function_3d2728c0e2252a1d(var_c02b1f6c1721c844, "destroyed");
        function_7380ccd6f2c49392(var_c02b1f6c1721c844, 1);
        function_ac90fa5cc0a80298("head_destroyed_in");
        self notify("head_destroyed_" + level.var_586f05706c6d0cab[var_c02b1f6c1721c844]);
        heads_remaining = function_2789dbcb483fa601(self);
        params = spawnstruct();
        params.var_c02b1f6c1721c844 = var_c02b1f6c1721c844;
        params.heads_remaining = heads_remaining;
        callback::callback("head_destroyed", params);
        if (heads_remaining.size == 2) {
            foreach (head_name in heads_remaining) {
                function_3d2875316eed616d(head_name, self.maxhealth * 0.15, "open");
            }
        } else if (heads_remaining.size == 1) {
            foreach (head_name in heads_remaining) {
                function_5f2c6624e43cd8e(head_name, self.health, "open");
            }
        } else {
            self.killondamage = 1;
        }
        return;
    }
    assertmsg("<dev string:x1c>" + var_c02b1f6c1721c844);
}

// Namespace namespace_f9bd77bdb620b914 / namespace_8c27fa2259102300
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x394
// Size: 0x5b
function function_2789dbcb483fa601(entity) {
    heads_alive = [];
    for (head_index = 0; head_index <= 2; head_index++) {
        if (function_b2fae60b8f9f98b2(entity, head_index)) {
            metabone = level.var_28e4ea2998e3439b[head_index];
            heads_alive = array_add(heads_alive, metabone);
        }
    }
    return heads_alive;
}

// Namespace namespace_f9bd77bdb620b914 / namespace_8c27fa2259102300
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3f8
// Size: 0x46
function function_68d5f1122bc3fa26(entity) {
    heads_alive = [];
    for (head_index = 0; head_index <= 2; head_index++) {
        if (function_b2fae60b8f9f98b2(entity, head_index)) {
            heads_alive = array_add(heads_alive, head_index);
        }
    }
    return heads_alive;
}

// Namespace namespace_f9bd77bdb620b914 / namespace_8c27fa2259102300
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x447
// Size: 0x51
function function_b2fae60b8f9f98b2(entity, head_index) {
    assertex(head_index >= 0 && head_index <= 2, "<dev string:x4a>");
    metabone = level.var_28e4ea2998e3439b[head_index];
    return entity function_8ddba5bfa85f8cc9(metabone) != "destroyed";
}

// Namespace namespace_f9bd77bdb620b914 / namespace_8c27fa2259102300
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4a1
// Size: 0x78
function function_da059a185d59d999(entity, head_index, is_open) {
    assertex(head_index >= 0 && head_index <= 2, "<dev string:x4a>");
    metabone_state = ter_op(istrue(is_open), "open", "closed");
    if (!function_b2fae60b8f9f98b2(entity, head_index)) {
        metabone_state = "destroyed";
    }
    entity function_3d2728c0e2252a1d(level.var_28e4ea2998e3439b[head_index], metabone_state);
}

// Namespace namespace_f9bd77bdb620b914 / namespace_8c27fa2259102300
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x521
// Size: 0x22
function function_e5db29e6fd6f6a88(var_c02b1f6c1721c844) {
    if (self getscriptablehaspart(var_c02b1f6c1721c844)) {
        return level.var_586f05706c6d0cab[var_c02b1f6c1721c844];
    }
    return undefined;
}

