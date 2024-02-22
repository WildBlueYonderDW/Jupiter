// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_38eb8f4be20d54f4;
#using script_427ce33ec0c820cf;
#using script_16ea1b94f0f381b3;

#namespace namespace_bc54067d6ff4359f;

// Namespace namespace_bc54067d6ff4359f/namespace_a8ba85f06b284610
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x115
// Size: 0x27
function autoexec main() {
    if (getdvarint(@"hash_dbc6d8d6c1d66b97", 0)) {
        return;
    }
    init();
    /#
        function_172af363664b6357();
    #/
}

// Namespace namespace_bc54067d6ff4359f/namespace_a8ba85f06b284610
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x143
// Size: 0x19
function init() {
    powerups::register_powerup("fire_sale", &powerup_grab, &function_3be4188976ad0fe9);
}

// Namespace namespace_bc54067d6ff4359f/namespace_a8ba85f06b284610
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x163
// Size: 0x39
function function_3be4188976ad0fe9() {
    should_drop = 1;
    if (utility::issharedfuncdefined("game", "isPublicEventOfTypeActive")) {
        should_drop = !utility::function_f3bb4f4911a1beb2("game", "isPublicEventOfTypeActive", 2);
    }
    return should_drop;
}

// Namespace namespace_bc54067d6ff4359f/namespace_a8ba85f06b284610
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a4
// Size: 0x74
function powerup_grab(str_powerup, var_4d44d70760d7ad71) {
    var_2db8e0791ae6b435 = function_a56a8b17eae57b09(str_powerup);
    foreach (player in var_2db8e0791ae6b435) {
        player thread powerup_apply_firesale();
    }
}

// Namespace namespace_bc54067d6ff4359f/namespace_a8ba85f06b284610
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21f
// Size: 0x72
function powerup_apply_firesale(var_5ed2ffb8d01c0e35) {
    self notify("powerup_apply_firesale");
    self endon("powerup_apply_firesale");
    self endon("disconnect");
    level endon("game_ended");
    self.var_f33cc04cfb0810b7 = 1;
    if (!isdefined(var_5ed2ffb8d01c0e35)) {
        var_5ed2ffb8d01c0e35 = powerups::function_e419d148895ea689("fire_sale");
    }
    thread namespace_2b1145f62aa835b8::function_a93fbc5ac33fc2f2("fire_sale", var_5ed2ffb8d01c0e35);
    waittill_any_timeout_3(var_5ed2ffb8d01c0e35, "end_powerup_firesale", "death", "public_event_firesale_start");
    function_71799de3b1ba25c2();
}

// Namespace namespace_bc54067d6ff4359f/namespace_a8ba85f06b284610
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x298
// Size: 0x15
function function_71799de3b1ba25c2() {
    self.var_f33cc04cfb0810b7 = 0;
    self notify("end_powerup_firesale");
}

// Namespace namespace_bc54067d6ff4359f/namespace_a8ba85f06b284610
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b4
// Size: 0x5d
function function_172af363664b6357() {
    /#
        function_6e7290c8ee4f558b("<unknown string>");
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>" + "<unknown string>", &function_e2b8eeccc951133f);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>" + "<unknown string>" + "<unknown string>", &function_e2b8eeccc951133f);
        function_fe953f000498048f();
    #/
}

