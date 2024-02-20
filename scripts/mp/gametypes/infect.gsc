// mwiii decomp prototype
#using scripts\mp\hud_util.gsc;
#using scripts\mp\class.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using script_2669878cf5a1b6bc;
#using scripts\mp\playerstats_interface.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\script.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\debug.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\globallogic.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\parachute.gsc;
#using scripts\mp\gametypes\arm.gsc;
#using scripts\mp\gametypes\infect.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\menus.gsc;
#using scripts\mp\battlechatter_mp.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\mp\supers.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\mp\equipment\tac_insert.gsc;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\perks\perkpackage.gsc;
#using scripts\mp\persistence.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\mp\utility\lower_message.gsc;

#namespace infect;

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x124d
// Size: 0x3a3
function main() {
    namespace_77cb23aada5edffd::init();
    namespace_77cb23aada5edffd::setupcallbacks();
    matchmakingmatch = getdvarint(@"hash_962400405f9f3c0b") && !getdvarint(@"hash_485ef1ed1d39d3a3");
    if (matchmakingmatch) {
        level.isgroundwarinfected = getdvarint(@"hash_119729a5fcbd2aab", 0);
    } else {
        level.isgroundwarinfected = 0;
    }
    /#
        level.isgroundwarinfected = getdvarint(@"hash_119729a5fcbd2aab", 0);
    #/
    allowed[0] = getgametype();
    allowed[allowed.size] = "grnd";
    if (istrue(level.isgroundwarinfected)) {
        allowed[allowed.size] = "arm";
    }
    namespace_19b4203b51d56488::main(allowed);
    if (isusingmatchrulesdata()) {
        level.initializematchrules = &initializematchrules;
        [[ level.initializematchrules ]]();
        level thread reinitializematchrulesonmigration();
    } else {
        registertimelimitdvar(getgametype(), 600);
        setoverridewatchdvar("scorelimit", 0);
        registerroundlimitdvar(getgametype(), 1);
        registerwinlimitdvar(getgametype(), 1);
        registernumlivesdvar(getgametype(), 0);
        registerhalftimedvar(getgametype(), 0);
    }
    updategametypedvars();
    level.extratimeincreasecount = 0;
    level.extratimeincreasecountcap = getdvarint(@"hash_12925902a8e3c314", 20);
    level.ignorekdrstats = 1;
    level.didhalfscorevoboost = 0;
    thread waitthensetstatgroupreadonly();
    level.teambased = 1;
    level.supportintel = 0;
    level.disableforfeit = 1;
    level.nobuddyspawns = 1;
    level.onstartgametype = &onstartgametype;
    level.onplayerconnect = &onplayerconnect;
    level.modeonspawnplayer = &onspawnplayer;
    level.getspawnpoint = &getspawnpoint;
    level.onplayerkilled = &onplayerkilled;
    level.onnormaldeath = &onnormaldeath;
    level.ondeadevent = &ondeadevent;
    level.ontimelimit = &ontimelimit;
    level.bypassclasschoicefunc = &namespace_d19129e4fa5d176::alwaysgamemodeclass;
    level.addjuggsettings = &infectjugg_setconfig;
    level.gamemodespawnprotectedcallback = &gamemodespawnprotectedcallback;
    level.var_29f84151a47f0a35 = &function_48c5a587383a90e7;
    level.var_8683bc01bfd2ecab = 1;
    level.disablecopycatloadout = 1;
    setomnvar("ui_killcam_copycat", 0);
    level.infectednightmode = getdvarint(@"hash_298b7643d2bd0413", 0);
    level.infecteddisablenvg = getdvarint(@"hash_b236732b505b9983", 0);
    level.onlineprimaryoverride = getdvarint(@"hash_2712996ccb16a4de", 0);
    if (level.var_62f6f7640e4431e3.namekey == "infect_holiday") {
        precacheitem("equip_pball");
    }
    if (namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
        game["dialog"]["gametype"] = "dx_mp_infe_game_uktl_int1";
    } else {
        game["dialog"]["gametype"] = "dx_mp_infe_game_uktl_name";
    }
    game["dialog"]["boost"] = "dx_mp_infe_game_uktl_bost";
    game["dialog"]["offense_obj"] = "dx_mp_infe_game_uktl_bost";
    game["dialog"]["defense_obj"] = "dx_mp_infe_game_uktl_bost";
    game["dialog"]["infected_first"] = "dx_mp_infe_game_uktl_inf1";
    game["dialog"]["halfway_enemy_score"] = "dx_mp_infe_game_uktl_ihls";
    game["dialog"]["halfway_friendly_score"] = "dx_mp_infe_game_uktl_ihfr";
    game["dialog"]["infected_lastalive"] = "dx_mp_infe_game_uktl_infl";
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15f7
// Size: 0x3e
function waitthensetstatgroupreadonly() {
    self endon("game_ended");
    wait(1);
    if (isdefined(level.playerstats)) {
        makeplayerstatgroupreadonly("kdr");
        makeplayerstatgroupreadonly("losses");
        makeplayerstatgroupreadonly("winLoss");
    }
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x163c
// Size: 0x396
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
    setdynamicdvar(@"hash_8a9bb4f19c32d953", getmatchrulesdata("infectData", "numInitialInfected"));
    setdynamicdvar(@"hash_a44ac0c52a7bffdd", getmatchrulesdata("infectData", "weaponSurvivorPrimary"));
    setdynamicdvar(@"hash_c4b02863872af0bd", getmatchrulesdata("infectData", "weaponSurvivorSecondary"));
    setdynamicdvar(@"hash_d1b3309408a1e897", getmatchrulesdata("infectData", "lethalSurvivor"));
    setdynamicdvar(@"hash_a305fa9e69c31190", getmatchrulesdata("infectData", "tacticalSurvivor"));
    setdynamicdvar(@"hash_a3c1a41ff13c5bac", getmatchrulesdata("infectData", "superSurvivor"));
    setdynamicdvar(@"hash_b0950d9d807b3bc6", getmatchrulesdata("infectData", "superSurvivorTwo"));
    setdynamicdvar(@"hash_6c5a93985d33efc8", getmatchrulesdata("infectData", "weaponInfectPrimary"));
    setdynamicdvar(@"hash_94cd061650f7ce18", getmatchrulesdata("infectData", "weaponInfectSecondary"));
    setdynamicdvar(@"hash_a4d8476ca2b3de70", getmatchrulesdata("infectData", "lethalInfect"));
    setdynamicdvar(@"hash_cf7a6e0ed93c9277", getmatchrulesdata("infectData", "tacticalInfect"));
    setdynamicdvar(@"hash_8a3e30cc9f0d0c79", getmatchrulesdata("infectData", "weaponInitialPrimary"));
    setdynamicdvar(@"hash_b7be534f7d1f6c91", getmatchrulesdata("infectData", "weaponInitialSecondary"));
    setdynamicdvar(@"hash_c8c77b5a2a21af33", getmatchrulesdata("infectData", "superInfect"));
    setdynamicdvar(@"hash_bfad61c7edf9ba5b", getmatchrulesdata("infectData", "superInfectTwo"));
    setdynamicdvar(@"hash_d3681002af892cec", getmatchrulesdata("infectData", "infectExtraTimePerKill"));
    setdynamicdvar(@"hash_b980fb4575156410", getmatchrulesdata("infectData", "survivorAliveScore"));
    setdynamicdvar(@"hash_f3aaaf0edb2a8638", getmatchrulesdata("infectData", "survivorScoreTime"));
    setdynamicdvar(@"hash_91860bcbb6b5c57d", getmatchrulesdata("infectData", "survivorScorePerTick"));
    setdynamicdvar(@"hash_e775b68a991f7e43", getmatchrulesdata("infectData", "infectStreakBonus"));
    setdynamicdvar(@"hash_5e198c75ec20c248", getmatchrulesdata("infectData", "enableInfectedTracker"));
    setdynamicdvar(@"hash_4c708658ae44448", getmatchrulesdata("infectData", "enablePing"));
    setdynamicdvar(@"hash_6292876408549d8c", getmatchrulesdata("infectData", "giveTKOnTISpawn"));
    setdynamicdvar(@"hash_e5a33d679c26221f", 0);
    setdynamicdvar(@"hash_cbed990d7208a0a5", 0);
    if (getdvarint(@"hash_708473a41b11b061", 0)) {
        setdynamicdvar(@"hash_6c5a93985d33efc8", "jup_jp23_me_knife");
        setdynamicdvar(@"hash_8a3e30cc9f0d0c79", "jup_jp16_sh_recho870");
        setdynamicdvar(@"hash_b7be534f7d1f6c91", "jup_jp12_pi_mike93");
        setdynamicdvar(@"hash_a44ac0c52a7bffdd", "jup_jp16_sh_recho870");
        setdynamicdvar(@"hash_c4b02863872af0bd", "jup_jp12_pi_mike93");
        if (level.var_62f6f7640e4431e3.namekey == "infect_holiday") {
            setdynamicdvar(@"hash_6c5a93985d33efc8", "jup_jp23_me_knife");
            setdynamicdvar(@"hash_a4d8476ca2b3de70", "equip_pball");
        }
    }
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19d9
// Size: 0x231
function onstartgametype() {
    setclientnamemode("auto_change");
    foreach (entry in level.teamnamelist) {
        setobjectivetext(entry, "OBJECTIVES/INFECT");
        if (level.splitscreen) {
            setobjectivescoretext(entry, "OBJECTIVES/INFECT");
        } else {
            setobjectivescoretext(entry, "OBJECTIVES/INFECT_SCORE");
        }
        setobjectivehinttext(entry, "OBJECTIVES/INFECT_HINT");
    }
    if (namespace_36f464722d326bbe::islargemap()) {
        namespace_5078ee98abb32db9::initparachutedvars();
        if (!isdefined(level.var_624c83b532efce04)) {
            level.var_624c83b532efce04 = getdvarint(@"hash_ddee91e1cb8a1829", 1);
        }
        level.infectparachuteheightoffset = getdvarint(@"hash_11c720f90b371e56", 3000);
        level.alwaysdoskyspawnontacinsert = getdvarint(@"hash_9f8c0b29c8fb3bef", 0);
        level.skydiveontacinsertplacement = getdvarint(@"hash_497acc345b08a223", 0);
        level.allowskydivecutparachute = getdvarint(@"hash_756dcd63dd986f4c", 0);
        level.var_bb88666e1e748431 = getdvarfloat(@"hash_ae7ec88a72783b3e", 2);
        level.perkpackage_checkifready_callback = &perkpackage_checkifready_callback;
        level.tacinsert_gamemode_callback = &tacinsert_gamemode_callback;
        level.var_f91a05bc873bd121 = &function_911cbbebf68af0d8;
    }
    initspawns();
    level.quickmessagetoall = 1;
    level.blockweapondrops = 1;
    level.infect_allowsuicide = 0;
    level.infect_skipsounds = 0;
    level.playgotinfectedsoundcount = 0;
    level.infect_chosefirstinfected = 0;
    level.infect_choosingfirstinfected = 0;
    level.infect_teamscores["axis"] = 0;
    level.infect_teamscores["allies"] = 0;
    level.infect_players = [];
    registersharedfunc("vehicle_compass", "shouldBeVisibleToPlayer", &vehicle_compass_infect_shouldbevisibletoplayer);
    if (istrue(level.isgroundwarinfected)) {
        namespace_b46034845796aac0::emergency_cleanupents();
        thread init_infectgroundwarvehicles();
    }
    thread namespace_2e3ff2bec3fe28b7::function_4b1e3f35c961e700();
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c11
// Size: 0x4b6
function updategametypedvars() {
    namespace_310ba947928891df::updatecommongametypedvars();
    level.numinitialinfected = dvarintvalue("numInitialInfected", 1, 1, 9);
    level.survivorprimaryweapon = getdvar(@"hash_a44ac0c52a7bffdd", "iw9_sh_mbravo_mp");
    level.survivorsecondaryweapon = getdvar(@"hash_c4b02863872af0bd", "iw9_pi_golf17_mp");
    level.survivorlethal = getdvar(@"hash_d1b3309408a1e897", "equip_claymore");
    level.survivortactical = getdvar(@"hash_a305fa9e69c31190", "equip_concussion");
    level.survivorsuper = getdvar(@"hash_a3c1a41ff13c5bac", "super_tac_cover");
    level.survivorsupertwo = getdvar(@"hash_b0950d9d807b3bc6", "none");
    level.infectedprimaryweapon = getdvar(@"hash_6c5a93985d33efc8", "iw9_me_knife_mp");
    level.infectedsecondaryweapon = getdvar(@"hash_94cd061650f7ce18", "iw9_me_fists_mp");
    level.initialprimaryweapon = getdvar(@"hash_8a3e30cc9f0d0c79", "iw9_sh_mbravo_mp");
    level.initialsecondaryweapon = getdvar(@"hash_b7be534f7d1f6c91", "iw9_pi_golf17_mp");
    level.infectedlethal = getdvar(@"hash_a4d8476ca2b3de70", "equip_throwing_knife");
    level.infectedtactical = getdvar(@"hash_cf7a6e0ed93c9277", "equip_tac_insert");
    level.infectedsuper = getdvar(@"hash_c8c77b5a2a21af33", "super_deadsilence");
    level.infectedsupertwo = getdvar(@"hash_bfad61c7edf9ba5b", "none");
    level.infectextratimeperkill = dvarfloatvalue("infectExtraTimePerKill", 30, 0, 60);
    level.survivoralivescore = dvarintvalue("survivorAliveScore", 25, 0, 100);
    level.survivorscoretime = dvarfloatvalue("survivorScoreTime", 30, 0, 60);
    level.survivorscorepertick = dvarintvalue("survivorScorePerTick", 50, 0, 100);
    level.infectstreakbonus = dvarintvalue("infectStreakBonus", 50, 0, 100);
    level.enableinfectedtracker = dvarintvalue("enableInfectedTracker", 0, 0, 1);
    level.enableping = dvarintvalue("enablePing", 0, 0, 1);
    level.givetkontispawn = dvarintvalue("giveTKOnTISpawn", 0, 0, 1);
    level.infectbonusscore = getdvarint(@"hash_c9034fcb93f29981", 150);
    level.infectbonussuperonspawn = getdvarint(@"hash_3cf02ba1288e7934", 0);
    level.infectbonussuperontacinsert = getdvarint(@"hash_21521abc03c44042", 0);
    level.var_5b8eacb759c64658 = getdvarint(@"hash_79432649c9607465", 20);
    level.var_6466716a73ff8f0b = getdvarint(@"hash_e72561acfdea085a", 3);
    level.var_5aaa30c2942d7a75 = getdvarint(@"hash_b577c0842850bf7e", 24);
    level.var_6f84c741ab4b49d1 = getdvarint(@"hash_2748c18c28569b64", 1);
    level.survivorstreakoverride = [];
    survivorstreakoverride = getdvar(@"hash_57bba4da542dfa17", "");
    if (survivorstreakoverride != "") {
        level.survivorstreakoverride = strtok(survivorstreakoverride, ",");
    }
    mapname = namespace_36f464722d326bbe::getmapname();
    if (issubstr(mapname, "mp_m_") && mapname != "mp_m_speed") {
        level.survivorsuper = fixupsupersandtacticalsforgunfightmaps(0, 0);
        level.survivorsupertwo = fixupsupersandtacticalsforgunfightmaps(0, 1);
        level.infectedsuper = fixupsupersandtacticalsforgunfightmaps(1, 0);
        level.infectedsupertwo = fixupsupersandtacticalsforgunfightmaps(1, 1);
    }
    if (level.survivorsuper == level.survivorsupertwo) {
        level.survivorsupertwo = "none";
    } else if (level.survivorsuper == "none" && level.survivorsupertwo != "none") {
        level.survivorsuper = level.survivorsupertwo;
        level.survivorsupertwo = "none";
    }
    if (level.infectedsuper == level.infectedsupertwo) {
        level.infectedsupertwo = "none";
    } else if (level.infectedsuper == "none" && level.infectedsupertwo != "none") {
        level.infectedsuper = level.infectedsupertwo;
        level.infectedsupertwo = "none";
    }
    thread buildandloadweapons();
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20ce
// Size: 0x78
function function_3aee9e3bc9b34c5f() {
    for (i = 0; i < level.allweapons.size; i++) {
        weaponname = level.allweapons[i];
        if (weaponname == "none") {
            continue;
        }
        if (getsubstr(weaponname, weaponname.size - 3) != "_mp") {
            level.allweapons[i] = level.allweapons[i] + "_mp";
        }
    }
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x214d
// Size: 0x42b
function buildandloadweapons() {
    waitframe();
    if (level.onlineprimaryoverride) {
        switch (level.survivorprimaryweapon) {
        case #"hash_68a11d587d71608f":
            level.arenaloadouts = 10;
            break;
        case #"hash_173baf947ad402b":
            level.arenaloadouts = 7;
            break;
        case #"hash_daf5a16da560ec6d":
            level.arenaloadouts = 9;
            break;
        case #"hash_fe5820862a460ef4":
            level.arenaloadouts = 8;
            break;
        case #"hash_5d48fa913e5b8a2f":
            level.arenaloadouts = 11;
            break;
        default:
            level.arenaloadouts = 7;
            break;
        }
        game["arenaRandomLoadout"] = array_randomize(game["arenaLoadouts"]);
        level.survivorprimaryweapon = game["arenaRandomLoadout"][0]["loadoutPrimary"];
        if (game["arenaRandomLoadout"][0]["loadoutSecondary"] != "none") {
            level.survivorsecondaryweapon = game["arenaRandomLoadout"][0]["loadoutSecondary"];
        }
        level.initialprimaryweapon = game["arenaRandomLoadout"][0]["loadoutPrimary"];
        if (game["arenaRandomLoadout"][0]["loadoutSecondary"] != "none") {
            level.initialsecondaryweapon = game["arenaRandomLoadout"][0]["loadoutSecondary"];
        }
    }
    level.allweapons = [];
    level.allweapons[level.allweapons.size] = level.survivorprimaryweapon;
    level.allweapons[level.allweapons.size] = level.survivorsecondaryweapon;
    level.allweapons[level.allweapons.size] = level.infectedprimaryweapon;
    level.allweapons[level.allweapons.size] = level.infectedsecondaryweapon;
    level.allweapons[level.allweapons.size] = level.initialprimaryweapon;
    level.allweapons[level.allweapons.size] = level.initialsecondaryweapon;
    level.allweapons = array_remove_duplicates(level.allweapons);
    function_3aee9e3bc9b34c5f();
    foreach (weapon in level.allweapons) {
        if (weapon != "none") {
            rootname = getweaponrootname(weapon);
            var_657bbaa6ee802e63 = [];
            if (level.onlineprimaryoverride) {
                if (weapon == level.allweapons[0] || weapon == level.allweapons[4]) {
                    for (i = 1; i < 6; i++) {
                        concat = i;
                        if (i == 1) {
                            concat = "";
                        }
                        attachment = game["arenaRandomLoadout"][0]["loadoutPrimaryAttachment" + concat];
                        if (attachment != "none") {
                            var_657bbaa6ee802e63[var_657bbaa6ee802e63.size] = attachment;
                        }
                    }
                }
                if (weapon == level.allweapons[1] || weapon == level.allweapons[5]) {
                    for (i = 1; i < 6; i++) {
                        concat = i;
                        if (i == 1) {
                            concat = "";
                        }
                        attachment = game["arenaRandomLoadout"][0]["loadoutSecondaryAttachment" + concat];
                        if (attachment != "none") {
                            var_657bbaa6ee802e63[var_657bbaa6ee802e63.size] = attachment;
                        }
                    }
                }
            }
            if (level.infectednightmode) {
                game["arenaRandomLoadout"][0]["loadoutPrimaryAttachment"] = getthermalscopeperweaponclass();
            }
            camoindex = "none";
            reticleindex = "none";
            var_2cf0771420522cb6 = buildweapon(rootname, var_657bbaa6ee802e63, camoindex, reticleindex);
            newweapon = getcompleteweaponname(var_2cf0771420522cb6);
        }
    }
    level thread setspecialloadouts();
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x257f
// Size: 0x143
function getthermalscopeperweaponclass() {
    weapon = game["arenaRandomLoadout"][0]["loadoutPrimary"] + "_mp";
    weapon_class = weaponclass(weapon);
    level.weapon_class = weapon_class;
    attachment = game["arenaRandomLoadout"][0]["loadoutPrimaryAttachment"];
    switch (weapon_class) {
    case #"hash_8cdaf2e4ecfe5b51":
    case #"hash_900cb96c552c5e8e":
    case #"hash_fa24dff6bd60a12d":
        var_ea0c0140406f46fa = randomintrange(0, 3);
        if (var_ea0c0140406f46fa == 0) {
            attachment = "thermal";
        } else if (var_ea0c0140406f46fa == 0) {
            attachment = "thermal2";
        } else {
            attachment = "hybrid3";
        }
        break;
    case #"hash_6191aaef9f922f96":
        var_ea0c0140406f46fa = randomintrange(0, 3);
        if (var_ea0c0140406f46fa == 0) {
            attachment = "thermal";
        } else if (var_ea0c0140406f46fa == 0) {
            attachment = "thermal2";
        } else {
            attachment = "thermalvz";
        }
        break;
    case #"hash_690c0d6a821b42e":
        attachment = "thermal";
    case #"hash_61e969dacaaf9881":
        break;
    case #"hash_719417cb1de832b6":
        break;
    default:
        break;
    }
    return attachment;
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x26ca
// Size: 0x59
function stripweapsuffix(weaponname) {
    if (issubstr(weaponname, "mpr")) {
        weaponname = strip_suffix(weaponname, "_mpr");
    } else if (issubstr(weaponname, "mpl")) {
        weaponname = strip_suffix(weaponname, "_mpl");
    } else {
        weaponname = strip_suffix(weaponname, "_mp");
    }
    return weaponname;
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x272b
// Size: 0x141
function fixupsupersandtacticalsforgunfightmaps(infected, var_b9949d9c8ff08844) {
    if (istrue(var_b9949d9c8ff08844)) {
        super = ter_op(infected, level.infectedsupertwo, level.survivorsupertwo);
    } else {
        super = ter_op(infected, level.infectedsuper, level.survivorsuper);
    }
    switch (super) {
    case #"hash_699e6c3e460adde4":
    case #"hash_7266a252f51150e9":
    case #"hash_ac520bae8aaba66b":
        super = "super_ammo_drop";
        break;
    case #"hash_16577b244953e989":
        if (infected && level.infectedtactical == "equip_tac_insert") {
            level.infectedtactical = "none";
        } else if (level.survivortactical == "equip_tac_insert") {
            level.survivortactical = "none";
        }
        break;
    case #"hash_b17ed5514d85b71b":
        if (infected && level.infectedtactical == "equip_trophy") {
            level.infectedtactical = "none";
        } else if (level.survivortactical == "equip_trophy") {
            level.survivortactical = "none";
        }
        break;
    }
    return super;
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2874
// Size: 0x1a5
function onplayerconnect(player) {
    player.gamemodefirstspawn = 1;
    player.gamemodejoinedatstart = 1;
    player.infectedrejoined = 0;
    player.waitedtospawn = 0;
    if (!namespace_4b0406965e556711::gameflag("prematch_done") || istrue(level.infect_countdowninprogress)) {
        player.waitedtospawn = 1;
    }
    player namespace_d19129e4fa5d176::function_a16868d4dcd81a4b();
    player loadweaponsforplayer(level.allweapons, 1);
    if (namespace_4b0406965e556711::gameflag("prematch_done")) {
        player.gamemodejoinedatstart = 0;
        if (isdefined(level.infect_chosefirstinfected) && level.infect_chosefirstinfected) {
            player.survivalstarttime = gettime();
        }
    }
    if (isdefined(level.infect_players[player.name])) {
        player.infectedrejoined = 1;
    }
    if (isdefined(player.isinitialinfected)) {
        player.pers["gamemodeLoadout"] = level.infect_loadouts["axis_initial"];
    } else if (player.infectedrejoined) {
        player.pers["gamemodeLoadout"] = level.infect_loadouts["axis"];
    } else {
        player.pers["gamemodeLoadout"] = level.infect_loadouts["allies"];
    }
    player thread monitorsurvivaltime();
    if (level.isgroundwarinfected && level.var_624c83b532efce04) {
        player thread skydivehintnotify();
    }
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a20
// Size: 0x99
function givesurvivortimescore() {
    level endon("game_ended");
    while (1) {
        wait(level.survivorscoretime);
        foreach (player in level.players) {
            if (player.team == "allies") {
                player thread doScoreEvent(#"survivor", undefined, level.survivorscorepertick);
            }
        }
    }
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ac0
// Size: 0x371
function initspawns() {
    if (namespace_36f464722d326bbe::islargemap()) {
        level.gamemodestartspawnpointnames = [];
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
        namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_gw_spawn_allies_start");
        namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_gw_spawn_axis_start");
        namespace_b2d5aa2baf2b5701::addspawnpoints(game["attackers"], "mp_gw_spawn_allies_start");
        namespace_b2d5aa2baf2b5701::addspawnpoints(game["defenders"], "mp_gw_spawn_axis_start");
        attackers = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_gw_spawn_allies_start");
        defenders = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_gw_spawn_axis_start");
        namespace_b2d5aa2baf2b5701::registerspawnset("start_attackers", attackers);
        namespace_b2d5aa2baf2b5701::registerspawnset("start_defenders", defenders);
        namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_tdm_spawn");
        namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_tdm_spawn");
        namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_tdm_spawn_secondary", 1, 1);
        namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_tdm_spawn_secondary", 1, 1);
        spawns = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn");
        var_3a5288f40c8be099 = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn_secondary");
        spawns = namespace_2e3ff2bec3fe28b7::function_79f898a92fdba4b2(spawns);
        var_3a5288f40c8be099 = namespace_2e3ff2bec3fe28b7::function_79f898a92fdba4b2(var_3a5288f40c8be099);
        namespace_b2d5aa2baf2b5701::registerspawnset("normal", spawns);
        namespace_b2d5aa2baf2b5701::registerspawnset("fallback", var_3a5288f40c8be099);
    } else {
        if (function_bff229a11ecd1e34()) {
            namespace_b2d5aa2baf2b5701::setactivespawnlogic(#"default");
        } else {
            namespace_b2d5aa2baf2b5701::setactivespawnlogic("Default", "Crit_Default");
        }
        level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
        level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
        namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_tdm_spawn");
        namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_tdm_spawn");
        namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_tdm_spawn_secondary", 1, 1);
        namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_tdm_spawn_secondary", 1, 1);
        spawns = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn");
        var_3a5288f40c8be099 = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn_secondary");
        spawns = namespace_2e3ff2bec3fe28b7::function_79f898a92fdba4b2(spawns);
        var_3a5288f40c8be099 = namespace_2e3ff2bec3fe28b7::function_79f898a92fdba4b2(var_3a5288f40c8be099);
        namespace_b2d5aa2baf2b5701::registerspawnset("normal", spawns);
        namespace_b2d5aa2baf2b5701::registerspawnset("fallback", var_3a5288f40c8be099);
        level.mapcenter = namespace_b2d5aa2baf2b5701::findboxcenter(level.spawnmins, level.spawnmaxs);
        setmapcenter(level.mapcenter);
    }
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2e38
// Size: 0xb9
function getspawnpoint() {
    if (isplayer(self) && self.gamemodefirstspawn) {
        self.gamemodefirstspawn = 0;
        namespace_d19129e4fa5d176::function_a16868d4dcd81a4b();
        var_473fa7402cdb132b = "allies";
        if (self.infectedrejoined) {
            var_473fa7402cdb132b = "axis";
        }
        namespace_e5ed2f5a5ee8410e::addtoteam(var_473fa7402cdb132b, 1);
        thread monitordisconnect();
    }
    if (level.ingraceperiod) {
        spawnpoints = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn");
        spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint_random(spawnpoints);
    } else {
        spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, self.pers["team"], "normal", "fallback");
    }
    return spawnpoint;
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ef9
// Size: 0x210
function onspawnplayer(var_9156b53bcf7ce573) {
    self.teamchangedthisframe = undefined;
    self.infect_spawnpos = self.origin;
    self.infectedkillsthislife = 0;
    if (self.pers["team"] == "axis") {
        namespace_25c5a6f43bb97b43::disablebattlechatter(self);
        if (istrue(level.isgroundwarinfected)) {
            self.var_4da443f197c8014e = 1;
        }
        if (istrue(level.allowskydivecutparachute)) {
            self skydive_cutparachuteon();
        } else {
            self skydive_cutparachuteoff();
        }
    }
    updateteamscores();
    if (!level.infect_choosingfirstinfected) {
        level.infect_choosingfirstinfected = 1;
        level thread choosefirstinfected();
    }
    if (!namespace_4b0406965e556711::gameflag("prematch_done") || istrue(level.infect_countdowninprogress)) {
        self.waitedtospawn = 0;
    }
    if (self.infectedrejoined) {
        if (!level.infect_allowsuicide) {
            level notify("infect_stopCountdown");
            level.infect_chosefirstinfected = 1;
            level.infect_allowsuicide = 1;
            foreach (player in level.players) {
                if (isdefined(player.infect_isbeingchosen)) {
                    player.infect_isbeingchosen = undefined;
                }
            }
        }
        foreach (player in level.players) {
            if (isdefined(player.isinitialinfected)) {
                player thread setinitialtonormalinfected();
            }
        }
        if (level.infect_teamscores["axis"] == 1) {
            self.isinitialinfected = 1;
        }
        initsurvivaltime(1);
    }
    thread onspawnfinished();
    thread updatematchstatushintonspawn();
    level notify("spawned_player");
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3110
// Size: 0x8a
function spawnwithplayersecondary() {
    var_bd5cce7508e151a9 = self getweaponslistprimaries();
    var_820724b64fc1515 = self getcurrentprimaryweapon();
    if (var_bd5cce7508e151a9.size > 1) {
        if (isknifeonly(var_820724b64fc1515)) {
            foreach (weapon in var_bd5cce7508e151a9) {
                if (weapon != var_820724b64fc1515) {
                    self setspawnweapon(weapon);
                }
            }
        }
    }
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x31a1
// Size: 0x47
function setdefaultammoclip(team) {
    setdefaultammoclip = 1;
    if (isdefined(self.isinitialinfected)) {
        if (isusingdefaultclass(team, 1)) {
            setdefaultammoclip = 0;
        }
    } else if (isusingdefaultclass(team, 0)) {
        setdefaultammoclip = 0;
    }
    return setdefaultammoclip;
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x31f0
// Size: 0x39c
function onspawnfinished() {
    self endon("death_or_disconnect");
    self waittill("giveLoadout");
    if (istrue(self.waitedtospawn)) {
        self.waitedtospawn = 0;
        self.suicidedfromspawnwait = 1;
        wait(0.1);
        self suicide();
    }
    self.last_infected_class = self.infected_class;
    if (self.pers["team"] == "allies") {
        if (level.enableping) {
            giveperk("specialty_boom");
        }
        if (level.isgroundwarinfected) {
            thread givesuperpointsonprematchdone();
        }
        spawnwithplayersecondary();
        if (level.infectednightmode && !level.infecteddisablenvg && !isbot(self)) {
            thread nvgwatcher();
        }
    } else if (self.pers["team"] == "axis") {
        if (istrue(level.allowskydivecutparachute)) {
            self skydive_cutparachuteon();
        } else {
            self.var_4da443f197c8014e = 1;
            self skydive_cutparachuteoff();
        }
        if (level.enableping) {
            giveperk("specialty_boom");
        }
        var_50becd9157af76c1 = 1.05;
        if (!level.isgroundwarinfected) {
            var_d2da5f8c74dbc049 = int(floor(level.infect_teamscores["axis"] / 3));
            var_d2da5f8c74dbc049 = var_d2da5f8c74dbc049 * 0.01;
            var_50becd9157af76c1 = max(1, var_50becd9157af76c1 - var_d2da5f8c74dbc049);
        }
        self.overrideweaponspeed_speedscale = var_50becd9157af76c1;
        thread setinfectedmsg();
        if (level.infectedtactical == "equip_tac_insert" && !istrue(self.isinitialinfected)) {
            if (level.givetkontispawn || !level.givetkontispawn && !self.ti_spawn) {
                namespace_1a507865f681850e::giveequipment(level.infectedlethal, "primary");
            } else {
                namespace_1a507865f681850e::decrementequipmentammo(level.infectedlethal, 1);
            }
        }
        if (level.infectedtactical != "equip_tac_insert" || level.infectedtactical == "none") {
            namespace_1a507865f681850e::giveequipment(level.infectedtactical, "secondary");
        } else {
            giveperk("specialty_tacticalinsertion");
        }
    }
    giveextrainfectedperks();
    if (istrue(self.movedtoinfected)) {
        if (!level.isgroundwarinfected || level.isgroundwarinfected && level.mapname == "mp_aniyah") {
            self.movedtoinfected = undefined;
        }
        thread namespace_85d036cb78063c4a::givesuperpoints(350, undefined, 1);
    }
    rootname = getweaponrootname(self.loadoutprimary);
    if (rootname != "iw9_me_knife") {
        var_f968c960c23738e6 = namespace_d325722f2754c2c4::function_eeaa22f0cd1ff845("iw9_knifestab_mp");
        self giveweapon(var_f968c960c23738e6);
        self assignweaponmeleeslot(var_f968c960c23738e6);
        if (self.loadoutsecondary == "iw9_me_knife_mp") {
            takeweaponwhensafe("iw9_me_knife_mp");
            self giveweapon("iw9_me_knife_mp");
        }
    }
    if (istrue(self.faux_spawn_infected)) {
        if (isdefined(namespace_85d036cb78063c4a::getcurrentsuper()) && namespace_85d036cb78063c4a::getcurrentsuperref() == "super_deadsilence") {
            thread startdeadsilence();
        }
    }
    self.faux_spawn_infected = undefined;
    if (istrue(self.isparachutespawning)) {
        waitframe();
        self.isparachutespawning = undefined;
        thread namespace_5078ee98abb32db9::startfreefall(level.var_bb88666e1e748431, 0, undefined, undefined, 1);
    }
    thread namespace_85d036cb78063c4a::givesuperpoints(level.infectbonussuperonspawn, undefined, 1);
    thread waitthensetgendersoundcontext();
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3593
// Size: 0x5f
function waitthensetgendersoundcontext() {
    self endon("death_or_disconnect");
    wait(0.2);
    if (isdefined(self.operatorcustomization.gender) && self.operatorcustomization.gender == "female") {
        self function_555e2d32e2756625("female");
    } else {
        self function_555e2d32e2756625("");
    }
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x35f9
// Size: 0x4e
function givesuperpointsonprematchdone() {
    level endon("game_ended");
    self endon("death_or_disconnect");
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    if (!isdefined(level.infect_countdowninprogress) || istrue(level.infect_countdowninprogress)) {
        level waittill("infect_countdown_ended");
    }
    thread namespace_85d036cb78063c4a::givesuperpoints(200, undefined, 1);
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x364e
// Size: 0x4d
function managefists(primary, secondary) {
    if (primary != "iw9_me_fists" || secondary != "iw9_me_fists") {
        if (primary == "none" && secondary == "none") {
            goto LOC_0000004b;
        }
        takeweaponwhensafe("iw9_me_fists_mp");
    LOC_0000004b:
    }
LOC_0000004b:
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x36a2
// Size: 0x108
function giveextrainfectedperks() {
    if (self.pers["team"] == "allies") {
        extraperks = [0:"specialty_fast_reload"];
    } else if (istrue(self.isinitialinfected)) {
        extraperks = [0:"specialty_lightweight_vest", 1:"specialty_blacklight_flashlight", 2:"specialty_treadless_boots", 3:"specialty_lr_detector", 4:"specialty_dex_gloves"];
    } else {
        extraperks = [0:"specialty_lightweight_vest", 1:"specialty_blacklight_flashlight", 2:"specialty_treadless_boots"];
    }
    foreach (index, perk in extraperks) {
        giveperk(perk);
        self setclientomnvar("ui_spawn_perk_" + index, perk);
    }
    if (istrue(self.isinitialinfected)) {
        self setclientomnvar("ui_br_display_perk_info", 1);
    }
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x37b1
// Size: 0x3
function setinfectedmodels() {
    
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x37bb
// Size: 0xcf
function setinfectedmsg() {
    if (isdefined(self.isinitialinfected)) {
        if (!isdefined(self.showninfected) || !self.showninfected) {
            thread namespace_62c556437da28f50::scoreeventpopup(#"first_infected");
            self.showninfected = 1;
        }
    } else if (isdefined(self.changingtoregularinfected)) {
        self.changingtoregularinfected = undefined;
        if (isdefined(self.changingtoregularinfectedbykill)) {
            self.changingtoregularinfectedbykill = undefined;
            thread doScoreEvent(#"first_infected");
        }
    } else if (!isdefined(self.showninfected) || !self.showninfected) {
        thread namespace_62c556437da28f50::scoreeventpopup(#"hash_907bbe9cd1a3124e");
        self.showninfected = 1;
        self playlocalsound("jup_infected_player_spawn");
    }
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3891
// Size: 0x374
function choosefirstinfected() {
    level endon("game_ended");
    level endon("infect_stopCountdown");
    level endon("force_end");
    level.infect_allowsuicide = 0;
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    level.infect_countdowninprogress = 1;
    namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(1);
    setomnvar("ui_match_start_text", "first_infected_in");
    counttime = 15;
    while (counttime > 0 && !level.gameended) {
        foreach (p in level.players) {
            p setclientomnvar("ui_match_start_countdown", counttime);
        }
        counttime--;
        namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(1);
    }
    setomnvar("ui_match_start_text", "match_starting_in");
    foreach (p in level.players) {
        p setclientomnvar("ui_match_start_countdown", 0);
    }
    level.infect_countdowninprogress = 0;
    level notify("infect_countdown_ended");
    var_a4dcd8346351d366 = [];
    foreach (player in level.players) {
        if (matchmakinggame() && level.players.size > 1 && player ishost()) {
            continue;
        }
        if (player.team == "spectator") {
            continue;
        }
        if (!player.hasspawned) {
            continue;
        }
        var_a4dcd8346351d366[var_a4dcd8346351d366.size] = player;
    }
    level.firstinfectedsplash = 0;
    if (var_a4dcd8346351d366.size <= level.numinitialinfected && var_a4dcd8346351d366.size > 1) {
        level.numinitialinfected = var_a4dcd8346351d366.size - 1;
    }
    var_7cea7652605d7bd5 = [];
    for (i = 0; i < level.numinitialinfected; i++) {
        var_42181a2341cdf880 = var_a4dcd8346351d366[randomint(var_a4dcd8346351d366.size)];
        var_7cea7652605d7bd5[var_7cea7652605d7bd5.size] = var_42181a2341cdf880;
        var_a4dcd8346351d366 = array_remove(var_a4dcd8346351d366, var_42181a2341cdf880);
    }
    foreach (var_42181a2341cdf880 in var_7cea7652605d7bd5) {
        var_42181a2341cdf880 setfirstinfected(1);
    }
    level.infect_allowsuicide = 1;
    foreach (player in level.players) {
        if (istrue(player.isinitialinfected)) {
            player thread namespace_44abc05161e2e2cb::showsplash("first_infected");
            player namespace_944ddf7b8df1b0e3::leaderdialogonplayer("infected_first");
        } else {
            player thread namespace_44abc05161e2e2cb::showsplash("first_survivor");
            player.survivalstarttime = gettime();
        }
    }
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3c0c
// Size: 0x2a4
function setfirstinfected(var_e9ec3c871be9d510) {
    self endon("death_or_disconnect");
    if (var_e9ec3c871be9d510) {
        self.infect_isbeingchosen = 1;
    }
    while (!isreallyalive(self) || isusingremote() || isdefined(self.vehiclereserved)) {
        waitframe();
    }
    if (isdefined(self.iscarrying) && self.iscarrying == 1) {
        self notify("force_cancel_placement");
        waitframe();
    }
    vehicle = namespace_f8065cafc523dba5::getvehicle();
    if (isdefined(vehicle)) {
        data = spawnstruct();
        data.allowairexit = 1;
        data.exittype = "INVOLUNTARY";
        thread namespace_1fbd40990ee60ede::vehicle_occupancy_exit(vehicle, undefined, self, data, 1);
        while (namespace_f8065cafc523dba5::isinvehicle()) {
            waitframe();
        }
    }
    while (self ismantling()) {
        waitframe();
    }
    while (!isalive(self)) {
        waitframe();
    }
    while (istrue(self.usingascender)) {
        waitframe();
    }
    if (var_e9ec3c871be9d510) {
        namespace_e5ed2f5a5ee8410e::addtoteam("axis", undefined, 1);
        thread monitordisconnect();
        level.infect_chosefirstinfected = 1;
        self.infect_isbeingchosen = undefined;
        self.var_4da443f197c8014e = 1;
        if (istrue(level.allowskydivecutparachute)) {
            self skydive_cutparachuteon();
        } else {
            self skydive_cutparachuteoff();
        }
        updateteamscores();
        if (isfemale()) {
            self playlocalsound("Fem_breathing_better");
        } else {
            self playlocalsound("breathing_better");
        }
    }
    self.isinitialinfected = 1;
    incpersstat("firstInfected", 1);
    self.pers["gamemodeLoadout"] = level.infect_loadouts["axis_initial"];
    namespace_add8ab90fc53d7f7::spawnpoint_setspawnpoint(self.origin, self.angles);
    self notify("faux_spawn");
    self.faux_spawn_stance = self getstance();
    self.faux_spawn_infected = 1;
    self.operatorcustomization = undefined;
    self.pers["perkPackageData"].forcereset = 1;
    waittillframeend();
    thread namespace_99ac021a7547cae3::spawnplayer(1);
    if (level.isgroundwarinfected) {
        thread namespace_85d036cb78063c4a::givesuperpoints(350, undefined, 1);
    }
    if (var_e9ec3c871be9d510) {
        level.infect_players[self.name] = 1;
    }
    level.firstinfectedsplash = 1;
    if (!level.firstinfectedsplash) {
        level thread teamplayercardsplash("callout_first_infected", self);
    }
    if (!level.infect_skipsounds) {
        level.infect_skipsounds = 1;
    }
    thread waitthenshowinfecttext();
    initsurvivaltime(1);
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3eb7
// Size: 0x19
function waitthenshowinfecttext() {
    self endon("death_or_disconnect");
    wait(4);
    self iprintlnbold("SPLASHES/INFECT_ALL");
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ed7
// Size: 0x4b
function startdeadsilence() {
    if (getdvarint(@"hash_ae4e41a1d4cc5b7d", 1)) {
        if (isdefined(self.var_6bbdc76e4ba92033)) {
            return;
        }
        self.var_6bbdc76e4ba92033 = 1;
    }
    thread namespace_85d036cb78063c4a::givesuperpoints(4000, undefined, 1);
    wait(0.5);
    thread namespace_727d2aa1d6c72038::perkpackage_forceusesuper();
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3f29
// Size: 0x14b
function setinitialtonormalinfected(var_afd26c4701021bed, smeansofdeath) {
    level endon("game_ended");
    self endon("death");
    self.isinitialinfected = undefined;
    self.changingtoregularinfected = 1;
    if (isdefined(var_afd26c4701021bed)) {
        self.changingtoregularinfectedbykill = 1;
    }
    while (!isreallyalive(self)) {
        waitframe();
    }
    if (isdefined(self.iscarrying) && self.iscarrying == 1) {
        self notify("force_cancel_placement");
        waitframe();
    }
    while (self ismantling()) {
        waitframe();
    }
    while (self ismeleeing()) {
        waitframe();
    }
    while (!isreallyalive(self)) {
        waitframe();
    }
    self.pers["gamemodeLoadout"] = level.infect_loadouts["axis"];
    namespace_add8ab90fc53d7f7::spawnpoint_setspawnpoint(self.origin, self.angles);
    self notify("faux_spawn");
    self.faux_spawn_stance = self getstance();
    self.faux_spawn_infected = 1;
    if (isdefined(namespace_85d036cb78063c4a::getcurrentsuper()) && namespace_85d036cb78063c4a::getcurrentsuper().isinuse) {
        thread namespace_85d036cb78063c4a::superusefinished(0);
    }
    self.pers["perkPackageData"].forcereset = 1;
    waitframe();
    thread namespace_99ac021a7547cae3::spawnplayer(1);
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x407b
// Size: 0x4da
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, lifeid) {
    if (level.gameended) {
        return;
    }
    var_5a0ee87d3a8fc462 = 0;
    wassuicide = 0;
    level thread shouldplayhalfwayvo();
    if (self.team == "axis") {
    }
    if (self.team == "allies" && isdefined(attacker)) {
        self.operatorcustomization = undefined;
        if (isplayer(attacker) && attacker != self) {
            var_5a0ee87d3a8fc462 = 1;
            self playsoundtoteam("jup_infected_player_team_killed", self.team, self, self);
        } else if (level.infect_allowsuicide && (attacker == self || !isplayer(attacker))) {
            var_5a0ee87d3a8fc462 = 1;
            wassuicide = 1;
        }
    }
    if (self.team == "allies" && istrue(level.nukeinfo.incoming)) {
        if (isdefined(level.nukeinfo.player) && self == level.nukeinfo.player) {
            var_5a0ee87d3a8fc462 = 0;
            wassuicide = 0;
        }
    }
    if (isplayer(attacker) && attacker.team == "allies" && attacker != self) {
        attacker incpersstat("killsAsSurvivor", 1);
        attacker namespace_2685ec368e022695::statsetchild("round", "killsAsSurvivor", attacker.pers["killsAsSurvivor"]);
    } else if (isplayer(attacker) && attacker.team == "axis" && attacker != self) {
        attacker incpersstat("killsAsInfected", 1);
        attacker namespace_2685ec368e022695::statsetchild("round", "killsAsInfected", attacker.pers["killsAsInfected"]);
        if (isplayer(attacker)) {
            attacker setextrascore1(attacker.pers["killsAsInfected"]);
        }
    }
    if (var_5a0ee87d3a8fc462) {
        thread delayedprocesskill(attacker, wassuicide);
        if (wassuicide) {
            foreach (player in level.players) {
                if (isdefined(player.isinitialinfected)) {
                    player thread setinitialtonormalinfected();
                }
            }
        } else if (isdefined(attacker.isinitialinfected)) {
            foreach (player in level.players) {
                if (isdefined(player.isinitialinfected)) {
                    player thread setinitialtonormalinfected(1);
                }
            }
        } else if (level.infectstreakbonus > 0) {
            if (!isdefined(attacker.infectedkillsthislife)) {
                attacker.infectedkillsthislife = 1;
            } else {
                attacker.infectedkillsthislife++;
            }
            attacker thread doScoreEvent(#"infected_survivor", undefined, level.infectstreakbonus * attacker.infectedkillsthislife);
        } else {
            attacker thread doScoreEvent(#"infected_survivor");
        }
        if (getwatcheddvar("timelimit") != 0) {
            var_a3aaa6a031ab1d3f = 1;
            if (matchmakinggame()) {
                level.extratimeincreasecount++;
                var_a3aaa6a031ab1d3f = level.extratimeincreasecount <= level.extratimeincreasecountcap;
            }
            if (var_a3aaa6a031ab1d3f) {
                if (!isdefined(level.extratime)) {
                    level.extratime = level.infectextratimeperkill;
                } else {
                    level.extratime = level.extratime + level.infectextratimeperkill;
                }
            }
        }
        setsurvivaltime(1);
    } else {
        if (isbot(self)) {
            self.classcallback = "gamemode";
        }
        if (isdefined(self.isinitialinfected)) {
            self.pers["gamemodeLoadout"] = level.infect_loadouts["axis_initial"];
            self.infected_class = "axis_initial";
        } else {
            self.pers["gamemodeLoadout"] = level.infect_loadouts[self.pers["team"]];
            self.infected_class = self.pers["team"];
        }
    }
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x455c
// Size: 0x391
function delayedprocesskill(attacker, wassuicide) {
    self.movedtoinfected = 1;
    wait(0.15);
    self.teamchangedthisframe = 1;
    self.operatorcustomization = undefined;
    namespace_e5ed2f5a5ee8410e::addtoteam("axis");
    if (level.isgroundwarinfected && level.mapname != "mp_aniyah") {
        setfaketispawnpoint();
    }
    updateteamscores();
    level.infect_players[self.name] = 1;
    thread monitordisconnect();
    if (level.infect_teamscores["allies"] > 1) {
        if (level.isgroundwarinfected) {
            level.playgotinfectedsoundcount++;
            if (level.playgotinfectedsoundcount > 3) {
                level.playgotinfectedsoundcount = 1;
            }
        }
        if (istrue(level.var_6f84c741ab4b49d1)) {
            if (level.infect_teamscores["allies"] <= level.var_5aaa30c2942d7a75) {
                level notify("infect_enable_axis_uav");
                thread namespace_2e3ff2bec3fe28b7::function_f14f087ebc3beac2();
            }
        }
        if (level.playgotinfectedsoundcount == 1) {
            thread teamplayercardsplash("callout_got_infected", self, "allies");
        }
        if (!wassuicide) {
            thread teamplayercardsplash("callout_infected", attacker, "axis");
            if (!isdefined(level.survivorscoreevent)) {
                var_a5d020aa6adb222f = getdvarint(@"hash_1ca4603781cb4d9b", 50);
                if (var_a5d020aa6adb222f > 0) {
                    level.survivorscoreevent = var_a5d020aa6adb222f;
                } else {
                    level.survivorscoreevent = namespace_62c556437da28f50::getscoreinfovalue(#"survivor");
                }
            } else {
                level.survivorscoreevent = level.survivorscoreevent + level.survivoralivescore;
            }
            foreach (player in level.players) {
                if (!isreallyalive(player) || self.sessionstate == "spectator") {
                    continue;
                }
                if (player.team == "allies" && player != self && distance(player.infect_spawnpos, player.origin) > 32) {
                    player thread doScoreEvent(#"survivor", undefined, level.survivorscoreevent);
                }
                if (player.team == "axis" && player != attacker && player != self) {
                    player thread doScoreEvent(#"assist", undefined, level.infectbonusscore);
                }
            }
        }
    } else if (level.infect_teamscores["allies"] == 1) {
        onfinalsurvivor();
    } else if (level.infect_teamscores["allies"] == 0) {
        onsurvivorseliminated();
    }
    if (isbot(self)) {
        self.classcallback = "gamemode";
    }
    if (isdefined(self.isinitialinfected)) {
        self.pers["gamemodeLoadout"] = level.infect_loadouts["axis_initial"];
        self.infected_class = "axis_initial";
    } else {
        self.pers["gamemodeLoadout"] = level.infect_loadouts[self.pers["team"]];
        self.infected_class = self.pers["team"];
    }
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x48f4
// Size: 0x106
function onnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    if (istrue(level.matchmakingmatch) && isdefined(attacker) && isdefined(victim)) {
        var_6980251e86d0a47 = attacker getfireteammembers();
        if (isdefined(var_6980251e86d0a47) && var_6980251e86d0a47.size > 0) {
            foreach (member in var_6980251e86d0a47) {
                if (isdefined(member) && victim == member) {
                    attacker namespace_58a74e7d54b56e8d::givestreakpoints(#"kill", -1, 0);
                    attacker.nukepoints = ter_op(attacker.nukepoints > 0, attacker.nukepoints - 1, 0);
                    break;
                }
            }
        }
    }
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a01
// Size: 0x135
function onfinalsurvivor() {
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        if (player.team == "allies") {
            player namespace_944ddf7b8df1b0e3::leaderdialogonplayer("infected_lastalive");
            player thread namespace_48a08c5037514e04::doScoreEvent(#"final_survivor");
            player playlocalsound("jup_infected_player_last_stand", "allies");
            player incpersstat("lastSurvivor", 1);
            player thread function_9f1649ee39d3bd26(6, 500);
            if (matchmakinggame() && !player isjuggernaut()) {
                player.maxhealth = 200;
                player notify("force_regeneration");
            }
            thread teamplayercardsplash("callout_final_survivor", player);
            if (level.infectednightmode) {
                goto LOC_0000010a;
            }
            if (matchmakinggame() && !player isjuggernaut()) {
                level thread function_3730ca06a1ee0c25(player);
            LOC_0000010a:
            }
        LOC_0000010a:
            break;
        } else {
            player playlocalsound("jup_infected_enemy_last_stand", "axis");
        }
    }
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4b3d
// Size: 0x7d
function function_3730ca06a1ee0c25(var_8084efa02d906bb2) {
    level endon("game_ended");
    var_8084efa02d906bb2 endon("disconnect");
    var_8084efa02d906bb2 endon("eliminated");
    while (1) {
        if (level.infect_teamscores["allies"] > 1) {
            var_8084efa02d906bb2.health = ter_op(var_8084efa02d906bb2.health > 100, 100, var_8084efa02d906bb2.health);
            var_8084efa02d906bb2.maxhealth = 100;
            break;
        }
        waitframe();
    }
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4bc1
// Size: 0x10f
function private function_4b1e3f35c961e700() {
    level notify("infect_radar_thread");
    level endon("game_ended");
    level endon("infect_radar_thread");
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    if (!isdefined(level.infect_countdowninprogress) || istrue(level.infect_countdowninprogress)) {
        level waittill("infect_countdown_ended");
    }
    if (istrue(level.var_6f84c741ab4b49d1)) {
        level waittill("infect_enable_axis_uav");
        setteamradar("axis", 1);
        return;
    }
    while (1) {
        foreach (player in level.players) {
            if (player.team == "axis") {
                triggeroneoffradarsweep(player);
            }
        }
        if (level.infect_teamscores["allies"] > level.var_5aaa30c2942d7a75) {
            wait(level.var_5b8eacb759c64658);
        } else {
            wait(level.var_6466716a73ff8f0b);
        }
    }
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4cd7
// Size: 0x4d
function private function_f14f087ebc3beac2() {
    level notify("infect_radar_listen_for_disable");
    level endon("game_ended");
    level endon("infect_radar_listen_for_disable");
    while (level.infect_teamscores["allies"] <= level.var_5aaa30c2942d7a75) {
        waitframe();
    }
    setteamradar("axis", 0);
    thread function_4b1e3f35c961e700();
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4d2b
// Size: 0x2c0
function monitordisconnect() {
    level endon("game_ended");
    self endon("eliminated");
    self notify("infect_monitor_disconnect");
    self endon("infect_monitor_disconnect");
    team = self.team;
    if (!isdefined(team) && isdefined(self.bot_team)) {
        team = self.bot_team;
    }
    self waittill("disconnect");
    updateteamscores();
    if (isdefined(self.infect_isbeingchosen) || level.infect_chosefirstinfected) {
        if (level.infect_teamscores["axis"] && level.infect_teamscores["allies"]) {
            if (team == "allies" && level.infect_teamscores["allies"] == 1) {
                onfinalsurvivor();
            } else if (team == "axis" && level.infect_teamscores["axis"] == 1) {
                foreach (player in level.players) {
                    if (player != self && player.team == "axis") {
                        player setfirstinfected(0);
                    }
                }
            }
        } else if (level.infect_teamscores["allies"] == 0) {
            if (istrue(level.hostmigration)) {
                namespace_e323c8674b44c8f4::waittillhostmigrationdone();
            }
            onsurvivorseliminated();
        } else if (level.infect_teamscores["axis"] == 0) {
            if (level.infect_teamscores["allies"] == 1) {
                level thread namespace_d576b6dc7cef9c62::endgame("allies", game["end_reason"][tolower(game["axis"]) + "_eliminated"]);
            } else if (level.infect_teamscores["allies"] > 1) {
                level.infect_chosefirstinfected = 0;
                level thread choosefirstinfected();
            }
        }
    } else if (istrue(level.infect_countdowninprogress) && level.infect_teamscores["allies"] == 0 && level.infect_teamscores["axis"] == 0) {
        level notify("infect_stopCountdown");
        level.infect_choosingfirstinfected = 0;
        foreach (p in level.players) {
            p setclientomnvar("ui_match_start_countdown", 0);
        }
    }
    self.isinitialinfected = undefined;
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4ff2
// Size: 0xc
function ondeadevent(team) {
    
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5006
// Size: 0x1e
function ontimelimit() {
    level thread namespace_d576b6dc7cef9c62::endgame("allies", game["end_reason"]["time_limit_reached"]);
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x502b
// Size: 0x1e
function onsurvivorseliminated() {
    level thread namespace_d576b6dc7cef9c62::endgame("axis", game["end_reason"]["survivors_eliminated"]);
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5050
// Size: 0xaf
function getteamsize(team) {
    size = 0;
    foreach (player in level.players) {
        if (player.sessionstate == "spectator" && !player.spectatekillcam && !istrue(player.inspawncamera)) {
            continue;
        }
        if (player.team == team) {
            size++;
        }
    }
    return size;
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5107
// Size: 0x125
function updateteamscores() {
    level.infect_teamscores["allies"] = getteamsize("allies");
    game["teamScores"]["allies"] = level.infect_teamscores["allies"];
    setteamscore("allies", level.infect_teamscores["allies"]);
    level.infect_teamscores["axis"] = getteamsize("axis");
    game["teamScores"]["axis"] = level.infect_teamscores["axis"];
    setteamscore("axis", level.infect_teamscores["axis"]);
    totalplayers = level.infect_teamscores["axis"] + level.infect_teamscores["allies"];
    if (!istrue(level.nojip) && totalplayers > 0) {
        var_a2da1da8598191a0 = level.infect_teamscores["axis"] / totalplayers;
        if (var_a2da1da8598191a0 > level.scorepercentagecutoff) {
            setnojipscore(1, 1);
            level.nojip = 1;
        }
    }
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5233
// Size: 0x141d
function setspecialloadouts() {
    waitframe();
    if (!isdefined(level.survivorprimaryweapon) || level.survivorprimaryweapon == "") {
        level.survivorprimaryweapon = "iw9_sh_mbravo_mp";
    }
    if (!isdefined(level.survivorsecondaryweapon) || level.survivorsecondaryweapon == "") {
        level.survivorsecondaryweapon = "iw9_pi_golf17_mp";
    }
    if (!isdefined(level.infectedprimaryweapon) || level.infectedprimaryweapon == "") {
        level.infectedprimaryweapon = "iw9_me_knife_mp";
    }
    if (!isdefined(level.infectedsecondaryweapon) || level.infectedsecondaryweapon == "") {
        level.infectedsecondaryweapon = "iw9_me_fists_mp";
    }
    if (!isdefined(level.initialprimaryweapon) || level.initialprimaryweapon == "") {
        level.initialprimaryweapon = "iw9_sh_mbravo_mp";
    }
    if (isdefined(level.infectedprimaryweapon) && level.infectedprimaryweapon == "iw9_me_knife_mp") {
        level.infectedprimaryweapon = "iw9_me_knife_mp";
        if (isdefined(level.infectedsecondaryweapon) && level.infectedsecondaryweapon == "iw9_me_knife_mp") {
            level.infectedsecondaryweapon = "none";
        }
    }
    if (!isdefined(level.initialsecondaryweapon) || level.initialsecondaryweapon == "") {
        level.initialsecondaryweapon = "iw9_pi_golf17_mp";
    }
    if (!isdefined(level.survivorlethal) || level.survivorlethal == "") {
        level.survivorlethal = "equip_claymore";
    }
    if (!isdefined(level.survivortactical) || level.survivortactical == "") {
        level.survivortactical = "equip_concussion";
    }
    if (!isdefined(level.infectedlethal) || level.infectedlethal == "") {
        level.infectedlethal = "equip_throwing_knife";
    }
    if (!isdefined(level.infectedtactical) || level.infectedtactical == "") {
        level.infectedtactical = "equip_tac_insert";
    }
    level.infect_allyrigs = [];
    level.infect_allyrigs[level.infect_allyrigs.size] = "archetype_assault";
    if (isusingdefaultclass("allies", 0)) {
        level.infect_loadouts["allies"] = getmatchrulesspecialclass("allies", 0);
    } else if (level.onlineprimaryoverride) {
        level.infect_loadouts["allies"]["loadoutPrimary"] = level.survivorprimaryweapon;
        level.infect_loadouts["allies"]["loadoutPrimaryAttachment"] = game["arenaRandomLoadout"][0]["loadoutPrimaryAttachment"];
        level.infect_loadouts["allies"]["loadoutPrimaryAttachment2"] = game["arenaRandomLoadout"][0]["loadoutPrimaryAttachment2"];
        level.infect_loadouts["allies"]["loadoutPrimaryAttachment3"] = game["arenaRandomLoadout"][0]["loadoutPrimaryAttachment3"];
        level.infect_loadouts["allies"]["loadoutPrimaryAttachment4"] = game["arenaRandomLoadout"][0]["loadoutPrimaryAttachment4"];
        level.infect_loadouts["allies"]["loadoutPrimaryAttachment5"] = game["arenaRandomLoadout"][0]["loadoutPrimaryAttachment5"];
        level.infect_loadouts["allies"]["loadoutPrimaryCamo"] = "none";
        level.infect_loadouts["allies"]["loadoutPrimaryReticle"] = "none";
        level.infect_loadouts["allies"]["loadoutPrimaryVariantID"] = 0;
        level.infect_loadouts["allies"]["loadoutSecondary"] = level.survivorsecondaryweapon;
        level.infect_loadouts["allies"]["loadoutSecondaryAttachment"] = level.attachmentsurvivorsecondary;
        level.infect_loadouts["allies"]["loadoutSecondaryAttachment2"] = level.attachmentsurvivorsecondarytwo;
        level.infect_loadouts["allies"]["loadoutSecondaryCamo"] = "none";
        level.infect_loadouts["allies"]["loadoutSecondaryReticle"] = "none";
        level.infect_loadouts["allies"]["loadoutSecondaryVariantID"] = 0;
        level.infect_loadouts["allies"]["loadoutEquipmentPrimary"] = level.survivorlethal;
        level.infect_loadouts["allies"]["loadoutEquipmentSecondary"] = level.survivortactical;
        level.infect_loadouts["allies"]["loadoutSuper"] = "none";
        level.infect_loadouts["allies"]["loadoutStreakType"] = "assault";
        if (level.survivorstreakoverride.size > 0) {
            level.infect_loadouts["allies"]["loadoutKillstreak1"] = level.survivorstreakoverride[0];
            level.infect_loadouts["allies"]["loadoutKillstreak2"] = level.survivorstreakoverride[1];
            level.infect_loadouts["allies"]["loadoutKillstreak3"] = level.survivorstreakoverride[2];
            level.infect_loadouts["allies"]["loadoutPerks"] = [0:"specialty_warhead", 1:"specialty_scavenger_plus", 2:"specialty_restock"];
        } else {
            level.infect_loadouts["allies"]["loadoutKillstreak1"] = "none";
            level.infect_loadouts["allies"]["loadoutKillstreak2"] = "none";
            level.infect_loadouts["allies"]["loadoutKillstreak3"] = "none";
            level.infect_loadouts["allies"]["loadoutUsingSpecialist"] = 1;
            level.infect_loadouts["allies"]["loadoutPerks"] = [0:"specialty_hardline"];
            level.infect_loadouts["allies"]["loadoutExtraPerks"] = [0:"specialty_scavenger_plus", 1:"specialty_warhead", 2:"specialty_restock"];
        }
        level.infect_loadouts["allies"]["loadoutGesture"] = "playerData";
        level.infect_loadouts["allies"]["loadoutFieldUpgrade1"] = level.survivorsuper;
        level.infect_loadouts["allies"]["loadoutFieldUpgrade2"] = level.survivorsupertwo;
    } else {
        level.infect_loadouts["allies"]["loadoutPrimary"] = level.survivorprimaryweapon;
        level.infect_loadouts["allies"]["loadoutPrimaryAttachment"] = level.attachmentsurvivorprimary;
        level.infect_loadouts["allies"]["loadoutPrimaryAttachment2"] = "none";
        level.infect_loadouts["allies"]["loadoutPrimaryCamo"] = "none";
        level.infect_loadouts["allies"]["loadoutPrimaryReticle"] = "none";
        level.infect_loadouts["allies"]["loadoutPrimaryVariantID"] = 0;
        level.infect_loadouts["allies"]["loadoutSecondary"] = level.survivorsecondaryweapon;
        level.infect_loadouts["allies"]["loadoutSecondaryAttachment"] = level.attachmentsurvivorsecondary;
        level.infect_loadouts["allies"]["loadoutSecondaryAttachment2"] = level.attachmentsurvivorsecondarytwo;
        level.infect_loadouts["allies"]["loadoutSecondaryCamo"] = "none";
        level.infect_loadouts["allies"]["loadoutSecondaryReticle"] = "none";
        level.infect_loadouts["allies"]["loadoutSecondaryVariantID"] = 0;
        level.infect_loadouts["allies"]["loadoutEquipmentPrimary"] = level.survivorlethal;
        level.infect_loadouts["allies"]["loadoutEquipmentSecondary"] = level.survivortactical;
        level.infect_loadouts["allies"]["loadoutSuper"] = "none";
        level.infect_loadouts["allies"]["loadoutStreakType"] = "assault";
        if (level.survivorstreakoverride.size > 0) {
            level.infect_loadouts["allies"]["loadoutKillstreak1"] = level.survivorstreakoverride[0];
            level.infect_loadouts["allies"]["loadoutKillstreak2"] = level.survivorstreakoverride[1];
            level.infect_loadouts["allies"]["loadoutKillstreak3"] = level.survivorstreakoverride[2];
            level.infect_loadouts["allies"]["loadoutPerks"] = [0:"specialty_warhead", 1:"specialty_scavenger_plus", 2:"specialty_restock"];
        } else {
            level.infect_loadouts["allies"]["loadoutKillstreak1"] = "none";
            level.infect_loadouts["allies"]["loadoutKillstreak2"] = "none";
            level.infect_loadouts["allies"]["loadoutKillstreak3"] = "none";
            level.infect_loadouts["allies"]["loadoutUsingSpecialist"] = 1;
            level.infect_loadouts["allies"]["loadoutPerks"] = [0:"specialty_hardline"];
            level.infect_loadouts["allies"]["loadoutExtraPerks"] = [0:"specialty_scavenger_plus", 1:"specialty_warhead", 2:"specialty_restock"];
        }
        level.infect_loadouts["allies"]["loadoutGesture"] = "playerData";
        level.infect_loadouts["allies"]["loadoutFieldUpgrade1"] = level.survivorsuper;
        level.infect_loadouts["allies"]["loadoutFieldUpgrade2"] = level.survivorsupertwo;
        if (level.enableping) {
        }
    }
    var_53b5e2fc5c7a4f64 = [];
    if (level.isgroundwarinfected) {
        var_53b5e2fc5c7a4f64[var_53b5e2fc5c7a4f64.size] = "specialty_restock";
    }
    if (isusingdefaultclass("axis", 1)) {
        level.infect_loadouts["axis_initial"] = getmatchrulesspecialclass("axis", 1);
        level.infect_loadouts["axis_initial"]["loadoutStreakType"] = "assault";
        level.infect_loadouts["axis_initial"]["loadoutKillstreak1"] = "none";
        level.infect_loadouts["axis_initial"]["loadoutKillstreak2"] = "none";
        level.infect_loadouts["axis_initial"]["loadoutKillstreak3"] = "none";
    } else if (level.onlineprimaryoverride) {
        level.infect_loadouts["axis_initial"]["loadoutPrimary"] = level.initialprimaryweapon;
        level.infect_loadouts["axis_initial"]["loadoutPrimaryAttachment"] = game["arenaRandomLoadout"][0]["loadoutPrimaryAttachment"];
        level.infect_loadouts["axis_initial"]["loadoutPrimaryAttachment2"] = game["arenaRandomLoadout"][0]["loadoutPrimaryAttachment2"];
        level.infect_loadouts["axis_initial"]["loadoutPrimaryAttachment3"] = game["arenaRandomLoadout"][0]["loadoutPrimaryAttachment3"];
        level.infect_loadouts["axis_initial"]["loadoutPrimaryAttachment4"] = game["arenaRandomLoadout"][0]["loadoutPrimaryAttachment4"];
        level.infect_loadouts["axis_initial"]["loadoutPrimaryAttachment5"] = game["arenaRandomLoadout"][0]["loadoutPrimaryAttachment5"];
        level.infect_loadouts["axis_initial"]["loadoutPrimaryVariantID"] = 0;
        level.infect_loadouts["axis_initial"]["loadoutSecondary"] = level.initialsecondaryweapon;
        level.infect_loadouts["axis_initial"]["loadoutSecondaryAttachment"] = level.attachmentinitialsecondary;
        level.infect_loadouts["axis_initial"]["loadoutSecondaryAttachment2"] = level.attachmentinitialsecondarytwo;
        level.infect_loadouts["axis_initial"]["loadoutSecondaryCamo"] = "none";
        level.infect_loadouts["axis_initial"]["loadoutSecondaryReticle"] = "none";
        level.infect_loadouts["axis_initial"]["loadoutSecondaryVariantID"] = 0;
        level.infect_loadouts["axis_initial"]["loadoutEquipmentPrimary"] = level.infectedlethal;
        level.infect_loadouts["axis_initial"]["loadoutEquipmentSecondary"] = level.infectedtactical;
        level.infect_loadouts["axis_initial"]["loadoutSuper"] = "none";
        level.infect_loadouts["axis_initial"]["loadoutStreakType"] = "assault";
        level.infect_loadouts["axis_initial"]["loadoutKillstreak1"] = "none";
        level.infect_loadouts["axis_initial"]["loadoutKillstreak2"] = "none";
        level.infect_loadouts["axis_initial"]["loadoutKillstreak3"] = "none";
        level.infect_loadouts["axis_initial"]["loadoutPerks"] = var_53b5e2fc5c7a4f64;
        level.infect_loadouts["axis_initial"]["loadoutGesture"] = "playerData";
        level.infect_loadouts["axis_initial"]["loadoutFieldUpgrade1"] = level.infectedsuper;
        level.infect_loadouts["axis_initial"]["loadoutFieldUpgrade2"] = level.infectedsupertwo;
    } else {
        level.infect_loadouts["axis_initial"]["loadoutPrimary"] = level.initialprimaryweapon;
        level.infect_loadouts["axis_initial"]["loadoutPrimaryAttachment"] = level.attachmentinitialprimary;
        level.infect_loadouts["axis_initial"]["loadoutPrimaryAttachment2"] = "none";
        level.infect_loadouts["axis_initial"]["loadoutPrimaryCamo"] = "none";
        level.infect_loadouts["axis_initial"]["loadoutPrimaryReticle"] = "none";
        level.infect_loadouts["axis_initial"]["loadoutPrimaryVariantID"] = 0;
        level.infect_loadouts["axis_initial"]["loadoutSecondary"] = level.initialsecondaryweapon;
        level.infect_loadouts["axis_initial"]["loadoutSecondaryAttachment"] = level.attachmentinitialsecondary;
        level.infect_loadouts["axis_initial"]["loadoutSecondaryAttachment2"] = level.attachmentinitialsecondarytwo;
        level.infect_loadouts["axis_initial"]["loadoutSecondaryCamo"] = "none";
        level.infect_loadouts["axis_initial"]["loadoutSecondaryReticle"] = "none";
        level.infect_loadouts["axis_initial"]["loadoutSecondaryVariantID"] = 0;
        level.infect_loadouts["axis_initial"]["loadoutEquipmentPrimary"] = level.infectedlethal;
        level.infect_loadouts["axis_initial"]["loadoutEquipmentSecondary"] = level.infectedtactical;
        level.infect_loadouts["axis_initial"]["loadoutSuper"] = "none";
        level.infect_loadouts["axis_initial"]["loadoutStreakType"] = "assault";
        level.infect_loadouts["axis_initial"]["loadoutKillstreak1"] = "none";
        level.infect_loadouts["axis_initial"]["loadoutKillstreak2"] = "none";
        level.infect_loadouts["axis_initial"]["loadoutKillstreak3"] = "none";
        level.infect_loadouts["axis_initial"]["loadoutPerks"] = var_53b5e2fc5c7a4f64;
        level.infect_loadouts["axis_initial"]["loadoutGesture"] = "playerData";
        level.infect_loadouts["axis_initial"]["loadoutFieldUpgrade1"] = level.infectedsuper;
        level.infect_loadouts["axis_initial"]["loadoutFieldUpgrade2"] = level.infectedsupertwo;
        if (level.enableinfectedtracker) {
        }
        if (level.enableping) {
        }
    }
    var_2de7fc1792ee7c9b = [];
    if (level.isgroundwarinfected) {
        var_2de7fc1792ee7c9b[var_2de7fc1792ee7c9b.size] = "specialty_restock";
    }
    if (isusingdefaultclass("axis", 0)) {
        level.infect_loadouts["axis"] = getmatchrulesspecialclass("axis", 0);
        level.infect_loadouts["axis"]["loadoutStreakType"] = "assault";
        level.infect_loadouts["axis"]["loadoutKillstreak1"] = "none";
        level.infect_loadouts["axis"]["loadoutKillstreak2"] = "none";
        level.infect_loadouts["axis"]["loadoutKillstreak3"] = "none";
    } else {
        level.infect_loadouts["axis"]["loadoutPrimary"] = level.infectedprimaryweapon;
        level.infect_loadouts["axis"]["loadoutPrimaryAttachment"] = "none";
        level.infect_loadouts["axis"]["loadoutPrimaryAttachment2"] = "none";
        level.infect_loadouts["axis"]["loadoutPrimaryCamo"] = "none";
        level.infect_loadouts["axis"]["loadoutPrimaryReticle"] = "none";
        level.infect_loadouts["axis"]["loadoutPrimaryVariantID"] = 0;
        level.infect_loadouts["axis"]["loadoutSecondary"] = level.infectedsecondaryweapon;
        level.infect_loadouts["axis"]["loadoutSecondaryAttachment"] = "none";
        level.infect_loadouts["axis"]["loadoutSecondaryAttachment2"] = "none";
        level.infect_loadouts["axis"]["loadoutSecondaryCamo"] = "none";
        level.infect_loadouts["axis"]["loadoutSecondaryReticle"] = "none";
        level.infect_loadouts["axis"]["loadoutSecondaryVariantID"] = -1;
        level.infect_loadouts["axis"]["loadoutEquipmentPrimary"] = level.infectedlethal;
        level.infect_loadouts["axis"]["loadoutEquipmentSecondary"] = level.infectedtactical;
        level.infect_loadouts["axis"]["loadoutSuper"] = level.infectedsuper;
        level.infect_loadouts["axis"]["loadoutStreakType"] = "assault";
        level.infect_loadouts["axis"]["loadoutKillstreak1"] = "none";
        level.infect_loadouts["axis"]["loadoutKillstreak2"] = "none";
        level.infect_loadouts["axis"]["loadoutKillstreak3"] = "none";
        level.infect_loadouts["axis"]["loadoutPerks"] = var_2de7fc1792ee7c9b;
        level.infect_loadouts["axis"]["loadoutGesture"] = "playerData";
        level.infect_loadouts["axis"]["loadoutFieldUpgrade1"] = level.infectedsuper;
        level.infect_loadouts["axis"]["loadoutFieldUpgrade2"] = level.infectedsupertwo;
        if (level.enableinfectedtracker) {
        }
        if (level.enableping) {
        }
    }
    level.infect_loadouts["allies"] = function_2c5507acfc56949d(level.infect_loadouts["allies"]);
    level.infect_loadouts["axis"] = function_2c5507acfc56949d(level.infect_loadouts["axis"]);
    level.infect_loadouts["axis_initial"] = function_2c5507acfc56949d(level.infect_loadouts["axis_initial"]);
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x6657
// Size: 0xff
function private function_2c5507acfc56949d(loadout) {
    if (!isdefined(loadout)) {
        return;
    }
    switch (loadout["loadoutFieldUpgrade1"]) {
    case #"hash_16577b244953e989":
        if (loadout["loadoutEquipmentSecondary"] == "equip_tac_insert") {
            loadout["loadoutEquipmentSecondary"] = "none";
        }
        break;
    case #"hash_b17ed5514d85b71b":
        if (loadout["loadoutEquipmentSecondary"] == "equip_trophy") {
            loadout["loadoutEquipmentSecondary"] = "none";
        }
        break;
    default:
        break;
    }
    switch (loadout["loadoutFieldUpgrade2"]) {
    case #"hash_16577b244953e989":
        if (loadout["loadoutEquipmentSecondary"] == "equip_tac_insert") {
            loadout["loadoutEquipmentSecondary"] = "none";
        }
        break;
    case #"hash_b17ed5514d85b71b":
        if (loadout["loadoutEquipmentSecondary"] == "equip_trophy") {
            loadout["loadoutEquipmentSecondary"] = "none";
        }
        break;
    default:
        break;
    }
    return loadout;
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x675e
// Size: 0x96
function addsurvivorattachmentsprimary(weapon) {
    level.attachmentsurvivorprimary = "none";
    group = getweapongroup(weapon);
    if (group == "weapon_shotgun") {
        level.attachmentsurvivorprimary = "barrelrange";
    } else if (group == "weapon_assault" || group == "weapon_battle" || group == "weapon_smg" || group == "weapon_lmg" || group == "weapon_pistol" || weapon == "iw7_m1c") {
        level.attachmentsurvivorprimary = "highcal";
    }
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x67fb
// Size: 0x96
function addinitialattachmentsprimary(weapon) {
    level.attachmentinitialprimary = "none";
    group = getweapongroup(weapon);
    if (group == "weapon_shotgun") {
        level.attachmentinitialprimary = "barrelrange";
    } else if (group == "weapon_assault" || group == "weapon_battle" || group == "weapon_smg" || group == "weapon_lmg" || group == "weapon_pistol" || weapon == "iw7_m1c") {
        level.attachmentinitialprimary = "highcal";
    }
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6898
// Size: 0x81
function addsurvivorattachmentssecondary(weapon) {
    level.attachmentsurvivorsecondary = "none";
    level.attachmentsurvivorsecondarytwo = "none";
    group = getweapongroup(weapon);
    if (group == "weapon_pistol") {
        level.attachmentsurvivorsecondary = "highcal";
    }
    if (matchmakinggame()) {
        if (weapon == "iw7_g18c") {
            level.attachmentsurvivorsecondary = "akimbo";
            level.attachmentsurvivorsecondarytwo = "highcal";
        }
    }
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6920
// Size: 0x81
function addinitialattachmentssecondary(weapon) {
    level.attachmentinitialsecondary = "none";
    level.attachmentinitialsecondarytwo = "none";
    group = getweapongroup(weapon);
    if (group == "weapon_pistol") {
        level.attachmentinitialsecondary = "highcal";
    }
    if (matchmakinggame()) {
        if (weapon == "iw7_g18c") {
            level.attachmentinitialsecondary = "akimbo";
            level.attachmentinitialsecondarytwo = "highcal";
        }
    }
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x69a8
// Size: 0x57
function monitorsurvivaltime() {
    self endon("death_or_disconnect");
    self endon("infected");
    level endon("game_ended");
    while (1) {
        if (!level.infect_chosefirstinfected || !isdefined(self.survivalstarttime) || !isalive(self)) {
            waitframe();
            continue;
        }
        setsurvivaltime(0);
        wait(1);
    }
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6a06
// Size: 0x26
function initsurvivaltime(infected) {
    setextrascore0(0);
    if (isdefined(infected) && infected) {
        self notify("infected");
    }
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6a33
// Size: 0x75
function setsurvivaltime(infected) {
    if (!isdefined(self.survivalstarttime)) {
        self.survivalstarttime = self.spawntime;
    }
    var_26f7788064111742 = int((gettime() - self.survivalstarttime) / 1000);
    if (var_26f7788064111742 > 999) {
        var_26f7788064111742 = 999;
    }
    setextrascore0(var_26f7788064111742);
    if (isdefined(infected) && infected) {
        self notify("infected");
    }
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6aaf
// Size: 0xd2
function shouldplayhalfwayvo() {
    if (!level.didhalfscorevoboost && getteamscore("axis") >= int(level.players.size - level.players.size / 2)) {
        team = "axis";
        namespace_944ddf7b8df1b0e3::leaderdialog("halfway_friendly_score", team, "status");
        var_b0c33d224b825287 = namespace_54d20dd0dd79277f::getenemyteams(team);
        foreach (entry in var_b0c33d224b825287) {
            namespace_944ddf7b8df1b0e3::leaderdialog("halfway_enemy_score", entry, "status");
        }
        level.didhalfscorevoboost = 1;
    }
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6b88
// Size: 0x37
function updatematchstatushintonspawn() {
    level endon("game_ended");
    if (self.team == "allies") {
        namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("infect_survive");
    } else {
        namespace_44abc05161e2e2cb::function_f004ef4606b9efdc("infect_all");
    }
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6bc6
// Size: 0xcd
function nvgwatcher() {
    self endon("death");
    self endon("spawned");
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    timer = 0;
    var_7809db68000aefee = 0;
    while (1) {
        if (self isnightvisionon()) {
            timer = timer + level.framedurationseconds;
            if (timer >= 1 && !var_7809db68000aefee) {
                namespace_44abc05161e2e2cb::showerrormessage("MP_INGAME_ONLY/LOW_BATTERY");
                var_7809db68000aefee = 1;
            }
            if (timer >= 2) {
                self nightvisionviewoff();
                self setclientomnvar("ui_infect_nvg_hud_icon", 1);
                val::set("nvgWatcher", "nvg", 0);
                rechargenvg();
                val::function_c9d0b43701bdba00("nvgWatcher");
                var_7809db68000aefee = 0;
                self setclientomnvar("ui_infect_nvg_hud_icon", 0);
                timer = 0;
            }
        }
        wait(level.framedurationseconds);
    }
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6c9a
// Size: 0x40
function rechargenvg() {
    timer = 0;
    while (timer < 5) {
        timer = timer + level.framedurationseconds;
        if (self isnightvisionon()) {
            self nightvisionviewoff();
        }
        wait(level.framedurationseconds);
    }
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6ce1
// Size: 0x5e
function perkpackage_checkifready_callback() {
    if (self.team == "axis") {
        if (_hasperk("specialty_tacticalinsertion")) {
            removeperk("specialty_tacticalinsertion");
        }
        if (!_hasperk("specialty_tacticalinsertion")) {
            giveperk("specialty_tacticalinsertion");
        }
        namespace_1a507865f681850e::giveequipment(level.infectedtactical, "secondary");
    }
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6d46
// Size: 0xb
function tacinsert_gamemode_callback() {
    thread clearandrestoreinfectedtacinsert();
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x6d58
// Size: 0x74
function private function_911cbbebf68af0d8(spawnposition) {
    if (isdefined(level.var_2054bb1cc6580ce4)) {
        foreach (volume in level.var_2054bb1cc6580ce4) {
            if (ispointinvolume(spawnposition, volume)) {
                return 0;
            }
        }
    }
    return 1;
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x6dd4
// Size: 0x7d
function private function_79f898a92fdba4b2(spawnpointarray) {
    if (isdefined(spawnpointarray) && spawnpointarray.size > 0) {
        foreach (spawnpoint in spawnpointarray) {
            if (!namespace_2e3ff2bec3fe28b7::function_911cbbebf68af0d8(spawnpoint.origin)) {
                spawnpointarray = namespace_3c37cb17ade254d::array_remove(spawnpointarray, spawnpoint);
            }
        }
    }
    return spawnpointarray;
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6e59
// Size: 0x17e
function clearandrestoreinfectedtacinsert() {
    self.setspawnpoint.issuper = 1;
    self.loadoutfieldupgrade1 = "none";
    self.loadoutfieldupgrade2 = "none";
    self.loadoutfieldupgrade1 = level.infectedsuper;
    self.loadoutfieldupgrade2 = level.infectedsupertwo;
    wait(0.1);
    if (!isdefined(self.setspawnpoint) || !level.var_624c83b532efce04) {
        return;
    }
    if (istrue(level.skydiveontacinsertplacement)) {
        if (isdefined(self) && isreallyalive(self)) {
            self notify("giveLoadout_start");
            namespace_85d036cb78063c4a::clearsuper();
            namespace_727d2aa1d6c72038::perkpackage_reset();
            self.perkpackagedata.istwomode = 1;
            namespace_727d2aa1d6c72038::perkpackage_setstate(0);
            self.perkpackagedata.super = "super_select";
            class = "gamemode";
            globalstruct = namespace_d19129e4fa5d176::loadout_getglobalclassstruct();
            globalstruct = namespace_d19129e4fa5d176::loadout_updateglobalclass(globalstruct, class);
            namespace_d19129e4fa5d176::loadout_updatefieldupgrades(globalstruct, class);
            if (namespace_82dcd1d5ae30ff7::_hasperk("specialty_tacticalinsertion")) {
                namespace_82dcd1d5ae30ff7::removeperk("specialty_tacticalinsertion");
            }
            if (!namespace_82dcd1d5ae30ff7::_hasperk("specialty_tacticalinsertion")) {
                namespace_82dcd1d5ae30ff7::giveperk("specialty_tacticalinsertion");
            }
            namespace_1a507865f681850e::giveequipment(level.infectedtactical, "secondary");
            thread namespace_85d036cb78063c4a::givesuperpoints(level.infectbonussuperontacinsert, undefined, 1);
        }
        thread suicideandskydive();
    }
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6fde
// Size: 0x6e
function suicideandskydive() {
    if (isreallyalive(self)) {
        self.skipdeathicon = 1;
        self suicide();
        waitframe();
        if (isdefined(self)) {
            self.deaths = self.deaths - 1;
            self.pers["deaths"] = self.pers["deaths"] - 1;
        }
    }
    wait(1);
    if (isdefined(self)) {
        self.skipdeathicon = undefined;
    }
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7053
// Size: 0x95
function registervehicletype(refname, var_e4015cfe956f4f3f) {
    /#
        assert(isdefined(refname));
    #/
    vehicleinfo = spawnstruct();
    vehicleinfo.refname = refname;
    vehicleinfo.spawncallback = var_e4015cfe956f4f3f;
    vehicleinfo.vehiclespawns = function_b08e7e3a0b14f76f(refname);
    /#
        assert(isdefined(vehicleinfo.vehiclespawns));
    #/
    if (!isdefined(level.vehicleinfo)) {
        level.vehicleinfo = [];
    }
    level.vehicleinfo[refname] = vehicleinfo;
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x70ef
// Size: 0x731
function init_infectgroundwarvehicles() {
    registervehicletype("atv", &vehiclespawn_atv);
    level.vehiclespawnlocs = [];
    foreach (vehicleinfo in level.vehicleinfo) {
        if (vehicleinfo.refname == "atv") {
            if (level.mapname == "mp_farms2_gw" && level.localeid == "locale_9") {
                var_7591ed99e87a77d3 = [];
                var_60ec3549226ce8d = [];
                var_7591ed99e87a77d3[0] = (46022, 1039, 56);
                var_60ec3549226ce8d[0] = (7, 289, 0);
                var_7591ed99e87a77d3[1] = (47881, -1404, 115);
                var_60ec3549226ce8d[1] = (8, 294, 0);
                var_7591ed99e87a77d3[2] = (47970, -22545, -320);
                var_60ec3549226ce8d[2] = (9, 105, 0);
                for (i = 0; i < var_7591ed99e87a77d3.size; i++) {
                    var_81c8d769cecc738e = spawnstruct();
                    var_81c8d769cecc738e.origin = var_7591ed99e87a77d3[i];
                    var_81c8d769cecc738e.angles = var_60ec3549226ce8d[i];
                    var_81c8d769cecc738e.script_noteworthy = "locale_9";
                    var_81c8d769cecc738e.targetname = "atv_spawn";
                    var_81c8d769cecc738e.vehicletype = "veh9_mil_lnd_atv_physics_mp";
                    vehicleinfo.vehiclespawns[vehicleinfo.vehiclespawns.size] = var_81c8d769cecc738e;
                }
                foreach (spawnpoint in vehicleinfo.vehiclespawns) {
                    if (distancesquared(spawnpoint.origin, (53109, -8400, -710)) < 16384) {
                        spawnpoint.origin = (46868, -457, 18);
                        spawnpoint.angles = (11, 252, 0);
                    } else if (distancesquared(spawnpoint.origin, (48215, -1671, 56)) < 16384) {
                        spawnpoint.origin = (47906, -676, 55);
                        spawnpoint.angles = (11, 309, 0);
                    }
                }
            } else if (level.mapname == "mp_downtown_gw" && level.localeid == "locale_6") {
                var_7591ed99e87a77d3 = [];
                var_60ec3549226ce8d = [];
                var_7591ed99e87a77d3[0] = (17806, -20823, -110);
                var_60ec3549226ce8d[0] = (11, 358, 0);
                var_7591ed99e87a77d3[1] = (16109, -24057, -144);
                var_60ec3549226ce8d[1] = (1, 90, 0);
                var_7591ed99e87a77d3[2] = (18227, -704, -448);
                var_60ec3549226ce8d[2] = (7, 266, 0);
                var_7591ed99e87a77d3[3] = (19180, 332, -447);
                var_60ec3549226ce8d[3] = (6, 298, 0);
                for (i = 0; i < var_7591ed99e87a77d3.size; i++) {
                    var_81c8d769cecc738e = spawnstruct();
                    var_81c8d769cecc738e.origin = var_7591ed99e87a77d3[i];
                    var_81c8d769cecc738e.angles = var_60ec3549226ce8d[i];
                    var_81c8d769cecc738e.script_noteworthy = "locale_6";
                    var_81c8d769cecc738e.targetname = "atv_spawn";
                    var_81c8d769cecc738e.vehicletype = "veh9_mil_lnd_atv_physics_mp";
                    vehicleinfo.vehiclespawns[vehicleinfo.vehiclespawns.size] = var_81c8d769cecc738e;
                }
                foreach (spawnpoint in vehicleinfo.vehiclespawns) {
                    if (distancesquared(spawnpoint.origin, (18368, -21157, -107)) < 16384) {
                        spawnpoint.origin = (16572, -19828, 86);
                        spawnpoint.angles = (2, 55, 0);
                    } else if (distancesquared(spawnpoint.origin, (19526, -15475, -97)) < 16384) {
                        spawnpoint.origin = (19177, -15490, -116);
                        spawnpoint.angles = (2, 64, 0);
                    }
                }
            }
        }
        foreach (spawnpoint in vehicleinfo.vehiclespawns) {
            if (isdefined(namespace_36f464722d326bbe::getlocaleid()) && isdefined(spawnpoint.script_noteworthy) && spawnpoint.script_noteworthy == level.localeid) {
                index = level.vehiclespawnlocs.size;
                level.vehiclespawnlocs[index] = spawnpoint;
                level.vehiclespawnlocs[index].refname = vehicleinfo.refname;
            }
        }
    }
    if (0) {
        foreach (loc in level.vehiclespawnlocs) {
            thread drawline(loc.origin, loc.origin + (0, 0, 1500), 1000, (1, 0, 0));
        }
    }
    level.vehiclespawnlocs = array_randomize(level.vehiclespawnlocs);
    var_fc617751f654a141 = level.numnonrallyvehicles;
    if (!isdefined(level.numnonrallyvehicles)) {
        var_fc617751f654a141 = 25;
    }
    if (0) {
        for (i = 0; i < var_fc617751f654a141; i++) {
            loc = level.vehiclespawnlocs[i];
            thread drawline(loc.origin + (0, 0, 1500), loc.origin + (0, 0, 2500), 1000, (0, 1, 0));
        }
    }
    for (i = 0; i < var_fc617751f654a141; i++) {
        loc = level.vehiclespawnlocs[i];
        if (isdefined(loc)) {
            vehicleinfo = level.vehicleinfo[loc.refname];
            [[ vehicleinfo.spawncallback ]](loc);
        }
    }
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7827
// Size: 0x59
function vehiclespawn_atv(loc, var_ee8da5624236dc89) {
    if (!isdefined(loc.angles)) {
        loc.angles = (0, randomfloat(360), 0);
    }
    spawndata = vehiclespawn_getspawndata(loc);
    return namespace_1f188a13f7e79610::vehicle_spawn("atv", spawndata, var_ee8da5624236dc89);
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7888
// Size: 0x6a
function vehiclespawn_getspawndata(loc) {
    spawndata = spawnstruct();
    spawndata.origin = loc.origin;
    spawndata.angles = loc.angles;
    spawndata.spawntype = "GAME_MODE";
    spawndata.showheadicon = 1;
    return spawndata;
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x78fa
// Size: 0x33
function infectjugg_setconfig() {
    health = getdvarint(@"hash_be3134dff20f353a", 2000);
    self.maxhealth = health;
    self.startinghealth = health;
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x7934
// Size: 0x7c
function gamemodespawnprotectedcallback(eattacker, victim, idamage, objweapon, smeansofdeath) {
    var_1f6fa3102bc4a682 = 0;
    if (eattacker.team == "axis" && iskillstreakweapon(objweapon.basename) && !weaponbypassspawnprotection(objweapon) && smeansofdeath != "MOD_MELEE") {
        var_1f6fa3102bc4a682 = 1;
    }
    return var_1f6fa3102bc4a682;
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x79b8
// Size: 0x95
function setfaketispawnpoint() {
    spawnpoint = getspawnpoint();
    setspawnpoint = spawn("script_model", spawnpoint.origin);
    setspawnpoint.playerspawnpos = spawnpoint.origin;
    setspawnpoint.playerspawnangles = spawnpoint.angles;
    setspawnpoint.notti = 0;
    setspawnpoint.issuper = 1;
    setspawnpoint.skipscriptable = 1;
    self.setspawnpoint = setspawnpoint;
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7a54
// Size: 0x16
function vehicle_compass_infect_shouldbevisibletoplayer(vehicle, player) {
    return 1;
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7a72
// Size: 0x9e
function skydivehintnotify() {
    self endon("disconnect");
    self notify("skydive_spawn_tutorial");
    self endon("skydive_spawn_tutorial");
    var_e9def77708d779b7 = 0;
    firstspawn = 1;
    while (1) {
        if (firstspawn) {
            self waittill("giveLoadout");
        } else {
            self waittill("spawned");
        }
        if (self.pers["team"] == "allies") {
            continue;
        }
        if (var_e9def77708d779b7 < 2) {
            if (!var_e9def77708d779b7) {
                wait(5);
            }
            namespace_58fb4f2e73fd41a0::setlowermessageomnvar("infect_super_tac_hint");
            wait(5);
            namespace_58fb4f2e73fd41a0::setlowermessageomnvar("clear_lower_msg");
            var_e9def77708d779b7++;
        } else {
            break;
        }
    }
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7b17
// Size: 0x1e
function function_48c5a587383a90e7() {
    var_6f2ab6d7f309b05d = getdvarint(@"hash_71ea7a20ebc4487e", 0);
    return var_6f2ab6d7f309b05d;
}

// Namespace infect/namespace_2e3ff2bec3fe28b7
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7b3d
// Size: 0x84
function function_9f1649ee39d3bd26(timer, dist) {
    self endon("death_or_disconnect");
    self endon("eliminated");
    level endon("game_ended");
    while (1) {
        var_51adfd290b39a1b0 = physics_spherecast(self.origin, self.origin, dist, physics_createcontents([0:"physicscontents_characterproxy"]), self, "physicsquery_any");
        if (var_51adfd290b39a1b0 == 1) {
            self playlocalsound("jup_infected_player_death_pulse");
            wait(timer);
        } else {
            wait(1);
        }
    }
}

