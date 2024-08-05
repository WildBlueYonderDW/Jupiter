#using scripts\common\utility.gsc;

#namespace namespace_a2349c70effd15b3;

// Namespace namespace_a2349c70effd15b3 / namespace_fa8ef2fdec523253
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xca
// Size: 0x9a
function private autoexec init() {
    character = #"hash_c75f01cef8aea1af";
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

// Namespace namespace_a2349c70effd15b3 / namespace_fa8ef2fdec523253
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16c
// Size: 0xba
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "farah";
    self.voice = #"hash_29890644b3ac02c1";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_hero_farah_tundra");
    self attach("c_jup_head_hero_farah_tundra_no_hair", "", 1);
    self.headmodel = "c_jup_head_hero_farah_tundra_no_hair";
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"hash_1a99d5cce68abcfb");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_a2349c70effd15b3 / namespace_fa8ef2fdec523253
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22e
// Size: 0x2
function precache() {
    
}

// Namespace namespace_a2349c70effd15b3 / namespace_fa8ef2fdec523253
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x238
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_c_jup_sp_hero_farah_tundra");
    precachemodel("c_jup_head_hero_farah_tundra_no_hair");
}

// Namespace namespace_a2349c70effd15b3 / namespace_fa8ef2fdec523253
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25f
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

