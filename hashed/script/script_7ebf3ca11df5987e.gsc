#using scripts\common\utility.gsc;

#namespace namespace_31f3296955cbc044;

// Namespace namespace_31f3296955cbc044 / namespace_d39d0a0e035b8064
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xc4
// Size: 0x9b
function private autoexec init() {
    character = #"hash_d49f0f427e8a1fe8";
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

// Namespace namespace_31f3296955cbc044 / namespace_d39d0a0e035b8064
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x167
// Size: 0x99
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"unitednations";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("c_jup_zmb_ravenov_fb");
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"milmedgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_31f3296955cbc044 / namespace_d39d0a0e035b8064
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x208
// Size: 0x2
function precache() {
    
}

// Namespace namespace_31f3296955cbc044 / namespace_d39d0a0e035b8064
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x212
// Size: 0x14
function precache_sp() {
    precache();
    precachemodel("c_jup_zmb_ravenov_fb");
}

// Namespace namespace_31f3296955cbc044 / namespace_d39d0a0e035b8064
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22e
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

