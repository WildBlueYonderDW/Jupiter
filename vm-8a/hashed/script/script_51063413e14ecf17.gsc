#using script_bd0d3e8f9ff5c11;

#namespace namespace_c234fc735f913929;

// Namespace namespace_c234fc735f913929 / namespace_e37c6978b4bea581
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x70
// Size: 0x59
function function_64e819ba93c64ccc(taskid) {
    target = self.enemy;
    if (!isalive(target)) {
        return anim.failure;
    }
    if (function_e82696e7b59178f3(target.origin)) {
        return anim.failure;
    }
    return anim.success;
}

