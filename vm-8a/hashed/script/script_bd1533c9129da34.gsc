#using scripts\common\utility.gsc;

#namespace namespace_88ff95a40a5b5eba;

// Namespace namespace_88ff95a40a5b5eba / namespace_f16950c7b0ec9a
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xd0
// Size: 0x9a
function private autoexec init() {
    character = #"hash_2fba2ac1110d9cb6";
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

// Namespace namespace_88ff95a40a5b5eba / namespace_f16950c7b0ec9a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x172
// Size: 0xba
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_base";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_base";
    self setmodel("c_jup_zombie_base_male_shredded_02");
    self attach("c_jup_zombie_base_male_shredded_02_head_half_oz", "", 1);
    self.headmodel = "c_jup_zombie_base_male_shredded_02_head_half_oz";
    self setclothtype(#"vestheavy");
    self function_8abe5a968cc3c220(#"none");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_16c36cf98afe63cd");
    }
}

// Namespace namespace_88ff95a40a5b5eba / namespace_f16950c7b0ec9a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x234
// Size: 0x2
function precache() {
    
}

// Namespace namespace_88ff95a40a5b5eba / namespace_f16950c7b0ec9a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23e
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("c_jup_zombie_base_male_shredded_02");
    precachemodel("c_jup_zombie_base_male_shredded_02_head_half_oz");
}

// Namespace namespace_88ff95a40a5b5eba / namespace_f16950c7b0ec9a
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x265
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

