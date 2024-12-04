#using scripts\common\utility;

#namespace namespace_2582ba1a52053b55;

// Namespace namespace_2582ba1a52053b55 / namespace_bdeae94dba9e77f5
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xb6
// Size: 0x9a
function private autoexec init() {
    character = #"hash_d2393444e3930941";
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

// Namespace namespace_2582ba1a52053b55 / namespace_bdeae94dba9e77f5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x158
// Size: 0xba
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"russian";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("body_sp_heroe_nikolai_convoy");
    self attach("head_hero_nikolai", "", 1);
    self.headmodel = "head_hero_nikolai";
    self setclothtype(#"hash_1f62791cede09086");
    self function_8abe5a968cc3c220(#"none");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_2582ba1a52053b55 / namespace_bdeae94dba9e77f5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21a
// Size: 0x2
function precache() {
    
}

// Namespace namespace_2582ba1a52053b55 / namespace_bdeae94dba9e77f5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x224
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_sp_heroe_nikolai_convoy");
    precachemodel("head_hero_nikolai");
}

// Namespace namespace_2582ba1a52053b55 / namespace_bdeae94dba9e77f5
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x24b
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

