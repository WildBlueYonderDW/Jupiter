#using scripts\common\utility;

#namespace namespace_73ebf70f27884317;

// Namespace namespace_73ebf70f27884317 / namespace_877c0eb8f9475f7
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xd1
// Size: 0x9a
function private autoexec init() {
    character = #"hash_b103ef88796f8f4b";
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

// Namespace namespace_73ebf70f27884317 / namespace_877c0eb8f9475f7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x173
// Size: 0xbb
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"sas";
    self.bhasthighholster = 1;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_hero_soap_tundra_frost");
    self attach("head_c_jup_sp_hero_soap_tundra_frost", "", 1);
    self.headmodel = "head_c_jup_sp_hero_soap_tundra_frost";
    self setclothtype(#"nylon");
    self function_8abe5a968cc3c220(#"milmedgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_73ebf70f27884317 / namespace_877c0eb8f9475f7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x236
// Size: 0x2
function precache() {
    
}

// Namespace namespace_73ebf70f27884317 / namespace_877c0eb8f9475f7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x240
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_c_jup_sp_hero_soap_tundra_frost");
    precachemodel("head_c_jup_sp_hero_soap_tundra_frost");
}

// Namespace namespace_73ebf70f27884317 / namespace_877c0eb8f9475f7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x267
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

