// mwiii decomp prototype
#using scripts\engine\utility.gsc;

#namespace namespace_ca28d060b3b6ab8e;

// Namespace namespace_ca28d060b3b6ab8e/namespace_314d49cda6272573
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb2
// Size: 0x4b
function private function_b6c06dc6663d652e(var_59c48d2e824e116b, var_2a29afaacf2a9d72) {
    var_59c48d2e824e116b endon("end_wait");
    result = undefined;
    while (!isdefined(result) || result != var_2a29afaacf2a9d72) {
        result = self waittill("ok");
    }
    var_59c48d2e824e116b notify("end_wait", 1);
}

// Namespace namespace_ca28d060b3b6ab8e/namespace_314d49cda6272573
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x104
// Size: 0x26
function private waitfortimeout(var_59c48d2e824e116b, timeout) {
    var_59c48d2e824e116b endon("end_wait");
    wait(timeout);
    var_59c48d2e824e116b notify("end_wait", 0);
}

// Namespace namespace_ca28d060b3b6ab8e/namespace_314d49cda6272573
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x131
// Size: 0x4c
function private function_f1c2d46bcb654bde(var_2a29afaacf2a9d72, timeout) {
    var_59c48d2e824e116b = spawnstruct();
    childthread function_b6c06dc6663d652e(var_59c48d2e824e116b, var_2a29afaacf2a9d72);
    childthread waitfortimeout(var_59c48d2e824e116b, timeout);
    var_63f39f46151661f8 = var_59c48d2e824e116b waittill("end_wait");
    return var_63f39f46151661f8;
}

// Namespace namespace_ca28d060b3b6ab8e/namespace_314d49cda6272573
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x185
// Size: 0x4b
function private function_cf06da592218629(soundtype) {
    /#
        assert(isdefined(self) && isplayer(self));
    #/
    if (issharedfuncdefined("sound", "trySayLocalSound")) {
        level thread [[ getsharedfunc("sound", "trySayLocalSound") ]](self, soundtype);
    }
}

// Namespace namespace_ca28d060b3b6ab8e/namespace_314d49cda6272573
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1d7
// Size: 0x44
function private function_3fc6bd204b38a2f5() {
    if (!isdefined(level.var_a7073b092595736e)) {
        level.var_a7073b092595736e = 0;
    }
    var_2a29afaacf2a9d72 = level.var_a7073b092595736e;
    level.var_a7073b092595736e = level.var_a7073b092595736e + 1;
    return var_2a29afaacf2a9d72;
}

// Namespace namespace_ca28d060b3b6ab8e/namespace_314d49cda6272573
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x223
// Size: 0x14
function private function_b8da10afdee4ecb6() {
    return getdvarint(@"hash_923b34c4661bf18d", 500);
}

// Namespace namespace_ca28d060b3b6ab8e/namespace_314d49cda6272573
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x23f
// Size: 0x36
function private function_1b0dc173255e7dd3(var_97fb1cd5e88bbf4d) {
    var_bd28f5a584bf2110 = 1000;
    var_1048e24f7ecfd108 = function_b8da10afdee4ecb6();
    return (var_97fb1cd5e88bbf4d + var_bd28f5a584bf2110 + var_1048e24f7ecfd108) / 1000;
}

// Namespace namespace_ca28d060b3b6ab8e/namespace_314d49cda6272573
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x27d
// Size: 0x36
function private function_81e08a62a6b5c2fc(timeout) {
    var_20f555e2261730d5 = 5000;
    if (isdefined(timeout)) {
        return (timeout * 1000);
    }
    return getdvarint(@"hash_9feed7a9d0b00557", var_20f555e2261730d5);
}

// Namespace namespace_ca28d060b3b6ab8e/namespace_314d49cda6272573
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2bb
// Size: 0x23
function private function_48c352e46a0677d1(var_c8df752c18209187) {
    if (var_c8df752c18209187 == 5 || var_c8df752c18209187 == 6) {
        return 0;
    } else {
        return 1;
    }
}

// Namespace namespace_ca28d060b3b6ab8e/namespace_314d49cda6272573
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2e5
// Size: 0x17
function private function_5fe394c76f3bb67e(var_c8df752c18209187) {
    if (var_c8df752c18209187 == 2) {
        return 1;
    }
    return 0;
}

