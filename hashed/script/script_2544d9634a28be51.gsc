#using scripts\common\utility.gsc;
#using script_11b4260ce61b0788;
#using scripts\code\character.gsc;
#using script_4f42d861da865329;

#namespace namespace_548f158492b6e977;

// Namespace namespace_548f158492b6e977 / namespace_45725634a3b46597
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x129
// Size: 0xb3
function private autoexec init() {
    character = #"hash_8bfa697e191cd993";
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
        level.var_44bf7e31237b3073[%"hash_6edeb72df2145070"] = &function_ecf17a96e49ab67;
        return;
    }
    level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
}

// Namespace namespace_548f158492b6e977 / namespace_45725634a3b46597
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e4
// Size: 0xb1
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react";
    self.voice = #"unitednations";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self function_6b0082dec4510b24("bodies_civilian_uk_female_surge_1", namespace_1e4c15d1b8ec73a0::main());
    scripts\code\character::attachhead("heads_civilian_uk_female_surge_1", namespace_213edbaad52def57::main());
    self setclothtype(#"nylon");
    self function_8abe5a968cc3c220(#"none");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_548f158492b6e977 / namespace_45725634a3b46597
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29d
// Size: 0x2
function precache() {
    
}

// Namespace namespace_548f158492b6e977 / namespace_45725634a3b46597
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a7
// Size: 0x23
function precache_sp() {
    precache();
    scripts\code\character::precachemodelarray(namespace_1e4c15d1b8ec73a0::main());
    scripts\code\character::precachemodelarray(namespace_213edbaad52def57::main());
}

// Namespace namespace_548f158492b6e977 / namespace_45725634a3b46597
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d2
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_548f158492b6e977 / namespace_45725634a3b46597
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e3
// Size: 0x49
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_34f1922b13ba12cc": 
        return namespace_1e4c15d1b8ec73a0::main();
    case #"hash_f9c54181ea2ec393": 
        return namespace_213edbaad52def57::main();
    }
    assert(0, "character_civilian_uk_female_surge_1 do not have any xmodelalias");
}

