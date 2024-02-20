// mwiii decomp prototype
#using scripts\common\utility.gsc;

#namespace namespace_66efc78efb2e5a80;

// Namespace namespace_66efc78efb2e5a80/namespace_9f09fad36992d6a0
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x87
// Size: 0x9b
function private autoexec init() {
    character = #"hash_de2da048d1847214";
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

// Namespace namespace_66efc78efb2e5a80/namespace_9f09fad36992d6a0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x129
// Size: 0x9a
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "capture_bot";
    self.voice = #"hash_969c0f396e338ba2";
    self.bhasthighholster = 0;
    self.animtree = "capture_bot";
    self setmodel("tag_origin");
    self setclothtype(#"hash_c5ead6e06f06025d");
    self function_8abe5a968cc3c220(#"none");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_66efc78efb2e5a80/namespace_9f09fad36992d6a0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ca
// Size: 0x3
function precache() {
    
}

// Namespace namespace_66efc78efb2e5a80/namespace_9f09fad36992d6a0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d4
// Size: 0x15
function function_430419022a9c3ffe() {
    precache();
    precachemodel("tag_origin");
}

// Namespace namespace_66efc78efb2e5a80/namespace_9f09fad36992d6a0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f0
// Size: 0xa
function function_8168fbf6282d398b() {
    precache();
}

