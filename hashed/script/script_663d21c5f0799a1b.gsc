// mwiii decomp prototype
#using scripts\common\utility.gsc;

#namespace namespace_91adc0b30920ad3f;

// Namespace namespace_91adc0b30920ad3f / namespace_12a74bdc4e52d6df
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xca
// Size: 0x9b
function private autoexec init() {
    character = #"hash_9c790ca31d5e23e3";
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

// Namespace namespace_91adc0b30920ad3f / namespace_12a74bdc4e52d6df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16c
// Size: 0xbb
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_base";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_base";
    self setmodel("c_jup_zmb_zombie_base_armored_light");
    self attach("c_jup_zmb_zombie_base_armored_light_head", "", 1);
    self.headmodel = "c_jup_zmb_zombie_base_armored_light_head";
    self setclothtype(#"vestheavy");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_16c36cf98afe63cd");
    }
}

// Namespace namespace_91adc0b30920ad3f / namespace_12a74bdc4e52d6df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22e
// Size: 0x3
function precache() {
    
}

// Namespace namespace_91adc0b30920ad3f / namespace_12a74bdc4e52d6df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x238
// Size: 0x20
function precache_sp() {
    precache();
    precachemodel("c_jup_zmb_zombie_base_armored_light");
    precachemodel("c_jup_zmb_zombie_base_armored_light_head");
}

// Namespace namespace_91adc0b30920ad3f / namespace_12a74bdc4e52d6df
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25f
// Size: 0xa
function function_8168fbf6282d398b() {
    precache();
}

