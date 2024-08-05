#using scripts\common\utility.gsc;
#using scripts\code\character.gsc;
#using xmodelalias\civilian_russian_female_head.gsc;

#namespace namespace_ddb56a39cb36529e;

// Namespace namespace_ddb56a39cb36529e / namespace_4166c5ccc107d23e
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x11d
// Size: 0xb3
function private autoexec init() {
    character = #"hash_d6c76cd410a9110a";
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
        level.var_44bf7e31237b3073[%"hash_69e230d03846c581"] = &function_ecf17a96e49ab67;
        return;
    }
    level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
}

// Namespace namespace_ddb56a39cb36529e / namespace_4166c5ccc107d23e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d8
// Size: 0xab
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react_female";
    self.voice = #"hash_56e75d50b07f42a2";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_hero_laswell_bdu");
    scripts\code\character::attachhead("civilian_russian_female_head", xmodelalias\civilian_russian_female_head::main());
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_ddb56a39cb36529e / namespace_4166c5ccc107d23e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28b
// Size: 0x2
function precache() {
    
}

// Namespace namespace_ddb56a39cb36529e / namespace_4166c5ccc107d23e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x295
// Size: 0x21
function precache_sp() {
    precache();
    precachemodel("body_c_jup_sp_hero_laswell_bdu");
    scripts\code\character::precachemodelarray(xmodelalias\civilian_russian_female_head::main());
}

// Namespace namespace_ddb56a39cb36529e / namespace_4166c5ccc107d23e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2be
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_ddb56a39cb36529e / namespace_4166c5ccc107d23e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2cf
// Size: 0x36
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_8d954660328473f6": 
        return xmodelalias\civilian_russian_female_head::main();
    }
    assert(0, "c_jup_civ_russian_female_milbase do not have any xmodelalias");
}

