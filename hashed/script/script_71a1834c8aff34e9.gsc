// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_38eb8f4be20d54f4;
#using script_427ce33ec0c820cf;
#using script_16ea1b94f0f381b3;

#namespace namespace_1a845dbb8250fda6;

// Namespace namespace_1a845dbb8250fda6/namespace_6aa38109e829c5b
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x128
// Size: 0x27
function autoexec main() {
    if (getdvarint(@"hash_e57295eeedbf41eb", 0)) {
        return;
    }
    init();
    /#
        function_172af363664b6357();
    #/
}

// Namespace namespace_1a845dbb8250fda6/namespace_6aa38109e829c5b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x156
// Size: 0x19
function init() {
    powerups::register_powerup("zombie_legs", &powerup_grab, &function_3be4188976ad0fe9);
}

// Namespace namespace_1a845dbb8250fda6/namespace_6aa38109e829c5b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x176
// Size: 0x74
function powerup_grab(str_powerup, var_4d44d70760d7ad71) {
    a_players = function_a56a8b17eae57b09(str_powerup);
    foreach (player in a_players) {
        player thread powerup_apply_zombie_legs();
    }
}

// Namespace namespace_1a845dbb8250fda6/namespace_6aa38109e829c5b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f1
// Size: 0x5
function function_3be4188976ad0fe9() {
    return 1;
}

// Namespace namespace_1a845dbb8250fda6/namespace_6aa38109e829c5b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fe
// Size: 0x87
function powerup_apply_zombie_legs(var_5ed2ffb8d01c0e35) {
    self notify("powerup_apply_zombie_legs");
    self endon("powerup_apply_zombie_legs");
    self endon("disconnect");
    if (!isdefined(var_5ed2ffb8d01c0e35)) {
        var_5ed2ffb8d01c0e35 = powerups::function_e419d148895ea689("zombie_legs");
    }
    thread namespace_2b1145f62aa835b8::function_a93fbc5ac33fc2f2("zombie_legs", var_5ed2ffb8d01c0e35);
    if (!istrue(self.var_9ee4330fe38ffc6)) {
        self.var_9ee4330fe38ffc6 = 1;
        namespace_2b1145f62aa835b8::function_5942f6cdbb6cb63b("specialty_zombie_legs");
        thread function_569121dd947653d1();
    }
    waittill_any_timeout_2(var_5ed2ffb8d01c0e35, "end_powerup_zombie_legs", "death");
    powerup_remove_zombie_legs();
}

// Namespace namespace_1a845dbb8250fda6/namespace_6aa38109e829c5b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28c
// Size: 0x21
function powerup_remove_zombie_legs() {
    self notify("powerup_remove_zombie_legs");
    namespace_2b1145f62aa835b8::function_edbac3224d97a666("specialty_zombie_legs");
    self.var_9ee4330fe38ffc6 = undefined;
}

// Namespace namespace_1a845dbb8250fda6/namespace_6aa38109e829c5b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b4
// Size: 0x34
function function_569121dd947653d1() {
    self endon("powerup_remove_zombie_legs");
    self endon("death_or_disconnect");
    while (self.var_9ee4330fe38ffc6) {
        self waittill("giveLoadout");
        namespace_2b1145f62aa835b8::function_5942f6cdbb6cb63b("specialty_zombie_legs");
    }
}

// Namespace namespace_1a845dbb8250fda6/namespace_6aa38109e829c5b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ef
// Size: 0x5d
function function_172af363664b6357() {
    /#
        function_6e7290c8ee4f558b("<unknown string>");
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>" + "<unknown string>", &function_e2b8eeccc951133f);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>" + "<unknown string>", &function_e2b8eeccc951133f);
        function_fe953f000498048f();
    #/
}

