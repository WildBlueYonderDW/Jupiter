#using scripts\common\utility;

#namespace namespace_66efc78efb2e5a80;

// Namespace namespace_66efc78efb2e5a80 / namespace_9f09fad36992d6a0
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0xac
// Size: 0x9b
function private autoexec init() {
    character = #"hash_de2da048d1847214";
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

// Namespace namespace_66efc78efb2e5a80 / namespace_9f09fad36992d6a0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14f
// Size: 0x99
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "capture_bot";
    self.voice = #"unitednations";
    self.bhasthighholster = 0;
    self.animtree = "capture_bot";
    self setmodel("tag_origin");
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"none");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_66efc78efb2e5a80 / namespace_9f09fad36992d6a0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f0
// Size: 0x2
function precache() {
    
}

// Namespace namespace_66efc78efb2e5a80 / namespace_9f09fad36992d6a0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1fa
// Size: 0x14
function precache_sp() {
    precache();
    precachemodel("tag_origin");
}

// Namespace namespace_66efc78efb2e5a80 / namespace_9f09fad36992d6a0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x216
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

