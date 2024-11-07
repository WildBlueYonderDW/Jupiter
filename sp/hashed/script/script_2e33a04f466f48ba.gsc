#using scripts\common\utility.gsc;
#using script_50a3d8d9de5c70f4;
#using scripts\code\character.gsc;
#using script_74963365fddd45e2;

#namespace namespace_52db1799df323fa4;

// Namespace namespace_52db1799df323fa4 / namespace_8a4733b130325a84
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x12c
// Size: 0xb3
function private autoexec init() {
    character = #"hash_d9faffaa0ca9fc98";
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
        level.var_44bf7e31237b3073[%"hash_7287acfc2d3d04b3"] = &function_ecf17a96e49ab67;
        return;
    }
    level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
}

// Namespace namespace_52db1799df323fa4 / namespace_8a4733b130325a84
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e7
// Size: 0xb1
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react";
    self.voice = #"unitednations";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self function_6b0082dec4510b24("test_alias_civilian_male_surge_body", namespace_9d99600a4a445568::main());
    scripts\code\character::attachhead("test_alias_civilian_male_surge_head", namespace_3ff774206f90962e::main());
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_52db1799df323fa4 / namespace_8a4733b130325a84
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a0
// Size: 0x2
function precache() {
    
}

// Namespace namespace_52db1799df323fa4 / namespace_8a4733b130325a84
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2aa
// Size: 0x23
function precache_sp() {
    precache();
    scripts\code\character::precachemodelarray(namespace_9d99600a4a445568::main());
    scripts\code\character::precachemodelarray(namespace_3ff774206f90962e::main());
}

// Namespace namespace_52db1799df323fa4 / namespace_8a4733b130325a84
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d5
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_52db1799df323fa4 / namespace_8a4733b130325a84
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e6
// Size: 0x49
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_ee701c7f31892b34":
        return namespace_9d99600a4a445568::main();
    case #"hash_d58bf93f2192efda":
        return namespace_3ff774206f90962e::main();
    }
    assert(0, "test_character_civilian_male_surge do not have any xmodelalias");
}

