// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_38eb8f4be20d54f4;
#using script_3a9930dfe832ae05;
#using script_427ce33ec0c820cf;
#using scripts\mp\supers.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\mp\utility\perk.gsc;

#namespace full_power;

// Namespace full_power/namespace_d995ded4d440ccf7
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0xf9
// Size: 0xa
function autoexec main() {
    function_e7a47b85d23dfd4f();
}

// Namespace full_power/namespace_d995ded4d440ccf7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10a
// Size: 0x5b
function function_e7a47b85d23dfd4f() {
    register_powerup("full_power", &function_96a1ada875ea9db3, &function_986227ff88aed0d1);
    /#
        function_6e7290c8ee4f558b("<unknown string>");
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_e2b8eeccc951133f);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_e2b8eeccc951133f);
        function_fe953f000498048f();
    #/
}

// Namespace full_power/namespace_d995ded4d440ccf7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16c
// Size: 0x14
function function_986227ff88aed0d1() {
    if (istrue(level.var_44c84134585ab85b)) {
        return 1;
    }
    return 0;
}

// Namespace full_power/namespace_d995ded4d440ccf7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x188
// Size: 0x85
function function_96a1ada875ea9db3(str_powerup, var_4d44d70760d7ad71) {
    a_players = function_a56a8b17eae57b09(str_powerup);
    foreach (player in a_players) {
        player function_b1de82c3599f94ee();
        player thread function_676437737684783f(str_powerup);
    }
    level notify("zmb_full_power_level");
}

// Namespace full_power/namespace_d995ded4d440ccf7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x214
// Size: 0xd4
function function_b1de82c3599f94ee() {
    var_5ffe26e8d50879f6 = getcurrentsuper();
    if (!isalive(self) || !isdefined(var_5ffe26e8d50879f6)) {
        return;
    }
    var_19163e14365d9264 = getcurrentsuper();
    if (isdefined(var_5ffe26e8d50879f6) && var_5ffe26e8d50879f6.isinuse) {
        callback::add("on_super_use_finished", &on_super_use_finished);
        return;
    }
    var_b8e9912eab0b1422 = 0;
    var_955d46d1430e96e1 = issuperready();
    if (!var_955d46d1430e96e1) {
        var_b8e9912eab0b1422 = getsuperpointsneeded() - getcurrentsuperpoints();
    }
    if (namespace_82dcd1d5ae30ff7::_hasperk("specialty_overcharge_field_upgrade")) {
        var_5155bc50f8bd32c2 = function_6c06220f8b5b7079();
        if (var_955d46d1430e96e1 && !var_5155bc50f8bd32c2) {
            var_b8e9912eab0b1422 = getsuperpointsneeded() - self.var_a68b289a82138067;
        }
    }
    if (var_b8e9912eab0b1422 != 0) {
        givesuperpoints(var_b8e9912eab0b1422);
    }
}

// Namespace full_power/namespace_d995ded4d440ccf7
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2ef
// Size: 0x2d
function private on_super_use_finished(params) {
    if (isalive(self)) {
        function_b1de82c3599f94ee();
        callback::remove("on_super_use_finished", &on_super_use_finished);
    }
}

