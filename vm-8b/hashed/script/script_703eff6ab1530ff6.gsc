#using scripts\common\utility.gsc;

#namespace namespace_2c05357be56d7dfc;

// Namespace namespace_2c05357be56d7dfc / namespace_7afb46c568ae8e9c
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xbf
// Size: 0x9b
function private autoexec init() {
    character = #"hash_9157946c180c1330";
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

// Namespace namespace_2c05357be56d7dfc / namespace_7afb46c568ae8e9c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x162
// Size: 0x99
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_mangler";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_mangler";
    self setmodel("c_jup_zmb_mangler_hvt_emp");
    self setclothtype(#"vestheavy");
    self function_8abe5a968cc3c220(#"none");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_16c36cf98afe63cd");
    }
}

// Namespace namespace_2c05357be56d7dfc / namespace_7afb46c568ae8e9c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x203
// Size: 0x2
function precache() {
    
}

// Namespace namespace_2c05357be56d7dfc / namespace_7afb46c568ae8e9c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20d
// Size: 0x14
function precache_sp() {
    precache();
    precachemodel("c_jup_zmb_mangler_hvt_emp");
}

// Namespace namespace_2c05357be56d7dfc / namespace_7afb46c568ae8e9c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x229
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

