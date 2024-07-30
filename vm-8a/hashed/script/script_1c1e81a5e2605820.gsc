#using scripts\common\utility.gsc;

#namespace namespace_17ee75c9f1c82076;

// Namespace namespace_17ee75c9f1c82076 / namespace_d319e5f1619c3ed6
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x87
// Size: 0x9a
function private autoexec init() {
    character = #"hash_d3e60f363e464392";
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

// Namespace namespace_17ee75c9f1c82076 / namespace_d319e5f1619c3ed6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x129
// Size: 0x99
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "capture_bot";
    self.voice = #"unitednations";
    self.bhasthighholster = 0;
    self.animtree = "capture_bot";
    self setmodel("tag_origin");
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"none");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_17ee75c9f1c82076 / namespace_d319e5f1619c3ed6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ca
// Size: 0x2
function precache() {
    
}

// Namespace namespace_17ee75c9f1c82076 / namespace_d319e5f1619c3ed6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d4
// Size: 0x14
function precache_sp() {
    precache();
    precachemodel("tag_origin");
}

// Namespace namespace_17ee75c9f1c82076 / namespace_d319e5f1619c3ed6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f0
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

