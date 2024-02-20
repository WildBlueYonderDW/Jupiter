// mwiii decomp prototype
#using scripts\common\utility.gsc;

#namespace namespace_39c30f9ee41932c7;

// Namespace namespace_39c30f9ee41932c7/namespace_7eb5c3a922f62367
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x87
// Size: 0x9b
function private autoexec init() {
    character = #"hash_2a22a52b71db8b8b";
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

// Namespace namespace_39c30f9ee41932c7/namespace_7eb5c3a922f62367
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x129
// Size: 0x9a
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

// Namespace namespace_39c30f9ee41932c7/namespace_7eb5c3a922f62367
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ca
// Size: 0x3
function precache() {
    
}

// Namespace namespace_39c30f9ee41932c7/namespace_7eb5c3a922f62367
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d4
// Size: 0x15
function function_430419022a9c3ffe() {
    precache();
    precachemodel("tag_origin");
}

// Namespace namespace_39c30f9ee41932c7/namespace_7eb5c3a922f62367
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f0
// Size: 0xa
function function_8168fbf6282d398b() {
    precache();
}

