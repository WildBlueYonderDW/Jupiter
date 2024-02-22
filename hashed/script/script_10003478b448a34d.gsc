// mwiii decomp prototype
#using scripts\common\utility.gsc;
#using script_36566104fe04fdf2;
#using scripts\code\character.gsc;
#using script_57df3f3bd6ff96c8;

#namespace namespace_e19385f186deb0cf;

// Namespace namespace_e19385f186deb0cf/namespace_46bf59f0bbdfa2af
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x127
// Size: 0xb4
function private autoexec init() {
    character = #"hash_6d586a70275c7d2b";
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
        level.var_44bf7e31237b3073[%"hash_5f211d02c6e1c31c"] = &function_ecf17a96e49ab67;
    } else {
        level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
    }
}

// Namespace namespace_e19385f186deb0cf/namespace_46bf59f0bbdfa2af
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e2
// Size: 0xb2
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_base";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_base";
    self function_6b0082dec4510b24("c_jup_zmb_zombie_base_male_suit_body_gz", namespace_c854b6c8276494ee::main());
    namespace_ac7e8770abb7eb1::attachhead("c_jup_zmb_zombie_base_male_suit_head_gz", namespace_5e22a4466ff83a4::main());
    self setclothtype(#"vestheavy");
    self function_8abe5a968cc3c220(#"none");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_16c36cf98afe63cd");
    }
}

// Namespace namespace_e19385f186deb0cf/namespace_46bf59f0bbdfa2af
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29b
// Size: 0x3
function precache() {
    
}

// Namespace namespace_e19385f186deb0cf/namespace_46bf59f0bbdfa2af
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a5
// Size: 0x24
function function_430419022a9c3ffe() {
    precache();
    namespace_ac7e8770abb7eb1::precachemodelarray(namespace_c854b6c8276494ee::main());
    namespace_ac7e8770abb7eb1::precachemodelarray(namespace_5e22a4466ff83a4::main());
}

// Namespace namespace_e19385f186deb0cf/namespace_46bf59f0bbdfa2af
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d0
// Size: 0xa
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_e19385f186deb0cf/namespace_46bf59f0bbdfa2af
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e1
// Size: 0x4a
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_ea014256a2b80b0a":
        return namespace_c854b6c8276494ee::main();
    case #"hash_36de5511bc1826d0":
        return namespace_5e22a4466ff83a4::main();
        break;
    }
    /#
        assert(0, "character_jup_zombie_base_male_suit_gz do not have any xmodelalias");
    #/
}

