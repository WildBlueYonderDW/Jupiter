#using scripts\common\utility.gsc;
#using script_165108fac4cd107e;
#using scripts\code\character.gsc;
#using script_6c2442dc9480c615;

#namespace namespace_101e56c5efacb7f;

// Namespace namespace_101e56c5efacb7f / namespace_fcec5c8f971576df
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x104
// Size: 0xb3
function private autoexec init() {
    character = #"hash_ea6afb9310f07e4b";
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
        level.var_44bf7e31237b3073[%"hash_51b9f6fa4245b552"] = &function_ecf17a96e49ab67;
        return;
    }
    level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
}

// Namespace namespace_101e56c5efacb7f / namespace_fcec5c8f971576df
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bf
// Size: 0xb1
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react";
    self.voice = #"fsa";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self function_6b0082dec4510b24("bodies_civ_western_boy", namespace_688807fc9b63575c::main());
    scripts\code\character::attachhead("heads_civ_western_boy", namespace_8fae12e9f54108a9::main());
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_101e56c5efacb7f / namespace_fcec5c8f971576df
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x278
// Size: 0x2
function precache() {
    
}

// Namespace namespace_101e56c5efacb7f / namespace_fcec5c8f971576df
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x282
// Size: 0x23
function precache_sp() {
    precache();
    scripts\code\character::precachemodelarray(namespace_688807fc9b63575c::main());
    scripts\code\character::precachemodelarray(namespace_8fae12e9f54108a9::main());
}

// Namespace namespace_101e56c5efacb7f / namespace_fcec5c8f971576df
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ad
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_101e56c5efacb7f / namespace_fcec5c8f971576df
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2be
// Size: 0x49
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_f3b4e6d18ab745b8": 
        return namespace_688807fc9b63575c::main();
    case #"hash_6b40d71d2f95d25": 
        return namespace_8fae12e9f54108a9::main();
    }
    assert(0, "c_jup_civ_western_boy do not have any xmodelalias");
}

