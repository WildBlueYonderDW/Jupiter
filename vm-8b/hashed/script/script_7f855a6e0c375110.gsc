#using scripts\common\utility.gsc;
#using script_313e33debc8b4b0e;
#using scripts\code\character.gsc;
#using script_3c2fe6ffbb9a3e52;

#namespace namespace_f7b05f139be19d92;

// Namespace namespace_f7b05f139be19d92 / namespace_b5d1eaa7e3f521f2
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x119
// Size: 0xb4
function private autoexec init() {
    character = #"hash_60df4f941e1388c6";
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
        level.var_44bf7e31237b3073[%"hash_76190b55c88508e9"] = &function_ecf17a96e49ab67;
        return;
    }
    level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
}

// Namespace namespace_f7b05f139be19d92 / namespace_b5d1eaa7e3f521f2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d5
// Size: 0xb1
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_base";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_base";
    self function_6b0082dec4510b24("c_jup_zmb_zombie_base_male_long_shirt_body_yz_safe", namespace_8e1ed7098f00acc::main());
    scripts\code\character::attachhead("c_jup_zmb_zombie_base_long_shirt_head_yz", namespace_779dcd7346828a34::main());
    self setclothtype(#"vestheavy");
    self function_8abe5a968cc3c220(#"none");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_16c36cf98afe63cd");
    }
}

// Namespace namespace_f7b05f139be19d92 / namespace_b5d1eaa7e3f521f2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28e
// Size: 0x2
function precache() {
    
}

// Namespace namespace_f7b05f139be19d92 / namespace_b5d1eaa7e3f521f2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x298
// Size: 0x23
function precache_sp() {
    precache();
    scripts\code\character::precachemodelarray(namespace_8e1ed7098f00acc::main());
    scripts\code\character::precachemodelarray(namespace_779dcd7346828a34::main());
}

// Namespace namespace_f7b05f139be19d92 / namespace_b5d1eaa7e3f521f2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c3
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_f7b05f139be19d92 / namespace_b5d1eaa7e3f521f2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d4
// Size: 0x49
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_b1fd5c5c381b02f0": 
        return namespace_8e1ed7098f00acc::main();
    case #"hash_b9da372d17774d90": 
        return namespace_779dcd7346828a34::main();
    }
    assert(0, "<dev string:x1c>");
}

