// mwiii decomp prototype
#using scripts\common\utility.gsc;
#using scripts\code\character.gsc;
#using script_41ecad2e89345fd0;

#namespace namespace_81974ce03c6a7e27;

// Namespace namespace_81974ce03c6a7e27/namespace_6d6ba3b89ccba887
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x12e
// Size: 0xb4
function private autoexec init() {
    character = #"hash_fdb0fa89b088037b";
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
        level.var_44bf7e31237b3073[%"hash_3c7ada73586c4c46"] = &function_ecf17a96e49ab67;
    } else {
        level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
    }
}

// Namespace namespace_81974ce03c6a7e27/namespace_6d6ba3b89ccba887
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e9
// Size: 0xac
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_base";
    self.voice = #"hash_97b066d92d35c738";
    self.bhasthighholster = 0;
    self.animtree = "zombie_base";
    self setmodel("c_jup_zmb_zombie_base_male_merc_sleeves_body");
    namespace_ac7e8770abb7eb1::attachhead("c_jup_zmb_zombie_base_male_merc_sleeves_head", namespace_6c3d22bd8f7f62e6::main());
    self setclothtype(#"vestheavy");
    self function_8abe5a968cc3c220(#"none");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_16c36cf98afe63cd");
    }
}

// Namespace namespace_81974ce03c6a7e27/namespace_6d6ba3b89ccba887
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29c
// Size: 0x3
function precache() {
    
}

// Namespace namespace_81974ce03c6a7e27/namespace_6d6ba3b89ccba887
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a6
// Size: 0x22
function function_430419022a9c3ffe() {
    precache();
    precachemodel("c_jup_zmb_zombie_base_male_merc_sleeves_body");
    namespace_ac7e8770abb7eb1::precachemodelarray(namespace_6c3d22bd8f7f62e6::main());
}

// Namespace namespace_81974ce03c6a7e27/namespace_6d6ba3b89ccba887
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cf
// Size: 0xa
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_81974ce03c6a7e27/namespace_6d6ba3b89ccba887
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e0
// Size: 0x37
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_ebcab91fa100cdca":
        return namespace_6c3d22bd8f7f62e6::main();
        break;
    }
    /#
        assert(0, "character_jup_zombie_base_male_merc_sleeves do not have any xmodelalias");
    #/
}

