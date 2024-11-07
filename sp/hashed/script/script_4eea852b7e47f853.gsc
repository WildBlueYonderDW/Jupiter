#using scripts\common\utility.gsc;
#using script_3f61d095f24df4d7;
#using scripts\code\character.gsc;
#using xmodelalias\civilian_london_female_heads_skintone_med.gsc;

#namespace namespace_6b9ab5ef278a209b;

// Namespace namespace_6b9ab5ef278a209b / namespace_29ad99355926eabb
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x14c
// Size: 0xb3
function private autoexec init() {
    character = #"hash_1ad2c0ee96074077";
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
        level.var_44bf7e31237b3073[%"hash_62abb1cc95e5474a"] = &function_ecf17a96e49ab67;
        return;
    }
    level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
}

// Namespace namespace_6b9ab5ef278a209b / namespace_29ad99355926eabb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x207
// Size: 0xb1
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react_female";
    self.voice = #"unitednationsfemale";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self function_6b0082dec4510b24("c_jup_civilian_london_female_body_02_skintone_med", namespace_a53bbf4a5f28d19b::main());
    scripts\code\character::attachhead("civilian_london_female_heads_skintone_med", xmodelalias\civilian_london_female_heads_skintone_med::main());
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_6b9ab5ef278a209b / namespace_29ad99355926eabb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c0
// Size: 0x2
function precache() {
    
}

// Namespace namespace_6b9ab5ef278a209b / namespace_29ad99355926eabb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ca
// Size: 0x23
function precache_sp() {
    precache();
    scripts\code\character::precachemodelarray(namespace_a53bbf4a5f28d19b::main());
    scripts\code\character::precachemodelarray(xmodelalias\civilian_london_female_heads_skintone_med::main());
}

// Namespace namespace_6b9ab5ef278a209b / namespace_29ad99355926eabb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f5
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_6b9ab5ef278a209b / namespace_29ad99355926eabb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x306
// Size: 0x49
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_3c67083b0947dcef":
        return namespace_a53bbf4a5f28d19b::main();
    case #"hash_84a4bd3e2168a189":
        return xmodelalias\civilian_london_female_heads_skintone_med::main();
    }
    assert(0, "c_jup_civ_london_female_02_skintone_med do not have any xmodelalias");
}

