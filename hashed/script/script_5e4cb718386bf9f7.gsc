#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\gametypes\wm_utility.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\common\anim.gsc;
#using scripts\mp\anim.gsc;
#using script_187e2c28364e465b;
#using scripts\common\scene.gsc;
#using scripts\common\callbacks.gsc;
#using script_431a70e06eeb5a42;
#using script_66a4282ca5c9d2e;
#using script_212374fdf52d6acc;
#using script_7f28ea235474d71a;
#using script_545684ac3072093;
#using scripts\mp\load.gsc;
#using scripts\common\create_script_utility.gsc;
#using script_1eeaf988a0c595ae;
#using script_778e33bf3d2df41d;
#using script_7e8f10032371d1cc;
#using script_426907b8572aab6b;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_518ae857a3d351c;
#using scripts\mp\gametypes\wm_objectives.gsc;
#using scripts\mp\gametypes\wm_ending.gsc;
#using script_1bf7efeac8beb6f7;
#using scripts\mp\flags.gsc;
#using script_26b89331149b1719;
#using script_48814951e916af89;
#using script_24fbedba9a7a1ef4;
#using scripts\mp\gametypes\wm.gsc;
#using script_261f1b574c15eab1;
#using script_3a535b44f9ecc6df;
#using script_2d3fead1b9e1d7e5;
#using script_69a61780e1cc21a9;
#using script_49314540c657d352;
#using script_36967ce8ee2ea745;
#using script_66e0e331f9783820;
#using script_7abaa04d5f9fc22e;
#using script_1d1428a3b7b402b0;
#using script_248ec5040062d3ce;
#using script_2d4b9c58ed0e3d91;
#using script_6bc507afe7a93a3;
#using script_255133686f2d76c0;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\outofbounds.gsc;
#using scripts\mp\gametypes\wm_ui.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\common\elevators.gsc;
#using scripts\mp\gametypes\wm_buildable.gsc;
#using script_62384cde1a08c286;
#using scripts\mp\compass.gsc;

