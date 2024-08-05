#using scripts\common\utility.gsc;

#namespace namespace_30c1d5d3862b367e;

// Namespace namespace_30c1d5d3862b367e / namespace_8546c10cd8529c5e
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xd7
// Size: 0x9a
function private autoexec init() {
    character = #"hash_938bd73cc9ead132";
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

// Namespace namespace_30c1d5d3862b367e / namespace_8546c10cd8529c5e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x179
// Size: 0xba
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react";
    self.voice = #"unitednations";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("c_jup_body_civ_embassy_office_worker_male_1_4");
    self attach("head_c_jup_sc_m_george_civ", "", 1);
    self.headmodel = "head_c_jup_sc_m_george_civ";
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_30c1d5d3862b367e / namespace_8546c10cd8529c5e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23b
// Size: 0x2
function precache() {
    
}

// Namespace namespace_30c1d5d3862b367e / namespace_8546c10cd8529c5e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x245
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("c_jup_body_civ_embassy_office_worker_male_1_4");
    precachemodel("head_c_jup_sc_m_george_civ");
}

// Namespace namespace_30c1d5d3862b367e / namespace_8546c10cd8529c5e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x26c
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

