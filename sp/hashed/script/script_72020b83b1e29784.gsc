#using scripts\common\utility;

#namespace namespace_ace32eabddc30066;

// Namespace namespace_ace32eabddc30066 / namespace_15594988905bb06
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xba
// Size: 0x9a
function private autoexec init() {
    character = #"hash_716a3d5fb85d0af2";
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

// Namespace namespace_ace32eabddc30066 / namespace_15594988905bb06
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15c
// Size: 0xba
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"russian";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_hero_yuri_urban");
    self attach("c_jup_head_hero_yuri", "", 1);
    self.headmodel = "c_jup_head_hero_yuri";
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_ace32eabddc30066 / namespace_15594988905bb06
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21e
// Size: 0x2
function precache() {
    
}

// Namespace namespace_ace32eabddc30066 / namespace_15594988905bb06
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x228
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_c_jup_sp_hero_yuri_urban");
    precachemodel("c_jup_head_hero_yuri");
}

// Namespace namespace_ace32eabddc30066 / namespace_15594988905bb06
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x24f
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

