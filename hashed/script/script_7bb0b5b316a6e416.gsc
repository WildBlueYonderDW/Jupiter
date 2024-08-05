#using scripts\common\utility.gsc;
#using scripts\code\character.gsc;
#using script_6ec4219070f94f19;

#namespace namespace_2e61913aad60bd0c;

// Namespace namespace_2e61913aad60bd0c / namespace_340b358275ffbc2c
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x11d
// Size: 0xb3
function private autoexec init() {
    character = #"hash_d1e5abf50b896ee0";
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
        level.var_44bf7e31237b3073[%"hash_6b0fe7543b4115ef"] = &function_ecf17a96e49ab67;
        return;
    }
    level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
}

// Namespace namespace_2e61913aad60bd0c / namespace_340b358275ffbc2c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d8
// Size: 0xac
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"russian";
    self.bhasthighholster = 1;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_enemy_kastovsoldier_05d");
    scripts\code\character::attachhead("heads_jup_sp_enemy_kastovsoldier_02", namespace_20c1e275ba8fd815::main());
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_2e61913aad60bd0c / namespace_340b358275ffbc2c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28c
// Size: 0x2
function precache() {
    
}

// Namespace namespace_2e61913aad60bd0c / namespace_340b358275ffbc2c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x296
// Size: 0x21
function precache_sp() {
    precache();
    precachemodel("body_c_jup_sp_enemy_kastovsoldier_05d");
    scripts\code\character::precachemodelarray(namespace_20c1e275ba8fd815::main());
}

// Namespace namespace_2e61913aad60bd0c / namespace_340b358275ffbc2c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2bf
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_2e61913aad60bd0c / namespace_340b358275ffbc2c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d0
// Size: 0x36
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_de3b76cd07d55a19": 
        return namespace_20c1e275ba8fd815::main();
    }
    assert(0, "c_jup_sp_enemy_kastovsoldier_05b do not have any xmodelalias");
}

