// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\spawnfactor.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\utility\dialog.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\utility\print.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\utility\debug.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using scripts\mp\globallogic.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\cp_mp\parachute.gsc;
#using scripts\mp\gametypes\arm.gsc;
#using script_27c2db69a21775a0;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\spawnscoring.gsc;
#using scripts\mp\gametypes\dom.gsc;
#using scripts\mp\gametypes\obj_dom.gsc;
#using scripts\mp\spectating.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\music_and_dialog.gsc;
#using scripts\mp\rank.gsc;
#using scripts\mp\persistence.gsc;
#using scripts\mp\battlechatter_mp.gsc;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\hud_message.gsc;
#using script_4a6760982b403bad;

#namespace siege;

// Namespace siege/namespace_9fd94298885b8281
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xafb
// Size: 0x6cf
function main() {
    if (getdvar(@"hash_687fb8f9b7a23245") == "mp_background") {
        return;
    }
    level.isgroundwarsiege = 0;
    matchmakingmatch = getdvarint(@"hash_962400405f9f3c0b") && !getdvarint(@"hash_485ef1ed1d39d3a3");
    if (matchmakingmatch) {
        level.isgroundwarsiege = getdvarint(@"hash_f2d9a572db1504f1", 0);
    }
    /#
        level.isgroundwarsiege = getdvarint(@"hash_f2d9a572db1504f1", 0);
    #/
    level.allowmodestructs = [];
    if (level.isgroundwarsiege) {
        level.allowmodestructs[level.allowmodestructs.size] = "arm";
    }
    namespace_77cb23aada5edffd::init();
    namespace_77cb23aada5edffd::setupcallbacks();
    allowed[0] = getgametype();
    allowed[1] = "dom";
    if (istrue(level.isgroundwarsiege)) {
        allowed[allowed.size] = "arm";
    }
    namespace_19b4203b51d56488::main(allowed);
    if (isusingmatchrulesdata()) {
        level.initializematchrules = &initializematchrules;
        [[ level.initializematchrules ]]();
        level thread reinitializematchrulesonmigration();
    } else {
        registerroundswitchdvar(getgametype(), 3, 0, 12);
        registertimelimitdvar(getgametype(), 300);
        registerscorelimitdvar(getgametype(), 1);
        registerroundlimitdvar(getgametype(), 0);
        registerwinlimitdvar(getgametype(), 4);
        registernumlivesdvar(getgametype(), 1);
        registerhalftimedvar(getgametype(), 0);
        registerwinbytwoenableddvar(getgametype(), 1);
        registerwinbytwomaxroundsdvar(getgametype(), 4);
    }
    updategametypedvars();
    level.objectivebased = 1;
    level.teambased = 1;
    level.nobuddyspawns = 1;
    level.gamehasstarted = 0;
    level.onstartgametype = &onstartgametype;
    level.onplayerconnect = &onplayerconnect;
    level.onplayerdisconnect = &onplayerdisconnect;
    level.onplayerjointeam = &onplayerjointeam;
    level.getspawnpoint = &getspawnpoint;
    level.modeonspawnplayer = &onspawnplayer;
    level.onplayerkilled = &onplayerkilled;
    level.ondeadevent = &ondeadevent;
    level.ononeleftevent = &ononeleftevent;
    level.ontimelimit = &ontimelimit;
    level.lastcaptime = gettime();
    level.alliesprevflagcount = 0;
    level.axisprevflagcount = 0;
    level.allowlatecomers = 0;
    level.gametimerbeeps = 0;
    level.rushtimerteam = "none";
    level.siegeflagcapturing = [];
    if (level.isgroundwarsiege) {
        level.requiredplayercountoveride = 1;
        level.requiredplayercount["allies"] = 12;
        level.requiredplayercount["axis"] = 12;
        level.modecontrolledvehiclespawningonly = 1;
        level.maxhqtanks = 0;
        level.numnonrallyvehicles = getdvarint(@"hash_6695d60ef1e8627d", 25);
        level.skipplaybodycountsound = 1;
        level.disablespawncamera = 1;
        mapname = namespace_36f464722d326bbe::getmapname();
        switch (mapname) {
        case #"hash_12f3765ef24b4037":
        case #"hash_1bc93b88575e82eb":
        case #"hash_32eaa112f8caa7e4":
        case #"hash_3a8b050ff58578ad":
        case #"hash_50de71be6e7469ff":
        case #"hash_7a28db3c5928c489":
        case #"hash_863773b8960b3944":
        case #"hash_924a3fbe9fbe15c6":
        case #"hash_e4ca6b73b5022b26":
            namespace_5078ee98abb32db9::initparachutedvars();
            break;
        default:
            break;
        }
        if (!isdefined(namespace_36f464722d326bbe::getlocaleid())) {
            switch (mapname) {
            case #"hash_32eaa112f8caa7e4":
                setdvar(@"hash_6beec004cdf37c0", 6);
                break;
            case #"hash_7a28db3c5928c489":
                setdvar(@"hash_6beec004cdf37c0", 5);
                break;
            case #"hash_50de71be6e7469ff":
            case #"hash_863773b8960b3944":
                setdvar(@"hash_6beec004cdf37c0", 9);
                break;
            case #"hash_12f3765ef24b4037":
                setdvar(@"hash_6beec004cdf37c0", 3);
                break;
            case #"hash_924a3fbe9fbe15c6":
                setdvar(@"hash_6beec004cdf37c0", 4);
                break;
            case #"hash_a8b272dba33a4aed":
                setdvar(@"hash_6beec004cdf37c0", 17);
                break;
            case #"hash_1bc93b88575e82eb":
                setdvar(@"hash_6beec004cdf37c0", 18);
                break;
            case #"hash_e4ca6b73b5022b26":
                setdvar(@"hash_6beec004cdf37c0", 10);
                break;
            case #"hash_3a8b050ff58578ad":
                setdvar(@"hash_6beec004cdf37c0", 19);
                break;
            default:
                setdvar(@"hash_6beec004cdf37c0", 0);
                break;
            }
        }
    }
    game["canScoreOnTie"] = 1;
    if (namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
        game["dialog"]["gametype"] = "iw9_mpsg_mode_uktl_snt1";
    } else {
        game["dialog"]["gametype"] = "gametype_siege";
    }
    game["dialog"]["boost"] = "boost_siege";
    game["dialog"]["offense_obj"] = "boost_siege";
    game["dialog"]["defense_obj"] = "boost_siege";
    game["dialog"]["securing_a"] = "securing_a";
    game["dialog"]["securing_b"] = "securing_b";
    game["dialog"]["securing_c"] = "securing_c";
    game["dialog"]["secured_a"] = "secure_a";
    game["dialog"]["secured_b"] = "secure_b";
    game["dialog"]["secured_c"] = "secure_c";
    game["dialog"]["losing_a"] = "losing_a";
    game["dialog"]["losing_b"] = "losing_b";
    game["dialog"]["losing_c"] = "losing_c";
    game["dialog"]["lost_a"] = "lost_a";
    game["dialog"]["lost_b"] = "lost_b";
    game["dialog"]["lost_c"] = "lost_c";
    game["dialog"]["enemy_captured_2"] = "siege_enemy_captured_2";
    game["dialog"]["friendly_captured_2"] = "siege_friendly_captured_2";
    game["dialog"]["lastalive_zones"] = "lastalive_zones";
}

// Namespace siege/namespace_9fd94298885b8281
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11d1
// Size: 0xf9
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
    setdynamicdvar(@"hash_41bd47d6d0def56", getmatchrulesdata("siegeData", "rushTimer"));
    setdynamicdvar(@"hash_24a372f8e55b2fea", getmatchrulesdata("siegeData", "rushTimerAmount"));
    setdynamicdvar(@"hash_9e119c9c57105ac5", getmatchrulesdata("siegeData", "sharedRushTimer"));
    setdynamicdvar(@"hash_132b182e76e85c9b", getmatchrulesdata("siegeData", "preCapPoints"));
    setdynamicdvar(@"hash_18590465135e9503", getmatchrulesdata("siegeData", "capRate"));
    setdynamicdvar(@"hash_462e8dc6c1e380cc", getmatchrulesdata("siegeData", "objScalar"));
    setdynamicdvar(@"hash_e2d968dab42f65ee", getmatchrulesdata("siegeData", "holdAllTimer"));
    setdynamicdvar(@"hash_22f872fa5a214897", 0);
    registerhalftimedvar("siege", 0);
}

// Namespace siege/namespace_9fd94298885b8281
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12d1
// Size: 0x65
function seticonnames() {
    level.iconneutral = "waypoint_captureneutral";
    level.iconcapture = "waypoint_capture";
    level.icondefend = "waypoint_defend";
    level.icondefending = "waypoint_defending";
    level.iconcontested = "waypoint_contested";
    level.icontaking = "waypoint_taking";
    level.iconlosing = "waypoint_losing";
}

// Namespace siege/namespace_9fd94298885b8281
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x133d
// Size: 0x1e6
function onstartgametype() {
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
    thread waittooverridegraceperiod();
    if (level.isgroundwarsiege) {
        thread adjustroundendtimer();
        namespace_b46034845796aac0::initspawns(isdefined(game["roundsPlayed"]) && game["roundsPlayed"] != 0);
        level thread namespace_b46034845796aac0::setupwaypointicons();
        namespace_b46034845796aac0::debug_setupmatchdata();
        namespace_b46034845796aac0::setuphqs();
        namespace_b46034845796aac0::calculatehqmidpoint();
        level.numsiegeflags = getdvarint(@"hash_9eee1e1f8390ac94", 3);
        setomnvar("ui_num_dom_flags", level.numsiegeflags);
        namespace_b46034845796aac0::setupobjectives();
        level thread runobjectives();
        thread namespace_35f66e61f847336c::init_groundwarvehicles();
        thread initvehicles();
        namespace_b46034845796aac0::emergency_cleanupents();
    } else {
        initspawns();
        thread domflags();
    }
    thread watchflagtimerpause();
    thread watchgamestart();
    if (matchmakinggame()) {
        thread watchgameinactive();
    }
    /#
        thread function_7fd73dbe340f511d();
        thread removedompoint();
        thread placedompoint();
    #/
}

// Namespace siege/namespace_9fd94298885b8281
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x152a
// Size: 0x6a
function vehiclespawn_getspawndata(loc) {
    spawndata = spawnstruct();
    spawndata.origin = loc.origin;
    spawndata.angles = loc.angles;
    spawndata.spawntype = "GAME_MODE";
    spawndata.showheadicon = 1;
    return spawndata;
}

// Namespace siege/namespace_9fd94298885b8281
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x159c
// Size: 0x7e
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
    level.vehicleinfo[refname] = vehicleinfo;
}