// Namespace namespace_ca28d060b3b6ab8e/namespace_314d49cda6272573
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x304
// Size: 0x14
function function_7ba31cb6b21c346f() {
    return istrue(getdvarint(@"hash_7023569777f7f76d", 1));
}

// Namespace namespace_ca28d060b3b6ab8e/namespace_314d49cda6272573
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x320
// Size: 0x22
function function_9e4834f9ae737884() {
    /#
        assert(isdefined(self) && isplayer(self));
    #/
    return isdefined(self.var_ca28d060b3b6ab8e);
}

// Namespace namespace_ca28d060b3b6ab8e/namespace_314d49cda6272573
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x34a
// Size: 0x45
function function_74c8eb2aaf9f5d14(var_c8df752c18209187) {
    /#
        assert(isdefined(self) && isplayer(self));
    #/
    if (isdefined(self.var_ca28d060b3b6ab8e)) {
        return (self.var_ca28d060b3b6ab8e.type == var_c8df752c18209187);
    }
    return 0;
}

// Namespace namespace_ca28d060b3b6ab8e/namespace_314d49cda6272573
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x397
// Size: 0x211
function function_36edf91561322753(var_c8df752c18209187, timeout, callback) {
    /#
        assert(isdefined(self) && isplayer(self));
    #/
    if (!function_7ba31cb6b21c346f()) {
        return;
    }
    if (isdefined(self.var_ca28d060b3b6ab8e) && isdefined(self.var_ca28d060b3b6ab8e.var_aa6c439933f25876) && !self.var_ca28d060b3b6ab8e.var_aa6c439933f25876) {
        return;
    }
    self endon("death_or_disconnect");
    level endon("game_ended");
    var_2a29afaacf2a9d72 = function_3fc6bd204b38a2f5();
    var_cfc5920255ea9ed2 = function_81e08a62a6b5c2fc(timeout);
    var_aa6c439933f25876 = function_48c352e46a0677d1(var_c8df752c18209187);
    var_5fe394c76f3bb67e = function_5fe394c76f3bb67e(var_c8df752c18209187);
    function_50d712d830effa82(self, var_c8df752c18209187, var_2a29afaacf2a9d72, int(var_cfc5920255ea9ed2), var_5fe394c76f3bb67e);
    self.var_ca28d060b3b6ab8e = spawnstruct();
    self.var_ca28d060b3b6ab8e.var_aa6c439933f25876 = var_aa6c439933f25876;
    self.var_ca28d060b3b6ab8e.callback = callback;
    self.var_ca28d060b3b6ab8e.type = var_c8df752c18209187;
    self.var_ca28d060b3b6ab8e.var_2a29afaacf2a9d72 = var_2a29afaacf2a9d72;
    var_bc3a23b179629241 = function_1b0dc173255e7dd3(var_cfc5920255ea9ed2);
    var_63f39f46151661f8 = function_f1c2d46bcb654bde(var_2a29afaacf2a9d72, var_bc3a23b179629241);
    if (var_63f39f46151661f8) {
        switch (var_c8df752c18209187) {
        case 1:
        case 2:
        case 3:
        case 4:
            function_cf06da592218629(#"hash_a4c67e28dd65b35f");
            break;
        default:
            break;
        }
    }
    if (isdefined(self.var_ca28d060b3b6ab8e) && isdefined(self.var_ca28d060b3b6ab8e.callback)) {
        self [[ self.var_ca28d060b3b6ab8e.callback ]](var_63f39f46151661f8);
    }
    self.var_ca28d060b3b6ab8e = undefined;
}

// Namespace namespace_ca28d060b3b6ab8e/namespace_314d49cda6272573
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5af
// Size: 0x64
function function_24a08f8a03be8244(var_8f23c9dc9608a79f) {
    if (isdefined(self.var_ca28d060b3b6ab8e)) {
        if (isdefined(var_8f23c9dc9608a79f) && var_8f23c9dc9608a79f && isdefined(self.var_ca28d060b3b6ab8e.callback)) {
            self [[ self.var_ca28d060b3b6ab8e.callback ]](0);
        }
        self.var_ca28d060b3b6ab8e = undefined;
        function_aa1b7c7a8261efef(self);
    }
}

