#using scripts\engine\utility.gsc;
#using scripts\common\devgui.gsc;
#using script_3a9930dfe832ae05;
#using scripts\common\powerups.gsc;

#namespace bonus_points_team;

// Namespace bonus_points_team / namespace_4b97861969c14019
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0xe6
// Size: 0x9
function autoexec main() {
    function_e3322035230ef1d7();
}

// Namespace bonus_points_team / namespace_4b97861969c14019
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf7
// Size: 0x55
function function_e3322035230ef1d7() {
    register_powerup("bonus_points_team", &function_24cd8348480a55d3);
    /#
        function_6e7290c8ee4f558b("<dev string:x1c>");
        function_b23a59dfb4ca49a1("<dev string:x2c>", "<dev string:x4b>", &function_e2b8eeccc951133f);
        function_b23a59dfb4ca49a1("<dev string:x73>", "<dev string:x92>", &function_e2b8eeccc951133f);
        function_fe953f000498048f();
    #/
}

// Namespace bonus_points_team / namespace_4b97861969c14019
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x154
// Size: 0x84
function function_24cd8348480a55d3(str_powerup, ent_powerup) {
    a_players = function_a56a8b17eae57b09(str_powerup);
    foreach (player in a_players) {
        player give_points();
        player thread function_676437737684783f(str_powerup);
    }
    level notify("zmb_bonus_points_team_level");
}

// Namespace bonus_points_team / namespace_4b97861969c14019
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e0
// Size: 0x2f
function give_points() {
    root = function_ecdae672c660149e();
    self [[ root.var_cc680f1d779ccc51 ]]("powerup_bonus_points_team");
    self notify("zmb_bonus_points_team");
}