// Namespace siege/namespace_9fd94298885b8281
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1621
// Size: 0x363
function initvehicles() {
    level.numhqtanks_axis = 0;
    level.numhqtanks_allies = 0;
    if (!isdefined(level.vehicleinfo)) {
        level.vehicleinfo = [];
    }
    registervehicletype("little_bird", &vehiclespawn_littlebird);
    registervehicletype("atv", &vehiclespawn_atv);
    registervehicletype("tac_rover", &vehiclespawn_tacrover);
    level.vehiclespawnlocs = [];
    foreach (vehicleinfo in level.vehicleinfo) {
        switch (vehicleinfo.refname) {
        case #"hash_9d4e22a00fc630b5":
            vehicleinfo.vehiclespawns = getvehiclespawns("little_bird", "veh9_mil_air_heli_medium_physics_mp");
            break;
        case #"hash_c93466c10cc10ba":
            vehicleinfo.vehiclespawns = getvehiclespawns("atv", "veh9_mil_lnd_atv_physics_mp");
            break;
        case #"hash_21e1eaa9138f512c":
            vehicleinfo.vehiclespawns = getvehiclespawns("tac_rover", "tromeo_physics_mp");
            break;
        }
        foreach (spawnpoint in vehicleinfo.vehiclespawns) {
            index = level.vehiclespawnlocs.size;
            level.vehiclespawnlocs[index] = spawnpoint;
            level.vehiclespawnlocs[index].refname = vehicleinfo.refname;
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

// Namespace siege/namespace_9fd94298885b8281
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x198b
// Size: 0x149c
function getvehiclespawns(vehicleRef, vehicletype) {
    spawns = [];
    mapname = namespace_36f464722d326bbe::getmapname();
    atvoriginsarray = [];
    atvanglesarray = [];
    var_380b98510b5d0765 = [];
    var_fb7e5f19efd9d046 = [];
    switch (mapname) {
    case #"hash_32eaa112f8caa7e4":
        if (vehicleRef == "atv") {
            atvoriginsarray[atvoriginsarray.size] = (21843.8, -4640.11, -476.961);
            atvoriginsarray[atvoriginsarray.size] = (20375.9, -3612.78, -454);
            atvoriginsarray[atvoriginsarray.size] = (20728.8, -3309.36, -456);
            atvanglesarray[atvanglesarray.size] = (0, 255, 0);
            atvanglesarray[atvanglesarray.size] = (0, 330, 0);
            atvanglesarray[atvanglesarray.size] = (0, 292, 0);
            atvoriginsarray[atvoriginsarray.size] = (20937.2, -9029.28, -379.674);
            atvoriginsarray[atvoriginsarray.size] = (23097.1, -9966.89, -344);
            atvanglesarray[atvanglesarray.size] = (356.825, 240, 0);
            atvanglesarray[atvanglesarray.size] = (0, 0, 0);
            atvoriginsarray[atvoriginsarray.size] = (17471, -23211.4, -204);
            atvoriginsarray[atvoriginsarray.size] = (15960.1, -22768.1, -204);
            atvoriginsarray[atvoriginsarray.size] = (15821.3, -23568, -208.461);
            atvanglesarray[atvanglesarray.size] = (0, 90, 0);
            atvanglesarray[atvanglesarray.size] = (0, 45, 0);
            atvanglesarray[atvanglesarray.size] = (0, 90, 0);
            atvoriginsarray[atvoriginsarray.size] = (22994.3, -15304.5, -216);
            atvanglesarray[atvanglesarray.size] = (0, 105, 0);
        } else if (vehicleRef == "tac_rover") {
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (20120.2, -3287.71, -456);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (21339.9, -4787.55, -450.176);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (0, 345, 0);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (357.831, 255.032, -1.25312);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (17449, -22190.1, -208.116);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (16651.1, -22178.2, -207.908);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (0, 60, 0);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (0, 60, 0);
        }
        break;
    case #"hash_7a28db3c5928c489":
        if (vehicleRef == "atv") {
            atvoriginsarray[atvoriginsarray.size] = (26335.7, 30412.6, 655.471);
            atvoriginsarray[atvoriginsarray.size] = (27099.5, 30567.5, 639.236);
            atvoriginsarray[atvoriginsarray.size] = (27315.5, 30525.5, 639.236);
            atvanglesarray[atvanglesarray.size] = (0.0728273, 119, 0.843973);
            atvanglesarray[atvanglesarray.size] = (2.67817, 77.0718, 1.59551);
            atvanglesarray[atvanglesarray.size] = (2.67817, 77.0718, 1.59551);
            atvoriginsarray[atvoriginsarray.size] = (29610.4, 38228.5, 698.883);
            atvoriginsarray[atvoriginsarray.size] = (29465.5, 38973.6, 701);
            atvanglesarray[atvanglesarray.size] = (0, 315, 0);
            atvanglesarray[atvanglesarray.size] = (0, 88.9989, 0);
            atvoriginsarray[atvoriginsarray.size] = (39153, 46431.8, 932.749);
            atvoriginsarray[atvoriginsarray.size] = (38876.4, 46106.9, 925.771);
            atvoriginsarray[atvoriginsarray.size] = (37923.7, 47136.4, 949.247);
            atvanglesarray[atvanglesarray.size] = (1.88064, 180.047, 0.333796);
            atvanglesarray[atvanglesarray.size] = (1.47639, 180.039, 1.17305);
            atvanglesarray[atvanglesarray.size] = (359.077, 185.712, 7.76991);
            atvoriginsarray[atvoriginsarray.size] = (33628.2, 40971.6, 653.047);
            atvoriginsarray[atvoriginsarray.size] = (32104.4, 41719.8, 708.773);
            atvanglesarray[atvanglesarray.size] = (349.991, 186.286, -2.23687);
            atvanglesarray[atvanglesarray.size] = (3.95499, 211.371, 4.41818);
        } else if (vehicleRef == "tac_rover") {
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (26310.8, 30168.4, 659.426);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (26954, 29794.1, 651.013);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (358.195, 118.006, -2.71651);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (0, 89.9998, 0);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (38573.2, 47052.8, 950.28);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (39660.3, 45949.9, 952.362);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (359.669, 194.507, -0.439539);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (11.7511, 162.518, 0.102679);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (33138.2, 41498.6, 707.349);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (357.81, 284.768, 1.14713);
        }
        break;
    case #"hash_50de71be6e7469ff":
    case #"hash_863773b8960b3944":
        if (vehicleRef == "atv") {
            atvoriginsarray[atvoriginsarray.size] = (49063.3, -22654.9, -385.662);
            atvoriginsarray[atvoriginsarray.size] = (47332.9, -23070.6, -374.497);
            atvoriginsarray[atvoriginsarray.size] = (48281.3, -22202.5, -371.375);
            atvanglesarray[atvanglesarray.size] = (0.0275984, 103.998, 0.280605);
            atvanglesarray[atvanglesarray.size] = (357.226, 88.8435, 4.3294);
            atvanglesarray[atvanglesarray.size] = (3.93534, 89.3527, 4.34541);
            atvoriginsarray[atvoriginsarray.size] = (49720, -18492, -387.562);
            atvoriginsarray[atvoriginsarray.size] = (48107.4, -18052.3, -312.859);
            atvanglesarray[atvanglesarray.size] = (0, 73.9972, 0);
            atvanglesarray[atvanglesarray.size] = (352.657, 118.56, -10.3306);
            atvoriginsarray[atvoriginsarray.size] = (46431.3, -92.3425, -52.4549);
            atvoriginsarray[atvoriginsarray.size] = (47471, -192.634, -43.7394);
            atvoriginsarray[atvoriginsarray.size] = (48085.6, -358.42, 9.73944);
            atvanglesarray[atvanglesarray.size] = (359.802, 240.821, -3.32839);
            atvanglesarray[atvanglesarray.size] = (0.975088, 240.828, 0.322594);
            atvanglesarray[atvanglesarray.size] = (6.15886, 241.028, 2.20885);
            atvoriginsarray[atvoriginsarray.size] = (44528.7, -5376.79, 283.824);
            atvoriginsarray[atvoriginsarray.size] = (43628, -5846.41, 346.636);
            atvanglesarray[atvanglesarray.size] = (357.74, 256.16, -1.56165);
            atvanglesarray[atvanglesarray.size] = (0.506229, 241.181, 0.438595);
        } else if (vehicleRef == "tac_rover") {
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (47872.6, -22645.4, -385.49);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (48501.7, -22505, -382.243);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (1.68464, 109.9, -3.26246);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (359.897, 89.9842, 8.71393);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (46034.5, -59.925, -29.8834);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (47108.8, -498.535, -35.0573);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (2.33612, 243.444, -0.141863);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (355.135, 243.112, 2.65064);
        }
        break;
    case #"hash_12f3765ef24b4037":
        if (vehicleRef == "atv") {
            atvoriginsarray[atvoriginsarray.size] = (31381.3, -35260.4, -566.754);
            atvoriginsarray[atvoriginsarray.size] = (31087.5, -35307.9, -566.206);
            atvanglesarray[atvanglesarray.size] = (0, 106, 0);
            atvanglesarray[atvanglesarray.size] = (0, 91, 0);
            atvoriginsarray[atvoriginsarray.size] = (37273.8, -22647.6, -566);
            atvoriginsarray[atvoriginsarray.size] = (38224.6, -23864.4, -566);
            atvanglesarray[atvanglesarray.size] = (0, 225, 0);
            atvanglesarray[atvanglesarray.size] = (0, 225, 0);
            atvoriginsarray[atvoriginsarray.size] = (37183.4, -15816, -558.929);
            atvoriginsarray[atvoriginsarray.size] = (36704.9, -15941.1, -558);
            atvoriginsarray[atvoriginsarray.size] = (37630.9, -15950.5, -564);
            atvanglesarray[atvanglesarray.size] = (0, 270, 0);
            atvanglesarray[atvanglesarray.size] = (0, 270, 0);
            atvanglesarray[atvanglesarray.size] = (0, 270, 0);
            atvoriginsarray[atvoriginsarray.size] = (34323.3, -25831.8, -566);
            atvanglesarray[atvanglesarray.size] = (0, 45, 0);
        } else if (vehicleRef == "tac_rover") {
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (31412.5, -34658.3, -564.862);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (31042.3, -16171.6, -565.383);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (0, 105, 0);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (0, 75, 0);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (36937.6, -15836.1, -559.8);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (37369.7, -16171.6, -562);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (0, 270, 0);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (0, 270, 0);
        }
        break;
    case #"hash_924a3fbe9fbe15c6":
        if (vehicleRef == "atv") {
            atvoriginsarray[atvoriginsarray.size] = (-28937.7, -17197.8, -246.637);
            atvoriginsarray[atvoriginsarray.size] = (-29175.8, -17121.9, -247.909);
            atvoriginsarray[atvoriginsarray.size] = (-28096.5, -16918.8, -246.085);
            atvanglesarray[atvanglesarray.size] = (1.203, 90, 0.12);
            atvanglesarray[atvanglesarray.size] = (0.597, 90, 0.15);
            atvanglesarray[atvanglesarray.size] = (358.68, 90.0277, -0.8);
            atvoriginsarray[atvoriginsarray.size] = (-25926, -12688.6, -89.5073);
            atvoriginsarray[atvoriginsarray.size] = (-24872.9, -12661.3, -65.0808);
            atvanglesarray[atvanglesarray.size] = (5.13576, 104.619, 0.240957);
            atvanglesarray[atvanglesarray.size] = (358.169, 15, -3.49767);
            atvoriginsarray[atvoriginsarray.size] = (-28315.5, -3152.67, -311.293);
            atvoriginsarray[atvoriginsarray.size] = (-28107.5, -3152.67, -311.293);
            atvoriginsarray[atvoriginsarray.size] = (-27778.8, -3591.73, -310.621);
            atvanglesarray[atvanglesarray.size] = (0.061, 270, 7.355);
            atvanglesarray[atvanglesarray.size] = (0.061, 270, 7.355);
            atvanglesarray[atvanglesarray.size] = (0, 270, 0);
            atvoriginsarray[atvoriginsarray.size] = (-25666, -8411.14, -47.9997);
            atvoriginsarray[atvoriginsarray.size] = (-26998.2, -9004.54, -40);
            atvanglesarray[atvanglesarray.size] = (358.715, 15.233, -10.279);
            atvanglesarray[atvanglesarray.size] = (0, 285, 0);
        } else if (vehicleRef == "tac_rover") {
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (-28683.3, -16741.2, -249.16);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (-29128.7, -16577.6, -229.266);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (359.734, 90.0021, -0.454);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (353.195, 90.3463, -3.01942);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (-27985.4, -3613.97, -315.978);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (-28449.8, -3645.92, -312.247);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (0, 270.003, 5.684);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (0, 270.004, -3.208);
        }
        break;
    case #"hash_a8b272dba33a4aed":
        break;
    case #"hash_1bc93b88575e82eb":
        if (vehicleRef == "atv") {
            atvoriginsarray[atvoriginsarray.size] = (-9606.95, -21527.2, -279.043);
            atvoriginsarray[atvoriginsarray.size] = (-10288.2, -20891.9, -356.989);
            atvoriginsarray[atvoriginsarray.size] = (-11011.4, -19877, -368.358);
            atvanglesarray[atvanglesarray.size] = (0, 200, 0);
            atvanglesarray[atvanglesarray.size] = (0, 222, 0);
            atvanglesarray[atvanglesarray.size] = (359.526, 210.007, -0.952);
            atvoriginsarray[atvoriginsarray.size] = (-13835.9, -23127.9, -278.639);
            atvoriginsarray[atvoriginsarray.size] = (-14327.9, -22160.8, -266.586);
            atvanglesarray[atvanglesarray.size] = (2.373, 210, 0);
            atvanglesarray[atvanglesarray.size] = (0.806, 194.929, 2.603);
            atvoriginsarray[atvoriginsarray.size] = (-21725.2, -26511, -152);
            atvoriginsarray[atvoriginsarray.size] = (-21577.7, -26755.1, -151.997);
            atvoriginsarray[atvoriginsarray.size] = (-21065.3, -27199.1, -148.746);
            atvanglesarray[atvanglesarray.size] = (0, 30, 0);
            atvanglesarray[atvanglesarray.size] = (0, 60, 0);
            atvanglesarray[atvanglesarray.size] = (5.079, 0.128, 1.453);
            atvoriginsarray[atvoriginsarray.size] = (-18873.3, -25796.5, -199.784);
            atvanglesarray[atvanglesarray.size] = (0, 30, 0);
        } else if (vehicleRef == "tac_rover") {
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (-10912.6, -20079.6, -367);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (-10108.5, -21861.4, -287.271);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (0, 196.996, 0);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (7.93172, 180.719, 4.15911);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (-22036.5, -25881.6, -147.198);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (-21144.5, -27447.1, -151.145);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (0, 345, 0);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (0, 30, 0);
        }
        break;
    case #"hash_e4ca6b73b5022b26":
        if (vehicleRef == "atv") {
            atvoriginsarray[atvoriginsarray.size] = (-3749, 16980, -262);
            atvoriginsarray[atvoriginsarray.size] = (-2971.9, 18898, -262);
            atvoriginsarray[atvoriginsarray.size] = (-2735.8, 16203, -262);
            atvanglesarray[atvanglesarray.size] = (0, 218, 0);
            atvanglesarray[atvanglesarray.size] = (0, 174, 0);
            atvanglesarray[atvanglesarray.size] = (0, 208, 0);
            atvoriginsarray[atvoriginsarray.size] = (-11894, 16161, -266);
            atvoriginsarray[atvoriginsarray.size] = (-11841, 15884, -266);
            atvanglesarray[atvanglesarray.size] = (0, 162, 0);
            atvanglesarray[atvanglesarray.size] = (0, 248, 0);
            atvoriginsarray[atvoriginsarray.size] = (-29137, 12868, -244);
            atvoriginsarray[atvoriginsarray.size] = (-29539, 12883, -252);
            atvoriginsarray[atvoriginsarray.size] = (-29040, 13706, -497);
            atvanglesarray[atvanglesarray.size] = (0, 0, 0);
            atvanglesarray[atvanglesarray.size] = (0, 0, 0);
            atvanglesarray[atvanglesarray.size] = (0, 5, 0);
            atvoriginsarray[atvoriginsarray.size] = (-19181, 16384, -263);
            atvoriginsarray[atvoriginsarray.size] = (-19650, 17253, 54);
            atvoriginsarray[atvoriginsarray.size] = (-19937, 16123, -261);
            atvanglesarray[atvanglesarray.size] = (0, 310, 0);
            atvanglesarray[atvanglesarray.size] = (0, 357, 0);
            atvanglesarray[atvanglesarray.size] = (0, 35, 0);
        } else if (vehicleRef == "tac_rover") {
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (-3520, 17805, -262);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (-3892, 18566, -262);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (0, 165, 0);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (0, 194, 0);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (-29131, 13010, -244);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (-28676, 13724, -518);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (0, 0, 0);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (0, 355, 0);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (-19622, 17422, 54);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (0, 357, 0);
        }
        break;
    case #"hash_3a8b050ff58578ad":
        if (vehicleRef == "atv") {
            atvoriginsarray[atvoriginsarray.size] = (4103, 26076, 57);
            atvoriginsarray[atvoriginsarray.size] = (4247, 25021, -38);
            atvoriginsarray[atvoriginsarray.size] = (3517, 25981, 47);
            atvanglesarray[atvanglesarray.size] = (0, 143, 0);
            atvanglesarray[atvanglesarray.size] = (0, 189, 0);
            atvanglesarray[atvanglesarray.size] = (0, 103, 0);
            atvoriginsarray[atvoriginsarray.size] = (4989, 29842, 253);
            atvoriginsarray[atvoriginsarray.size] = (1725, 28703, 51);
            atvanglesarray[atvanglesarray.size] = (0, 162, 0);
            atvanglesarray[atvanglesarray.size] = (0, 141, 0);
            atvoriginsarray[atvoriginsarray.size] = (-6826, 33623, -46);
            atvoriginsarray[atvoriginsarray.size] = (-7642, 32168, -188);
            atvoriginsarray[atvoriginsarray.size] = (-6589, 32564, -82);
            atvanglesarray[atvanglesarray.size] = (3, 337, 0);
            atvanglesarray[atvanglesarray.size] = (0, 357, 0);
            atvanglesarray[atvanglesarray.size] = (0, 320, 0);
            atvoriginsarray[atvoriginsarray.size] = (-3326, 32657, 238);
            atvoriginsarray[atvoriginsarray.size] = (-2149, 33264, 253);
            atvanglesarray[atvanglesarray.size] = (0, 325, 0);
            atvanglesarray[atvanglesarray.size] = (0, 287, 0);
        } else if (vehicleRef == "tac_rover") {
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (4157, 26465, 65);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (4628, 26545, 63);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (0, 143, 0);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (0, 63, 0);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (-7337, 32683, -77);
            var_380b98510b5d0765[var_380b98510b5d0765.size] = (-6671, 32948, -67);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (0, 320, 0);
            var_fb7e5f19efd9d046[var_fb7e5f19efd9d046.size] = (0, 36, 0);
        }
        break;
    default:
        break;
    }
    level.atvoriginsarray = atvoriginsarray;
    level.atvanglesarray = atvanglesarray;
    if (vehicleRef == "atv") {
        for (i = 0; i < atvoriginsarray.size; i++) {
            if (i <= atvoriginsarray.size - 1) {
                var_76239e3cb66a8278 = atvoriginsarray[i];
                var_79bdb2f0b2f0c692 = atvanglesarray[i];
                vehicle = spawnstruct();
                vehicle.origin = var_76239e3cb66a8278;
                vehicle.angles = var_79bdb2f0b2f0c692;
                vehicle.targetname = vehicleRef;
                vehicle.vehicletype = vehicletype;
                spawns[spawns.size] = vehicle;
            }
        }
    } else if (vehicleRef == "tac_rover") {
        for (i = 0; i < var_380b98510b5d0765.size; i++) {
            if (i <= var_380b98510b5d0765.size - 1) {
                var_d82a9436eee389cb = var_380b98510b5d0765[i];
                var_17085fd4c01a3645 = var_fb7e5f19efd9d046[i];
                vehicle = spawnstruct();
                vehicle.origin = var_d82a9436eee389cb;
                vehicle.angles = var_17085fd4c01a3645;
                vehicle.targetname = vehicleRef;
                vehicle.vehicletype = vehicletype;
                spawns[spawns.size] = vehicle;
            }
        }
    }
    dvarstring = function_2ef675c13ca1c4af(@"hash_ad95d7262a11119e", vehicleRef);
    for (index = 0; 1; index++) {
        var_f826f0378f17ae2f = function_2ef675c13ca1c4af(dvarstring, "_origin_", index);
        var_d9c6c3c1205d844 = function_2ef675c13ca1c4af(dvarstring, "_angles_", index);
        var_8a4ea3a3baa22e4 = (0, 0, 0);
        origin = getdvarvector(var_f826f0378f17ae2f, var_8a4ea3a3baa22e4);
        if (origin == (0, 0, 0)) {
            break;
        }
        vehicle = spawnstruct();
        vehicle.origin = origin;
        var_7224bacab3f8ee26 = (0, 0, 0);
        vehicle.angles = getdvarvector(var_d9c6c3c1205d844, var_7224bacab3f8ee26);
        vehicle.targetname = vehicleRef;
        vehicle.vehicletype = vehicletype;
        spawns[spawns.size] = vehicle;
    }
    return spawns;
}

// Namespace siege/namespace_9fd94298885b8281
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e2f
// Size: 0x59
function vehiclespawn_littlebird(loc, var_ee8da5624236dc89) {
    if (!isdefined(loc.angles)) {
        loc.angles = (0, randomfloat(360), 0);
    }
    spawndata = vehiclespawn_getspawndata(loc);
    return namespace_1f188a13f7e79610::vehicle_spawn("little_bird", spawndata, var_ee8da5624236dc89);
}

// Namespace siege/namespace_9fd94298885b8281
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e90
// Size: 0x59
function vehiclespawn_atv(loc, var_ee8da5624236dc89) {
    if (!isdefined(loc.angles)) {
        loc.angles = (0, randomfloat(360), 0);
    }
    spawndata = vehiclespawn_getspawndata(loc);
    return namespace_1f188a13f7e79610::vehicle_spawn("atv", spawndata, var_ee8da5624236dc89);
}

// Namespace siege/namespace_9fd94298885b8281
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ef1
// Size: 0x59
function vehiclespawn_tacrover(loc, var_ee8da5624236dc89) {
    if (!isdefined(loc.angles)) {
        loc.angles = (0, randomfloat(360), 0);
    }
    spawndata = vehiclespawn_getspawndata(loc);
    return namespace_1f188a13f7e79610::vehicle_spawn("tac_rover", spawndata, var_ee8da5624236dc89);
}

// Namespace siege/namespace_9fd94298885b8281
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f52
// Size: 0xe1
function filtervehiclespawnstructs(structs) {
    var_7cb19f95dbc68942 = [];
    if (getdvarint(@"hash_adb05b8132ec13b", level.brtdm_config.locale_defaults["scr_brtdm_disable_radiant_vehicles"]) == 1) {
        return var_7cb19f95dbc68942;
    }
    foreach (struct in structs) {
        if (distance2dsquared(struct.origin, level.brtdm_config.circlecenter) < level.brtdm_config.circleradius * level.brtdm_config.circleradius) {
            var_7cb19f95dbc68942[var_7cb19f95dbc68942.size] = struct;
        }
    }
    return var_7cb19f95dbc68942;
}

// Namespace siege/namespace_9fd94298885b8281
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x303b
// Size: 0xc6
function updategametypedvars() {
    updatecommongametypedvars();
    level.rushtimer = dvarintvalue("rushTimer", 1, 0, 1);
    level.rushtimeramount = dvarfloatvalue("rushTimerAmount", 45, 30, 120);
    level.sharedrushtimer = dvarfloatvalue("sharedRushTimer", 0, 0, 1);
    level.precappoints = dvarintvalue("preCapPoints", 0, 0, 1);
    level.caprate = dvarfloatvalue("capRate", 7.5, 1, 60);
    level.objectivescaler = dvarfloatvalue("objScalar", 2, 1, 10);
    level.holdallflagstimer = dvarfloatvalue("holdAllTimer", 7.5, 0, 60);
}

// Namespace siege/namespace_9fd94298885b8281
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3108
// Size: 0x14
function adjustroundendtimer() {
    wait(1);
    level.roundenddelay = 8;
}

// Namespace siege/namespace_9fd94298885b8281
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3123
// Size: 0x26
function waittooverridegraceperiod() {
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    if (!level.isgroundwarsiege) {
        level.overrideingraceperiod = 1;
    }
}

// Namespace siege/namespace_9fd94298885b8281
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3150
// Size: 0x10c
function initspawns() {
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_dom_spawn_allies_start");
    namespace_b2d5aa2baf2b5701::addstartspawnpoints("mp_dom_spawn_axis_start");
    namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_dom_spawn");
    namespace_b2d5aa2baf2b5701::addspawnpoints("allies", "mp_dom_spawn_secondary", 1, 1);
    namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_dom_spawn");
    namespace_b2d5aa2baf2b5701::addspawnpoints("axis", "mp_dom_spawn_secondary", 1, 1);
    spawns = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_dom_spawn");
    var_3a5288f40c8be099 = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_dom_spawn_secondary");
    namespace_b2d5aa2baf2b5701::registerspawnset("dom", spawns);
    namespace_b2d5aa2baf2b5701::registerspawnset("dom_fallback", var_3a5288f40c8be099);
    level.mapcenter = namespace_b2d5aa2baf2b5701::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
}

// Namespace siege/namespace_9fd94298885b8281
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3263
// Size: 0x2b2
function getspawnpoint() {
    if (level.isgroundwarsiege) {
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
    } else {
        spawnteam = self.pers["team"];
        otherteam = getotherteam(spawnteam)[0];
        if (level.usestartspawns) {
            if (function_bff229a11ecd1e34()) {
                namespace_b2d5aa2baf2b5701::setactivespawnlogic(#"start");
            } else {
                namespace_b2d5aa2baf2b5701::setactivespawnlogic("StartSpawn", "Crit_Default");
            }
            if (game["switchedsides"]) {
                spawnpoints = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_dom_spawn_" + otherteam + "_start");
                spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint_startspawn(spawnpoints);
            } else {
                spawnpoints = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_dom_spawn_" + spawnteam + "_start");
                spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint_startspawn(spawnpoints);
            }
        } else {
            if (function_bff229a11ecd1e34()) {
                namespace_b2d5aa2baf2b5701::setactivespawnlogic(#"default");
            } else {
                namespace_b2d5aa2baf2b5701::setactivespawnlogic("Domination", "Crit_Default");
            }
            var_e02688745e0052c3 = getteamdompoints(spawnteam);
            enemyteam = getotherteam(spawnteam)[0];
            var_db44ac0d1491f876 = getteamdompoints(enemyteam);
            var_a57270e5ba6e59a3 = namespace_6b4b8b8421d203ba::getpreferreddompoints(var_e02688745e0052c3, var_db44ac0d1491f876, spawnteam, otherteam);
            var_ba0a9fd614a3f6ee = namespace_164d533d51098167::function_5647d0dca50a2d4d(var_a57270e5ba6e59a3["preferred"], var_a57270e5ba6e59a3["secondary"]);
            namespace_b2d5aa2baf2b5701::activatespawnset("dom");
            spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint(self, spawnteam, "dom", "dom_fallback", undefined, var_ba0a9fd614a3f6ee);
        }
        /#
            assert(isdefined(spawnpoint));
        #/
        return spawnpoint;
    }
}

// Namespace siege/namespace_9fd94298885b8281
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x351c
// Size: 0x7c
function getteamdompoints(team) {
    var_e02688745e0052c3 = [];
    foreach (dompoint in level.objectives) {
        if (dompoint.ownerteam == team) {
            var_e02688745e0052c3[var_e02688745e0052c3.size] = dompoint;
        }
    }
    return var_e02688745e0052c3;
}

// Namespace siege/namespace_9fd94298885b8281
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x35a0
// Size: 0x1d
function gettimesincedompointcapture(dompoint) {
    return gettime() - dompoint.capturetime;
}

// Namespace siege/namespace_9fd94298885b8281
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35c5
// Size: 0x76
function onplayerconnect(player) {
    player._domflageffect = [];
    player._domflagpulseeffect = [];
    player thread onplayerspawned();
    player thread namespace_98b55913d2326ac8::ondisconnect();
    player.siegelatecomer = 1;
    if (isdefined(game["roundsPlayed"]) && game["roundsPlayed"] != 0 && !namespace_4b0406965e556711::gameflag("prematch_done")) {
        player thread manageprematchfade();
    }
}

// Namespace siege/namespace_9fd94298885b8281
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3642
// Size: 0x72
function onplayerdisconnect(player) {
    for (;;) {
        player waittill("disconnect");
        foreach (effect in player._domflageffect) {
            if (isdefined(effect)) {
                effect delete();
            }
        }
    }
}

// Namespace siege/namespace_9fd94298885b8281
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36bb
// Size: 0x7c
function onplayerspawned() {
    self endon("disconnect");
    while (1) {
        self waittill("spawned");
        setextrascore0(0);
        if (isdefined(self.pers["captures"])) {
            setextrascore0(self.pers["captures"]);
        }
        setextrascore1(0);
        if (isdefined(self.pers["rescues"])) {
            setextrascore1(self.pers["rescues"]);
        }
    }
}

// Namespace siege/namespace_9fd94298885b8281
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x373e
// Size: 0x23
function onplayerjointeam(player) {
    if (gamehasstarted()) {
        player.siegelatecomer = 1;
    }
}

// Namespace siege/namespace_9fd94298885b8281
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3768
// Size: 0x1c
function onspawnplayer(var_9156b53bcf7ce573) {
    level notify("spawned_player");
    thread namespace_6b4b8b8421d203ba::updatematchstatushintonspawn();
}

// Namespace siege/namespace_9fd94298885b8281
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x378b
// Size: 0x54
function checkallowspectating() {
    if (level.rushtimerteam == "none") {
        return;
    }
    if (!getteamdata(level.rushtimerteam, "aliveCount")) {
        level.spectateoverride[level.rushtimerteam].allowenemyspectate = 1;
        namespace_5aeecefc462876::updatespectatesettings();
    }
}

// Namespace siege/namespace_9fd94298885b8281
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37e6
// Size: 0x74c
function domflags() {
    level endon("game_ended");
    primaryflags = getentarray("flag_primary", "targetname");
    var_528742b1628eb47c = getentarray("flag_secondary", "targetname");
    if (primaryflags.size + var_528742b1628eb47c.size < 2) {
        /#
            assertmsg("^1Not enough domination flags found in level!");
        #/
        return;
    }
    filename = "mp/siegeFlagPos.csv";
    currentmap = getmapname();
    var_de9e89f4dfe76629 = 1;
    for (var_2f6edb39cf97e7fb = 2; var_2f6edb39cf97e7fb < 11; var_2f6edb39cf97e7fb++) {
        returnvalue = tablelookup(filename, var_de9e89f4dfe76629, currentmap, var_2f6edb39cf97e7fb);
        if (returnvalue != "") {
            setflagpositions(var_2f6edb39cf97e7fb, float(returnvalue));
        }
    }
    triggers = [];
    for (index = 0; index < primaryflags.size; index++) {
        triggers[triggers.size] = primaryflags[index];
    }
    for (index = 0; index < var_528742b1628eb47c.size; index++) {
        triggers[triggers.size] = var_528742b1628eb47c[index];
    }
    level.numsiegeflags = 3;
    setomnvar("ui_num_dom_flags", level.numsiegeflags);
    if (level.numsiegeflags == 3) {
        foreach (trigger in primaryflags) {
            trigger namespace_6b4b8b8421d203ba::remapdomtriggerscriptlabel();
        }
    }
    level.objectives = [];
    for (index = 0; index < triggers.size; index++) {
        trigger = triggers[index];
        if (level.numsiegeflags == 3) {
            jumpiffalse(trigger.script_label == "_d" || trigger.script_label == "_e") LOC_00000273;
        } else {
        LOC_00000273:
            trigger.origin = getflagpos(trigger.script_label, trigger.origin);
            if (isdefined(trigger.target)) {
                visuals[0] = getent(trigger.target, "targetname");
            } else {
                visuals[0] = spawn("script_model", trigger.origin);
                visuals[0].angles = trigger.angles;
            }
            domflag = namespace_19b4203b51d56488::createuseobject("neutral", trigger, visuals, (0, 0, 100), 1, 1);
            domflag namespace_19b4203b51d56488::allowuse("enemy");
            domflag namespace_19b4203b51d56488::setusetime(level.caprate);
            if (isdefined(trigger.objectivekey)) {
                domflag.objectivekey = trigger.objectivekey;
            } else {
                domflag.objectivekey = domflag namespace_19b4203b51d56488::getlabel();
            }
            if (isdefined(trigger.iconname)) {
                domflag.iconname = trigger.iconname;
            } else {
                domflag.iconname = domflag namespace_19b4203b51d56488::getlabel();
            }
            domflag namespace_19b4203b51d56488::cancontestclaim(1);
            domflag.nousebar = 1;
            domflag.id = "domFlag";
            domflag.firstcapture = 1;
            domflag.prevteam = "neutral";
            domflag.flagcapsuccess = 0;
            domflag.playersrevived = 0;
            domflag.claimgracetime = level.caprate * 1000;
            domflag namespace_19b4203b51d56488::pinobjiconontriggertouch();
            tracestart = visuals[0].origin + (0, 0, 32);
            traceend = visuals[0].origin + (0, 0, -32);
            trace = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, undefined, namespace_2a184fc4902783dc::create_default_contents(1));
            offset = namespace_98b55913d2326ac8::checkmapoffsets(domflag);
            domflag.baseeffectpos = trace["position"] + offset;
            upangles = vectortoangles(trace["normal"]);
            var_232bc202587ca413 = namespace_98b55913d2326ac8::checkmapfxangles(domflag, upangles);
            domflag.baseeffectforward = anglestoforward(var_232bc202587ca413);
            domflag.noscriptable = 1;
            domflag.flagmodel = spawn("script_model", domflag.baseeffectpos);
            domflag.flagmodel setmodel("military_dom_flag_neutral");
            level.objectives[domflag.objectivekey] = domflag;
        }
    }
    var_7fc4b3db1868930f = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_dom_spawn_axis_start");
    var_99a20728731ac0b0 = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_dom_spawn_allies_start");
    level.startpos["allies"] = var_99a20728731ac0b0[0].origin;
    level.startpos["axis"] = var_7fc4b3db1868930f[0].origin;
    level.bestspawnflag = [];
    level.bestspawnflag["allies"] = namespace_98b55913d2326ac8::getunownedflagneareststart("allies", undefined);
    level.bestspawnflag["axis"] = namespace_98b55913d2326ac8::getunownedflagneareststart("axis", level.bestspawnflag["allies"]);
    namespace_6b4b8b8421d203ba::flagsetup();
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        level waittill_any_2("prematch_done", "start_mode_setup");
    }
    foreach (flag in level.objectives) {
        var_3c2389ba69e5822b = namespace_98b55913d2326ac8::getreservedobjid(flag.objectivekey);
        flag namespace_19b4203b51d56488::requestid(1, 1, var_3c2389ba69e5822b);
        flag.onuse = &onuse;
        flag.onbeginuse = &onbeginuse;
        flag.onuseupdate = &onuseupdate;
        flag.onenduse = &onenduse;
        flag.oncontested = &oncontested;
        flag.onuncontested = &onuncontested;
        flag.onunoccupied = &onunoccupied;
        flag.onpinnedstate = &onpinnedstate;
        flag.onunpinnedstate = &onunpinnedstate;
        flag.stompeenemyprogressupdate = &onstompeenemyprogressupdate;
        flag.stompprogressreward = &stompprogressreward;
        flag namespace_19b4203b51d56488::setobjectivestatusicons("waypoint_defend", "waypoint_target");
        flag namespace_19b4203b51d56488::setvisibleteam("any");
        flag namespace_98b55913d2326ac8::domflag_setneutral();
    }
    if (level.precappoints) {
        namespace_98b55913d2326ac8::precap();
    }
}

// Namespace siege/namespace_9fd94298885b8281
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3f39
// Size: 0x20
function setneutral() {
    if (namespace_19b4203b51d56488::getownerteam() == "neutral") {
        thread namespace_98b55913d2326ac8::updateflagstate("idle", 0);
    }
}

// Namespace siege/namespace_9fd94298885b8281
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f60
// Size: 0xfe
function setflagpositions(col, var_6b7dcab5ec19e36a) {
    switch (col) {
    case 2:
        level.siege_a_xpos = var_6b7dcab5ec19e36a;
        break;
    case 3:
        level.siege_a_ypos = var_6b7dcab5ec19e36a;
        break;
    case 4:
        level.siege_a_zpos = var_6b7dcab5ec19e36a;
        break;
    case 5:
        level.siege_b_xpos = var_6b7dcab5ec19e36a;
        break;
    case 6:
        level.siege_b_ypos = var_6b7dcab5ec19e36a;
        break;
    case 7:
        level.siege_b_zpos = var_6b7dcab5ec19e36a;
        break;
    case 8:
        level.siege_c_xpos = var_6b7dcab5ec19e36a;
        break;
    case 9:
        level.siege_c_ypos = var_6b7dcab5ec19e36a;
        break;
    case 10:
        level.siege_c_zpos = var_6b7dcab5ec19e36a;
        break;
    }
}

// Namespace siege/namespace_9fd94298885b8281
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4065
// Size: 0x110
function getflagpos(var_45360a7a32781f43, flagorigin) {
    var_db56ac4dfe639215 = flagorigin;
    if (var_45360a7a32781f43 == "_a") {
        if (isdefined(level.siege_a_xpos) && isdefined(level.siege_a_ypos) && isdefined(level.siege_a_zpos)) {
            var_db56ac4dfe639215 = (level.siege_a_xpos, level.siege_a_ypos, level.siege_a_zpos);
        }
    } else if (var_45360a7a32781f43 == "_b") {
        if (isdefined(level.siege_b_xpos) && isdefined(level.siege_b_ypos) && isdefined(level.siege_b_zpos)) {
            var_db56ac4dfe639215 = (level.siege_b_xpos, level.siege_b_ypos, level.siege_b_zpos);
        }
    } else if (isdefined(level.siege_c_xpos) && isdefined(level.siege_c_ypos) && isdefined(level.siege_c_zpos)) {
        var_db56ac4dfe639215 = (level.siege_c_xpos, level.siege_c_ypos, level.siege_c_zpos);
    }
    return var_db56ac4dfe639215;
}

// Namespace siege/namespace_9fd94298885b8281
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x417d
// Size: 0xe1
function watchflagtimerpause() {
    level endon("game_ended");
    while (1) {
        flag = level waittill("flag_capturing");
        if (level.rushtimer) {
            if (flag.prevteam != "neutral") {
                var_118719db7c3b0eef = getotherteam(flag.prevteam)[0];
                if (isdefined(level.siegetimerstate) && level.siegetimerstate != "pause" && !iswinningteam(var_118719db7c3b0eef)) {
                    level.gametimerbeeps = 0;
                    level.siegetimerstate = "pause";
                    pausecountdowntimer();
                    if (!flagownersalive(flag.prevteam)) {
                        setwinner(var_118719db7c3b0eef, tolower(game[flag.prevteam]) + "_eliminated");
                    }
                }
            }
        }
    }
}

// Namespace siege/namespace_9fd94298885b8281
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4265
// Size: 0x53
function iswinningteam(team) {
    iswinning = 0;
    teamflags = getflagcount(team);
    if (level.numsiegeflags == 3) {
        if (teamflags == 2) {
            iswinning = 1;
        }
    } else if (teamflags >= 3) {
        iswinning = 1;
    }
    return iswinning;
}

// Namespace siege/namespace_9fd94298885b8281
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42c0
// Size: 0xa5
function flagownersalive(team) {
    var_6378ccb27aa322d2 = 0;
    foreach (player in level.participants) {
        if (isdefined(player) && player.team == team && (isreallyalive(player) || player.pers["lives"] > 0)) {
            var_6378ccb27aa322d2 = 1;
            break;
        }
    }
    return var_6378ccb27aa322d2;
}

// Namespace siege/namespace_9fd94298885b8281
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x436d
// Size: 0x66
function pausecountdowntimer() {
    if (!level.timerstoppedforgamemode) {
        var_fca15f66515ac04b = level.rushtimeramount;
        if (isdefined(level.siegetimeleft)) {
            var_fca15f66515ac04b = level.siegetimeleft;
        }
        var_e0968d887a942520 = int(gettime() + var_fca15f66515ac04b * 1000);
        namespace_d576b6dc7cef9c62::pausetimer(var_e0968d887a942520);
    }
    level notify("siege_timer_paused");
}

// Namespace siege/namespace_9fd94298885b8281
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43da
// Size: 0xc3
function resumecountdowntimer(pause) {
    var_fca15f66515ac04b = level.rushtimeramount;
    if (level.timerstoppedforgamemode) {
        if (isdefined(level.siegetimeleft)) {
            var_fca15f66515ac04b = level.siegetimeleft;
        }
        var_e0968d887a942520 = int(gettime() + var_fca15f66515ac04b * 1000);
        setgameendtime(var_e0968d887a942520);
        namespace_d576b6dc7cef9c62::resumetimer(var_e0968d887a942520);
        if (!isdefined(level.siegetimerstate) || level.siegetimerstate == "pause") {
            level.siegetimerstate = "start";
        }
        thread watchgametimer(var_fca15f66515ac04b);
        if (istrue(pause)) {
            if (level.siegeflagcapturing.size > 0) {
                level notify("flag_capturing", self);
            }
        }
    }
}

// Namespace siege/namespace_9fd94298885b8281
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44a4
// Size: 0x304
function watchflagenduse(team) {
    level endon("game_ended");
    var_464c0e9847a1a49a = 0;
    var_b96a5e9d06866903 = 0;
    var_df3f0fe977558f9f = level.rushtimerteam;
    var_464c0e9847a1a49a = getflagcount("allies");
    var_b96a5e9d06866903 = getflagcount("axis");
    if (level.rushtimer && level.rushtimerteam != "none") {
        if (level.sharedrushtimer || var_464c0e9847a1a49a == 1 && var_b96a5e9d06866903 == 1) {
            level.siegetimerstate = "start";
            notifyplayers("siege_timer_start");
            resumecountdowntimer(1);
            return;
        }
    }
    if (var_464c0e9847a1a49a == level.numsiegeflags) {
        setwinner("allies", "siege_allflags_win", "siege_allflags_loss");
    } else if (var_b96a5e9d06866903 == level.numsiegeflags) {
        setwinner("axis", "siege_allflags_win", "siege_allflags_loss");
    } else if (level.rushtimer) {
        if (var_464c0e9847a1a49a == 2 || var_b96a5e9d06866903 == 2) {
            level.rushtimerteam = ter_op(var_464c0e9847a1a49a > var_b96a5e9d06866903, "allies", "axis");
            if (var_df3f0fe977558f9f != level.rushtimerteam) {
                if (isdefined(level.siegetimerstate) && level.siegetimerstate != "reset") {
                    level.gametimerbeeps = 0;
                    level.siegetimeleft = undefined;
                    level.siegetimerstate = "reset";
                    notifyplayers("siege_timer_reset");
                }
                if (!isdefined(level.siegetimerstate) || level.siegetimerstate != "start") {
                    var_fca15f66515ac04b = level.rushtimeramount;
                    if (isdefined(level.siegetimeleft)) {
                        var_fca15f66515ac04b = level.siegetimeleft;
                    }
                    var_e0968d887a942520 = int(gettime() + var_fca15f66515ac04b * 1000);
                    level.timelimitoverride = 1;
                    namespace_d576b6dc7cef9c62::pausetimer(var_e0968d887a942520);
                    setgameendtime(var_e0968d887a942520);
                    namespace_d576b6dc7cef9c62::resumetimer(var_e0968d887a942520);
                    if (!isdefined(level.siegetimerstate) || level.siegetimerstate == "pause") {
                        level.siegetimerstate = "start";
                        notifyplayers("siege_timer_start");
                    }
                    if (!level.gametimerbeeps) {
                        thread watchgametimer(var_fca15f66515ac04b);
                    }
                }
            } else if (var_df3f0fe977558f9f == level.rushtimerteam && var_464c0e9847a1a49a == 1 || var_df3f0fe977558f9f == level.rushtimerteam && var_b96a5e9d06866903 == 1) {
                resumecountdowntimer(1);
            } else if (level.rushtimer) {
                level.gametimerbeeps = 0;
                level.siegetimeleft = undefined;
                level.siegetimerstate = "reset";
                notifyplayers("siege_timer_reset");
                resumecountdowntimer(1);
            }
        }
    }
    self.prevteam = self.ownerteam;
}

// Namespace siege/namespace_9fd94298885b8281
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47af
// Size: 0x5c
function watchgameinactive() {
    level endon("game_ended");
    level endon("flag_capturing");
    timelimit = getdvarfloat(@"hash_9ca646b1f57e85a1");
    if (timelimit > 0) {
        var_44a306db74f92b95 = timelimit - 1;
        while (var_44a306db74f92b95 > 0) {
            var_44a306db74f92b95 = var_44a306db74f92b95 - 1;
            wait(1);
        }
        level.siegegameinactive = 1;
    }
}

// Namespace siege/namespace_9fd94298885b8281
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4812
// Size: 0x2e
function watchgamestart() {
    level endon("game_ended");
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    while (!havespawnedplayers()) {
        waitframe();
    }
    level.gamehasstarted = 1;
}

// Namespace siege/namespace_9fd94298885b8281
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4847
// Size: 0x7c
function havespawnedplayers() {
    if (level.teambased) {
        foreach (team in level.teamnamelist) {
            if (!getteamdata(team, "hasSpawned")) {
                return 0;
            }
        }
        return 1;
    }
    return level.maxplayercount > 1;
}

// Namespace siege/namespace_9fd94298885b8281
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x48cb
// Size: 0x9d
function watchgametimer(gametime) {
    level endon("game_ended");
    level endon("siege_timer_paused");
    level endon("siege_timer_reset");
    remainingtime = gametime;
    clockobject = spawn("script_origin", (0, 0, 0));
    clockobject hide();
    level.gametimerbeeps = 1;
    while (remainingtime > 0) {
        remainingtime = remainingtime - 1;
        level.siegetimeleft = remainingtime;
        if (remainingtime <= 30) {
            if (remainingtime != 0) {
                clockobject playsound("ui_mp_timer_countdown");
            }
        }
        wait(1);
    }
    ontimelimit();
}

// Namespace siege/namespace_9fd94298885b8281
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x496f
// Size: 0x87
function getflagcount(team) {
    teamflags = 0;
    foreach (flag in level.objectives) {
        if (flag.ownerteam == team && !isbeingcaptured(flag)) {
            teamflags = teamflags + 1;
        }
    }
    return teamflags;
}

// Namespace siege/namespace_9fd94298885b8281
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49fe
// Size: 0x8e
function isbeingcaptured(flag) {
    var_22c8be36a2c1db6d = 0;
    if (isdefined(flag)) {
        if (level.siegeflagcapturing.size > 0) {
            foreach (var_45360a7a32781f43 in level.siegeflagcapturing) {
                if (flag.objectivekey == var_45360a7a32781f43) {
                    var_22c8be36a2c1db6d = 1;
                }
            }
        }
    }
    return var_22c8be36a2c1db6d;
}

// Namespace siege/namespace_9fd94298885b8281
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a94
// Size: 0xb4
function setwinner(team, reason, var_99b197e077e1d642) {
    foreach (player in level.players) {
        if (!isai(player)) {
            player setclientomnvar("ui_objective_pinned_text_param", 0);
        }
    }
    if (isdefined(var_99b197e077e1d642)) {
        thread namespace_d576b6dc7cef9c62::endgame(team, game["end_reason"][reason], game["end_reason"][var_99b197e077e1d642]);
    } else {
        thread namespace_d576b6dc7cef9c62::endgame(team, game["end_reason"][reason]);
    }
}

// Namespace siege/namespace_9fd94298885b8281
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b4f
// Size: 0x87
function onbeginuse(player) {
    if (!array_contains(level.siegeflagcapturing, self.objectivekey)) {
        level.siegeflagcapturing[level.siegeflagcapturing.size] = self.objectivekey;
        ownerteam = namespace_19b4203b51d56488::getownerteam();
        player setclientomnvar("ui_objective_pinned_text_param", 1);
        self.didstatusnotify = 0;
        namespace_19b4203b51d56488::setusetime(level.caprate);
    }
    level notify("flag_capturing", self);
}

// Namespace siege/namespace_9fd94298885b8281
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4bdd
// Size: 0x2a3
function onuse(var_22282e7d48ca3400) {
    self.didstatusnotify = 0;
    team = var_22282e7d48ca3400.team;
    oldteam = namespace_19b4203b51d56488::getownerteam();
    otherteam = getotherteam(team)[0];
    self.capturetime = gettime();
    namespace_5a22b6f3a56f7e9b::objective_set_progress(self.objidnum, 0);
    namespace_5a22b6f3a56f7e9b::objective_show_progress(self.objidnum, 0);
    thread namespace_98b55913d2326ac8::updateflagstate(team, 0, team);
    namespace_98b55913d2326ac8::setflagcaptured(team, oldteam, var_22282e7d48ca3400);
    level.usestartspawns = 0;
    if (oldteam == "neutral") {
        var_bde78b1b09ae7f75 = namespace_98b55913d2326ac8::getteamflagcount(team);
        if (var_bde78b1b09ae7f75 < level.objectives.size) {
            if (var_bde78b1b09ae7f75 == 2 && level.numsiegeflags == 3) {
                statusdialog("friendly_captured_2", team);
                statusdialog("enemy_captured_2", otherteam, 1);
            } else {
                statusdialog("secured" + self.objectivekey, team);
                statusdialog("lost" + self.objectivekey, otherteam, 1);
            }
        }
    }
    if (namespace_98b55913d2326ac8::getteamflagcount(team) == level.objectives.size) {
        soundalias = "mp_dom_flag_captured_all";
    } else {
        soundalias = "mp_dom_flag_captured";
    }
    thread printandsoundoneveryone(team, otherteam, undefined, undefined, soundalias, "mp_dom_flag_lost", var_22282e7d48ca3400);
    thread giveflagcapturexp(self.touchlist[team], oldteam, var_22282e7d48ca3400);
    self.firstcapture = 0;
    if (isgameplayteam(team)) {
        if (level.teamdata[team]["aliveCount"] < level.teamdata[team]["players"].size) {
            foreach (player in level.teamdata[team]["players"]) {
                player playlocalsound("mp_bodycount_tick_positive");
            }
            enemies = getenemyplayers(team);
            foreach (player in enemies) {
                player playlocalsound("mp_bodycount_tick_negative");
            }
        }
    }
    thread checkshouldplaymusic(team);
}

// Namespace siege/namespace_9fd94298885b8281
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e87
// Size: 0x123
function onuseupdate(team, progress, change, var_4b22e50e504339fe) {
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    if (progress < 1 && !level.gameended && !istrue(self.captureblocked)) {
        play_dom_capture_sfx(progress, team);
    }
    if (progress > 0.05 && change && !self.didstatusnotify) {
        if (ownerteam == "neutral") {
            statusdialog("securing" + self.objectivekey, team);
            self.prevownerteam = getotherteam(team)[0];
        } else {
            statusdialog("losing" + self.objectivekey, ownerteam, 1);
            statusdialog("securing" + self.objectivekey, team);
        }
        if (!isagent(var_4b22e50e504339fe)) {
            namespace_98b55913d2326ac8::updateflagcapturestate(team);
        }
        namespace_19b4203b51d56488::setobjectivestatusicons(level.iconlosing, level.icontaking);
        self.didstatusnotify = 1;
    }
    level notify("flag_capturing", self);
}

// Namespace siege/namespace_9fd94298885b8281
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4fb1
// Size: 0x5f
function checkshouldplaymusic(team) {
    var_7122bdd2ebb697fa = 0;
    teamflags = getflagcount(team);
    if (level.numsiegeflags == 3) {
        if (teamflags == 2) {
            var_7122bdd2ebb697fa = 1;
        }
    } else if (teamflags == 4) {
        var_7122bdd2ebb697fa = 1;
    }
    if (var_7122bdd2ebb697fa) {
        thread namespace_3bde6869e44a2770::dominating_music(team);
    }
}

// Namespace siege/namespace_9fd94298885b8281
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5017
// Size: 0x8f
function play_dom_capture_sfx(progress, team) {
    if (!isdefined(self.lastsfxplayedtime)) {
        self.lastsfxplayedtime = gettime();
    }
    if (self.lastsfxplayedtime + 995 < gettime()) {
        self.lastsfxplayedtime = gettime();
        var_c3ddfb0eaa8f761c = "";
        progress = int(floor(progress * 10));
        var_c3ddfb0eaa8f761c = "mp_dom_capturing_tick_0" + progress;
        self.visuals[0] playsoundtoteam(var_c3ddfb0eaa8f761c, team);
    }
}

// Namespace siege/namespace_9fd94298885b8281
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50ad
// Size: 0x101
function onenduse(team, player, success) {
    self.didstatusnotify = 0;
    if (isplayer(player)) {
        player setclientomnvar("ui_objective_pinned_text_param", 0);
    }
    if (success) {
        self.flagcapsuccess = 1;
    } else {
        self.flagcapsuccess = 0;
        resumecountdowntimer();
    }
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    if (ownerteam == "neutral") {
        namespace_19b4203b51d56488::setobjectivestatusicons(level.iconneutral);
        namespace_98b55913d2326ac8::updateflagstate("idle", 0);
    } else {
        namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefend, level.iconcapture);
        namespace_98b55913d2326ac8::updateflagstate(ownerteam, 0);
    }
    if (!istrue(self.setblocking) && !istrue(self.stalemate)) {
        level.siegeflagcapturing = array_remove(level.siegeflagcapturing, self.objectivekey);
    }
    thread waitthencheckendgame();
}

// Namespace siege/namespace_9fd94298885b8281
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51b5
// Size: 0xb
function waitthencheckendgame() {
    waitframe();
    checkendgame();
}

// Namespace siege/namespace_9fd94298885b8281
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51c7
// Size: 0x87
function oncontested() {
    if (!array_contains(level.siegeflagcapturing, self.objectivekey)) {
        level.siegeflagcapturing[level.siegeflagcapturing.size] = self.objectivekey;
    }
    namespace_19b4203b51d56488::setobjectivestatusicons(level.iconcontested);
    namespace_5a22b6f3a56f7e9b::objective_set_progress_team(self.objidnum, undefined);
    namespace_98b55913d2326ac8::updateflagstate("contested", 0);
    if (level.rushtimerteam == self.ownerteam) {
        resumecountdowntimer();
    }
}

// Namespace siege/namespace_9fd94298885b8281
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5255
// Size: 0x13a
function onuncontested(lastclaimteam) {
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    numtouching = namespace_19b4203b51d56488::getnumtouchingforteam(ownerteam);
    numother = namespace_19b4203b51d56488::getnumtouchingexceptteam(ownerteam);
    if (numtouching && !numother) {
        level.siegeflagcapturing = array_remove(level.siegeflagcapturing, self.objectivekey);
    }
    thread waitthencheckendgame();
    if (ownerteam == "neutral") {
        if (lastclaimteam != "none") {
            namespace_5a22b6f3a56f7e9b::objective_set_progress_team(self.objidnum, lastclaimteam);
        } else {
            namespace_5a22b6f3a56f7e9b::objective_set_progress_team(self.objidnum, undefined);
        }
    } else {
        namespace_5a22b6f3a56f7e9b::objective_set_progress_team(self.objidnum, getotherteam(ownerteam)[0]);
    }
    if (lastclaimteam == "none" || ownerteam == "neutral") {
        namespace_19b4203b51d56488::setobjectivestatusicons(level.iconneutral);
        self.didstatusnotify = 0;
    } else {
        namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefend, level.iconcapture);
    }
    var_ff99447227b9fbac = ter_op(ownerteam == "neutral", "idle", ownerteam);
    namespace_98b55913d2326ac8::updateflagstate(var_ff99447227b9fbac, 0);
}

// Namespace siege/namespace_9fd94298885b8281
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5396
// Size: 0x7d
function onunoccupied() {
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    level.siegeflagcapturing = array_remove(level.siegeflagcapturing, self.objectivekey);
    thread waitthencheckendgame();
    if (ownerteam == "neutral") {
        namespace_19b4203b51d56488::setobjectivestatusicons(level.iconneutral);
        self.didstatusnotify = 0;
    } else {
        namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefend, level.iconcapture);
    }
}

