#using scripts\common\utility.gsc;
#using script_1e319c7e86c1fd56;
#using scripts\code\character.gsc;
#using script_4afd40cb0a6a71ff;

#namespace namespace_1f60831f63fa2689;

// Namespace namespace_1f60831f63fa2689 / namespace_fcc7ca64792ac29
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x123
// Size: 0xb3
function private autoexec init() {
    character = #"hash_f89699d778b70e3d";
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
        level.var_44bf7e31237b3073[%"hash_72db04c57a3acfc6"] = &function_ecf17a96e49ab67;
        return;
    }
    level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
}

// Namespace namespace_1f60831f63fa2689 / namespace_fcc7ca64792ac29
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1de
// Size: 0xb1
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react";
    self.voice = #"hash_56d2a75e94b008ce";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self function_6b0082dec4510b24("bodies_civilian_uk_girl_surge_1", namespace_20d32edfec248f16::main());
    scripts\code\character::attachhead("heads_civilian_uk_girl_surge_1", namespace_6a3e7cfa2a0abae9::main());
    self setclothtype(#"nylon");
    self function_8abe5a968cc3c220(#"none");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_1f60831f63fa2689 / namespace_fcc7ca64792ac29
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x297
// Size: 0x2
function precache() {
    
}

// Namespace namespace_1f60831f63fa2689 / namespace_fcc7ca64792ac29
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a1
// Size: 0x23
function precache_sp() {
    precache();
    scripts\code\character::precachemodelarray(namespace_20d32edfec248f16::main());
    scripts\code\character::precachemodelarray(namespace_6a3e7cfa2a0abae9::main());
}

// Namespace namespace_1f60831f63fa2689 / namespace_fcc7ca64792ac29
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2cc
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_1f60831f63fa2689 / namespace_fcc7ca64792ac29
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2dd
// Size: 0x49
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_96fb56b0990b0efa":
        return namespace_20d32edfec248f16::main();
    case #"hash_bfb85bbaed0f89fd":
        return namespace_6a3e7cfa2a0abae9::main();
    }
    assert(0, "character_civilian_uk_girl_surge_1 do not have any xmodelalias");
}

