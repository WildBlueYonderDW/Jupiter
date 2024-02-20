// mwiii decomp prototype
#using scripts\common\utility.gsc;

#namespace namespace_42f6e8b4733dc488;

// Namespace namespace_42f6e8b4733dc488/namespace_52869a5b5415a5a8
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x91
// Size: 0x9b
function private autoexec init() {
    character = #"hash_8a29107d49a9f27c";
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

// Namespace namespace_42f6e8b4733dc488/namespace_52869a5b5415a5a8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x133
// Size: 0x9a
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_mangler";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_mangler";
    self setmodel("c_jup_zmb_mangler");
    self setclothtype(#"vestheavy");
    self function_8abe5a968cc3c220(#"none");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_16c36cf98afe63cd");
    }
}

// Namespace namespace_42f6e8b4733dc488/namespace_52869a5b5415a5a8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d4
// Size: 0x3
function precache() {
    
}

// Namespace namespace_42f6e8b4733dc488/namespace_52869a5b5415a5a8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1de
// Size: 0x15
function function_430419022a9c3ffe() {
    precache();
    precachemodel("c_jup_zmb_mangler");
}

// Namespace namespace_42f6e8b4733dc488/namespace_52869a5b5415a5a8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fa
// Size: 0xa
function function_8168fbf6282d398b() {
    precache();
}

