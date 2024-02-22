// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_7ab5b649fa408138;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\utility\sound.gsc;
#using scripts\mp\utility\debug.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\engine\trace.gsc;
#using script_120270bd0a747a35;
#using script_48814951e916af89;
#using scripts\mp\spawnlogic.gsc;
#using script_27c2db69a21775a0;
#using script_1d4b01c1ec829364;
#using scripts\mp\globallogic.gsc;
#using scripts\mp\gameobjects.gsc;
#using script_451a1a9bd9613164;
#using scripts\mp\utility\spawn_event_aggregator.gsc;
#using scripts\mp\utility\join_team_aggregator.gsc;
#using scripts\mp\utility\disconnect_event_aggregator.gsc;
#using scripts\mp\class.gsc;
#using scripts\mp\gametypes\obj_dom.gsc;
#using script_600b944a95c3a7bf;
#using script_2d9d24f7c63ac143;
#using scripts\cp_mp\parachute.gsc;
#using scripts\mp\gametypes\br_armory_kiosk.gsc;
#using script_669760f0500e4358;
#using scripts\mp\gametypes\common.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\obj_zonecapture.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\cp_mp\killstreaks\airdrop.gsc;
#using scripts\mp\spawnscoring.gsc;
#using scripts\mp\rally_point.gsc;
#using scripts\mp\gametypes\br_weapons.gsc;
#using scripts\mp\hud_message.gsc;
#using script_3f1b6713ca4c9c7;
#using script_76cc264b397db9cb;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\outofbounds.gsc;
#using scripts\mp\utility\game_utility_mp.gsc;
#using script_268c4da1ef6a20a8;
#using script_640cf1641c03e2a0;
#using script_2bc0b0102f9b7751;
#using script_371b4c2ab5861e62;
#using script_2669878cf5a1b6bc;
#using scripts\mp\equipment.gsc;
#using scripts\mp\gametypes\br.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\gamescore.gsc;

#namespace gwai;

// Namespace gwai/namespace_61438684387591a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x113a
// Size: 0x7f8
function main() {
    if (getdvar(@"hash_687fb8f9b7a23245") == "mp_background") {
        return;
    }
    namespace_77cb23aada5edffd::init();
    namespace_77cb23aada5edffd::setupcallbacks();
    allowed[0] = getgametype();
    allowed[1] = "arm";
    namespace_19b4203b51d56488::main(allowed);
    if (isusingmatchrulesdata()) {
        level.initializematchrules = &initializematchrules;
        [[ level.initializematchrules ]]();
        level thread reinitializematchrulesonmigration();
    } else {
        registertimelimitdvar(getgametype(), 150);
        registerscorelimitdvar(getgametype(), 1);
        registerroundlimitdvar(getgametype(), 0);
        registerwinlimitdvar(getgametype(), 3);
        registernumlivesdvar(getgametype(), 1);
        registerhalftimedvar(getgametype(), 0);
        registerroundswitchdvar(getgametype(), 1, 0, 9);
    }
    setdvar(@"hash_405e7e20d91344cc", 0);
    setdvar(@"hash_42eece3f15e35b3d", 1);
    setdvar(@"hash_a22f98e2c5b506ce", 30);
    setdvar(@"hash_e4fa721677f03de0", 1);
    setdvar(@"hash_cbc195ec2129279", 0);
    setomnvar("ui_num_dom_flags", 1);
    enablegroundwarspawnlogic(400, 1200);
    updategametypedvars();
    function_8731c366897e87d8();
    namespace_bc0abb78a303bb78::function_8ece37593311858a(&onplayerconnect);
    namespace_71eef510d7f364cf::registeronplayerspawncallback(&onplayerspawned);
    namespace_1309ce202b9aa92b::registeronplayerjointeamcallback(&onjoinedteam);
    namespace_f1d40c362677777e::registerondisconnecteventcallback(&onplayerdisconnect);
    level.objectivebased = 1;
    level.teambased = 1;
    level.var_11525426feeb297a = 1;
    level.var_d040719163e20394 = 1;
    level.var_a0f41ec8e5268d15 = getdvarint(@"hash_c3babb46fe3fd12b", 1) == 1;
    level.onstartgametype = &onstartgametype;
    level.getspawnpoint = &getspawnpoint;
    level.modeonspawnplayer = &modeonspawnplayer;
    level.onplayerkilled = &onplayerkilled;
    level.onnormaldeath = &onnormaldeath;
    level.ontimelimit = &ontimelimit;
    level.onscorelimit = &onscorelimit;
    level.var_947925f5fc6939a3 = &function_947925f5fc6939a3;
    level.var_3e175c0b6527751f = &function_3e175c0b6527751f;
    if (getdvarint(@"hash_78653010d584aa6e", 0) == 0) {
        var_37b8974363ab1e5c = int(tablelookup("mp/gametypesTable.csv", 0, "gwai", 5));
        level.allowclasschoice = getdvarint(@"hash_72cc643f082b112b", var_37b8974363ab1e5c) == 1;
    } else {
        level.allowclasschoice = level.var_62f6f7640e4431e3.allowclasschoice;
    }
    if (!level.allowclasschoice) {
        level.bypassclasschoicefunc = &namespace_d19129e4fa5d176::alwaysgamemodeclass;
    }
    level.allowclasschoicefunc = &allowclasschoicefunc;
    level.domflag_setneutral = &namespace_98b55913d2326ac8::domflag_setneutral;
    level.dompoint_setcaptured = &namespace_98b55913d2326ac8::dompoint_setcaptured;
    level.var_e637d49948a038d3 = &getmissedinfilcamerapositions;
    game["dialog"]["gametype"] = "gametype_groundwar";
    if (getdvarint(@"hash_4a2b3d01a81655a6")) {
        game["dialog"]["gametype"] = "dh_" + game["dialog"]["gametype"];
    } else if (getdvarint(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_promode"))) {
        game["dialog"]["gametype"] = game["dialog"]["gametype"] + "_pro";
    }
    game["dialog"]["offense_obj"] = "boost_groundwar";
    game["dialog"]["defense_obj"] = "boost_groundwar";
    game["dialog"]["obj_destroyed"] = "obj_destroyed";
    game["dialog"]["obj_captured"] = "obj_captured";
    game["dialog"]["securing_a"] = "securing_a";
    game["dialog"]["securing_b"] = "securing_b";
    game["dialog"]["securing_c"] = "securing_c";
    game["dialog"]["securing_d"] = "securing_d";
    game["dialog"]["securing_e"] = "securing_e";
    game["dialog"]["secured_a"] = "secured_a";
    game["dialog"]["secured_b"] = "secured_b";
    game["dialog"]["secured_c"] = "secured_c";
    game["dialog"]["secured_d"] = "secured_d";
    game["dialog"]["secured_e"] = "secured_e";
    game["dialog"]["losing_a"] = "losing_a";
    game["dialog"]["losing_b"] = "losing_b";
    game["dialog"]["losing_c"] = "losing_c";
    game["dialog"]["losing_d"] = "losing_d";
    game["dialog"]["losing_e"] = "losing_e";
    game["dialog"]["lost_a"] = "lost_a";
    game["dialog"]["lost_b"] = "lost_b";
    game["dialog"]["lost_c"] = "lost_c";
    game["dialog"]["lost_d"] = "lost_d";
    game["dialog"]["lost_e"] = "lost_e";
    game["dialog"]["lost_all"] = "gamestate_domlosing";
    game["dialog"]["secure_all"] = "gamestate_domwinning";
    game["dialog"]["hp_new_location"] = "iw9_mphq_mode_uktl_hqnl";
    game["dialog"]["hp_active"] = "iw9_mphq_mode_uktl_hqoa";
    level._effect["vfx_smk_signal_gr"] = loadfx("vfx/_requests/mp_gameplay/vfx_smk_signal_gr");
    level._effect["vfx_snatch_ac130_clouds"] = loadfx("vfx/iw8_mp/gamemode/vfx_snatch_ac130_clouds.vfx");
    level._effect["vfx_br_infil_cloud_scroll"] = loadfx("vfx/iw8_br/gameplay/infil/vfx_br_infil_cloud_scroll.vfx");
    level._effect["vfx_br_infil_jump_smoke_01"] = loadfx("vfx/iw8_br/gameplay/infil/vfx_br_infil_jump_smoke_01.vfx");
    level._effect["vfx_br_infil_jump_wisp_01"] = loadfx("vfx/iw8_br/gameplay/infil/vfx_br_infil_jump_wisp_01.vfx");
    level._effect["vfx_br_infil_jump_wisp_02"] = loadfx("vfx/iw8_br/gameplay/infil/vfx_br_infil_jump_wisp_02.vfx");
    level._effect["vfx_br_infil_omni_light"] = loadfx("vfx/iw8_br/gameplay/infil/vfx_br_infil_omni_light.vfx");
    level._effect["vfx_br_infil_spot_light"] = loadfx("vfx/iw8_br/gameplay/infil/vfx_br_infil_spot_light.vfx");
    level.var_8e9daba162280a8e = getdvarint(@"hash_19e5cada53ccf044", 0) == 1;
    level.var_eaa760f325371803 = getdvarint(@"hash_1db3f1f01240e877", 0) == 1;
    level.var_7f5be0207e7457b1 = getdvarint(@"hash_27abaa55d7ec8eb9", 1) == 1;
    level.dropbrloot = getdvarint(@"hash_1d196605f8a290e3", 0);
    level.br_plunder_enabled = getdvarint(@"hash_a6a9b41b654afd1d", 0);
    level.var_c59c301eaabc2e32 = getdvarint(@"hash_19fae1aad58e8c50", 1);
    if (level.br_plunder_enabled) {
        namespace_38b993c4618e76cd::init();
        level.var_e247454ac2869696 = 0;
        namespace_aead94004cf4c147::function_e0948a1e98e82ae1();
    }
    level.var_1e17e3480b1d264d = getdvarint(@"hash_644f043f54d141f5", 0);
    if (level.var_1e17e3480b1d264d) {
        level.var_9c1e3c18b99409e9 = &function_9c1e3c18b99409e9;
    }
    level.numnonrallyvehicles = getdvarint(@"hash_87f140caf9a39bf8", 25);
    level.disablepersonalnuke = getdvarint(@"hash_f271257bddc28c95", 0);
    level.personalnukecostoverride = getdvarint(@"hash_d9455f252fccdb97", 30);
    thread function_658c8f668d2cd83c();
    level.var_cbb6ec6b15529252 = 1;
    flag_init("stealth_enabled");
    flag_init("level_stealth_initialized");
    flag_init("stealth_spotted");
}

// Namespace gwai/namespace_61438684387591a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1939
// Size: 0xe9
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
    setdynamicdvar(@"hash_99046b3d56cd3649", getmatchrulesdata("kothData", "zoneLifetime"));
    setdynamicdvar(@"hash_f51b36fcf02b3f31", getmatchrulesdata("kothData", "zoneCaptureTime"));
    setdynamicdvar(@"hash_6f7aef0c521c9fad", getmatchrulesdata("kothData", "zoneActivationDelay"));
    setdynamicdvar(@"hash_ed7d0e7c3005f22c", getmatchrulesdata("kothData", "randomLocationOrder"));
    setdynamicdvar(@"hash_e67ffae5a4bb4a1d", getmatchrulesdata("kothData", "additiveScoring"));
    setdynamicdvar(@"hash_9f670bfb474fab3f", getmatchrulesdata("kothData", "pauseTime"));
    setdynamicdvar(@"hash_fcd65660beaed272", getmatchrulesdata("tdefData", "spawnDelay"));
    registerhalftimedvar("gwai", 0);
}

