// mwiii decomp prototype
#using scripts\common\utility.gsc;
#using scripts\code\character.gsc;
#using script_43eaf0b84003c284;

#namespace namespace_6bd038740bb5f01d;

// Namespace namespace_6bd038740bb5f01d/namespace_e064dca95e16fbfd
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x131
// Size: 0xb4
function private autoexec init() {
    character = #"hash_6d3c818b5e5819d9";
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
        level.var_44bf7e31237b3073[%"hash_69cf7c1d293b390c"] = &function_ecf17a96e49ab67;
    } else {
        level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
    }
}

// Namespace namespace_6bd038740bb5f01d/namespace_e064dca95e16fbfd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ec
// Size: 0xac
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_base";
    self.voice = #"hash_97b066d92d35c738";
    self.bhasthighholster = 0;
    self.animtree = "zombie_base";
    self setmodel("c_jup_zmb_zombie_base_male_shredded_shirtless");
    namespace_ac7e8770abb7eb1::attachhead("c_jup_zmb_zombie_base_male_shredded_head", namespace_ee8c8728281d88ca::main());
    self setclothtype(#"hash_d0ef9b6cfe3097be");
    self function_8abe5a968cc3c220(#"none");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_16c36cf98afe63cd");
    }
}

// Namespace namespace_6bd038740bb5f01d/namespace_e064dca95e16fbfd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29f
// Size: 0x3
function precache() {
    
}

// Namespace namespace_6bd038740bb5f01d/namespace_e064dca95e16fbfd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a9
// Size: 0x22
function function_430419022a9c3ffe() {
    precache();
    precachemodel("c_jup_zmb_zombie_base_male_shredded_shirtless");
    namespace_ac7e8770abb7eb1::precachemodelarray(namespace_ee8c8728281d88ca::main());
}

// Namespace namespace_6bd038740bb5f01d/namespace_e064dca95e16fbfd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d2
// Size: 0xa
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_6bd038740bb5f01d/namespace_e064dca95e16fbfd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e3
// Size: 0x37
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_9f43f5c1b4c2c376":
        return namespace_ee8c8728281d88ca::main();
        break;
    }
    /#
        assert(0, "character_jup_zombie_base_male_shredded_shirtless do not have any xmodelalias");
    #/
}

