#using scripts\engine\utility.gsc;
#using scripts\common\devgui.gsc;
#using scripts\common\powerups.gsc;
#using script_16ea1b94f0f381b3;

#namespace powerup_firesale;

// Namespace powerup_firesale / namespace_a8ba85f06b284610
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x115
// Size: 0x26
function autoexec main() {
    if (getdvarint(@"hash_dbc6d8d6c1d66b97", 0)) {
        return;
    }
    init();
    /#
        init_debug();
    #/
}

// Namespace powerup_firesale / namespace_a8ba85f06b284610
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x143
// Size: 0x18
function init() {
    powerups::register_powerup("fire_sale", &powerup_grab, &function_3be4188976ad0fe9);
}

// Namespace powerup_firesale / namespace_a8ba85f06b284610
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x163
// Size: 0x38
function function_3be4188976ad0fe9() {
    should_drop = 1;
    if (utility::issharedfuncdefined("game", "isPublicEventOfTypeActive")) {
        should_drop = !utility::function_f3bb4f4911a1beb2("game", "isPublicEventOfTypeActive", 2);
    }
    return should_drop;
}

// Namespace powerup_firesale / namespace_a8ba85f06b284610
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a4
// Size: 0x73
function powerup_grab(str_powerup, ent_powerup) {
    var_2db8e0791ae6b435 = function_a56a8b17eae57b09(str_powerup);
    foreach (player in var_2db8e0791ae6b435) {
        player thread powerup_apply_firesale();
    }
}

// Namespace powerup_firesale / namespace_a8ba85f06b284610
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21f
// Size: 0x71
function powerup_apply_firesale(n_lifetime) {
    self notify("powerup_apply_firesale");
    self endon("powerup_apply_firesale");
    self endon("disconnect");
    level endon("game_ended");
    self.var_f33cc04cfb0810b7 = 1;
    if (!isdefined(n_lifetime)) {
        n_lifetime = powerups::function_e419d148895ea689("fire_sale");
    }
    thread namespace_2b1145f62aa835b8::function_a93fbc5ac33fc2f2("fire_sale", n_lifetime);
    waittill_any_timeout_3(n_lifetime, "end_powerup_firesale", "death", "public_event_firesale_start");
    function_71799de3b1ba25c2();
}

// Namespace powerup_firesale / namespace_a8ba85f06b284610
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x298
// Size: 0x14
function function_71799de3b1ba25c2() {
    self.var_f33cc04cfb0810b7 = 0;
    self notify("end_powerup_firesale");
}

/#

    // Namespace powerup_firesale / namespace_a8ba85f06b284610
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x2b4
    // Size: 0x5c
    function init_debug() {
        function_6e7290c8ee4f558b("<dev string:x1c>");
        function_b23a59dfb4ca49a1("<dev string:x2c>", "<dev string:x48>" + "<dev string:x5d>" + "<dev string:x67>", &function_e2b8eeccc951133f);
        function_b23a59dfb4ca49a1("<dev string:x6a>", "<dev string:x48>" + "<dev string:x5d>" + "<dev string:x86>", &function_e2b8eeccc951133f);
        function_fe953f000498048f();
    }

#/
