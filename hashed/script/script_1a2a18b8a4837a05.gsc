// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_7ab5b649fa408138;
#using script_930a1e7bd882c1d;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_72a196b6c7df2f38;
#using scripts\mp\music_and_dialog.gsc;

#namespace namespace_e9fb4fdd12296fce;

// Namespace namespace_e9fb4fdd12296fce/namespace_3c940a00e48e77dd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x559
// Size: 0x1c4
function init() {
    /#
        assert(isdefined(level.infilstruct));
    #/
    /#
        setdevdvarifuninitialized(@"hash_bfded00ac93c45b7", 1);
        setdevdvarifuninitialized(@"hash_7f1da0c3501cbdf2", 1);
    #/
    level.infilstruct.var_fd05dc031a2e7283 = "black::veh9_mil_air_cargo_plane_exterior_infil";
    level.infilstruct.var_30e653e12f358438 = "veh9_mil_air_cargo_plane_interior_infil";
    level.infilstruct.var_c3a4f4442070a8b5 = "tag_body_animate";
    level.infilstruct.var_7a96307b6a7ed797 = "veh_br_infil_c17_distant_lp";
    level.infilstruct.var_12c912ee9672fa1 = 1;
    level.infilstruct.var_eb0e85a583f21b9d = 1;
    level.infilstruct.var_b381e33e977da440 = &function_3158c3418412e97f;
    level.infilstruct.var_c7e1f8034a6cca31 = &function_8a98c48dee57505;
    level.infilstruct.var_6f0c032ec6e5d14 = &function_868bf033439639da;
    level.infilstruct.var_ae9e4023110acc6e = &function_ad4a7a73c7d7d9e0;
    level.infilstruct.var_8d5c19a9b693e913 = &function_8d5c19a9b693e913;
    level.infilstruct.var_dc0bc83a31193177 = &function_dc0bc83a31193177;
    var_1809e16510055e87 = [0:"cam_orbit_br_jup_infil_ac130_player1", 1:"cam_orbit_br_jup_infil_ac130_player2", 2:"cam_orbit_br_jup_infil_ac130_player3", 3:"cam_orbit_br_jup_infil_ac130_player4", 4:"cam_orbit_br_jup_infil_ac130_player1"];
    function_226e337633a44059(var_1809e16510055e87);
    function_ad12d29d41483e8a("prematch", &function_cd7e1a37d5e2ca2b);
    function_ad12d29d41483e8a("fadedown", &function_26874fd7694aa29);
}

// Namespace namespace_e9fb4fdd12296fce/namespace_3c940a00e48e77dd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x724
// Size: 0x1b6
function function_3158c3418412e97f(movingc130) {
    animstruct = spawnstruct();
    animstruct.cleanupfunc = &function_f48f4d028a11be8f;
    animstruct.var_ab8494260b910b51 = &function_52bedae2ced8e191;
    animstruct.movingc130 = movingc130;
    if (getdvarint(@"hash_794056489aa0efdd", 0)) {
        return animstruct;
    }
    var_cddd3c2ea93f8e9c = getent("infil_exfil_hq_origin", "targetname");
    if (!isdefined(var_cddd3c2ea93f8e9c)) {
        var_cddd3c2ea93f8e9c = spawnstruct();
        var_cddd3c2ea93f8e9c.origin = (0, 0, 0);
        var_cddd3c2ea93f8e9c.angles = (0, 0, 0);
    }
    animstruct.var_3b29f5840be404c8 = getdvarvector(@"hash_e30e6380ab2f16f7", var_cddd3c2ea93f8e9c.origin);
    animstruct.var_83c25bfe3ee01722 = var_cddd3c2ea93f8e9c.angles;
    level.infilstruct.var_3a6128a99dc22eb2 = animstruct.var_3b29f5840be404c8;
    animstruct.var_e25d1d189177a7c = "jup_wz_infil_scene";
    animstruct.var_be734cd003bec305 = function_f9bdc12bcf76bd07();
    animstruct.var_3034fd5e5fdaa1f0 = [];
    teams = function_cc1b64e82fd4680c(level.infilstruct.players);
    foreach (teamname, team in teams) {
        function_4852be52b053bc50(animstruct, teamname);
    }
    return animstruct;
}

