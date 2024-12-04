#using script_58b513fb7eeb394d;
#using scripts\code\character;
#using scripts\common\utility;
#using xmodelalias\civilian_london_female_heads_skintone_light;

#namespace namespace_e251cd20ffed6cd;

// Namespace namespace_e251cd20ffed6cd / namespace_762ff6fc3a5bdeed
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x152
// Size: 0xb3
function private autoexec init() {
    character = #"hash_b7955770979e0a99";
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
        level.var_44bf7e31237b3073[%"hash_66eb35d113c9aa68"] = &function_ecf17a96e49ab67;
        return;
    }
    level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
}

// Namespace namespace_e251cd20ffed6cd / namespace_762ff6fc3a5bdeed
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20d
// Size: 0xb1
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react_female";
    self.voice = #"unitednationsfemale";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self function_6b0082dec4510b24("c_jup_civilian_london_female_body_02_skintone_light", namespace_ab4bb67645f2fcd::main());
    scripts\code\character::attachhead("civilian_london_female_heads_skintone_light", xmodelalias\civilian_london_female_heads_skintone_light::main());
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_e251cd20ffed6cd / namespace_762ff6fc3a5bdeed
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c6
// Size: 0x2
function precache() {
    
}

// Namespace namespace_e251cd20ffed6cd / namespace_762ff6fc3a5bdeed
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d0
// Size: 0x23
function precache_sp() {
    precache();
    scripts\code\character::precachemodelarray(namespace_ab4bb67645f2fcd::main());
    scripts\code\character::precachemodelarray(xmodelalias\civilian_london_female_heads_skintone_light::main());
}

// Namespace namespace_e251cd20ffed6cd / namespace_762ff6fc3a5bdeed
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2fb
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_e251cd20ffed6cd / namespace_762ff6fc3a5bdeed
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x30c
// Size: 0x49
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_288e37b74a6cd951":
        return namespace_ab4bb67645f2fcd::main();
    case #"hash_9baed28ada0ada1f":
        return xmodelalias\civilian_london_female_heads_skintone_light::main();
    }
    assert(0, "c_jup_civ_london_female_02_skintone_light do not have any xmodelalias");
}

