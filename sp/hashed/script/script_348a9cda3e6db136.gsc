#using scripts\code\character;
#using scripts\common\utility;
#using xmodelalias\civilian_london_female_heads_skintone_dark_nohair;

#namespace namespace_93cce028142990cc;

// Namespace namespace_93cce028142990cc / namespace_15e6ae29bf09d3ec
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x13c
// Size: 0xb3
function private autoexec init() {
    character = #"hash_fb0663619494b2e0";
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
        level.var_44bf7e31237b3073[%"hash_40b1d02cd872a2f"] = &function_ecf17a96e49ab67;
        return;
    }
    level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
}

// Namespace namespace_93cce028142990cc / namespace_15e6ae29bf09d3ec
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f7
// Size: 0xab
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react_female";
    self.voice = #"unitednationsfemale";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("c_jup_body_civ_london_female_3_3");
    scripts\code\character::attachhead("civilian_london_female_heads_skintone_dark_nohair", xmodelalias\civilian_london_female_heads_skintone_dark_nohair::main());
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_93cce028142990cc / namespace_15e6ae29bf09d3ec
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2aa
// Size: 0x2
function precache() {
    
}

// Namespace namespace_93cce028142990cc / namespace_15e6ae29bf09d3ec
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b4
// Size: 0x21
function precache_sp() {
    precache();
    precachemodel("c_jup_body_civ_london_female_3_3");
    scripts\code\character::precachemodelarray(xmodelalias\civilian_london_female_heads_skintone_dark_nohair::main());
}

// Namespace namespace_93cce028142990cc / namespace_15e6ae29bf09d3ec
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2dd
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_93cce028142990cc / namespace_15e6ae29bf09d3ec
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ee
// Size: 0x36
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_29ca9550f178cfc1":
        return xmodelalias\civilian_london_female_heads_skintone_dark_nohair::main();
    }
    assert(0, "c_jup_civ_london_female_03_skintone_dark do not have any xmodelalias");
}

