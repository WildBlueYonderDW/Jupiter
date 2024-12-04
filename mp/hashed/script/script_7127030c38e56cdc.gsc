#using script_540595f3ed924f79;
#using scripts\code\character;
#using scripts\common\utility;

#namespace namespace_4f18e0c3d2fa5712;

// Namespace namespace_4f18e0c3d2fa5712 / namespace_985945ae1c6758b2
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xfa
// Size: 0xb4
function private autoexec init() {
    character = #"hash_c3ca1f45e0c26b86";
    if (!isdefined(level.fncharacter)) {
        level.fncharacter = [];
    }
    if (!isdefined(level.var_7d97144daa7995cd)) {
        level.var_7d97144daa7995cd = [];
    }
    if (!isdefined(level.var_44bf7e31237b3073)) {
        level.var_44bf7e31237b3073 = [];
    }
    level.fncharacter[character] = &main;
    if (issp()) {
        level.var_7d97144daa7995cd[character] = &precache_sp;
        level.var_44bf7e31237b3073[%"hash_7add25331e17a845"] = &function_ecf17a96e49ab67;
        return;
    }
    level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
}

// Namespace namespace_4f18e0c3d2fa5712 / namespace_985945ae1c6758b2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b6
// Size: 0xc1
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "rebel";
    self.voice = #"alqatala";
    self.bhasthighholster = 1;
    self.animtree = "generic_human";
    self function_6b0082dec4510b24("body_iw9_aq_lmg_1_white", namespace_762605a89385a701::main());
    self attach("head_sp_opforce_al_qatala_lmg", "", 1);
    self.headmodel = "head_sp_opforce_al_qatala_lmg";
    self setclothtype(#"flowing");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_4f18e0c3d2fa5712 / namespace_985945ae1c6758b2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27f
// Size: 0x2
function precache() {
    
}

// Namespace namespace_4f18e0c3d2fa5712 / namespace_985945ae1c6758b2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x289
// Size: 0x21
function precache_sp() {
    precache();
    scripts\code\character::precachemodelarray(namespace_762605a89385a701::main());
    precachemodel("head_sp_opforce_al_qatala_lmg");
}

// Namespace namespace_4f18e0c3d2fa5712 / namespace_985945ae1c6758b2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b2
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_4f18e0c3d2fa5712 / namespace_985945ae1c6758b2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2c3
// Size: 0x36
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_463df8106281068d":
        return namespace_762605a89385a701::main();
    }
    assert(0, "<dev string:x1c>");
}

