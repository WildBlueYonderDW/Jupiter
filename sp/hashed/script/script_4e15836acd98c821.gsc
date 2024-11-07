#using scripts\common\utility.gsc;

#namespace namespace_9319e5066a2b27cb;

// Namespace namespace_9319e5066a2b27cb / namespace_c5e7915d3b8c10eb
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xc3
// Size: 0x9a
function private autoexec init() {
    character = #"hash_d5cbdf8e17b3fa57";
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

// Namespace namespace_9319e5066a2b27cb / namespace_c5e7915d3b8c10eb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x165
// Size: 0xbb
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"russian";
    self.bhasthighholster = 1;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_villain_makarov_train");
    self attach("c_jup_head_hero_makarov", "", 1);
    self.headmodel = "c_jup_head_hero_makarov";
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_9319e5066a2b27cb / namespace_c5e7915d3b8c10eb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x228
// Size: 0x2
function precache() {
    
}

// Namespace namespace_9319e5066a2b27cb / namespace_c5e7915d3b8c10eb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x232
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_c_jup_sp_villain_makarov_train");
    precachemodel("c_jup_head_hero_makarov");
}

// Namespace namespace_9319e5066a2b27cb / namespace_c5e7915d3b8c10eb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x259
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

