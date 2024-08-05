#using scripts\common\utility.gsc;

#namespace namespace_b5d77f7ac2a24c62;

// Namespace namespace_b5d77f7ac2a24c62 / namespace_11ebfb9340b0d542
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xb9
// Size: 0x9a
function private autoexec init() {
    character = #"hash_3b9ce46604d4776e";
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

// Namespace namespace_b5d77f7ac2a24c62 / namespace_11ebfb9340b0d542
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15b
// Size: 0xbb
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"sas";
    self.bhasthighholster = 1;
    self.animtree = "generic_human";
    self setmodel("c_jup_body_cp_alex_iw9_1_1");
    self attach("head_hero_alex_lod_iw9", "", 1);
    self.headmodel = "head_hero_alex_lod_iw9";
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_b5d77f7ac2a24c62 / namespace_11ebfb9340b0d542
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21e
// Size: 0x2
function precache() {
    
}

// Namespace namespace_b5d77f7ac2a24c62 / namespace_11ebfb9340b0d542
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x228
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("c_jup_body_cp_alex_iw9_1_1");
    precachemodel("head_hero_alex_lod_iw9");
}

// Namespace namespace_b5d77f7ac2a24c62 / namespace_11ebfb9340b0d542
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x24f
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

