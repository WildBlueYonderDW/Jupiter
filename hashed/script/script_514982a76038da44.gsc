// mwiii decomp prototype
#using scripts\common\utility.gsc;

#namespace namespace_eb10246b8cd6f8f4;

// Namespace namespace_eb10246b8cd6f8f4 / namespace_aa1f5dff96f64354
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xce
// Size: 0x9b
function private autoexec init() {
    character = #"hash_dedb0dfc4b2b7ab0";
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

// Namespace namespace_eb10246b8cd6f8f4 / namespace_aa1f5dff96f64354
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x170
// Size: 0xbb
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_base";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_base";
    self setmodel("c_jup_zmb_zombie_base_female_dress");
    self attach("c_jup_zmb_zombie_base_female_dress_head_01_yz", "", 1);
    self.headmodel = "c_jup_zmb_zombie_base_female_dress_head_01_yz";
    self setclothtype(#"vestheavy");
    self function_8abe5a968cc3c220(#"none");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_16c36cf98afe63cd");
    }
}

// Namespace namespace_eb10246b8cd6f8f4 / namespace_aa1f5dff96f64354
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x232
// Size: 0x3
function precache() {
    
}

// Namespace namespace_eb10246b8cd6f8f4 / namespace_aa1f5dff96f64354
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23c
// Size: 0x20
function precache_sp() {
    precache();
    precachemodel("c_jup_zmb_zombie_base_female_dress");
    precachemodel("c_jup_zmb_zombie_base_female_dress_head_01_yz");
}

// Namespace namespace_eb10246b8cd6f8f4 / namespace_aa1f5dff96f64354
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x263
// Size: 0xa
function function_8168fbf6282d398b() {
    precache();
}

