#using scripts\common\utility;

#namespace namespace_375d4609845a4bbd;

// Namespace namespace_375d4609845a4bbd / namespace_e38bb667a604189d
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xcf
// Size: 0x9a
function private autoexec init() {
    character = #"hash_bae42eadd35f55c9";
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

// Namespace namespace_375d4609845a4bbd / namespace_e38bb667a604189d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x171
// Size: 0xba
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react";
    self.voice = #"russian";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_civ_prisoner_02_a");
    self attach("head_c_jup_sc_m_ahmadzai_no_hair", "", 1);
    self.headmodel = "head_c_jup_sc_m_ahmadzai_no_hair";
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_375d4609845a4bbd / namespace_e38bb667a604189d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x233
// Size: 0x2
function precache() {
    
}

// Namespace namespace_375d4609845a4bbd / namespace_e38bb667a604189d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23d
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_c_jup_sp_civ_prisoner_02_a");
    precachemodel("head_c_jup_sc_m_ahmadzai_no_hair");
}

// Namespace namespace_375d4609845a4bbd / namespace_e38bb667a604189d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x264
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

