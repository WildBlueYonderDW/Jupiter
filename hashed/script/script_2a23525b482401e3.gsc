// mwiii decomp prototype
#using scripts\asm\asm.gsc;
#using script_4e1d4dd23699a8a4;
#using script_53651341190c5aab;

#namespace namespace_17024fe9f12b8fc9;

// Namespace namespace_17024fe9f12b8fc9/namespace_f8f0d25399aa59e9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bb
// Size: 0xf4
function function_36ae2d2c117cdb23(var_cc4f2e0388379546) {
    switch (var_cc4f2e0388379546) {
    case #"hash_9edce9aa4f165c6b":
        return &function_85df049e80f30a6f;
    case #"hash_fe0e9f8796a0acad":
        return &function_3dbd361f74b442f9;
    case #"hash_e93ace2ec1639636":
        return &function_a157fbbc31d9eb1a;
    case #"hash_1bda0008592d217c":
        return &function_b8a54ef5dc160380;
    case #"hash_f67d8dffeaed2c04":
        return &function_d77b520cefcefa50;
    case #"hash_c3f922b3de94557b":
        return &function_9b4e4b04843c7e9f;
    case #"hash_9f9e07224ff2a95a":
        return &function_18add0932f52ee9e;
    case #"hash_d4dd8779b1436104":
        return &function_e28c16df7b2f92e0;
    case #"hash_6e88d76179a2a0c0":
        return &function_e73bcb6e8160c464;
    case #"hash_fd9154ff75bc4e6b":
        return &function_d8786f820807c4f;
    case #"hash_8cc77e3e31358f72":
        return &function_8f98221d71dafe6e;
    case #"hash_96267c6c4ba82c4a":
        return &function_ee80e8684c598cae;
        break;
    }
    return namespace_f901a4f9d899be59::function_efcea5d26798e5b6(var_cc4f2e0388379546);
}

// Namespace namespace_17024fe9f12b8fc9/namespace_f8f0d25399aa59e9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b7
// Size: 0x24
function function_3dbd361f74b442f9(var_f8d4ed108521e632) {
    self.var_509c25e93045428d = 0;
    self.var_ddad29bbdecd1671 = &function_85df049e80f30a6f;
}

// Namespace namespace_17024fe9f12b8fc9/namespace_f8f0d25399aa59e9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e2
// Size: 0x85
function function_a157fbbc31d9eb1a(var_f8d4ed108521e632) {
    self.var_7916f201efb9963f = undefined;
    namespace_f901a4f9d899be59::function_8add99cb1b82b964(var_f8d4ed108521e632);
    if (self.asmname != self.var_a942dd31d55102c9 && (function_e28c16df7b2f92e0() || function_9b4e4b04843c7e9f())) {
        self._blackboard.var_7460b96395361857 = "react";
    } else {
        self._blackboard.var_7460b96395361857 = "end";
    }
    self notify("interaction_end");
}

// Namespace namespace_17024fe9f12b8fc9/namespace_f8f0d25399aa59e9
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36e
// Size: 0x1d
function function_b8a54ef5dc160380(receiver, info, origin) {
    return 0;
}

// Namespace namespace_17024fe9f12b8fc9/namespace_f8f0d25399aa59e9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x393
// Size: 0x7a
function function_85df049e80f30a6f(statename, params) {
    role = "guy";
    if (issubstr(self.var_ae3ea15396b65c1f, "guard")) {
        role = "pistol";
    }
    var_996949b7474560eb = function_a0cccf0b4c466b2c(self, role);
    if (!isdefined(var_996949b7474560eb)) {
        role = "guy";
        var_996949b7474560eb = function_a0cccf0b4c466b2c(self, "guy");
    }
    namespace_f901a4f9d899be59::function_29946584b628c719(statename, [0:role]);
}

