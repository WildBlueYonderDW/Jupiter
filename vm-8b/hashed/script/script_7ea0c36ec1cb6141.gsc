#using scripts\common\utility.gsc;
#using script_1531efc681baefe4;
#using scripts\code\character.gsc;

#namespace namespace_ef113d00ca43143;

// Namespace namespace_ef113d00ca43143 / namespace_189877b5455ab9e3
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xfa
// Size: 0xb4
function private autoexec init() {
    character = #"hash_2c44a42db6152bbf";
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
        level.var_44bf7e31237b3073[%"hash_1110922d8f7d440"] = &function_ecf17a96e49ab67;
        return;
    }
    level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
}

// Namespace namespace_ef113d00ca43143 / namespace_189877b5455ab9e3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b6
// Size: 0xc1
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "rebel";
    self.voice = #"alqatala";
    self.bhasthighholster = 1;
    self.animtree = "generic_human";
    self function_6b0082dec4510b24("body_iw9_aq_smg_1_white", namespace_9593598543f74b14::main());
    self attach("head_sp_opforce_al_qatala_smg", "", 1);
    self.headmodel = "head_sp_opforce_al_qatala_smg";
    self setclothtype(#"flowing");
    self function_8abe5a968cc3c220(#"milmedgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_ef113d00ca43143 / namespace_189877b5455ab9e3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27f
// Size: 0x2
function precache() {
    
}

// Namespace namespace_ef113d00ca43143 / namespace_189877b5455ab9e3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x289
// Size: 0x21
function precache_sp() {
    precache();
    scripts\code\character::precachemodelarray(namespace_9593598543f74b14::main());
    precachemodel("head_sp_opforce_al_qatala_smg");
}

// Namespace namespace_ef113d00ca43143 / namespace_189877b5455ab9e3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b2
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_ef113d00ca43143 / namespace_189877b5455ab9e3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2c3
// Size: 0x36
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_2e32adac6ca63178": 
        return namespace_9593598543f74b14::main();
    }
    assert(0, "<dev string:x1c>");
}

