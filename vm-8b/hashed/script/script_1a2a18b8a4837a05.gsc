#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_7ab5b649fa408138;
#using script_930a1e7bd882c1d;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\common\scene.gsc;
#using scripts\mp\music_and_dialog.gsc;

#namespace namespace_e9fb4fdd12296fce;

// Namespace namespace_e9fb4fdd12296fce / namespace_3c940a00e48e77dd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x639
// Size: 0x1c4
function init() {
    assert(isdefined(level.infilstruct));
    /#
        setdevdvarifuninitialized(@"hash_bfded00ac93c45b7", 1);
        setdevdvarifuninitialized(@"hash_7f1da0c3501cbdf2", 1);
    #/
    level.infilstruct.c130model = "black::veh9_mil_air_cargo_plane_exterior_infil";
    level.infilstruct.var_30e653e12f358438 = "veh9_mil_air_cargo_plane_interior_infil";
    level.infilstruct.var_c3a4f4442070a8b5 = "tag_body_animate";
    level.infilstruct.c130soundalias = "veh_br_infil_c17_distant_lp";
    level.infilstruct.var_12c912ee9672fa1 = 1;
    level.infilstruct.var_eb0e85a583f21b9d = 1;
    level.infilstruct.var_b381e33e977da440 = &function_3158c3418412e97f;
    level.infilstruct.var_c7e1f8034a6cca31 = &playscene;
    level.infilstruct.var_6f0c032ec6e5d14 = &prestream;
    level.infilstruct.var_ae9e4023110acc6e = &function_ad4a7a73c7d7d9e0;
    level.infilstruct.jumpfunc = &jumpfunc;
    level.infilstruct.var_dc0bc83a31193177 = &function_dc0bc83a31193177;
    var_1809e16510055e87 = ["cam_orbit_br_jup_infil_ac130_player1", "cam_orbit_br_jup_infil_ac130_player2", "cam_orbit_br_jup_infil_ac130_player3", "cam_orbit_br_jup_infil_ac130_player4", "cam_orbit_br_jup_infil_ac130_player1"];
    function_226e337633a44059(var_1809e16510055e87);
    function_ad12d29d41483e8a("prematch", &function_cd7e1a37d5e2ca2b);
    function_ad12d29d41483e8a("fadedown", &function_26874fd7694aa29);
}

// Namespace namespace_e9fb4fdd12296fce / namespace_3c940a00e48e77dd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x805
// Size: 0x1b1
function function_3158c3418412e97f(movingc130) {
    animstruct = spawnstruct();
    animstruct.cleanupfunc = &infilcleanup;
    animstruct.var_ab8494260b910b51 = &function_52bedae2ced8e191;
    animstruct.movingc130 = movingc130;
    if (getdvarint(@"hash_794056489aa0efdd", 0)) {
        return animstruct;
    }
    sceneent = getent("infil_exfil_hq_origin", "targetname");
    if (!isdefined(sceneent)) {
        sceneent = spawnstruct();
        sceneent.origin = (0, 0, 0);
        sceneent.angles = (0, 0, 0);
    }
    animstruct.hqorigin = getdvarvector(@"hash_e30e6380ab2f16f7", sceneent.origin);
    animstruct.var_83c25bfe3ee01722 = sceneent.angles;
    level.infilstruct.var_3a6128a99dc22eb2 = animstruct.hqorigin;
    animstruct.scenename = "jup_wz_infil_scene";
    animstruct.randomizedshots = function_f9bdc12bcf76bd07();
    animstruct.sceneroots = [];
    teams = function_cc1b64e82fd4680c(level.infilstruct.players);
    foreach (teamname, team in teams) {
        function_4852be52b053bc50(animstruct, teamname);
    }
    return animstruct;
}

