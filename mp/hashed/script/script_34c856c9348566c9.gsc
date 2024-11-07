#using scripts\common\utility.gsc;

#namespace namespace_b721abb5c8329c49;

// Namespace namespace_b721abb5c8329c49 / namespace_6c1141a562c766e9
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xe3
// Size: 0x9b
function private autoexec init() {
    character = #"hash_c3b36270e20407c5";
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

// Namespace namespace_b721abb5c8329c49 / namespace_6c1141a562c766e9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x186
// Size: 0xba
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_base";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_base";
    self setmodel("body_c_jup_mp_echo_22_mutant");
    self attach("head_c_jup_mp_echo_22_mutant", "", 1);
    self.headmodel = "head_c_jup_mp_echo_22_mutant";
    self setclothtype(#"vestheavy");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_16c36cf98afe63cd");
    }
}

// Namespace namespace_b721abb5c8329c49 / namespace_6c1141a562c766e9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x248
// Size: 0x2
function precache() {
    
}

// Namespace namespace_b721abb5c8329c49 / namespace_6c1141a562c766e9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x252
// Size: 0x1f
function precache_sp() {
    precache();
    precachemodel("body_c_jup_mp_echo_22_mutant");
    precachemodel("head_c_jup_mp_echo_22_mutant");
}

// Namespace namespace_b721abb5c8329c49 / namespace_6c1141a562c766e9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x279
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

