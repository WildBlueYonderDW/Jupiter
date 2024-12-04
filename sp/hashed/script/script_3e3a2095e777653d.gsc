#using scripts\common\utility;

#namespace namespace_8fbe90a960d9c005;

// Namespace namespace_8fbe90a960d9c005 / namespace_618d4d27c9a791e5
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xd5
// Size: 0x9a
function private autoexec init() {
    character = #"hash_d865cfdb384a4cd9";
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

// Namespace namespace_8fbe90a960d9c005 / namespace_618d4d27c9a791e5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x177
// Size: 0xbb
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"sas";
    self.bhasthighholster = 1;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_hero_gaz_london_tactical");
    self attach("head_c_jup_sp_hero_gaz_london_tactical", "", 1);
    self.headmodel = "head_c_jup_sp_hero_gaz_london_tactical";
    self setclothtype(#"nylon");
    self function_8abe5a968cc3c220(#"milmedgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_8fbe90a960d9c005 / namespace_618d4d27c9a791e5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23a
// Size: 0x2
function precache() {
    
}

// Namespace namespace_8fbe90a960d9c005 / namespace_618d4d27c9a791e5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x244
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_c_jup_sp_hero_gaz_london_tactical");
    precachemodel("head_c_jup_sp_hero_gaz_london_tactical");
}

// Namespace namespace_8fbe90a960d9c005 / namespace_618d4d27c9a791e5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x26b
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

