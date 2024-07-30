#using scripts\common\utility.gsc;

#namespace namespace_da34989bc6db10c1;

// Namespace namespace_da34989bc6db10c1 / namespace_1ac250022ed4afe1
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xa8
// Size: 0x9a
function private autoexec init() {
    character = #"hash_137166e713c3e7d";
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

// Namespace namespace_da34989bc6db10c1 / namespace_1ac250022ed4afe1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14a
// Size: 0xba
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_mimic";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_mimic";
    self setmodel("c_jup_zmb_mimic_body");
    self attach("c_jup_zmb_mimic_head", "", 1);
    self.headmodel = "c_jup_zmb_mimic_head";
    self setclothtype(#"vestheavy");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_16c36cf98afe63cd");
    }
}

// Namespace namespace_da34989bc6db10c1 / namespace_1ac250022ed4afe1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20c
// Size: 0x2
function precache() {
    
}

// Namespace namespace_da34989bc6db10c1 / namespace_1ac250022ed4afe1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x216
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("c_jup_zmb_mimic_body");
    precachemodel("c_jup_zmb_mimic_head");
}

// Namespace namespace_da34989bc6db10c1 / namespace_1ac250022ed4afe1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23d
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

