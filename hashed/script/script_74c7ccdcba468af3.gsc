// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_38eb8f4be20d54f4;
#using script_3a9930dfe832ae05;
#using script_427ce33ec0c820cf;

#namespace bonus_points_team;

// Namespace bonus_points_team/namespace_4b97861969c14019
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0xe6
// Size: 0xa
function autoexec main() {
    function_e3322035230ef1d7();
}

// Namespace bonus_points_team/namespace_4b97861969c14019
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf7
// Size: 0x56
function function_e3322035230ef1d7() {
    register_powerup("bonus_points_team", &function_24cd8348480a55d3);
    /#
        function_6e7290c8ee4f558b("<unknown string>");
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_e2b8eeccc951133f);
        function_b23a59dfb4ca49a1("<unknown string>", "<unknown string>", &function_e2b8eeccc951133f);
        function_fe953f000498048f();
    #/
}

// Namespace bonus_points_team/namespace_4b97861969c14019
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x154
// Size: 0x85
function function_24cd8348480a55d3(str_powerup, var_4d44d70760d7ad71) {
    a_players = function_a56a8b17eae57b09(str_powerup);
    foreach (player in a_players) {
        player function_ba9b3bcd7f40469e();
        player thread function_676437737684783f(str_powerup);
    }
    level notify("zmb_bonus_points_team_level");
}

// Namespace bonus_points_team/namespace_4b97861969c14019
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e0
// Size: 0x30
function function_ba9b3bcd7f40469e() {
    root = function_ecdae672c660149e();
    self [[ root.var_cc680f1d779ccc51 ]]("powerup_bonus_points_team");
    self notify("zmb_bonus_points_team");
}

