#using scripts\common\utility;

#namespace namespace_b60d6b3c1c7d9d1c;

// Namespace namespace_b60d6b3c1c7d9d1c / character\test_character_dog
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x83
// Size: 0x9a
function private autoexec init() {
    character = #"hash_add192d3eb076130";
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

// Namespace namespace_b60d6b3c1c7d9d1c / character\test_character_dog
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x125
// Size: 0x99
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "dog";
    self.voice = #"unitednations";
    self.bhasthighholster = 0;
    self.animtree = "dog";
    self setmodel("fullbody_dog_c");
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_b60d6b3c1c7d9d1c / character\test_character_dog
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c6
// Size: 0x2
function precache() {
    
}

// Namespace namespace_b60d6b3c1c7d9d1c / character\test_character_dog
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d0
// Size: 0x14
function precache_sp() {
    precache();
    precachemodel("fullbody_dog_c");
}

// Namespace namespace_b60d6b3c1c7d9d1c / character\test_character_dog
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ec
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

