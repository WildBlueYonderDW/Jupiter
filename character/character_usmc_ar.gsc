#using scripts\common\utility.gsc;

#namespace namespace_4b508f3a1f66c471;

// Namespace namespace_4b508f3a1f66c471 / character\character_usmc_ar
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xa2
// Size: 0x9a
function private autoexec init() {
    character = #"hash_a4e96c315e5e5cd";
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

// Namespace namespace_4b508f3a1f66c471 / character\character_usmc_ar
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x144
// Size: 0xbb
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"unitedstates";
    self.bhasthighholster = 1;
    self.animtree = "generic_human";
    self setmodel("body_usmc_ar");
    self attach("head_usmc_lmg", "", 1);
    self.headmodel = "head_usmc_lmg";
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_4b508f3a1f66c471 / character\character_usmc_ar
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x207
// Size: 0x2
function precache() {
    
}

// Namespace namespace_4b508f3a1f66c471 / character\character_usmc_ar
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x211
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_usmc_ar");
    precachemodel("head_usmc_lmg");
}

// Namespace namespace_4b508f3a1f66c471 / character\character_usmc_ar
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x238
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

