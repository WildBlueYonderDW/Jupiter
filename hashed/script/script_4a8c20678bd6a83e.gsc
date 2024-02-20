// mwiii decomp prototype
#using scripts\asm\asm.gsc;

#namespace namespace_8301c8f5109ac402;

// Namespace namespace_8301c8f5109ac402/namespace_49a23839f1dcc76a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x78
// Size: 0x33
function function_ab049ddedfee356c(taskid, params) {
    if (!self.var_20a0e88052918576) {
        return anim.failure;
    }
    return anim.running;
}

// Namespace namespace_8301c8f5109ac402/namespace_49a23839f1dcc76a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb3
// Size: 0x12
function is_traversing() {
    return self.var_32a34987ee1b3095 != "not_set";
}

