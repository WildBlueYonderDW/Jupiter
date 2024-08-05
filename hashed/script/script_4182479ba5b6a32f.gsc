#using scripts\common\utility.gsc;
#using scripts\code\character.gsc;
#using script_6ced1d7c418e7c80;

#namespace namespace_781039051b22c13f;

// Namespace namespace_781039051b22c13f / namespace_464d63e23897e5df
// Params 0, eflags: 0x5
// Checksum 0x0, Offset: 0x11b
// Size: 0xb3
function private autoexec init() {
    character = #"hash_5c65f06f33d09d43";
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
        level.var_44bf7e31237b3073[%"hash_37bdbbb7ceb39f9e"] = &function_ecf17a96e49ab67;
        return;
    }
    level.var_7d97144daa7995cd[character] = &function_8168fbf6282d398b;
}

// Namespace namespace_781039051b22c13f / namespace_464d63e23897e5df
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d6
// Size: 0xab
function main() {
    level.var_7d97144daa7995cd = undefined;
    self.animationarchetype = "soldier";
    self.voice = #"russian";
    self.bhasthighholster = 0;
    self.animtree = "generic_human";
    self setmodel("body_c_jup_sp_enemy_kastovsoldier_02");
    scripts\code\character::attachhead("heads_jup_sp_enemy_kastovsoldier_01", namespace_20c1df75ba8fd17c::main());
    self setclothtype(#"vestlight");
    self function_8abe5a968cc3c220(#"millghtgr");
    self function_1863f51c1339d80f(#"none");
    if (issentient(self)) {
        self sethitlocdamagetable(%"hash_635afa6edffbf00b");
    }
}

// Namespace namespace_781039051b22c13f / namespace_464d63e23897e5df
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x289
// Size: 0x2
function precache() {
    
}

// Namespace namespace_781039051b22c13f / namespace_464d63e23897e5df
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x293
// Size: 0x21
function precache_sp() {
    precache();
    precachemodel("body_c_jup_sp_enemy_kastovsoldier_02");
    scripts\code\character::precachemodelarray(namespace_20c1df75ba8fd17c::main());
}

// Namespace namespace_781039051b22c13f / namespace_464d63e23897e5df
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2bc
// Size: 0x9
function function_8168fbf6282d398b() {
    precache();
}

// Namespace namespace_781039051b22c13f / namespace_464d63e23897e5df
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2cd
// Size: 0x36
function function_ecf17a96e49ab67(xmodelalias) {
    switch (xmodelalias) {
    case #"hash_de3b73cd07d55560": 
        return namespace_20c1df75ba8fd17c::main();
    }
    assert(0, "c_jup_sp_enemy_kastovsoldier_02 do not have any xmodelalias");
}

