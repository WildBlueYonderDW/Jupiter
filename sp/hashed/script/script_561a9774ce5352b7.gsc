#using script_239ed35de5054172;
#using script_6ced1d7c418e7c80;
#using scripts\code\character;
#using scripts\common\utility;

#namespace namespace_31e32219b3fc443b;

// Namespace namespace_31e32219b3fc443b / namespace_45dfc957a7965bdb
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x125
// Size: 0xb3
function private autoexec init() {
    character = #"hash_ad57875da8d4209f";
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
        level.var_44bf7e31237b3073[%"hash_14f00cda41a0df6"] = &function_ecf17a96e49ab67;
        return;
    }
    level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
}

// Namespace namespace_31e32219b3fc443b / namespace_45dfc957a7965bdb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e0
// Size: 0xb1
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react";
    self.voice = #"russian";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self function_6b0082dec4510b24("bodies_c_jup_sp_enemy_rusdelegate", namespace_ccfca4f1467f1b02::main());
    scripts\code\character::attachhead("heads_jup_sp_enemy_kastovsoldier_01", namespace_20c1df75ba8fd17c::main());
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_31e32219b3fc443b / namespace_45dfc957a7965bdb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x299
// Size: 0x2
function precache() {
    
}

// Namespace namespace_31e32219b3fc443b / namespace_45dfc957a7965bdb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a3
// Size: 0x23
function precache_sp() {
    precache();
    scripts\code\character::precachemodelarray(namespace_ccfca4f1467f1b02::main());
    scripts\code\character::precachemodelarray(namespace_20c1df75ba8fd17c::main());
}

// Namespace namespace_31e32219b3fc443b / namespace_45dfc957a7965bdb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ce
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_31e32219b3fc443b / namespace_45dfc957a7965bdb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2df
// Size: 0x49
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_e337c9cf32f37b46":
        return namespace_ccfca4f1467f1b02::main();
    case #"hash_de3b73cd07d55560":
        return namespace_20c1df75ba8fd17c::main();
    }
    assert(0, "character_jup_civ_rusdelegate do not have any xmodelalias");
}

