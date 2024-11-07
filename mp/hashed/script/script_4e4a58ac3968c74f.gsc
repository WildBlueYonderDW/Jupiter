#using scripts\engine\utility.gsc;
#using scripts\common\devgui.gsc;
#using script_3a9930dfe832ae05;
#using scripts\common\powerups.gsc;
#using scripts\mp\supers.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\mp\utility\perk.gsc;

#namespace full_power;

// Namespace full_power / namespace_d995ded4d440ccf7
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x125
// Size: 0x9
function autoexec main() {
    function_e7a47b85d23dfd4f();
}

// Namespace full_power / namespace_d995ded4d440ccf7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x136
// Size: 0x5a
function function_e7a47b85d23dfd4f() {
    register_powerup("full_power", &function_96a1ada875ea9db3, &function_986227ff88aed0d1);
    /#
        function_6e7290c8ee4f558b("<dev string:x1c>");
        function_b23a59dfb4ca49a1("<dev string:x2f>", "<dev string:x4f>", &function_e2b8eeccc951133f);
        function_b23a59dfb4ca49a1("<dev string:x73>", "<dev string:x93>", &function_e2b8eeccc951133f);
        function_fe953f000498048f();
    #/
}

// Namespace full_power / namespace_d995ded4d440ccf7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x198
// Size: 0x13
function function_986227ff88aed0d1() {
    if (istrue(level.var_44c84134585ab85b)) {
        return true;
    }
    return false;
}

// Namespace full_power / namespace_d995ded4d440ccf7
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1b4
// Size: 0x82
function function_96a1ada875ea9db3(str_powerup, ent_powerup) {
    a_players = function_a56a8b17eae57b09(str_powerup);
    foreach (player in a_players) {
        player give_power();
        player thread function_676437737684783f(str_powerup);
    }
    level notify("zmb_full_power_level");
}

// Namespace full_power / namespace_d995ded4d440ccf7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x23e
// Size: 0xd0
function give_power() {
    s_super = getcurrentsuper();
    if (!isalive(self) || !isdefined(s_super)) {
        return;
    }
    superinfo = getcurrentsuper();
    if (isdefined(s_super) && s_super.isinuse) {
        callback::add("on_super_use_finished", &on_super_use_finished);
        return;
    }
    points_needed = 0;
    var_955d46d1430e96e1 = issuperready();
    if (!var_955d46d1430e96e1) {
        points_needed = getsuperpointsneeded() - getcurrentsuperpoints();
    }
    if (scripts\mp\utility\perk::_hasperk("specialty_overcharge_field_upgrade")) {
        var_5155bc50f8bd32c2 = function_6c06220f8b5b7079();
        if (var_955d46d1430e96e1 && !var_5155bc50f8bd32c2) {
            points_needed = getsuperpointsneeded() - self.overclockcharge;
        }
    }
    if (points_needed != 0) {
        givesuperpoints(points_needed);
    }
}

// Namespace full_power / namespace_d995ded4d440ccf7
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x316
// Size: 0x2c
function private on_super_use_finished(params) {
    if (isalive(self)) {
        give_power();
        callback::remove("on_super_use_finished", &on_super_use_finished);
    }
}

