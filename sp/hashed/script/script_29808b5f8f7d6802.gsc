#using scripts\common\utility;

#namespace namespace_92524f1831747be0;

// Namespace namespace_92524f1831747be0 / namespace_ebf2ed04c9207f00
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xc6
// Size: 0x9a
function private autoexec init() {
    character = #"hash_b5c5c1317f0c4bcc";
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

// Namespace namespace_92524f1831747be0 / namespace_ebf2ed04c9207f00
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x168
// Size: 0xba
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react";
    self.voice = #"russian";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_civ_prisoner_05");
    self attach("head_c_jup_sc_m_ferragamo", "", 1);
    self.headmodel = "head_c_jup_sc_m_ferragamo";
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_92524f1831747be0 / namespace_ebf2ed04c9207f00
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22a
// Size: 0x2
function precache() {
    
}

// Namespace namespace_92524f1831747be0 / namespace_ebf2ed04c9207f00
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x234
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_c_jup_sp_civ_prisoner_05");
    precachemodel("head_c_jup_sc_m_ferragamo");
}

// Namespace namespace_92524f1831747be0 / namespace_ebf2ed04c9207f00
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25b
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

