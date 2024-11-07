#using scripts\common\utility.gsc;
#using script_5e688a6f29dbb37d;
#using scripts\code\character.gsc;
#using xmodelalias\civilian_london_female_heads_skintone_dark.gsc;

#namespace namespace_647d7c4d4d8be603;

// Namespace namespace_647d7c4d4d8be603 / namespace_4d12fac695bdda3
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x14f
// Size: 0xb3
function private autoexec init() {
    character = #"hash_763689b539762467";
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
        level.var_44bf7e31237b3073[%"hash_b67875530cfda28"] = &function_ecf17a96e49ab67;
        return;
    }
    level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
}

// Namespace namespace_647d7c4d4d8be603 / namespace_4d12fac695bdda3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20a
// Size: 0xb1
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react_female";
    self.voice = #"unitednationsfemale";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self function_6b0082dec4510b24("c_jup_civilian_london_female_body_02_skintone_dark", namespace_c0560fe89f8b2903::main());
    scripts\code\character::attachhead("civilian_london_female_heads_skintone_dark", xmodelalias\civilian_london_female_heads_skintone_dark::main());
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_647d7c4d4d8be603 / namespace_4d12fac695bdda3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c3
// Size: 0x2
function precache() {
    
}

// Namespace namespace_647d7c4d4d8be603 / namespace_4d12fac695bdda3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2cd
// Size: 0x23
function precache_sp() {
    precache();
    scripts\code\character::precachemodelarray(namespace_c0560fe89f8b2903::main());
    scripts\code\character::precachemodelarray(xmodelalias\civilian_london_female_heads_skintone_dark::main());
}

// Namespace namespace_647d7c4d4d8be603 / namespace_4d12fac695bdda3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f8
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_647d7c4d4d8be603 / namespace_4d12fac695bdda3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x309
// Size: 0x49
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_32ab50c4a7c8d1ef":
        return namespace_c0560fe89f8b2903::main();
    case #"hash_ce6562a382078a15":
        return xmodelalias\civilian_london_female_heads_skintone_dark::main();
    }
    assert(0, "c_jup_civ_london_female_02_skintone_dark do not have any xmodelalias");
}

