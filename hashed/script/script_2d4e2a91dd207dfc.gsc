// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_38eb8f4be20d54f4;
#using script_3a9930dfe832ae05;
#using script_427ce33ec0c820cf;
#using script_1cf7605e6d68c130;

#namespace fire_sale;

// Namespace fire_sale/namespace_879aca5fca52f0b2
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0xdf
// Size: 0xa
function autoexec main() {
    function_3eca05f9ae1998ea();
}

// Namespace fire_sale/namespace_879aca5fca52f0b2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf0
// Size: 0x5b
function function_3eca05f9ae1998ea() {
    register_powerup("fire_sale", &grab_fire_sale, &function_c68bab44a377354f);
    /#
        function_6e7290c8ee4f558b("<unknown string>");
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_e2b8eeccc951133f);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_e2b8eeccc951133f);
        function_fe953f000498048f();
    #/
}

// Namespace fire_sale/namespace_879aca5fca52f0b2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x152
// Size: 0x34
function function_c68bab44a377354f() {
    if (flag("magicbox_moving") || flag("powerup_fire_sale_active") || level.var_75e032c5035207fe < 1) {
        return 0;
    }
    return 1;
}

// Namespace fire_sale/namespace_879aca5fca52f0b2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18e
// Size: 0x1c
function grab_fire_sale(str_powerup, var_4d44d70760d7ad71) {
    thread run_fire_sale();
}

// Namespace fire_sale/namespace_879aca5fca52f0b2
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b1
// Size: 0xfe
function run_fire_sale() {
    level notify("run_fire_sale");
    level endon("run_fire_sale");
    flag_set("powerup_fire_sale_active");
    level thread namespace_c6e8089e2a23087e::function_52706d80d64ea5f1();
    root = function_ecdae672c660149e();
    var_5ed2ffb8d01c0e35 = root.powerups["fire_sale"].var_f862e718db266e0a;
    if (isdefined(level.var_6680bed8f52bbd1c)) {
        var_5ed2ffb8d01c0e35 = self [[ level.var_6680bed8f52bbd1c ]](var_5ed2ffb8d01c0e35);
    }
    a_players = function_a56a8b17eae57b09("fire_sale");
    foreach (player in a_players) {
        player thread function_676437737684783f("fire_sale", var_5ed2ffb8d01c0e35);
    }
    level waittill_any_timeout_1(var_5ed2ffb8d01c0e35, "end_fire_sale");
    flag_clear("powerup_fire_sale_active");
}

