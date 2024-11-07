#using scripts\engine\utility.gsc;
#using scripts\common\devgui.gsc;
#using script_3a9930dfe832ae05;
#using scripts\common\powerups.gsc;
#using script_16ea1b94f0f381b3;
#using script_7c40fa80892a721;

#namespace full_armor;

// Namespace full_armor / namespace_2d90d2cd549eea35
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0xfe
// Size: 0x1c
function autoexec main() {
    if (getdvarint(@"hash_470805a9cd7bcb56", 0)) {
        return;
    }
    function_d5fc5da2613d29dd();
}

// Namespace full_armor / namespace_2d90d2cd549eea35
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x122
// Size: 0x5f
function function_d5fc5da2613d29dd() {
    register_powerup("full_armor", &function_89fc1f6a39554ce9, &function_589539e3a6b1386f, &function_58a4e1d475eb979b);
    /#
        function_6e7290c8ee4f558b("<dev string:x1c>");
        function_b23a59dfb4ca49a1("<dev string:x2f>", "<dev string:x4f>", &function_e2b8eeccc951133f);
        function_b23a59dfb4ca49a1("<dev string:x73>", "<dev string:x93>", &function_e2b8eeccc951133f);
        function_fe953f000498048f();
    #/
}

// Namespace full_armor / namespace_2d90d2cd549eea35
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x189
// Size: 0x81
function function_589539e3a6b1386f() {
    if (utility::issharedfuncdefined("powerup_full_armor", "should_drop")) {
        return utility::function_f3bb4f4911a1beb2("powerup_full_armor", "should_drop");
    }
    foreach (player in level.players) {
        if (istrue(player namespace_f8d3520d3483c1::hasarmor())) {
            return 1;
        }
    }
    return 0;
}

// Namespace full_armor / namespace_2d90d2cd549eea35
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x213
// Size: 0x3a
function function_58a4e1d475eb979b(chance, context) {
    if (utility::issharedfuncdefined("powerup_full_armor", "modify_drop_chance")) {
        return utility::function_f3bb4f4911a1beb2("powerup_full_armor", "modify_drop_chance", chance, context);
    }
    return chance;
}

// Namespace full_armor / namespace_2d90d2cd549eea35
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x256
// Size: 0xcd
function function_89fc1f6a39554ce9(str_powerup, ent_powerup) {
    a_players = function_a56a8b17eae57b09(str_powerup);
    foreach (player in a_players) {
        var_ee96be2201d4d114 = isdefined(player.armorhealth) && isdefined(player.maxarmorhealth) && player.maxarmorhealth > 0;
        if (var_ee96be2201d4d114 && !player namespace_f8d3520d3483c1::function_e47b13babb51a365()) {
            player namespace_f8d3520d3483c1::repair_armor(player.maxarmorhealth);
        }
        player thread namespace_2b1145f62aa835b8::function_a93fbc5ac33fc2f2(str_powerup);
    }
}

