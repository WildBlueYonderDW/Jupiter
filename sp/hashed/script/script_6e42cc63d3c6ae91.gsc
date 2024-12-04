#using scripts\common\utility;

#namespace namespace_8a7e2ee4979784c9;

// Namespace namespace_8a7e2ee4979784c9 / namespace_70d1c1b097a8bd29
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xbf
// Size: 0x9a
function private autoexec init() {
    character = #"hash_285cb6feb34153fd";
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

// Namespace namespace_8a7e2ee4979784c9 / namespace_70d1c1b097a8bd29
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x161
// Size: 0xba
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "riotshield";
    self.voice = #"russian";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_civ_guard_06a");
    self attach("head_c_jup_sc_m_sharipov", "", 1);
    self.headmodel = "head_c_jup_sc_m_sharipov";
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_8a7e2ee4979784c9 / namespace_70d1c1b097a8bd29
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x223
// Size: 0x2
function precache() {
    
}

// Namespace namespace_8a7e2ee4979784c9 / namespace_70d1c1b097a8bd29
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22d
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_c_jup_sp_civ_guard_06a");
    precachemodel("head_c_jup_sc_m_sharipov");
}

// Namespace namespace_8a7e2ee4979784c9 / namespace_70d1c1b097a8bd29
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x254
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

