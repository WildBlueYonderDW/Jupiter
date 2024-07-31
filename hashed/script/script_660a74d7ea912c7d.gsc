#using scripts\common\utility.gsc;

#namespace namespace_a8a6bef462ce1ac5;

// Namespace namespace_a8a6bef462ce1ac5 / namespace_ffc70bab88f65ce5
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xfc
// Size: 0x9b
function private autoexec init() {
    character = #"hash_d04ccb4791b97161";
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

// Namespace namespace_a8a6bef462ce1ac5 / namespace_ffc70bab88f65ce5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19f
// Size: 0xba
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"russian";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_enemy_pmc_grunt_red");
    self attach("head_c_jup_sp_enemy_pmc_grunt_05_03", "", 1);
    self.headmodel = "head_c_jup_sp_enemy_pmc_grunt_05_03";
    self setclothtype(#"nylon");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_a8a6bef462ce1ac5 / namespace_ffc70bab88f65ce5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x261
// Size: 0x2
function precache() {
    
}

// Namespace namespace_a8a6bef462ce1ac5 / namespace_ffc70bab88f65ce5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x26b
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_c_jup_sp_enemy_pmc_grunt_red");
    precachemodel("head_c_jup_sp_enemy_pmc_grunt_05_03");
}

// Namespace namespace_a8a6bef462ce1ac5 / namespace_ffc70bab88f65ce5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x292
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