// Namespace namespace_e9fb4fdd12296fce/namespace_3c940a00e48e77dd
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8e2
// Size: 0x181
function private function_f9bdc12bcf76bd07() {
    var_46cc50fec5b8b70a = [0:"shot_010", 1:"shot_020", 2:"shot_030", 3:"shot_040", 4:"shot_050", 5:"shot_060", 6:"shot_070", 7:"shot_080", 8:"shot_090", 9:"shot_100"];
    var_6cb889c93ea2fbe2 = [0:1, 1:1, 2:1, 3:1, 4:1, 5:1, 6:0, 7:0, 8:0, 9:1];
    var_f423b07db05160b2 = [0:0, 1:0, 2:1, 3:0, 4:1, 5:0, 6:0, 7:0, 8:0, 9:0];
    var_db488c3a1777b95e = [0:"_A", 1:"_B", 2:"_C"];
    var_d70017f60f84fe8 = [];
    var_18e8b4bc3930f848 = "";
    for (var_c9910f322154c0f4 = 0; var_c9910f322154c0f4 < var_46cc50fec5b8b70a.size; var_c9910f322154c0f4++) {
        if (!var_6cb889c93ea2fbe2[var_c9910f322154c0f4]) {
            var_18e8b4bc3930f848 = "";
        } else if (!var_f423b07db05160b2[var_c9910f322154c0f4]) {
            var_18e8b4bc3930f848 = utility::function_7a2aaa4a09a4d250(var_db488c3a1777b95e);
        }
        shot = var_46cc50fec5b8b70a[var_c9910f322154c0f4];
        var_d70017f60f84fe8[var_d70017f60f84fe8.size] = shot + var_18e8b4bc3930f848;
    }
    return var_d70017f60f84fe8;
}

// Namespace namespace_e9fb4fdd12296fce/namespace_3c940a00e48e77dd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa6b
// Size: 0xaa
function function_868bf033439639da(animstruct) {
    teams = function_cc1b64e82fd4680c(level.infilstruct.players);
    function_f1d7fa1182e966f7(animstruct, teams);
    foreach (teamname, team in teams) {
        var_5aaf7c7163c04623 = animstruct.var_3034fd5e5fdaa1f0[teamname];
        var_5aaf7c7163c04623 scene::function_6438932e35cbbfb7(team, animstruct.var_be734cd003bec305);
    }
}

// Namespace namespace_e9fb4fdd12296fce/namespace_3c940a00e48e77dd
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb1c
// Size: 0x2c6
function function_8a98c48dee57505(animstruct) {
    if (getdvarint(@"hash_794056489aa0efdd", 0)) {
        animstruct function_5dba404b985c7d41();
        return;
    }
    thread function_b9fcd5a6ea2995a6();
    function_8e6c187449e3276();
    teams = function_cc1b64e82fd4680c(level.infilstruct.players);
    function_f1d7fa1182e966f7(animstruct, teams);
    foreach (teamname, team in teams) {
        function_423115ed15f21e05(teamname);
    }
    foreach (player in level.infilstruct.players) {
        animstruct thread function_bdf100dc034deb1e(player);
    }
    foreach (player in level.infilstruct.players) {
        player setclientomnvar("ui_br_infil_exfil_player_focus", 1);
    }
    level.var_50d687be30fce8d5 = 0;
    level.var_ab6e27d4ac15b397 = 0;
    var_ac9bf40e02d1bfcf = 0;
    foreach (teamname, team in teams) {
        var_5aaf7c7163c04623 = animstruct.var_3034fd5e5fdaa1f0[teamname];
        if (var_ac9bf40e02d1bfcf == 0) {
            var_5aaf7c7163c04623 function_595670eb4c1bdf59(0);
        } else {
            var_5aaf7c7163c04623 function_595670eb4c1bdf59(1);
        }
        if (var_ac9bf40e02d1bfcf == teams.size - 1) {
            var_5aaf7c7163c04623 scene::play(team, animstruct.var_be734cd003bec305);
        } else {
            var_5aaf7c7163c04623 thread scene::play(team, animstruct.var_be734cd003bec305);
        }
        var_ac9bf40e02d1bfcf++;
    }
    foreach (teamname, team in teams) {
        var_5aaf7c7163c04623 = animstruct.var_3034fd5e5fdaa1f0[teamname];
        var_5aaf7c7163c04623 scene::cleanup();
    }
    animstruct notify("infilSceneDone");
    function_c79f9300ee85f805(level.players, "jup_br_infil_igc", 1);
    function_a5a97638ff41cda4();
    animstruct function_5dba404b985c7d41();
    waitframe();
    waitframe();
    animstruct.var_3034fd5e5fdaa1f0 = undefined;
}