// Namespace gwai/namespace_61438684387591a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a29
// Size: 0x1aa
function onstartgametype() {
    level.requiredplayercountoveride = 1;
    foreach (team in level.teamnamelist) {
        level.requiredplayercount[team] = int(level.maxteamsize * 0.75);
    }
    if (!level.multiteambased) {
        if (!isdefined(game["switchedsides"])) {
            game["switchedsides"] = 0;
        }
        if (game["switchedsides"]) {
            oldattackers = game["attackers"];
            olddefenders = game["defenders"];
            game["attackers"] = olddefenders;
            game["defenders"] = oldattackers;
        }
    }
    setclientnamemode("auto_change");
    level.objectives = [];
    level.uncapturableobjectives = [];
    initspawns();
    seticonnames();
    level.usedomflag = 0;
    level.killstreakqueue = [];
    level thread setupwaypointicons();
    setupobjectives();
    level thread runobjectives();
    level.numhqtanks_axis = 0;
    level.numhqtanks_allies = 0;
    level.maxhqtanks = 0;
    thread init_groundwarvehicles();
    namespace_944ddf7b8df1b0e3::initstatusdialog();
    emergency_cleanupents();
    namespace_5078ee98abb32db9::initparachutedvars();
    if (getdvarint(@"hash_880384e6dfe250ba", 0) == 1) {
        namespace_a4b43c1cf86c6fe5::init();
        namespace_a4b43c1cf86c6fe5::function_b38f5ffe645943c3("personalOnly");
    }
    level thread function_8f1b9042d7fdfcda();
    level thread namespace_872204d77e9872c0::init();
}

// Namespace gwai/namespace_61438684387591a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bda
// Size: 0x94
function updategametypedvars() {
    namespace_310ba947928891df::updatecommongametypedvars();
    level.var_47e0745baff5b43f = dvarintvalue("newObjectiveRoundCount", 2, 0, 10);
    level.zonehidetime = dvarfloatvalue("zoneHideTime", 120, 0, 300);
    level.zonelockedtime = dvarfloatvalue("zoneLockedTime", 120, 0, 300);
    level.zonecapturetime = dvarfloatvalue("zoneCaptureTime", 15, 0, 60);
    level.objectivescaler = dvarfloatvalue("objScalar", 1, 1, 10);
    level.pausemodetimer = 0;
}

// Namespace gwai/namespace_61438684387591a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c75
// Size: 0x73
function seticonnames() {
    level.icontarget = "hq_target";
    level.iconneutral = "hq_neutral";
    level.iconcapture = "hq_destroy";
    level.icondefend = "hq_defend";
    level.iconcontested = "hq_contested";
    level.icontaking = "hq_taking";
    level.iconlosing = "hq_losing";
    level.icondefending = "hq_defending";
}

// Namespace gwai/namespace_61438684387591a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cef
// Size: 0x31e
function emergency_cleanupents() {
    namespace_36f464722d326bbe::removematchingents_bykey("delete_on_load", "targetname");
    namespace_36f464722d326bbe::removematchingents_bykey("vehicle_volume", "script_noteworthy");
    namespace_36f464722d326bbe::removematchingents_bykey("vehicle_volume_simplified", "script_noteworthy");
    namespace_36f464722d326bbe::removematchingents_bykey("super", "script_noteworthy");
    namespace_36f464722d326bbe::removematchingents_bykey("militarybase", "script_noteworthy");
    namespace_36f464722d326bbe::removematchingents_bykey("location_volume", "targetname");
    namespace_36f464722d326bbe::removematchingents_bykey("locale_area_trigger", "targetname");
    namespace_36f464722d326bbe::removematchingents_bykey("bank_entry_detector", "targetname");
    namespace_36f464722d326bbe::removematchingents_bykey("shadow_blocker", "targetname");
    namespace_36f464722d326bbe::removematchingents_bymodel("door_prison_cell_metal_mp", 1);
    namespace_36f464722d326bbe::removematchingents_bymodel("veh8_mil_air_acharlie130", 1);
    namespace_36f464722d326bbe::removematchingents_bymodel("door_wooden_panel_mp_01", 1);
    namespace_36f464722d326bbe::removematchingents_bymodel("me_electrical_box_street_01", 1);
    namespace_36f464722d326bbe::removematchingents_bycodeclassname("light");
    namespace_36f464722d326bbe::removematchingents_bycodeclassname("trigger_use_touch");
    if (isdefined(level.localeid) && level.localeid == "locale_6") {
        namespace_36f464722d326bbe::removematchingents_bykey("locale_8", "script_noteworthy");
    }
    var_a48ba5ee7fe7c64c = [];
    var_a48ba5ee7fe7c64c[0] = (-22592, 27367, 1000);
    var_a48ba5ee7fe7c64c[1] = (-22592, 27303, -448);
    var_a48ba5ee7fe7c64c[2] = (7837, -9674, 1154);
    var_a48ba5ee7fe7c64c[3] = (7637, -9674, 1154);
    var_a48ba5ee7fe7c64c[4] = (7901, -9674, -270);
    var_a48ba5ee7fe7c64c[5] = (7701, -9674, -270);
    var_a48ba5ee7fe7c64c[6] = (10366, -11606, 66);
    var_a48ba5ee7fe7c64c[7] = (10366, -11813, 66);
    var_a48ba5ee7fe7c64c[6] = (10366, -11670, -270);
    var_a48ba5ee7fe7c64c[7] = (10366, -11877, -270);
    var_a48ba5ee7fe7c64c[8] = (7498, -11716, 66);
    var_a48ba5ee7fe7c64c[9] = (7498, -11652, -270);
    var_a48ba5ee7fe7c64c[10] = (-1200, -18954, -242);
    var_a48ba5ee7fe7c64c[11] = (-1215, -19016, 774);
    ents = getentarray();
    foreach (ent in ents) {
        if (isdefined(ent.model) && ent.model == "tag_origin") {
            var_e24c6c7277a83762 = 0;
            foreach (var_6cd1567fb4680666 in var_a48ba5ee7fe7c64c) {
                if (var_e24c6c7277a83762) {
                    break;
                }
                if (distancesquared(ent.origin, var_6cd1567fb4680666) < 144) {
                    var_e24c6c7277a83762 = 1;
                }
            }
            if (var_e24c6c7277a83762) {
                ent delete();
            }
        }
    }
}

// Namespace gwai/namespace_61438684387591a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2014
// Size: 0x135
function removepatchablecollision_delayed() {
    wait(5);
    var_5c2c9d034ebe9dcd = [];
    var_5c2c9d034ebe9dcd[0] = "tactical_cover_col";
    var_5c2c9d034ebe9dcd[1] = "tactical_ladder_col";
    var_5c2c9d034ebe9dcd[2] = "clip8x8x256";
    var_5c2c9d034ebe9dcd[3] = "player8x8x256";
    var_5c2c9d034ebe9dcd[4] = "ladderMetal264";
    var_5c2c9d034ebe9dcd[5] = "ladderWood192";
    var_5c2c9d034ebe9dcd[6] = "ladderMetal192";
    var_5c2c9d034ebe9dcd[7] = "mount128";
    var_5c2c9d034ebe9dcd[8] = "mount64";
    var_5c2c9d034ebe9dcd[9] = "mount32";
    var_5c2c9d034ebe9dcd[10] = "mount256";
    var_5c2c9d034ebe9dcd[11] = "ladderWood264";
    var_5c2c9d034ebe9dcd[12] = "nosight256x256x8";
    var_5c2c9d034ebe9dcd[13] = "nosight128x128x8";
    var_5c2c9d034ebe9dcd[14] = "mountCorner128";
    var_5c2c9d034ebe9dcd[15] = "mantle256";
    var_5c2c9d034ebe9dcd[16] = "mantle128";
    var_5c2c9d034ebe9dcd[17] = "mantle64";
    var_5c2c9d034ebe9dcd[18] = "mantle32";
    var_5c2c9d034ebe9dcd[19] = "stairsHalfFlight128";
    var_5c2c9d034ebe9dcd[20] = "stairsFullFlight128";
    foreach (name in var_5c2c9d034ebe9dcd) {
        namespace_36f464722d326bbe::removematchingents_bykey(name, "targetname");
    }
}

// Namespace gwai/namespace_61438684387591a2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2150
// Size: 0x14
function onjoinedteam(player) {
    player namespace_18dd16563a37da34::function_6ed651811c936a22();
}

// Namespace gwai/namespace_61438684387591a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x216b
// Size: 0x16b
function setupwaypointicons() {
    while (!isdefined(level.var_b23156d776b1d85) || !isdefined(level.var_b23156d776b1d85.var_38f2a11237246ac)) {
        waitframe();
    }
    foreach (var_dfbd7318ef3cc9bd, bundle in level.var_b23156d776b1d85.var_38f2a11237246ac) {
        level.waypointcolors[var_dfbd7318ef3cc9bd + "_incoming"] = "neutral";
        level.waypointbgtype[var_dfbd7318ef3cc9bd + "_incoming"] = 1;
        level.waypointstring[var_dfbd7318ef3cc9bd + "_incoming"] = "";
        level.waypointshader[var_dfbd7318ef3cc9bd + "_incoming"] = ter_op(isdefined(bundle.hudicon), bundle.hudicon, "");
        level.waypointpulses[var_dfbd7318ef3cc9bd + "_incoming"] = 0;
        level.waypointcolors[var_dfbd7318ef3cc9bd] = "neutral";
        level.waypointbgtype[var_dfbd7318ef3cc9bd] = 1;
        level.waypointstring[var_dfbd7318ef3cc9bd] = "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS";
        level.waypointshader[var_dfbd7318ef3cc9bd] = ter_op(isdefined(bundle.hudicon), bundle.hudicon, "");
    }
}

