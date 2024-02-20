// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\engine\utility.gsc;
#using script_4a8c20678bd6a83e;

#namespace namespace_560e78dfaa3a1c81;

// Namespace namespace_560e78dfaa3a1c81/namespace_7d24de258f16ea69
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa3
// Size: 0x35
function function_92fcbb3c9780deb7(taskid, params) {
    if (!ent_flag("in_liveragdoll")) {
        return anim.failure;
    }
    return anim.running;
}

// Namespace namespace_560e78dfaa3a1c81/namespace_7d24de258f16ea69
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe0
// Size: 0x95
function function_3c1b4ff1cb5f468d(source_pos, intensity) {
    if (!isdefined(source_pos)) {
        return;
    }
    if (function_cc4b0ff1f1c7aa1b()) {
        return;
    }
    if (!self asmhasstate(self.asmname, "liveragdoll_in")) {
        return;
    }
    if (getdvarint(@"hash_dee78f8c41d19b65", 0) > 0) {
        var_4f3eec7aecbb41bf = vectornormalize(self.origin - source_pos);
        self function_babd8af3054d8abe("head", var_4f3eec7aecbb41bf * intensity, 1, 0);
    } else {
        self function_360874d9808f0724();
    }
    function_ac90fa5cc0a80298("liveragdoll_in");
    return 1;
}

// Namespace namespace_560e78dfaa3a1c81/namespace_7d24de258f16ea69
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17d
// Size: 0xe
function function_cc4b0ff1f1c7aa1b() {
    return ent_flag("in_liveragdoll");
}