// Namespace namespace_e9fb4fdd12296fce/namespace_3c940a00e48e77dd
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xde9
// Size: 0x82
function private function_f1d7fa1182e966f7(animstruct, var_f2da32f8a5f3e866) {
    if (!isdefined(var_f2da32f8a5f3e866)) {
        var_f2da32f8a5f3e866 = function_cc1b64e82fd4680c(level.infilstruct.players);
    }
    foreach (teamname, team in var_f2da32f8a5f3e866) {
        function_4852be52b053bc50(animstruct, teamname);
    }
}

// Namespace namespace_e9fb4fdd12296fce/namespace_3c940a00e48e77dd
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe72
// Size: 0xee
function private function_4852be52b053bc50(animstruct, teamname) {
    if (!isdefined(animstruct.var_3034fd5e5fdaa1f0)) {
        animstruct.var_3034fd5e5fdaa1f0 = [];
    }
    if (isdefined(animstruct.var_3034fd5e5fdaa1f0[teamname])) {
        return;
    }
    var_5aaf7c7163c04623 = spawnstruct();
    var_5aaf7c7163c04623.origin = animstruct.var_3b29f5840be404c8;
    var_5aaf7c7163c04623.angles = animstruct.var_83c25bfe3ee01722;
    animstruct.var_3034fd5e5fdaa1f0[teamname] = var_5aaf7c7163c04623;
    var_5aaf7c7163c04623 scene::function_70090b9a8db66aeb(animstruct.var_e25d1d189177a7c);
    if (animstruct.var_3034fd5e5fdaa1f0.size == 1) {
        var_c38eb8ba73256bfb = animstruct.var_be734cd003bec305;
        scene::add_scene_func(var_5aaf7c7163c04623, &function_b8f99ced9e454117, var_c38eb8ba73256bfb[0]);
        scene::add_scene_func(var_5aaf7c7163c04623, &function_5b82c7adaa9b7489, var_c38eb8ba73256bfb[var_c38eb8ba73256bfb.size - 1]);
    }
}

// Namespace namespace_e9fb4fdd12296fce/namespace_3c940a00e48e77dd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf67
// Size: 0x23
function function_b8f99ced9e454117() {
    if (istrue(level.var_50d687be30fce8d5)) {
        return;
    }
    level.var_50d687be30fce8d5 = 1;
    function_fd28a78c72cc942b();
}

