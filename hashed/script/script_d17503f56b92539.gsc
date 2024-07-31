#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_7ab5b649fa408138;
#using script_48814951e916af89;
#using scripts\mp\flags.gsc;
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
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\gametypes\arm_vehicles.gsc;
#using scripts\mp\globallogic.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\utility\join_team_aggregator.gsc;
#using script_600b944a95c3a7bf;
#using scripts\mp\rally_point.gsc;
#using scripts\mp\spawnselection.gsc;
#using scripts\cp_mp\parachute.gsc;
#using script_640cf1641c03e2a0;
#using script_2bc0b0102f9b7751;
#using scripts\mp\gametypes\common.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\spawncamera.gsc;
#using scripts\cp_mp\killstreaks\airdrop.gsc;
#using scripts\mp\playerlogic.gsc;
#using script_5bab271917698dc4;
#using scripts\mp\gametypes\br_spectate.gsc;
#using scripts\mp\gametypes\br.gsc;
#using scripts\mp\spectating.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_gulag.gsc;
#using scripts\mp\damage.gsc;
#using script_3f1b6713ca4c9c7;
#using script_76cc264b397db9cb;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\mp\utility\disconnect_event_aggregator.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\utility\game_utility_mp.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using scripts\mp\spawnfactor.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using script_268c4da1ef6a20a8;
#using script_371b4c2ab5861e62;
#using scripts\mp\ai_behavior.gsc;
#using scripts\mp\outofbounds.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\common\cap.gsc;
#using script_7e7fd8191bd7be26;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using script_36967ce8ee2ea745;
#using script_721ee99d7a8f9168;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using script_d17503f56b92539;

