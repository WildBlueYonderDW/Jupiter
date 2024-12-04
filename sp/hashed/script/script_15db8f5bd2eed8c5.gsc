#using script_27fa17d9f6484350;
#using script_45881687f50d52dd;
#using scripts\code\character;
#using scripts\common\utility;

#namespace namespace_574171b2c70bb24f;

// Namespace namespace_574171b2c70bb24f / namespace_3f4f5a0442e099ef
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x123
// Size: 0xb3
function private autoexec init() {
    character = #"hash_57ec0f28209c1dab";
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
        level.var_44bf7e31237b3073[%"hash_7a550ef06988e054"] = &function_ecf17a96e49ab67;
        return;
    }
    level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
}

// Namespace namespace_574171b2c70bb24f / namespace_3f4f5a0442e099ef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1de
// Size: 0xb1
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react";
    self.voice = #"unitednations";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self function_6b0082dec4510b24("bodies_civilian_uk_male_surge_2", namespace_e3079507f9898904::main());
    scripts\code\character::attachhead("heads_civilian_uk_male_surge_2", namespace_496c207c93e996af::main());
    self setclothtype(#"nylon");
    self function_8abe5a968cc3c220(#"none");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_574171b2c70bb24f / namespace_3f4f5a0442e099ef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x297
// Size: 0x2
function precache() {
    
}

// Namespace namespace_574171b2c70bb24f / namespace_3f4f5a0442e099ef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a1
// Size: 0x23
function precache_sp() {
    precache();
    scripts\code\character::precachemodelarray(namespace_e3079507f9898904::main());
    scripts\code\character::precachemodelarray(namespace_496c207c93e996af::main());
}

// Namespace namespace_574171b2c70bb24f / namespace_3f4f5a0442e099ef
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2cc
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_574171b2c70bb24f / namespace_3f4f5a0442e099ef
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2dd
// Size: 0x49
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_b6b9e54d2702eb70":
        return namespace_e3079507f9898904::main();
    case #"hash_c629b5522a0f642b":
        return namespace_496c207c93e996af::main();
    }
    assert(0, "character_civilian_uk_male_surge_2 do not have any xmodelalias");
}

