#using script_43eaf0b84003c284;
#using scripts\code\character;
#using scripts\common\utility;

#namespace namespace_683ed164ff66c8f2;

// Namespace namespace_683ed164ff66c8f2 / namespace_d47544d74ccb4592
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x110
// Size: 0xb4
function private autoexec init() {
    character = #"hash_d1a73dd4b88bc89e";
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
        level.var_44bf7e31237b3073[%"hash_60adb4df556b6baf"] = &function_ecf17a96e49ab67;
        return;
    }
    level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
}

// Namespace namespace_683ed164ff66c8f2 / namespace_d47544d74ccb4592
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cc
// Size: 0xab
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_base";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_base";
    self setmodel("c_jup_zmb_zombie_base_male_shredded_shirtless_safe");
    scripts\code\character::attachhead("c_jup_zmb_zombie_base_male_shredded_head", namespace_ee8c8728281d88ca::main());
    self setclothtype(#"vestheavy");
    self function_8abe5a968cc3c220(#"none");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_16c36cf98afe63cd");
    }
}

// Namespace namespace_683ed164ff66c8f2 / namespace_d47544d74ccb4592
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27f
// Size: 0x2
function precache() {
    
}

// Namespace namespace_683ed164ff66c8f2 / namespace_d47544d74ccb4592
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x289
// Size: 0x21
function precache_sp() {
    precache();
    precachemodel("c_jup_zmb_zombie_base_male_shredded_shirtless_safe");
    scripts\code\character::precachemodelarray(namespace_ee8c8728281d88ca::main());
}

// Namespace namespace_683ed164ff66c8f2 / namespace_d47544d74ccb4592
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b2
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_683ed164ff66c8f2 / namespace_d47544d74ccb4592
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2c3
// Size: 0x36
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_9f43f5c1b4c2c376":
        return namespace_ee8c8728281d88ca::main();
    }
    assert(0, "<dev string:x1c>");
}

