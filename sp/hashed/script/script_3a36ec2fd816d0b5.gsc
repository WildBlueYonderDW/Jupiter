#using scripts\common\utility.gsc;
#using script_1b755c51be1d471e;
#using scripts\code\character.gsc;

#namespace namespace_2e95a4b6544e01a9;

// Namespace namespace_2e95a4b6544e01a9 / namespace_16a63bcff8a84289
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x116
// Size: 0xb3
function private autoexec init() {
    character = #"hash_e49591b611e235c5";
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
        level.var_44bf7e31237b3073[%"hash_a9cfb96b687ee04"] = &function_ecf17a96e49ab67;
        return;
    }
    level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
}

// Namespace namespace_2e95a4b6544e01a9 / namespace_16a63bcff8a84289
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d1
// Size: 0xc0
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "civilian_react_loco";
    self.voice = #"hash_56d2a75e94b008ce";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self function_6b0082dec4510b24("bodies_civilian_asm_female_5", namespace_d85305d988e4fe98::main());
    self attach("head_sc_f_eghbali_hair_bg", "", 1);
    self.headmodel = "head_sc_f_eghbali_hair_bg";
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_2e95a4b6544e01a9 / namespace_16a63bcff8a84289
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x299
// Size: 0x2
function precache() {
    
}

// Namespace namespace_2e95a4b6544e01a9 / namespace_16a63bcff8a84289
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a3
// Size: 0x21
function precache_sp() {
    precache();
    scripts\code\character::precachemodelarray(namespace_d85305d988e4fe98::main());
    precachemodel("head_sc_f_eghbali_hair_bg");
}

// Namespace namespace_2e95a4b6544e01a9 / namespace_16a63bcff8a84289
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2cc
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_2e95a4b6544e01a9 / namespace_16a63bcff8a84289
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2dd
// Size: 0x36
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_331b214a38c31f04":
        return namespace_d85305d988e4fe98::main();
    }
    assert(0, "character_civilian_ams_female_5 do not have any xmodelalias");
}