// Namespace namespace_e9fb4fdd12296fce/namespace_3c940a00e48e77dd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf91
// Size: 0xbd
function function_5b82c7adaa9b7489() {
    if (istrue(level.var_ab6e27d4ac15b397)) {
        return;
    }
    level.var_ab6e27d4ac15b397 = 1;
    shots = scene::function_8a37fe423de2b9db();
    var_930f9bb4bc01c989 = scene::function_d9be975d8d1c9db3(shots[shots.size - 1]);
    fadestarttime = max(0, var_930f9bb4bc01c989 - 1.5);
    var_c2419ec768e4cb25 = var_930f9bb4bc01c989 + 0.75;
    wait(fadestarttime);
    function_ea856ec0b3c4cfc6(1, level.infilstruct.players, "hq_transition");
    wait(var_c2419ec768e4cb25 - fadestarttime);
    function_7f3ad8fe6df1b8fe(0.5, level.infilstruct.players, "hq_transition");
}

// Namespace namespace_e9fb4fdd12296fce/namespace_3c940a00e48e77dd
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1055
// Size: 0x1c4
function private function_fd28a78c72cc942b() {
    var_3034fd5e5fdaa1f0 = level.infilstruct.animstruct.var_3034fd5e5fdaa1f0;
    var_7e40e03490016ab1 = function_3f51a5b53a7af8c9(self);
    foreach (parachute in var_7e40e03490016ab1) {
        parachute hide();
    }
    var_9574d80eb717270a = function_2f9f9647bfbbb644(self);
    foreach (var_7d864e3a3a8716bd in var_9574d80eb717270a) {
        var_7d864e3a3a8716bd hide();
    }
    foreach (var_5aaf7c7163c04623 in var_3034fd5e5fdaa1f0) {
        var_dc7df90f26500ab6 = function_ec174c77eac8400d(var_5aaf7c7163c04623);
        for (var_99594a4d67fef20b = 0; var_99594a4d67fef20b < var_dc7df90f26500ab6.size; var_99594a4d67fef20b++) {
            foreach (player in var_dc7df90f26500ab6) {
                if (isdefined(var_7e40e03490016ab1[var_99594a4d67fef20b])) {
                    var_7e40e03490016ab1[var_99594a4d67fef20b] showtoplayer(player);
                }
                if (isdefined(var_9574d80eb717270a[var_99594a4d67fef20b])) {
                    var_9574d80eb717270a[var_99594a4d67fef20b] showtoplayer(player);
                }
            }
        }
    }
}

// Namespace namespace_e9fb4fdd12296fce/namespace_3c940a00e48e77dd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1220
// Size: 0x52
function private function_ec174c77eac8400d(var_5aaf7c7163c04623) {
    var_eb5f3342f47d80d3 = [];
    for (var_99594a4d67fef20b = 1; var_99594a4d67fef20b <= 4; var_99594a4d67fef20b++) {
        var_ef19d2c73edbaf70 = "Player" + var_99594a4d67fef20b;
        var_eb5f3342f47d80d3[var_eb5f3342f47d80d3.size] = var_5aaf7c7163c04623 scene::function_fd344c13b4433aaf(var_ef19d2c73edbaf70);
    }
    return var_eb5f3342f47d80d3;
}

// Namespace namespace_e9fb4fdd12296fce/namespace_3c940a00e48e77dd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x127a
// Size: 0x52
function private function_3f51a5b53a7af8c9(var_5aaf7c7163c04623) {
    var_7e40e03490016ab1 = [];
    for (i = 1; i <= 4; i++) {
        var_2d1dffa36358cd1b = "Parachute0" + i;
        var_7e40e03490016ab1[var_7e40e03490016ab1.size] = var_5aaf7c7163c04623 scene::function_fd344c13b4433aaf(var_2d1dffa36358cd1b);
    }
    return var_7e40e03490016ab1;
}

// Namespace namespace_e9fb4fdd12296fce/namespace_3c940a00e48e77dd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12d4
// Size: 0x52
function private function_2f9f9647bfbbb644(var_5aaf7c7163c04623) {
    var_9574d80eb717270a = [];
    for (i = 1; i <= 4; i++) {
        var_2d1dffa36358cd1b = "Flat_Parachute0" + i;
        var_9574d80eb717270a[var_9574d80eb717270a.size] = var_5aaf7c7163c04623 scene::function_fd344c13b4433aaf(var_2d1dffa36358cd1b);
    }
    return var_9574d80eb717270a;
}

