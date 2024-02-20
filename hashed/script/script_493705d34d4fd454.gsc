// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_38eb8f4be20d54f4;
#using script_427ce33ec0c820cf;
#using script_16ea1b94f0f381b3;

#namespace namespace_6ebde2ec08cdccc3;

// Namespace namespace_6ebde2ec08cdccc3/namespace_98a2bf08dffe8c76
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x13d
// Size: 0x27
function autoexec main() {
    if (getdvarint(@"hash_413fd1c1e39153e6", 0)) {
        return;
    }
    init();
    /#
        function_172af363664b6357();
    #/
}

// Namespace namespace_6ebde2ec08cdccc3/namespace_98a2bf08dffe8c76
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16b
// Size: 0x19
function init() {
    powerups::register_powerup("zombie_vision", &powerup_grab, &function_3be4188976ad0fe9);
}

// Namespace namespace_6ebde2ec08cdccc3/namespace_98a2bf08dffe8c76
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18b
// Size: 0x74
function powerup_grab(str_powerup, var_4d44d70760d7ad71) {
    a_players = function_a56a8b17eae57b09(str_powerup);
    foreach (player in a_players) {
        player thread powerup_apply_zombie_vision();
    }
}

// Namespace namespace_6ebde2ec08cdccc3/namespace_98a2bf08dffe8c76
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x206
// Size: 0x5
function function_3be4188976ad0fe9() {
    return 1;
}

// Namespace namespace_6ebde2ec08cdccc3/namespace_98a2bf08dffe8c76
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x213
// Size: 0x8f
function powerup_apply_zombie_vision(var_5ed2ffb8d01c0e35) {
    self notify("powerup_apply_zombie_vision");
    self endon("powerup_apply_zombie_vision");
    self endon("disconnect");
    if (!isdefined(var_5ed2ffb8d01c0e35)) {
        var_5ed2ffb8d01c0e35 = powerups::function_e419d148895ea689("zombie_vision");
    }
    thread namespace_2b1145f62aa835b8::function_a93fbc5ac33fc2f2("zombie_vision", var_5ed2ffb8d01c0e35);
    if (!istrue(self.var_102ec59851028077)) {
        self.var_102ec59851028077 = 1;
        namespace_2b1145f62aa835b8::function_5942f6cdbb6cb63b("specialty_zombie_vision");
        thread function_569121dd947653d1();
        thread function_f20d37117a98d4a8();
    }
    waittill_any_timeout_2(var_5ed2ffb8d01c0e35, "end_powerup_zombie_vision", "death");
    powerup_remove_zombie_vision();
}

// Namespace namespace_6ebde2ec08cdccc3/namespace_98a2bf08dffe8c76
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a9
// Size: 0x21
function powerup_remove_zombie_vision() {
    self notify("powerup_remove_zombie_vision");
    namespace_2b1145f62aa835b8::function_edbac3224d97a666("specialty_zombie_vision");
    self.var_102ec59851028077 = undefined;
}

// Namespace namespace_6ebde2ec08cdccc3/namespace_98a2bf08dffe8c76
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d1
// Size: 0x34
function function_569121dd947653d1() {
    self endon("powerup_remove_zombie_vision");
    self endon("death_or_disconnect");
    while (self.var_102ec59851028077) {
        self waittill("giveLoadout");
        namespace_2b1145f62aa835b8::function_5942f6cdbb6cb63b("specialty_zombie_vision");
    }
}

// Namespace namespace_6ebde2ec08cdccc3/namespace_98a2bf08dffe8c76
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30c
// Size: 0x21
function function_f20d37117a98d4a8() {
    self endon("powerup_remove_zombie_vision");
    self endon("death_or_disconnect");
    level waittill("game_ended");
    self notify("end_powerup_zombie_vision");
}

// Namespace namespace_6ebde2ec08cdccc3/namespace_98a2bf08dffe8c76
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x334
// Size: 0x5d
function function_172af363664b6357() {
    /#
        function_6e7290c8ee4f558b("<unknown string>");
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>" + "<unknown string>", &function_e2b8eeccc951133f);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>" + "<unknown string>", &function_e2b8eeccc951133f);
        function_fe953f000498048f();
    #/
}

