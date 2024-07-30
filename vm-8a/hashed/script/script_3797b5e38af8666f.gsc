#using scripts\asm\asm.gsc;
#using scripts\asm\cap.gsc;
#using scripts\asm\shared\utility.gsc;
#using scripts\engine\utility.gsc;

#namespace base_interaction;

// Namespace base_interaction / namespace_93802ef5ac63ad7b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xae
// Size: 0x6d
function initcap(asmname, statename, params) {
    if (isai(self)) {
        self animmode("noclip");
        self orientmode("face current");
    } else {
        self.fnasm_handlenotetrack = level._defaultnotetrackhandler;
    }
    if (isdefined(self.scriptedarrivalent)) {
        self.scriptedarrivalent delete();
    }
}

// Namespace base_interaction / namespace_93802ef5ac63ad7b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x123
// Size: 0x2
function function_912821adbd16d04c() {
    
}

// Namespace base_interaction / namespace_93802ef5ac63ad7b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12d
// Size: 0x2
function function_e3189c04775f3a0f() {
    
}

// Namespace base_interaction / namespace_93802ef5ac63ad7b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x137
// Size: 0x86
function function_dc875c74aa7545f4(asmname, statename, params) {
    if (!isdefined(self._blackboard.var_40a41c70824fa4c4)) {
        self._blackboard.var_40a41c70824fa4c4 = "a";
    }
    if (self._blackboard.var_40a41c70824fa4c4 == "b") {
        return function_a0dfeea159aa7f64(asmname, statename, "a_to_b");
    }
    return function_a0dfeea159aa7f64(asmname, statename, "b_to_a");
}

// Namespace base_interaction / namespace_93802ef5ac63ad7b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1c5
// Size: 0x1c
function function_e9f61f14d08fcd61(asmname, statename, params) {
    return false;
}

// Namespace base_interaction / namespace_93802ef5ac63ad7b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1ea
// Size: 0x1c
function function_92087655510b0e0(asmname, statename, params) {
    return false;
}

// Namespace base_interaction / namespace_93802ef5ac63ad7b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x20f
// Size: 0x4b
function function_6d55fddf9c7024e2(asmname, statename, params) {
    if (isdefined(self.var_a70672e669ca7f00)) {
        self forceteleport(self.origin, self.var_a70672e669ca7f00);
    }
    function_59308d53cabcdfdb(asmname, statename, params);
}

// Namespace base_interaction / namespace_93802ef5ac63ad7b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x262
// Size: 0x2f
function function_56c32e6f7b6ed8ed(asmname, statename, params) {
    self.var_a70672e669ca7f00 = undefined;
    cap_exit(asmname, statename, params);
}

