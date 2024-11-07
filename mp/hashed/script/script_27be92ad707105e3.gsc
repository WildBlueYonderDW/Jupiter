#using scripts\common\utility.gsc;
#using script_66bcac2848c103c4;
#using scripts\code\character.gsc;
#using script_4f680855dcefb1ae;

#namespace namespace_e1677df186ae38d1;

// Namespace namespace_e1677df186ae38d1 / namespace_469351f0bbaf2ab1
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x10c
// Size: 0xb4
function private autoexec init() {
    character = #"hash_6dbe727027b33df5";
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
        level.var_44bf7e31237b3073[%"hash_5ed61d02c6a1d7a2"] = &function_ecf17a96e49ab67;
        return;
    }
    level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
}

// Namespace namespace_e1677df186ae38d1 / namespace_469351f0bbaf2ab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c8
// Size: 0xb1
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_base";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_base";
    self function_6b0082dec4510b24("c_jup_zmb_zombie_base_male_suit_body_yz", namespace_c8d8b6c827f5c820::main());
    scripts\code\character::attachhead("c_jup_zmb_zombie_base_male_suit_head_yz", namespace_5c82a4466e35a9a::main());
    self setclothtype(#"vestheavy");
    self function_8abe5a968cc3c220(#"none");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_16c36cf98afe63cd");
    }
}

// Namespace namespace_e1677df186ae38d1 / namespace_469351f0bbaf2ab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x281
// Size: 0x2
function precache() {
    
}

// Namespace namespace_e1677df186ae38d1 / namespace_469351f0bbaf2ab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28b
// Size: 0x23
function precache_sp() {
    precache();
    scripts\code\character::precachemodelarray(namespace_c8d8b6c827f5c820::main());
    scripts\code\character::precachemodelarray(namespace_5c82a4466e35a9a::main());
}

// Namespace namespace_e1677df186ae38d1 / namespace_469351f0bbaf2ab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b6
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_e1677df186ae38d1 / namespace_469351f0bbaf2ab1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2c7
// Size: 0x49
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_e9b04256a278f6b4":
        return namespace_c8d8b6c827f5c820::main();
    case #"hash_36e45511bc1ca3fe":
        return namespace_5c82a4466e35a9a::main();
    }
    assert(0, "<dev string:x1c>");
}