// Namespace namespace_17024fe9f12b8fc9/namespace_f8f0d25399aa59e9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x414
// Size: 0x14e
function function_18add0932f52ee9e(statename, role) {
    var_996949b7474560eb = function_a0cccf0b4c466b2c(self, role);
    animset = var_996949b7474560eb.animation;
    var_bcf3c74b1d8b4883 = var_996949b7474560eb.var_bcf3c74b1d8b4883;
    var_842a67ee2435339d = var_996949b7474560eb.initialstate;
    var_127e00a9379f717c = var_996949b7474560eb.var_bad4f0bd11cbdcf9;
    id = self function_92435c7a6ae85c3c();
    /#
        assert(isdefined(id));
    #/
    origin = function_bbfc94714c82788b(id);
    angles = function_785f60047abcfa05(id);
    if (isdefined(var_842a67ee2435339d) && isdefined(var_127e00a9379f717c)) {
        var_2c8936d08f85c5c1 = archetypegetrandomalias(animset, var_842a67ee2435339d, var_127e00a9379f717c, 0);
        /#
            assert(var_2c8936d08f85c5c1 >= 0);
        #/
        xanim = animsetgetanimfromindex(animset, var_842a67ee2435339d, var_2c8936d08f85c5c1);
        origin = getstartorigin(origin, angles, xanim);
    }
    if (isdefined(self._blackboard.idlenode) && istrue(self._blackboard.idlenode.script_faceangles)) {
        self.var_a41edf45bb0ff97 = angles;
    }
    return origin;
}

// Namespace namespace_17024fe9f12b8fc9/namespace_f8f0d25399aa59e9
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x56a
// Size: 0x83
function function_3c2bc94b2abf6fad(asmname, statename, params) {
    var_2c8936d08f85c5c1 = asm_getanim(asmname, statename);
    xanim = asm_getxanim(statename, var_2c8936d08f85c5c1);
    if (isdefined(params) && params == "loop") {
        self.var_509c25e93045428d = self.var_509c25e93045428d + getanimlength(xanim);
        function_c6f62de5c6e04207(asmname, statename, params);
    } else {
        function_fb8afeabd23a5ef5(asmname, statename, params, var_2c8936d08f85c5c1);
    }
}

// Namespace namespace_17024fe9f12b8fc9/namespace_f8f0d25399aa59e9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f4
// Size: 0x16
function function_9b4e4b04843c7e9f(params) {
    return isdefined(self.var_fd01ad49b4e38ae8);
}

// Namespace namespace_17024fe9f12b8fc9/namespace_f8f0d25399aa59e9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x612
// Size: 0xac
function function_d8786f820807c4f(statename, params) {
    newstate = "custom_patrol_lookaround_passthrough";
    if (!isdefined(params[0])) {
        newstate = "stl_react_passthrough";
        if (!isdefined(self.var_fd01ad49b4e38ae8)) {
            if (isdefined(self.var_de7ab32958c52392)) {
                self.var_fd01ad49b4e38ae8 = self.var_de7ab32958c52392;
            } else {
                self.var_fd01ad49b4e38ae8 = "med";
            }
        }
    }
    if (self asmhasstate(self.asmname, newstate)) {
        /#
            assert(self asmhasstate(self.asmname, newstate));
        #/
        self asmsetstate(self.asmname, newstate);
    }
}

// Namespace namespace_17024fe9f12b8fc9/namespace_f8f0d25399aa59e9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c5
// Size: 0x3a
function function_e28c16df7b2f92e0(statename, params) {
    return self.bisincombat || isdefined(self.stealth) && self.var_fe5ebefa740c7106 != 0;
}

// Namespace namespace_17024fe9f12b8fc9/namespace_f8f0d25399aa59e9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x707
// Size: 0x18f
function function_a8367856a2c4316f() {
    if (!isdefined(self._blackboard.idlenode)) {
        return (self.var_509c25e93045428d * 1000 + gettime());
    }
    looptime = 0;
    if (isdefined(self._blackboard.idlenode.script_delay_min) && isdefined(self._blackboard.idlenode.script_delay_max)) {
        looptime = randomfloatrange(self._blackboard.idlenode.script_delay_min, self._blackboard.idlenode.script_delay_max);
    } else if (isdefined(self._blackboard.idlenode.script_delay)) {
        looptime = self._blackboard.idlenode.script_delay;
    }
    if (istrue(self._blackboard.idlenode.var_bfd4dba913c52168)) {
        var_ee7b03b3c11dfdba = int(looptime / self.var_509c25e93045428d);
        fraction = looptime - var_ee7b03b3c11dfdba * self.var_509c25e93045428d;
        if (fraction > 0) {
            var_ee7b03b3c11dfdba = var_ee7b03b3c11dfdba + 1;
        }
        looptime = var_ee7b03b3c11dfdba * self.var_509c25e93045428d;
    }
    time = (self.var_509c25e93045428d + looptime) * 1000 + gettime();
    return time;
}

