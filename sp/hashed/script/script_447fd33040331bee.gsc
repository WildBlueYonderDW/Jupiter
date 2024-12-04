#using scripts\common\utility;

#namespace namespace_fbbb7653df37fc26;

// Namespace namespace_fbbb7653df37fc26 / namespace_76540aa232d76986
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xcd
// Size: 0x9a
function private autoexec init() {
    character = #"hash_1ae8f329a30ab62a";
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

// Namespace namespace_fbbb7653df37fc26 / namespace_76540aa232d76986
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16f
// Size: 0xbb
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"shadowcompany";
    self.bhasthighholster = 1;
    self.animtree = "generic_human";
    self setmodel("body_sp_opforce_pmc_with_strap_1_1");
    self attach("head_sp_opforce_pmc_no_goggles_3_1", "", 1);
    self.headmodel = "head_sp_opforce_pmc_no_goggles_3_1";
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"milmedgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_fbbb7653df37fc26 / namespace_76540aa232d76986
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x232
// Size: 0x2
function precache() {
    
}

// Namespace namespace_fbbb7653df37fc26 / namespace_76540aa232d76986
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23c
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_sp_opforce_pmc_with_strap_1_1");
    precachemodel("head_sp_opforce_pmc_no_goggles_3_1");
}

// Namespace namespace_fbbb7653df37fc26 / namespace_76540aa232d76986
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x263
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

