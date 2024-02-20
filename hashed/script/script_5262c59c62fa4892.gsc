// mwiii decomp prototype
#using scripts\asm\asm.gsc;

#namespace namespace_1fabe6f807e5b196;

// Namespace namespace_1fabe6f807e5b196/namespace_55d2e8f86217c54a
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x14b
// Size: 0x5c
function function_a09401c58c128dc7(asmname, statename, params) {
    var_47a4a726ad89e165 = absangleclamp180(self.var_6f56798704f22ad1[1] - self.angles[1]);
    var_7f11984a4e846e14 = 45;
    if (var_47a4a726ad89e165 > var_7f11984a4e846e14) {
        return 1;
    }
    return 0;
}

// Namespace namespace_1fabe6f807e5b196/namespace_55d2e8f86217c54a
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1af
// Size: 0x6b
function function_85c5a3c3c6f345c4(asmname, statename, params) {
    var_47a4a726ad89e165 = angleclamp180(self.var_6f56798704f22ad1[1] - self.angles[1]);
    animindex = namespace_bf5a1761a8d1bb07::yawdiffto2468(var_47a4a726ad89e165);
    turnanim = namespace_bf5a1761a8d1bb07::asm_lookupanimfromalias(statename, animindex);
    return turnanim;
}

// Namespace namespace_1fabe6f807e5b196/namespace_55d2e8f86217c54a
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x222
// Size: 0x84
function function_17d1a1ec59138f9a(asmname, statename, params) {
    var_ceb886eb060aed49 = function_fa0aae45ce9c1727();
    self.var_3b3c2e088b48d1e2 = 6;
    self.var_44fbe4141b0cb046 = "_back";
    if (isdefined(var_ceb886eb060aed49)) {
        self.var_3b3c2e088b48d1e2 = function_a1e95f167c3c1107(var_ceb886eb060aed49, self);
        self.var_44fbe4141b0cb046 = var_ceb886eb060aed49 getdamagedirectionsuffix();
    }
    self notify("reviving_intro_starts");
    return namespace_bf5a1761a8d1bb07::asm_lookupanimfromalias(statename, self.var_3b3c2e088b48d1e2);
}

// Namespace namespace_1fabe6f807e5b196/namespace_55d2e8f86217c54a
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2ae
// Size: 0x36
function function_16c469f0054f397e(asmname, statename, params) {
    return namespace_bf5a1761a8d1bb07::asm_lookupanimfromalias(statename, self.var_3b3c2e088b48d1e2 + self.var_44fbe4141b0cb046);
}

// Namespace namespace_1fabe6f807e5b196/namespace_55d2e8f86217c54a
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2ec
// Size: 0x36
function function_bad4052c136a233e(asmname, statename, params) {
    return namespace_bf5a1761a8d1bb07::asm_lookupanimfromalias(statename, self.var_3b3c2e088b48d1e2 + self.var_44fbe4141b0cb046);
}

// Namespace namespace_1fabe6f807e5b196/namespace_55d2e8f86217c54a
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x32a
// Size: 0x77
function function_de7e772f8f75b5e7(asmname, statename, params) {
    var_ec2ebfc4cc6bffc1 = function_bc9015ad281a7a18();
    self.var_3b3c2e088b48d1e2 = 6;
    if (isdefined(var_ec2ebfc4cc6bffc1)) {
        self.var_3b3c2e088b48d1e2 = function_a1e95f167c3c1107(self, var_ec2ebfc4cc6bffc1);
    }
    self.var_44fbe4141b0cb046 = getdamagedirectionsuffix();
    return namespace_bf5a1761a8d1bb07::asm_lookupanimfromalias(statename, self.var_3b3c2e088b48d1e2 + self.var_44fbe4141b0cb046);
}

// Namespace namespace_1fabe6f807e5b196/namespace_55d2e8f86217c54a
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3a9
// Size: 0x36
function function_421eb5914b4e0e01(asmname, statename, params) {
    return namespace_bf5a1761a8d1bb07::asm_lookupanimfromalias(statename, self.var_3b3c2e088b48d1e2 + self.var_44fbe4141b0cb046);
}

// Namespace namespace_1fabe6f807e5b196/namespace_55d2e8f86217c54a
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3e7
// Size: 0x36
function function_9b9513aae33ced31(asmname, statename, params) {
    return namespace_bf5a1761a8d1bb07::asm_lookupanimfromalias(statename, self.var_3b3c2e088b48d1e2 + self.var_44fbe4141b0cb046);
}

// Namespace namespace_1fabe6f807e5b196/namespace_55d2e8f86217c54a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x425
// Size: 0x5b
function function_abc0c090a4a71a80(note, params) {
    var_8a46c62f0a756dd3 = "revival_helper_stim";
    if (self isscriptable() && self getscriptablehaspart(var_8a46c62f0a756dd3)) {
        statename = self asmgetcurrentstate(self.asmname);
        function_41d5881b0952a9d5(note, statename);
    }
}

