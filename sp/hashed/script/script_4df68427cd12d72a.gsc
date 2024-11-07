#using scripts\common\utility.gsc;

#namespace namespace_fdfffe33b6d79f86;

// Namespace namespace_fdfffe33b6d79f86 / namespace_a8750fba488277a6
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xcc
// Size: 0x9a
function private autoexec init() {
    character = #"hash_ac068f99acacf7b2";
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

// Namespace namespace_fdfffe33b6d79f86 / namespace_a8750fba488277a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16e
// Size: 0xba
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react";
    self.voice = #"russian";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_civ_prisoner_03_b_riot");
    self attach("head_c_jup_sc_m_sharipov", "", 1);
    self.headmodel = "head_c_jup_sc_m_sharipov";
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_fdfffe33b6d79f86 / namespace_a8750fba488277a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x230
// Size: 0x2
function precache() {
    
}

// Namespace namespace_fdfffe33b6d79f86 / namespace_a8750fba488277a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23a
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_c_jup_sp_civ_prisoner_03_b_riot");
    precachemodel("head_c_jup_sc_m_sharipov");
}

// Namespace namespace_fdfffe33b6d79f86 / namespace_a8750fba488277a6
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x261
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

