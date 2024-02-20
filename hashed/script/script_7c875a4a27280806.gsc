// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_639bf783929acf9b;
#using script_38eb8f4be20d54f4;
#using script_398835140857d740;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\tweakables.gsc;

#namespace namespace_6b5a8728ab049d92;

// Namespace namespace_6b5a8728ab049d92/namespace_7177e11e3871c8f4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x111
// Size: 0x4a
function function_1ddcb2ee8addbf81(var_1df6de077e30f8c2, var_fe59c44529c721a0) {
    level thread function_f3a23df892bf82f6("specialty_juggernog", var_1df6de077e30f8c2, var_fe59c44529c721a0, &function_7e973f95d6043eb2, &function_1b6b6e760a1bdd78);
    registerwatchdvarint("zombie_perk_juggernaut_health", 100);
    registerwatchdvarint("zombie_perk_juggernaut_health_upgrade", 150);
}

// Namespace namespace_6b5a8728ab049d92/namespace_7177e11e3871c8f4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x162
// Size: 0x3
function function_b29cfe62dbdfd254() {
    
}

// Namespace namespace_6b5a8728ab049d92/namespace_7177e11e3871c8f4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16c
// Size: 0x3
function function_ab290f15db86a2ed() {
    
}

// Namespace namespace_6b5a8728ab049d92/namespace_7177e11e3871c8f4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x176
// Size: 0xc
function function_fab58c7ac85ad7ac(state) {
    
}

// Namespace namespace_6b5a8728ab049d92/namespace_7177e11e3871c8f4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x189
// Size: 0xa
function function_7e973f95d6043eb2() {
    function_c01376485eb8f25();
}

// Namespace namespace_6b5a8728ab049d92/namespace_7177e11e3871c8f4
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19a
// Size: 0x2b
function function_1b6b6e760a1bdd78(b_pause, str_perk, str_result, n_slot) {
    function_74553dbfe828d843();
}

// Namespace namespace_6b5a8728ab049d92/namespace_7177e11e3871c8f4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cc
// Size: 0x59
function function_c01376485eb8f25() {
    bundle = level.var_a1ad2758fcbd2f5e["specialty_juggernog"];
    var_f90e40839311224 = self.maxhealth + bundle.var_e60d66d03350bc81;
    self.maxhealth = var_f90e40839311224;
    self.health = self.maxhealth;
}

// Namespace namespace_6b5a8728ab049d92/namespace_7177e11e3871c8f4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22c
// Size: 0x32
function function_74553dbfe828d843() {
    var_f90e40839311224 = namespace_775507ba36294dfb::gettweakablevalue("player", "maxhealth");
    self.maxhealth = var_f90e40839311224;
    self.health = var_f90e40839311224;
}

