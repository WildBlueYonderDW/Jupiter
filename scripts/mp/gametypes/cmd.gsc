// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\print.gsc;
#using scripts\mp\utility\sound.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\globallogic.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\gametypes\obj_bombzone.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\gametypes\bradley_spawner.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\destructible.gsc;
#using scripts\mp\gametypes\obj_dom.gsc;
#using scripts\cp_mp\killstreaks\airdrop.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\mp\music_and_dialog.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\perks\perkfunctions.gsc;
#using scripts\mp\lightarmor.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\spectating.gsc;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\battlechatter_mp.gsc;
#using scripts\mp\hostmigration.gsc;

#namespace cmd;

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d39
// Size: 0x767
function main() {
    if (getdvar(@"hash_687fb8f9b7a23245") == "mp_background") {
        return;
    }
    namespace_77cb23aada5edffd::init();
    namespace_77cb23aada5edffd::setupcallbacks();
    allowed[0] = "cop";
    namespace_19b4203b51d56488::main(allowed);
    if (isusingmatchrulesdata()) {
        level.initializematchrules = &initializematchrules;
        [[ level.initializematchrules ]]();
        level thread reinitializematchrulesonmigration();
    } else {
        registertimelimitdvar(getgametype(), 1200);
        if (-1) {
            registerscorelimitdvar(getgametype(), 5);
        } else {
            registerscorelimitdvar(getgametype(), 0);
        }
        registerroundlimitdvar(getgametype(), 2);
        registerroundswitchdvar(getgametype(), 0, 0, 1);
        registerwinlimitdvar(getgametype(), 0);
        registernumlivesdvar(getgametype(), 0);
        registerhalftimedvar(getgametype(), 0);
        setovertimelimitdvar(300);
    }
    updategametypedvars();
    level.objectivebased = 1;
    level.teambased = 1;
    level.disablebuddyspawn = 1;
    level.onstartgametype = &onstartgametype;
    level.onplayerconnect = &onplayerconnect;
    level.ontimelimit = &ontimelimit;
    level.getspawnpoint = &getspawnpoint;
    level.onplayerkilled = &onplayerkilled;
    level.lastcaptime = gettime();
    level.resetuiomnvargamemode = &namespace_fa795886dfc5f58a::resetuiomnvargamemode;
    level.cmdattackingteam = "neutral";
    level.cmddefendingteam = "neutral";
    level.timerstoppedforgamemode = 0;
    level.extratime = 0;
    game["dialog"]["gametype"] = "intro_start";
    game["dialog"]["bomb_achieve"] = "bomb_achieve";
    game["dialog"]["bomb_taken"] = "bomb_taken";
    game["dialog"]["bomb_lost"] = "bomb_enemyowns";
    game["dialog"]["bomb_defusing"] = "bomb_enemydefusing";
    game["dialog"]["bomb_defused"] = "bomb_defused";
    game["dialog"]["bomb_planted"] = "bomb_planted";
    game["dialog"]["enemy_bomb_a"] = "bomb_enemy_a";
    game["dialog"]["enemy_bomb_b"] = "bomb_enemy_b";
    game["dialog"]["enemy_bomb_defused"] = "bomb_enemydefused";
    game["dialog"]["enemy_bomb_planted"] = "bomb_enemyplanted";
    game["dialog"]["offense_obj"] = "cop_obj_clock";
    game["dialog"]["defense_obj"] = "cop_obj_clock";
    game["dialog"]["cop_obj_0_mp_faridah"] = "obj_embassy";
    game["dialog"]["cop_obj_0_attack_mp_faridah"] = "embassy_attack";
    game["dialog"]["cop_obj_0_mp_euphrates"] = "obj_compound";
    game["dialog"]["cop_obj_0_attack_mp_euphrates"] = "compound_attack";
    game["dialog"]["cop_obj_1_mp_faridah"] = "obj_school";
    game["dialog"]["cop_obj_1_attack_mp_faridah"] = "school_attack";
    game["dialog"]["cop_obj_1_defend_mp_faridah"] = "school_defend";
    game["dialog"]["cop_obj_1_enemy_cap_mp_faridah"] = "school_enemycapture";
    game["dialog"]["cop_obj_1_enemy_hold_mp_faridah"] = "school_enemycaptured";
    game["dialog"]["cop_obj_1_mp_euphrates"] = "obj_buses";
    game["dialog"]["cop_obj_1_attack_mp_euphrates"] = "buses_attack";
    game["dialog"]["cop_obj_1_defend_mp_euphrates"] = "buses_defend";
    game["dialog"]["cop_obj_1_enemy_cap_mp_euphrates"] = "buses_enemycapture";
    game["dialog"]["cop_obj_1_enemy_hold_mp_euphrates"] = "buses_enemycaptured";
    game["dialog"]["cop_obj_2_mp_faridah"] = "obj_clock";
    game["dialog"]["cop_obj_2_attack_mp_faridah"] = "clock_attack";
    game["dialog"]["cop_obj_2_defend_mp_faridah"] = "clock_defend";
    game["dialog"]["cop_obj_2_mp_euphrates"] = "obj_underpass";
    game["dialog"]["cop_obj_2_attack_mp_euphrates"] = "underpass_attack";
    game["dialog"]["cop_obj_2_defend_mp_euphrates"] = "underpass_defend";
    game["dialog"]["cop_obj_2_enemy_cap_mp_euphrates"] = "underpass_enemycapture";
    game["dialog"]["cop_obj_2_enemy_hold_mp_euphrates"] = "underpass_enemycaptured";
    game["dialog"]["cop_obj_3_mp_faridah"] = "obj_warehouse";
    game["dialog"]["cop_obj_3_attack_mp_faridah"] = "warehouse_attack";
    game["dialog"]["cop_obj_3_defend_mp_faridah"] = "warehouse_defend";
    game["dialog"]["cop_obj_3_enemy_cap_mp_faridah"] = "warehouse_enemycapture";
    game["dialog"]["cop_obj_3_enemy_hold_mp_faridah"] = "warehouse_enemycaptured";
    game["dialog"]["cop_obj_3_mp_euphrates"] = "obj_construction";
    game["dialog"]["cop_obj_3_attack_mp_euphrates"] = "construction_attack";
    game["dialog"]["cop_obj_3_defend_mp_euphrates"] = "construction_defend";
    game["dialog"]["cop_obj_3_enemy_cap_mp_euphrates"] = "construction_enemycapture";
    game["dialog"]["cop_obj_3_enemy_hold_mp_euphrates"] = "construction_enemycaptured";
    game["dialog"]["cop_obj_4_mp_faridah"] = "obj_compound";
    game["dialog"]["cop_obj_4_defend_mp_faridah"] = "compound_defend";
    game["dialog"]["cop_obj_4_mp_euphrates"] = "obj_fob";
    game["dialog"]["cop_obj_4_attack_mp_euphrates"] = "fob_attack";
    game["dialog"]["cop_obj_4_defend_mp_euphrates"] = "fob_defend";
    game["dialog"]["cop_target_active"] = "gamestate_targetactive";
    game["dialog"]["cop_obj_contested"] = "obj_contested";
    game["dialog"]["cop_enemy_sec"] = "enemy_capturingneutral";
    game["dialog"]["cop_hold"] = "confirm_copsecurewait";
    game["dialog"]["cop_outpostcaptured"] = "confirm_copsecureyes";
    game["dialog"]["cop_bombplanted_atenemy"] = "bombplanted_atenemycop";
    game["dialog"]["cop_bombplanted_atfriendly"] = "bombplanted_atfriendlycop";
    game["dialog"]["cop_bombdefused"] = "compound_bombdefused";
    game["dialog"]["sitrep_0_mp_faridah"] = "sitrep_embspawn";
    game["dialog"]["sitrep_1_mp_faridah"] = "sitrep_schoolspawn";
    game["dialog"]["sitrep_2_mp_faridah"] = "sitrep_clockspawn";
    game["dialog"]["sitrep_3_mp_faridah"] = "sitrep_whspawn";
    game["dialog"]["sitrep_4_mp_faridah"] = "sitrep_comspawn";
    game["dialog"]["sitrep_0_mp_euphrates"] = "sitrep_comspawn";
    game["dialog"]["sitrep_1_mp_euphrates"] = "sitrep_busesspawn";
    game["dialog"]["sitrep_2_mp_euphrates"] = "sitrep_undspawn";
    game["dialog"]["sitrep_3_mp_euphrates"] = "sitrep_constspawn";
    game["dialog"]["sitrep_4_mp_euphrates"] = "sitrep_fobspawn";
    game["dialog"]["cop_order_attack"] = "order_attack";
    game["dialog"]["cop_order_fallback"] = "order_fallback";
    game["dialog"]["cop_killstreak_bradley"] = "killstreak_bradley";
    game["dialog"]["cop_enemy_bradley"] = "enemy_bradley";
    game["dialog"]["cop_hostage_located"] = "hostage_located";
    game["dialog"]["cop_hostage_extraction"] = "hostage_extraction";
    game["dialog"]["cop_breach_plant"] = "breach_plant";
    thread ongameended();
    level._effect["vfx_smk_signal"] = loadfx("vfx/_requests/mp_gameplay/vfx_smk_signal");
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x24a7
// Size: 0x1cb
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
    setdynamicdvar(@"hash_735778ffcb77229d", getmatchrulesdata("cmdData", "cmdRules"));
    setdynamicdvar(@"hash_fd24789f16e89ad4", getmatchrulesdata("cmdData", "activationDelayCenter"));
    setdynamicdvar(@"hash_95b89e8d583fc3f4", getmatchrulesdata("cmdData", "activationDelayHalf"));
    setdynamicdvar(@"hash_c6918fbaba545a8", getmatchrulesdata("cmdData", "activationDelayBase"));
    setdynamicdvar(@"hash_c5cd0ccd8e5dcb79", getmatchrulesdata("cmdData", "captureDurationCenter"));
    setdynamicdvar(@"hash_15912d8e8706d469", getmatchrulesdata("cmdData", "captureDurationHalf"));
    setdynamicdvar(@"hash_70014a04d6bc8145", getmatchrulesdata("cmdData", "captureDurationBase"));
    setdynamicdvar(@"hash_f25163981c3cc7a2", getmatchrulesdata("cmdData", "holdDurationCenter"));
    setdynamicdvar(@"hash_1a413608e91a1bf2", getmatchrulesdata("cmdData", "holdDurationHalf"));
    setdynamicdvar(@"hash_bf89fd9299156f12", getmatchrulesdata("cmdData", "holdDurationBase"));
    setdynamicdvar(@"hash_acbd6c796aa85052", getmatchrulesdata("cmdData", "juggSpawnBehavior"));
    setdynamicdvar(@"hash_5460d7525025cd97", getmatchrulesdata("domData", "flagCaptureTime"));
    setdynamicdvar(@"hash_2b8bea8d06e005c1", getmatchrulesdata("domData", "flagNeutralization"));
    setdynamicdvar(@"hash_9fd736b486efcb95", getmatchrulesdata("ctfData", "captureCondition"));
    setdynamicdvar(@"hash_cde4a2a016eecbae", 0);
    registerhalftimedvar("dom", 0);
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2679
// Size: 0x314
function updategametypedvars() {
    namespace_310ba947928891df::updatecommongametypedvars();
    level.cmdrules = dvarintvalue("cmdRules", 1, 1, 3);
    level.tieractivationdelay = [];
    level.tieractivationdelay[0] = dvarfloatvalue("activationDelayCenter", 15, 0, 60);
    level.tieractivationdelay[1] = dvarfloatvalue("activationDelayHalf", 15, 0, 60);
    level.tieractivationdelay[2] = dvarfloatvalue("activationDelayBase", 15, 0, 60);
    level.tiercapturetime = [];
    level.tiercapturetime[0] = dvarfloatvalue("captureDurationCenter", 10, 0, 60);
    level.tiercapturetime[1] = dvarfloatvalue("captureDurationHalf", 10, 0, 60);
    level.tiercapturetime[2] = dvarfloatvalue("captureDurationBase", 10, 0, 60);
    level.tierholdtime = [];
    level.tierholdtime[0] = dvarfloatvalue("holdDurationCenter", 30, 0, 60);
    level.tierholdtime[1] = dvarfloatvalue("holdDurationHalf", 30, 0, 60);
    level.tierholdtime[2] = dvarfloatvalue("holdDurationBase", 45, 0, 60);
    level.juggspawnbehavior = dvarintvalue("juggSpawnBehavior", 1, 0, 3);
    level.flagcapturetime = dvarfloatvalue("flagCaptureTime", 10, 0, 30);
    level.flagneutralization = dvarintvalue("flagNeutralization", 0, 0, 1);
    level.hvtspawnpos = dvarintvalue("captureCondition", 1, 0, 2);
    level.overtime = dvarfloatvalue("overtimeLimit", 300, 0, 300);
    setovertimelimitdvar(level.overtime);
    level.persistentbombtimer = 0;
    level.persistentdomtimer = 1;
    if (istrue(level.persistentbombtimer)) {
        level.bombtimer = 60;
    } else {
        level.bombtimer = 30;
    }
    if (level.cmdrules == 1) {
        level.planttime = 2;
        level.defusetime = 2;
    } else {
        level.planttime = level.tiercapturetime[2];
        level.defusetime = level.tiercapturetime[2];
        level.bombtimer = 3;
    }
    level.controltoprogress = 1;
    setdvar(@"hash_60f76e342fa97cce", 200);
    level.forcedobjectiveindex = getdvarint(@"hash_1bee917b434ddca6", -1);
    if (level.forcedobjectiveindex != -1) {
        setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_roundLimit"), 2);
        registerroundlimitdvar(getgametype(), 2);
        setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_roundswitch"), 1);
        registerroundswitchdvar(getgametype(), 1, 0, 1);
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2994
// Size: 0xa4
function ontimelimit() {
    if (level.cmdrules == 2) {
        if (level.cmddefendingteam != "neutral") {
            cmd_endgame(level.cmddefendingteam, game["end_reason"]["outpost_defended"]);
        } else {
            level thread namespace_d576b6dc7cef9c62::endgame("tie", game["end_reason"]["time_limit_reached"]);
        }
    } else if (inovertime()) {
        level thread namespace_d576b6dc7cef9c62::endgame("tie", game["end_reason"]["time_limit_reached"]);
    } else {
        level thread namespace_d576b6dc7cef9c62::endgame("overtime", game["end_reason"]["time_limit_reached"]);
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a3f
// Size: 0x81
function seticonnames() {
    level.iconcapture = "icon_waypoint_capture";
    level.iconcontested = "icon_waypoint_contested";
    level.icondefend = "icon_waypoint_defend";
    level.icondefusing = "icon_waypoint_defusing";
    level.iconlosing = "icon_waypoint_losing";
    level.iconneutral = "icon_waypoint_neutral";
    level.iconplanting = "icon_waypoint_planting";
    level.icontaking = "icon_waypoint_taking";
    level.icontarget = "icon_waypoint_target";
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ac7
// Size: 0x151
function onstartgametype() {
    setomnvar("ui_victory_condition_completed", 0);
    seticonnames();
    if (!isdefined(game["switchedsides"])) {
        game["switchedsides"] = 0;
    }
    if (game["switchedsides"]) {
        oldattackers = game["attackers"];
        olddefenders = game["defenders"];
        game["attackers"] = olddefenders;
        game["defenders"] = oldattackers;
    }
    foreach (entry in level.teamnamelist) {
        setobjectivetext(entry, "OBJECTIVES/DOM");
        if (level.splitscreen) {
            setobjectivescoretext(entry, "OBJECTIVES/DOM");
        } else {
            setobjectivescoretext(entry, "OBJECTIVES/DOM_SCORE");
        }
        setobjectivehinttext(entry, "OBJECTIVES/DOM_HINT");
    }
    setclientnamemode("auto_change");
    initspecatatorcameras();
    thread loopspectatorlocations();
    setupobjectives();
    initspawns();
    setupdestructibledoors();
    if (level.mapname == "mp_faridah") {
        init_mp_faridah();
    }
    thread startgame();
    namespace_662734e7fa8a8b94::inittankspawns();
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c1f
// Size: 0x1a
function init_mp_faridah() {
    initschoolmgturret();
    thread initksbonuscrates();
    thread initpropaganda();
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c40
// Size: 0x73
function initpropaganda() {
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    spawnorigin = (435, 0, 625);
    spawnangles = (0, 0, 0);
    level.propagandaent = spawn_tag_origin(spawnorigin, spawnangles);
    level.propagandaent show();
    level.propagandaent playloopsound("tmp_emt_mp_faridah_propaganda_lp");
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2cba
// Size: 0x17c
function initschoolmgturret() {
    spawnorigin = (260, -1415, 150);
    spawnangles = (0, 90, 0);
    org = spawn_tag_origin(spawnorigin, spawnangles);
    turret = spawnturret("misc_turret", org.origin, "tur_gun_faridah_mp", 0);
    turret.angles = org.angles;
    turret linkto(org, "tag_origin", (0, 0, 16), (0, 0, 0));
    turret setmodel("weapon_mg_bravo50_balcony");
    turret makeunusable();
    turret setnodeploy(1);
    turret setdefaultdroppitch(0);
    objweapon = makeweapon("tur_gun_faridah_mp");
    turret.objweapon = objweapon;
    var_861cb51e11728417 = turret gettagorigin("tag_turret_pitch");
    useobj = namespace_19b4203b51d56488::createhintobject(var_861cb51e11728417, "HINT_BUTTON", "hud_icon_turret", "KILLSTREAKS_HINTS/SENTRY_USE_GL");
    useobj linkto(turret, "tag_turret_pitch", (0, 0, 5), (0, 0, 0));
    useobj thread turretthink(turret);
    turret.killcament = spawn("script_model", (255, -1425, 210));
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e3d
// Size: 0xe1
function turretthink(turret) {
    while (1) {
        player = self waittill("trigger");
        self makeunusable();
        player.prevweapon = player getcurrentweapon();
        player.useweapon = "tur_gun_faridah_mp";
        player _giveweapon(player.useweapon, undefined, undefined, 1);
        while (player domonitoredweaponswitch(player.useweapon, 1) == 0) {
            waitframe();
        }
        player controlturreton(turret);
        thread endturretusewatch(player, turret);
        thread endturretonplayer(player);
        self waittill("end_turret_use");
        if (isdefined(player)) {
            player controlturretoff(turret);
            player switchtoweaponimmediate(player.prevweapon);
            player _takeweapon(player.useweapon);
        }
        self makeusable();
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2f25
// Size: 0x45
function endturretusewatch(player, turret) {
    player endon("death_or_disconnect");
    while (player usebuttonpressed()) {
        waitframe();
    }
    while (1) {
        if (player usebuttonpressed()) {
            self notify("end_turret_use");
            break;
        }
        waitframe();
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f71
// Size: 0x1c
function endturretonplayer(player) {
    player waittill("death_or_disconnect");
    self notify("end_turret_use");
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f94
// Size: 0x54
function initksbonuscrates() {
    wait(2);
    pos = (1125, -1675, 100);
    givekscratetoteam("allies", pos, "cruise_predator");
    pos = (-1150, -575, 100);
    givekscratetoteam("allies", pos, "chopper_gunner");
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2fef
// Size: 0x149
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
                setteammapposition(var_ca2c833762e5466c, game["attackers"], var_6a17713098332fe4);
                break;
            case #"hash_e66f1db565904926":
                setteammapposition(var_ca2c833762e5466c, game["defenders"], var_6a17713098332fe4);
                break;
            }
        }
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x313f
// Size: 0x47
function setteammapposition(var_ca2c833762e5466c, team, var_20c18491aeb9a905) {
    if (!isdefined(level.spectatorcameras[var_ca2c833762e5466c])) {
        level.spectatorcameras[var_ca2c833762e5466c] = [];
    }
    level.spectatorcameras[var_ca2c833762e5466c][team] = var_20c18491aeb9a905;
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x318d
// Size: 0xda
function loopspectatorlocations() {
    index = 0;
    while (1) {
        if (getdvarint(@"hash_4ac8d16ce8dd74fd", 0) == 1) {
            if (isalive(level.players[0])) {
                level.players[0] suicide();
            }
            var_7940dcde72827af7 = getdvarint(@"hash_885dea990259dafe", -1);
            if (var_7940dcde72827af7 != -1) {
                index = var_7940dcde72827af7;
            }
            updatespectatorcamera("cop_" + index);
            duration = getdvarfloat(@"hash_7d3ea16c514f408d", 1);
            wait(duration);
            index++;
            if (index > 4) {
                index = 0;
            }
            if (getdvarint(@"hash_4ac8d16ce8dd74fd", 0) == 0) {
                level.players[0] notify("force_spawn");
            }
        } else {
            waitframe();
        }
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x326e
// Size: 0xb0
function setupdestructibledoors() {
    if (!isdefined(level.destructibles) || !isdefined(level.destructibles["destructible_door"])) {
        return;
    }
    foreach (door in level.destructibles["destructible_door"]) {
        owner = getdoorowner(door.ents[0].origin);
        door namespace_f35854735f789d3c::assigninteractteam(getenemyteams(owner));
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3325
// Size: 0xbe
function getdoorowner(position) {
    closest = undefined;
    bestdist = undefined;
    foreach (objective in level.objectives) {
        if (!isdefined(objective.defaultownerteam)) {
            continue;
        }
        dist = distance2dsquared(position, objective.curorigin);
        if (!isdefined(closest) || dist < bestdist) {
            closest = objective;
            bestdist = dist;
        }
    }
    return closest.defaultownerteam;
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x33eb
// Size: 0x34f
function initspawns() {
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    if (function_bff229a11ecd1e34()) {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic(#"default");
    } else {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic("Default", "Crit_Default");
    }
    namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_cmd_spawn_allies_start");
    namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_cmd_spawn_axis_start");
    namespace_b2d5aa2baf2b5701::addspawnpoints(game["attackers"], "mp_cmd_spawn_allies", 1);
    namespace_b2d5aa2baf2b5701::addspawnpoints(game["defenders"], "mp_cmd_spawn_axis", 1);
    level.mapcenter = namespace_b2d5aa2baf2b5701::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
    foreach (objective in level.objectives) {
        objective.spawnpoints = [];
        objective.spawnpoints[game["attackers"]] = [];
        objective.spawnpoints[game["defenders"]] = [];
    }
    foreach (spawnpoint in level.spawnpoints) {
        if (isdefined(spawnpoint.script_noteworthy)) {
            index = spawnpoint.script_noteworthy;
            if (spawnpoint.classname == "mp_cmd_spawn_allies") {
                level.objectives[index].spawnpoints[game["attackers"]][level.objectives[index].spawnpoints[game["attackers"]].size] = spawnpoint;
            } else if (spawnpoint.classname == "mp_cmd_spawn_axis") {
                level.objectives[index].spawnpoints[game["defenders"]][level.objectives[index].spawnpoints[game["defenders"]].size] = spawnpoint;
            }
        }
    }
    foreach (objindex, objective in level.objectives) {
        objective.spawnsets = [];
        objective.spawnsets[game["attackers"]] = "objSpawn_allies_" + objindex;
        namespace_b2d5aa2baf2b5701::registerspawnset(objective.spawnsets[game["attackers"]], objective.spawnpoints[game["attackers"]]);
        objective.spawnsets[game["defenders"]] = "objSpawn_axis_" + objindex;
        namespace_b2d5aa2baf2b5701::registerspawnset(objective.spawnsets[game["defenders"]], objective.spawnpoints[game["defenders"]]);
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3741
// Size: 0x98
function getspawnpoint() {
    spawnteam = self.pers["team"];
    if (namespace_b2d5aa2baf2b5701::shoulduseteamstartspawn()) {
        if (game["switchedsides"]) {
            spawnteam = getotherteam(spawnteam)[0];
        }
        spawnpoints = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_cmd_spawn_" + spawnteam + "_start");
        spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint_startspawn(spawnpoints);
        self.startspawnpoint = spawnpoint;
    } else {
        spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, level.currentobjective.spawnsets[spawnteam]);
    }
    return spawnpoint;
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x37e1
// Size: 0x52
function setupobjectives() {
    level.currentobjective = undefined;
    level.objectives = [];
    setupbombzones();
    setupflags();
    setupareabrushes();
    setupteamoobtriggers();
    validateobjectives();
    thread ui_updatecmdprogress();
    thread disableobjectiveongameended();
    thread setupcaptureflares();
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x383a
// Size: 0x23e
function setupbombzones() {
    triggers = getentarray("cop_bombzone", "targetname");
    if (triggers.size == 0) {
        return;
    }
    level._effect["bomb_explosion"] = loadfx("vfx/iw9/dmz/bombsite/vfx_dmz_bombsite_expl.vfx");
    level._effect["vehicle_explosion"] = loadfx("vfx/core/expl/small_vehicle_explosion_new.vfx");
    level._effect["building_explosion"] = loadfx("vfx/iw7/_requests/mp/vfx_debug_warning.vfx");
    level._effect["faridah_bomb_explosion"] = loadfx("vfx/iw8_mp/killstreak/vfx_cruise_predator_explosion_large_2.vfx");
    level.ddbombmodel = [];
    level.multibomb = 1;
    level.bombsplanted = 0;
    level.bombexploded = 0;
    level.bombplanted = 0;
    level.aplanted = 0;
    level.bplanted = 0;
    foreach (trigger in triggers) {
        /#
            assert(isdefined(trigger.script_noteworthy));
        #/
        objectiveindex = trigger.script_noteworthy;
        if (objectiveindex == "5") {
            objectiveindex = "_b";
        } else {
            objectiveindex = "_a";
        }
        trigger.objectivekey = objectiveindex;
        trigger mapobjectiveicon();
        bombzone = namespace_fa795886dfc5f58a::setupobjective(trigger);
        bombzone bombzone_ondisableobjective();
        bombzone namespace_19b4203b51d56488::releaseid();
        level.objectives[bombzone.objectivekey] = bombzone;
        bombzone.onbeginuse = &bombzone_onbeginuse;
        bombzone.onenduse = &bombzone_onenduse;
        bombzone.onuse = &bombzone_onuseplantobject;
        bombzone.ondisableobjective = &bombzone_ondisableobjective;
        bombzone.onenableobjective = &bombzone_onenableobjective;
        bombzone.onactivateobjective = &bombzone_onactivateobjective;
        if (objectiveindex == "_a") {
            bombzone namespace_19b4203b51d56488::setownerteam(game["attackers"]);
        } else {
            bombzone namespace_19b4203b51d56488::setownerteam(game["defenders"]);
        }
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a7f
// Size: 0x26e
function setupflags() {
    primaryflags = getentarray("cop_flag", "targetname");
    var_a9232bfe0bb02c00 = getentarray("cop_flag_override", "targetname");
    if (primaryflags.size == 0) {
        return;
    }
    triggers = [];
    for (index = 0; index < primaryflags.size; index++) {
        triggers[triggers.size] = primaryflags[index];
    }
    var_1dc2b3dbb108241c = [];
    if (var_a9232bfe0bb02c00.size > 0) {
        foreach (trigger in var_a9232bfe0bb02c00) {
            /#
                assert(isdefined(trigger.script_noteworthy));
            #/
            objectiveindex = trigger.script_noteworthy;
            var_1dc2b3dbb108241c[objectiveindex] = trigger;
        }
    }
    foreach (trigger in triggers) {
        /#
            assert(isdefined(trigger.script_noteworthy));
        #/
        objectiveindex = trigger.script_noteworthy;
        if (isdefined(var_1dc2b3dbb108241c[objectiveindex])) {
            trigger = var_1dc2b3dbb108241c[objectiveindex];
        }
        trigger.objectivekey = objectiveindex;
        trigger mapobjectiveicon(objectiveindex);
        domflag = namespace_98b55913d2326ac8::setupobjective(trigger);
        domflag.flagmodel delete();
        domflag.flagmodel = undefined;
        domflag.outlineent = undefined;
        domflag dompoint_ondisableobjective();
        level.objectives[domflag.objectivekey] = domflag;
        domflag.onbeginuse = &dompoint_onbeginuse;
        domflag.onuse = &dompoint_onuse;
        domflag.onenduse = &dompoint_onenduse;
        domflag.oncontested = &dompoint_oncontested;
        domflag.onuncontested = &dompoint_onuncontested;
        domflag.ondisableobjective = &dompoint_ondisableobjective;
        domflag.onenableobjective = &dompoint_onenableobjective;
        domflag.onactivateobjective = &dompoint_onactivateobjective;
        domflag thread namespace_98b55913d2326ac8::updateflagstate("off", 0);
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3cf4
// Size: 0x11
function disabledomflagscriptable() {
    thread namespace_98b55913d2326ac8::updateflagstate("off", 0);
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3d0c
// Size: 0x5eb
function setupareabrushes() {
    var_3afea31199696620 = getentarray("cop_zone_visual", "targetname");
    var_c4e3db398aa8c45a = getentarray("cop_zone_visual_contest", "targetname");
    var_7319db7c192615c2 = getentarray("cop_zone_visual_friend", "targetname");
    var_a318eca969071e51 = getentarray("cop_zone_visual_enemy", "targetname");
    var_6591cecb9458082d = getentarray("cop_zone_visual_friend_pulse", "targetname");
    var_651b51771bbbe69c = getentarray("cop_zone_visual_enemy_pulse", "targetname");
    foreach (objective in level.objectives) {
        if (isdefined(objective.scriptable)) {
            objective.scriptable delete();
            objective.scriptable = undefined;
        }
    }
    if (isdefined(var_3afea31199696620)) {
        foreach (brush in var_3afea31199696620) {
            /#
                assert(isdefined(brush.script_noteworthy));
            #/
            var_378ba18d7497d6d9 = brush.script_noteworthy;
            if (!isdefined(level.objectives[var_378ba18d7497d6d9].neutralbrush)) {
                level.objectives[var_378ba18d7497d6d9].neutralbrush = [];
            }
            level.objectives[var_378ba18d7497d6d9].neutralbrush[level.objectives[var_378ba18d7497d6d9].neutralbrush.size] = brush;
            brush hide();
        }
        foreach (brush in var_c4e3db398aa8c45a) {
            /#
                assert(isdefined(brush.script_noteworthy));
            #/
            var_378ba18d7497d6d9 = brush.script_noteworthy;
            if (!isdefined(level.objectives[var_378ba18d7497d6d9].contestedbrush)) {
                level.objectives[var_378ba18d7497d6d9].contestedbrush = [];
            }
            level.objectives[var_378ba18d7497d6d9].contestedbrush[level.objectives[var_378ba18d7497d6d9].contestedbrush.size] = brush;
            brush hide();
        }
        foreach (brush in var_7319db7c192615c2) {
            /#
                assert(isdefined(brush.script_noteworthy));
            #/
            var_378ba18d7497d6d9 = brush.script_noteworthy;
            if (!isdefined(level.objectives[var_378ba18d7497d6d9].friendlybrush)) {
                level.objectives[var_378ba18d7497d6d9].friendlybrush = [];
            }
            level.objectives[var_378ba18d7497d6d9].friendlybrush[level.objectives[var_378ba18d7497d6d9].friendlybrush.size] = brush;
            brush hide();
        }
        foreach (brush in var_a318eca969071e51) {
            /#
                assert(isdefined(brush.script_noteworthy));
            #/
            var_378ba18d7497d6d9 = brush.script_noteworthy;
            if (!isdefined(level.objectives[var_378ba18d7497d6d9].enemybrush)) {
                level.objectives[var_378ba18d7497d6d9].enemybrush = [];
            }
            level.objectives[var_378ba18d7497d6d9].enemybrush[level.objectives[var_378ba18d7497d6d9].enemybrush.size] = brush;
            brush hide();
        }
        foreach (brush in var_6591cecb9458082d) {
            /#
                assert(isdefined(brush.script_noteworthy));
            #/
            var_378ba18d7497d6d9 = brush.script_noteworthy;
            if (!isdefined(level.objectives[var_378ba18d7497d6d9].friendlypulsebrush)) {
                level.objectives[var_378ba18d7497d6d9].friendlypulsebrush = [];
            }
            level.objectives[var_378ba18d7497d6d9].friendlypulsebrush[level.objectives[var_378ba18d7497d6d9].friendlypulsebrush.size] = brush;
            brush hide();
        }
        foreach (brush in var_651b51771bbbe69c) {
            /#
                assert(isdefined(brush.script_noteworthy));
            #/
            var_378ba18d7497d6d9 = brush.script_noteworthy;
            if (!isdefined(level.objectives[var_378ba18d7497d6d9].enemypulsebrush)) {
                level.objectives[var_378ba18d7497d6d9].enemypulsebrush = [];
            }
            level.objectives[var_378ba18d7497d6d9].enemypulsebrush[level.objectives[var_378ba18d7497d6d9].enemypulsebrush.size] = brush;
            brush hide();
        }
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x42fe
// Size: 0x1ef
function setupteamoobtriggers() {
    oobtriggers = getentarray("cop_outofbounds", "targetname");
    if (!isdefined(oobtriggers)) {
        return;
    }
    foreach (trigger in oobtriggers) {
        /#
            assert(isdefined(trigger.script_noteworthy));
        #/
        var_378ba18d7497d6d9 = trigger.script_noteworthy;
        if (!isdefined(level.objectives[var_378ba18d7497d6d9].oobtriggers)) {
            level.objectives[var_378ba18d7497d6d9].oobtriggers = [];
        }
        /#
            assert(isdefined(trigger.script_label));
        #/
        if (isdefined(trigger.target)) {
            othervisuals = getscriptablearray(trigger.target, "targetname");
            visuals = [];
            foreach (visual in othervisuals) {
                index = visuals.size;
                visuals[index] = visual;
                if (isdefined(visual.script_noteworthy)) {
                    visuals[index].drawcount = int(visual.script_noteworthy);
                } else {
                    visuals[index].drawcount = 1;
                }
            }
            trigger.visuals = visuals;
            trigger thread updateoobvisuals("off");
        }
        level.objectives[var_378ba18d7497d6d9].oobtriggers[trigger.script_label] = trigger;
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x44f4
// Size: 0x2b8
function validateobjectives() {
    if (level.objectives.size == 0) {
        /#
            assertmsg("validateObjectives: level.objectives.size == 0");
        #/
    } else if ((level.objectives.size - 2) % 2 == 0) {
        /#
            assertmsg("validateObjectives: level.objectives.size is not an odd number");
        #/
    }
    level.midpointobjectiveindex = int(floor((level.objectives.size - 2) / 2));
    level.currentobjectiveindex = level.midpointobjectiveindex;
    level.previousobjectiveindex = level.currentobjectiveindex;
    foreach (objective in level.objectives) {
        if (level.cmdrules == 1) {
            jumpiffalse(objective.objectivekey == "_a" || objective.objectivekey == "_b") LOC_00000113;
        } else {
        LOC_00000113:
            index = int(objective.objectivekey);
            tierindex = int(clamp(floor(abs(index - 2)), 0, 2));
            objective.tierindex = tierindex;
            objective.activationdelay = level.tieractivationdelay[tierindex];
            objective.captureduration = level.tiercapturetime[tierindex];
            objective.holdtime = level.tierholdtime[tierindex];
            objective namespace_19b4203b51d56488::disableobject();
            objective.firsttime = 1;
            if (level.cmdrules == 1) {
                switch (tierindex) {
                case 0:
                case 1:
                    objective namespace_19b4203b51d56488::setcapturebehavior("persistent");
                    objective.ignorestomp = 1;
                    break;
                case 2:
                    if (index < level.midpointobjectiveindex) {
                        objective.defaultownerteam = game["defenders"];
                    } else {
                        objective.defaultownerteam = game["attackers"];
                    }
                    break;
                }
            } else {
                objective.firsttime = 1;
                objective namespace_19b4203b51d56488::setcapturebehavior("normal");
                if (index == level.midpointobjectiveindex) {
                    continue;
                }
                if (index < level.midpointobjectiveindex) {
                    objective.defaultownerteam = game["defenders"];
                } else {
                    objective.defaultownerteam = game["attackers"];
                }
            }
        }
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x47b3
// Size: 0x69
function startgame() {
    level endon("game_ended");
    setomnvar("ui_objective_timer_stopped", 1);
    setomnvar("ui_hardpoint_timer", 0);
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    updateteamscores();
    setomnvar("ui_objective_timer_stopped", 0);
    if (level.cmdrules == 2) {
        level namespace_d576b6dc7cef9c62::pausetimer();
    }
    updatecurrentobjective(level.currentobjectiveindex);
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4823
// Size: 0x3a7
function updatecurrentobjective(newindex) {
    if (level.forcedobjectiveindex != -1) {
        newindex = level.forcedobjectiveindex;
    }
    if (!isdefined(level.objectives[string(newindex)])) {
        return;
    }
    if (isdefined(level.currentobjective) && isdefined(level.currentobjective.ondisableobjective)) {
        level.currentobjective [[ level.currentobjective.ondisableobjective ]]();
    }
    level.previousobjectiveindex = level.currentobjectiveindex;
    level.currentobjectiveindex = newindex;
    updatespectatorcamera("cop_" + level.currentobjectiveindex);
    level.currentobjective = level.objectives[string(newindex)];
    setomnvar("ui_cmd_current_obj", newindex);
    updateoobtriggers();
    if (isdefined(level.currentobjective.onenableobjective)) {
        level.currentobjective [[ level.currentobjective.onenableobjective ]]();
    }
    thread ui_updatecmdholdprogress();
    updateteamscores();
    if (level.currentobjective.activationdelay > 0) {
        if (level.cmdrules == 2 && level.currentobjectiveindex == level.midpointobjectiveindex) {
            level namespace_d576b6dc7cef9c62::pausetimer();
        }
        level.activationdelaystarttime = gettime();
        activationdelay = level.currentobjective.activationdelay;
        ui_updatezonetimer(activationdelay);
        ui_updatezonetimerpausedness(0);
        ui_updatecmdownerteam("zone_activation_delay");
        ui_updatecmdcapturestatus("zone_activation_delay", 0);
        wait(3);
        showsplashtoteam("all", "cop_target");
        statusdialog(getvoforobjective("allies", "next"), "allies", 1);
        statusdialog(getvoforobjective("axis", "next"), "axis", 1);
        level.currentobjective.firsttime = 0;
        currenttime = gettime();
        foreach (player in level.players) {
            player.lastsitreptime = currenttime;
        }
        wait(activationdelay - 3);
        level.activationdelaystarttime = undefined;
    }
    if (level.cmdrules == 2 && level.currentobjectiveindex == level.midpointobjectiveindex) {
        level namespace_d576b6dc7cef9c62::resumetimer();
    }
    if (isdefined(level.currentobjective.onactivateobjective)) {
        level.currentobjective [[ level.currentobjective.onactivateobjective ]]();
    }
    showsplashtoteam("all", "cop_activate");
    spawndelay = 0;
    switch (level.currentobjective.tierindex) {
    case 0:
        spawndelay = 0;
        break;
    case 1:
        spawndelay = 5;
        break;
    case 2:
        spawndelay = 10;
        break;
    }
    namespace_d576b6dc7cef9c62::updatewavespawndelay(spawndelay);
    statusdialog("cop_target_active", "allies", 0);
    statusdialog("cop_target_active", "axis", 0);
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4bd1
// Size: 0x37
function getfirsttimevoforobjective(team) {
    dialog = "cop_obj_" + level.currentobjectiveindex + "_" + level.mapname;
    return dialog;
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4c10
// Size: 0x268
function getvoforobjective(team, type) {
    dialog = "";
    var_3164b69c41644155 = 0;
    var_f575332e106d8432 = team == "allies" && level.previousobjectiveindex > level.currentobjectiveindex || team == "axis" && level.previousobjectiveindex < level.currentobjectiveindex;
    if (type == "next" && level.currentobjective.firsttime) {
        dialog = getfirsttimevoforobjective(team);
    } else {
        switch (level.currentobjectiveindex) {
        case 0:
        case 4:
            var_3164b69c41644155 = 0;
            switch (type) {
            case #"hash_92670f494cc10c48":
                dialog = "cop_obj_" + level.currentobjectiveindex + ter_op(var_f575332e106d8432, "_attack_", "_defend_") + level.mapname;
                break;
            case #"hash_6e2ea4fb7e9ad15e":
                if (level.currentobjectiveindex == 0) {
                    dialog = "cop_bombplanted" + ter_op(team == "allies", "_atenemy", "_atfriendly");
                } else {
                    dialog = "cop_bombplanted" + ter_op(team == "axis", "_atenemy", "_atfriendly");
                }
                break;
            case #"hash_ee614ad990a332c4":
                var_3164b69c41644155 = 1;
                break;
            }
            break;
        case 1:
        case 2:
        case 3:
            switch (type) {
            case #"hash_92670f494cc10c48":
                dialog = "cop_obj_" + level.currentobjectiveindex + ter_op(var_f575332e106d8432, "_attack_", "_defend_") + level.mapname;
                break;
            case #"hash_1bf6fe61528ba20e":
            case #"hash_ad03d568ce6bff91":
            case #"hash_dd93195493d0c818":
                var_3164b69c41644155 = 1;
                break;
            }
            break;
        }
        if (dialog == "") {
            if (var_3164b69c41644155) {
                dialog = "cop_" + type;
            } else {
                dialog = "cop_obj_" + level.currentobjectiveindex + "_" + type + "_" + level.mapname;
            }
        }
    }
    return dialog;
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x4e80
// Size: 0xec
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00) {
    if (!isplayer(attacker) || attacker.team == self.team) {
        return;
    }
    if (isdefined(objweapon) && iskillstreakweapon(objweapon.basename)) {
        return;
    }
    switch (level.currentobjective.id) {
    case #"hash_87dc3fd822e5915":
        namespace_98b55913d2326ac8::awardgenericmedals(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00);
        break;
    case #"hash_def5f510c5aa68f4":
        namespace_fa795886dfc5f58a::bombzone_awardgenericbombzonemedals(attacker, self);
        break;
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4f73
// Size: 0x7a
function onplayerconnect(player) {
    foreach (objective in level.objectives) {
        if (isdefined(objective.neutralbrush)) {
            objective hidebrushes(player);
        }
    }
    player thread updatefloorbrushwaitforjoined();
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4ff4
// Size: 0x6a
function decayholdtime(team) {
    self endon("domPoint_HoldTimer");
    while (1) {
        if (isdefined(team)) {
            self.teamholdtimers[team] = self.teamholdtimers[team] - level.framedurationseconds;
            if (self.teamholdtimers[team] <= 0) {
                self.teamholdtimers[team] = 0;
                break;
            }
        }
        waitframe();
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5065
// Size: 0x518
function dompoint_holdtimer(team, var_22282e7d48ca3400) {
    level endon("gameEnded");
    self notify("domPoint_HoldTimer");
    self endon("domPoint_HoldTimer");
    level.inobjectiveot = 0;
    ui_updatecmdownerteam(team);
    if (istrue(level.persistentdomtimer)) {
        holdtime = self.teamholdtimers[team];
        self.holdteam = team;
    } else {
        holdtime = level.currentobjective.holdtime;
    }
    otherteam = getotherteam(team)[0];
    if (holdtime > 0) {
        thread decayholdtime(team);
        statusdialog(getvoforobjective(otherteam, "enemy_hold"), otherteam, 1);
        var_5c8df3b9e5303ff8 = 0;
        if (level.currentobjectiveindex != 2 && holdtime > 5) {
            closestplayer = getclosestplayeronteam(level.currentobjective.trigger.origin, team);
            if (isdefined(closestplayer)) {
                var_5c8df3b9e5303ff8 = var_5c8df3b9e5303ff8 + closestplayer getselfobjcaptureddialog("captured");
            }
        }
        if (var_5c8df3b9e5303ff8 > 0) {
            wait(var_5c8df3b9e5303ff8);
        }
        var_1dea067d4174d3cb = 0;
        closestplayer = getclosestplayeronteam(level.currentobjective.trigger.origin, team);
        if (isdefined(closestplayer) && holdtime > 5 + var_5c8df3b9e5303ff8) {
            var_1dea067d4174d3cb = 0;
        }
        var_5c8df3b9e5303ff8 = var_5c8df3b9e5303ff8 + var_1dea067d4174d3cb;
        wait(var_1dea067d4174d3cb);
        if (holdtime > 5 + var_5c8df3b9e5303ff8) {
            statusdialog(getvoforobjective(team, "hold"), team, 1);
        }
        if (holdtime - var_5c8df3b9e5303ff8 > 0) {
            wait(holdtime - var_5c8df3b9e5303ff8);
        } else {
            wait(holdtime);
        }
        otherteam = getotherteam(team)[0];
        if (istrue(level.controltoprogress) && level.currentobjective.touchlist[otherteam].size > 0) {
            level.inobjectiveot = 1;
            ui_updatecmdcapturestatus("overtime", level.currentobjective.stalemate);
            while (1) {
                if (level.currentobjective.touchlist[otherteam].size == 0) {
                    break;
                }
                waitframe();
            }
            level.inobjectiveot = 0;
        }
    }
    givescore = 0;
    newindex = level.currentobjectiveindex;
    if (team == game["attackers"]) {
        newindex--;
        if (level.currentobjectiveindex <= level.midpointobjectiveindex) {
            givescore = 1;
            if (level.currentobjective.tierindex == 1) {
                spawnjuggcate(team, "attacker");
                spawnjuggcate(getotherteam(team)[0], "defender");
            } else if (level.currentobjective.tierindex == 0) {
                if (isdefined(level.propagandaent)) {
                    level.propagandaent stoploopsound();
                }
            }
        }
    } else {
        newindex++;
        if (level.currentobjectiveindex >= level.midpointobjectiveindex) {
            givescore = 1;
            if (level.currentobjective.tierindex == 1) {
                spawnjuggcate(team, "attacker");
                spawnjuggcate(getotherteam(team)[0], "defender");
            } else if (level.currentobjective.tierindex == 0) {
                if (isdefined(level.propagandaent)) {
                    level.propagandaent playloopsound("tmp_emt_mp_faridah_propaganda_lp");
                }
            }
        }
    }
    if (0 && givescore) {
        giveteamscoreforobjective(team, 1, 0);
    }
    if (self.tierindex == 0) {
        if (isdefined(var_22282e7d48ca3400)) {
            var_22282e7d48ca3400 thread givekillstreak("uav", 1);
        } else {
            closestplayer = getclosestplayeronteam(level.currentobjective.trigger.origin, team);
            closestplayer thread givekillstreak("uav", 1);
        }
    }
    updateteamscores();
    if (holdtime > 0) {
        statusdialog(getvoforobjective(team, "hold_confirmed"), team, 1);
    }
    showsplashtoteam(team, "cop_captured_friendly");
    showsplashtoteam(otherteam, "cop_captured_enemy");
    if (level.forcedobjectiveindex != -1) {
        giveteamscoreforobjective(team, 1, 0);
        cmd_endgame(team, game["end_reason"]["target_destroyed"]);
    } else if (inovertime()) {
        giveteamscoreforobjective(team, 1, 0);
    } else {
        if (level.cmdrules == 2 && level.currentobjectiveindex == level.midpointobjectiveindex) {
            level.extratime = level.extratime + 90;
            timeleft = namespace_d576b6dc7cef9c62::gettimeremaining();
            setgameendtime(gettime() + int(timeleft));
            level namespace_d576b6dc7cef9c62::resumetimer();
        }
        updatecurrentobjective(newindex);
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5584
// Size: 0x59
function dompoint_cancelholdtimer() {
    if (!istrue(level.persistentdomtimer)) {
        return;
    }
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    if (isdefined(self.holdteam) && self.holdteam == ownerteam) {
        ui_updatezonetimerpausedness(1);
        self notify("domPoint_HoldTimer");
        self.holdteam = undefined;
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x55e4
// Size: 0x1c
function givekscratetoteam(team, pos, streakname) {
    
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5607
// Size: 0x1c
function createkscrate(team, pos, streakname) {
    
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x562a
// Size: 0x305
function cratethink(team, streakname) {
    self endon("restarting_physics");
    self endon("death");
    pos = drop_to_ground(self.origin + (7, 9, 0), 50, -200, (0, 0, 1));
    canister = spawn("script_model", pos + (0, 0, 0));
    canister setmodel("offhand_wm_grenade_smoke");
    canister.angles = self.angles + (-80, 120, 90);
    vfxent = spawn("script_model", canister.origin);
    vfxent setmodel("tag_origin");
    vfxent.angles = self.angles + (0, 30, 0);
    vfxent playloopsound("mp_flare_burn_lp");
    waitframe();
    playfxontag(level._effect["vfx_smk_signal"], vfxent, "tag_origin");
    hintstring = "KILLSTREAKS_HINTS/CRATE_PICKUP";
    var_efe526bf6a23d275 = undefined;
    switch (streakname) {
    case #"hash_4ad475e6e15635bd":
        hintstring = "KILLSTREAKS_HINTS/JUGGERNAUT_PICKUP_GL";
        var_efe526bf6a23d275 = "icon_ks_jugg";
        break;
    case #"hash_28d0236400e33fd0":
        hintstring = "KILLSTREAKS_HINTS/CRUISE_PREDATOR_PICKUP_GL";
        var_efe526bf6a23d275 = "hud_icon_killstreak_cruise_missile";
        break;
    case #"hash_349713b5ad494dda":
        hintstring = "KILLSTREAKS_HINTS/CHOPPER_GUNNER_PICKUP_GL";
        var_efe526bf6a23d275 = "hud_icon_killstreak_apache";
        break;
    }
    self.useobj = namespace_19b4203b51d56488::createhintobject(self.origin + anglestoup(self.angles) * 24, "HINT_BUTTON", var_efe526bf6a23d275, hintstring, -1, undefined, "show", 250, 360, 100, 360);
    self.useobj linkto(self);
    if (streakname == "juggernaut") {
        thread gainedjuggupdater(team);
        thread removedjuggupdater(team);
    }
    for (;;) {
        player = self waittill("captured");
        if (isplayer(player)) {
            player setclientomnvar("ui_securing", 0);
            player.ui_securing = undefined;
        }
        switch (streakname) {
        case #"hash_4ad475e6e15635bd":
            if (!player thread givejuggernaut()) {
                continue;
            }
            break;
        case #"hash_28d0236400e33fd0":
            player thread givekillstreak("cruise_predator", 1);
            wait(3);
            break;
        case #"hash_349713b5ad494dda":
            player thread givekillstreak("chopper_gunner", 1);
            wait(3);
            break;
        }
        player playlocalsound("ammo_crate_use");
        stopfxontag(level._effect["vfx_smk_signal"], vfxent, "tag_origin");
        vfxent stoploopsound();
        vfxent delete();
        vfxent = undefined;
        canister delete();
        canister = undefined;
        namespace_6c578d6ef48f10ef::destroycrate();
    LOC_00000300:
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5936
// Size: 0xb2
function gainedjuggupdater(team) {
    self endon("death");
    foreach (player in level.players) {
        if (player.team == team && istrue(player.isjuggernaut)) {
            self disableplayeruse(player);
        }
    }
    while (1) {
        player = level waittill("gained_juggernaut");
        if (player.team == team) {
            self disableplayeruse(player);
        }
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x59ef
// Size: 0x46
function removedjuggupdater(team) {
    self endon("death");
    while (1) {
        player = level waittill("removed_juggernaut");
        if (player.team == team) {
            self enableplayeruse(player);
        }
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5a3c
// Size: 0x46
function givekillstreak(streakname, var_44632ff01df0aadd) {
    var_16efcf27e6efcbe8 = namespace_58a74e7d54b56e8d::createstreakitemstruct(streakname);
    namespace_58a74e7d54b56e8d::awardkillstreakfromstruct(var_16efcf27e6efcbe8, "other");
    if (istrue(var_44632ff01df0aadd)) {
        wait(0.1);
        self notify("ks_action_4");
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5a89
// Size: 0xab
function bombzone_warningklaxon() {
    level endon("game_ended");
    thread namespace_3bde6869e44a2770::stopsuspensemusic();
    var_ea070ab75fe8c094 = game["music"]["cop_finalpush"].size;
    var_88e74978a3823f5f = randomint(var_ea070ab75fe8c094);
    foreach (player in level.players) {
        player setplayermusicstate(game["music"]["cop_finalpush"][var_88e74978a3823f5f]);
    }
    wait(2);
    wait(16);
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5b3b
// Size: 0x1e5
function bombzone_holdtimer(endtime) {
    if (!isdefined(level.currentobjective)) {
        return;
    }
    level endon("gameEnded");
    level endon("bomb_planted");
    self notify("bombZone_HoldTimer");
    self endon("bombZone_HoldTimer");
    ownerteam = level.currentobjective.defaultownerteam;
    otherteam = getotherteam(level.currentobjective.defaultownerteam)[0];
    namespace_5a22b6f3a56f7e9b::objective_show_team_progress(level.currentobjective.objidnum, otherteam);
    level.timelimitoverride = 0;
    if (endtime > 0) {
        ui_updatezonetimer(endtime);
        wait(endtime);
        if (istrue(level.controltoprogress)) {
            otherteam = getotherteam(level.currentobjective.defaultownerteam)[0];
            var_652aa048043c4946 = 0;
            while (1) {
                if (!var_652aa048043c4946) {
                    var_652aa048043c4946 = 1;
                    ui_updatecmdcapturestatus("overtime", level.currentobjective.stalemate);
                }
                if (level.currentobjective.touchlist[otherteam].size == 0) {
                    break;
                }
                waitframe();
            }
        }
    }
    foreach (player in level.players) {
        player setplayermusicstate("mus_mp_cop_bombplant_end");
    }
    thread namespace_3bde6869e44a2770::suspensemusic();
    newindex = level.currentobjectiveindex;
    team = level.currentobjective namespace_19b4203b51d56488::getownerteam();
    if (team == game["attackers"]) {
        newindex--;
    } else {
        newindex++;
    }
    updatecurrentobjective(newindex);
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x5d27
// Size: 0x80
function bombhandler(player, var_68b7e26f25ca1151, playerteam) {
    if (level.gameended) {
        return;
    }
    if (var_68b7e26f25ca1151 == "explode") {
        self.bombexploded = 1;
        level.currentobjective [[ level.currentobjective.ondisableobjective ]]();
        giveteamscoreforobjective(playerteam, 1, 0);
        cmd_endgame(playerteam, game["end_reason"]["target_destroyed"]);
        goto LOC_0000007e;
    }
LOC_0000007e:
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5dae
// Size: 0x4a
function resetbombzone() {
    namespace_19b4203b51d56488::setusetime(level.planttime);
    namespace_19b4203b51d56488::setvisibleteam("none");
    self.id = "bomb_zone";
    self.useweapon = makeweapon("briefcase_bomb_mp");
    self.bombexploded = undefined;
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5dff
// Size: 0x1bc
function cmd_endgame(winningteam, endreasontext) {
    level.docmdoutro = 1;
    camerastruct = undefined;
    if (level.mapname == "mp_faridah") {
        camerastruct = spawnstruct();
        if (winningteam == "allies") {
            camerastruct.origin = (-207, -4711, 211);
            camerastruct.angles = (7, 64, 0);
        } else if (winningteam == "axis") {
            camerastruct.origin = (1945, 4423, 670);
            camerastruct.angles = (15, 244, 0);
        } else {
            /#
                assertmsg("cmd_endGame called when the game tied -- unexpected behavior");
            #/
        }
    }
    foreach (player in level.players) {
        if (!isai(player)) {
            player setclientomnvar("ui_objective_pinned_text_param", 0);
        }
        player thread playendofmatchtransition(camerastruct);
    }
    winnerscore = game["teamScores"][winningteam];
    loserscore = game["teamScores"][getotherteam(winningteam)[0]];
    if (loserscore > winnerscore) {
        var_36f3228e1d630f1b = loserscore - winnerscore + 1;
        giveteamscoreforobjective(winningteam, var_36f3228e1d630f1b, 0);
    }
    thread namespace_d576b6dc7cef9c62::endgame(winningteam, endreasontext);
    wait(0.65);
    level notify("allow_bomb_explosion");
    wait(5);
    level notify("cmd_continue_game_end");
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5fc2
// Size: 0x17f
function dompoint_onbeginuse(player) {
    dompoint_cancelholdtimer();
    namespace_98b55913d2326ac8::dompoint_onusebegin(player);
    self.didstatusnotify = 1;
    thread updateflares(player.team);
    ui_updatecmdcapturestatus(player.team, self.stalemate);
    if (player.team == game["attackers"]) {
        if (level.currentobjectiveindex == 0 || level.currentobjectiveindex == 4) {
            var_13050a26e9e3095a = namespace_19b4203b51d56488::getownerteam();
            if (player.team != var_13050a26e9e3095a) {
                player getselfobjcaptureddialog("planting");
            } else {
                player getselfobjcaptureddialog("defusing");
            }
            goto LOC_000000e2;
        }
    LOC_000000e2:
    }
LOC_000000e2:
    otherteam = getotherteam(player.team)[0];
    if (otherteam == namespace_19b4203b51d56488::getownerteam()) {
        statusdialog(getvoforobjective(player.team, "enemy_cap"), otherteam, 0);
    } else {
        statusdialog(getvoforobjective(player.team, "enemy_sec"), otherteam, 0);
    }
    foreach (player in level.players) {
        updatefloorbrush(player);
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6148
// Size: 0x288
function dompoint_onuse(var_22282e7d48ca3400) {
    if (istrue(level.persistentdomtimer)) {
        ui_updatezonetimerpausedness(0);
        self.lastcaptime = gettime();
        self.firstcapture = 0;
    }
    namespace_98b55913d2326ac8::dompoint_onuse(var_22282e7d48ca3400);
    team = namespace_19b4203b51d56488::getownerteam();
    thread updateflares(team);
    foreach (player in level.players) {
        updatefloorbrush(player);
    }
    level.usestartspawns = 0;
    /#
        assert(team != "neutral");
    #/
    otherteam = getotherteam(team)[0];
    thread printandsoundoneveryone(team, otherteam, undefined, undefined, "mp_dom_flag_captured", "mp_dom_flag_lost", var_22282e7d48ca3400);
    if (level.cmdrules == 2) {
        if (level.currentobjectiveindex == level.midpointobjectiveindex) {
            level.cmdattackingteam = team;
            level.cmddefendingteam = otherteam;
            level namespace_d576b6dc7cef9c62::pausetimer();
        } else {
            level.extratime = level.extratime + 90;
            timeleft = namespace_d576b6dc7cef9c62::gettimeremaining();
            setgameendtime(gettime() + int(timeleft));
        }
    }
    if (level.currentobjectiveindex == 0) {
        var_13050a26e9e3095a = level.objectives["_b"] namespace_19b4203b51d56488::getownerteam();
        if (team != var_13050a26e9e3095a) {
            level.objectives["_b"] bombzone_onuseplantobject(var_22282e7d48ca3400);
        } else {
            level.objectives["_b"] bombzone_onusedefuseobject(var_22282e7d48ca3400);
        }
    } else if (level.currentobjectiveindex == 4) {
        var_13050a26e9e3095a = level.objectives["_a"] namespace_19b4203b51d56488::getownerteam();
        if (team != var_13050a26e9e3095a) {
            level.objectives["_a"] bombzone_onuseplantobject(var_22282e7d48ca3400);
        } else {
            level.objectives["_a"] bombzone_onusedefuseobject(var_22282e7d48ca3400);
        }
    } else {
        thread dompoint_holdtimer(team, var_22282e7d48ca3400);
        showsplashtoteam(team, "cop_hold_friendly");
        showsplashtoteam(otherteam, "cop_hold_enemy");
    }
    if (self == level.currentobjective) {
        ui_updatecmdcapturestatus("neutral", 0);
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x63d7
// Size: 0x1c8
function dompoint_onenduse(team, player, success) {
    if (self != level.currentobjective) {
        return;
    }
    namespace_98b55913d2326ac8::dompoint_onuseend(team, player, success);
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    state = ter_op(ownerteam == "neutral", "idle", ownerteam);
    thread updateflares(state);
    if (level.cmdrules == 2) {
        if (level.currentobjectiveindex == level.midpointobjectiveindex) {
            ownerteam = namespace_19b4203b51d56488::getownerteam();
            ui_updatecmdcapturestatus("neutral", 0);
            if (istrue(level.persistentdomtimer) && self.objectivekey != "0" && self.objectivekey != "4") {
                if (ownerteam != "neutral") {
                    ui_updatezonetimerpausedness(0);
                    self.lastcaptime = gettime();
                    thread dompoint_holdtimer(ownerteam);
                }
            }
        }
    } else if (!success) {
        ownerteam = namespace_19b4203b51d56488::getownerteam();
        ui_updatecmdcapturestatus("neutral", 0);
        if (istrue(level.persistentdomtimer) && self.objectivekey != "0" && self.objectivekey != "4") {
            if (ownerteam != "neutral") {
                ui_updatezonetimerpausedness(0);
                self.lastcaptime = gettime();
                thread dompoint_holdtimer(ownerteam);
            }
        }
    }
    foreach (player in level.players) {
        updatefloorbrush(player);
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x65a6
// Size: 0x10e
function dompoint_oncontested() {
    if (self != level.currentobjective) {
        return;
    }
    dompoint_cancelholdtimer();
    namespace_98b55913d2326ac8::dompoint_oncontested();
    thread updateflares("contested");
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    if (ownerteam == "neutral") {
        if (level.cmdrules == 2 && level.currentobjectiveindex == level.midpointobjectiveindex) {
            level namespace_d576b6dc7cef9c62::resumetimer();
        }
    }
    ui_updatecmdcapturestatus(ownerteam, 1);
    notifyteam = ownerteam;
    if (ownerteam == "neutral") {
        notifyteam = self.claimteam;
    }
    if (notifyteam != "none") {
        statusdialog("cop_obj_contested", notifyteam, 0);
    }
    foreach (player in level.players) {
        updatefloorbrush(player);
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x66bb
// Size: 0x1da
function dompoint_onuncontested(lastclaimteam) {
    if (self != level.currentobjective) {
        return;
    }
    namespace_98b55913d2326ac8::dompoint_onuncontested(lastclaimteam);
    self.didstatusnotify = 1;
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    if (ownerteam == "neutral") {
        if (level.cmdrules == 2 && level.currentobjectiveindex == level.midpointobjectiveindex) {
            level namespace_d576b6dc7cef9c62::resumetimer();
        }
    }
    state = ter_op(ownerteam == "neutral", "idle", ownerteam);
    thread updateflares(state);
    if (level.cmdrules == 2) {
        if (level.currentobjectiveindex == level.midpointobjectiveindex) {
            if (ownerteam != "neutral" && self.touchlist[getotherteam(ownerteam)[0]].size == 0) {
                ui_updatezonetimerpausedness(0);
                self.lastcaptime = gettime();
                thread dompoint_holdtimer(ownerteam);
            }
        }
    } else if (istrue(level.persistentdomtimer) && level.currentobjectiveindex != 0 && level.currentobjectiveindex != 4) {
        if (ownerteam != "neutral" && self.touchlist[getotherteam(ownerteam)[0]].size == 0) {
            ui_updatezonetimerpausedness(0);
            self.lastcaptime = gettime();
            thread dompoint_holdtimer(ownerteam);
        }
    }
    ui_updatecmdcapturestatus("neutral", 0);
    foreach (player in level.players) {
        updatefloorbrush(player);
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x689c
// Size: 0x99
function dompoint_ondisableobjective() {
    namespace_19b4203b51d56488::allowuse("none");
    namespace_19b4203b51d56488::disableobject();
    namespace_19b4203b51d56488::resetcaptureprogress();
    namespace_19b4203b51d56488::releaseid();
    delaythread(0.1, &disabledomflagscriptable);
    thread updateflares("off");
    foreach (player in level.players) {
        updatefloorbrush(player, 1);
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x693c
// Size: 0x1d5
function dompoint_onenableobjective() {
    namespace_19b4203b51d56488::requestid(1, 1);
    namespace_5a22b6f3a56f7e9b::objective_set_play_intro(self.objidnum, 1);
    namespace_5a22b6f3a56f7e9b::objective_set_play_outro(self.objidnum, 1);
    namespace_19b4203b51d56488::enableobject();
    namespace_19b4203b51d56488::setvisibleteam("any");
    namespace_19b4203b51d56488::allowuse("none");
    namespace_19b4203b51d56488::setobjectivestatusicons(level.icontarget);
    if (istrue(level.persistentdomtimer)) {
        if (!isdefined(self.teamholdtimers)) {
            self.teamholdtimers = [];
        }
        self.teamholdtimers["allies"] = self.holdtime;
        self.teamholdtimers["axis"] = self.holdtime;
        self.firstcapture = 1;
        self.holdteam = undefined;
    }
    if (isdefined(self.defaultownerteam)) {
        namespace_19b4203b51d56488::setownerteam(self.defaultownerteam);
        thread namespace_98b55913d2326ac8::updateflagstate(self.defaultownerteam, 0);
        thread updateflares(self.defaultownerteam);
    } else {
        namespace_19b4203b51d56488::setownerteam("neutral");
        thread namespace_98b55913d2326ac8::updateflagstate("idle", 0);
        thread updateflares("idle");
    }
    if (level.currentobjectiveindex == 0 || level.currentobjectiveindex == 4) {
        thread bombzone_warningklaxon();
    }
    if (getdvarint(@"hash_3bfe19e3234d5dff", 0) != 0) {
        namespace_662734e7fa8a8b94::tryspawnneutralbradleycmd(level.currentobjectiveindex);
    }
    foreach (player in level.players) {
        updatefloorbrush(player);
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6b18
// Size: 0xf1
function dompoint_onactivateobjective() {
    playsoundonplayers("mp_combat_outpost_activateobj");
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    ui_updatecmdownerteam(ownerteam);
    ui_updatecmdcapturestatus("neutral", 0);
    namespace_19b4203b51d56488::allowuse("enemy");
    thread awardcapturepoints();
    level.flagcapturetime = self.captureduration;
    if (self.tierindex == 2) {
        if (level.cmdrules == 1) {
            level.flagcapturetime = 5;
        }
        namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefend, level.iconcapture);
    } else {
        namespace_19b4203b51d56488::setobjectivestatusicons(level.iconneutral);
    }
    if (level.cmdrules == 1) {
        if (level.currentobjectiveindex == 0 || level.currentobjectiveindex == 4) {
            thread bombzone_holdtimer(self.holdtime);
        }
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6c10
// Size: 0x14
function bombzone_onbeginuse(player) {
    namespace_fa795886dfc5f58a::bombzone_onbeginuse(player);
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x6c2b
// Size: 0x26
function bombzone_onenduse(team, player, result) {
    namespace_fa795886dfc5f58a::bombzone_onenduse(team, player, result);
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6c58
// Size: 0x215
function bombzone_onuseplantobject(var_22282e7d48ca3400) {
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    otherteam = getotherteam(ownerteam)[0];
    namespace_5a22b6f3a56f7e9b::objective_show_team_progress(level.currentobjective.objidnum, ownerteam);
    showsplashtoteam("all", "cop_planted");
    level.flagcapturetime = 15;
    if (istrue(level.persistentbombtimer)) {
        if (!isdefined(level.basefusetimers)) {
            level.basefusetimers = [];
            level.basefusetimers["allies"] = level.bombtimer;
            level.basefusetimers["axis"] = level.bombtimer;
        }
        level.bombtimer = level.basefusetimers[ownerteam];
        level.lastbombplanttime = gettime();
    }
    namespace_fa795886dfc5f58a::bombzone_onuseplantobject(var_22282e7d48ca3400);
    var_6c7470a87c232ec5 = game["music"]["cop_bombplant"].size;
    var_59dcf2637fae66ae = randomint(var_6c7470a87c232ec5);
    foreach (player in level.players) {
        player setplayermusicstate(game["music"]["cop_bombplant"][var_59dcf2637fae66ae]);
    }
    if (0) {
        giveteamscoreforobjective(var_22282e7d48ca3400.team, 1, 0);
    }
    statusdialog(getvoforobjective(ownerteam, "bomb_planted"), ownerteam, 1);
    statusdialog(getvoforobjective(otherteam, "bomb_planted"), otherteam, 1);
    if (isdefined(level.zoneendtime)) {
        level.zoneendtime = int(level.zoneendtime - gettime());
    }
    if (level.cmdrules == 1) {
        ui_updatebombtimer();
    }
    ui_updatecmdownerteam(var_22282e7d48ca3400.team);
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6e74
// Size: 0x184
function bombzone_onusedefuseobject(player) {
    if (!level.bombplanted) {
        return;
    }
    showsplashtoteam("all", "cop_defused");
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    otherteam = getotherteam(ownerteam)[0];
    level.flagcapturetime = 5;
    if (istrue(level.persistentbombtimer)) {
        level.basefusetimers[ownerteam] = level.basefusetimers[ownerteam] - (gettime() - level.lastbombplanttime) / 1000;
    }
    level.bombsplanted = level.bombsplanted - 1;
    if (self.objectivekey == "_a") {
        level.aplanted = 0;
    } else {
        level.bplanted = 0;
    }
    namespace_fa795886dfc5f58a::bombzone_onusedefuseobject(player);
    if (getotherteam(player.team)[0] == "allies") {
    }
    namespace_19b4203b51d56488::setvisibleteam("none");
    statusdialog(getvoforobjective(ownerteam, "bomb_defused"), ownerteam, 1);
    statusdialog(getvoforobjective(otherteam, "bomb_defused"), otherteam, 1);
    player notify("bomb_defused" + self.objectivekey);
    self notify("defused");
    resetbombzone();
    if (isdefined(level.zoneendtime)) {
        thread bombzone_holdtimer(level.zoneendtime / 1000);
    }
    ui_updatecmdownerteam(player.team);
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6fff
// Size: 0x16
function bombzone_ondisableobjective() {
    namespace_19b4203b51d56488::disableobject();
    namespace_19b4203b51d56488::allowuse("none");
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x701c
// Size: 0x32
function bombzone_onenableobjective() {
    namespace_19b4203b51d56488::enableobject();
    namespace_19b4203b51d56488::setvisibleteam("any");
    namespace_19b4203b51d56488::allowuse("none");
    namespace_19b4203b51d56488::setobjectivestatusicons(level.icontarget);
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7055
// Size: 0x82
function bombzone_onactivateobjective() {
    playsoundonplayers("mp_combat_outpost_activateobj");
    ui_updatecmdownerteam("neutral");
    ui_updatecmdcapturestatus("neutral", 0);
    level.planttime = self.captureduration;
    level.defusetime = self.captureduration;
    namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefend, level.iconcapture);
    namespace_19b4203b51d56488::allowuse("enemy");
    thread bombzone_holdtimer(self.holdtime);
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x70de
// Size: 0x39
function ui_updatezonetimer(seconds) {
    level.zoneendtime = int(gettime() + 1000 * seconds);
    setomnvar("ui_hardpoint_timer", level.zoneendtime);
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x711e
// Size: 0x32
function ui_updatebombtimer() {
    var_f28399727742eb23 = int(gettime() + 1000 * level.bombtimer);
    setomnvar("ui_hardpoint_timer", var_f28399727742eb23);
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7157
// Size: 0x18
function ui_updatezonetimerpausedness(ispaused) {
    setomnvar("ui_objective_timer_stopped", ispaused);
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7176
// Size: 0x78
function getownerteamplayer(ownerteam) {
    var_a3010f9814a40c8d = undefined;
    foreach (player in level.players) {
        if (player.team == ownerteam) {
            return player;
        }
    }
    return var_a3010f9814a40c8d;
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x71f6
// Size: 0xc7
function ui_updatecmdcapturestatus(status, contested) {
    var_cabc886d846dd979 = -1;
    if (istrue(level.inobjectiveot)) {
        if (contested) {
            var_cabc886d846dd979 = -4;
        } else {
            var_cabc886d846dd979 = -5;
        }
    } else if (contested) {
        var_cabc886d846dd979 = -2;
    } else {
        switch (status) {
        case #"hash_5f54b9bf7583687f":
            var_cabc886d846dd979 = 2;
            break;
        case #"hash_7c2d091e6337bf54":
            var_cabc886d846dd979 = 1;
            break;
        case #"hash_3bf8ec5fe1d42da8":
            var_cabc886d846dd979 = -3;
            break;
        case #"hash_4a79ea9678ed059e":
            var_cabc886d846dd979 = -4;
            break;
        case #"hash_c312107e6bce703c":
        default:
            break;
        }
    }
    setomnvar("ui_cmd_capture_team", var_cabc886d846dd979);
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x72c4
// Size: 0x82
function ui_updatecmdownerteam(ownerteam) {
    var_cabc886d846dd979 = -1;
    switch (ownerteam) {
    case #"hash_5f54b9bf7583687f":
        var_cabc886d846dd979 = 2;
        break;
    case #"hash_7c2d091e6337bf54":
        var_cabc886d846dd979 = 1;
        break;
    case #"hash_3bf8ec5fe1d42da8":
        var_cabc886d846dd979 = -3;
        break;
    case #"hash_c312107e6bce703c":
    default:
        break;
    }
    setomnvar("ui_cmd_owner_team", var_cabc886d846dd979);
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x734d
// Size: 0x42
function ui_updatecmdprogress() {
    while (1) {
        if (isdefined(level.currentobjective)) {
            setomnvar("ui_cmd_capture_progress", level.currentobjective namespace_19b4203b51d56488::getcaptureprogress());
        } else {
            setomnvar("ui_cmd_capture_progress", 0);
        }
        waitframe();
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7396
// Size: 0x108
function ui_updatecmdholdprogress() {
    self notify("ui_updateCMDHoldProgress");
    self endon("ui_updateCMDHoldProgress");
    while (1) {
        if (isdefined(level.currentobjective) && isdefined(level.currentobjective.teamholdtimers) && isdefined(level.currentobjective.holdtime) && level.currentobjective.holdtime > 0) {
            setomnvar("ui_cmd_owner_progress_allies", 1 - level.currentobjective.teamholdtimers["allies"] / level.currentobjective.holdtime);
            setomnvar("ui_cmd_owner_progress_axis", 1 - level.currentobjective.teamholdtimers["axis"] / level.currentobjective.holdtime);
        } else {
            setomnvar("ui_cmd_owner_progress_allies", 0);
            setomnvar("ui_cmd_owner_progress_axis", 0);
        }
        waitframe();
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x74a5
// Size: 0x2f1
function getcurrentvalue() {
    if (!isdefined(level.currentobjective)) {
        return 0.5;
    }
    var_3ba14998c431ff5a = getcenterfrac(level.currentobjectiveindex);
    var_d53f69b9843525d5 = 0;
    ownerteam = level.currentobjective namespace_19b4203b51d56488::getownerteam();
    var_f5576fb178af593e = 0;
    var_787c1caffff51c2b = 0.03;
    var_fe62e581aef8117f = 0;
    if (isdefined(level.activationdelaystarttime) && level.previousobjectiveindex != level.currentobjectiveindex) {
        if (isdefined(level.currentobjective.defaultownerteam)) {
            var_d53f69b9843525d5 = var_787c1caffff51c2b;
            if (ownerteam == "allies") {
                var_d53f69b9843525d5 = var_d53f69b9843525d5 * -1;
            }
            var_787c1caffff51c2b = var_787c1caffff51c2b * 2;
        }
        var_f5576fb178af593e = 1;
        currenttime = gettime();
        var_5e8dbd8520d11362 = (currenttime - level.activationdelaystarttime) / level.currentobjective.activationdelay * 1000;
        var_fe62e581aef8117f = (abs(getcenterfrac(level.previousobjectiveindex) - var_3ba14998c431ff5a) - var_787c1caffff51c2b) * var_5e8dbd8520d11362;
        if (level.currentobjectiveindex < level.previousobjectiveindex) {
            var_fe62e581aef8117f = var_fe62e581aef8117f * -1;
            var_787c1caffff51c2b = var_787c1caffff51c2b * -1;
        }
        var_3ba14998c431ff5a = getcenterfrac(level.previousobjectiveindex);
    } else {
        ownerteam = level.currentobjective namespace_19b4203b51d56488::getownerteam();
        if (ownerteam != "neutral") {
            var_d53f69b9843525d5 = var_787c1caffff51c2b;
            if (ownerteam == "allies") {
                var_d53f69b9843525d5 = var_d53f69b9843525d5 * -1;
            }
            if (isdefined(level.currentobjective.claimteam) && level.currentobjective.claimteam != "none") {
                if (level.currentobjective.claimteam != ownerteam) {
                    var_787c1caffff51c2b = var_787c1caffff51c2b * 2;
                    var_f5576fb178af593e = level.currentobjective namespace_19b4203b51d56488::getcaptureprogress();
                    if (level.currentobjective.claimteam == "allies") {
                        var_f5576fb178af593e = var_f5576fb178af593e * -1;
                    }
                }
            }
        } else {
            var_f5576fb178af593e = level.currentobjective namespace_19b4203b51d56488::getcaptureprogress();
            if (isdefined(level.currentobjective.claimteam) && level.currentobjective.claimteam != "none") {
                if (level.currentobjective.claimteam == "allies") {
                    var_f5576fb178af593e = var_f5576fb178af593e * -1;
                }
            } else if (isdefined(level.currentobjective.lastclaimteam)) {
                if (level.currentobjective.lastclaimteam == "allies") {
                    var_f5576fb178af593e = var_f5576fb178af593e * -1;
                }
            }
        }
    }
    return var_3ba14998c431ff5a + var_d53f69b9843525d5 + var_f5576fb178af593e * var_787c1caffff51c2b + var_fe62e581aef8117f;
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x779e
// Size: 0x94
function getcenterfrac(index) {
    var_3ba14998c431ff5a = 0;
    switch (index) {
    case 0:
        var_3ba14998c431ff5a = 0;
        break;
    case 1:
        var_3ba14998c431ff5a = 0.25;
        break;
    case 2:
        var_3ba14998c431ff5a = 0.5;
        break;
    case 3:
        var_3ba14998c431ff5a = 0.75;
        break;
    case 4:
        var_3ba14998c431ff5a = 1;
        break;
    }
    return var_3ba14998c431ff5a;
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x783a
// Size: 0x24
function updateteamscores() {
    if (-1) {
        _setteamscore("allies", 0, 0);
        _setteamscore("axis", 0, 0);
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7865
// Size: 0x1f5
function spawnjuggcate(team, role) {
    var_33a4ecc6b9f0fa5e = level.juggspawnbehavior;
    if (role == "attacker" && var_33a4ecc6b9f0fa5e != 1 && var_33a4ecc6b9f0fa5e != 3) {
        return;
    }
    if (role == "defender" && var_33a4ecc6b9f0fa5e != 2 && var_33a4ecc6b9f0fa5e != 3) {
        return;
    }
    if (!isdefined(level.juggcrates)) {
        level.juggcrates = [];
        level.juggcrates["allies"] = [];
        level.juggcrates["axis"] = [];
    }
    if (isdefined(level.juggcrates[team][role])) {
        return;
    }
    pos = undefined;
    switch (level.mapname) {
    case #"hash_ecbb96ade87e6efa":
        if (role == "attacker") {
            if (team == "allies") {
                pos = (250, -2040, 215);
            } else {
                pos = (786, 2413, 260);
            }
        } else if (role == "defender") {
            if (team == "allies") {
                pos = (25, -4630, 10);
            } else {
                pos = (1480, 4375, -40);
            }
        }
        break;
    case #"hash_3d15d48cf23a3f75":
        if (role == "attacker") {
            if (team == "allies") {
                pos = (2775, 2375, 360);
            } else {
                pos = (-60, -260, 450);
            }
        } else if (role == "defender") {
            if (team == "allies") {
                pos = (-2680, -855, 250);
            } else {
                pos = (2365, 4360, 360);
            }
        }
        break;
    }
    if (isdefined(pos)) {
        level.juggcrates[team][role] = givekscratetoteam(team, pos, "juggernaut");
        level.juggcrates[team][role] thread removeondeath(team, role);
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7a61
// Size: 0x30
function removeondeath(team, role) {
    level endon("game_ended");
    self waittill("death");
    level.juggcrates[team][role] = undefined;
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7a98
// Size: 0x233
function givejuggernaut() {
    if (!isplayer(self)) {
        return 0;
    }
    if (istrue(self.isjuggernaut)) {
        return 0;
    }
    if (isdefined(self.lightarmorhp)) {
        namespace_282db5a41b643e19::unsetlightarmor();
    }
    namespace_41cb45263e591751::setlightarmorvalue(self, 500, 1, 0);
    namespace_3bbb5a98b932c46f::setplantedequipmentuse(0);
    val::set("juggernaut", "offhand_weapons", 0);
    val::set("juggernaut", "weapon_pickup", 0);
    if (_hasperk("specialty_explosivebullets")) {
        removeperk("specialty_explosivebullets");
    }
    _takeweapon(self.primaryweapon);
    _takeweapon(self.secondaryweapon);
    primaryweapon = "iw8_lm_kilo121_mp";
    _giveweapon(primaryweapon);
    self givemaxammo(primaryweapon);
    _switchtoweapon(primaryweapon);
    self.juggoverlay = newclienthudelem(self);
    self.juggoverlay.x = 0;
    self.juggoverlay.y = 0;
    self.juggoverlay.alignx = "left";
    self.juggoverlay.aligny = "top";
    self.juggoverlay.horzalign = "fullscreen";
    self.juggoverlay.vertalign = "fullscreen";
    self.juggoverlay setshader("gasmask_overlay_delta", 640, 480);
    self.juggoverlay.sort = -10;
    self.juggoverlay.archived = 1;
    self.juggoverlay.alpha = 1;
    self.health = self.maxhealth;
    self.isjuggernaut = 1;
    self.movespeedscaler = 0.75;
    giveperk("specialty_scavenger");
    giveperk("specialty_quickdraw");
    giveperk("specialty_sharp_focus");
    thread juggernautsounds();
    thread juggremover();
    level notify("gained_juggernaut", self);
    return 1;
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7cd3
// Size: 0x26
function juggernautsounds() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    self endon("jugg_removed");
    while (1) {
        wait(3);
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7d00
// Size: 0xe3
function juggremover() {
    self endon("disconnect");
    thread removejuggongameended();
    thread removejuggonteamchangeordeath();
    self waittill("should_remove_jugg");
    if (isdefined(self.lightarmorhp)) {
        namespace_282db5a41b643e19::unsetlightarmor();
    }
    namespace_3bbb5a98b932c46f::setplantedequipmentuse(1);
    val::function_c9d0b43701bdba00("juggernaut");
    self.juggoverlay destroy();
    _takeweapon("iw8_lm_kilo121_mp");
    _giveweapon(self.primaryweapon);
    _giveweapon(self.secondaryweapon);
    _switchtoweapon(self.primaryweapon);
    self.movespeedscaler = 1;
    removeperk("specialty_scavenger");
    removeperk("specialty_quickdraw");
    removeperk("specialty_sharp_focus");
    self.isjuggernaut = 0;
    level notify("removed_juggernaut", self);
    self notify("jugg_removed");
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7dea
// Size: 0x21
function removejuggongameended() {
    self endon("disconnect");
    self endon("jugg_removed");
    level waittill("game_ended");
    self notify("should_remove_jugg");
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7e12
// Size: 0x3b
function removejuggonteamchangeordeath() {
    level endon("game_ended");
    self endon("disconnect");
    self endon("jugg_removed");
    waittill_any_4("death", "joined_team", "joined_spectators", "lost_juggernaut");
    self notify("should_remove_jugg");
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7e54
// Size: 0x101
function updatefloorbrush(player, disabled) {
    if (!isdefined(self.neutralbrush)) {
        return;
    }
    ownerteam = self.ownerteam;
    claimteam = self.claimteam;
    var_8e879faf3052e0d2 = player.team;
    iscodcaster = player iscodcaster();
    if (iscodcaster) {
        var_8e879faf3052e0d2 = player function_638eebeff841e16a();
    }
    if (istrue(disabled)) {
        hidebrushes(player);
    } else if (istrue(self.stalemate)) {
        showcontestedbrush(player);
    } else if (ownerteam == "neutral") {
        if (claimteam != "none") {
            if (var_8e879faf3052e0d2 == claimteam) {
                showfriendlybrush(player);
            } else {
                showenemybrush(player);
            }
        } else {
            showneutralbrush(player);
        }
    } else if (var_8e879faf3052e0d2 == ownerteam) {
        showfriendlybrush(player);
    } else {
        showenemybrush(player);
    }
    updatecapturebrush(player);
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7f5c
// Size: 0xaa
function updatecapturebrush(player) {
    if (1) {
        return;
    }
    if (!isdefined(self.neutralbrush)) {
        return;
    }
    var_2e0bdb36f81a37e4 = namespace_19b4203b51d56488::getclaimteam();
    var_8e879faf3052e0d2 = player.team;
    iscodcaster = player iscodcaster();
    if (iscodcaster) {
        var_8e879faf3052e0d2 = player function_638eebeff841e16a();
    }
    if (istrue(self.stalemate)) {
        hidecapturebrush(player);
    } else if (var_2e0bdb36f81a37e4 == "none") {
        hidecapturebrush(player);
    } else if (var_8e879faf3052e0d2 == var_2e0bdb36f81a37e4) {
        showfriendlycapturebrush(player);
    } else {
        showenemycapturebrush(player);
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x800d
// Size: 0x14d
function showneutralbrush(player) {
    foreach (brush in self.friendlybrush) {
        brush hidefromplayer(player);
    }
    foreach (brush in self.enemybrush) {
        brush hidefromplayer(player);
    }
    foreach (brush in self.contestedbrush) {
        brush hidefromplayer(player);
    }
    foreach (brush in self.neutralbrush) {
        brush showtoplayer(player);
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8161
// Size: 0x14d
function showfriendlybrush(player) {
    foreach (brush in self.friendlybrush) {
        brush showtoplayer(player);
    }
    foreach (brush in self.enemybrush) {
        brush hidefromplayer(player);
    }
    foreach (brush in self.contestedbrush) {
        brush hidefromplayer(player);
    }
    foreach (brush in self.neutralbrush) {
        brush hidefromplayer(player);
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x82b5
// Size: 0x14d
function showenemybrush(player) {
    foreach (brush in self.friendlybrush) {
        brush hidefromplayer(player);
    }
    foreach (brush in self.enemybrush) {
        brush showtoplayer(player);
    }
    foreach (brush in self.contestedbrush) {
        brush hidefromplayer(player);
    }
    foreach (brush in self.neutralbrush) {
        brush hidefromplayer(player);
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8409
// Size: 0x14d
function showcontestedbrush(player) {
    foreach (brush in self.friendlybrush) {
        brush hidefromplayer(player);
    }
    foreach (brush in self.enemybrush) {
        brush hidefromplayer(player);
    }
    foreach (brush in self.contestedbrush) {
        brush showtoplayer(player);
    }
    foreach (brush in self.neutralbrush) {
        brush hidefromplayer(player);
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x855d
// Size: 0x14d
function hidebrushes(player) {
    foreach (brush in self.friendlybrush) {
        brush hidefromplayer(player);
    }
    foreach (brush in self.enemybrush) {
        brush hidefromplayer(player);
    }
    foreach (brush in self.contestedbrush) {
        brush hidefromplayer(player);
    }
    foreach (brush in self.neutralbrush) {
        brush hidefromplayer(player);
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x86b1
// Size: 0xad
function showfriendlycapturebrush(player) {
    foreach (brush in self.friendlypulsebrush) {
        brush showtoplayer(player);
    }
    foreach (brush in self.enemypulsebrush) {
        brush hidefromplayer(player);
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8765
// Size: 0xad
function showenemycapturebrush(player) {
    foreach (brush in self.friendlypulsebrush) {
        brush hidefromplayer(player);
    }
    foreach (brush in self.enemypulsebrush) {
        brush showtoplayer(player);
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8819
// Size: 0xad
function hidecapturebrush(player) {
    foreach (brush in self.friendlypulsebrush) {
        brush hidefromplayer(player);
    }
    foreach (brush in self.enemypulsebrush) {
        brush hidefromplayer(player);
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x88cd
// Size: 0x3
function updatefloorbrushwaitforjoined() {
    
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x88d7
// Size: 0x16
function applythermal() {
    self visionsetthermalforplayer("proto_apache_flir_mp");
    self thermalvisionon();
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x88f4
// Size: 0xa
function removethermal() {
    self thermalvisionoff();
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8905
// Size: 0x114
function startspectatorview() {
    waitframe();
    updatesessionstate("spectator");
    namespace_5aeecefc462876::setdisabled();
    if (isdefined(self.lastdeathangles)) {
        self setplayerangles(self.lastdeathangles);
    }
    wait(0.1);
    setdof_default();
    var_25ac223966c5537 = level.spectatorcameras[level.currentspectatorcamref][self.team];
    var_dead2082432cecc = var_25ac223966c5537.origin;
    var_6788dc28320974a = var_25ac223966c5537.angles;
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

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8a20
// Size: 0x18
function dohalfwayflash() {
    wait(0.4);
    thread playslamzoomflash();
    applythermal();
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8a3f
// Size: 0x20
function endspectatorview() {
    if (!isdefined(self.spectatorcament)) {
        return;
    }
    removethermal();
    thread runslamzoomonspawn();
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8a66
// Size: 0x109
function updatespectatorcamera(var_ca2c833762e5466c) {
    level.currentspectatorcamref = var_ca2c833762e5466c;
    foreach (player in level.players) {
        if (isdefined(player.spectatorcament)) {
            team = player.team;
            var_b5ecd32577a250ad = getdvarint(@"hash_8bfd75900211e88b", -1);
            if (var_b5ecd32577a250ad != -1) {
                team = ter_op(var_b5ecd32577a250ad == 0, "allies", "axis");
            }
            var_5940f376a254619d = level.spectatorcameras[level.currentspectatorcamref][team];
            player.spectatorcament movecameratomappos(player, var_5940f376a254619d.origin, var_5940f376a254619d.angles);
        }
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x8b76
// Size: 0x10d
function movecameratomappos(player, var_9813182985677b23, finalangles) {
    player endon("spawned_player");
    movetime = 1;
    rotatetime = 1;
    self moveto(var_9813182985677b23, 1, 0.5, 0.5);
    player playlocalsound("mp_cmd_camera_zoom_out");
    player setclienttriggeraudiozonepartialwithfade("spawn_cam", 0.5, "mix");
    self rotateto(finalangles, 1, 0.5, 0.5);
    player thread startoperatorsound();
    wait(1.1);
    var_ae753108f3dff053 = anglestoforward(finalangles) * 300;
    var_ae753108f3dff053 = var_ae753108f3dff053 * (1, 1, 0);
    if (isdefined(player) && isdefined(player.spectatorcament)) {
        self moveto(var_9813182985677b23 + var_ae753108f3dff053, 15, 1, 1);
        player earthquakeforplayer(0.03, 15, var_9813182985677b23 + var_ae753108f3dff053, 1000);
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8c8a
// Size: 0x164
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
    self visionsetnakedforplayer("", 0);
    thread playslamzoomflash();
    updatesessionstate("playing");
    self cameraunlink();
    self.spectatorcament delete();
    wait(1);
    currenttime = gettime();
    if (!isdefined(self.lastsitreptime) || currenttime < self.lastsitreptime + 30000 || currenttime < level.lastteamstatustime[self.team] + 5000) {
        return;
    }
    namespace_944ddf7b8df1b0e3::sitrepdialogonplayer(getsitreplocname());
    thread playselfbattlechatter(self, "plrresponse_affirm", "cop_affirm_2d", 2.5, 1);
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8df5
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

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8ed4
// Size: 0x18
function startoperatorsound() {
    self endon("game_ended");
    self waittill("spawned_player");
    wait(0.5);
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8ef3
// Size: 0x65
function ongameended() {
    level waittill("game_ended");
    foreach (objective in level.objectives) {
        objective namespace_19b4203b51d56488::setvisibleteam("none");
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8f5f
// Size: 0xec
function playendofmatchtransition(camerastruct) {
    self setclientomnvar("ui_total_fade", 0);
    waitframe();
    var_64423461fe38ecb3 = 10;
    var_dc7a4ca1fb2db25a = var_64423461fe38ecb3;
    for (var_dc7a4ca1fb2db25a = 1; var_dc7a4ca1fb2db25a <= var_64423461fe38ecb3; var_dc7a4ca1fb2db25a++) {
        waitframe();
        self setclientomnvar("ui_total_fade", var_dc7a4ca1fb2db25a / var_64423461fe38ecb3);
    }
    if (isreallyalive(self) && !isusingremote() && isdefined(camerastruct)) {
        var_58f345c26a2e8be3 = distance2dsquared(self.origin, camerastruct.origin);
        if (var_58f345c26a2e8be3 > 40000) {
            body = self cloneplayer(0);
            body startragdoll(1);
        }
    }
    thread namespace_99ac021a7547cae3::spawnintermission(camerastruct, "spectator");
    waitframe();
    var_64423461fe38ecb3 = 4;
    var_dc7a4ca1fb2db25a = var_64423461fe38ecb3;
    for (var_dc7a4ca1fb2db25a = var_64423461fe38ecb3 - 1; var_dc7a4ca1fb2db25a >= 0; var_dc7a4ca1fb2db25a--) {
        waitframe();
        self setclientomnvar("ui_total_fade", var_dc7a4ca1fb2db25a / var_64423461fe38ecb3);
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9052
// Size: 0x2e
function getsitreplocname() {
    dialog = "sitrep_" + level.currentobjectiveindex + "_" + level.mapname;
    return dialog;
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9088
// Size: 0x3f
function getcapturedialog(action) {
    dialog = "cop_obj_" + level.currentobjectiveindex + "_" + action + "_" + level.mapname;
    return dialog;
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x90cf
// Size: 0x2cc
function getselfobjcaptureddialog(action) {
    var_cb3339ece72dbdeb = "";
    dialog = "";
    var_a7af333d56ee650a = 0;
    switch (level.currentobjectiveindex) {
    case 0:
        if (action == "planting") {
            var_cb3339ece72dbdeb = "arming_bomb";
            dialog = "cop_arming_bomb_2d";
            var_a7af333d56ee650a = 1;
        } else if (action == "defusing") {
            var_cb3339ece72dbdeb = "bomb_defusing";
            dialog = "cop_bomb_defusing_2d";
            var_a7af333d56ee650a = 1;
        }
        break;
    case 1:
        if (action == "capturing") {
            dialog = "";
        } else if (action == "captured") {
            if (self.team == "axis") {
                var_cb3339ece72dbdeb = "objsecured_generic";
                dialog = "cop_generic_captured_2d";
            } else if (level.mapname == "mp_faridah") {
                var_cb3339ece72dbdeb = "objsecured_school";
                dialog = "cop_school_captured_2d";
            } else {
                var_cb3339ece72dbdeb = "objsecured_generic";
                dialog = "cop_generic_captured_2d";
            }
        }
        break;
    case 2:
        if (action == "capturing") {
            dialog = "";
        } else if (action == "captured") {
            var_cb3339ece72dbdeb = "objsecured_generic";
            dialog = "cop_generic_captured_2d";
        }
        break;
    case 3:
        if (action == "capturing") {
            dialog = "";
        } else if (action == "captured") {
            if (level.mapname == "mp_faridah") {
                var_cb3339ece72dbdeb = "objsecured_warehouse";
                dialog = "cop_warehouse_captured_2d";
            } else {
                var_cb3339ece72dbdeb = "objsecured_generic";
                dialog = "cop_generic_captured_2d";
            }
        }
        break;
    case 4:
        if (action == "planting") {
            var_cb3339ece72dbdeb = "arming_bomb";
            dialog = "cop_arming_bomb_2d";
            var_a7af333d56ee650a = 1;
        } else if (action == "defusing") {
            var_cb3339ece72dbdeb = "bomb_defusing";
            dialog = "cop_bomb_defusing_2d";
            var_a7af333d56ee650a = 1;
        }
        break;
    }
    var_1499e7c2d69e0074 = 0;
    if (var_a7af333d56ee650a && !namespace_25c5a6f43bb97b43::saidtoorecently(dialog)) {
        namespace_25c5a6f43bb97b43::updatechatter(dialog);
        thread playselfbattlechatter(self, var_cb3339ece72dbdeb, dialog, 1.5);
    } else if (!var_a7af333d56ee650a) {
        thread playselfbattlechatter(self, var_cb3339ece72dbdeb, dialog, 1.5);
    }
    faction = ter_op(self.team == "allies", "usp1", "abp1");
    if (level.mapname == "mp_faridah") {
        faction = ter_op(self.team == "allies", "usp1", "afp1");
    }
    soundalias = "dx_mpp_" + faction + "_" + var_cb3339ece72dbdeb;
    return lookupsoundlength(soundalias) / 1000;
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x93a3
// Size: 0xee
function playselfbattlechatter(player, var_cb3339ece72dbdeb, dialog, waittime, var_263df9880c0bb2b2) {
    if (isai(self)) {
        return;
    }
    level endon("game_ended");
    self endon("death");
    if (isdefined(waittime)) {
        wait(waittime);
    }
    faction = ter_op(self.team == "allies", "usp1", "abp1");
    if (level.mapname == "mp_faridah") {
        faction = ter_op(player.team == "allies", "usp1", "afp1");
    }
    soundalias = "dx_mpp_" + faction + "_" + var_cb3339ece72dbdeb;
    if (isdefined(var_263df9880c0bb2b2)) {
        var_9373e8da64267c1f = soundalias;
        if (soundexists(var_9373e8da64267c1f)) {
            soundalias = var_9373e8da64267c1f;
        }
    }
    player queuedialogforplayer(soundalias, dialog, 2);
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9498
// Size: 0xc6
function getclosestplayeronteam(org, team) {
    closestplayer = undefined;
    closestdist = undefined;
    foreach (player in level.players) {
        if (player.team == team && isreallyalive(player)) {
            dist = distance2dsquared(player.origin, org);
            if (!isdefined(closestdist) || dist < closestdist) {
                closestplayer = player;
                closestdist = dist;
            }
        }
    }
    return closestplayer;
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9566
// Size: 0x4f
function disableobjectiveongameended() {
    level waittill("game_ended");
    if (isdefined(level.currentobjective) && isdefined(level.currentobjective.ondisableobjective)) {
        level.currentobjective [[ level.currentobjective.ondisableobjective ]]();
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x95bc
// Size: 0x53f
function setupcaptureflares() {
    if (getdvarint(@"hash_b7ee28d2bfbcd1ed", 0) != 1) {
        return;
    }
    wait(2);
    embassy = [];
    embassy[embassy.size] = spawnflare((350, -3580, -35), (0, -151, 0));
    embassy[embassy.size] = spawnflare((345, -3650, -35), (0, 140, 0));
    embassy[embassy.size] = spawnflare((235, -3655, -35), (0, 50, 0));
    embassy[embassy.size] = spawnflare((230, -3575, -35), (0, -40, 0));
    level.objectives["0"].scriptables = embassy;
    school = [];
    school[school.size] = spawnflare((-457, -2006, 204), (0, 331, 0), 0);
    school[school.size] = spawnflare((-31, -1915, 192), (45, 48, 0), 0);
    school[school.size] = spawnflare((-319, -1706, 209), (0, 130, 0), 0);
    school[school.size] = spawnflare((-545, -1805, 207), (0, 130, 0), 0);
    school[school.size] = spawnflare((-302, -2137, 152), (0, 234, 0));
    level.objectives["1"].scriptables = school;
    clocktower = [];
    clocktower[clocktower.size] = spawnflare((420, -23, 17), (5, 208, 0));
    clocktower[clocktower.size] = spawnflare((458, 59, 109), (0, 342, 0), 0);
    clocktower[clocktower.size] = spawnflare((380, -267, 17), (0, 186, 0));
    clocktower[clocktower.size] = spawnflare((210, 126, 18), (5, 125, 0));
    clocktower[clocktower.size] = spawnflare((675, 118, 18), (0, 41, 0));
    clocktower[clocktower.size] = spawnflare((638, -180, 18), (5, 356, 0));
    clocktower[clocktower.size] = spawnflare((417, 105, 69), (75, 285, 0), 0);
    clocktower[clocktower.size] = spawnflare((426, -177, 17), (5, 73, 0), 0);
    clocktower[clocktower.size] = spawnflare((509, -116, 69), (55, 82, 0), 0);
    clocktower[clocktower.size] = spawnflare((331, 60, 63), (0, 309, 0), 0);
    clocktower[clocktower.size] = spawnflare((578, 65, 62), (40, 197, 0), 0);
    level.objectives["2"].scriptables = clocktower;
    warehouse = [];
    warehouse[warehouse.size] = spawnflare((812, 2074, 222), (35, 326, 0), 0);
    warehouse[warehouse.size] = spawnflare((431, 1882, 241), (5, 86, 0), 0);
    warehouse[warehouse.size] = spawnflare((762, 2333, 226), (15, 345, 0), 0);
    warehouse[warehouse.size] = spawnflare((609, 1861, 223), (65, 339, 0), 0);
    warehouse[warehouse.size] = spawnflare((580, 2150, 212), (0, 272, 0), 0);
    level.objectives["3"].scriptables = warehouse;
    compound = [];
    compound[compound.size] = spawnflare((1300, 3335, 12), (0, 40, 0));
    compound[compound.size] = spawnflare((1305, 3430, -2), (0, -47, 0));
    compound[compound.size] = spawnflare((1430, 3435, -3), (0, -135, 0));
    compound[compound.size] = spawnflare((1430, 3350, 3), (0, 140, 0));
    level.objectives["4"].scriptables = compound;
    if (getdvarint(@"hash_424c014a94392d1", 0) == 1) {
        thread debugcaptureflares();
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x9b02
// Size: 0x9b
function spawnflare(org, angles, drop) {
    spawnpos = org;
    if (!isdefined(drop)) {
        drop = 1;
    }
    if (drop) {
        spawnpos = drop_to_ground(org, 50, -200, (0, 0, 1));
    }
    scriptable = spawn("script_model", spawnpos + (0, 0, 2));
    scriptable.angles = angles + (0, 180, 0);
    scriptable setmodel("cop_marker_scriptable");
    return scriptable;
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9ba5
// Size: 0x9c
function updateflares(state) {
    if (getdvarint(@"hash_b7ee28d2bfbcd1ed", 0) != 1) {
        return;
    }
    self notify("updateFlares");
    self endon("updateFlares");
    while (!isdefined(self.scriptables)) {
        waitframe();
    }
    foreach (scriptable in self.scriptables) {
        scriptable setscriptablepartstate("marker", state);
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9c48
// Size: 0x155
function debugcaptureflares() {
    currstate = 0;
    while (1) {
        state = 0;
        switch (currstate) {
        case 0:
            state = "allies";
            break;
        case 1:
            state = "axis";
            break;
        case 2:
            state = "contested";
            break;
        case 3:
            state = "idle";
            break;
        }
        foreach (objective in level.objectives) {
            if (!isdefined(objective.scriptables)) {
                continue;
            }
            foreach (scriptable in objective.scriptables) {
                scriptable setscriptablepartstate("marker", state);
            }
        }
        currstate++;
        if (currstate > 3) {
            currstate = 0;
        }
        wait(3);
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9da4
// Size: 0x1b9
function mapobjectiveicon(index) {
    switch (level.mapname) {
    case #"hash_ecbb96ade87e6efa":
        switch (self.objectivekey) {
        case #"hash_311010bc01bd3a0f":
            self.iconname = "_bombsite";
            break;
        case #"hash_31100fbc01bd387c":
            self.iconname = "_school";
            break;
        case #"hash_311012bc01bd3d35":
            self.iconname = "_clocktower";
            break;
        case #"hash_311011bc01bd3ba2":
            self.iconname = "_warehouse";
            break;
        case #"hash_31100cbc01bd33c3":
            self.iconname = "_bombsite";
            break;
        default:
            self.iconname = "";
            break;
        }
        break;
    default:
        switch (self.objectivekey) {
        case #"hash_311010bc01bd3a0f":
            self.iconname = "_generic";
            break;
        case #"hash_31100fbc01bd387c":
            self.iconname = "_generic";
            break;
        case #"hash_311012bc01bd3d35":
            self.iconname = "_generic";
            break;
        case #"hash_311011bc01bd3ba2":
            self.iconname = "_generic";
            break;
        case #"hash_31100cbc01bd33c3":
            self.iconname = "_generic";
            break;
        default:
            self.iconname = "";
            break;
        }
        break;
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9f64
// Size: 0xf6
function updateoobtriggers() {
    if (!isdefined(level.currentobjective.oobtriggers)) {
        return;
    }
    level notify("updateOOBTriggers");
    foreach (player in level.players) {
        if (isdefined(level.currentobjective.oobtriggers["allies"])) {
            level.currentobjective.oobtriggers["allies"] thread updateoobvisuals("axis");
        }
        if (isdefined(level.currentobjective.oobtriggers["axis"])) {
            level.currentobjective.oobtriggers["axis"] thread updateoobvisuals("allies");
        }
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa061
// Size: 0x123
function updateoobvisuals(state) {
    self notify("updateOOBVisuals");
    self endon("updateOOBVisuals");
    while (!isdefined(self.visuals)) {
        waitframe();
    }
    foreach (visual in self.visuals) {
        for (i = 0; i < visual.drawcount; i++) {
            visual setscriptablepartstate("chevron_" + i, state);
        }
    }
    level waittill("updateOOBTriggers");
    foreach (visual in self.visuals) {
        for (i = 0; i < visual.drawcount; i++) {
            visual setscriptablepartstate("chevron_" + i, "off");
        }
    }
}

// Namespace cmd/namespace_9a660d8445a9654e
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa18b
// Size: 0x11c
function awardcapturepoints() {
    level endon("game_ended");
    level notify("awardCapturePointsRunning");
    level endon("awardCapturePointsRunning");
    seconds = 1;
    score = 1;
    while (!level.gameended) {
        waittime = 0;
        while (waittime < seconds) {
            waitframe();
            namespace_e323c8674b44c8f4::waittillhostmigrationdone();
            waittime = waittime + level.framedurationseconds;
            if (self.stalemate) {
                waittime = 0;
            }
        }
        team = self.claimteam;
        if (team == "none") {
            continue;
        }
        if (!self.stalemate) {
            foreach (object in self.touchlist[team]) {
                object.player thread doscoreevent(#"hash_b70d7c404342b807");
            }
        }
    }
}

