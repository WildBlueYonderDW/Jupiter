#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\callbacks.gsc;
#using script_639bf783929acf9b;
#using scripts\common\devgui.gsc;
#using script_398835140857d740;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\tweakables.gsc;

#namespace perk_juggernaut;

// Namespace perk_juggernaut / namespace_7177e11e3871c8f4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x111
// Size: 0x49
function function_1ddcb2ee8addbf81(str_currency, var_fe59c44529c721a0) {
    level thread function_f3a23df892bf82f6("specialty_juggernog", str_currency, var_fe59c44529c721a0, &function_7e973f95d6043eb2, &function_1b6b6e760a1bdd78);
    registerwatchdvarint("zombie_perk_juggernaut_health", 100);
    registerwatchdvarint("zombie_perk_juggernaut_health_upgrade", 150);
}

// Namespace perk_juggernaut / namespace_7177e11e3871c8f4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x162
// Size: 0x2
function init_juggernaut() {
    
}

// Namespace perk_juggernaut / namespace_7177e11e3871c8f4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16c
// Size: 0x2
function function_ab290f15db86a2ed() {
    
}

// Namespace perk_juggernaut / namespace_7177e11e3871c8f4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x176
// Size: 0xb
function function_fab58c7ac85ad7ac(state) {
    
}

// Namespace perk_juggernaut / namespace_7177e11e3871c8f4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x189
// Size: 0x9
function function_7e973f95d6043eb2() {
    function_c01376485eb8f25();
}

// Namespace perk_juggernaut / namespace_7177e11e3871c8f4
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19a
// Size: 0x2a
function function_1b6b6e760a1bdd78(b_pause, str_perk, str_result, n_slot) {
    function_74553dbfe828d843();
}

// Namespace perk_juggernaut / namespace_7177e11e3871c8f4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cc
// Size: 0x58
function function_c01376485eb8f25() {
    bundle = level.perkbundles["specialty_juggernog"];
    var_f90e40839311224 = self.maxhealth + bundle.var_e60d66d03350bc81;
    self.maxhealth = var_f90e40839311224;
    self.health = self.maxhealth;
}

// Namespace perk_juggernaut / namespace_7177e11e3871c8f4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22c
// Size: 0x31
function function_74553dbfe828d843() {
    var_f90e40839311224 = scripts\mp\tweakables::gettweakablevalue("player", "maxhealth");
    self.maxhealth = var_f90e40839311224;
    self.health = var_f90e40839311224;
}

