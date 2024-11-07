#using scripts\common\utility.gsc;

#namespace namespace_f3011510a260e8dd;

// Namespace namespace_f3011510a260e8dd / namespace_ac04453b700605fd
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xc5
// Size: 0x9a
function private autoexec init() {
    character = #"hash_ef529603fab31771";
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

// Namespace namespace_f3011510a260e8dd / namespace_ac04453b700605fd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x167
// Size: 0xba
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"sas";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_ally_redshirt_01");
    self attach("head_c_jup_sp_ally_redshirt_01", "", 1);
    self.headmodel = "head_c_jup_sp_ally_redshirt_01";
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_f3011510a260e8dd / namespace_ac04453b700605fd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x229
// Size: 0x2
function precache() {
    
}

// Namespace namespace_f3011510a260e8dd / namespace_ac04453b700605fd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x233
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_c_jup_sp_ally_redshirt_01");
    precachemodel("head_c_jup_sp_ally_redshirt_01");
}

// Namespace namespace_f3011510a260e8dd / namespace_ac04453b700605fd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25a
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