// Namespace gwai/namespace_61438684387591a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x22dd
// Size: 0x2b6
function setupobjectives() {
    level.startingfobnames_neutral = [0:"gw_fob_01", 1:"gw_fob_02", 2:"gw_fob_03", 3:"gw_fob_04", 4:"gw_fob_05", 5:"gw_fob_06", 6:"gw_fob_07", 7:"gw_fob_08", 8:"gw_fob_09"];
    level.gw_objstruct = spawnstruct();
    level.gw_objstruct.startingfobs_neutral = [];
    if (!isdefined(game["gwai_possible_objective_keys"])) {
        game["gwai_possible_objective_keys"] = [];
    }
    var_a9b909bac20ba503 = 0;
    var_57ac5dc40b2e5a9 = function_760badbc47a3e856(level.startingfobnames_neutral, var_a9b909bac20ba503);
    var_a9b909bac20ba503 = var_57ac5dc40b2e5a9[1];
    level.gw_objstruct.startingfobs_neutral = var_57ac5dc40b2e5a9[0];
    if (!isdefined(game["current_objective_key"]) || level.var_47e0745baff5b43f > 0 && game["roundsPlayed"] % level.var_47e0745baff5b43f == 0) {
        var_dd7bfea4eb1da762 = [];
        foreach (key, used in game["gwai_possible_objective_keys"]) {
            var_96e5dc4303192720 = getdvar(@"hash_d781fe69411c87bc", "");
            if (var_96e5dc4303192720 != "") {
                var_96e5dc4303192720 = strtok(var_96e5dc4303192720, " ");
                jumpiftrue(array_contains(var_96e5dc4303192720, key)) LOC_000001b8;
            } else if (!used) {
                var_dd7bfea4eb1da762[var_dd7bfea4eb1da762.size] = key;
            }
        }
        if (var_dd7bfea4eb1da762.size == 0) {
            foreach (key, entry in game["gwai_possible_objective_keys"]) {
                game["gwai_possible_objective_keys"][key] = 0;
            }
            foreach (key, used in game["gwai_possible_objective_keys"]) {
                var_96e5dc4303192720 = getdvar(@"hash_d781fe69411c87bc", "");
                if (var_96e5dc4303192720 != "") {
                    var_96e5dc4303192720 = strtok(var_96e5dc4303192720, " ");
                    jumpiftrue(array_contains(var_96e5dc4303192720, key)) LOC_00000274;
                } else if (!used) {
                    var_dd7bfea4eb1da762[var_dd7bfea4eb1da762.size] = key;
                }
            }
        }
        var_50fb98c8e0d441f8 = var_dd7bfea4eb1da762[randomint(var_dd7bfea4eb1da762.size)];
        game["current_objective_key"] = var_50fb98c8e0d441f8;
        game["gwai_possible_objective_keys"][var_50fb98c8e0d441f8] = 1;
    }
}

// Namespace gwai/namespace_61438684387591a2
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x259a
// Size: 0x19e
function function_760badbc47a3e856(var_a682e84261a6b971, currentindex) {
    targetarray = [];
    if (!isdefined(var_a682e84261a6b971) || var_a682e84261a6b971.size == 0) {
        return [0:targetarray, 1:currentindex];
    }
    var_f6ddbb71b889a0be = [0:"_a", 1:"_b", 2:"_c", 3:"_d", 4:"_e", 5:"_f", 6:"_g", 7:"_h", 8:"_i"];
    var_a9b909bac20ba503 = currentindex;
    foreach (var_d83e5fa8f6ce891f in var_a682e84261a6b971) {
        trigger = namespace_36f464722d326bbe::getlocaleent(var_d83e5fa8f6ce891f);
        if (isdefined(trigger)) {
            fob = spawnstruct();
            fob.name = var_d83e5fa8f6ce891f;
            fob.trigger = trigger;
            fob.trigger.objkey = var_f6ddbb71b889a0be[var_a9b909bac20ba503];
            var_a9b909bac20ba503++;
            targetarray[targetarray.size] = fob;
            if (!isdefined(game["gwai_possible_objective_keys"][fob.trigger.objkey])) {
                game["gwai_possible_objective_keys"][fob.trigger.objkey] = 0;
            }
        }
    }
    return [0:targetarray, 1:var_a9b909bac20ba503];
}

// Namespace gwai/namespace_61438684387591a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2740
// Size: 0x3da
function runobjectives() {
    level.allfobs = [];
    foreach (fob in level.gw_objstruct.startingfobs_neutral) {
        if (fob.trigger.objkey == game["current_objective_key"]) {
            fob.trigger.objkey = "_a";
            var_ddca7869b65236b6 = function_2d95972fced27791(fob.trigger, "neutral");
            level.allfobs[level.allfobs.size] = fob;
        }
    }
    var_93c3e68d9c262062 = getentarray("gw_ai_base", "targetname");
    foreach (fob in level.allfobs) {
        fob.trigger.gameobject.onuse = &zone_onuse;
        fob.trigger.gameobject.onbeginuse = &namespace_8276d48525f0f398::zone_onusebegin;
        fob.trigger.gameobject.onuseupdate = &namespace_8276d48525f0f398::zone_onuseupdate;
        fob.trigger.gameobject.onenduse = &namespace_8276d48525f0f398::zone_onuseend;
        fob.trigger.gameobject.onunoccupied = &namespace_8276d48525f0f398::zone_onunoccupied;
        fob.trigger.gameobject.oncontested = &namespace_8276d48525f0f398::zone_oncontested;
        fob.trigger.gameobject.onuncontested = &namespace_8276d48525f0f398::zone_onuncontested;
        fob.trigger.gameobject.stompprogressreward = &namespace_8276d48525f0f398::zone_stompprogressreward;
        fob.trigger.gameobject.onpinnedstate = &namespace_8276d48525f0f398::zone_onpinnedstate;
        fob.trigger.gameobject.onunpinnedstate = &namespace_8276d48525f0f398::zone_onunpinnedstate;
        if (istrue(level.var_dd7af80c3eb2c1e0)) {
            fob.var_5261f4479b04f834 = &namespace_98b55913d2326ac8::function_5261f4479b04f834;
        }
        foreach (var_3bf790f79cb25065 in var_93c3e68d9c262062) {
            if (fob.trigger.targetname == var_3bf790f79cb25065.script_label) {
                fob.trigger.gameobject.var_3bf790f79cb25065 = var_3bf790f79cb25065;
                break;
            }
        }
        level.objectives[fob.trigger.gameobject.objectivekey] = fob.trigger.gameobject;
    }
    setomnvar("ui_num_dom_flags", level.allfobs.size);
    if (level.zonehidetime == 0) {
        level thread objective_manageobjectivesintrovisibility();
    }
    level thread function_f73cab6ec2fe1638();
    level thread allowobjectiveuseaftermatchstart();
    level.var_aa5583d4cbbfd72e = 1;
}

// Namespace gwai/namespace_61438684387591a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b21
// Size: 0xf6
function function_f73cab6ec2fe1638() {
    level endon("game_ended");
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    if (level.zonehidetime > 0) {
        wait(level.zonehidetime);
    }
    foreach (fob in level.allfobs) {
        fob.trigger.gameobject namespace_19b4203b51d56488::setvisibleteam("any");
    }
    foreach (entry in level.teamnamelist) {
        namespace_944ddf7b8df1b0e3::statusdialog("hp_new_location", entry);
    }
}

// Namespace gwai/namespace_61438684387591a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c1e
// Size: 0x1dd
function allowobjectiveuseaftermatchstart() {
    level endon("game_ended");
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    if (level.zonelockedtime > 0) {
        foreach (fob in level.allfobs) {
        }
        var_8c0f071f480a9d9a = int(gettime() + level.zonelockedtime * 1000);
        setomnvar("ui_hardpoint_timer", var_8c0f071f480a9d9a);
        setomnvar("ui_hq_status", 1);
        setomnvar("ui_hq_ownerteam", -1);
        wait(level.zonelockedtime);
    }
    setomnvar("ui_hardpoint_timer", 0);
    setomnvar("ui_hq_status", -1);
    foreach (fob in level.allfobs) {
        fob.trigger.gameobject namespace_19b4203b51d56488::allowuse("enemy");
        fob.trigger.gameobject namespace_19b4203b51d56488::enableobject();
        fob.trigger.gameobject namespace_19b4203b51d56488::setusetime(level.zonecapturetime);
    }
    foreach (entry in level.teamnamelist) {
        namespace_944ddf7b8df1b0e3::statusdialog("hp_active", entry);
    }
}

// Namespace gwai/namespace_61438684387591a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e02
// Size: 0xf5
function objective_manageobjectivesintrovisibility() {
    wait(1);
    foreach (fob in level.allfobs) {
        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(fob.trigger.gameobject.objidnum);
    }
    while (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        waitframe();
    }
    foreach (fob in level.allfobs) {
        namespace_5a22b6f3a56f7e9b::objective_playermask_showtoall(fob.trigger.gameobject.objidnum);
    }
}

// Namespace gwai/namespace_61438684387591a2
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2efe
// Size: 0x87
function function_2d95972fced27791(objective, startingteam) {
    level endon("game_ended");
    objective.script_label = objective.objkey;
    domflag = namespace_8276d48525f0f398::setupobjective(objective);
    domflag.origin = objective.origin;
    domflag namespace_19b4203b51d56488::allowuse("none");
    domflag.didstatusnotify = 0;
    domflag namespace_19b4203b51d56488::setobjectivestatusicons(level.icontarget);
    return domflag;
}

// Namespace gwai/namespace_61438684387591a2
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2f8d
// Size: 0x47
function dropcrate(killstreakname, droplocation, team) {
    crate = namespace_6c578d6ef48f10ef::droparmcratefromscriptedheli(team, killstreakname, droplocation.origin, (0, randomint(360), 0), undefined);
    return crate;
}

// Namespace gwai/namespace_61438684387591a2
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2fdc
// Size: 0x133
function docratedropsmoke(crate, droplocation, duration) {
    var_e0d03a39e88dff15 = droplocation.origin + (0, 0, 2000);
    spawnpos = utility::groundpos(var_e0d03a39e88dff15, (0, 0, 1));
    droplocation.vfxent = spawn("script_model", spawnpos);
    droplocation.vfxent setmodel("tag_origin");
    droplocation.vfxent.angles = (0, 0, 0);
    droplocation.vfxent playloopsound("smoke_carepackage_smoke_lp");
    wait(1);
    playfxontag(getfx("vfx_smk_signal_gr"), droplocation.vfxent, "tag_origin");
    if (isdefined(crate)) {
        crate waittill_any_timeout_1(duration, "crate_dropped");
    } else {
        wait(duration);
    }
    stopfxontag(getfx("vfx_smk_signal_gr"), droplocation.vfxent, "tag_origin");
    droplocation.vfxent delete();
}

// Namespace gwai/namespace_61438684387591a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3116
// Size: 0x16b
function registervaliddroplocations() {
    namespace_6c578d6ef48f10ef::initplundercratedata();
    level.validdroplocationstruct = spawnstruct();
    level.validdroplocationstruct.clusters = getstructarray("dropBagCluterNode", "script_noteworthy");
    var_1bd7657bd69c8a8c = getstructarray("dropBagLocation", "script_noteworthy");
    foreach (location in var_1bd7657bd69c8a8c) {
        location.inuse = 0;
        foreach (cluster in level.validdroplocationstruct.clusters) {
            if (location.target == cluster.targetname) {
                if (!isdefined(cluster.droplocations)) {
                    cluster.droplocations = [];
                }
                cluster.droplocations[cluster.droplocations.size] = location;
                continue;
            }
        }
    }
    level.nextkillstreakgoal = 100;
    if (0) {
        thread debug_testcratedroplocationpicker();
    }
}