// Namespace namespace_17024fe9f12b8fc9/namespace_f8f0d25399aa59e9
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x89e
// Size: 0xec
function function_e73bcb6e8160c464(asmname, statename, params) {
    if (isdefined(self._blackboard.idlenode) && isdefined(self._blackboard.idlenode.var_803f2bf203326f29)) {
        if (istrue(int(self._blackboard.idlenode.var_803f2bf203326f29))) {
            return 0;
        }
    }
    if (istrue(self.var_36023fdce648d2ea)) {
        return 0;
    }
    if (!isdefined(self.var_7916f201efb9963f) || self.var_7916f201efb9963f <= 0) {
        self.var_7916f201efb9963f = function_a8367856a2c4316f();
    }
    if (isdefined(self.var_7916f201efb9963f)) {
        remainingtime = self.var_7916f201efb9963f - gettime();
        /#
        #/
        return (remainingtime <= 0);
    } else {
        return 1;
    }
}

// Namespace namespace_17024fe9f12b8fc9/namespace_f8f0d25399aa59e9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x991
// Size: 0x45
function function_d77b520cefcefa50(statename, params) {
    return isdefined(self._blackboard.var_7460b96395361857) && self._blackboard.var_7460b96395361857 == "looping";
}

// Namespace namespace_17024fe9f12b8fc9/namespace_f8f0d25399aa59e9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9de
// Size: 0x52
function function_8f98221d71dafe6e(param) {
    statename = "react";
    alias = function_6d173209b1c25616();
    var_eabf81b5be8ddb5 = archetypegetrandomalias(self.var_ae3ea15396b65c1f, statename, alias, 0);
    if (isdefined(var_eabf81b5be8ddb5)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_17024fe9f12b8fc9/namespace_f8f0d25399aa59e9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa38
// Size: 0xb5
function function_6d173209b1c25616() {
    var_c5e576cf2978534b = 0;
    if (isdefined(self.var_1c9ed4a46d13edc9)) {
        delta = self.var_1c9ed4a46d13edc9 - self.origin;
        deltayaw = vectortoyaw(delta);
        var_c5e576cf2978534b = self.angles[1] - deltayaw;
    }
    var_c5e576cf2978534b = angleclamp180(var_c5e576cf2978534b);
    var_394efcef72c7ebea = function_de2aa7eb339a432c(var_c5e576cf2978534b);
    suffix = var_394efcef72c7ebea;
    if (var_c5e576cf2978534b < -120 && var_c5e576cf2978534b > -180) {
        suffix = suffix + "l";
    } else if (var_c5e576cf2978534b > 120 && var_c5e576cf2978534b < 180) {
        suffix = suffix + "r";
    }
    return suffix;
}

// Namespace namespace_17024fe9f12b8fc9/namespace_f8f0d25399aa59e9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf5
// Size: 0x54
function function_de2aa7eb339a432c(angle) {
    angle = angleclamp180(angle);
    if (angle > 120 || angle < -120) {
        index = 2;
    } else if (angle < -30) {
        index = 4;
    } else if (angle > 30) {
        index = 6;
    } else {
        index = 8;
    }
    return index;
}

// Namespace namespace_17024fe9f12b8fc9/namespace_f8f0d25399aa59e9
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb51
// Size: 0x40
function function_ee80e8684c598cae(asmname, statename, var_f2b19b25d457c2a6, params) {
    aliases = archetypegetaliases(self.var_ae3ea15396b65c1f, var_f2b19b25d457c2a6);
    return isdefined(aliases);
}

