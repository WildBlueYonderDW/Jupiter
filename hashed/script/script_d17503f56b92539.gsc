// mwiii decomp prototype
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
#using script_27c2db69a21775a0;
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
#using script_120270bd0a747a35;
#using scripts\mp\outofbounds.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\gamelogic.gsc;
#using script_10b6724c15a95e8;
#using script_7e7fd8191bd7be26;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using script_36967ce8ee2ea745;
#using script_721ee99d7a8f9168;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using script_d17503f56b92539;

#namespace gwtdm;

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b40
// Size: 0xa71
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
    setdvar(@"hash_e4fa721677f03de0", 1);
    setdvar(@"hash_cbc195ec2129279", 0);
    enablegroundwarspawnlogic(400, 1200);
    updategametypedvars();
    namespace_1309ce202b9aa92b::registeronplayerjointeamcallback(&onjoinedteam);
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
    level.var_61312c4c9c8a7cae = [0:"thermite_mp", 1:"semtex_mp", 2:"frag_grenade_mp", 3:"jup_smoke_grenade_mp", 4:"concussion_grenade_mp", 5:"flash_grenade_mp", 6:"snapshot_grenade_mp", 7:"gas_mp", 8:"decoy_grenade_mp"];
    level.var_39643776a698efce = &function_39643776a698efce;
    level.requiredplayercountoveride = 1;
    level.requiredplayercount["allies"] = 24;
    level.requiredplayercount["axis"] = 24;
    level.var_e637d49948a038d3 = &getmissedinfilcamerapositions;
    level.var_3c89983e2030dfff = &calculatecameraoffset;
    game["dialog"]["gametype"] = "dx_mp_gwtd_game_mili_gtnm";
    if (getdvarint(@"hash_4a2b3d01a81655a6")) {
        game["dialog"]["gametype"] = "dh_" + game["dialog"]["gametype"];
    } else if (getdvarint(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_promode"))) {
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
    level.var_a98a9986264d0efc = getdvarint(@"hash_6228446f42d1367f", 1) == 1;
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
        level thread function_b44b7980350b1db1();
    #/
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25b8
// Size: 0x10a
function function_39643776a698efce(tier) {
    switch (tier) {
    case 1:
        return random([0:"semtex_mp", 1:"frag_grenade_mp", 2:"gas_mp"]);
    case 2:
        return random([0:"semtex_mp", 1:"frag_grenade_mp", 2:"jup_smoke_grenade_mp", 3:"concussion_grenade_mp", 4:"flash_grenade_mp", 5:"gas_mp", 6:"decoy_grenade_mp"]);
    case 3:
        return random([0:"thermite_mp", 1:"semtex_mp", 2:"frag_grenade_mp", 3:"jup_smoke_grenade_mp", 4:"concussion_grenade_mp", 5:"flash_grenade_mp", 6:"snapshot_grenade_mp", 7:"gas_mp", 8:"decoy_grenade_mp"]);
    default:
        return undefined;
        break;
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x26c9
// Size: 0xb8
function function_b44b7980350b1db1() {
    while (1) {
        foreach (t in getnodearray("traverse", "targetname")) {
            if (issubstr(t.animscript, "jump_")) {
                /#
                    line(t.origin, t.origin + (0, 0, 1024), (1, 0, 0), 1, 0, 150);
                #/
            }
        }
        wait(5);
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2788
// Size: 0xe9
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

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2878
// Size: 0x360
function onstartgametype() {
    flag_init("frontline_data_init");
    if (!isdefined(game["switchedsides"])) {
        game["switchedsides"] = 0;
    }
    foreach (team in level.teamnamelist) {
        namespace_cd0b2d039510b38d::setobjectivehinttext(team, "OBJECTIVES/GWTDM_HINT");
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
    level.killstreaklist[4] = [0:"cruise_predator", 1:"scrambler_drone_guard"];
    level.killstreaklist[3] = [0:"precision_airstrike", 1:"multi_airstrike", 2:"bradley"];
    level.killstreaklist[2] = [0:"toma_strike", 1:"chopper_gunner", 2:"pac_sentry", 3:"gunship"];
    level.teamkillstreakqueue["allies"] = [0:"cruise_predator", 1:"precision_airstrike", 2:"cruise_predator"];
    level.teamkillstreakqueue["axis"] = [0:"cruise_predator", 1:"precision_airstrike", 2:"cruise_predator"];
    level thread setupwaypointicons();
    calculatehqmidpoint();
    sethqmarkerobjective();
    if (level.usespawnselection) {
        level thread function_84ffed4ec1563259();
    }
    if (istrue(level.userallypointvehicles)) {
        namespace_fdd1a79841ab3fe7::init();
        level thread init_rallyvehicles();
    }
    level.numhqtanks_axis = 0;
    level.numhqtanks_allies = 0;
    level.maxhqtanks = 0;
    thread function_417194d265d63273();
    level thread namespace_8e28f8b325a83325::updatefobindanger();
    namespace_944ddf7b8df1b0e3::initstatusdialog();
    emergency_cleanupents();
    level thread function_aabaace9c798a2e1();
    if (getdvarint(@"hash_248a817b330f8bea", 1) == 1) {
        level function_e2ad02be26ba3879();
    }
    namespace_5078ee98abb32db9::initparachutedvars();
    level thread namespace_885300a47c2b51e6::function_ca39a413ace3c168();
    level thread namespace_7ae25d9e5d5a28ef::function_d0ffcd08e0870cf2();
    if (getdvarint(@"hash_48d28ba522840d33", 1) == 1) {
        level thread function_f16652e1462a3739();
    }
    if (getdvarint(@"hash_289d6da5e0aff476", 1) == 1) {
        level.var_4eb71f2b8cba5cb = &function_6b1cbd26d1b252b4;
        level thread function_6ad69ddd2454e5b3();
    }
    level thread function_6d1fed8dd6165391();
    level thread function_a999b4ee6f415e8c();
    if (level.frontlineData[0].var_a2d0446bc9b000ab[0].var_e59f791d76c7beee.size > 0) {
        level thread function_c1313bf26d803678("axis");
        level thread function_c1313bf26d803678("allies");
    }
    level thread function_4baf8b94714b68fe();
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bdf
// Size: 0x180
function updategametypedvars() {
    namespace_310ba947928891df::updatecommongametypedvars();
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
    level.var_55328518d6fb7d07 = dvarintvalue("pointsperkill_ai", 1, 0, 10);
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d66
// Size: 0x3
function seticonnames() {
    
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d70
// Size: 0x312
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

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3089
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

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31c5
// Size: 0xc
function onjoinedteam(player) {
    
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31d8
// Size: 0x37
function debug_setupmatchdata() {
    level.var_6121d66ffc5b8ec9 = [];
    level.var_6121d66ffc5b8ec9["axis"] = "gw_fob_axisHQ";
    level.var_6121d66ffc5b8ec9["allies"] = "gw_fob_alliesHQ";
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3216
// Size: 0x120
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

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x333d
// Size: 0xf5
function setuphqs() {
    level.gw_objstruct = spawnstruct();
    level.gw_objstruct.axishqloc = spawnstruct();
    level.gw_objstruct.axishqloc.trigger = namespace_36f464722d326bbe::getlocaleent(level.var_6121d66ffc5b8ec9["axis"]);
    if (!isdefined(level.gw_objstruct.axishqloc)) {
        /#
            assert(0, "Ground War: Axis base not found.");
        #/
    }
    level.gw_objstruct.allieshqloc = spawnstruct();
    level.gw_objstruct.allieshqloc.trigger = namespace_36f464722d326bbe::getlocaleent(level.var_6121d66ffc5b8ec9["allies"]);
    if (!isdefined(level.gw_objstruct.allieshqloc)) {
        /#
            assert(0, "Ground War: Allies base not found.");
        #/
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3439
// Size: 0x1e0
function function_84ffed4ec1563259(var_aa030029a5b16ae5) {
    level.spawnareas = [];
    foreach (entry in level.teamnamelist) {
        level.spawnareas[entry] = [0:level.var_6121d66ffc5b8ec9[entry]];
    }
    namespace_8e28f8b325a83325::setspawnlocations(level.spawnareas["axis"], "axis");
    namespace_8e28f8b325a83325::setspawnlocations(level.spawnareas["allies"], "allies");
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

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3620
// Size: 0x229
function objective_manageobjectivesintrovisibility() {
    wait(1);
    namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(level.gw_objstruct.axishqloc.marker.objidnum);
    namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(level.gw_objstruct.allieshqloc.marker.objidnum);
    namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(level.gw_objstruct.axishqloc.enemymarker.objidnum);
    namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(level.gw_objstruct.allieshqloc.enemymarker.objidnum);
    if (isdefined(level.rallypointvehicles)) {
        foreach (rallypoint in level.rallypointvehicles) {
            namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(rallypoint.marker.objidnum);
        }
    }
    while (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        waitframe();
    }
    namespace_5a22b6f3a56f7e9b::objective_teammask_addtomask(level.gw_objstruct.axishqloc.marker.objidnum, "axis");
    namespace_5a22b6f3a56f7e9b::objective_teammask_addtomask(level.gw_objstruct.allieshqloc.marker.objidnum, "allies");
    if (isdefined(level.rallypointvehicles)) {
        foreach (rallypoint in level.rallypointvehicles) {
            if (isdefined(rallypoint)) {
                namespace_5a22b6f3a56f7e9b::objective_teammask_addtomask(rallypoint.marker.objidnum, rallypoint.team);
            }
        }
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3850
// Size: 0x10b
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
        keys = [0:"gw_fob_alliesHQ", 1:"_d", 2:"_e", 3:"_f"];
    } else {
        keys = [0:"default"];
    }
    namespace_d7fe36703a9572fe::function_71a2a6a6f52ab30b(keys, team, forward, -8500, 7000);
    team = "axis";
    forward = level.spawnselectionteamforward[team];
    if (istrue(level.usespawnselection)) {
        keys = [0:"gw_fob_axisHQ", 1:"_a", 2:"_b", 3:"_c"];
    } else {
        keys = [0:"default"];
    }
    namespace_d7fe36703a9572fe::function_71a2a6a6f52ab30b(keys, team, forward, -8500, 7000);
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3962
// Size: 0x4fd
function sethqmarkerobjective() {
    visibility = "any";
    origin = level.gw_objstruct.axishqloc.trigger.origin;
    marker = namespace_19b4203b51d56488::createobjidobject(origin, "neutral", (0, 0, 0), undefined, visibility, 0);
    namespace_5a22b6f3a56f7e9b::update_objective_ownerteam(marker.objidnum, "axis");
    namespace_5a22b6f3a56f7e9b::objective_teammask_addtomask(marker.objidnum, "axis");
    namespace_5a22b6f3a56f7e9b::objective_set_play_intro(marker.objidnum, 0);
    marker.lockupdatingicons = 0;
    namespace_5a22b6f3a56f7e9b::objective_pin_global(marker.objidnum, 0);
    namespace_5a22b6f3a56f7e9b::update_objective_icon(marker.objidnum, "icon_waypoint_hq_friendly");
    namespace_5a22b6f3a56f7e9b::update_objective_setbackground(marker.objidnum, 6);
    marker.lockupdatingicons = 1;
    level.gw_objstruct.axishqloc.marker = marker;
    level.uncapturableobjectives[level.uncapturableobjectives.size] = marker;
    marker = namespace_19b4203b51d56488::createobjidobject(origin, "neutral", (0, 0, 0), undefined, visibility, 0);
    namespace_5a22b6f3a56f7e9b::update_objective_ownerteam(marker.objidnum, "axis");
    namespace_5a22b6f3a56f7e9b::objective_teammask_addtomask(marker.objidnum, "allies");
    namespace_5a22b6f3a56f7e9b::objective_set_play_intro(marker.objidnum, 0);
    marker.lockupdatingicons = 0;
    namespace_5a22b6f3a56f7e9b::objective_pin_global(marker.objidnum, 0);
    namespace_5a22b6f3a56f7e9b::update_objective_icon(marker.objidnum, "icon_waypoint_hq_enemy");
    namespace_5a22b6f3a56f7e9b::update_objective_setbackground(marker.objidnum, 7);
    marker.lockupdatingicons = 1;
    level.gw_objstruct.axishqloc.enemymarker = marker;
    level.uncapturableobjectives[level.uncapturableobjectives.size] = marker;
    origin = level.gw_objstruct.allieshqloc.trigger.origin;
    marker = namespace_19b4203b51d56488::createobjidobject(origin, "neutral", (0, 0, 0), undefined, visibility, 0);
    namespace_5a22b6f3a56f7e9b::update_objective_ownerteam(marker.objidnum, "allies");
    namespace_5a22b6f3a56f7e9b::objective_teammask_addtomask(marker.objidnum, "allies");
    namespace_5a22b6f3a56f7e9b::objective_set_play_intro(marker.objidnum, 0);
    marker.lockupdatingicons = 0;
    namespace_5a22b6f3a56f7e9b::objective_pin_global(marker.objidnum, 0);
    namespace_5a22b6f3a56f7e9b::update_objective_icon(marker.objidnum, "icon_waypoint_hq_friendly");
    namespace_5a22b6f3a56f7e9b::update_objective_setbackground(marker.objidnum, 6);
    marker.lockupdatingicons = 1;
    level.gw_objstruct.allieshqloc.marker = marker;
    level.uncapturableobjectives[level.uncapturableobjectives.size] = marker;
    marker = namespace_19b4203b51d56488::createobjidobject(origin, "neutral", (0, 0, 0), undefined, visibility, 0);
    namespace_5a22b6f3a56f7e9b::update_objective_ownerteam(marker.objidnum, "allies");
    namespace_5a22b6f3a56f7e9b::objective_teammask_addtomask(marker.objidnum, "axis");
    namespace_5a22b6f3a56f7e9b::objective_set_play_intro(marker.objidnum, 0);
    marker.lockupdatingicons = 0;
    namespace_5a22b6f3a56f7e9b::objective_pin_global(marker.objidnum, 0);
    namespace_5a22b6f3a56f7e9b::update_objective_icon(marker.objidnum, "icon_waypoint_hq_enemy");
    namespace_5a22b6f3a56f7e9b::update_objective_setbackground(marker.objidnum, 7);
    marker.lockupdatingicons = 1;
    level.gw_objstruct.allieshqloc.enemymarker = marker;
    level.uncapturableobjectives[level.uncapturableobjectives.size] = marker;
    level.spawnselectionteamforward = [];
    level.spawnselectionteamforward["allies"] = vectornormalize(level.gw_objstruct.axishqloc.trigger.origin - level.gw_objstruct.allieshqloc.trigger.origin);
    level.spawnselectionteamforward["axis"] = vectornormalize(level.gw_objstruct.allieshqloc.trigger.origin - level.gw_objstruct.axishqloc.trigger.origin);
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x3e66
// Size: 0x47
function dropcrate(killstreakname, droplocation, team) {
    crate = namespace_6c578d6ef48f10ef::function_99cc30ea8be5b2a6(team, killstreakname, droplocation.origin, (0, randomint(360), 0), undefined);
    return crate;
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3eb5
// Size: 0xec
function docratedropsmoke(crate, droplocation, duration) {
    var_e0d03a39e88dff15 = droplocation + (0, 0, 2000);
    spawnpos = utility::groundpos(var_e0d03a39e88dff15, (0, 0, 1));
    vfxent = spawn("script_model", spawnpos);
    vfxent setmodel("tag_origin");
    vfxent.angles = (0, 0, 0);
    vfxent playloopsound("smoke_carepackage_smoke_lp");
    wait(1);
    playfxontag(getfx("vfx_smk_signal_gr"), vfxent, "tag_origin");
    if (isdefined(crate)) {
        crate waittill_any_timeout_1(duration, "crate_dropped");
    } else {
        wait(duration);
    }
    stopfxontag(getfx("vfx_smk_signal_gr"), vfxent, "tag_origin");
    vfxent delete();
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fa8
// Size: 0x20d
function function_e2ad02be26ba3879() {
    level.var_98f1f016587a9593 = [];
    locs = getstructarray("carepackage_loc", "targetname");
    foreach (loc in locs) {
        struct = spawnstruct();
        struct.origin = loc.origin;
        struct.angles = loc.angles;
        struct.inuse = 0;
        struct.var_a9e5b4cd62871172 = 0;
        if (isdefined(loc.script_noteworthy) && loc.script_noteworthy == "noVehicleDrop") {
            struct.var_a9e5b4cd62871172 = 1;
        }
        /#
            if (getdvarint(@"hash_1af6b48d9e65d84c", 0) == 1) {
                color = (0, 1, 0);
                if (struct.var_a9e5b4cd62871172) {
                    color = (1, 0, 0);
                }
                print3d(struct.origin, "dx_mp_gwtd_game_uktl_gtpo" + struct.origin[0] + "gwtdm_fall_back" + struct.origin[1] + "gwtdm_fall_back" + struct.origin[2] + "dx_mp_gwtd_game_uktl_lo25", (1, 1, 1), 1, 1, 9999, 1);
                thread drawsphere(struct.origin, 128, 9999, color);
                thread drawline(struct.origin, struct.origin + (0, 0, 2000), 9999, color);
            }
        #/
        level.var_98f1f016587a9593[level.var_98f1f016587a9593.size] = struct;
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41bc
// Size: 0x1fe
function killstreakCrateLoop() {
    level endon("game_ended");
    level notify("killstreakCrateLoop");
    level endon("killstreakCrateLoop");
    level.var_cbb5fb5077bac26d = 0;
    while (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        waitframe();
    }
    interval = getdvarint(@"hash_25b96a647e40df81", 120);
    var_fb197850ee0f47a0 = getdvarint(@"hash_4220024cbeafaee2", 1) == 1;
    while (1) {
        foreach (team in level.teamnamelist) {
            namespace_944ddf7b8df1b0e3::statusdialog("carepackage_inc", team, 1);
            showsplashtoteam(team, "gwtdm_carepackage_inc");
        }
        if (!var_fb197850ee0f47a0) {
            dropkillstreakcrate();
        } else {
            data = level.frontlineData[level.var_48e03f24b9b5c1a];
            for (laneKey = 0; laneKey < data.var_a2d0446bc9b000ab.size; laneKey++) {
                var_a2d0446bc9b000ab = data.var_a2d0446bc9b000ab[laneKey];
                if (level.var_48e03f24b9b5c1a < level.var_272b2716f1938412 && function_489262584e53d09b("axis")) {
                    droporigin = var_a2d0446bc9b000ab.var_e59f791d76c7beee["axis"].origin;
                } else if (level.var_48e03f24b9b5c1a > level.var_272b2716f1938412 && function_489262584e53d09b("allies")) {
                    droporigin = var_a2d0446bc9b000ab.var_e59f791d76c7beee["allies"].origin;
                } else {
                    droporigin = var_a2d0446bc9b000ab.origin;
                }
                dropkillstreakcrate(droporigin);
                wait(randomintrange(5, 8));
            }
        }
        wait(interval);
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43c1
// Size: 0x6c
function function_489262584e53d09b(var_7e441f99479e9b56) {
    axisscore = getteamscore("axis");
    alliesscore = getteamscore("allies");
    if (var_7e441f99479e9b56 == "axis") {
        if (axisscore * 1.3 < alliesscore) {
            return 1;
        }
    } else if (var_7e441f99479e9b56 == "allies") {
        if (alliesscore * 1.3 < axisscore) {
            return 1;
        }
    }
    return 0;
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4435
// Size: 0xa8
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

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44e4
// Size: 0x313
function choosecratelocation(droporigin) {
    if (isdefined(droporigin)) {
        var_92459ae9b006b9f7 = droporigin;
    } else {
        var_695a8b6f4aaeeee6 = randomfloatrange(0, 1);
        if (level.var_48e03f24b9b5c1a < level.var_272b2716f1938412 && function_489262584e53d09b("axis")) {
            var_b027d6857ab9d713 = level.frontlineData[level.var_48e03f24b9b5c1a].var_a2d0446bc9b000ab[0].var_e59f791d76c7beee["axis"].origin;
            var_64517c7a808446bd = level.frontlineData[level.var_48e03f24b9b5c1a].var_a2d0446bc9b000ab.size;
            maxpoint = level.frontlineData[level.var_48e03f24b9b5c1a].var_a2d0446bc9b000ab[var_64517c7a808446bd].var_e59f791d76c7beee["axis"].origin;
        } else if (level.var_48e03f24b9b5c1a > level.var_272b2716f1938412 && function_489262584e53d09b("allies")) {
            var_b027d6857ab9d713 = level.frontlineData[level.var_48e03f24b9b5c1a].var_a2d0446bc9b000ab[0].var_e59f791d76c7beee["allies"].origin;
            var_64517c7a808446bd = level.frontlineData[level.var_48e03f24b9b5c1a].var_a2d0446bc9b000ab.size;
            maxpoint = level.frontlineData[level.var_48e03f24b9b5c1a].var_a2d0446bc9b000ab[var_64517c7a808446bd].var_e59f791d76c7beee["allies"].origin;
        } else {
            var_b027d6857ab9d713 = level.frontlineData[level.var_48e03f24b9b5c1a].var_b027d6857ab9d713;
            maxpoint = level.frontlineData[level.var_48e03f24b9b5c1a].maxpoint;
        }
        var_92459ae9b006b9f7 = vectorlerp(var_b027d6857ab9d713, maxpoint, var_695a8b6f4aaeeee6);
    }
    trace = ray_trace(var_92459ae9b006b9f7, var_92459ae9b006b9f7 - (0, 0, 100000));
    var_92459ae9b006b9f7 = trace["position"];
    var_794937a10118f0d9 = findclosestdroplocation(var_92459ae9b006b9f7);
    if (0) {
        thread drawline(level.frontlineData[level.var_48e03f24b9b5c1a].var_b027d6857ab9d713, level.frontlineData[level.var_48e03f24b9b5c1a].maxpoint, 1000, (0, 1, 1));
        thread drawsphere(var_92459ae9b006b9f7, 100, 1000, (1, 0, 0));
        thread drawsphere(var_794937a10118f0d9.origin, 100, 1000, (0, 1, 0));
        thread drawline(var_92459ae9b006b9f7, var_794937a10118f0d9.origin, 1000, (0, 1, 0));
    }
    return var_794937a10118f0d9;
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47ff
// Size: 0xb2
function findclosestdroplocation(origin, var_8a1ec1e50582c07a) {
    startlocation = spawnstruct();
    startlocation.origin = origin;
    var_dc469c4af66c5cc3 = startlocation array_sort_with_func(level.var_98f1f016587a9593, &function_c271e4000367648f);
    for (i = 0; i < var_dc469c4af66c5cc3.size; i++) {
        loc = var_dc469c4af66c5cc3[i];
        if (loc.inuse) {
            continue;
        }
        if (istrue(var_8a1ec1e50582c07a) && istrue(loc.var_a9e5b4cd62871172)) {
            continue;
        }
        loc.inuse = 1;
        return loc;
    }
    return undefined;
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48b9
// Size: 0x47
function function_c271e4000367648f(var_fcf7e6e6d8c4861, var_fcf7b6e6d8c41c8) {
    return distance2dsquared(var_fcf7e6e6d8c4861.origin, self.origin) < distance2dsquared(var_fcf7b6e6d8c41c8.origin, self.origin);
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4908
// Size: 0x34b
function runkillstreakreward(location, creditplayer) {
    level endon("game_ended");
    streakname = namespace_6c578d6ef48f10ef::function_5d1369bfc4efd8b7(creditplayer.team);
    crate = undefined;
    object = namespace_19b4203b51d56488::createobjidobject(location.origin, "neutral", (0, 0, 72), undefined, "any");
    object.origin = location.origin;
    thread docratedropsmoke(undefined, location.origin, 16);
    object.iconname = "_incoming";
    object.lockupdatingicons = 0;
    object namespace_19b4203b51d56488::setobjectivestatusicons("carepackage");
    namespace_5a22b6f3a56f7e9b::update_objective_setbackground(object.objidnum, 8);
    object.lockupdatingicons = 1;
    waittime = getdvarint(@"hash_41f80710e72eb107", 5);
    wait(waittime);
    crate = namespace_6c578d6ef48f10ef::function_99cc30ea8be5b2a6(creditplayer.team, streakname, location.origin, (0, randomint(360), 0), undefined);
    if (!isdefined(crate)) {
        object namespace_19b4203b51d56488::setvisibleteam("none");
        object namespace_19b4203b51d56488::releaseid();
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
    level.var_cbb5fb5077bac26d = level.var_cbb5fb5077bac26d + 1;
    usetime = getdvarfloat(@"hash_d25321c867cf3a80", 10);
    crate.usetimeoverride = usetime;
    crate waittill("crate_dropped");
    if (!isdefined(crate)) {
        object namespace_19b4203b51d56488::setvisibleteam("none");
        object namespace_19b4203b51d56488::releaseid();
        object.visibleteam = "none";
        location.inuse = 0;
        return;
    }
    object.useobj = crate;
    object.origin = crate.origin;
    crate notify("objective_activate");
    namespace_5a22b6f3a56f7e9b::update_objective_onentity(object.objidnum, crate);
    namespace_5a22b6f3a56f7e9b::update_objective_setzoffset(object.objidnum, 72);
    object.iconname = "";
    object.lockupdatingicons = 0;
    object namespace_19b4203b51d56488::setobjectivestatusicons("carepackage");
    object.lockupdatingicons = 1;
    namespace_5a22b6f3a56f7e9b::update_objective_setbackground(object.objidnum, 8);
    objective_setlabel(object.objidnum, "");
    crate waittill("death");
    level.var_cbb5fb5077bac26d = level.var_cbb5fb5077bac26d - 1;
    object namespace_19b4203b51d56488::setvisibleteam("none");
    object namespace_19b4203b51d56488::releaseid();
    object.visibleteam = "none";
    location.inuse = 0;
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c5a
// Size: 0x604
function initspawns() {
    level.gamemodestartspawnpointnames = [];
    if (namespace_8e28f8b325a83325::function_167619fe3d0cff00()) {
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
            namespace_b2d5aa2baf2b5701::setactivespawnlogic(#"default");
        } else if (namespace_36f464722d326bbe::getmapname() == "mp_aniyah") {
            namespace_b2d5aa2baf2b5701::setactivespawnlogic("GroundWarTTLOS", "Crit_Default");
        } else if (namespace_36f464722d326bbe::islargemap()) {
            namespace_b2d5aa2baf2b5701::setactivespawnlogic("GroundWar", "Crit_Default");
        } else {
            namespace_b2d5aa2baf2b5701::setactivespawnlogic("Default", "Crit_Default");
        }
        namespace_b2d5aa2baf2b5701::addstartspawnpoints(var_48501209a3e177a7);
        namespace_b2d5aa2baf2b5701::addstartspawnpoints(var_ae7d0107ad485428);
        namespace_b2d5aa2baf2b5701::addspawnpoints("allies", var_48501209a3e177a7);
        namespace_b2d5aa2baf2b5701::addspawnpoints("axis", var_ae7d0107ad485428);
        var_99df7ca30ad2726d = namespace_b2d5aa2baf2b5701::getspawnpointarray(var_48501209a3e177a7);
        var_c8d44e8665f9d370 = namespace_b2d5aa2baf2b5701::getspawnpointarray(var_ae7d0107ad485428);
        namespace_b2d5aa2baf2b5701::registerspawnset("start_allies", var_99df7ca30ad2726d);
        namespace_b2d5aa2baf2b5701::registerspawnset("start_axis", var_c8d44e8665f9d370);
        namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_tdm_spawn");
        namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_tdm_spawn");
        namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_tdm_spawn_secondary", 1, 1);
        namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_tdm_spawn_secondary", 1, 1);
        spawns = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn");
        var_3a5288f40c8be099 = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn_secondary");
        namespace_b2d5aa2baf2b5701::registerspawnset("normal", spawns);
        namespace_b2d5aa2baf2b5701::registerspawnset("fallback", var_3a5288f40c8be099);
        level.mapcenter = namespace_b2d5aa2baf2b5701::findboxcenter(level.spawnmins, level.spawnmaxs);
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
        namespace_b2d5aa2baf2b5701::addstartspawnpoints(var_48501209a3e177a7);
        namespace_b2d5aa2baf2b5701::addstartspawnpoints(var_ae7d0107ad485428);
        namespace_b2d5aa2baf2b5701::addspawnpoints("allies", var_48501209a3e177a7);
        namespace_b2d5aa2baf2b5701::addspawnpoints("axis", var_ae7d0107ad485428);
        var_99df7ca30ad2726d = namespace_b2d5aa2baf2b5701::getspawnpointarray(var_48501209a3e177a7);
        var_c8d44e8665f9d370 = namespace_b2d5aa2baf2b5701::getspawnpointarray(var_ae7d0107ad485428);
        namespace_b2d5aa2baf2b5701::registerspawnset("start_allies", var_99df7ca30ad2726d);
        namespace_b2d5aa2baf2b5701::registerspawnset("start_axis", var_c8d44e8665f9d370);
        namespace_b2d5aa2baf2b5701::addspawnpoints("allies", var_600a07d6f7838f5e);
        namespace_b2d5aa2baf2b5701::addspawnpoints("axis", var_600a07d6f7838f5e);
        spawns = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn");
        var_5ce0af20b7b092cf = [];
        var_3d051a5c0f38b5c4 = [];
        foreach (s in spawns) {
            if (s.target == "axis") {
                var_3d051a5c0f38b5c4[var_3d051a5c0f38b5c4.size] = s;
            } else if (s.target == "allies") {
                var_5ce0af20b7b092cf[var_5ce0af20b7b092cf.size] = s;
            } else {
                targets = getstructarray(s.target, "targetname");
                if (targets.size > 0) {
                    continue;
                }
                fwd = anglestoforward(s.angles);
                axisHQ = level.gw_objstruct.axishqloc.trigger.origin;
                var_24d6579a0cb7b871 = vectornormalize(axisHQ - s.origin);
                var_fd83d4343d52e27 = vectordot(fwd, var_24d6579a0cb7b871);
                alliesHQ = level.gw_objstruct.allieshqloc.trigger.origin;
                var_8668b71cdf65a836 = vectornormalize(alliesHQ - s.origin);
                var_f33bf607ed56b2de = vectordot(fwd, var_8668b71cdf65a836);
                if (var_fd83d4343d52e27 > var_f33bf607ed56b2de) {
                    var_5ce0af20b7b092cf[var_5ce0af20b7b092cf.size] = s;
                } else {
                    var_3d051a5c0f38b5c4[var_3d051a5c0f38b5c4.size] = s;
                }
            }
        }
        namespace_b2d5aa2baf2b5701::registerspawnset("normal_allies", var_5ce0af20b7b092cf);
        namespace_b2d5aa2baf2b5701::registerspawnset("normal_axis", var_3d051a5c0f38b5c4);
        level.mapcenter = namespace_b2d5aa2baf2b5701::findboxcenter(level.spawnmins, level.spawnmaxs);
        setmapcenter(level.mapcenter);
    }
    level thread function_e02a492a4a229f7e();
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5265
// Size: 0x1fd
function function_e02a492a4a229f7e() {
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    level.mapcenter = namespace_b2d5aa2baf2b5701::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
    var_15f70b9b7e9402e3 = getdvarint(@"hash_54449fe780ddb32f", 3000);
    flag_wait("frontline_data_init");
    for (key = 0; key < level.frontlineData.size; key++) {
        data = level.frontlineData[key];
        for (laneKey = 0; laneKey < data.var_a2d0446bc9b000ab.size; laneKey++) {
            var_a2d0446bc9b000ab = data.var_a2d0446bc9b000ab[laneKey];
            var_a2d0446bc9b000ab.redeployspawn = [];
            foreach (team in level.teamnamelist) {
                spawnpoint = spawnstruct();
                groundorigin = drop_to_ground(var_a2d0446bc9b000ab.origin, undefined, undefined, (0, 0, 1));
                spawnpoint.origin = groundorigin + (0, 0, 1) * var_15f70b9b7e9402e3;
                spawnpoint.angles = vectortoangles(level.spawnselectionteamforward[team]);
                spawnpoint.time = gettime();
                spawnpoint.index = -1;
                var_a2d0446bc9b000ab.redeployspawn[team] = spawnpoint;
            }
        }
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5469
// Size: 0x162
function generatespawnpoint() {
    laneKey = randomint(level.frontlineData[level.var_48e03f24b9b5c1a].var_a2d0446bc9b000ab.size);
    spawnpoint = function_277456e766f73b0(self.team, laneKey);
    var_47ad41a1a8a19410 = getdvarint(@"hash_5f04f6bef3a9be7", 512);
    self.redeployspawn.origin = (spawnpoint.origin[0] + randomfloatrange(var_47ad41a1a8a19410 * -1, var_47ad41a1a8a19410), spawnpoint.origin[1] + randomfloatrange(var_47ad41a1a8a19410 * -1, var_47ad41a1a8a19410), spawnpoint.origin[2]);
    self.redeployspawn.angles = spawnpoint.angles;
    self.redeployspawn.time = gettime();
    self.redeployspawn.team = self.team;
    self.redeployspawn.index = -1;
    self.redeployspawn.lifeid = self.lifeid;
    self.redeployspawn.laneKey = laneKey;
    return self.redeployspawn;
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x55d3
// Size: 0x40f
function function_277456e766f73b0(team, laneKey) {
    var_77dbb639c4ba0c18 = level.var_48e03f24b9b5c1a + 1;
    if (team == "axis") {
        var_77dbb639c4ba0c18 = level.var_48e03f24b9b5c1a - 1;
    }
    if (var_77dbb639c4ba0c18 == level.frontlineData.size) {
        if (!isdefined(level.gw_objstruct.var_333efbbe6bcca949)) {
            var_15f70b9b7e9402e3 = getdvarint(@"hash_54449fe780ddb32f", 3000);
            spawnpoint = spawnstruct();
            groundorigin = drop_to_ground(level.gw_objstruct.allieshqloc.trigger.origin, undefined, undefined, (0, 0, 1));
            spawnpoint.origin = groundorigin + (0, 0, 1) * var_15f70b9b7e9402e3;
            spawnpoint.angles = vectortoangles(level.spawnselectionteamforward[team]);
            spawnpoint.time = gettime();
            spawnpoint.index = -1;
            level.gw_objstruct.var_333efbbe6bcca949 = spawnpoint;
        }
        return level.gw_objstruct.var_333efbbe6bcca949;
    } else if (var_77dbb639c4ba0c18 < 0) {
        if (!isdefined(level.gw_objstruct.var_96832145b9161a04)) {
            var_15f70b9b7e9402e3 = getdvarint(@"hash_54449fe780ddb32f", 3000);
            spawnpoint = spawnstruct();
            groundorigin = drop_to_ground(level.gw_objstruct.axishqloc.trigger.origin, undefined, undefined, (0, 0, 1));
            spawnpoint.origin = groundorigin + (0, 0, 1) * var_15f70b9b7e9402e3;
            spawnpoint.angles = vectortoangles(level.spawnselectionteamforward[team]);
            spawnpoint.time = gettime();
            spawnpoint.index = -1;
            level.gw_objstruct.var_96832145b9161a04 = spawnpoint;
        }
        return level.gw_objstruct.var_96832145b9161a04;
    }
    var_77dbb639c4ba0c18 = int(clamp(var_77dbb639c4ba0c18, 0, level.frontlineData.size - 1));
    if (!isdefined(laneKey)) {
        laneKey = randomint(level.frontlineData[var_77dbb639c4ba0c18].var_a2d0446bc9b000ab.size);
    }
    current = level.frontlineData[level.var_48e03f24b9b5c1a].var_a2d0446bc9b000ab[laneKey].origin;
    neighbor = level.frontlineData[var_77dbb639c4ba0c18].var_a2d0446bc9b000ab[laneKey].origin;
    var_6ac38dac8e6cc00 = vectornormalize(neighbor - current);
    offset = getdvarint(@"hash_82bce2fb4193e57", 8000);
    var_a0811053c6c53a98 = current + var_6ac38dac8e6cc00 * offset;
    var_651bae59b8c2e46c = undefined;
    closestdist = undefined;
    foreach (var_e9bf3955fa1125b5, frontlineData in level.frontlineData) {
        dist = distance2dsquared(var_a0811053c6c53a98, frontlineData.var_a2d0446bc9b000ab[laneKey].origin);
        if (!isdefined(closestdist) || dist < closestdist) {
            var_651bae59b8c2e46c = var_e9bf3955fa1125b5;
            closestdist = dist;
        }
    }
    return level.frontlineData[var_651bae59b8c2e46c].var_a2d0446bc9b000ab[laneKey].redeployspawn[team];
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x59ea
// Size: 0x16
function modespawn(var_9156b53bcf7ce573) {
    thread playerrespawn();
    return 1;
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a08
// Size: 0x29
function playerkilledspawn(var_642470e1abc1bbf9, var_8b3f6477dbed24d7) {
    var_642470e1abc1bbf9.victim thread playerrespawn();
    return 1;
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a39
// Size: 0x16a
function playerrespawn() {
    level endon("game_ended");
    self endon("disconnect");
    if (istrue(level.gameended)) {
        return;
    }
    namespace_99ac021a7547cae3::waitforremoteend();
    spawnpoint = getspawnpoint();
    var_c4e660d969dceee5 = vectornormalize(level.frontlineData[level.var_48e03f24b9b5c1a].var_a2d0446bc9b000ab[spawnpoint.laneKey].origin - spawnpoint.origin);
    spawnpoint.angles = vectortoangles(var_c4e660d969dceee5);
    timeoutms = getdvarint(@"hash_eeb59cee28a5eab7", 3000);
    var_11f3b4465c8b637b = namespace_8bfdb6eb5a3df67a::playerprestreamrespawnorigin(spawnpoint, timeoutms);
    if (namespace_4b0406965e556711::gameflag("prematch_done")) {
        var_ad4dd16f29e24b77 = 0;
        var_dfab0807d83a77fe = 0.5;
        thread namespace_99ac021a7547cae3::managerespawnfade(var_ad4dd16f29e24b77, var_dfab0807d83a77fe);
        if (var_ad4dd16f29e24b77 > 0) {
            self waittill("fadeDown_complete");
        }
    }
    namespace_a9c534dc7832aba4::playerclearspectatekillchainsystem();
    namespace_d20f8ef223912e12::spawnintermission(spawnpoint.origin, spawnpoint.angles);
    namespace_5aeecefc462876::setdisabled();
    namespace_d3d40f75bb4e4c32::playerwaittillstreamhintcomplete();
    namespace_99ac021a7547cae3::spawnplayer(undefined, 0);
    namespace_47fd1e79a44628cd::gulagwinnerrespawn(1, undefined, spawnpoint, 1, var_11f3b4465c8b637b, undefined, undefined, 0, 0, 1);
    namespace_3e725f3cc58bddd3::resetplayervariables();
    namespace_3e725f3cc58bddd3::resetplayeromnvarsonspawn();
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5baa
// Size: 0x1a9
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
    } else {
        spawnteam = self.pers["team"];
        idealdist = getdvarint(@"hash_a66b78681b2d0805", 4096);
        var_629e5fe2f6b337fa = [];
        var_629e5fe2f6b337fa["teamForward"] = level.spawnselectionteamforward[spawnteam];
        var_629e5fe2f6b337fa["idealDistSq"] = idealdist * idealdist;
        if (namespace_b2d5aa2baf2b5701::shoulduseteamstartspawn()) {
            if (function_bff229a11ecd1e34()) {
                namespace_b2d5aa2baf2b5701::setactivespawnlogic(#"start");
            } else {
                namespace_b2d5aa2baf2b5701::setactivespawnlogic("StartSpawn", "Crit_Default");
            }
            namespace_b2d5aa2baf2b5701::activatespawnset(level.var_2ad659edb860ab3a[spawnteam], 1);
            spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, level.var_2ad659edb860ab3a[spawnteam], undefined, undefined, var_629e5fe2f6b337fa);
        } else {
            if (function_bff229a11ecd1e34()) {
                namespace_b2d5aa2baf2b5701::setactivespawnlogic(#"default");
            } else {
                namespace_b2d5aa2baf2b5701::setactivespawnlogic("Invasion", "Crit_Frontline");
            }
            namespace_b2d5aa2baf2b5701::activatespawnset(level.var_ad9cae795e7505c6[spawnteam], 1);
            spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, level.var_ad9cae795e7505c6[spawnteam], undefined, undefined, var_629e5fe2f6b337fa);
        }
        return spawnpoint;
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d5a
// Size: 0x102
function function_bd61217120c57971() {
    self endon("death_or_disconnect");
    var_a2b13b5ae4cb7698 = level.frontlineData[level.var_48e03f24b9b5c1a].origin;
    idealdist = getdvarint(@"hash_a66b78681b2d0805", 4096);
    var_3b29f5840be404c8 = var_a2b13b5ae4cb7698;
    if (self.team == "axis") {
        var_3b29f5840be404c8 = level.gw_objstruct.axishqloc.trigger.origin;
    } else {
        var_3b29f5840be404c8 = level.gw_objstruct.allieshqloc.trigger.origin;
    }
    var_f069bbf68802037b = vectornormalize(var_3b29f5840be404c8 - var_a2b13b5ae4cb7698);
    var_11f3b4465c8b637b = var_a2b13b5ae4cb7698 + var_f069bbf68802037b * idealdist;
    var_11f3b4465c8b637b = utility::groundpos(var_11f3b4465c8b637b, (0, 0, 1));
    namespace_d3d40f75bb4e4c32::playerstreamhintlocation(var_11f3b4465c8b637b);
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e63
// Size: 0x58
function function_8964b48e4eba5797(origin) {
    closestpoint = pointonsegmentnearesttopoint(level.frontlineData[level.var_48e03f24b9b5c1a].var_b027d6857ab9d713, level.frontlineData[level.var_48e03f24b9b5c1a].maxpoint, origin);
    return closestpoint;
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ec3
// Size: 0x6a
function function_99146672ec896efa(origin) {
    closestpoint = pointonsegmentnearesttopoint(level.frontlineData[level.var_48e03f24b9b5c1a].var_b027d6857ab9d713, level.frontlineData[level.var_48e03f24b9b5c1a].maxpoint, origin);
    var_f6f8270f02b2b9bf = distance2dsquared(closestpoint, origin);
    return var_f6f8270f02b2b9bf;
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f35
// Size: 0x313
function function_7855eb28c2d21061(origin, team) {
    if (!isdefined(level.var_48549f359a11f105)) {
        level.var_48549f359a11f105 = [];
    }
    if (!isdefined(level.var_48549f359a11f105[team])) {
        level.var_48549f359a11f105[team] = spawnstruct();
    }
    if (!isdefined(level.var_48549f359a11f105[team].timestamp) || level.var_48549f359a11f105[team].timestamp < gettime()) {
        level.var_48549f359a11f105[team].timestamp = gettime();
        level.var_48549f359a11f105[team].var_813a0b907262a1c2 = [];
        foreach (laneKey, var_a2d0446bc9b000ab in level.frontlineData[level.var_48e03f24b9b5c1a].var_a2d0446bc9b000ab) {
            level.var_48549f359a11f105[team].var_813a0b907262a1c2[laneKey] = 0;
        }
        friendlyplayers = getfriendlyplayers(team, 1);
        foreach (player in friendlyplayers) {
            var_74340f80a8ff4462 = undefined;
            var_e61f33a1ec31a630 = undefined;
            foreach (laneKey, var_a2d0446bc9b000ab in level.frontlineData[level.var_48e03f24b9b5c1a].var_a2d0446bc9b000ab) {
                var_26d8a238be314cf9 = distance2dsquared(player.origin, var_a2d0446bc9b000ab.origin);
                if (!isdefined(var_74340f80a8ff4462) || var_26d8a238be314cf9 < var_e61f33a1ec31a630) {
                    var_74340f80a8ff4462 = laneKey;
                    var_e61f33a1ec31a630 = var_26d8a238be314cf9;
                }
            }
            level.var_48549f359a11f105[team].var_813a0b907262a1c2[var_74340f80a8ff4462]++;
        }
    }
    var_53f513e3a2d22d55 = undefined;
    var_4d6bd6d4c0e080b6 = undefined;
    foreach (key, playercount in level.var_48549f359a11f105[team].var_813a0b907262a1c2) {
        if (!isdefined(var_53f513e3a2d22d55) || playercount < var_4d6bd6d4c0e080b6) {
            var_53f513e3a2d22d55 = key;
            var_4d6bd6d4c0e080b6 = playercount;
        }
    }
    var_f6f8270f02b2b9bf = distance2dsquared(level.frontlineData[level.var_48e03f24b9b5c1a].var_a2d0446bc9b000ab[var_53f513e3a2d22d55].origin, origin);
    return var_f6f8270f02b2b9bf;
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6250
// Size: 0x5c
function onspawnplayer(var_9156b53bcf7ce573) {
    self.forcespawnnearteammates = undefined;
    thread updatematchstatushintonspawn();
    namespace_14f37777effc564d::function_6da8b65579348d0b();
    namespace_9bb409deb69fb31d::updatesquadomnvars(self.team, self.var_ff97225579de16a);
    if (level.spawnprotectiontimer > 0) {
        thread removespawnprotectiononnotify();
        thread removespawnprotectiononads();
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62b3
// Size: 0x2e
function removespawnprotectiononnotify() {
    self endon("death_or_disconnect");
    self endon("remove_spawn_protection");
    waittill_any_3("parachute_landed", "vehicle_enter", "weapon_fired");
    namespace_310ba947928891df::removespawnprotection();
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62e8
// Size: 0x2b
function removespawnprotectiononads() {
    self endon("death_or_disconnect");
    self endon("remove_spawn_protection");
    while (self playerads() < 0.7) {
        waitframe();
    }
    namespace_310ba947928891df::removespawnprotection();
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x631a
// Size: 0x16
function updatematchstatushintonspawn() {
    level endon("game_ended");
    namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("push_frontline");
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params a, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6337
// Size: 0xb4
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00) {
    namespace_9bb409deb69fb31d::updatesquadomnvars(self.team, self.var_ff97225579de16a);
    if (level.dropbrloot) {
        dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
        dropstruct.var_dfba5a2c3c6f0a07 = 14;
        namespace_cb965d2f71fefddc::dropbrhealthpack(dropstruct);
        namespace_c6ccccd95254983f::playerdropplunderondeath(dropstruct, attacker, 1);
    }
    thread function_bd61217120c57971();
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x63f2
// Size: 0x209
function managedroppedents(var_2c015943929af247) {
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
        var_50f783a5617f8940 = [];
        for (i = 16; i < level.br_droppedloot.size; i++) {
            var_50f783a5617f8940[i - 16] = level.br_droppedloot[i];
        }
        level.br_droppedloot = var_50f783a5617f8940;
    }
    foreach (ent in var_2c015943929af247) {
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
        var_50f783a5617f8940 = [];
        for (i = 16; i < level.br_pickups.droppeditems.size; i++) {
            var_50f783a5617f8940[i - 16] = level.br_pickups.droppeditems[i];
        }
        level.br_pickups.droppeditems = var_50f783a5617f8940;
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6602
// Size: 0x7e
function onplayerconnect(player) {
    if (isdefined(level.rallypointvehicles)) {
        thread namespace_fdd1a79841ab3fe7::rallypoint_showtoplayer(player);
    }
    var_6109158034da3fe9 = gameflag("infil_will_run") && !istrue(gameflag("infil_started"));
    if (!level.usespawnselection && !namespace_4b0406965e556711::gameflag("prematch_done") && !var_6109158034da3fe9) {
        player thread manageprematchfade();
    }
    namespace_f1d40c362677777e::registerondisconnecteventcallback(&onplayerdisconnect);
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6687
// Size: 0x2a
function manageprematchfade() {
    self endon("disconnect");
    var_ad4dd16f29e24b77 = 0;
    var_dfab0807d83a77fe = 0.5;
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x66b8
// Size: 0xc
function onplayerdisconnect(player) {
    
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x66cb
// Size: 0xe
function getrespawndelay() {
    self.spawncameraskipthermal = 0;
    return undefined;
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x66e1
// Size: 0xb1
function onnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    namespace_310ba947928891df::oncommonnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon);
    if (getdvarint(@"hash_2e405e2912dc4a44", 0) == 1) {
        attacker thread namespace_62c556437da28f50::scoreeventpopup(function_2ef675c13ca1c4af(#"hash_2c8bcbb02ec7ff9b", level.scoremod["kill"]));
    }
    attacker incpersstat("contribution", level.scoremod["kill"]);
    attacker setextrascore0(attacker.pers["contribution"]);
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6799
// Size: 0x145
function initspecatatorcameras() {
    level.spectatorcameras = [];
    level.currentspectatorcamref = "cop_2";
    var_84286554864313cb = getstructarray("tac_ops_map_config", "targetname");
    foreach (var_48380029fbb1007a in var_84286554864313cb) {
        var_ca2c833762e5466c = var_48380029fbb1007a.script_noteworthy;
        var_84bd84deb891a915 = getstructarray(var_48380029fbb1007a.target, "targetname");
        foreach (var_6a17713098332fe4 in var_84bd84deb891a915) {
            switch (var_6a17713098332fe4.script_label) {
            case #"hash_11e1630c6c429f23":
                setteammapposition(var_ca2c833762e5466c, "allies", var_6a17713098332fe4);
                break;
            case #"hash_e66f1db565904926":
                setteammapposition(var_ca2c833762e5466c, "axis", var_6a17713098332fe4);
                break;
            }
        }
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x68e5
// Size: 0x47
function setteammapposition(var_ca2c833762e5466c, team, var_20c18491aeb9a905) {
    if (!isdefined(level.spectatorcameras[var_ca2c833762e5466c])) {
        level.spectatorcameras[var_ca2c833762e5466c] = [];
    }
    level.spectatorcameras[var_ca2c833762e5466c][team] = var_20c18491aeb9a905;
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6933
// Size: 0x16
function applythermal() {
    self visionsetthermalforplayer("proto_apache_flir_mp");
    self thermalvisionon();
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6950
// Size: 0xa
function removethermal() {
    self thermalvisionoff();
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6961
// Size: 0x135
function startspectatorview() {
    if (isteamreviveenabled()) {
        return;
    }
    waitframe();
    updatesessionstate("spectator");
    namespace_5aeecefc462876::setdisabled();
    if (isdefined(self.lastdeathangles)) {
        self setplayerangles(self.lastdeathangles);
    }
    wait(0.1);
    setdof_default();
    var_26ee0f3f89450d97 = 0;
    var_39a11613e5c11a5d = undefined;
    var_eb381492a5db110a = (0, 0, 0);
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

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a9d
// Size: 0x18
function dohalfwayflash() {
    wait(0.4);
    thread playslamzoomflash();
    applythermal();
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6abc
// Size: 0x20
function endspectatorview() {
    if (!isdefined(self.spectatorcament)) {
        return;
    }
    removethermal();
    thread runslamzoomonspawn();
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ae3
// Size: 0x104
function movecameratomappos(player, var_9813182985677b23, finalangles) {
    player endon("spawned_player");
    movetime = 1;
    rotatetime = 1;
    self moveto(var_9813182985677b23, 2, 1, 1);
    player playlocalsound("mp_cmd_camera_zoom_out");
    player setclienttriggeraudiozonepartialwithfade("spawn_cam", 0.5, "mix");
    self rotateto(finalangles, 2, 1, 1);
    wait(1.1);
    var_ae753108f3dff053 = anglestoforward(finalangles) * 300;
    var_ae753108f3dff053 = var_ae753108f3dff053 * (1, 1, 0);
    if (isdefined(player) && isdefined(player.spectatorcament)) {
        self moveto(var_9813182985677b23 + var_ae753108f3dff053, 15, 1, 1);
        player earthquakeforplayer(0.03, 15, var_9813182985677b23 + var_ae753108f3dff053, 1000);
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6bee
// Size: 0xee
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
    wait(0.5);
    if (!isdefined(self)) {
        return;
    }
    self visionsetnakedforplayer("", 0);
    thread playslamzoomflash();
    updatesessionstate("playing");
    self cameraunlink();
    self.spectatorcament delete();
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ce3
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
    wait(0.4);
    overlay destroy();
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6dc2
// Size: 0x10a
function arm_playstatusdialog(var_cb3339ece72dbdeb, team) {
    soundalias = "dx_mpa_ustl_" + var_cb3339ece72dbdeb;
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
            player arm_leaderdialogonplayer_internal(soundalias, var_cb3339ece72dbdeb);
        }
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6ed3
// Size: 0x2f
function arm_playstatusdialogonplayer(var_cb3339ece72dbdeb) {
    soundalias = "dx_mpa_ustl_announcer_" + var_cb3339ece72dbdeb;
    soundalias = tolower(soundalias);
    arm_leaderdialogonplayer_internal(soundalias, var_cb3339ece72dbdeb);
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f09
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

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6fa9
// Size: 0xca
function arm_initoutofbounds() {
    level.outofboundstriggers = [];
    var_ccfdb06748d7f326 = getentarray("OutOfBounds", "targetname");
    foreach (trigger in var_ccfdb06748d7f326) {
        if (isdefined(namespace_36f464722d326bbe::getlocaleid()) && isdefined(trigger.script_noteworthy) && trigger.script_noteworthy == level.localeid && namespace_de5151d68164781a::modeusesgroundwarteamoobtriggers(trigger)) {
            level.outofboundstriggers[level.outofboundstriggers.size] = trigger;
        } else {
            trigger delete();
        }
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x707a
// Size: 0x1a
function debugprint(text) {
    /#
        if (0) {
            println(text);
        }
    #/
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x709b
// Size: 0x5f
function isobjectivecontested(gameobject) {
    if (gameobject.ownerteam == "axis") {
        return (gameobject.numtouching["allies"] > 0);
    } else if (gameobject.ownerteam == "allies") {
        return (gameobject.numtouching["axis"] > 0);
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7101
// Size: 0x79
function calculateobjectivesheld(team) {
    var_ae82e8f18ca8e0fe = 0;
    foreach (objective in level.objectives) {
        if (objective.ownerteam == team) {
            var_ae82e8f18ca8e0fe++;
        }
    }
    return var_ae82e8f18ca8e0fe;
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 12, eflags: 0x0
// Checksum 0x0, Offset: 0x7182
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
        /#
            assertex(isstring(org), "When creating a hint object with a passed in ent, you need to set org to a tag on that model");
        #/
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

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7340
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

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7cc9
// Size: 0xec
function calculatehqmidpoint() {
    level.hqmidpoint = (level.gw_objstruct.axishqloc.trigger.origin + level.gw_objstruct.allieshqloc.trigger.origin) * 0.5;
    level.hqvecttomid_allies = level.gw_objstruct.axishqloc.trigger.origin - level.hqmidpoint;
    level.hqvecttomid_axis = level.gw_objstruct.allieshqloc.trigger.origin - level.hqmidpoint;
    level.hqdisttomid = length(level.hqvecttomid_axis);
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7dbc
// Size: 0x255
function calculatecameraoffset(team, var_800054ca1a89dace) {
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
    var_46f432042b3473d8 = distance(var_800054ca1a89dace, level.hqmidpoint);
    if (var_46f432042b3473d8 < 2048) {
        return (0, 0, 0);
    }
    if (team == "axis") {
        var_4881f7fe7fc2bae2 = distance(level.gw_objstruct.axishqloc.trigger.origin, var_800054ca1a89dace);
        var_3b776694eeac2beb = level.hqvecttomid_axis;
    } else {
        var_4881f7fe7fc2bae2 = distance(level.gw_objstruct.allieshqloc.trigger.origin, var_800054ca1a89dace);
        var_3b776694eeac2beb = level.hqvecttomid_allies;
    }
    if (var_4881f7fe7fc2bae2 < 2048) {
        return (var_3b776694eeac2beb * var_fc87d6fc10744d44);
    }
    if (var_4881f7fe7fc2bae2 > level.hqdisttomid) {
        if (team == "axis") {
            var_4881f7fe7fc2bae2 = distance(level.gw_objstruct.allieshqloc.trigger.origin, var_800054ca1a89dace);
        } else {
            var_4881f7fe7fc2bae2 = distance(level.gw_objstruct.axishqloc.trigger.origin, var_800054ca1a89dace);
        }
        percentage = 100 - var_4881f7fe7fc2bae2 * 100 / level.hqdisttomid;
        offset = var_3b776694eeac2beb * var_6e9b9701b439aeb7 * -1 * percentage / 100;
        return offset;
    } else {
        percentage = 100 - var_4881f7fe7fc2bae2 * 100 / level.hqdisttomid;
        offset = var_3b776694eeac2beb * var_fc87d6fc10744d44 * percentage / 100;
        return offset;
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8018
// Size: 0x2b
function spawnprotectionexception() {
    if (isdefined(self.selectedspawnarea) && issubstr(self.selectedspawnarea, "HQ")) {
        return 1;
    }
    return 0;
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x804b
// Size: 0x12
function function_658c8f668d2cd83c() {
    wait(5);
    function_f1aed36ab4598ea("mp_gamemode_gw");
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8064
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

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x81a9
// Size: 0x83a
function function_e28bb63a5e8e8d12() {
    var_9d66b11865f83798 = getdvarint(@"hash_7ba9b97c63a992b5", 0);
    var_eb132661853aa312 = getdvarfloat(@"hash_1b0e9faa2b5e36e4", 30);
    var_11c5e87250ca0bf9 = getdvarint(@"hash_6240b7bdf606e6ab", 60) * 1000;
    var_5f857334b93b7b81 = getdvarint(@"hash_c52aee495ff0598a", 180) * 1000;
    var_54739e717fa73734 = getdvarint(@"hash_4c9d7f8dede759c7", 1);
    var_88f3d778efe40c6e = getdvarint(@"hash_73d5df0e713e122f", 200);
    var_d3c8e7e7e4f0fad5 = getdvarfloat(@"hash_b9ec3bea41ddd71b", 0.2);
    buffer = 0;
    var_26c3cde297afe485 = 0;
    level.var_272b2716f1938412 = 0;
    var_ec823f5f10f705ac = 0;
    var_3c1586d15c611ae = spawnstruct();
    var_3c1586d15c611ae.var_fe95d825c29e4b68 = level.var_48e03f24b9b5c1a;
    var_3c1586d15c611ae.var_38ef642aede44556 = 0;
    var_3c1586d15c611ae.axisscore = getteamscore("axis");
    var_3c1586d15c611ae.alliesscore = getteamscore("allies");
    while (1) {
        waitframe();
        currenttime = gettime();
        var_c732ac2a579c99b1 = getteamscore("axis") - var_3c1586d15c611ae.axisscore;
        var_8c6bcd8c000b8c10 = getteamscore("allies") - var_3c1586d15c611ae.alliesscore;
        var_1c04d17c30083c16 = abs(level.var_48e03f24b9b5c1a - level.var_272b2716f1938412);
        var_d50a39f7198881dc = ter_op(level.var_48e03f24b9b5c1a > level.var_272b2716f1938412, 1 + var_1c04d17c30083c16 * var_d3c8e7e7e4f0fad5, 1);
        var_c24eff89217d12f = ter_op(level.var_48e03f24b9b5c1a < level.var_272b2716f1938412, 1 + var_1c04d17c30083c16 * var_d3c8e7e7e4f0fad5, 1);
        if (getdvarint(@"hash_13fae9c305971d06", 0) == 1) {
            var_63f43f469b885ec6 = 25;
            startx = 800;
            starty = 50;
            linecount = 0;
            /#
                printtoscreen2d(startx, starty + var_63f43f469b885ec6 * linecount, "dx_mp_gwtd_game_uktl_wi50", (1, 1, 1), 1);
            #/
            linecount++;
            /#
                printtoscreen2d(startx, starty + var_63f43f469b885ec6 * linecount, "vehicles_inc" + level.var_48e03f24b9b5c1a, (1, 1, 1), 1);
            #/
            linecount++;
            /#
                printtoscreen2d(startx, starty + var_63f43f469b885ec6 * linecount, "vfx_br_infil_jump_smoke_01_friendly" + var_ec823f5f10f705ac, (1, 1, 1), 1);
            #/
            linecount++;
            /#
                printtoscreen2d(startx, starty + var_63f43f469b885ec6 * linecount, "traverse" + buffer, (1, 1, 1), 1);
            #/
            linecount++;
            var_12ddf4a9082aaa2a = max(0, (var_3c1586d15c611ae.var_38ef642aede44556 + var_11c5e87250ca0bf9 - currenttime) / 1000);
            /#
                printtoscreen2d(startx, starty + var_63f43f469b885ec6 * linecount, "scrambler_drone_guard" + var_12ddf4a9082aaa2a, (1, 1, 1), 1);
            #/
            linecount++;
            var_12ddf4a9082aaa2a = max(0, (var_3c1586d15c611ae.var_38ef642aede44556 + var_5f857334b93b7b81 - currenttime) / 1000);
            /#
                printtoscreen2d(startx, starty + var_63f43f469b885ec6 * linecount, "pointsPerFlag" + var_12ddf4a9082aaa2a, (1, 1, 1), 1);
            #/
            linecount++;
            /#
                printtoscreen2d(startx, starty + var_63f43f469b885ec6 * linecount, "veh8_mil_air_acharlie130" + var_88f3d778efe40c6e, (1, 1, 1), 1);
            #/
            linecount++;
            /#
                printtoscreen2d(startx, starty + var_63f43f469b885ec6 * linecount, "_incoming" + var_c732ac2a579c99b1 + "noVehicleDrop" + var_88f3d778efe40c6e * var_d50a39f7198881dc, (1, 1, 1), 1);
            #/
            linecount++;
            /#
                printtoscreen2d(startx, starty + var_63f43f469b885ec6 * linecount, "position" + var_8c6bcd8c000b8c10 + "noVehicleDrop" + var_88f3d778efe40c6e * var_c24eff89217d12f, (1, 1, 1), 1);
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
                    namespace_944ddf7b8df1b0e3::statusdialog("gwtdm_fall_back", "allies", 1);
                    namespace_944ddf7b8df1b0e3::statusdialog("gwtdm_push_foward", "axis", 1);
                    var_3f6fd6edaf6c6713 = "axis";
                } else {
                    namespace_944ddf7b8df1b0e3::statusdialog("gwtdm_fall_back", "axis", 1);
                    namespace_944ddf7b8df1b0e3::statusdialog("gwtdm_push_foward", "allies", 1);
                    var_3f6fd6edaf6c6713 = "allies";
                }
                function_2b4958acf92594e3();
                level function_2f5b6c628445768(var_3f6fd6edaf6c6713);
                level notify("frontline_moved");
            }
            continue;
        }
        switch (var_9d66b11865f83798) {
        case 0:
            var_ec823f5f10f705ac = function_bf26ca1dffd4923a();
            break;
        default:
            var_ec823f5f10f705ac = function_bf26ca1dffd4923a();
            break;
        }
        if (!var_26c3cde297afe485) {
            var_26c3cde297afe485 = 1;
            var_ec823f5f10f705ac = function_bf26ca1dffd4923a();
            level.var_272b2716f1938412 = var_ec823f5f10f705ac;
            level.var_48e03f24b9b5c1a = var_ec823f5f10f705ac;
            var_3c1586d15c611ae.var_fe95d825c29e4b68 = level.var_48e03f24b9b5c1a;
            var_3c1586d15c611ae.var_38ef642aede44556 = gettime();
            var_3c1586d15c611ae.axisscore = getteamscore("axis");
            var_3c1586d15c611ae.alliesscore = getteamscore("allies");
            function_2b4958acf92594e3();
        }
        if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
            continue;
        }
        if (currenttime > var_3c1586d15c611ae.var_38ef642aede44556 + var_5f857334b93b7b81) {
            if (var_c732ac2a579c99b1 >= var_88f3d778efe40c6e * var_d50a39f7198881dc || var_8c6bcd8c000b8c10 >= var_88f3d778efe40c6e * var_c24eff89217d12f) {
                if (var_c732ac2a579c99b1 > var_8c6bcd8c000b8c10) {
                    var_ec823f5f10f705ac = int(clamp(level.var_48e03f24b9b5c1a + 1, 0, level.frontlineData.size - 1));
                } else {
                    var_ec823f5f10f705ac = int(clamp(level.var_48e03f24b9b5c1a - 1, 0, level.frontlineData.size - 1));
                }
                buffer = var_eb132661853aa312;
            }
        }
        if (var_ec823f5f10f705ac != level.var_48e03f24b9b5c1a) {
            buffer = buffer + level.framedurationseconds;
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
                    namespace_944ddf7b8df1b0e3::statusdialog("gwtdm_fall_back", "allies", 1);
                    namespace_944ddf7b8df1b0e3::statusdialog("gwtdm_push_foward", "axis", 1);
                    var_3f6fd6edaf6c6713 = "axis";
                } else {
                    namespace_944ddf7b8df1b0e3::statusdialog("gwtdm_fall_back", "axis", 1);
                    namespace_944ddf7b8df1b0e3::statusdialog("gwtdm_push_foward", "allies", 1);
                    var_3f6fd6edaf6c6713 = "allies";
                }
                function_2b4958acf92594e3();
                level function_2f5b6c628445768(var_3f6fd6edaf6c6713);
                level notify("frontline_moved");
            }
        } else {
            buffer = 0;
        }
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x89ea
// Size: 0x135
function function_bf26ca1dffd4923a() {
    closestdistsq = undefined;
    var_5020875c61575f25 = undefined;
    foreach (key, data in level.frontlineData) {
        closestpoint = pointonsegmentnearesttopoint(data.var_b027d6857ab9d713, data.maxpoint, level.var_279807e5da6c6a18["player"].origin);
        distsq = distance2dsquared(closestpoint, level.var_279807e5da6c6a18["player"].origin);
        if (getdvarint(@"hash_13fae9c305971d06", 0) == 1) {
            level thread namespace_f2ffc0540883e1ad::drawline(closestpoint, level.var_279807e5da6c6a18["player"].origin, level.framedurationseconds, (1, 0, 1));
        }
        if (!isdefined(closestdistsq) || distsq < closestdistsq) {
            closestdistsq = distsq;
            var_5020875c61575f25 = key;
        }
    }
    return var_5020875c61575f25;
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b27
// Size: 0x742
function function_e62dcabb18095abb() {
    while (1) {
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
                level thread namespace_f2ffc0540883e1ad::drawsphere(data.origin + (0, 0, 1) * height, var_b9dbc464a0b5e5d4, level.framedurationseconds, color);
            }
        }
        for (key = 0; key < level.frontlineData.size; key++) {
            data = level.frontlineData[key];
            level thread namespace_f2ffc0540883e1ad::drawline(data.var_b027d6857ab9d713, data.maxpoint, level.framedurationseconds, (1, 0, 0));
            color = ter_op(level.var_48e03f24b9b5c1a == key, (0, 1, 0), (1, 1, 1));
            /#
                print3d(data.origin, "team" + key, color, 1, 20, 1, 1);
            #/
            prev = undefined;
            for (laneKey = 0; laneKey < data.var_a2d0446bc9b000ab.size; laneKey++) {
                var_a2d0446bc9b000ab = data.var_a2d0446bc9b000ab[laneKey];
                color = ter_op(level.var_48e03f24b9b5c1a == key, (0, 1, 0), (1, 1, 1));
                /#
                    print3d(var_a2d0446bc9b000ab.origin, "infil_will_run" + laneKey, color, 1, 10, 1, 1);
                #/
                foreach (team, locs in var_a2d0446bc9b000ab.var_45d6f1c931bc6a8b) {
                    color = ter_op(team == "axis", (1, 0, 0), (0, 0, 1)) * ter_op(level.var_48e03f24b9b5c1a == key, 1, 0.5);
                    foreach (loc in locs) {
                        level thread namespace_f2ffc0540883e1ad::drawline(var_a2d0446bc9b000ab.origin, loc.origin, level.framedurationseconds, color);
                        /#
                            print3d(loc.origin, "spectator" + key + "white" + laneKey + "bothTeams" + team, color, 1, 5, 1, 1);
                        #/
                    }
                }
                foreach (team, loc in var_a2d0446bc9b000ab.var_d8c8ec702b9afd80) {
                    color = ter_op(team == "axis", (1, 0, 0), (0, 0, 1)) * ter_op(level.var_48e03f24b9b5c1a == key, 1, 0.5);
                    level thread namespace_f2ffc0540883e1ad::drawline(var_a2d0446bc9b000ab.origin, loc.origin, level.framedurationseconds, color);
                    /#
                        print3d(loc.origin, "time" + key + "white" + laneKey + "bothTeams" + team, color, 1, 5, 1, 1);
                    #/
                }
                foreach (team, loc in var_a2d0446bc9b000ab.var_e59f791d76c7beee) {
                    color = ter_op(team == "axis", (1, 0, 0), (0, 0, 1)) * ter_op(level.var_48e03f24b9b5c1a == key, 1, 0.5);
                    level thread namespace_f2ffc0540883e1ad::drawline(var_a2d0446bc9b000ab.origin, loc.origin, level.framedurationseconds, color);
                    /#
                        print3d(loc.origin, "frontline_moved" + key + "white" + laneKey + "bothTeams" + team, color, 1, 5, 1, 1);
                    #/
                }
                foreach (team, loc in var_a2d0446bc9b000ab.redeployspawn) {
                    level thread namespace_f2ffc0540883e1ad::drawline(loc.origin - (0, 0, 500), loc.origin + (0, 0, 500), level.framedurationseconds, (0, 1, 0));
                }
                if (key + 1 < level.frontlineData.size) {
                    color = (1, 1, 1);
                    if (istrue(level.var_828f62c79774ee99)) {
                        color = (1, 1, 0);
                    }
                    level thread namespace_f2ffc0540883e1ad::drawline(var_a2d0446bc9b000ab.origin, level.frontlineData[key + 1].var_a2d0446bc9b000ab[laneKey].origin, level.framedurationseconds, color);
                }
                if (isdefined(prev)) {
                    startpos = prev;
                    endpos = var_a2d0446bc9b000ab.origin;
                    var_949fc3545f13ffb0 = (0.5, 0.5, 0.5);
                    if (istrue(level.var_3813c5843955e260)) {
                        var_949fc3545f13ffb0 = (0, 1, 1);
                    }
                    color = ter_op(level.var_48e03f24b9b5c1a == key, (0, 1, 0), var_949fc3545f13ffb0);
                    level thread namespace_f2ffc0540883e1ad::drawline(startpos, endpos, level.framedurationseconds, color);
                }
                prev = var_a2d0446bc9b000ab.origin;
            }
        }
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9270
// Size: 0x12b
function function_d9730dbc16ce09e2() {
    while (1) {
        var_e4c7b343246f2158 = namespace_b41002c7afebd276::getfrontlineteamcenter("axis");
        if (!isdefined(var_e4c7b343246f2158)) {
            var_e4c7b343246f2158 = level.gw_objstruct.axishqloc.trigger.origin;
        }
        var_aac62807b84149b5 = namespace_b41002c7afebd276::getfrontlineteamcenter("allies");
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

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x93a2
// Size: 0x142
function function_81add84c2385a7ee() {
    while (!isdefined(level.var_ae5271d2ed773311)) {
        waitframe();
    }
    while (1) {
        agents = [];
        foreach (team in level.teamnamelist) {
            foreach (var_a2d0446bc9b000ab in level.var_ae5271d2ed773311[team]) {
                agents = array_combine(agents, var_a2d0446bc9b000ab.var_e2c31580f508b878);
            }
        }
        if (agents.size > 0) {
            var_f95feb63c772e28f = namespace_235de5057ddc58e0::getaverageorigin(agents);
            level.var_279807e5da6c6a18["agent"].origin = (var_f95feb63c772e28f[0], var_f95feb63c772e28f[1], level.gw_objstruct.axishqloc.trigger.origin[2]);
        }
        waitframe();
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x94eb
// Size: 0x9ec
function function_ade21f3382e7e29a() {
    var_3767296e0c6cab78 = getstructarray("frontlineData", "script_noteworthy");
    if (!isdefined(var_3767296e0c6cab78) || var_3767296e0c6cab78.size == 0) {
        var_3767296e0c6cab78 = function_e7b7b3f8010440fa();
    }
    level.var_9de3c802fced05e2 = [];
    level.var_9de3c802fced05e2["axis"] = [];
    level.var_9de3c802fced05e2["allies"] = [];
    level.var_3bf1cf107e60e048 = [];
    level.var_3bf1cf107e60e048["axis"] = [];
    level.var_3bf1cf107e60e048["allies"] = [];
    var_de1e630f4ea7f25c = [];
    foreach (item in var_3767296e0c6cab78) {
        Keep = 1;
        foreach (var_87137da4020a50a1 in var_de1e630f4ea7f25c) {
            if (distance2dsquared(item.origin, var_87137da4020a50a1.origin) < 16384) {
                Keep = 0;
                break;
            }
        }
        if (Keep) {
            var_de1e630f4ea7f25c[var_de1e630f4ea7f25c.size] = item;
        }
    }
    var_3767296e0c6cab78 = var_de1e630f4ea7f25c;
    foreach (data in var_3767296e0c6cab78) {
        if (!isdefined(data.angles)) {
            data.angles = (0, 0, 0);
        }
        data.forward = anglestoforward(data.angles);
        data.right = anglestoright(data.angles);
        data.radius = randomfloatrange(2048, 4096);
        data.var_b027d6857ab9d713 = data.origin - data.right * data.radius;
        data.maxpoint = data.origin + data.right * data.radius;
        var_2fd222665175df1b = getstructarray(data.target, "targetname");
        if (isdefined(var_2fd222665175df1b) && var_2fd222665175df1b.size > 0) {
            var_a2d0446bc9b000ab = spawnstruct();
            var_a2d0446bc9b000ab = [];
            foreach (var_d8172e39edf4d70a in var_2fd222665175df1b) {
                if (issubstr(var_d8172e39edf4d70a.script_noteworthy, "center")) {
                    continue;
                }
                laneKey = int(strtok(var_d8172e39edf4d70a.script_noteworthy, "_")[1]) - 1;
                if (!isdefined(var_a2d0446bc9b000ab[laneKey])) {
                    var_a2d0446bc9b000ab[laneKey] = spawnstruct();
                    var_a2d0446bc9b000ab[laneKey].var_45d6f1c931bc6a8b = [];
                    var_a2d0446bc9b000ab[laneKey].var_e59f791d76c7beee = [];
                    var_a2d0446bc9b000ab[laneKey].var_d8c8ec702b9afd80 = [];
                }
                if (!isdefined(var_d8172e39edf4d70a.script_team)) {
                    var_d8172e39edf4d70a.script_team = "axis";
                }
                var_d8172e39edf4d70a.radius = 1024;
                volumes = getentarray("frontline0" + int(data.script_label) + 1 + "_lane0" + int(laneKey) + 1 + "_" + var_d8172e39edf4d70a.script_team, "script_noteworthy");
                var_d8172e39edf4d70a.goalvolume = volumes[0];
                var_64e328c24147bdf = "frontline0" + int(data.script_label) + 1 + "_lane0" + int(laneKey) + 1 + "_front_" + var_d8172e39edf4d70a.script_team;
                volumes = getentarray(var_64e328c24147bdf, "script_noteworthy");
                var_a2d0446bc9b000ab[laneKey].var_e59f791d76c7beee[var_d8172e39edf4d70a.script_team] = volumes[0];
                var_cf3ac540ca289c49 = "frontline0" + int(data.script_label) + 1 + "_lane0" + int(laneKey) + 1 + "_back_" + var_d8172e39edf4d70a.script_team;
                volumes = getentarray(var_cf3ac540ca289c49, "script_noteworthy");
                var_a2d0446bc9b000ab[laneKey].var_d8c8ec702b9afd80[var_d8172e39edf4d70a.script_team] = volumes[0];
                if (!isdefined(var_a2d0446bc9b000ab[laneKey].var_45d6f1c931bc6a8b[var_d8172e39edf4d70a.script_team])) {
                    var_a2d0446bc9b000ab[laneKey].var_45d6f1c931bc6a8b[var_d8172e39edf4d70a.script_team] = [];
                }
                var_a2d0446bc9b000ab[laneKey].var_45d6f1c931bc6a8b[var_d8172e39edf4d70a.script_team][var_a2d0446bc9b000ab[laneKey].var_45d6f1c931bc6a8b[var_d8172e39edf4d70a.script_team].size] = var_d8172e39edf4d70a;
            }
            foreach (var_d8172e39edf4d70a in var_2fd222665175df1b) {
                if (issubstr(var_d8172e39edf4d70a.script_noteworthy, "center")) {
                    laneKey = int(strtok(var_d8172e39edf4d70a.script_noteworthy, "_")[1]) - 1;
                    var_a2d0446bc9b000ab[laneKey].origin = var_d8172e39edf4d70a.origin;
                }
            }
            foreach (laneKey, lane in var_a2d0446bc9b000ab) {
                if (!isdefined(lane.origin)) {
                    /#
                        assertmsg("Lane " + laneKey + " is missing the center origin, defaulting to averagePos.");
                    #/
                    var_a76e5428020d35cc = (0, 0, 0);
                    count = 0;
                    foreach (var_45d6f1c931bc6a8b in lane.var_45d6f1c931bc6a8b) {
                        foreach (point in var_45d6f1c931bc6a8b) {
                            var_a76e5428020d35cc = var_a76e5428020d35cc + point.origin;
                            count++;
                        }
                    }
                    lane.origin = var_a76e5428020d35cc / count;
                }
            }
            data.var_a2d0446bc9b000ab = var_a2d0446bc9b000ab;
        } else {
            data.var_a2d0446bc9b000ab = function_49294d0067cb3c96(data);
        }
        if (isdefined(data.var_a2d0446bc9b000ab[0])) {
            var_54039817f24f4fe0 = vectornormalize(data.var_a2d0446bc9b000ab[0].origin - data.var_a2d0446bc9b000ab[data.var_a2d0446bc9b000ab.size - 1].origin);
            data.right = var_54039817f24f4fe0;
            data.forward = vectorcross(var_54039817f24f4fe0, (0, 0, 1));
            data.radius = randomfloatrange(2048, 4096);
            data.var_b027d6857ab9d713 = data.var_a2d0446bc9b000ab[0].origin;
            data.maxpoint = data.var_a2d0446bc9b000ab[data.var_a2d0446bc9b000ab.size - 1].origin;
        }
    }
    var_4ea385ac02f17acf = [];
    foreach (data in var_3767296e0c6cab78) {
        var_4ea385ac02f17acf[int(data.script_label)] = data;
    }
    var_2535e9ea6de28fd1 = getdvar(@"hash_3560171963b3f075", "");
    var_2535e9ea6de28fd1 = strtok(var_2535e9ea6de28fd1, " ");
    var_60598d075fc9cbb1 = [];
    if (var_2535e9ea6de28fd1.size > 0) {
        var_ea979e5182f4f74d = var_4ea385ac02f17acf.size;
        foreach (var_9f31b5ca38890225 in var_2535e9ea6de28fd1) {
            var_4ea385ac02f17acf = array_remove_key(var_4ea385ac02f17acf, int(var_9f31b5ca38890225));
        }
        var_af79951156a8d90e = 0;
        for (var_dd065e195e9d06b3 = 0; var_af79951156a8d90e < var_4ea385ac02f17acf.size; var_dd065e195e9d06b3++) {
            if (isdefined(var_4ea385ac02f17acf[var_dd065e195e9d06b3])) {
                var_60598d075fc9cbb1[var_af79951156a8d90e] = var_4ea385ac02f17acf[var_dd065e195e9d06b3];
                var_af79951156a8d90e++;
            }
        }
    } else {
        var_60598d075fc9cbb1 = var_4ea385ac02f17acf;
    }
    level.frontlineData = var_60598d075fc9cbb1;
    function_f42e3ff44a92f156();
    flag_set("frontline_data_init");
    /#
        if (getdvarint(@"hash_c035e447af342805", 0) == 1) {
            level thread function_7bfc015c3d7ccaf8();
        }
    #/
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ede
// Size: 0x1a2
function function_f42e3ff44a92f156() {
    foreach (frontline in level.frontlineData) {
        foreach (var_a2d0446bc9b000ab in frontline.var_a2d0446bc9b000ab) {
            var_a2d0446bc9b000ab.var_e59f791d76c7beee["axis"].heading = function_767cea82b001f645(var_a2d0446bc9b000ab.var_e59f791d76c7beee["allies"].origin - var_a2d0446bc9b000ab.var_e59f791d76c7beee["axis"].origin);
            var_a2d0446bc9b000ab.var_e59f791d76c7beee["allies"].heading = var_a2d0446bc9b000ab.var_e59f791d76c7beee["axis"].heading * -1;
            var_a2d0446bc9b000ab.var_d8c8ec702b9afd80["axis"].heading = var_a2d0446bc9b000ab.var_e59f791d76c7beee["axis"].heading;
            var_a2d0446bc9b000ab.var_d8c8ec702b9afd80["allies"].heading = var_a2d0446bc9b000ab.var_e59f791d76c7beee["allies"].heading;
        }
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa087
// Size: 0x8e6
function function_cc492b99c56f8004() {
    foreach (frontline in level.frontlineData) {
        var_a2d0446bc9b000ab = frontline.var_a2d0446bc9b000ab[0];
        thread drawsphere(var_a2d0446bc9b000ab.var_e59f791d76c7beee["axis"].origin, 256, 60, (1, 0, 0));
        endpoint = var_a2d0446bc9b000ab.var_e59f791d76c7beee["axis"].origin + var_a2d0446bc9b000ab.var_e59f791d76c7beee["axis"].heading * 1024;
        level thread namespace_f2ffc0540883e1ad::drawline(var_a2d0446bc9b000ab.var_e59f791d76c7beee["axis"].origin, endpoint, 60, (0, 0, 1));
        var_a2d0446bc9b000ab = frontline.var_a2d0446bc9b000ab[1];
        thread drawsphere(var_a2d0446bc9b000ab.var_e59f791d76c7beee["axis"].origin, 256, 60, (1, 0, 0));
        endpoint = var_a2d0446bc9b000ab.var_e59f791d76c7beee["axis"].origin + var_a2d0446bc9b000ab.var_e59f791d76c7beee["axis"].heading * 1024;
        level thread namespace_f2ffc0540883e1ad::drawline(var_a2d0446bc9b000ab.var_e59f791d76c7beee["axis"].origin, endpoint, 60, (0, 0, 1));
        var_a2d0446bc9b000ab = frontline.var_a2d0446bc9b000ab[2];
        thread drawsphere(var_a2d0446bc9b000ab.var_e59f791d76c7beee["axis"].origin, 256, 60, (1, 0, 0));
        endpoint = var_a2d0446bc9b000ab.var_e59f791d76c7beee["axis"].origin + var_a2d0446bc9b000ab.var_e59f791d76c7beee["axis"].heading * 1024;
        level thread namespace_f2ffc0540883e1ad::drawline(var_a2d0446bc9b000ab.var_e59f791d76c7beee["axis"].origin, endpoint, 60, (0, 0, 1));
        var_a2d0446bc9b000ab = frontline.var_a2d0446bc9b000ab[0];
        thread drawsphere(var_a2d0446bc9b000ab.var_d8c8ec702b9afd80["axis"].origin, 256, 60, (1, 0, 0));
        endpoint = var_a2d0446bc9b000ab.var_d8c8ec702b9afd80["axis"].origin + var_a2d0446bc9b000ab.var_d8c8ec702b9afd80["axis"].heading * 1024;
        level thread namespace_f2ffc0540883e1ad::drawline(var_a2d0446bc9b000ab.var_d8c8ec702b9afd80["axis"].origin, endpoint, 60, (0, 0, 1));
        var_a2d0446bc9b000ab = frontline.var_a2d0446bc9b000ab[1];
        thread drawsphere(var_a2d0446bc9b000ab.var_d8c8ec702b9afd80["axis"].origin, 256, 60, (1, 0, 0));
        endpoint = var_a2d0446bc9b000ab.var_d8c8ec702b9afd80["axis"].origin + var_a2d0446bc9b000ab.var_d8c8ec702b9afd80["axis"].heading * 1024;
        level thread namespace_f2ffc0540883e1ad::drawline(var_a2d0446bc9b000ab.var_d8c8ec702b9afd80["axis"].origin, endpoint, 60, (0, 0, 1));
        var_a2d0446bc9b000ab = frontline.var_a2d0446bc9b000ab[2];
        thread drawsphere(var_a2d0446bc9b000ab.var_d8c8ec702b9afd80["axis"].origin, 256, 60, (1, 0, 0));
        endpoint = var_a2d0446bc9b000ab.var_d8c8ec702b9afd80["axis"].origin + var_a2d0446bc9b000ab.var_d8c8ec702b9afd80["axis"].heading * 1024;
        level thread namespace_f2ffc0540883e1ad::drawline(var_a2d0446bc9b000ab.var_d8c8ec702b9afd80["axis"].origin, endpoint, 60, (0, 0, 1));
        var_a2d0446bc9b000ab = frontline.var_a2d0446bc9b000ab[0];
        thread drawsphere(var_a2d0446bc9b000ab.var_e59f791d76c7beee["allies"].origin, 256, 60, (1, 0, 0));
        endpoint = var_a2d0446bc9b000ab.var_e59f791d76c7beee["allies"].origin + var_a2d0446bc9b000ab.var_e59f791d76c7beee["allies"].heading * 1024;
        level thread namespace_f2ffc0540883e1ad::drawline(var_a2d0446bc9b000ab.var_e59f791d76c7beee["allies"].origin, endpoint, 60, (0, 0, 1));
        var_a2d0446bc9b000ab = frontline.var_a2d0446bc9b000ab[1];
        thread drawsphere(var_a2d0446bc9b000ab.var_e59f791d76c7beee["allies"].origin, 256, 60, (1, 0, 0));
        endpoint = var_a2d0446bc9b000ab.var_e59f791d76c7beee["allies"].origin + var_a2d0446bc9b000ab.var_e59f791d76c7beee["allies"].heading * 1024;
        level thread namespace_f2ffc0540883e1ad::drawline(var_a2d0446bc9b000ab.var_e59f791d76c7beee["allies"].origin, endpoint, 60, (0, 0, 1));
        var_a2d0446bc9b000ab = frontline.var_a2d0446bc9b000ab[2];
        thread drawsphere(var_a2d0446bc9b000ab.var_e59f791d76c7beee["allies"].origin, 256, 60, (1, 0, 0));
        endpoint = var_a2d0446bc9b000ab.var_e59f791d76c7beee["allies"].origin + var_a2d0446bc9b000ab.var_e59f791d76c7beee["allies"].heading * 1024;
        level thread namespace_f2ffc0540883e1ad::drawline(var_a2d0446bc9b000ab.var_e59f791d76c7beee["allies"].origin, endpoint, 60, (0, 0, 1));
        var_a2d0446bc9b000ab = frontline.var_a2d0446bc9b000ab[0];
        thread drawsphere(var_a2d0446bc9b000ab.var_d8c8ec702b9afd80["allies"].origin, 256, 60, (1, 0, 0));
        endpoint = var_a2d0446bc9b000ab.var_d8c8ec702b9afd80["allies"].origin + var_a2d0446bc9b000ab.var_d8c8ec702b9afd80["allies"].heading * 1024;
        level thread namespace_f2ffc0540883e1ad::drawline(var_a2d0446bc9b000ab.var_d8c8ec702b9afd80["allies"].origin, endpoint, 60, (0, 0, 1));
        var_a2d0446bc9b000ab = frontline.var_a2d0446bc9b000ab[1];
        thread drawsphere(var_a2d0446bc9b000ab.var_d8c8ec702b9afd80["allies"].origin, 256, 60, (1, 0, 0));
        endpoint = var_a2d0446bc9b000ab.var_d8c8ec702b9afd80["allies"].origin + var_a2d0446bc9b000ab.var_d8c8ec702b9afd80["allies"].heading * 1024;
        level thread namespace_f2ffc0540883e1ad::drawline(var_a2d0446bc9b000ab.var_d8c8ec702b9afd80["allies"].origin, endpoint, 60, (0, 0, 1));
        var_a2d0446bc9b000ab = frontline.var_a2d0446bc9b000ab[2];
        thread drawsphere(var_a2d0446bc9b000ab.var_d8c8ec702b9afd80["allies"].origin, 256, 60, (1, 0, 0));
        endpoint = var_a2d0446bc9b000ab.var_d8c8ec702b9afd80["allies"].origin + var_a2d0446bc9b000ab.var_d8c8ec702b9afd80["allies"].heading * 1024;
        level thread namespace_f2ffc0540883e1ad::drawline(var_a2d0446bc9b000ab.var_d8c8ec702b9afd80["allies"].origin, endpoint, 60, (0, 0, 1));
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa974
// Size: 0x13e
function function_7bfc015c3d7ccaf8() {
    /#
        foreach (frontline in level.frontlineData) {
            for (i = 0; i < frontline.var_a2d0446bc9b000ab.size; i++) {
                frontline.var_a2d0446bc9b000ab[i].var_d8c8ec702b9afd80["gwtdm"] thread function_a63db87a3ce87a61((1, 0, 0));
                frontline.var_a2d0446bc9b000ab[i].var_e59f791d76c7beee["gwtdm"] thread function_a63db87a3ce87a61((1, 0, 0));
                frontline.var_a2d0446bc9b000ab[i].var_d8c8ec702b9afd80["head_sp_ally_mex_sf_tier_1_2_1"] thread function_a63db87a3ce87a61((0.5, 0.5, 1));
                frontline.var_a2d0446bc9b000ab[i].var_e59f791d76c7beee["head_sp_ally_mex_sf_tier_1_2_1"] thread function_a63db87a3ce87a61((0.5, 0.5, 1));
            }
        }
    #/
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaab9
// Size: 0x1f
function function_a63db87a3ce87a61(color) {
    /#
        thread namespace_3c37cb17ade254d::draw_entity_bounds(self, 200000, color, 0);
    #/
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaadf
// Size: 0x14f
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

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac36
// Size: 0x262
function function_49294d0067cb3c96(data) {
    level.var_828f62c79774ee99 = 1;
    var_2fd222665175df1b = [];
    var_813a0b907262a1c2 = 3;
    var_a6640e8fb7a2a52f = 3;
    startorigin = data.origin - data.right * data.radius;
    width = data.radius * 2;
    for (i = 0; i < var_813a0b907262a1c2; i++) {
        var_2ee094617021e62 = (i * 2 + 1) / var_813a0b907262a1c2 * 2;
        var_a2d0446bc9b000ab = spawnstruct();
        var_a2d0446bc9b000ab.origin = startorigin + data.right * var_2ee094617021e62 * width;
        var_a2d0446bc9b000ab.var_45d6f1c931bc6a8b = [];
        foreach (team in level.teamnamelist) {
            var_a2d0446bc9b000ab.var_45d6f1c931bc6a8b[team] = [];
            var_9fc5fbeae7221fb6 = vectordot(data.forward, level.spawnselectionteamforward[team]) < 0;
            if (var_a6640e8fb7a2a52f > 0) {
                var_a6640e8fb7a2a52f = 1 + randomint(var_a6640e8fb7a2a52f);
            } else {
                var_a6640e8fb7a2a52f = 1;
            }
            for (j = 0; j < var_a6640e8fb7a2a52f; j++) {
                centerorigin = var_a2d0446bc9b000ab.origin + data.forward * 1024 * 1.5 * ter_op(var_9fc5fbeae7221fb6, 1, -1);
                struct = spawnstruct();
                struct.origin = namespace_c5622898120e827f::getrandompointincircle(centerorigin, 512);
                struct.team = team;
                struct.radius = randomfloatrange(256, 512);
                var_a2d0446bc9b000ab.var_45d6f1c931bc6a8b[team][var_a2d0446bc9b000ab.var_45d6f1c931bc6a8b[team].size] = struct;
            }
        }
        var_2fd222665175df1b[var_2fd222665175df1b.size] = var_a2d0446bc9b000ab;
    }
    return var_2fd222665175df1b;
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaea0
// Size: 0x3f
function function_3cab19163f3e50d3(team, var_e9bf3955fa1125b5, laneKey) {
    return level.frontlineData[var_e9bf3955fa1125b5].var_a2d0446bc9b000ab[laneKey].var_45d6f1c931bc6a8b[team];
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaee7
// Size: 0x49
function function_7bb4716ac5c42f7c(team, laneKey) {
    return level.var_ae5271d2ed773311[team][laneKey].var_f76e10d4dce6c204[randomint(level.var_ae5271d2ed773311[team][laneKey].var_f76e10d4dce6c204.size)];
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf38
// Size: 0x277
function function_a998ab000df3c84c(origin, team, laneKey) {
    volumes = [];
    foreach (frontline in level.frontlineData) {
        foreach (index, var_a2d0446bc9b000ab in frontline.var_a2d0446bc9b000ab) {
            if (isdefined(laneKey) && laneKey != index) {
                continue;
            }
            if (var_a2d0446bc9b000ab.var_d8c8ec702b9afd80.size > 0) {
                foreach (index1, volume in var_a2d0446bc9b000ab.var_d8c8ec702b9afd80) {
                    if (isdefined(team) && team != index1) {
                        continue;
                    }
                    volumes[volumes.size] = volume;
                }
                foreach (index2, volume in var_a2d0446bc9b000ab.var_e59f791d76c7beee) {
                    if (isdefined(team) && team != index2) {
                        continue;
                    }
                    volumes[volumes.size] = volume;
                }
            } else {
                foreach (var_5a488b6bae78089c, var_897c7c54286a3b86 in var_a2d0446bc9b000ab.var_45d6f1c931bc6a8b) {
                    if (isdefined(team) && team != var_5a488b6bae78089c) {
                        continue;
                    }
                    foreach (var_2c34125a01d24d3f in var_897c7c54286a3b86) {
                        volumes[volumes.size] = var_2c34125a01d24d3f.goalvolume;
                    }
                }
            }
        }
    }
    volumes = sortbydistance(volumes, origin);
    return volumes[0];
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb1b7
// Size: 0x1a8
function function_ff46cb0a3bc4b055(agent, team, laneKey) {
    array = [];
    index = 0;
    increment = 1;
    if (team == "allies") {
        index = level.frontlineData.size - 1;
        increment = -1;
    }
    while (index != level.var_48e03f24b9b5c1a) {
        var_45d6f1c931bc6a8b = level.frontlineData[index].var_a2d0446bc9b000ab[laneKey].var_45d6f1c931bc6a8b[team];
        var_fe55d7604cef0e3a = var_45d6f1c931bc6a8b[randomint(var_45d6f1c931bc6a8b.size)];
        array[array.size] = var_fe55d7604cef0e3a.origin;
        index = index + increment;
    }
    var_45d6f1c931bc6a8b = level.frontlineData[level.var_48e03f24b9b5c1a].var_a2d0446bc9b000ab[laneKey].var_45d6f1c931bc6a8b[team];
    var_fe55d7604cef0e3a = var_45d6f1c931bc6a8b[randomint(var_45d6f1c931bc6a8b.size)];
    array[array.size] = var_fe55d7604cef0e3a.origin;
    var_2adfaf68bc38ddbc = [];
    foreach (origin in array) {
        var_a011729d000a28d2 = vectornormalize(origin - agent.origin);
        if (vectordot(level.spawnselectionteamforward[team], var_a011729d000a28d2) > 0) {
            var_2adfaf68bc38ddbc[var_2adfaf68bc38ddbc.size] = origin;
        }
    }
    return var_2adfaf68bc38ddbc;
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb367
// Size: 0x2ba
function function_f16652e1462a3739() {
    if (getdvarint(@"hash_279375a0bfb2862f", 120) == 0) {
        return;
    }
    level.var_72e8a99508b7be1b = getdvarint(@"hash_55d8273e8c59f973", 45);
    level.var_b747ee617515989a = getdvarint(@"hash_9b987a555b7e16af", 256);
    level.var_c7a4725d05bb7f22 = 1;
    level.var_72f834b3f8b2a366 = [];
    level.var_72f834b3f8b2a366["axis"] = "aq_gwtdm";
    level.var_72f834b3f8b2a366["allies"] = "pmc";
    level thread namespace_b27abd42d87cb8c0::init();
    namespace_bfef6903bca5845d::init();
    function_7f995b3e1538a773();
    namespace_bfef6903bca5845d::function_93add0b65db9f722(&function_5cd456d9b2cdc538, level);
    level.var_9d28d5b70aa9f5e4 = &function_91fd6f5b51fc3635;
    flag_wait("frontline_data_init");
    level.var_ae5271d2ed773311 = [];
    level.var_b21aafd3e06b203d = 1;
    foreach (team in level.teamnamelist) {
        level.var_ae5271d2ed773311[team] = [];
        foreach (laneKey, var_a2d0446bc9b000ab in level.frontlineData[0].var_a2d0446bc9b000ab) {
            data = spawnstruct();
            data.laneKey = laneKey;
            data.var_83cf1c64372dcca5 = level.var_72e8a99508b7be1b / level.frontlineData[0].var_a2d0446bc9b000ab.size;
            data.var_f76e10d4dce6c204 = function_3cab19163f3e50d3(team, level.var_48e03f24b9b5c1a, laneKey);
            data.var_e2c31580f508b878 = [];
            data.var_8e55c5943a080a2e = 0;
            level.var_ae5271d2ed773311[team][laneKey] = data;
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
    while (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        waitframe();
    }
    level thread function_37169a4fb87a0e3();
    level thread function_b34021ca662a03bd();
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb628
// Size: 0x1e0
function function_91fd6f5b51fc3635(agent, var_772edbdcfe906c73) {
    if (!isalive(agent)) {
        return;
    }
    agent endon("death");
    team = namespace_14d36171baccf528::agentPers_getAgentPersData(agent, "team");
    if (!isgameplayteam(team)) {
        return;
    }
    laneKey = namespace_14d36171baccf528::agentPers_getAgentPersData(agent, "laneKey");
    if (!isdefined(laneKey)) {
        return;
    }
    if (!isdefined(agent.var_630cf5f5ee1c2d64)) {
        agent.var_630cf5f5ee1c2d64 = 1;
    }
    agent.var_630cf5f5ee1c2d64++;
    if (agent.var_630cf5f5ee1c2d64 == 3) {
        var_421e96e09a60042 = function_a998ab000df3c84c(agent.origin, team, laneKey);
        agent cleargoalvolume();
        agent setgoalvolumeauto(var_421e96e09a60042, var_421e96e09a60042.heading);
        wait(5);
        return;
    }
    if (agent.var_630cf5f5ee1c2d64 > 10) {
        agent.var_416835640e8c55cd = 1;
        return;
    }
    var_cb61f2f08271e0be = function_ff46cb0a3bc4b055(agent, team, laneKey);
    if (var_cb61f2f08271e0be.size > 0) {
        agent.var_cb61f2f08271e0be = var_cb61f2f08271e0be;
        agent thread function_8d8f7c8f7d567eb6();
        agent thread rushOriginRemover();
        agent thread namespace_2000a83505151e5b::function_65f6a39e1083fb6b(agent, agent.var_cb61f2f08271e0be, 1024, 1024, 1024);
    } else {
        agent.var_cb61f2f08271e0be = [];
        var_fe55d7604cef0e3a = function_7bb4716ac5c42f7c(team, laneKey);
        var_1f48f987ba8392d0 = level.var_b747ee617515989a * 3;
        origin = getclosestpointonnavmesh(var_fe55d7604cef0e3a.origin + (randomfloatrange(var_1f48f987ba8392d0 * -1, var_1f48f987ba8392d0), randomfloatrange(var_1f48f987ba8392d0 * -1, var_1f48f987ba8392d0), 0));
        agent thread namespace_2000a83505151e5b::function_a5117518725da028(agent, origin);
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb80f
// Size: 0x2cb
function function_4c7945217f8adffa(agent, laneKey) {
    namespace_14d36171baccf528::agentPers_setAgentPersData(agent, "team", agent.team);
    if (!isdefined(laneKey)) {
        laneKey = random(getarraykeys(level.frontlineData[level.var_48e03f24b9b5c1a].var_a2d0446bc9b000ab));
    }
    namespace_14d36171baccf528::agentPers_setAgentPersData(agent, "laneKey", laneKey);
    level.var_3bf1cf107e60e048[agent.team][level.var_3bf1cf107e60e048[agent.team].size] = agent;
    agent.var_d0038b3cf5c426eb = 1;
    agent.var_5966903b1e0154e5 = 0;
    var_53407127d58e754d = 0;
    foreach (team in level.teamnamelist) {
        foreach (var_ff5b80567acf9b98, struct in level.var_ae5271d2ed773311[team]) {
            if (array_contains(level.var_ae5271d2ed773311[team][var_ff5b80567acf9b98].var_e2c31580f508b878, agent)) {
                level.var_ae5271d2ed773311[team][var_ff5b80567acf9b98].var_e2c31580f508b878 = array_remove(level.var_ae5271d2ed773311[team][var_ff5b80567acf9b98].var_e2c31580f508b878, agent);
                var_53407127d58e754d = 1;
                break;
            }
        }
        if (var_53407127d58e754d) {
            break;
        }
    }
    level.var_ae5271d2ed773311[agent.team][laneKey].var_e2c31580f508b878[level.var_ae5271d2ed773311[agent.team][laneKey].var_e2c31580f508b878.size] = agent;
    if (agent.team == "axis" || istrue(agent.var_76f8ddb1563464bd)) {
        body = undefined;
        head = undefined;
    } else {
        body = undefined;
        head = undefined;
        agent.var_76f8ddb1563464bd = 1;
    }
    var_a664aad02ee98bd2 = namespace_14d36171baccf528::function_ba0801276542946b();
    grenadeammo = getdvarint(@"hash_2e7cc22bee3354df", 1);
    agent namespace_14d36171baccf528::function_c37c4f9d687074ff(body, head, undefined, var_a664aad02ee98bd2, grenadeammo);
    namespace_bfef6903bca5845d::function_c9dad3876b9d8755(agent, "gwtdm");
    agent.var_1544c20e168d97c0 = 10000;
    agent thread function_da90e4dd433678f9();
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbae1
// Size: 0x9f
function function_642c7058d0a89b47(team) {
    var_21ac360fe57642d6 = undefined;
    var_4d6bd6d4c0e080b6 = undefined;
    foreach (laneKey, var_a2d0446bc9b000ab in level.var_ae5271d2ed773311[team]) {
        count = var_a2d0446bc9b000ab.var_e2c31580f508b878.size;
        if (!isdefined(var_4d6bd6d4c0e080b6) || count < var_4d6bd6d4c0e080b6) {
            var_4d6bd6d4c0e080b6 = count;
            var_21ac360fe57642d6 = laneKey;
        }
    }
    return var_21ac360fe57642d6;
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbb88
// Size: 0xbb
function function_b983381333b3881b(origin) {
    var_62d0d46f9855096f = undefined;
    closestdist = undefined;
    for (key = 0; key < level.frontlineData.size; key++) {
        data = level.frontlineData[key];
        for (laneKey = 0; laneKey < data.var_a2d0446bc9b000ab.size; laneKey++) {
            dist = distance2dsquared(data.var_a2d0446bc9b000ab[laneKey].origin, origin);
            if (!isdefined(closestdist) || dist < closestdist) {
                closestdist = dist;
                var_62d0d46f9855096f = laneKey;
            }
        }
    }
    return var_62d0d46f9855096f;
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbc4b
// Size: 0xa7
function function_c9e5e3858ab1805f(agent) {
    laneKey = function_642c7058d0a89b47(agent.team);
    function_4c7945217f8adffa(agent, laneKey);
    agent.var_d6eb429048e1a4b5 = 1;
    success = function_2da93e2a35e2182f(agent, agent.team, level.var_48e03f24b9b5c1a, laneKey);
    if (!success) {
        agent.var_cb61f2f08271e0be = function_ff46cb0a3bc4b055(agent, agent.team, laneKey);
        agent thread namespace_2000a83505151e5b::function_65f6a39e1083fb6b(agent, agent.var_cb61f2f08271e0be, 1024, 1024, 1024);
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbcf9
// Size: 0xa7
function function_b744a1a8b7dabb6c(agent) {
    laneKey = function_b983381333b3881b(agent.origin);
    function_4c7945217f8adffa(agent, laneKey);
    agent.var_d6eb429048e1a4b5 = 1;
    success = function_2da93e2a35e2182f(agent, agent.team, level.var_48e03f24b9b5c1a, laneKey);
    if (!success) {
        agent.var_cb61f2f08271e0be = function_ff46cb0a3bc4b055(agent, agent.team, laneKey);
        agent thread namespace_2000a83505151e5b::function_65f6a39e1083fb6b(agent, agent.var_cb61f2f08271e0be, 1024, 1024, 1024);
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbda7
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

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf01
// Size: 0x84
function function_da90e4dd433678f9() {
    self endon("death");
    while (1) {
        waitframe();
        if (getdvarint(@"hash_997720413afa2a67", 0) == 0) {
            continue;
        }
        color = ter_op(self.team == "allies", (0, 0, 1), (1, 0, 0));
        level thread namespace_f2ffc0540883e1ad::drawsphere(self gettagorigin("j_spinelower"), 32, level.framedurationseconds, color);
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf8c
// Size: 0xf8
function function_8d8f7c8f7d567eb6() {
    self endon("death");
    while (1) {
        waitframe();
        if (!isdefined(self.var_cb61f2f08271e0be) || self.var_cb61f2f08271e0be.size == 0) {
            break;
        }
        if (getdvarint(@"hash_90faa795702e8f9", 0) == 0) {
            continue;
        }
        startpos = self.origin;
        endpos = self.var_cb61f2f08271e0be[0];
        level thread namespace_f2ffc0540883e1ad::drawline(startpos, endpos, level.framedurationseconds, (0, 1, 0));
        for (i = 0; i < self.var_cb61f2f08271e0be.size - 1; i++) {
            startpos = self.var_cb61f2f08271e0be[i];
            endpos = self.var_cb61f2f08271e0be[i + 1];
            level thread namespace_f2ffc0540883e1ad::drawline(startpos, endpos, level.framedurationseconds, (1, 1, 0));
        }
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc08b
// Size: 0x71
function rushOriginRemover() {
    self notify("rushOriginRemover");
    self endon("rushOriginRemover");
    self endon("death");
    while (1) {
        self waittill("combatRushComplete");
        var_cb61f2f08271e0be = [];
        for (i = 1; i < self.var_cb61f2f08271e0be.size; i++) {
            var_cb61f2f08271e0be[var_cb61f2f08271e0be.size] = self.var_cb61f2f08271e0be[i];
        }
        self.var_cb61f2f08271e0be = var_cb61f2f08271e0be;
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc103
// Size: 0x1cc
function function_6ad69ddd2454e5b3() {
    while (1) {
        waitframe();
        var_e9bf3955fa1125b5 = getdvarint(@"hash_91b9c2673018accc", -1);
        laneKey = getdvarint(@"hash_7fc4e6c8f23e5735", -1);
        if (var_e9bf3955fa1125b5 == -1 || laneKey == -1) {
            continue;
        }
        setdvar(@"hash_91b9c2673018accc", -1);
        setdvar(@"hash_7fc4e6c8f23e5735", -1);
        foreach (team in level.teamnamelist) {
            var_45d6f1c931bc6a8b = function_3cab19163f3e50d3(team, var_e9bf3955fa1125b5, laneKey);
            var_eb8decd97308075c = var_45d6f1c931bc6a8b[randomint(var_45d6f1c931bc6a8b.size)].origin;
            groupname = function_78759441c259f58a(var_eb8decd97308075c);
            numagents = 5;
            var_cf2ff249c028b242 = namespace_bfef6903bca5845d::function_ab14d6652e44fda0(numagents, undefined, level.var_c7a4725d05bb7f22, "gwtdm");
            var_cf2ff249c028b242.var_83c3368707c68e6 = "Helicopter";
            var_b58631347b6ab04 = namespace_7ae25d9e5d5a28ef::function_3779deb97b61a65(numagents, var_eb8decd97308075c, "medium", "everybody", "captureAgents", groupname, team, 0, undefined, undefined, undefined, var_cf2ff249c028b242, 1, 1);
            foreach (agent in var_b58631347b6ab04) {
                function_4c7945217f8adffa(agent, laneKey);
            }
        }
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc2d6
// Size: 0x353
function function_6b1cbd26d1b252b4(var_34ce337e073a0c34, var_93390a6953905fef, team) {
    var_4f922af45d0cac6c = undefined;
    if (0) {
        level thread namespace_d028276791d9cff6::drawsphere(var_34ce337e073a0c34, 32, 60, (1, 1, 1));
    }
    closestpoint = pointonsegmentnearesttopoint(level.frontlineData[level.var_48e03f24b9b5c1a].var_b027d6857ab9d713, level.frontlineData[level.var_48e03f24b9b5c1a].maxpoint, var_34ce337e073a0c34);
    if (0) {
        level thread namespace_d028276791d9cff6::drawsphere(closestpoint, 32, 60, (0, 1, 1));
    }
    var_4f922af45d0cac6c = sortbydistance(level.heliReinforceStruct.var_4f922af45d0cac6c, closestpoint);
    var_581c052b571d00a6 = 5;
    if (istrue(var_93390a6953905fef)) {
        var_581c052b571d00a6 = 1;
    }
    var_7127e3e9d3a5ba23 = [];
    foreach (loc in var_4f922af45d0cac6c) {
        if (var_7127e3e9d3a5ba23.size == var_581c052b571d00a6) {
            break;
        }
        if (namespace_d9c77dc2a6fe29c6::ispointinoutofbounds(loc.origin, team)) {
            continue;
        }
        var_54ee4011e4c0877e = vectornormalize(level.frontlineData[level.var_48e03f24b9b5c1a].origin - loc.origin);
        if (vectordot(level.spawnselectionteamforward[team], var_54ee4011e4c0877e) < 0) {
            continue;
        }
        var_cc6ce1cc9644a2a = pointonsegmentnearesttopoint(level.frontlineData[level.var_48e03f24b9b5c1a].var_b027d6857ab9d713, level.frontlineData[level.var_48e03f24b9b5c1a].maxpoint, loc.origin);
        mindist = getdvarint(@"hash_8ea81d61879b569f", 3000);
        mindistsq = mindist * mindist;
        distsq = distance2dsquared(loc.origin, var_cc6ce1cc9644a2a);
        if (distsq < mindistsq) {
            if (0) {
                level thread drawsphere(loc.origin, 32, 60, (1, 0, 0));
                level thread drawline(var_cc6ce1cc9644a2a, loc.origin, 60, (1, 0, 0));
            }
            continue;
        } else {
            if (0) {
                level thread namespace_d028276791d9cff6::drawsphere(loc.origin, 32, 60, (0, 1, 0));
                level thread drawline(var_cc6ce1cc9644a2a, loc.origin, 60, (0, 1, 0));
            }
            var_7127e3e9d3a5ba23[var_7127e3e9d3a5ba23.size] = loc;
        }
    }
    if (!istrue(level.var_85e83f382aedc103)) {
        var_7127e3e9d3a5ba23 = array_randomize(var_7127e3e9d3a5ba23);
    }
    pathnode = namespace_7ae25d9e5d5a28ef::function_321665dcdcbf401e(var_7127e3e9d3a5ba23, var_34ce337e073a0c34);
    if (isdefined(pathnode)) {
        pathnode function_35f1fc50bba61a84();
        return pathnode;
    }
    pathnode = namespace_7ae25d9e5d5a28ef::function_321665dcdcbf401e(var_4f922af45d0cac6c, var_34ce337e073a0c34, var_581c052b571d00a6);
    if (isdefined(pathnode)) {
        pathnode function_35f1fc50bba61a84();
        return pathnode;
    }
    return undefined;
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc631
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

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc69f
// Size: 0x19c
function function_5cd456d9b2cdc538(agent, attacker) {
    if (isdefined(attacker) && isdefined(attacker.owner)) {
        attacker = attacker.owner;
    }
    team = namespace_14d36171baccf528::agentPers_getAgentPersData(agent, "team");
    if (isdefined(attacker) && isplayer(attacker) && !isagent(attacker) && !is_equal(attacker.team, team)) {
        namespace_e8a49b70d0769b66::giveteamscoreforobjective(attacker.team, level.var_55328518d6fb7d07, 0);
        if (getdvarint(@"hash_2e405e2912dc4a44", 0) == 1) {
            attacker thread namespace_62c556437da28f50::scoreeventpopup(function_2ef675c13ca1c4af(#"hash_2c8bcbb02ec7ff9b", level.var_55328518d6fb7d07));
        }
        attacker incpersstat("contribution", level.var_55328518d6fb7d07);
        attacker setextrascore0(attacker.pers["contribution"]);
        if (isplayer(attacker)) {
            var_4da4cb52d0bf5b05 = 0;
            var_4da4cb52d0bf5b05 = var_4da4cb52d0bf5b05 + 2;
            var_4da4cb52d0bf5b05 = var_4da4cb52d0bf5b05 + (level.var_55328518d6fb7d07 << 4);
            attacker namespace_310ba947928891df::function_417749e099f041f(var_4da4cb52d0bf5b05, -1);
        }
    }
    laneKey = namespace_14d36171baccf528::agentPers_getAgentPersData(agent, "laneKey");
    if (!isdefined(namespace_14d36171baccf528::agentPers_getAgentPersData(agent, "laneKey")) || !isgameplayteam(team)) {
        return;
    }
    level.var_ae5271d2ed773311[team][laneKey].var_e2c31580f508b878 = array_remove(level.var_ae5271d2ed773311[team][laneKey].var_e2c31580f508b878, agent);
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc842
// Size: 0x1ee
function function_848d0782943b416d(team) {
    var_d5e5d93f3a939362 = getdvarint(@"hash_a190addb512ec71a", 2);
    var_c0e1f16535e4fa15 = getdvarint(@"hash_60235d2ae0550bc5", 6);
    var_68299821ad1626e0 = getdvarint(@"hash_bad4b491469253ef", 30) * 1000;
    var_db6af0a1c5db4e1f = getdvarint(@"hash_289d6da5e0aff476", 1);
    var_35c0e0d47ea5452f = "gw_fob_" + team + "HQ";
    var_b5b1784d5a1327c7 = "spawnHQ_" + team;
    function_ba4022744dce59f6(var_b5b1784d5a1327c7, int(level.var_72e8a99508b7be1b * 1.5));
    function_c9189ff5d2e5af61(team, var_db6af0a1c5db4e1f, var_c0e1f16535e4fa15);
    wait(getdvarfloat(@"hash_eb2244b6b2a89169", 15));
    while (1) {
        wait(5);
        currenttime = gettime();
        if (!function_8c6dbb64c8e1603c(var_d5e5d93f3a939362)) {
            continue;
        }
        foreach (laneKey, var_a2d0446bc9b000ab in level.var_ae5271d2ed773311[team]) {
            if (var_a2d0446bc9b000ab.var_e2c31580f508b878.size >= var_a2d0446bc9b000ab.var_83cf1c64372dcca5 - 1) {
                continue;
            }
            success = 0;
            if (var_db6af0a1c5db4e1f && (currenttime > var_a2d0446bc9b000ab.var_8e55c5943a080a2e + var_68299821ad1626e0 || var_a2d0446bc9b000ab.var_8e55c5943a080a2e == 0)) {
                success = level function_33d2a7321a928b5a(var_c0e1f16535e4fa15, team, level.var_48e03f24b9b5c1a, laneKey);
                if (success) {
                    var_a2d0446bc9b000ab.var_8e55c5943a080a2e = currenttime;
                }
            }
            if (!success) {
                level function_21b7e8662f68614d(var_d5e5d93f3a939362, team, laneKey);
            }
        }
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xca37
// Size: 0x1d5
function function_c9189ff5d2e5af61(team, var_db6af0a1c5db4e1f, var_c0e1f16535e4fa15) {
    namespace_d576b6dc7cef9c62::waitforplayers(level.prematchperiod, 0, 0);
    var_5fb0d98b1b6f539d = 1;
    if (getdvarint(@"hash_3d8fbe08639da15a", 1) == 0) {
        var_5fb0d98b1b6f539d = 0;
    }
    var_7e85664e3cbfab82 = ter_op(var_db6af0a1c5db4e1f && var_5fb0d98b1b6f539d, 0, 1);
    var_d17108f1e24b0868 = !level.var_fa789e7bab605e4c;
    if (var_7e85664e3cbfab82 && var_d17108f1e24b0868) {
        return;
    }
    var_6749ab538ec0ddeb = 0;
    if (getdvarint(@"hash_7194076ab4888f2b", 0) == 1) {
        var_6749ab538ec0ddeb = 12;
    }
    var_50ba4037bbd61cff = 20 - var_6749ab538ec0ddeb;
    var_3768f1b2936af69e = level.prematchperiodend - var_50ba4037bbd61cff;
    var_3768f1b2936af69e = ter_op(var_3768f1b2936af69e > 0, var_3768f1b2936af69e, 0);
    var_a1d84737ec0b465d = 20 - var_6749ab538ec0ddeb;
    var_488a1360da4e442a = level.prematchperiodend - var_a1d84737ec0b465d;
    var_488a1360da4e442a = ter_op(var_488a1360da4e442a > 0, var_488a1360da4e442a, 0);
    for (timepassed = 0; !var_7e85664e3cbfab82 || !var_d17108f1e24b0868; timepassed++) {
        if (!var_7e85664e3cbfab82 && timepassed >= var_3768f1b2936af69e) {
            foreach (laneKey, var_a2d0446bc9b000ab in level.var_ae5271d2ed773311[team]) {
                level thread function_e3ca5378e0f544c3(team, var_a2d0446bc9b000ab, laneKey, var_c0e1f16535e4fa15);
            }
            var_7e85664e3cbfab82 = 1;
        }
        if (!var_d17108f1e24b0868 && timepassed >= var_488a1360da4e442a) {
            function_93e7d3696caa5331(10, level.var_48e03f24b9b5c1a, team);
            var_d17108f1e24b0868 = 1;
        }
        wait(1);
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xcc13
// Size: 0x93
function function_ee0aa2c35417d524(team, var_a2d0446bc9b000ab, laneKey) {
    var_e332fe633c8498b = 2;
    var_5ae2ede5b9d14341 = 0;
    var_ba591582396ec120 = int(var_a2d0446bc9b000ab.var_83cf1c64372dcca5 / 2);
    while (var_5ae2ede5b9d14341 < var_ba591582396ec120) {
        var_2245633b901f80e1 = var_e332fe633c8498b;
        if (var_5ae2ede5b9d14341 + var_e332fe633c8498b > var_ba591582396ec120) {
            var_2245633b901f80e1 = var_ba591582396ec120 - var_5ae2ede5b9d14341;
        }
        level function_21b7e8662f68614d(var_2245633b901f80e1, team, laneKey);
        var_5ae2ede5b9d14341 = var_5ae2ede5b9d14341 + var_2245633b901f80e1;
        wait(randomfloatrange(2.5, 4));
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xccad
// Size: 0x8f
function function_e3ca5378e0f544c3(team, var_a2d0446bc9b000ab, laneKey, var_c0e1f16535e4fa15) {
    var_ba591582396ec120 = int(var_a2d0446bc9b000ab.var_83cf1c64372dcca5 / 4);
    var_7a155fea3b7b30dc = var_ba591582396ec120 / var_c0e1f16535e4fa15;
    for (i = 0; i < var_7a155fea3b7b30dc; i++) {
        wait(randomfloatrange(1, 3) + (laneKey + 2) * 2);
        level function_33d2a7321a928b5a(var_c0e1f16535e4fa15, team, level.var_48e03f24b9b5c1a, laneKey);
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcd43
// Size: 0x4c9
function function_21b7e8662f68614d(numagents, team, laneKey) {
    if (level.usespawnselection) {
        var_35c0e0d47ea5452f = "gw_fob_" + team + "HQ";
        var_fd5ea9cb37c309d3 = level.spawnselectionlocations[var_35c0e0d47ea5452f][team].spawnpoints;
        var_b5b1784d5a1327c7 = "spawnHQ_" + team;
        for (i = 0; i < numagents; i++) {
            aitype = function_d5bc07eabf352abb(undefined, undefined, "gwtdm", undefined, level.var_c7a4725d05bb7f22, level.var_72f834b3f8b2a366[team]);
            agent = ai_mp_requestSpawnAgent(aitype, var_fd5ea9cb37c309d3[i].origin, var_fd5ea9cb37c309d3[i].angles, "medium", var_b5b1784d5a1327c7, undefined, undefined, team, undefined, undefined, 1);
            if (isdefined(agent)) {
                function_4c7945217f8adffa(agent, laneKey);
                success = function_2da93e2a35e2182f(agent, team, level.var_48e03f24b9b5c1a, laneKey);
                if (!success) {
                    agent.var_cb61f2f08271e0be = function_ff46cb0a3bc4b055(agent, team, laneKey);
                    agent thread function_8d8f7c8f7d567eb6();
                    agent thread rushOriginRemover();
                    agent thread namespace_2000a83505151e5b::function_65f6a39e1083fb6b(agent, agent.var_cb61f2f08271e0be, 1024, 1024, 1024);
                }
            }
        }
    } else if (level.var_c7a4725d05bb7f22 == 1 && !level.var_7232d887dbda3729 || level.var_c7a4725d05bb7f22 == 2 && !level.var_7232d587dbda3090) {
        if (!level.var_ad7b64f93b499edb) {
            return;
        }
        players = getteamdata(team, "players");
        if (players.size > 0) {
            spawnpoint = players[0] getspawnpointforplayer();
            if (isdefined(spawnpoint)) {
                aitype = function_d5bc07eabf352abb(undefined, undefined, "gwtdm", undefined, level.var_c7a4725d05bb7f22, level.var_72f834b3f8b2a366[team]);
                agent = ai_mp_requestSpawnAgent(aitype, spawnpoint.origin, spawnpoint.angles, "medium", "spawnHQ_" + team, undefined, undefined, team, undefined, undefined, 1);
                if (isdefined(agent)) {
                    function_4c7945217f8adffa(agent, laneKey);
                    success = function_2da93e2a35e2182f(agent, team, level.var_48e03f24b9b5c1a, laneKey);
                    if (!success) {
                        agent.var_cb61f2f08271e0be = function_ff46cb0a3bc4b055(agent, team, laneKey);
                        agent thread function_8d8f7c8f7d567eb6();
                        agent thread rushOriginRemover();
                        agent thread namespace_2000a83505151e5b::function_65f6a39e1083fb6b(agent, agent.var_cb61f2f08271e0be, 1024, 1024, 1024);
                    }
                }
            }
        }
    } else if (istrue(level.var_ee41a5aaf764c9cc)) {
        players = getteamdata(team, "players");
        if (!isdefined(players) || players.size == 0) {
            return;
        }
        idealdist = getdvarint(@"hash_a66b78681b2d0805", 4096);
        var_629e5fe2f6b337fa = [];
        var_629e5fe2f6b337fa["teamForward"] = level.spawnselectionteamforward[team];
        var_629e5fe2f6b337fa["idealDistSq"] = idealdist * idealdist;
        namespace_b2d5aa2baf2b5701::activatespawnset(level.var_ad9cae795e7505c6[team], 1);
        spawnpoint = players[0] namespace_b2d5aa2baf2b5701::getspawnpoint(players[0], team, level.var_ad9cae795e7505c6[team], undefined, undefined, var_629e5fe2f6b337fa);
        if (isdefined(spawnpoint)) {
            aitype = function_d5bc07eabf352abb(undefined, undefined, "gwtdm", undefined, level.var_c7a4725d05bb7f22, level.var_72f834b3f8b2a366[team]);
            agent = ai_mp_requestSpawnAgent(aitype, spawnpoint.origin, spawnpoint.angles, "medium", "spawnHQ_" + team, undefined, undefined, team, undefined, undefined, 1);
            if (isdefined(agent)) {
                function_4c7945217f8adffa(agent, laneKey);
                success = function_2da93e2a35e2182f(agent, team, level.var_48e03f24b9b5c1a, laneKey);
                if (!success) {
                    agent.var_cb61f2f08271e0be = function_ff46cb0a3bc4b055(agent, team, laneKey);
                    agent thread function_8d8f7c8f7d567eb6();
                    agent thread rushOriginRemover();
                    agent thread namespace_2000a83505151e5b::function_65f6a39e1083fb6b(agent, agent.var_cb61f2f08271e0be, 1024, 1024, 1024);
                }
            }
        }
    } else {
        spawnpoint = function_277456e766f73b0(team, laneKey);
        heading = vectortoangles(level.spawnselectionteamforward[team]);
        agents = level namespace_885300a47c2b51e6::function_55ab9c6da96226e7(numagents, spawnpoint.origin, undefined, undefined, "medium", "spawnHQ_" + team, "debug", team, undefined, undefined, heading, &function_b744a1a8b7dabb6c, 1, 1, level.var_c7a4725d05bb7f22);
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd213
// Size: 0x13e
function function_33d2a7321a928b5a(numagents, team, var_e9bf3955fa1125b5, laneKey) {
    var_fe55d7604cef0e3a = function_7bb4716ac5c42f7c(team, laneKey);
    groupname = function_78759441c259f58a(var_fe55d7604cef0e3a.origin, numagents);
    var_cf2ff249c028b242 = namespace_bfef6903bca5845d::function_ab14d6652e44fda0(numagents, undefined, level.var_c7a4725d05bb7f22, "gwtdm");
    var_cf2ff249c028b242.var_83c3368707c68e6 = "Helicopter";
    var_b58631347b6ab04 = namespace_7ae25d9e5d5a28ef::function_3779deb97b61a65(numagents, var_fe55d7604cef0e3a.origin, "medium", "everybody", "captureAgents", groupname, team, 0, undefined, undefined, undefined, var_cf2ff249c028b242, 1, 1);
    if (!isdefined(var_b58631347b6ab04)) {
        return 0;
    }
    foreach (agent in var_b58631347b6ab04) {
        function_4c7945217f8adffa(agent, laneKey);
        agent.var_2baffef526c6dd6c = 1;
        function_2aa208e2058474e5(agent, agent.team, laneKey);
    }
    return 1;
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd359
// Size: 0x23a
function function_2f5b6c628445768(var_3f6fd6edaf6c6713) {
    if (!isdefined(level.var_ae5271d2ed773311)) {
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
        foreach (laneKey, var_a2d0446bc9b000ab in level.var_ae5271d2ed773311[team]) {
            var_a2d0446bc9b000ab.var_f76e10d4dce6c204 = function_3cab19163f3e50d3(team, level.var_48e03f24b9b5c1a, laneKey);
            foreach (agent in var_a2d0446bc9b000ab.var_e2c31580f508b878) {
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

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd59a
// Size: 0x1b2
function function_2aa208e2058474e5(agent, team, laneKey) {
    agent endon("death");
    if (!isalive(agent)) {
        return;
    }
    if (!isdefined(agent)) {
        return;
    }
    if (!isdefined(team)) {
        team = namespace_14d36171baccf528::agentPers_getAgentPersData(agent, "team");
    }
    if (!isdefined(laneKey)) {
        laneKey = namespace_14d36171baccf528::agentPers_getAgentPersData(agent, "laneKey");
    }
    if (!isdefined(team) || !isdefined(laneKey)) {
        return;
    }
    if (isdefined(agent.var_b8d7c82b53e74b77) && agent.var_b8d7c82b53e74b77 > 0) {
        wait(agent.var_b8d7c82b53e74b77 + 1);
    }
    success = function_2da93e2a35e2182f(agent, team, level.var_48e03f24b9b5c1a, laneKey);
    if (!success) {
        var_cb61f2f08271e0be = function_ff46cb0a3bc4b055(agent, team, laneKey);
        if (var_cb61f2f08271e0be.size > 0) {
            agent.var_cb61f2f08271e0be = var_cb61f2f08271e0be;
            agent thread function_8d8f7c8f7d567eb6();
            agent thread rushOriginRemover();
            agent thread namespace_2000a83505151e5b::function_65f6a39e1083fb6b(agent, agent.var_cb61f2f08271e0be, 1024, 1024, 1024);
        } else {
            agent.var_cb61f2f08271e0be = [];
            var_fe55d7604cef0e3a = function_7bb4716ac5c42f7c(team, laneKey);
            origin = getclosestpointonnavmesh(var_fe55d7604cef0e3a.origin + (randomfloatrange(level.var_b747ee617515989a * -1, level.var_b747ee617515989a), randomfloatrange(level.var_b747ee617515989a * -1, level.var_b747ee617515989a), 0));
            agent thread namespace_2000a83505151e5b::function_a5117518725da028(agent, origin, 1024, 1024, 1024, undefined, undefined, undefined, &namespace_2000a83505151e5b::function_8dad0c97c82fb52f);
        }
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd753
// Size: 0xe8
function function_55c73da3bc1275f7(agent) {
    if (getdvarint(@"hash_6243ee712b007b0b", 0) == 1) {
        return;
    }
    agent endon("death");
    agent notify("killStallWatcher");
    agent endon("killStallWatcher");
    var_add5abb5c54d762f = 0;
    var_b4ea66bc0e9fa1e9 = undefined;
    while (1) {
        wait(0.5);
        dist = distance2dsquared(agent.var_99f2752b6513c9dd.origin, agent.origin);
        if (dist < 65536) {
            if (!isdefined(var_b4ea66bc0e9fa1e9)) {
                var_b4ea66bc0e9fa1e9 = dist;
            } else if (abs(var_b4ea66bc0e9fa1e9 - dist) < 4096) {
                var_add5abb5c54d762f++;
                var_b4ea66bc0e9fa1e9 = dist;
            } else {
                var_add5abb5c54d762f = 0;
            }
        } else {
            var_add5abb5c54d762f = 0;
        }
        if (var_add5abb5c54d762f >= 3) {
            agent thread function_fd1ef087d4a56d19(agent, agent.team);
            agent notify("killStallWatcher");
        }
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xd842
// Size: 0x5a
function function_7e904c73621a47d1(agent, time) {
    agent endon("death");
    for (timepassed = 0; timepassed < time; timepassed++) {
        thread namespace_d028276791d9cff6::drawsphere(agent.origin, 128, 1, (0, 1, 1));
        wait(1);
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd8a3
// Size: 0x154
function function_7a98ea2f74ba9607(team) {
    var_3e38ee41dc326fdc = "cap_bark_orders";
    animset = "caps/common/cap_bark_orders_advance";
    foreach (var_a2d0446bc9b000ab in level.var_ae5271d2ed773311[team]) {
        agents = array_randomize(var_a2d0446bc9b000ab.var_e2c31580f508b878);
        var_6aa514cfd79e469f = 6;
        var_8d02514ccc3f1fb8 = 0;
        origin = function_4d65c1597ec31547(agents);
        if (isdefined(origin)) {
            playsoundatpos(origin, "mp_walla_invasion_charge_group");
        }
        foreach (agent in agents) {
            if (var_8d02514ccc3f1fb8 >= var_6aa514cfd79e469f) {
                break;
            }
            if (!function_8cc95623d93d70fb(agent)) {
                continue;
            }
            var_8d02514ccc3f1fb8++;
            agent thread function_b1ff81f9e48f070(agent, agent.origin, var_3e38ee41dc326fdc, animset, undefined, undefined, "mp_walla_invasion_charge_individual");
        }
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd9fe
// Size: 0x17c
function function_16b67172a4f3c6f8(team) {
    var_3e38ee41dc326fdc = "cap_bark_orders";
    animset = "caps/common/cap_bark_orders_fallback";
    foreach (var_a2d0446bc9b000ab in level.var_ae5271d2ed773311[team]) {
        agents = array_randomize(var_a2d0446bc9b000ab.var_e2c31580f508b878);
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
                agent thread function_b1ff81f9e48f070(agent, agent.origin, var_3e38ee41dc326fdc, animset);
            } else if (var_1303886face0ec6f < var_e20187343cea1130) {
                var_1303886face0ec6f++;
                function_b1458f8adb57f733(agent);
                continue;
            }
        }
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdb81
// Size: 0x352
function function_b34021ca662a03bd() {
    level endon("game_ended");
    if (getdvarint(@"hash_efa65def009de58c", 0) == 1) {
        return;
    }
    var_4dee2f3ecb36d88a = getdvarint(@"hash_fbc6c90a51e19cfa", 10);
    var_a74d259a91a5635c = getdvarint(@"hash_726c19967a7eb54c", 33);
    var_96fa696d3e52e34f = getdvarint(@"hash_13411e313136639f", 33);
    var_bb833fe37b1c8283 = getdvarint(@"hash_1818a2df93845813", 33);
    var_eb6f2e9e793e992e = var_4dee2f3ecb36d88a + var_a74d259a91a5635c + var_96fa696d3e52e34f + var_bb833fe37b1c8283;
    while (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        waitframe();
    }
    wait(30);
    var_27df2f3e1070dc7c = 0;
    var_f17ce0ab9390041e = 0;
    var_6e8f659dfacd2391 = 1;
    var_8284343d0ff94cc6 = undefined;
    while (1) {
        var_9c5b939810814304 = 0;
        var_d7c42e70083df35d = -1;
        var_afc2f18cdaa6c9cc = level.players;
        while (!var_9c5b939810814304 && var_afc2f18cdaa6c9cc.size > 0) {
            var_d7c42e70083df35d = randomint(var_afc2f18cdaa6c9cc.size);
            if (isdefined(var_afc2f18cdaa6c9cc[var_d7c42e70083df35d]) && isalive(var_afc2f18cdaa6c9cc[var_d7c42e70083df35d])) {
                var_9c5b939810814304 = 1;
                break;
            } else {
                var_afc2f18cdaa6c9cc[var_d7c42e70083df35d] = undefined;
            }
            if (var_afc2f18cdaa6c9cc.size <= 0) {
                wait(1);
                var_afc2f18cdaa6c9cc = level.players;
            }
        }
        playerteam = undefined;
        if (var_d7c42e70083df35d > -1) {
            var_8284343d0ff94cc6 = sortbydistance(level.agentarray, var_afc2f18cdaa6c9cc[var_d7c42e70083df35d].origin);
            playerteam = var_afc2f18cdaa6c9cc[var_d7c42e70083df35d].team;
            var_afc2f18cdaa6c9cc[var_d7c42e70083df35d] = undefined;
        }
        success = 0;
        foreach (agent in var_8284343d0ff94cc6) {
            if (function_8cc95623d93d70fb(agent) && isdefined(playerteam) && agent.team == playerteam && (!isdefined(agent.var_7698b3f1e3d199c) || isdefined(agent.var_7698b3f1e3d199c) && agent.var_7698b3f1e3d199c < gettime() + 10000)) {
                agent.var_7698b3f1e3d199c = gettime();
                roll = randomint(var_eb6f2e9e793e992e);
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
                wait(5);
                break;
            } else {
                var_f17ce0ab9390041e++;
                if (var_f17ce0ab9390041e >= 5) {
                    var_f17ce0ab9390041e = 0;
                    waitframe();
                }
            }
        }
        if (!success || var_27df2f3e1070dc7c >= 5) {
            var_afc2f18cdaa6c9cc = level.players;
            wait(5);
        }
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdeda
// Size: 0xc9
function function_ac93ebb80902a467() {
    foreach (agent in level.agentarray) {
        if (!function_8cc95623d93d70fb(agent)) {
            continue;
        }
        if (!istrue(agent.var_416835640e8c55cd)) {
            continue;
        }
        if (!agent asmhasstate(agent.asmname, "choose_long_death")) {
            continue;
        }
        agent.var_37c05513d2997ab4 = 1;
        agent.var_416835640e8c55cd = 0;
        agent.var_1544c20e168d97c0 = 5000;
        agent thread function_727cda5ef2ae887d(agent);
        wait(randomfloatrange(2, 3));
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdfaa
// Size: 0xc9
function function_8cc95623d93d70fb(agent) {
    if (!isalive(agent)) {
        return 0;
    }
    if (isdefined(agent.vehicle_position) && isint(agent.vehicle_position)) {
        return 0;
    }
    if (istrue(agent.var_37c05513d2997ab4)) {
        return 0;
    }
    if (isdefined(agent.landing_spot)) {
        return 0;
    }
    if (agent isinscriptedstate()) {
        return 0;
    }
    if (istrue(agent.doinglongdeath)) {
        return 0;
    }
    if (isdefined(agent function_92435c7a6ae85c3c())) {
        return 0;
    }
    if (!agent isonornearstairs()) {
        return 0;
    }
    var_d5a54d862aacc2 = agent getnearbynegotiationinfo(32);
    if (isdefined(var_d5a54d862aacc2)) {
        return 0;
    }
    if (agent.asmname != agent.var_a942dd31d55102c9) {
        return 0;
    }
    return 1;
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe07b
// Size: 0xb8
function function_b1ff81f9e48f070(agent, origin, var_3e38ee41dc326fdc, animset, var_cd40ac65a2951f58, var_cd63c265a2bb9772, var_20aa66e7dd98fb53) {
    agent endon("death");
    if (!isdefined(var_cd40ac65a2951f58)) {
        var_cd40ac65a2951f58 = 0.1;
    }
    if (!isdefined(var_cd63c265a2bb9772)) {
        var_cd63c265a2bb9772 = 2;
    }
    agent.var_b8d7c82b53e74b77 = randomfloatrange(var_cd40ac65a2951f58, var_cd63c265a2bb9772);
    wait(agent.var_b8d7c82b53e74b77);
    agent.var_b8d7c82b53e74b77 = -1;
    if (!function_8cc95623d93d70fb(agent)) {
        return;
    }
    agent thread namespace_aebb27832287cd3a::function_b58f0a57adf2948e(origin, var_3e38ee41dc326fdc, animset, 1);
    if (isdefined(var_20aa66e7dd98fb53)) {
        playsoundatpos(agent.origin, var_20aa66e7dd98fb53);
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe13a
// Size: 0x93
function function_b1458f8adb57f733(agent, var_43730f07d9c240e6, var_9b57bd8d7f3d4e6a, var_cd40ac65a2951f58, var_cd63c265a2bb9772) {
    agent endon("death");
    if (!isdefined(var_cd40ac65a2951f58)) {
        var_cd40ac65a2951f58 = 0.1;
    }
    if (!isdefined(var_cd63c265a2bb9772)) {
        var_cd63c265a2bb9772 = 2;
    }
    if (!isdefined(var_43730f07d9c240e6)) {
        var_43730f07d9c240e6 = 1;
    }
    agent.var_b8d7c82b53e74b77 = randomfloatrange(var_cd40ac65a2951f58, var_cd63c265a2bb9772);
    wait(agent.var_b8d7c82b53e74b77);
    agent.var_b8d7c82b53e74b77 = -1;
    if (!function_8cc95623d93d70fb(agent)) {
        return;
    }
    namespace_1ee1798c32f768c2::function_21bd6a8c4766ad5a(agent, var_43730f07d9c240e6, var_9b57bd8d7f3d4e6a);
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe1d4
// Size: 0x97
function function_727cda5ef2ae887d(agent, var_ec2ebfc4cc6bffc1, var_cd40ac65a2951f58, var_cd63c265a2bb9772) {
    agent endon("death");
    if (!isdefined(var_cd40ac65a2951f58)) {
        var_cd40ac65a2951f58 = 1;
    }
    if (!isdefined(var_cd63c265a2bb9772)) {
        var_cd63c265a2bb9772 = 4;
    }
    agent.var_b8d7c82b53e74b77 = randomfloatrange(var_cd40ac65a2951f58, var_cd63c265a2bb9772);
    wait(agent.var_b8d7c82b53e74b77);
    agent.var_b8d7c82b53e74b77 = -1;
    if (!function_8cc95623d93d70fb(agent)) {
        return;
    }
    if (agent asmhasstate(agent.asmname, "choose_long_death")) {
        namespace_1ee1798c32f768c2::function_63c85ab9240382f7(agent, var_ec2ebfc4cc6bffc1);
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe272
// Size: 0x21b
function function_c771a77bf1f4d2c1() {
    if (!gameflag("infil_will_run")) {
        return;
    }
    if (level.prematchperiodend > 0) {
        level waittill("match_start_real_countdown");
    } else {
        return;
    }
    var_802cd1d828b52f29 = [];
    var_8738b2877c92e837 = [];
    var_97d80017548b48cb = [];
    foreach (team in game["infil"]) {
        if (!isdefined(team[1])) {
            continue;
        }
        foreach (var_ba5196c78dfda051 in team[1]) {
            foreach (var_d2a495e530abb848 in var_ba5196c78dfda051) {
                var_8738b2877c92e837[var_8738b2877c92e837.size] = var_d2a495e530abb848.path;
            }
        }
    }
    foreach (var_21c526176e42a59e in var_8738b2877c92e837) {
        var_97d80017548b48cb[var_97d80017548b48cb.size] = createnavobstaclebybounds(var_21c526176e42a59e.origin, (200, 128, 200), var_21c526176e42a59e.angles);
    }
    while (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        waitframe();
    }
    wait(3);
    foreach (var_343ab41ce58c7a17 in var_97d80017548b48cb) {
        destroynavobstacle(var_343ab41ce58c7a17);
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe494
// Size: 0x8a
function function_4d65c1597ec31547(agents) {
    origins = [];
    foreach (agent in agents) {
        if (function_8cc95623d93d70fb(agent)) {
            origins[origins.size] = agent.origin;
        }
    }
    if (origins.size > 0) {
        return averagepoint(origins);
    } else {
        return undefined;
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe525
// Size: 0x22f
function function_f9b8935478663f0b() {
    var_63f43f469b885ec6 = 25;
    while (1) {
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
            foreach (laneKey, var_a2d0446bc9b000ab in level.var_ae5271d2ed773311[team]) {
                linecount = 1;
                /#
                    printtoscreen2d(startx, starty + var_63f43f469b885ec6 * linecount, "combatRushComplete" + laneKey + "cap_bark_orders", (1, 1, 1), 1);
                #/
                linecount++;
                foreach (index, agent in var_a2d0446bc9b000ab.var_e2c31580f508b878) {
                    color = (1, 1, 1);
                    if (istrue(agent.var_2baffef526c6dd6c)) {
                        color = (0, 1, 0);
                    } else if (istrue(agent.var_d6eb429048e1a4b5)) {
                        color = (0, 1, 1);
                    }
                    /#
                        printtoscreen2d(startx, starty + var_63f43f469b885ec6 * linecount, "mp_walla_invasion_charge_group" + index + "caps/common/cap_bark_orders_fallback" + agent getentitynumber(), color, 1);
                    #/
                    linecount++;
                }
                startx = startx + 100;
            }
        }
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe75b
// Size: 0x1dc
function function_ce95c7540070f7d0(killstreakname, var_78f4f12be3b7507a, attacker) {
    if (isdefined(attacker) && isdefined(attacker.owner)) {
        attacker = attacker.owner;
    }
    if (!isdefined(attacker) || !isdefined(attacker.team) || !isdefined(var_78f4f12be3b7507a)) {
        return;
    }
    if (!isenemyteam(var_78f4f12be3b7507a, attacker.team)) {
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
        namespace_e8a49b70d0769b66::giveteamscoreforobjective(attacker.team, var_24d22c13c6fece21, 0);
        if (getdvarint(@"hash_2e405e2912dc4a44", 0) == 1) {
            attacker thread namespace_62c556437da28f50::scoreeventpopup(function_2ef675c13ca1c4af(#"hash_2c8bcbb02ec7ff9b", var_24d22c13c6fece21));
        }
        attacker incpersstat("contribution", var_24d22c13c6fece21);
        attacker setextrascore0(attacker.pers["contribution"]);
        if (isplayer(attacker)) {
            var_4da4cb52d0bf5b05 = 0;
            var_4da4cb52d0bf5b05 = var_4da4cb52d0bf5b05 + 4;
            var_4da4cb52d0bf5b05 = var_4da4cb52d0bf5b05 + (var_24d22c13c6fece21 << 4);
            attacker namespace_310ba947928891df::function_417749e099f041f(var_4da4cb52d0bf5b05, -1);
        }
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe93e
// Size: 0x1ad
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
        namespace_e8a49b70d0769b66::giveteamscoreforobjective(attacker.team, var_24d22c13c6fece21, 0);
        if (getdvarint(@"hash_2e405e2912dc4a44", 0) == 1) {
            attacker thread namespace_62c556437da28f50::scoreeventpopup(function_2ef675c13ca1c4af(#"hash_2c8bcbb02ec7ff9b", var_24d22c13c6fece21));
        }
        attacker incpersstat("contribution", var_24d22c13c6fece21);
        attacker setextrascore0(attacker.pers["contribution"]);
        if (isplayer(attacker)) {
            var_4da4cb52d0bf5b05 = 0;
            var_4da4cb52d0bf5b05 = var_4da4cb52d0bf5b05 + 4;
            var_4da4cb52d0bf5b05 = var_4da4cb52d0bf5b05 + (var_24d22c13c6fece21 << 4);
            attacker namespace_310ba947928891df::function_417749e099f041f(var_4da4cb52d0bf5b05, -1);
        }
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeaf2
// Size: 0x224
function function_4baf8b94714b68fe() {
    level endon("game_ended");
    var_4aea3b858d238fd2 = level.scorelimit * 0.25;
    var_4b0036858d3bb806 = level.scorelimit * 0.5;
    var_4af747858d31bebb = level.scorelimit * 0.75;
    var_4b11ce858d4f10aa = level.scorelimit * 0.9;
    var_ad04cf65b0fe1704 = 0;
    var_ad095265b1032cf4 = 0;
    var_ad11c365b10c1125 = 0;
    var_ad1aca65b1163f38 = 0;
    while (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        waitframe();
    }
    while (1) {
        axisscore = namespace_e8a49b70d0769b66::_getteamscore("axis");
        alliesscore = namespace_e8a49b70d0769b66::_getteamscore("allies");
        winningteam = ter_op(axisscore > alliesscore, "axis", "allies");
        var_1c1dee64df9a9c2e = getotherteam(winningteam)[0];
        if (!var_ad04cf65b0fe1704 && (axisscore >= var_4aea3b858d238fd2 || alliesscore >= var_4aea3b858d238fd2)) {
            var_ad04cf65b0fe1704 = 1;
            level thread function_a350ea3bd2c8470();
            namespace_944ddf7b8df1b0e3::statusdialog("score_25_winning", winningteam, 1);
            namespace_944ddf7b8df1b0e3::statusdialog("score_25_losing", var_1c1dee64df9a9c2e, 1);
        }
        if (!var_ad095265b1032cf4 && (axisscore >= var_4b0036858d3bb806 || alliesscore >= var_4b0036858d3bb806)) {
            var_ad095265b1032cf4 = 1;
            level thread killstreakCrateLoop();
            namespace_944ddf7b8df1b0e3::statusdialog("score_50_winning", winningteam, 1);
            namespace_944ddf7b8df1b0e3::statusdialog("score_50_losing", var_1c1dee64df9a9c2e, 1);
            level thread function_4fa7b02d1bbe565e(6);
        }
        if (!var_ad11c365b10c1125 && (axisscore >= var_4af747858d31bebb || alliesscore >= var_4af747858d31bebb)) {
            var_ad11c365b10c1125 = 1;
            level thread function_1b39d0ac099f112f();
            namespace_944ddf7b8df1b0e3::statusdialog("score_75_winning", winningteam, 1);
            namespace_944ddf7b8df1b0e3::statusdialog("score_75_losing", var_1c1dee64df9a9c2e, 1);
        }
        if (!var_ad1aca65b1163f38 && (axisscore >= var_4b11ce858d4f10aa || alliesscore >= var_4b11ce858d4f10aa)) {
            var_ad1aca65b1163f38 = 1;
            namespace_944ddf7b8df1b0e3::statusdialog("score_90_winning", winningteam, 1);
            namespace_944ddf7b8df1b0e3::statusdialog("score_90_losing", var_1c1dee64df9a9c2e, 1);
        }
        wait(1);
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xed1d
// Size: 0x41f
function function_a350ea3bd2c8470() {
    level.var_84c26a9fa39f7586 = [];
    level.var_ebb878f6221bed4f = [];
    var_c2344893389fa188 = [];
    foreach (team in level.teamnamelist) {
        level.var_84c26a9fa39f7586[team] = 0;
        level.var_ebb878f6221bed4f[team] = 0;
        var_c2344893389fa188[team] = 0;
    }
    namespace_1f188a13f7e79610::function_66ab4fb2175555e1("veh9_jltv_mg");
    namespace_65ad5249b19d5d41::main();
    registersharedfunc("veh9_jltv_mg", "onDeathRespawn", &function_52a967cc33e0f447);
    vehiclecount = getdvarint(@"hash_bda20dac0244506b", 2);
    var_226107f1b8475902 = int(getdvarfloat(@"hash_6ff4efb459d8b415", 30) * 1000);
    foreach (team in level.teamnamelist) {
        namespace_944ddf7b8df1b0e3::statusdialog("vehicles_inc", team, 1);
        showsplashtoteam(team, "gwtdm_vehicles_inc");
    }
    wait(5);
    while (1) {
        currenttime = gettime();
        foreach (team in level.teamnamelist) {
            if (level.var_84c26a9fa39f7586[team] < vehiclecount) {
                if (var_c2344893389fa188[team] && currenttime < level.var_ebb878f6221bed4f[team] + var_226107f1b8475902) {
                    continue;
                }
                var_695a8b6f4aaeeee6 = randomfloatrange(0, 1);
                var_b5f7b6a6852c98b8 = vectorlerp(level.frontlineData[level.var_48e03f24b9b5c1a].var_b027d6857ab9d713, level.frontlineData[level.var_48e03f24b9b5c1a].maxpoint, var_695a8b6f4aaeeee6);
                var_cae290751508d1a0 = level.gw_objstruct.allieshqloc.trigger.origin;
                if (team == "axis") {
                    var_cae290751508d1a0 = level.gw_objstruct.axishqloc.trigger.origin;
                }
                var_d2666395e6cf4732 = getdvarint(@"hash_345e75bc0b7aba35", 3000);
                offsetdir = vectornormalize(var_b5f7b6a6852c98b8 - var_cae290751508d1a0);
                offset = offsetdir * var_d2666395e6cf4732;
                var_b5f7b6a6852c98b8 = var_b5f7b6a6852c98b8 - offset;
                trace = ray_trace(var_b5f7b6a6852c98b8, var_b5f7b6a6852c98b8 - (0, 0, 100000));
                var_b5f7b6a6852c98b8 = trace["position"];
                droplocation = findclosestdroplocation(var_b5f7b6a6852c98b8, 1);
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
                    vehicle thread function_fea1fef8411948a5(droplocation);
                }
            }
        }
        wait(1);
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf143
// Size: 0x435
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
    var_226107f1b8475902 = int(getdvarfloat(@"hash_bcca4bdb0041285a", 60) * 1000);
    foreach (team in level.teamnamelist) {
        namespace_944ddf7b8df1b0e3::statusdialog("vehicles2_inc", team, 1);
        showsplashtoteam(team, "gwtdm_vehicles2_inc");
    }
    wait(5);
    registersharedfunc("light_tank", "onDeathRespawn", &function_77ca7d0aa1a51384);
    while (1) {
        currenttime = gettime();
        foreach (team in level.teamnamelist) {
            if (level.var_fced0b6c61f6bb77[team] < vehiclecount) {
                if (var_c2344893389fa188[team] && currenttime < level.var_4c529fa033fb6ae2[team] + var_226107f1b8475902) {
                    continue;
                }
                var_695a8b6f4aaeeee6 = randomfloatrange(0, 1);
                var_b5f7b6a6852c98b8 = vectorlerp(level.frontlineData[level.var_48e03f24b9b5c1a].var_b027d6857ab9d713, level.frontlineData[level.var_48e03f24b9b5c1a].maxpoint, var_695a8b6f4aaeeee6);
                var_cae290751508d1a0 = level.gw_objstruct.allieshqloc.trigger.origin;
                if (team == "axis") {
                    var_cae290751508d1a0 = level.gw_objstruct.axishqloc.trigger.origin;
                }
                var_d2666395e6cf4732 = getdvarint(@"hash_345e75bc0b7aba35", 3000);
                offsetdir = vectornormalize(var_b5f7b6a6852c98b8 - var_cae290751508d1a0);
                offset = offsetdir * var_d2666395e6cf4732;
                var_b5f7b6a6852c98b8 = var_b5f7b6a6852c98b8 - offset;
                trace = ray_trace(var_b5f7b6a6852c98b8, var_b5f7b6a6852c98b8 - (0, 0, 100000));
                var_b5f7b6a6852c98b8 = trace["position"];
                droplocation = findclosestdroplocation(var_b5f7b6a6852c98b8, 1);
                if (!isdefined(droplocation)) {
                    continue;
                }
                spawndata = spawnstruct();
                spawndata.origin = droplocation.origin + (0, 0, 100);
                spawndata.angles = droplocation.angles;
                spawndata.spawntype = "GAME_MODE";
                spawndata.spawnmethod = "airdrop_at_position_unsafe";
                spawndata.var_b88b7b3c17715e3f = team;
                var_ee8da5624236dc89 = spawnstruct();
                vehicle = namespace_1f188a13f7e79610::vehicle_spawn("light_tank", spawndata, var_ee8da5624236dc89);
                if (isdefined(vehicle)) {
                    level.var_fced0b6c61f6bb77[team]++;
                    if (!var_c2344893389fa188[team] && level.var_fced0b6c61f6bb77[team] == vehiclecount) {
                        var_c2344893389fa188[team] = 1;
                    }
                    level.var_4c529fa033fb6ae2[team] = currenttime;
                    vehicle thread function_fea1fef8411948a5(droplocation);
                    wait(5);
                }
            }
        }
        wait(1);
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf57f
// Size: 0x47
function function_52a967cc33e0f447() {
    spawndata = namespace_f64231d5b7a2c3c4::getvehiclespawndata(self);
    if (isdefined(spawndata.var_6dc04302da1a9d03)) {
        spawndata = spawndata.var_6dc04302da1a9d03;
    }
    level.var_84c26a9fa39f7586[spawndata.var_b88b7b3c17715e3f]--;
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf5cd
// Size: 0x47
function function_77ca7d0aa1a51384() {
    spawndata = namespace_f64231d5b7a2c3c4::getvehiclespawndata(self);
    if (isdefined(spawndata.var_6dc04302da1a9d03)) {
        spawndata = spawndata.var_6dc04302da1a9d03;
    }
    level.var_fced0b6c61f6bb77[spawndata.var_b88b7b3c17715e3f]--;
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf61b
// Size: 0x6c
function function_fea1fef8411948a5(droplocation) {
    self waittill("landed");
    var_b9f3f0b165458920 = 262144;
    while (isdefined(self)) {
        distsq = distancesquared(self.origin, droplocation.origin);
        if (distsq > var_b9f3f0b165458920) {
            break;
        }
        wait(1);
    }
    droplocation.inuse = 0;
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf68e
// Size: 0x104
function function_7a5db011b55b3f21(numagents, var_c5e7fce963586ec0, team, var_cd63c265a2bb9772) {
    heading = undefined;
    if (team == "allies") {
        heading = vectortoangles(level.frontlineData[level.var_48e03f24b9b5c1a].maxpoint - level.frontlineData[level.var_48e03f24b9b5c1a].var_b027d6857ab9d713);
    } else {
        heading = vectortoangles(level.frontlineData[level.var_48e03f24b9b5c1a].var_b027d6857ab9d713 - level.frontlineData[level.var_48e03f24b9b5c1a].maxpoint);
    }
    wait(randomfloat(var_cd63c265a2bb9772));
    agents = level namespace_885300a47c2b51e6::function_55ab9c6da96226e7(numagents, var_c5e7fce963586ec0, undefined, undefined, "medium", "spawnHQ_" + team, "debug", team, undefined, undefined, heading, &function_c9e5e3858ab1805f, undefined, 1, level.var_c7a4725d05bb7f22);
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf799
// Size: 0xe6
function function_93e7d3696caa5331(numagents, var_e9bf3955fa1125b5, team) {
    var_c5e7fce963586ec0 = level.frontlineData[var_e9bf3955fa1125b5].origin;
    var_cae290751508d1a0 = level.gw_objstruct.allieshqloc.trigger.origin;
    if (team == "axis") {
        var_cae290751508d1a0 = level.gw_objstruct.axishqloc.trigger.origin;
    }
    var_d2666395e6cf4732 = getdvarint(@"hash_7456a259db14a9a2", 3000);
    offset = vectornormalize(var_c5e7fce963586ec0 - var_cae290751508d1a0) * var_d2666395e6cf4732;
    var_c5e7fce963586ec0 = var_c5e7fce963586ec0 - offset;
    level thread function_7a5db011b55b3f21(numagents, var_c5e7fce963586ec0, team, 4);
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf886
// Size: 0x3a
function function_a957005e5ff1b17() {
    function_93e7d3696caa5331(14, level.var_48e03f24b9b5c1a, "axis");
    function_93e7d3696caa5331(14, level.var_48e03f24b9b5c1a, "allies");
    level thread function_37169a4fb87a0e3();
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf8c7
// Size: 0x1c1
function function_37169a4fb87a0e3() {
    level endon("game_ended");
    var_4aea3b858d238fd2 = level.scorelimit * 0.25;
    var_4b0036858d3bb806 = level.scorelimit * 0.5;
    var_4b1634858d53e6d3 = level.scorelimit * 0.8;
    var_76650562e610d426 = 0;
    var_7fba03c049d4faba = 0;
    var_1acb94d12e9f55f3 = 0;
    var_2c7ad0c8251c8f9 = 0;
    var_427d285446343e15 = 0;
    var_977746fccdd041c8 = 0;
    while (1) {
        axisscore = namespace_e8a49b70d0769b66::_getteamscore("axis");
        alliesscore = namespace_e8a49b70d0769b66::_getteamscore("allies");
        if (axisscore >= var_4aea3b858d238fd2 && !var_76650562e610d426) {
            function_93e7d3696caa5331(5, level.var_48e03f24b9b5c1a, "axis");
            var_76650562e610d426 = 1;
        } else if (axisscore > var_4b0036858d3bb806 && !var_7fba03c049d4faba) {
            var_7fba03c049d4faba = 1;
        } else if (axisscore > var_4b1634858d53e6d3 && !var_1acb94d12e9f55f3) {
            function_93e7d3696caa5331(9, level.var_48e03f24b9b5c1a, "axis");
            var_1acb94d12e9f55f3 = 1;
        }
        if (alliesscore >= var_4aea3b858d238fd2 && !var_2c7ad0c8251c8f9) {
            function_93e7d3696caa5331(5, level.var_48e03f24b9b5c1a, "allies");
            var_2c7ad0c8251c8f9 = 1;
        } else if (alliesscore > var_4b0036858d3bb806 && !var_427d285446343e15) {
            var_427d285446343e15 = 1;
        } else if (alliesscore > var_4b1634858d53e6d3 && !var_977746fccdd041c8) {
            function_93e7d3696caa5331(9, level.var_48e03f24b9b5c1a, "allies");
            var_977746fccdd041c8 = 1;
        }
        if (var_76650562e610d426 && var_7fba03c049d4faba && var_1acb94d12e9f55f3 && var_2c7ad0c8251c8f9 && var_427d285446343e15 && var_977746fccdd041c8) {
            return;
        }
        wait(1);
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfa8f
// Size: 0xa5
function function_529a85d52f057f9b() {
    self endon("game_ended");
    while (1) {
        if (getdvarint(@"hash_46a6b424af6acbc2") != 0) {
            namespace_e8a49b70d0769b66::giveteamscoreforobjective("allies", getdvarint(@"hash_46a6b424af6acbc2"), 0);
            break;
        } else if (getdvarint(@"hash_86e14326e43c0115") != 0) {
            namespace_e8a49b70d0769b66::giveteamscoreforobjective("axis", getdvarint(@"hash_86e14326e43c0115"), 0);
            break;
        }
        wait(1);
    }
    /#
        setdevdvar(@"hash_46a6b424af6acbc2", 0);
        setdevdvar(@"hash_86e14326e43c0115", 0);
    #/
    thread function_529a85d52f057f9b();
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb3b
// Size: 0x19d
function function_2da93e2a35e2182f(agent, team, var_baa22cf8db30f212, laneKey, var_3e332762c9138001) {
    if (!isalive(agent)) {
        return;
    }
    var_a2d0446bc9b000ab = level.frontlineData[var_baa22cf8db30f212].var_a2d0446bc9b000ab[laneKey];
    if (isdefined(var_a2d0446bc9b000ab.var_e59f791d76c7beee) && isdefined(var_a2d0446bc9b000ab.var_d8c8ec702b9afd80) && var_a2d0446bc9b000ab.var_e59f791d76c7beee.size > 0 && var_a2d0446bc9b000ab.var_d8c8ec702b9afd80.size > 0) {
        if (istrue(agent.var_5966903b1e0154e5)) {
            volume = var_a2d0446bc9b000ab.var_e59f791d76c7beee[getenemyteams(team)[0]];
        } else {
            volume = var_a2d0446bc9b000ab.var_d8c8ec702b9afd80[team];
        }
    } else {
        volume = level.frontlineData[var_baa22cf8db30f212].var_a2d0446bc9b000ab[laneKey].var_45d6f1c931bc6a8b[team][0].goalvolume;
    }
    angles = level.frontlineData[var_baa22cf8db30f212].var_a2d0446bc9b000ab[laneKey].var_45d6f1c931bc6a8b[team][0].angles;
    if (isdefined(volume)) {
        agent cleargoalvolume();
        agent setgoalvolumeauto(volume, volume.heading);
        agent.var_99f2752b6513c9dd = volume;
        if (!istrue(var_3e332762c9138001)) {
            level thread namespace_2000a83505151e5b::function_5d96b05a065564e(agent);
            agent thread function_55c73da3bc1275f7(agent);
        }
        return 1;
    }
    return 0;
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfce0
// Size: 0x153
function function_6d1fed8dd6165391() {
    level endon("game_ended");
    level.var_ce3b5ef4c0b6019 = [];
    level.var_ce3b5ef4c0b6019["axis"] = [];
    level.var_ce3b5ef4c0b6019["allies"] = [];
    level.var_e71982ff48057365 = [];
    while (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        waitframe();
    }
    flag_wait("frontline_data_init");
    namespace_d576b6dc7cef9c62::waitforplayers(level.prematchperiod, 0, 0);
    level thread function_6a6a92b892cf9e9a("axis");
    level thread function_6a6a92b892cf9e9a("allies");
    while (1) {
        foreach (player in level.players) {
            if (!isalive(player)) {
                continue;
            }
            playerentnum = player getentitynumber();
            if (isdefined(level.var_ce3b5ef4c0b6019[player.team][playerentnum])) {
                continue;
            }
            if (!isdefined(level.var_e71982ff48057365[playerentnum]) && function_6bc95c97ce75ae39(player)) {
                level.var_ce3b5ef4c0b6019[player.team][playerentnum] = player;
            }
        }
        wait(1);
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfe3a
// Size: 0x1f5
function function_6a6a92b892cf9e9a(team) {
    level endon("game_ended");
    enemyteam = getenemyteams(team)[0];
    while (1) {
        foreach (key, player in level.var_ce3b5ef4c0b6019[team]) {
            if (!isdefined(player) || !isalive(player)) {
                level.var_ce3b5ef4c0b6019[team][key] = undefined;
            } else {
                agents = namespace_235de5057ddc58e0::function_d9ce8fb00f0e5fa1(player.origin, 5000, enemyteam);
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
                    level.var_e71982ff48057365[key] = player;
                    foreach (agent in var_c5a227521b066bdd) {
                        function_b692eed7a70f888(player, agent);
                    }
                }
            }
        }
        wait(5);
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10036
// Size: 0xa4
function function_b692eed7a70f888(player, agent) {
    agent cleargoalvolume();
    agent function_d955a85131dc6e69(player, 40);
    agent.var_d0640290e2529307 = 1;
    agent thread namespace_2000a83505151e5b::function_a5117518725da028(agent, player.origin, 8, 8, undefined, 1, undefined, 0, &function_f06be3ff9086a2ad, player);
    agent.var_e79513bbf1767908 = agent.baseaccuracy;
    agent.baseaccuracy = agent.baseaccuracy + getdvarfloat(@"hash_67a1af3428021a00", 0.5);
    agent thread function_289c977b7523efba(agent, player);
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x100e1
// Size: 0x47
function function_f06be3ff9086a2ad(agent, targetent) {
    if (istrue(agent.var_d0640290e2529307)) {
        agent thread namespace_2000a83505151e5b::function_a5117518725da028(agent, targetent.origin, 8, 8, undefined, 1, undefined, 0, &function_f06be3ff9086a2ad, targetent);
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1012f
// Size: 0x88
function function_289c977b7523efba(agent, player) {
    agent notify("endHuntTrackerTimer");
    level endon("game_ended");
    agent endon("death");
    agent endon("endHuntTrackerTimer");
    playerentnum = player getentitynumber();
    player waittill_notify_or_timeout("death", 20);
    level.var_e71982ff48057365[playerentnum] = undefined;
    agent.var_d0640290e2529307 = 0;
    agent.baseaccuracy = agent.var_e79513bbf1767908;
    function_2aa208e2058474e5(agent);
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x101be
// Size: 0x9b
function function_c4232cf1e0949932(player) {
    var_a2b13b5ae4cb7698 = level.frontlineData[level.var_48e03f24b9b5c1a].origin;
    var_a011729d000a28d2 = vectornormalize(var_a2b13b5ae4cb7698 - player.origin);
    dot = vectordot(level.spawnselectionteamforward[player.team], var_a011729d000a28d2);
    if (vectordot(level.spawnselectionteamforward[player.team], var_a011729d000a28d2) < 0) {
        return 1;
    }
    return 0;
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10261
// Size: 0x159
function function_6bc95c97ce75ae39(player) {
    var_a2d0446bc9b000ab = level.frontlineData[level.var_48e03f24b9b5c1a].var_a2d0446bc9b000ab[1];
    if (!isdefined(var_a2d0446bc9b000ab.var_d8c8ec702b9afd80) || var_a2d0446bc9b000ab.var_d8c8ec702b9afd80.size <= 0) {
        var_baa22cf8db30f212 = level.var_48e03f24b9b5c1a;
        var_55dce045dcd7eba2 = level.frontlineData[level.var_48e03f24b9b5c1a].var_a2d0446bc9b000ab[1].var_45d6f1c931bc6a8b[player.team][0].goalvolume.origin;
    } else {
        var_55dce045dcd7eba2 = var_a2d0446bc9b000ab.var_d8c8ec702b9afd80[getenemyteams(player.team)[0]].origin;
    }
    var_a011729d000a28d2 = vectornormalize(var_55dce045dcd7eba2 - player.origin);
    dot = vectordot(level.spawnselectionteamforward[player.team], var_a011729d000a28d2);
    if (vectordot(level.spawnselectionteamforward[player.team], var_a011729d000a28d2) < 0) {
        return 1;
    }
    return 0;
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x103c2
// Size: 0x268
function function_ae56674143e0ec69() {
    namespace_bfef6903bca5845d::function_2fc80954fa70d153();
    while (1) {
        var_7d07bcc667393cdf = 0;
        var_acce55f72d869802 = 0;
        foreach (agent in level.agentarray) {
            if (isalive(agent)) {
                color = (0, 1, 0);
                if (agent.team == "axis") {
                    color = (1, 0, 0);
                    var_7d07bcc667393cdf++;
                } else {
                    var_acce55f72d869802++;
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
            printtoscreen2d(300, 50, "infil" + var_7d07bcc667393cdf, (0, 0, 1), 2.5, 1);
            printtoscreen2d(300, 100, "intro_scene_axis" + var_acce55f72d869802, (0, 0, 1), 2.5, 1);
            line(level.frontlineData[level.var_48e03f24b9b5c1a].var_a2d0446bc9b000ab[0].origin, level.frontlineData[level.var_48e03f24b9b5c1a].var_a2d0446bc9b000ab[1].origin, (0, 1, 0));
            line(level.frontlineData[level.var_48e03f24b9b5c1a].var_a2d0446bc9b000ab[1].origin, level.frontlineData[level.var_48e03f24b9b5c1a].var_a2d0446bc9b000ab[2].origin, (0, 1, 0));
        #/
        waitframe();
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10631
// Size: 0x105
function function_a999b4ee6f415e8c() {
    self endon("game_ended");
    namespace_bfef6903bca5845d::function_2fc80954fa70d153();
    while (1) {
        foreach (agent in level.agentarray) {
            if (isalive(agent) && !istrue(agent.var_d0640290e2529307)) {
                if (isdefined(agent.vehicle_position) && isint(agent.vehicle_position)) {
                    continue;
                }
                if (isdefined(agent.landing_spot)) {
                    continue;
                }
                laneKey = namespace_14d36171baccf528::agentPers_getAgentPersData(agent, "laneKey");
                if (isdefined(laneKey)) {
                    if (istrue(agent.var_a8a165c3323bda48)) {
                        continue;
                    }
                    function_2da93e2a35e2182f(agent, agent.team, level.var_48e03f24b9b5c1a, laneKey);
                }
            }
        }
        wait(5);
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1073d
// Size: 0x1ca
function function_c1313bf26d803678(team) {
    self endon("game_ended");
    level notify("resetAgentVolumeMovementThink" + team);
    level endon("resetAgentVolumeMovementThink" + team);
    namespace_bfef6903bca5845d::function_2fc80954fa70d153();
    flag_wait("frontline_data_init");
    wait(5);
    while (1) {
        var_43ee1459b6b49b5a = 0;
        level.var_3bf1cf107e60e048[team] = array_randomize(level.var_3bf1cf107e60e048[team]);
        foreach (index, agent in level.var_3bf1cf107e60e048[team]) {
            if (isalive(agent) && !isdefined(agent.vehicle) && (istrue(agent.var_a8a165c3323bda48) || !istrue(function_47d612d4d655f75d(agent)))) {
                function_fd1ef087d4a56d19(agent, team, index);
                var_43ee1459b6b49b5a = 1;
                break;
            }
        }
        if (!istrue(var_43ee1459b6b49b5a)) {
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
        wait(randomfloatrange(4, 7));
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1090e
// Size: 0xa3
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

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x109b8
// Size: 0x5d
function function_47d612d4d655f75d(agent) {
    if (!isalive(agent) || !isdefined(agent.agent_type)) {
        return undefined;
    }
    if (issubstr(agent.agent_type, "rpg") || issubstr(agent.agent_type, "sniper")) {
        return 1;
    }
    return 0;
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10a1d
// Size: 0x27a
function function_7f995b3e1538a773() {
    level.var_f74d710168834c2b = [];
    level.var_f74d710168834c2b["axis"] = [];
    level.var_f74d710168834c2b["allies"] = [];
    var_5352a7311a690a33 = getstructarray("intro_scene_axis", "script_noteworthy");
    foreach (intronode in var_5352a7311a690a33) {
        var_f3199f1faf87346c = getstructarray(intronode.target, "targetname");
        foreach (loc in var_f3199f1faf87346c) {
            script_noteworthy = tolower(loc.script_noteworthy);
            if (isdefined(script_noteworthy) && !isdefined(level.var_f74d710168834c2b["axis"][script_noteworthy])) {
                level.var_f74d710168834c2b["axis"][script_noteworthy] = [];
            }
            level.var_f74d710168834c2b["axis"][script_noteworthy][level.var_f74d710168834c2b["axis"][script_noteworthy].size] = loc;
        }
    }
    var_494169afc61a508 = getstructarray("intro_scene_allies", "script_noteworthy");
    foreach (intronode in var_494169afc61a508) {
        var_f3199f1faf87346c = getstructarray(intronode.target, "targetname");
        foreach (loc in var_f3199f1faf87346c) {
            script_noteworthy = tolower(loc.script_noteworthy);
            if (isdefined(script_noteworthy) && !isdefined(level.var_f74d710168834c2b["allies"][script_noteworthy])) {
                level.var_f74d710168834c2b["allies"][script_noteworthy] = [];
            }
            level.var_f74d710168834c2b["allies"][script_noteworthy][level.var_f74d710168834c2b["allies"][script_noteworthy].size] = loc;
        }
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10c9e
// Size: 0x2cf
function function_fdc34e092fe389c8() {
    namespace_bfef6903bca5845d::function_2fc80954fa70d153();
    waitframe();
    foreach (var_26b788eee5e1c883, var_75f30b91d39c93d in level.var_f74d710168834c2b["axis"]) {
        foreach (var_470945768f8f02b6 in var_75f30b91d39c93d) {
            var_eca35527d55ec10e = function_d7fcf73c5cf90be1(var_26b788eee5e1c883);
            var_30f3543613edaa6e = var_eca35527d55ec10e[2];
            rotationoffset = var_eca35527d55ec10e[1];
            var_3e38ee41dc326fdc = var_eca35527d55ec10e[0];
            var_b5b1784d5a1327c7 = "spawnHQ_axis";
            aitype = namespace_bfef6903bca5845d::function_d5bc07eabf352abb(undefined, undefined, "guard", undefined, level.var_c7a4725d05bb7f22, level.var_72f834b3f8b2a366["axis"]);
            origin = getclosestpointonnavmesh(var_470945768f8f02b6.origin);
            agent = namespace_bfef6903bca5845d::ai_mp_requestSpawnAgent(aitype, origin, var_470945768f8f02b6.angles + rotationoffset, "medium", var_b5b1784d5a1327c7, undefined, undefined, "axis", undefined, undefined, 1);
            if (isalive(agent)) {
                agent thread function_6c7668729d88ed55(agent, var_3e38ee41dc326fdc, "intro_cap_complete", var_30f3543613edaa6e);
                agent thread function_8c8977b452f6a8a(agent);
            }
        }
    }
    foreach (var_26b788eee5e1c883, var_75f30b91d39c93d in level.var_f74d710168834c2b["allies"]) {
        foreach (var_470945768f8f02b6 in var_75f30b91d39c93d) {
            var_ecb05d27d56ce72b = function_d7fcf73c5cf90be1(var_26b788eee5e1c883);
            var_30f3543613edaa6e = var_ecb05d27d56ce72b[2];
            rotationoffset = var_ecb05d27d56ce72b[1];
            var_3e38ee41dc326fdc = var_ecb05d27d56ce72b[0];
            var_b5b1784d5a1327c7 = "spawnHQ_allies";
            aitype = namespace_bfef6903bca5845d::function_d5bc07eabf352abb(undefined, undefined, "guard", undefined, level.var_c7a4725d05bb7f22, level.var_72f834b3f8b2a366["allies"]);
            origin = getclosestpointonnavmesh(var_470945768f8f02b6.origin);
            agent = namespace_bfef6903bca5845d::ai_mp_requestSpawnAgent(aitype, origin, var_470945768f8f02b6.angles + rotationoffset, "medium", var_b5b1784d5a1327c7, undefined, undefined, "allies", undefined, undefined, 1);
            if (isalive(agent)) {
                agent thread function_6c7668729d88ed55(agent, var_3e38ee41dc326fdc, "intro_cap_complete", var_30f3543613edaa6e);
                agent thread function_8c8977b452f6a8a(agent);
            }
        }
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10f74
// Size: 0x11e
function function_d7fcf73c5cf90be1(var_26b788eee5e1c883) {
    var_3e38ee41dc326fdc = undefined;
    rotationoffset = (0, 0, 0);
    var_30f3543613edaa6e = 6 + randomfloatrange(-0.75, 0.75);
    switch (var_26b788eee5e1c883) {
    case #"hash_d8c4e5876be97da":
        var_3e38ee41dc326fdc = "caps/mp/rebel_peptalk_01";
        break;
    case #"hash_d8c4d5876be9647":
        var_3e38ee41dc326fdc = "caps/mp/rebel_peptalk_01";
        break;
    case #"hash_d8c4c5876be94b4":
        var_3e38ee41dc326fdc = "caps/mp/rebel_peptalk_01";
        break;
    case #"hash_d8c4b5876be9321":
        var_3e38ee41dc326fdc = "caps/mp/rebel_peptalk_04";
        break;
    case #"hash_4059cfe6b7ea61be":
        var_3e38ee41dc326fdc = "caps/mp/rebel_stand_05";
        rotationoffset = (0, -90, 0);
        break;
    case #"hash_4059cee6b7ea602b":
        var_3e38ee41dc326fdc = "caps/mp/rebel_stand_02";
        rotationoffset = (0, -90, 0);
        break;
    case #"hash_3476ad55eb745a44":
        var_3e38ee41dc326fdc = "caps/mp/rebel_peptalk_leader";
        break;
    }
    return [0:var_3e38ee41dc326fdc, 1:rotationoffset, 2:var_30f3543613edaa6e];
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1109a
// Size: 0xf8
function function_6c7668729d88ed55(agent, var_3e38ee41dc326fdc, var_610be4afa05a30cb, var_30f3543613edaa6e) {
    if (!isdefined(var_3e38ee41dc326fdc)) {
        var_3e38ee41dc326fdc = "caps/mp/rebel_peptalk_01";
    }
    namespace_14d36171baccf528::agentPers_setAgentPersData(agent, "team", agent.team);
    waitframe();
    agent thread namespace_aebb27832287cd3a::cap_start("cap_single", var_3e38ee41dc326fdc);
    waittime = 3;
    if (level.prematchperiodend > 0) {
        level waittill("match_start_real_countdown");
        waittime = level.prematchperiodend - var_30f3543613edaa6e;
        waittime = ter_op(0 < waittime, waittime, 0);
    }
    wait(waittime);
    agent.var_760f5d16839d683f = 1;
    remainingtime = 7;
    var_5321eb7c0023b4a7 = randomfloatrange(4, 6);
    wait(var_5321eb7c0023b4a7);
    playsoundatpos(agent.origin, "mp_walla_invasion_charge_individual");
    wait(remainingtime - var_5321eb7c0023b4a7);
    agent namespace_aebb27832287cd3a::function_b6af4ade50626e90();
    agent notify(var_610be4afa05a30cb);
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11199
// Size: 0xd2
function function_8c8977b452f6a8a(agent) {
    if (agent.team == "allies") {
        var_f23987bcabee0296 = level.var_df2344c49d981562[agent.team][randomint(level.var_df2344c49d981562[agent.team].size)];
        agent namespace_14d36171baccf528::function_c37c4f9d687074ff(var_f23987bcabee0296.body, var_f23987bcabee0296.head);
        agent.var_76f8ddb1563464bd = 1;
    }
    agent waittill("intro_cap_complete");
    laneKey = namespace_fab382c89d62fd63::function_b983381333b3881b(agent.origin);
    namespace_fab382c89d62fd63::function_2da93e2a35e2182f(agent, agent.team, level.var_48e03f24b9b5c1a, laneKey);
    namespace_fab382c89d62fd63::function_4c7945217f8adffa(agent, laneKey);
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11272
// Size: 0x3c4
function function_2b4958acf92594e3() {
    while (!istrue(level.var_1091b5d43ba7a905)) {
        waitframe();
    }
    foreach (team in level.teamnamelist) {
        var_a2b13b5ae4cb7698 = (0, 0, 0);
        foreach (var_a2d0446bc9b000ab in level.frontlineData[level.var_48e03f24b9b5c1a].var_a2d0446bc9b000ab) {
            var_a2b13b5ae4cb7698 = var_a2b13b5ae4cb7698 + var_a2d0446bc9b000ab.origin;
        }
        var_a2b13b5ae4cb7698 = var_a2b13b5ae4cb7698 / level.frontlineData[level.var_48e03f24b9b5c1a].var_a2d0446bc9b000ab.size;
        if (team == "allies") {
            forward = level.spawnselectionteamforward["allies"] * -1;
        } else {
            forward = level.spawnselectionteamforward["axis"] * -1;
        }
        var_d2666395e6cf4732 = getdvarint(@"hash_25e538731b72b1b4", 10000);
        height = getdvarint(@"hash_b78ef73b0670b310", 2000);
        camerapos = var_a2b13b5ae4cb7698 + forward * var_d2666395e6cf4732;
        trace = ray_trace(camerapos + (0, 0, 10000), camerapos - (0, 0, 20000));
        if (trace["hittype"] == "hittype_none") {
            camerapos = (camerapos[0], camerapos[1], namespace_d7fe36703a9572fe::getstartspawnavg(team)[2]) + (0, 0, height);
        } else if (trace["position"][2] < namespace_d7fe36703a9572fe::getstartspawnavg(team)[2]) {
            camerapos = (camerapos[0], camerapos[1], namespace_d7fe36703a9572fe::getstartspawnavg(team)[2]) + (0, 0, height);
        } else {
            camerapos = trace["position"] + (0, 0, height);
        }
        var_6d399a908d913b0b = vectornormalize(var_a2b13b5ae4cb7698 - camerapos);
        cameraang = vectortoanglessafe(var_6d399a908d913b0b, (0, 0, 1));
        level.spawncameras["default"][team].origin = camerapos;
        level.spawncameras["default"][team].angles = cameraang;
        var_28d7c5ca5ba161e1 = getdvarint(@"hash_a66b78681b2d0805", 4096);
        var_963953c3478bf4fe = var_a2b13b5ae4cb7698 + forward * var_28d7c5ca5ba161e1;
        var_963953c3478bf4fe = drop_to_ground(var_963953c3478bf4fe);
        level.spawncameras["default"][team].var_6930961c8a8d33fc = var_963953c3478bf4fe;
        if (getdvarint(@"hash_13fae9c305971d06", 0) == 1) {
            color = (1, 0, 0);
            if (team == "allies") {
                color = (0, 0, 1);
            }
            thread drawline(camerapos + (0, 0, 10000), camerapos - (0, 0, 20000), 60, (1, 1, 0));
            thread drawsphere(camerapos, 100, 60, color);
            thread drawline(camerapos, var_a2b13b5ae4cb7698, 60, color);
            thread drawline(camerapos, var_963953c3478bf4fe, 60, (0, 1, 0));
        }
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1163d
// Size: 0xb8
function function_4fa7b02d1bbe565e(var_d011f1adedd9d3ed) {
    level.var_c7a4725d05bb7f22 = 2;
    if (!isdefined(var_d011f1adedd9d3ed)) {
        var_d011f1adedd9d3ed = 0;
    }
    wait(var_d011f1adedd9d3ed);
    foreach (team in level.teamnamelist) {
        namespace_944ddf7b8df1b0e3::statusdialog("tier2_friendly", team, 1);
        showsplashtoteam(team, "gwtdm_tier2_agents_inc");
    }
    function_93e7d3696caa5331(7, level.var_48e03f24b9b5c1a, "axis");
    function_93e7d3696caa5331(7, level.var_48e03f24b9b5c1a, "allies");
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x116fc
// Size: 0x8a
function function_4fa7b12d1bbe5891(var_d011f1adedd9d3ed) {
    level.var_c7a4725d05bb7f22 = 3;
    if (!isdefined(var_d011f1adedd9d3ed)) {
        var_d011f1adedd9d3ed = 0;
    }
    wait(var_d011f1adedd9d3ed);
    foreach (team in level.teamnamelist) {
        namespace_944ddf7b8df1b0e3::statusdialog("tier3_friendly", team, 1);
        showsplashtoteam(team, "gwtdm_tier3_agents_inc");
    }
}

// Namespace gwtdm/namespace_fab382c89d62fd63
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1178d
// Size: 0x45
function onplayerconnectstream() {
    if (!isdefined(self.sessionteam) || self.sessionteam == "spectator" || self.sessionteam == "none" || self isplayerheadless()) {
        return 0;
    }
    return 1;
}