// Namespace gwai/namespace_61438684387591a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3288
// Size: 0x15
function debug_testcratedroplocationpicker() {
    while (1) {
        choosecratelocation();
        wait(1);
    }
}

// Namespace gwai/namespace_61438684387591a2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x32a4
// Size: 0x40
function checkkillstreakcratedrop(team) {
    if (game["teamScores"][team] >= level.nextkillstreakgoal) {
        level.nextkillstreakgoal = level.nextkillstreakgoal + 100;
        dropkillstreakcrates(2);
    }
}

// Namespace gwai/namespace_61438684387591a2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x32eb
// Size: 0xaf
function dropkillstreakcrates(var_fd2fee325481dc7f) {
    var_c7709ea550bbb458 = undefined;
    foreach (player in level.players) {
        if (isdefined(player)) {
            var_c7709ea550bbb458 = player;
            break;
        }
    }
    for (i = 0; i < var_fd2fee325481dc7f; i++) {
        location = choosecratelocation();
        thread runkillstreakreward(location, var_c7709ea550bbb458, getkillstreak(1));
        wait(5);
    }
}

// Namespace gwai/namespace_61438684387591a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x33a1
// Size: 0x178
function choosecratelocation() {
    var_695a8b6f4aaeeee6 = randomfloatrange(0, 1);
    var_1b090db7ad64072d = vectorlerp(level.c130pathstruct_a.startpt, level.c130pathstruct_a.endpt, var_695a8b6f4aaeeee6);
    var_1b090ab7ad640094 = vectorlerp(level.c130pathstruct_b.endpt, level.c130pathstruct_b.startpt, var_695a8b6f4aaeeee6);
    var_92459ae9b006b9f7 = vectorlerp(var_1b090db7ad64072d, var_1b090ab7ad640094, 0.5);
    trace = ray_trace(var_92459ae9b006b9f7, var_92459ae9b006b9f7 - (0, 0, 100000));
    var_92459ae9b006b9f7 = trace["position"];
    var_794937a10118f0d9 = findclosestdroplocation(var_92459ae9b006b9f7);
    if (0) {
        thread drawsphere(var_1b090db7ad64072d, 1000, 100, (0, 0, 1));
        thread drawsphere(var_1b090ab7ad640094, 1000, 100, (0, 0, 1));
        thread drawsphere(var_92459ae9b006b9f7, 1000, 100, (1, 0, 0));
        thread drawsphere(var_794937a10118f0d9.origin, 1000, 100, (0, 1, 0));
        thread drawline(var_92459ae9b006b9f7, var_794937a10118f0d9.origin, 3, (0, 1, 0));
    }
    return var_794937a10118f0d9;
}

// Namespace gwai/namespace_61438684387591a2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3521
// Size: 0x126
function findclosestdroplocation(origin) {
    startlocation = spawnstruct();
    startlocation.origin = origin;
    var_206c7349dd628bc8 = startlocation array_sort_with_func(level.validdroplocationstruct.clusters, &sortlocationsbydistance);
    foreach (cluster in var_206c7349dd628bc8) {
        var_d6d0d0ab47b5b334 = array_randomize(cluster.droplocations);
        if (0) {
            return var_d6d0d0ab47b5b334[0];
        } else {
            foreach (location in var_d6d0d0ab47b5b334) {
                if (!location.inuse) {
                    location.inuse = 1;
                    return location;
                }
            }
        }
    }
    return undefined;
}

// Namespace gwai/namespace_61438684387591a2
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x364f
// Size: 0x246
function runkillstreakreward(location, creditplayer, streakname) {
    level endon("game_ended");
    crate = undefined;
    object = namespace_19b4203b51d56488::createobjidobject(location.origin, "neutral", (0, 0, 72), undefined, "any");
    object.origin = location.origin;
    object.angles = location.angles;
    thread docratedropsmoke(undefined, location, 16);
    object.iconname = "_incoming";
    object.lockupdatingicons = 0;
    object namespace_19b4203b51d56488::setobjectivestatusicons(streakname);
    object.lockupdatingicons = 1;
    wait(4);
    crate = namespace_6c578d6ef48f10ef::droparmcratefromscriptedheli(creditplayer.team, streakname, location.origin, (0, randomint(360), 0), undefined);
    crate.skipminimapicon = 1;
    crate.nevertimeout = 0;
    crate.waitforobjectiveactivate = 1;
    crate.killminimapicon = 0;
    crate.disallowheadiconid = 1;
    crate.isarmcrate = 1;
    crate waittill("crate_dropped");
    object.useobj = crate;
    object.origin = crate.origin;
    var_de9e30874c191943 = 0;
    interval = 0.1;
    wait(1);
    crate notify("objective_activate");
    namespace_5a22b6f3a56f7e9b::update_objective_onentity(object.objidnum, crate);
    namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(object.objidnum, 72);
    object.iconname = "";
    object.lockupdatingicons = 0;
    object namespace_19b4203b51d56488::setobjectivestatusicons(streakname);
    object.lockupdatingicons = 1;
    objective_setlabel(object.objidnum, "");
    crate waittill("death");
    object namespace_19b4203b51d56488::setvisibleteam("none");
    object namespace_19b4203b51d56488::releaseid();
    object.visibleteam = "none";
}

// Namespace gwai/namespace_61438684387591a2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x389c
// Size: 0x4a
function getkillstreak(tier) {
    if (!isdefined(level.killstreaktierlist)) {
        processkillstreaksintotiers();
    }
    level.killstreaktierlist[tier] = array_randomize(level.killstreaktierlist[tier]);
    return level.killstreaktierlist[tier][0];
}

// Namespace gwai/namespace_61438684387591a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x38ee
// Size: 0xa7
function processkillstreaksintotiers() {
    level.killstreaktierlist = [];
    level.killstreaktierlist[3] = [0:"cruise_predator", 1:"scrambler_drone_guard", 2:"uav"];
    level.killstreaktierlist[2] = [0:"precision_airstrike", 1:"multi_airstrike", 2:"bradley"];
    level.killstreaktierlist[1] = [0:"toma_strike", 1:"uav", 2:"pac_sentry", 3:"white_phosphorus"];
    level.killstreaktierlist[0] = [0:"uav"];
}

// Namespace gwai/namespace_61438684387591a2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x399c
// Size: 0x876
function initspawns(var_4c3936c2c179fab3) {
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    if (!level.multiteambased) {
        var_48501209a3e177a7 = "mp_gw_spawn_allies_start";
        var_ae7d0107ad485428 = "mp_gw_spawn_axis_start";
        namespace_b2d5aa2baf2b5701::addspawnpoints(game["attackers"], var_48501209a3e177a7);
        namespace_b2d5aa2baf2b5701::addspawnpoints(game["defenders"], var_ae7d0107ad485428);
        attackers = namespace_b2d5aa2baf2b5701::getspawnpointarray(var_48501209a3e177a7);
        defenders = namespace_b2d5aa2baf2b5701::getspawnpointarray(var_ae7d0107ad485428);
        namespace_b2d5aa2baf2b5701::registerspawnset("start_attackers", attackers);
        namespace_b2d5aa2baf2b5701::registerspawnset("start_defenders", defenders);
    } else {
        level.var_c232143daa149594 = [];
        switch (level.mapname) {
        case #"hash_a11e6e81ea219453":
            var_41ee18556b2486f = spawnstruct();
            var_41ee18556b2486f.team = undefined;
            var_41ee18556b2486f.origin = (-37117, -14519, 260);
            var_41ee18556b2486f.angles = (0, 302, 0);
            level.var_c232143daa149594[level.var_c232143daa149594.size] = var_41ee18556b2486f;
            var_41ee18556b2486f = spawnstruct();
            var_41ee18556b2486f.team = undefined;
            var_41ee18556b2486f.origin = (-29272, -15643, 350);
            var_41ee18556b2486f.angles = (0, 236, 0);
            level.var_c232143daa149594[level.var_c232143daa149594.size] = var_41ee18556b2486f;
            var_41ee18556b2486f = spawnstruct();
            var_41ee18556b2486f.team = undefined;
            var_41ee18556b2486f.origin = (-27343, -24666, 260);
            var_41ee18556b2486f.angles = (0, 154, 0);
            level.var_c232143daa149594[level.var_c232143daa149594.size] = var_41ee18556b2486f;
            var_41ee18556b2486f = spawnstruct();
            var_41ee18556b2486f.team = undefined;
            var_41ee18556b2486f.origin = (-35216, -29197, 320);
            var_41ee18556b2486f.angles = (0, 96, 0);
            level.var_c232143daa149594[level.var_c232143daa149594.size] = var_41ee18556b2486f;
            var_41ee18556b2486f = spawnstruct();
            var_41ee18556b2486f.team = undefined;
            var_41ee18556b2486f.origin = (-42555, -20407, 260);
            var_41ee18556b2486f.angles = (0, 335, 0);
            level.var_c232143daa149594[level.var_c232143daa149594.size] = var_41ee18556b2486f;
            break;
        case #"hash_3e552e81b4a21fff":
            var_41ee18556b2486f = spawnstruct();
            var_41ee18556b2486f.team = undefined;
            var_41ee18556b2486f.origin = (-21036, 39417, -30);
            var_41ee18556b2486f.angles = (0, 333, 0);
            level.var_c232143daa149594[level.var_c232143daa149594.size] = var_41ee18556b2486f;
            var_41ee18556b2486f = spawnstruct();
            var_41ee18556b2486f.team = undefined;
            var_41ee18556b2486f.origin = (-12069, 51876, 194);
            var_41ee18556b2486f.angles = (0, 271, 0);
            level.var_c232143daa149594[level.var_c232143daa149594.size] = var_41ee18556b2486f;
            var_41ee18556b2486f = spawnstruct();
            var_41ee18556b2486f.team = undefined;
            var_41ee18556b2486f.origin = (1983, 43672, 479);
            var_41ee18556b2486f.angles = (0, 178, 0);
            level.var_c232143daa149594[level.var_c232143daa149594.size] = var_41ee18556b2486f;
            var_41ee18556b2486f = spawnstruct();
            var_41ee18556b2486f.team = undefined;
            var_41ee18556b2486f.origin = (-1061, 29444, 406);
            var_41ee18556b2486f.angles = (0, 124, 0);
            level.var_c232143daa149594[level.var_c232143daa149594.size] = var_41ee18556b2486f;
            var_41ee18556b2486f = spawnstruct();
            var_41ee18556b2486f.team = undefined;
            var_41ee18556b2486f.origin = (-15203, 31037, 266);
            var_41ee18556b2486f.angles = (0, 67, 0);
            level.var_c232143daa149594[level.var_c232143daa149594.size] = var_41ee18556b2486f;
            break;
        case #"hash_5586b38644ed9b26":
            var_41ee18556b2486f = spawnstruct();
            var_41ee18556b2486f.team = undefined;
            var_41ee18556b2486f.origin = (-16014, -51700, 322);
            var_41ee18556b2486f.angles = (0, 30, 0);
            level.var_c232143daa149594[level.var_c232143daa149594.size] = var_41ee18556b2486f;
            var_41ee18556b2486f = spawnstruct();
            var_41ee18556b2486f.team = undefined;
            var_41ee18556b2486f.origin = (-12154, -40440, 586);
            var_41ee18556b2486f.angles = (0, 354, 0);
            level.var_c232143daa149594[level.var_c232143daa149594.size] = var_41ee18556b2486f;
            var_41ee18556b2486f = spawnstruct();
            var_41ee18556b2486f.team = undefined;
            var_41ee18556b2486f.origin = (-3034, -33855, 997);
            var_41ee18556b2486f.angles = (0, 274, 0);
            level.var_c232143daa149594[level.var_c232143daa149594.size] = var_41ee18556b2486f;
            var_41ee18556b2486f = spawnstruct();
            var_41ee18556b2486f.team = undefined;
            var_41ee18556b2486f.origin = (12220, -36424, 677);
            var_41ee18556b2486f.angles = (0, 202, 0);
            level.var_c232143daa149594[level.var_c232143daa149594.size] = var_41ee18556b2486f;
            var_41ee18556b2486f = spawnstruct();
            var_41ee18556b2486f.team = undefined;
            var_41ee18556b2486f.origin = (1979, -51789, 252);
            var_41ee18556b2486f.angles = (0, 109, 0);
            level.var_c232143daa149594[level.var_c232143daa149594.size] = var_41ee18556b2486f;
            break;
        default:
            var_41ee18556b2486f = spawnstruct();
            var_41ee18556b2486f.team = undefined;
            var_41ee18556b2486f.origin = (-37117, -14519, 260);
            var_41ee18556b2486f.angles = (0, 302, 0);
            level.var_c232143daa149594[level.var_c232143daa149594.size] = var_41ee18556b2486f;
            var_41ee18556b2486f = spawnstruct();
            var_41ee18556b2486f.team = undefined;
            var_41ee18556b2486f.origin = (-29272, -15643, 350);
            var_41ee18556b2486f.angles = (0, 236, 0);
            level.var_c232143daa149594[level.var_c232143daa149594.size] = var_41ee18556b2486f;
            var_41ee18556b2486f = spawnstruct();
            var_41ee18556b2486f.team = undefined;
            var_41ee18556b2486f.origin = (-27343, -24666, 260);
            var_41ee18556b2486f.angles = (0, 154, 0);
            level.var_c232143daa149594[level.var_c232143daa149594.size] = var_41ee18556b2486f;
            var_41ee18556b2486f = spawnstruct();
            var_41ee18556b2486f.team = undefined;
            var_41ee18556b2486f.origin = (-35216, -29197, 320);
            var_41ee18556b2486f.angles = (0, 96, 0);
            level.var_c232143daa149594[level.var_c232143daa149594.size] = var_41ee18556b2486f;
            var_41ee18556b2486f = spawnstruct();
            var_41ee18556b2486f.team = undefined;
            var_41ee18556b2486f.origin = (-42555, -20407, 260);
            var_41ee18556b2486f.angles = (0, 335, 0);
            level.var_c232143daa149594[level.var_c232143daa149594.size] = var_41ee18556b2486f;
            break;
        }
        level.var_c232143daa149594 = array_randomize(level.var_c232143daa149594);
    }
    level.mapcenter = namespace_b2d5aa2baf2b5701::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
}

