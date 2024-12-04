#using scripts\common\utility;

#namespace namespace_c477babc9ed349c4;

// Namespace namespace_c477babc9ed349c4 / namespace_b04683cefb6213a4
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xc3
// Size: 0x9a
function private autoexec init() {
    character = #"hash_ca1d0f0b5d8de880";
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

// Namespace namespace_c477babc9ed349c4 / namespace_b04683cefb6213a4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x165
// Size: 0xba
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"russian";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_civ_plane_attendant_01");
    self attach("head_sc_m_konstantin_lod0", "", 1);
    self.headmodel = "head_sc_m_konstantin_lod0";
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_c477babc9ed349c4 / namespace_b04683cefb6213a4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x227
// Size: 0x2
function precache() {
    
}

// Namespace namespace_c477babc9ed349c4 / namespace_b04683cefb6213a4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x231
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_c_jup_civ_plane_attendant_01");
    precachemodel("head_sc_m_konstantin_lod0");
}

// Namespace namespace_c477babc9ed349c4 / namespace_b04683cefb6213a4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x258
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

