#using scripts\common\utility.gsc;

#namespace namespace_1849294fcfdcd619;

// Namespace namespace_1849294fcfdcd619 / namespace_a0b2a98c225c8839
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xba
// Size: 0x9a
function private autoexec init() {
    character = #"hash_26819d704d7f3ffd";
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

// Namespace namespace_1849294fcfdcd619 / namespace_a0b2a98c225c8839
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15c
// Size: 0xba
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "farah";
    self.voice = #"hash_29890644b3ac02c1";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_hero_farah_urban");
    self attach("c_jup_head_hero_farah", "", 1);
    self.headmodel = "c_jup_head_hero_farah";
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_1849294fcfdcd619 / namespace_a0b2a98c225c8839
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21e
// Size: 0x2
function precache() {
    
}

// Namespace namespace_1849294fcfdcd619 / namespace_a0b2a98c225c8839
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x228
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_c_jup_sp_hero_farah_urban");
    precachemodel("c_jup_head_hero_farah");
}

// Namespace namespace_1849294fcfdcd619 / namespace_a0b2a98c225c8839
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x24f
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

