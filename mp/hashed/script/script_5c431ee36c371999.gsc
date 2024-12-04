#using script_3cd5f0cc095a848a;
#using scripts\code\character;
#using scripts\common\utility;

#namespace namespace_8ca4bdf1e36cee69;

// Namespace namespace_8ca4bdf1e36cee69 / namespace_7c8a840fec83f89
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x100
// Size: 0xb4
function private autoexec init() {
    character = #"hash_3a00d0fa7b411bdd";
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
        level.var_44bf7e31237b3073[%"hash_fb6d6a6b5474280"] = &function_ecf17a96e49ab67;
        return;
    }
    level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
}

// Namespace namespace_8ca4bdf1e36cee69 / namespace_7c8a840fec83f89
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bc
// Size: 0xc1
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "rebel";
    self.voice = #"alqatala";
    self.bhasthighholster = 1;
    self.animtree = "generic_human";
    self function_6b0082dec4510b24("body_iw9_aq_sniper_1_white", namespace_cf878c66a070885c::main());
    self attach("head_sp_opforce_al_qatala_sniper", "", 1);
    self.headmodel = "head_sp_opforce_al_qatala_sniper";
    self setclothtype(#"flowing");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_8ca4bdf1e36cee69 / namespace_7c8a840fec83f89
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x285
// Size: 0x2
function precache() {
    
}

// Namespace namespace_8ca4bdf1e36cee69 / namespace_7c8a840fec83f89
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28f
// Size: 0x21
function precache_sp() {
    precache();
    scripts\code\character::precachemodelarray(namespace_cf878c66a070885c::main());
    precachemodel("head_sp_opforce_al_qatala_sniper");
}

// Namespace namespace_8ca4bdf1e36cee69 / namespace_7c8a840fec83f89
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b8
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_8ca4bdf1e36cee69 / namespace_7c8a840fec83f89
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2c9
// Size: 0x36
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_ae367a79f2961b18":
        return namespace_cf878c66a070885c::main();
    }
    assert(0, "<dev string:x1c>");
}

