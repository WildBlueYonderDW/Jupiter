#using scripts\common\utility;

#namespace namespace_6af09b8e60d8b638;

// Namespace namespace_6af09b8e60d8b638 / namespace_b17c50085b32258
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xb7
// Size: 0x9a
function private autoexec init() {
    character = #"hash_37cb14ae051b1994";
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

// Namespace namespace_6af09b8e60d8b638 / namespace_b17c50085b32258
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x159
// Size: 0xba
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("body_civ_london_male_2_1");
    self attach("head_sc_m_cueto", "", 1);
    self.headmodel = "head_sc_m_cueto";
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_6af09b8e60d8b638 / namespace_b17c50085b32258
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21b
// Size: 0x2
function precache() {
    
}

// Namespace namespace_6af09b8e60d8b638 / namespace_b17c50085b32258
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x225
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_civ_london_male_2_1");
    precachemodel("head_sc_m_cueto");
}

// Namespace namespace_6af09b8e60d8b638 / namespace_b17c50085b32258
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x24c
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

