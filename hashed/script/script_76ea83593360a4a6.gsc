#using scripts\common\utility.gsc;
#using scripts\code\character.gsc;
#using xmodelalias\heads_london_police.gsc;

#namespace namespace_3cd9ed78820ed8fa;

// Namespace namespace_3cd9ed78820ed8fa / namespace_f5ea04ef71b9b35a
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x108
// Size: 0xb3
function private autoexec init() {
    character = #"hash_82fdcfb8869e976e";
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
        level.var_44bf7e31237b3073[%"hash_671cbea79343307f"] = &function_ecf17a96e49ab67;
        return;
    }
    level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
}

// Namespace namespace_3cd9ed78820ed8fa / namespace_f5ea04ef71b9b35a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c3
// Size: 0xab
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier_pistol";
    self.voice = #"unitednations";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("civilian_london_police_male_2_body");
    scripts\code\character::attachhead("heads_london_police", xmodelalias\heads_london_police::main());
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_3cd9ed78820ed8fa / namespace_f5ea04ef71b9b35a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x276
// Size: 0x2
function precache() {
    
}

// Namespace namespace_3cd9ed78820ed8fa / namespace_f5ea04ef71b9b35a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x280
// Size: 0x21
function precache_sp() {
    precache();
    precachemodel("civilian_london_police_male_2_body");
    scripts\code\character::precachemodelarray(xmodelalias\heads_london_police::main());
}

// Namespace namespace_3cd9ed78820ed8fa / namespace_f5ea04ef71b9b35a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a9
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_3cd9ed78820ed8fa / namespace_f5ea04ef71b9b35a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ba
// Size: 0x36
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_e2135c17a101148e": 
        return xmodelalias\heads_london_police::main();
    }
    assert(0, "character_london_police do not have any xmodelalias");
}