// Namespace namespace_e9fb4fdd12296fce/namespace_3c940a00e48e77dd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x132e
// Size: 0x120
function private function_bdf100dc034deb1e(player) {
    self endon("infilSceneDone");
    var_5aaf7c7163c04623 = self.var_3034fd5e5fdaa1f0[player.team];
    player waittill("disconnect");
    parachute = undefined;
    var_7d864e3a3a8716bd = undefined;
    var_dc7df90f26500ab6 = function_ec174c77eac8400d(var_5aaf7c7163c04623);
    for (var_99594a4d67fef20b = 0; var_99594a4d67fef20b < var_dc7df90f26500ab6.size; var_99594a4d67fef20b++) {
        if (player == var_dc7df90f26500ab6[var_99594a4d67fef20b]) {
            parachute = var_5aaf7c7163c04623 scene::function_fd344c13b4433aaf("Parachute0" + var_99594a4d67fef20b);
            var_7d864e3a3a8716bd = var_5aaf7c7163c04623 scene::function_fd344c13b4433aaf("Flat_Parachute0" + var_99594a4d67fef20b);
            break;
        }
    }
    var_dc7df90f26500ab6 = array_removeundefined(var_dc7df90f26500ab6);
    foreach (otherplayer in var_dc7df90f26500ab6) {
        if (player != otherplayer) {
            if (isdefined(parachute)) {
                parachute hidefromplayer(otherplayer);
            }
            if (isdefined(parachute)) {
                var_7d864e3a3a8716bd hidefromplayer(otherplayer);
            }
        }
    }
}

// Namespace namespace_e9fb4fdd12296fce/namespace_3c940a00e48e77dd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1455
// Size: 0x69
function function_b9fcd5a6ea2995a6() {
    function_7acde5feb50c98f2(level.players, "scn_jup_br_infil_amb_lr");
    wait(17.5);
    function_7acde5feb50c98f2(level.players, "scn_jup_br_infil_c17_takeoff_spinup_lssrss");
    wait(2.75);
    function_7acde5feb50c98f2(level.players, "scn_jup_br_infil_c17_takeoff_main_lr");
    wait(3.3);
    function_7acde5feb50c98f2(level.players, "scn_jup_br_infil_c17_transition_lr");
}

// Namespace namespace_e9fb4fdd12296fce/namespace_3c940a00e48e77dd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14c5
// Size: 0x12f
function function_5dba404b985c7d41() {
    /#
        assert(isdefined(self.movingc130));
    #/
    self.movingc130.animname = "infilCargoPlane";
    self.movingc130 scriptmodelplayanim("wz_br_jup_infil_idle_crgopln", "infilCargoPlane");
    if (!istrue(level.infilstruct.var_df94e780c2b3c994) || function_8663da4077fa7e20()) {
        self.movingc130 notify("start_moving");
    }
    setomnvar("ui_hide_player_icons", 0);
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        player setallstreamloaddist(0);
        player unlink();
        player playerlinkto(self.movingc130, "tag_body_animate");
        player setplayerangles(self.movingc130.angles);
    }
    thread function_467af8a71787a0b8();
}

// Namespace namespace_e9fb4fdd12296fce/namespace_3c940a00e48e77dd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15fb
// Size: 0x36
function function_467af8a71787a0b8() {
    wait(0.1);
    function_16f307c48e420065();
    if (isdefined(self.movingc130)) {
        self.movingc130 setscriptablepartstate("br_fx", "clouds");
    }
}

// Namespace namespace_e9fb4fdd12296fce/namespace_3c940a00e48e77dd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1638
// Size: 0x1c
function function_16f307c48e420065() {
    self.movingc130 setscriptablepartstate("int_lights_green_all", "on");
}

