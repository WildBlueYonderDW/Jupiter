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
#using scripts\mp\utility\print.gsc;
#using script_27c2db69a21775a0;
#using script_1d4b01c1ec829364;
#using script_2f4866552f0ba818;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\globallogic.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\utility\join_team_aggregator.gsc;
#using scripts\mp\gametypes\dom.gsc;
#using scripts\mp\gametypes\obj_dom.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_600b944a95c3a7bf;
#using scripts\common\vehicle.gsc;
#using scripts\mp\rally_point.gsc;
#using scripts\cp_mp\parachute.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using scripts\mp\equipment\tac_insert.gsc;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using script_548072087c9fd504;
#using scripts\mp\codcasterclientmatchdata.gsc;
#using scripts\mp\persistence.gsc;
#using script_4a6760982b403bad;
#using scripts\mp\class.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\spawnselection.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\spawncamera.gsc;
#using scripts\cp_mp\killstreaks\airdrop.gsc;
#using scripts\cp_mp\killstreaks\nuke.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\spawnscoring.gsc;
#using script_3f1b6713ca4c9c7;
#using script_76cc264b397db9cb;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\mp\utility\disconnect_event_aggregator.gsc;
#using scripts\mp\spectating.gsc;
#using scripts\mp\utility\game_utility_mp.gsc;

