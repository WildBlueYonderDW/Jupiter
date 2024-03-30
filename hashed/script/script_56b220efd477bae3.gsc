// mwiii decomp prototype
#using scripts\common\utility.gsc;

#namespace namespace_a867838b0083b13b;

// Namespace namespace_a867838b0083b13b / namespace_b94c158b7b473ddb
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x98
// Size: 0x9b
function private autoexec init() {
    character = #"hash_4e304a4bbd076697";
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

// Namespace namespace_a867838b0083b13b / namespace_b94c158b7b473ddb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13a
// Size: 0x9a
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_disciple";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_disciple";
    self setmodel("c_jup_zmb_disciple_body");
    self setclothtype(#"vestheavy");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_16c36cf98afe63cd");
    }
}

// Namespace namespace_a867838b0083b13b / namespace_b94c158b7b473ddb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1db
// Size: 0x3
function precache() {
    
}

// Namespace namespace_a867838b0083b13b / namespace_b94c158b7b473ddb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e5
// Size: 0x15
function precache_sp() {
    precache();
    precachemodel("c_jup_zmb_disciple_body");
}

// Namespace namespace_a867838b0083b13b / namespace_b94c158b7b473ddb
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x201
// Size: 0xa
function function_8168fbf6282d398b() {
    precache();
}

