#using scripts\common\utility.gsc;

#namespace namespace_66f9ccac660e8ebf;

// Namespace namespace_66f9ccac660e8ebf / namespace_43ebf496dfeb205f
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xcb
// Size: 0x9a
function private autoexec init() {
    character = #"hash_d8ba4555a037ad3b";
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

// Namespace namespace_66f9ccac660e8ebf / namespace_43ebf496dfeb205f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16d
// Size: 0xba
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"russian";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_enemy_pmc_capt_winter");
    self attach("head_c_jup_sp_enemy_pmc_capt_01", "", 1);
    self.headmodel = "head_c_jup_sp_enemy_pmc_capt_01";
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_66f9ccac660e8ebf / namespace_43ebf496dfeb205f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22f
// Size: 0x2
function precache() {
    
}

// Namespace namespace_66f9ccac660e8ebf / namespace_43ebf496dfeb205f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x239
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_c_jup_sp_enemy_pmc_capt_winter");
    precachemodel("head_c_jup_sp_enemy_pmc_capt_01");
}

// Namespace namespace_66f9ccac660e8ebf / namespace_43ebf496dfeb205f
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x260
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

