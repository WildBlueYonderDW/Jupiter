#using scripts\common\utility.gsc;
#using script_3d398e26f3b44ce4;
#using scripts\code\character.gsc;
#using xmodelalias\civilian_russian_female_head.gsc;

#namespace namespace_2c6d50e4a84f541a;

// Namespace namespace_2c6d50e4a84f541a / namespace_728534d72cdd0bfa
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x121
// Size: 0xb3
function private autoexec init() {
    character = #"hash_a54031b0dffd8686";
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
        level.var_44bf7e31237b3073[%"hash_52ccdeecdc01ba85"] = &function_ecf17a96e49ab67;
        return;
    }
    level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
}

// Namespace namespace_2c6d50e4a84f541a / namespace_728534d72cdd0bfa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1dc
// Size: 0xb1
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react_female";
    self.voice = #"hash_56e75d50b07f42a2";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self function_6b0082dec4510b24("c_jup_civilian_russian_female_body", namespace_8051767958a0abf2::main());
    scripts\code\character::attachhead("civilian_russian_female_head", xmodelalias\civilian_russian_female_head::main());
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_2c6d50e4a84f541a / namespace_728534d72cdd0bfa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x295
// Size: 0x2
function precache() {
    
}

// Namespace namespace_2c6d50e4a84f541a / namespace_728534d72cdd0bfa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29f
// Size: 0x23
function precache_sp() {
    precache();
    scripts\code\character::precachemodelarray(namespace_8051767958a0abf2::main());
    scripts\code\character::precachemodelarray(xmodelalias\civilian_russian_female_head::main());
}

// Namespace namespace_2c6d50e4a84f541a / namespace_728534d72cdd0bfa
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ca
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_2c6d50e4a84f541a / namespace_728534d72cdd0bfa
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2db
// Size: 0x49
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_2efc6259ad8b666": 
        return namespace_8051767958a0abf2::main();
    case #"hash_8d954660328473f6": 
        return xmodelalias\civilian_russian_female_head::main();
    }
    assert(0, "c_jup_civ_russian_female do not have any xmodelalias");
}

