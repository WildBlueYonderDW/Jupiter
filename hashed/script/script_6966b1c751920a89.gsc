// mwiii decomp prototype
#using scripts\common\utility.gsc;
#using scripts\code\character.gsc;
#using script_6930322303731b24;

#namespace namespace_67a58aa194b651a3;

// Namespace namespace_67a58aa194b651a3/namespace_2f508fc93a5963c3
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x12c
// Size: 0xb4
function private autoexec init() {
    character = #"hash_ac1e0c663416913f";
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
        level.var_44bf7e31237b3073[%"hash_5a88c58ea1656e18"] = &function_ecf17a96e49ab67;
    } else {
        level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
    }
}

// Namespace namespace_67a58aa194b651a3/namespace_2f508fc93a5963c3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e7
// Size: 0xac
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_base";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_base";
    self setmodel("c_jup_zmb_zombie_base_male_long_shirt_body_gz");
    namespace_ac7e8770abb7eb1::attachhead("c_jup_zmb_zombie_base_long_shirt_head_gz", namespace_780fcd7346ff800a::main());
    self setclothtype(#"vestheavy");
    self function_8abe5a968cc3c220(#"none");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_16c36cf98afe63cd");
    }
}

// Namespace namespace_67a58aa194b651a3/namespace_2f508fc93a5963c3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29a
// Size: 0x3
function precache() {
    
}

// Namespace namespace_67a58aa194b651a3/namespace_2f508fc93a5963c3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a4
// Size: 0x22
function function_430419022a9c3ffe() {
    precache();
    precachemodel("c_jup_zmb_zombie_base_male_long_shirt_body_gz");
    namespace_ac7e8770abb7eb1::precachemodelarray(namespace_780fcd7346ff800a::main());
}

// Namespace namespace_67a58aa194b651a3/namespace_2f508fc93a5963c3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cd
// Size: 0xa
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_67a58aa194b651a3/namespace_2f508fc93a5963c3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2de
// Size: 0x37
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_b9e0372d177bcabe":
        return namespace_780fcd7346ff800a::main();
        break;
    }
    /#
        assert(0, "character_jup_zombie_base_male_long_shirt_gz do not have any xmodelalias");
    #/
}