// Namespace namespace_e9fb4fdd12296fce/namespace_3c940a00e48e77dd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x165b
// Size: 0x223
function function_ad4a7a73c7d7d9e0() {
    self clearclienttriggeraudiozone(3);
    var_522a77434d41564a = self getplayerangles(1);
    playerforward = anglestoforward(var_522a77434d41564a);
    var_4b52f031a2cbef8e = anglestoforward(level.infilstruct.c130.angles);
    var_d8bb89f41ae3d919 = anglestoright(level.infilstruct.c130.angles);
    var_172d42d175e16c61 = vectordot(playerforward, var_4b52f031a2cbef8e);
    var_ed451f0ea36c48c6 = vectordot(playerforward, var_d8bb89f41ae3d919);
    if (!isdefined(self.infilanimindex)) {
        self.infilanimindex = 1;
    }
    infilanimindex = self.infilanimindex;
    if (infilanimindex >= 4) {
        infilanimindex = 1;
    }
    var_8e3afd40d3c95b46 = "j_prop_" + infilanimindex + 1;
    cos45 = cos(45);
    if (var_172d42d175e16c61 < -1 * cos45) {
        return [0:"wz_infil_gprop_standard_sh010", 1:level.var_1a209bd995a7fa83["wz_infil_gprop_standard_sh010"], 2:"wz_infil_standardforward_jump_sh010", 3:var_8e3afd40d3c95b46];
    }
    if (var_ed451f0ea36c48c6 > cos45) {
        return [0:"wz_infil_gprop_l90_sh010", 1:level.var_1a209bd995a7fa83["wz_infil_gprop_l90_sh010"], 2:"wz_infil_l90_jump_sh010", 3:var_8e3afd40d3c95b46];
    } else if (var_ed451f0ea36c48c6 < -1 * cos45) {
        return [0:"wz_infil_gprop_r90_sh010", 1:level.var_1a209bd995a7fa83["wz_infil_gprop_r90_sh010"], 2:"wz_infil_r90_jump_sh010", 3:var_8e3afd40d3c95b46];
    } else if (var_ed451f0ea36c48c6 > 0) {
        return [0:"wz_infil_gprop_l180_sh010", 1:level.var_1a209bd995a7fa83["wz_infil_gprop_l180_sh010"], 2:"wz_infil_l180_jump_sh010", 3:var_8e3afd40d3c95b46];
    } else {
        return [0:"wz_infil_gprop_r180_sh010", 1:level.var_1a209bd995a7fa83["wz_infil_gprop_r180_sh010"], 2:"wz_infil_r180_jump_sh010", 3:var_8e3afd40d3c95b46];
    }
}

// Namespace namespace_e9fb4fdd12296fce/namespace_3c940a00e48e77dd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1885
// Size: 0x38
function function_8d5c19a9b693e913() {
    if (getdvarint(@"hash_549df6ab370a2bc4", 1)) {
        self lerpfovscalefactor(0, 0);
        self setclientdvar(@"hash_71c6c0b8428e44a7", 0);
    }
}

// Namespace namespace_e9fb4fdd12296fce/namespace_3c940a00e48e77dd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18c4
// Size: 0x86
function function_dc0bc83a31193177() {
    self endon("disconnect");
    self lerpfov(65, 0.5);
    if (getdvarint(@"hash_549df6ab370a2bc4", 1)) {
        self lerpfovscalefactor(1, 0.5);
    }
    wait(1);
    if (isdefined(self.var_1f0a019572c9f8e2)) {
        self.var_1f0a019572c9f8e2 = undefined;
        self disablephysicaldepthoffieldscripting();
    }
    self setclientdvar(@"hash_df1dc712c4a91588", 65);
    self setclientdvar(@"hash_71c6c0b8428e44a7", 0);
}

// Namespace namespace_e9fb4fdd12296fce/namespace_3c940a00e48e77dd
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1951
// Size: 0x22
function private function_cd7e1a37d5e2ca2b() {
    level.nosuspensemusic = 1;
    thread namespace_3bde6869e44a2770::stopsuspensemusic();
    function_f1aed36ab4598ea("mp_gamemode_br_infils_jup");
}

