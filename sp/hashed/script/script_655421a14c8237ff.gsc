#using scripts\common\utility;

#namespace namespace_fc3f50a70b5f51eb;

// Namespace namespace_fc3f50a70b5f51eb / namespace_202683baf0cbe18b
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xd0
// Size: 0x9a
function private autoexec init() {
    character = #"hash_b5111c902b28e6c7";
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

// Namespace namespace_fc3f50a70b5f51eb / namespace_202683baf0cbe18b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x172
// Size: 0xba
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react";
    self.voice = #"russian";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_civ_prisoner_02_b_riot");
    self attach("c_jup_head_sc_m_bansal_beard", "", 1);
    self.headmodel = "c_jup_head_sc_m_bansal_beard";
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_fc3f50a70b5f51eb / namespace_202683baf0cbe18b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x234
// Size: 0x2
function precache() {
    
}

// Namespace namespace_fc3f50a70b5f51eb / namespace_202683baf0cbe18b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23e
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_c_jup_sp_civ_prisoner_02_b_riot");
    precachemodel("c_jup_head_sc_m_bansal_beard");
}

// Namespace namespace_fc3f50a70b5f51eb / namespace_202683baf0cbe18b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x265
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