// Namespace namespace_1fabe6f807e5b196/namespace_55d2e8f86217c54a
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x487
// Size: 0xca
function function_c723942576c01fdc(asmname, statename, params) {
    self.var_3b3c2e088b48d1e2 = 8;
    if (isdefined(self.revivetarget)) {
        totarget = self.revivetarget.origin - self.origin;
        var_47a4a726ad89e165 = angleclamp180(vectortoyaw(totarget) - self.angles[1]);
        self.var_3b3c2e088b48d1e2 = namespace_bf5a1761a8d1bb07::yawdiffto2468(var_47a4a726ad89e165);
    }
    stance = "";
    if (self.currentpose == "crouch") {
        stance = "_crouch";
    }
    return namespace_bf5a1761a8d1bb07::asm_lookupanimfromalias(statename, self.var_3b3c2e088b48d1e2 + stance);
}

// Namespace namespace_1fabe6f807e5b196/namespace_55d2e8f86217c54a
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x559
// Size: 0x50
function function_8a538717dfbbb166(asmname, statename, params) {
    self.var_3b3c2e088b48d1e2 = 6;
    self.var_44fbe4141b0cb046 = getdamagedirectionsuffix();
    return namespace_bf5a1761a8d1bb07::asm_lookupanimfromalias(statename, self.var_3b3c2e088b48d1e2 + self.var_44fbe4141b0cb046);
}

// Namespace namespace_1fabe6f807e5b196/namespace_55d2e8f86217c54a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5b1
// Size: 0x5d
function function_27bee089d16bc7c2(note, params) {
    switch (note) {
    case #"hash_2c1d80fc22d55f17":
        self shoot(100, self.revivetarget);
        self.var_f69704726b42b5c2 = gettime();
        self.revivetarget notify("shot_by_revive_pistol");
        return;
    }
}

// Namespace namespace_1fabe6f807e5b196/namespace_55d2e8f86217c54a
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x615
// Size: 0x3f
function function_a1e95f167c3c1107(from, to) {
    angle = function_bd634a02aebbde2(from, to);
    index = 6;
    if (angle >= 0) {
        index = 4;
    }
    return index;
}

// Namespace namespace_1fabe6f807e5b196/namespace_55d2e8f86217c54a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65c
// Size: 0x92
function getdamagedirectionsuffix() {
    var_bfa0da841399a70d = function_d0ddf895ca401eba();
    if (isdefined(var_bfa0da841399a70d)) {
        return var_bfa0da841399a70d;
    }
    if (self.var_10ec904bc7121440) {
        return "";
    }
    if (!isdefined(self.damageyaw)) {
        return "_back";
    }
    var_1ac69b439483dc = abs(self.damageyaw);
    if (var_1ac69b439483dc > 135) {
        return "_belly";
    } else if (var_1ac69b439483dc < 45) {
        return "_back";
    } else if (self.damageyaw < 0) {
        return "_r";
    }
    return "_l";
}

// Namespace namespace_1fabe6f807e5b196/namespace_55d2e8f86217c54a
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6f6
// Size: 0x87
function private function_41d5881b0952a9d5(note, statename) {
    self endon("death");
    self endon(statename + "_finished");
    var_8a46c62f0a756dd3 = "revival_helper_stim";
    if (isstartstr(note, "stim_attach")) {
        if (function_d74c84ce78cdd2b4(note)) {
            self setscriptablepartstate(var_8a46c62f0a756dd3, "active_right");
        } else {
            self setscriptablepartstate(var_8a46c62f0a756dd3, "active_left");
        }
    } else if (isstartstr(note, "stim_detach")) {
        self setscriptablepartstate(var_8a46c62f0a756dd3, "default");
    }
}

// Namespace namespace_1fabe6f807e5b196/namespace_55d2e8f86217c54a
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x784
// Size: 0x40
function private function_d74c84ce78cdd2b4(note) {
    res = 1;
    hand = getsubstr(note, 12);
    if (isdefined(hand) && hand == "left") {
        res = 0;
    }
    return res;
}

// Namespace namespace_1fabe6f807e5b196/namespace_55d2e8f86217c54a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x7cc
// Size: 0x2d
function private function_bc9015ad281a7a18() {
    id = self function_92435c7a6ae85c3c();
    users = function_fce201c1f66b31b6(id, "reviving_guy");
    return users[0];
}

// Namespace namespace_1fabe6f807e5b196/namespace_55d2e8f86217c54a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x801
// Size: 0x2d
function private function_fa0aae45ce9c1727() {
    id = self function_92435c7a6ae85c3c();
    users = function_fce201c1f66b31b6(id, "dying_guy");
    return users[0];
}

// Namespace namespace_1fabe6f807e5b196/namespace_55d2e8f86217c54a
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x836
// Size: 0x75
function private function_bd634a02aebbde2(guy, var_cc2828da32453f24) {
    if (isdefined(guy) && isdefined(var_cc2828da32453f24)) {
        pos = guy.origin;
        otherpos = var_cc2828da32453f24.origin;
        var_fd24f036bf2a8475 = vectortoyaw(otherpos - pos);
        return angleclamp180(var_fd24f036bf2a8475 - guy.angles[1]);
    }
    return 0;
}

// Namespace namespace_1fabe6f807e5b196/namespace_55d2e8f86217c54a
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8b3
// Size: 0xd2
function private function_d0ddf895ca401eba() {
    if (!isdefined(self.forcelongdeath)) {
        return undefined;
    }
    switch (self.forcelongdeath) {
    case 37:
    case 38:
    case 47:
    case 48:
        return "";
    case 39:
    case 40:
        return "_back";
    case 41:
    case 42:
        return "_belly";
    case 43:
    case 45:
        return "_l";
    case 44:
    case 46:
        return "_r";
        break;
    }
    return undefined;
}

