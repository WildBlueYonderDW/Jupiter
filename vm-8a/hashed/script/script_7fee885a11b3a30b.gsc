#using scripts\common\utility.gsc;

#namespace namespace_38b2be925d96fba9;

// Namespace namespace_38b2be925d96fba9 / namespace_ac4f2da2c596a9c9
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xdb
// Size: 0x9a
function private autoexec init() {
    character = #"hash_10d710d5591880c5";
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

// Namespace namespace_38b2be925d96fba9 / namespace_ac4f2da2c596a9c9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17d
// Size: 0xba
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_base";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_base";
    self setmodel("c_jup_zmb_zombie_base_female_jeans_body_blue_gz");
    self attach("c_jup_zmb_zombie_base_female_jeans_head_02_gz", "", 1);
    self.headmodel = "c_jup_zmb_zombie_base_female_jeans_head_02_gz";
    self setclothtype(#"vestheavy");
    self function_8abe5a968cc3c220(#"none");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_16c36cf98afe63cd");
    }
}

// Namespace namespace_38b2be925d96fba9 / namespace_ac4f2da2c596a9c9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23f
// Size: 0x2
function precache() {
    
}

// Namespace namespace_38b2be925d96fba9 / namespace_ac4f2da2c596a9c9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x249
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("c_jup_zmb_zombie_base_female_jeans_body_blue_gz");
    precachemodel("c_jup_zmb_zombie_base_female_jeans_head_02_gz");
}

// Namespace namespace_38b2be925d96fba9 / namespace_ac4f2da2c596a9c9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x270
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

