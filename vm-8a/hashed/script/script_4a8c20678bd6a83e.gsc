#using scripts\asm\asm.gsc;

#namespace zombie_traverse;

// Namespace zombie_traverse / namespace_49a23839f1dcc76a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x78
// Size: 0x32
function processtraverse(taskid, params) {
    if (!self.var_20a0e88052918576) {
        return anim.failure;
    }
    return anim.running;
}

// Namespace zombie_traverse / namespace_49a23839f1dcc76a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb3
// Size: 0x11
function is_traversing() {
    return self.var_32a34987ee1b3095 != "not_set";
}

