#using scripts\common\utility.gsc;

#namespace namespace_b2c3d40575f5ea8;

// Namespace namespace_b2c3d40575f5ea8 / namespace_ad9bb639b9f6ef08
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xc1
// Size: 0x9a
function private autoexec init() {
    character = #"hash_860b83e9cdee776c";
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

// Namespace namespace_b2c3d40575f5ea8 / namespace_ad9bb639b9f6ef08
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x163
// Size: 0xbb
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "riotshield";
    self.voice = #"unitednations";
    self.bhasthighholster = 1;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_ally_sas_urban");
    self attach("c_jup_head_sc_m_alexander", "", 1);
    self.headmodel = "c_jup_head_sc_m_alexander";
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_b2c3d40575f5ea8 / namespace_ad9bb639b9f6ef08
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x226
// Size: 0x2
function precache() {
    
}

// Namespace namespace_b2c3d40575f5ea8 / namespace_ad9bb639b9f6ef08
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x230
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_c_jup_sp_ally_sas_urban");
    precachemodel("c_jup_head_sc_m_alexander");
}

// Namespace namespace_b2c3d40575f5ea8 / namespace_ad9bb639b9f6ef08
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x257
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

