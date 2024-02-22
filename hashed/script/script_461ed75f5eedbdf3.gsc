// mwiii decomp prototype
#using scripts\common\utility.gsc;

#namespace namespace_d6090f35eb6efbf7;

// Namespace namespace_d6090f35eb6efbf7/namespace_aff6b15a4e71a8d7
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xc7
// Size: 0x9b
function private autoexec init() {
    character = #"hash_7779fa543f4f836b";
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

// Namespace namespace_d6090f35eb6efbf7/namespace_aff6b15a4e71a8d7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x169
// Size: 0xbc
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "warlord_maestro_rainmaker";
    self.voice = #"shadowcompany";
    self.bhasthighholster = 1;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_ext_maestro");
    self attach("head_c_jup_ext_maestro", "", 1);
    self.headmodel = "head_c_jup_ext_maestro";
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"milmedgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_d6090f35eb6efbf7/namespace_aff6b15a4e71a8d7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22c
// Size: 0x3
function precache() {
    
}

// Namespace namespace_d6090f35eb6efbf7/namespace_aff6b15a4e71a8d7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x236
// Size: 0x20
function function_430419022a9c3ffe() {
    precache();
    precachemodel("body_c_jup_ext_maestro");
    precachemodel("head_c_jup_ext_maestro");
}

// Namespace namespace_d6090f35eb6efbf7/namespace_aff6b15a4e71a8d7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25d
// Size: 0xa
function function_8168fbf6282d398b() {
    precache();
}

