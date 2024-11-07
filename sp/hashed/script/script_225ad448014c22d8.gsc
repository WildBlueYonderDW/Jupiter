#using scripts\common\utility.gsc;
#using script_682e691164a5ab01;
#using scripts\code\character.gsc;
#using script_482b987c72880e50;

#namespace namespace_548f168492b6ebaa;

// Namespace namespace_548f168492b6ebaa / namespace_45725734a3b467ca
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x129
// Size: 0xb3
function private autoexec init() {
    character = #"hash_8bfa6a7e191cdb46";
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
        level.var_44bf7e31237b3073[%"hash_6edeba2df2145589"] = &function_ecf17a96e49ab67;
        return;
    }
    level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
}

// Namespace namespace_548f168492b6ebaa / namespace_45725734a3b467ca
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e4
// Size: 0xb1
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react";
    self.voice = #"unitednations";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self function_6b0082dec4510b24("bodies_civilian_uk_female_surge_2", namespace_1e4c18d1b8ec7a39::main());
    scripts\code\character::attachhead("heads_civilian_uk_female_surge_2", namespace_213edcaad52df18a::main());
    self setclothtype(#"nylon");
    self function_8abe5a968cc3c220(#"none");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_548f168492b6ebaa / namespace_45725734a3b467ca
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29d
// Size: 0x2
function precache() {
    
}

// Namespace namespace_548f168492b6ebaa / namespace_45725734a3b467ca
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a7
// Size: 0x23
function precache_sp() {
    precache();
    scripts\code\character::precachemodelarray(namespace_1e4c18d1b8ec7a39::main());
    scripts\code\character::precachemodelarray(namespace_213edcaad52df18a::main());
}

// Namespace namespace_548f168492b6ebaa / namespace_45725734a3b467ca
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d2
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_548f168492b6ebaa / namespace_45725734a3b467ca
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e3
// Size: 0x49
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_34f1952b13ba1785":
        return namespace_1e4c18d1b8ec7a39::main();
    case #"hash_f9c54281ea2ec526":
        return namespace_213edcaad52df18a::main();
    }
    assert(0, "character_civilian_uk_female_surge_2 do not have any xmodelalias");
}

