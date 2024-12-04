#using script_4552ed34d8c7e713;
#using scripts\code\character;
#using scripts\common\utility;

#namespace namespace_58ab8c863bad9553;

// Namespace namespace_58ab8c863bad9553 / namespace_fd967f366fcfae33
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x11f
// Size: 0xb3
function private autoexec init() {
    character = #"hash_669f6307a4b0acf7";
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
        level.var_44bf7e31237b3073[%"hash_6fdc602242b62a52"] = &function_ecf17a96e49ab67;
        return;
    }
    level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
}

// Namespace namespace_58ab8c863bad9553 / namespace_fd967f366fcfae33
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1da
// Size: 0xab
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "farah";
    self.voice = #"russianfemale";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_hero_laswell_bdu");
    scripts\code\character::attachhead("heads_jup_sp_enemy_kastovsoldier_female", namespace_aeebbe0dee045467::main());
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_58ab8c863bad9553 / namespace_fd967f366fcfae33
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x28d
// Size: 0x2
function precache() {
    
}

// Namespace namespace_58ab8c863bad9553 / namespace_fd967f366fcfae33
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x297
// Size: 0x21
function precache_sp() {
    precache();
    precachemodel("body_c_jup_sp_hero_laswell_bdu");
    scripts\code\character::precachemodelarray(namespace_aeebbe0dee045467::main());
}

// Namespace namespace_58ab8c863bad9553 / namespace_fd967f366fcfae33
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c0
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_58ab8c863bad9553 / namespace_fd967f366fcfae33
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d1
// Size: 0x36
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_1f13018c0ea66403":
        return namespace_aeebbe0dee045467::main();
    }
    assert(0, "c_jup_sp_enemy_kastovsoldier_female_bdu do not have any xmodelalias");
}

