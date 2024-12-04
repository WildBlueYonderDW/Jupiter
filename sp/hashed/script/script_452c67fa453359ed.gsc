#using script_29f276d9f19ba920;
#using scripts\code\character;
#using scripts\common\utility;
#using xmodelalias\civ_russian_male_head_1;

#namespace namespace_3ba2bf2d1d1da9c3;

// Namespace namespace_3ba2bf2d1d1da9c3 / namespace_30f412333bb69ba3
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x10e
// Size: 0xb3
function private autoexec init() {
    character = #"hash_a9fa642741d14f8f";
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
        level.var_44bf7e31237b3073[%"hash_291671ee263a588c"] = &function_ecf17a96e49ab67;
        return;
    }
    level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
}

// Namespace namespace_3ba2bf2d1d1da9c3 / namespace_30f412333bb69ba3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c9
// Size: 0xb1
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react";
    self.voice = #"unitednations";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self function_6b0082dec4510b24("c_jup_civ_russian_male_body_1", namespace_35df1334ed4356a4::main());
    scripts\code\character::attachhead("civ_russian_male_head_1", xmodelalias\civ_russian_male_head_1::main());
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_3ba2bf2d1d1da9c3 / namespace_30f412333bb69ba3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x282
// Size: 0x2
function precache() {
    
}

// Namespace namespace_3ba2bf2d1d1da9c3 / namespace_30f412333bb69ba3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28c
// Size: 0x23
function precache_sp() {
    precache();
    scripts\code\character::precachemodelarray(namespace_35df1334ed4356a4::main());
    scripts\code\character::precachemodelarray(xmodelalias\civ_russian_male_head_1::main());
}

// Namespace namespace_3ba2bf2d1d1da9c3 / namespace_30f412333bb69ba3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b7
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_3ba2bf2d1d1da9c3 / namespace_30f412333bb69ba3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2c8
// Size: 0x49
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_8b901f50274024b8":
        return namespace_35df1334ed4356a4::main();
    case #"hash_9741638f65b1ecbc":
        return xmodelalias\civ_russian_male_head_1::main();
    }
    assert(0, "c_jup_civ_russian_male do not have any xmodelalias");
}

