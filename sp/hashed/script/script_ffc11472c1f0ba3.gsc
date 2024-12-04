#using scripts\common\utility;

#namespace namespace_d1f826093a16531d;

// Namespace namespace_d1f826093a16531d / namespace_805896675e29017d
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xc6
// Size: 0x9a
function private autoexec init() {
    character = #"hash_c23346add7214091";
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

// Namespace namespace_d1f826093a16531d / namespace_805896675e29017d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x168
// Size: 0xba
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react";
    self.voice = #"russian";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_civ_prisoner_05_b");
    self attach("head_c_jup_sc_m_vasquez", "", 1);
    self.headmodel = "head_c_jup_sc_m_vasquez";
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_d1f826093a16531d / namespace_805896675e29017d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22a
// Size: 0x2
function precache() {
    
}

// Namespace namespace_d1f826093a16531d / namespace_805896675e29017d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x234
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_c_jup_sp_civ_prisoner_05_b");
    precachemodel("head_c_jup_sc_m_vasquez");
}

// Namespace namespace_d1f826093a16531d / namespace_805896675e29017d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25b
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

