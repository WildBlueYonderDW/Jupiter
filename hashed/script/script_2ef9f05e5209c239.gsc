#using scripts\common\utility.gsc;

#namespace namespace_bb2c1e3655f21151;

// Namespace namespace_bb2c1e3655f21151 / namespace_64247481723b05f1
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xc6
// Size: 0x9a
function private autoexec init() {
    character = #"hash_4b217c6d7045e85d";
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

// Namespace namespace_bb2c1e3655f21151 / namespace_64247481723b05f1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x168
// Size: 0xba
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"russian";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_enemy_pmc_hooded_01_jump");
    self attach("head_sc_m_johnson_var_1", "", 1);
    self.headmodel = "head_sc_m_johnson_var_1";
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_bb2c1e3655f21151 / namespace_64247481723b05f1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22a
// Size: 0x2
function precache() {
    
}

// Namespace namespace_bb2c1e3655f21151 / namespace_64247481723b05f1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x234
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_c_jup_sp_enemy_pmc_hooded_01_jump");
    precachemodel("head_sc_m_johnson_var_1");
}

// Namespace namespace_bb2c1e3655f21151 / namespace_64247481723b05f1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25b
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

