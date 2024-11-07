#using scripts\common\utility.gsc;
#using scripts\code\character.gsc;
#using script_6930322303731b24;

#namespace namespace_1bca4a2f0a574338;

// Namespace namespace_1bca4a2f0a574338 / namespace_63c00250586da898
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x10b
// Size: 0xb4
function private autoexec init() {
    character = #"hash_a8319dab377e03e4";
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
        level.var_44bf7e31237b3073[%"hash_5f0e15da5c8f564b"] = &function_ecf17a96e49ab67;
        return;
    }
    level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
}

// Namespace namespace_1bca4a2f0a574338 / namespace_63c00250586da898
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c7
// Size: 0xab
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_base";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_base";
    self setmodel("c_jup_zmb_zombie_base_male_long_shirt_body_gz");
    scripts\code\character::attachhead("c_jup_zmb_zombie_base_long_shirt_head_gz", namespace_780fcd7346ff800a::main());
    self setclothtype(#"vestheavy");
    self function_8abe5a968cc3c220(#"none");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_16c36cf98afe63cd");
    }
}

// Namespace namespace_1bca4a2f0a574338 / namespace_63c00250586da898
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27a
// Size: 0x2
function precache() {
    
}

// Namespace namespace_1bca4a2f0a574338 / namespace_63c00250586da898
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x284
// Size: 0x21
function precache_sp() {
    precache();
    precachemodel("c_jup_zmb_zombie_base_male_long_shirt_body_gz");
    scripts\code\character::precachemodelarray(namespace_780fcd7346ff800a::main());
}

// Namespace namespace_1bca4a2f0a574338 / namespace_63c00250586da898
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ad
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_1bca4a2f0a574338 / namespace_63c00250586da898
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2be
// Size: 0x36
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_b9e0372d177bcabe":
        return namespace_780fcd7346ff800a::main();
    }
    assert(0, "<dev string:x1c>");
}

