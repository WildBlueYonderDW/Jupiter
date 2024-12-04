#using script_41ecad2e89345fd0;
#using scripts\code\character;
#using scripts\common\utility;

#namespace namespace_81974ce03c6a7e27;

// Namespace namespace_81974ce03c6a7e27 / namespace_6d6ba3b89ccba887
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x10f
// Size: 0xb4
function private autoexec init() {
    character = #"hash_fdb0fa89b088037b";
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
        level.var_44bf7e31237b3073[%"hash_3c7ada73586c4c46"] = &function_ecf17a96e49ab67;
        return;
    }
    level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
}

// Namespace namespace_81974ce03c6a7e27 / namespace_6d6ba3b89ccba887
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cb
// Size: 0xab
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_base";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_base";
    self setmodel("c_jup_zmb_zombie_base_male_merc_sleeves_body");
    scripts\code\character::attachhead("c_jup_zmb_zombie_base_male_merc_sleeves_head", namespace_6c3d22bd8f7f62e6::main());
    self setclothtype(#"vestheavy");
    self function_8abe5a968cc3c220(#"none");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_16c36cf98afe63cd");
    }
}

// Namespace namespace_81974ce03c6a7e27 / namespace_6d6ba3b89ccba887
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27e
// Size: 0x2
function precache() {
    
}

// Namespace namespace_81974ce03c6a7e27 / namespace_6d6ba3b89ccba887
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x288
// Size: 0x21
function precache_sp() {
    precache();
    precachemodel("c_jup_zmb_zombie_base_male_merc_sleeves_body");
    scripts\code\character::precachemodelarray(namespace_6c3d22bd8f7f62e6::main());
}

// Namespace namespace_81974ce03c6a7e27 / namespace_6d6ba3b89ccba887
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b1
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_81974ce03c6a7e27 / namespace_6d6ba3b89ccba887
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2c2
// Size: 0x36
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_ebcab91fa100cdca":
        return namespace_6c3d22bd8f7f62e6::main();
    }
    assert(0, "<dev string:x1c>");
}