// Namespace namespace_e9fb4fdd12296fce / namespace_3c940a00e48e77dd
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x9bf
// Size: 0x17a
function private function_f9bdc12bcf76bd07() {
    const_shots = ["shot_010", "shot_020", "shot_030", "shot_040", "shot_050", "shot_060", "shot_070", "shot_080", "shot_090", "shot_100"];
    var_6cb889c93ea2fbe2 = [1, 1, 1, 1, 1, 1, 0, 0, 0, 1];
    var_f423b07db05160b2 = [0, 0, 1, 0, 1, 0, 0, 0, 0, 0];
    var_db488c3a1777b95e = ["_A", "_B", "_C"];
    outshots = [];
    var_18e8b4bc3930f848 = "";
    for (shotidx = 0; shotidx < const_shots.size; shotidx++) {
        if (!var_6cb889c93ea2fbe2[shotidx]) {
            var_18e8b4bc3930f848 = "";
        } else if (!var_f423b07db05160b2[shotidx]) {
            var_18e8b4bc3930f848 = utility::array_random(var_db488c3a1777b95e);
        }
        shot = const_shots[shotidx];
        outshots[outshots.size] = shot + var_18e8b4bc3930f848;
    }
    return outshots;
}

// Namespace namespace_e9fb4fdd12296fce / namespace_3c940a00e48e77dd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb42
// Size: 0xa6
function prestream(animstruct) {
    teams = function_cc1b64e82fd4680c(level.infilstruct.players);
    function_f1d7fa1182e966f7(animstruct, teams);
    foreach (teamname, team in teams) {
        sceneroot = animstruct.sceneroots[teamname];
        sceneroot scene::pre_stream(team, animstruct.randomizedshots);
    }
}