// Namespace siege/namespace_9fd94298885b8281
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x541a
// Size: 0x5b
function onpinnedstate(player) {
    if (self.ownerteam != "neutral" && self.numtouching[self.ownerteam] && !self.stalemate) {
        namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefending, level.iconcapture);
    }
}

// Namespace siege/namespace_9fd94298885b8281
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x547c
// Size: 0xc2
function onunpinnedstate(player) {
    if (self.ownerteam != "neutral" && !self.numtouching[self.ownerteam] && !self.stalemate) {
        namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefend, level.iconcapture);
    }
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    numtouching = namespace_19b4203b51d56488::getnumtouchingforteam(ownerteam);
    numother = namespace_19b4203b51d56488::getnumtouchingexceptteam(ownerteam);
    if (numtouching && !numother) {
        level.siegeflagcapturing = array_remove(level.siegeflagcapturing, self.objectivekey);
    }
    thread waitthencheckendgame();
}

// Namespace siege/namespace_9fd94298885b8281
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5545
// Size: 0x94
function onstompeenemyprogressupdate(team) {
    ownerteam = namespace_19b4203b51d56488::getownerteam();
    numtouching = namespace_19b4203b51d56488::getnumtouchingforteam(ownerteam);
    numother = namespace_19b4203b51d56488::getnumtouchingexceptteam(ownerteam);
    if (numtouching && !numother) {
        level.siegeflagcapturing = array_remove(level.siegeflagcapturing, self.objectivekey);
    }
    if (level.rushtimerteam == self.ownerteam) {
        resumecountdowntimer();
    } else {
        resumecountdowntimer(1);
    }
}