// Namespace gwai/namespace_61438684387591a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4219
// Size: 0x1a4
function getspawnpoint() {
    if (function_bff229a11ecd1e34()) {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic(#"start");
    } else {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic("StartSpawn", "Crit_Default");
    }
    spawnteam = self.pers["team"];
    spawnpoint = undefined;
    if (!level.multiteambased) {
        if (spawnteam == game["attackers"]) {
            namespace_b2d5aa2baf2b5701::activatespawnset("start_attackers", 1);
            spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, undefined, "start_attackers");
        } else {
            namespace_b2d5aa2baf2b5701::activatespawnset("start_defenders", 1);
            spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, undefined, "start_defenders");
        }
    } else {
        aliveplayers = getteamdata(spawnteam, "alivePlayers");
        if (aliveplayers.size > 0) {
            spawnpoint = namespace_90f75d3fdf89a43e::findteammatebuddyspawn(aliveplayers[0]);
        } else {
            foreach (var_41ee18556b2486f in level.var_c232143daa149594) {
                if (!isdefined(var_41ee18556b2486f.team) || var_41ee18556b2486f.team == spawnteam) {
                    var_41ee18556b2486f.team = spawnteam;
                    spawnpoint = spawnstruct();
                    spawnpoint.origin = var_41ee18556b2486f.origin;
                    spawnpoint.angles = var_41ee18556b2486f.angles;
                    spawnpoint.index = -1;
                    break;
                } else {
                    continue;
                }
            }
        }
    }
    return spawnpoint;
}

// Namespace gwai/namespace_61438684387591a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x43c5
// Size: 0x54
function onplayerconnect() {
    if (isdefined(level.rallypointvehicles)) {
        thread namespace_fdd1a79841ab3fe7::rallypoint_showtoplayer(self);
    }
    thread namespace_3bcd40a3005712ec::br_ammo_player_init();
    namespace_d19129e4fa5d176::function_a16868d4dcd81a4b();
    if (!isdefined(self.pers["gamemodeLoadout"])) {
        self.pers["gamemodeLoadout"] = level.gamemodeloadout;
    }
}

// Namespace gwai/namespace_61438684387591a2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4420
// Size: 0xc
function onplayerdisconnect(player) {
    
}

// Namespace gwai/namespace_61438684387591a2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4433
// Size: 0xa2
function modeonspawnplayer(var_9156b53bcf7ce573) {
    self notify("br_spawned");
    namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("dom_cap_defend");
    namespace_14f37777effc564d::function_6da8b65579348d0b();
    namespace_9bb409deb69fb31d::updatesquadomnvars(self.team, self.var_ff97225579de16a);
    if (isdefined(self.pers["gamemodeLoadout"]) && isdefined(self.pers["gamemodeLoadout"]["armorPlates"])) {
        self.var_d0205933322679a9 = self.pers["gamemodeLoadout"]["armorPlates"];
        self.pers["gamemodeLoadout"]["armorPlates"] = 0;
    }
}

// Namespace gwai/namespace_61438684387591a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x44dc
// Size: 0x22
function onplayerspawned() {
    namespace_cb965d2f71fefddc::resetplayerinventory(1, 1);
    if (level.multiteambased) {
        namespace_d9c77dc2a6fe29c6::enableoobimmunity(self);
    }
}

// Namespace gwai/namespace_61438684387591a2
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x4505
// Size: 0x97
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00) {
    namespace_9bb409deb69fb31d::updatesquadomnvars(self.team, self.var_ff97225579de16a);
    namespace_98b55913d2326ac8::awardgenericmedals(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00);
    if (level.dropbrloot) {
        namespace_cb965d2f71fefddc::droponplayerdeath(attacker);
    }
}

// Namespace gwai/namespace_61438684387591a2
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x45a3
// Size: 0x41
function onnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    namespace_310ba947928891df::oncommonnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon);
}

// Namespace gwai/namespace_61438684387591a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x45eb
// Size: 0x1da
function function_8731c366897e87d8() {
    level.gamemodeloadout["loadoutArchetype"] = "archetype_assault";
    level.gamemodeloadout["loadoutPrimary"] = "iw9_pi_golf17";
    level.gamemodeloadout["loadoutPrimaryAttachment"] = "none";
    level.gamemodeloadout["loadoutPrimaryAttachment2"] = "none";
    level.gamemodeloadout["loadoutPrimaryCamo"] = "none";
    level.gamemodeloadout["loadoutPrimaryReticle"] = "none";
    level.gamemodeloadout["loadoutPrimaryVariantID"] = 0;
    level.gamemodeloadout["loadoutSecondary"] = "none";
    level.gamemodeloadout["loadoutSecondaryAttachment"] = "none";
    level.gamemodeloadout["loadoutSecondaryAttachment2"] = "none";
    level.gamemodeloadout["loadoutSecondaryCamo"] = "none";
    level.gamemodeloadout["loadoutSecondaryReticle"] = "none";
    level.gamemodeloadout["loadoutSecondaryVariantID"] = 0;
    level.gamemodeloadout["loadoutEquipmentPrimary"] = "none";
    level.gamemodeloadout["loadoutEquipmentSecondary"] = "none";
    level.gamemodeloadout["loadoutFieldUpgrade1"] = "none";
    level.gamemodeloadout["loadoutFieldUpgrade2"] = "none";
    level.gamemodeloadout["loadoutStreakType"] = "assault";
    level.gamemodeloadout["loadoutKillstreak1"] = "none";
    level.gamemodeloadout["loadoutKillstreak2"] = "none";
    level.gamemodeloadout["loadoutKillstreak3"] = "none";
    level.gamemodeloadout["loadoutPerks"] = [];
    level.gamemodeloadout["loadoutGesture"] = "playerData";
}

// Namespace gwai/namespace_61438684387591a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x47cc
// Size: 0xe3
function arm_initoutofbounds() {
    level.outofboundstriggers = [];
    var_ccfdb06748d7f326 = getentarray("OutOfBounds", "targetname");
    foreach (trigger in var_ccfdb06748d7f326) {
        if (isdefined(trigger.script_team)) {
            trigger delete();
        } else if (isdefined(namespace_36f464722d326bbe::getlocaleid()) && isdefined(trigger.script_noteworthy) && trigger.script_noteworthy == level.localeid && namespace_de5151d68164781a::modeusesgroundwarteamoobtriggers(trigger)) {
            level.outofboundstriggers[level.outofboundstriggers.size] = trigger;
        } else {
            trigger delete();
        }
    }
}

// Namespace gwai/namespace_61438684387591a2
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x48b6
// Size: 0x47
function sortlocationsbydistance(var_fcf7e6e6d8c4861, var_fcf7b6e6d8c41c8) {
    return distancesquared(var_fcf7e6e6d8c4861.origin, self.origin) < distancesquared(var_fcf7b6e6d8c41c8.origin, self.origin);
}

