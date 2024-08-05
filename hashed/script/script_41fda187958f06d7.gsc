#using scripts\common\utility.gsc;
#using script_479f8bc8be3d3eeb;
#using scripts\code\character.gsc;
#using script_51ba87bdcb5dcf49;

#namespace namespace_e69dae6a8a15d1b1;

// Namespace namespace_e69dae6a8a15d1b1 / namespace_bf5341fc38c23b91
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x132
// Size: 0xb3
function private autoexec init() {
    character = #"hash_8faafc5084514115";
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
        level.var_44bf7e31237b3073[%"hash_40a7dbe106c9c596"] = &function_ecf17a96e49ab67;
        return;
    }
    level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
}

// Namespace namespace_e69dae6a8a15d1b1 / namespace_bf5341fc38c23b91
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ed
// Size: 0xb1
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react";
    self.voice = #"unitednations";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self function_6b0082dec4510b24("test_alias_civilian_female_surge_body", namespace_6d7775a672cff57b::main());
    scripts\code\character::attachhead("test_alias_civilian_female_surge_head", namespace_8efeed9020b1cc29::main());
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_e69dae6a8a15d1b1 / namespace_bf5341fc38c23b91
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a6
// Size: 0x2
function precache() {
    
}

// Namespace namespace_e69dae6a8a15d1b1 / namespace_bf5341fc38c23b91
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b0
// Size: 0x23
function precache_sp() {
    precache();
    scripts\code\character::precachemodelarray(namespace_6d7775a672cff57b::main());
    scripts\code\character::precachemodelarray(namespace_8efeed9020b1cc29::main());
}

// Namespace namespace_e69dae6a8a15d1b1 / namespace_bf5341fc38c23b91
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2db
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_e69dae6a8a15d1b1 / namespace_bf5341fc38c23b91
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ec
// Size: 0x49
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_917dd15b39af92a7": 
        return namespace_6d7775a672cff57b::main();
    case #"hash_e904a03550281bb5": 
        return namespace_8efeed9020b1cc29::main();
    }
    assert(0, "test_character_civilian_female_surge do not have any xmodelalias");
}