#namespace bigctf;

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1888
// Size: 0xa88
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
        registerscorelimitdvar(getgametype(), 5);
        registerroundlimitdvar(getgametype(), 1);
        registerwinlimitdvar(getgametype(), 1);
        registernumlivesdvar(getgametype(), 0);
        registerhalftimedvar(getgametype(), 0);
    }
    setdvar(@"hash_405e7e20d91344cc", 0);
    setdvar(@"hash_42eece3f15e35b3d", 1);
    setdvar(@"hash_a22f98e2c5b506ce", 30);
    setdvar(@"hash_e4fa721677f03de0", 1);
    setdvar(@"hash_cbc195ec2129279", 0);
    setomnvar("ui_num_dom_flags", 5);
    setdvar(@"hash_e547fe8dfe1679f6", 30);
    setdvar(@"hash_36374c04e23480b6", 1);
    enablegroundwarspawnlogic(400, 1200);
    updategametypedvars();
    namespace_1309ce202b9aa92b::registeronplayerjointeamcallback(&onjoinedteam);
    level.scoreperplayer = undefined;
    level.teambased = 1;
    level.onstartgametype = &onstartgametype;
    level.onplayerconnect = &onplayerconnect;
    level.getspawnpoint = &getspawnpoint;
    level.modeonspawnplayer = &onspawnplayer;
    level.onplayerkilled = &onplayerkilled;
    level.onrespawndelay = &getrespawndelay;
    level.onnormaldeath = &onnormaldeath;
    level.onobjectivecomplete = &namespace_6b4b8b8421d203ba::onflagcapture;
    level.updatefobspawnselection = &updatefobspawnselection;
    /#
        level.var_e3a2a0c2e544728e = &function_e3a2a0c2e544728e;
    #/
    level.domflag_setneutral = &namespace_98b55913d2326ac8::domflag_setneutral;
    level.dompoint_setcaptured = &namespace_98b55913d2326ac8::dompoint_setcaptured;
    level.requiredplayercountoveride = 1;
    level.requiredplayercount["allies"] = 12;
    level.requiredplayercount["axis"] = 12;
    level.var_e637d49948a038d3 = &getmissedinfilcamerapositions;
    level.var_3c89983e2030dfff = &calculatecameraoffset;
    if (namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
        game["dialog"]["gametype"] = "iw9_mpcf_mode_uktl_cft1";
    } else {
        game["dialog"]["gametype"] = "iw9_mpcf_mode_uktl_nam2";
    }
    game["dialog"]["ally_taken"] = "iw9_mpcf_mode_uktl_afst";
    game["dialog"]["ally_dropped"] = "iw9_mpcf_mode_uktl_afdr";
    game["dialog"]["ally_returned"] = "iw9_mpcf_mode_uktl_afrt";
    game["dialog"]["ally_returning_ours"] = "iw9_mpcf_mode_uktl_arof";
    game["dialog"]["ally_captured"] = "iw9_mpcf_mode_uktl_afcp";
    game["dialog"]["enemy_taken"] = "iw9_mpcf_mode_uktl_efst";
    game["dialog"]["enemy_dropped"] = "iw9_mpcf_mode_uktl_efdr";
    game["dialog"]["enemy_returned"] = "iw9_mpcf_mode_uktl_efrt";
    game["dialog"]["enemy_returning_theirs"] = "iw9_mpcf_mode_uktl_ertf";
    game["dialog"]["enemy_captured"] = "iw9_mpcf_mode_uktl_efcp";
    game["dialog"]["ally_one_cap_left"] = "iw9_mpcf_mode_uktl_aocl";
    game["dialog"]["enemy_one_cap_left"] = "iw9_mpcf_mode_uktl_eocl";
    game["dialog"]["boost"] = "iw9_mpcf_mode_uktl_bost";
    game["dialog"]["one_cap_tied"] = "iw9_mpcf_mode_uktl_ocbt";
    level.nosuspensemusic = 1;
    level._effect["vfx_smk_signal_gr"] = loadfx("vfx/_requests/mp_gameplay/vfx_smk_signal_gr");
    level._effect["vfx_snatch_ac130_clouds"] = loadfx("vfx/iw8_mp/gamemode/vfx_snatch_ac130_clouds.vfx");
    level._effect["vfx_br_infil_cloud_scroll"] = loadfx("vfx/iw8_br/gameplay/infil/vfx_br_infil_cloud_scroll.vfx");
    level._effect["vfx_br_infil_jump_smoke_01"] = loadfx("vfx/iw8_br/gameplay/infil/vfx_br_infil_jump_smoke_01.vfx");
    level._effect["vfx_br_infil_jump_wisp_01"] = loadfx("vfx/iw8_br/gameplay/infil/vfx_br_infil_jump_wisp_01.vfx");
    level._effect["vfx_br_infil_jump_wisp_02"] = loadfx("vfx/iw8_br/gameplay/infil/vfx_br_infil_jump_wisp_02.vfx");
    level._effect["vfx_br_infil_omni_light"] = loadfx("vfx/iw8_br/gameplay/infil/vfx_br_infil_omni_light.vfx");
    level._effect["vfx_br_infil_spot_light"] = loadfx("vfx/iw8_br/gameplay/infil/vfx_br_infil_spot_light.vfx");
    level.var_a0f41ec8e5268d15 = 1;
    level.var_a98a9986264d0efc = getdvarint(@"hash_6228446f42d1367f", 1) == 1;
    level.nukeselectactive = getdvarint(@"hash_720c7a325f31f44b", 0);
    level.killstoearnnukeselect = getdvarint(@"hash_b081c1dd5ea0af33", 7);
    level.useobjectives = getdvarint(@"hash_f487c553b2ae0bdb", 1);
    level.userallypointvehicles = getdvarint(@"hash_9381d93d96c2f50b", 1);
    level.hideenemyfobs = getdvarint(@"hash_7aefd938edd32dcc", 0);
    level.completelyremovelittlebird = getdvarint(@"hash_e39e476d418a5b03", 0);
    level.usec130spawn = getdvarint(@"hash_9d9bb5a2f8144fb0", 0);
    level.usec130spawnfirstonly = getdvarint(@"hash_930ce0bf448dadaa", 0);
    level.c130movementmethod = getdvarint(@"hash_2a34ac7d0124085e", 0);
    level.c130flightdist = getdvarfloat(@"hash_2d511cfd4eb77221", 4000);
    level.c130distapart = getdvarfloat(@"hash_ef46594cd3335bd3", 5000);
    level.c130alignedtolocale = getdvarfloat(@"hash_f4da32c36b5dcd26", 1);
    level.var_67a7732487fb9242 = getdvarint(@"hash_e4a8296b521a6dee", 1) == 1;
    level.var_90f4dc933b674184 = getdvarfloat(@"hash_91d950c33d45ae50", 60);
    level.var_1a505675f3ef1197 = getdvarfloat(@"hash_58c456ebd6371a4b", 60);
    level.var_8e9daba162280a8e = getdvarint(@"hash_19e5cada53ccf044", 0) == 1;
    level.var_eaa760f325371803 = getdvarint(@"hash_67a32114ce80b58f", 0) == 1;
    level.var_7f5be0207e7457b1 = getdvarint(@"hash_27abaa55d7ec8eb9", 1) == 1;
    level.var_a6954a050d77d75c = getdvarint(@"hash_7194076ab4888f2b", 0) == 1 || getdvarint(@"hash_ff5233fcf546c6b1", 0) == 1;
    level.var_d23c7c1add9fb181 = &function_d23c7c1add9fb181;
    level.var_4de8052758f986f3 = &function_4de8052758f986f3;
    level.var_3ce1055115edcbbb = &function_3ce1055115edcbbb;
    level.var_efbc646224fda4fa = &function_efbc646224fda4fa;
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
    level.mercymatchending_nuke = getdvarint(@"hash_647cfd0a848d6ed6", 1);
    level.mercymatchending_time = getdvarint(@"hash_7106e5f59987983a", 30);
    level.numnonrallyvehicles = getdvarint(@"hash_87f140caf9a39bf8", 25);
    level.disablepersonalnuke = getdvarint(@"hash_f271257bddc28c95", 0);
    level.personalnukecostoverride = getdvarint(@"hash_d9455f252fccdb97", 30);
    level.showteamtanks = getdvarint(@"hash_236401104966b535", 1);
    level.spawnselectionafktime = getdvarint(@"hash_da4e1d4c2111a1bc", 120);
    level.manualadjustlittlebirdlocs = getdvarint(@"hash_1d04716268113cb5", 1);
    level.var_b307135dbcef5a38 = getdvarint(@"hash_a9937f1a2710bcd8", 1);
    if (istrue(level.showteamtanks)) {
        level.trackedtanks = [];
        level.trackedtanks["axis"] = [];
        level.trackedtanks["allies"] = [];
    }
    if (level.useobjectives || level.userallypointvehicles || level.usesquadspawnselection) {
        setdvar(@"hash_6e73595f4ce7501e", 1);
        setdvar(@"hash_5fc696f5bbb3ca62", 0);
        setdvar(@"hash_1a2c3b67392b6657", 1);
    } else {
        setdvar(@"hash_6e73595f4ce7501e", 0);
        setdvar(@"hash_5fc696f5bbb3ca62", 1);
        setdvar(@"hash_1a2c3b67392b6657", 1);
    }
    if (level.c130movementmethod == 1) {
        level.c130pathkilltracker = [];
        level.c130pathkilltracker["axis"] = 0;
        level.c130pathkilltracker["allies"] = 0;
    }
    level.modecontrolledvehiclespawningonly = 1;
    level.disableteamstartspawns = 1;
    level.spawnprotectionexception = &spawnprotectionexception;
    thread function_658c8f668d2cd83c();
    if (getdvarint(@"hash_60a5cd40eb9c3192", 0) == 1) {
        level thread function_5a426c120b990e2c();
    }
    flag_init("stealth_enabled");
    flag_init("level_stealth_initialized");
    flag_init("stealth_spotted");
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2317
// Size: 0x75
function function_b8500bdd6944ff2f() {
    if (isdefined(level.outofboundstriggers)) {
        foreach (trigger in level.outofboundstriggers) {
            if (isdefined(trigger.script_team)) {
                trigger thread function_924a93f46b348a86();
            }
        }
    }
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2393
// Size: 0x164
function function_924a93f46b348a86() {
    level endon("game_ended");
    while (1) {
        ent = self waittill("trigger");
        if (!isplayer(ent) && !ent namespace_dbbb37eb352edf96::isvehicle()) {
            continue;
        }
        if (isplayer(ent) && isalive(ent)) {
            if (isdefined(ent.carryobject)) {
                ent.carryobject thread namespace_19b4203b51d56488::function_1069580bc0a235cb(ent, ent.carryobject.var_ea5e94e328a4b626);
            }
        } else if (ent namespace_dbbb37eb352edf96::isvehicle()) {
            if (isdefined(ent.occupants)) {
                foreach (player in ent.occupants) {
                    if (isdefined(player.carryobject)) {
                        player.carryobject namespace_19b4203b51d56488::function_1069580bc0a235cb(player, player.carryobject.var_ea5e94e328a4b626);
                        level.teamflags[getotherteam(player.team)[0]] namespace_19b4203b51d56488::function_25261199a27252e(getclosestpointonnavmesh(player.origin));
                    }
                }
            }
        }
        wait(1);
    }
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24fe
// Size: 0xe9
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
    setdynamicdvar(@"hash_a628ce6d2ccf681a", getmatchrulesdata("kothData", "zoneLifetime"));
    setdynamicdvar(@"hash_bf8ece70150be9dc", getmatchrulesdata("kothData", "zoneCaptureTime"));
    setdynamicdvar(@"hash_8089acae7c7dfec4", getmatchrulesdata("kothData", "zoneActivationDelay"));
    setdynamicdvar(@"hash_3c161b296c1897d", getmatchrulesdata("kothData", "randomLocationOrder"));
    setdynamicdvar(@"hash_6c5e3d11225e952c", getmatchrulesdata("kothData", "additiveScoring"));
    setdynamicdvar(@"hash_b0e9e227d52251da", getmatchrulesdata("kothData", "pauseTime"));
    setdynamicdvar(@"hash_cae6ba1d384f03a1", getmatchrulesdata("tdefData", "spawnDelay"));
    registerhalftimedvar("bigctf", 0);
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25ee
// Size: 0x2b0
function onstartgametype() {
    if (!isdefined(game["switchedsides"])) {
        game["switchedsides"] = 0;
    }
    foreach (team in level.teamnamelist) {
        namespace_cd0b2d039510b38d::setobjectivehinttext(team, "OBJECTIVES/CAPTURE_FLAG");
    }
    setclientnamemode("auto_change");
    level.objectives = [];
    level.uncapturableobjectives = [];
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
    debug_setupmatchdata();
    setuphqs();
    flag_default_origins();
    calculatehqmidpoint();
    initspawns();
    createflagsandhud();
    setupobjectives();
    function_b8500bdd6944ff2f();
    level.disablemajoritycapprogress = 1;
    level thread runobjectives();
    if (level.usec130spawn) {
        level thread managec130spawns();
    }
    /#
        level thread function_9c513c5e546a4f52();
    #/
    if (istrue(level.userallypointvehicles)) {
        namespace_fdd1a79841ab3fe7::init();
        if (getdvarint(@"hash_c6c5667b81cd74b7", 1) == 1) {
            function_cf8266a9263b0005("veh9_palfa");
            function_cf8266a9263b0005("little_bird");
        }
        level thread init_rallyvehicles();
    }
    thread init_groundwarvehicles();
    namespace_944ddf7b8df1b0e3::initstatusdialog();
    setdvar(@"hash_9365c7a237edaa2f", 1);
    level.parachutecancutautodeploy = 1;
    level.parachutecancutparachute = 1;
    namespace_5078ee98abb32db9::initparachutedvars();
    emergency_cleanupents();
    updatefobspawnselection();
}

// Namespace bigctf/namespace_43c384132c052883
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28a5
// Size: 0x65
function function_cf8266a9263b0005(vehicleref) {
    foreach (vehicle in namespace_dace9d390bc4a290::function_b08e7e3a0b14f76f(vehicleref)) {
        vehicle.spawnflags = 1;
    }
}

// Namespace bigctf/namespace_43c384132c052883
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2911
// Size: 0x97
function flag_create_team_goal(team) {
    goal = spawnstruct();
    if (!isdefined(goal.origin)) {
        goal.origin = level.default_flag_origins[team];
    }
    goal flag_find_ground();
    goal.origin = goal.ground_origin;
    goal.radius = 120;
    goal.team = team;
    goal.ball_in_goal = 0;
    goal.highestspawndistratio = 0;
    return goal;
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29b0
// Size: 0x9a
function removeflagcarrierclass() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    if (isdefined(self.iscarrying) && self.iscarrying == 1) {
        self notify("force_cancel_placement");
        waitframe();
    }
    while (self ismantling()) {
        waitframe();
    }
    while (!self isonground()) {
        waitframe();
    }
    self.pers["gamemodeLoadout"] = undefined;
    namespace_add8ab90fc53d7f7::spawnpoint_setspawnpoint(self.origin, self.angles);
    self notify("faux_spawn");
    self.faux_spawn_stance = self getstance();
    thread namespace_99ac021a7547cae3::spawnplayer(1);
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a51
// Size: 0x25a
function removeflag() {
    /#
        level endon("enemy_captured");
        while (1) {
            if (getdvar(@"hash_6ce167f2cdc8ef7c", "vfx/iw8_mp/gamemode/vfx_snatch_ac130_clouds.vfx") != "vfx/iw8_mp/gamemode/vfx_snatch_ac130_clouds.vfx") {
                var_3a8f577077353c70 = getdvar(@"hash_6ce167f2cdc8ef7c", "vfx/iw8_mp/gamemode/vfx_snatch_ac130_clouds.vfx");
                if (var_3a8f577077353c70 == "vfx_snatch_ac130_clouds") {
                    team = "vfx/iw8_br/gameplay/infil/vfx_br_infil_jump_smoke_01.vfx";
                } else {
                    team = "vfx_br_infil_omni_light";
                }
                if (team == "vfx/iw8_br/gameplay/infil/vfx_br_infil_jump_smoke_01.vfx") {
                    if (game["stealth_spotted"]) {
                        team = game["OBJECTIVES/CAPTURE_FLAG"];
                    } else {
                        team = game["gunship"];
                    }
                } else if (game["stealth_spotted"]) {
                    team = game["gunship"];
                } else {
                    team = game["OBJECTIVES/CAPTURE_FLAG"];
                }
                level.teamflags[team].trigger notify("any");
                level.teamflags[team] namespace_19b4203b51d56488::allowuse("ui_ctf_flag_axis_return");
                level.teamflags[team].trigger = undefined;
                level.teamflags[team] notify("returns");
                level.teamflags[team].visuals[0] delete();
                level.teamflagbases[team] delete();
                level.capzones[team] namespace_19b4203b51d56488::allowuse("ui_ctf_flag_axis_return");
                level.capzones[team].trigger = undefined;
                level.capzones[team] notify("returns");
                foreach (player in level.players) {
                    player player_delete_flag_goal_fx(team);
                }
                level.teamflags[team].visibleteam = "ui_ctf_flag_axis_return";
                level.teamflags[team] namespace_19b4203b51d56488::setobjectivestatusicons(undefined, undefined);
                level.capzones[team].visibleteam = "ui_ctf_flag_axis_return";
                level.capzones[team] namespace_19b4203b51d56488::setobjectivestatusicons(undefined, undefined);
                level.teamflags[team] = undefined;
                setdynamicdvar(@"hash_6ce167f2cdc8ef7c", "vfx/iw8_mp/gamemode/vfx_snatch_ac130_clouds.vfx");
            }
            wait(1);
        }
    #/
}

// Namespace bigctf/namespace_43c384132c052883
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cb2
// Size: 0xc
function oncantuse(player) {
    
}

// Namespace bigctf/namespace_43c384132c052883
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2cc5
// Size: 0x8d
function player_delete_flag_goal_fx(flagteam) {
    if (flagteam == self.team) {
        if (isdefined(self._flageffect[self.team])) {
            self._flageffect[self.team] delete();
        }
    } else if (isdefined(self._flageffect[getotherteam(self.team)[0]])) {
        self._flageffect[getotherteam(self.team)[0]] delete();
    }
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d59
// Size: 0x63d
function placeflag() {
    /#
        level endon("enemy_captured");
        while (1) {
            if (getdvar(@"hash_29d45d6822a1cf6d", "vfx/iw8_mp/gamemode/vfx_snatch_ac130_clouds.vfx") != "vfx/iw8_mp/gamemode/vfx_snatch_ac130_clouds.vfx") {
                var_3a8f577077353c70 = getdvar(@"hash_29d45d6822a1cf6d", "vfx/iw8_mp/gamemode/vfx_snatch_ac130_clouds.vfx");
                if (var_3a8f577077353c70 == "vfx_snatch_ac130_clouds") {
                    team = "vfx/iw8_br/gameplay/infil/vfx_br_infil_jump_smoke_01.vfx";
                } else {
                    team = "vfx_br_infil_omni_light";
                }
                if (team == "vfx/iw8_br/gameplay/infil/vfx_br_infil_jump_smoke_01.vfx") {
                    if (game["stealth_spotted"]) {
                        team = game["OBJECTIVES/CAPTURE_FLAG"];
                    } else {
                        team = game["gunship"];
                    }
                } else if (game["stealth_spotted"]) {
                    team = game["gunship"];
                } else {
                    team = game["OBJECTIVES/CAPTURE_FLAG"];
                }
                goal = undefined;
                goal = spawnstruct();
                goal dev_flag_find_ground();
                goal.origin = goal.ground_origin;
                goal.radius = 30;
                goal.team = team;
                trigger = spawn("pickup", goal.origin, 0, 30, 80);
                visuals[0] = spawn("waypoint_escort_flag", goal.origin);
                visuals[0] setmodel(level.flagmodel[team]);
                var_62e400453977eee = namespace_19b4203b51d56488::createcarryobject(team, trigger, visuals, (0, 0, 85));
                var_62e400453977eee namespace_19b4203b51d56488::setteamusetext("script_model", "ctf_flag_axis_CS");
                var_62e400453977eee namespace_19b4203b51d56488::setteamusetext("pickupTime", "locale_area_trigger");
                var_62e400453977eee namespace_19b4203b51d56488::allowcarry("script_model");
                var_62e400453977eee namespace_19b4203b51d56488::setvisibleteam("ui_ctf_flag_axis_return");
                var_62e400453977eee namespace_19b4203b51d56488::setobjectivestatusallicons(level.iconescort, level.iconkill, level.mlgiconfullflag);
                var_62e400453977eee.objidpingfriendly = 1;
                var_62e400453977eee.allowweapons = 1;
                var_62e400453977eee.onpickup = &onpickup;
                var_62e400453977eee.onpickupfailed = &onpickupfailed;
                var_62e400453977eee.ondrop = &ondrop;
                var_62e400453977eee.onreset = &onreset;
                var_62e400453977eee.oldradius = trigger.radius;
                var_62e400453977eee.origin = goal.origin;
                var_62e400453977eee.label = team;
                var_62e400453977eee.var_8e9c043fff68afdb = [];
                tracestart = trigger.origin + (0, 0, 32);
                traceend = trigger.origin + (0, 0, -32);
                contentoverride = namespace_2a184fc4902783dc::create_contents(1, 1, 1, 1, 0, 1, 1);
                ignoreents = [];
                trace = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, ignoreents, contentoverride);
                var_62e400453977eee.baseeffectpos = trace["mount128"];
                upangles = vectortoangles(trace["mantle128"]);
                var_62e400453977eee.baseeffectforward = anglestoforward(upangles);
                level.teamflagbases[team] = createteamflagbase(team, var_62e400453977eee);
                if (team == "vfx/iw8_br/gameplay/infil/vfx_br_infil_jump_smoke_01.vfx") {
                    if (game["stealth_spotted"]) {
                        level.teamflags[game["OBJECTIVES/CAPTURE_FLAG"]] = var_62e400453977eee;
                    } else {
                        level.teamflags[game["gunship"]] = var_62e400453977eee;
                    }
                } else if (game["stealth_spotted"]) {
                    level.teamflags[game["gunship"]] = var_62e400453977eee;
                } else {
                    level.teamflags[game["OBJECTIVES/CAPTURE_FLAG"]] = var_62e400453977eee;
                }
                visuals = [];
                trigger = spawn("pickup", goal.origin - (0, 0, goal.radius / 2), 0, goal.radius, 80);
                trigger.no_moving_platfrom_unlink = 1;
                trigger.linktoenabledflag = 1;
                trigger.baseorigin = trigger.origin;
                var_e1c2bb288fc23e0d = namespace_19b4203b51d56488::createuseobject(team, trigger, visuals, (0, 0, 115));
                var_e1c2bb288fc23e0d namespace_19b4203b51d56488::allowuse("pickupTime");
                var_e1c2bb288fc23e0d namespace_19b4203b51d56488::setvisibleteam("gw_fob_01");
                var_e1c2bb288fc23e0d namespace_19b4203b51d56488::setobjectivestatusallicons(level.icondefendflag, level.iconcaptureflag, level.mlgiconfullflag);
                var_e1c2bb288fc23e0d namespace_19b4203b51d56488::setusetime(0);
                var_e1c2bb288fc23e0d namespace_19b4203b51d56488::setkeyobject(level.teamflags[getotherteam(team)[0]]);
                level.capzones[getotherteam(team)[0]] namespace_19b4203b51d56488::setkeyobject(var_62e400453977eee);
                var_e1c2bb288fc23e0d.onuse = &onuse;
                var_e1c2bb288fc23e0d.oncantuse = &oncantuse;
                tracestart = trigger.origin + (0, 0, 32);
                traceend = trigger.origin + (0, 0, -32);
                contentoverride = namespace_2a184fc4902783dc::create_contents(1, 1, 1, 1, 0, 1, 1);
                ignoreents = [];
                trace = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, ignoreents, contentoverride);
                upangles = vectortoangles(trace["mantle128"]);
                forward = anglestoforward(upangles);
                right = anglestoright(upangles);
                if (team == "vfx/iw8_br/gameplay/infil/vfx_br_infil_jump_smoke_01.vfx") {
                    if (game["stealth_spotted"]) {
                        level.capzones[game["OBJECTIVES/CAPTURE_FLAG"]] = var_e1c2bb288fc23e0d;
                    } else {
                        level.capzones[game["gunship"]] = var_e1c2bb288fc23e0d;
                    }
                } else if (game["stealth_spotted"]) {
                    level.capzones[game["gunship"]] = var_e1c2bb288fc23e0d;
                } else {
                    level.capzones[game["OBJECTIVES/CAPTURE_FLAG"]] = var_e1c2bb288fc23e0d;
                }
                setdynamicdvar(@"hash_29d45d6822a1cf6d", "vfx/iw8_mp/gamemode/vfx_snatch_ac130_clouds.vfx");
            }
            wait(1);
        }
    #/
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x339d
// Size: 0x8c
function function_788c913d9aafbc7a() {
    self endon("picked_up");
    self endon("reset");
    level endon("disconnect");
    while (1) {
        waitframe();
        if (self.curprogress > 0 && self.numtouching[self.ownerteam] == 0 && !istrue(self.stalemate)) {
            progress = self.curprogress / 1000;
            progress = progress / level.returntime;
            namespace_5a22b6f3a56f7e9b::objective_set_progress(self.objidnum, progress);
        }
    }
}

// Namespace bigctf/namespace_43c384132c052883
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3430
// Size: 0x37c
function ondrop(player) {
    if (isdefined(player.leaving_team)) {
        self.droppedteam = player.leaving_team;
        player.leaving_team = undefined;
    } else if (!isdefined(player)) {
        self.droppedteam = self.originalownerteam;
    } else {
        self.droppedteam = player.team;
    }
    if (isdefined(player)) {
        player updatematchstatushintonnoflag();
    }
    namespace_19b4203b51d56488::setownerteam(getotherteam(self.droppedteam)[0]);
    team = self.droppedteam;
    otherteam = getotherteam(self.droppedteam)[0];
    self.cancontestclaim = 1;
    namespace_19b4203b51d56488::allowcarry("any");
    namespace_19b4203b51d56488::setvisibleteam("any");
    objective_state(self.pingobjidnum, "done");
    if (level.returntime >= 0) {
        namespace_19b4203b51d56488::setobjectivestatusallicons(level.iconreturnflag, level.iconcaptureflag, level.mlgiconfullflag);
    } else {
        namespace_19b4203b51d56488::setobjectivestatusallicons(level.icondefendflag, level.iconcaptureflag, level.mlgiconfullflag);
        namespace_5a22b6f3a56f7e9b::objective_hide_for_mlg_spectator(self.objidnum, 1);
    }
    if (self.originalownerteam == "allies") {
        setomnvar("ui_ctf_flag_axis", -1);
    } else {
        setomnvar("ui_ctf_flag_allies", -1);
    }
    if (isdefined(player)) {
        player setclientomnvar("ui_flag_player_hud_icon", 0);
    }
    var_86929bfc3b565860 = self.visuals[0] gettagorigin("tag_origin");
    if (isdefined(player)) {
        if (!isreallyalive(player)) {
            player.carryobject.var_8e9c043fff68afdb = [];
        }
        if (isdefined(player.carryflag)) {
            player detachflag();
        }
        player playsoundtoteam("uin_mp_flag_enemy_returned", otherteam, undefined, player);
        if (level.codcasterenabled) {
            player setgametypevip(0);
        }
    } else {
        namespace_a34451ae3d453e::playsoundonplayers("uin_mp_flag_enemy_returned", otherteam);
    }
    namespace_19b4203b51d56488::setteamusetime("friendly", level.returntime);
    namespace_19b4203b51d56488::setteamusetime("enemy", level.pickuptime);
    namespace_944ddf7b8df1b0e3::leaderdialog("enemy_dropped", self.originalownerteam, "status");
    namespace_944ddf7b8df1b0e3::leaderdialog("ally_dropped", getotherteam(self.originalownerteam)[0], "status");
    thread function_788c913d9aafbc7a();
    if (isdefined(level.outofboundstriggers)) {
        foreach (trigger in level.outofboundstriggers) {
            if (isdefined(trigger.script_noteworthy)) {
                if (trigger.script_noteworthy == "onlyVehOOB") {
                    break;
                }
            }
            if (ispointinvolume(player.origin, trigger)) {
                if (!is_equal(trigger.script_team, player.team)) {
                    break;
                }
                returnflag();
                return;
            }
        }
    }
    if (level.idleresettime > 0) {
        thread returnaftertime();
    }
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37b3
// Size: 0x124
function onreset() {
    self notify("manual_drop_cleanup");
    self notify("dropped");
    if (isdefined(self.droppedteam)) {
        namespace_19b4203b51d56488::setownerteam(self.droppedteam);
    }
    team = namespace_19b4203b51d56488::getownerteam();
    otherteam = getotherteam(team)[0];
    self.droppedteam = undefined;
    namespace_19b4203b51d56488::allowcarry("friendly");
    namespace_19b4203b51d56488::setvisibleteam("none");
    namespace_19b4203b51d56488::setobjectivestatusicons(level.iconescort, level.iconkill);
    if (self.originalownerteam == "allies") {
        setomnvar("ui_ctf_flag_axis", -2);
    } else {
        setomnvar("ui_ctf_flag_allies", -2);
    }
    level.capzones[otherteam] namespace_19b4203b51d56488::allowuse("friendly");
    level.capzones[otherteam] namespace_19b4203b51d56488::setvisibleteam("any");
    level.capzones[otherteam] namespace_19b4203b51d56488::setobjectivestatusallicons(level.icondefendflag, level.iconcaptureflag, level.mlgiconfullflag);
    self.var_8e9c043fff68afdb = [];
}

// Namespace bigctf/namespace_43c384132c052883
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x38de
// Size: 0x6a
function onbeginuse(player) {
    team = player.pers["team"];
    if (team == namespace_19b4203b51d56488::getownerteam()) {
        self.trigger.radius = 1024;
    } else {
        self.trigger.radius = self.oldradius;
    }
}

// Namespace bigctf/namespace_43c384132c052883
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x394f
// Size: 0x39
function onenduse(player, team, success) {
    self.trigger.radius = self.oldradius;
}

// Namespace bigctf/namespace_43c384132c052883
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x398f
// Size: 0x637
function onpickup(player, var_5760e0f038d1baa3, defused) {
    self notify("picked_up");
    player notify("obj_picked_up");
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    if (isdefined(self.droppedteam)) {
        if (self.droppedteam == player.team) {
            namespace_19b4203b51d56488::setownerteam(self.droppedteam);
            ownerteam = self.droppedteam;
        } else {
            namespace_19b4203b51d56488::setownerteam(getotherteam(player.team)[0]);
            ownerteam = self.droppedteam;
        }
        self.droppedteam = undefined;
    }
    self.var_856484af8370f6a1 = undefined;
    team = player.pers["team"];
    if (team == "allies") {
        otherteam = "axis";
    } else {
        otherteam = "allies";
    }
    if (self.originalownerteam != "axis") {
        setomnvar("ui_ctf_flag_axis_return", 0);
    } else {
        setomnvar("ui_ctf_flag_allies_return", 0);
    }
    if (team != ownerteam) {
        thread teamplayercardsplash("callout_flagreturn", player);
        if (isdefined(level.closecapturekiller[player.team]) && level.closecapturekiller[player.team] == player) {
            player thread namespace_48a08c5037514e04::doscoreevent(#"hash_fe8ba8ad4e2e427b");
        }
        level.closecapturekiller[player.team] = undefined;
        player thread doscoreevent(#"flag_return");
        if (level.codcasterenabled) {
            level.capzones[player.team] namespace_19b4203b51d56488::resetmlgobjectivestatusicon();
        }
        thread returnflag();
        self.var_856484af8370f6a1 = 1;
        var_7e2c53b0bcf117d9 = spawnstruct();
        var_7e2c53b0bcf117d9.player = player;
        var_7e2c53b0bcf117d9.eventname = "obj_return";
        var_7e2c53b0bcf117d9.position = player.origin;
        player playsoundtoteam("uin_mp_flag_ally_returned", team);
        player playsoundtoteam("uin_mp_flag_enemy_returned", getotherteam(team)[0]);
        namespace_944ddf7b8df1b0e3::leaderdialog("enemy_returned", otherteam, "status");
        namespace_944ddf7b8df1b0e3::leaderdialog("ally_returned", team, "status");
        namespace_f5675568ccc8acc6::function_7d42d3f8dd68280c(18, player.team, player getentitynumber());
        player incpersstat("returns", 1);
        player namespace_b919c4be206d3c80::function_48544e365f4f5648(15, 1);
        player namespace_2685ec368e022695::statsetchild("round", "returns", player.pers["returns"]);
        if (isplayer(player)) {
            player setextrascore1(player.pers["returns"]);
        }
        if (self.originalownerteam == "allies") {
            setomnvar("ui_ctf_flag_axis", -2);
        } else {
            setomnvar("ui_ctf_flag_allies", -2);
        }
    } else {
        if (isdefined(level.ctf_loadouts) && isdefined(level.ctf_loadouts[team])) {
            player thread applyflagcarrierclass();
        } else {
            player attachflag();
        }
        player incpersstat("pickups", 1);
        level.closecapturekiller[otherteam] = undefined;
        namespace_5a22b6f3a56f7e9b::objective_show_progress(self.objidnum, 0);
        self.teamprogress[self.claimteam] = 0;
        self.curprogress = 0;
        if (self.originalownerteam == "allies") {
            setomnvar("ui_ctf_flag_axis", player getentitynumber());
        } else {
            setomnvar("ui_ctf_flag_allies", player getentitynumber());
        }
        player setclientomnvar("ui_flag_player_hud_icon", 1);
        if (isdefined(level.showenemycarrier)) {
            if (level.showenemycarrier == 0) {
                namespace_19b4203b51d56488::setvisibleteam("none");
            } else {
                namespace_19b4203b51d56488::setvisibleteam("friendly");
                objective_state(self.pingobjidnum, "current");
                namespace_19b4203b51d56488::updatecompassicon("enemy", self.pingobjidnum);
                objective_icon(self.pingobjidnum, "icon_waypoint_flag_carry");
                namespace_5a22b6f3a56f7e9b::objective_hide_for_mlg_spectator(self.pingobjidnum, 1);
            }
        }
        namespace_19b4203b51d56488::setobjectivestatusallicons(level.iconescort, level.iconkill, level.mlgiconfullflag);
        if (getdvarint(@"hash_83fcaa8032225364", 1) == 0) {
            level.capzones[otherteam] namespace_19b4203b51d56488::allowuse("none");
        }
        level.capzones[otherteam] namespace_19b4203b51d56488::setvisibleteam("any");
        level.capzones[otherteam] namespace_19b4203b51d56488::setobjectivestatusallicons(level.var_94475b5b42eba645, level.var_903bc4863fef659, level.mlgiconfullflag);
        player playsoundtoteam("uin_mp_flag_ally_pickup", team);
        player playsoundtoteam("uin_mp_flag_enemy_pickup", getotherteam(team)[0]);
        namespace_944ddf7b8df1b0e3::leaderdialog("enemy_taken", team);
        namespace_944ddf7b8df1b0e3::leaderdialog("ally_taken", otherteam);
        thread teamplayercardsplash("callout_flagpickup", player);
        if (!isdefined(self.var_8e9c043fff68afdb)) {
            self.var_8e9c043fff68afdb = [];
        }
        if (!isdefined(self.var_8e9c043fff68afdb[player.name]) || self.var_8e9c043fff68afdb[player.name] <= gettime()) {
            player thread doscoreevent(#"flag_grab");
            self.var_8e9c043fff68afdb[player.name] = gettime() + 10000;
        }
        var_7e2c53b0bcf117d9 = spawnstruct();
        var_7e2c53b0bcf117d9.player = player;
        var_7e2c53b0bcf117d9.eventname = "pickup";
        var_7e2c53b0bcf117d9.position = player.origin;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_on_game_event", var_7e2c53b0bcf117d9);
        if (level.codcasterenabled) {
            player setgametypevip(1);
        }
    }
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fcd
// Size: 0xda
function applyflagcarrierclass() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    if (isdefined(self.iscarrying) && self.iscarrying == 1) {
        self notify("force_cancel_placement");
        waitframe();
    }
    while (self ismantling()) {
        waitframe();
    }
    while (!self isonground()) {
        waitframe();
    }
    self.pers["gamemodeLoadout"] = level.ctf_loadouts[self.team];
    namespace_add8ab90fc53d7f7::spawnpoint_setspawnpoint(self.origin, self.angles);
    self.gamemode_chosenclass = self.class;
    namespace_d19129e4fa5d176::function_a16868d4dcd81a4b();
    self notify("faux_spawn");
    self.gameobject_fauxspawn = 1;
    self.faux_spawn_stance = self getstance();
    thread namespace_99ac021a7547cae3::spawnplayer(1);
    thread waitattachflag();
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40ae
// Size: 0xb9
function returnaftertime() {
    self endon("picked_up");
    team = namespace_19b4203b51d56488::getownerteam();
    otherteam = getotherteam(team)[0];
    var_8e53d4ca3de8531a = 0;
    while (var_8e53d4ca3de8531a < level.idleresettime) {
        waitframe();
        if (self.claimteam == "none") {
            var_8e53d4ca3de8531a = var_8e53d4ca3de8531a + level.framedurationseconds;
            progress = var_8e53d4ca3de8531a / level.idleresettime;
            if (var_8e53d4ca3de8531a >= level.idleresettime) {
                progress = 1;
            }
        }
    }
    namespace_a34451ae3d453e::playsoundonplayers("uin_mp_flag_ally_returned", team);
    namespace_a34451ae3d453e::playsoundonplayers("uin_mp_flag_enemy_returned", otherteam);
    returnflag();
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x416e
// Size: 0x9d
function returnflag() {
    self notify("returned_already");
    self endon("returned_already");
    if (self.originalownerteam != "axis") {
        setomnvar("ui_ctf_flag_axis_return", 0);
    } else {
        setomnvar("ui_ctf_flag_allies_return", 0);
    }
    self.teamprogress[self.claimteam] = 0;
    self.curprogress = 0;
    self.cancontestclaim = 0;
    namespace_19b4203b51d56488::setteamusetime("friendly", level.pickuptime);
    namespace_19b4203b51d56488::setteamusetime("enemy", level.returntime);
    namespace_19b4203b51d56488::returnhome();
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4212
// Size: 0x20
function waitattachflag() {
    level endon("game_ende");
    self endon("death_or_disconnect");
    self waittill("spawned_player");
    attachflag();
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4239
// Size: 0x59
function attachflag() {
    updatematchstatushintonhasflag();
    otherteam = getotherteam(self.pers["team"])[0];
    self attach(level.carryflag[otherteam], "tag_stowed_back3", 1);
    self.carryflag = level.carryflag[otherteam];
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4299
// Size: 0xf
function updatematchstatushintonnoflag() {
    namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("flag_capture");
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42af
// Size: 0xf
function updatematchstatushintonhasflag() {
    namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("flag_return");
}

// Namespace bigctf/namespace_43c384132c052883
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42c5
// Size: 0xc
function onpickupfailed(player) {
    
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x42d9
// Size: 0xc5
function dev_flag_find_ground() {
    tracestart = level.players[0].origin + (0, 0, 32);
    traceend = level.players[0].origin + (0, 0, -1000);
    contentoverride = namespace_2a184fc4902783dc::create_contents(1, 1, 1, 1, 0, 1, 1);
    ignoreents = [];
    trace = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, ignoreents, contentoverride);
    self.ground_origin = trace["position"];
    return trace["fraction"] != 0 && trace["fraction"] != 1;
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43a6
// Size: 0x1ea
function createflagsandhud() {
    level.flagmodel["allies"] = "ctf_game_flag_west";
    level.flagbase["allies"] = "ctf_game_flag_base";
    level.carryflag["allies"] = "prop_ctf_game_flag_west";
    level.flagmodel["axis"] = "ctf_game_flag_east";
    level.flagbase["axis"] = "ctf_game_flag_base";
    level.carryflag["axis"] = "prop_ctf_game_flag_east";
    level.closecapturekiller = [];
    level.closecapturekiller["allies"] = undefined;
    level.closecapturekiller["axis"] = undefined;
    level.iconescort = "waypoint_escort_flag";
    level.iconkill = "waypoint_ctf_kill";
    level.iconcaptureflag = "waypoint_take_flag";
    level.icondefendflag = "waypoint_defend_flag";
    level.iconreturnflag = "waypoint_recover_flag";
    level.var_94475b5b42eba645 = "waypoint_home_flag";
    level.var_903bc4863fef659 = "waypoint_enemy_home_flag";
    setupwaypointicons();
    level.teamflags[game["defenders"]] = createteamflag(game["defenders"], "axis");
    level.teamflags[game["attackers"]] = createteamflag(game["attackers"], "allies");
    level.capzones[game["defenders"]] = createcapzone(game["defenders"], "axis");
    level.capzones[game["attackers"]] = createcapzone(game["attackers"], "allies");
    namespace_5a22b6f3a56f7e9b::objective_show_for_mlg_spectator(level.capzones[game["defenders"]].objidnum, 1);
    namespace_5a22b6f3a56f7e9b::objective_show_for_mlg_spectator(level.capzones[game["attackers"]].objidnum, 1);
}

// Namespace bigctf/namespace_43c384132c052883
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4597
// Size: 0x77c
function createteamflag(team, entityteam) {
    var_da71d292931c16b = 0;
    trigger = getent("ctf_zone_" + entityteam, "targetname");
    if (!isdefined(trigger)) {
        var_b7ba378ae30bedb4 = flag_create_team_goal(team);
        trigger = spawn("trigger_radius", var_b7ba378ae30bedb4.origin - (0, 0, var_b7ba378ae30bedb4.radius / 2), 0, var_b7ba378ae30bedb4.radius, 65);
        trigger.targetname = "OutOfBounds";
        trigger.no_moving_platfrom_unlink = 1;
        trigger.linktoenabledflag = 1;
        trigger.baseorigin = trigger.origin;
        var_da71d292931c16b = 1;
        visuals[0] = spawn("script_model", var_b7ba378ae30bedb4.origin);
        visuals[0] setasgametypeobjective();
        visuals[0] setteaminhuddatafromteamname(entityteam);
    } else {
        visuals[0] = getent("ctf_flag_" + entityteam, "targetname");
    }
    if (!isdefined(visuals[0])) {
    }
    if (!var_da71d292931c16b) {
        radius = 15;
        if (level.pickuptime > 0 || level.returntime > 0) {
            radius = radius * 2;
        }
        var_25d213b4714288ce = spawn("trigger_radius", trigger.origin, 0, radius, trigger.height);
        trigger = var_25d213b4714288ce;
    }
    if (level.mapname == "mp_m_speedball") {
        trigger flag_find_ground();
        trigger.origin = trigger.ground_origin;
        visuals[0].origin = trigger.ground_origin - (0, 0, 0.5);
    }
    visuals[0] setmodel(level.flagmodel[team]);
    visuals[0] setasgametypeobjective();
    visuals[0] setteaminhuddatafromteamname(entityteam);
    var_4e86579dc7e39505 = getotherteam(team)[0];
    var_3bc2b88a59b6d062 = namespace_19b4203b51d56488::createcarryobject(var_4e86579dc7e39505, trigger, visuals, (0, 0, 85));
    var_3bc2b88a59b6d062 namespace_19b4203b51d56488::allowcarry("friendly");
    var_3bc2b88a59b6d062.ui_ctf_securing = 0;
    var_3bc2b88a59b6d062 namespace_19b4203b51d56488::setteamusetime("friendly", level.pickuptime);
    var_3bc2b88a59b6d062 namespace_19b4203b51d56488::setteamusetime("enemy", level.returntime);
    var_3bc2b88a59b6d062 namespace_19b4203b51d56488::setvisibleteam("none");
    var_3bc2b88a59b6d062 namespace_19b4203b51d56488::setobjectivestatusallicons(level.iconescort, level.iconkill, undefined);
    var_3bc2b88a59b6d062 namespace_5a22b6f3a56f7e9b::objective_set_play_intro(var_3bc2b88a59b6d062.objidnum, 0);
    var_3bc2b88a59b6d062 namespace_5a22b6f3a56f7e9b::objective_set_play_outro(var_3bc2b88a59b6d062.objidnum, 0);
    var_3bc2b88a59b6d062 namespace_19b4203b51d56488::registercarryobjectpickupcheck(&flagpickupchecks);
    var_3bc2b88a59b6d062.allowweapons = 1;
    var_3bc2b88a59b6d062.originalownerteam = var_4e86579dc7e39505;
    var_3bc2b88a59b6d062.onpickup = &onpickup;
    var_3bc2b88a59b6d062.onpickupfailed = &onpickupfailed;
    var_3bc2b88a59b6d062.ondrop = &ondrop;
    var_3bc2b88a59b6d062.onreset = &onreset;
    var_3bc2b88a59b6d062.pinobj = 1;
    var_3bc2b88a59b6d062.cancontestclaim = 0;
    var_3bc2b88a59b6d062.majoritycapprogress = 0;
    var_3bc2b88a59b6d062.alwaysstalemate = 1;
    if (var_3bc2b88a59b6d062.originalownerteam == "allies") {
        setomnvar("ui_ctf_flag_axis", -2);
    } else {
        setomnvar("ui_ctf_flag_allies", -2);
    }
    if (getdvarint(@"hash_5299a4635ae94475", 1) != 0) {
        var_3bc2b88a59b6d062 namespace_19b4203b51d56488::function_316d9da870e12a03([0:visuals[0]], trigger, 1, 80, 0);
    }
    if (isdefined(level.showenemycarrier)) {
        switch (level.showenemycarrier) {
        case 0:
            var_3bc2b88a59b6d062.objidpingfriendly = 1;
            var_3bc2b88a59b6d062.objidpingenemy = 0;
            var_3bc2b88a59b6d062.objpingdelay = 60;
            break;
        case 1:
            var_3bc2b88a59b6d062.objidpingfriendly = 0;
            var_3bc2b88a59b6d062.objidpingenemy = 0;
            var_3bc2b88a59b6d062.objpingdelay = 0.05;
            break;
        case 2:
            var_3bc2b88a59b6d062.objidpingfriendly = 1;
            var_3bc2b88a59b6d062.objidpingenemy = 0;
            var_3bc2b88a59b6d062.objpingdelay = 1;
            break;
        case 3:
            var_3bc2b88a59b6d062.objidpingfriendly = 1;
            var_3bc2b88a59b6d062.objidpingenemy = 0;
            var_3bc2b88a59b6d062.objpingdelay = 1.5;
            break;
        case 4:
            var_3bc2b88a59b6d062.objidpingfriendly = 1;
            var_3bc2b88a59b6d062.objidpingenemy = 0;
            var_3bc2b88a59b6d062.objpingdelay = 2;
            break;
        case 5:
            var_3bc2b88a59b6d062.objidpingfriendly = 1;
            var_3bc2b88a59b6d062.objidpingenemy = 0;
            var_3bc2b88a59b6d062.objpingdelay = 3;
            break;
        case 6:
            var_3bc2b88a59b6d062.objidpingfriendly = 1;
            var_3bc2b88a59b6d062.objidpingenemy = 0;
            var_3bc2b88a59b6d062.objpingdelay = 4;
            break;
        }
        var_220be32c83520117 = namespace_5a22b6f3a56f7e9b::requestobjectiveid(99);
        var_3bc2b88a59b6d062.pingobjidnum = var_220be32c83520117;
        namespace_5a22b6f3a56f7e9b::objective_add_objective(var_220be32c83520117, "done", var_3bc2b88a59b6d062.origin);
        namespace_5a22b6f3a56f7e9b::objective_set_play_intro(var_220be32c83520117, 0);
        namespace_5a22b6f3a56f7e9b::objective_set_play_outro(var_220be32c83520117, 0);
        var_3bc2b88a59b6d062 namespace_19b4203b51d56488::setvisibleteam("none", var_220be32c83520117);
        objective_setownerteam(var_220be32c83520117, team);
        var_3bc2b88a59b6d062 namespace_19b4203b51d56488::setobjectivestatusallicons(level.iconescort, level.iconkill, level.mlgiconfullflag, var_220be32c83520117);
    } else {
        var_3bc2b88a59b6d062.objidpingfriendly = 1;
        var_3bc2b88a59b6d062.objidpingenemy = 0;
        var_3bc2b88a59b6d062.objpingdelay = 3;
    }
    var_3bc2b88a59b6d062.oldradius = trigger.radius;
    tracestart = trigger.origin + (0, 0, 32);
    traceend = trigger.origin + (0, 0, -32);
    contentoverride = namespace_2a184fc4902783dc::create_contents(1, 1, 1, 1, 0, 1, 1);
    ignoreents = [];
    trace = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, ignoreents, contentoverride);
    var_3bc2b88a59b6d062.baseeffectpos = var_3bc2b88a59b6d062.visuals[0].origin;
    upangles = anglestoup(var_3bc2b88a59b6d062.visuals[0].angles);
    var_3bc2b88a59b6d062.baseeffectforward = anglestoforward(upangles);
    level.teamflagbases[team] = createteamflagbase(team, var_3bc2b88a59b6d062);
    return var_3bc2b88a59b6d062;
}

// Namespace bigctf/namespace_43c384132c052883
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d1b
// Size: 0x9b
function flagpickupchecks(player) {
    if (isdefined(level.outofboundstriggers)) {
        foreach (trigger in level.outofboundstriggers) {
            if (isdefined(trigger.script_team)) {
                return (!ispointinvolume(player.origin, trigger) && !player namespace_f8065cafc523dba5::isinvehicle());
            }
        }
    }
    return !player namespace_f8065cafc523dba5::isinvehicle();
}

// Namespace bigctf/namespace_43c384132c052883
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4dbe
// Size: 0xc2
function createteamflagbase(team, var_3bc2b88a59b6d062) {
    var_d9ca1813b9de5e20 = var_3bc2b88a59b6d062.visuals[0].origin;
    var_fd8b4c619f5e9ff = spawn("script_model", var_d9ca1813b9de5e20);
    var_fd8b4c619f5e9ff setmodel(level.flagbase[team]);
    var_fd8b4c619f5e9ff.ownerteam = team;
    var_fd8b4c619f5e9ff setasgametypeobjective();
    var_fd8b4c619f5e9ff setteaminhuddatafromteamname(team);
    var_fd8b4c619f5e9ff.baseeffectpos = var_d9ca1813b9de5e20;
    upangles = anglestoup(var_3bc2b88a59b6d062.visuals[0].angles);
    var_fd8b4c619f5e9ff.baseeffectforward = anglestoforward(upangles);
    return var_fd8b4c619f5e9ff;
}

// Namespace bigctf/namespace_43c384132c052883
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e88
// Size: 0x28d
function createcapzone(team, entityteam) {
    var_b7ba378ae30bedb4 = flag_create_team_goal(team);
    trigger = getent("ctf_zone_" + entityteam, "targetname");
    if (!isdefined(trigger)) {
        trigger = spawn("trigger_radius", var_b7ba378ae30bedb4.origin - (0, 0, var_b7ba378ae30bedb4.radius / 2), 0, var_b7ba378ae30bedb4.radius, 80);
        trigger.no_moving_platfrom_unlink = 1;
        trigger.linktoenabledflag = 1;
        trigger.baseorigin = trigger.origin;
        trigger.height = var_b7ba378ae30bedb4.radius;
    }
    var_25d213b4714288ce = spawn("trigger_radius", trigger.origin, 0, var_b7ba378ae30bedb4.radius, trigger.height);
    trigger = var_25d213b4714288ce;
    visuals = [];
    var_e1c2bb288fc23e0d = namespace_19b4203b51d56488::createuseobject(team, trigger, visuals, (0, 0, 85));
    var_e1c2bb288fc23e0d namespace_19b4203b51d56488::allowuse("friendly");
    var_e1c2bb288fc23e0d namespace_19b4203b51d56488::setvisibleteam("none");
    var_e1c2bb288fc23e0d thread function_a012c67b437c38bf();
    var_e1c2bb288fc23e0d namespace_19b4203b51d56488::setobjectivestatusallicons(level.icondefendflag, level.iconcaptureflag, level.mlgiconfullflag);
    var_e1c2bb288fc23e0d namespace_19b4203b51d56488::setusetime(0);
    var_e1c2bb288fc23e0d namespace_19b4203b51d56488::setkeyobject(level.teamflags[getotherteam(team)[0]]);
    var_e1c2bb288fc23e0d.onuse = &onuse;
    var_e1c2bb288fc23e0d.oncantuse = &oncantuse;
    tracestart = trigger.origin + (0, 0, 32);
    traceend = trigger.origin + (0, 0, -32);
    contentoverride = namespace_2a184fc4902783dc::create_contents(1, 1, 1, 1, 0, 1, 1);
    ignoreents = [];
    trace = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, ignoreents, contentoverride);
    upangles = vectortoangles(trace["normal"]);
    forward = anglestoforward(upangles);
    right = anglestoright(upangles);
    return var_e1c2bb288fc23e0d;
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x511d
// Size: 0x17
function function_a012c67b437c38bf() {
    level waittill("prematch_done");
    namespace_19b4203b51d56488::setvisibleteam("any");
}

// Namespace bigctf/namespace_43c384132c052883
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x513b
// Size: 0xb6
function flag_find_ground(z_offset) {
    tracestart = self.origin + (0, 0, 32);
    traceend = self.origin + (0, 0, -1000);
    contentoverride = namespace_2a184fc4902783dc::create_contents(1, 1, 1, 1, 0, 1, 1);
    ignoreents = [];
    trace = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, ignoreents, contentoverride);
    self.ground_origin = trace["position"];
    return trace["fraction"] != 0 && trace["fraction"] != 1;
}

// Namespace bigctf/namespace_43c384132c052883
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51f9
// Size: 0x40
function setteaminhuddatafromteamname(teamname) {
    if (teamname == "axis") {
        self setteaminhuddata(1);
    } else if (teamname == "allies") {
        self setteaminhuddata(2);
    } else {
        self setteaminhuddata(0);
    }
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5240
// Size: 0x181
function flag_default_origins() {
    level.default_goal_origins = [];
    level.flags = getentarray("flag_primary", "targetname");
    if (!isdefined(game["attackers"])) {
        game["attackers"] = "allies";
    }
    if (!isdefined(game["defenders"])) {
        game["defenders"] = "axis";
    }
    if (!isdefined(level.var_3e5f11ddb56644d6)) {
        var_a24fcd086e08d7b3 = getdvar(@"hash_99ad48d73b20dccd");
        if (!isdefined(var_a24fcd086e08d7b3)) {
            level.default_flag_origins[game["attackers"]] = namespace_36f464722d326bbe::getlocaleent(level.var_6121d66ffc5b8ec9["allies"]).origin;
        } else {
            level.default_flag_origins[game["attackers"]] = stringtovec3(var_a24fcd086e08d7b3);
        }
    } else {
        level.default_flag_origins[game["attackers"]] = level.var_3e5f11ddb56644d6;
    }
    if (!isdefined(level.var_d0ca59ac91e54957)) {
        var_f15d0e42732ef9ea = getdvar(@"hash_99ad48d73b20dccd");
        if (!isdefined(var_f15d0e42732ef9ea)) {
            level.default_flag_origins[game["defenders"]] = namespace_36f464722d326bbe::getlocaleent(level.var_6121d66ffc5b8ec9["axis"]).origin;
        } else {
            level.default_flag_origins[game["defenders"]] = stringtovec3(var_f15d0e42732ef9ea);
        }
    } else {
        level.default_flag_origins[game["defenders"]] = level.var_d0ca59ac91e54957;
    }
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x53c8
// Size: 0x9b
function function_60db244685153d79() {
    var_f7fa5ce20b84c0b7 = "ctf_flag_axis_CS";
    var_fe64d65adb1592cc = "ctf_flag_allies_CS";
    var_b70903bc2623a801 = getstructarray(var_f7fa5ce20b84c0b7, "script_noteworthy");
    var_3f7009b45a5f82be = getstructarray(var_fe64d65adb1592cc, "script_noteworthy");
    if (isdefined(var_b70903bc2623a801)) {
        level.var_d0ca59ac91e54957 = drop_to_ground(var_b70903bc2623a801[0].origin, 10, -100);
    }
    if (isdefined(var_3f7009b45a5f82be)) {
        level.var_3e5f11ddb56644d6 = drop_to_ground(var_3f7009b45a5f82be[0].origin, 10, -100);
    }
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x546a
// Size: 0x219
function updategametypedvars() {
    namespace_310ba947928891df::updatecommongametypedvars();
    level.pausescoring = dvarintvalue("pauseTime", 1, 0, 1);
    level.delayplayer = dvarintvalue("delayPlayer", 1, 0, 1);
    level.spawndelay = dvarfloatvalue("spawnDelay", 5, 0, 30);
    level.flagcapturetime = dvarfloatvalue("flagCaptureTime", 30, 0, 30);
    level.flagsrequiredtoscore = dvarintvalue("flagsRequiredToScore", 1, 1, 3);
    level.pointsperflag = dvarintvalue("pointsPerFlag", 1, 1, 300);
    level.flagneutralization = dvarintvalue("flagNeutralization", 0, 0, 1);
    level.precappoints = dvarintvalue("preCapPoints", 0, 0, 1);
    level.capturedecay = dvarintvalue("captureDecay", 1, 0, 1);
    level.capturetype = dvarintvalue("captureType", 1, 0, 3);
    level.numflagsscoreonkill = dvarintvalue("snumFlagsScoreOnKill", 0, 0, 3);
    level.objectivescaler = dvarfloatvalue("objScalar", 4, 1, 10);
    level.winrule = dvarintvalue("winRule", 0, 0, 1);
    level.showenemycarrier = dvarintvalue("showEnemyCarrier", 5, 0, 6);
    level.idleresettime = dvarfloatvalue("idleResetTime", 60, 0, 300);
    level.capturecondition = dvarintvalue("captureCondition", 0, 0, 1);
    level.pickuptime = dvarfloatvalue("pickupTime", 0, 0, 10);
    level.returntime = dvarfloatvalue("returnTime", 20, -1, 60);
    level.watchdvars[@"hash_f1e3320c1fdd7c60"].value = 1;
    namespace_cd0b2d039510b38d::setovertimelimitdvar(dvarfloatvalue("overTimeLimit", 300, 0, 1200));
    if (namespace_cd0b2d039510b38d::inovertime()) {
        level.scorelimit = 1;
    }
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x568a
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

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x59af
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

// Namespace bigctf/namespace_43c384132c052883
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5aeb
// Size: 0x14
function onjoinedteam(player) {
    player namespace_18dd16563a37da34::function_6ed651811c936a22();
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b06
// Size: 0xde
function debug_setupmatchdata() {
    level.var_6121d66ffc5b8ec9 = [];
    level.var_6121d66ffc5b8ec9["axis"] = "gw_fob_axisHQ";
    level.var_6121d66ffc5b8ec9["allies"] = "gw_fob_alliesHQ";
    level.startingfobnames_allies = [];
    level.startingfobnames_axis = [];
    level.startingfobnames_neutral = [0:"gw_fob_01", 1:"gw_fob_02", 2:"gw_fob_03", 3:"gw_fob_04", 4:"gw_fob_05", 5:"gw_fob_06", 6:"gw_fob_07", 7:"gw_fob_08", 8:"gw_fob_09"];
    level.defaultaxisspawn = "gw_fob_axishq";
    level.defaultaxisspawncamera = "gw_fob_axishq";
    level.defaultalliesspawn = "gw_fob_allieshq";
    level.defaultalliesspawncamera = "gw_fob_allieshq";
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5beb
// Size: 0x2b2
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
        string1 = "MP_INGAME_ONLY/OBJ_RECOVER_CAPS";
        namespace_d576b6dc7cef9c62::setwaypointiconinfo(level.iconkill, 2, "enemy", "MP_INGAME_ONLY/OBJ_KILL_CAPS", "icon_waypoint_flag_carry", 0, undefined);
        namespace_d576b6dc7cef9c62::setwaypointiconinfo(level.iconreturnflag, 2, "friendly", "MP_INGAME_ONLY/OBJ_RECOVER_CAPS", "icon_waypoint_flag_base_away", 0, 12);
        namespace_d576b6dc7cef9c62::setwaypointiconinfo(level.iconescort, 2, "friendly", "MP_INGAME_ONLY/OBJ_ESCORT_CAPS", "icon_waypoint_flag_carry", 0, 12);
        namespace_d576b6dc7cef9c62::setwaypointiconinfo(level.iconcaptureflag, 2, "enemy", "MP_INGAME_ONLY/OBJ_TAKE_CAPS", "icon_waypoint_flag_base", 0, 13);
        namespace_d576b6dc7cef9c62::setwaypointiconinfo(level.icondefendflag, 2, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_flag_base", 0, 13);
        namespace_d576b6dc7cef9c62::setwaypointiconinfo(level.var_94475b5b42eba645, 2, "friendly", "OBJECTIVES/FLAG_HOME", "icon_waypoint_flag_base_gone", 0, 13);
        namespace_d576b6dc7cef9c62::setwaypointiconinfo(level.var_903bc4863fef659, 2, "enemy", "OBJECTIVES/FLAG_AWAY", "icon_waypoint_flag_base_gone", 0, 13);
        namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_mlg_empty_flag", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "codcaster_icon_waypoint_ctf_empty", 0, undefined);
        namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_mlg_full_flag", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "codcaster_icon_waypoint_ctf_full", 0, undefined);
    }
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ea4
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

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5fa0
// Size: 0x20c
function setupobjectives() {
    level.gw_objstruct.startingfobs_allies = [];
    level.gw_objstruct.startingfobs_axis = [];
    var_f6ddbb71b889a0be = [0:"_a", 1:"_b", 2:"_c", 3:"_d", 4:"_e", 5:"_f", 6:"_g", 7:"_h", 8:"_i"];
    var_a9b909bac20ba503 = 0;
    foreach (var_d83e5fa8f6ce891f in level.startingfobnames_allies) {
        fob = spawnstruct();
        fob.name = var_d83e5fa8f6ce891f;
        fob.trigger = namespace_36f464722d326bbe::getlocaleent(var_d83e5fa8f6ce891f);
        fob.trigger.objkey = var_f6ddbb71b889a0be[var_a9b909bac20ba503];
        var_a9b909bac20ba503++;
        level.gw_objstruct.startingfobs_allies[level.gw_objstruct.startingfobs_allies.size] = fob;
    }
    foreach (var_d83e5fa8f6ce891f in level.startingfobnames_axis) {
        fob = spawnstruct();
        fob.name = var_d83e5fa8f6ce891f;
        fob.trigger = namespace_36f464722d326bbe::getlocaleent(var_d83e5fa8f6ce891f);
        fob.trigger.objkey = var_f6ddbb71b889a0be[var_a9b909bac20ba503];
        var_a9b909bac20ba503++;
        level.gw_objstruct.startingfobs_axis[level.gw_objstruct.startingfobs_axis.size] = fob;
    }
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x61b3
// Size: 0x214
function updatedomscores() {
    level endon("game_ended");
    teamscore = undefined;
    otherteamscore = undefined;
    level waittill("prematch_done");
    level thread namespace_8e28f8b325a83325::updatefobindanger();
    while (!level.gameended) {
        wait(10);
        namespace_e323c8674b44c8f4::waittillhostmigrationdone();
        domflags = getowneddomflags();
        if (!isdefined(level.scoretick)) {
            level.scoretick = [];
        }
        foreach (entry in level.teamnamelist) {
            level.scoretick[entry] = 0;
        }
        if (domflags.size) {
            for (i = 1; i < domflags.size; i++) {
                domflag = domflags[i];
                var_c2b268e253c97d27 = gettime() - domflag.capturetime;
                for (j = i - 1; j >= 0 && var_c2b268e253c97d27 > gettime() - domflags[j].capturetime; j--) {
                    domflags[j + 1] = domflags[j];
                }
                domflags[j + 1] = domflag;
            }
            foreach (domflag in domflags) {
                team = domflag namespace_19b4203b51d56488::getownerteam();
                /#
                    assert(isgameplayteam(team));
                #/
                teamscore = getteamscore(team);
                var_fee716687dd29378 = namespace_98b55913d2326ac8::getteamflagcount(team);
                if (var_fee716687dd29378 >= level.flagsrequiredtoscore) {
                    level.scoretick[team] = level.scoretick[team] + level.pointsperflag;
                }
            }
        }
        updatescores();
    }
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63ce
// Size: 0x162
function updatescores() {
    var_bc96f305d3d139cf = [];
    foreach (entry in level.teamnamelist) {
        var_882b7ad682ff97ce = game["teamScores"][entry] + level.scoretick[entry];
        if (var_882b7ad682ff97ce >= level.roundscorelimit) {
            var_bc96f305d3d139cf[var_bc96f305d3d139cf.size] = entry;
        }
    }
    if (var_bc96f305d3d139cf.size == 1) {
        level.scoretick[var_bc96f305d3d139cf[0]] = level.roundscorelimit - game["teamScores"][var_bc96f305d3d139cf[0]];
    }
    var_e80dc2f88d61c61c = namespace_e8a49b70d0769b66::calculatewinningteam();
    foreach (entry in level.teamnamelist) {
        if (level.scoretick[entry] > 0) {
            namespace_e8a49b70d0769b66::giveteamscoreforobjective(entry, level.scoretick[entry], 1, undefined, 1);
        }
    }
    var_3397acf8985dbd01 = namespace_e8a49b70d0769b66::calculatewinningteam();
    if (var_e80dc2f88d61c61c != var_3397acf8985dbd01) {
        namespace_e8a49b70d0769b66::playscorestatusdialog(var_3397acf8985dbd01, 1, var_e80dc2f88d61c61c);
    }
}

// Namespace bigctf/namespace_43c384132c052883
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6537
// Size: 0x59f
function runobjectives(var_aa030029a5b16ae5) {
    level.spawnareas = [];
    level.var_694388259afb589b = [];
    foreach (entry in level.teamnamelist) {
        level.spawnareas[entry] = [0:level.var_6121d66ffc5b8ec9[entry]];
        level.var_694388259afb589b[entry] = [0:level.var_6121d66ffc5b8ec9[entry]];
    }
    level.allfobs = [];
    if (istrue(level.useobjectives)) {
        foreach (fob in level.gw_objstruct.startingfobs_axis) {
            var_ddca7869b65236b6 = runobjflag(fob.trigger, "axis");
            level.allfobs[level.allfobs.size] = fob;
            level.spawnareas["axis"][level.spawnareas["axis"].size] = fob.name;
            level.var_694388259afb589b["axis"][level.var_694388259afb589b["axis"].size] = fob.name;
            level.var_694388259afb589b["allies"][level.var_694388259afb589b["allies"].size] = fob.name;
            if (isdefined(level.spawnselectionlocations[fob.name]["axis"].anchorentity)) {
                level.spawnselectionlocations[fob.name]["axis"].anchorentity.origin = fob.trigger.origin + (0, 0, 100);
            }
        }
        foreach (fob in level.gw_objstruct.startingfobs_allies) {
            var_ddca7869b65236b6 = runobjflag(fob.trigger, "allies");
            level.allfobs[level.allfobs.size] = fob;
            level.spawnareas["allies"][level.spawnareas["allies"].size] = fob.name;
            level.var_694388259afb589b["allies"][level.var_694388259afb589b["allies"].size] = fob.name;
            level.var_694388259afb589b["axis"][level.var_694388259afb589b["axis"].size] = fob.name;
            if (isdefined(level.spawnselectionlocations[fob.name]["allies"].anchorentity)) {
                level.spawnselectionlocations[fob.name]["allies"].anchorentity.origin = fob.trigger.origin + (0, 0, 100);
            }
        }
    }
    if (level.usespawnselection) {
        if (istrue(level.var_b307135dbcef5a38)) {
            namespace_8e28f8b325a83325::setspawnlocations(level.var_694388259afb589b["axis"], "axis");
            namespace_8e28f8b325a83325::setspawnlocations(level.var_694388259afb589b["allies"], "allies");
        } else {
            namespace_8e28f8b325a83325::setspawnlocations(level.spawnareas["axis"], "axis");
            namespace_8e28f8b325a83325::setspawnlocations(level.spawnareas["allies"], "allies");
        }
        sethqmarkerobjective();
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
    }
    level thread objective_manageobjectivesintrovisibility();
    hackfixcameras();
    level thread allowobjectiveuseaftermatchstart();
    level.var_aa5583d4cbbfd72e = 1;
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6add
// Size: 0x7d
function allowobjectiveuseaftermatchstart() {
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    foreach (fob in level.allfobs) {
        fob.trigger.gameobject namespace_19b4203b51d56488::allowuse("enemy");
    }
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b61
// Size: 0x2a1
function objective_manageobjectivesintrovisibility() {
    wait(1);
    namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(level.gw_objstruct.axishqloc.marker.objidnum);
    namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(level.gw_objstruct.allieshqloc.marker.objidnum);
    namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(level.gw_objstruct.axishqloc.enemymarker.objidnum);
    namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(level.gw_objstruct.allieshqloc.enemymarker.objidnum);
    foreach (fob in level.allfobs) {
        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(fob.trigger.gameobject.objidnum);
    }
    if (isdefined(level.rallypointvehicles)) {
        foreach (rallypoint in level.rallypointvehicles) {
            namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(rallypoint.marker.objidnum);
        }
    }
    while (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        waitframe();
    }
    foreach (fob in level.allfobs) {
        namespace_5a22b6f3a56f7e9b::objective_playermask_showtoall(fob.trigger.gameobject.objidnum);
    }
    if (isdefined(level.rallypointvehicles)) {
        foreach (rallypoint in level.rallypointvehicles) {
            if (isdefined(rallypoint)) {
                namespace_5a22b6f3a56f7e9b::objective_teammask_addtomask(rallypoint.marker.objidnum, rallypoint.team);
            }
        }
    }
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6e09
// Size: 0x1f3
function hackfixcameras() {
    if (istrue(level.usestaticspawnselectioncamera)) {
        return;
    }
    while (!istrue(level.var_1091b5d43ba7a905)) {
        waitframe();
    }
    team = "allies";
    forward = level.spawnselectionteamforward[team];
    keys = [0:"gw_fob_alliesHQ", 1:"gw_fob_01", 2:"gw_fob_02", 3:"gw_fob_03", 4:"gw_fob_04", 5:"gw_fob_05"];
    namespace_d7fe36703a9572fe::function_71a2a6a6f52ab30b(keys, team, forward, -8500, 7000);
    team = "axis";
    forward = level.spawnselectionteamforward[team];
    keys = [0:"gw_fob_axisHQ", 1:"gw_fob_01", 2:"gw_fob_02", 3:"gw_fob_03", 4:"gw_fob_04", 5:"gw_fob_05"];
    namespace_d7fe36703a9572fe::function_71a2a6a6f52ab30b(keys, team, forward, -8500, 7000);
    level.spawncameras["default"]["allies"].origin = level.spawncameras["gw_fob_alliesHQ"]["allies"].origin;
    level.spawncameras["default"]["allies"].angles = level.spawncameras["gw_fob_alliesHQ"]["allies"].angles;
    level.spawncameras["default"]["axis"].origin = level.spawncameras["gw_fob_axisHQ"]["axis"].origin;
    level.spawncameras["default"]["axis"].angles = level.spawncameras["gw_fob_axisHQ"]["axis"].angles;
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7003
// Size: 0x2dc
function updatefobspawnselection() {
    level.spawnareas = [];
    foreach (entry in level.teamnamelist) {
        level.spawnareas[entry] = [0:level.var_6121d66ffc5b8ec9[entry]];
    }
    foreach (fob in level.allfobs) {
        gameobject = fob.trigger.gameobject;
        if (gameobject.ownerteam == "axis") {
            level.spawnareas["axis"][level.spawnareas["axis"].size] = fob.name;
            if (isdefined(level.spawnselectionlocations[fob.name]["axis"].anchorentity)) {
                level.spawnselectionlocations[fob.name]["axis"].anchorentity.origin = fob.trigger.origin + (0, 0, 100);
            }
        } else if (gameobject.ownerteam == "allies") {
            level.spawnareas["allies"][level.spawnareas["allies"].size] = fob.name;
            if (isdefined(level.spawnselectionlocations[fob.name]["allies"].anchorentity)) {
                level.spawnselectionlocations[fob.name]["allies"].anchorentity.origin = fob.trigger.origin + (0, 0, 100);
            }
        }
    }
    if (istrue(level.var_b307135dbcef5a38)) {
        namespace_8e28f8b325a83325::setspawnlocations(level.var_694388259afb589b["axis"], "axis");
        namespace_8e28f8b325a83325::setspawnlocations(level.var_694388259afb589b["allies"], "allies");
    } else {
        namespace_8e28f8b325a83325::setspawnlocations(level.spawnareas["axis"], "axis");
        namespace_8e28f8b325a83325::setspawnlocations(level.spawnareas["allies"], "allies");
    }
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72e6
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

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x77ea
// Size: 0x29
function objective_oncontested() {
    namespace_98b55913d2326ac8::dompoint_oncontested();
    if (!istrue(self.updatedoncontestedspawnselection)) {
        updatefobspawnselection();
        self.updatedoncontestedspawnselection = 1;
    }
}

// Namespace bigctf/namespace_43c384132c052883
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x781a
// Size: 0x32
function objective_onuncontested(lastclaimteam) {
    namespace_98b55913d2326ac8::dompoint_onuncontested(lastclaimteam);
    if (istrue(self.updatedoncontestedspawnselection)) {
        updatefobspawnselection();
        self.updatedoncontestedspawnselection = 0;
    }
}

// Namespace bigctf/namespace_43c384132c052883
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7853
// Size: 0x1b
function objective_onusebegin(player) {
    namespace_98b55913d2326ac8::dompoint_onusebegin(player);
    updatefobspawnselection();
}

// Namespace bigctf/namespace_43c384132c052883
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x7875
// Size: 0x2d
function objective_onuseend(team, player, success) {
    namespace_98b55913d2326ac8::dompoint_onuseend(team, player, success);
    updatefobspawnselection();
}

// Namespace bigctf/namespace_43c384132c052883
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x78a9
// Size: 0x9c
function objective_onuse(var_82236c155ecbedc9) {
    namespace_98b55913d2326ac8::dompoint_onuse(var_82236c155ecbedc9);
    updatefobspawnselection();
    if (istrue(level.var_eaa760f325371803)) {
        level thread function_a30a48f0c1a403ec(self.objectivekey, self.ownerteam);
    }
    otherteam = getotherteam(var_82236c155ecbedc9.team)[0];
    function_666a2979def5d705(otherteam, self.objectivekey);
    function_8d03978a31faba3a(self.objectivekey, otherteam);
    function_e8a6e840ef663c81(self.objectivekey, self.ownerteam);
}

// Namespace bigctf/namespace_43c384132c052883
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x794c
// Size: 0x1b
function objective_onpinnedstate(player) {
    updatefobspawnselection();
    namespace_98b55913d2326ac8::dompoint_onunpinnedstate(player);
}

// Namespace bigctf/namespace_43c384132c052883
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x796e
// Size: 0x1b
function objective_onunpinnedstate(player) {
    updatefobspawnselection();
    namespace_98b55913d2326ac8::dompoint_onunpinnedstate(player);
}

// Namespace bigctf/namespace_43c384132c052883
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7990
// Size: 0xdb
function runobjflag(objective, startingteam) {
    level endon("game_ended");
    while (!isdefined(level.spawnselectionlocations)) {
        waitframe();
    }
    objective.script_label = objective.objkey;
    domflag = namespace_98b55913d2326ac8::setupobjective(objective, undefined, undefined, undefined, 0);
    domflag.origin = objective.origin;
    domflag namespace_19b4203b51d56488::allowuse("none");
    domflag.didstatusnotify = 0;
    domflag namespace_19b4203b51d56488::setownerteam(startingteam);
    visibility = "any";
    if (startingteam != "neutral") {
        if (level.hideenemyfobs) {
            visibility = "friendly";
        }
        domflag.capturetime = gettime();
    }
    domflag namespace_19b4203b51d56488::setvisibleteam(visibility);
    return domflag;
}

// Namespace bigctf/namespace_43c384132c052883
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x7a73
// Size: 0x47
function dropcrate(killstreakname, droplocation, team) {
    crate = namespace_6c578d6ef48f10ef::droparmcratefromscriptedheli(team, killstreakname, droplocation.origin, (0, randomint(360), 0), undefined);
    return crate;
}

// Namespace bigctf/namespace_43c384132c052883
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ac2
// Size: 0x133
function docratedropsmoke(crate, droplocation, duration) {
    var_e0d03a39e88dff15 = droplocation.origin + (0, 0, 2000);
    spawnpos = groundpos(var_e0d03a39e88dff15, (0, 0, 1));
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

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7bfc
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

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d6e
// Size: 0x15
function debug_testcratedroplocationpicker() {
    while (1) {
        choosecratelocation();
        wait(1);
    }
}

// Namespace bigctf/namespace_43c384132c052883
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7d8a
// Size: 0x40
function checkkillstreakcratedrop(team) {
    if (game["teamScores"][team] >= level.nextkillstreakgoal) {
        level.nextkillstreakgoal = level.nextkillstreakgoal + 100;
        dropkillstreakcrates(2);
    }
}

// Namespace bigctf/namespace_43c384132c052883
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7dd1
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

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e87
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

// Namespace bigctf/namespace_43c384132c052883
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8007
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

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8135
// Size: 0x108
function choosenukecratelocation() {
    var_308da8b1fed334ce = randomfloatrange(level.mapsafecorners[1][0], level.mapsafecorners[0][0]);
    var_308da9b1fed33701 = randomfloatrange(level.mapsafecorners[1][1], level.mapsafecorners[0][1]);
    var_92459ae9b006b9f7 = (var_308da8b1fed334ce, var_308da9b1fed33701, 100000);
    trace = ray_trace(var_92459ae9b006b9f7, var_92459ae9b006b9f7 - (0, 0, 100000));
    var_92459ae9b006b9f7 = trace["position"];
    var_794937a10118f0d9 = findclosestdroplocation(var_92459ae9b006b9f7);
    if (0) {
        thread drawsphere(var_92459ae9b006b9f7, 1000, 100, (1, 0, 0));
        thread drawsphere(var_794937a10118f0d9, 1000, 100, (0, 1, 0));
        thread drawline(var_92459ae9b006b9f7, var_794937a10118f0d9.origin, 3, (0, 1, 0));
    }
    return var_794937a10118f0d9;
}

// Namespace bigctf/namespace_43c384132c052883
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8245
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

// Namespace bigctf/namespace_43c384132c052883
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8492
// Size: 0x4a
function getkillstreak(tier) {
    if (!isdefined(level.killstreaktierlist)) {
        processkillstreaksintotiers();
    }
    level.killstreaktierlist[tier] = array_randomize(level.killstreaktierlist[tier]);
    return level.killstreaktierlist[tier][0];
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84e4
// Size: 0xa7
function processkillstreaksintotiers() {
    level.killstreaktierlist = [];
    level.killstreaktierlist[3] = [0:"cruise_predator", 1:"scrambler_drone_guard", 2:"uav"];
    level.killstreaktierlist[2] = [0:"precision_airstrike", 1:"multi_airstrike", 2:"bradley"];
    level.killstreaktierlist[1] = [0:"toma_strike", 1:"uav", 2:"pac_sentry", 3:"white_phosphorus"];
    level.killstreaktierlist[0] = [0:"uav"];
}

// Namespace bigctf/namespace_43c384132c052883
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8592
// Size: 0x52
function br_getrewardicon(streakname) {
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac[streakname];
    if (isdefined(bundle) && isdefined(bundle.hudicon)) {
        return bundle.hudicon;
    }
    return "";
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x85ec
// Size: 0x25
function nuke_mercyending_init() {
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    if (istrue(level.useobjectives)) {
        level thread nuke_mercyending_think();
    }
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8618
// Size: 0x6b
function nuke_mercyending_think() {
    level endon("game_ended");
    level endon("mercy_ending_timer_started");
    while (1) {
        if (calculateobjectivesheld("axis") == level.objectives.size) {
            level thread nuke_startmercycountdown("axis");
        } else if (calculateobjectivesheld("allies") == level.objectives.size) {
            level thread nuke_startmercycountdown("allies");
        }
        waitframe();
    }
}

// Namespace bigctf/namespace_43c384132c052883
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x868a
// Size: 0xfd
function nuke_startmercycountdown(team) {
    level notify("mercy_ending_timer_started");
    level endon("mercy_ending_triggered");
    setomnvar("ui_nuke_timer_type", 1);
    setomnvar("ui_arm_dominatingTeam", ter_op(team == "axis", 1, 2));
    setomnvar("ui_nuke_timer_time", level.mercymatchending_time);
    setomnvar("ui_nuke_countdown_active", 1);
    var_d984aaafbb3f49e0 = 0;
    starttime = gettime();
    endtime = level.mercymatchending_time * 1000 + starttime;
    setomnvar("ui_nuke_end_milliseconds", level.mercymatchending_time * 1000 + starttime);
    while (calculateobjectivesheld(team) == level.objectives.size) {
        waitframe();
        if (gettime() > endtime) {
            nuke_triggermercywin(team);
            level notify("mercy_ending_triggered");
        }
    }
    setomnvar("ui_nuke_countdown_active", 0);
    level thread nuke_mercyending_think();
}

// Namespace bigctf/namespace_43c384132c052883
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x878e
// Size: 0x1c9
function nuke_triggermercywin(team) {
    level endon("game_ended");
    level.mercywintriggered = 1;
    level.blocknukekills = 1;
    foreach (objective in level.objectives) {
        objective namespace_19b4203b51d56488::allowuse("none");
    }
    setomnvar("ui_nuke_countdown_active", 0);
    foreach (player in level.players) {
        if (isdefined(player) && !isbot(player) && istrue(player.inspawnselection)) {
            if (isdefined(player.operatorsfx)) {
                player clearsoundsubmix("iw8_mp_spawn_camera");
                player.operatorsfx stoploopsound(player.operatorsfxalias);
                player.operatorsfx delete();
                player.operatorsfx = undefined;
                player.operatorsfxalias = undefined;
            }
        }
    }
    if (isdefined(level.teamdata[team]["alivePlayers"][0])) {
        var_39e8f33513c716cd = level.teamdata[team]["alivePlayers"][0];
        var_39e8f33513c716cd namespace_670e1516d92a7a2b::tryusenuke("nuke_multi");
    } else {
        level thread namespace_d576b6dc7cef9c62::endgame(team, game["end_reason"]["mercy_win"], game["end_reason"]["mercy_loss"], 0, 1);
    }
}

// Namespace bigctf/namespace_43c384132c052883
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x895e
// Size: 0x88
function nukeselectgimmewatcher(killer) {
    if (!istrue(killer.hasnukeselectks)) {
        remainder = killer.killcountthislife % level.killstoearnnukeselect;
        if (remainder >= 0 && killer.killcountthislife >= level.killstoearnnukeselect) {
            killer.hasnukeselectks = 1;
            killer thread namespace_58a74e7d54b56e8d::givekillstreak("nuke_select_location", 0, killer);
            killer namespace_44abc05161e2e2cb::showkillstreaksplash("nuke_select_location", undefined, 1);
        }
    }
}

// Namespace bigctf/namespace_43c384132c052883
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x89ed
// Size: 0x213
function initspawns(var_4c3936c2c179fab3) {
    level.gamemodestartspawnpointnames = [];
    var_48501209a3e177a7 = "mp_gw_spawn_allies_start";
    var_ae7d0107ad485428 = "mp_gw_spawn_axis_start";
    level.gamemodestartspawnpointnames["allies"] = var_48501209a3e177a7;
    level.gamemodestartspawnpointnames["axis"] = var_ae7d0107ad485428;
    level.gamemodespawnpointnames = [];
    level.gamemodespawnpointnames["allies"] = "mp_tdm_spawn";
    level.gamemodespawnpointnames["axis"] = "mp_tdm_spawn";
    level.spawnmins = (0, 0, 0);
    level.spawnmaxs = (0, 0, 0);
    if (function_bff229a11ecd1e34()) {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic(#"default");
    } else {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic("GroundWar", "Crit_Default");
    }
    namespace_b2d5aa2baf2b5701::addstartspawnpoints(var_48501209a3e177a7);
    namespace_b2d5aa2baf2b5701::addstartspawnpoints(var_ae7d0107ad485428);
    namespace_b2d5aa2baf2b5701::addspawnpoints(game["attackers"], var_48501209a3e177a7);
    namespace_b2d5aa2baf2b5701::addspawnpoints(game["defenders"], var_ae7d0107ad485428);
    attackers = namespace_b2d5aa2baf2b5701::getspawnpointarray(var_48501209a3e177a7);
    defenders = namespace_b2d5aa2baf2b5701::getspawnpointarray(var_ae7d0107ad485428);
    namespace_b2d5aa2baf2b5701::registerspawnset("start_attackers", attackers);
    namespace_b2d5aa2baf2b5701::registerspawnset("start_defenders", defenders);
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
}

// Namespace bigctf/namespace_43c384132c052883
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c07
// Size: 0x33c
function onuse(player) {
    if (!level.gameended) {
        if (player namespace_f8065cafc523dba5::isinvehicle()) {
            return;
        }
        team = player.pers["team"];
        if (team == "allies") {
            otherteam = "axis";
        } else {
            otherteam = "allies";
        }
        player setclientomnvar("ui_flag_player_hud_icon", 0);
        namespace_f5675568ccc8acc6::function_7d42d3f8dd68280c(17, player.team, player getentitynumber());
        objective_state(level.teamflags[otherteam].pingobjidnum, "done");
        player updatematchstatushintonnoflag();
        thread teamplayercardsplash("callout_flagcapture", player);
        player thread namespace_62c556437da28f50::scoreeventpopup(#"flag_capture");
        player thread namespace_48a08c5037514e04::doscoreevent(#"hash_7b8c8a78ac292c0d");
        player notify("objective", "captured");
        var_7e2c53b0bcf117d9 = spawnstruct();
        var_7e2c53b0bcf117d9.player = player;
        var_7e2c53b0bcf117d9.eventname = "capture";
        var_7e2c53b0bcf117d9.position = player.origin;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_on_game_event", var_7e2c53b0bcf117d9);
        if (level.codcasterenabled) {
            player setgametypevip(0);
        }
        player incpersstat("captures", 1);
        player namespace_b919c4be206d3c80::function_48544e365f4f5648(15, 1);
        player namespace_2685ec368e022695::statsetchild("round", "captures", player.pers["captures"]);
        if (isplayer(player)) {
            player setextrascore0(player.pers["captures"]);
        }
        player playsoundtoteam("uin_mp_flag_ally_captured", team);
        player playsoundtoteam("uin_mp_flag_enemy_captured", otherteam);
        if (isdefined(player.carryflag)) {
            player detachflag();
        }
        if (isdefined(level.ctf_loadouts) && isdefined(level.ctf_loadouts[team])) {
            player thread removeflagcarrierclass();
        }
        level.closecapturekiller[team] = undefined;
        level.closecapturekiller[otherteam] = undefined;
        if (level.codcasterenabled) {
            level.capzones[otherteam] namespace_19b4203b51d56488::resetmlgobjectivestatusicon();
        }
        level.teamflags[otherteam] returnflag();
        level namespace_e8a49b70d0769b66::giveteamscoreforobjective(team, 1, 0);
        teamscore = int(game["teamScores"][team]);
        otherteamscore = int(game["teamScores"][otherteam]);
        if (teamscore == otherteamscore && teamscore == level.roundscorelimit - 1 && otherteamscore == level.roundscorelimit - 1) {
            namespace_944ddf7b8df1b0e3::leaderdialog("one_cap_tied", team, "status");
            namespace_944ddf7b8df1b0e3::leaderdialog("one_cap_tied", otherteam, "status");
        }
        if (teamscore == level.roundscorelimit - 1) {
            namespace_944ddf7b8df1b0e3::leaderdialog("enemy_one_cap_left", team, "status");
            namespace_944ddf7b8df1b0e3::leaderdialog("ally_one_cap_left", otherteam, "status");
        } else {
            namespace_944ddf7b8df1b0e3::leaderdialog("enemy_captured", team, "status");
            namespace_944ddf7b8df1b0e3::leaderdialog("ally_captured", otherteam, "status");
        }
    }
}

// Namespace bigctf/namespace_43c384132c052883
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8f4a
// Size: 0x100
function calculatespawndisttozones(spawnpoint) {
    spawnpoint.scriptdata.distsqtokothzones = [];
    foreach (zone in level.objectives) {
        dist = getpathdist(spawnpoint.origin, zone.origin, 5000);
        if (dist < 0) {
            dist = distance_2d_squared(spawnpoint.origin, zone.origin);
        } else {
            dist = dist * dist;
        }
        spawnpoint.scriptdata.distsqtokothzones[zone getentitynumber()] = dist;
        if (dist > zone.furthestspawndistsq) {
            zone.furthestspawndistsq = dist;
        }
    }
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9051
// Size: 0x116
function getspawnpoint() {
    spawnteam = self.pers["team"];
    if (namespace_b2d5aa2baf2b5701::shoulduseteamstartspawn()) {
        if (spawnteam == game["attackers"]) {
            namespace_b2d5aa2baf2b5701::activatespawnset("start_attackers", 1);
            spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, undefined, "start_attackers");
        } else {
            namespace_b2d5aa2baf2b5701::activatespawnset("start_defenders", 1);
            spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, undefined, "start_defenders");
        }
    } else {
        namespace_b2d5aa2baf2b5701::activatespawnset("normal", 1);
        spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, undefined, "fallback");
    }
    if (istrue(level.usesquadspawn) && istrue(self.squadspawnconfirmed)) {
        var_279bb6642ec5e695 = self getspectatingplayer();
        if (isdefined(var_279bb6642ec5e695) && isdefined(self.var_ff97225579de16a) && self.team == var_279bb6642ec5e695.team && self.var_ff97225579de16a == var_279bb6642ec5e695.var_ff97225579de16a) {
            spawnpoint = namespace_90f75d3fdf89a43e::findteammatebuddyspawn(var_279bb6642ec5e695);
        }
    }
    return spawnpoint;
}

// Namespace bigctf/namespace_43c384132c052883
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x916f
// Size: 0x3e
function onspawnplayer(var_9156b53bcf7ce573) {
    self.forcespawnnearteammates = undefined;
    thread updatematchstatushintonspawn();
    namespace_14f37777effc564d::function_6da8b65579348d0b();
    namespace_9bb409deb69fb31d::updatesquadomnvars(self.team, self.var_ff97225579de16a);
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x91b4
// Size: 0x32
function updatematchstatushintonspawn() {
    level endon("game_ended");
    if (isdefined(level.nukeprogress)) {
        namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("nuke_capture");
    } else {
        namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("dom_cap_defend");
    }
}

// Namespace bigctf/namespace_43c384132c052883
// Params a, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x91ed
// Size: 0x17a
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00) {
    namespace_9bb409deb69fb31d::updatesquadomnvars(self.team, self.var_ff97225579de16a);
    namespace_98b55913d2326ac8::awardgenericmedals(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00);
    if (level.dropbrloot) {
        dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
        dropstruct.var_dfba5a2c3c6f0a07 = 14;
        namespace_c6ccccd95254983f::playerdropplunderondeath(dropstruct, attacker, 1);
    }
    if (level.nukeselectactive && isplayer(attacker) && smeansofdeath != "MOD_SUICIDE") {
        if (!isdefined(attacker.killcountthislife)) {
            attacker.killcountthislife = 0;
        }
        if (!istrue(attacker.hasnukeselectks)) {
            attacker.killcountthislife++;
        }
        nukeselectgimmewatcher(attacker);
    }
    if (!isdefined(level.c130pathkilltracker) || level.c130movementmethod != 1) {
        return;
    }
    if (isdefined(self.carryflag)) {
        detachflag();
    }
    level.c130pathkilltracker[self.team] = level.c130pathkilltracker[self.team] + 1;
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x936e
// Size: 0x30
function detachflag() {
    if (!isdefined(self.carryflag)) {
        return;
    }
    self detach(self.carryflag, "tag_stowed_back3");
    self.carryflag = undefined;
}

// Namespace bigctf/namespace_43c384132c052883
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x93a5
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

// Namespace bigctf/namespace_43c384132c052883
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x95b5
// Size: 0x9c
function onplayerconnect(player) {
    player setextrascore0(0);
    if (isdefined(player.pers["captures"])) {
        player setextrascore0(player.pers["captures"]);
    }
    player setextrascore1(0);
    if (isdefined(player.pers["returns"])) {
        player setextrascore1(player.pers["returns"]);
    }
    if (isdefined(level.rallypointvehicles)) {
        thread namespace_fdd1a79841ab3fe7::rallypoint_showtoplayer(player);
    }
    namespace_f1d40c362677777e::registerondisconnecteventcallback(&onplayerdisconnect);
}

// Namespace bigctf/namespace_43c384132c052883
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9658
// Size: 0xc
function onplayerdisconnect(player) {
    
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x966b
// Size: 0x79
function updategamemodespawncamera() {
    var_1fd5d62338ab6de2 = "lane02_4";
    if (isdefined(level.activezone)) {
        var_1fd5d62338ab6de2 = level.activezone.zonetrigger.script_label;
    }
    namespace_d7fe36703a9572fe::setgamemodecamera("allies", level.spawncameras[var_1fd5d62338ab6de2]["allies"]);
    namespace_d7fe36703a9572fe::setgamemodecamera("axis", level.spawncameras[var_1fd5d62338ab6de2]["axis"]);
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x96eb
// Size: 0x11e
function debugdrawtocameras() {
    while (1) {
        wait(0.25);
        if (!isdefined(level.players[0])) {
            continue;
        }
        foreach (teamarray in level.spawncameras) {
            foreach (team, camera in teamarray) {
                thread drawangles(camera.origin, camera.angles, 0.25, 50);
                thread drawsphere(camera.origin, 50, 0.25, ter_op(team == "allies", (0, 0, 1), (1, 0, 0)));
            }
        }
    }
}

// Namespace bigctf/namespace_43c384132c052883
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9810
// Size: 0x1c
function onplayerspawned(player) {
    while (1) {
        player waittill("spawned");
    }
}

// Namespace bigctf/namespace_43c384132c052883
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9833
// Size: 0x7c
function getownerteamplayer(ownerteam) {
    var_a3010f9814a40c8d = undefined;
    foreach (player in level.players) {
        if (player.team == ownerteam) {
            var_a3010f9814a40c8d = player;
            break;
        }
    }
    return var_a3010f9814a40c8d;
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x98b7
// Size: 0xe
function getrespawndelay() {
    self.spawncameraskipthermal = 0;
    return undefined;
}

// Namespace bigctf/namespace_43c384132c052883
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x98cd
// Size: 0x41
function onnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    namespace_310ba947928891df::oncommonnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon);
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9915
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

// Namespace bigctf/namespace_43c384132c052883
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9a61
// Size: 0x47
function setteammapposition(var_ca2c833762e5466c, team, var_20c18491aeb9a905) {
    if (!isdefined(level.spectatorcameras[var_ca2c833762e5466c])) {
        level.spectatorcameras[var_ca2c833762e5466c] = [];
    }
    level.spectatorcameras[var_ca2c833762e5466c][team] = var_20c18491aeb9a905;
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9aaf
// Size: 0x16
function applythermal() {
    self visionsetthermalforplayer("proto_apache_flir_mp");
    self thermalvisionon();
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9acc
// Size: 0xa
function removethermal() {
    self thermalvisionoff();
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9add
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

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c19
// Size: 0x18
function dohalfwayflash() {
    wait(0.4);
    thread playslamzoomflash();
    applythermal();
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9c38
// Size: 0x20
function endspectatorview() {
    if (!isdefined(self.spectatorcament)) {
        return;
    }
    removethermal();
    thread runslamzoomonspawn();
}

// Namespace bigctf/namespace_43c384132c052883
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c5f
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

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d6a
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

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e5f
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

// Namespace bigctf/namespace_43c384132c052883
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9f3e
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

// Namespace bigctf/namespace_43c384132c052883
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa04f
// Size: 0x2f
function arm_playstatusdialogonplayer(var_cb3339ece72dbdeb) {
    soundalias = "dx_mpa_ustl_announcer_" + var_cb3339ece72dbdeb;
    soundalias = tolower(soundalias);
    arm_leaderdialogonplayer_internal(soundalias, var_cb3339ece72dbdeb);
}

// Namespace bigctf/namespace_43c384132c052883
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa085
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

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa125
// Size: 0x130
function arm_initoutofbounds() {
    level.outofboundstriggers = [];
    var_ccfdb06748d7f326 = getentarray("OutOfBounds", "targetname");
    foreach (trigger in var_ccfdb06748d7f326) {
        if (isdefined(namespace_36f464722d326bbe::getlocaleid()) && isdefined(trigger.script_noteworthy) && trigger.script_noteworthy == level.localeid && namespace_de5151d68164781a::modeusesgroundwarteamoobtriggers(trigger)) {
            level.outofboundstriggers[level.outofboundstriggers.size] = trigger;
        } else if (level.mapname == "mp_nogales_gw2" && ispointinvolume((20500, 31700, 2500), trigger) && distancesquared((14038, 35144, 4608), trigger.origin) < 100) {
            level.outofboundstriggers[level.outofboundstriggers.size] = trigger;
        } else {
            trigger delete();
        }
    }
}

// Namespace bigctf/namespace_43c384132c052883
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa25c
// Size: 0x1a
function debugprint(text) {
    if (0) {
        /#
            println(text);
        #/
    }
}

// Namespace bigctf/namespace_43c384132c052883
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa27d
// Size: 0x5f
function isobjectivecontested(gameobject) {
    if (gameobject.ownerteam == "axis") {
        return (gameobject.numtouching["allies"] > 0);
    } else if (gameobject.ownerteam == "allies") {
        return (gameobject.numtouching["axis"] > 0);
    }
}

// Namespace bigctf/namespace_43c384132c052883
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa2e3
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

// Namespace bigctf/namespace_43c384132c052883
// Params 12, eflags: 0x0
// Checksum 0x0, Offset: 0xa364
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

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa522
// Size: 0x41c
function function_9c513c5e546a4f52() {
    /#
        setdevdvar(@"hash_24d9f7f9324e9c61", 0);
        while (1) {
            if (getdvar(@"hash_24d9f7f9324e9c61") != "gw_fob_05") {
                if (isdefined(level.lane_1_obj_struct)) {
                    foreach (cluster in level.lane_1_obj_struct.var_e9526b7be4cb0d4c) {
                        foreach (objective in cluster.var_96e24b730d497b13) {
                            thread drawsphere(objective.origin, 20, 1, (1, 1, 1));
                        }
                    }
                }
                if (isdefined(level.lane_2_obj_struct)) {
                    foreach (cluster in level.lane_2_obj_struct.var_e9526b7be4cb0d4c) {
                        foreach (objective in cluster.var_96e24b730d497b13) {
                            thread drawsphere(objective.origin, 20, 1, (1, 1, 1));
                        }
                    }
                }
                if (isdefined(level.lane_3_obj_struct)) {
                    foreach (cluster in level.lane_3_obj_struct.var_e9526b7be4cb0d4c) {
                        foreach (objective in cluster.var_96e24b730d497b13) {
                            thread drawsphere(objective.origin, 20, 1, (1, 1, 1));
                        }
                    }
                }
                if (isdefined(level.var_173165a5a386d543["vfx_snatch_ac130_clouds"])) {
                    foreach (objective in level.var_173165a5a386d543["vfx_snatch_ac130_clouds"]) {
                        thread drawsphere(objective.origin, 20, 1, (1, 1, 1));
                    }
                }
                if (isdefined(level.var_173165a5a386d543["gw_fob_07"])) {
                    foreach (objective in level.var_173165a5a386d543["gw_fob_07"]) {
                        thread drawsphere(objective.origin, 20, 1, (1, 1, 1));
                    }
                }
                if (isdefined(level.var_173165a5a386d543["gw_fob_axishq"])) {
                    foreach (objective in level.var_173165a5a386d543["gw_fob_axishq"]) {
                        thread drawsphere(objective.origin, 20, 1, (1, 1, 1));
                    }
                }
            }
            wait(1);
        }
    #/
}

// Namespace bigctf/namespace_43c384132c052883
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa945
// Size: 0x690
function function_e3a2a0c2e544728e(var_a4ab3e1ca5d220c4) {
    /#
        if (var_a4ab3e1ca5d220c4 <= 5) {
            key = "_incoming" + var_a4ab3e1ca5d220c4;
            var_8a33e220c4aaa38b = level.spawnselectionlocations[key]["vfx_br_infil_omni_light"].spawnpoints;
            var_4c00998026fee890 = level.spawnselectionlocations[key]["vfx/iw8_br/gameplay/infil/vfx_br_infil_jump_smoke_01.vfx"].spawnpoints;
            foreach (spawnpos in var_8a33e220c4aaa38b) {
                thread drawsphere(spawnpos.origin, 30, 60, (1, 0, 0));
                var_96020725b7899b37 = anglestoforward(spawnpos.angles) * 30 + spawnpos.origin;
                thread drawline(spawnpos.origin, var_96020725b7899b37, 60, (0, 1, 0));
                thread drawline(spawnpos.origin, spawnpos.origin + (0, 0, 1000), 60, (1, 0, 0));
            }
            foreach (spawnpos in var_4c00998026fee890) {
                thread drawsphere(spawnpos.origin, 30, 60, (0, 0, 1));
                var_96020725b7899b37 = anglestoforward(spawnpos.angles) * 30 + spawnpos.origin;
                thread drawline(spawnpos.origin, var_96020725b7899b37, 60, (0, 1, 0));
                thread drawline(spawnpos.origin, spawnpos.origin + (0, 0, 1000), 60, (0, 0, 1));
            }
            var_5be8673a7e323433 = "_incoming" + var_a4ab3e1ca5d220c4 + "MP_INGAME_ONLY/OBJ_DEFEND_CAPS";
            var_eb7299174b67818d = undefined;
            var_fd81d96696f0490a = undefined;
            if (isdefined(level.spawnselectionlocations[var_5be8673a7e323433]) && isdefined(level.spawnselectionlocations[var_5be8673a7e323433]["vfx_br_infil_omni_light"])) {
                var_eb7299174b67818d = level.spawnselectionlocations[var_5be8673a7e323433]["vfx_br_infil_omni_light"].spawnpoints;
            }
            if (isdefined(level.spawnselectionlocations[var_5be8673a7e323433]) && isdefined(level.spawnselectionlocations[var_5be8673a7e323433]["vfx/iw8_br/gameplay/infil/vfx_br_infil_jump_smoke_01.vfx"])) {
                var_fd81d96696f0490a = level.spawnselectionlocations[var_5be8673a7e323433]["vfx/iw8_br/gameplay/infil/vfx_br_infil_jump_smoke_01.vfx"].spawnpoints;
            }
            if (!isdefined(var_eb7299174b67818d)) {
                var_eb7299174b67818d = var_8a33e220c4aaa38b;
            }
            if (!isdefined(var_fd81d96696f0490a)) {
                var_fd81d96696f0490a = var_4c00998026fee890;
            }
            foreach (spawnpos in var_eb7299174b67818d) {
                thread drawsphere(spawnpos.origin, 15, 60, (0.5, 0, 0));
                var_96020725b7899b37 = anglestoforward(spawnpos.angles) * 30 + spawnpos.origin;
                thread drawline(spawnpos.origin, var_96020725b7899b37, 60, (0, 1, 0));
                thread drawline(spawnpos.origin, spawnpos.origin + (0, 0, 500), 60, (0.5, 0, 0));
            }
            foreach (spawnpos in var_fd81d96696f0490a) {
                thread drawsphere(spawnpos.origin, 15, 60, (0, 0, 0.5));
                var_96020725b7899b37 = anglestoforward(spawnpos.angles) * 30 + spawnpos.origin;
                thread drawline(spawnpos.origin, var_96020725b7899b37, 60, (0, 1, 0));
                thread drawline(spawnpos.origin, spawnpos.origin + (0, 0, 500), 60, (0, 0, 0.5));
            }
        } else if (var_a4ab3e1ca5d220c4 == 6) {
            key = "codcaster_icon_waypoint_ctf_full";
            spawns = level.spawnselectionlocations[key]["vfx_br_infil_omni_light"].spawnpoints;
            foreach (spawnpos in spawns) {
                thread drawsphere(spawnpos.origin, 30, 60, (1, 0, 0));
                var_96020725b7899b37 = anglestoforward(spawnpos.angles) * 30 + spawnpos.origin;
                thread drawline(spawnpos.origin, var_96020725b7899b37, 60, (0, 1, 0));
            }
        } else if (var_a4ab3e1ca5d220c4 == 7) {
            key = "default";
            spawns = level.spawnselectionlocations[key]["vfx/iw8_br/gameplay/infil/vfx_br_infil_jump_smoke_01.vfx"].spawnpoints;
            foreach (spawnpos in spawns) {
                thread drawsphere(spawnpos.origin, 30, 60, (1, 0, 0));
                var_96020725b7899b37 = anglestoforward(spawnpos.angles) * 30 + spawnpos.origin;
                thread drawline(spawnpos.origin, var_96020725b7899b37, 60, (0, 1, 0));
            }
        }
    #/
}

// Namespace bigctf/namespace_43c384132c052883
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xafdc
// Size: 0x47
function sortlocationsbydistance(var_fcf7e6e6d8c4861, var_fcf7b6e6d8c41c8) {
    return distancesquared(var_fcf7e6e6d8c4861.origin, self.origin) < distancesquared(var_fcf7b6e6d8c41c8.origin, self.origin);
}

// Namespace bigctf/namespace_43c384132c052883
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb02b
// Size: 0x212
function calculatedroplocationnearlocation(location, mindist, maxdist) {
    pos = location.origin;
    x = undefined;
    y = undefined;
    var_8b591b0bc361ab3d = randomint(2);
    direction = ter_op(var_8b591b0bc361ab3d, -1, 1);
    if (direction > 0) {
        x = randomfloatrange(pos[0] + mindist * direction, pos[0] + maxdist * direction);
        if (x >= level.br_level.br_corners[0][0]) {
            x = level.br_level.br_corners[0][0] - 250;
        }
    } else {
        x = randomfloatrange(pos[0] + maxdist * direction, pos[0] + mindist * direction);
        if (x <= level.br_level.br_corners[1][0]) {
            x = level.br_level.br_corners[1][0] + 250;
        }
    }
    var_8b591b0bc361ab3d = randomint(2);
    direction = ter_op(var_8b591b0bc361ab3d, -1, 1);
    if (direction > 0) {
        y = randomfloatrange(pos[1] + mindist * direction, pos[1] + maxdist * direction);
        if (y >= level.br_level.br_corners[0][1]) {
            y = level.br_level.br_corners[0][1] - 250;
        }
    } else {
        y = randomfloatrange(pos[1] + maxdist * direction, pos[1] + mindist * direction);
        if (y >= level.br_level.br_corners[1][1]) {
            y = level.br_level.br_corners[1][1] + 250;
        }
    }
    droplocation = spawnstruct();
    droplocation.origin = (x, y, pos[2]);
    return droplocation;
}

// Namespace bigctf/namespace_43c384132c052883
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb245
// Size: 0xc51
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
        case #"hash_2cd7bb8e90f46c32":
        case #"hash_2cdb2a8e90f75986":
        case #"hash_2cdb2d8e90f75e3f":
            if (team == "axis") {
                var_b379bc48dc371726.startorigin = (-8111.37, -50208.9, 1201.16);
                var_b379bc48dc371726.startangles = (15, 176, 0);
                var_b379bc48dc371726.endorigin = (-13177.5, -45326.2, 2957.64);
                var_b379bc48dc371726.endangles = (41, 267, 0);
            } else {
                var_b379bc48dc371726.startorigin = (7966.23, -35390.7, 1891.99);
                var_b379bc48dc371726.startangles = (19, 352, 0);
                var_b379bc48dc371726.endorigin = (11447.2, -40764, 2908.09);
                var_b379bc48dc371726.endangles = (29, 76, 0);
            }
            break;
        case #"hash_2ce1348e90fbe672":
        case #"hash_2ce1358e90fbe805":
            if (team == "axis") {
                var_b379bc48dc371726.startorigin = (-37269.9, -27684.2, 1093.4);
                var_b379bc48dc371726.startangles = (13, 135, 0);
                var_b379bc48dc371726.endorigin = (-38918.5, -22218, 2139);
                var_b379bc48dc371726.endangles = (37, 240, 0);
            } else {
                var_b379bc48dc371726.startorigin = (-31446.2, -18677.9, 883.622);
                var_b379bc48dc371726.startangles = (10, 36, 0);
                var_b379bc48dc371726.endorigin = (-30766.5, -23149.7, 1726.86);
                var_b379bc48dc371726.endangles = (34, 42, 0);
            }
            break;
        case #"hash_8c21d36e30da718e":
            if (team == "allies") {
                var_b379bc48dc371726.startorigin = (7124, 11776, 2556);
                var_b379bc48dc371726.startangles = (13.829, 335.3, 0);
                var_b379bc48dc371726.endorigin = (9004, 10088, 1988);
                var_b379bc48dc371726.endangles = (24.9985, 220.001, -0.000213426);
            } else {
                var_b379bc48dc371726.startorigin = (-15827.3, -133.42, 1550.86);
                var_b379bc48dc371726.startangles = (13.829, 335.3, 0);
                var_b379bc48dc371726.endorigin = (-14335.3, -3621.42, 1550.86);
                var_b379bc48dc371726.endangles = (8.53518, 55.9275, 2.37782);
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

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbe9e
// Size: 0xec
function calculatehqmidpoint() {
    level.hqmidpoint = (level.gw_objstruct.axishqloc.trigger.origin + level.gw_objstruct.allieshqloc.trigger.origin) * 0.5;
    level.hqvecttomid_allies = level.gw_objstruct.axishqloc.trigger.origin - level.hqmidpoint;
    level.hqvecttomid_axis = level.gw_objstruct.allieshqloc.trigger.origin - level.hqmidpoint;
    level.hqdisttomid = length(level.hqvecttomid_axis);
}

// Namespace bigctf/namespace_43c384132c052883
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf91
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

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc1ed
// Size: 0x2b
function spawnprotectionexception() {
    if (isdefined(self.selectedspawnarea) && issubstr(self.selectedspawnarea, "HQ")) {
        return 1;
    }
    return 0;
}

// Namespace bigctf/namespace_43c384132c052883
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc220
// Size: 0x12
function function_658c8f668d2cd83c() {
    wait(5);
    function_f1aed36ab4598ea("mp_gamemode_gw");
}