// Namespace gwai/namespace_61438684387591a2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4905
// Size: 0x981
function getmissedinfilcamerapositions(team) {
    /#
        assert(isdefined(namespace_36f464722d326bbe::getlocaleid()), "Asking for a missed infil cam and no locale has been set.");
    #/
    var_b379bc48dc371726 = spawnstruct();
    var_b379bc48dc371726.startorigin = undefined;
    var_b379bc48dc371726.endpos = undefined;
    if (level.mapname == "mp_locale_test") {
        switch (level.localeid) {
        case #"hash_369d88655b32bac0":
        case #"hash_369d96655b32d0ca":
            if (team == "axis") {
                var_b379bc48dc371726.startorigin = (2094, -1804, 2763);
                var_b379bc48dc371726.startangles = (54, 40, 0);
                var_b379bc48dc371726.endorigin = (2094, -1804, 2763);
                var_b379bc48dc371726.endangles = (54, 40, 0);
            } else {
                var_b379bc48dc371726.startorigin = (2315, 1956, 2763);
                var_b379bc48dc371726.startangles = (54, 296, 0);
                var_b379bc48dc371726.endorigin = (2094, -1804, 2763);
                var_b379bc48dc371726.endangles = (54, 40, 0);
            }
            break;
        default:
            var_b379bc48dc371726.startorigin = (0, 0, 0);
            var_b379bc48dc371726.startangles = (0, 0, 0);
            var_b379bc48dc371726.endorigin = (0, 0, 0);
            var_b379bc48dc371726.endangles = (0, 0, 0);
            break;
        }
    } else {
        switch (level.localeid) {
        case #"hash_369d93655b32cc11":
            if (team == "axis") {
                var_b379bc48dc371726.startorigin = (38864, -14018, -396);
                var_b379bc48dc371726.startangles = (3, 250, 0);
                var_b379bc48dc371726.endorigin = (38473, -14077, 401);
                var_b379bc48dc371726.endangles = (15, 252, 0);
            } else {
                var_b379bc48dc371726.startorigin = (30526, -38262, -483);
                var_b379bc48dc371726.startangles = (0, 72, 0);
                var_b379bc48dc371726.endorigin = (30024, -38403, 560);
                var_b379bc48dc371726.endangles = (19, 67, 0);
            }
            break;
        case #"hash_369d96655b32d0ca":
            if (team == "axis") {
                var_b379bc48dc371726.startorigin = (16977, -23256, 169);
                var_b379bc48dc371726.startangles = (9, 69, 0);
                var_b379bc48dc371726.endorigin = (16899, -23467, 683);
                var_b379bc48dc371726.endangles = (15, 68, 0);
            } else {
                var_b379bc48dc371726.startorigin = (18607, 1423, -355);
                var_b379bc48dc371726.startangles = (8, 289, 0);
                var_b379bc48dc371726.endorigin = (18100, 1083, 503);
                var_b379bc48dc371726.endangles = (22, 302, 0);
            }
            break;
        case #"hash_369d88655b32bac0":
            if (team == "axis") {
                var_b379bc48dc371726.startorigin = (18672, -26836, -129);
                var_b379bc48dc371726.startangles = (359, 76, 0);
                var_b379bc48dc371726.endorigin = (18518, -26909, 314);
                var_b379bc48dc371726.endangles = (14, 69, 0);
            } else {
                var_b379bc48dc371726.startorigin = (18607, 1423, -355);
                var_b379bc48dc371726.startangles = (8, 289, 0);
                var_b379bc48dc371726.endorigin = (18100, 1083, 503);
                var_b379bc48dc371726.endangles = (22, 302, 0);
            }
            break;
        case #"hash_2cd4bf8e90f233e7":
        case #"hash_369d95655b32cf37":
            if (team == "axis") {
                var_b379bc48dc371726.startorigin = (24893, 28349, 1408);
                var_b379bc48dc371726.startangles = (15, 54, 0);
                var_b379bc48dc371726.endorigin = (25613, 29274, 1255);
                var_b379bc48dc371726.endangles = (19, 53, 0);
            } else {
                var_b379bc48dc371726.startorigin = (39490, 48919, 2302);
                var_b379bc48dc371726.startangles = (17, 235, 0);
                var_b379bc48dc371726.endorigin = (39254, 48584, 1542);
                var_b379bc48dc371726.endangles = (18, 245, 0);
            }
            break;
        case #"hash_369d89655b32bc53":
            if (team == "axis") {
                var_b379bc48dc371726.startorigin = (48331, -24822, 514);
                var_b379bc48dc371726.startangles = (12, 77, 0);
                var_b379bc48dc371726.endorigin = (48424, -24421, -240);
                var_b379bc48dc371726.endangles = (2, 77, 0);
            } else {
                var_b379bc48dc371726.startorigin = (46188, 2520, 49);
                var_b379bc48dc371726.startangles = (7, 295, 0);
                var_b379bc48dc371726.endorigin = (46571, 2664, 526);
                var_b379bc48dc371726.endangles = (16, 276, 0);
            }
            break;
        case #"hash_2cd4bd8e90f230c1":
            if (team == "axis") {
                var_b379bc48dc371726.startorigin = (-11083, 22197, 381);
                var_b379bc48dc371726.startangles = (10, 181, 0);
                var_b379bc48dc371726.endorigin = (-12112, 23761, 381);
                var_b379bc48dc371726.endangles = (11, 201, 0);
            } else {
                var_b379bc48dc371726.startorigin = (-31134, 11924, -116);
                var_b379bc48dc371726.startangles = (0, 36, 0);
                var_b379bc48dc371726.endorigin = (-31134, 11924, 434);
                var_b379bc48dc371726.endangles = (11, 36, 0);
            }
            break;
        case #"hash_2cd4be8e90f23254":
            if (team == "axis") {
                var_b379bc48dc371726.startorigin = (9215, 984, 325);
                var_b379bc48dc371726.startangles = (357, 186, 0);
                var_b379bc48dc371726.endorigin = (9107, 628, 1144);
                var_b379bc48dc371726.endangles = (19, 182, 0);
            } else {
                var_b379bc48dc371726.startorigin = (-5351, 641, 408);
                var_b379bc48dc371726.startangles = (2, 352, 0);
                var_b379bc48dc371726.endorigin = (-5282, 996, 1103);
                var_b379bc48dc371726.endangles = (11, 347, 0);
            }
            break;
        case #"hash_2cd4b58e90f22429":
            if (team == "axis") {
                var_b379bc48dc371726.startorigin = (-22847, -28632, 34);
                var_b379bc48dc371726.startangles = (12, 42, 0);
                var_b379bc48dc371726.endorigin = (-22694, -28429, 356);
                var_b379bc48dc371726.endangles = (12, 40, 0);
            } else {
                var_b379bc48dc371726.startorigin = (-8084, -20649, 72);
                var_b379bc48dc371726.startangles = (10, 185, 0);
                var_b379bc48dc371726.endorigin = (-9092, -20635, 224);
                var_b379bc48dc371726.endangles = (12, 184, 0);
            }
            break;
        default:
            var_b379bc48dc371726.startorigin = (0, 0, 0);
            var_b379bc48dc371726.startangles = (0, 0, 0);
            var_b379bc48dc371726.endorigin = (0, 0, 0);
            var_b379bc48dc371726.endangles = (0, 0, 0);
            break;
        }
    }
    return var_b379bc48dc371726;
}

// Namespace gwai/namespace_61438684387591a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x528e
// Size: 0x12
function function_658c8f668d2cd83c() {
    wait(5);
    function_f1aed36ab4598ea("mp_gamemode_gw");
}

// Namespace gwai/namespace_61438684387591a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x52a7
// Size: 0x3fd
function function_8f1b9042d7fdfcda() {
    if (!isdefined(level.difficultytype)) {
        level namespace_bfef6903bca5845d::function_c8393014dd7f8ab6();
    }
    level thread namespace_b27abd42d87cb8c0::init();
    namespace_bfef6903bca5845d::init();
    function_ba4022744dce59f6("everybody", 100);
    level thread namespace_885300a47c2b51e6::function_ca39a413ace3c168();
    level thread namespace_7ae25d9e5d5a28ef::function_d0ffcd08e0870cf2();
    while (!istrue(level.var_aa5583d4cbbfd72e)) {
        waitframe();
    }
    level thread function_848d0782943b416d();
    function_2fc80954fa70d153();
    foreach (obj in level.objectives) {
        groupname = function_78759441c259f58a(obj.trigger.origin);
        var_9815fce1944a6ae0 = function_2e33f8e46f95167c(obj.trigger.origin, 1024, 1);
        var_f1548c57038e1b7a = array_combine(var_9815fce1944a6ae0.var_e67f0b2ea7ae69ed, var_9815fce1944a6ae0.var_8a055a821dda7da0, var_9815fce1944a6ae0.var_3288c473e8336ab4);
        numagents = getdvarint(@"hash_347125fd6d3e5b8b", 15);
        if (numagents > 0) {
            for (i = 0; i < numagents; i++) {
                aitype = function_d5bc07eabf352abb(undefined, undefined, groupname, undefined, 3);
                var_ef178bb38661ff1b = undefined;
                if (var_f1548c57038e1b7a.size > 0) {
                    var_25dd3020969aa0f6 = function_3a17f0ccddc999b4(obj.trigger.origin, var_f1548c57038e1b7a, var_f1548c57038e1b7a.size, 256, 0);
                    var_25dd3020969aa0f6 = array_randomize(var_25dd3020969aa0f6);
                    if (var_25dd3020969aa0f6.size > 0) {
                        var_ef178bb38661ff1b = var_25dd3020969aa0f6[0];
                    }
                }
                spawnorigin = obj.trigger.origin;
                if (isdefined(var_ef178bb38661ff1b)) {
                    spawnorigin = var_ef178bb38661ff1b.origin;
                }
                agent = ai_mp_requestspawnagent(aitype, spawnorigin, (0, 0, 0), "medium", "everybody", "captureAgents", groupname, undefined, undefined, undefined, 1, 1);
                if (isdefined(agent)) {
                    namespace_310ba947928891df::function_35c195df2ba46725(agent, "team_hundred_ninety_five");
                    if (isdefined(var_ef178bb38661ff1b)) {
                        function_2b26d000f2ccfc11(agent, var_ef178bb38661ff1b);
                    } else {
                        agent thread namespace_2000a83505151e5b::function_9bbf1713a14fa580(agent, 256, 256);
                    }
                    if (isdefined(obj.var_3bf790f79cb25065)) {
                        agent setgoalvolumeauto(obj.var_3bf790f79cb25065);
                    }
                }
            }
        }
        var_40e875a042b82875 = getdvarint(@"hash_6bd0ae2b33a87d23", 0);
        if (var_40e875a042b82875 > 0) {
            for (i = 0; i < var_40e875a042b82875; i++) {
                var_ef178bb38661ff1b = undefined;
                if (var_f1548c57038e1b7a.size > 0) {
                    var_25dd3020969aa0f6 = function_3a17f0ccddc999b4(obj.trigger.origin, var_f1548c57038e1b7a, var_f1548c57038e1b7a.size, 256, 0);
                    var_25dd3020969aa0f6 = array_randomize(var_25dd3020969aa0f6);
                    if (var_25dd3020969aa0f6.size > 0) {
                        var_ef178bb38661ff1b = var_25dd3020969aa0f6[0];
                    }
                }
                spawnorigin = obj.trigger.origin;
                if (isdefined(var_ef178bb38661ff1b)) {
                    spawnorigin = var_ef178bb38661ff1b.origin;
                }
                agent = ai_mp_requestspawnagent("actor_enemy_mp_jugg_aq", spawnorigin, (0, 0, 0), "absolute", "everybody", "jugg", groupname, undefined, undefined, undefined, 1, 1);
                if (isdefined(agent)) {
                    namespace_310ba947928891df::function_35c195df2ba46725(agent, "team_hundred_ninety_five");
                    namespace_14d36171baccf528::function_1828f1e20e52b418(agent);
                    namespace_310ba947928891df::function_35c195df2ba46725(agent, "team_hundred_ninety_five");
                    if (isdefined(var_ef178bb38661ff1b)) {
                        function_2b26d000f2ccfc11(agent, var_ef178bb38661ff1b);
                    } else {
                        agent thread namespace_2000a83505151e5b::function_9bbf1713a14fa580(agent, 256, 256);
                    }
                    if (isdefined(obj.var_3bf790f79cb25065)) {
                        agent setgoalvolumeauto(obj.var_3bf790f79cb25065);
                    }
                }
            }
        }
    }
    if (getdvarint(@"hash_8d1f02f0286bc046", 1) == 1) {
        level thread function_d4ed75580b9194a4();
    }
}

