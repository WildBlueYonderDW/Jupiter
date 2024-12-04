#using script_3c2fe6ffbb9a3e52;
#using script_4aae0a9e6e7e02d8;
#using scripts\code\character;
#using scripts\common\utility;

#namespace namespace_67e292a194f8d3fd;

// Namespace namespace_67e292a194f8d3fd / namespace_2f8e97c93a9e191d
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x114
// Size: 0xb4
function private autoexec init() {
    character = #"hash_ac69046634566f21";
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
        level.var_44bf7e31237b3073[%"hash_5ac6c58ea19acf36"] = &function_ecf17a96e49ab67;
        return;
    }
    level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
}

// Namespace namespace_67e292a194f8d3fd / namespace_2f8e97c93a9e191d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d0
// Size: 0xb1
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "zombie_base";
    self.voice = #"unitedstates";
    self.bhasthighholster = 0;
    self.animtree = "zombie_base";
    self function_6b0082dec4510b24("c_jup_zmb_zombie_base_male_long_shirt_body_yz", namespace_3647807ab2e9d06c::main());
    scripts\code\character::attachhead("c_jup_zmb_zombie_base_long_shirt_head_yz", namespace_779dcd7346828a34::main());
    self setclothtype(#"vestheavy");
    self function_8abe5a968cc3c220(#"none");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_16c36cf98afe63cd");
    }
}

// Namespace namespace_67e292a194f8d3fd / namespace_2f8e97c93a9e191d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x289
// Size: 0x2
function precache() {
    
}

// Namespace namespace_67e292a194f8d3fd / namespace_2f8e97c93a9e191d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x293
// Size: 0x23
function precache_sp() {
    precache();
    scripts\code\character::precachemodelarray(namespace_3647807ab2e9d06c::main());
    scripts\code\character::precachemodelarray(namespace_779dcd7346828a34::main());
}

// Namespace namespace_67e292a194f8d3fd / namespace_2f8e97c93a9e191d
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2be
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_67e292a194f8d3fd / namespace_2f8e97c93a9e191d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2cf
// Size: 0x49
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_485891bb076e14f0":
        return namespace_3647807ab2e9d06c::main();
    case #"hash_b9da372d17774d90":
        return namespace_779dcd7346828a34::main();
    }
    assert(0, "<dev string:x1c>");
}

