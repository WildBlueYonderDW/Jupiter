#using scripts\common\utility.gsc;

#namespace namespace_bd30f6d10aed72a4;

// Namespace namespace_bd30f6d10aed72a4 / namespace_53e71729f2cfa744
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xb9
// Size: 0x9a
function private autoexec init() {
    character = #"hash_ae010f4638aea338";
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

// Namespace namespace_bd30f6d10aed72a4 / namespace_53e71729f2cfa744
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15b
// Size: 0xbb
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"sas";
    self.bhasthighholster = 1;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_hero_soap_london");
    self attach("head_hero_soap_lod", "", 1);
    self.headmodel = "head_hero_soap_lod";
    self setclothtype(#"nylon");
    self function_8abe5a968cc3c220(#"milmedgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_bd30f6d10aed72a4 / namespace_53e71729f2cfa744
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21e
// Size: 0x2
function precache() {
    
}

// Namespace namespace_bd30f6d10aed72a4 / namespace_53e71729f2cfa744
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x228
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_c_jup_sp_hero_soap_london");
    precachemodel("head_hero_soap_lod");
}

// Namespace namespace_bd30f6d10aed72a4 / namespace_53e71729f2cfa744
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x24f
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