// Namespace gwai/namespace_61438684387591a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x56ab
// Size: 0x1f6
function function_d4ed75580b9194a4() {
    var_7cc35fca541e45f = (-38000, -22000, 250);
    stepx = 512;
    var_63f43f469b885ec6 = 512;
    var_d3abc028986e8adc = 12;
    var_d3abc128986e8d0f = 7;
    var_2af470fd7b0d1e70 = (0, 25, 0);
    var_aa5c10fd1d82b3c2 = anglestoforward(var_2af470fd7b0d1e70);
    var_8e38ef517e5e67bd = anglestoright(var_2af470fd7b0d1e70);
    spawnpoints = [];
    for (x = 2; x < var_d3abc028986e8adc; x++) {
        for (y = 2; y < var_d3abc128986e8d0f; y++) {
            spawnpoints[spawnpoints.size] = var_7cc35fca541e45f + var_aa5c10fd1d82b3c2 * x * stepx + var_8e38ef517e5e67bd * y * var_63f43f469b885ec6;
        }
    }
    foreach (origin in spawnpoints) {
        var_5836c6d53a5f99a2 = getnodesinradiussorted(origin, 512, 0, 512, "Path", 1);
        if (isdefined(var_5836c6d53a5f99a2[0])) {
            spawnorigin = var_5836c6d53a5f99a2[0].origin;
            groupname = function_78759441c259f58a(spawnorigin);
            aitype = function_d5bc07eabf352abb();
            agent = ai_mp_requestspawnagent(aitype, spawnorigin, (0, 0, 0), "medium", "everybody", "captureAgents", groupname, undefined, undefined, undefined, 1, 1);
            if (isdefined(agent)) {
                namespace_310ba947928891df::function_35c195df2ba46725(agent, "team_hundred_ninety_five");
                agent thread namespace_2000a83505151e5b::function_9bbf1713a14fa580(agent, 1024, 512);
            }
        }
    }
    text = 0;
}

// Namespace gwai/namespace_61438684387591a2
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x58a8
// Size: 0x354
function function_a30a48f0c1a403ec(objectivekey, team, numagents, var_40e875a042b82875) {
    if (!istrue(level.var_eaa760f325371803)) {
        return;
    }
    obj = level.objectives[objectivekey];
    groupname = function_78759441c259f58a(obj.trigger.origin);
    var_9815fce1944a6ae0 = function_2e33f8e46f95167c(obj.trigger.origin, 1024, 1);
    var_f1548c57038e1b7a = array_combine(var_9815fce1944a6ae0.var_e67f0b2ea7ae69ed, var_9815fce1944a6ae0.var_8a055a821dda7da0, var_9815fce1944a6ae0.var_3288c473e8336ab4);
    if (!isdefined(numagents)) {
        numagents = getdvarint(@"hash_9e91a52d9df515a0", 5);
    }
    if (numagents > 0) {
        for (i = 0; i < numagents; i++) {
            aitype = function_d5bc07eabf352abb();
            agent = ai_mp_requestspawnagent(aitype, obj.trigger.origin, (0, 0, 0), "medium", "everybody", "captureAgents", groupname, team, undefined, undefined, 1, 1);
            if (isdefined(agent)) {
                namespace_310ba947928891df::function_35c195df2ba46725(agent, "team_hundred_ninety_five");
                if (var_f1548c57038e1b7a.size > 0) {
                    var_25dd3020969aa0f6 = function_3a17f0ccddc999b4(agent.origin, var_f1548c57038e1b7a, var_f1548c57038e1b7a.size, 256, 0);
                    var_25dd3020969aa0f6 = array_randomize(var_25dd3020969aa0f6);
                    if (var_25dd3020969aa0f6.size > 0) {
                        agent.balwayscoverexposed = 1;
                        function_2b26d000f2ccfc11(agent, var_25dd3020969aa0f6[0]);
                    } else {
                        agent thread namespace_2000a83505151e5b::function_9bbf1713a14fa580(agent, 256, 256);
                    }
                } else {
                    agent thread namespace_2000a83505151e5b::function_9bbf1713a14fa580(agent, 256, 256);
                }
                agent setgoalvolumeauto(obj.var_3bf790f79cb25065);
                agent.objectivekey = objectivekey;
                level.var_141462a19f98285a[objectivekey][team].agents[level.var_141462a19f98285a[objectivekey][team].agents.size] = agent;
            }
        }
    }
    if (!isdefined(var_40e875a042b82875)) {
        var_40e875a042b82875 = getdvarint(@"hash_b191b8b0b5527c26", 0);
    }
    if (var_40e875a042b82875 > 0) {
        for (i = 0; i < var_40e875a042b82875; i++) {
            agent = ai_mp_requestspawnagent("actor_enemy_mp_jugg_aq", obj.trigger.origin, (0, 0, 0), "absolute", "everybody", "jugg", groupname, undefined, undefined, undefined, 1, 1);
            if (isdefined(agent)) {
                namespace_310ba947928891df::function_35c195df2ba46725(agent, "team_hundred_ninety_five");
                namespace_14d36171baccf528::function_1828f1e20e52b418(agent);
                if (var_f1548c57038e1b7a.size > 0) {
                    var_25dd3020969aa0f6 = function_3a17f0ccddc999b4(agent.origin, var_f1548c57038e1b7a, var_f1548c57038e1b7a.size, 256, 0);
                    var_25dd3020969aa0f6 = array_randomize(var_25dd3020969aa0f6);
                    if (var_25dd3020969aa0f6.size > 0) {
                        agent.balwayscoverexposed = 1;
                        function_2b26d000f2ccfc11(agent, var_25dd3020969aa0f6[0]);
                    } else {
                        agent thread namespace_2000a83505151e5b::function_9bbf1713a14fa580(agent, 256, 256);
                    }
                } else {
                    agent thread namespace_2000a83505151e5b::function_9bbf1713a14fa580(agent, 256, 256);
                }
                agent setgoalvolumeauto(obj.var_3bf790f79cb25065);
            }
        }
    }
}

// Namespace gwai/namespace_61438684387591a2
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5c03
// Size: 0x7a
function function_3b97b97e14948c02(var_34ce337e073a0c34, var_93390a6953905fef) {
    var_9b3bb378db91cf83 = spawnstruct();
    var_9b3bb378db91cf83.origin = var_34ce337e073a0c34;
    var_4f922af45d0cac6c = sortbydistance(level.helireinforcestruct.var_4f922af45d0cac6c, var_9b3bb378db91cf83.origin);
    pathnode = namespace_7ae25d9e5d5a28ef::function_321665dcdcbf401e(var_4f922af45d0cac6c, var_34ce337e073a0c34);
    if (isdefined(pathnode)) {
        return pathnode;
    }
    return undefined;
}

// Namespace gwai/namespace_61438684387591a2
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5c85
// Size: 0x98
function function_5cd456d9b2cdc538(agent, killer) {
    if (!isdefined(agent.objectivekey) || !isgameplayteam(agent.team)) {
        return;
    }
    level.var_141462a19f98285a[agent.objectivekey][agent.team].agents = array_remove(level.var_141462a19f98285a[agent.objectivekey][agent.team].agents, agent);
}

// Namespace gwai/namespace_61438684387591a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5d24
// Size: 0x2e6
function function_848d0782943b416d() {
    namespace_bfef6903bca5845d::function_93add0b65db9f722(&function_5cd456d9b2cdc538, level);
    var_bccbf55e003f6240 = getdvarint(@"hash_9e91a52d9df515a0", 5);
    var_fde40312bd18ae9e = getdvarint(@"hash_ebadb231161de9d", 2);
    var_68299821ad1626e0 = getdvarint(@"hash_84f9bf19eb2301e", 30) * 1000;
    level.var_141462a19f98285a = [];
    foreach (key, obj in level.objectives) {
        level.var_141462a19f98285a[key] = [];
        foreach (team in level.teamnamelist) {
            data = spawnstruct();
            data.agents = [];
            data.var_8e55c5943a080a2e = 0;
            level.var_141462a19f98285a[key][team] = data;
        }
    }
    while (level.objectives.size) {
        foreach (key, obj in level.objectives) {
            wait(1);
            team = obj.ownerteam;
            if (team == "neutral") {
                continue;
            }
            currenttime = gettime();
            if (currenttime < level.var_141462a19f98285a[key][team].var_8e55c5943a080a2e + var_68299821ad1626e0) {
                continue;
            }
            var_9cc5be111b6fa65c = [];
            foreach (agent in level.var_141462a19f98285a[key][team].agents) {
                if (agent.health > 0) {
                    var_9cc5be111b6fa65c[var_9cc5be111b6fa65c.size] = agent;
                }
            }
            level.var_141462a19f98285a[key][team].agents = var_9cc5be111b6fa65c;
            currentcount = level.var_141462a19f98285a[key][team].agents.size;
            if (currentcount <= var_fde40312bd18ae9e) {
                level thread function_a30a48f0c1a403ec(key, team, var_bccbf55e003f6240 - currentcount, 0);
                level.var_141462a19f98285a[key][team].var_8e55c5943a080a2e = currenttime;
            }
        }
    }
}

