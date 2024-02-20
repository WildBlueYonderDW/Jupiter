// mwiii decomp prototype
#using scripts\common\utility.gsc;

#namespace namespace_f392411d54970cdc;

// Namespace namespace_f392411d54970cdc/namespace_7cf51730be3e013c
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xca
// Size: 0x9b
function private autoexec init() {
    character = #"hash_b37dde9389cc3280";
    if (!isdefined(level.var_586887bc5dc30f34)) {
        level.var_586887bc5dc30f34 = [];
    }
    if (!isdefined(level.var_7d97144daa7995cd)) {
        level.var_7d97144daa7995cd = [];
    }
    if (!isdefined(level.var_44bf7e31237b3073)) {
        level.var_44bf7e31237b3073 = [];
    }
    level.var_586887bc5dc30f34[character] = &main;
    if (issp()) {
        level.var_7d97144daa7995cd[character] = &function_430419022a9c3ffe;
    } else {
        level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
    }
}

// Namespace namespace_f392411d54970cdc/namespace_7cf51730be3e013c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16c
// Size: 0xbb
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "rusher";
    self.voice = #"russian";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_enemy_pmc_rusher_05");
    self attach("head_c_jup_sp_enemy_pmc_rusher_05", "", 1);
    self.headmodel = "head_c_jup_sp_enemy_pmc_rusher_05";
    self setclothtype(#"hash_c5ead6e06f06025d");
    self function_8abe5a968cc3c220(#"hash_1db29aba7a7a7ffd");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_f392411d54970cdc/namespace_7cf51730be3e013c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22e
// Size: 0x3
function precache() {
    
}

// Namespace namespace_f392411d54970cdc/namespace_7cf51730be3e013c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x238
// Size: 0x20
function function_430419022a9c3ffe() {
    precache();
    precachemodel("body_c_jup_sp_enemy_pmc_rusher_05");
    precachemodel("head_c_jup_sp_enemy_pmc_rusher_05");
}

// Namespace namespace_f392411d54970cdc/namespace_7cf51730be3e013c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25f
// Size: 0xa
function function_8168fbf6282d398b() {
    precache();
}

