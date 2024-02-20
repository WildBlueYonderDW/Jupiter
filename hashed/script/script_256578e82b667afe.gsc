// mwiii decomp prototype
#using scripts\common\utility.gsc;

#namespace namespace_801ddae6bef5eece;

// Namespace namespace_801ddae6bef5eece/namespace_4671825c45957bae
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x9c
// Size: 0x9b
function private autoexec init() {
    character = #"hash_b25ac90634cc5192";
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

// Namespace namespace_801ddae6bef5eece/namespace_4671825c45957bae
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13e
// Size: 0x9a
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_disciple";
    self.voice = #"hash_97b066d92d35c738";
    self.bhasthighholster = 0;
    self.animtree = "zombie_disciple";
    self setmodel("c_jup_zmb_disciple_body_hvt");
    self setclothtype(#"hash_d0ef9b6cfe3097be");
    self function_8abe5a968cc3c220(#"hash_1db29aba7a7a7ffd");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_16c36cf98afe63cd");
    }
}

// Namespace namespace_801ddae6bef5eece/namespace_4671825c45957bae
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1df
// Size: 0x3
function precache() {
    
}

// Namespace namespace_801ddae6bef5eece/namespace_4671825c45957bae
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e9
// Size: 0x15
function function_430419022a9c3ffe() {
    precache();
    precachemodel("c_jup_zmb_disciple_body_hvt");
}

// Namespace namespace_801ddae6bef5eece/namespace_4671825c45957bae
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x205
// Size: 0xa
function function_8168fbf6282d398b() {
    precache();
}