#namespace mp_jup_skydiving;

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1618
// Size: 0x2ce
function main() {
    namespace_c3acf396fb44027e::main();
    namespace_173624e99283613e::main();
    namespace_e66a7ed3598f3d7a::main();
    namespace_1c0403ec08adfbe0::main();
    namespace_6bb2e038a2adbe49::main();
    initvehicles();
    scripts\mp\load::main();
    scripts\common\create_script_utility::initialize_create_script();
    level thread namespace_b2eadc240c08ac72::main();
    level thread namespace_c8ab2d84daadcbf3::main();
    level thread namespace_ef375236ec813f3e::main();
    level thread namespace_f97e60c79d766629::main();
    scripts\cp_mp\utility\game_utility::registerlargemap();
    scripts\cp_mp\utility\game_utility::function_3673befc7dcade8b();
    namespace_66ade5cda10fe3aa::init();
    function_e27bc4a5e8e27440();
    if (!isdefined(level.outofboundstriggers)) {
        level.outofboundstriggers = getentarray("OutOfBounds", "targetname");
    }
    setupminimap("compass_map_mp_jup_skydiving", undefined, undefined, "zone_1");
    setdvar(@"r_umbraMinObjectContribution", 8);
    setdvar(@"hash_9365c7a237edaa2f", 1);
    level.parachutecancutautodeploy = 1;
    level.parachutecancutparachute = 1;
    game["attackers"] = "allies";
    game["defenders"] = "axis";
    game["allies_outfit"] = "urban";
    game["axis_outfit"] = "woodland";
    if (scripts\cp_mp\utility\game_utility::function_d04af493b6e718ac()) {
        scripts\mp\gametypes\wm_objectives::function_333f4c66e6305891(10, ["_a", "_b", "_c"], "zone_1", "", function_d4b2873d01de6c04(10));
        scripts\mp\gametypes\wm_objectives::function_333f4c66e6305891(11, ["_d", "_e", "_f"], "zone_2", ["wm_escort_tank_path", "capture_zone_wheelson_first", "capture_zone_wheelson_second"], function_d4b2873d01de6c04(11));
        scripts\mp\gametypes\wm_objectives::function_333f4c66e6305891(12, ["_g", "_h", "_i", "_j"], "zone_3", ["flag_begin_1", "flag_begin_2", "flag_end", "capture_zone"], function_d4b2873d01de6c04(12));
        level.var_f24db6a5246641cb = &function_f24db6a5246641cb;
        level.wmonplayerkilled = &wmonplayerkilled;
        level.var_77a7be006731f124 = "scripted_widget_objective_tracker_jup_wm_skydiving";
        scripts\mp\gametypes\wm_ending::function_1c915051680a9364(&function_d69acc92a86dd80b, &function_d5f16f7e888c59d3);
        level function_850846af3c63dab1();
        level thread initai();
        level thread function_bdccfc7ecc6306c1();
        namespace_cbf64df67c956f3c::init();
        if (!getdvarint(@"hash_eeef9f80e6c23588", 0)) {
            level thread namespace_d99736a82ac4e63b::init();
            level thread function_b9730bfe1e8b9f81();
            level thread function_dce86aec5b302384();
        }
        /#
            level thread function_e393d662064dffce();
            level thread function_1e57e0eff0416516();
        #/
    }
    level callback::add("on_wm_round_end", &function_7a49dcb707410ca2);
    level callback::add("on_wm_round_end", &function_c294f9788942533b);
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18ee
// Size: 0xec
function function_850846af3c63dab1() {
    level.enablezombie = getdvarint(@"hash_1196c97cf6cee66e", 0);
    level.var_8034530507c48231 = getdvarint(@"hash_9b1a6c207a13de7", 1);
    level.requiredplayercountoveride = 1;
    level.requiredplayercount["allies"] = 6;
    level.requiredplayercount["axis"] = 6;
    game["dialog"]["wm_oob_atk_skydiving"] = "dx_mp_skyd_game_seal_oobk";
    game["dialog"]["wm_oob_def_skydiving"] = "dx_mp_skyd_game_spet_oobd";
    level.var_c99eed54a2e150c7 = "wm_oob_atk_skydiving";
    level.var_e7cbc43f8f9aa5d3 = "wm_oob_def_skydiving";
    level.var_7b3187b12cba9559 = getent("unable_tank_nearby", "script_noteworthy");
    level.var_673860e74c8ec9d1 = getentarray("destroy_tac_items", "script_noteworthy");
    level.spawnintermissiondelayseconds = 10;
    scripts\mp\flags::gameflaginit("wheelson_reach_hack_point_final", 0);
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19e2
// Size: 0xff
function function_bdccfc7ecc6306c1() {
    flag_wait("onStartGameTypeFinished");
    level thread namespace_f1904f34c0b223c1::init();
    function_28c9bb84699d73b2();
    level.var_57b13482577dd10 = getentarray("tac_cover_dst_trigger", "script_noteworthy");
    level.var_4538f9d8dc0b9007 = &function_602c658374655858;
    if (isdefined(level.cratedropdata)) {
        if (isdefined(level.cratedropdata.heliheight)) {
            level.cratedropdata.heliheight += 5000;
        }
        level thread function_10137d9104d0f35c();
    }
    level thread function_90371f43aad9292a();
    level thread function_2825d48b0ba8d908();
    level thread function_e92f5d2e481565b1();
    level thread function_90c5aa738228d4df();
    level thread function_1eaefd55b8e356c7();
    level thread function_2d6d7d97de343d0f();
    level thread function_bc36ba717880033c();
    level thread function_14e9a0244a570ff6();
    level thread function_fd3c293d8f2b219e();
    level thread function_a5f8312fdbf97755();
    level thread function_7d25484659308d59();
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ae9
// Size: 0x4a
function initai() {
    namespace_bfef6903bca5845d::init();
    namespace_bfef6903bca5845d::function_c8393014dd7f8ab6();
    namespace_bfef6903bca5845d::function_ba4022744dce59f6("show");
    if (!getdvarint(@"hash_8f919767a3bc1051", 1)) {
        level.agent_funcs["zombie"]["on_damaged"] = &namespace_daa149ca485fd50a::function_dffac413ed66bcd0;
    }
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b3b
// Size: 0xad
function function_f24db6a5246641cb() {
    game["dialog"]["obj_atk_times_up_sixty"] = "dx_mp_skyd_game_seal_cssa";
    game["dialog"]["obj_def_times_up_sixty"] = "dx_mp_skyd_game_spet_cssd";
    game["dialog"]["obj_atk_times_up_thirty"] = "dx_mp_skyd_game_seal_csta";
    game["dialog"]["obj_def_times_up_thirty"] = "dx_mp_skyd_game_spet_cstd";
    game["dialog"]["obj_atk_times_up_ten"] = "dx_mp_skyd_game_seal_cstk";
    game["dialog"]["obj_def_times_up_ten"] = "dx_mp_skyd_game_spet_cstf";
    scripts\mp\gametypes\wm::function_ca18dc1a088a7245(60, "obj_atk_times_up_sixty", "obj_def_times_up_sixty");
    scripts\mp\gametypes\wm::function_ca18dc1a088a7245(30, "obj_atk_times_up_thirty", "obj_def_times_up_thirty");
    scripts\mp\gametypes\wm::function_ca18dc1a088a7245(10, "obj_atk_times_up_ten", "obj_def_times_up_ten");
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bf0
// Size: 0x17
function wmonplayerkilled() {
    if (istrue(self.ingas)) {
        namespace_f1904f34c0b223c1::function_7ff7466f14522ce3(0);
    }
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c0f
// Size: 0x2aa
function function_d4b2873d01de6c04(index) {
    if (!isdefined(level.var_ebec9ab53ddcfaa2)) {
        params = [];
        params["hackUploadTime"] = function_ef4d323f56385843("sdHackUploadTime", 28);
        params["leaderDialogAttackers"] = "obj1_atk_win_skydiving";
        params["leaderDialogDefenders"] = "obj1_def_lost_skydiving";
        params["transitionSplash"] = ["jup_wm_transition_launchfacility_escort", "jup_wm_transition_launchfacility_escort_defend"];
        params["hackObjective"] = [];
        params["hackObjective"]["openRoofTime"] = 10;
        params["hackObjective"]["targetname"] = "bombzone_unlock";
        params["usingVisualHintString"] = %MP_JUP_LAUNCHFACILITY/CONSOLE_LAUNCH;
        params["hackUseTime"] = getdvarfloat(@"hash_7deb1a2a556f0f68", 3);
        params["hackRestoreTime"] = getdvarfloat(@"hash_71feab7b56287a35", 4);
        params["bombObjective"] = [];
        params["bombObjective"]["targetname"] = "bombzone";
        params["hack_zone_upload_complete_splash_friendly"] = "jup_wm_activate_first_control_panel_attacker";
        params["hack_zone_upload_complete_splash_enemy"] = "jup_wm_activate_first_control_panel_defender";
        params["hack_zone_upload_full_complete_splash_friendly"] = "jup_wm_open_rooftop_hatch_attacker";
        params["hack_zone_upload_full_complete_splash_enemy"] = "jup_wm_open_rooftop_hatch_defender";
        level.var_ebec9ab53ddcfaa2[10] = params;
        params = [];
        params["useP2P"] = getdvarint(@"hash_53cf3fb27a4e4e35", 0) != 0;
        params["canStopByDefenders"] = istrue(function_29227adb79acc568("tankContestable", 1));
        params["progressByActualDistance"] = 1;
        params["vehicleRef"] = "veh_jup_skydiving_wheelson";
        params["vehicleSpeed"] = function_ef4d323f56385843("sdVehicleSpeed", 4);
        params["vehicleRef.vehObjZOffset"] = 65;
        params["tankNearbyRange"] = getdvarint(@"hash_a05ad819aecbb000", 200);
        params["wheelsonCaptureTime"] = dvarfloatvalue("wheelsonCaptureTime", 30, 0, 120);
        params["airdrop_offset"] = (0, 0, 1450);
        params["wheelsonRetreatSpeed"] = getdvarint(@"hash_7979684c0c17d015", 1.5);
        params["leaderDialogAttackers"] = "obj2_atk_win_skydiving";
        params["leaderDialogDefenders"] = "obj2_def_lost_skydiving";
        params["transitionSplash"] = ["jup_wm_transition_skydiving_zone1to2", "jup_wm_transition_skydiving_zone1to2_defend"];
        params["spawn_wheelson_delay_time"] = getdvarint(@"hash_a88c8014d8aa26e7", 60);
        level.var_ebec9ab53ddcfaa2[11] = params;
        params = [];
        params["leaderDialogAttackers"] = "obj3_atk_win_skydiving";
        params["leaderDialogDefenders"] = "obj3_def_lost_skydiving";
        params["transitionSplash"] = ["jup_wm_transition_skydiving_zone2to3", "jup_wm_transition_skydiving_zone2to3_defend"];
        level.var_ebec9ab53ddcfaa2[12] = params;
    }
    return level.var_ebec9ab53ddcfaa2[index];
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1ec2
// Size: 0x68
function initvehicles() {
    level.var_1b4da6b781c9dfbd = 1;
    namespace_8db7d778efdc3d65::main();
    namespace_15896d40cab0d429::main();
    namespace_a8c01726524388f5::main();
    namespace_d8c2d739478db8bb::main();
    namespace_a8b2611e1c2c0f9c::main();
    namespace_65ad5249b19d5d41::main();
    namespace_9972b4aee3d673ca::main();
    namespace_a5c3c313b4f6886a::main();
    namespace_3568ab3cfd523b38::main();
    namespace_405c71940c7ec9ea::main();
    namespace_8624e3257d13b029::main();
    namespace_ea79ad160580b4e7::main();
    namespace_e0be878fcf65a96c::main();
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f32
// Size: 0x26e
function function_d69acc92a86dd80b() {
    namespace_1c0403ec08adfbe0::function_83165e6c3fba43ff((-45, -110, 0), (1, 0.9, 0.75), 0.016);
    intermission = getent("mp_global_intermission", "classname");
    animstruct = spawnstruct();
    animstruct.origin = intermission.origin;
    animstruct.angles = intermission.angles;
    animstruct.cam = animstruct scripts\mp\gametypes\wm_ending::create_cam();
    animstruct.cam.origin = animstruct.origin;
    animstruct.cam.angles = animstruct.angles;
    var_c4359ab5def7f9b9 = getstruct("attacker_exfil", "targetname");
    var_c4359ab5def7f9b9 scene::set_scriptbundle("jup_scene_wm_skydiving_attacker_exfil");
    level.var_a12c755dc79cd6f3 = 1;
    function_62247a3afa8950b6();
    playersinscene = [];
    foreach (player in level.players) {
        if (!isdefined(player) || !scripts\mp\utility\teams::isgameplayteam(player.pers["team"])) {
            continue;
        }
        player scripts\mp\gametypes\wm_utility::function_9a2fc80f0c0ef3b0();
        if (is_equal(player.pers["team"], game["attackers"])) {
            playersinscene[playersinscene.size] = player;
            continue;
        }
        player playerhide();
    }
    shots = var_c4359ab5def7f9b9 scene::function_8a37fe423de2b9db();
    scene::add_scene_func(var_c4359ab5def7f9b9, &function_ff1e7af2ffb8692e, shots[1]);
    scene::add_scene_func(var_c4359ab5def7f9b9, &function_b75465ae12ace0ab, shots[2]);
    scene::add_scene_func(var_c4359ab5def7f9b9, &function_c9ef35515ffc769a, "shot_010");
    scene::add_scene_func(var_c4359ab5def7f9b9, &function_c9ef34515ffc7467, "shot_020");
    scene::add_scene_func(var_c4359ab5def7f9b9, &function_c9ef33515ffc7234, "shot_030");
    var_c4359ab5def7f9b9 scene::pre_stream(playersinscene);
    var_c4359ab5def7f9b9 thread scene::play(playersinscene);
    scenelength = var_c4359ab5def7f9b9 scripts\mp\gametypes\wm_utility::function_e31fc10a143fc19() - 10;
    if (scenelength > 0) {
        wait scenelength;
    }
    return animstruct.cam;
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21a9
// Size: 0xe
function function_c9ef35515ffc769a() {
    function_584da1d8f2df50cc("jup_skydiving_exfil_attacker_shot_01");
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21bf
// Size: 0xe
function function_c9ef34515ffc7467() {
    function_584da1d8f2df50cc("jup_skydiving_exfil_attacker_shot_02");
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21d5
// Size: 0xe
function function_c9ef33515ffc7234() {
    function_584da1d8f2df50cc("jup_skydiving_exfil_attacker_shot_03");
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x21eb
// Size: 0x17
function function_ff1e7af2ffb8692e() {
    level thread function_9b4edffa3400ada1();
    exploder("attacker_exfil");
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x220a
// Size: 0xc4
function function_9b4edffa3400ada1() {
    level endon("game_ended");
    scripts\mp\anim::function_3c8f0102ea5254f3(190);
    foreach (player in level.players) {
        level thread scripts\cp_mp\utility\game_utility::fadetoblackforplayer(player, 1, 0.5);
    }
    wait 0.5;
    foreach (player in level.players) {
        level thread scripts\cp_mp\utility\game_utility::fadetoblackforplayer(player, 0, 1);
    }
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22d6
// Size: 0xe
function function_b75465ae12ace0ab() {
    kill_exploder("attacker_exfil");
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22ec
// Size: 0x271
function function_d5f16f7e888c59d3() {
    namespace_1c0403ec08adfbe0::function_83165e6c3fba43ff((-38, 138, 0), (1, 0.9, 0.75), 0.02);
    intermission = getent("mp_global_intermission", "classname");
    animstruct = spawnstruct();
    animstruct.origin = intermission.origin;
    animstruct.angles = intermission.angles;
    animstruct.cam = animstruct scripts\mp\gametypes\wm_ending::create_cam();
    animstruct.cam.origin = animstruct.origin;
    animstruct.cam.angles = animstruct.angles;
    var_c4359ab5def7f9b9 = getstruct("defender_exfil", "targetname");
    var_c4359ab5def7f9b9 scene::set_scriptbundle("jup_scene_wm_skydiving_defender_exfil");
    level.var_a12c755dc79cd6f3 = 1;
    function_62247a3afa8950b6();
    playersinscene = [];
    foreach (player in level.players) {
        if (!isdefined(player) || !scripts\mp\utility\teams::isgameplayteam(player.pers["team"])) {
            continue;
        }
        player scripts\mp\gametypes\wm_utility::function_9a2fc80f0c0ef3b0();
        if (is_equal(player.pers["team"], game["defenders"])) {
            playersinscene[playersinscene.size] = player;
            continue;
        }
        player playerhide();
    }
    shots = var_c4359ab5def7f9b9 scene::function_8a37fe423de2b9db();
    scene::add_scene_func(var_c4359ab5def7f9b9, &function_23ead4b32b3f6e5, shots[0]);
    scene::add_scene_func(var_c4359ab5def7f9b9, &function_3b1605eb06863e62, "shot_010");
    scene::add_scene_func(var_c4359ab5def7f9b9, &function_3b1604eb06863c2f, "shot_020");
    scene::add_scene_func(var_c4359ab5def7f9b9, &function_3b1603eb068639fc, "shot_030a");
    scene::add_scene_func(var_c4359ab5def7f9b9, &function_3b1602eb068637c9, "shot_060");
    var_c4359ab5def7f9b9 scene::pre_stream(playersinscene);
    var_c4359ab5def7f9b9 thread scene::play(playersinscene);
    scenelength = var_c4359ab5def7f9b9 scripts\mp\gametypes\wm_utility::function_e31fc10a143fc19() - 10 - 1;
    if (scenelength > 0) {
        wait scenelength;
    }
    return animstruct.cam;
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2566
// Size: 0xe
function function_3b1605eb06863e62() {
    function_584da1d8f2df50cc("jup_skydiving_exfil_defender_shot_01");
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x257c
// Size: 0xe
function function_3b1604eb06863c2f() {
    function_584da1d8f2df50cc("jup_skydiving_exfil_defender_shot_02");
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2592
// Size: 0xe
function function_3b1603eb068639fc() {
    function_584da1d8f2df50cc("jup_skydiving_exfil_defender_shot_03");
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x25a8
// Size: 0xe
function function_3b1602eb068637c9() {
    function_584da1d8f2df50cc("jup_skydiving_exfil_defender_shot_04");
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x25be
// Size: 0x68
function function_584da1d8f2df50cc(soundalias) {
    foreach (player in level.players) {
        if (!isai(player)) {
            player playlocalsound(soundalias);
        }
    }
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x262e
// Size: 0xe
function function_23ead4b32b3f6e5() {
    exploder("defender_exfil");
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2644
// Size: 0x5c
function function_10137d9104d0f35c() {
    level endon("game_ended");
    scripts\mp\flags::gameflagwait("zone_2" + "_objective_start");
    level.var_59aa0529c1cc5a3b = 0;
    level waittill("part_3_leak");
    while (!isdefined(level.var_73b072a7ebe7cb17)) {
        waitframe();
    }
    while (level.var_73b072a7ebe7cb17.size > 0) {
        waitframe();
    }
    level.var_59aa0529c1cc5a3b = 1;
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x26a8
// Size: 0xd6
function function_1eaefd55b8e356c7() {
    level endon("game_ended");
    level._effect["open_roof_dust"] = loadfx("vfx/jup/level/mp_jup_launchfacility/vfx_jup_launchfacility_air_cliff_falling_dust_lrg_01.vfx");
    level waittill("prematch_done");
    var_3481c88117495d50 = getentarray("zone1_roof", "targetname");
    var_797f676eac2f5f5d = getstructarray("roof_origin", "targetname");
    var_24e1eee4a6f213b7 = getentitylessscriptablearray("deployable_roof", "script_noteworthy");
    var_633452f052c3d4ba = getscriptablearray("roof_light", "script_noteworthy");
    var_24e1eee4a6f213b7[0] setscriptablepartstate("light", "off");
    level waittill("hack_zone_upload_complete");
    level thread function_c8a59331ffa83829(var_3481c88117495d50, var_797f676eac2f5f5d, var_24e1eee4a6f213b7, 0.5, var_633452f052c3d4ba);
    level waittill("hack_zone_upload_full_complete");
    level thread function_c8a59331ffa83829(var_3481c88117495d50, var_797f676eac2f5f5d, var_24e1eee4a6f213b7, 1, var_633452f052c3d4ba);
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x2786
// Size: 0x465
function function_c8a59331ffa83829(var_3481c88117495d50, var_797f676eac2f5f5d, var_24e1eee4a6f213b7, ratio, var_633452f052c3d4ba) {
    if (isdefined(level.zone.objective.params["hackObjective"]["openRoofTime"])) {
        openRoofTime = level.zone.objective.params["hackObjective"]["openRoofTime"];
    } else {
        openRoofTime = 10;
    }
    while (istrue(var_24e1eee4a6f213b7[0].ismoving)) {
        waitframe();
    }
    foreach (roof in var_3481c88117495d50) {
        foreach (var_51b2dad073cd285c in var_797f676eac2f5f5d) {
            if (roof.script_noteworthy == var_51b2dad073cd285c.script_noteworthy) {
                origin = var_51b2dad073cd285c.origin;
                if (ratio == 0.5) {
                    origin = (var_51b2dad073cd285c.origin - roof.origin) * 3 / 10 + roof.origin;
                }
                roof moveto(origin, openRoofTime, 0.1, 0.5);
                var_42515338db8d7dc5 = getent(roof.target, "targetname");
                var_d9016ba0c600cd99 = getstruct(var_42515338db8d7dc5.target, "targetname");
                origin = var_d9016ba0c600cd99.origin;
                if (ratio == 0.5) {
                    origin = (var_d9016ba0c600cd99.origin - var_42515338db8d7dc5.origin) * 3 / 10 + var_42515338db8d7dc5.origin;
                }
                var_42515338db8d7dc5 moveto(origin, openRoofTime, 0.1, 0.5);
            }
        }
    }
    var_24e1eee4a6f213b7[0].ismoving = 1;
    var_24e1eee4a6f213b7[0] setscriptablepartstate("light", "red_flash");
    var_24e1eee4a6f213b7[0] setscriptablepartstate("sound", "moving");
    function_e45e5fd94ec4af36(0.3, 0.2, 0.1, 1, var_24e1eee4a6f213b7[0].origin, 1000, 1500, 3000);
    function_e45e5fd94ec4af36(0.15, 0.15, 0.15, 15, var_24e1eee4a6f213b7[0].origin, 1000, 1500, 3000);
    thread function_765136e4fecc97c3(10);
    foreach (light in var_633452f052c3d4ba) {
        light setscriptablepartstate("becon_light", "red_rotate");
    }
    wait 7.5;
    foreach (roof in var_3481c88117495d50) {
        playfx(getfx("open_roof_dust"), roof.origin);
    }
    wait 1.5;
    var_24e1eee4a6f213b7[0] setscriptablepartstate("sound", "stop");
    wait 0.5;
    function_e45e5fd94ec4af36(0.3, 0.2, 0.1, 1, var_24e1eee4a6f213b7[0].origin, 1000, 1500, 3000);
    wait 0.5;
    color = "red";
    if (ratio == 1) {
        color = "green";
    }
    var_24e1eee4a6f213b7[0] setscriptablepartstate("light", color);
    foreach (light in var_633452f052c3d4ba) {
        light setscriptablepartstate("becon_light", color);
    }
    var_24e1eee4a6f213b7[0].ismoving = 0;
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2bf3
// Size: 0xb2
function function_765136e4fecc97c3(var_8487dbb21cc6a45c) {
    level endon("game_ended");
    level endon("obj_contest_zone_robbed");
    level endon("zone_1_objective_end");
    while (var_8487dbb21cc6a45c > 0) {
        playsoundatpos((-12084, -24703, 5680), "jup_skydiving_zone01_door_alarm_fl");
        playsoundatpos((-12275, -23812, 5680), "jup_skydiving_zone01_door_alarm_fr");
        playsoundatpos((-11552, -23659, 5680), "jup_skydiving_zone01_door_alarm_rl");
        playsoundatpos((-11363, -24544, 5680), "jup_skydiving_zone01_door_alarm_rr");
        if (istrue(level.objectives["_c"].complete)) {
            break;
        }
        var_8487dbb21cc6a45c--;
        var_8487dbb21cc6a45c--;
        wait 2;
    }
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2cad
// Size: 0x2b5
function function_2825d48b0ba8d908() {
    level endon("game_ended");
    level endon("zone_2" + "_objective_end");
    level thread function_b0ab5d3af5ae8090();
    var_fef5ed64838d9c8b = getentarray("zone_1_retreat_elevator_cable", "targetname");
    elevatordoors = getentarray("exit_elevator_door", "script_noteworthy");
    foreach (cable in var_fef5ed64838d9c8b) {
        cable hide();
    }
    foreach (door in elevatordoors) {
        door hide();
    }
    var_d20c313a3b706ddc = getentitylessscriptablearray("scriptable_military_ascendertop_heavy", "classname");
    foreach (ascender in var_d20c313a3b706ddc) {
        ascender setscriptablepartstate("top", "off");
    }
    level.var_53dde20ce19c6235 = &function_96c67c16e4e1963b;
    level.var_72e0f43095476f99 = &function_16421f61ca024019;
    if (getdvarint(@"scr_game_infilSkip", 0) == 0) {
        scripts\mp\flags::gameflagwait("prematch_done");
    }
    foreach (door in elevatordoors) {
        door show();
        door.moverdoesnotkill = 1;
    }
    scripts\mp\flags::function_1240434f4201ac9d("zone_1" + "_objective_end");
    foreach (cable in var_fef5ed64838d9c8b) {
        cable show();
    }
    foreach (ascender in var_d20c313a3b706ddc) {
        ascender setscriptablepartstate("top", "use");
    }
    elevatordoors function_84a85e60d04b1e27(1);
    scripts\mp\flags::function_1240434f4201ac9d("zone_2" + "_objective_start");
    level waittill("zone_2_retreat_truly_finished");
    elevatordoors function_84a85e60d04b1e27(0);
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x2f6a
// Size: 0x72
function function_96c67c16e4e1963b(instance, player, edgeindex, isvertical, isinverted, var_9cb491b9ab8ea354) {
    if (!istrue(isinverted)) {
        s = spawnstruct();
        s.type = "HINT_NOBUTTON";
        s.string = %;
        return s;
    }
    return undefined;
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x2fe4
// Size: 0x30
function function_16421f61ca024019(instance, player, edgeindex, isinverted) {
    if (!istrue(isinverted)) {
        return 0;
    }
    return 1;
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x301c
// Size: 0x2d3
function function_84a85e60d04b1e27(var_cfa6055065f51e35) {
    if (!isdefined(var_cfa6055065f51e35)) {
        var_cfa6055065f51e35 = 1;
    }
    elevatordoors = self;
    var_5b1f5f16058b8397 = getentarray("elevator_static_door", "script_noteworthy");
    var_e99c3a562cad4676 = 1;
    if (istrue(var_cfa6055065f51e35)) {
        foreach (door in elevatordoors) {
            var_b5475204a906e54c = ter_op(door.targetname == "left", 1, -1);
            var_ec8d350416c40dcd = anglestoright(door.angles) * 40 * var_b5475204a906e54c;
            var_4182fb045446cdc5 = door.origin + var_ec8d350416c40dcd;
            door moveto(var_4182fb045446cdc5, var_e99c3a562cad4676, 0.5);
        }
        wait var_e99c3a562cad4676 + 0.5;
        foreach (door in elevatordoors) {
            door notsolid();
        }
        foreach (frame in var_5b1f5f16058b8397) {
            frame notsolid();
        }
        return;
    }
    foreach (door in elevatordoors) {
        var_b5475204a906e54c = ter_op(door.targetname == "left", 1, -1);
        var_ec8d350416c40dcd = anglestoleft(door.angles) * 40 * var_b5475204a906e54c;
        var_4182fb045446cdc5 = door.origin + var_ec8d350416c40dcd;
        door.moverdoesnotkill = 0;
        door moveto(var_4182fb045446cdc5, var_e99c3a562cad4676, 0.5);
    }
    wait var_e99c3a562cad4676 + 0.5;
    foreach (door in elevatordoors) {
        door solid();
        door.moverdoesnotkill = 1;
    }
    foreach (frame in var_5b1f5f16058b8397) {
        frame solid();
    }
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x32f7
// Size: 0x256
function function_b0ab5d3af5ae8090() {
    level endon("game_ended");
    level endon("zone_2" + "_objective_end");
    var_724beadfe7f1b30c = getent("set_OOB_immune", "script_noteworthy");
    removetrigger = getent("remove_OOB_immune", "script_noteworthy");
    var_86d1df2413175870 = [];
    scripts\mp\flags::function_1240434f4201ac9d("zone_1" + "_objective_end");
    retreatstarttime = gettime();
    while (true) {
        timeused = gettime() - retreatstarttime;
        if (timeused >= 30000) {
            foreach (player in var_86d1df2413175870) {
                player.var_66d6b2345ddc7da8 = undefined;
                player.var_d24048ab5fb37690 = undefined;
            }
            wait 5;
            level notify("zone_2_retreat_truly_finished");
            break;
        }
        var_99ccfc16e1128272 = [];
        foreach (player in level.players) {
            if (is_equal(player.pers["team"], game["attackers"])) {
                continue;
            }
            if (!isalive(player)) {
                player.var_66d6b2345ddc7da8 = 0;
                player.var_d24048ab5fb37690 = undefined;
                continue;
            }
            if (istrue(player.var_66d6b2345ddc7da8)) {
                if (ispointinvolume(player.origin, removetrigger)) {
                    player.var_66d6b2345ddc7da8 = 0;
                    player.var_d24048ab5fb37690 = undefined;
                } else {
                    var_99ccfc16e1128272[var_99ccfc16e1128272.size] = player;
                }
                continue;
            }
            if (ispointinvolume(player.origin, var_724beadfe7f1b30c)) {
                player.var_66d6b2345ddc7da8 = 1;
                var_99ccfc16e1128272[var_99ccfc16e1128272.size] = player;
            }
        }
        var_86d1df2413175870 = var_99ccfc16e1128272;
        foreach (player in var_86d1df2413175870) {
            player.var_d24048ab5fb37690 = 1;
        }
        waitframe();
    }
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3555
// Size: 0x79
function function_90c5aa738228d4df() {
    level endon("game_ended");
    scripts\mp\flags::function_1240434f4201ac9d("zone_1" + "_objective_end");
    flag_wait_or_timeout("zone_2" + "_objective_end", 20);
    level.retreatend["zone_2"] = 1;
    scripts\mp\flags::function_1240434f4201ac9d("zone_2" + "_objective_end");
    flag_wait_or_timeout("zone_3" + "_objective_end", 20);
    level.retreatend["zone_3"] = 1;
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x35d6
// Size: 0x2b4
function function_64ff7f15870ec86c() {
    level endon("game_ended");
    if (getdvarint(@"hash_9a49531827cbbaa5", 0)) {
        return;
    }
    scripts\mp\flags::gameflagwait("prematch_done");
    var_8b4d9964a3632abb = getent("fallback_destination_trigger_zone_2", "targetname");
    while (true) {
        if (istrue(scripts\mp\flags::gameflag("zone_1" + "_objective_end"))) {
            break;
        }
        foreach (player in level.players) {
            if (player.origin[2] <= 5000 && !istrue(player.var_7fd12290e298a95b)) {
                player thread function_4ea402a6861b8db4(var_8b4d9964a3632abb, 3);
            }
        }
        waitframe();
    }
    foreach (player in level.players) {
        if (ispointinvolume(player.origin, var_8b4d9964a3632abb)) {
            player scripts\mp\gametypes\wm::function_a2d9ea22cacea5e9();
        }
    }
    while (true) {
        if (isdefined(level.retreatend) && istrue(level.retreatend["zone_2"])) {
            break;
        }
        foreach (player in level.players) {
            if (istrue(player.var_a0921327fd546e9)) {
                continue;
            }
            if (ispointinvolume(player.origin, var_8b4d9964a3632abb)) {
                player.var_a0921327fd546e9 = 1;
                continue;
            }
            if (player.origin[2] <= 5000 && !istrue(player.var_7fd12290e298a95b) && !istrue(player.var_d24048ab5fb37690)) {
                player thread function_4ea402a6861b8db4(var_8b4d9964a3632abb);
                player thread function_1d8ed6f710ae98b5(var_8b4d9964a3632abb);
            }
        }
        waitframe();
    }
    foreach (player in level.players) {
        if (player.origin[2] >= 5000 && !istrue(player.var_7fd12290e298a95b)) {
            player thread function_4ea402a6861b8db4(var_8b4d9964a3632abb);
            player thread function_1d8ed6f710ae98b5(var_8b4d9964a3632abb);
        }
    }
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3892
// Size: 0x72
function function_4ea402a6861b8db4(var_8b4d9964a3632abb, var_13014fb7b021de59) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self.var_7fd12290e298a95b = 1;
    time_limit = ter_op(isdefined(var_13014fb7b021de59), var_13014fb7b021de59, 5);
    if (scripts\mp\utility\player::isreallyalive(self)) {
        scripts\mp\outofbounds::enableoobimmunity(self);
        self.oobtriggertype = 1;
        scripts\mp\gametypes\wm_ui::function_557efb699f50447b(time_limit, undefined);
        thread scripts\mp\gametypes\wm::function_114808366456147a(time_limit);
    }
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x390c
// Size: 0x5c
function function_1d8ed6f710ae98b5(var_8b4d9964a3632abb) {
    level endon("game_ended");
    self endon("death_or_disconnect");
    while (!ispointinvolume(self.origin, var_8b4d9964a3632abb)) {
        waitframe();
    }
    self.var_a0921327fd546e9 = 1;
    self notify("left_wmOOB");
    self setclientomnvar("ui_out_of_bounds_type", 0);
    self setclientomnvar("ui_out_of_bounds_countdown", 0);
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3970
// Size: 0x104
function function_e92f5d2e481565b1() {
    level endon("game_ended");
    foreach (index, zone in level.zones) {
        if (index == "zone_1") {
            continue;
        }
        scripts\mp\flags::gameflagwait(index + "_objective_start");
        var_b89ada9c7c4f7ab0 = function_acf2f75c0fa08edc(index);
        function_996ac0eb7587bc95();
        foreach (player in level.players) {
            player thread function_e8c580cd4ea3ba34(var_b89ada9c7c4f7ab0, index);
        }
        level thread function_856103351944a41b(var_b89ada9c7c4f7ab0, index);
        level thread function_8570f609d1b5ad56(var_b89ada9c7c4f7ab0, index);
        level thread function_5cb1c4f04a3cb5ca(index);
    }
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a7c
// Size: 0x75
function function_996ac0eb7587bc95() {
    foreach (player in level.players) {
        player.var_c18d4c0351800d9a = 0;
        player.var_cff8ac1d2f02680b = 0;
        player.var_6f250da77d3bd5ac = 0;
    }
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3af9
// Size: 0x25b
function function_5cb1c4f04a3cb5ca(var_84f7e39587f529c4) {
    level endon("game_ended");
    level endon(var_84f7e39587f529c4 + "_objective_end");
    foreach (objstr in level.zone.objectives) {
        scripts\mp\objidpoolmanager::objective_playermask_hidefromall(level.objectives[objstr].objidnum);
    }
    if (var_84f7e39587f529c4 == "zone_2" && !isdefined(level.escortvehicles[0])) {
        level waittill("wheelson_spawn");
    }
    while (true) {
        if (isdefined(level.retreatend) && istrue(level.retreatend[var_84f7e39587f529c4])) {
            break;
        }
        foreach (player in level.players) {
            if (istrue(player.var_cff8ac1d2f02680b) && !istrue(player.var_6f250da77d3bd5ac)) {
                foreach (objstr in level.zone.objectives) {
                    if (!istrue(level.objectives[objstr].complete)) {
                        scripts\mp\objidpoolmanager::objective_playermask_addshowplayer(level.objectives[objstr].objidnum, player);
                    }
                }
                player.var_6f250da77d3bd5ac = 1;
            }
        }
        waitframe();
    }
    foreach (objstr in level.zone.objectives) {
        if (!istrue(level.objectives[objstr].complete)) {
            scripts\mp\objidpoolmanager::objective_playermask_showtoall(level.objectives[objstr].objidnum);
        }
    }
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3d5c
// Size: 0x79
function function_8570f609d1b5ad56(var_b89ada9c7c4f7ab0, index) {
    level endon("game_ended");
    level endon(index + "_objective_end");
    while (true) {
        player = level waittill("player_spawned");
        if (isdefined(level.retreatend) && istrue(level.retreatend[index])) {
            break;
        }
        if (!istrue(player.var_c18d4c0351800d9a)) {
            player thread function_e8c580cd4ea3ba34(var_b89ada9c7c4f7ab0, index);
        }
    }
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3ddd
// Size: 0x88
function function_856103351944a41b(indicators, var_84f7e39587f529c4) {
    level endon("game_ended");
    while (!isdefined(level.retreatend) || !istrue(level.retreatend[var_84f7e39587f529c4])) {
        waitframe();
    }
    foreach (indicator in indicators) {
        indicator scripts\mp\gameobjects::releaseid();
    }
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3e6d
// Size: 0x28e
function function_e8c580cd4ea3ba34(indicators, var_84f7e39587f529c4) {
    level endon("game_ended");
    self endon("disconnect");
    self.var_c18d4c0351800d9a = 1;
    self setclientomnvar("ui_wm_objective_show_match_status", 0);
    var_7ba52fe5cc4ccfef = getstruct("transition_corner_a", "script_noteworthy");
    var_7ba530e5cc4cd222 = getstruct("transition_corner_b", "script_noteworthy");
    var_7ba531e5cc4cd455 = getstruct("transition_corner_c", "script_noteworthy");
    var_7ba52ae5cc4cc4f0 = getstruct("transition_corner_d", "script_noteworthy");
    if (var_84f7e39587f529c4 == "zone_2") {
        if (is_equal(self.pers["team"], game["attackers"])) {
            scripts\mp\objidpoolmanager::objective_playermask_addshowplayer(indicators[0].objidnum, self);
        } else {
            scripts\mp\objidpoolmanager::objective_playermask_addshowplayer(indicators[1].objidnum, self);
            scripts\mp\objidpoolmanager::objective_playermask_addshowplayer(indicators[2].objidnum, self);
        }
    } else {
        foreach (indicator in indicators) {
            scripts\mp\objidpoolmanager::objective_playermask_addshowplayer(indicator.objidnum, self);
        }
    }
    if (var_84f7e39587f529c4 == "zone_2") {
        while (indicators[0].origin[2] - self.origin[2] < 400) {
            waitframe();
        }
    } else {
        while (true) {
            if (!scripts\common\elevators::function_cba565314ac6a79e(self.origin, var_7ba52fe5cc4ccfef.origin, var_7ba530e5cc4cd222.origin, var_7ba531e5cc4cd455.origin, var_7ba52ae5cc4cc4f0.origin)) {
                if (indicators[0].origin[2] - self.origin[2] > 400) {
                    break;
                }
            } else {
                break;
            }
            waitframe();
        }
    }
    if (var_84f7e39587f529c4 != "zone_3") {
        self setclientomnvar("ui_wm_objective_show_match_status", 1);
    }
    foreach (ent in indicators) {
        scripts\mp\objidpoolmanager::objective_playermask_hidefrom(ent.objidnum, self);
    }
    self.var_cff8ac1d2f02680b = 1;
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4103
// Size: 0x244
function function_acf2f75c0fa08edc(var_84f7e39587f529c4) {
    var_b89ada9c7c4f7ab0 = [];
    if (var_84f7e39587f529c4 == "zone_2") {
        var_b89ada9c7c4f7ab0[0] = spawn("script_model", (-11828, -24228, 5100));
        var_b89ada9c7c4f7ab0[1] = spawn("script_model", (-13779, -24301, 5300));
        var_b89ada9c7c4f7ab0[2] = spawn("script_model", (-13646, -24870, 5300));
    } else {
        var_e9caac83c9b4cc34 = getstructarray("jump_down_indicator", "script_noteworthy");
        foreach (struct in var_e9caac83c9b4cc34) {
            var_b89ada9c7c4f7ab0[var_b89ada9c7c4f7ab0.size] = spawn("script_model", struct.origin);
        }
    }
    foreach (i, ent in var_b89ada9c7c4f7ab0) {
        ent.curorigin = ent.origin;
        ent.offset3d = (0, 0, 80);
        ent scripts\mp\gameobjects::requestid(1, 0, undefined, 1);
        objid = ent.objidnum;
        if (var_84f7e39587f529c4 == "zone_2") {
            if (i == 0) {
                scripts\mp\objidpoolmanager::update_objective_ownerteam(objid, game["attackers"]);
            } else {
                scripts\mp\objidpoolmanager::update_objective_ownerteam(objid, game["defenders"]);
            }
        } else {
            scripts\mp\objidpoolmanager::update_objective_ownerteam(objid, game["attackers"]);
        }
        scripts\mp\objidpoolmanager::update_objective_icon(objid, "icon_waypoint_ied_plant");
        scripts\mp\objidpoolmanager::update_objective_setbackground(objid, 1);
        scripts\mp\objidpoolmanager::function_9cad42ac02eff950(objid);
        if (var_84f7e39587f529c4 == "zone_2") {
            if (i == 0) {
                scripts\mp\objidpoolmanager::update_objective_setfriendlylabel(objid, %MP_JUP_LAUNCHFACILITY/JUMP_DOWN_ATTACKER);
            } else {
                scripts\mp\objidpoolmanager::update_objective_setfriendlylabel(objid, %MP_JUP_SKYDIVING/DESCEND_NOW);
            }
        } else {
            scripts\mp\objidpoolmanager::update_objective_setfriendlylabel(objid, %MP_JUP_LAUNCHFACILITY/JUMP_DOWN_ATTACKER);
            scripts\mp\objidpoolmanager::update_objective_setenemylabel(objid, %MP_JUP_LAUNCHFACILITY/JUMP_DOWN_ATTACKER);
        }
        scripts\mp\objidpoolmanager::update_objective_state(objid, "current");
    }
    return var_b89ada9c7c4f7ab0;
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4350
// Size: 0xc1
function function_28c9bb84699d73b2() {
    isinit = level scripts\mp\gametypes\wm_buildable::function_e2344ec3f70a089c();
    if (istrue(isinit)) {
        namespace_555f6ee22fb8fd82::function_e5c4e335df2843c();
        namespace_555f6ee22fb8fd82::function_61359962e417f21();
        namespace_555f6ee22fb8fd82::function_566826c5ccdd0270();
        namespace_555f6ee22fb8fd82::function_b4ebcfb94d5a02a6();
        namespace_555f6ee22fb8fd82::function_d010329c992047c7();
        level.buildablepool["bdb_earthen_wall"].canmantle = 0;
        namespace_555f6ee22fb8fd82::function_e688c950f545c6dc();
        namespace_555f6ee22fb8fd82::function_a622792cc81eaea2();
        namespace_555f6ee22fb8fd82::function_4f6fdee5d536dbc6();
        level namespace_555f6ee22fb8fd82::function_43a60391e95332e();
        level namespace_555f6ee22fb8fd82::function_714ca74c07bcc71c();
        level namespace_555f6ee22fb8fd82::function_259b94f62f15b4be();
        level namespace_555f6ee22fb8fd82::function_60897351370d2636();
        level._effect["sandbag_built"] = loadfx("vfx/jup/level/mp_jup_launchfacility/vfx_jup_lf_sandbags_debris_02.vfx");
        level._effect["turret_fixed"] = loadfx("vfx/jup/level/mp_jup_launchfacility/vfx_jup_lf_machinegun_repaired_glow.vfx");
    }
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4419
// Size: 0x26
function function_b9730bfe1e8b9f81() {
    level endon("game_ended");
    level waittill("matchStartTimer_done");
    scripts\mp\flags::function_1240434f4201ac9d("zone_3_objective_start");
    level thread namespace_d99736a82ac4e63b::function_1877f08d2099d93b();
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4447
// Size: 0x12b
function function_2d6d7d97de343d0f() {
    level endon("game_ended");
    scripts\mp\flags::gameflagwait("zone_2_objective_start");
    if (istrue(level.enablezombie) && istrue(level.var_8034530507c48231)) {
        var_3630956db3be458c = getstructarray("raygun", "script_noteworthy");
        if (isdefined(var_3630956db3be458c)) {
            foreach (var_4c447da4cc7b9037 in var_3630956db3be458c) {
                function_ce8588d31df66dd8(var_4c447da4cc7b9037.origin, var_4c447da4cc7b9037.angles, 1);
            }
        }
        return;
    }
    var_3630956db3be458c = getstructarray("rgl_80", "script_noteworthy");
    if (isdefined(var_3630956db3be458c)) {
        foreach (var_4c447da4cc7b9037 in var_3630956db3be458c) {
            function_ec8a443fe8165fe4("jup_jp26_la_mike32_mp", var_4c447da4cc7b9037.origin, [], var_4c447da4cc7b9037.angles, 1);
        }
    }
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x457a
// Size: 0x1e3
function function_90371f43aad9292a() {
    level endon("game_ended");
    foreach (side in ["attackers", "defenders"]) {
        for (i = 0; i < 2; i++) {
            var_313cc7f0af1986d3[i][side] = getentarray("zone2_lines_stage_" + i + "_" + side, "targetname");
            var_a89c46af827461f6[i][side] = getentarray("zone3_lines_stage_" + i + "_" + side, "targetname");
            var_dcc19d04090b463f[i][side] = getent("zone2_boundary_stage_" + i + "_" + side, "targetname");
            var_7e01f1f27883d50e[i][side] = getent("zone3_boundary_stage_" + i + "_" + side, "targetname");
            if (isdefined(var_dcc19d04090b463f[i][side])) {
                var_dcc19d04090b463f[i][side].side = side;
            }
            if (isdefined(var_7e01f1f27883d50e[i][side])) {
                var_7e01f1f27883d50e[i][side].side = side;
            }
        }
    }
    scripts\mp\flags::gameflagwait("zone_2" + "_objective_start");
    function_e7d2bd03a0c17f96(var_313cc7f0af1986d3[0], undefined, 0);
    level waittill("escort_vehicle_checkpoint_2");
    function_e7d2bd03a0c17f96(var_313cc7f0af1986d3[1], var_dcc19d04090b463f[1], 0);
    scripts\mp\gametypes\wm::function_9fb7ca43ba3b6784("obj_2", "stage_1");
    scripts\mp\flags::gameflagwait("zone_3" + "_objective_start");
    function_e7d2bd03a0c17f96(var_a89c46af827461f6[0], undefined, 0);
    level waittill("captureflag_device_deployed");
    function_e7d2bd03a0c17f96(var_a89c46af827461f6[1], var_7e01f1f27883d50e[1], 0);
    scripts\mp\gametypes\wm::function_9fb7ca43ba3b6784("obj_3", "stage_1");
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4765
// Size: 0x9e
function function_e7d2bd03a0c17f96(boundary, volumes, var_c90367cdfa30c3d3) {
    level.var_b7a5235fd7e9f2f2 = boundary;
    foreach (player in level.players) {
        scripts\mp\gametypes\wm::function_708eab29b3ad59d9(player);
        if (!istrue(var_c90367cdfa30c3d3)) {
            player scripts\mp\gametypes\wm::function_a2d9ea22cacea5e9();
            player.oobtimelimit = 5;
        }
    }
    level.var_354c397f5458af46 = volumes;
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x480b
// Size: 0x18
function function_dce86aec5b302384() {
    level endon("game_ended");
    level waittill("captureflag_device_deployed");
    namespace_d99736a82ac4e63b::function_b04fbceae9e9a1f2();
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x482b
// Size: 0xa6
function function_602c658374655858(vehicle) {
    var_5beb550b14979da6 = 5;
    var_2946f1f5b9485f68 = [];
    for (i = 0; i < var_5beb550b14979da6; i++) {
        name = "check_point_" + i;
        var_a1cf1ca2c44eca8b = getvehiclenode(name, "script_noteworthy");
        if (isdefined(var_a1cf1ca2c44eca8b)) {
            assert(isdefined(var_a1cf1ca2c44eca8b.progress));
            var_a1cf1ca2c44eca8b.visible = 1;
            var_2946f1f5b9485f68[i] = var_a1cf1ca2c44eca8b;
            if (name == "check_point_1") {
                var_a1cf1ca2c44eca8b.visible = 0;
            }
        }
    }
    return var_2946f1f5b9485f68;
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x48da
// Size: 0xf3
function function_bc36ba717880033c() {
    level endon("game_ended");
    scripts\mp\flags::gameflagwait("zone_1" + "_objective_end");
    var_795e67d6e6be2a3c = getent("zone2", "script_noteworthy");
    if (!isdefined(var_795e67d6e6be2a3c)) {
        return;
    }
    assertex(isdefined(var_795e67d6e6be2a3c.var_85080a73a3121271), "<dev string:x1c>");
    while (true) {
        waitframe();
        foreach (player in level.players) {
            if (isalive(player) && !istrue(player.var_9b713d24bdb6d97f) && player istouching(var_795e67d6e6be2a3c)) {
                player function_fb7bad834ce4b28c(var_795e67d6e6be2a3c.var_85080a73a3121271, "zone_2");
                player.var_9b713d24bdb6d97f = 1;
            }
        }
    }
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x49d5
// Size: 0xca
function function_14e9a0244a570ff6() {
    level endon("game_ended");
    var_f34b4b2f93de2e65 = getentarray("trigger_hurt_zone" + 1, "targetname");
    var_8db1224543207c9c = getentarray("trigger_hurt_zone" + 2, "targetname");
    var_f8ed772ba77bbb5f = getentarray("trigger_hurt_zone" + 3, "targetname");
    level function_fc626277bab0c689(var_8db1224543207c9c);
    level function_fc626277bab0c689(var_f8ed772ba77bbb5f);
    scripts\mp\flags::gameflagwait("zone_2" + "_objective_start");
    level function_fc626277bab0c689(var_f34b4b2f93de2e65);
    level function_d06a757de49b167c(var_8db1224543207c9c);
    scripts\mp\flags::gameflagwait("zone_3" + "_objective_start");
    level function_fc626277bab0c689(var_8db1224543207c9c);
    level function_d06a757de49b167c(var_f8ed772ba77bbb5f);
    level waittill("start_game_ended");
    level function_fc626277bab0c689(var_f8ed772ba77bbb5f);
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4aa7
// Size: 0x6e
function function_d06a757de49b167c(var_95d53005f8fc1a95) {
    foreach (trigger in var_95d53005f8fc1a95) {
        trigger.origin = trigger.originalpos;
        trigger trigger_on();
    }
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4b1d
// Size: 0x93
function function_fc626277bab0c689(var_95d53005f8fc1a95) {
    foreach (trigger in var_95d53005f8fc1a95) {
        trigger.originalpos = trigger.origin;
        trigger.origin -= (0, 0, 10000);
        trigger trigger_off();
    }
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4bb8
// Size: 0x49
function function_fd3c293d8f2b219e() {
    level endon("game_ended");
    var_61523ce476fc10e3 = getdvarint(@"hash_466dcdf9da2b1cfc", 1) == 1;
    if (!istrue(var_61523ce476fc10e3)) {
        return;
    }
    level thread function_61559e3ffa6ff01e();
    level thread function_a258cbe71c26c6b();
    level thread function_a7b9407940a23b9c();
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4c09
// Size: 0x5e
function function_61559e3ffa6ff01e() {
    level endon("game_ended");
    enable = getdvarint(@"hash_95dc6472527d97ca", 1) == 1;
    if (istrue(enable)) {
        level waittill("matchStartTimer_done");
        var_64c0dd127fab03a4 = getdvarint(@"hash_e3c1bfbfb075cd0a", 30);
        if (var_64c0dd127fab03a4 > 0) {
            wait var_64c0dd127fab03a4;
        }
        scripts\mp\gametypes\wm::function_48cad4789e694e53();
    }
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4c6f
// Size: 0x49
function function_a258cbe71c26c6b() {
    level endon("game_ended");
    enable = getdvarint(@"hash_497e249d641e0e63", 1) == 1;
    if (istrue(enable)) {
        scripts\mp\flags::gameflagwait("zone_2" + "_objective_start");
        wait 20;
        scripts\mp\gametypes\wm::function_48cad4789e694e53();
    }
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4cc0
// Size: 0x49
function function_a7b9407940a23b9c() {
    level endon("game_ended");
    enable = getdvarint(@"hash_b9d6c777d1f1f58c", 1) == 1;
    if (istrue(enable)) {
        scripts\mp\flags::gameflagwait("zone_3" + "_objective_start");
        wait 20;
        scripts\mp\gametypes\wm::function_48cad4789e694e53();
    }
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4d11
// Size: 0x88
function function_ccd8a337aae472de(nodeorigin, range) {
    var_652a66e0975580eb = getentarrayinradius(undefined, undefined, nodeorigin, range);
    if (isdefined(level.var_673860e74c8ec9d1)) {
        foreach (trigger in level.var_673860e74c8ec9d1) {
            trigger scripts\mp\gametypes\wm_utility::function_51039de6a7a95d10(var_652a66e0975580eb);
        }
    }
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4da1
// Size: 0xa1
function function_a5f8312fdbf97755() {
    level endon("game_ended");
    scripts\mp\flags::gameflagwait("zone_2" + "_objective_start");
    var_e641696b925ca657 = getstructarray("spawn_trap_cover", "targetname");
    foreach (cover in var_e641696b925ca657) {
        spawn_model(cover.script_noteworthy, cover.origin, cover.angles);
    }
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4e4a
// Size: 0xe7
function private function_e27bc4a5e8e27440() {
    level.sentrysettings["bs_laser"].ignoreownerteam = 1;
    level.sentrysettings["bs_laser"].var_b58e018f63b5d93b = 0;
    level.sentrysettings["bs_laser"].laserexplosion = 0;
    level.sentrysettings["bs_laser"].trapdamageweapon = "jup_c4_mp";
    level.sentrysettings["bs_laser"].trapmeansofdeath = "MOD_GRENADE";
    level.sentrysettings["bs_laser"].trapmindamage = 100;
    level.sentrysettings["bs_laser"].trapmaxdamage = 200;
    level.sentrysettings["bs_laser"].var_bd106a486cdfd461 = 384;
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4f39
// Size: 0x41
function private function_62247a3afa8950b6() {
    for (idx = 1; idx <= 3; idx++) {
        var_64c417244bd50932 = getentarray("trigger_hurt_zone" + idx, "targetname");
        level function_fc626277bab0c689(var_64c417244bd50932);
    }
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x4f82
// Size: 0xc2
function private function_7a49dcb707410ca2(params) {
    if (!istrue(level.enablezombie) || !getdvarint(@"hash_e10575de97288b22", 1)) {
        return;
    }
    level notify("wm_stop_zombie_spawn");
    all_zombies = getaiarray("team_two_hundred");
    foreach (zombie in all_zombies) {
        if (!isdefined(zombie) || !isalive(zombie)) {
            continue;
        }
        zombie dodamage(zombie.health + 150, zombie.origin);
        waitframe();
    }
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x504c
// Size: 0x6d
function private function_c294f9788942533b(params) {
    if (!isdefined(level.buildables)) {
        return;
    }
    foreach (var_341059c86e3a7310 in level.buildables) {
        var_341059c86e3a7310 function_1c548268f36ed307();
    }
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x50c1
// Size: 0x159
function function_7d25484659308d59() {
    level endon("game_ended");
    ents = getentarray("tri_build_hesco", "targetname");
    var_febb042dd9982690 = getstruct(ents[0].target, "targetname");
    var_c96dc31f024483a8 = getentarray(var_febb042dd9982690.target, "targetname");
    foreach (clip in var_c96dc31f024483a8) {
        if (!isdefined(clip.script_parameters)) {
            clip.var_295832d2fc0e963c = clip.origin;
            clip.var_caf3e3fb4a14b329 = clip.angles;
            clip solid();
            clip.origin = (-11158, -31979, 1863);
            clip.angles = (0, 8.3, 0);
            clip disconnectpaths();
            clip notsolid();
            clip.origin = clip.var_295832d2fc0e963c;
            clip.angles = clip.var_caf3e3fb4a14b329;
        }
    }
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x5222
// Size: 0x4b1
function setupminimap(material, var_11f306b80ae0c39e, var_3b70dd7d0d5b9a8, zonename) {
    requiredmapaspectratio = getdvarfloat(@"scr_requiredmapaspectratio", 1);
    mapinfo = function_79404c2fcca1c184();
    if (isdefined(mapinfo) && isdefined(mapinfo.var_cea11b0bd8f76b2d)) {
        foreach (minimapversion in mapinfo.var_cea11b0bd8f76b2d) {
            if (minimapversion.gametype == scripts\mp\utility\game::getgametype()) {
                material = minimapversion.var_bf768d8db892be1b;
            }
        }
    }
    if (!isdefined(material)) {
        material = "";
    }
    if (!isdefined(var_11f306b80ae0c39e)) {
        var_11f306b80ae0c39e = material;
    }
    corners = [];
    allcorners = getentarray("minimap_corner", "targetname");
    foreach (corner in allcorners) {
        if (corner.script_noteworthy == zonename) {
            corners[corners.size] = corner;
        }
    }
    if (corners.size != 2) {
        println("<dev string:x57>");
        return;
    }
    corner0 = (corners[0].origin[0], corners[0].origin[1], 0);
    corner1 = (corners[1].origin[0], corners[1].origin[1], 0);
    cornerdiff = corner1 - corner0;
    north = (cos(getnorthyaw()), sin(getnorthyaw()), 0);
    west = (0 - north[1], north[0], 0);
    if (vectordot(cornerdiff, west) > 0) {
        if (vectordot(cornerdiff, north) > 0) {
            northwest = corner1;
            southeast = corner0;
        } else {
            side = scripts\mp\compass::vecscale(north, vectordot(cornerdiff, north));
            northwest = corner1 - side;
            southeast = corner0 + side;
        }
    } else if (vectordot(cornerdiff, north) > 0) {
        side = scripts\mp\compass::vecscale(north, vectordot(cornerdiff, north));
        northwest = corner0 + side;
        southeast = corner1 - side;
    } else {
        northwest = corner0;
        southeast = corner1;
    }
    if (requiredmapaspectratio > 0) {
        var_9f72e62e262287df = vectordot(northwest - southeast, north);
        var_755d4c721ecb6165 = vectordot(northwest - southeast, west);
        mapaspectratio = var_755d4c721ecb6165 / var_9f72e62e262287df;
        if (mapaspectratio < requiredmapaspectratio) {
            incr = requiredmapaspectratio / mapaspectratio;
            addvec = scripts\mp\compass::vecscale(west, var_755d4c721ecb6165 * (incr - 1) * 0.5);
        } else {
            incr = mapaspectratio / requiredmapaspectratio;
            addvec = scripts\mp\compass::vecscale(north, var_9f72e62e262287df * (incr - 1) * 0.5);
        }
        northwest += addvec;
        southeast -= addvec;
    }
    corners[0].origin = northwest;
    corners[1].origin = southeast;
    level.mapsize = vectordot(northwest - southeast, north);
    level.mapcorners = corners;
    level.mapcorners[0].angles = generateaxisanglesfromforwardvector(vectornormalize(level.mapcorners[1].origin - level.mapcorners[0].origin), (0, 0, 1));
    level.mapcorners[0] addyaw(45);
    level.mapcorners[1].angles = generateaxisanglesfromforwardvector(vectornormalize(level.mapcorners[0].origin - level.mapcorners[1].origin), (0, 0, 1));
    level.mapcorners[1] addyaw(45);
    if (!isdefined(var_3b70dd7d0d5b9a8) || var_3b70dd7d0d5b9a8 < 1) {
        var_3b70dd7d0d5b9a8 = 1;
    }
    /#
        level.minimapmaterial = material;
    #/
    setminimap(material, northwest[0], northwest[1], southeast[0], southeast[1], var_3b70dd7d0d5b9a8, var_11f306b80ae0c39e);
}

// Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x56db
// Size: 0x6d
function function_fb7bad834ce4b28c(floornumber, zonename) {
    self setclientomnvar("ui_minimap_floor", floornumber);
    map_name = tolower(getdvar(@"ui_mapname"));
    minimap_image = "compass_map_" + map_name + "_floor_" + floornumber;
    self.var_109a3bfd035f27be = floornumber;
    setupminimap(minimap_image, undefined, undefined, zonename);
}

/#

    // Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x5750
    // Size: 0x9d
    function function_e393d662064dffce() {
        level endon("<dev string:xbd>");
        zone_name = level waittill("<dev string:xcb>");
        if (zone_name != "<dev string:xe6>") {
            return;
        }
        var_3481c88117495d50 = getentarray("<dev string:xf0>", "<dev string:xfe>");
        var_797f676eac2f5f5d = getstructarray("<dev string:x10c>", "<dev string:xfe>");
        var_24e1eee4a6f213b7 = getentitylessscriptablearray("<dev string:x11b>", "<dev string:x12e>");
        var_633452f052c3d4ba = getscriptablearray("<dev string:x143>", "<dev string:x12e>");
        function_c8a59331ffa83829(var_3481c88117495d50, var_797f676eac2f5f5d, var_24e1eee4a6f213b7, 1, var_633452f052c3d4ba);
    }

    // Namespace mp_jup_skydiving / namespace_9f337f9234afd0d3
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x57f5
    // Size: 0x7d
    function function_1e57e0eff0416516() {
        level endon("<dev string:xbd>");
        level waittill("<dev string:x151>");
        while (true) {
            teamidx = getdvarint(@"hash_cb0271966982116a", -1);
            if (teamidx != -1) {
                setdvar(@"hash_cb0271966982116a", -1);
            }
            if (teamidx == 0) {
                scripts\mp\gametypes\wm_ending::function_cc892bd20a432474(game["<dev string:x162>"]);
            } else if (teamidx == 1) {
                scripts\mp\gametypes\wm_ending::function_cc892bd20a432474(game["<dev string:x16f>"]);
            }
            waitframe();
        }
    }

#/