// Namespace siege/namespace_9fd94298885b8281
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x55e0
// Size: 0x49
function stompprogressreward(player) {
    player thread namespace_62c556437da28f50::scoreeventpopup(#"defend");
    player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_2d96ced878338cd2");
    namespace_19b4203b51d56488::setobjectivestatusicons(level.icondefending, level.iconcapture);
}

// Namespace siege/namespace_9fd94298885b8281
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5630
// Size: 0xbe
function ondeadevent(team) {
    if (gamehasstarted()) {
        if (team == "all") {
            ontimelimit();
        } else if (team == game["attackers"]) {
            if (level.rushtimer && getflagcount(team) == 2) {
                return;
            }
            setwinner(game["defenders"], tolower(game[game["attackers"]]) + "_eliminated");
        } else if (team == game["defenders"]) {
            if (level.rushtimer && getflagcount(team) == 2) {
                return;
            }
            setwinner(game["attackers"], tolower(game[game["defenders"]]) + "_eliminated");
        }
    }
}

// Namespace siege/namespace_9fd94298885b8281
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x56f5
// Size: 0x27
function ononeleftevent(team) {
    lastplayer = getlastlivingplayer(team);
    lastplayer thread givelastonteamwarning();
}

// Namespace siege/namespace_9fd94298885b8281
// Params a, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5723
// Size: 0x57a
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00) {
    if (isdefined(self.wasflagspawned)) {
        self.wasflagspawned = undefined;
    }
    if (!isplayer(attacker) || attacker.team == self.team) {
        return;
    }
    if (!flagownersalive(self.team) && namespace_98b55913d2326ac8::getteamflagcount(self.team) == 2) {
        statusdialog("objs_capture", attacker.team, 1);
    }
    var_9ff9376383f4bc58 = 0;
    var_8363beb01b537d3e = 0;
    var_88f4967a49a22ed7 = 0;
    victim = self;
    victimteam = victim.team;
    var_f7ded1fdb02a123d = victim.origin;
    attackerteam = attacker.team;
    var_86c1c8628b1d55f8 = attacker.origin;
    attackerisinflictor = 0;
    if (isdefined(einflictor)) {
        var_86c1c8628b1d55f8 = einflictor.origin;
        attackerisinflictor = einflictor == attacker;
    }
    foreach (trigger in attacker.touchtriggers) {
        objective = undefined;
        foreach (obj in level.objectives) {
            if (obj.trigger == trigger) {
                objective = obj;
                break;
            }
        }
        if (!isdefined(objective)) {
            continue;
        }
        ownerteam = objective.ownerteam;
        if (attackerteam != ownerteam) {
            if (!var_9ff9376383f4bc58) {
                var_9ff9376383f4bc58 = 1;
            }
            continue;
        }
    }
    foreach (objective in level.objectives) {
        trigger = objective.trigger;
        ownerteam = objective.ownerteam;
        if (ownerteam == "neutral") {
            var_31e1574aabdefeab = attacker istouching(trigger);
            var_fd534baa79dd395c = victim istouching(trigger);
            if (var_31e1574aabdefeab || var_fd534baa79dd395c) {
                if (objective.claimteam == victimteam) {
                    if (!var_8363beb01b537d3e) {
                        if (var_9ff9376383f4bc58) {
                            attacker thread function_e3e3e81453fd788b(#"hash_470103fde6a5e1ae");
                        } else {
                            attacker thread namespace_62c556437da28f50::scoreeventpopup(#"assault");
                            attacker thread namespace_48a08c5037514e04::doScoreEvent(#"hash_5a3b180273be47b1");
                        }
                        var_8363beb01b537d3e = 1;
                        thread utility::trycall(level.matchdata_logattackerkillevent, var_61b5d0250b328f00, "assaulting");
                        continue;
                    }
                } else if (objective.claimteam == attackerteam) {
                    if (!var_88f4967a49a22ed7) {
                        if (var_9ff9376383f4bc58) {
                            attacker thread function_e3e3e81453fd788b(#"hash_470103fde6a5e1ae");
                        } else {
                            attacker thread namespace_62c556437da28f50::scoreeventpopup(#"defend");
                            attacker thread namespace_48a08c5037514e04::doScoreEvent(#"hash_2d96ced878338cd2");
                        }
                        var_88f4967a49a22ed7 = 1;
                        attacker incpersstat("defends", 1);
                        attacker namespace_2685ec368e022695::statsetchild("round", "defends", attacker.pers["defends"]);
                        thread utility::trycall(level.matchdata_logattackerkillevent, var_61b5d0250b328f00, "defending");
                        continue;
                    }
                }
            }
        } else if (ownerteam != attackerteam) {
            if (!var_8363beb01b537d3e) {
                var_a3a2ce8b8e74ebef = distsquaredcheck(trigger, var_86c1c8628b1d55f8, var_f7ded1fdb02a123d);
                if (var_a3a2ce8b8e74ebef) {
                    if (var_9ff9376383f4bc58) {
                        attacker thread function_e3e3e81453fd788b(#"hash_470103fde6a5e1ae");
                    } else {
                        attacker thread namespace_62c556437da28f50::scoreeventpopup(#"assault");
                        attacker thread namespace_48a08c5037514e04::doScoreEvent(#"hash_5a3b180273be47b1");
                    }
                    var_8363beb01b537d3e = 1;
                    thread utility::trycall(level.matchdata_logattackerkillevent, var_61b5d0250b328f00, "assaulting");
                    continue;
                }
            }
        } else if (!var_88f4967a49a22ed7) {
            var_f6a091229a5e7b04 = distsquaredcheck(trigger, var_86c1c8628b1d55f8, var_f7ded1fdb02a123d);
            if (var_f6a091229a5e7b04) {
                if (var_9ff9376383f4bc58) {
                    attacker thread function_e3e3e81453fd788b(#"hash_470103fde6a5e1ae");
                } else {
                    attacker thread namespace_62c556437da28f50::scoreeventpopup(#"defend");
                    attacker thread namespace_48a08c5037514e04::doScoreEvent(#"hash_2d96ced878338cd2");
                }
                var_88f4967a49a22ed7 = 1;
                attacker incpersstat("defends", 1);
                attacker namespace_2685ec368e022695::statsetchild("round", "defends", attacker.pers["defends"]);
                thread utility::trycall(level.matchdata_logattackerkillevent, var_61b5d0250b328f00, "defending");
                continue;
            }
        }
    }
    thread checkallowspectating();
}

// Namespace siege/namespace_9fd94298885b8281
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ca4
// Size: 0xbe
function distsquaredcheck(trigger, var_86c1c8628b1d55f8, var_f7ded1fdb02a123d) {
    var_9ae8b00a8e8f64fa = distancesquared(trigger.origin, var_86c1c8628b1d55f8);
    var_1881a89c6f1e8775 = distancesquared(trigger.origin, var_f7ded1fdb02a123d);
    if (var_9ae8b00a8e8f64fa < 105625 || var_1881a89c6f1e8775 < 105625) {
        if (!isdefined(trigger.modifieddefendcheck)) {
            return 1;
        } else if (var_86c1c8628b1d55f8[2] - trigger.origin[2] < 100 || var_f7ded1fdb02a123d[2] - trigger.origin[2] < 100) {
            return 1;
        } else {
            return 0;
        }
    } else {
        return 0;
    }
}

// Namespace siege/namespace_9fd94298885b8281
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d69
// Size: 0x86
function givelastonteamwarning() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    waittillrecoveredhealth(3);
    level thread namespace_25c5a6f43bb97b43::trysaylocalsound(self, #"hash_915f01baa2419c9f");
    otherteam = getotherteam(self.pers["team"])[0];
    level thread teamplayercardsplash("callout_lastteammemberalive", self, self.pers["team"]);
    level thread teamplayercardsplash("callout_lastenemyalive", self, otherteam);
    level notify("last_alive", self);
}

// Namespace siege/namespace_9fd94298885b8281
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5df6
// Size: 0xb4
function ontimelimit() {
    if (isdefined(level.siegegameinactive)) {
        level.forcedend = 1;
        thread namespace_d576b6dc7cef9c62::endgame("none", game["end_reason"]["siege_force_end"]);
        return;
    } else {
        var_464c0e9847a1a49a = getflagcount("allies");
        var_b96a5e9d06866903 = getflagcount("axis");
        if (var_464c0e9847a1a49a > var_b96a5e9d06866903) {
            setwinner("allies", "siege_flag_win", "siege_flag_loss");
        } else if (var_b96a5e9d06866903 > var_464c0e9847a1a49a) {
            setwinner("axis", "siege_flag_win", "siege_flag_loss");
        } else {
            setwinner("tie", "cyber_tie");
        }
    }
}

// Namespace siege/namespace_9fd94298885b8281
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5eb1
// Size: 0x1be
function teamrespawn(team, var_22282e7d48ca3400) {
    teamsize = getteamdata(var_22282e7d48ca3400.team, "teamCount");
    if (!isdefined(var_22282e7d48ca3400.rescuedplayers)) {
        var_22282e7d48ca3400.rescuedplayers = [];
    }
    foreach (player in level.participants) {
        if (isdefined(player) && player.team == team && !isreallyalive(player) && !array_contains(getfriendlyplayers(player.team, 1), player) && (!isdefined(player.waitingtoselectclass) || !player.waitingtoselectclass)) {
            if (isdefined(player.siegelatecomer) && player.siegelatecomer) {
                player.siegelatecomer = 0;
            }
            if (!istrue(player.pers["teamKillPunish"])) {
                if (istrue(player.wasflagspawned)) {
                    continue;
                }
                player.wasflagspawned = 1;
                player thread namespace_99ac021a7547cae3::waittillcanspawnclient(0);
                player thread namespace_62c556437da28f50::scoreeventpopup(#"revived");
                level notify("sr_player_respawned", player);
                player leaderdialogonplayer("revived");
            }
            var_22282e7d48ca3400.rescuedplayers[player.guid] = 1;
        }
    }
    self.playersrevived = var_22282e7d48ca3400.rescuedplayers.size;
}

// Namespace siege/namespace_9fd94298885b8281
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6076
// Size: 0x74
function notifyplayers(notifystring) {
    foreach (player in level.players) {
        player thread namespace_44abc05161e2e2cb::showsplash(notifystring);
    }
    level notify("match_ending_soon", "time");
    level notify(notifystring);
}

// Namespace siege/namespace_9fd94298885b8281
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60f1
// Size: 0x2a1
function giveflagcapturexp(touchlist, oldteam, var_22282e7d48ca3400) {
    level endon("game_ended");
    first_player = var_22282e7d48ca3400;
    if (isdefined(first_player.owner)) {
        first_player = first_player.owner;
    }
    level.lastcaptime = gettime();
    if (isplayer(first_player)) {
        level thread teamplayercardsplash("callout_securedposition" + self.objectivekey, first_player);
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
        player thread updatecpm();
        if (player.cpm > 3) {
            xpreward = 0;
            var_bb8c393c8a630338 = 0;
        } else if (player.numcaps > 5) {
            xpreward = 125;
            var_bb8c393c8a630338 = 50;
        } else if (self.objectivekey == "_b" || oldteam != "neutral" || self.playersrevived > 0) {
            xpreward = undefined;
            var_bb8c393c8a630338 = undefined;
        } else {
            xpreward = 125;
            var_bb8c393c8a630338 = 50;
        }
        player thread namespace_62c556437da28f50::scoreeventpopup(#"capture");
        player thread namespace_48a08c5037514e04::doScoreEvent(#"hash_32ffd90c03ec37c6", undefined, var_bb8c393c8a630338, xpreward);
        player incpersstat("captures", 1);
        player namespace_2685ec368e022695::statsetchild("round", "captures", player.pers["captures"]);
        player setextrascore0(player.pers["captures"]);
        player incpersstat("rescues", self.playersrevived);
        player namespace_2685ec368e022695::statsetchild("round", "rescues", player.pers["rescues"]);
        player setextrascore1(player.pers["rescues"]);
        wait(0.05);
    }
    self.playersrevived = 0;
}

// Namespace siege/namespace_9fd94298885b8281
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6399
// Size: 0x1e
function getcapxpscale() {
    if (self.cpm < 4) {
        return 1;
    } else {
        return 0.25;
    }
}

// Namespace siege/namespace_9fd94298885b8281
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x63be
// Size: 0x54
function updatecpm() {
    if (!isdefined(self.cpm)) {
        self.numcaps = 0;
        self.cpm = 0;
    }
    self.numcaps++;
    if (getminutespassed() < 1) {
        return;
    }
    self.cpm = self.numcaps / getminutespassed();
}

// Namespace siege/namespace_9fd94298885b8281
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6419
// Size: 0x7a
function checkendgame() {
    var_464c0e9847a1a49a = getflagcount("allies");
    var_b96a5e9d06866903 = getflagcount("axis");
    if (var_464c0e9847a1a49a == level.numsiegeflags) {
        setwinner("allies", "siege_allflags_win", "siege_allflags_loss");
    } else if (var_b96a5e9d06866903 == level.numsiegeflags) {
        setwinner("axis", "siege_allflags_win", "siege_allflags_loss");
    }
}

// Namespace siege/namespace_9fd94298885b8281
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x649a
// Size: 0x937
function runobjectives(var_aa030029a5b16ae5) {
    level.axisspawnareas = [0:level.axishqname];
    level.alliesspawnareas = [0:level.allieshqname];
    level.allfobs = [];
    foreach (fob in level.gw_objstruct.startingfobs_axis) {
        var_ddca7869b65236b6 = runobjflag(fob.trigger, "axis");
        level.allfobs[level.allfobs.size] = fob;
        level.axisspawnareas[level.axisspawnareas.size] = fob.name;
        if (isdefined(level.spawnselectionlocations[fob.name]["axis"].anchorentity)) {
            level.spawnselectionlocations[fob.name]["axis"].anchorentity.origin = fob.trigger.origin + (0, 0, 100);
        }
    }
    foreach (fob in level.gw_objstruct.startingfobs_allies) {
        var_ddca7869b65236b6 = runobjflag(fob.trigger, "allies");
        level.allfobs[level.allfobs.size] = fob;
        level.alliesspawnareas[level.alliesspawnareas.size] = fob.name;
        if (isdefined(level.spawnselectionlocations[fob.name]["allies"].anchorentity)) {
            level.spawnselectionlocations[fob.name]["allies"].anchorentity.origin = fob.trigger.origin + (0, 0, 100);
        }
    }
    foreach (fob in level.gw_objstruct.startingfobs_neutral) {
        if (level.numsiegeflags == 3) {
            if (level.mapname == "mp_downtown_gw") {
                if (fob.trigger.objkey == "_a" || fob.trigger.objkey == "_e") {
                    continue;
                } else {
                    remapobjkeysandscriptlabels(fob.trigger);
                }
            } else if (level.mapname == "mp_aniyah") {
                if (fob.trigger.objkey == "_b" || fob.trigger.objkey == "_d") {
                    continue;
                } else {
                    remapobjkeysandscriptlabels(fob.trigger);
                }
            } else if (level.mapname == "mp_farms2_gw") {
                if (fob.trigger.objkey == "_b" || fob.trigger.objkey == "_d") {
                    continue;
                } else {
                    remapobjkeysandscriptlabels(fob.trigger);
                }
            } else if (level.mapname == "mp_promenade_gw") {
                if (fob.trigger.objkey == "_a" || fob.trigger.objkey == "_e") {
                    continue;
                } else {
                    remapobjkeysandscriptlabels(fob.trigger);
                }
            } else if (level.mapname == "mp_riverside_gw") {
                if (fob.trigger.objkey == "_b" || fob.trigger.objkey == "_d") {
                    continue;
                } else {
                    remapobjkeysandscriptlabels(fob.trigger);
                }
            } else if (fob.trigger.objkey == "_a" || fob.trigger.objkey == "_e") {
                continue;
            } else {
                remapobjkeysandscriptlabels(fob.trigger);
            }
        }
        var_ddca7869b65236b6 = runobjflag(fob.trigger, "neutral");
        level.allfobs[level.allfobs.size] = fob;
    }
    var_7fc4b3db1868930f = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_gw_spawn_axis_start");
    var_99a20728731ac0b0 = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_gw_spawn_allies_start");
    level.startpos["allies"] = var_99a20728731ac0b0[0].origin;
    level.startpos["axis"] = var_7fc4b3db1868930f[0].origin;
    foreach (fob in level.allfobs) {
        var_3c2389ba69e5822b = namespace_98b55913d2326ac8::getreservedobjid(fob.trigger.gameobject.objectivekey);
        fob.trigger.gameobject namespace_19b4203b51d56488::requestid(1, 1, var_3c2389ba69e5822b);
        fob.trigger.gameobject.onuse = &onuse;
        fob.trigger.gameobject.onbeginuse = &onbeginuse;
        fob.trigger.gameobject.onuseupdate = &onuseupdate;
        fob.trigger.gameobject.onenduse = &onenduse;
        fob.trigger.gameobject.oncontested = &oncontested;
        fob.trigger.gameobject.onuncontested = &onuncontested;
        fob.trigger.gameobject.onunoccupied = &onunoccupied;
        fob.trigger.gameobject.onpinnedstate = &onpinnedstate;
        fob.trigger.gameobject.onunpinnedstate = &onunpinnedstate;
        fob.trigger.gameobject.stompeenemyprogressupdate = &onstompeenemyprogressupdate;
        fob.trigger.gameobject.stompprogressreward = &stompprogressreward;
        fob.trigger.gameobject namespace_19b4203b51d56488::setobjectivestatusicons("waypoint_defend", "waypoint_target");
        fob.trigger.gameobject namespace_19b4203b51d56488::setvisibleteam("any");
        fob.trigger.gameobject namespace_98b55913d2326ac8::domflag_setneutral();
        level.objectives[fob.trigger.gameobject.objectivekey] = fob.trigger.gameobject;
    }
    level.bestspawnflag = [];
    level.bestspawnflag["allies"] = namespace_98b55913d2326ac8::getunownedflagneareststart("allies", undefined);
    level.bestspawnflag["axis"] = namespace_98b55913d2326ac8::getunownedflagneareststart("axis", level.bestspawnflag["allies"]);
    if (level.precappoints) {
        namespace_98b55913d2326ac8::precap(level.numsiegeflags == 5);
    }
    namespace_6b4b8b8421d203ba::flagsetup();
    level thread objective_manageobjectivesintrovisibility();
    level thread namespace_b46034845796aac0::allowobjectiveuseaftermatchstart();
}

// Namespace siege/namespace_9fd94298885b8281
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6dd8
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

// Namespace siege/namespace_9fd94298885b8281
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ed4
// Size: 0x855
function remapobjkeysandscriptlabels(objective) {
    if (level.mapname == "mp_downtown_gw") {
        if (objective.objkey == "_b" && !isdefined(objective.oldkey)) {
            objective.oldkey = "_a";
            objective.objkey = "_a";
            objective.script_label = objective.objkey;
        } else if (objective.objkey == "_c" && !isdefined(objective.oldkey)) {
            objective.oldkey = "_c";
            objective.objkey = "_b";
            objective.script_label = objective.objkey;
        } else if (objective.objkey == "_d" && !isdefined(objective.oldkey)) {
            objective.oldkey = "_d";
            objective.objkey = "_c";
            objective.script_label = objective.objkey;
        }
    } else if (level.mapname == "mp_boneyard_gw") {
        if (objective.objkey == "_b" && !isdefined(objective.oldkey)) {
            objective.oldkey = "_b";
            objective.objkey = "_a";
            objective.script_label = objective.objkey;
        } else if (objective.objkey == "_d" && !isdefined(objective.oldkey)) {
            objective.oldkey = "_d";
            objective.objkey = "_b";
            objective.script_label = objective.objkey;
        } else if (objective.objkey == "_c" && !isdefined(objective.oldkey)) {
            objective.oldkey = "_c";
            objective.objkey = "_c";
            objective.script_label = objective.objkey;
        }
    } else if (level.mapname == "mp_aniyah") {
        if (objective.objkey == "_a" && !isdefined(objective.oldkey)) {
            objective.oldkey = "_a";
            objective.objkey = "_a";
            objective.script_label = objective.objkey;
        } else if (objective.objkey == "_c" && !isdefined(objective.oldkey)) {
            objective.oldkey = "_c";
            objective.objkey = "_b";
            objective.script_label = objective.objkey;
        } else if (objective.objkey == "_e" && !isdefined(objective.oldkey)) {
            objective.oldkey = "_e";
            objective.objkey = "_c";
            objective.script_label = objective.objkey;
        }
    } else if (level.mapname == "mp_promenade_gw") {
        if (objective.objkey == "_b" && !isdefined(objective.oldkey)) {
            objective.oldkey = "_b";
            objective.objkey = "_a";
            objective.script_label = objective.objkey;
        } else if (objective.objkey == "_c" && !isdefined(objective.oldkey)) {
            objective.oldkey = "_c";
            objective.objkey = "_b";
            objective.script_label = objective.objkey;
        } else if (objective.objkey == "_d" && !isdefined(objective.oldkey)) {
            objective.oldkey = "_e";
            objective.objkey = "_c";
            objective.script_label = objective.objkey;
        }
    } else if (level.mapname == "mp_farms2_gw") {
        if (objective.objkey == "_a" && !isdefined(objective.oldkey)) {
            objective.oldkey = "_a";
            objective.objkey = "_a";
            objective.script_label = objective.objkey;
        } else if (objective.objkey == "_c" && !isdefined(objective.oldkey)) {
            objective.oldkey = "_c";
            objective.objkey = "_b";
            objective.script_label = objective.objkey;
        } else if (objective.objkey == "_e" && !isdefined(objective.oldkey)) {
            objective.oldkey = "_e";
            objective.objkey = "_c";
            objective.script_label = objective.objkey;
        }
    } else if (level.mapname == "mp_riverside_gw") {
        if (objective.objkey == "_a" && !isdefined(objective.oldkey)) {
            objective.oldkey = "_a";
            objective.objkey = "_a";
            objective.script_label = objective.objkey;
        } else if (objective.objkey == "_c" && !isdefined(objective.oldkey)) {
            objective.oldkey = "_c";
            objective.objkey = "_b";
            objective.script_label = objective.objkey;
        } else if (objective.objkey == "_e" && !isdefined(objective.oldkey)) {
            objective.oldkey = "_e";
            objective.objkey = "_c";
            objective.script_label = objective.objkey;
        }
    } else if (objective.objkey == "_b" && !isdefined(objective.oldkey)) {
        objective.oldkey = "_b";
        objective.objkey = "_a";
        objective.script_label = objective.objkey;
    } else if (objective.objkey == "_c" && !isdefined(objective.oldkey)) {
        objective.oldkey = "_c";
        objective.objkey = "_b";
        objective.script_label = objective.objkey;
    } else if (objective.objkey == "_d" && !isdefined(objective.oldkey)) {
        objective.oldkey = "_d";
        objective.objkey = "_c";
        objective.script_label = objective.objkey;
    }
}

// Namespace siege/namespace_9fd94298885b8281
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7730
// Size: 0xc9
function runobjflag(objective, startingteam) {
    level endon("game_ended");
    objective.script_label = objective.objkey;
    domflag = namespace_98b55913d2326ac8::setupobjective(objective, undefined, 1);
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

// Namespace siege/namespace_9fd94298885b8281
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7801
// Size: 0x45
function manageprematchfade(delay_time, var_c82eabb722c361a7) {
    self endon("disconnect");
    var_ad4dd16f29e24b77 = 0;
    var_dfab0807d83a77fe = 0.5;
    thread namespace_99ac021a7547cae3::managerespawnfade(var_ad4dd16f29e24b77, var_dfab0807d83a77fe);
}

// Namespace siege/namespace_9fd94298885b8281
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x784d
// Size: 0xe8
function function_7fd73dbe340f511d() {
    /#
        self endon("lost_b");
        setdevdvarifuninitialized(@"hash_1432c61b2a63cd8e", 0);
        var_4b22e50e504339fe = undefined;
        while (1) {
            if (getdvarint(@"hash_1432c61b2a63cd8e", 0) != 0) {
                foreach (player in level.players) {
                    if (player ishost()) {
                        var_4b22e50e504339fe = player;
                        break;
                    }
                }
                level.objectives["preCapPoints"] onuse(var_4b22e50e504339fe);
                wait(0.15);
                level.objectives["holdAllTimer"] onuse(var_4b22e50e504339fe);
            }
            setdevdvar(@"hash_1432c61b2a63cd8e", 0);
            wait(1);
        }
    #/
}

// Namespace siege/namespace_9fd94298885b8281
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x793c
// Size: 0x2b6
function removedompoint() {
    /#
        self endon("lost_b");
        while (1) {
            if (getdvar(@"hash_6ce167f2cdc8ef7c", "waypoint_capture") != "waypoint_capture") {
                var_45360a7a32781f43 = getdvar(@"hash_6ce167f2cdc8ef7c", "waypoint_capture");
                foreach (domflag in level.objectives) {
                    if (isdefined(domflag.objectivekey) && domflag.objectivekey == var_45360a7a32781f43) {
                        domflag namespace_19b4203b51d56488::allowuse("waypoint_defend");
                        domflag.trigger = undefined;
                        domflag notify("switchedsides");
                        if (isdefined(domflag.neutralflagfx)) {
                            domflag.neutralflagfx delete();
                        }
                        foreach (player in level.players) {
                            foreach (effect in player._domflageffect) {
                                if (isdefined(effect)) {
                                    effect delete();
                                }
                            }
                            foreach (var_25449d53b65e2377 in player._domflagpulseeffect) {
                                if (isdefined(var_25449d53b65e2377)) {
                                    var_25449d53b65e2377 delete();
                                }
                            }
                        }
                        domflag.visibleteam = "waypoint_defend";
                        domflag namespace_19b4203b51d56488::setobjectivestatusicons(undefined, undefined);
                        var_3dabce211c987a42 = [];
                        foreach (objective in level.objectives) {
                            if (objective.objectivekey != var_45360a7a32781f43) {
                                var_3dabce211c987a42[var_3dabce211c987a42.size] = objective;
                            }
                        }
                        level.objectives = var_3dabce211c987a42;
                        break;
                    }
                }
                setdynamicdvar(@"hash_6ce167f2cdc8ef7c", "waypoint_capture");
            }
            wait(1);
        }
    #/
}

// Namespace siege/namespace_9fd94298885b8281
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7bf9
// Size: 0x4f3
function placedompoint() {
    /#
        self endon("lost_b");
        while (1) {
            if (getdvar(@"hash_29d45d6822a1cf6d", "waypoint_capture") != "waypoint_capture") {
                var_45360a7a32781f43 = getdvar(@"hash_29d45d6822a1cf6d", "waypoint_capture");
                zone = spawnstruct();
                zone.origin = level.players[0].origin;
                zone.angles = level.players[0].angles;
                trigger = spawn("GAME_MODE", zone.origin, 0, 120, 128);
                zone.trigger = trigger;
                zone.trigger.script_label = var_45360a7a32781f43;
                zone.ownerteam = "dom_fallback";
                tracestart = zone.origin + (0, 0, 32);
                traceend = zone.origin + (0, 0, -32);
                trace = namespace_2a184fc4902783dc::_bullet_trace(tracestart, traceend, 0, undefined);
                zone.origin = trace["mp_dom_spawn_"];
                zone.upangles = vectortoangles(trace["spawned_player"]);
                zone.forward = anglestoforward(zone.upangles);
                zone.right = anglestoright(zone.upangles);
                zone.visuals[0] = spawn("mp/siegeFlagPos.csv", zone.origin);
                zone.visuals[0].angles = zone.angles;
                domflag = namespace_19b4203b51d56488::createuseobject("dom_fallback", zone.trigger, zone.visuals, (0, 0, 100));
                domflag namespace_19b4203b51d56488::allowuse("idle");
                domflag namespace_19b4203b51d56488::setusetime(level.caprate);
                if (isdefined(trigger.objectivekey)) {
                    domflag.objectivekey = trigger.objectivekey;
                } else {
                    domflag.objectivekey = domflag namespace_19b4203b51d56488::getlabel();
                }
                if (isdefined(trigger.iconname)) {
                    domflag.iconname = trigger.iconname;
                } else {
                    domflag.iconname = domflag namespace_19b4203b51d56488::getlabel();
                }
                domflag namespace_19b4203b51d56488::setobjectivestatusicons("lives", "mp_dom_flag_captured");
                domflag namespace_19b4203b51d56488::setvisibleteam("teamCount");
                domflag namespace_19b4203b51d56488::cancontestclaim(1);
                domflag.onuse = &onuse;
                domflag.onbeginuse = &onbeginuse;
                domflag.onuseupdate = &onuseupdate;
                domflag.onenduse = &onenduse;
                domflag.oncontested = &oncontested;
                domflag.onuncontested = &onuncontested;
                domflag.onunoccupied = &namespace_98b55913d2326ac8::dompoint_onunoccupied;
                domflag.onpinnedstate = &namespace_98b55913d2326ac8::dompoint_onpinnedstate;
                domflag.onunpinnedstate = &namespace_98b55913d2326ac8::dompoint_onunpinnedstate;
                domflag.stompprogressreward = &namespace_98b55913d2326ac8::dompoint_stompprogressreward;
                domflag.nousebar = 1;
                domflag.id = "time";
                domflag.firstcapture = 1;
                domflag.claimgracetime = 10000;
                domflag namespace_19b4203b51d56488::pinobjiconontriggertouch();
                tracestart = zone.visuals[0].origin + (0, 0, 32);
                traceend = zone.visuals[0].origin + (0, 0, -32);
                contentoverride = namespace_2a184fc4902783dc::create_contents(1, 1, 1, 1, 0, 1, 1);
                ignoreents = [];
                trace = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, ignoreents, contentoverride);
                domflag.baseeffectpos = trace["mp_dom_spawn_"];
                upangles = vectortoangles(trace["spawned_player"]);
                domflag.baseeffectforward = anglestoforward(upangles);
                domflag namespace_98b55913d2326ac8::initializematchrecording();
                domflag delaythread(1, &setneutral);
                level.objectives[domflag.objectivekey] = domflag;
                setdynamicdvar(@"hash_29d45d6822a1cf6d", "waypoint_capture");
            }
            wait(1);
        }
    #/
}

// Namespace siege/namespace_9fd94298885b8281
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x80f3
// Size: 0x5ff
function domdebug() {
    /#
        spawnpoints = namespace_b2d5aa2baf2b5701::getteamspawnpoints("mp_promenade_gw");
        ispathdataavailable = namespace_b2d5aa2baf2b5701::ispathdataavailable();
        var_1d06954d1a38c688 = (0, 0, 12);
        var_ce6fe2eade88ce3b = (0, 0, 64);
        colors = [];
        colors[1] = (1, 0, 0);
        colors[2] = (0, 1, 0);
        colors[4] = (0, 0, 1);
        colors[8] = (1, 1, 1);
        colors[16] = (0, 0, 0);
        colors[32] = (1, 1, 0);
        colors[64] = (0, 1, 1);
        colors[128] = (1, 0, 1);
        while (1) {
            if (getdvar(@"hash_695e8f43f6b03cd4") != "mp_boneyard_gw") {
                wait(1);
                continue;
            }
            setdevdvar(@"hash_9d60ff019dc50c22", "mp_boneyard_gw");
            while (1) {
                if (getdvar(@"hash_695e8f43f6b03cd4") != "mp_boneyard_gw") {
                    setdevdvar(@"hash_9d60ff019dc50c22", "<unknown string>");
                    break;
                }
                if (!isdefined(level.players[0])) {
                    waitframe();
                    continue;
                }
                var_b7965b0fcb4595c1 = [];
                var_b7965b0fcb4595c1[1] = [0:level.objectives["preCapPoints"]];
                var_b7965b0fcb4595c1[2] = [0:level.objectives["holdAllTimer"]];
                var_b7965b0fcb4595c1[4] = [0:level.objectives["<unknown string>"]];
                var_b7965b0fcb4595c1[8] = [0:level.objectives["<unknown string>"]];
                var_b7965b0fcb4595c1[16] = [0:level.objectives["<unknown string>"]];
                var_b7965b0fcb4595c1[32] = [0:level.objectives["preCapPoints"], 1:level.objectives["holdAllTimer"]];
                var_b7965b0fcb4595c1[64] = [0:level.objectives["<unknown string>"], 1:level.objectives["holdAllTimer"]];
                var_b7965b0fcb4595c1[128] = [0:level.objectives["preCapPoints"], 1:level.objectives["<unknown string>"]];
                foreach (spawnpoint in spawnpoints) {
                    var_6d80e693415c94b2 = spawnpoint.scriptdata;
                    if (!isdefined(var_6d80e693415c94b2.var_601117ef603f46a3)) {
                        var_6d80e693415c94b2.var_601117ef603f46a3 = [];
                    }
                    if (ispathdataavailable) {
                        foreach (endpoint in var_b7965b0fcb4595c1[spawnpoint.scriptdata.domflagassignments]) {
                            if (!isdefined(var_6d80e693415c94b2.var_601117ef603f46a3[endpoint.spawnflagid])) {
                                var_6d80e693415c94b2.var_601117ef603f46a3[endpoint.spawnflagid] = level.players[0] findpath(spawnpoint.origin, endpoint.curorigin);
                            }
                            if (!isdefined(var_6d80e693415c94b2.var_601117ef603f46a3[endpoint.spawnflagid]) || var_6d80e693415c94b2.var_601117ef603f46a3[endpoint.spawnflagid].size == 0) {
                                continue;
                            }
                            color = colors[spawnpoint.scriptdata.domflagassignments];
                            line(spawnpoint.origin + var_1d06954d1a38c688, var_6d80e693415c94b2.var_601117ef603f46a3[endpoint.spawnflagid][0] + var_1d06954d1a38c688, color);
                            for (i = 0; i < var_6d80e693415c94b2.var_601117ef603f46a3[endpoint.spawnflagid].size - 1; i++) {
                                line(var_6d80e693415c94b2.var_601117ef603f46a3[endpoint.spawnflagid][i] + var_1d06954d1a38c688, var_6d80e693415c94b2.var_601117ef603f46a3[endpoint.spawnflagid][i + 1] + var_1d06954d1a38c688, color);
                            }
                        }
                    } else {
                        foreach (endpoint in var_b7965b0fcb4595c1[spawnpoint.scriptdata.domflagassignments]) {
                            line(endpoint.curorigin + var_1d06954d1a38c688, spawnpoint.origin + var_1d06954d1a38c688, (0.2, 0.2, 0.6));
                        }
                    }
                }
                foreach (var_37e3a1eaa43ea82c in level.objectives) {
                    if (var_37e3a1eaa43ea82c == level.bestspawnflag["<unknown string>"]) {
                        print3d(var_37e3a1eaa43ea82c.trigger.origin + var_ce6fe2eade88ce3b, "<unknown string>");
                    }
                    if (var_37e3a1eaa43ea82c == level.bestspawnflag["mp_promenade_gw"]) {
                        print3d(var_37e3a1eaa43ea82c.trigger.origin + var_ce6fe2eade88ce3b, "<unknown string>");
                    }
                }
                waitframe();
            }
        }
    #/
}

