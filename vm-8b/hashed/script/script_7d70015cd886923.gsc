#using scripts\common\utility.gsc;

#namespace namespace_8da82860a4616207;

// Namespace namespace_8da82860a4616207 / namespace_d1e0edf5961faf67
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xfc
// Size: 0x9b
function private autoexec init() {
    character = #"hash_a3b84a44a42ade83";
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

// Namespace namespace_8da82860a4616207 / namespace_d1e0edf5961faf67
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19f
// Size: 0xba
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"russian";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_enemy_pmc_soldier_05");
    self attach("head_c_jup_sp_enemy_pmc_soldier_05", "", 1);
    self.headmodel = "head_c_jup_sp_enemy_pmc_soldier_05";
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_8da82860a4616207 / namespace_d1e0edf5961faf67
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x261
// Size: 0x2
function precache() {
    
}

// Namespace namespace_8da82860a4616207 / namespace_d1e0edf5961faf67
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x26b
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_c_jup_sp_enemy_pmc_soldier_05");
    precachemodel("head_c_jup_sp_enemy_pmc_soldier_05");
}

// Namespace namespace_8da82860a4616207 / namespace_d1e0edf5961faf67
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x292
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