// Namespace namespace_e9fb4fdd12296fce / namespace_3c940a00e48e77dd
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbf0
// Size: 0x2ba
function playscene(animstruct) {
    if (getdvarint(@"hash_794056489aa0efdd", 0)) {
        animstruct teleporttomovingplane();
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
    teamidx = 0;
    foreach (teamname, team in teams) {
        sceneroot = animstruct.sceneroots[teamname];
        if (teamidx == 0) {
            sceneroot function_595670eb4c1bdf59(0);
        } else {
            sceneroot function_595670eb4c1bdf59(1);
        }
        if (teamidx == teams.size - 1) {
            sceneroot scene::play(team, animstruct.randomizedshots);
        } else {
            sceneroot thread scene::play(team, animstruct.randomizedshots);
        }
        teamidx++;
    }
    foreach (teamname, team in teams) {
        sceneroot = animstruct.sceneroots[teamname];
        sceneroot scene::cleanup();
    }
    animstruct notify("infilSceneDone");
    function_c79f9300ee85f805(level.players, "jup_br_infil_igc", 1);
    function_a5a97638ff41cda4();
    animstruct teleporttomovingplane();
    waitframe();
    waitframe();
    animstruct.sceneroots = undefined;
}

// Namespace namespace_e9fb4fdd12296fce / namespace_3c940a00e48e77dd
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xeb2
// Size: 0x80
function private function_f1d7fa1182e966f7(animstruct, allteams) {
    if (!isdefined(allteams)) {
        allteams = function_cc1b64e82fd4680c(level.infilstruct.players);
    }
    foreach (teamname, team in allteams) {
        function_4852be52b053bc50(animstruct, teamname);
    }
}

// Namespace namespace_e9fb4fdd12296fce / namespace_3c940a00e48e77dd
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0xf3a
// Size: 0xed
function private function_4852be52b053bc50(animstruct, teamname) {
    if (!isdefined(animstruct.sceneroots)) {
        animstruct.sceneroots = [];
    }
    if (isdefined(animstruct.sceneroots[teamname])) {
        return;
    }
    sceneroot = spawnstruct();
    sceneroot.origin = animstruct.hqorigin;
    sceneroot.angles = animstruct.var_83c25bfe3ee01722;
    animstruct.sceneroots[teamname] = sceneroot;
    sceneroot scene::set_scriptbundle(animstruct.scenename);
    if (animstruct.sceneroots.size == 1) {
        shotnames = animstruct.randomizedshots;
        scene::add_scene_func(sceneroot, &function_b8f99ced9e454117, shotnames[0]);
        scene::add_scene_func(sceneroot, &function_5b82c7adaa9b7489, shotnames[shotnames.size - 1]);
    }
}

// Namespace namespace_e9fb4fdd12296fce / namespace_3c940a00e48e77dd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x102f
// Size: 0x22
function function_b8f99ced9e454117() {
    if (istrue(level.var_50d687be30fce8d5)) {
        return;
    }
    level.var_50d687be30fce8d5 = 1;
    function_fd28a78c72cc942b();
}

// Namespace namespace_e9fb4fdd12296fce / namespace_3c940a00e48e77dd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1059
// Size: 0xba
function function_5b82c7adaa9b7489() {
    if (istrue(level.var_ab6e27d4ac15b397)) {
        return;
    }
    level.var_ab6e27d4ac15b397 = 1;
    shots = scene::function_8a37fe423de2b9db();
    shotlength = scene::function_d9be975d8d1c9db3(shots[shots.size - 1]);
    fadestarttime = max(0, shotlength - 1.5);
    fadeendtime = shotlength + 0.75;
    wait fadestarttime;
    function_ea856ec0b3c4cfc6(1, level.infilstruct.players, "hq_transition");
    wait fadeendtime - fadestarttime;
    function_7f3ad8fe6df1b8fe(0.5, level.infilstruct.players, "hq_transition");
}

// Namespace namespace_e9fb4fdd12296fce / namespace_3c940a00e48e77dd
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x111b
// Size: 0x1b4
function private function_fd28a78c72cc942b() {
    sceneroots = level.infilstruct.animstruct.sceneroots;
    parachutes = function_3f51a5b53a7af8c9(self);
    foreach (parachute in parachutes) {
        parachute hide();
    }
    var_9574d80eb717270a = function_2f9f9647bfbbb644(self);
    foreach (flatparachute in var_9574d80eb717270a) {
        flatparachute hide();
    }
    foreach (sceneroot in sceneroots) {
        playersinscene = function_ec174c77eac8400d(sceneroot);
        for (playeridx = 0; playeridx < playersinscene.size; playeridx++) {
            foreach (player in playersinscene) {
                if (isdefined(parachutes[playeridx])) {
                    parachutes[playeridx] showtoplayer(player);
                }
                if (isdefined(var_9574d80eb717270a[playeridx])) {
                    var_9574d80eb717270a[playeridx] showtoplayer(player);
                }
            }
        }
    }
}

// Namespace namespace_e9fb4fdd12296fce / namespace_3c940a00e48e77dd
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x12d7
// Size: 0x50
function private function_ec174c77eac8400d(sceneroot) {
    playersents = [];
    for (playeridx = 1; playeridx <= 4; playeridx++) {
        var_ef19d2c73edbaf70 = "Player" + playeridx;
        playersents[playersents.size] = sceneroot scene::get_entity(var_ef19d2c73edbaf70);
    }
    return playersents;
}

// Namespace namespace_e9fb4fdd12296fce / namespace_3c940a00e48e77dd
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1330
// Size: 0x50
function private function_3f51a5b53a7af8c9(sceneroot) {
    parachutes = [];
    for (i = 1; i <= 4; i++) {
        parachutename = "Parachute0" + i;
        parachutes[parachutes.size] = sceneroot scene::get_entity(parachutename);
    }
    return parachutes;
}

// Namespace namespace_e9fb4fdd12296fce / namespace_3c940a00e48e77dd
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1389
// Size: 0x50
function private function_2f9f9647bfbbb644(sceneroot) {
    var_9574d80eb717270a = [];
    for (i = 1; i <= 4; i++) {
        parachutename = "Flat_Parachute0" + i;
        var_9574d80eb717270a[var_9574d80eb717270a.size] = sceneroot scene::get_entity(parachutename);
    }
    return var_9574d80eb717270a;
}

// Namespace namespace_e9fb4fdd12296fce / namespace_3c940a00e48e77dd
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x13e2
// Size: 0x119
function private function_bdf100dc034deb1e(player) {
    self endon("infilSceneDone");
    sceneroot = self.sceneroots[player.team];
    player waittill("disconnect");
    parachute = undefined;
    flatparachute = undefined;
    playersinscene = function_ec174c77eac8400d(sceneroot);
    for (playeridx = 0; playeridx < playersinscene.size; playeridx++) {
        if (player == playersinscene[playeridx]) {
            parachute = sceneroot scene::get_entity("Parachute0" + playeridx);
            flatparachute = sceneroot scene::get_entity("Flat_Parachute0" + playeridx);
            break;
        }
    }
    playersinscene = array_removeundefined(playersinscene);
    foreach (otherplayer in playersinscene) {
        if (player != otherplayer) {
            if (isdefined(parachute)) {
                parachute hidefromplayer(otherplayer);
            }
            if (isdefined(parachute)) {
                flatparachute hidefromplayer(otherplayer);
            }
        }
    }
}

// Namespace namespace_e9fb4fdd12296fce / namespace_3c940a00e48e77dd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1503
// Size: 0x68
function function_b9fcd5a6ea2995a6() {
    function_7acde5feb50c98f2(level.players, "scn_jup_br_infil_amb_lr");
    wait 17.5;
    function_7acde5feb50c98f2(level.players, "scn_jup_br_infil_c17_takeoff_spinup_lssrss");
    wait 2.75;
    function_7acde5feb50c98f2(level.players, "scn_jup_br_infil_c17_takeoff_main_lr");
    wait 3.3;
    function_7acde5feb50c98f2(level.players, "scn_jup_br_infil_c17_transition_lr");
}

// Namespace namespace_e9fb4fdd12296fce / namespace_3c940a00e48e77dd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1573
// Size: 0x12d
function teleporttomovingplane() {
    assert(isdefined(self.movingc130));
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

// Namespace namespace_e9fb4fdd12296fce / namespace_3c940a00e48e77dd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16a8
// Size: 0x35
function function_467af8a71787a0b8() {
    wait 0.1;
    function_16f307c48e420065();
    if (isdefined(self.movingc130)) {
        self.movingc130 setscriptablepartstate("br_fx", "clouds");
    }
}

// Namespace namespace_e9fb4fdd12296fce / namespace_3c940a00e48e77dd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16e5
// Size: 0x1b
function function_16f307c48e420065() {
    self.movingc130 setscriptablepartstate("int_lights_green_all", "on");
}

// Namespace namespace_e9fb4fdd12296fce / namespace_3c940a00e48e77dd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1708
// Size: 0x21b
function function_ad4a7a73c7d7d9e0() {
    self clearclienttriggeraudiozone(3);
    var_522a77434d41564a = self getplayerangles(1);
    playerforward = anglestoforward(var_522a77434d41564a);
    planeforward = anglestoforward(level.infilstruct.c130.angles);
    planeright = anglestoright(level.infilstruct.c130.angles);
    dotforward = vectordot(playerforward, planeforward);
    dotright = vectordot(playerforward, planeright);
    if (!isdefined(self.infilanimindex)) {
        self.infilanimindex = 1;
    }
    infilanimindex = self.infilanimindex;
    if (infilanimindex >= 4) {
        infilanimindex = 1;
    }
    var_8e3afd40d3c95b46 = "j_prop_" + infilanimindex + 1;
    cos45 = cos(45);
    if (dotforward < -1 * cos45) {
        return ["wz_infil_gprop_standard_sh010", level.var_1a209bd995a7fa83["wz_infil_gprop_standard_sh010"], "wz_infil_standardforward_jump_sh010", var_8e3afd40d3c95b46];
    }
    if (dotright > cos45) {
        return ["wz_infil_gprop_l90_sh010", level.var_1a209bd995a7fa83["wz_infil_gprop_l90_sh010"], "wz_infil_l90_jump_sh010", var_8e3afd40d3c95b46];
    }
    if (dotright < -1 * cos45) {
        return ["wz_infil_gprop_r90_sh010", level.var_1a209bd995a7fa83["wz_infil_gprop_r90_sh010"], "wz_infil_r90_jump_sh010", var_8e3afd40d3c95b46];
    }
    if (dotright > 0) {
        return ["wz_infil_gprop_l180_sh010", level.var_1a209bd995a7fa83["wz_infil_gprop_l180_sh010"], "wz_infil_l180_jump_sh010", var_8e3afd40d3c95b46];
    }
    return ["wz_infil_gprop_r180_sh010", level.var_1a209bd995a7fa83["wz_infil_gprop_r180_sh010"], "wz_infil_r180_jump_sh010", var_8e3afd40d3c95b46];
}

// Namespace namespace_e9fb4fdd12296fce / namespace_3c940a00e48e77dd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x192b
// Size: 0x37
function jumpfunc() {
    if (getdvarint(@"hash_549df6ab370a2bc4", 1)) {
        self lerpfovscalefactor(0, 0);
        self setclientdvar(@"hash_71c6c0b8428e44a7", 0);
    }
}

// Namespace namespace_e9fb4fdd12296fce / namespace_3c940a00e48e77dd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x196a
// Size: 0x85
function function_dc0bc83a31193177() {
    self endon("disconnect");
    self lerpfov(65, 0.5);
    if (getdvarint(@"hash_549df6ab370a2bc4", 1)) {
        self lerpfovscalefactor(1, 0.5);
    }
    wait 1;
    if (isdefined(self.var_1f0a019572c9f8e2)) {
        self.var_1f0a019572c9f8e2 = undefined;
        self disablephysicaldepthoffieldscripting();
    }
    self setclientdvar(@"hash_df1dc712c4a91588", 65);
    self setclientdvar(@"hash_71c6c0b8428e44a7", 0);
}

// Namespace namespace_e9fb4fdd12296fce / namespace_3c940a00e48e77dd
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x19f7
// Size: 0x21
function private function_cd7e1a37d5e2ca2b() {
    level.nosuspensemusic = 1;
    thread scripts\mp\music_and_dialog::stopsuspensemusic();
    function_f1aed36ab4598ea("mp_gamemode_br_infils_jup");
}

// Namespace namespace_e9fb4fdd12296fce / namespace_3c940a00e48e77dd
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1a20
// Size: 0xb
function private function_26874fd7694aa29() {
    level thread function_8d050f78fe1d180f();
}

// Namespace namespace_e9fb4fdd12296fce / namespace_3c940a00e48e77dd
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1a33
// Size: 0x42
function private function_8d050f78fe1d180f() {
    clearmusicstate();
    function_4e8ba327eb12540c(level.players, "jup_br_infil_igc", 1);
    wait 2.5;
    function_c79f9300ee85f805(level.players, "mp_br_lobby_fade", 0);
}

// Namespace namespace_e9fb4fdd12296fce / namespace_3c940a00e48e77dd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a7d
// Size: 0x15
function infilcleanup() {
    function_e66f664ad726f2e();
    function_f4e0ff5cb899686d("mp_gamemode_br_infils_jup");
}

// Namespace namespace_e9fb4fdd12296fce / namespace_3c940a00e48e77dd
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a9a
// Size: 0x5a
function function_52bedae2ced8e191() {
    cloudfx = level._effect["vfx_br_ac130_clouds"];
    var_8b26de022a9f35f = level._effect["vfx_br_ac130_oneshot"];
    if (isdefined(cloudfx)) {
        stopfxontag(cloudfx, self, "tag_body");
    }
    if (isdefined(var_8b26de022a9f35f)) {
        stopfxontag(var_8b26de022a9f35f, self, "tag_body");
    }
}

// Namespace namespace_e9fb4fdd12296fce / namespace_3c940a00e48e77dd
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1afc
// Size: 0xb0
function private function_cc1b64e82fd4680c(players) {
    assertex(isarray(players));
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

// Namespace namespace_e9fb4fdd12296fce / namespace_3c940a00e48e77dd
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1bb5
// Size: 0x8e
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

// Namespace namespace_e9fb4fdd12296fce / namespace_3c940a00e48e77dd
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1c4b
// Size: 0x8e
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

// Namespace namespace_e9fb4fdd12296fce / namespace_3c940a00e48e77dd
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1ce1
// Size: 0xbf
function private leaderdialog(dialogref) {
    if (!getdvarint(@"hash_bfded00ac93c45b7", 1)) {
        return;
    }
    soundlength = 2;
    if (soundexists(dialogref)) {
        soundlength = lookupsoundlength(dialogref, 1) / 1000;
    }
    soundname = game["dialog"][dialogref];
    foreach (player in level.infilstruct.players) {
        if (!isdefined(player)) {
            continue;
        }
        player queuedialogforplayer(soundname, dialogref, soundlength);
    }
}

