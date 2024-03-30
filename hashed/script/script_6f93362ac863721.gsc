// mwiii decomp prototype
#using scripts\common\utility.gsc;

#namespace namespace_3826cc88a8cac947;

// Namespace namespace_3826cc88a8cac947 / namespace_b77e5fb2789b52e7
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xd4
// Size: 0x9b
function private autoexec init() {
    character = #"hash_783cc600481d4923";
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

// Namespace namespace_3826cc88a8cac947 / namespace_b77e5fb2789b52e7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x176
// Size: 0xbb
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"russian";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_enemy_pmc_soldier_05");
    self attach("head_c_jup_sp_enemy_pmc_soldier_05_masked", "", 1);
    self.headmodel = "head_c_jup_sp_enemy_pmc_soldier_05_masked";
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_3826cc88a8cac947 / namespace_b77e5fb2789b52e7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x238
// Size: 0x3
function precache() {
    
}

// Namespace namespace_3826cc88a8cac947 / namespace_b77e5fb2789b52e7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x242
// Size: 0x20
function precache_sp() {
    precache();
    precachemodel("body_c_jup_sp_enemy_pmc_soldier_05");
    precachemodel("head_c_jup_sp_enemy_pmc_soldier_05_masked");
}

// Namespace namespace_3826cc88a8cac947 / namespace_b77e5fb2789b52e7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x269
// Size: 0xa
function function_8168fbf6282d398b() {
    precache();
}

