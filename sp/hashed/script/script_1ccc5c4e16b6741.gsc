#using scripts\common\utility.gsc;
#using xmodelalias\civilian_london_male_body_skintone_med.gsc;
#using scripts\code\character.gsc;
#using xmodelalias\civilian_uk_male_heads_skintone_med.gsc;

#namespace namespace_4b103e6c7f466347;

// Namespace namespace_4b103e6c7f466347 / namespace_5579395db6a5d327
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x12f
// Size: 0xb3
function private autoexec init() {
    character = #"hash_fca379073af9b863";
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
        level.var_44bf7e31237b3073[%"hash_39ca71bf6636af90"] = &function_ecf17a96e49ab67;
        return;
    }
    level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
}

// Namespace namespace_4b103e6c7f466347 / namespace_5579395db6a5d327
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ea
// Size: 0xb1
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react";
    self.voice = #"unitednations";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self function_6b0082dec4510b24("civilian_london_male_body_skintone_med", xmodelalias\civilian_london_male_body_skintone_med::main());
    scripts\code\character::attachhead("civilian_uk_male_heads_skintone_med", xmodelalias\civilian_uk_male_heads_skintone_med::main());
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_4b103e6c7f466347 / namespace_5579395db6a5d327
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a3
// Size: 0x2
function precache() {
    
}

// Namespace namespace_4b103e6c7f466347 / namespace_5579395db6a5d327
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ad
// Size: 0x23
function precache_sp() {
    precache();
    scripts\code\character::precachemodelarray(xmodelalias\civilian_london_male_body_skintone_med::main());
    scripts\code\character::precachemodelarray(xmodelalias\civilian_uk_male_heads_skintone_med::main());
}

// Namespace namespace_4b103e6c7f466347 / namespace_5579395db6a5d327
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d8
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_4b103e6c7f466347 / namespace_5579395db6a5d327
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e9
// Size: 0x49
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_f078727cd9c2a92b":
        return xmodelalias\civilian_london_male_body_skintone_med::main();
    case #"hash_bf18e3bb4e1e42cc":
        return xmodelalias\civilian_uk_male_heads_skintone_med::main();
    }
    assert(0, "c_jup_civ_london_male_skintone_med do not have any xmodelalias");
}

