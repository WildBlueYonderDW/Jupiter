// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using scripts\engine\utility.gsc;

#namespace namespace_a624a0178cc156e4;

// Namespace namespace_a624a0178cc156e4/namespace_ed7c38f3847343dc
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xa2
// Size: 0x2f
function private autoexec init() {
    registersharedfunc("zombie", "stunZombie", &function_2e4d3c67e63f83ac);
    registersharedfunc("zombie", "clearStunZombie", &clear_stun);
}

// Namespace namespace_a624a0178cc156e4/namespace_ed7c38f3847343dc
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd8
// Size: 0x37
function function_fd5292c44cbcbebe(taskid, params) {
    if (!is_stunned()) {
        return anim.failure;
    }
    self clearpath();
    return anim.running;
}

// Namespace namespace_a624a0178cc156e4/namespace_ed7c38f3847343dc
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x117
// Size: 0xe0
function function_2e4d3c67e63f83ac(duration) {
    if (isdefined(self.var_971d11b71ceb4346) && !istrue(self.var_971d11b71ceb4346.var_836834377fb9b633)) {
        return;
    }
    if (istrue(self.disallow_stun)) {
        return;
    }
    /#
        assert(isdefined(duration));
    #/
    if (!isdefined(self.asmname)) {
        return;
    }
    if (!self asmhasstate(self.asmname, "stun_in")) {
        return;
    }
    end_time = gettime() + int(duration * 1000);
    if (isdefined(self.var_b40984b29c45936d) && self.var_b40984b29c45936d > end_time) {
        return;
    }
    self._blackboard.var_e42e5f8ee06d791d = end_time;
    self._blackboard.var_8b915e6d74944598 = 1;
    function_ac90fa5cc0a80298("stun_in");
}

// Namespace namespace_a624a0178cc156e4/namespace_ed7c38f3847343dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fe
// Size: 0x34
function is_stunned() {
    return isdefined(self._blackboard.var_e42e5f8ee06d791d) && gettime() < self._blackboard.var_e42e5f8ee06d791d;
}

// Namespace namespace_a624a0178cc156e4/namespace_ed7c38f3847343dc
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23a
// Size: 0x3a
function clear_stun() {
    if (isdefined(self._blackboard)) {
        self._blackboard.var_e42e5f8ee06d791d = 0;
        self._blackboard.var_8b915e6d74944598 = 0;
    }
}

