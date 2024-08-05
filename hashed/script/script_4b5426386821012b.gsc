#using scripts\common\utility.gsc;

#namespace namespace_d882bcb2a2c94cf9;

// Namespace namespace_d882bcb2a2c94cf9 / namespace_d8675b24c5070b19
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xc8
// Size: 0x9a
function private autoexec init() {
    character = #"hash_af729ce3b6306035";
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

// Namespace namespace_d882bcb2a2c94cf9 / namespace_d8675b24c5070b19
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16a
// Size: 0xba
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"russian";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_civ_plane_attendant_01_jump");
    self attach("head_sc_m_konstantin_lod0", "", 1);
    self.headmodel = "head_sc_m_konstantin_lod0";
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_d882bcb2a2c94cf9 / namespace_d8675b24c5070b19
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22c
// Size: 0x2
function precache() {
    
}

// Namespace namespace_d882bcb2a2c94cf9 / namespace_d8675b24c5070b19
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x236
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_c_jup_civ_plane_attendant_01_jump");
    precachemodel("head_sc_m_konstantin_lod0");
}

// Namespace namespace_d882bcb2a2c94cf9 / namespace_d8675b24c5070b19
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25d
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

