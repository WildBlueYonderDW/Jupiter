#using scripts\engine\utility.gsc;
#using scripts\common\devgui.gsc;
#using script_3a9930dfe832ae05;
#using scripts\common\powerups.gsc;
#using script_1cf7605e6d68c130;

#namespace fire_sale;

// Namespace fire_sale / namespace_879aca5fca52f0b2
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0xdf
// Size: 0x9
function autoexec main() {
    function_3eca05f9ae1998ea();
}

// Namespace fire_sale / namespace_879aca5fca52f0b2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf0
// Size: 0x5a
function function_3eca05f9ae1998ea() {
    register_powerup("fire_sale", &grab_fire_sale, &function_c68bab44a377354f);
    /#
        function_6e7290c8ee4f558b("<dev string:x1c>");
        function_b23a59dfb4ca49a1("<dev string:x2c>", "<dev string:x48>", &function_e2b8eeccc951133f);
        function_b23a59dfb4ca49a1("<dev string:x68>", "<dev string:x84>", &function_e2b8eeccc951133f);
        function_fe953f000498048f();
    #/
}

// Namespace fire_sale / namespace_879aca5fca52f0b2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x152
// Size: 0x33
function function_c68bab44a377354f() {
    if (flag("magicbox_moving") || flag("powerup_fire_sale_active") || level.var_75e032c5035207fe < 1) {
        return false;
    }
    return true;
}

// Namespace fire_sale / namespace_879aca5fca52f0b2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18e
// Size: 0x1b
function grab_fire_sale(str_powerup, ent_powerup) {
    thread run_fire_sale();
}

// Namespace fire_sale / namespace_879aca5fca52f0b2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b1
// Size: 0xfd
function run_fire_sale() {
    level notify("run_fire_sale");
    level endon("run_fire_sale");
    flag_set("powerup_fire_sale_active");
    level thread namespace_c6e8089e2a23087e::firesale_start();
    root = function_ecdae672c660149e();
    n_lifetime = root.powerups["fire_sale"].var_f862e718db266e0a;
    if (isdefined(level.powerup_timeout_override)) {
        n_lifetime = self [[ level.powerup_timeout_override ]](n_lifetime);
    }
    a_players = function_a56a8b17eae57b09("fire_sale");
    foreach (player in a_players) {
        player thread function_676437737684783f("fire_sale", n_lifetime);
    }
    level waittill_any_timeout_1(n_lifetime, "end_fire_sale");
    flag_clear("powerup_fire_sale_active");
}

