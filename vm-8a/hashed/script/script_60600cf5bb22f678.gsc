#using scripts\common\utility.gsc;

#namespace namespace_2b9f0c32885915f2;

// Namespace namespace_2b9f0c32885915f2 / namespace_11a06c0697939b92
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xb3
// Size: 0x9a
function private autoexec init() {
    character = #"hash_c48fd8183afa965e";
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
        return;
    }
    level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
}

// Namespace namespace_2b9f0c32885915f2 / namespace_11a06c0697939b92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x155
// Size: 0x99
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_base_abom_crawler";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_base";
    self setmodel("c_jup_zmb_abomination_crawler");
    self setclothtype(#"vestheavy");
    self function_8abe5a968cc3c220(#"none");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_16c36cf98afe63cd");
    }
}

// Namespace namespace_2b9f0c32885915f2 / namespace_11a06c0697939b92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f6
// Size: 0x2
function precache() {
    
}

// Namespace namespace_2b9f0c32885915f2 / namespace_11a06c0697939b92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x200
// Size: 0x14
function precache_sp() {
    precache();
    precachemodel("c_jup_zmb_abomination_crawler");
}

// Namespace namespace_2b9f0c32885915f2 / namespace_11a06c0697939b92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21c
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

