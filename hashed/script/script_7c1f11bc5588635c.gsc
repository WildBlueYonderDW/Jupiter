// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_639bf783929acf9b;
#using script_38eb8f4be20d54f4;
#using script_398835140857d740;
#using scripts\mp\utility\dvars.gsc;

#namespace perk_deadshot;

// Namespace perk_deadshot/namespace_5a0b98fe4ff33cb6
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb3
// Size: 0x45
function function_d87a1d30e15f1c8b(var_1df6de077e30f8c2, var_fe59c44529c721a0) {
    n_perk_cost = function_53c4c53197386572(var_fe59c44529c721a0, 2000);
    level thread function_f3a23df892bf82f6("specialty_deadshot", var_1df6de077e30f8c2, n_perk_cost, &give_deadshot_perk, &take_deadshot_perk, 1);
}

// Namespace perk_deadshot/namespace_5a0b98fe4ff33cb6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xff
// Size: 0x42
function give_deadshot_perk() {
    function_ab7a3ff9f75e4867("specialty_deadshot");
    var_985ea103b97c8abb = level.var_a1ad2758fcbd2f5e["specialty_deadshot"].var_fee1a408c2a3d2d7;
    if (isdefined(var_985ea103b97c8abb)) {
        self.var_ae9b30f13abd35fc = var_985ea103b97c8abb;
    }
}

// Namespace perk_deadshot/namespace_5a0b98fe4ff33cb6
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x148
// Size: 0x35
function take_deadshot_perk(b_pause, str_perk, str_result, n_slot) {
    function_888a7004c6bd50e9();
    self.var_ae9b30f13abd35fc = undefined;
}

// Namespace perk_deadshot/namespace_5a0b98fe4ff33cb6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x184
// Size: 0xf
function function_888a7004c6bd50e9() {
    function_fe0d28e6f0008329("specialty_deadshot");
}