// Namespace namespace_e9fb4fdd12296fce/namespace_3c940a00e48e77dd
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x197a
// Size: 0xc
function private function_26874fd7694aa29() {
    level thread function_8d050f78fe1d180f();
}

// Namespace namespace_e9fb4fdd12296fce/namespace_3c940a00e48e77dd
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x198d
// Size: 0x43
function private function_8d050f78fe1d180f() {
    function_6f9b54cea87f1c9e();
    function_4e8ba327eb12540c(level.players, "jup_br_infil_igc", 1);
    wait(2.5);
    function_c79f9300ee85f805(level.players, "mp_br_lobby_fade", 0);
}

// Namespace namespace_e9fb4fdd12296fce/namespace_3c940a00e48e77dd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19d7
// Size: 0x16
function function_f48f4d028a11be8f() {
    function_e66f664ad726f2e();
    function_f4e0ff5cb899686d("mp_gamemode_br_infils_jup");
}

// Namespace namespace_e9fb4fdd12296fce/namespace_3c940a00e48e77dd
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19f4
// Size: 0x5b
function function_52bedae2ced8e191() {
    var_a910600eadf5e31c = level._effect["vfx_br_ac130_clouds"];
    var_8b26de022a9f35f = level._effect["vfx_br_ac130_oneshot"];
    if (isdefined(var_a910600eadf5e31c)) {
        stopfxontag(var_a910600eadf5e31c, self, "tag_body");
    }
    if (isdefined(var_8b26de022a9f35f)) {
        stopfxontag(var_8b26de022a9f35f, self, "tag_body");
    }
}

// Namespace namespace_e9fb4fdd12296fce/namespace_3c940a00e48e77dd
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1a56
// Size: 0xb3
function private function_cc1b64e82fd4680c(players) {
    /#
        assertex(isarray(players));
    #/
    teams = [];
    foreach (player in players) {
        if (!isdefined(player)) {
            continue;
        }
        if (!isdefined(teams[player.team])) {
            teams[player.team] = [];
        }
        teams[player.team][teams[player.team].size] = player;
    }
    return teams;
}

// Namespace namespace_e9fb4fdd12296fce/namespace_3c940a00e48e77dd
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1b11
// Size: 0x91
function private function_8e6c187449e3276() {
    var_2a5e082b65f82a5c = getdvarint(@"hash_7f1da0c3501cbdf2", 1);
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        if (var_2a5e082b65f82a5c) {
            player function_451319f93d30ebe5(%"hash_34c59bed7392d266");
        }
    }
}

// Namespace namespace_e9fb4fdd12296fce/namespace_3c940a00e48e77dd
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1ba9
// Size: 0x91
function private function_a5a97638ff41cda4() {
    var_2a5e082b65f82a5c = getdvarint(@"hash_7f1da0c3501cbdf2", 1);
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        if (var_2a5e082b65f82a5c) {
            player function_df8fad503896462(%"hash_34c59bed7392d266");
        }
    }
}

// Namespace namespace_e9fb4fdd12296fce/namespace_3c940a00e48e77dd
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1c41
// Size: 0xc3
function private leaderdialog(var_d653377138d5eff2) {
    if (!getdvarint(@"hash_bfded00ac93c45b7", 1)) {
        return;
    }
    var_1499e7c2d69e0074 = 2;
    if (soundexists(var_d653377138d5eff2)) {
        var_1499e7c2d69e0074 = lookupsoundlength(var_d653377138d5eff2, 1) / 1000;
    }
    var_cb3339ece72dbdeb = game["dialog"][var_d653377138d5eff2];
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        player queuedialogforplayer(var_cb3339ece72dbdeb, var_d653377138d5eff2, var_1499e7c2d69e0074);
    }
}

