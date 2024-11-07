#using scripts\common\utility.gsc;

#namespace namespace_1e6f7ac8817f3ee6;

// Namespace namespace_1e6f7ac8817f3ee6 / namespace_d669981731a3ca06
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xcc
// Size: 0x9a
function private autoexec init() {
    character = #"hash_54fc7d4a9e583492";
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

// Namespace namespace_1e6f7ac8817f3ee6 / namespace_d669981731a3ca06
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16e
// Size: 0xba
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"russian";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_enemy_pmc_hooded_02_jump");
    self attach("head_sc_m_fahselt_civ_no_hair", "", 1);
    self.headmodel = "head_sc_m_fahselt_civ_no_hair";
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_1e6f7ac8817f3ee6 / namespace_d669981731a3ca06
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x230
// Size: 0x2
function precache() {
    
}

// Namespace namespace_1e6f7ac8817f3ee6 / namespace_d669981731a3ca06
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23a
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_c_jup_sp_enemy_pmc_hooded_02_jump");
    precachemodel("head_sc_m_fahselt_civ_no_hair");
}

// Namespace namespace_1e6f7ac8817f3ee6 / namespace_d669981731a3ca06
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x261
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

