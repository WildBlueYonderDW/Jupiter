#using scripts\common\utility;

#namespace namespace_fcdb0d05e06f5c50;

// Namespace namespace_fcdb0d05e06f5c50 / namespace_df9596d660fc7b30
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xd6
// Size: 0x9a
function private autoexec init() {
    character = #"hash_67546634e25a2dfc";
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

// Namespace namespace_fcdb0d05e06f5c50 / namespace_df9596d660fc7b30
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x178
// Size: 0xba
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "juggernaut";
    self.voice = #"russian";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_enemy_pmc_juggernaut_02");
    self attach("head_c_jup_sp_enemy_pmc_juggernaut_02", "", 1);
    self.headmodel = "head_c_jup_sp_enemy_pmc_juggernaut_02";
    self setclothtype(#"vestheavy");
    self function_8abe5a968cc3c220(#"milhvygr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_fcdb0d05e06f5c50 / namespace_df9596d660fc7b30
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23a
// Size: 0x2
function precache() {
    
}

// Namespace namespace_fcdb0d05e06f5c50 / namespace_df9596d660fc7b30
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x244
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_c_jup_sp_enemy_pmc_juggernaut_02");
    precachemodel("head_c_jup_sp_enemy_pmc_juggernaut_02");
}

// Namespace namespace_fcdb0d05e06f5c50 / namespace_df9596d660fc7b30
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x26b
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

