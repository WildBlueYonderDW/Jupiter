// mwiii decomp prototype
#using scripts\common\utility.gsc;
#using script_66bcac2848c103c4;
#using scripts\code\character.gsc;
#using script_4f680855dcefb1ae;

#namespace namespace_e1677df186ae38d1;

// Namespace namespace_e1677df186ae38d1/namespace_469351f0bbaf2ab1
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x127
// Size: 0xb4
function private autoexec init() {
    character = #"hash_6dbe727027b33df5";
    if (!isdefined(level.var_586887bc5dc30f34)) {
        level.var_586887bc5dc30f34 = [];
    }
    if (!isdefined(level.var_7d97144daa7995cd)) {
        level.var_7d97144daa7995cd = [];
    }
    if (!isdefined(level.var_44bf7e31237b3073)) {
        level.var_44bf7e31237b3073 = [];
    }
    level.var_586887bc5dc30f34[character] = &main;
    if (issp()) {
        level.var_7d97144daa7995cd[character] = &function_430419022a9c3ffe;
        level.var_44bf7e31237b3073[%"hash_5ed61d02c6a1d7a2"] = &function_ecf17a96e49ab67;
    } else {
        level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
    }
}

// Namespace namespace_e1677df186ae38d1/namespace_469351f0bbaf2ab1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e2
// Size: 0xb2
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_base";
    self.voice = #"hash_97b066d92d35c738";
    self.bhasthighholster = 0;
    self.animtree = "zombie_base";
    self function_6b0082dec4510b24("c_jup_zmb_zombie_base_male_suit_body_yz", namespace_c8d8b6c827f5c820::main());
    namespace_ac7e8770abb7eb1::attachhead("c_jup_zmb_zombie_base_male_suit_head_yz", namespace_5c82a4466e35a9a::main());
    self setclothtype(#"hash_d0ef9b6cfe3097be");
    self function_8abe5a968cc3c220(#"none");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_16c36cf98afe63cd");
    }
}

// Namespace namespace_e1677df186ae38d1/namespace_469351f0bbaf2ab1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29b
// Size: 0x3
function precache() {
    
}

// Namespace namespace_e1677df186ae38d1/namespace_469351f0bbaf2ab1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a5
// Size: 0x24
function function_430419022a9c3ffe() {
    precache();
    namespace_ac7e8770abb7eb1::precachemodelarray(namespace_c8d8b6c827f5c820::main());
    namespace_ac7e8770abb7eb1::precachemodelarray(namespace_5c82a4466e35a9a::main());
}

// Namespace namespace_e1677df186ae38d1/namespace_469351f0bbaf2ab1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d0
// Size: 0xa
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_e1677df186ae38d1/namespace_469351f0bbaf2ab1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e1
// Size: 0x4a
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_e9b04256a278f6b4":
        return namespace_c8d8b6c827f5c820::main();
    case #"hash_36e45511bc1ca3fe":
        return namespace_5c82a4466e35a9a::main();
        break;
    }
    /#
        assert(0, "character_jup_zombie_base_male_suit_yz do not have any xmodelalias");
    #/
}

