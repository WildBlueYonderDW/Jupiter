#using scripts\common\utility.gsc;

#namespace namespace_c083b66e4e01119b;

// Namespace namespace_c083b66e4e01119b / namespace_b2e5d44be84db3b
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xdd
// Size: 0x9b
function private autoexec init() {
    character = #"hash_2ab9e950b4d92baf";
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

// Namespace namespace_c083b66e4e01119b / namespace_b2e5d44be84db3b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x180
// Size: 0x99
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_abom_mega";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_abom";
    self setmodel("c_jup_zmb_abomination_megabomb_body_hvt");
    self setclothtype(#"vestheavy");
    self function_8abe5a968cc3c220(#"none");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_16c36cf98afe63cd");
    }
}

// Namespace namespace_c083b66e4e01119b / namespace_b2e5d44be84db3b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x221
// Size: 0x2
function precache() {
    
}

// Namespace namespace_c083b66e4e01119b / namespace_b2e5d44be84db3b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22b
// Size: 0x14
function precache_sp() {
    precache();
    precachemodel("c_jup_zmb_abomination_megabomb_body_hvt");
}

// Namespace namespace_c083b66e4e01119b / namespace_b2e5d44be84db3b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x247
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

