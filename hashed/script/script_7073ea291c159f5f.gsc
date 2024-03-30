// mwiii decomp prototype
#using scripts\common\utility.gsc;

#namespace namespace_d061cf289bd30cd5;

// Namespace namespace_d061cf289bd30cd5 / namespace_cb4c872ebc72f1b5
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x95
// Size: 0x9b
function private autoexec init() {
    character = #"hash_1357e5ac6b3278a1";
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

// Namespace namespace_d061cf289bd30cd5 / namespace_cb4c872ebc72f1b5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x137
// Size: 0x9a
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_mangler";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_mangler";
    self setmodel("c_jup_zmb_mangler_hvt");
    self setclothtype(#"vestheavy");
    self function_8abe5a968cc3c220(#"none");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_16c36cf98afe63cd");
    }
}

// Namespace namespace_d061cf289bd30cd5 / namespace_cb4c872ebc72f1b5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d8
// Size: 0x3
function precache() {
    
}

// Namespace namespace_d061cf289bd30cd5 / namespace_cb4c872ebc72f1b5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e2
// Size: 0x15
function precache_sp() {
    precache();
    precachemodel("c_jup_zmb_mangler_hvt");
}

// Namespace namespace_d061cf289bd30cd5 / namespace_cb4c872ebc72f1b5
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fe
// Size: 0xa
function function_8168fbf6282d398b() {
    precache();
}

