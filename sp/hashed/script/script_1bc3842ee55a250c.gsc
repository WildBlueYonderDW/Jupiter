#using scripts\common\utility.gsc;
#using script_2529272e55f71840;
#using scripts\code\character.gsc;
#using script_208c61cf0fe59153;

#namespace namespace_b69519c261f5d840;

// Namespace namespace_b69519c261f5d840 / namespace_5eec4c565ce55be0
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x127
// Size: 0xb3
function private autoexec init() {
    character = #"hash_e0f3f1c9975bdd1c";
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
        level.var_44bf7e31237b3073[%"hash_6d94b79c69bcfa3d"] = &function_ecf17a96e49ab67;
        return;
    }
    level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
}

// Namespace namespace_b69519c261f5d840 / namespace_5eec4c565ce55be0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e2
// Size: 0xb1
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react_loco";
    self.voice = #"hash_56d2a75e94b008ce";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self function_6b0082dec4510b24("bodies_civilian_asm_female_3", namespace_d8530bd988e50bca::main());
    scripts\code\character::attachhead("heads_civilian_asm_female_3", namespace_2ac3435e0b818d2f::main());
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_b69519c261f5d840 / namespace_5eec4c565ce55be0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29b
// Size: 0x2
function precache() {
    
}

// Namespace namespace_b69519c261f5d840 / namespace_5eec4c565ce55be0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a5
// Size: 0x23
function precache_sp() {
    precache();
    scripts\code\character::precachemodelarray(namespace_d8530bd988e50bca::main());
    scripts\code\character::precachemodelarray(namespace_2ac3435e0b818d2f::main());
}

// Namespace namespace_b69519c261f5d840 / namespace_5eec4c565ce55be0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d0
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_b69519c261f5d840 / namespace_5eec4c565ce55be0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e1
// Size: 0x49
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_331b1f4a38c31bde":
        return namespace_d8530bd988e50bca::main();
    case #"hash_c28e07e15f6e5f3":
        return namespace_2ac3435e0b818d2f::main();
    }
    assert(0, "character_civilian_ams_female_3_sitting do not have any xmodelalias");
}

