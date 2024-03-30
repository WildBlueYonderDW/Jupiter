// mwiii decomp prototype
#using scripts\common\utility.gsc;

#namespace namespace_646620d08defeba0;

// Namespace namespace_646620d08defeba0 / namespace_385f3446395c9ac0
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xd7
// Size: 0x9b
function private autoexec init() {
    character = #"hash_ae819d7bf6946aac";
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

// Namespace namespace_646620d08defeba0 / namespace_385f3446395c9ac0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x179
// Size: 0xbb
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"russianfemale";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_enemy_pmc_grunt_female_01");
    self attach("head_c_jup_sp_enemy_pmc_grunt_female_03", "", 1);
    self.headmodel = "head_c_jup_sp_enemy_pmc_grunt_female_03";
    self setclothtype(#"nylon");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_646620d08defeba0 / namespace_385f3446395c9ac0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23b
// Size: 0x3
function precache() {
    
}

// Namespace namespace_646620d08defeba0 / namespace_385f3446395c9ac0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x245
// Size: 0x20
function precache_sp() {
    precache();
    precachemodel("body_c_jup_sp_enemy_pmc_grunt_female_01");
    precachemodel("head_c_jup_sp_enemy_pmc_grunt_female_03");
}

// Namespace namespace_646620d08defeba0 / namespace_385f3446395c9ac0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26c
// Size: 0xa
function function_8168fbf6282d398b() {
    precache();
}

