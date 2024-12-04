#using scripts\code\character;
#using scripts\common\utility;
#using xmodelalias\heads_usmc_male;

#namespace namespace_84d82520a21927e4;

// Namespace namespace_84d82520a21927e4 / character\character_usmc_basic_ar_3
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x108
// Size: 0xb3
function private autoexec init() {
    character = #"hash_e57a54a99517a7a0";
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
        level.var_44bf7e31237b3073[%"hash_1332d0cd07a7941"] = &function_ecf17a96e49ab67;
        return;
    }
    level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
}

// Namespace namespace_84d82520a21927e4 / character\character_usmc_basic_ar_3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c3
// Size: 0xca
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"unitedstates";
    self.bhasthighholster = 1;
    self.animtree = "generic_human";
    self setmodel("body_usmc_basic_ar_3");
    scripts\code\character::attachhead("heads_usmc_male", xmodelalias\heads_usmc_male::main());
    self.hatmodel = "helmet_usmc_basic_ar_3";
    self attach(self.hatmodel);
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_84d82520a21927e4 / character\character_usmc_basic_ar_3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x295
// Size: 0x2
function precache() {
    
}

// Namespace namespace_84d82520a21927e4 / character\character_usmc_basic_ar_3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x29f
// Size: 0x2c
function precache_sp() {
    precache();
    precachemodel("body_usmc_basic_ar_3");
    scripts\code\character::precachemodelarray(xmodelalias\heads_usmc_male::main());
    precachemodel("helmet_usmc_basic_ar_3");
}

// Namespace namespace_84d82520a21927e4 / character\character_usmc_basic_ar_3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d3
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_84d82520a21927e4 / character\character_usmc_basic_ar_3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e4
// Size: 0x36
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_30cc94c91d3460bb":
        return xmodelalias\heads_usmc_male::main();
    }
    assert(0, "character_usmc_basic_ar_3 do not have any xmodelalias");
}

