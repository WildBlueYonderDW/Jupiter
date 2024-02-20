// mwiii decomp prototype
#using scripts\mp\hud_util.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\print.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\tweakables.gsc;
#using scripts\mp\damage.gsc;
#using scripts\mp\class.gsc;
#using scripts\mp\gametypes\arena.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\bots\bots.gsc;
#using scripts\mp\spawnscoring.gsc;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\bots\bots_util.gsc;
#using scripts\mp\persistence.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\spectating.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\mp\gametypes\obj_dom.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\analyticslog.gsc;
#using scripts\mp\utility\points.gsc;
#using script_4a6760982b403bad;
#using scripts\mp\weapons.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\gamescore.gsc;

#namespace namespace_9fcaf1fc417ac0a8;

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f1b
// Size: 0xb79
function main() {
    setdvar(@"hash_704afe6f6c582ee0", 10);
    /#
        setdevdvarifuninitialized(@"hash_52b2904136c93f2b", -1);
        if (!isdefined(game["lc_pos_third"])) {
            game["lc_pos_third"] = -1;
        }
        level thread bootcampmodewatcher();
    #/
    level.bots_gametype_handles_class_choice = 1;
    if (!isdefined(game["launchChunkRuleSet"])) {
        game["launchChunkWinner"] = 0;
        game["launchChunkRuleSet"] = 0;
        game["prevLaunchChunkRuleSet"] = 0;
        game["wasHostAliveAtRoundEnd"] = 1;
        game["matchStartRequiresInput"] = 1;
    } else if (game["launchChunkWinner"] == 1) {
        game["launchChunkWinner"] = 0;
        game["prevLaunchChunkRuleSet"] = game["launchChunkRuleSet"];
        game["launchChunkRuleSet"]++;
        level.resetstats = 1;
        game["matchStartRequiresInput"] = 1;
    }
    /#
        if (game["lc_pos_third"] != -1) {
            game["securing_a"] = 0;
            game["ui_arena_axis_health_max"] = int(clamp(game["lc_pos_third"] - 1, 0, 3));
            game["blastShieldClamp"] = game["lc_pos_third"];
            level.resetstats = 1;
            game["allies"] = 1;
        }
    #/
    if (game["launchChunkRuleSet"] > 3) {
        game["launchChunkRuleSet"] = 0;
    }
    registerroundswitchdvar(getgametype(), 0, 0, 9);
    registertimelimitdvar(getgametype(), 30);
    registerscorelimitdvar(getgametype(), 75);
    registerroundlimitdvar(getgametype(), 19);
    registerwinlimitdvar(getgametype(), 10);
    registernumlivesdvar(getgametype(), 0);
    registerhalftimedvar(getgametype(), 0);
    registerwinbytwoenableddvar(getgametype(), 1);
    registerwinbytwomaxroundsdvar(getgametype(), 4);
    setdvar(@"hash_4871f220778a4649", 0);
    if (!isdefined(level.tweakablesinitialized)) {
        namespace_775507ba36294dfb::init();
    }
    thread launchchunkbotspawning();
    level.setinitialbotdifficulties = 1;
    switch (game["launchChunkRuleSet"]) {
    case 0:
        if (!isdefined(game["lc_intro_zero"])) {
            game["lc_intro_zero"] = 1;
            game["dialog"]["lc_intro"] = "lc_ffa_first";
        } else if (game["lc_intro_zero"] == 1) {
            game["lc_intro_zero"] = 2;
            game["dialog"]["lc_intro"] = "lc_ffa_second";
        } else {
            game["dialog"]["lc_intro"] = "lc_ffa_third";
        }
        setomnvar("ui_round_hint_override_attackers", 1);
        setomnvar("ui_round_hint_override_defenders", 1);
        setoverridewatchdvar("timelimit", 180);
        setoverridewatchdvar("numlives", 0);
        setoverridewatchdvar("roundlimit", 1);
        setoverridewatchdvar("winlimit", 1);
        setoverridewatchdvar("scorelimit", 15);
        waitthensethealthregentweakable(6);
        setdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_pointsPerKill"), 1);
        setdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_dogtags"), 0);
        setdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_lethalDelay"), 0);
        level.scoreconfirm = 0;
        level.scoredeny = 0;
        break;
    case 1:
        if (!isdefined(game["lc_intro_one"])) {
            game["lc_intro_one"] = 1;
            game["dialog"]["lc_intro"] = "lc_arena_first";
        } else if (game["lc_intro_one"] == 1) {
            game["lc_intro_one"] = 2;
            game["dialog"]["lc_intro"] = "lc_arena_second";
        } else {
            game["dialog"]["lc_intro"] = "lc_arena_third";
        }
        setomnvar("ui_round_hint_override_attackers", 0);
        setomnvar("ui_round_hint_override_defenders", 0);
        setoverridewatchdvar("timelimit", 40);
        setoverridewatchdvar("numlives", 1);
        setoverridewatchdvar("roundlimit", 0);
        setoverridewatchdvar("winlimit", 6);
        setoverridewatchdvar("scorelimit", 6);
        waitthensethealthregentweakable(0);
        setdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_pointsPerKill"), 0);
        setdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_dogtags"), 0);
        setdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_lethalDelay"), 5);
        level.overridetimelimitclock = 10;
        level.setinitialbotdifficulties = 0;
        break;
    case 2:
        if (!isdefined(game["lc_intro_two"])) {
            game["lc_intro_two"] = 1;
            game["dialog"]["lc_intro"] = "lc_pos_first";
        } else if (game["lc_intro_two"] == 1) {
            game["lc_intro_two"] = 2;
            game["dialog"]["lc_intro"] = "lc_pos_second";
        } else {
            game["dialog"]["lc_intro"] = "lc_pos_third";
        }
        setomnvar("ui_round_hint_override_attackers", 0);
        setomnvar("ui_round_hint_override_defenders", 0);
        setoverridewatchdvar("timelimit", 40);
        setoverridewatchdvar("numlives", 1);
        setoverridewatchdvar("roundlimit", 0);
        setoverridewatchdvar("winlimit", 6);
        setoverridewatchdvar("scorelimit", 6);
        waitthensethealthregentweakable(0);
        setdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_pointsPerKill"), 0);
        setdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_dogtags"), 0);
        setdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_lethalDelay"), 5);
        level.overridetimelimitclock = 10;
        level.setinitialbotdifficulties = 0;
        break;
    case 3:
        if (!isdefined(game["lc_intro_three"])) {
            game["lc_intro_three"] = 1;
            game["dialog"]["lc_intro"] = "lc_conf_first";
        } else if (game["lc_intro_three"] == 1) {
            game["lc_intro_three"] = 2;
            game["dialog"]["lc_intro"] = "lc_conf_second";
        } else {
            game["dialog"]["lc_intro"] = "lc_conf_third";
        }
        setomnvar("ui_round_hint_override_attackers", 2);
        setomnvar("ui_round_hint_override_defenders", 2);
        setoverridewatchdvar("timelimit", 180);
        setoverridewatchdvar("numlives", 0);
        setoverridewatchdvar("roundlimit", 1);
        setoverridewatchdvar("winlimit", 1);
        setoverridewatchdvar("scorelimit", 20);
        waitthensethealthregentweakable(6);
        setdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_pointsPerKill"), 0);
        setdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_dogtags"), 1);
        setdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_lethalDelay"), 0);
        level.scoreconfirm = 1;
        level.scoredeny = 0;
        break;
    default:
        break;
    }
    updategametypedvars();
    if (israndompreviewloadouts()) {
        level.ispreviewbuild = 1;
        level.previewbuildfirstallies = 1;
        level.previewbuildfirstaxis = 1;
    }
    setdvar(@"hash_818c699a5caaee4f", 4);
    level.teambased = 1;
    level.objectivebased = 1;
    level.ontimelimit = &ontimelimit;
    level.onstartgametype = &onstartgametype;
    level.onplayerconnect = &onplayerconnect;
    level.getspawnpoint = &getspawnpoint;
    level.onplayerdamaged = &onplayerdamaged;
    level.onnormaldeath = &onnormaldeath;
    level.onplayerkilled = &onplayerkilled;
    level.modeonspawnplayer = &onspawnplayer;
    level.ondeadevent = &ondeadevent;
    level.ontimelimitot = &ontimelimitot;
    level.droplaunchchunkbots = &droplaunchchunkbots;
    level.modifyplayerdamage = &namespace_3e725f3cc58bddd3::gamemodemodifyplayerdamage;
    level.allowlatecomers = 0;
    if (!iswinbytworulegametype()) {
        level.skipdefendersadvantage = 1;
    }
    level.disablecopycatloadout = 1;
    setomnvar("ui_killcam_copycat", 0);
    level.bypassclasschoicefunc = &namespace_d19129e4fa5d176::alwaysgamemodeclass;
    game["dialog"]["gametype"] = "iw9_gnft_mode_uktl_gfnm";
    if (ispickuploadouts() && !isdefined(game["roundsPlayed"])) {
        game["dialog"]["offense_obj"] = "boost_arena_pickups";
        game["dialog"]["defense_obj"] = "boost_arena_pickups";
    } else if (level.objmodifier == 1 && !isdefined(game["roundsPlayed"])) {
        game["dialog"]["offense_obj"] = "boost_arena_objective";
        game["dialog"]["defense_obj"] = "boost_arena_objective";
    } else {
        game["dialog"]["offense_obj"] = "iw9_gnft_mode_uktl_gfbo";
        game["dialog"]["defense_obj"] = "iw9_gnft_mode_uktl_gfbo";
    }
    game["dialog"]["obj_indepth"] = "boost_arena_indepth";
    game["dialog"]["securing_a"] = "iw9_gnft_mode_uktl_gfsg";
    game["dialog"]["secured_a"] = "iw9_gnft_mode_uktl_gfsd";
    game["dialog"]["losing_a"] = "iw9_gnft_mode_uktl_gflg";
    game["dialog"]["lost_a"] = "iw9_gnft_mode_uktl_gflt";
    game["dialog"]["round_success"] = "round_win";
    game["dialog"]["round_failure"] = "round_lose";
    game["dialog"]["mission_success"] = "gamestate_win";
    game["dialog"]["mission_failure"] = "gamestate_lost";
    level.allieshealth = 0;
    level.alliesmaxhealth = 0;
    level.axishealth = 0;
    level.axismaxhealth = 0;
    level.usedspawnposone = 0;
    level.usedspawnpostwo = 0;
    level.usedspawnposthree = 0;
    setomnvar("ui_arena_allies_health", 0);
    setomnvar("ui_arena_axis_health", 0);
    setomnvar("ui_arena_allies_health_max", 100);
    setomnvar("ui_arena_axis_health_max", 100);
    setomnvar("ui_arena_primaryVariantID", -1);
    setomnvar("ui_arena_secondaryVariantID", -1);
    if (game["launchChunkRuleSet"] == 0) {
        game["dialog"]["gametype"] = "gametype_ffa";
        game["dialog"]["boost"] = "boost_tdm";
        game["dialog"]["offense_obj"] = "boost_tdm";
        game["dialog"]["defense_obj"] = "boost_tdm";
    } else if (game["launchChunkRuleSet"] == 3) {
        game["dialog"]["gametype"] = "gametype_killconfirmed";
        game["dialog"]["boost"] = "boost_killconfirmed";
        game["dialog"]["offense_obj"] = "boost_killconfirmed";
        game["dialog"]["defense_obj"] = "boost_killconfirmed";
        game["dialog"]["kill_confirmed"] = "kill_confirmed";
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2a9b
// Size: 0x30
function waitthensethealthregentweakable(healthregendelay) {
    namespace_775507ba36294dfb::settweakablevalue("player", "healthregentime", healthregendelay);
    namespace_775507ba36294dfb::settweakablelastvalue("player", "healthregentime", healthregendelay);
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ad2
// Size: 0x90
function launchchunkbotspawning() {
    level waittill("spawned_player");
    switch (game["launchChunkRuleSet"]) {
    case 0:
        level.launchchunkfreespawn = 0;
        break;
    case 1:
        level.launchchunkfreespawn = 1;
        break;
    case 2:
        level.launchchunkfreespawn = 1;
        break;
    case 3:
        level.launchchunkfreespawn = 1;
        break;
    default:
        break;
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b69
// Size: 0x262
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
    setdynamicdvar(@"hash_f3cb432a241a7ea3", getmatchrulesdata("arenaData", "arenaLoadouts"));
    setdynamicdvar(@"hash_b2d6a287c0521607", getmatchrulesdata("arenaData", "loadoutChangeRound"));
    setdynamicdvar(@"hash_9555be126d6bdcab", getmatchrulesdata("arenaData", "switchSpawns"));
    setdynamicdvar(@"hash_a4a7060aad657090", getmatchrulesdata("arenaData", "winCondition"));
    setdynamicdvar(@"hash_1b3b0369b76395a5", getmatchrulesdata("arenaData", "objModifier"));
    setdynamicdvar(@"hash_92027746d0937564", getmatchrulesdata("arenaData", "spawnFlag"));
    setdynamicdvar(@"hash_385f68623c04c6dc", getmatchrulesdata("domData", "flagCaptureTime"));
    setdynamicdvar(@"hash_f86716e8c7f46afd", getmatchrulesdata("arenaData", "tacticalTimeMod"));
    setdynamicdvar(@"hash_44fc747f238c17da", getmatchrulesdata("arenaData", "blastShieldMod"));
    setdynamicdvar(@"hash_4dcb3bff6478bb0d", getmatchrulesdata("arenaData", "blastShieldClamp"));
    setdynamicdvar(@"hash_84ab96fa2f04c271", getmatchrulesdata("arenaData", "startWeapon"));
    setdynamicdvar(@"hash_54f31afe6345346a", getmatchrulesdata("arenaData", "weaponTier1"));
    setdynamicdvar(@"hash_54f319fe63453237", getmatchrulesdata("arenaData", "weaponTier2"));
    setdynamicdvar(@"hash_54f318fe63453004", getmatchrulesdata("arenaData", "weaponTier3"));
    setdynamicdvar(@"hash_54f317fe63452dd1", getmatchrulesdata("arenaData", "weaponTier4"));
    setdynamicdvar(@"hash_54f316fe63452b9e", getmatchrulesdata("arenaData", "weaponTier5"));
    setdynamicdvar(@"hash_54f315fe6345296b", getmatchrulesdata("arenaData", "weaponTier6"));
    setdynamicdvar(@"hash_54f314fe63452738", getmatchrulesdata("arenaData", "weaponTier7"));
    setdynamicdvar(@"hash_54f313fe63452505", getmatchrulesdata("arenaData", "weaponTier8"));
    setdynamicdvar(@"hash_c110a01fb151da3", 0);
    registerhalftimedvar(getgametype(), 0);
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2dd2
// Size: 0x2db
function onstartgametype() {
    setclientnamemode("auto_change");
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
        setobjectivetext(entry, "OBJECTIVES/WAR");
        if (level.splitscreen) {
            setobjectivescoretext(entry, "OBJECTIVES/WAR");
        } else {
            setobjectivescoretext(entry, "OBJECTIVES/WAR_SCORE");
        }
        setobjectivehinttext(entry, "OBJECTIVES/WAR_HINT");
    }
    initspawns();
    thread adjustroundendtimer();
    thread waittooverridegraceperiod();
    if (israndomloadouts() || israndompreviewloadouts() || israndomalphaloadouts()) {
        thread updaterandomloadout();
    } else if (ispickuploadouts()) {
        level.lethaldelay = 0;
        defineplayerloadout();
        initweaponmap();
        thread setupweapons();
    } else if (isgungameloadouts()) {
        level.blockweapondrops = 1;
        thread namespace_47e715c4f9510479::updatearenagungameloadout(0);
    } else if (isrvsgungameloadouts()) {
        level.blockweapondrops = 1;
        thread namespace_47e715c4f9510479::updatearenagungameloadout(1);
    }
    buildloadoutsforweaponstreaming();
    setupwaypointicons();
    seticonnames();
    if (level.objmodifier == 1) {
        level setupendzones();
    }
    var_90b3677e000c6c1b = 0;
    switch (game["launchChunkRuleSet"]) {
    case 0:
        break;
    case 1:
        if (!namespace_4b0406965e556711::gameflag("prematch_done") && game["roundsPlayed"] == 0) {
            var_90b3677e000c6c1b = 1;
        }
        break;
    case 2:
        break;
    case 3:
        break;
    default:
        break;
    }
    level thread namespace_47e715c4f9510479::spawngameendflagzone();
    updatetournamentroundtime(namespace_d576b6dc7cef9c62::gettimeremaining(), 0);
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        if (game["roundsPlayed"] == 0) {
            if (game["launchChunkRuleSet"] == 0 && game["prevLaunchChunkRuleSet"] != 3) {
                level thread outlineenemyplayerslaunchchunk();
            } else {
                level thread outlineenemyplayers();
                level thread removeenemyoutlines();
            }
        }
    }
    if (game["roundsPlayed"] == 0) {
        level thread setroundwinstreakarray();
    }
    setdvar(@"hash_52994f8fc649c87a", 1);
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x30b4
// Size: 0x33
function droplaunchchunkbots() {
    if (istrue(game["chunkBotsSpawned"])) {
        game["chunkBotsSpawned"] = 0;
        namespace_e4a5fcd525f0b19b::drop_bots(1, "allies");
        namespace_e4a5fcd525f0b19b::drop_bots(1, "axis");
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x30ee
// Size: 0x51
function tryspawnlaunchchunkbots() {
    if (istrue(game["chunkBotsSpawned"])) {
        return;
    }
    level thread namespace_e4a5fcd525f0b19b::spawn_bots(1, "allies", undefined, undefined, "spawned_allies", "recruit");
    level thread namespace_e4a5fcd525f0b19b::spawn_bots(1, "axis", undefined, undefined, "spawned_enemies", "recruit");
    game["chunkBotsSpawned"] = 1;
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3146
// Size: 0x25
function waittooverridegraceperiod() {
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    level.overrideingraceperiod = 1;
    level.ingraceperiod = 5;
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3172
// Size: 0x14
function adjustroundendtimer() {
    wait(1);
    level.roundenddelay = 4;
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x318d
// Size: 0x67c
function updategametypedvars() {
    updatecommongametypedvars();
    if (game["launchChunkRuleSet"] == 3) {
        level.dogtagallyonusecb = &dogtagallyonusecbconf;
        level.dogtagenemyonusecb = &dogtagenemyonusecbconf;
    } else if (level.dogtagsenabled) {
        level.dogtagallyonusecb = &dogtagallyonusecb;
        level.dogtagenemyonusecb = &dogtagenemyonusecb;
    }
    level.arenaloadouts = 2;
    level.loadoutchangeround = dvarintvalue("loadoutChangeRound", 3, 0, 5);
    level.switchspawns = dvarintvalue("switchSpawns", 1, 0, 1);
    level.wincondition = dvarintvalue("winCondition", 1, 0, 2);
    setomnvar("ui_arena_loadout_type", level.arenaloadouts);
    setomnvar("ui_wincondition", level.wincondition);
    level.objmodifier = dvarintvalue("objModifier", 0, 0, 1);
    level.spawnflag = dvarintvalue("spawnFlag", 0, 0, 1);
    if (game["launchChunkRuleSet"] != 1 && game["launchChunkRuleSet"] != 2) {
        level.spawnflag = 0;
    } else if (level.spawnflag) {
        level.ontimelimitgraceperiod = 10;
        level.currenttimelimitdelay = 0;
        level.canprocessot = 1;
    }
    level.tacticaltimemod = dvarfloatvalue("tacticalTimeMod", 2.5, 0.5, 5);
    level.startweapon = getdvar(@"hash_84ab96fa2f04c271", "none");
    level.arenaweapont1 = getdvar(@"hash_54f31afe6345346a", "iw8_pi_golf21_mp");
    level.arenaweapont2 = getdvar(@"hash_54f319fe63453237", "iw8_sh_dpapa12_mp");
    level.arenaweapont3 = getdvar(@"hash_54f318fe63453004", "iw8_sm_mpapa5_mp");
    level.arenaweapont4 = getdvar(@"hash_54f317fe63452dd1", "iw8_ar_mike4_mp");
    level.arenaweapont5 = getdvar(@"hash_54f316fe63452b9e", "iw8_sn_alpha50_mp");
    level.arenaweapont6 = getdvar(@"hash_54f315fe6345296b", "equip_frag");
    level.arenaweapont7 = getdvar(@"hash_54f314fe63452738", "equip_concussion");
    level.arenaweapont8 = getdvar(@"hash_54f313fe63452505", "equip_adrenaline");
    if (game["launchChunkRuleSet"] == 2) {
        level.arenaloadouts = 3;
        level.loadoutchangeround = 3;
        level.startweapon = "none";
        level.arenaweapont1 = "rand_pistol";
        level.arenaweapont2 = "random";
        level.arenaweapont3 = "rand_smg";
        level.arenaweapont4 = "rand_assault";
        level.arenaweapont5 = "rand_sniper";
        level.arenaweapont6 = "rand_lethal";
        level.arenaweapont7 = "rand_tactical";
        level.arenaweapont8 = "random";
        level thread botpickuphack();
    }
    if (ispickuploadouts()) {
        function_e427e359bb108351();
        if (!isdefined(game["roundsPlayed"]) || isdefined(game["roundsPlayed"]) && game["roundsPlayed"] == 0) {
            level.startweapon = getrandomweaponforweapontier(level.startweapon);
            level.arenaweapont1 = getrandomweaponforweapontier(level.arenaweapont1);
            level.arenaweapont2 = getrandomweaponforweapontier(level.arenaweapont2);
            level.arenaweapont3 = getrandomweaponforweapontier(level.arenaweapont3);
            level.arenaweapont4 = getrandomweaponforweapontier(level.arenaweapont4);
            level.arenaweapont5 = getrandomweaponforweapontier(level.arenaweapont5);
            level.arenaweapont6 = getrandomweaponforweapontier(level.arenaweapont6);
            level.arenaweapont7 = getrandomweaponforweapontier(level.arenaweapont7);
            level.arenaweapont8 = getrandomweaponforweapontier(level.arenaweapont8);
        } else if (level.loadoutchangeround == 0 || game["roundsPlayed"] % level.loadoutchangeround != 0) {
            level.startweapon = game["startWeapon"];
            level.arenaweapont1 = game["arenaWeaponT1"];
            level.arenaweapont2 = game["arenaWeaponT2"];
            level.arenaweapont3 = game["arenaWeaponT3"];
            level.arenaweapont4 = game["arenaWeaponT4"];
            level.arenaweapont5 = game["arenaWeaponT5"];
            level.arenaweapont6 = game["arenaWeaponT6"];
            level.arenaweapont7 = game["arenaWeaponT7"];
            level.arenaweapont8 = game["arenaWeaponT8"];
        } else if (game["roundsPlayed"] % level.loadoutchangeround == 0) {
            level.startweapon = getrandomweaponforweapontier(level.startweapon);
            level.arenaweapont1 = getrandomweaponforweapontier(level.arenaweapont1);
            level.arenaweapont2 = getrandomweaponforweapontier(level.arenaweapont2);
            level.arenaweapont3 = getrandomweaponforweapontier(level.arenaweapont3);
            level.arenaweapont4 = getrandomweaponforweapontier(level.arenaweapont4);
            level.arenaweapont5 = getrandomweaponforweapontier(level.arenaweapont5);
            level.arenaweapont6 = getrandomweaponforweapontier(level.arenaweapont6);
            level.arenaweapont7 = getrandomweaponforweapontier(level.arenaweapont7);
            level.arenaweapont8 = getrandomweaponforweapontier(level.arenaweapont8);
        }
        game["startWeapon"] = level.startweapon;
        game["arenaWeaponT1"] = level.arenaweapont1;
        game["arenaWeaponT2"] = level.arenaweapont2;
        game["arenaWeaponT3"] = level.arenaweapont3;
        game["arenaWeaponT4"] = level.arenaweapont4;
        game["arenaWeaponT5"] = level.arenaweapont5;
        game["arenaWeaponT6"] = level.arenaweapont6;
        game["arenaWeaponT7"] = level.arenaweapont7;
        game["arenaWeaponT8"] = level.arenaweapont8;
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3810
// Size: 0x39
function getrandomweaponforweapontier(var_63573dfb900dd221) {
    if (issubstr(var_63573dfb900dd221, "rand")) {
        if (var_63573dfb900dd221 == "random") {
            var_63573dfb900dd221 = getrandomspawnweapon();
        } else {
            var_63573dfb900dd221 = function_fbc569a8b64fe92b(var_63573dfb900dd221);
        }
    }
    return var_63573dfb900dd221;
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3851
// Size: 0x245
function initspawns() {
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    if (function_bff229a11ecd1e34()) {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic("default", "default");
    } else {
        namespace_b2d5aa2baf2b5701::setactivespawnlogic("LaunchChunk", "Crit_Default");
    }
    var_1cf8be03fb3c42de = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_arena_spawn_allies_start");
    var_68c73806e24ff493 = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_arena_spawn_axis_start");
    var_ebb5693ce8d3a200 = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_arena_spawn");
    if (var_1cf8be03fb3c42de.size > 0 || var_68c73806e24ff493.size > 0) {
        namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_arena_spawn_allies_start");
        namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_arena_spawn_axis_start");
        level.alliesstartspawn = "mp_arena_spawn_allies_start";
        level.axisstartspawn = "mp_arena_spawn_axis_start";
        /#
            validatespawns("arenaWeaponT2");
            validatespawns("0");
        #/
    } else {
        namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_sd_spawn_attacker");
        namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_sd_spawn_defender");
        level.alliesstartspawn = "mp_sd_spawn_attacker";
        level.axisstartspawn = "mp_sd_spawn_defender";
        /#
            validatespawns("hack_notify");
            validatespawns("startDamageWatcher");
        #/
    }
    if (var_ebb5693ce8d3a200.size > 0) {
        namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_arena_spawn");
        namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_arena_spawn");
        level.spawntype = "mp_arena_spawn";
    } else {
        var_ebb5693ce8d3a200 = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn");
        if (var_ebb5693ce8d3a200.size > 0) {
            namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_tdm_spawn");
            namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_tdm_spawn");
            level.spawntype = "mp_tdm_spawn";
        } else {
            level.alwaysusestartspawns = 1;
        }
    }
    if (!istrue(level.alwaysusestartspawns)) {
        namespace_b2d5aa2baf2b5701::registerspawnset("normal", level.spawntype);
        namespace_b2d5aa2baf2b5701::registerspawnset("fallback", level.spawntype);
    }
    level.mapcenter = namespace_b2d5aa2baf2b5701::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3a9d
// Size: 0x1bf
function validatespawns(spawnpointname) {
    var_ecbe28103d8ba707 = 0;
    var_ecbe29103d8ba93a = 0;
    var_ecbe2a103d8bab6d = 0;
    var_e89636dadea5a56a = 0;
    spawnpoints = namespace_b2d5aa2baf2b5701::getspawnpointarray(spawnpointname);
    foreach (s in spawnpoints) {
        if (isdefined(s.script_noteworthy)) {
            if (!var_ecbe28103d8ba707) {
                var_ecbe28103d8ba707 = s.script_noteworthy == "1";
            } else {
                /#
                    assertex(s.script_noteworthy != "1", "Found two spawn points with the same script_noteworthy of "1"");
                #/
            }
            if (!var_ecbe29103d8ba93a) {
                var_ecbe29103d8ba93a = s.script_noteworthy == "2";
            } else {
                /#
                    assertex(s.script_noteworthy != "2", "Found two spawn points with the same script_noteworthy of "2"");
                #/
            }
            if (!var_ecbe2a103d8bab6d) {
                var_ecbe2a103d8bab6d = s.script_noteworthy == "3";
                level.hasthreespawns = 1;
            } else {
                /#
                    assertex(s.script_noteworthy != "3", "Found two spawn points with the same script_noteworthy of "3"");
                #/
            }
        } else if (var_e89636dadea5a56a == 0) {
            s.script_noteworthy = "1";
            var_e89636dadea5a56a++;
        } else if (var_e89636dadea5a56a == 1) {
            s.script_noteworthy = "2";
            var_e89636dadea5a56a++;
        } else if (var_e89636dadea5a56a == 2) {
            s.script_noteworthy = "3";
            var_e89636dadea5a56a++;
            level.hasthreespawns = 1;
        }
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3c63
// Size: 0x547
function getspawnpoint() {
    spawnpoint = undefined;
    spawnpointname = level.axisstartspawn;
    var_d8f6b733865965fd = 0;
    var_aa57738edf8a8169 = 0;
    if (self.pers["team"] == game["attackers"]) {
        spawnpointname = level.alliesstartspawn;
    }
    if (namespace_b2d5aa2baf2b5701::shoulduseteamstartspawn() || istrue(level.alwaysusestartspawns) || isintournament()) {
        spawnpoints = namespace_b2d5aa2baf2b5701::getspawnpointarray(spawnpointname);
        /#
            assert(spawnpoints.size);
        #/
        if (istrue(level.switchspawns) && game["roundsPlayed"] > 0) {
            var_49ed3f681faf7163 = getteamcount(self.pers["team"]);
            if (var_49ed3f681faf7163 > 3) {
                foreach (player in getteamdata(self.pers["team"], "players")) {
                    if (isdefined(player.pers["arena_spawn_pos"])) {
                        player.pers["arena_spawn_pos"] = "0";
                    }
                }
                var_aa57738edf8a8169 = 1;
            }
        }
        if (istrue(level.switchspawns) && game["roundsPlayed"] > 0 && !var_aa57738edf8a8169) {
            if (self.pers["arena_spawn_pos"] == "1") {
                self.pers["arena_spawn_pos"] = "2";
            } else if (getteamcount(self.pers["team"], 0) == 3 && istrue(level.hasthreespawns) && self.pers["arena_spawn_pos"] == "2") {
                self.pers["arena_spawn_pos"] = "3";
            } else if (self.pers["arena_spawn_pos"] == "3") {
                self.pers["arena_spawn_pos"] = "1";
            } else {
                self.pers["arena_spawn_pos"] = "1";
            }
            spawnpoint = getswitchside_spawnpoint(spawnpoints, self.pers["arena_spawn_pos"]);
        }
        if (!isdefined(spawnpoint)) {
            if (istrue(self.switching_teams_arena) && isdefined(self.pers["arena_spawn_pos"])) {
                cleanupspawn_scriptnoteworthy();
                spawnpoint = getspawnpoint_startspawn(spawnpoints);
                self.switching_teams_arena = undefined;
            } else {
                spawnpoint = getspawnpoint_startspawn(spawnpoints);
            }
            if (!isdefined(spawnpoint)) {
                var_49ed3f681faf7163 = getteamcount(self.pers["team"]);
                if (var_49ed3f681faf7163 > 3) {
                    buddyspawnplayer = undefined;
                    foreach (player in getteamdata(self.pers["team"], "players")) {
                        if (isdefined(player.pers["arena_spawn_pos"])) {
                            if (level.usedspawnposone == 1 && level.usedspawnposone == 1 && level.usedspawnposthree == 1) {
                                level.usedspawnposone = 0;
                                level.usedspawnpostwo = 0;
                                level.usedspawnposthree = 0;
                            }
                            if (player.pers["arena_spawn_pos"] == "1" && level.usedspawnposone == 0) {
                                level.usedspawnposone++;
                                buddyspawnplayer = player;
                                break;
                            } else if (player.pers["arena_spawn_pos"] == "2" && level.usedspawnpostwo == 0) {
                                level.usedspawnpostwo++;
                                buddyspawnplayer = player;
                                break;
                            } else if (player.pers["arena_spawn_pos"] == "3" && level.usedspawnposthree == 0) {
                                level.usedspawnposthree++;
                                buddyspawnplayer = player;
                                break;
                            } else {
                                level.usedspawnposone++;
                                buddyspawnplayer = player;
                                break;
                            }
                        }
                    }
                    if (isdefined(buddyspawnplayer)) {
                        spawnpoint = namespace_90f75d3fdf89a43e::findteammatebuddyspawn(buddyspawnplayer);
                        var_d8f6b733865965fd = 1;
                    }
                }
            }
            if (istrue(level.switchspawns) && game["roundsPlayed"] == 0 && !var_d8f6b733865965fd) {
                /#
                    assertex(isdefined(spawnpoint.script_noteworthy) && (spawnpoint.script_noteworthy == "1" || spawnpoint.script_noteworthy == "2" || spawnpoint.script_noteworthy == "3"));
                #/
                self.pers["arena_spawn_pos"] = spawnpoint.script_noteworthy;
            }
        }
    } else {
        namespace_b2d5aa2baf2b5701::activatespawnset("normal");
        spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, self.pers["team"], "normal", "fallback");
    }
    return spawnpoint;
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x41b2
// Size: 0x1fe
function cleanupspawn_scriptnoteworthy() {
    otherteam = getotherteam(self.pers["team"])[0];
    if (otherteam == game["attackers"]) {
        spawnpointname = level.alliesstartspawn;
        var_55af954984fc6a2a = level.axisstartspawn;
    } else {
        spawnpointname = level.axisstartspawn;
        var_55af954984fc6a2a = level.alliesstartspawn;
    }
    var_cb5363ab35b26aea = namespace_b2d5aa2baf2b5701::getspawnpointarray(spawnpointname);
    /#
        assert(var_cb5363ab35b26aea.size);
    #/
    foreach (s in var_cb5363ab35b26aea) {
        if (s.script_noteworthy == self.pers["arena_spawn_pos"]) {
            s.selected = 0;
        }
    }
    var_cb5363ab35b26aea = namespace_b2d5aa2baf2b5701::getspawnpointarray(var_55af954984fc6a2a);
    /#
        assert(var_cb5363ab35b26aea.size);
    #/
    foreach (s in var_cb5363ab35b26aea) {
        foreach (player in getteamdata(self.pers["team"], "players")) {
            if (player != self && isdefined(player.pers["arena_spawn_pos"]) && s.script_noteworthy != player.pers["arena_spawn_pos"]) {
                s.selected = 0;
            }
        }
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x43b7
// Size: 0xe6
function getspawnpoint_startspawn(spawnpoints, var_728d3544ba462895) {
    if (!isdefined(spawnpoints)) {
        return undefined;
    }
    bestspawn = undefined;
    spawnpoints = namespace_90f75d3fdf89a43e::checkdynamicspawns(spawnpoints);
    foreach (spawnpoint in spawnpoints) {
        if (!isdefined(spawnpoint.selected)) {
            continue;
        }
        if (spawnpoint.selected) {
            continue;
        }
        if (spawnpoint.script_noteworthy == "1") {
            bestspawn = spawnpoint;
            break;
        } else if (spawnpoint.script_noteworthy == "2") {
            bestspawn = spawnpoint;
            break;
        }
        bestspawn = spawnpoint;
    }
    if (isdefined(bestspawn)) {
        bestspawn.selected = 1;
    }
    return bestspawn;
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x44a5
// Size: 0xb5
function getswitchside_spawnpoint(spawnpoints, var_2b71cdd2f02eb67b) {
    if (!isdefined(spawnpoints)) {
        return undefined;
    }
    var_cee9d4c5101c6ead = 0;
    foreach (spawnpoint in spawnpoints) {
        if (spawnpoint.script_noteworthy == var_2b71cdd2f02eb67b) {
            if (istrue(spawnpoint.selected)) {
                var_cee9d4c5101c6ead = 1;
            } else {
                spawnpoint.selected = 1;
                return spawnpoint;
            }
        }
    }
    /#
        assertex(var_cee9d4c5101c6ead == 1, "Spawns don't have a script_noteworthy to support spawn switches! There should be a "1" or a "2"");
    #/
    return undefined;
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4562
// Size: 0x171
function onplayerconnect(player) {
    level.bots_gametype_handles_class_choice = 1;
    if (istrue(level.resetstats)) {
        player resetpersstats();
    }
    player.arenadamage = 0;
    player setextrascore0(0);
    if (isdefined(player.pers["damage"])) {
        player setextrascore0(player.pers["damage"]);
    }
    player namespace_d19129e4fa5d176::function_a16868d4dcd81a4b();
    player setclientomnvar("ui_launch_chunk_phase", 0);
    if (!istrue(game["chunkFirstAssigned"])) {
        player.pers["gamemodeLoadout"] = level.chunkloadouts[3];
        game["chunkFirstAssigned"] = 1;
    } else if (israndomloadouts() || israndompreviewloadouts() || israndomalphaloadouts()) {
        player.pers["gamemodeLoadout"] = game["arenaRandomLoadout"][game["arenaRandomLoadoutIndex"]];
    } else if (ispickuploadouts()) {
        player.pers["gamemodeLoadout"] = level.arena_loadouts["axis"];
    }
    if (istrue(level.switchspawns) && !isdefined(player.pers["arena_spawn_pos"])) {
        player.pers["arena_spawn_pos"] = "0";
    }
    player thread onjoinedteam();
    player updatehighpriorityweapons();
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x46da
// Size: 0x137
function resetpersstats() {
    self.pers["score"] = 0;
    self.pers["kills"] = 0;
    self.pers["deaths"] = 0;
    self.pers["suicides"] = 0;
    self.pers["headshots"] = 0;
    self.pers["assists"] = 0;
    self.pers["captures"] = 0;
    self.pers["confirmed"] = 0;
    self.pers["denied"] = 0;
    self.pers["extrascore0"] = 0;
    self.pers["extrascore1"] = 0;
    self.pers["extrascore2"] = 0;
    self.pers["damage"] = 0;
    self.pers["gamemodeScore"] = 0;
    self.score = 0;
    self.kills = 0;
    self.deaths = 0;
    self.assists = 0;
    self.extrascore0 = 0;
    self.extrascore1 = 0;
    self.extrascore2 = 0;
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4818
// Size: 0x282
function onjoinedteam() {
    level endon("game_ended");
    for (;;) {
        waittill_any_2("joined_team", "joined_spectators");
        var_586dc9dc0cf668ad = getdvarint(@"hash_b1d561f9a9241e09", 100);
        if (isbot(self)) {
            wait(0.1);
        }
        alliesplayers = getteamdata("allies", "teamCount");
        if (alliesplayers) {
            level.alliesmaxhealth = getteamdata("allies", "teamCount") * var_586dc9dc0cf668ad;
            setomnvar("ui_arena_allies_health_max", level.alliesmaxhealth);
            if (!isreallyalive(self) && namespace_99ac021a7547cae3::mayspawn()) {
                self waittill("spawned_player");
            }
            allieshealth = 0;
            foreach (player in getteamdata("allies", "players")) {
                allieshealth = allieshealth + player.health;
            }
            level.allieshealth = allieshealth;
            if (level.allieshealth < 0) {
                level.allieshealth = 0;
            }
            setomnvar("ui_arena_allies_health", level.allieshealth);
        } else {
            setomnvar("ui_arena_allies_health", 0);
        }
        axisplayers = getteamdata("axis", "teamCount");
        if (axisplayers) {
            level.axismaxhealth = getteamdata("axis", "teamCount") * var_586dc9dc0cf668ad;
            setomnvar("ui_arena_axis_health_max", level.axismaxhealth);
            if (!isreallyalive(self) && namespace_99ac021a7547cae3::mayspawn()) {
                self waittill("spawned_player");
            }
            axishealth = 0;
            foreach (player in getteamdata("axis", "players")) {
                axishealth = axishealth + player.health;
            }
            level.axishealth = axishealth;
            if (level.axishealth < 0) {
                level.axishealth = 0;
            }
            setomnvar("ui_arena_axis_health", level.axishealth);
        } else {
            setomnvar("ui_arena_axis_health", 0);
        }
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4aa1
// Size: 0x24
function onspawnplayer(var_9156b53bcf7ce573) {
    thread onspawnfinished();
    level notify("spawned_player");
    thread updatematchstatushintonspawn();
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4acc
// Size: 0x2d
function function_30203219f14da40c() {
    self notifyonplayercommand("hack_notify", "+gostand");
    self notifyonplayercommand("hack_notify", "+usereload");
    thread function_71980e537adb90fc();
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4b00
// Size: 0x61
function function_71980e537adb90fc() {
    level endon("game_ended");
    self waittill("hack_notify");
    self notify("luinotifyserver", "class_select");
    level notify("pressToStartMatch");
    self setclientomnvar("ui_launch_chunk_phase", 0);
    game["matchStartRequiresInput"] = 0;
    self notifyonplayercommandremove("hack_notify", "+gostand");
    self notifyonplayercommandremove("hack_notify", "+usereload");
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4b68
// Size: 0x3c3
function onspawnfinished() {
    self endon("death_or_disconnect");
    /#
        if (getdvarint(@"hash_d657640801ffcf07", 0) == 1) {
            game["allies"] = 0;
            level notify("roundWinStreak");
        }
    #/
    if (game["matchStartRequiresInput"] && !isbot(self)) {
        foreach (entry in level.teamnamelist) {
            level.requiredplayercount[entry] = 0;
        }
        self setclientomnvar("ui_launch_chunk_phase", game["launchChunkRuleSet"] + 1);
        self setclientomnvar("ui_options_menu", 3);
        wait(2);
        self setclientomnvar("ui_launch_chunk_phase", 5);
        thread function_30203219f14da40c();
        while (1) {
            value = msg = self waittill("luinotifyserver");
            if (msg == "class_select") {
                break;
            }
        }
        level notify("pressToStartMatch");
        self setclientomnvar("ui_launch_chunk_phase", 0);
        game["matchStartRequiresInput"] = 0;
        namespace_944ddf7b8df1b0e3::leaderdialogonplayer("lc_intro", "lc_intro");
    }
    thread damagewatcher();
    self waittill("giveLoadout");
    runarenaloadoutrulesonplayer();
    thread modifyblastshieldperk();
    wait(0.1);
    self.hasarenaspawned = 1;
    if (isbot(self)) {
        if (!isdefined(game["chunkBotsDifficulty"])) {
            var_bce1cf9927e810f2 = "camper";
            game["chunkBotsDifficulty"] = "recruit";
        } else {
            var_c22f59e21c234d66 = randomint(3);
            switch (var_c22f59e21c234d66) {
            case 0:
            default:
                var_bce1cf9927e810f2 = "camper";
                break;
            case 1:
                var_bce1cf9927e810f2 = "run_and_gun";
                break;
            case 2:
                var_bce1cf9927e810f2 = "cqb";
                break;
            }
            var_11bfc6b0e47d4408 = [0:"recruit", 1:"regular", 2:"hardened", 3:"veteran"];
            var_ffe4ad4ade846878 = 0;
            if (isdefined(game["chunkBotsDifficulty"])) {
                for (i = 0; i < var_11bfc6b0e47d4408.size; i++) {
                    if (game["chunkBotsDifficulty"] == var_11bfc6b0e47d4408[i]) {
                        var_ffe4ad4ade846878 = i;
                        break;
                    }
                }
                if (!level.setinitialbotdifficulties && (game["launchChunkRuleSet"] == 1 || game["launchChunkRuleSet"] == 2)) {
                    if (!isbot(self)) {
                        if (game["previousWinningTeam"] == self.team && game["wasHostAliveAtRoundEnd"]) {
                            if (var_ffe4ad4ade846878 < var_11bfc6b0e47d4408.size - 1) {
                                var_ffe4ad4ade846878++;
                            }
                        } else if (var_ffe4ad4ade846878 > 0) {
                            var_ffe4ad4ade846878--;
                        }
                    }
                    game["chunkBotsDifficulty"] = var_11bfc6b0e47d4408[var_ffe4ad4ade846878];
                    level.setinitialbotdifficulties = 1;
                }
            }
        }
        /#
            iprintlnbold("loadoutPrimaryReticle" + game["loadoutExecution"]);
        #/
        self botsetdifficulty(game["chunkBotsDifficulty"]);
        namespace_c52269d70f989750::bot_set_personality(var_bce1cf9927e810f2);
    }
    wait(0.15);
    if (!namespace_4b0406965e556711::gameflag("prematch_done") && game["roundsPlayed"] == 0) {
        if (level.spawnflag && isdefined(level.matchcountdowntime) && level.matchcountdowntime > 5) {
            if (!self issplitscreenplayer() || self issplitscreenplayerprimary()) {
                namespace_944ddf7b8df1b0e3::leaderdialogonplayer("obj_indepth", "introboost");
            }
        }
        level waittill_any_2("prematch_done", "removeArenaOutlines");
    }
    self setclientomnvar("ui_player_notify_loadout", gettime());
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4f32
// Size: 0x5a
function modifyblastshieldperk() {
    blastshieldmod = dvarintvalue("blastShieldMod", 0.65, 0, 1);
    if (isbot(self)) {
        if (blastshieldmod == 0 || game["launchChunkRuleSet"] == 0 || game["launchChunkRuleSet"] == 3) {
            removeperk("specialty_blastshield");
        }
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 14, eflags: 0x0
// Checksum 0x0, Offset: 0x4f93
// Size: 0xf2
function onplayerdamaged(einflictor, eattacker, victim, idamage, idflags, smeansofdeath, objweapon, var_fcdf19e3cdd29669, vpoint, vdir, shitloc, psoffsettime, modelindex, partname) {
    if (isdefined(eattacker) && eattacker != victim && isplayer(eattacker)) {
        if (idamage >= var_fcdf19e3cdd29669) {
            idamage = var_fcdf19e3cdd29669;
        }
        eattacker.arenadamage = eattacker.arenadamage + idamage;
        eattacker namespace_2685ec368e022695::statsetchild("round", "damage", eattacker.pers["damage"]);
        eattacker setextrascore0(eattacker.pers["damage"]);
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x508c
// Size: 0x2b2
function damagewatcher() {
    self notify("startDamageWatcher");
    self endon("startDamageWatcher");
    level endon("game_ended");
    self endon("disconnect");
    self.totaldamagetaken = 0;
    while (1) {
        waittill_any_7("damage", "force_regeneration", "removeAdrenaline", "healed", "naturalHealthRegen", "vampirism", "spawned_player");
        if (self.team == "allies") {
            allieshealth = 0;
            foreach (player in getteamdata("allies", "players")) {
                allieshealth = allieshealth + player.health;
            }
            level.allieshealth = allieshealth;
            if (level.allieshealth < 0) {
                level.allieshealth = 0;
            }
            setomnvar("ui_arena_allies_health", level.allieshealth);
        } else {
            axishealth = 0;
            foreach (player in getteamdata("axis", "players")) {
                axishealth = axishealth + player.health;
            }
            level.axishealth = axishealth;
            if (level.axishealth < 0) {
                level.axishealth = 0;
            }
            setomnvar("ui_arena_axis_health", level.axishealth);
        }
        if (istrue(self.iscapturing)) {
            var_d3ae4cb68808aaa8 = undefined;
            if (level.objmodifier == 1) {
                if (self.team == game["defenders"]) {
                    level.attackerendzone.curprogress = 50;
                    level.attackerendzone.teamprogress[self.team] = 50;
                    var_d3ae4cb68808aaa8 = level.attackerendzone;
                } else if (self.team == game["attackers"]) {
                    level.defenderendzone.curprogress = 50;
                    level.defenderendzone.teamprogress[self.team] = 50;
                    var_d3ae4cb68808aaa8 = level.defenderendzone;
                }
                namespace_5a22b6f3a56f7e9b::objective_set_progress(var_d3ae4cb68808aaa8.objidnum, var_d3ae4cb68808aaa8.curprogress / var_d3ae4cb68808aaa8.usetime);
            }
        }
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x5345
// Size: 0x35f
function onnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    oncommonnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon);
    if (isbot(victim)) {
        victim.classcallback = "gamemode";
    }
    if (game["state"] == "postgame") {
        attacker.finalkill = 1;
    }
    if (game["launchChunkRuleSet"] == 0 || game["launchChunkRuleSet"] == 3) {
        if (isbot(attacker)) {
            if (attacker.kills % 4 == 0 || !isbot(victim)) {
                var_11bfc6b0e47d4408 = [0:"recruit", 1:"regular", 2:"hardened", 3:"veteran"];
                var_ffe4ad4ade846878 = 0;
                difficulty = attacker botgetdifficulty();
                if (difficulty == "recruit") {
                    var_ffe4ad4ade846878 = 0;
                } else if (difficulty == "regular") {
                    var_ffe4ad4ade846878 = 0;
                } else if (difficulty == "hardened") {
                    var_ffe4ad4ade846878 = 1;
                } else if (difficulty == "veteran") {
                    var_ffe4ad4ade846878 = 2;
                }
                attacker botsetdifficulty(var_11bfc6b0e47d4408[var_ffe4ad4ade846878]);
                game["chunkBotsDifficulty"] = var_11bfc6b0e47d4408[var_ffe4ad4ade846878];
                /#
                    iprintlnbold("loadoutPrimaryReticle" + attacker.name + "fraction" + var_11bfc6b0e47d4408[var_ffe4ad4ade846878]);
                #/
            }
        }
        if (isbot(victim)) {
            if (victim.deaths % 2 == 0) {
                var_11bfc6b0e47d4408 = [0:"recruit", 1:"regular", 2:"hardened", 3:"veteran"];
                var_ffe4ad4ade846878 = 0;
                difficulty = victim botgetdifficulty();
                if (difficulty == "recruit") {
                    var_ffe4ad4ade846878 = 1;
                } else if (difficulty == "regular") {
                    var_ffe4ad4ade846878 = 2;
                } else if (difficulty == "hardened") {
                    var_ffe4ad4ade846878 = 3;
                } else if (difficulty == "veteran") {
                    var_ffe4ad4ade846878 = 3;
                }
                victim botsetdifficulty(var_11bfc6b0e47d4408[var_ffe4ad4ade846878]);
                game["chunkBotsDifficulty"] = var_11bfc6b0e47d4408[var_ffe4ad4ade846878];
                /#
                    iprintlnbold("loadoutPrimaryReticle" + victim.name + "offhand_wm_claymore_held" + var_11bfc6b0e47d4408[var_ffe4ad4ade846878]);
                #/
            }
        }
        if (victim.deaths % 3 == 0) {
            game["arenaRandomLoadoutIndex"]++;
            if (game["arenaRandomLoadoutIndex"] == game["arenaRandomLoadout"].size) {
                game["arenaRandomLoadoutIndex"] = 0;
            }
            victim.pers["gamemodeLoadout"] = game["arenaRandomLoadout"][game["arenaRandomLoadoutIndex"]];
        }
    } else if (!isbot(victim)) {
        timeremaining = namespace_d576b6dc7cef9c62::gettimeremaining();
        if (timeremaining > 35000) {
            var_11bfc6b0e47d4408 = [0:"recruit", 1:"regular", 2:"hardened", 3:"veteran"];
            var_ffe4ad4ade846878 = 0;
            difficulty = game["chunkBotsDifficulty"];
            if (difficulty == "recruit") {
                var_ffe4ad4ade846878 = 0;
            } else if (difficulty == "regular") {
                var_ffe4ad4ade846878 = 0;
            } else if (difficulty == "hardened") {
                var_ffe4ad4ade846878 = 1;
            } else if (difficulty == "veteran") {
                var_ffe4ad4ade846878 = 1;
            }
            game["chunkBotsDifficulty"] = var_11bfc6b0e47d4408[var_ffe4ad4ade846878];
            /#
                iprintlnbold("MP_INGAME_ONLY/PICKUP_ATMINE" + var_11bfc6b0e47d4408[var_ffe4ad4ade846878]);
            #/
        }
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x56ab
// Size: 0x73
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00) {
    if (isbot(self)) {
        self.classcallback = "gamemode";
    }
    thread checkallowspectating();
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5725
// Size: 0x89
function checkallowspectating() {
    waitframe();
    update = 0;
    if (!getteamdata(game["attackers"], "aliveCount")) {
        level.spectateoverride[game["attackers"]].allowenemyspectate = 1;
        update = 1;
    }
    if (!getteamdata(game["defenders"], "aliveCount")) {
        level.spectateoverride[game["defenders"]].allowenemyspectate = 1;
        update = 1;
    }
    if (update) {
        namespace_5aeecefc462876::updatespectatesettings();
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x57b5
// Size: 0x83
function ontimelimit() {
    updatetournamentroundtime(namespace_d576b6dc7cef9c62::gettimeremaining(), 3);
    if (game["launchChunkRuleSet"] == 0 || game["launchChunkRuleSet"] == 3) {
        namespace_d576b6dc7cef9c62::default_ontimelimit();
    } else if (level.wincondition == 1) {
        checkliveswinner();
    } else if (level.wincondition == 2) {
        checkhealthwinner();
    } else {
        checkhealthwinner();
    }
    if (game["launchChunkRuleSet"] != 3) {
        level tryspawnlaunchchunkbots();
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x583f
// Size: 0x39
function ontimelimitot() {
    updatetournamentroundtime(namespace_d576b6dc7cef9c62::gettimeremaining(), 1);
    var_5f7407bf2b59f865 = 1;
    if (getgametypenumlives() == 0) {
        var_5f7407bf2b59f865 = 0;
    }
    if (var_5f7407bf2b59f865) {
        level thread startotmechanics();
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x587f
// Size: 0xf2
function checkliveswinner() {
    if (getteamdata("allies", "aliveCount") > getteamdata("axis", "aliveCount")) {
        game["dialog"]["round_success"] = "gamestate_win_health";
        game["dialog"]["round_failure"] = "gamestate_lost_health";
        thread arena_endgame("allies", game["end_reason"]["arena_time_lives_win"], game["end_reason"]["arena_time_lives_loss"]);
    } else if (getteamdata("axis", "aliveCount") > getteamdata("allies", "aliveCount")) {
        game["dialog"]["round_success"] = "gamestate_win_health";
        game["dialog"]["round_failure"] = "gamestate_lost_health";
        thread arena_endgame("axis", game["end_reason"]["arena_time_lives_win"], game["end_reason"]["arena_time_lives_loss"]);
    } else {
        checkhealthwinner();
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5978
// Size: 0x11c
function checkhealthwinner() {
    if (level.axishealth < level.allieshealth) {
        game["dialog"]["round_success"] = "gamestate_win_health";
        game["dialog"]["round_failure"] = "gamestate_lost_health";
        thread arena_endgame("allies", game["end_reason"]["arena_time_health_win"], game["end_reason"]["arena_time_health_loss"]);
    } else if (level.allieshealth < level.axishealth) {
        game["dialog"]["round_success"] = "gamestate_win_health";
        game["dialog"]["round_failure"] = "gamestate_lost_health";
        thread arena_endgame("axis", game["end_reason"]["arena_time_health_win"], game["end_reason"]["arena_time_health_loss"]);
    } else if (matchmakinggame()) {
        var_d1c52bd1768483b2 = namespace_d576b6dc7cef9c62::getbetterteam();
        thread namespace_d576b6dc7cef9c62::endgame(var_d1c52bd1768483b2, game["end_reason"]["time_limit_reached"]);
    } else {
        thread arena_endgame("tie", game["end_reason"]["time_limit_reached"]);
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5a9b
// Size: 0x7f
function ondeadevent(team) {
    if (team == game["attackers"]) {
        level thread arena_endgame(game["defenders"], game["end_reason"][tolower(game[game["attackers"]]) + "_eliminated"]);
    } else if (team == game["defenders"]) {
        level thread arena_endgame(game["attackers"], game["end_reason"][tolower(game[game["defenders"]]) + "_eliminated"]);
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5b21
// Size: 0xc
function ontimelimitdeadevent(team) {
    
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x5b34
// Size: 0x2a2
function arena_endgame(winningteam, endreasontext, var_656b99fc50e799ae, nukedetonated, var_8e4a26ed257a393b) {
    if (isgungameloadouts() || isrvsgungameloadouts()) {
        level setenemyloadoutomnvarsatmatchend(winningteam);
    }
    if (winningteam != "tie") {
        game["previousWinningTeam"] = winningteam;
        foreach (entry in level.teamnamelist) {
            if (entry == winningteam) {
                game["roundWinStreak"][winningteam]++;
            } else {
                game["roundWinStreak"][entry] = 0;
            }
        }
        switch (game["roundWinStreak"][winningteam]) {
        case 2:
            game["dialog"]["round_success"] = "round_win_streak_2";
            break;
        case 3:
            game["dialog"]["round_success"] = "round_win_streak_3";
            break;
        case 4:
            game["dialog"]["round_success"] = "round_win_streak_4";
            break;
        case 5:
            roundswon = getroundswon(winningteam);
            winlimit = getwatcheddvar("winlimit");
            if (winlimit == 6 && roundswon != winlimit - 1) {
                game["dialog"]["round_success"] = "round_win_streak_5";
            }
            break;
        default:
            break;
        }
        if (game["finalRound"] == 1) {
            if (game["roundWinStreak"][winningteam] > 3) {
                game["dialog"]["mission_success"] = "gamestate_win_comeback";
            }
        }
    } else {
        game["previousWinningTeam"] = "";
    }
    hostplayer = undefined;
    foreach (player in level.players) {
        if (!isbot(player)) {
            hostplayer = player;
        }
    }
    if (isdefined(hostplayer) && !isalive(hostplayer)) {
        game["wasHostAliveAtRoundEnd"] = 0;
    } else {
        game["wasHostAliveAtRoundEnd"] = 1;
    }
    thread namespace_d576b6dc7cef9c62::endgame(winningteam, endreasontext, var_656b99fc50e799ae, nukedetonated, var_8e4a26ed257a393b);
    if (game["launchChunkRuleSet"] != 3) {
        level thread tryspawnlaunchchunkbots();
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5ddd
// Size: 0x5e
function setroundwinstreakarray() {
    wait(1);
    foreach (entry in level.teamnamelist) {
        game["roundWinStreak"][entry] = 0;
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5e42
// Size: 0xdb
function runarenaloadoutrulesonplayer() {
    if (israndomloadouts() || israndompreviewloadouts() || israndomalphaloadouts()) {
        if (israndompreviewloadouts() || israndomalphaloadouts()) {
            if (self.pers["gamemodeLoadout"]["loadoutSecondary"] == "none") {
                _takeweapon("iw9_me_fists_mp");
            }
        }
    } else if (ispickuploadouts()) {
        self.equipment = [];
        if (game["roundsPlayed"] == 0) {
            wait(0.1);
        } else {
            wait(0.25);
        }
        if (issubstr(level.startweapon, "equip")) {
            namespace_1a507865f681850e::giveequipment(level.startweapon, namespace_1a507865f681850e::getdefaultslot(level.startweapon));
        }
        if (level.takefists) {
            _takeweapon("iw9_me_fists_mp");
        }
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5f24
// Size: 0x248
function buildloadoutsforweaponstreaming() {
    level.loadweapons = [];
    level.takefists = 0;
    if (ispickuploadouts()) {
        if (level.startweapon == "none") {
            newweapon = "iw9_me_fists_mp";
            var_66b3db972ac1531e = makeweapon(newweapon);
            newweapon = getcompleteweaponname(var_66b3db972ac1531e);
        } else if (issubstr(level.startweapon, "equip")) {
            newweapon = "iw9_me_fists_mp";
            var_66b3db972ac1531e = makeweapon(newweapon);
            newweapon = getcompleteweaponname(var_66b3db972ac1531e);
        } else {
            rootname = namespace_e0ee43ef2dddadaa::getweaponrootname(level.startweapon);
            attachments = [];
            var_66b3db972ac1531e = namespace_e0ee43ef2dddadaa::buildweapon(rootname, attachments, "none", "none", -1);
            newweapon = getcompleteweaponname(var_66b3db972ac1531e);
            level.takefists = 1;
        }
        level.newweaponname = newweapon;
        level.loadweapons[level.loadweapons.size] = var_66b3db972ac1531e;
    } else {
        primaries = [];
        var_2aee5a9b1a165f09 = [];
        loadout = game["arenaRandomLoadout"][game["arenaRandomLoadoutIndex"]];
        primary = loadout["loadoutPrimary"];
        secondary = loadout["loadoutSecondary"];
        if (primary != "none") {
            primaries[primaries.size] = buildprimaries(primary, loadout);
        }
        if (secondary != "none") {
            var_2aee5a9b1a165f09[var_2aee5a9b1a165f09.size] = buildsecondaries(secondary, loadout);
        }
        if (level.loadoutchangeround != 0) {
            var_a9c56228c41ecda0 = game["arenaRandomLoadoutIndex"] + 1;
            if (game["arenaRandomLoadoutIndex"] == game["arenaRandomLoadout"].size - 1) {
                var_a9c56228c41ecda0 = 0;
            }
            var_c3d433af5f864e84 = game["arenaRandomLoadout"][var_a9c56228c41ecda0];
            var_c03d6dd4bfb14c5a = var_c3d433af5f864e84["loadoutPrimary"];
            var_fccb1d1573e7f2a6 = var_c3d433af5f864e84["loadoutSecondary"];
            if (var_c03d6dd4bfb14c5a != "none") {
                primaries[primaries.size] = buildprimaries(var_c03d6dd4bfb14c5a, var_c3d433af5f864e84);
            }
            if (var_fccb1d1573e7f2a6 != "none") {
                var_2aee5a9b1a165f09[var_2aee5a9b1a165f09.size] = buildsecondaries(var_fccb1d1573e7f2a6, var_c3d433af5f864e84);
            }
        }
        level.loadweapons = array_combine(primaries, var_2aee5a9b1a165f09);
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6173
// Size: 0xd8
function buildprimaries(primary, loadout) {
    var_ac82e189f4d06152 = [];
    for (i = 1; i < 6; i++) {
        concat = i;
        if (i == 1) {
            concat = "";
        }
        attachment = loadout["loadoutPrimaryAttachment" + concat];
        if (attachment != "none") {
            var_ac82e189f4d06152[var_ac82e189f4d06152.size] = attachment;
        }
    }
    rootname = getweaponrootname(primary);
    camoname = "none";
    reticleindex = "none";
    var_2cf0771420522cb6 = namespace_e0ee43ef2dddadaa::buildweapon(rootname, var_ac82e189f4d06152, camoname, reticleindex);
    newweapon = getcompleteweaponname(var_2cf0771420522cb6);
    return newweapon;
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6253
// Size: 0xd8
function buildsecondaries(secondary, loadout) {
    var_ac82e189f4d06152 = [];
    for (i = 1; i < 5; i++) {
        concat = i;
        if (i == 1) {
            concat = "";
        }
        attachment = loadout["loadoutSecondaryAttachment" + concat];
        if (attachment != "none") {
            var_ac82e189f4d06152[var_ac82e189f4d06152.size] = attachment;
        }
    }
    camoname = "none";
    reticleindex = "none";
    rootname = getweaponrootname(secondary);
    var_2cf0771420522cb6 = namespace_e0ee43ef2dddadaa::buildweapon(rootname, var_ac82e189f4d06152, camoname, reticleindex);
    newweapon = getcompleteweaponname(var_2cf0771420522cb6);
    return newweapon;
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6333
// Size: 0x2ef
function defineplayerloadout() {
    if (isdefined(level.startweapon) && level.startweapon != "none" && !issubstr(level.startweapon, "equip")) {
        primary = namespace_e0ee43ef2dddadaa::getweaponrootname(level.startweapon);
    } else {
        primary = "none";
    }
    level.arena_loadouts["default"]["loadoutArchetype"] = "archetype_assault";
    level.arena_loadouts["default"]["loadoutPrimary"] = primary;
    level.arena_loadouts["default"]["loadoutPrimaryAttachment"] = "none";
    level.arena_loadouts["default"]["loadoutPrimaryAttachment2"] = "none";
    level.arena_loadouts["default"]["loadoutPrimaryCamo"] = "none";
    level.arena_loadouts["default"]["loadoutPrimaryReticle"] = "none";
    level.arena_loadouts["default"]["loadoutSecondary"] = "none";
    level.arena_loadouts["default"]["loadoutSecondaryAttachment"] = "none";
    level.arena_loadouts["default"]["loadoutSecondaryAttachment2"] = "none";
    level.arena_loadouts["default"]["loadoutSecondaryCamo"] = "none";
    level.arena_loadouts["default"]["loadoutSecondaryReticle"] = "none";
    level.arena_loadouts["default"]["loadoutMeleeSlot"] = "iw9_me_fists_mp_ls";
    level.arena_loadouts["default"]["loadoutEquipmentPrimary"] = "none";
    level.arena_loadouts["default"]["loadoutEquipmentSecondary"] = "none";
    level.arena_loadouts["default"]["loadoutStreakType"] = "assault";
    level.arena_loadouts["default"]["loadoutKillstreak1"] = "none";
    level.arena_loadouts["default"]["loadoutKillstreak2"] = "none";
    level.arena_loadouts["default"]["loadoutKillstreak3"] = "none";
    level.arena_loadouts["default"]["loadoutSuper"] = "none";
    level.arena_loadouts["default"]["loadoutPerks"] = [0:"specialty_blastshield"];
    level.arena_loadouts["default"]["loadoutGesture"] = "playerData";
    level.arena_loadouts["default"]["loadoutExecution"] = "playerData";
    level.arena_loadouts["allies"] = level.arena_loadouts["default"];
    level.arena_loadouts["axis"] = level.arena_loadouts["default"];
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6629
// Size: 0xe4
function updaterandomloadout() {
    if (israndomloadouts() || israndompreviewloadouts() || israndomalphaloadouts()) {
        /#
            if (getdvarint(@"hash_b665ceb14dabc0ed", 0) != 0) {
                cacherandomloadouts();
                game["outline_nodepth_orange"] = 0;
                return;
            }
        #/
        if (game["roundsPlayed"] == 0) {
            if (istrue(game["practiceRound"])) {
                cacherandomloadouts();
                game["arenaRandomLoadoutIndex"] = 0;
            } else if (!isdefined(game["practiceRound"])) {
                cacherandomloadouts();
                game["arenaRandomLoadoutIndex"] = 0;
            }
        } else if (level.loadoutchangeround != 0) {
            if (game["roundsPlayed"] % level.loadoutchangeround == 0) {
                game["arenaRandomLoadoutIndex"]++;
            }
            if (game["arenaRandomLoadoutIndex"] == game["arenaRandomLoadout"].size) {
                game["arenaRandomLoadoutIndex"] = 0;
            }
        } else {
            game["arenaRandomLoadoutIndex"] = 0;
        }
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6714
// Size: 0x110
function cacherandomloadouts() {
    game["arenaRandomLoadout"] = [];
    level.chunkloadouts = [];
    var_57c2fbe37e0787ea = namespace_47e715c4f9510479::function_3187496929140714([0:"arena_alt_class_table"]);
    foreach (classtable in var_57c2fbe37e0787ea) {
        foreach (loadout in classtable.var_8d5460be7db831c3) {
            level.chunkloadouts[level.chunkloadouts.size] = namespace_47e715c4f9510479::function_37f8be8199814f97(loadout);
        }
    }
    loadouts = level.chunkloadouts;
    loadouts = arenaloadouts_select(loadouts, 99);
    game["arenaRandomLoadout"] = array_randomize(loadouts);
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x682b
// Size: 0x1be
function updateloadoutarray(table, classindex) {
    var_e698df1ec0933ce4 = [];
    var_e698df1ec0933ce4["loadoutPrimary"] = namespace_d19129e4fa5d176::table_getweapon(table, classindex, 0);
    for (attachmentindex = 0; attachmentindex < namespace_d19129e4fa5d176::getmaxprimaryattachments(); attachmentindex++) {
        var_efbdcd88107af5f9 = namespace_d19129e4fa5d176::getattachmentloadoutstring(attachmentindex, #"primary");
        var_e698df1ec0933ce4[var_efbdcd88107af5f9] = namespace_d19129e4fa5d176::table_getweaponattachment(table, classindex, 0, attachmentindex);
    }
    var_e698df1ec0933ce4["loadoutPrimaryCamo"] = namespace_d19129e4fa5d176::table_getweaponcamo(table, classindex, 0);
    var_e698df1ec0933ce4["loadoutPrimaryReticle"] = namespace_d19129e4fa5d176::table_getweaponreticle(table, classindex, 0);
    var_e698df1ec0933ce4["loadoutSecondary"] = namespace_d19129e4fa5d176::table_getweapon(table, classindex, 1);
    for (attachmentindex = 0; attachmentindex < namespace_d19129e4fa5d176::getmaxsecondaryattachments(); attachmentindex++) {
        var_efbdcd88107af5f9 = namespace_d19129e4fa5d176::getattachmentloadoutstring(attachmentindex, #"secondary");
        var_e698df1ec0933ce4[var_efbdcd88107af5f9] = namespace_d19129e4fa5d176::table_getweaponattachment(table, classindex, 1, attachmentindex);
    }
    var_e698df1ec0933ce4["loadoutSecondaryCamo"] = namespace_d19129e4fa5d176::table_getweaponcamo(table, classindex, 1);
    var_e698df1ec0933ce4["loadoutSecondaryReticle"] = namespace_d19129e4fa5d176::table_getweaponreticle(table, classindex, 1);
    var_e698df1ec0933ce4["loadoutEquipmentPrimary"] = namespace_d19129e4fa5d176::table_getequipmentprimary(table, classindex);
    var_e698df1ec0933ce4["loadoutExtraEquipmentPrimary"] = namespace_d19129e4fa5d176::table_getextraequipmentprimary(table, classindex);
    var_e698df1ec0933ce4["loadoutEquipmentSecondary"] = namespace_d19129e4fa5d176::table_getequipmentsecondary(table, classindex);
    var_e698df1ec0933ce4["loadoutExtraEquipmentSecondary"] = namespace_d19129e4fa5d176::table_getextraequipmentsecondary(table, classindex);
    var_e698df1ec0933ce4["loadoutPerks"] = [];
    for (i = 0; i < 3; i++) {
        perk = namespace_d19129e4fa5d176::table_getperk(table, classindex, i);
        if (perk != "specialty_null") {
            var_e698df1ec0933ce4["loadoutPerks"][var_e698df1ec0933ce4["loadoutPerks"].size] = perk;
        }
    }
    var_e698df1ec0933ce4["loadoutGesture"] = "playerData";
    var_e698df1ec0933ce4["loadoutExecution"] = "playerData";
    return var_e698df1ec0933ce4;
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x69f1
// Size: 0x7d
function arenaloadouts_select(loadouts, count) {
    classes = [];
    var_b0bc46f3ba5db389 = [];
    for (num = 0; num < count && loadouts.size > 0; num++) {
        var_b0bc46f3ba5db389[var_b0bc46f3ba5db389.size] = loadouts[randomint(loadouts.size)];
        var_acfe7336f59b3d76 = var_b0bc46f3ba5db389[var_b0bc46f3ba5db389.size - 1]["loadoutPrimary"];
        loadouts = arenaloadouts_removeclass(loadouts, var_acfe7336f59b3d76);
    }
    return var_b0bc46f3ba5db389;
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6a76
// Size: 0x9e
function arenaloadouts_removeclass(loadouts, var_acfe7336f59b3d76) {
    var_7cb19f95dbc68942 = [];
    group = arenaloadouts_getweapongroup(var_acfe7336f59b3d76);
    foreach (loadout in loadouts) {
        var_edcf839453192090 = arenaloadouts_getweapongroup(loadout["loadoutPrimary"]);
        if (group != var_edcf839453192090) {
            var_7cb19f95dbc68942[var_7cb19f95dbc68942.size] = loadout;
        }
    }
    return var_7cb19f95dbc68942;
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6b1c
// Size: 0x41
function arenaloadouts_getweapongroup(rootweapon) {
    group = "none";
    if (rootweapon != "none") {
        group = namespace_68e641469fde3fa7::getweapongroup(rootweapon);
        if (group == "weapon_dmr") {
            group = "weapon_sniper";
        }
    }
    return group;
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6b65
// Size: 0xc7
function function_e427e359bb108351() {
    level.weaponcategories = [];
    level.allweapons = [];
    for (row = 0; 1; row++) {
        tablename = "mp/arenaGGWeapons_alt.csv";
        categoryname = tablelookupbyrow(tablename, row, 4);
        if (categoryname == "") {
            break;
        }
        if (!isdefined(level.weaponcategories[categoryname])) {
            level.weaponcategories[categoryname] = [];
        }
        data = [];
        data["weapon"] = tablelookupbyrow(tablename, row, 0);
        level.weaponcategories[categoryname][level.weaponcategories[categoryname].size] = data;
        level.allweapons[level.allweapons.size] = data;
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6c33
// Size: 0x114
function function_fbc569a8b64fe92b(categoryname) {
    weaponlist = level.weaponcategories[categoryname];
    if (isdefined(weaponlist) && weaponlist.size > 0) {
        newweapon = "";
        data = undefined;
        for (loopcount = 0; 1; loopcount++) {
            index = randomintrange(0, weaponlist.size);
            data = weaponlist[index];
            rootname = getweaponrootname(data["weapon"]);
            if (loopcount > weaponlist.size) {
                level.selectedweapons[rootname] = 1;
                newweapon = data["weapon"];
                for (i = 0; i < level.weaponcategories[categoryname].size; i++) {
                    if (level.weaponcategories[categoryname][i]["weapon"] == newweapon) {
                        break;
                    }
                }
                break;
            }
        }
        return newweapon;
    } else {
        /#
            assertmsg("Unknown weapon category name " + categoryname);
        #/
        return "none";
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6d4e
// Size: 0xbb
function initweaponmap() {
    level.baseraritymap = [];
    level.baseraritymap[level.arenaweapont1] = 0;
    level.baseraritymap[level.arenaweapont2] = 1;
    level.baseraritymap[level.arenaweapont3] = 2;
    level.baseraritymap[level.arenaweapont4] = 3;
    level.baseraritymap[level.arenaweapont5] = 4;
    level.baseraritymap[level.arenaweapont6] = 5;
    level.baseraritymap[level.arenaweapont7] = 6;
    level.baseraritymap[level.arenaweapont8] = 0;
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6e10
// Size: 0x1b2
function setupweapons() {
    locs = getstructarray("weapon_pickup", "targetname");
    /#
        assertex(locs.size > 0, "Arena loadouts set to 'none' but weapon pickup spawn locations are not placed in the level!");
    #/
    foreach (loc in locs) {
        if (loc.script_label == "1") {
            spawnweapon(loc, level.arenaweapont1);
        } else if (loc.script_label == "2") {
            spawnweapon(loc, level.arenaweapont2);
        } else if (loc.script_label == "3") {
            spawnweapon(loc, level.arenaweapont3);
        } else if (loc.script_label == "4") {
            spawnweapon(loc, level.arenaweapont4);
        } else if (loc.script_label == "5") {
            spawnweapon(loc, level.arenaweapont5);
        } else if (loc.script_label == "6") {
            spawnweapon(loc, level.arenaweapont6);
        } else if (loc.script_label == "7") {
            spawnweapon(loc, level.arenaweapont7);
        } else if (loc.script_label == "8") {
            spawnweapon(loc, level.arenaweapont8);
        }
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6fc9
// Size: 0x11f
function getrandomspawnweapon() {
    weaponlist = level.allweapons;
    if (isdefined(weaponlist) && weaponlist.size > 0) {
        newweapon = "";
        data = undefined;
        for (loopcount = 0; 1; loopcount++) {
            index = randomintrange(0, weaponlist.size);
            data = weaponlist[index];
            if (!issubstr(data["weapon"], "equip")) {
                rootname = getweaponrootname(data["weapon"]);
            } else {
                rootname = data["weapon"];
            }
            if (loopcount > weaponlist.size) {
                level.selectedweapons[rootname] = 1;
                newweapon = data["weapon"];
                for (i = 0; i < level.allweapons.size; i++) {
                    if (level.allweapons[i]["weapon"] == newweapon) {
                        break;
                    }
                }
                break;
            }
        }
        return newweapon;
    } else {
        /#
            assertmsg("Unknown weapon list");
        #/
        return "none";
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x70ef
// Size: 0x42f
function spawnweapon(loc, var_63573dfb900dd221) {
    if (var_63573dfb900dd221 == "none") {
        return;
    }
    tracestart = loc.origin + (0, 0, 32);
    traceend = loc.origin + (0, 0, -32);
    trace = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, undefined, namespace_2a184fc4902783dc::create_default_contents(1));
    var_1f9238ce81ea0d85 = fixuppickuporigin(loc);
    if (trace["fraction"] < 1) {
        var_1f9238ce81ea0d85 = trace["position"] + (0, 0, 2);
    }
    var_825bb0b1ff925278 = getequipmentmodel(var_63573dfb900dd221);
    if (var_825bb0b1ff925278 != "") {
        equipment = spawn("script_model", var_1f9238ce81ea0d85);
        equipment setmodel(var_825bb0b1ff925278);
        if (isdefined(loc.angles)) {
            if (var_63573dfb900dd221 == "equip_claymore" || var_63573dfb900dd221 == "equip_at_mine" || var_63573dfb900dd221 == "equip_trophy") {
                if (isdefined(loc.script_noteworthy) && loc.script_noteworthy == "wall") {
                    equipment.angles = (270, loc.angles[1], 90);
                } else {
                    equipment.angles = (0, loc.angles[1], 0);
                }
            } else if (var_63573dfb900dd221 == "equip_c4") {
                if (isdefined(loc.script_noteworthy) && loc.script_noteworthy == "wall") {
                    equipment.angles = (180, loc.angles[1], 180);
                } else {
                    equipment.angles = (0, loc.angles[1], 90);
                }
            } else {
                equipment.angles = (0, 90, 0);
                equipment.origin = equipment.origin + (0, 0, 2);
            }
        } else {
            equipment.angles = (0, 0, 90);
        }
        userange = 128;
        var_5dc911e38b550433 = equipment getequipmenthintstring(var_63573dfb900dd221);
        var_36e496cdbc979837 = equipment getequipmenthinticon(var_63573dfb900dd221);
        equipment.equipment = var_63573dfb900dd221;
        equipment makeusable();
        equipment sethinttag("tag_origin");
        equipment setcursorhint("HINT_BUTTON");
        equipment sethinticon(var_36e496cdbc979837);
        equipment setuseholdduration("duration_none");
        equipment setusehideprogressbar(1);
        equipment sethintstring(var_5dc911e38b550433);
        equipment setusepriority(0);
        equipment sethintdisplayrange(userange);
        equipment sethintdisplayfov(120);
        equipment setuserange(userange);
        equipment setusefov(360);
        equipment sethintonobstruction("hide");
        equipment thread outlineequipmentwatchplayerprox(var_825bb0b1ff925278, var_63573dfb900dd221);
        equipment thread watchequipmentpickup();
    } else {
        rootname = undefined;
        rootname = namespace_e0ee43ef2dddadaa::getweaponrootname(var_63573dfb900dd221);
        attachments = [];
        userange = 128;
        objweapon = namespace_e0ee43ef2dddadaa::buildweapon(rootname, attachments, "none", "none", -1);
        weaponname = getcompleteweaponname(objweapon);
        weapon = spawn("weapon_" + weaponname, var_1f9238ce81ea0d85, 17);
        weapon sethintdisplayrange(userange);
        weapon setuserange(userange);
        manageweaponstartingammo(weapon, weaponname);
        if (isdefined(loc.angles)) {
            weapon.angles = loc.angles;
        } else {
            weapon.angles = (0, 0, 90);
        }
        weapon thread outlinewatchplayerprox();
        weapon thread watchpickup();
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7525
// Size: 0xdc
function fixuppickuporigin(loc) {
    if (isdefined(loc.script_label) && loc.script_label == "3" && distance(loc.origin, (-488.2, -399.9, 54.25)) < 10) {
        loc.origin = (-488.2, -409.9, 54.25);
    } else if (isdefined(loc.script_label) && loc.script_label == "5" && distance(loc.origin, (657.3, 644.6, 56)) < 10) {
        loc.origin = (665.3, 644.6, 56);
    }
    return loc.origin;
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7609
// Size: 0x135
function getequipmentmodel(weapon) {
    switch (weapon) {
    case #"hash_8c7819f0a3fbd1e0":
        return "offhand_wm_grenade_mike67";
    case #"hash_f0907f858c134cb4":
        return "offhand_wm_grenade_semtex";
    case #"hash_4320d77f90725183":
        return "offhand_wm_c4";
    case #"hash_2354208d9af64220":
        return "offhand_wm_claymore_held";
    case #"hash_3995658e01f4fac1":
        return "offhand_wm_at_mine";
    case #"hash_9ba0a6ff6081954e":
        return "weapon_wm_me_soscar_knife_offhand_thrown";
    case #"hash_142a787e36d7d7ce":
        return "offhand_wm_molotov";
    case #"hash_de4641ddbc44a7ba":
        return "offhand_wm_grenade_semtex";
    case #"hash_5a562592c930b7d6":
        return "offhand_wm_grenade_flash";
    case #"hash_4f62b5fa00ecd075":
        return "offhand_wm_grenade_snapshot_mp";
    case #"hash_fb6b649176cec75d":
        return "offhand_wm_grenade_smoke";
    case #"hash_5fca4943a78ace9c":
        return "offhand_wm_grenade_concussion";
    case #"hash_c848458cca24d656":
        return "offhand_wm_trophy_system";
    case #"hash_15d06a7d7efafe8":
        return "offhand_wm_grenade_decoy";
    case #"hash_25ac81b822cf0c9f":
        return "offhand_wm_stim";
    default:
        return "";
        break;
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7745
// Size: 0x207
function getequipmenthintstring(weapon) {
    switch (weapon) {
    case #"hash_8c7819f0a3fbd1e0":
        self.equiptype = "primary";
        return "MP_INGAME_ONLY/PICKUP_FRAG";
    case #"hash_f0907f858c134cb4":
        self.equiptype = "primary";
        return "MP_INGAME_ONLY/PICKUP_SEMTEX";
    case #"hash_4320d77f90725183":
        self.equiptype = "primary";
        return "MP_INGAME_ONLY/PICKUP_C4";
    case #"hash_2354208d9af64220":
        self.equiptype = "primary";
        return "MP_INGAME_ONLY/PICKUP_CLAYMORE";
    case #"hash_3995658e01f4fac1":
        self.equiptype = "primary";
        return "MP_INGAME_ONLY/PICKUP_ATMINE";
    case #"hash_9ba0a6ff6081954e":
        self.equiptype = "primary";
        return "MP_INGAME_ONLY/PICKUP_TKNIFE";
    case #"hash_142a787e36d7d7ce":
        self.equiptype = "primary";
        return "MP_INGAME_ONLY/PICKUP_MOLOTOV";
    case #"hash_de4641ddbc44a7ba":
        self.equiptype = "primary";
        return "MP_INGAME_ONLY/PICKUP_THERMITE";
    case #"hash_5a562592c930b7d6":
        self.equiptype = "secondary";
        return "MP_INGAME_ONLY/PICKUP_FLASH";
    case #"hash_4f62b5fa00ecd075":
        self.equiptype = "secondary";
        return "MP_INGAME_ONLY/PICKUP_SNAPSHOT";
    case #"hash_fb6b649176cec75d":
        self.equiptype = "secondary";
        return "MP_INGAME_ONLY/PICKUP_SMOKE";
    case #"hash_5fca4943a78ace9c":
        self.equiptype = "secondary";
        return "MP_INGAME_ONLY/PICKUP_STUN";
    case #"hash_c848458cca24d656":
        self.equiptype = "secondary";
        return "MP_INGAME_ONLY/PICKUP_TROPHY_SYSTEM";
    case #"hash_15d06a7d7efafe8":
        self.equiptype = "secondary";
        return "MP_INGAME_ONLY/PICKUP_DECOY";
    case #"hash_25ac81b822cf0c9f":
        self.equiptype = "secondary";
        return "MP_INGAME_ONLY/PICKUP_STIM";
    default:
        return "";
        break;
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7953
// Size: 0x32
function getequipmenthinticon(weapon) {
    table = "mp/arenaGGWeapons.csv";
    icon = tablelookup(table, 0, weapon, 3);
    return icon;
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x798d
// Size: 0xa1
function manageweaponstartingammo(weapon, weaponname) {
    mag = weaponclipsize(weaponname);
    var_6f592a5fb739460 = 0;
    if (level.magcount != 3) {
        var_640c8b74fc979400 = !level.magcount;
        if (var_640c8b74fc979400) {
            mag = 0;
            var_6f592a5fb739460 = 0;
        } else {
            var_6f592a5fb739460 = level.magcount - 1;
        }
        if (level.magcount == 7) {
            var_6f592a5fb739460 = weaponmaxammo(weaponname);
        } else {
            var_6f592a5fb739460 = mag * var_6f592a5fb739460;
        }
    } else {
        var_6f592a5fb739460 = mag * 2;
    }
    weapon itemweaponsetammo(mag, var_6f592a5fb739460);
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7a35
// Size: 0x13c
function watchequipmentpickup() {
    self endon("death");
    droppeditem = player = self waittill("trigger");
    hasmaxammo = 0;
    var_f23035e6f6b69f91 = checkissameequip(player);
    var_c89f07da007ff0d = checkpickupequiptypeammocount(player);
    var_8b9ab3abae98d973 = player namespace_1a507865f681850e::getequipmentmaxammo(self.equipment);
    var_b64209459da65860 = checkcurrentequiptypeammocount(player);
    if (var_f23035e6f6b69f91) {
        if (var_c89f07da007ff0d == var_8b9ab3abae98d973) {
            hasmaxammo = 1;
        }
    }
    if (var_f23035e6f6b69f91 && !hasmaxammo) {
        player namespace_1a507865f681850e::incrementequipmentammo(self.equipment, 1);
    } else if (var_b64209459da65860 && !var_f23035e6f6b69f91) {
        player dropoldequipinplace(player namespace_1a507865f681850e::getcurrentequipment(self.equiptype));
    }
    if (!var_f23035e6f6b69f91) {
        player namespace_1a507865f681850e::giveequipment(self.equipment, self.equiptype);
    }
    if (var_f23035e6f6b69f91 && hasmaxammo) {
        player iprintlnbold("MP_INGAME_ONLY/EQUIPMENT_MAXED");
        thread watchequipmentpickup();
    } else {
        player playlocalsound("scavenger_pack_pickup");
        clearweaponoutlines();
        self makeunusable();
        self delete();
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7b78
// Size: 0x1c
function checkpickupequiptypeammocount(player) {
    return player namespace_1a507865f681850e::getequipmentammo(self.equipment);
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7b9c
// Size: 0x3a
function checkcurrentequiptypeammocount(player) {
    var_1189bd7fbe2861f8 = player namespace_1a507865f681850e::getcurrentequipment(self.equiptype);
    if (isdefined(var_1189bd7fbe2861f8)) {
        return player namespace_1a507865f681850e::getequipmentammo(var_1189bd7fbe2861f8);
    } else {
        return 0;
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7bdd
// Size: 0x3d
function checkissameequip(player) {
    var_1189bd7fbe2861f8 = player namespace_1a507865f681850e::getcurrentequipment(self.equiptype);
    if (isdefined(var_1189bd7fbe2861f8)) {
        return (self.equipment == var_1189bd7fbe2861f8);
    } else {
        return 0;
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7c21
// Size: 0x15
function dropoldequipinplace(equipment) {
    spawnweapon(self, equipment);
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7c3d
// Size: 0x46
function watchpickup() {
    self endon("death");
    droppeditem = player = self waittill("trigger");
    clearweaponoutlines();
    if (isdefined(droppeditem)) {
        droppeditem thread outlinewatchplayerprox();
        droppeditem thread watchpickup();
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7c8a
// Size: 0x1f8
function setenemyloadoutomnvars() {
    enemyplayer = undefined;
    if (!isdefined(self.pers["team"])) {
        otherteam = "allies";
    } else {
        otherteam = getotherteam(self.pers["team"])[0];
    }
    foreach (player in level.players) {
        if (player.team == otherteam) {
            enemyplayer = player;
            break;
        }
    }
    if (!isdefined(enemyplayer)) {
        enemyplayer = self;
    }
    table = "mp/arenaGGWeapons.csv";
    self setclientomnvar("ui_arena_en_primary", -1);
    self setclientomnvar("ui_arena_en_secondary", -1);
    self setclientomnvar("ui_arena_en_lethal", -1);
    self setclientomnvar("ui_arena_en_tactical", -1);
    primary = int(tablelookup(table, 0, enemyplayer.pers["gamemodeLoadout"]["loadoutPrimary"], 1));
    self setclientomnvar("ui_arena_en_primary", primary);
    secondary = int(tablelookup(table, 0, enemyplayer.pers["gamemodeLoadout"]["loadoutSecondary"], 1));
    self setclientomnvar("ui_arena_en_secondary", secondary);
    lethal = int(tablelookup(table, 0, enemyplayer.pers["gamemodeLoadout"]["loadoutEquipmentPrimary"], 1));
    self setclientomnvar("ui_arena_en_lethal", lethal);
    tactical = int(tablelookup(table, 0, enemyplayer.pers["gamemodeLoadout"]["loadoutEquipmentSecondary"], 1));
    self setclientomnvar("ui_arena_en_tactical", tactical);
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7e89
// Size: 0x75
function getgungameloadoutindex(player) {
    var_627fa174d00ef780 = 0;
    if (game["roundsPlayed"] == 0) {
        var_627fa174d00ef780 = 0;
    } else if (isgungameloadouts()) {
        var_627fa174d00ef780 = game["roundsWon"][player.pers["team"]];
    } else {
        var_627fa174d00ef780 = game["roundsWon"][getotherteam(player.pers["team"])[0]];
    }
    return var_627fa174d00ef780;
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7f06
// Size: 0xb7
function getgungameloadoutomnvarindex(player, winningteam) {
    var_627fa174d00ef780 = 0;
    if (isgungameloadouts()) {
        var_627fa174d00ef780 = game["roundsWon"][player.pers["team"]];
        if (isdefined(winningteam) && winningteam == player.pers["team"]) {
            var_627fa174d00ef780 = var_627fa174d00ef780 + 1;
        }
    } else {
        var_627fa174d00ef780 = game["roundsWon"][getotherteam(player.pers["team"])[0]];
        if (isdefined(winningteam) && winningteam == getotherteam(player.pers["team"])[0]) {
            var_627fa174d00ef780 = var_627fa174d00ef780 + 1;
        }
    }
    return var_627fa174d00ef780;
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7fc5
// Size: 0x27f
function setenemyloadoutomnvarsatmatchend(winningteam) {
    foreach (player in level.players) {
        enemyplayer = undefined;
        if (!isdefined(player.pers["team"])) {
            otherteam = "allies";
        } else {
            otherteam = getotherteam(player.pers["team"])[0];
        }
        foreach (p in level.players) {
            if (p.team == otherteam) {
                enemyplayer = p;
                break;
            }
        }
        if (!isdefined(enemyplayer)) {
            enemyplayer = player;
        }
        enemyplayer.pers["gamemodeLoadout"] = game["arenaRandomLoadout"][getgungameloadoutomnvarindex(enemyplayer, winningteam)];
        table = "mp/arenaGGWeapons.csv";
        player setclientomnvar("ui_arena_en_primary", -1);
        player setclientomnvar("ui_arena_en_secondary", -1);
        player setclientomnvar("ui_arena_en_lethal", -1);
        player setclientomnvar("ui_arena_en_tactical", -1);
        primary = int(tablelookup(table, 0, enemyplayer.pers["gamemodeLoadout"]["loadoutPrimary"], 1));
        player setclientomnvar("ui_arena_en_primary", primary);
        secondary = int(tablelookup(table, 0, enemyplayer.pers["gamemodeLoadout"]["loadoutSecondary"], 1));
        player setclientomnvar("ui_arena_en_secondary", secondary);
        lethal = int(tablelookup(table, 0, enemyplayer.pers["gamemodeLoadout"]["loadoutEquipmentPrimary"], 1));
        player setclientomnvar("ui_arena_en_lethal", lethal);
        tactical = int(tablelookup(table, 0, enemyplayer.pers["gamemodeLoadout"]["loadoutEquipmentSecondary"], 1));
        player setclientomnvar("ui_arena_en_tactical", tactical);
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x824b
// Size: 0x230
function spawngameendflagzone() {
    arenaflag = getentarray("flag_arena", "targetname");
    if (!isdefined(arenaflag[0])) {
        /#
            assertmsg("^1No Arena Flag found in level!");
        #/
        return;
    }
    level.arenaflag = arenaflag[0];
    trigger = arenaflag[0];
    if (isdefined(trigger.target)) {
        visuals[0] = getent(trigger.target, "targetname");
    } else {
        visuals[0] = spawn("script_model", trigger.origin);
        visuals[0].angles = trigger.angles;
    }
    trigger.objectivekey = "_a";
    trigger.iconname = "_a";
    arenaflag = namespace_98b55913d2326ac8::setupobjective(trigger, "neutral", undefined, 1);
    arenaflag.onuse = &arenaflag_onuse;
    arenaflag.onbeginuse = &arenaflag_onusebegin;
    arenaflag.onenduse = &arenaflag_onuseend;
    arenaflag.onuseupdate = &arenaflag_onuseupdate;
    arenaflag.oncontested = &arenaflag_oncontested;
    arenaflag.isarena = 1;
    arenaflag namespace_19b4203b51d56488::pinobjiconontriggertouch();
    arenaflag.id = "domFlag";
    arenaflag.scriptable delete();
    arenaflag namespace_19b4203b51d56488::setcapturebehavior("persistent");
    arenaflag.ignorestomp = 1;
    level.objectives[arenaflag.objectivekey] = arenaflag;
    level.arenaflag = arenaflag;
    waitframe();
    level.arenaflag namespace_19b4203b51d56488::requestid(1, 1, undefined, 0, 0);
    level.arenaflag.visibleteam = "any";
    level.arenaflag namespace_19b4203b51d56488::setobjectivestatusicons("icon_waypoint_ot");
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        level.arenaflag thread namespace_47e715c4f9510479::deleteotpreview();
        level thread namespace_47e715c4f9510479::showflagoutline();
    } else {
        level.arenaflag namespace_47e715c4f9510479::disableotflag();
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8482
// Size: 0x73
function showflagoutline() {
    waitframe();
    if (isdefined(level.arenaflag) && isdefined(level.arenaflag.flagmodel)) {
        level.arenaflag.flagmodel.outlinedid = outlineenableforall(level.arenaflag.flagmodel, "outline_nodepth_orange", "level_script");
    }
    level thread removeflagoutlineongameend();
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x84fc
// Size: 0x12a
function arenaflag_onusebegin(player) {
    player.iscapturing = 1;
    level.canprocessot = 0;
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    if (ownerteam == "neutral") {
        player setclientomnvar("ui_objective_pinned_text_param", 1);
    }
    self.neutralizing = istrue(level.flagneutralization) && ownerteam != "neutral";
    if (!istrue(self.neutralized)) {
        self.didstatusnotify = 0;
    }
    usetime = ter_op(istrue(level.flagneutralization), level.flagcapturetime * 0.5, level.flagcapturetime);
    namespace_19b4203b51d56488::setusetime(usetime);
    if (istrue(level.capturedecay)) {
        thread namespace_19b4203b51d56488::useobjectdecay(player.team);
    }
    if (usetime > 0) {
        self.prevownerteam = getotherteam(player.team)[0];
        namespace_98b55913d2326ac8::updateflagcapturestate(player.team);
        namespace_19b4203b51d56488::setobjectivestatusicons(level.icontaking, level.iconlosing);
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x862d
// Size: 0xfd
function arenaflag_onuseupdate(team, progress, change, var_4b22e50e504339fe) {
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    if (progress > 0.05 && change && !self.didstatusnotify) {
        if (ownerteam == "neutral") {
            if (level.flagcapturetime > 0.05) {
                namespace_944ddf7b8df1b0e3::statusdialog("securing" + self.objectivekey, team);
                otherteam = getotherteam(team)[0];
                namespace_944ddf7b8df1b0e3::statusdialog("losing" + self.objectivekey, otherteam);
            }
        } else if (level.flagcapturetime > 0.05) {
            namespace_944ddf7b8df1b0e3::statusdialog("losing" + self.objectivekey, ownerteam);
            namespace_944ddf7b8df1b0e3::statusdialog("securing" + self.objectivekey, team);
        }
        self.didstatusnotify = 1;
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x8731
// Size: 0xd6
function arenaflag_onuseend(team, player, success) {
    level.canprocessot = 1;
    self.didstatusnotify = 0;
    if (success) {
        namespace_5a22b6f3a56f7e9b::objective_show_progress(self.objidnum, 0);
    }
    if (isplayer(player)) {
        player.iscapturing = 0;
        player setclientomnvar("ui_objective_pinned_text_param", 0);
    }
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    if (ownerteam == "neutral") {
        namespace_19b4203b51d56488::setobjectivestatusicons(level.iconneutral);
        thread namespace_98b55913d2326ac8::updateflagstate("idle", 0);
    } else {
        namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefend, level.iconcapture);
        thread namespace_98b55913d2326ac8::updateflagstate(ownerteam, 0);
    }
    if (!success) {
        self.neutralized = 0;
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x880e
// Size: 0x14d
function arenaflag_onuse(var_22282e7d48ca3400) {
    level.canprocessot = 1;
    team = var_22282e7d48ca3400.team;
    oldteam = namespace_19b4203b51d56488::getownerteam();
    otherteam = getotherteam(team)[0];
    self.capturetime = gettime();
    self.neutralized = 0;
    namespace_944ddf7b8df1b0e3::statusdialog("lost" + self.objectivekey, otherteam);
    namespace_944ddf7b8df1b0e3::statusdialog("secured" + self.objectivekey, team);
    thread printandsoundoneveryone(team, otherteam, undefined, undefined, "mp_dom_flag_captured", "mp_dom_flag_lost", var_22282e7d48ca3400);
    namespace_98b55913d2326ac8::dompoint_setcaptured(team, var_22282e7d48ca3400);
    if (!self.neutralized) {
        if (isdefined(level.onobjectivecomplete)) {
            [[ level.onobjectivecomplete ]]("dompoint", self.objectivekey, var_22282e7d48ca3400, team, oldteam, self);
        }
        self.firstcapture = 0;
    }
    game["dialog"]["round_success"] = "gamestate_win_capture";
    game["dialog"]["round_failure"] = "gamestate_lost_capture";
    level thread arena_endgame(var_22282e7d48ca3400.team, game["end_reason"]["arena_otflag_completed"], game["end_reason"]["arena_otflag_failed"]);
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8962
// Size: 0x3b
function arenaflag_oncontested() {
    namespace_19b4203b51d56488::setobjectivestatusicons(level.iconcontested);
    namespace_5a22b6f3a56f7e9b::objective_set_progress_team(self.objidnum, undefined);
    thread namespace_98b55913d2326ac8::updateflagstate("contested", 0);
    level thread forcegameendcontesttimeout();
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x89a4
// Size: 0x74
function forcegameendcontesttimeout() {
    level notify("start_overtime_timeout");
    level endon("start_overtime_timeout");
    level endon("game_ended");
    if (!isdefined(level.ottimecontested)) {
        level.ottimecontested = 0;
    }
    while (level.ottimecontested < 5000) {
        wait(level.framedurationseconds);
        level.ottimecontested = level.ottimecontested + level.frameduration;
    }
    level.canprocessot = 1;
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8a1f
// Size: 0x41
function disableotflag() {
    namespace_19b4203b51d56488::allowuse("none");
    namespace_19b4203b51d56488::disableobject();
    if (isdefined(self.scriptable)) {
        self.scriptable delete();
    }
    self.flagmodel hide();
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8a67
// Size: 0x71
function removeflagoutlineongameend() {
    level waittill("game_ended");
    if (isdefined(level.arenaflag) && isdefined(level.arenaflag.flagmodel.outlinedid)) {
        outlinedisable(level.arenaflag.flagmodel.outlinedid, level.arenaflag.flagmodel);
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8adf
// Size: 0x1c
function deleteotpreview() {
    level waittill_any_2("prematch_done", "start_mode_setup");
    disableotflag();
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8b02
// Size: 0xbb
function setupendzones() {
    level.attackerendzone = getentarray("flag_goal_attacker", "targetname");
    level.defenderendzone = getentarray("flag_goal_defender", "targetname");
    level.attackerendzone = level.attackerendzone[0] createendzone(game["attackers"]);
    level.defenderendzone = level.defenderendzone[0] createendzone(game["defenders"]);
    level.objectives = [];
    level.objectives[level.objectives.size] = level.attackerendzone;
    level.objectives[level.objectives.size] = level.defenderendzone;
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8bc4
// Size: 0x4ba
function createendzone(team) {
    if (isdefined(self.target)) {
        visuals[0] = getent(self.target, "targetname");
    } else {
        visuals[0] = spawn("script_model", self.origin);
        visuals[0].angles = self.angles;
    }
    level.flagcapturetime = dvarfloatvalue("flagCaptureTime", 10, 0, 30);
    if (isdefined(self.objectivekey)) {
        objectivekey = self.objectivekey;
    } else {
        objectivekey = self.script_label;
    }
    if (isdefined(self.iconname)) {
        iconname = self.iconname;
    } else {
        iconname = self.script_label;
    }
    var_54b003ce5d016238 = namespace_19b4203b51d56488::createuseobject(team, self, visuals, (0, 0, 100));
    var_54b003ce5d016238.team = team;
    var_54b003ce5d016238.ownerteam = team;
    var_54b003ce5d016238 namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefendendzone, level.iconcaptureendzone);
    var_54b003ce5d016238 namespace_19b4203b51d56488::allowuse("enemy");
    var_54b003ce5d016238 namespace_19b4203b51d56488::cancontestclaim(1);
    var_54b003ce5d016238 namespace_19b4203b51d56488::setusetime(level.flagcapturetime);
    var_54b003ce5d016238.onuse = &endzone_onuse;
    var_54b003ce5d016238.onbeginuse = &endzone_onusebegin;
    var_54b003ce5d016238.onenduse = &endzone_onuseend;
    var_54b003ce5d016238.oncontested = &endzone_oncontested;
    var_54b003ce5d016238.onuncontested = &endzone_onuncontested;
    var_54b003ce5d016238.isarena = 1;
    var_54b003ce5d016238 namespace_19b4203b51d56488::pinobjiconontriggertouch();
    var_54b003ce5d016238.id = "domFlag";
    if (isdefined(level.capturetype)) {
        var_54b003ce5d016238 namespace_19b4203b51d56488::setcapturebehavior(getcapturetype());
    }
    var_54b003ce5d016238.objectivekey = objectivekey;
    var_54b003ce5d016238.iconname = iconname;
    var_54b003ce5d016238 namespace_19b4203b51d56488::setvisibleteam("any");
    var_54b003ce5d016238.stompprogressreward = &endzone_stompprogressreward;
    var_54b003ce5d016238.nousebar = 1;
    var_54b003ce5d016238.claimgracetime = level.flagcapturetime * 1000;
    tracestart = visuals[0].origin + (0, 0, 32);
    traceend = visuals[0].origin + (0, 0, -32);
    contentoverride = namespace_2a184fc4902783dc::create_contents(1, 1, 1, 1, 0, 1, 1);
    ignoreents = [];
    trace = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, ignoreents, contentoverride);
    var_54b003ce5d016238.baseeffectpos = trace["position"];
    upangles = vectortoangles(trace["normal"]);
    var_54b003ce5d016238.baseeffectforward = anglestoforward(upangles);
    scriptable = spawn("script_model", var_54b003ce5d016238.baseeffectpos);
    scriptable setmodel("dom_flag_scriptable");
    scriptable.angles = generateaxisanglesfromforwardvector(var_54b003ce5d016238.baseeffectforward, scriptable.angles);
    var_54b003ce5d016238.scriptable = scriptable;
    var_54b003ce5d016238.vfxnamemod = "";
    if (isdefined(var_54b003ce5d016238.trigger.radius)) {
        if (var_54b003ce5d016238.trigger.radius == 160) {
            var_54b003ce5d016238.vfxnamemod = "_160";
        } else if (var_54b003ce5d016238.trigger.radius == 90) {
            var_54b003ce5d016238.vfxnamemod = "_90";
        } else if (var_54b003ce5d016238.trigger.radius == 315) {
            var_54b003ce5d016238.vfxnamemod = "_300";
        } else if (var_54b003ce5d016238.trigger.radius != 120) {
            var_54b003ce5d016238.noscriptable = 1;
        }
    }
    var_54b003ce5d016238.flagmodel = spawn("script_model", var_54b003ce5d016238.baseeffectpos);
    var_54b003ce5d016238.flagmodel setmodel("military_dom_flag_neutral");
    var_54b003ce5d016238.outlineent = var_54b003ce5d016238.flagmodel;
    return var_54b003ce5d016238;
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9086
// Size: 0x12a
function endzone_onusebegin(player) {
    player.iscapturing = 1;
    level.canprocessot = 0;
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    if (ownerteam == "neutral") {
        player setclientomnvar("ui_objective_pinned_text_param", 1);
    }
    self.neutralizing = istrue(level.flagneutralization) && ownerteam != "neutral";
    if (!istrue(self.neutralized)) {
        self.didstatusnotify = 0;
    }
    usetime = ter_op(istrue(level.flagneutralization), level.flagcapturetime * 0.5, level.flagcapturetime);
    namespace_19b4203b51d56488::setusetime(usetime);
    if (istrue(level.capturedecay)) {
        thread namespace_19b4203b51d56488::useobjectdecay(player.team);
    }
    if (usetime > 0) {
        self.prevownerteam = getotherteam(player.team)[0];
        namespace_98b55913d2326ac8::updateflagcapturestate(player.team);
        namespace_19b4203b51d56488::setobjectivestatusicons(level.icontakingendzone, level.iconlosingendzone);
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x91b7
// Size: 0x97
function endzone_onuseend(team, player, success) {
    level.canprocessot = 1;
    if (success) {
        namespace_5a22b6f3a56f7e9b::objective_show_progress(self.objidnum, 0);
    }
    if (isplayer(player)) {
        player.iscapturing = 0;
        player setclientomnvar("ui_objective_pinned_text_param", 0);
    }
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefendendzone, level.iconcaptureendzone);
    if (!success) {
        self.neutralized = 0;
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9255
// Size: 0xe6
function endzone_onuse(var_22282e7d48ca3400) {
    level.canprocessot = 1;
    team = var_22282e7d48ca3400.team;
    oldteam = namespace_19b4203b51d56488::getownerteam();
    otherteam = getotherteam(team)[0];
    self.capturetime = gettime();
    self.neutralized = 0;
    thread printandsoundoneveryone(team, otherteam, undefined, undefined, "mp_dom_flag_captured", "mp_dom_flag_lost", var_22282e7d48ca3400);
    endzone_setcaptured(team, var_22282e7d48ca3400);
    if (!self.neutralized) {
        if (isdefined(level.onobjectivecomplete)) {
            [[ level.onobjectivecomplete ]]("dompoint", self.objectivekey, var_22282e7d48ca3400, team, oldteam, self);
        }
    }
    level thread arena_endgame(var_22282e7d48ca3400.team, game["end_reason"]["objective_completed"], undefined, 0, 2);
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9342
// Size: 0x24
function endzone_oncontested() {
    namespace_19b4203b51d56488::setobjectivestatusicons(level.iconcontestendzone);
    namespace_5a22b6f3a56f7e9b::objective_set_progress_team(self.objidnum, undefined);
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x936d
// Size: 0x41
function endzone_onuncontested(lastclaimteam) {
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefendendzone, level.iconcaptureendzone);
    self.processot = 1;
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x93b5
// Size: 0x130
function endzone_setcaptured(team, var_22282e7d48ca3400) {
    namespace_19b4203b51d56488::setownerteam(team);
    self notify("capture", var_22282e7d48ca3400);
    self notify("assault", var_22282e7d48ca3400);
    namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefendendzone, level.iconcaptureendzone);
    self.neutralized = 0;
    if (self.touchlist[team].size == 0) {
        self.touchlist = self.oldtouchlist;
    }
    thread giveflagcapturexp(self.touchlist[team], var_22282e7d48ca3400);
    if (isdefined(level.matchrecording_logevent)) {
        [[ level.matchrecording_logevent ]](self.logid, undefined, self.logeventflag, self.visuals[0].origin[0], self.visuals[0].origin[1], gettime(), ter_op(team == "allies", 1, 2));
    }
    namespace_bd0162aedd8c8594::logevent_gameobject(self.analyticslogtype, self.analyticslogid, self.visuals[0].origin, -1, "captured_" + team);
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x94ec
// Size: 0x1e
function endzone_stompprogressreward(player) {
    player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_2d96ced878338cd2");
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9511
// Size: 0x43
function getcapturetype() {
    capturetype = "normal";
    if (level.capturetype == 2) {
        capturetype = "neutralize";
    } else if (level.capturetype == 3) {
        capturetype = "persistent";
    }
    return capturetype;
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x955c
// Size: 0x172
function giveflagcapturexp(touchlist, var_22282e7d48ca3400) {
    level endon("game_ended");
    first_player = var_22282e7d48ca3400;
    if (isdefined(first_player.owner)) {
        first_player = first_player.owner;
    }
    level.lastcaptime = gettime();
    if (isplayer(first_player)) {
        level thread teamplayercardsplash("callout_securedposition", first_player);
        var_7e2c53b0bcf117d9 = spawnstruct();
        var_7e2c53b0bcf117d9.player = first_player;
        var_7e2c53b0bcf117d9.eventname = "capture";
        var_7e2c53b0bcf117d9.position = first_player.origin;
        namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_on_game_event", var_7e2c53b0bcf117d9);
    }
    var_59db5d0f4e3000a7 = getarraykeys(touchlist);
    for (index = 0; index < var_59db5d0f4e3000a7.size; index++) {
        player = touchlist[var_59db5d0f4e3000a7[index]].player;
        if (isdefined(player.owner)) {
            player = player.owner;
        }
        if (!isplayer(player)) {
            continue;
        }
        player incpersstat("captures", 1);
        player namespace_2685ec368e022695::statsetchild("round", "captures", player.pers["captures"]);
        player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_5a7b15a24e10a93b");
        wait(0.05);
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x96d5
// Size: 0x1ad
function startotmechanics() {
    if (level.objmodifier == 1) {
        foreach (objective in level.objectives) {
            objective deleteendzone();
        }
    }
    level.canprocessot = 1;
    if (!isdefined(level.arenaflag.objidnum)) {
        level.arenaflag namespace_19b4203b51d56488::requestid(1, 1, undefined, 0, 0);
    }
    level.arenaflag namespace_19b4203b51d56488::setobjectivestatusicons(level.iconneutral);
    level.arenaflag namespace_19b4203b51d56488::enableobject();
    level.arenaflag namespace_19b4203b51d56488::allowuse("enemy");
    level.arenaflag.flagmodel show();
    if (level.spawnflag) {
        game["dialog"]["overtime"] = "gamestate_overtime_flagspawn";
    }
    foreach (player in level.players) {
        if (player issplitscreenplayer() && !player issplitscreenplayerprimary()) {
            continue;
        }
        player namespace_944ddf7b8df1b0e3::leaderdialogonplayer("overtime");
    }
    level.arenaflag.flagmodel playsound("flag_spawned");
    level thread showflagoutline();
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9889
// Size: 0x6d
function deleteendzone() {
    namespace_19b4203b51d56488::allowuse("none");
    namespace_19b4203b51d56488::setvisibleteam("none");
    namespace_19b4203b51d56488::releaseid();
    self.trigger = undefined;
    self notify("deleted");
    self.visibleteam = "none";
    if (isdefined(self.scriptable)) {
        self.scriptable delete();
    }
    self.flagmodel delete();
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x98fd
// Size: 0xc
function dogtagallyonusecb(player) {
    
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9910
// Size: 0x2b
function dogtagenemyonusecb(player) {
    player.health = player.maxhealth;
    player notify("healed");
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9942
// Size: 0x173
function outlineenemyplayers() {
    level endon("prematch_done");
    level endon("removeArenaOutlines");
    while (1) {
        level waittill("spawned_player");
        waitframe();
        foreach (player in level.players) {
            entnum = player getentitynumber();
            if (!isdefined(player.outlinedenemies)) {
                if (!isdefined(level.activeoutlines)) {
                    level.activeoutlines = 1;
                } else {
                    level.activeoutlines++;
                }
            }
            foreach (p in level.players) {
                if (p != player && p.team != player.team) {
                    if (isdefined(player.outlinedenemies)) {
                        outlinedisable(player.outlinedenemies, player);
                    }
                    player.outlinedenemies = outlineenableforteam(player, p.team, "outline_nodepth_orange", "level_script");
                    break;
                }
            }
        }
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9abc
// Size: 0x173
function outlineenemyplayerslaunchchunk() {
    level endon("game_ended");
    level endon("removeArenaOutlines");
    while (1) {
        level waittill("spawned_player");
        waitframe();
        foreach (player in level.players) {
            entnum = player getentitynumber();
            if (!isdefined(player.outlinedenemies)) {
                if (!isdefined(level.activeoutlines)) {
                    level.activeoutlines = 1;
                } else {
                    level.activeoutlines++;
                }
            }
            foreach (p in level.players) {
                if (p != player && p.team != player.team) {
                    if (isdefined(player.outlinedenemies)) {
                        outlinedisable(player.outlinedenemies, player);
                    }
                    player.outlinedenemies = outlineenableforteam(player, p.team, "outline_nodepth_orange", "level_script");
                    break;
                }
            }
        }
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9c36
// Size: 0xb2
function removeenemyoutlines() {
    thread notifyremoveoutlines();
    level waittill_any_2("prematch_done", "removeArenaOutlines");
    foreach (player in level.players) {
        entnum = player getentitynumber();
        if (isdefined(player.outlinedenemies)) {
            level.activeoutlines--;
            outlinedisable(player.outlinedenemies, player);
            player.outlinedenemies = undefined;
        }
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9cef
// Size: 0x6b
function notifyremoveoutlines() {
    level endon("prematch_done");
    level waittill("match_start_real_countdown");
    if (level.prematchperiodend > 5) {
        time = int(max(level.prematchperiodend - 5, 5));
    } else {
        time = int(max(level.prematchperiodend - 2, 2));
    }
    wait(time);
    level notify("removeArenaOutlines");
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9d61
// Size: 0x182
function outlineequipmentwatchplayerprox(var_825bb0b1ff925278, equipname) {
    self endon("death");
    self endon("trigger");
    self.outlinedplayers = [];
    basescore = level.baseraritymap[equipname];
    var_4430b08d5a2d47bf = getoutlineasset(basescore);
    while (1) {
        foreach (player in level.players) {
            if (isdefined(player.hasarenaspawned)) {
                dist = distance2dsquared(self.origin, player.origin);
                entnum = player getentitynumber();
                if (dist < 490000) {
                    if (!isdefined(self.outlinedplayers[entnum])) {
                        if (!isdefined(level.activeoutlines)) {
                            level.activeoutlines = 1;
                        } else {
                            level.activeoutlines++;
                        }
                        self.outlinedplayers[entnum] = outlineenableforplayer(self, player, var_4430b08d5a2d47bf, "level_script");
                    }
                } else if (isdefined(self.outlinedplayers[entnum])) {
                    level.activeoutlines--;
                    outlinedisable(self.outlinedplayers[entnum], self);
                    self.outlinedplayers[entnum] = undefined;
                }
            }
        }
        waitframe();
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9eea
// Size: 0x19b
function outlinewatchplayerprox() {
    self endon("death");
    self endon("trigger");
    self.outlinedplayers = [];
    weapname = namespace_3bbb5a98b932c46f::getitemweaponname();
    rootname = namespace_e0ee43ef2dddadaa::getweaponrootname(weapname);
    basescore = level.baseraritymap[rootname + "_mp"];
    var_4430b08d5a2d47bf = getoutlineasset(basescore);
    while (1) {
        foreach (player in level.players) {
            if (isdefined(player.hasarenaspawned)) {
                dist = distance2dsquared(self.origin, player.origin);
                entnum = player getentitynumber();
                if (dist < 490000) {
                    if (!isdefined(self.outlinedplayers[entnum])) {
                        if (!isdefined(level.activeoutlines)) {
                            level.activeoutlines = 1;
                        } else {
                            level.activeoutlines++;
                        }
                        self.outlinedplayers[entnum] = outlineenableforplayer(self, player, var_4430b08d5a2d47bf, "level_script");
                    }
                } else if (isdefined(self.outlinedplayers[entnum])) {
                    level.activeoutlines--;
                    outlinedisable(self.outlinedplayers[entnum], self);
                    self.outlinedplayers[entnum] = undefined;
                }
            }
        }
        waitframe();
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa08c
// Size: 0x10c
function getoutlineasset(basescore) {
    if (!isdefined(basescore)) {
        basescore = 0;
    }
    var_4430b08d5a2d47bf = "white";
    score = int(min(basescore, 8));
    switch (score) {
    case 0:
        var_4430b08d5a2d47bf = "outline_depth_white";
        break;
    case 1:
        var_4430b08d5a2d47bf = "outline_depth_green";
        break;
    case 2:
        var_4430b08d5a2d47bf = "outline_depth_cyan";
        break;
    case 3:
        var_4430b08d5a2d47bf = "outline_depth_red";
        break;
    case 4:
        var_4430b08d5a2d47bf = "outline_depth_orange";
        break;
    case 5:
        var_4430b08d5a2d47bf = "outline_depth_yellow";
        break;
    case 6:
        var_4430b08d5a2d47bf = "outline_depth_blue";
        break;
    case 7:
        var_4430b08d5a2d47bf = "outline_depth_green";
        break;
    case 8:
        var_4430b08d5a2d47bf = "outline_depth_red";
        break;
    }
    return var_4430b08d5a2d47bf;
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa1a0
// Size: 0x66
function clearweaponoutlines() {
    foreach (value in self.outlinedplayers) {
        level.activeoutlines--;
        outlinedisable(value, self);
        value = undefined;
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa20d
// Size: 0x246
function selflookatfriendly() {
    level endon("prematch_ended");
    teammate = undefined;
    var_c244143daa28d2f0 = 0;
    while (isdefined(level.matchcountdowntime) && level.matchcountdowntime > 5) {
        alive = getfriendlyplayers(self.team, 1);
        if (alive.size > 1) {
            var_c244143daa28d2f0 = 1;
            break;
        }
        waitframe();
    }
    if (var_c244143daa28d2f0) {
        var_5bcf8dfeafe8ace2 = self.angles;
        count = 0;
        teammates = getteamdata(self.team, "players");
        foreach (t in teammates) {
            if (t != self) {
                teammate = t;
            }
        }
        var_93616e7a405192c4 = teammate.origin - self.origin;
        var_2ea336df4f6e46ea = self.origin - teammate.origin;
        var_bbea66c71351983f = anglestoright(self.angles);
        var_2e9a24df4f6400a6 = vectordot(var_bbea66c71351983f, var_93616e7a405192c4);
        var_386ad24c3342dab7 = 0;
        lookright = 0;
        if (var_2e9a24df4f6400a6 < 0) {
            var_dd4bad131228ea4 = 85;
            var_386ad24c3342dab7 = 1;
        } else {
            var_dd4bad131228ea4 = -90;
            lookright = 1;
        }
        if (isdefined(teammate)) {
            if (var_386ad24c3342dab7) {
                if (!isbot(self)) {
                    wait(0.5);
                    if (self.currentweapon.basename != "none") {
                        self forceplaygestureviewmodel("ges_crush_turnleft");
                    }
                }
            } else if (!isbot(self)) {
                wait(0.5);
                if (self.currentweapon.basename != "none") {
                    self forceplaygestureviewmodel("ges_crush_turnright");
                }
            }
            wait(3);
            _freezecontrols(0);
        } else {
            _freezecontrols(0);
        }
    } else {
        _freezecontrols(0);
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa45a
// Size: 0x16
function updatematchstatushintonspawn() {
    level endon("game_ended");
    namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("kill");
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa477
// Size: 0x9d
function seticonnames() {
    level.iconcaptureendzone = "waypoint_capture_endzone";
    level.icondefendendzone = "waypoint_defend_endzone";
    level.iconcontestendzone = "waypoint_contesting_endzone";
    level.icontakingendzone = "waypoint_taking_endzone";
    level.iconlosingendzone = "waypoint_losing_endzone";
    level.iconneutral = "waypoint_captureneutral";
    level.iconcapture = "waypoint_capture";
    level.icondefend = "waypoint_defend";
    level.iconcontested = "waypoint_contested";
    level.icontaking = "waypoint_taking";
    level.iconlosing = "waypoint_losing";
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa51b
// Size: 0x24c
function setupwaypointicons() {
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_taking_endzone", 0, "contest", "MP_INGAME_ONLY/OBJ_TAKING_CAPS", "icon_waypoint_flag", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_losing_endzone", 0, "contest", "MP_INGAME_ONLY/OBJ_LOSING_CAPS", "icon_waypoint_flag", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_contesting_endzone", 0, "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", "icon_waypoint_flag", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_capture_endzone", 0, "enemy", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_flag", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defend_endzone", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_flag", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("icon_waypoint_dom_a", 0, "friendly", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_overtime", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_taking_a", 0, "friendly", "MP_INGAME_ONLY/OBJ_TAKING_CAPS", "icon_waypoint_overtime", 1);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_capture_a", 0, "enemy", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_overtime", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defend_a", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFEND_CAPS", "icon_waypoint_overtime", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_defending_a", 0, "friendly", "MP_INGAME_ONLY/OBJ_DEFENDING_CAPS", "icon_waypoint_overtime", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_blocking_a", 0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKING_CAPS", "icon_waypoint_overtime", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_blocked_a", 0, "friendly", "MP_INGAME_ONLY/OBJ_BLOCKED_CAPS", "icon_waypoint_overtime", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_losing_a", 0, "enemy", "MP_INGAME_ONLY/OBJ_LOSING_CAPS", "icon_waypoint_overtime", 1);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_captureneutral_a", 0, "neutral", "MP_INGAME_ONLY/OBJ_CAPTURE_CAPS", "icon_waypoint_overtime", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_contested_a", 0, "contest", "MP_INGAME_ONLY/OBJ_CONTESTED_CAPS", "icon_waypoint_overtime", 1);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_dom_target_a", 0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_overtime", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("icon_waypoint_target_a", 0, "neutral", "MP_INGAME_ONLY/OBJ_TARGET_CAPS", "icon_waypoint_overtime", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("icon_waypoint_ot_a", 0, "neutral", "MP_INGAME_ONLY/OBJ_OTFLAGLOC_CAPS", "icon_waypoint_overtime", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_dogtags", 1, "enemy", "", "hud_icon_minimap_misc_dog_tag", 0);
    namespace_d576b6dc7cef9c62::setwaypointiconinfo("waypoint_dogtags_friendly", 1, "friendly", "", "hud_icon_minimap_misc_dog_tag", 0);
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa76e
// Size: 0xf
function israndomloadouts() {
    return level.arenaloadouts == 2;
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa785
// Size: 0xf
function ispickuploadouts() {
    return level.arenaloadouts == 3;
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa79c
// Size: 0xf
function isgungameloadouts() {
    return level.arenaloadouts == 4;
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa7b3
// Size: 0xf
function isrvsgungameloadouts() {
    return level.arenaloadouts == 5;
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa7ca
// Size: 0xf
function israndompreviewloadouts() {
    return level.arenaloadouts == 6;
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa7e1
// Size: 0xf
function israndomalphaoneloadouts() {
    return level.arenaloadouts == 7;
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa7f8
// Size: 0xf
function israndomalphatwoloadouts() {
    return level.arenaloadouts == 8;
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa80f
// Size: 0xf
function israndomalphathreeloadouts() {
    return level.arenaloadouts == 9;
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa826
// Size: 0xf
function israndomalphafourloadouts() {
    return level.arenaloadouts == 10;
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa83d
// Size: 0xf
function israndomalphafiveloadouts() {
    return level.arenaloadouts == 11;
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa854
// Size: 0x61
function israndomalphaloadouts() {
    switch (level.arenaloadouts) {
    case 7:
    case 8:
    case 9:
    case 10:
    case 11:
        return 1;
    default:
        return 0;
        break;
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa8bc
// Size: 0x38
function dogtagallyonusecbconf(player) {
    if (isplayer(player)) {
        player namespace_e8a49b70d0769b66::giveteamscoreforobjective(player.pers["team"], level.scoredeny, 0);
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa8fb
// Size: 0x4a
function dogtagenemyonusecbconf(player) {
    if (isplayer(player)) {
        player namespace_944ddf7b8df1b0e3::leaderdialogonplayer("kill_confirmed", undefined, undefined, undefined, 4);
    }
    player namespace_e8a49b70d0769b66::giveteamscoreforobjective(player.pers["team"], level.scoreconfirm, 0);
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa94c
// Size: 0x140
function botpickuphack() {
    level endon("game_ended");
    wait(1);
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    wait(1);
    while (1) {
        foreach (player in level.players) {
            if (isbot(player)) {
                rootname = namespace_e0ee43ef2dddadaa::getweaponrootname(level.arenaweapont1);
                attachments = [];
                var_66b3db972ac1531e = namespace_e0ee43ef2dddadaa::buildweapon(rootname, attachments, "none", "none", -1);
                newweapon = getcompleteweaponname(var_66b3db972ac1531e);
                player _giveweapon(newweapon);
                player _switchtoweapon(var_66b3db972ac1531e);
            }
        }
        break;
    }
    foreach (player in level.players) {
        if (isbot(player)) {
            player thread fakepickups();
        }
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xaa93
// Size: 0xeb
function fakepickups() {
    while (1) {
        wait(1);
        if (self.currentprimaryweapon.basename != "iw8_pi_decho_mp" && self.currentprimaryweapon.basename != "iw8_pi_mike1911_mp" && self.currentprimaryweapon.basename != "iw9_me_fists_mp" && self.currentprimaryweapon.basename != "none") {
            wait(3);
        }
        if (!self attackbuttonpressed() && !self isreloading() && !self usebuttonpressed()) {
            self botpressbutton("use", 0.5);
        } else {
            wait(0.5);
            if (!self attackbuttonpressed() && !self isreloading() && !self usebuttonpressed()) {
                self botpressbutton("use", 0.5);
            }
        }
    }
}

// Namespace namespace_9fcaf1fc417ac0a8/namespace_d4479a4019bdeab1
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xab85
// Size: 0xc0
function bootcampmodewatcher() {
    level endon("game_ended");
    while (1) {
        var_baad1502bca0f26f = getdvarint(@"hash_52b2904136c93f2b");
        if (var_baad1502bca0f26f != -1) {
            timelimit = 3;
            level.starttime = gettime();
            gamemode = function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_timelimit");
            level.watchdvars[gamemode].value = timelimit;
            level.overridewatchdvars[gamemode] = timelimit;
            /#
                setdevdvar(gamemode, timelimit);
            #/
            game["bootCampOverride"] = var_baad1502bca0f26f;
            /#
                setdevdvar(@"hash_52b2904136c93f2b", -1);
            #/
        }
        wait(1);
    }
}