#namespace gwtdm;

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e87
// Size: 0xa60
function main() {
    if (getdvar(@"hash_687fb8f9b7a23245") == "mp_background") {
        return;
    }
    scripts\mp\globallogic::init();
    scripts\mp\globallogic::setupcallbacks();
    allowed[0] = getgametype();
    allowed[1] = "arm";
    scripts\mp\gameobjects::main(allowed);
    if (isusingmatchrulesdata()) {
        level.initializematchrules = &initializematchrules;
        [[ level.initializematchrules ]]();
        level thread reinitializematchrulesonmigration();
    } else {
        registertimelimitdvar(getgametype(), 300);
        registerscorelimitdvar(getgametype(), 3);
        registerroundlimitdvar(getgametype(), 1);
        registerwinlimitdvar(getgametype(), 1);
        registernumlivesdvar(getgametype(), 0);
        registerhalftimedvar(getgametype(), 0);
    }
    setdvar(@"hash_320c4db6af00b215", 0);
    setdvar(@"hash_405e7e20d91344cc", 0);
    setdvar(@"hash_42eece3f15e35b3d", 1);
    setdvar(@"hash_a22f98e2c5b506ce", 30);
    setdvar(@"cg_friendlyReviveNameplateEnabled", 0);
    enablegroundwarspawnlogic(400, 1200);
    updategametypedvars();
    scripts\mp\utility\join_team_aggregator::registeronplayerjointeamcallback(&onjoinedteam);
    level.var_a0f41ec8e5268d15 = getdvarint(@"hash_c3babb46fe3fd12b", 1) == 1;
    level.scoreperplayer = undefined;
    level.onstartgametype = &onstartgametype;
    level.onplayerconnect = &onplayerconnect;
    level.getspawnpoint = &getspawnpoint;
    level.modeonspawnplayer = &onspawnplayer;
    level.onplayerkilled = &onplayerkilled;
    level.onrespawndelay = &getrespawndelay;
    level.onnormaldeath = &onnormaldeath;
    level.var_ce95c7540070f7d0 = &function_ce95c7540070f7d0;
    level.var_8decce720ed19f1a = &function_8decce720ed19f1a;
    level.onplayerconnectstream = &onplayerconnectstream;
    level.var_61312c4c9c8a7cae = ["thermite_mp", "semtex_mp", "frag_grenade_mp", "jup_smoke_grenade_mp", "concussion_grenade_mp", "flash_grenade_mp", "snapshot_grenade_mp", "gas_mp", "decoy_grenade_mp"];
    level.var_39643776a698efce = &function_39643776a698efce;
    level.requiredplayercountoveride = 1;
    level.requiredplayercount["allies"] = 24;
    level.requiredplayercount["axis"] = 24;
    level.var_e637d49948a038d3 = &getmissedinfilcamerapositions;
    level.var_3c89983e2030dfff = &calculatecameraoffset;
    game["dialog"]["gametype"] = "dx_mp_gwtd_game_mili_gtnm";
    if (getdvarint(@"hash_4a2b3d01a81655a6")) {
        game["dialog"]["gametype"] = "dh_" + game["dialog"]["gametype"];
    } else if (getdvarint(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_promode"))) {
        game["dialog"]["gametype"] = game["dialog"]["gametype"] + "_pro";
    }
    game["dialog"]["offense_obj"] = "dx_mp_gwtd_game_uktl_gtbs";
    game["dialog"]["defense_obj"] = "dx_mp_gwtd_game_uktl_gtbs";
    game["dialog"]["lead_taken"] = "dx_mp_gwtd_game_uktl_gtlg";
    game["dialog"]["lead_lost"] = "dx_mp_gwtd_game_uktl_gtll";
    game["dialog"]["lead_tied"] = "dx_mp_gwtd_game_uktl_gtlt";
    game["dialog"]["gwtdm_push_foward"] = "dx_mp_gwtd_game_uktl_gtpo";
    game["dialog"]["gwtdm_fall_back"] = "dx_mp_gwtd_game_uktl_gtpd";
    game["dialog"]["score_25_winning"] = "dx_mp_gwtd_game_uktl_wi25";
    game["dialog"]["score_25_losing"] = "dx_mp_gwtd_game_uktl_lo25";
    game["dialog"]["score_50_winning"] = "dx_mp_gwtd_game_uktl_wi50";
    game["dialog"]["score_50_losing"] = "dx_mp_gwtd_game_uktl_lo50";
    game["dialog"]["score_75_winning"] = "dx_mp_gwtd_game_uktl_wi75";
    game["dialog"]["score_75_losing"] = "dx_mp_gwtd_game_uktl_lo75";
    game["dialog"]["score_90_winning"] = "dx_mp_gwtd_game_uktl_wi90";
    game["dialog"]["score_90_losing"] = "dx_mp_gwtd_game_uktl_lo90";
    game["dialog"]["carepackage_inc"] = "dx_mp_gwtd_game_uktl_gtcp";
    game["dialog"]["vehicles_inc"] = "dx_mp_gwtd_game_uktl_gtv1";
    game["dialog"]["vehicles2_inc"] = "dx_mp_gwtd_game_uktl_gtv2";
    game["dialog"]["tier2_friendly"] = "dx_mp_gwtd_game_uktl_frt2";
    game["dialog"]["tier2_enemy"] = "dx_mp_gwtd_game_uktl_ent2";
    game["dialog"]["tier3_friendly"] = "dx_mp_gwtd_game_uktl_frt3";
    game["dialog"]["tier3_enemy"] = "dx_mp_gwtd_game_uktl_ent3";
    level.nosuspensemusic = 1;
    level._effect["vfx_smk_signal_gr"] = loadfx("vfx/_requests/mp_gameplay/vfx_smk_signal_gr");
    level._effect["vfx_snatch_ac130_clouds"] = loadfx("vfx/iw8_mp/gamemode/vfx_snatch_ac130_clouds.vfx");
    level._effect["vfx_br_infil_cloud_scroll"] = loadfx("vfx/iw8_br/gameplay/infil/vfx_br_infil_cloud_scroll.vfx");
    level._effect["vfx_br_infil_jump_smoke_01"] = loadfx("vfx/iw8_br/gameplay/infil/vfx_br_infil_jump_smoke_01.vfx");
    level._effect["vfx_br_infil_jump_smoke_01_enemy"] = loadfx("vfx/iw8_br/gameplay/infil/vfx_br_infil_jump_smoke_01_enemy.vfx");
    level._effect["vfx_br_infil_jump_smoke_01_friendly"] = loadfx("vfx/iw8_br/gameplay/infil/vfx_br_infil_jump_smoke_01_friendly.vfx");
    level._effect["vfx_br_infil_jump_wisp_01"] = loadfx("vfx/iw8_br/gameplay/infil/vfx_br_infil_jump_wisp_01.vfx");
    level._effect["vfx_br_infil_jump_wisp_02"] = loadfx("vfx/iw8_br/gameplay/infil/vfx_br_infil_jump_wisp_02.vfx");
    level._effect["vfx_br_infil_omni_light"] = loadfx("vfx/iw8_br/gameplay/infil/vfx_br_infil_omni_light.vfx");
    level._effect["vfx_br_infil_spot_light"] = loadfx("vfx/iw8_br/gameplay/infil/vfx_br_infil_spot_light.vfx");
    level._effect["vfx_gameplay_tier2_helmet_pop"] = loadfx("vfx/iw9/gameplay/mp/vfx_gameplay_tier2_helmet_pop.vfx");
    level._effect["vfx_gameplay_tier3_helmet_pop"] = loadfx("vfx/iw9/gameplay/mp/vfx_gameplay_tier3_helmet_pop.vfx");
    level.disablespectate = getdvarint(@"hash_6228446f42d1367f", 1) == 1;
    level.userallypointvehicles = getdvarint(@"hash_9381d93d96c2f50b", 1);
    level.hideenemyhq = getdvarint(@"hash_5309488dd7832413", 0);
    level.hideenemyfobs = getdvarint(@"hash_7aefd938edd32dcc", 0);
    level.completelyremovelittlebird = getdvarint(@"hash_e39e476d418a5b03", 0);
    level.var_67a7732487fb9242 = getdvarint(@"hash_e4a8296b521a6dee", 1) == 1;
    level.var_90f4dc933b674184 = getdvarfloat(@"hash_91d950c33d45ae50", 60);
    level.var_1a505675f3ef1197 = getdvarfloat(@"hash_58c456ebd6371a4b", 60);
    level.var_8e9daba162280a8e = getdvarint(@"hash_19e5cada53ccf044", 0) == 1;
    level.var_eaa760f325371803 = getdvarint(@"hash_67a32114ce80b58f", 0) == 1;
    level.var_7f5be0207e7457b1 = getdvarint(@"hash_27abaa55d7ec8eb9", 1) == 1;
    level.var_ad7b64f93b499edb = getdvarint(@"hash_a3d174d73bea831", 1) == 1;
    level.var_7232d887dbda3729 = getdvarint(@"hash_d23a54732db0acd0", 1) == 1;
    level.var_7232d587dbda3090 = getdvarint(@"hash_d23a57732db0b369", 1) == 1;
    level.var_fa789e7bab605e4c = getdvarint(@"hash_72771bed0cb9e6fb", 1) == 1;
    level.var_aadf4e234f763771 = getdvarint(@"hash_d141c82b315573ed", 9);
    level.dropbrloot = getdvarint(@"hash_1d196605f8a290e3", 0);
    level.br_plunder_enabled = getdvarint(@"hash_a6a9b41b654afd1d", 0);
    if (level.br_plunder_enabled) {
        namespace_38b993c4618e76cd::init();
        level.var_e247454ac2869696 = 0;
    }
    level.var_1e17e3480b1d264d = getdvarint(@"hash_644f043f54d141f5", 0);
    level.var_1f42dab41eff5cb2 = getdvarint(@"hash_8fd67e929af907eb", 0);
    if (level.var_1e17e3480b1d264d) {
        level.var_9c1e3c18b99409e9 = &function_9c1e3c18b99409e9;
    }
    level.spawnselectionshowenemy = getdvarint(@"hash_3f0db83ea7503667", 0);
    level.spawnselectionshowfriendly = getdvarint(@"hash_4134532f274e5dfa", 0);
    level.forcetopickafob = getdvarint(@"hash_4a4c22866751f8e", 0);
    level.maxhqtanks = getdvarint(@"hash_9dd6b3477d4b53c6", 2);
    level.tankrespawntime = getdvarint(@"hash_b624863894a18f21", 120);
    level.apcrespawntime = getdvarint(@"hash_ba2474692378b203", 120);
    level.longdialoguecooldown = getdvarint(@"hash_e01953fcf34a5d51", 1);
    level.numnonrallyvehicles = getdvarint(@"hash_87f140caf9a39bf8", 25);
    level.disablepersonalnuke = getdvarint(@"hash_f271257bddc28c95", 0);
    level.personalnukecostoverride = getdvarint(@"hash_d9455f252fccdb97", 30);
    level.showteamtanks = getdvarint(@"hash_236401104966b535", 1);
    level.spawnselectionafktime = getdvarint(@"hash_da4e1d4c2111a1bc", 120);
    level.manualadjustlittlebirdlocs = getdvarint(@"hash_1d04716268113cb5", 1);
    level.var_75c758bc51605c7b = getdvarint(@"hash_47d44a6b84f34214", 1);
    level.var_56bcdc219d432f80 = [];
    if (istrue(level.showteamtanks)) {
        level.trackedtanks = [];
        level.trackedtanks["axis"] = [];
        level.trackedtanks["allies"] = [];
    }
    level.modecontrolledvehiclespawningonly = 1;
    level.disableteamstartspawns = 1;
    level.spawnprotectionexception = &spawnprotectionexception;
    thread function_658c8f668d2cd83c();
    flag_init("stealth_enabled");
    flag_init("level_stealth_initialized");
    flag_init("stealth_spotted");
    /#
        level thread function_529a85d52f057f9b();
        level thread debugnodes();
    #/
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x28ef
// Size: 0x109
function function_39643776a698efce(tier) {
    switch (tier) {
    case 1: 
        return random(["semtex_mp", "frag_grenade_mp", "gas_mp"]);
    case 2: 
        return random(["semtex_mp", "frag_grenade_mp", "jup_smoke_grenade_mp", "concussion_grenade_mp", "flash_grenade_mp", "gas_mp", "decoy_grenade_mp"]);
    case 3: 
        return random(["thermite_mp", "semtex_mp", "frag_grenade_mp", "jup_smoke_grenade_mp", "concussion_grenade_mp", "flash_grenade_mp", "snapshot_grenade_mp", "gas_mp", "decoy_grenade_mp"]);
    default: 
        return undefined;
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a00
// Size: 0xb6
function debugnodes() {
    while (true) {
        foreach (t in getnodearray("traverse", "targetname")) {
            if (issubstr(t.animscript, "jump_")) {
                /#
                    line(t.origin, t.origin + (0, 0, 1024), (1, 0, 0), 1, 0, 150);
                #/
            }
        }
        wait 5;
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2abe
// Size: 0xe8
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
    setdynamicdvar(@"hash_4534d741e9c101d0", getmatchrulesdata("kothData", "zoneLifetime"));
    setdynamicdvar(@"hash_accf47b7cc3ff48a", getmatchrulesdata("kothData", "zoneCaptureTime"));
    setdynamicdvar(@"hash_942eee1708bdff82", getmatchrulesdata("kothData", "zoneActivationDelay"));
    setdynamicdvar(@"hash_a5f514d70bc59c27", getmatchrulesdata("kothData", "randomLocationOrder"));
    setdynamicdvar(@"hash_161f512a8efe13f2", getmatchrulesdata("kothData", "additiveScoring"));
    setdynamicdvar(@"hash_855b11a6ed4db948", getmatchrulesdata("kothData", "pauseTime"));
    setdynamicdvar(@"hash_13b7111b0a7197b", getmatchrulesdata("tdefData", "spawnDelay"));
    registerhalftimedvar("arm", 0);
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2bae
// Size: 0x35e
function onstartgametype() {
    flag_init("frontline_data_init");
    if (!isdefined(game["switchedsides"])) {
        game["switchedsides"] = 0;
    }
    foreach (team in level.teamnamelist) {
        scripts\mp\utility\game::setobjectivehinttext(team, %OBJECTIVES/GWTDM_HINT);
    }
    setclientnamemode("auto_change");
    level.objectives = [];
    level.uncapturableobjectives = [];
    level.var_3fbbc6279594ddf = getdvarint(@"hash_b43bff2a3dd04855", 0) == 1;
    debug_setupmatchdata();
    setuphqs();
    initspawns();
    seticonnames();
    level.usedomflag = 0;
    level.killstreakqueue = [];
    level.teamkillstreakqueue = [];
    level.teamkillstreakqueue["allies"] = [];
    level.teamkillstreakqueue["axis"] = [];
    level.killstreaklist = [];
    level.killstreaklist[4] = ["cruise_predator", "scrambler_drone_guard"];
    level.killstreaklist[3] = ["precision_airstrike", "multi_airstrike", "bradley"];
    level.killstreaklist[2] = ["toma_strike", "chopper_gunner", "pac_sentry", "gunship"];
    level.teamkillstreakqueue["allies"] = ["cruise_predator", "precision_airstrike", "cruise_predator"];
    level.teamkillstreakqueue["axis"] = ["cruise_predator", "precision_airstrike", "cruise_predator"];
    level thread setupwaypointicons();
    calculatehqmidpoint();
    sethqmarkerobjective();
    if (level.usespawnselection) {
        level thread function_84ffed4ec1563259();
    }
    if (istrue(level.userallypointvehicles)) {
        scripts\mp\rally_point::init();
        level thread init_rallyvehicles();
    }
    level.numhqtanks_axis = 0;
    level.numhqtanks_allies = 0;
    level.maxhqtanks = 0;
    thread function_417194d265d63273();
    level thread scripts\mp\spawnselection::updatefobindanger();
    scripts\mp\utility\dialog::initstatusdialog();
    emergency_cleanupents();
    level thread function_aabaace9c798a2e1();
    if (getdvarint(@"hash_248a817b330f8bea", 1) == 1) {
        level function_e2ad02be26ba3879();
    }
    scripts\cp_mp\parachute::initparachutedvars();
    level thread namespace_885300a47c2b51e6::function_ca39a413ace3c168();
    level thread namespace_7ae25d9e5d5a28ef::function_d0ffcd08e0870cf2();
    if (getdvarint(@"hash_48d28ba522840d33", 1) == 1) {
        level thread initai();
    }
    if (getdvarint(@"hash_289d6da5e0aff476", 1) == 1) {
        level.var_4eb71f2b8cba5cb = &function_6b1cbd26d1b252b4;
        level thread function_6ad69ddd2454e5b3();
    }
    level thread function_6d1fed8dd6165391();
    level thread function_a999b4ee6f415e8c();
    if (level.frontlinedata[0].lanedata[0].frontvolume.size > 0) {
        level thread function_c1313bf26d803678("axis");
        level thread function_c1313bf26d803678("allies");
    }
    level thread function_4baf8b94714b68fe();
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f14
// Size: 0x17f
function updategametypedvars() {
    scripts\mp\gametypes\common::updatecommongametypedvars();
    level.var_47e84d3946482b9f = dvarintvalue("gainPlantedSites", 0, 0, 1);
    level.var_85faaaced1b1d39c = dvarintvalue("loseDestroyedSites", 1, 0, 1);
    level.var_3b3a02f94873e48a = dvarintvalue("gainDestroyedSites", 0, 0, 1);
    level.pausescoring = dvarintvalue("pauseTime", 1, 0, 1);
    level.spawndelay = dvarfloatvalue("spawnDelay", 5, 0, 30);
    level.flagcapturetime = dvarfloatvalue("flagCaptureTime", 30, 0, 30);
    level.flagsrequiredtoscore = dvarintvalue("flagsRequiredToScore", 1, 1, 3);
    level.pointsperflag = dvarintvalue("pointsPerFlag", 1, 1, 300);
    level.flagneutralization = dvarintvalue("flagNeutralization", 0, 0, 1);
    level.precappoints = dvarintvalue("preCapPoints", 0, 0, 1);
    level.capturedecay = dvarintvalue("captureDecay", 1, 0, 1);
    level.capturetype = dvarintvalue("captureType", 1, 0, 3);
    level.numflagsscoreonkill = dvarintvalue("numFlagsScoreOnKill", 0, 0, 3);
    level.objectivescaler = dvarfloatvalue("objScalar", 4, 1, 10);
    level.pointsperkillai = dvarintvalue("pointsperkill_ai", 1, 0, 10);
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x309b
// Size: 0x2
function seticonnames() {
    
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x30a5
// Size: 0x30a
function emergency_cleanupents() {
    scripts\cp_mp\utility\game_utility::removematchingents_bykey("delete_on_load", "targetname");
    scripts\cp_mp\utility\game_utility::removematchingents_bykey("vehicle_volume", "script_noteworthy");
    scripts\cp_mp\utility\game_utility::removematchingents_bykey("vehicle_volume_simplified", "script_noteworthy");
    scripts\cp_mp\utility\game_utility::removematchingents_bykey("super", "script_noteworthy");
    scripts\cp_mp\utility\game_utility::removematchingents_bykey("militarybase", "script_noteworthy");
    scripts\cp_mp\utility\game_utility::removematchingents_bykey("location_volume", "targetname");
    scripts\cp_mp\utility\game_utility::removematchingents_bykey("locale_area_trigger", "targetname");
    scripts\cp_mp\utility\game_utility::removematchingents_bykey("bank_entry_detector", "targetname");
    scripts\cp_mp\utility\game_utility::removematchingents_bykey("shadow_blocker", "targetname");
    scripts\cp_mp\utility\game_utility::removematchingents_bymodel("door_prison_cell_metal_mp", 1);
    scripts\cp_mp\utility\game_utility::removematchingents_bymodel("veh8_mil_air_acharlie130", 1);
    scripts\cp_mp\utility\game_utility::removematchingents_bymodel("door_wooden_panel_mp_01", 1);
    scripts\cp_mp\utility\game_utility::removematchingents_bymodel("me_electrical_box_street_01", 1);
    scripts\cp_mp\utility\game_utility::removematchingents_bycodeclassname("light");
    if (isdefined(level.localeid) && level.localeid == "locale_6") {
        scripts\cp_mp\utility\game_utility::removematchingents_bykey("locale_8", "script_noteworthy");
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
            foreach (badtagorigin in var_a48ba5ee7fe7c64c) {
                if (var_e24c6c7277a83762) {
                    break;
                }
                if (distancesquared(ent.origin, badtagorigin) < 144) {
                    var_e24c6c7277a83762 = 1;
                }
            }
            if (var_e24c6c7277a83762) {
                ent delete();
            }
        }
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x33b7
// Size: 0x132
function removepatchablecollision_delayed() {
    wait 5;
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
        scripts\cp_mp\utility\game_utility::removematchingents_bykey(name, "targetname");
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x34f1
// Size: 0xb
function onjoinedteam(player) {
    
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3504
// Size: 0x36
function debug_setupmatchdata() {
    level.var_6121d66ffc5b8ec9 = [];
    level.var_6121d66ffc5b8ec9["axis"] = "gw_fob_axisHQ";
    level.var_6121d66ffc5b8ec9["allies"] = "gw_fob_alliesHQ";
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3542
// Size: 0x11e
function setupwaypointicons() {
    while (!isdefined(game["killstreakTable"])) {
        waitframe();
    }
    foreach (var_dfbd7318ef3cc9bd, data in game["killstreakTable"].tabledatabyref) {
        level.waypointcolors[var_dfbd7318ef3cc9bd + "_incoming"] = "neutral";
        level.waypointbgtype[var_dfbd7318ef3cc9bd + "_incoming"] = 1;
        level.waypointstring[var_dfbd7318ef3cc9bd + "_incoming"] = "";
        level.waypointshader[var_dfbd7318ef3cc9bd + "_incoming"] = data.hudicon;
        level.waypointpulses[var_dfbd7318ef3cc9bd + "_incoming"] = 0;
        level.waypointcolors[var_dfbd7318ef3cc9bd] = "neutral";
        level.waypointbgtype[var_dfbd7318ef3cc9bd] = 1;
        level.waypointstring[var_dfbd7318ef3cc9bd] = "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS";
        level.waypointshader[var_dfbd7318ef3cc9bd] = data.hudicon;
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3668
// Size: 0xf4
function setuphqs() {
    level.gw_objstruct = spawnstruct();
    level.gw_objstruct.axishqloc = spawnstruct();
    level.gw_objstruct.axishqloc.trigger = scripts\cp_mp\utility\game_utility::getlocaleent(level.var_6121d66ffc5b8ec9["axis"]);
    if (!isdefined(level.gw_objstruct.axishqloc)) {
        assert(0, "<dev string:x1c>");
    }
    level.gw_objstruct.allieshqloc = spawnstruct();
    level.gw_objstruct.allieshqloc.trigger = scripts\cp_mp\utility\game_utility::getlocaleent(level.var_6121d66ffc5b8ec9["allies"]);
    if (!isdefined(level.gw_objstruct.allieshqloc)) {
        assert(0, "<dev string:x40>");
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3764
// Size: 0x1de
function function_84ffed4ec1563259(numobjs) {
    level.spawnareas = [];
    foreach (entry in level.teamnamelist) {
        level.spawnareas[entry] = [level.var_6121d66ffc5b8ec9[entry]];
    }
    scripts\mp\spawnselection::setspawnlocations(level.spawnareas["axis"], "axis");
    scripts\mp\spawnselection::setspawnlocations(level.spawnareas["allies"], "allies");
    while (!isdefined(level.spawnselectionlocations)) {
        waitframe();
    }
    waitframe();
    if (isdefined(level.spawnselectionlocations[level.var_6121d66ffc5b8ec9["axis"]]["axis"].anchorentity)) {
        level.spawnselectionlocations[level.var_6121d66ffc5b8ec9["axis"]]["axis"].anchorentity.origin = level.gw_objstruct.axishqloc.trigger.origin;
    }
    if (isdefined(level.spawnselectionlocations[level.var_6121d66ffc5b8ec9["allies"]]["allies"].anchorentity)) {
        level.spawnselectionlocations[level.var_6121d66ffc5b8ec9["allies"]]["allies"].anchorentity.origin = level.gw_objstruct.allieshqloc.trigger.origin;
    }
    level thread objective_manageobjectivesintrovisibility();
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x394a
// Size: 0x225
function objective_manageobjectivesintrovisibility() {
    wait 1;
    scripts\mp\objidpoolmanager::objective_playermask_hidefromall(level.gw_objstruct.axishqloc.marker.objidnum);
    scripts\mp\objidpoolmanager::objective_playermask_hidefromall(level.gw_objstruct.allieshqloc.marker.objidnum);
    scripts\mp\objidpoolmanager::objective_playermask_hidefromall(level.gw_objstruct.axishqloc.enemymarker.objidnum);
    scripts\mp\objidpoolmanager::objective_playermask_hidefromall(level.gw_objstruct.allieshqloc.enemymarker.objidnum);
    if (isdefined(level.rallypointvehicles)) {
        foreach (rallypoint in level.rallypointvehicles) {
            scripts\mp\objidpoolmanager::objective_playermask_hidefromall(rallypoint.marker.objidnum);
        }
    }
    while (!scripts\mp\flags::gameflag("prematch_done")) {
        waitframe();
    }
    scripts\mp\objidpoolmanager::objective_teammask_addtomask(level.gw_objstruct.axishqloc.marker.objidnum, "axis");
    scripts\mp\objidpoolmanager::objective_teammask_addtomask(level.gw_objstruct.allieshqloc.marker.objidnum, "allies");
    if (isdefined(level.rallypointvehicles)) {
        foreach (rallypoint in level.rallypointvehicles) {
            if (isdefined(rallypoint)) {
                scripts\mp\objidpoolmanager::objective_teammask_addtomask(rallypoint.marker.objidnum, rallypoint.team);
            }
        }
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b77
// Size: 0x109
function hackfixcameras() {
    if (istrue(level.usestaticspawnselectioncamera)) {
        return;
    }
    while (!istrue(level.var_1091b5d43ba7a905)) {
        waitframe();
    }
    team = "allies";
    forward = level.spawnselectionteamforward[team];
    if (istrue(level.usespawnselection)) {
        keys = ["gw_fob_alliesHQ", "_d", "_e", "_f"];
    } else {
        keys = ["default"];
    }
    scripts\mp\spawncamera::function_71a2a6a6f52ab30b(keys, team, forward, -8500, 7000);
    team = "axis";
    forward = level.spawnselectionteamforward[team];
    if (istrue(level.usespawnselection)) {
        keys = ["gw_fob_axisHQ", "_a", "_b", "_c"];
    } else {
        keys = ["default"];
    }
    scripts\mp\spawncamera::function_71a2a6a6f52ab30b(keys, team, forward, -8500, 7000);
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3c88
// Size: 0x4fb
function sethqmarkerobjective() {
    visibility = "any";
    origin = level.gw_objstruct.axishqloc.trigger.origin;
    marker = scripts\mp\gameobjects::createobjidobject(origin, "neutral", (0, 0, 0), undefined, visibility, 0);
    scripts\mp\objidpoolmanager::update_objective_ownerteam(marker.objidnum, "axis");
    scripts\mp\objidpoolmanager::objective_teammask_addtomask(marker.objidnum, "axis");
    scripts\mp\objidpoolmanager::objective_set_play_intro(marker.objidnum, 0);
    marker.lockupdatingicons = 0;
    scripts\mp\objidpoolmanager::objective_pin_global(marker.objidnum, 0);
    scripts\mp\objidpoolmanager::update_objective_icon(marker.objidnum, "icon_waypoint_hq_friendly");
    scripts\mp\objidpoolmanager::update_objective_setbackground(marker.objidnum, 6);
    marker.lockupdatingicons = 1;
    level.gw_objstruct.axishqloc.marker = marker;
    level.uncapturableobjectives[level.uncapturableobjectives.size] = marker;
    marker = scripts\mp\gameobjects::createobjidobject(origin, "neutral", (0, 0, 0), undefined, visibility, 0);
    scripts\mp\objidpoolmanager::update_objective_ownerteam(marker.objidnum, "axis");
    scripts\mp\objidpoolmanager::objective_teammask_addtomask(marker.objidnum, "allies");
    scripts\mp\objidpoolmanager::objective_set_play_intro(marker.objidnum, 0);
    marker.lockupdatingicons = 0;
    scripts\mp\objidpoolmanager::objective_pin_global(marker.objidnum, 0);
    scripts\mp\objidpoolmanager::update_objective_icon(marker.objidnum, "icon_waypoint_hq_enemy");
    scripts\mp\objidpoolmanager::update_objective_setbackground(marker.objidnum, 7);
    marker.lockupdatingicons = 1;
    level.gw_objstruct.axishqloc.enemymarker = marker;
    level.uncapturableobjectives[level.uncapturableobjectives.size] = marker;
    origin = level.gw_objstruct.allieshqloc.trigger.origin;
    marker = scripts\mp\gameobjects::createobjidobject(origin, "neutral", (0, 0, 0), undefined, visibility, 0);
    scripts\mp\objidpoolmanager::update_objective_ownerteam(marker.objidnum, "allies");
    scripts\mp\objidpoolmanager::objective_teammask_addtomask(marker.objidnum, "allies");
    scripts\mp\objidpoolmanager::objective_set_play_intro(marker.objidnum, 0);
    marker.lockupdatingicons = 0;
    scripts\mp\objidpoolmanager::objective_pin_global(marker.objidnum, 0);
    scripts\mp\objidpoolmanager::update_objective_icon(marker.objidnum, "icon_waypoint_hq_friendly");
    scripts\mp\objidpoolmanager::update_objective_setbackground(marker.objidnum, 6);
    marker.lockupdatingicons = 1;
    level.gw_objstruct.allieshqloc.marker = marker;
    level.uncapturableobjectives[level.uncapturableobjectives.size] = marker;
    marker = scripts\mp\gameobjects::createobjidobject(origin, "neutral", (0, 0, 0), undefined, visibility, 0);
    scripts\mp\objidpoolmanager::update_objective_ownerteam(marker.objidnum, "allies");
    scripts\mp\objidpoolmanager::objective_teammask_addtomask(marker.objidnum, "axis");
    scripts\mp\objidpoolmanager::objective_set_play_intro(marker.objidnum, 0);
    marker.lockupdatingicons = 0;
    scripts\mp\objidpoolmanager::objective_pin_global(marker.objidnum, 0);
    scripts\mp\objidpoolmanager::update_objective_icon(marker.objidnum, "icon_waypoint_hq_enemy");
    scripts\mp\objidpoolmanager::update_objective_setbackground(marker.objidnum, 7);
    marker.lockupdatingicons = 1;
    level.gw_objstruct.allieshqloc.enemymarker = marker;
    level.uncapturableobjectives[level.uncapturableobjectives.size] = marker;
    level.spawnselectionteamforward = [];
    level.spawnselectionteamforward["allies"] = vectornormalize(level.gw_objstruct.axishqloc.trigger.origin - level.gw_objstruct.allieshqloc.trigger.origin);
    level.spawnselectionteamforward["axis"] = vectornormalize(level.gw_objstruct.allieshqloc.trigger.origin - level.gw_objstruct.axishqloc.trigger.origin);
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x418b
// Size: 0x47
function dropcrate(killstreakname, droplocation, team) {
    crate = scripts\cp_mp\killstreaks\airdrop::function_99cc30ea8be5b2a6(team, killstreakname, droplocation.origin, (0, randomint(360), 0), undefined);
    return crate;
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x41db
// Size: 0xea
function docratedropsmoke(crate, droplocation, duration) {
    var_e0d03a39e88dff15 = droplocation + (0, 0, 2000);
    spawnpos = utility::groundpos(var_e0d03a39e88dff15, (0, 0, 1));
    vfxent = spawn("script_model", spawnpos);
    vfxent setmodel("tag_origin");
    vfxent.angles = (0, 0, 0);
    vfxent playloopsound("smoke_carepackage_smoke_lp");
    wait 1;
    playfxontag(getfx("vfx_smk_signal_gr"), vfxent, "tag_origin");
    if (isdefined(crate)) {
        crate waittill_any_timeout_1(duration, "crate_dropped");
    } else {
        wait duration;
    }
    stopfxontag(getfx("vfx_smk_signal_gr"), vfxent, "tag_origin");
    vfxent delete();
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x42cd
// Size: 0x208
function function_e2ad02be26ba3879() {
    level.cratelocs = [];
    locs = getstructarray("carepackage_loc", "targetname");
    foreach (loc in locs) {
        struct = spawnstruct();
        struct.origin = loc.origin;
        struct.angles = loc.angles;
        struct.inuse = 0;
        struct.isvehiclerestricted = 0;
        if (isdefined(loc.script_noteworthy) && loc.script_noteworthy == "noVehicleDrop") {
            struct.isvehiclerestricted = 1;
        }
        /#
            if (getdvarint(@"hash_1af6b48d9e65d84c", 0) == 1) {
                color = (0, 1, 0);
                if (struct.isvehiclerestricted) {
                    color = (1, 0, 0);
                }
                print3d(struct.origin, "<dev string:x66>" + struct.origin[0] + "<dev string:x6c>" + struct.origin[1] + "<dev string:x6c>" + struct.origin[2] + "<dev string:x72>", (1, 1, 1), 1, 1, 9999, 1);
                thread drawsphere(struct.origin, 128, 9999, color);
                thread drawline(struct.origin, struct.origin + (0, 0, 2000), 9999, color);
            }
        #/
        level.cratelocs[level.cratelocs.size] = struct;
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x44dd
// Size: 0x1f6
function killstreakCrateLoop() {
    level endon("game_ended");
    level notify("killstreakCrateLoop");
    level endon("killstreakCrateLoop");
    level.var_cbb5fb5077bac26d = 0;
    while (!scripts\mp\flags::gameflag("prematch_done")) {
        waitframe();
    }
    interval = getdvarint(@"hash_25b96a647e40df81", 120);
    var_fb197850ee0f47a0 = getdvarint(@"hash_4220024cbeafaee2", 1) == 1;
    while (true) {
        foreach (team in level.teamnamelist) {
            scripts\mp\utility\dialog::statusdialog("carepackage_inc", team, 1);
            showsplashtoteam(team, "gwtdm_carepackage_inc");
        }
        if (!var_fb197850ee0f47a0) {
            dropkillstreakcrate();
        } else {
            data = level.frontlinedata[level.var_48e03f24b9b5c1a];
            for (laneKey = 0; laneKey < data.lanedata.size; laneKey++) {
                lanedata = data.lanedata[laneKey];
                if (level.var_48e03f24b9b5c1a < level.startingfrontline && function_489262584e53d09b("axis")) {
                    droporigin = lanedata.frontvolume["axis"].origin;
                } else if (level.var_48e03f24b9b5c1a > level.startingfrontline && function_489262584e53d09b("allies")) {
                    droporigin = lanedata.frontvolume["allies"].origin;
                } else {
                    droporigin = lanedata.origin;
                }
                dropkillstreakcrate(droporigin);
                wait randomintrange(5, 8);
            }
        }
        wait interval;
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x46db
// Size: 0x6b
function function_489262584e53d09b(var_7e441f99479e9b56) {
    axisscore = getteamscore("axis");
    alliesscore = getteamscore("allies");
    if (var_7e441f99479e9b56 == "axis") {
        if (axisscore * 1.3 < alliesscore) {
            return true;
        }
    } else if (var_7e441f99479e9b56 == "allies") {
        if (alliesscore * 1.3 < axisscore) {
            return true;
        }
    }
    return false;
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x474f
// Size: 0xa4
function dropkillstreakcrate(droporigin) {
    var_c7709ea550bbb458 = undefined;
    foreach (player in level.players) {
        if (isdefined(player)) {
            var_c7709ea550bbb458 = player;
            break;
        }
    }
    if (level.var_cbb5fb5077bac26d >= level.var_aadf4e234f763771) {
        return;
    }
    location = choosecratelocation(droporigin);
    if (isdefined(location)) {
        thread runkillstreakreward(location, var_c7709ea550bbb458);
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x47fb
// Size: 0x30d
function choosecratelocation(droporigin) {
    if (isdefined(droporigin)) {
        var_92459ae9b006b9f7 = droporigin;
    } else {
        randfrac = randomfloatrange(0, 1);
        if (level.var_48e03f24b9b5c1a < level.startingfrontline && function_489262584e53d09b("axis")) {
            minpoint = level.frontlinedata[level.var_48e03f24b9b5c1a].lanedata[0].frontvolume["axis"].origin;
            var_64517c7a808446bd = level.frontlinedata[level.var_48e03f24b9b5c1a].lanedata.size;
            maxpoint = level.frontlinedata[level.var_48e03f24b9b5c1a].lanedata[var_64517c7a808446bd].frontvolume["axis"].origin;
        } else if (level.var_48e03f24b9b5c1a > level.startingfrontline && function_489262584e53d09b("allies")) {
            minpoint = level.frontlinedata[level.var_48e03f24b9b5c1a].lanedata[0].frontvolume["allies"].origin;
            var_64517c7a808446bd = level.frontlinedata[level.var_48e03f24b9b5c1a].lanedata.size;
            maxpoint = level.frontlinedata[level.var_48e03f24b9b5c1a].lanedata[var_64517c7a808446bd].frontvolume["allies"].origin;
        } else {
            minpoint = level.frontlinedata[level.var_48e03f24b9b5c1a].minpoint;
            maxpoint = level.frontlinedata[level.var_48e03f24b9b5c1a].maxpoint;
        }
        var_92459ae9b006b9f7 = vectorlerp(minpoint, maxpoint, randfrac);
    }
    trace = ray_trace(var_92459ae9b006b9f7, var_92459ae9b006b9f7 - (0, 0, 100000));
    var_92459ae9b006b9f7 = trace["position"];
    var_794937a10118f0d9 = findclosestdroplocation(var_92459ae9b006b9f7);
    if (false) {
        thread drawline(level.frontlinedata[level.var_48e03f24b9b5c1a].minpoint, level.frontlinedata[level.var_48e03f24b9b5c1a].maxpoint, 1000, (0, 1, 1));
        thread drawsphere(var_92459ae9b006b9f7, 100, 1000, (1, 0, 0));
        thread drawsphere(var_794937a10118f0d9.origin, 100, 1000, (0, 1, 0));
        thread drawline(var_92459ae9b006b9f7, var_794937a10118f0d9.origin, 1000, (0, 1, 0));
    }
    return var_794937a10118f0d9;
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4b11
// Size: 0xaf
function findclosestdroplocation(origin, isvehicledrop) {
    startlocation = spawnstruct();
    startlocation.origin = origin;
    sortedlocs = startlocation array_sort_with_func(level.cratelocs, &function_c271e4000367648f);
    for (i = 0; i < sortedlocs.size; i++) {
        loc = sortedlocs[i];
        if (loc.inuse) {
            continue;
        }
        if (istrue(isvehicledrop) && istrue(loc.isvehiclerestricted)) {
            continue;
        }
        loc.inuse = 1;
        return loc;
    }
    return undefined;
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4bc9
// Size: 0x46
function function_c271e4000367648f(location1, location2) {
    return distance2dsquared(location1.origin, self.origin) < distance2dsquared(location2.origin, self.origin);
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4c18
// Size: 0x347
function runkillstreakreward(location, creditplayer) {
    level endon("game_ended");
    streakname = scripts\cp_mp\killstreaks\airdrop::function_5d1369bfc4efd8b7(creditplayer.team);
    crate = undefined;
    object = scripts\mp\gameobjects::createobjidobject(location.origin, "neutral", (0, 0, 72), undefined, "any");
    object.origin = location.origin;
    thread docratedropsmoke(undefined, location.origin, 16);
    object.iconname = "_incoming";
    object.lockupdatingicons = 0;
    object scripts\mp\gameobjects::setobjectivestatusicons("carepackage");
    scripts\mp\objidpoolmanager::update_objective_setbackground(object.objidnum, 8);
    object.lockupdatingicons = 1;
    waittime = getdvarint(@"hash_41f80710e72eb107", 5);
    wait waittime;
    crate = scripts\cp_mp\killstreaks\airdrop::function_99cc30ea8be5b2a6(creditplayer.team, streakname, location.origin, (0, randomint(360), 0), undefined);
    if (!isdefined(crate)) {
        object scripts\mp\gameobjects::setvisibleteam("none");
        object scripts\mp\gameobjects::releaseid();
        object.visibleteam = "none";
        location.inuse = 0;
        return;
    }
    crate.skipminimapicon = 1;
    crate.nevertimeout = 0;
    crate.waitforobjectiveactivate = 1;
    crate.killminimapicon = 0;
    crate.disallowheadiconid = 1;
    crate.isarmcrate = 1;
    level.var_cbb5fb5077bac26d += 1;
    usetime = getdvarfloat(@"hash_d25321c867cf3a80", 10);
    crate.usetimeoverride = usetime;
    crate waittill("crate_dropped");
    if (!isdefined(crate)) {
        object scripts\mp\gameobjects::setvisibleteam("none");
        object scripts\mp\gameobjects::releaseid();
        object.visibleteam = "none";
        location.inuse = 0;
        return;
    }
    object.useobj = crate;
    object.origin = crate.origin;
    crate notify("objective_activate");
    scripts\mp\objidpoolmanager::update_objective_onentity(object.objidnum, crate);
    scripts\mp\objidpoolmanager::update_objective_setzoffset(object.objidnum, 72);
    object.iconname = "";
    object.lockupdatingicons = 0;
    object scripts\mp\gameobjects::setobjectivestatusicons("carepackage");
    object.lockupdatingicons = 1;
    scripts\mp\objidpoolmanager::update_objective_setbackground(object.objidnum, 8);
    objective_setlabel(object.objidnum, "");
    crate waittill("death");
    level.var_cbb5fb5077bac26d -= 1;
    object scripts\mp\gameobjects::setvisibleteam("none");
    object scripts\mp\gameobjects::releaseid();
    object.visibleteam = "none";
    location.inuse = 0;
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4f67
// Size: 0x5f1
function initspawns() {
    level.gamemodestartspawnpointnames = [];
    if (scripts\mp\spawnselection::function_167619fe3d0cff00()) {
        var_48501209a3e177a7 = "mp_gw_spawn_allies_start";
        var_ae7d0107ad485428 = "mp_gw_spawn_axis_start";
        level.gamemodestartspawnpointnames["allies"] = var_48501209a3e177a7;
        level.gamemodestartspawnpointnames["axis"] = var_ae7d0107ad485428;
        level.gamemodespawnpointnames = [];
        level.gamemodespawnpointnames["allies"] = "mp_tdm_spawn";
        level.gamemodespawnpointnames["axis"] = "mp_tdm_spawn";
        level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
        level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
        if (function_bff229a11ecd1e34()) {
            scripts\mp\spawnlogic::setactivespawnlogic(#"default");
        } else if (scripts\cp_mp\utility\game_utility::getmapname() == "mp_aniyah") {
            scripts\mp\spawnlogic::setactivespawnlogic("GroundWarTTLOS", "Crit_Default");
        } else if (scripts\cp_mp\utility\game_utility::islargemap()) {
            scripts\mp\spawnlogic::setactivespawnlogic("GroundWar", "Crit_Default");
        } else {
            scripts\mp\spawnlogic::setactivespawnlogic("Default", "Crit_Default");
        }
        scripts\mp\spawnlogic::addstartspawnpoints(var_48501209a3e177a7);
        scripts\mp\spawnlogic::addstartspawnpoints(var_ae7d0107ad485428);
        scripts\mp\spawnlogic::addspawnpoints("allies", var_48501209a3e177a7);
        scripts\mp\spawnlogic::addspawnpoints("axis", var_ae7d0107ad485428);
        alliesstartspawns = scripts\mp\spawnlogic::getspawnpointarray(var_48501209a3e177a7);
        axisstartspawns = scripts\mp\spawnlogic::getspawnpointarray(var_ae7d0107ad485428);
        scripts\mp\spawnlogic::registerspawnset("start_allies", alliesstartspawns);
        scripts\mp\spawnlogic::registerspawnset("start_axis", axisstartspawns);
        scripts\mp\spawnlogic::addspawnpoints("allies", "mp_tdm_spawn");
        scripts\mp\spawnlogic::addspawnpoints("axis", "mp_tdm_spawn");
        scripts\mp\spawnlogic::addspawnpoints("allies", "mp_tdm_spawn_secondary", 1, 1);
        scripts\mp\spawnlogic::addspawnpoints("axis", "mp_tdm_spawn_secondary", 1, 1);
        spawns = scripts\mp\spawnlogic::getspawnpointarray("mp_tdm_spawn");
        spawnssecondary = scripts\mp\spawnlogic::getspawnpointarray("mp_tdm_spawn_secondary");
        scripts\mp\spawnlogic::registerspawnset("normal", spawns);
        scripts\mp\spawnlogic::registerspawnset("fallback", spawnssecondary);
        level.mapcenter = scripts\mp\spawnlogic::findboxcenter(level.spawnmins, level.spawnmaxs);
        setmapcenter(level.mapcenter);
        level.spawnpoints = spawns;
    } else if (level.var_3fbbc6279594ddf) {
        level.modespawnclient = &modespawn;
        level.modeplayerkilledspawn = &playerkilledspawn;
        level.parachutedeploydelay = getdvarfloat(@"hash_922022ea1fcaa09a", 1.5);
    } else {
        var_48501209a3e177a7 = "mp_gw_spawn_allies_start";
        var_ae7d0107ad485428 = "mp_gw_spawn_axis_start";
        var_600a07d6f7838f5e = "mp_tdm_spawn";
        level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
        level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
        level.var_2ad659edb860ab3a = [];
        level.var_2ad659edb860ab3a["allies"] = "start_allies";
        level.var_2ad659edb860ab3a["axis"] = "start_axis";
        level.var_ad9cae795e7505c6 = [];
        level.var_ad9cae795e7505c6["allies"] = "normal_allies";
        level.var_ad9cae795e7505c6["axis"] = "normal_axis";
        scripts\mp\spawnlogic::addstartspawnpoints(var_48501209a3e177a7);
        scripts\mp\spawnlogic::addstartspawnpoints(var_ae7d0107ad485428);
        scripts\mp\spawnlogic::addspawnpoints("allies", var_48501209a3e177a7);
        scripts\mp\spawnlogic::addspawnpoints("axis", var_ae7d0107ad485428);
        alliesstartspawns = scripts\mp\spawnlogic::getspawnpointarray(var_48501209a3e177a7);
        axisstartspawns = scripts\mp\spawnlogic::getspawnpointarray(var_ae7d0107ad485428);
        scripts\mp\spawnlogic::registerspawnset("start_allies", alliesstartspawns);
        scripts\mp\spawnlogic::registerspawnset("start_axis", axisstartspawns);
        scripts\mp\spawnlogic::addspawnpoints("allies", var_600a07d6f7838f5e);
        scripts\mp\spawnlogic::addspawnpoints("axis", var_600a07d6f7838f5e);
        spawns = scripts\mp\spawnlogic::getspawnpointarray("mp_tdm_spawn");
        allyspawns = [];
        axisspawns = [];
        foreach (s in spawns) {
            if (s.target == "axis") {
                axisspawns[axisspawns.size] = s;
                continue;
            }
            if (s.target == "allies") {
                allyspawns[allyspawns.size] = s;
                continue;
            }
            targets = getstructarray(s.target, "targetname");
            if (targets.size > 0) {
                continue;
            }
            fwd = anglestoforward(s.angles);
            axishq = level.gw_objstruct.axishqloc.trigger.origin;
            var_24d6579a0cb7b871 = vectornormalize(axishq - s.origin);
            axisdot = vectordot(fwd, var_24d6579a0cb7b871);
            allieshq = level.gw_objstruct.allieshqloc.trigger.origin;
            var_8668b71cdf65a836 = vectornormalize(allieshq - s.origin);
            alliesdot = vectordot(fwd, var_8668b71cdf65a836);
            if (axisdot > alliesdot) {
                allyspawns[allyspawns.size] = s;
                continue;
            }
            axisspawns[axisspawns.size] = s;
        }
        scripts\mp\spawnlogic::registerspawnset("normal_allies", allyspawns);
        scripts\mp\spawnlogic::registerspawnset("normal_axis", axisspawns);
        level.mapcenter = scripts\mp\spawnlogic::findboxcenter(level.spawnmins, level.spawnmaxs);
        setmapcenter(level.mapcenter);
    }
    level thread function_e02a492a4a229f7e();
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5560
// Size: 0x1f4
function function_e02a492a4a229f7e() {
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    level.mapcenter = scripts\mp\spawnlogic::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
    parachuteheight = getdvarint(@"hash_54449fe780ddb32f", 3000);
    flag_wait("frontline_data_init");
    for (key = 0; key < level.frontlinedata.size; key++) {
        data = level.frontlinedata[key];
        for (laneKey = 0; laneKey < data.lanedata.size; laneKey++) {
            lanedata = data.lanedata[laneKey];
            lanedata.redeployspawn = [];
            foreach (team in level.teamnamelist) {
                spawnpoint = spawnstruct();
                groundorigin = drop_to_ground(lanedata.origin, undefined, undefined, (0, 0, 1));
                spawnpoint.origin = groundorigin + (0, 0, 1) * parachuteheight;
                spawnpoint.angles = vectortoangles(level.spawnselectionteamforward[team]);
                spawnpoint.time = gettime();
                spawnpoint.index = -1;
                lanedata.redeployspawn[team] = spawnpoint;
            }
        }
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x575c
// Size: 0x160
function generatespawnpoint() {
    laneKey = randomint(level.frontlinedata[level.var_48e03f24b9b5c1a].lanedata.size);
    spawnpoint = function_277456e766f73b0(self.team, laneKey);
    randradius = getdvarint(@"hash_5f04f6bef3a9be7", 512);
    self.redeployspawn.origin = (spawnpoint.origin[0] + randomfloatrange(randradius * -1, randradius), spawnpoint.origin[1] + randomfloatrange(randradius * -1, randradius), spawnpoint.origin[2]);
    self.redeployspawn.angles = spawnpoint.angles;
    self.redeployspawn.time = gettime();
    self.redeployspawn.team = self.team;
    self.redeployspawn.index = -1;
    self.redeployspawn.lifeid = self.lifeid;
    self.redeployspawn.laneKey = laneKey;
    return self.redeployspawn;
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x58c5
// Size: 0x401
function function_277456e766f73b0(team, laneKey) {
    var_77dbb639c4ba0c18 = level.var_48e03f24b9b5c1a + 1;
    if (team == "axis") {
        var_77dbb639c4ba0c18 = level.var_48e03f24b9b5c1a - 1;
    }
    if (var_77dbb639c4ba0c18 == level.frontlinedata.size) {
        if (!isdefined(level.gw_objstruct.var_333efbbe6bcca949)) {
            parachuteheight = getdvarint(@"hash_54449fe780ddb32f", 3000);
            spawnpoint = spawnstruct();
            groundorigin = drop_to_ground(level.gw_objstruct.allieshqloc.trigger.origin, undefined, undefined, (0, 0, 1));
            spawnpoint.origin = groundorigin + (0, 0, 1) * parachuteheight;
            spawnpoint.angles = vectortoangles(level.spawnselectionteamforward[team]);
            spawnpoint.time = gettime();
            spawnpoint.index = -1;
            level.gw_objstruct.var_333efbbe6bcca949 = spawnpoint;
        }
        return level.gw_objstruct.var_333efbbe6bcca949;
    } else if (var_77dbb639c4ba0c18 < 0) {
        if (!isdefined(level.gw_objstruct.var_96832145b9161a04)) {
            parachuteheight = getdvarint(@"hash_54449fe780ddb32f", 3000);
            spawnpoint = spawnstruct();
            groundorigin = drop_to_ground(level.gw_objstruct.axishqloc.trigger.origin, undefined, undefined, (0, 0, 1));
            spawnpoint.origin = groundorigin + (0, 0, 1) * parachuteheight;
            spawnpoint.angles = vectortoangles(level.spawnselectionteamforward[team]);
            spawnpoint.time = gettime();
            spawnpoint.index = -1;
            level.gw_objstruct.var_96832145b9161a04 = spawnpoint;
        }
        return level.gw_objstruct.var_96832145b9161a04;
    }
    var_77dbb639c4ba0c18 = int(clamp(var_77dbb639c4ba0c18, 0, level.frontlinedata.size - 1));
    if (!isdefined(laneKey)) {
        laneKey = randomint(level.frontlinedata[var_77dbb639c4ba0c18].lanedata.size);
    }
    current = level.frontlinedata[level.var_48e03f24b9b5c1a].lanedata[laneKey].origin;
    neighbor = level.frontlinedata[var_77dbb639c4ba0c18].lanedata[laneKey].origin;
    var_6ac38dac8e6cc00 = vectornormalize(neighbor - current);
    offset = getdvarint(@"hash_82bce2fb4193e57", 8000);
    idealorigin = current + var_6ac38dac8e6cc00 * offset;
    var_651bae59b8c2e46c = undefined;
    closestdist = undefined;
    foreach (frontlinekey, frontlinedata in level.frontlinedata) {
        dist = distance2dsquared(idealorigin, frontlinedata.lanedata[laneKey].origin);
        if (!isdefined(closestdist) || dist < closestdist) {
            var_651bae59b8c2e46c = frontlinekey;
            closestdist = dist;
        }
    }
    return level.frontlinedata[var_651bae59b8c2e46c].lanedata[laneKey].redeployspawn[team];
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5ccf
// Size: 0x15
function modespawn(revivespawn) {
    thread playerrespawn();
    return true;
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5ced
// Size: 0x28
function playerkilledspawn(deathdata, finaldeath) {
    deathdata.victim thread playerrespawn();
    return true;
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5d1e
// Size: 0x165
function playerrespawn() {
    level endon("game_ended");
    self endon("disconnect");
    if (istrue(level.gameended)) {
        return;
    }
    scripts\mp\playerlogic::waitforremoteend();
    spawnpoint = getspawnpoint();
    tofrontline = vectornormalize(level.frontlinedata[level.var_48e03f24b9b5c1a].lanedata[spawnpoint.laneKey].origin - spawnpoint.origin);
    spawnpoint.angles = vectortoangles(tofrontline);
    timeoutms = getdvarint(@"hash_eeb59cee28a5eab7", 3000);
    streamorigin = namespace_8bfdb6eb5a3df67a::playerprestreamrespawnorigin(spawnpoint, timeoutms);
    if (scripts\mp\flags::gameflag("prematch_done")) {
        var_ad4dd16f29e24b77 = 0;
        var_dfab0807d83a77fe = 0.5;
        thread scripts\mp\playerlogic::managerespawnfade(var_ad4dd16f29e24b77, var_dfab0807d83a77fe);
        if (var_ad4dd16f29e24b77 > 0) {
            self waittill("fadeDown_complete");
        }
    }
    scripts\mp\gametypes\br_spectate::playerclearspectatekillchainsystem();
    scripts\mp\gametypes\br::spawnintermission(spawnpoint.origin, spawnpoint.angles);
    scripts\mp\spectating::setdisabled();
    scripts\mp\gametypes\br_public::playerwaittillstreamhintcomplete();
    scripts\mp\playerlogic::spawnplayer(undefined, 0);
    scripts\mp\gametypes\br_gulag::gulagwinnerrespawn(1, undefined, spawnpoint, 1, streamorigin, undefined, undefined, 0, 0, 1);
    scripts\mp\damage::resetplayervariables();
    scripts\mp\damage::resetplayeromnvarsonspawn();
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5e8b
// Size: 0x1a6
function getspawnpoint() {
    if (istrue(level.var_3fbbc6279594ddf)) {
        if (!isdefined(self.redeployspawn)) {
            self.redeployspawn = spawnstruct();
            return generatespawnpoint();
        }
        if (isdefined(self.setspawnpoint)) {
            return self.setspawnpoint;
        } else if (self.redeployspawn.lifeid != self.lifeid) {
            return generatespawnpoint();
        }
        return self.redeployspawn;
    }
    spawnteam = self.pers["team"];
    idealdist = getdvarint(@"hash_a66b78681b2d0805", 4096);
    spawnparams = [];
    spawnparams["teamForward"] = level.spawnselectionteamforward[spawnteam];
    spawnparams["idealDistSq"] = idealdist * idealdist;
    if (scripts\mp\spawnlogic::shoulduseteamstartspawn()) {
        if (function_bff229a11ecd1e34()) {
            scripts\mp\spawnlogic::setactivespawnlogic(#"start");
        } else {
            scripts\mp\spawnlogic::setactivespawnlogic("StartSpawn", "Crit_Default");
        }
        scripts\mp\spawnlogic::activatespawnset(level.var_2ad659edb860ab3a[spawnteam], 1);
        spawnpoint = scripts\mp\spawnlogic::getspawnpoint(self, spawnteam, level.var_2ad659edb860ab3a[spawnteam], undefined, undefined, spawnparams);
    } else {
        if (function_bff229a11ecd1e34()) {
            scripts\mp\spawnlogic::setactivespawnlogic(#"default");
        } else {
            scripts\mp\spawnlogic::setactivespawnlogic("Invasion", "Crit_Frontline");
        }
        scripts\mp\spawnlogic::activatespawnset(level.var_ad9cae795e7505c6[spawnteam], 1);
        spawnpoint = scripts\mp\spawnlogic::getspawnpoint(self, spawnteam, level.var_ad9cae795e7505c6[spawnteam], undefined, undefined, spawnparams);
    }
    return spawnpoint;
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6039
// Size: 0xfe
function function_bd61217120c57971() {
    self endon("death_or_disconnect");
    frontlineorigin = level.frontlinedata[level.var_48e03f24b9b5c1a].origin;
    idealdist = getdvarint(@"hash_a66b78681b2d0805", 4096);
    hqorigin = frontlineorigin;
    if (self.team == "axis") {
        hqorigin = level.gw_objstruct.axishqloc.trigger.origin;
    } else {
        hqorigin = level.gw_objstruct.allieshqloc.trigger.origin;
    }
    tohq = vectornormalize(hqorigin - frontlineorigin);
    streamorigin = frontlineorigin + tohq * idealdist;
    streamorigin = utility::groundpos(streamorigin, (0, 0, 1));
    scripts\mp\gametypes\br_public::playerstreamhintlocation(streamorigin);
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x613f
// Size: 0x58
function function_8964b48e4eba5797(origin) {
    closestpoint = pointonsegmentnearesttopoint(level.frontlinedata[level.var_48e03f24b9b5c1a].minpoint, level.frontlinedata[level.var_48e03f24b9b5c1a].maxpoint, origin);
    return closestpoint;
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x61a0
// Size: 0x69
function function_99146672ec896efa(origin) {
    closestpoint = pointonsegmentnearesttopoint(level.frontlinedata[level.var_48e03f24b9b5c1a].minpoint, level.frontlinedata[level.var_48e03f24b9b5c1a].maxpoint, origin);
    var_f6f8270f02b2b9bf = distance2dsquared(closestpoint, origin);
    return var_f6f8270f02b2b9bf;
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6212
// Size: 0x303
function function_7855eb28c2d21061(origin, team) {
    if (!isdefined(level.var_48549f359a11f105)) {
        level.var_48549f359a11f105 = [];
    }
    if (!isdefined(level.var_48549f359a11f105[team])) {
        level.var_48549f359a11f105[team] = spawnstruct();
    }
    if (!isdefined(level.var_48549f359a11f105[team].timestamp) || level.var_48549f359a11f105[team].timestamp < gettime()) {
        level.var_48549f359a11f105[team].timestamp = gettime();
        level.var_48549f359a11f105[team].lanecount = [];
        foreach (laneKey, lanedata in level.frontlinedata[level.var_48e03f24b9b5c1a].lanedata) {
            level.var_48549f359a11f105[team].lanecount[laneKey] = 0;
        }
        friendlyplayers = getfriendlyplayers(team, 1);
        foreach (player in friendlyplayers) {
            closestlane = undefined;
            var_e61f33a1ec31a630 = undefined;
            foreach (laneKey, lanedata in level.frontlinedata[level.var_48e03f24b9b5c1a].lanedata) {
                var_26d8a238be314cf9 = distance2dsquared(player.origin, lanedata.origin);
                if (!isdefined(closestlane) || var_26d8a238be314cf9 < var_e61f33a1ec31a630) {
                    closestlane = laneKey;
                    var_e61f33a1ec31a630 = var_26d8a238be314cf9;
                }
            }
            level.var_48549f359a11f105[team].lanecount[closestlane]++;
        }
    }
    lowestlane = undefined;
    lowestcount = undefined;
    foreach (key, playercount in level.var_48549f359a11f105[team].lanecount) {
        if (!isdefined(lowestlane) || playercount < lowestcount) {
            lowestlane = key;
            lowestcount = playercount;
        }
    }
    var_f6f8270f02b2b9bf = distance2dsquared(level.frontlinedata[level.var_48e03f24b9b5c1a].lanedata[lowestlane].origin, origin);
    return var_f6f8270f02b2b9bf;
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x651e
// Size: 0x5b
function onspawnplayer(revivespawn) {
    self.forcespawnnearteammates = undefined;
    thread updatematchstatushintonspawn();
    namespace_14f37777effc564d::function_6da8b65579348d0b();
    namespace_9bb409deb69fb31d::updatesquadomnvars(self.team, self.sessionsquadid);
    if (level.spawnprotectiontimer > 0) {
        thread removespawnprotectiononnotify();
        thread removespawnprotectiononads();
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6581
// Size: 0x2d
function removespawnprotectiononnotify() {
    self endon("death_or_disconnect");
    self endon("remove_spawn_protection");
    waittill_any_3("parachute_landed", "vehicle_enter", "weapon_fired");
    scripts\mp\gametypes\common::removespawnprotection();
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x65b6
// Size: 0x2a
function removespawnprotectiononads() {
    self endon("death_or_disconnect");
    self endon("remove_spawn_protection");
    while (self playerads() < 0.7) {
        waitframe();
    }
    scripts\mp\gametypes\common::removespawnprotection();
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x65e8
// Size: 0x15
function updatematchstatushintonspawn() {
    level endon("game_ended");
    scripts\mp\hud_message::function_f004ef4606b9efdc("push_frontline");
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x6605
// Size: 0xb4
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, killid) {
    namespace_9bb409deb69fb31d::updatesquadomnvars(self.team, self.sessionsquadid);
    if (level.dropbrloot) {
        dropstruct = scripts\mp\gametypes\br_pickups::function_7b9f3966a7a42003();
        dropstruct.dropidx = 14;
        scripts\mp\gametypes\br_pickups::dropbrhealthpack(dropstruct);
        scripts\mp\gametypes\br_plunder::playerdropplunderondeath(dropstruct, attacker, 1);
    }
    thread function_bd61217120c57971();
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x66c1
// Size: 0x205
function managedroppedents(droppedents) {
    if (!isdefined(level.br_droppedloot)) {
        level.br_droppedloot = [];
    }
    if (level.br_droppedloot.size > 64) {
        for (i = 0; i < 16; i++) {
            if (isdefined(level.br_droppedloot[i])) {
                level.br_droppedloot[i] delete();
                level.br_droppedloot[i] = undefined;
            }
        }
        temparray = [];
        for (i = 16; i < level.br_droppedloot.size; i++) {
            temparray[i - 16] = level.br_droppedloot[i];
        }
        level.br_droppedloot = temparray;
    }
    foreach (ent in droppedents) {
        level.br_droppedloot[level.br_droppedloot.size] = ent;
    }
    if (!isdefined(level.br_pickups.droppeditems)) {
        level.br_pickups.droppeditems = [];
    }
    if (level.br_pickups.droppeditems.size > 64) {
        for (i = 0; i < 16; i++) {
            if (isdefined(level.br_pickups.droppeditems[i])) {
                level.br_pickups.droppeditems[i] delete();
                level.br_pickups.droppeditems[i] = undefined;
            }
        }
        temparray = [];
        for (i = 16; i < level.br_pickups.droppeditems.size; i++) {
            temparray[i - 16] = level.br_pickups.droppeditems[i];
        }
        level.br_pickups.droppeditems = temparray;
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x68ce
// Size: 0x7e
function onplayerconnect(player) {
    if (isdefined(level.rallypointvehicles)) {
        thread scripts\mp\rally_point::rallypoint_showtoplayer(player);
    }
    caninfil = gameflag("infil_will_run") && !istrue(gameflag("infil_started"));
    if (!level.usespawnselection && !scripts\mp\flags::gameflag("prematch_done") && !caninfil) {
        player thread manageprematchfade();
    }
    scripts\mp\utility\disconnect_event_aggregator::registerondisconnecteventcallback(&onplayerdisconnect);
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6954
// Size: 0x29
function manageprematchfade() {
    self endon("disconnect");
    var_ad4dd16f29e24b77 = 0;
    var_dfab0807d83a77fe = 0.5;
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6985
// Size: 0xb
function onplayerdisconnect(player) {
    
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6998
// Size: 0xd
function getrespawndelay() {
    self.spawncameraskipthermal = 0;
    return undefined;
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x69ae
// Size: 0xb0
function onnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    scripts\mp\gametypes\common::oncommonnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon);
    if (getdvarint(@"hash_2e405e2912dc4a44", 0) == 1) {
        attacker thread scripts\mp\rank::scoreeventpopup(hashcat(#"hash_2c8bcbb02ec7ff9b", level.scoremod["kill"]));
    }
    attacker incpersstat("contribution", level.scoremod["kill"]);
    attacker setextrascore0(attacker.pers["contribution"]);
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6a66
// Size: 0x13d
function initspecatatorcameras() {
    level.spectatorcameras = [];
    level.currentspectatorcamref = "cop_2";
    var_84286554864313cb = getstructarray("tac_ops_map_config", "targetname");
    foreach (var_48380029fbb1007a in var_84286554864313cb) {
        var_ca2c833762e5466c = var_48380029fbb1007a.script_noteworthy;
        childstructs = getstructarray(var_48380029fbb1007a.target, "targetname");
        foreach (childstruct in childstructs) {
            switch (childstruct.script_label) {
            case #"hash_11e1630c6c429f23": 
                setteammapposition(var_ca2c833762e5466c, "allies", childstruct);
                break;
            case #"hash_e66f1db565904926": 
                setteammapposition(var_ca2c833762e5466c, "axis", childstruct);
                break;
            }
        }
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6bab
// Size: 0x46
function setteammapposition(var_ca2c833762e5466c, team, posinfo) {
    if (!isdefined(level.spectatorcameras[var_ca2c833762e5466c])) {
        level.spectatorcameras[var_ca2c833762e5466c] = [];
    }
    level.spectatorcameras[var_ca2c833762e5466c][team] = posinfo;
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6bf9
// Size: 0x15
function applythermal() {
    self visionsetthermalforplayer("proto_apache_flir_mp");
    self thermalvisionon();
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6c16
// Size: 0x9
function removethermal() {
    self thermalvisionoff();
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6c27
// Size: 0x12f
function startspectatorview() {
    if (isteamreviveenabled()) {
        return;
    }
    waitframe();
    updatesessionstate("spectator");
    scripts\mp\spectating::setdisabled();
    if (isdefined(self.lastdeathangles)) {
        self setplayerangles(self.lastdeathangles);
    }
    wait 0.1;
    setdof_default();
    var_26ee0f3f89450d97 = 0;
    bestflag = undefined;
    camorigin = (0, 0, 0);
    zoffset = 1000;
    var_dead2082432cecc = self.origin + (0, 0, zoffset);
    var_6788dc28320974a = self.angles;
    self.deathspectatepos = var_dead2082432cecc;
    self.deathspectateangles = var_6788dc28320974a;
    cameraent = spawn("script_model", self getvieworigin());
    cameraent setmodel("tag_origin");
    cameraent.angles = var_6788dc28320974a;
    self.spectatorcament = cameraent;
    self.isusingtacopsmapcamera = 1;
    self cameralinkto(cameraent, "tag_origin", 1);
    thread dohalfwayflash();
    cameraent movecameratomappos(self, var_dead2082432cecc, var_6788dc28320974a);
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6d5e
// Size: 0x17
function dohalfwayflash() {
    wait 0.4;
    thread playslamzoomflash();
    applythermal();
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6d7d
// Size: 0x1f
function endspectatorview() {
    if (!isdefined(self.spectatorcament)) {
        return;
    }
    removethermal();
    thread runslamzoomonspawn();
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6da4
// Size: 0x102
function movecameratomappos(player, var_9813182985677b23, finalangles) {
    player endon("spawned_player");
    movetime = 1;
    rotatetime = 1;
    self moveto(var_9813182985677b23, 2, 1, 1);
    player playlocalsound("mp_cmd_camera_zoom_out");
    player setclienttriggeraudiozonepartialwithfade("spawn_cam", 0.5, "mix");
    self rotateto(finalangles, 2, 1, 1);
    wait 1.1;
    var_ae753108f3dff053 = anglestoforward(finalangles) * 300;
    var_ae753108f3dff053 *= (1, 1, 0);
    if (isdefined(player) && isdefined(player.spectatorcament)) {
        self moveto(var_9813182985677b23 + var_ae753108f3dff053, 15, 1, 1);
        player earthquakeforplayer(0.03, 15, var_9813182985677b23 + var_ae753108f3dff053, 1000);
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6eae
// Size: 0xed
function runslamzoomonspawn() {
    self waittill("spawned_player");
    targetpos = self geteye();
    targetangles = self.angles;
    updatesessionstate("spectator");
    self cameralinkto(self.spectatorcament, "tag_origin", 1);
    self visionsetnakedforplayer("tac_ops_slamzoom", 0.2);
    self.spectatorcament moveto(targetpos, 0.5);
    self playlocalsound("mp_cmd_camera_zoom_in");
    self clearclienttriggeraudiozone(0.5);
    self.spectatorcament rotateto(targetangles, 0.5, 0.5);
    wait 0.5;
    if (!isdefined(self)) {
        return;
    }
    self visionsetnakedforplayer("", 0);
    thread playslamzoomflash();
    updatesessionstate("playing");
    self cameraunlink();
    self.spectatorcament delete();
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6fa3
// Size: 0xd8
function playslamzoomflash() {
    overlay = newclienthudelem(self);
    overlay.x = 0;
    overlay.y = 0;
    overlay.alignx = "left";
    overlay.aligny = "top";
    overlay.sort = 1;
    overlay.horzalign = "fullscreen";
    overlay.vertalign = "fullscreen";
    overlay.alpha = 1;
    overlay.foreground = 1;
    overlay setshader("white", 640, 480);
    overlay fadeovertime(0.4);
    overlay.alpha = 0;
    wait 0.4;
    overlay destroy();
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7083
// Size: 0x104
function arm_playstatusdialog(soundname, team) {
    soundalias = "dx_mpa_ustl_" + soundname;
    soundalias = tolower(soundalias);
    players = undefined;
    if (team == "bothTeams") {
        axisplayers = getteamdata("axis", "players");
        alliesplayers = getteamdata("allies", "players");
        players = array_combine(axisplayers, alliesplayers);
    } else if (team == "axis" || team == "allies") {
        players = getteamdata(team, "players");
    }
    foreach (player in players) {
        if (!isbot(player)) {
            player arm_leaderdialogonplayer_internal(soundalias, soundname);
        }
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x718f
// Size: 0x2f
function arm_playstatusdialogonplayer(soundname) {
    soundalias = "dx_mpa_ustl_announcer_" + soundname;
    soundalias = tolower(soundalias);
    arm_leaderdialogonplayer_internal(soundalias, soundname);
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x71c6
// Size: 0x99
function arm_leaderdialogonplayer_internal(soundalias, dialog) {
    if (isdefined(self.playerlastdialogstatus)) {
        time = 5000;
        if (gettime() < self.playerlastdialogstatus["time"] + time && self.playerlastdialogstatus["dialog"] == dialog) {
            return;
        }
        self.playerlastdialogstatus["time"] = gettime();
        self.playerlastdialogstatus["dialog"] = dialog;
    }
    if (soundexists(soundalias)) {
        self queuedialogforplayer(soundalias, dialog, 2);
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7267
// Size: 0xc7
function arm_initoutofbounds() {
    level.outofboundstriggers = [];
    potentialoobtriggers = getentarray("OutOfBounds", "targetname");
    foreach (trigger in potentialoobtriggers) {
        if (isdefined(scripts\cp_mp\utility\game_utility::getlocaleid()) && isdefined(trigger.script_noteworthy) && trigger.script_noteworthy == level.localeid && scripts\mp\utility\game_utility_mp::modeusesgroundwarteamoobtriggers(trigger)) {
            level.outofboundstriggers[level.outofboundstriggers.size] = trigger;
            continue;
        }
        trigger delete();
    }
}

/#

    // Namespace gwtdm / namespace_fab382c89d62fd63
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x7336
    // Size: 0x19
    function debugprint(text) {
        if (false) {
            println(text);
        }
    }

#/

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7357
// Size: 0x5e
function isobjectivecontested(gameobject) {
    if (gameobject.ownerteam == "axis") {
        return (gameobject.numtouching["allies"] > 0);
    }
    if (gameobject.ownerteam == "allies") {
        return (gameobject.numtouching["axis"] > 0);
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x73bd
// Size: 0x76
function calculateobjectivesheld(team) {
    var_ae82e8f18ca8e0fe = 0;
    foreach (objective in level.objectives) {
        if (objective.ownerteam == team) {
            var_ae82e8f18ca8e0fe++;
        }
    }
    return var_ae82e8f18ca8e0fe;
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 12, eflags: 0x0
// Checksum 0x0, Offset: 0x743c
// Size: 0x1b7
function createhintobject(org, type, icon, hintstring, priority, duration, onobstruction, hintdist, hintfov, usedist, usefov, useent) {
    hintobj = undefined;
    if (isdefined(useent)) {
        hintobj = useent;
    } else {
        hintobj = spawn("script_model", org);
    }
    hintobj makeusable();
    if (isdefined(useent) && isdefined(org)) {
        assertex(isstring(org), "<dev string:x77>");
        hintobj sethinttag(org);
    }
    if (isdefined(type)) {
        hintobj setcursorhint(type);
    } else {
        hintobj setcursorhint("HINT_NOICON");
    }
    if (isdefined(icon)) {
        hintobj sethinticon(icon);
    }
    if (isdefined(hintstring)) {
        hintobj sethintstring(hintstring);
    }
    if (isdefined(priority)) {
        hintobj setusepriority(priority);
    } else {
        hintobj setusepriority(0);
    }
    if (isdefined(duration)) {
        hintobj setuseholdduration(duration);
    } else {
        hintobj setuseholdduration("duration_short");
    }
    if (isdefined(onobstruction)) {
        hintobj sethintonobstruction(onobstruction);
    } else {
        hintobj sethintonobstruction("hide");
    }
    if (isdefined(hintdist)) {
        hintobj sethintdisplayrange(hintdist);
    } else {
        hintobj sethintdisplayrange(200);
    }
    if (isdefined(hintfov)) {
        hintobj sethintdisplayfov(hintfov);
    } else {
        hintobj sethintdisplayfov(160);
    }
    if (isdefined(usedist)) {
        hintobj setuserange(usedist);
    } else {
        hintobj setuserange(50);
    }
    if (isdefined(usefov)) {
        hintobj setusefov(usefov);
    } else {
        hintobj setusefov(120);
    }
    if (!isdefined(useent)) {
        return hintobj;
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x75fb
// Size: 0x981
function getmissedinfilcamerapositions(team) {
    assert(isdefined(scripts\cp_mp\utility\game_utility::getlocaleid()), "<dev string:xd7>");
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

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7f85
// Size: 0xeb
function calculatehqmidpoint() {
    level.hqmidpoint = (level.gw_objstruct.axishqloc.trigger.origin + level.gw_objstruct.allieshqloc.trigger.origin) * 0.5;
    level.hqvecttomid_allies = level.gw_objstruct.axishqloc.trigger.origin - level.hqmidpoint;
    level.hqvecttomid_axis = level.gw_objstruct.allieshqloc.trigger.origin - level.hqmidpoint;
    level.hqdisttomid = length(level.hqvecttomid_axis);
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8078
// Size: 0x24f
function calculatecameraoffset(team, objectiveorigin) {
    switch (level.mapname) {
    case #"hash_7a28db3c5928c489": 
        var_fc87d6fc10744d44 = 0.25;
        var_6e9b9701b439aeb7 = 0.35;
        break;
    case #"hash_863773b8960b3944": 
        var_fc87d6fc10744d44 = 0.25;
        var_6e9b9701b439aeb7 = 0.8;
        break;
    case #"hash_a8b272dba33a4aed": 
        var_fc87d6fc10744d44 = 0.5;
        var_6e9b9701b439aeb7 = 0.3;
        break;
    default: 
        var_fc87d6fc10744d44 = 0;
        var_6e9b9701b439aeb7 = 0;
        break;
    }
    len = distance(objectiveorigin, level.hqmidpoint);
    if (len < 2048) {
        return (0, 0, 0);
    }
    if (team == "axis") {
        var_4881f7fe7fc2bae2 = distance(level.gw_objstruct.axishqloc.trigger.origin, objectiveorigin);
        fulloffset = level.hqvecttomid_axis;
    } else {
        var_4881f7fe7fc2bae2 = distance(level.gw_objstruct.allieshqloc.trigger.origin, objectiveorigin);
        fulloffset = level.hqvecttomid_allies;
    }
    if (var_4881f7fe7fc2bae2 < 2048) {
        return (fulloffset * var_fc87d6fc10744d44);
    }
    if (var_4881f7fe7fc2bae2 > level.hqdisttomid) {
        if (team == "axis") {
            var_4881f7fe7fc2bae2 = distance(level.gw_objstruct.allieshqloc.trigger.origin, objectiveorigin);
        } else {
            var_4881f7fe7fc2bae2 = distance(level.gw_objstruct.axishqloc.trigger.origin, objectiveorigin);
        }
        percentage = 100 - var_4881f7fe7fc2bae2 * 100 / level.hqdisttomid;
        offset = fulloffset * var_6e9b9701b439aeb7 * -1 * percentage / 100;
        return offset;
    }
    percentage = 100 - var_4881f7fe7fc2bae2 * 100 / level.hqdisttomid;
    offset = fulloffset * var_fc87d6fc10744d44 * percentage / 100;
    return offset;
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x82cf
// Size: 0x2a
function spawnprotectionexception() {
    if (isdefined(self.selectedspawnarea) && issubstr(self.selectedspawnarea, "HQ")) {
        return true;
    }
    return false;
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8302
// Size: 0x11
function function_658c8f668d2cd83c() {
    wait 5;
    function_f1aed36ab4598ea("mp_gamemode_gw");
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x831b
// Size: 0x13e
function function_aabaace9c798a2e1() {
    level.var_48e03f24b9b5c1a = 0;
    level.var_279807e5da6c6a18 = [];
    frontlineinfo = spawnstruct();
    frontlineinfo.origin = (level.gw_objstruct.allieshqloc.trigger.origin + level.gw_objstruct.axishqloc.trigger.origin) * 0.5;
    level.var_279807e5da6c6a18["player"] = frontlineinfo;
    frontlineinfo = spawnstruct();
    frontlineinfo.origin = (level.gw_objstruct.allieshqloc.trigger.origin + level.gw_objstruct.axishqloc.trigger.origin) * 0.5;
    level.var_279807e5da6c6a18["agent"] = frontlineinfo;
    level function_ade21f3382e7e29a();
    level thread function_d9730dbc16ce09e2();
    level thread function_81add84c2385a7ee();
    level thread function_e28bb63a5e8e8d12();
    level thread function_e62dcabb18095abb();
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8461
// Size: 0x824
function function_e28bb63a5e8e8d12() {
    frontlinebehavior = getdvarint(@"hash_7ba9b97c63a992b5", 0);
    var_eb132661853aa312 = getdvarfloat(@"hash_1b0e9faa2b5e36e4", 30);
    var_11c5e87250ca0bf9 = getdvarint(@"hash_6240b7bdf606e6ab", 60) * 1000;
    var_5f857334b93b7b81 = getdvarint(@"hash_c52aee495ff0598a", 180) * 1000;
    var_54739e717fa73734 = getdvarint(@"hash_4c9d7f8dede759c7", 1);
    var_88f3d778efe40c6e = getdvarint(@"hash_73d5df0e713e122f", 200);
    var_d3c8e7e7e4f0fad5 = getdvarfloat(@"hash_b9ec3bea41ddd71b", 0.2);
    buffer = 0;
    initialset = 0;
    level.startingfrontline = 0;
    var_ec823f5f10f705ac = 0;
    var_3c1586d15c611ae = spawnstruct();
    var_3c1586d15c611ae.var_fe95d825c29e4b68 = level.var_48e03f24b9b5c1a;
    var_3c1586d15c611ae.var_38ef642aede44556 = 0;
    var_3c1586d15c611ae.axisscore = getteamscore("axis");
    var_3c1586d15c611ae.alliesscore = getteamscore("allies");
    while (true) {
        waitframe();
        currenttime = gettime();
        var_c732ac2a579c99b1 = getteamscore("axis") - var_3c1586d15c611ae.axisscore;
        var_8c6bcd8c000b8c10 = getteamscore("allies") - var_3c1586d15c611ae.alliesscore;
        var_1c04d17c30083c16 = abs(level.var_48e03f24b9b5c1a - level.startingfrontline);
        axisscalar = ter_op(level.var_48e03f24b9b5c1a > level.startingfrontline, 1 + var_1c04d17c30083c16 * var_d3c8e7e7e4f0fad5, 1);
        alliesscalar = ter_op(level.var_48e03f24b9b5c1a < level.startingfrontline, 1 + var_1c04d17c30083c16 * var_d3c8e7e7e4f0fad5, 1);
        if (getdvarint(@"hash_13fae9c305971d06", 0) == 1) {
            stepy = 25;
            startx = 800;
            starty = 50;
            linecount = 0;
            /#
                printtoscreen2d(startx, starty + stepy * linecount, "<dev string:x114>", (1, 1, 1), 1);
            #/
            linecount++;
            /#
                printtoscreen2d(startx, starty + stepy * linecount, "<dev string:x126>" + level.var_48e03f24b9b5c1a, (1, 1, 1), 1);
            #/
            linecount++;
            /#
                printtoscreen2d(startx, starty + stepy * linecount, "<dev string:x13f>" + var_ec823f5f10f705ac, (1, 1, 1), 1);
            #/
            linecount++;
            /#
                printtoscreen2d(startx, starty + stepy * linecount, "<dev string:x153>" + buffer, (1, 1, 1), 1);
            #/
            linecount++;
            var_12ddf4a9082aaa2a = max(0, (var_3c1586d15c611ae.var_38ef642aede44556 + var_11c5e87250ca0bf9 - currenttime) / 1000);
            /#
                printtoscreen2d(startx, starty + stepy * linecount, "<dev string:x166>" + var_12ddf4a9082aaa2a, (1, 1, 1), 1);
            #/
            linecount++;
            var_12ddf4a9082aaa2a = max(0, (var_3c1586d15c611ae.var_38ef642aede44556 + var_5f857334b93b7b81 - currenttime) / 1000);
            /#
                printtoscreen2d(startx, starty + stepy * linecount, "<dev string:x176>" + var_12ddf4a9082aaa2a, (1, 1, 1), 1);
            #/
            linecount++;
            /#
                printtoscreen2d(startx, starty + stepy * linecount, "<dev string:x18c>" + var_88f3d778efe40c6e, (1, 1, 1), 1);
            #/
            linecount++;
            /#
                printtoscreen2d(startx, starty + stepy * linecount, "<dev string:x1af>" + var_c732ac2a579c99b1 + "<dev string:x1c6>" + var_88f3d778efe40c6e * axisscalar, (1, 1, 1), 1);
            #/
            linecount++;
            /#
                printtoscreen2d(startx, starty + stepy * linecount, "<dev string:x1cd>" + var_8c6bcd8c000b8c10 + "<dev string:x1c6>" + var_88f3d778efe40c6e * alliesscalar, (1, 1, 1), 1);
            #/
            linecount++;
        }
        if (getdvarint(@"hash_4daef99e4fc56e2a", -1) != -1) {
            var_3c1586d15c611ae.var_fe95d825c29e4b68 = level.var_48e03f24b9b5c1a;
            level.var_48e03f24b9b5c1a = getdvarint(@"hash_4daef99e4fc56e2a", -1);
            var_3c1586d15c611ae.var_38ef642aede44556 = gettime();
            var_3c1586d15c611ae.axisscore = getteamscore("axis");
            var_3c1586d15c611ae.alliesscore = getteamscore("allies");
            if (level.var_48e03f24b9b5c1a != var_3c1586d15c611ae.var_fe95d825c29e4b68) {
                if (var_3c1586d15c611ae.var_fe95d825c29e4b68 < level.var_48e03f24b9b5c1a) {
                    scripts\mp\utility\dialog::statusdialog("gwtdm_fall_back", "allies", 1);
                    scripts\mp\utility\dialog::statusdialog("gwtdm_push_foward", "axis", 1);
                    var_3f6fd6edaf6c6713 = "axis";
                } else {
                    scripts\mp\utility\dialog::statusdialog("gwtdm_fall_back", "axis", 1);
                    scripts\mp\utility\dialog::statusdialog("gwtdm_push_foward", "allies", 1);
                    var_3f6fd6edaf6c6713 = "allies";
                }
                function_2b4958acf92594e3();
                level function_2f5b6c628445768(var_3f6fd6edaf6c6713);
                level notify("frontline_moved");
            }
            continue;
        }
        switch (frontlinebehavior) {
        case 0: 
            var_ec823f5f10f705ac = function_bf26ca1dffd4923a();
            break;
        default: 
            var_ec823f5f10f705ac = function_bf26ca1dffd4923a();
            break;
        }
        if (!initialset) {
            initialset = 1;
            var_ec823f5f10f705ac = function_bf26ca1dffd4923a();
            level.startingfrontline = var_ec823f5f10f705ac;
            level.var_48e03f24b9b5c1a = var_ec823f5f10f705ac;
            var_3c1586d15c611ae.var_fe95d825c29e4b68 = level.var_48e03f24b9b5c1a;
            var_3c1586d15c611ae.var_38ef642aede44556 = gettime();
            var_3c1586d15c611ae.axisscore = getteamscore("axis");
            var_3c1586d15c611ae.alliesscore = getteamscore("allies");
            function_2b4958acf92594e3();
        }
        if (!scripts\mp\flags::gameflag("prematch_done")) {
            continue;
        }
        if (currenttime > var_3c1586d15c611ae.var_38ef642aede44556 + var_5f857334b93b7b81) {
            if (var_c732ac2a579c99b1 >= var_88f3d778efe40c6e * axisscalar || var_8c6bcd8c000b8c10 >= var_88f3d778efe40c6e * alliesscalar) {
                if (var_c732ac2a579c99b1 > var_8c6bcd8c000b8c10) {
                    var_ec823f5f10f705ac = int(clamp(level.var_48e03f24b9b5c1a + 1, 0, level.frontlinedata.size - 1));
                } else {
                    var_ec823f5f10f705ac = int(clamp(level.var_48e03f24b9b5c1a - 1, 0, level.frontlinedata.size - 1));
                }
                buffer = var_eb132661853aa312;
            }
        }
        if (var_ec823f5f10f705ac != level.var_48e03f24b9b5c1a) {
            buffer += level.framedurationseconds;
            if (currenttime > var_3c1586d15c611ae.var_38ef642aede44556 + var_11c5e87250ca0bf9 && buffer > var_eb132661853aa312) {
                buffer = 0;
                var_3c1586d15c611ae.var_38ef642aede44556 = gettime();
                var_3c1586d15c611ae.var_fe95d825c29e4b68 = level.var_48e03f24b9b5c1a;
                var_3c1586d15c611ae.axisscore = getteamscore("axis");
                var_3c1586d15c611ae.alliesscore = getteamscore("allies");
                if (var_54739e717fa73734) {
                    if (var_ec823f5f10f705ac > level.var_48e03f24b9b5c1a) {
                        level.var_48e03f24b9b5c1a++;
                    } else {
                        level.var_48e03f24b9b5c1a--;
                    }
                } else {
                    level.var_48e03f24b9b5c1a = var_ec823f5f10f705ac;
                }
                if (var_3c1586d15c611ae.var_fe95d825c29e4b68 < level.var_48e03f24b9b5c1a) {
                    scripts\mp\utility\dialog::statusdialog("gwtdm_fall_back", "allies", 1);
                    scripts\mp\utility\dialog::statusdialog("gwtdm_push_foward", "axis", 1);
                    var_3f6fd6edaf6c6713 = "axis";
                } else {
                    scripts\mp\utility\dialog::statusdialog("gwtdm_fall_back", "axis", 1);
                    scripts\mp\utility\dialog::statusdialog("gwtdm_push_foward", "allies", 1);
                    var_3f6fd6edaf6c6713 = "allies";
                }
                function_2b4958acf92594e3();
                level function_2f5b6c628445768(var_3f6fd6edaf6c6713);
                level notify("frontline_moved");
            }
            continue;
        }
        buffer = 0;
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8c8d
// Size: 0x12f
function function_bf26ca1dffd4923a() {
    closestdistsq = undefined;
    closestfrontline = undefined;
    foreach (key, data in level.frontlinedata) {
        closestpoint = pointonsegmentnearesttopoint(data.minpoint, data.maxpoint, level.var_279807e5da6c6a18["player"].origin);
        distsq = distance2dsquared(closestpoint, level.var_279807e5da6c6a18["player"].origin);
        if (getdvarint(@"hash_13fae9c305971d06", 0) == 1) {
            level thread scripts\cp_mp\utility\debug_utility::drawline(closestpoint, level.var_279807e5da6c6a18["player"].origin, level.framedurationseconds, (1, 0, 1));
        }
        if (!isdefined(closestdistsq) || distsq < closestdistsq) {
            closestdistsq = distsq;
            closestfrontline = key;
        }
    }
    return closestfrontline;
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8dc5
// Size: 0x72d
function function_e62dcabb18095abb() {
    while (true) {
        waitframe();
        if (getdvarint(@"hash_13fae9c305971d06", 0) == 0) {
            continue;
        }
        foreach (key, data in level.var_279807e5da6c6a18) {
            var_b9dbc464a0b5e5d4 = 256;
            for (i = 0; i < 5; i++) {
                height = var_b9dbc464a0b5e5d4 * i;
                color = (1, 1, 1);
                switch (key) {
                case #"hash_87d1443ef2805760": 
                    color = (0, 1, 0);
                    break;
                case #"hash_f67e929c23b9fc86": 
                    color = (0, 1, 1);
                    break;
                }
                level thread scripts\cp_mp\utility\debug_utility::drawsphere(data.origin + (0, 0, 1) * height, var_b9dbc464a0b5e5d4, level.framedurationseconds, color);
            }
        }
        for (key = 0; key < level.frontlinedata.size; key++) {
            data = level.frontlinedata[key];
            level thread scripts\cp_mp\utility\debug_utility::drawline(data.minpoint, data.maxpoint, level.framedurationseconds, (1, 0, 0));
            color = ter_op(level.var_48e03f24b9b5c1a == key, (0, 1, 0), (1, 1, 1));
            /#
                print3d(data.origin, "<dev string:x1e6>" + key, color, 1, 20, 1, 1);
            #/
            prev = undefined;
            for (laneKey = 0; laneKey < data.lanedata.size; laneKey++) {
                lanedata = data.lanedata[laneKey];
                color = ter_op(level.var_48e03f24b9b5c1a == key, (0, 1, 0), (1, 1, 1));
                /#
                    print3d(lanedata.origin, "<dev string:x1f5>" + laneKey, color, 1, 10, 1, 1);
                #/
                foreach (team, locs in lanedata.coverzones) {
                    color = ter_op(team == "axis", (1, 0, 0), (0, 0, 1)) * ter_op(level.var_48e03f24b9b5c1a == key, 1, 0.5);
                    foreach (loc in locs) {
                        level thread scripts\cp_mp\utility\debug_utility::drawline(lanedata.origin, loc.origin, level.framedurationseconds, color);
                        /#
                            print3d(loc.origin, "<dev string:x1ff>" + key + "<dev string:x20d>" + laneKey + "<dev string:x212>" + team, color, 1, 5, 1, 1);
                        #/
                    }
                }
                foreach (team, loc in lanedata.backvolume) {
                    color = ter_op(team == "axis", (1, 0, 0), (0, 0, 1)) * ter_op(level.var_48e03f24b9b5c1a == key, 1, 0.5);
                    level thread scripts\cp_mp\utility\debug_utility::drawline(lanedata.origin, loc.origin, level.framedurationseconds, color);
                    /#
                        print3d(loc.origin, "<dev string:x218>" + key + "<dev string:x20d>" + laneKey + "<dev string:x212>" + team, color, 1, 5, 1, 1);
                    #/
                }
                foreach (team, loc in lanedata.frontvolume) {
                    color = ter_op(team == "axis", (1, 0, 0), (0, 0, 1)) * ter_op(level.var_48e03f24b9b5c1a == key, 1, 0.5);
                    level thread scripts\cp_mp\utility\debug_utility::drawline(lanedata.origin, loc.origin, level.framedurationseconds, color);
                    /#
                        print3d(loc.origin, "<dev string:x227>" + key + "<dev string:x20d>" + laneKey + "<dev string:x212>" + team, color, 1, 5, 1, 1);
                    #/
                }
                foreach (team, loc in lanedata.redeployspawn) {
                    level thread scripts\cp_mp\utility\debug_utility::drawline(loc.origin - (0, 0, 500), loc.origin + (0, 0, 500), level.framedurationseconds, (0, 1, 0));
                }
                if (key + 1 < level.frontlinedata.size) {
                    color = (1, 1, 1);
                    if (istrue(level.var_828f62c79774ee99)) {
                        color = (1, 1, 0);
                    }
                    level thread scripts\cp_mp\utility\debug_utility::drawline(lanedata.origin, level.frontlinedata[key + 1].lanedata[laneKey].origin, level.framedurationseconds, color);
                }
                if (isdefined(prev)) {
                    startpos = prev;
                    endpos = lanedata.origin;
                    var_949fc3545f13ffb0 = (0.5, 0.5, 0.5);
                    if (istrue(level.var_3813c5843955e260)) {
                        var_949fc3545f13ffb0 = (0, 1, 1);
                    }
                    color = ter_op(level.var_48e03f24b9b5c1a == key, (0, 1, 0), var_949fc3545f13ffb0);
                    level thread scripts\cp_mp\utility\debug_utility::drawline(startpos, endpos, level.framedurationseconds, color);
                }
                prev = lanedata.origin;
            }
        }
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x94fa
// Size: 0x129
function function_d9730dbc16ce09e2() {
    while (true) {
        var_e4c7b343246f2158 = scripts\mp\spawnfactor::getfrontlineteamcenter("axis");
        if (!isdefined(var_e4c7b343246f2158)) {
            var_e4c7b343246f2158 = level.gw_objstruct.axishqloc.trigger.origin;
        }
        var_aac62807b84149b5 = scripts\mp\spawnfactor::getfrontlineteamcenter("allies");
        if (!isdefined(var_aac62807b84149b5)) {
            var_aac62807b84149b5 = level.gw_objstruct.allieshqloc.trigger.origin;
        }
        var_e4c7b343246f2158 = (var_e4c7b343246f2158[0], var_e4c7b343246f2158[1], level.gw_objstruct.axishqloc.trigger.origin[2]);
        var_aac62807b84149b5 = (var_aac62807b84149b5[0], var_aac62807b84149b5[1], level.gw_objstruct.axishqloc.trigger.origin[2]);
        origin = (var_e4c7b343246f2158 + var_aac62807b84149b5) * 0.5;
        level.var_279807e5da6c6a18["player"].origin = origin;
        waitframe();
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x962b
// Size: 0x13b
function function_81add84c2385a7ee() {
    while (!isdefined(level.agentmanager)) {
        waitframe();
    }
    while (true) {
        agents = [];
        foreach (team in level.teamnamelist) {
            foreach (lanedata in level.agentmanager[team]) {
                agents = array_combine(agents, lanedata.var_e2c31580f508b878);
            }
        }
        if (agents.size > 0) {
            avgpos = scripts\mp\utility\entity::getaverageorigin(agents);
            level.var_279807e5da6c6a18["agent"].origin = (avgpos[0], avgpos[1], level.gw_objstruct.axishqloc.trigger.origin[2]);
        }
        waitframe();
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x976e
// Size: 0x9c0
function function_ade21f3382e7e29a() {
    frontlinestructs = getstructarray("frontlineData", "script_noteworthy");
    if (!isdefined(frontlinestructs) || frontlinestructs.size == 0) {
        frontlinestructs = function_e7b7b3f8010440fa();
    }
    level.var_9de3c802fced05e2 = [];
    level.var_9de3c802fced05e2["axis"] = [];
    level.var_9de3c802fced05e2["allies"] = [];
    level.var_3bf1cf107e60e048 = [];
    level.var_3bf1cf107e60e048["axis"] = [];
    level.var_3bf1cf107e60e048["allies"] = [];
    array_unique = [];
    foreach (item in frontlinestructs) {
        Keep = 1;
        foreach (_item in array_unique) {
            if (distance2dsquared(item.origin, _item.origin) < 16384) {
                Keep = 0;
                break;
            }
        }
        if (Keep) {
            array_unique[array_unique.size] = item;
        }
    }
    frontlinestructs = array_unique;
    foreach (data in frontlinestructs) {
        if (!isdefined(data.angles)) {
            data.angles = (0, 0, 0);
        }
        data.forward = anglestoforward(data.angles);
        data.right = anglestoright(data.angles);
        data.radius = randomfloatrange(2048, 4096);
        data.minpoint = data.origin - data.right * data.radius;
        data.maxpoint = data.origin + data.right * data.radius;
        lanestructs = getstructarray(data.target, "targetname");
        if (isdefined(lanestructs) && lanestructs.size > 0) {
            lanedata = spawnstruct();
            lanedata = [];
            foreach (lanestruct in lanestructs) {
                if (issubstr(lanestruct.script_noteworthy, "center")) {
                    continue;
                }
                laneKey = int(strtok(lanestruct.script_noteworthy, "_")[1]) - 1;
                if (!isdefined(lanedata[laneKey])) {
                    lanedata[laneKey] = spawnstruct();
                    lanedata[laneKey].coverzones = [];
                    lanedata[laneKey].frontvolume = [];
                    lanedata[laneKey].backvolume = [];
                }
                if (!isdefined(lanestruct.script_team)) {
                    lanestruct.script_team = "axis";
                }
                lanestruct.radius = 1024;
                volumes = getentarray("frontline0" + int(data.script_label) + 1 + "_lane0" + int(laneKey) + 1 + "_" + lanestruct.script_team, "script_noteworthy");
                lanestruct.goalvolume = volumes[0];
                var_64e328c24147bdf = "frontline0" + int(data.script_label) + 1 + "_lane0" + int(laneKey) + 1 + "_front_" + lanestruct.script_team;
                volumes = getentarray(var_64e328c24147bdf, "script_noteworthy");
                lanedata[laneKey].frontvolume[lanestruct.script_team] = volumes[0];
                var_cf3ac540ca289c49 = "frontline0" + int(data.script_label) + 1 + "_lane0" + int(laneKey) + 1 + "_back_" + lanestruct.script_team;
                volumes = getentarray(var_cf3ac540ca289c49, "script_noteworthy");
                lanedata[laneKey].backvolume[lanestruct.script_team] = volumes[0];
                if (!isdefined(lanedata[laneKey].coverzones[lanestruct.script_team])) {
                    lanedata[laneKey].coverzones[lanestruct.script_team] = [];
                }
                lanedata[laneKey].coverzones[lanestruct.script_team][lanedata[laneKey].coverzones[lanestruct.script_team].size] = lanestruct;
            }
            foreach (lanestruct in lanestructs) {
                if (issubstr(lanestruct.script_noteworthy, "center")) {
                    laneKey = int(strtok(lanestruct.script_noteworthy, "_")[1]) - 1;
                    lanedata[laneKey].origin = lanestruct.origin;
                }
            }
            foreach (laneKey, lane in lanedata) {
                if (!isdefined(lane.origin)) {
                    assertmsg("<dev string:x237>" + laneKey + "<dev string:x240>");
                    avgposition = (0, 0, 0);
                    count = 0;
                    foreach (coverzones in lane.coverzones) {
                        foreach (point in coverzones) {
                            avgposition += point.origin;
                            count++;
                        }
                    }
                    lane.origin = avgposition / count;
                }
            }
            data.lanedata = lanedata;
        } else {
            data.lanedata = function_49294d0067cb3c96(data);
        }
        if (isdefined(data.lanedata[0])) {
            lanevector = vectornormalize(data.lanedata[0].origin - data.lanedata[data.lanedata.size - 1].origin);
            data.right = lanevector;
            data.forward = vectorcross(lanevector, (0, 0, 1));
            data.radius = randomfloatrange(2048, 4096);
            data.minpoint = data.lanedata[0].origin;
            data.maxpoint = data.lanedata[data.lanedata.size - 1].origin;
        }
    }
    var_4ea385ac02f17acf = [];
    foreach (data in frontlinestructs) {
        var_4ea385ac02f17acf[int(data.script_label)] = data;
    }
    var_2535e9ea6de28fd1 = getdvar(@"hash_3560171963b3f075", "");
    var_2535e9ea6de28fd1 = strtok(var_2535e9ea6de28fd1, " ");
    validstructs = [];
    if (var_2535e9ea6de28fd1.size > 0) {
        frontlinecount = var_4ea385ac02f17acf.size;
        foreach (skipkey in var_2535e9ea6de28fd1) {
            var_4ea385ac02f17acf = array_remove_key(var_4ea385ac02f17acf, int(skipkey));
        }
        var_af79951156a8d90e = 0;
        for (searchindex = 0; var_af79951156a8d90e < var_4ea385ac02f17acf.size; searchindex++) {
            if (isdefined(var_4ea385ac02f17acf[searchindex])) {
                validstructs[var_af79951156a8d90e] = var_4ea385ac02f17acf[searchindex];
                var_af79951156a8d90e++;
            }
        }
    } else {
        validstructs = var_4ea385ac02f17acf;
    }
    level.frontlinedata = validstructs;
    function_f42e3ff44a92f156();
    flag_set("frontline_data_init");
    /#
        if (getdvarint(@"hash_c035e447af342805", 0) == 1) {
            level thread function_7bfc015c3d7ccaf8();
        }
    #/
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa136
// Size: 0x19d
function function_f42e3ff44a92f156() {
    foreach (frontline in level.frontlinedata) {
        foreach (lanedata in frontline.lanedata) {
            lanedata.frontvolume["axis"].heading = vectornormalize2(lanedata.frontvolume["allies"].origin - lanedata.frontvolume["axis"].origin);
            lanedata.frontvolume["allies"].heading = lanedata.frontvolume["axis"].heading * -1;
            lanedata.backvolume["axis"].heading = lanedata.frontvolume["axis"].heading;
            lanedata.backvolume["allies"].heading = lanedata.frontvolume["allies"].heading;
        }
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa2db
// Size: 0x8e2
function function_cc492b99c56f8004() {
    foreach (frontline in level.frontlinedata) {
        lanedata = frontline.lanedata[0];
        thread drawsphere(lanedata.frontvolume["axis"].origin, 256, 60, (1, 0, 0));
        endpoint = lanedata.frontvolume["axis"].origin + lanedata.frontvolume["axis"].heading * 1024;
        level thread scripts\cp_mp\utility\debug_utility::drawline(lanedata.frontvolume["axis"].origin, endpoint, 60, (0, 0, 1));
        lanedata = frontline.lanedata[1];
        thread drawsphere(lanedata.frontvolume["axis"].origin, 256, 60, (1, 0, 0));
        endpoint = lanedata.frontvolume["axis"].origin + lanedata.frontvolume["axis"].heading * 1024;
        level thread scripts\cp_mp\utility\debug_utility::drawline(lanedata.frontvolume["axis"].origin, endpoint, 60, (0, 0, 1));
        lanedata = frontline.lanedata[2];
        thread drawsphere(lanedata.frontvolume["axis"].origin, 256, 60, (1, 0, 0));
        endpoint = lanedata.frontvolume["axis"].origin + lanedata.frontvolume["axis"].heading * 1024;
        level thread scripts\cp_mp\utility\debug_utility::drawline(lanedata.frontvolume["axis"].origin, endpoint, 60, (0, 0, 1));
        lanedata = frontline.lanedata[0];
        thread drawsphere(lanedata.backvolume["axis"].origin, 256, 60, (1, 0, 0));
        endpoint = lanedata.backvolume["axis"].origin + lanedata.backvolume["axis"].heading * 1024;
        level thread scripts\cp_mp\utility\debug_utility::drawline(lanedata.backvolume["axis"].origin, endpoint, 60, (0, 0, 1));
        lanedata = frontline.lanedata[1];
        thread drawsphere(lanedata.backvolume["axis"].origin, 256, 60, (1, 0, 0));
        endpoint = lanedata.backvolume["axis"].origin + lanedata.backvolume["axis"].heading * 1024;
        level thread scripts\cp_mp\utility\debug_utility::drawline(lanedata.backvolume["axis"].origin, endpoint, 60, (0, 0, 1));
        lanedata = frontline.lanedata[2];
        thread drawsphere(lanedata.backvolume["axis"].origin, 256, 60, (1, 0, 0));
        endpoint = lanedata.backvolume["axis"].origin + lanedata.backvolume["axis"].heading * 1024;
        level thread scripts\cp_mp\utility\debug_utility::drawline(lanedata.backvolume["axis"].origin, endpoint, 60, (0, 0, 1));
        lanedata = frontline.lanedata[0];
        thread drawsphere(lanedata.frontvolume["allies"].origin, 256, 60, (1, 0, 0));
        endpoint = lanedata.frontvolume["allies"].origin + lanedata.frontvolume["allies"].heading * 1024;
        level thread scripts\cp_mp\utility\debug_utility::drawline(lanedata.frontvolume["allies"].origin, endpoint, 60, (0, 0, 1));
        lanedata = frontline.lanedata[1];
        thread drawsphere(lanedata.frontvolume["allies"].origin, 256, 60, (1, 0, 0));
        endpoint = lanedata.frontvolume["allies"].origin + lanedata.frontvolume["allies"].heading * 1024;
        level thread scripts\cp_mp\utility\debug_utility::drawline(lanedata.frontvolume["allies"].origin, endpoint, 60, (0, 0, 1));
        lanedata = frontline.lanedata[2];
        thread drawsphere(lanedata.frontvolume["allies"].origin, 256, 60, (1, 0, 0));
        endpoint = lanedata.frontvolume["allies"].origin + lanedata.frontvolume["allies"].heading * 1024;
        level thread scripts\cp_mp\utility\debug_utility::drawline(lanedata.frontvolume["allies"].origin, endpoint, 60, (0, 0, 1));
        lanedata = frontline.lanedata[0];
        thread drawsphere(lanedata.backvolume["allies"].origin, 256, 60, (1, 0, 0));
        endpoint = lanedata.backvolume["allies"].origin + lanedata.backvolume["allies"].heading * 1024;
        level thread scripts\cp_mp\utility\debug_utility::drawline(lanedata.backvolume["allies"].origin, endpoint, 60, (0, 0, 1));
        lanedata = frontline.lanedata[1];
        thread drawsphere(lanedata.backvolume["allies"].origin, 256, 60, (1, 0, 0));
        endpoint = lanedata.backvolume["allies"].origin + lanedata.backvolume["allies"].heading * 1024;
        level thread scripts\cp_mp\utility\debug_utility::drawline(lanedata.backvolume["allies"].origin, endpoint, 60, (0, 0, 1));
        lanedata = frontline.lanedata[2];
        thread drawsphere(lanedata.backvolume["allies"].origin, 256, 60, (1, 0, 0));
        endpoint = lanedata.backvolume["allies"].origin + lanedata.backvolume["allies"].heading * 1024;
        level thread scripts\cp_mp\utility\debug_utility::drawline(lanedata.backvolume["allies"].origin, endpoint, 60, (0, 0, 1));
    }
}

/#

    // Namespace gwtdm / namespace_fab382c89d62fd63
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xabc5
    // Size: 0x13b
    function function_7bfc015c3d7ccaf8() {
        foreach (frontline in level.frontlinedata) {
            for (i = 0; i < frontline.lanedata.size; i++) {
                frontline.lanedata[i].backvolume["<dev string:x27c>"] thread draw_bounds((1, 0, 0));
                frontline.lanedata[i].frontvolume["<dev string:x27c>"] thread draw_bounds((1, 0, 0));
                frontline.lanedata[i].backvolume["<dev string:x284>"] thread draw_bounds((0.5, 0.5, 1));
                frontline.lanedata[i].frontvolume["<dev string:x284>"] thread draw_bounds((0.5, 0.5, 1));
            }
        }
    }

    // Namespace gwtdm / namespace_fab382c89d62fd63
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0xad08
    // Size: 0x1e
    function draw_bounds(color) {
        thread scripts\engine\utility::draw_entity_bounds(self, 200000, color, 0);
    }

#/

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xad2e
// Size: 0x149
function function_e7b7b3f8010440fa() {
    level.var_3813c5843955e260 = 1;
    structs = [];
    startorigin = level.gw_objstruct.axishqloc.trigger.origin;
    totaldistance = distance(level.gw_objstruct.allieshqloc.trigger.origin, level.gw_objstruct.axishqloc.trigger.origin);
    for (i = 0; i < 6; i++) {
        frac = (i * 2 + 1) / 12;
        origin = startorigin + level.spawnselectionteamforward["axis"] * totaldistance * frac;
        data = spawnstruct();
        data.origin = origin;
        data.angles = vectortoangles(level.spawnselectionteamforward["axis"]);
        data.target = "";
        structs[structs.size] = data;
    }
    return structs;
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xae80
// Size: 0x254
function function_49294d0067cb3c96(data) {
    level.var_828f62c79774ee99 = 1;
    lanestructs = [];
    lanecount = 3;
    randompointcount = 3;
    startorigin = data.origin - data.right * data.radius;
    width = data.radius * 2;
    for (i = 0; i < lanecount; i++) {
        var_2ee094617021e62 = (i * 2 + 1) / lanecount * 2;
        lanedata = spawnstruct();
        lanedata.origin = startorigin + data.right * var_2ee094617021e62 * width;
        lanedata.coverzones = [];
        foreach (team in level.teamnamelist) {
            lanedata.coverzones[team] = [];
            positive = vectordot(data.forward, level.spawnselectionteamforward[team]) < 0;
            if (randompointcount > 0) {
                randompointcount = 1 + randomint(randompointcount);
            } else {
                randompointcount = 1;
            }
            for (j = 0; j < randompointcount; j++) {
                centerorigin = lanedata.origin + data.forward * 1024 * 1.5 * ter_op(positive, 1, -1);
                struct = spawnstruct();
                struct.origin = scripts\mp\gametypes\br_circle::getrandompointincircle(centerorigin, 512);
                struct.team = team;
                struct.radius = randomfloatrange(256, 512);
                lanedata.coverzones[team][lanedata.coverzones[team].size] = struct;
            }
        }
        lanestructs[lanestructs.size] = lanedata;
    }
    return lanestructs;
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb0dd
// Size: 0x3e
function function_3cab19163f3e50d3(team, frontlinekey, laneKey) {
    return level.frontlinedata[frontlinekey].lanedata[laneKey].coverzones[team];
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb124
// Size: 0x48
function function_7bb4716ac5c42f7c(team, laneKey) {
    return level.agentmanager[team][laneKey].var_f76e10d4dce6c204[randomint(level.agentmanager[team][laneKey].var_f76e10d4dce6c204.size)];
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb175
// Size: 0x266
function function_a998ab000df3c84c(origin, team, laneKey) {
    volumes = [];
    foreach (frontline in level.frontlinedata) {
        foreach (index, lanedata in frontline.lanedata) {
            if (isdefined(laneKey) && laneKey != index) {
                continue;
            }
            if (lanedata.backvolume.size > 0) {
                foreach (index1, volume in lanedata.backvolume) {
                    if (isdefined(team) && team != index1) {
                        continue;
                    }
                    volumes[volumes.size] = volume;
                }
                foreach (index2, volume in lanedata.frontvolume) {
                    if (isdefined(team) && team != index2) {
                        continue;
                    }
                    volumes[volumes.size] = volume;
                }
                continue;
            }
            foreach (index3, var_897c7c54286a3b86 in lanedata.coverzones) {
                if (isdefined(team) && team != index3) {
                    continue;
                }
                foreach (var_2c34125a01d24d3f in var_897c7c54286a3b86) {
                    volumes[volumes.size] = var_2c34125a01d24d3f.goalvolume;
                }
            }
        }
    }
    volumes = sortbydistance(volumes, origin);
    return volumes[0];
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb3e4
// Size: 0x19f
function function_ff46cb0a3bc4b055(agent, team, laneKey) {
    array = [];
    index = 0;
    increment = 1;
    if (team == "allies") {
        index = level.frontlinedata.size - 1;
        increment = -1;
    }
    while (index != level.var_48e03f24b9b5c1a) {
        coverzones = level.frontlinedata[index].lanedata[laneKey].coverzones[team];
        coverzone = coverzones[randomint(coverzones.size)];
        array[array.size] = coverzone.origin;
        index += increment;
    }
    coverzones = level.frontlinedata[level.var_48e03f24b9b5c1a].lanedata[laneKey].coverzones[team];
    coverzone = coverzones[randomint(coverzones.size)];
    array[array.size] = coverzone.origin;
    validorigins = [];
    foreach (origin in array) {
        toorigin = vectornormalize(origin - agent.origin);
        if (vectordot(level.spawnselectionteamforward[team], toorigin) > 0) {
            validorigins[validorigins.size] = origin;
        }
    }
    return validorigins;
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb58c
// Size: 0x2b4
function initai() {
    if (getdvarint(@"scr_default_maxagents", 120) == 0) {
        return;
    }
    level.var_72e8a99508b7be1b = getdvarint(@"hash_55d8273e8c59f973", 45);
    level.var_b747ee617515989a = getdvarint(@"hash_9b987a555b7e16af", 256);
    level.agenttier = 1;
    level.teamnationality = [];
    level.teamnationality["axis"] = "aq_gwtdm";
    level.teamnationality["allies"] = "pmc";
    level thread namespace_b27abd42d87cb8c0::init();
    namespace_bfef6903bca5845d::init();
    function_7f995b3e1538a773();
    namespace_bfef6903bca5845d::function_93add0b65db9f722(&function_5cd456d9b2cdc538, level);
    level.var_9d28d5b70aa9f5e4 = &function_91fd6f5b51fc3635;
    flag_wait("frontline_data_init");
    level.agentmanager = [];
    level.var_b21aafd3e06b203d = 1;
    foreach (team in level.teamnamelist) {
        level.agentmanager[team] = [];
        foreach (laneKey, lanedata in level.frontlinedata[0].lanedata) {
            data = spawnstruct();
            data.laneKey = laneKey;
            data.var_83cf1c64372dcca5 = level.var_72e8a99508b7be1b / level.frontlinedata[0].lanedata.size;
            data.var_f76e10d4dce6c204 = function_3cab19163f3e50d3(team, level.var_48e03f24b9b5c1a, laneKey);
            data.var_e2c31580f508b878 = [];
            data.var_8e55c5943a080a2e = 0;
            level.agentmanager[team][laneKey] = data;
        }
    }
    level.var_c0e1de2e14e458bf = "gwtdm";
    while (!isdefined(level.agentarray)) {
        waitframe();
    }
    function_7e95ba18d5bf7855();
    level thread function_f9b8935478663f0b();
    level thread function_848d0782943b416d("axis");
    level thread function_848d0782943b416d("allies");
    if (getdvarint(@"hash_69cfaa4519ba27d9", 1) == 1) {
        level thread function_fdc34e092fe389c8();
    }
    level thread function_c771a77bf1f4d2c1();
    while (!scripts\mp\flags::gameflag("prematch_done")) {
        waitframe();
    }
    level thread function_37169a4fb87a0e3();
    level thread function_b34021ca662a03bd();
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb848
// Size: 0x1da
function function_91fd6f5b51fc3635(agent, var_772edbdcfe906c73) {
    if (!isalive(agent)) {
        return;
    }
    agent endon("death");
    team = namespace_14d36171baccf528::agentpers_getagentpersdata(agent, "team");
    if (!isgameplayteam(team)) {
        return;
    }
    laneKey = namespace_14d36171baccf528::agentpers_getagentpersdata(agent, "laneKey");
    if (!isdefined(laneKey)) {
        return;
    }
    if (!isdefined(agent.var_630cf5f5ee1c2d64)) {
        agent.var_630cf5f5ee1c2d64 = 1;
    }
    agent.var_630cf5f5ee1c2d64++;
    if (agent.var_630cf5f5ee1c2d64 == 3) {
        closestvolume = function_a998ab000df3c84c(agent.origin, team, laneKey);
        agent cleargoalvolume();
        agent setgoalvolumeauto(closestvolume, closestvolume.heading);
        wait 5;
        return;
    }
    if (agent.var_630cf5f5ee1c2d64 > 10) {
        agent.imstuck = 1;
        return;
    }
    rushorigins = function_ff46cb0a3bc4b055(agent, team, laneKey);
    if (rushorigins.size > 0) {
        agent.rushorigins = rushorigins;
        agent thread function_8d8f7c8f7d567eb6();
        agent thread rushOriginRemover();
        agent thread scripts\mp\ai_behavior::function_65f6a39e1083fb6b(agent, agent.rushorigins, 1024, 1024, 1024);
        return;
    }
    agent.rushorigins = [];
    coverzone = function_7bb4716ac5c42f7c(team, laneKey);
    var_1f48f987ba8392d0 = level.var_b747ee617515989a * 3;
    origin = getclosestpointonnavmesh(coverzone.origin + (randomfloatrange(var_1f48f987ba8392d0 * -1, var_1f48f987ba8392d0), randomfloatrange(var_1f48f987ba8392d0 * -1, var_1f48f987ba8392d0), 0));
    agent thread scripts\mp\ai_behavior::function_a5117518725da028(agent, origin);
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xba2a
// Size: 0x2c1
function overrideagent(agent, laneKey) {
    namespace_14d36171baccf528::agentpers_setagentpersdata(agent, "team", agent.team);
    if (!isdefined(laneKey)) {
        laneKey = random(getarraykeys(level.frontlinedata[level.var_48e03f24b9b5c1a].lanedata));
    }
    namespace_14d36171baccf528::agentpers_setagentpersdata(agent, "laneKey", laneKey);
    level.var_3bf1cf107e60e048[agent.team][level.var_3bf1cf107e60e048[agent.team].size] = agent;
    agent.var_d0038b3cf5c426eb = 1;
    agent.var_5966903b1e0154e5 = 0;
    var_53407127d58e754d = 0;
    foreach (team in level.teamnamelist) {
        foreach (var_ff5b80567acf9b98, struct in level.agentmanager[team]) {
            if (array_contains(level.agentmanager[team][var_ff5b80567acf9b98].var_e2c31580f508b878, agent)) {
                level.agentmanager[team][var_ff5b80567acf9b98].var_e2c31580f508b878 = array_remove(level.agentmanager[team][var_ff5b80567acf9b98].var_e2c31580f508b878, agent);
                var_53407127d58e754d = 1;
                break;
            }
        }
        if (var_53407127d58e754d) {
            break;
        }
    }
    level.agentmanager[agent.team][laneKey].var_e2c31580f508b878[level.agentmanager[agent.team][laneKey].var_e2c31580f508b878.size] = agent;
    if (agent.team == "axis" || istrue(agent.var_76f8ddb1563464bd)) {
        body = undefined;
        head = undefined;
    } else {
        body = undefined;
        head = undefined;
        agent.var_76f8ddb1563464bd = 1;
    }
    grenade_type = namespace_14d36171baccf528::function_ba0801276542946b();
    grenadeammo = getdvarint(@"hash_2e7cc22bee3354df", 1);
    agent namespace_14d36171baccf528::function_c37c4f9d687074ff(body, head, undefined, grenade_type, grenadeammo);
    namespace_bfef6903bca5845d::function_c9dad3876b9d8755(agent, "gwtdm");
    agent.revive_bleedouttime = 10000;
    agent thread function_da90e4dd433678f9();
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbcf3
// Size: 0x9a
function function_642c7058d0a89b47(team) {
    lowestkey = undefined;
    lowestcount = undefined;
    foreach (laneKey, lanedata in level.agentmanager[team]) {
        count = lanedata.var_e2c31580f508b878.size;
        if (!isdefined(lowestcount) || count < lowestcount) {
            lowestcount = count;
            lowestkey = laneKey;
        }
    }
    return lowestkey;
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbd96
// Size: 0xb6
function function_b983381333b3881b(origin) {
    closestkey = undefined;
    closestdist = undefined;
    for (key = 0; key < level.frontlinedata.size; key++) {
        data = level.frontlinedata[key];
        for (laneKey = 0; laneKey < data.lanedata.size; laneKey++) {
            dist = distance2dsquared(data.lanedata[laneKey].origin, origin);
            if (!isdefined(closestdist) || dist < closestdist) {
                closestdist = dist;
                closestkey = laneKey;
            }
        }
    }
    return closestkey;
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbe55
// Size: 0xa6
function function_c9e5e3858ab1805f(agent) {
    laneKey = function_642c7058d0a89b47(agent.team);
    overrideagent(agent, laneKey);
    agent.c130spawn = 1;
    success = function_2da93e2a35e2182f(agent, agent.team, level.var_48e03f24b9b5c1a, laneKey);
    if (!success) {
        agent.rushorigins = function_ff46cb0a3bc4b055(agent, agent.team, laneKey);
        agent thread scripts\mp\ai_behavior::function_65f6a39e1083fb6b(agent, agent.rushorigins, 1024, 1024, 1024);
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbf03
// Size: 0xa6
function function_b744a1a8b7dabb6c(agent) {
    laneKey = function_b983381333b3881b(agent.origin);
    overrideagent(agent, laneKey);
    agent.c130spawn = 1;
    success = function_2da93e2a35e2182f(agent, agent.team, level.var_48e03f24b9b5c1a, laneKey);
    if (!success) {
        agent.rushorigins = function_ff46cb0a3bc4b055(agent, agent.team, laneKey);
        agent thread scripts\mp\ai_behavior::function_65f6a39e1083fb6b(agent, agent.rushorigins, 1024, 1024, 1024);
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbfb1
// Size: 0x153
function function_7e95ba18d5bf7855() {
    level.var_df2344c49d981562 = [];
    level.var_df2344c49d981562["allies"] = [];
    struct = spawnstruct();
    struct.body = "body_sp_ally_mex_sf_tier_1_1_1";
    struct.head = "head_sp_ally_mex_sf_tier_1_1_1";
    level.var_df2344c49d981562["allies"][level.var_df2344c49d981562["allies"].size] = struct;
    struct = spawnstruct();
    struct.body = "body_sp_ally_mex_sf_tier_1_2_1";
    struct.head = "head_sp_ally_mex_sf_tier_1_2_1";
    level.var_df2344c49d981562["allies"][level.var_df2344c49d981562["allies"].size] = struct;
    struct = spawnstruct();
    struct.body = "body_sp_ally_mex_sf_tier_1_3_1";
    struct.head = "head_sp_ally_mex_sf_tier_1_3_1";
    level.var_df2344c49d981562["allies"][level.var_df2344c49d981562["allies"].size] = struct;
    struct = spawnstruct();
    struct.body = "body_sp_ally_mex_sf_tier_1_4_1";
    struct.head = "head_sp_ally_mex_sf_tier_1_4_1";
    level.var_df2344c49d981562["allies"][level.var_df2344c49d981562["allies"].size] = struct;
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc10c
// Size: 0x84
function function_da90e4dd433678f9() {
    self endon("death");
    while (true) {
        waitframe();
        if (getdvarint(@"hash_997720413afa2a67", 0) == 0) {
            continue;
        }
        color = ter_op(self.team == "allies", (0, 0, 1), (1, 0, 0));
        level thread scripts\cp_mp\utility\debug_utility::drawsphere(self gettagorigin("j_spinelower"), 32, level.framedurationseconds, color);
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc198
// Size: 0xf6
function function_8d8f7c8f7d567eb6() {
    self endon("death");
    while (true) {
        waitframe();
        if (!isdefined(self.rushorigins) || self.rushorigins.size == 0) {
            break;
        }
        if (getdvarint(@"hash_90faa795702e8f9", 0) == 0) {
            continue;
        }
        startpos = self.origin;
        endpos = self.rushorigins[0];
        level thread scripts\cp_mp\utility\debug_utility::drawline(startpos, endpos, level.framedurationseconds, (0, 1, 0));
        for (i = 0; i < self.rushorigins.size - 1; i++) {
            startpos = self.rushorigins[i];
            endpos = self.rushorigins[i + 1];
            level thread scripts\cp_mp\utility\debug_utility::drawline(startpos, endpos, level.framedurationseconds, (1, 1, 0));
        }
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc296
// Size: 0x70
function rushOriginRemover() {
    self notify("rushOriginRemover");
    self endon("rushOriginRemover");
    self endon("death");
    while (true) {
        self waittill("combatRushComplete");
        rushorigins = [];
        for (i = 1; i < self.rushorigins.size; i++) {
            rushorigins[rushorigins.size] = self.rushorigins[i];
        }
        self.rushorigins = rushorigins;
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc30e
// Size: 0x1bf
function function_6ad69ddd2454e5b3() {
    while (true) {
        waitframe();
        frontlinekey = getdvarint(@"hash_91b9c2673018accc", -1);
        laneKey = getdvarint(@"hash_7fc4e6c8f23e5735", -1);
        if (frontlinekey == -1 || laneKey == -1) {
            continue;
        }
        setdvar(@"hash_91b9c2673018accc", -1);
        setdvar(@"hash_7fc4e6c8f23e5735", -1);
        foreach (team in level.teamnamelist) {
            coverzones = function_3cab19163f3e50d3(team, frontlinekey, laneKey);
            var_eb8decd97308075c = coverzones[randomint(coverzones.size)].origin;
            groupname = function_78759441c259f58a(var_eb8decd97308075c);
            numagents = 5;
            agentpackage = namespace_bfef6903bca5845d::function_ab14d6652e44fda0(numagents, undefined, level.agenttier, "gwtdm");
            agentpackage.reinforcementtype = "Helicopter";
            var_b58631347b6ab04 = namespace_7ae25d9e5d5a28ef::function_3779deb97b61a65(numagents, var_eb8decd97308075c, "medium", "everybody", "captureAgents", groupname, team, 0, undefined, undefined, undefined, agentpackage, 1, 1);
            foreach (agent in var_b58631347b6ab04) {
                overrideagent(agent, laneKey);
            }
        }
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xc4d5
// Size: 0x347
function function_6b1cbd26d1b252b4(desired_origin, var_93390a6953905fef, team) {
    unload_locs = undefined;
    if (false) {
        level thread scripts\mp\utility\debug::drawsphere(desired_origin, 32, 60, (1, 1, 1));
    }
    closestpoint = pointonsegmentnearesttopoint(level.frontlinedata[level.var_48e03f24b9b5c1a].minpoint, level.frontlinedata[level.var_48e03f24b9b5c1a].maxpoint, desired_origin);
    if (false) {
        level thread scripts\mp\utility\debug::drawsphere(closestpoint, 32, 60, (0, 1, 1));
    }
    unload_locs = sortbydistance(level.heliReinforceStruct.unload_locs, closestpoint);
    var_581c052b571d00a6 = 5;
    if (istrue(var_93390a6953905fef)) {
        var_581c052b571d00a6 = 1;
    }
    var_7127e3e9d3a5ba23 = [];
    foreach (loc in unload_locs) {
        if (var_7127e3e9d3a5ba23.size == var_581c052b571d00a6) {
            break;
        }
        if (scripts\mp\outofbounds::ispointinoutofbounds(loc.origin, team)) {
            continue;
        }
        var_54ee4011e4c0877e = vectornormalize(level.frontlinedata[level.var_48e03f24b9b5c1a].origin - loc.origin);
        if (vectordot(level.spawnselectionteamforward[team], var_54ee4011e4c0877e) < 0) {
            continue;
        }
        dropoffclosestpoint = pointonsegmentnearesttopoint(level.frontlinedata[level.var_48e03f24b9b5c1a].minpoint, level.frontlinedata[level.var_48e03f24b9b5c1a].maxpoint, loc.origin);
        mindist = getdvarint(@"hash_8ea81d61879b569f", 3000);
        mindistsq = mindist * mindist;
        distsq = distance2dsquared(loc.origin, dropoffclosestpoint);
        if (distsq < mindistsq) {
            if (false) {
                level thread drawsphere(loc.origin, 32, 60, (1, 0, 0));
                level thread drawline(dropoffclosestpoint, loc.origin, 60, (1, 0, 0));
            }
            continue;
        }
        if (false) {
            level thread scripts\mp\utility\debug::drawsphere(loc.origin, 32, 60, (0, 1, 0));
            level thread drawline(dropoffclosestpoint, loc.origin, 60, (0, 1, 0));
        }
        var_7127e3e9d3a5ba23[var_7127e3e9d3a5ba23.size] = loc;
    }
    if (!istrue(level.forceclosest)) {
        var_7127e3e9d3a5ba23 = array_randomize(var_7127e3e9d3a5ba23);
    }
    pathnode = namespace_7ae25d9e5d5a28ef::function_321665dcdcbf401e(var_7127e3e9d3a5ba23, desired_origin);
    if (isdefined(pathnode)) {
        pathnode function_35f1fc50bba61a84();
        return pathnode;
    }
    pathnode = namespace_7ae25d9e5d5a28ef::function_321665dcdcbf401e(unload_locs, desired_origin, var_581c052b571d00a6);
    if (isdefined(pathnode)) {
        pathnode function_35f1fc50bba61a84();
        return pathnode;
    }
    return undefined;
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc825
// Size: 0x67
function function_35f1fc50bba61a84() {
    if (!getdvarint(@"hash_9cf6e1b73edacb19", 1)) {
        return;
    }
    pathnode = self;
    if (!isdefined(pathnode.node)) {
        return;
    }
    if (!isdefined(pathnode.node.spawngroup)) {
        pathnode.node.spawngroup = "heli_test_guys";
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc894
// Size: 0x19a
function function_5cd456d9b2cdc538(agent, attacker) {
    if (isdefined(attacker) && isdefined(attacker.owner)) {
        attacker = attacker.owner;
    }
    team = namespace_14d36171baccf528::agentpers_getagentpersdata(agent, "team");
    if (isdefined(attacker) && isplayer(attacker) && !isagent(attacker) && !is_equal(attacker.team, team)) {
        scripts\mp\gamescore::giveteamscoreforobjective(attacker.team, level.pointsperkillai, 0);
        if (getdvarint(@"hash_2e405e2912dc4a44", 0) == 1) {
            attacker thread scripts\mp\rank::scoreeventpopup(hashcat(#"hash_2c8bcbb02ec7ff9b", level.pointsperkillai));
        }
        attacker incpersstat("contribution", level.pointsperkillai);
        attacker setextrascore0(attacker.pers["contribution"]);
        if (isplayer(attacker)) {
            killfeeddata = 0;
            killfeeddata += 2;
            killfeeddata += level.pointsperkillai << 4;
            attacker scripts\mp\gametypes\common::function_417749e099f041f(killfeeddata, -1);
        }
    }
    laneKey = namespace_14d36171baccf528::agentpers_getagentpersdata(agent, "laneKey");
    if (!isdefined(namespace_14d36171baccf528::agentpers_getagentpersdata(agent, "laneKey")) || !isgameplayteam(team)) {
        return;
    }
    level.agentmanager[team][laneKey].var_e2c31580f508b878 = array_remove(level.agentmanager[team][laneKey].var_e2c31580f508b878, agent);
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xca36
// Size: 0x1e4
function function_848d0782943b416d(team) {
    var_d5e5d93f3a939362 = getdvarint(@"hash_a190addb512ec71a", 2);
    var_c0e1f16535e4fa15 = getdvarint(@"hash_60235d2ae0550bc5", 6);
    var_68299821ad1626e0 = getdvarint(@"hash_bad4b491469253ef", 30) * 1000;
    helireinforcements = getdvarint(@"hash_289d6da5e0aff476", 1);
    hqstring = "gw_fob_" + team + "HQ";
    var_b5b1784d5a1327c7 = "spawnHQ_" + team;
    function_ba4022744dce59f6(var_b5b1784d5a1327c7, int(level.var_72e8a99508b7be1b * 1.5));
    function_c9189ff5d2e5af61(team, helireinforcements, var_c0e1f16535e4fa15);
    wait getdvarfloat(@"hash_eb2244b6b2a89169", 15);
    while (true) {
        wait 5;
        currenttime = gettime();
        if (!function_8c6dbb64c8e1603c(var_d5e5d93f3a939362)) {
            continue;
        }
        foreach (laneKey, lanedata in level.agentmanager[team]) {
            if (lanedata.var_e2c31580f508b878.size >= lanedata.var_83cf1c64372dcca5 - 1) {
                continue;
            }
            success = 0;
            if (helireinforcements && (currenttime > lanedata.var_8e55c5943a080a2e + var_68299821ad1626e0 || lanedata.var_8e55c5943a080a2e == 0)) {
                success = level function_33d2a7321a928b5a(var_c0e1f16535e4fa15, team, level.var_48e03f24b9b5c1a, laneKey);
                if (success) {
                    lanedata.var_8e55c5943a080a2e = currenttime;
                }
            }
            if (!success) {
                level function_21b7e8662f68614d(var_d5e5d93f3a939362, team, laneKey);
            }
        }
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xcc22
// Size: 0x1ca
function function_c9189ff5d2e5af61(team, helireinforcements, var_c0e1f16535e4fa15) {
    scripts\mp\gamelogic::waitforplayers(level.prematchperiod, 0, 0);
    heliintro = 1;
    if (getdvarint(@"hash_3d8fbe08639da15a", 1) == 0) {
        heliintro = 0;
    }
    helistarted = ter_op(helireinforcements && heliintro, 0, 1);
    ac130started = !level.var_fa789e7bab605e4c;
    if (helistarted && ac130started) {
        return;
    }
    var_6749ab538ec0ddeb = 0;
    if (getdvarint(@"scr_game_infilSkip", 0) == 1) {
        var_6749ab538ec0ddeb = 12;
    }
    var_50ba4037bbd61cff = 20 - var_6749ab538ec0ddeb;
    waittime_heli = level.prematchperiodend - var_50ba4037bbd61cff;
    waittime_heli = ter_op(waittime_heli > 0, waittime_heli, 0);
    var_a1d84737ec0b465d = 20 - var_6749ab538ec0ddeb;
    var_488a1360da4e442a = level.prematchperiodend - var_a1d84737ec0b465d;
    var_488a1360da4e442a = ter_op(var_488a1360da4e442a > 0, var_488a1360da4e442a, 0);
    for (timepassed = 0; !helistarted || !ac130started; timepassed++) {
        if (!helistarted && timepassed >= waittime_heli) {
            foreach (laneKey, lanedata in level.agentmanager[team]) {
                level thread function_e3ca5378e0f544c3(team, lanedata, laneKey, var_c0e1f16535e4fa15);
            }
            helistarted = 1;
        }
        if (!ac130started && timepassed >= var_488a1360da4e442a) {
            function_93e7d3696caa5331(10, level.var_48e03f24b9b5c1a, team);
            ac130started = 1;
        }
        wait 1;
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xcdf4
// Size: 0x90
function function_ee0aa2c35417d524(team, lanedata, laneKey) {
    var_e332fe633c8498b = 2;
    var_5ae2ede5b9d14341 = 0;
    var_ba591582396ec120 = int(lanedata.var_83cf1c64372dcca5 / 2);
    while (var_5ae2ede5b9d14341 < var_ba591582396ec120) {
        var_2245633b901f80e1 = var_e332fe633c8498b;
        if (var_5ae2ede5b9d14341 + var_e332fe633c8498b > var_ba591582396ec120) {
            var_2245633b901f80e1 = var_ba591582396ec120 - var_5ae2ede5b9d14341;
        }
        level function_21b7e8662f68614d(var_2245633b901f80e1, team, laneKey);
        var_5ae2ede5b9d14341 += var_2245633b901f80e1;
        wait randomfloatrange(2.5, 4);
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xce8c
// Size: 0x8d
function function_e3ca5378e0f544c3(team, lanedata, laneKey, var_c0e1f16535e4fa15) {
    var_ba591582396ec120 = int(lanedata.var_83cf1c64372dcca5 / 4);
    var_7a155fea3b7b30dc = var_ba591582396ec120 / var_c0e1f16535e4fa15;
    for (i = 0; i < var_7a155fea3b7b30dc; i++) {
        wait randomfloatrange(1, 3) + (laneKey + 2) * 2;
        level function_33d2a7321a928b5a(var_c0e1f16535e4fa15, team, level.var_48e03f24b9b5c1a, laneKey);
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xcf21
// Size: 0x4bd
function function_21b7e8662f68614d(numagents, team, laneKey) {
    if (level.usespawnselection) {
        hqstring = "gw_fob_" + team + "HQ";
        var_fd5ea9cb37c309d3 = level.spawnselectionlocations[hqstring][team].spawnpoints;
        var_b5b1784d5a1327c7 = "spawnHQ_" + team;
        for (i = 0; i < numagents; i++) {
            aitype = function_d5bc07eabf352abb(undefined, undefined, "gwtdm", undefined, level.agenttier, level.teamnationality[team]);
            agent = ai_mp_requestspawnagent(aitype, var_fd5ea9cb37c309d3[i].origin, var_fd5ea9cb37c309d3[i].angles, "medium", var_b5b1784d5a1327c7, undefined, undefined, team, undefined, undefined, 1);
            if (isdefined(agent)) {
                overrideagent(agent, laneKey);
                success = function_2da93e2a35e2182f(agent, team, level.var_48e03f24b9b5c1a, laneKey);
                if (!success) {
                    agent.rushorigins = function_ff46cb0a3bc4b055(agent, team, laneKey);
                    agent thread function_8d8f7c8f7d567eb6();
                    agent thread rushOriginRemover();
                    agent thread scripts\mp\ai_behavior::function_65f6a39e1083fb6b(agent, agent.rushorigins, 1024, 1024, 1024);
                }
            }
        }
        return;
    }
    if (level.agenttier == 1 && !level.var_7232d887dbda3729 || level.agenttier == 2 && !level.var_7232d587dbda3090) {
        if (!level.var_ad7b64f93b499edb) {
            return;
        }
        players = getteamdata(team, "players");
        if (players.size > 0) {
            spawnpoint = players[0] getspawnpointforplayer();
            if (isdefined(spawnpoint)) {
                aitype = function_d5bc07eabf352abb(undefined, undefined, "gwtdm", undefined, level.agenttier, level.teamnationality[team]);
                agent = ai_mp_requestspawnagent(aitype, spawnpoint.origin, spawnpoint.angles, "medium", "spawnHQ_" + team, undefined, undefined, team, undefined, undefined, 1);
                if (isdefined(agent)) {
                    overrideagent(agent, laneKey);
                    success = function_2da93e2a35e2182f(agent, team, level.var_48e03f24b9b5c1a, laneKey);
                    if (!success) {
                        agent.rushorigins = function_ff46cb0a3bc4b055(agent, team, laneKey);
                        agent thread function_8d8f7c8f7d567eb6();
                        agent thread rushOriginRemover();
                        agent thread scripts\mp\ai_behavior::function_65f6a39e1083fb6b(agent, agent.rushorigins, 1024, 1024, 1024);
                    }
                }
            }
        }
        return;
    }
    if (istrue(level.var_ee41a5aaf764c9cc)) {
        players = getteamdata(team, "players");
        if (!isdefined(players) || players.size == 0) {
            return;
        }
        idealdist = getdvarint(@"hash_a66b78681b2d0805", 4096);
        spawnparams = [];
        spawnparams["teamForward"] = level.spawnselectionteamforward[team];
        spawnparams["idealDistSq"] = idealdist * idealdist;
        scripts\mp\spawnlogic::activatespawnset(level.var_ad9cae795e7505c6[team], 1);
        spawnpoint = players[0] scripts\mp\spawnlogic::getspawnpoint(players[0], team, level.var_ad9cae795e7505c6[team], undefined, undefined, spawnparams);
        if (isdefined(spawnpoint)) {
            aitype = function_d5bc07eabf352abb(undefined, undefined, "gwtdm", undefined, level.agenttier, level.teamnationality[team]);
            agent = ai_mp_requestspawnagent(aitype, spawnpoint.origin, spawnpoint.angles, "medium", "spawnHQ_" + team, undefined, undefined, team, undefined, undefined, 1);
            if (isdefined(agent)) {
                overrideagent(agent, laneKey);
                success = function_2da93e2a35e2182f(agent, team, level.var_48e03f24b9b5c1a, laneKey);
                if (!success) {
                    agent.rushorigins = function_ff46cb0a3bc4b055(agent, team, laneKey);
                    agent thread function_8d8f7c8f7d567eb6();
                    agent thread rushOriginRemover();
                    agent thread scripts\mp\ai_behavior::function_65f6a39e1083fb6b(agent, agent.rushorigins, 1024, 1024, 1024);
                }
            }
        }
        return;
    }
    spawnpoint = function_277456e766f73b0(team, laneKey);
    heading = vectortoangles(level.spawnselectionteamforward[team]);
    agents = level namespace_885300a47c2b51e6::function_55ab9c6da96226e7(numagents, spawnpoint.origin, undefined, undefined, "medium", "spawnHQ_" + team, "debug", team, undefined, undefined, heading, &function_b744a1a8b7dabb6c, 1, 1, level.agenttier);
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xd3e6
// Size: 0x138
function function_33d2a7321a928b5a(numagents, team, frontlinekey, laneKey) {
    coverzone = function_7bb4716ac5c42f7c(team, laneKey);
    groupname = function_78759441c259f58a(coverzone.origin, numagents);
    agentpackage = namespace_bfef6903bca5845d::function_ab14d6652e44fda0(numagents, undefined, level.agenttier, "gwtdm");
    agentpackage.reinforcementtype = "Helicopter";
    var_b58631347b6ab04 = namespace_7ae25d9e5d5a28ef::function_3779deb97b61a65(numagents, coverzone.origin, "medium", "everybody", "captureAgents", groupname, team, 0, undefined, undefined, undefined, agentpackage, 1, 1);
    if (!isdefined(var_b58631347b6ab04)) {
        return false;
    }
    foreach (agent in var_b58631347b6ab04) {
        overrideagent(agent, laneKey);
        agent.helispawn = 1;
        function_2aa208e2058474e5(agent, agent.team, laneKey);
    }
    return true;
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd527
// Size: 0x232
function function_2f5b6c628445768(var_3f6fd6edaf6c6713) {
    if (!isdefined(level.agentmanager)) {
        return;
    }
    level thread function_ac93ebb80902a467();
    foreach (team in level.teamnamelist) {
        level.var_3bf1cf107e60e048[team] = [];
        level.var_9de3c802fced05e2[team] = [];
        level thread function_c1313bf26d803678(team);
        if (team == var_3f6fd6edaf6c6713) {
            level thread function_7a98ea2f74ba9607(team);
        } else {
            level thread function_16b67172a4f3c6f8(team);
        }
        foreach (laneKey, lanedata in level.agentmanager[team]) {
            lanedata.var_f76e10d4dce6c204 = function_3cab19163f3e50d3(team, level.var_48e03f24b9b5c1a, laneKey);
            foreach (agent in lanedata.var_e2c31580f508b878) {
                if (istrue(agent.var_5966903b1e0154e5)) {
                    level.var_9de3c802fced05e2[team][level.var_9de3c802fced05e2[team].size] = agent;
                    agent.var_d0038b3cf5c426eb = 0;
                    agent.var_5966903b1e0154e5 = 1;
                    agent.var_a8a165c3323bda48 = 0;
                } else {
                    level.var_3bf1cf107e60e048[team][level.var_3bf1cf107e60e048[team].size] = agent;
                    agent.var_d0038b3cf5c426eb = 1;
                    agent.var_5966903b1e0154e5 = 0;
                    agent.var_a8a165c3323bda48 = 0;
                }
                if (istrue(agent.var_d0640290e2529307)) {
                    continue;
                }
                if (!isalive(agent)) {
                    continue;
                }
                agent thread function_2aa208e2058474e5(agent, team, laneKey);
            }
        }
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xd761
// Size: 0x1af
function function_2aa208e2058474e5(agent, team, laneKey) {
    agent endon("death");
    if (!isalive(agent)) {
        return;
    }
    if (!isdefined(agent)) {
        return;
    }
    if (!isdefined(team)) {
        team = namespace_14d36171baccf528::agentpers_getagentpersdata(agent, "team");
    }
    if (!isdefined(laneKey)) {
        laneKey = namespace_14d36171baccf528::agentpers_getagentpersdata(agent, "laneKey");
    }
    if (!isdefined(team) || !isdefined(laneKey)) {
        return;
    }
    if (isdefined(agent.capdelaytime) && agent.capdelaytime > 0) {
        wait agent.capdelaytime + 1;
    }
    success = function_2da93e2a35e2182f(agent, team, level.var_48e03f24b9b5c1a, laneKey);
    if (!success) {
        rushorigins = function_ff46cb0a3bc4b055(agent, team, laneKey);
        if (rushorigins.size > 0) {
            agent.rushorigins = rushorigins;
            agent thread function_8d8f7c8f7d567eb6();
            agent thread rushOriginRemover();
            agent thread scripts\mp\ai_behavior::function_65f6a39e1083fb6b(agent, agent.rushorigins, 1024, 1024, 1024);
            return;
        }
        agent.rushorigins = [];
        coverzone = function_7bb4716ac5c42f7c(team, laneKey);
        origin = getclosestpointonnavmesh(coverzone.origin + (randomfloatrange(level.var_b747ee617515989a * -1, level.var_b747ee617515989a), randomfloatrange(level.var_b747ee617515989a * -1, level.var_b747ee617515989a), 0));
        agent thread scripts\mp\ai_behavior::function_a5117518725da028(agent, origin, 1024, 1024, 1024, undefined, undefined, undefined, &scripts\mp\ai_behavior::function_8dad0c97c82fb52f);
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd918
// Size: 0xe6
function function_55c73da3bc1275f7(agent) {
    if (getdvarint(@"hash_6243ee712b007b0b", 0) == 1) {
        return;
    }
    agent endon("death");
    agent notify("killStallWatcher");
    agent endon("killStallWatcher");
    timesclose = 0;
    lastdist = undefined;
    while (true) {
        wait 0.5;
        dist = distance2dsquared(agent.var_99f2752b6513c9dd.origin, agent.origin);
        if (dist < 65536) {
            if (!isdefined(lastdist)) {
                lastdist = dist;
            } else if (abs(lastdist - dist) < 4096) {
                timesclose++;
                lastdist = dist;
            } else {
                timesclose = 0;
            }
        } else {
            timesclose = 0;
        }
        if (timesclose >= 3) {
            agent thread function_fd1ef087d4a56d19(agent, agent.team);
            agent notify("killStallWatcher");
        }
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xda06
// Size: 0x5a
function function_7e904c73621a47d1(agent, time) {
    agent endon("death");
    for (timepassed = 0; timepassed < time; timepassed++) {
        thread scripts\mp\utility\debug::drawsphere(agent.origin, 128, 1, (0, 1, 1));
        wait 1;
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xda68
// Size: 0x149
function function_7a98ea2f74ba9607(team) {
    capname = "cap_bark_orders";
    animset = "caps/common/cap_bark_orders_advance";
    foreach (lanedata in level.agentmanager[team]) {
        agents = array_randomize(lanedata.var_e2c31580f508b878);
        var_6aa514cfd79e469f = 6;
        numrun = 0;
        origin = function_4d65c1597ec31547(agents);
        if (isdefined(origin)) {
            playsoundatpos(origin, "mp_walla_invasion_charge_group");
        }
        foreach (agent in agents) {
            if (numrun >= var_6aa514cfd79e469f) {
                break;
            }
            if (!function_8cc95623d93d70fb(agent)) {
                continue;
            }
            numrun++;
            agent thread function_b1ff81f9e48f070(agent, agent.origin, capname, animset, undefined, undefined, "mp_walla_invasion_charge_individual");
        }
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdbb9
// Size: 0x16f
function function_16b67172a4f3c6f8(team) {
    capname = "cap_bark_orders";
    animset = "caps/common/cap_bark_orders_fallback";
    foreach (lanedata in level.agentmanager[team]) {
        agents = array_randomize(lanedata.var_e2c31580f508b878);
        var_b99bfd1384485e2d = 6;
        var_7869ed48e794554e = 0;
        var_e20187343cea1130 = 3;
        var_1303886face0ec6f = 0;
        origin = function_4d65c1597ec31547(agents);
        if (isdefined(origin)) {
            playsoundatpos(origin, "mp_walla_invasion_retreat_group");
        }
        foreach (agent in agents) {
            if (!function_8cc95623d93d70fb(agent)) {
                continue;
            }
            if (var_7869ed48e794554e < var_b99bfd1384485e2d) {
                var_7869ed48e794554e++;
                agent thread function_b1ff81f9e48f070(agent, agent.origin, capname, animset);
                continue;
            }
            if (var_1303886face0ec6f < var_e20187343cea1130) {
                var_1303886face0ec6f++;
                function_b1458f8adb57f733(agent);
            }
        }
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdd30
// Size: 0x341
function function_b34021ca662a03bd() {
    level endon("game_ended");
    if (getdvarint(@"hash_efa65def009de58c", 0) == 1) {
        return;
    }
    var_4dee2f3ecb36d88a = getdvarint(@"hash_fbc6c90a51e19cfa", 10);
    var_a74d259a91a5635c = getdvarint(@"hash_726c19967a7eb54c", 33);
    var_96fa696d3e52e34f = getdvarint(@"hash_13411e313136639f", 33);
    var_bb833fe37b1c8283 = getdvarint(@"hash_1818a2df93845813", 33);
    totaltickets = var_4dee2f3ecb36d88a + var_a74d259a91a5635c + var_96fa696d3e52e34f + var_bb833fe37b1c8283;
    while (!scripts\mp\flags::gameflag("prematch_done")) {
        waitframe();
    }
    wait 30;
    var_27df2f3e1070dc7c = 0;
    var_f17ce0ab9390041e = 0;
    var_6e8f659dfacd2391 = 1;
    var_8284343d0ff94cc6 = undefined;
    while (true) {
        var_9c5b939810814304 = 0;
        randomplayerindex = -1;
        for (possibleplayers = level.players; !var_9c5b939810814304 && possibleplayers.size > 0; possibleplayers = level.players) {
            randomplayerindex = randomint(possibleplayers.size);
            if (isdefined(possibleplayers[randomplayerindex]) && isalive(possibleplayers[randomplayerindex])) {
                var_9c5b939810814304 = 1;
                break;
            } else {
                possibleplayers[randomplayerindex] = undefined;
            }
            if (possibleplayers.size <= 0) {
                wait 1;
            }
        }
        playerteam = undefined;
        if (randomplayerindex > -1) {
            var_8284343d0ff94cc6 = sortbydistance(level.agentarray, possibleplayers[randomplayerindex].origin);
            playerteam = possibleplayers[randomplayerindex].team;
            possibleplayers[randomplayerindex] = undefined;
        }
        success = 0;
        foreach (agent in var_8284343d0ff94cc6) {
            if (function_8cc95623d93d70fb(agent) && isdefined(playerteam) && agent.team == playerteam && (!isdefined(agent.var_7698b3f1e3d199c) || isdefined(agent.var_7698b3f1e3d199c) && agent.var_7698b3f1e3d199c < gettime() + 10000)) {
                agent.var_7698b3f1e3d199c = gettime();
                roll = randomint(totaltickets);
                if (roll <= var_4dee2f3ecb36d88a && isdefined(agent.enemy)) {
                    agent thread function_727cda5ef2ae887d(agent);
                } else if (roll <= var_4dee2f3ecb36d88a + var_a74d259a91a5635c) {
                    agent thread function_b1458f8adb57f733(agent);
                } else if (roll <= var_4dee2f3ecb36d88a + var_a74d259a91a5635c + var_96fa696d3e52e34f) {
                    agent thread function_b1ff81f9e48f070(agent, agent.origin, "cap_bark_orders", "caps/common/cap_bark_orders_advance");
                } else {
                    agent thread function_b1ff81f9e48f070(agent, agent.origin, "cap_bark_orders", "caps/common/cap_bark_orders_fallback");
                }
                success = 1;
            }
            if (success) {
                var_27df2f3e1070dc7c++;
                wait 5;
                break;
            }
            var_f17ce0ab9390041e++;
            if (var_f17ce0ab9390041e >= 5) {
                var_f17ce0ab9390041e = 0;
                waitframe();
            }
        }
        if (!success || var_27df2f3e1070dc7c >= 5) {
            possibleplayers = level.players;
            wait 5;
        }
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe079
// Size: 0xc7
function function_ac93ebb80902a467() {
    foreach (agent in level.agentarray) {
        if (!function_8cc95623d93d70fb(agent)) {
            continue;
        }
        if (!istrue(agent.imstuck)) {
            continue;
        }
        if (!agent asmhasstate(agent.asmname, "choose_long_death")) {
            continue;
        }
        agent.var_37c05513d2997ab4 = 1;
        agent.imstuck = 0;
        agent.revive_bleedouttime = 5000;
        agent thread function_727cda5ef2ae887d(agent);
        wait randomfloatrange(2, 3);
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe148
// Size: 0xc9
function function_8cc95623d93d70fb(agent) {
    if (!isalive(agent)) {
        return false;
    }
    if (isdefined(agent.vehicle_position) && isint(agent.vehicle_position)) {
        return false;
    }
    if (istrue(agent.var_37c05513d2997ab4)) {
        return false;
    }
    if (isdefined(agent.landing_spot)) {
        return false;
    }
    if (agent isinscriptedstate()) {
        return false;
    }
    if (istrue(agent.doinglongdeath)) {
        return false;
    }
    if (isdefined(agent function_92435c7a6ae85c3c())) {
        return false;
    }
    if (!agent isonornearstairs()) {
        return false;
    }
    negotiationnode = agent getnearbynegotiationinfo(32);
    if (isdefined(negotiationnode)) {
        return false;
    }
    if (agent.asmname != agent.var_a942dd31d55102c9) {
        return false;
    }
    return true;
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0xe21a
// Size: 0xb7
function function_b1ff81f9e48f070(agent, origin, capname, animset, delaymin, delaymax, var_20aa66e7dd98fb53) {
    agent endon("death");
    if (!isdefined(delaymin)) {
        delaymin = 0.1;
    }
    if (!isdefined(delaymax)) {
        delaymax = 2;
    }
    agent.capdelaytime = randomfloatrange(delaymin, delaymax);
    wait agent.capdelaytime;
    agent.capdelaytime = -1;
    if (!function_8cc95623d93d70fb(agent)) {
        return;
    }
    agent thread scripts\common\cap::function_b58f0a57adf2948e(origin, capname, animset, 1);
    if (isdefined(var_20aa66e7dd98fb53)) {
        playsoundatpos(agent.origin, var_20aa66e7dd98fb53);
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xe2d9
// Size: 0x92
function function_b1458f8adb57f733(agent, useinplace, var_9b57bd8d7f3d4e6a, delaymin, delaymax) {
    agent endon("death");
    if (!isdefined(delaymin)) {
        delaymin = 0.1;
    }
    if (!isdefined(delaymax)) {
        delaymax = 2;
    }
    if (!isdefined(useinplace)) {
        useinplace = 1;
    }
    agent.capdelaytime = randomfloatrange(delaymin, delaymax);
    wait agent.capdelaytime;
    agent.capdelaytime = -1;
    if (!function_8cc95623d93d70fb(agent)) {
        return;
    }
    namespace_1ee1798c32f768c2::function_21bd6a8c4766ad5a(agent, useinplace, var_9b57bd8d7f3d4e6a);
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xe373
// Size: 0x96
function function_727cda5ef2ae887d(agent, helper, delaymin, delaymax) {
    agent endon("death");
    if (!isdefined(delaymin)) {
        delaymin = 1;
    }
    if (!isdefined(delaymax)) {
        delaymax = 4;
    }
    agent.capdelaytime = randomfloatrange(delaymin, delaymax);
    wait agent.capdelaytime;
    agent.capdelaytime = -1;
    if (!function_8cc95623d93d70fb(agent)) {
        return;
    }
    if (agent asmhasstate(agent.asmname, "choose_long_death")) {
        namespace_1ee1798c32f768c2::function_63c85ab9240382f7(agent, helper);
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe411
// Size: 0x20a
function function_c771a77bf1f4d2c1() {
    if (!gameflag("infil_will_run")) {
        return;
    }
    if (level.prematchperiodend > 0) {
        level waittill("match_start_real_countdown");
    } else {
        return;
    }
    obstacles = [];
    landinglocs = [];
    var_97d80017548b48cb = [];
    foreach (team in game["infil"]) {
        if (!isdefined(team[1])) {
            continue;
        }
        foreach (infiltype in team[1]) {
            foreach (var_d2a495e530abb848 in infiltype) {
                landinglocs[landinglocs.size] = var_d2a495e530abb848.path;
            }
        }
    }
    foreach (landingloc in landinglocs) {
        var_97d80017548b48cb[var_97d80017548b48cb.size] = createnavobstaclebybounds(landingloc.origin, (200, 128, 200), landingloc.angles);
    }
    while (!scripts\mp\flags::gameflag("prematch_done")) {
        waitframe();
    }
    wait 3;
    foreach (var_343ab41ce58c7a17 in var_97d80017548b48cb) {
        destroynavobstacle(var_343ab41ce58c7a17);
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe623
// Size: 0x87
function function_4d65c1597ec31547(agents) {
    origins = [];
    foreach (agent in agents) {
        if (function_8cc95623d93d70fb(agent)) {
            origins[origins.size] = agent.origin;
        }
    }
    if (origins.size > 0) {
        return averagepoint(origins);
    }
    return undefined;
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe6b2
// Size: 0x222
function function_f9b8935478663f0b() {
    stepy = 25;
    while (true) {
        waitframe();
        if (getdvarint(@"hash_ae55816cba943c57", 0) == 0) {
            continue;
        }
        foreach (team in level.teamnamelist) {
            startx = 400;
            if (team == "allies") {
                startx = 800;
            }
            starty = 300;
            /#
                printtoscreen2d(startx, starty, team, (1, 1, 1), 1);
            #/
            foreach (laneKey, lanedata in level.agentmanager[team]) {
                linecount = 1;
                /#
                    printtoscreen2d(startx, starty + stepy * linecount, "<dev string:x28e>" + laneKey + "<dev string:x29b>", (1, 1, 1), 1);
                #/
                linecount++;
                foreach (index, agent in lanedata.var_e2c31580f508b878) {
                    color = (1, 1, 1);
                    if (istrue(agent.helispawn)) {
                        color = (0, 1, 0);
                    } else if (istrue(agent.c130spawn)) {
                        color = (0, 1, 1);
                    }
                    /#
                        printtoscreen2d(startx, starty + stepy * linecount, "<dev string:x2a0>" + index + "<dev string:x2a5>" + agent getentitynumber(), color, 1);
                    #/
                    linecount++;
                }
                startx += 100;
            }
        }
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xe8dc
// Size: 0x1db
function function_ce95c7540070f7d0(killstreakname, killstreakteam, attacker) {
    if (isdefined(attacker) && isdefined(attacker.owner)) {
        attacker = attacker.owner;
    }
    if (!isdefined(attacker) || !isdefined(attacker.team) || !isdefined(killstreakteam)) {
        return;
    }
    if (!isenemyteam(killstreakteam, attacker.team)) {
        return;
    }
    if (isagent(attacker)) {
        return;
    }
    var_24d22c13c6fece21 = 0;
    switch (killstreakname) {
    case #"hash_27002778019fb447":
    case #"hash_4d5aa76e8707f47b":
    case #"hash_634b246c3da5c56f":
    case #"hash_9e36e3bd3a9dd00d":
    case #"hash_ab5712e297cd430e":
    case #"hash_cf0ef5bef19a311b":
    case #"hash_e40585107590f016": 
        var_24d22c13c6fece21 = 5;
        break;
    case #"hash_bf2f9adbd2b41d5":
    case #"hash_2289ec11d77bce8f":
    case #"hash_349713b5ad494dda":
    case #"hash_887ad77192b9c4fb": 
        var_24d22c13c6fece21 = 10;
        break;
    case #"hash_413c38e72fe8b5bf":
    case #"hash_4ad475e6e15635bd": 
        var_24d22c13c6fece21 = 15;
        break;
    }
    if (var_24d22c13c6fece21 > 0) {
        scripts\mp\gamescore::giveteamscoreforobjective(attacker.team, var_24d22c13c6fece21, 0);
        if (getdvarint(@"hash_2e405e2912dc4a44", 0) == 1) {
            attacker thread scripts\mp\rank::scoreeventpopup(hashcat(#"hash_2c8bcbb02ec7ff9b", var_24d22c13c6fece21));
        }
        attacker incpersstat("contribution", var_24d22c13c6fece21);
        attacker setextrascore0(attacker.pers["contribution"]);
        if (isplayer(attacker)) {
            killfeeddata = 0;
            killfeeddata += 4;
            killfeeddata += var_24d22c13c6fece21 << 4;
            attacker scripts\mp\gametypes\common::function_417749e099f041f(killfeeddata, -1);
        }
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xeabf
// Size: 0x1ac
function function_8decce720ed19f1a(vehiclename, vehicleteam, attacker) {
    if (isdefined(attacker) && isdefined(attacker.owner)) {
        attacker = attacker.owner;
    }
    if (!isdefined(attacker) || !isdefined(attacker.team) || !isdefined(vehicleteam)) {
        return;
    }
    if (vehicleteam == "neutral" || !isenemyteam(vehicleteam, attacker.team)) {
        return;
    }
    if (isagent(attacker)) {
        return;
    }
    var_24d22c13c6fece21 = 0;
    switch (vehiclename) {
    case #"hash_44d67727616d3059":
    case #"hash_9d4e22a00fc630b5":
    case #"hash_d212f4961f28eb58":
    case #"hash_d63b8f48fb92540d":
    case #"hash_fc4bff8ee315386a": 
        var_24d22c13c6fece21 = 5;
        break;
    case #"hash_41afa3eacdeba917":
    case #"hash_66c8846b85d8c948":
    case #"hash_7c54070d9b704f70":
    case #"hash_cb2498c4a1e415fd": 
        var_24d22c13c6fece21 = 10;
        break;
    }
    if (var_24d22c13c6fece21 > 0) {
        scripts\mp\gamescore::giveteamscoreforobjective(attacker.team, var_24d22c13c6fece21, 0);
        if (getdvarint(@"hash_2e405e2912dc4a44", 0) == 1) {
            attacker thread scripts\mp\rank::scoreeventpopup(hashcat(#"hash_2c8bcbb02ec7ff9b", var_24d22c13c6fece21));
        }
        attacker incpersstat("contribution", var_24d22c13c6fece21);
        attacker setextrascore0(attacker.pers["contribution"]);
        if (isplayer(attacker)) {
            killfeeddata = 0;
            killfeeddata += 4;
            killfeeddata += var_24d22c13c6fece21 << 4;
            attacker scripts\mp\gametypes\common::function_417749e099f041f(killfeeddata, -1);
        }
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xec73
// Size: 0x219
function function_4baf8b94714b68fe() {
    level endon("game_ended");
    percent_25 = level.scorelimit * 0.25;
    var_4b0036858d3bb806 = level.scorelimit * 0.5;
    percent_75 = level.scorelimit * 0.75;
    var_4b11ce858d4f10aa = level.scorelimit * 0.9;
    past25 = 0;
    var_ad095265b1032cf4 = 0;
    past75 = 0;
    var_ad1aca65b1163f38 = 0;
    while (!scripts\mp\flags::gameflag("prematch_done")) {
        waitframe();
    }
    while (true) {
        axisscore = scripts\mp\gamescore::_getteamscore("axis");
        alliesscore = scripts\mp\gamescore::_getteamscore("allies");
        winningteam = ter_op(axisscore > alliesscore, "axis", "allies");
        losingteam = getotherteam(winningteam)[0];
        if (!past25 && (axisscore >= percent_25 || alliesscore >= percent_25)) {
            past25 = 1;
            level thread function_a350ea3bd2c8470();
            scripts\mp\utility\dialog::statusdialog("score_25_winning", winningteam, 1);
            scripts\mp\utility\dialog::statusdialog("score_25_losing", losingteam, 1);
        }
        if (!var_ad095265b1032cf4 && (axisscore >= var_4b0036858d3bb806 || alliesscore >= var_4b0036858d3bb806)) {
            var_ad095265b1032cf4 = 1;
            level thread killstreakCrateLoop();
            scripts\mp\utility\dialog::statusdialog("score_50_winning", winningteam, 1);
            scripts\mp\utility\dialog::statusdialog("score_50_losing", losingteam, 1);
            level thread function_4fa7b02d1bbe565e(6);
        }
        if (!past75 && (axisscore >= percent_75 || alliesscore >= percent_75)) {
            past75 = 1;
            level thread function_1b39d0ac099f112f();
            scripts\mp\utility\dialog::statusdialog("score_75_winning", winningteam, 1);
            scripts\mp\utility\dialog::statusdialog("score_75_losing", losingteam, 1);
        }
        if (!var_ad1aca65b1163f38 && (axisscore >= var_4b11ce858d4f10aa || alliesscore >= var_4b11ce858d4f10aa)) {
            var_ad1aca65b1163f38 = 1;
            scripts\mp\utility\dialog::statusdialog("score_90_winning", winningteam, 1);
            scripts\mp\utility\dialog::statusdialog("score_90_losing", losingteam, 1);
        }
        wait 1;
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xee94
// Size: 0x40b
function function_a350ea3bd2c8470() {
    level.var_84c26a9fa39f7586 = [];
    level.var_ebb878f6221bed4f = [];
    var_c2344893389fa188 = [];
    foreach (team in level.teamnamelist) {
        level.var_84c26a9fa39f7586[team] = 0;
        level.var_ebb878f6221bed4f[team] = 0;
        var_c2344893389fa188[team] = 0;
    }
    scripts\cp_mp\vehicles\vehicle::vehicle_forceinit("veh9_jltv_mg");
    namespace_65ad5249b19d5d41::main();
    registersharedfunc("veh9_jltv_mg", "onDeathRespawn", &function_52a967cc33e0f447);
    vehiclecount = getdvarint(@"hash_bda20dac0244506b", 2);
    respawninterval = int(getdvarfloat(@"hash_6ff4efb459d8b415", 30) * 1000);
    foreach (team in level.teamnamelist) {
        scripts\mp\utility\dialog::statusdialog("vehicles_inc", team, 1);
        showsplashtoteam(team, "gwtdm_vehicles_inc");
    }
    wait 5;
    while (true) {
        currenttime = gettime();
        foreach (team in level.teamnamelist) {
            if (level.var_84c26a9fa39f7586[team] < vehiclecount) {
                if (var_c2344893389fa188[team] && currenttime < level.var_ebb878f6221bed4f[team] + respawninterval) {
                    continue;
                }
                randfrac = randomfloatrange(0, 1);
                randomorigin = vectorlerp(level.frontlinedata[level.var_48e03f24b9b5c1a].minpoint, level.frontlinedata[level.var_48e03f24b9b5c1a].maxpoint, randfrac);
                originhq = level.gw_objstruct.allieshqloc.trigger.origin;
                if (team == "axis") {
                    originhq = level.gw_objstruct.axishqloc.trigger.origin;
                }
                offsetdist = getdvarint(@"hash_345e75bc0b7aba35", 3000);
                offsetdir = vectornormalize(randomorigin - originhq);
                offset = offsetdir * offsetdist;
                randomorigin -= offset;
                trace = ray_trace(randomorigin, randomorigin - (0, 0, 100000));
                randomorigin = trace["position"];
                droplocation = findclosestdroplocation(randomorigin, 1);
                if (!isdefined(droplocation)) {
                    continue;
                }
                spawndata = spawnstruct();
                spawndata.origin = droplocation.origin + (0, 0, 100);
                spawndata.angles = droplocation.angles;
                spawndata.spawntype = "GAME_MODE";
                spawndata.var_b88b7b3c17715e3f = team;
                vehicle = namespace_801fa17f47560d76::function_66c684fea143fbfd("veh9_jltv_mg", spawndata);
                if (isdefined(vehicle)) {
                    level.var_84c26a9fa39f7586[team]++;
                    if (!var_c2344893389fa188[team] && level.var_84c26a9fa39f7586[team] == vehiclecount) {
                        var_c2344893389fa188[team] = 1;
                    }
                    level.var_ebb878f6221bed4f[team] = currenttime;
                    vehicle thread cleanupdroplocation(droplocation);
                }
            }
        }
        wait 1;
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf2a7
// Size: 0x420
function function_1b39d0ac099f112f() {
    level.var_fced0b6c61f6bb77 = [];
    level.var_4c529fa033fb6ae2 = [];
    var_c2344893389fa188 = [];
    foreach (team in level.teamnamelist) {
        level.var_fced0b6c61f6bb77[team] = 0;
        level.var_4c529fa033fb6ae2[team] = 0;
        var_c2344893389fa188[team] = 0;
    }
    vehiclecount = getdvarint(@"hash_d3a11571b804dcd2", 2);
    respawninterval = int(getdvarfloat(@"hash_bcca4bdb0041285a", 60) * 1000);
    foreach (team in level.teamnamelist) {
        scripts\mp\utility\dialog::statusdialog("vehicles2_inc", team, 1);
        showsplashtoteam(team, "gwtdm_vehicles2_inc");
    }
    wait 5;
    registersharedfunc("light_tank", "onDeathRespawn", &function_77ca7d0aa1a51384);
    while (true) {
        currenttime = gettime();
        foreach (team in level.teamnamelist) {
            if (level.var_fced0b6c61f6bb77[team] < vehiclecount) {
                if (var_c2344893389fa188[team] && currenttime < level.var_4c529fa033fb6ae2[team] + respawninterval) {
                    continue;
                }
                randfrac = randomfloatrange(0, 1);
                randomorigin = vectorlerp(level.frontlinedata[level.var_48e03f24b9b5c1a].minpoint, level.frontlinedata[level.var_48e03f24b9b5c1a].maxpoint, randfrac);
                originhq = level.gw_objstruct.allieshqloc.trigger.origin;
                if (team == "axis") {
                    originhq = level.gw_objstruct.axishqloc.trigger.origin;
                }
                offsetdist = getdvarint(@"hash_345e75bc0b7aba35", 3000);
                offsetdir = vectornormalize(randomorigin - originhq);
                offset = offsetdir * offsetdist;
                randomorigin -= offset;
                trace = ray_trace(randomorigin, randomorigin - (0, 0, 100000));
                randomorigin = trace["position"];
                droplocation = findclosestdroplocation(randomorigin, 1);
                if (!isdefined(droplocation)) {
                    continue;
                }
                spawndata = spawnstruct();
                spawndata.origin = droplocation.origin + (0, 0, 100);
                spawndata.angles = droplocation.angles;
                spawndata.spawntype = "GAME_MODE";
                spawndata.spawnmethod = "airdrop_at_position_unsafe";
                spawndata.var_b88b7b3c17715e3f = team;
                faildata = spawnstruct();
                vehicle = scripts\cp_mp\vehicles\vehicle::vehicle_spawn("light_tank", spawndata, faildata);
                if (isdefined(vehicle)) {
                    level.var_fced0b6c61f6bb77[team]++;
                    if (!var_c2344893389fa188[team] && level.var_fced0b6c61f6bb77[team] == vehiclecount) {
                        var_c2344893389fa188[team] = 1;
                    }
                    level.var_4c529fa033fb6ae2[team] = currenttime;
                    vehicle thread cleanupdroplocation(droplocation);
                    wait 5;
                }
            }
        }
        wait 1;
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf6cf
// Size: 0x47
function function_52a967cc33e0f447() {
    spawndata = scripts\cp_mp\vehicles\vehicle_tracking::getvehiclespawndata(self);
    if (isdefined(spawndata.var_6dc04302da1a9d03)) {
        spawndata = spawndata.var_6dc04302da1a9d03;
    }
    level.var_84c26a9fa39f7586[spawndata.var_b88b7b3c17715e3f]--;
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf71e
// Size: 0x47
function function_77ca7d0aa1a51384() {
    spawndata = scripts\cp_mp\vehicles\vehicle_tracking::getvehiclespawndata(self);
    if (isdefined(spawndata.var_6dc04302da1a9d03)) {
        spawndata = spawndata.var_6dc04302da1a9d03;
    }
    level.var_fced0b6c61f6bb77[spawndata.var_b88b7b3c17715e3f]--;
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf76d
// Size: 0x6b
function cleanupdroplocation(droplocation) {
    self waittill("landed");
    var_b9f3f0b165458920 = 262144;
    while (isdefined(self)) {
        distsq = distancesquared(self.origin, droplocation.origin);
        if (distsq > var_b9f3f0b165458920) {
            break;
        }
        wait 1;
    }
    droplocation.inuse = 0;
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xf7e0
// Size: 0x103
function function_7a5db011b55b3f21(numagents, reinforceorigin, team, delaymax) {
    heading = undefined;
    if (team == "allies") {
        heading = vectortoangles(level.frontlinedata[level.var_48e03f24b9b5c1a].maxpoint - level.frontlinedata[level.var_48e03f24b9b5c1a].minpoint);
    } else {
        heading = vectortoangles(level.frontlinedata[level.var_48e03f24b9b5c1a].minpoint - level.frontlinedata[level.var_48e03f24b9b5c1a].maxpoint);
    }
    wait randomfloat(delaymax);
    agents = level namespace_885300a47c2b51e6::function_55ab9c6da96226e7(numagents, reinforceorigin, undefined, undefined, "medium", "spawnHQ_" + team, "debug", team, undefined, undefined, heading, &function_c9e5e3858ab1805f, undefined, 1, level.agenttier);
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xf8eb
// Size: 0xe3
function function_93e7d3696caa5331(numagents, frontlinekey, team) {
    reinforceorigin = level.frontlinedata[frontlinekey].origin;
    originhq = level.gw_objstruct.allieshqloc.trigger.origin;
    if (team == "axis") {
        originhq = level.gw_objstruct.axishqloc.trigger.origin;
    }
    offsetdist = getdvarint(@"hash_7456a259db14a9a2", 3000);
    offset = vectornormalize(reinforceorigin - originhq) * offsetdist;
    reinforceorigin -= offset;
    level thread function_7a5db011b55b3f21(numagents, reinforceorigin, team, 4);
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf9d6
// Size: 0x39
function ac130_matchstart() {
    function_93e7d3696caa5331(14, level.var_48e03f24b9b5c1a, "axis");
    function_93e7d3696caa5331(14, level.var_48e03f24b9b5c1a, "allies");
    level thread function_37169a4fb87a0e3();
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfa17
// Size: 0x1b7
function function_37169a4fb87a0e3() {
    level endon("game_ended");
    percent_25 = level.scorelimit * 0.25;
    var_4b0036858d3bb806 = level.scorelimit * 0.5;
    percent_80 = level.scorelimit * 0.8;
    var_76650562e610d426 = 0;
    var_7fba03c049d4faba = 0;
    var_1acb94d12e9f55f3 = 0;
    var_2c7ad0c8251c8f9 = 0;
    var_427d285446343e15 = 0;
    var_977746fccdd041c8 = 0;
    while (true) {
        axisscore = scripts\mp\gamescore::_getteamscore("axis");
        alliesscore = scripts\mp\gamescore::_getteamscore("allies");
        if (axisscore >= percent_25 && !var_76650562e610d426) {
            function_93e7d3696caa5331(5, level.var_48e03f24b9b5c1a, "axis");
            var_76650562e610d426 = 1;
        } else if (axisscore > var_4b0036858d3bb806 && !var_7fba03c049d4faba) {
            var_7fba03c049d4faba = 1;
        } else if (axisscore > percent_80 && !var_1acb94d12e9f55f3) {
            function_93e7d3696caa5331(9, level.var_48e03f24b9b5c1a, "axis");
            var_1acb94d12e9f55f3 = 1;
        }
        if (alliesscore >= percent_25 && !var_2c7ad0c8251c8f9) {
            function_93e7d3696caa5331(5, level.var_48e03f24b9b5c1a, "allies");
            var_2c7ad0c8251c8f9 = 1;
        } else if (alliesscore > var_4b0036858d3bb806 && !var_427d285446343e15) {
            var_427d285446343e15 = 1;
        } else if (alliesscore > percent_80 && !var_977746fccdd041c8) {
            function_93e7d3696caa5331(9, level.var_48e03f24b9b5c1a, "allies");
            var_977746fccdd041c8 = 1;
        }
        if (var_76650562e610d426 && var_7fba03c049d4faba && var_1acb94d12e9f55f3 && var_2c7ad0c8251c8f9 && var_427d285446343e15 && var_977746fccdd041c8) {
            return;
        }
        wait 1;
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfbd6
// Size: 0xa4
function function_529a85d52f057f9b() {
    self endon("game_ended");
    while (true) {
        if (getdvarint(@"hash_46a6b424af6acbc2") != 0) {
            scripts\mp\gamescore::giveteamscoreforobjective("allies", getdvarint(@"hash_46a6b424af6acbc2"), 0);
            break;
        } else if (getdvarint(@"hash_86e14326e43c0115") != 0) {
            scripts\mp\gamescore::giveteamscoreforobjective("axis", getdvarint(@"hash_86e14326e43c0115"), 0);
            break;
        }
        wait 1;
    }
    /#
        setdevdvar(@"hash_46a6b424af6acbc2", 0);
        setdevdvar(@"hash_86e14326e43c0115", 0);
    #/
    thread function_529a85d52f057f9b();
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xfc82
// Size: 0x19b
function function_2da93e2a35e2182f(agent, team, frontlineindex, laneKey, var_3e332762c9138001) {
    if (!isalive(agent)) {
        return;
    }
    lanedata = level.frontlinedata[frontlineindex].lanedata[laneKey];
    if (isdefined(lanedata.frontvolume) && isdefined(lanedata.backvolume) && lanedata.frontvolume.size > 0 && lanedata.backvolume.size > 0) {
        if (istrue(agent.var_5966903b1e0154e5)) {
            volume = lanedata.frontvolume[getenemyteams(team)[0]];
        } else {
            volume = lanedata.backvolume[team];
        }
    } else {
        volume = level.frontlinedata[frontlineindex].lanedata[laneKey].coverzones[team][0].goalvolume;
    }
    angles = level.frontlinedata[frontlineindex].lanedata[laneKey].coverzones[team][0].angles;
    if (isdefined(volume)) {
        agent cleargoalvolume();
        agent setgoalvolumeauto(volume, volume.heading);
        agent.var_99f2752b6513c9dd = volume;
        if (!istrue(var_3e332762c9138001)) {
            level thread scripts\mp\ai_behavior::function_5d96b05a065564e(agent);
            agent thread function_55c73da3bc1275f7(agent);
        }
        return 1;
    }
    return 0;
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xfe26
// Size: 0x150
function function_6d1fed8dd6165391() {
    level endon("game_ended");
    level.var_ce3b5ef4c0b6019 = [];
    level.var_ce3b5ef4c0b6019["axis"] = [];
    level.var_ce3b5ef4c0b6019["allies"] = [];
    level.huntedplayers = [];
    while (!scripts\mp\flags::gameflag("prematch_done")) {
        waitframe();
    }
    flag_wait("frontline_data_init");
    scripts\mp\gamelogic::waitforplayers(level.prematchperiod, 0, 0);
    level thread function_6a6a92b892cf9e9a("axis");
    level thread function_6a6a92b892cf9e9a("allies");
    while (true) {
        foreach (player in level.players) {
            if (!isalive(player)) {
                continue;
            }
            playerentnum = player getentitynumber();
            if (isdefined(level.var_ce3b5ef4c0b6019[player.team][playerentnum])) {
                continue;
            }
            if (!isdefined(level.huntedplayers[playerentnum]) && function_6bc95c97ce75ae39(player)) {
                level.var_ce3b5ef4c0b6019[player.team][playerentnum] = player;
            }
        }
        wait 1;
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xff7e
// Size: 0x1eb
function function_6a6a92b892cf9e9a(team) {
    level endon("game_ended");
    enemyteam = getenemyteams(team)[0];
    while (true) {
        foreach (key, player in level.var_ce3b5ef4c0b6019[team]) {
            if (!isdefined(player) || !isalive(player)) {
                level.var_ce3b5ef4c0b6019[team][key] = undefined;
                continue;
            }
            agents = scripts\mp\utility\entity::function_d9ce8fb00f0e5fa1(player.origin, 5000, enemyteam);
            agents = sortbydistance(agents, player.origin);
            var_c5a227521b066bdd = [];
            foreach (agent in agents) {
                if (isplayer(agent)) {
                    continue;
                }
                if (var_c5a227521b066bdd.size >= 5) {
                    break;
                }
                if (istrue(agent.var_d0640290e2529307) || isdefined(agent.vehicle_position) && isint(agent.vehicle_position)) {
                    continue;
                }
                var_c5a227521b066bdd[var_c5a227521b066bdd.size] = agent;
            }
            if (var_c5a227521b066bdd.size > 0) {
                level.var_ce3b5ef4c0b6019[player.team][key] = undefined;
                level.huntedplayers[key] = player;
                foreach (agent in var_c5a227521b066bdd) {
                    function_b692eed7a70f888(player, agent);
                }
            }
        }
        wait 5;
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x10171
// Size: 0xa3
function function_b692eed7a70f888(player, agent) {
    agent cleargoalvolume();
    agent function_d955a85131dc6e69(player, 40);
    agent.var_d0640290e2529307 = 1;
    agent thread scripts\mp\ai_behavior::function_a5117518725da028(agent, player.origin, 8, 8, undefined, 1, undefined, 0, &function_f06be3ff9086a2ad, player);
    agent.previousbaseaccuracy = agent.baseaccuracy;
    agent.baseaccuracy += getdvarfloat(@"hash_67a1af3428021a00", 0.5);
    agent thread function_289c977b7523efba(agent, player);
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1021c
// Size: 0x46
function function_f06be3ff9086a2ad(agent, targetent) {
    if (istrue(agent.var_d0640290e2529307)) {
        agent thread scripts\mp\ai_behavior::function_a5117518725da028(agent, targetent.origin, 8, 8, undefined, 1, undefined, 0, &function_f06be3ff9086a2ad, targetent);
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1026a
// Size: 0x88
function function_289c977b7523efba(agent, player) {
    agent notify("endHuntTrackerTimer");
    level endon("game_ended");
    agent endon("death");
    agent endon("endHuntTrackerTimer");
    playerentnum = player getentitynumber();
    player waittill_notify_or_timeout("death", 20);
    level.huntedplayers[playerentnum] = undefined;
    agent.var_d0640290e2529307 = 0;
    agent.baseaccuracy = agent.previousbaseaccuracy;
    function_2aa208e2058474e5(agent);
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x102fa
// Size: 0x99
function function_c4232cf1e0949932(player) {
    frontlineorigin = level.frontlinedata[level.var_48e03f24b9b5c1a].origin;
    toorigin = vectornormalize(frontlineorigin - player.origin);
    dot = vectordot(level.spawnselectionteamforward[player.team], toorigin);
    if (vectordot(level.spawnselectionteamforward[player.team], toorigin) < 0) {
        return true;
    }
    return false;
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1039c
// Size: 0x155
function function_6bc95c97ce75ae39(player) {
    lanedata = level.frontlinedata[level.var_48e03f24b9b5c1a].lanedata[1];
    if (!isdefined(lanedata.backvolume) || lanedata.backvolume.size <= 0) {
        frontlineindex = level.var_48e03f24b9b5c1a;
        var_55dce045dcd7eba2 = level.frontlinedata[level.var_48e03f24b9b5c1a].lanedata[1].coverzones[player.team][0].goalvolume.origin;
    } else {
        var_55dce045dcd7eba2 = lanedata.backvolume[getenemyteams(player.team)[0]].origin;
    }
    toorigin = vectornormalize(var_55dce045dcd7eba2 - player.origin);
    dot = vectordot(level.spawnselectionteamforward[player.team], toorigin);
    if (vectordot(level.spawnselectionteamforward[player.team], toorigin) < 0) {
        return true;
    }
    return false;
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x104fa
// Size: 0x263
function function_ae56674143e0ec69() {
    namespace_bfef6903bca5845d::function_2fc80954fa70d153();
    while (true) {
        axiscount = 0;
        alliescount = 0;
        foreach (agent in level.agentarray) {
            if (isalive(agent)) {
                color = (0, 1, 0);
                if (agent.team == "axis") {
                    color = (1, 0, 0);
                    axiscount++;
                } else {
                    alliescount++;
                }
                thread drawsphere(agent.origin, 32, 0.05, color);
                if (istrue(agent.var_d0640290e2529307)) {
                    thread drawsphere(agent.origin, 42, 0.05, (1, 0, 1));
                }
                if (istrue(agent.var_5966903b1e0154e5)) {
                    thread drawsphere(agent.origin, 52, 0.05, (1, 1, 1));
                }
            }
        }
        /#
            printtoscreen2d(300, 50, "<dev string:x2ac>" + axiscount, (0, 0, 1), 2.5, 1);
            printtoscreen2d(300, 100, "<dev string:x2bc>" + alliescount, (0, 0, 1), 2.5, 1);
            line(level.frontlinedata[level.var_48e03f24b9b5c1a].lanedata[0].origin, level.frontlinedata[level.var_48e03f24b9b5c1a].lanedata[1].origin, (0, 1, 0));
            line(level.frontlinedata[level.var_48e03f24b9b5c1a].lanedata[1].origin, level.frontlinedata[level.var_48e03f24b9b5c1a].lanedata[2].origin, (0, 1, 0));
        #/
        waitframe();
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10765
// Size: 0x102
function function_a999b4ee6f415e8c() {
    self endon("game_ended");
    namespace_bfef6903bca5845d::function_2fc80954fa70d153();
    while (true) {
        foreach (agent in level.agentarray) {
            if (isalive(agent) && !istrue(agent.var_d0640290e2529307)) {
                if (isdefined(agent.vehicle_position) && isint(agent.vehicle_position)) {
                    continue;
                }
                if (isdefined(agent.landing_spot)) {
                    continue;
                }
                laneKey = namespace_14d36171baccf528::agentpers_getagentpersdata(agent, "laneKey");
                if (isdefined(laneKey)) {
                    if (istrue(agent.var_a8a165c3323bda48)) {
                        continue;
                    }
                    function_2da93e2a35e2182f(agent, agent.team, level.var_48e03f24b9b5c1a, laneKey);
                }
            }
        }
        wait 5;
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1086f
// Size: 0x1c6
function function_c1313bf26d803678(team) {
    self endon("game_ended");
    level notify("resetAgentVolumeMovementThink" + team);
    level endon("resetAgentVolumeMovementThink" + team);
    namespace_bfef6903bca5845d::function_2fc80954fa70d153();
    flag_wait("frontline_data_init");
    wait 5;
    while (true) {
        agentpicked = 0;
        level.var_3bf1cf107e60e048[team] = array_randomize(level.var_3bf1cf107e60e048[team]);
        foreach (index, agent in level.var_3bf1cf107e60e048[team]) {
            if (isalive(agent) && !isdefined(agent.vehicle) && (istrue(agent.var_a8a165c3323bda48) || !istrue(function_47d612d4d655f75d(agent)))) {
                function_fd1ef087d4a56d19(agent, team, index);
                agentpicked = 1;
                break;
            }
        }
        if (!istrue(agentpicked)) {
            foreach (index, agent in level.var_3bf1cf107e60e048[team]) {
                if (isalive(agent) && !isdefined(agent.vehicle) && !istrue(function_47d612d4d655f75d(agent))) {
                    level.var_3bf1cf107e60e048[team][index] = undefined;
                    level.var_9de3c802fced05e2[team][level.var_9de3c802fced05e2[team].size] = agent;
                    agent.var_5966903b1e0154e5 = 1;
                    agent playsoundtoteam("mp_walla_invasion_charge_individual", agent.team);
                    function_2aa208e2058474e5(agent);
                    break;
                }
            }
        }
        wait randomfloatrange(4, 7);
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x10a3d
// Size: 0xa2
function function_fd1ef087d4a56d19(agent, team, var_9ba14084cc963aa1) {
    agent.var_a8a165c3323bda48 = 0;
    if (isdefined(var_9ba14084cc963aa1)) {
        level.var_3bf1cf107e60e048[team][var_9ba14084cc963aa1] = undefined;
    } else {
        level.var_3bf1cf107e60e048[team] = array_remove(level.var_3bf1cf107e60e048[team], agent);
    }
    level.var_9de3c802fced05e2[team][level.var_9de3c802fced05e2[team].size] = agent;
    agent.var_5966903b1e0154e5 = 1;
    agent playsoundtoteam("mp_walla_invasion_charge_individual", agent.team);
    function_2aa208e2058474e5(agent);
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10ae7
// Size: 0x5c
function function_47d612d4d655f75d(agent) {
    if (!isalive(agent) || !isdefined(agent.agent_type)) {
        return undefined;
    }
    if (issubstr(agent.agent_type, "rpg") || issubstr(agent.agent_type, "sniper")) {
        return 1;
    }
    return 0;
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10b4c
// Size: 0x26d
function function_7f995b3e1538a773() {
    level.introscene = [];
    level.introscene["axis"] = [];
    level.introscene["allies"] = [];
    var_5352a7311a690a33 = getstructarray("intro_scene_axis", "script_noteworthy");
    foreach (intronode in var_5352a7311a690a33) {
        spawnerlocs = getstructarray(intronode.target, "targetname");
        foreach (loc in spawnerlocs) {
            script_noteworthy = tolower(loc.script_noteworthy);
            if (isdefined(script_noteworthy) && !isdefined(level.introscene["axis"][script_noteworthy])) {
                level.introscene["axis"][script_noteworthy] = [];
            }
            level.introscene["axis"][script_noteworthy][level.introscene["axis"][script_noteworthy].size] = loc;
        }
    }
    var_494169afc61a508 = getstructarray("intro_scene_allies", "script_noteworthy");
    foreach (intronode in var_494169afc61a508) {
        spawnerlocs = getstructarray(intronode.target, "targetname");
        foreach (loc in spawnerlocs) {
            script_noteworthy = tolower(loc.script_noteworthy);
            if (isdefined(script_noteworthy) && !isdefined(level.introscene["allies"][script_noteworthy])) {
                level.introscene["allies"][script_noteworthy] = [];
            }
            level.introscene["allies"][script_noteworthy][level.introscene["allies"][script_noteworthy].size] = loc;
        }
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10dc1
// Size: 0x2be
function function_fdc34e092fe389c8() {
    namespace_bfef6903bca5845d::function_2fc80954fa70d153();
    waitframe();
    foreach (posename, var_75f30b91d39c93d in level.introscene["axis"]) {
        foreach (poseloc in var_75f30b91d39c93d) {
            var_eca35527d55ec10e = function_d7fcf73c5cf90be1(posename);
            delayoffsettime = var_eca35527d55ec10e[2];
            rotationoffset = var_eca35527d55ec10e[1];
            capname = var_eca35527d55ec10e[0];
            var_b5b1784d5a1327c7 = "spawnHQ_axis";
            aitype = namespace_bfef6903bca5845d::function_d5bc07eabf352abb(undefined, undefined, "guard", undefined, level.agenttier, level.teamnationality["axis"]);
            origin = getclosestpointonnavmesh(poseloc.origin);
            agent = namespace_bfef6903bca5845d::ai_mp_requestspawnagent(aitype, origin, poseloc.angles + rotationoffset, "medium", var_b5b1784d5a1327c7, undefined, undefined, "axis", undefined, undefined, 1);
            if (isalive(agent)) {
                agent thread function_6c7668729d88ed55(agent, capname, "intro_cap_complete", delayoffsettime);
                agent thread function_8c8977b452f6a8a(agent);
            }
        }
    }
    foreach (posename, var_75f30b91d39c93d in level.introscene["allies"]) {
        foreach (poseloc in var_75f30b91d39c93d) {
            var_ecb05d27d56ce72b = function_d7fcf73c5cf90be1(posename);
            delayoffsettime = var_ecb05d27d56ce72b[2];
            rotationoffset = var_ecb05d27d56ce72b[1];
            capname = var_ecb05d27d56ce72b[0];
            var_b5b1784d5a1327c7 = "spawnHQ_allies";
            aitype = namespace_bfef6903bca5845d::function_d5bc07eabf352abb(undefined, undefined, "guard", undefined, level.agenttier, level.teamnationality["allies"]);
            origin = getclosestpointonnavmesh(poseloc.origin);
            agent = namespace_bfef6903bca5845d::ai_mp_requestspawnagent(aitype, origin, poseloc.angles + rotationoffset, "medium", var_b5b1784d5a1327c7, undefined, undefined, "allies", undefined, undefined, 1);
            if (isalive(agent)) {
                agent thread function_6c7668729d88ed55(agent, capname, "intro_cap_complete", delayoffsettime);
                agent thread function_8c8977b452f6a8a(agent);
            }
        }
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11087
// Size: 0x11c
function function_d7fcf73c5cf90be1(posename) {
    capname = undefined;
    rotationoffset = (0, 0, 0);
    delayoffsettime = 6 + randomfloatrange(-0.75, 0.75);
    switch (posename) {
    case #"hash_d8c4e5876be97da": 
        capname = "caps/mp/rebel_peptalk_01";
        break;
    case #"hash_d8c4d5876be9647": 
        capname = "caps/mp/rebel_peptalk_01";
        break;
    case #"hash_d8c4c5876be94b4": 
        capname = "caps/mp/rebel_peptalk_01";
        break;
    case #"hash_d8c4b5876be9321": 
        capname = "caps/mp/rebel_peptalk_04";
        break;
    case #"hash_4059cfe6b7ea61be": 
        capname = "caps/mp/rebel_stand_05";
        rotationoffset = (0, -90, 0);
        break;
    case #"hash_4059cee6b7ea602b": 
        capname = "caps/mp/rebel_stand_02";
        rotationoffset = (0, -90, 0);
        break;
    case #"hash_3476ad55eb745a44": 
        capname = "caps/mp/rebel_peptalk_leader";
        break;
    }
    return [capname, rotationoffset, delayoffsettime];
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x111ac
// Size: 0xf6
function function_6c7668729d88ed55(agent, capname, var_610be4afa05a30cb, delayoffsettime) {
    if (!isdefined(capname)) {
        capname = "caps/mp/rebel_peptalk_01";
    }
    namespace_14d36171baccf528::agentpers_setagentpersdata(agent, "team", agent.team);
    waitframe();
    agent thread scripts\common\cap::cap_start("cap_single", capname);
    waittime = 3;
    if (level.prematchperiodend > 0) {
        level waittill("match_start_real_countdown");
        waittime = level.prematchperiodend - delayoffsettime;
        waittime = ter_op(0 < waittime, waittime, 0);
    }
    wait waittime;
    agent.exitcap = 1;
    remainingtime = 7;
    randomtime = randomfloatrange(4, 6);
    wait randomtime;
    playsoundatpos(agent.origin, "mp_walla_invasion_charge_individual");
    wait remainingtime - randomtime;
    agent scripts\common\cap::cap_exit();
    agent notify(var_610be4afa05a30cb);
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x112aa
// Size: 0xd1
function function_8c8977b452f6a8a(agent) {
    if (agent.team == "allies") {
        artpair = level.var_df2344c49d981562[agent.team][randomint(level.var_df2344c49d981562[agent.team].size)];
        agent namespace_14d36171baccf528::function_c37c4f9d687074ff(artpair.body, artpair.head);
        agent.var_76f8ddb1563464bd = 1;
    }
    agent waittill("intro_cap_complete");
    laneKey = namespace_fab382c89d62fd63::function_b983381333b3881b(agent.origin);
    namespace_fab382c89d62fd63::function_2da93e2a35e2182f(agent, agent.team, level.var_48e03f24b9b5c1a, laneKey);
    namespace_fab382c89d62fd63::overrideagent(agent, laneKey);
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11383
// Size: 0x3b4
function function_2b4958acf92594e3() {
    while (!istrue(level.var_1091b5d43ba7a905)) {
        waitframe();
    }
    foreach (team in level.teamnamelist) {
        frontlineorigin = (0, 0, 0);
        foreach (lanedata in level.frontlinedata[level.var_48e03f24b9b5c1a].lanedata) {
            frontlineorigin += lanedata.origin;
        }
        frontlineorigin /= level.frontlinedata[level.var_48e03f24b9b5c1a].lanedata.size;
        if (team == "allies") {
            forward = level.spawnselectionteamforward["allies"] * -1;
        } else {
            forward = level.spawnselectionteamforward["axis"] * -1;
        }
        offsetdist = getdvarint(@"hash_25e538731b72b1b4", 10000);
        height = getdvarint(@"hash_b78ef73b0670b310", 2000);
        camerapos = frontlineorigin + forward * offsetdist;
        trace = ray_trace(camerapos + (0, 0, 10000), camerapos - (0, 0, 20000));
        if (trace["hittype"] == "hittype_none") {
            camerapos = (camerapos[0], camerapos[1], scripts\mp\spawncamera::getstartspawnavg(team)[2]) + (0, 0, height);
        } else if (trace["position"][2] < scripts\mp\spawncamera::getstartspawnavg(team)[2]) {
            camerapos = (camerapos[0], camerapos[1], scripts\mp\spawncamera::getstartspawnavg(team)[2]) + (0, 0, height);
        } else {
            camerapos = trace["position"] + (0, 0, height);
        }
        toground = vectornormalize(frontlineorigin - camerapos);
        cameraang = vectortoanglessafe(toground, (0, 0, 1));
        level.spawncameras["default"][team].origin = camerapos;
        level.spawncameras["default"][team].angles = cameraang;
        var_28d7c5ca5ba161e1 = getdvarint(@"hash_a66b78681b2d0805", 4096);
        hintpos = frontlineorigin + forward * var_28d7c5ca5ba161e1;
        hintpos = drop_to_ground(hintpos);
        level.spawncameras["default"][team].var_6930961c8a8d33fc = hintpos;
        if (getdvarint(@"hash_13fae9c305971d06", 0) == 1) {
            color = (1, 0, 0);
            if (team == "allies") {
                color = (0, 0, 1);
            }
            thread drawline(camerapos + (0, 0, 10000), camerapos - (0, 0, 20000), 60, (1, 1, 0));
            thread drawsphere(camerapos, 100, 60, color);
            thread drawline(camerapos, frontlineorigin, 60, color);
            thread drawline(camerapos, hintpos, 60, (0, 1, 0));
        }
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1173f
// Size: 0xb6
function function_4fa7b02d1bbe565e(splashdelay) {
    level.agenttier = 2;
    if (!isdefined(splashdelay)) {
        splashdelay = 0;
    }
    wait splashdelay;
    foreach (team in level.teamnamelist) {
        scripts\mp\utility\dialog::statusdialog("tier2_friendly", team, 1);
        showsplashtoteam(team, "gwtdm_tier2_agents_inc");
    }
    function_93e7d3696caa5331(7, level.var_48e03f24b9b5c1a, "axis");
    function_93e7d3696caa5331(7, level.var_48e03f24b9b5c1a, "allies");
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x117fd
// Size: 0x88
function function_4fa7b12d1bbe5891(splashdelay) {
    level.agenttier = 3;
    if (!isdefined(splashdelay)) {
        splashdelay = 0;
    }
    wait splashdelay;
    foreach (team in level.teamnamelist) {
        scripts\mp\utility\dialog::statusdialog("tier3_friendly", team, 1);
        showsplashtoteam(team, "gwtdm_tier3_agents_inc");
    }
}

// Namespace gwtdm / namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1188d
// Size: 0x44
function onplayerconnectstream() {
    if (!isdefined(self.sessionteam) || self.sessionteam == "spectator" || self.sessionteam == "none" || self isplayerheadless()) {
        return false;
    }
    return true;
}

