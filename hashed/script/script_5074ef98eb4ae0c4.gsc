// mwiii decomp prototype
#using scripts\common\utility.gsc;

#namespace namespace_c1fc4ca6cefda452;

// Namespace namespace_c1fc4ca6cefda452/namespace_2d6ec402a80dacf2
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xd1
// Size: 0x9b
function private autoexec init() {
    character = #"hash_35a4a4f4c91fdfae";
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

// Namespace namespace_c1fc4ca6cefda452/namespace_2d6ec402a80dacf2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x173
// Size: 0xbb
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_base";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_base";
    self setmodel("c_jup_zmb_zombie_base_charred_female_body");
    self attach("c_jup_zmb_zombie_base_charred_female_head", "", 1);
    self.headmodel = "c_jup_zmb_zombie_base_charred_female_head";
    self setclothtype(#"vestheavy");
    self function_8abe5a968cc3c220(#"none");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_16c36cf98afe63cd");
    }
}

// Namespace namespace_c1fc4ca6cefda452/namespace_2d6ec402a80dacf2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x235
// Size: 0x3
function precache() {
    
}

// Namespace namespace_c1fc4ca6cefda452/namespace_2d6ec402a80dacf2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23f
// Size: 0x20
function function_430419022a9c3ffe() {
    precache();
    precachemodel("c_jup_zmb_zombie_base_charred_female_body");
    precachemodel("c_jup_zmb_zombie_base_charred_female_head");
}

// Namespace namespace_c1fc4ca6cefda452/namespace_2d6ec402a80dacf2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x266
// Size: 0xa
function function_8168fbf6282d398b() {
    precache();
}

