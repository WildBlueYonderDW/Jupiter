#using scripts\common\utility;

#namespace namespace_8d3d08b3b095543d;

// Namespace namespace_8d3d08b3b095543d / namespace_5009af967080f51d
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xc6
// Size: 0x9a
function private autoexec init() {
    character = #"hash_fedd6762f86f8661";
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

// Namespace namespace_8d3d08b3b095543d / namespace_5009af967080f51d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x168
// Size: 0xbb
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"russian";
    self.bhasthighholster = 1;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_enemy_police_kastovia_03");
    self attach("head_c_jup_sc_m_kamalov", "", 1);
    self.headmodel = "head_c_jup_sc_m_kamalov";
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_8d3d08b3b095543d / namespace_5009af967080f51d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22b
// Size: 0x2
function precache() {
    
}

// Namespace namespace_8d3d08b3b095543d / namespace_5009af967080f51d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x235
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_c_jup_sp_enemy_police_kastovia_03");
    precachemodel("head_c_jup_sc_m_kamalov");
}

// Namespace namespace_8d3d08b3b095543d / namespace_5009af967080f51d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25c
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