// Namespace gwai/namespace_61438684387591a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6011
// Size: 0x3fb
function function_9cd290910c24d4d3() {
    items = [];
    var_9fd35ffd09e2a230 = namespace_aead94004cf4c147::function_57931a717f140ebe(self);
    foreach (weapon in var_9fd35ffd09e2a230) {
        variantid = weapon.variantid;
        if (!isdefined(weapon.variantid)) {
            variantid = 0;
        }
        rootname = namespace_e0ee43ef2dddadaa::getweaponrootname(weapon);
        lootid = namespace_e0ee43ef2dddadaa::function_79d6e6c22245687a(rootname, variantid);
        if (isdefined(lootid) && lootid > 0) {
            item = spawnstruct();
            item.lootid = lootid;
            item.ref = rootname;
            item.attachments = weapon.attachments;
            item.camo = weapon.camo;
            item.reticle = weapon.reticle;
            item.variantid = variantid;
            item.quantity = 1;
            if (!isdefined(items["loadoutPrimary"])) {
                items["loadoutPrimary"] = item;
            } else if (!isdefined(items["loadoutSecondary"])) {
                items["loadoutSecondary"] = item;
            }
        }
    }
    self.pers["br_ammo"] = self.br_ammo;
    ref = namespace_1a507865f681850e::getcurrentequipment("primary");
    var_212e6b7d207a0089 = namespace_1a507865f681850e::getequipmentslotammo("primary");
    lootid = namespace_38b993c4618e76cd::getlootidfromref(ref);
    if (isdefined(lootid) && var_212e6b7d207a0089 > 0) {
        item = spawnstruct();
        item.lootid = lootid;
        item.ref = ref;
        item.quantity = 1;
        items["loadoutEquipmentPrimary"] = item;
    }
    ref = namespace_1a507865f681850e::getcurrentequipment("secondary");
    var_212e6b7d207a0089 = namespace_1a507865f681850e::getequipmentslotammo("secondary");
    lootid = namespace_38b993c4618e76cd::getlootidfromref(ref);
    if (isdefined(lootid) && var_212e6b7d207a0089 > 0) {
        item = spawnstruct();
        item.lootid = lootid;
        item.ref = ref;
        item.quantity = 1;
        items["loadoutEquipmentSecondary"] = item;
    }
    ref = namespace_1a507865f681850e::getcurrentequipment("super");
    ref = namespace_38b993c4618e76cd::function_151b82e1257f4cde(ref);
    var_212e6b7d207a0089 = namespace_d20f8ef223912e12::getsuperweapondisabledammobr();
    lootid = namespace_38b993c4618e76cd::getlootidfromref(ref);
    if (isdefined(lootid) && var_212e6b7d207a0089 > 0) {
        item = spawnstruct();
        item.lootid = lootid;
        item.ref = ref;
        item.quantity = 1;
        items["loadoutFieldUpgrade1"] = item;
    }
    ref = namespace_58a74e7d54b56e8d::getkillstreakinslot(1);
    if (isdefined(ref)) {
        lootid = namespace_38b993c4618e76cd::getlootidfromref(ref.streakname);
        if (isdefined(lootid)) {
            item = spawnstruct();
            item.lootid = lootid;
            item.ref = ref;
            item.quantity = 1;
            items["loadoutKillstreak1"] = item;
        }
    }
    if (namespace_d3d40f75bb4e4c32::hasplatepouch()) {
        lootid = namespace_38b993c4618e76cd::getlootidfromref("armor_satchel");
        if (isdefined(lootid)) {
            item = spawnstruct();
            item.lootid = lootid;
            item.quantity = 1;
            items["armorSatchel"] = item;
        }
    }
    itemname = self.equipment["health"];
    itemcount = namespace_1a507865f681850e::getequipmentslotammo("health");
    if (isdefined(itemname) && isdefined(itemcount) && itemcount > 0) {
        item = spawnstruct();
        item.lootid = namespace_38b993c4618e76cd::getlootidfromref("armor_plate");
        item.quantity = itemcount;
        items["armorPlates"] = item;
    }
    return items;
}

// Namespace gwai/namespace_61438684387591a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6414
// Size: 0x3d0
function function_a17ce79209ceccfc() {
    if (istrue(level.var_b543c0a24964346e)) {
        return;
    }
    foreach (player in level.players) {
        player.pers["gamemodeLoadout"] = level.gamemodeloadout;
        if (isreallyalive(player)) {
            inventory = player function_9cd290910c24d4d3();
            if (isdefined(inventory["loadoutPrimary"])) {
                player.pers["gamemodeLoadout"]["loadoutPrimary"] = inventory["loadoutPrimary"].ref;
                for (attachmentindex = 0; attachmentindex < 7; attachmentindex++) {
                    var_efbdcd88107af5f9 = namespace_d19129e4fa5d176::getattachmentloadoutstring(attachmentindex, #"primary");
                    player.pers["gamemodeLoadout"][var_efbdcd88107af5f9] = inventory["loadoutPrimary"].attachments[attachmentindex];
                }
                player.pers["gamemodeLoadout"]["loadoutPrimaryCamo"] = inventory["loadoutPrimary"].camo;
                player.pers["gamemodeLoadout"]["loadoutPrimaryReticle"] = inventory["loadoutPrimary"].reticle;
                player.pers["gamemodeLoadout"]["loadoutPrimaryVariantID"] = inventory["loadoutPrimary"].variantid;
            }
            if (isdefined(inventory["loadoutSecondary"])) {
                player.pers["gamemodeLoadout"]["loadoutSecondary"] = inventory["loadoutSecondary"].ref;
                for (attachmentindex = 0; attachmentindex < 7; attachmentindex++) {
                    var_efbdcd88107af5f9 = namespace_d19129e4fa5d176::getattachmentloadoutstring(attachmentindex, #"secondary");
                    player.pers["gamemodeLoadout"][var_efbdcd88107af5f9] = inventory["loadoutSecondary"].attachments[attachmentindex];
                }
                player.pers["gamemodeLoadout"]["loadoutSecondaryCamo"] = inventory["loadoutSecondary"].camo;
                player.pers["gamemodeLoadout"]["loadoutSecondaryReticle"] = inventory["loadoutSecondary"].reticle;
                player.pers["gamemodeLoadout"]["loadoutSecondaryVariantID"] = inventory["loadoutSecondary"].variantid;
            }
            if (isdefined(inventory["loadoutEquipmentPrimary"])) {
                player.pers["gamemodeLoadout"]["loadoutEquipmentPrimary"] = inventory["loadoutEquipmentPrimary"].ref;
            }
            if (isdefined(inventory["loadoutEquipmentSecondary"])) {
                player.pers["gamemodeLoadout"]["loadoutEquipmentSecondary"] = inventory["loadoutEquipmentSecondary"].ref;
            }
            if (isdefined(inventory["loadoutFieldUpgrade1"])) {
                player.pers["gamemodeLoadout"]["loadoutFieldUpgrade1"] = inventory["loadoutFieldUpgrade1"].ref;
            }
            if (isdefined(inventory["loadoutKillstreak1"])) {
                player.pers["gamemodeLoadout"]["loadoutKillstreak1"] = inventory["loadoutKillstreak1"].ref;
            }
            if (isdefined(inventory["armorSatchel"])) {
                player.pers["gamemodeLoadout"]["armorSatchel"] = inventory["armorSatchel"];
            }
            if (isdefined(inventory["armorPlates"])) {
                player.pers["gamemodeLoadout"]["armorPlates"] = inventory["armorPlates"].quantity;
            }
        }
    }
    level.var_b543c0a24964346e = 1;
}

// Namespace gwai/namespace_61438684387591a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x67eb
// Size: 0xac
function ontimelimit() {
    if (level.gameended) {
        return;
    }
    foreach (obj in level.objectives) {
        if (obj.claimteam != "none" || obj.stalemate) {
            return;
        }
    }
    if (getdvarint(@"hash_8f25cefeaed5250d", 1) == 1) {
        function_354ebff91b3c29ca();
    }
    function_a17ce79209ceccfc();
    namespace_d576b6dc7cef9c62::default_ontimelimit();
}

// Namespace gwai/namespace_61438684387591a2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x689e
// Size: 0x3d
function onscorelimit(winner) {
    if (level.gameended) {
        return;
    }
    if (getdvarint(@"hash_8f25cefeaed5250d", 1) == 1) {
        function_354ebff91b3c29ca();
    }
    function_a17ce79209ceccfc();
}

// Namespace gwai/namespace_61438684387591a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x68e2
// Size: 0x36
function function_947925f5fc6939a3() {
    if (level.gameended) {
        return;
    }
    if (getdvarint(@"hash_8f25cefeaed5250d", 1) == 1) {
        function_354ebff91b3c29ca();
    }
    function_a17ce79209ceccfc();
    return 1;
}

// Namespace gwai/namespace_61438684387591a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6920
// Size: 0x66
function function_354ebff91b3c29ca() {
    var_2704eda0a8d8ea7a = namespace_86b52005c685dfb9::getactiveagentsoftype("all");
    foreach (agent in var_2704eda0a8d8ea7a) {
        namespace_86b52005c685dfb9::killagent(agent);
    }
}

// Namespace gwai/namespace_61438684387591a2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x698d
// Size: 0x5b
function zone_onuse(var_22282e7d48ca3400) {
    namespace_19b4203b51d56488::setownerteam(var_22282e7d48ca3400.team);
    namespace_e8a49b70d0769b66::giveteamscoreforobjective(var_22282e7d48ca3400.team, 1, 0);
    if (istrue(level.var_eaa760f325371803)) {
        level thread function_a30a48f0c1a403ec(self.objectivekey, self.ownerteam);
    }
}

// Namespace gwai/namespace_61438684387591a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x69ef
// Size: 0x183
function function_3e175c0b6527751f() {
    var_ef62e7d81f148b39 = [];
    tower = spawnstruct();
    tower.origin = (-36817, -23834, 255);
    tower.angles = (0, 302, 0);
    var_ef62e7d81f148b39[var_ef62e7d81f148b39.size] = tower;
    tower = spawnstruct();
    tower.origin = (-33345, -24830, 256);
    tower.angles = (0, 236, 0);
    var_ef62e7d81f148b39[var_ef62e7d81f148b39.size] = tower;
    tower = spawnstruct();
    tower.origin = (-31695, -22035, 256);
    tower.angles = (0, 154, 0);
    var_ef62e7d81f148b39[var_ef62e7d81f148b39.size] = tower;
    tower = spawnstruct();
    tower.origin = (-32684, -20101, 261);
    tower.angles = (0, 96, 0);
    var_ef62e7d81f148b39[var_ef62e7d81f148b39.size] = tower;
    tower = spawnstruct();
    tower.origin = (-36176, -19765, 264);
    tower.angles = (0, 335, 0);
    var_ef62e7d81f148b39[var_ef62e7d81f148b39.size] = tower;
    count = getdvarint(@"hash_a4708ad20d0d266e", 3);
    var_ef62e7d81f148b39 = array_randomize(var_ef62e7d81f148b39);
    var_ef62e7d81f148b39 = array_slice(var_ef62e7d81f148b39, 0, count);
    return var_ef62e7d81f148b39;
}

// Namespace gwai/namespace_61438684387591a2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6b7a
// Size: 0xc
function allowclasschoicefunc() {
    return level.allowclasschoice;
}

