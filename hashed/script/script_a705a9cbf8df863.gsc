#using scripts\common\utility.gsc;
#using script_14728ae601229cca;
#using scripts\code\character.gsc;
#using script_35e4b06c34445ee2;

#namespace namespace_74b6bfc08ba62475;

// Namespace namespace_74b6bfc08ba62475 / namespace_c28203d419e5a515
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x12a
// Size: 0xb3
function private autoexec init() {
    character = #"hash_e9eb513342c81e19";
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
        level.var_44bf7e31237b3073[%"hash_18084e3166da9722"] = &function_ecf17a96e49ab67;
        return;
    }
    level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
}

// Namespace namespace_74b6bfc08ba62475 / namespace_c28203d419e5a515
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e5
// Size: 0xb1
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react";
    self.voice = #"unitednations";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self function_6b0082dec4510b24("c_jup_civ_russian_male_body_flashback", namespace_962763c5dc935ede::main());
    scripts\code\character::attachhead("civ_russian_male_head_1_flashback", namespace_57dcde873ef717e::main());
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_74b6bfc08ba62475 / namespace_c28203d419e5a515
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29e
// Size: 0x2
function precache() {
    
}

// Namespace namespace_74b6bfc08ba62475 / namespace_c28203d419e5a515
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a8
// Size: 0x23
function precache_sp() {
    precache();
    scripts\code\character::precachemodelarray(namespace_962763c5dc935ede::main());
    scripts\code\character::precachemodelarray(namespace_57dcde873ef717e::main());
}

// Namespace namespace_74b6bfc08ba62475 / namespace_c28203d419e5a515
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d3
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_74b6bfc08ba62475 / namespace_c28203d419e5a515
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e4
// Size: 0x49
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_1f0e8fb5797c9af2": 
        return namespace_962763c5dc935ede::main();
    case #"hash_d1d30bfb5ae024f2": 
        return namespace_57dcde873ef717e::main();
    }
    assert(0, "c_jup_civ_russian_male_flashback do not have any xmodelalias");
}

