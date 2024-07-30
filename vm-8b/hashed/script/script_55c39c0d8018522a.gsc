#using scripts\common\utility.gsc;
#using script_179b71a4fb0ad5c5;
#using scripts\code\character.gsc;
#using script_3077af469066d482;

#namespace namespace_c6c98b92b6d5b67e;

// Namespace namespace_c6c98b92b6d5b67e / namespace_fddc8068d2378c9e
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xf8
// Size: 0xb4
function private autoexec init() {
    character = #"hash_b5b2f83a7756137a";
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
        level.var_44bf7e31237b3073[%"hash_23cfc2481045369b"] = &function_ecf17a96e49ab67;
        return;
    }
    level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
}

// Namespace namespace_c6c98b92b6d5b67e / namespace_fddc8068d2378c9e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b4
// Size: 0xb2
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "rebel";
    self.voice = #"alqatala";
    self.bhasthighholster = 1;
    self.animtree = "generic_human";
    self function_6b0082dec4510b24("bodies_iw9_enemy_aq_ar_3", namespace_2f49ab67cb242aeb::main());
    scripts\code\character::attachhead("heads_iw9_enemy_aq_ar_3", namespace_4b5734a0100609de::main());
    self setclothtype(#"flowing");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_c6c98b92b6d5b67e / namespace_fddc8068d2378c9e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x26e
// Size: 0x2
function precache() {
    
}

// Namespace namespace_c6c98b92b6d5b67e / namespace_fddc8068d2378c9e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x278
// Size: 0x23
function precache_sp() {
    precache();
    scripts\code\character::precachemodelarray(namespace_2f49ab67cb242aeb::main());
    scripts\code\character::precachemodelarray(namespace_4b5734a0100609de::main());
}

// Namespace namespace_c6c98b92b6d5b67e / namespace_fddc8068d2378c9e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a3
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_c6c98b92b6d5b67e / namespace_fddc8068d2378c9e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b4
// Size: 0x49
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_ad9bb4d039cebb57": 
        return namespace_2f49ab67cb242aeb::main();
    case #"hash_1fa3687a475cb7ba": 
        return namespace_4b5734a0100609de::main();
    }
    assert(0, "<dev string:x1c>");
}

