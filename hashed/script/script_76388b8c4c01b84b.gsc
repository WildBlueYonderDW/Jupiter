// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_38eb8f4be20d54f4;
#using script_3a9930dfe832ae05;
#using script_427ce33ec0c820cf;
#using script_16ea1b94f0f381b3;

#namespace double_points;

// Namespace double_points/namespace_64ac970ecb9e73c9
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x11b
// Size: 0x1d
function autoexec main() {
    if (getdvarint(@"hash_6a3719fb3017314", 0)) {
        return;
    }
    function_8680030b255bf011();
}

// Namespace double_points/namespace_64ac970ecb9e73c9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13f
// Size: 0x5f
function function_8680030b255bf011(var_40708f9ae5a8070e) {
    register_powerup("double_points", &grab_double_points);
    /#
        function_6e7290c8ee4f558b("<unknown string>");
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_e2b8eeccc951133f);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_e2b8eeccc951133f);
        function_fe953f000498048f();
    #/
}

// Namespace double_points/namespace_64ac970ecb9e73c9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a5
// Size: 0x7c
function grab_double_points(str_powerup, var_4d44d70760d7ad71) {
    a_players = function_a56a8b17eae57b09(str_powerup);
    foreach (player in a_players) {
        player thread function_44e15a446f4d00a9();
    }
    level notify("zmb_double_points_level");
}

// Namespace double_points/namespace_64ac970ecb9e73c9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x228
// Size: 0xce
function function_44e15a446f4d00a9() {
    self notify("powerup doublepoints_active");
    self endon("powerup doublepoints_active");
    root = function_ecdae672c660149e();
    self [[ root.var_40708f9ae5a8070e ]](2);
    utility::function_f3bb4f4911a1beb2("powerup_double_points", "apply_effect");
    var_5ed2ffb8d01c0e35 = root.powerups["double_points"].var_f862e718db266e0a;
    if (isdefined(level.var_6680bed8f52bbd1c)) {
        var_5ed2ffb8d01c0e35 = self [[ level.var_6680bed8f52bbd1c ]](var_5ed2ffb8d01c0e35);
    }
    thread namespace_2b1145f62aa835b8::function_a93fbc5ac33fc2f2("double_points", var_5ed2ffb8d01c0e35);
    waittill_any_timeout_2(var_5ed2ffb8d01c0e35, "end_double_points", "death");
    if (isdefined(self)) {
        self [[ root.var_40708f9ae5a8070e ]](1);
        utility::function_f3bb4f4911a1beb2("powerup_double_points", "remove_effect");
    }
}

