#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\debug.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using scripts\mp\globallogic.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\cp_mp\parachute.gsc;
#using scripts\mp\gametypes\br_c130airdrop.gsc;
#using scripts\mp\gametypes\br_vehicles.gsc;
#using script_27fdece778e999d8;
#using scripts\mp\gametypes\bradley_spawner.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\equipment\tac_insert.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\playerlogic.gsc;
#using script_5bab271917698dc4;
#using scripts\mp\gametypes\br_spectate.gsc;
#using scripts\mp\gametypes\br.gsc;
#using scripts\mp\spectating.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\gametypes\br_gulag.gsc;
#using scripts\mp\damage.gsc;
#using scripts\mp\hud_message.gsc;
#using script_76cc264b397db9cb;
#using scripts\mp\class.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\mp\gametypes\br_c130.gsc;

#namespace brtdm_mgl;

// Namespace brtdm_mgl / namespace_4d5e7f721f017b0a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf2c
// Size: 0x2e8
function main() {
    if (getdvar(@"hash_f644e90eb9a008cf") == "mp_background") {
        return;
    }
    scripts\mp\globallogic::init();
    scripts\mp\globallogic::setupcallbacks();
    allowed[0] = getgametype();
    scripts\mp\gameobjects::main(allowed);
    if (isusingmatchrulesdata()) {
        level.initializematchrules = &initializematchrules;
        [[ level.initializematchrules ]]();
        level thread reinitializematchrulesonmigration();
    } else {
        registerroundswitchdvar(getgametype(), 0, 0, 9);
        registertimelimitdvar(getgametype(), 600);
        registerscorelimitdvar(getgametype(), 75);
        registerroundlimitdvar(getgametype(), 1);
        registerwinlimitdvar(getgametype(), 1);
        registernumlivesdvar(getgametype(), 0);
        registerhalftimedvar(getgametype(), 0);
        function_704789086c9ad943(getgametype(), 1);
    }
    setdvar(@"hash_c82aee6d99907c86", 2);
    level.teambased = 1;
    level.disablespawncamera = 1;
    level.ignoregulagredeploysplash = 1;
    level.brgametype = spawnstruct();
    level.brgametype.funcs = [];
    level.brgametype.disabledfeatures = [];
    level.brgametype.enabledfeatures = [];
    level.brgametype.data = [];
    level.brgametype.name = scripts\cp_mp\utility\game_utility::function_6c1fce6f6b8779d5();
    scripts\mp\gametypes\br_gametypes::disablefeature("kiosk");
    scripts\mp\gametypes\br_gametypes::disablefeature("armor");
    scripts\mp\gametypes\br_gametypes::disablefeature("missions");
    scripts\mp\gametypes\br_gametypes::disablefeature("loot");
    scripts\mp\gametypes\br_gametypes::disablefeature("dropbag");
    scripts\mp\gametypes\br_gametypes::disablefeature("weapons");
    updategametypedvars();
    level.onstartgametype = &onstartgametype;
    level.getspawnpoint = &getspawnpoint;
    level.onnormaldeath = &onnormaldeath;
    level.modeonspawnplayer = &onspawnplayer;
    level.modespawnclient = &modespawn;
    level.modeplayerkilledspawn = &playerkilledspawn;
    level.onplayerkilled = &onplayerkilled;
    level.onplayerconnect = &onplayerconnect;
    level.filtervehiclespawnstructsfunc = &filtervehiclespawnstructs;
    game["dialog"]["gametype"] = "gametype_tdm";
    game["dialog"]["boost"] = "boost_tdm";
    game["dialog"]["offense_obj"] = "boost_tdm";
    game["dialog"]["defense_obj"] = "boost_tdm";
    level scripts\cp_mp\parachute::initparachutedvars();
    thread scripts\mp\gametypes\br_c130airdrop::init();
    if (matchmakinggame()) {
        level.shouldgamelobbyremainintact = &shouldgamelobbyremainintact;
    }
    scripts\mp\gametypes\br_vehicles::brvehiclesinit();
    level thread namespace_da125b44c190d236::function_c38398385afc10fc();
}

// Namespace brtdm_mgl / namespace_4d5e7f721f017b0a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x121c
// Size: 0x37
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
    setdynamicdvar(@"hash_6e7da31aae47b8e0", 0);
    registerhalftimedvar(getgametype(), 0);
    setdynamicdvar(@"hash_bb6e8f8d9be104f4", 0);
}

// Namespace brtdm_mgl / namespace_4d5e7f721f017b0a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x125b
// Size: 0x153
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
        setobjectivetext(entry, %OBJECTIVES/WAR);
        if (level.splitscreen) {
            setobjectivescoretext(entry, %OBJECTIVES/WAR);
        } else {
            setobjectivescoretext(entry, %OBJECTIVES/WAR_SCORE);
        }
        setobjectivehinttext(entry, %OBJECTIVES/WAR_HINT);
    }
    registersharedfunc("vehicle_compass", "shouldBeVisibleToPlayer", &vehicle_compass_br_shouldbevisibletoplayer);
    initcircledata();
    initspawns();
    /#
        level thread function_14d9ef66ff3c55fe();
        level thread function_4e89ea3291f12198();
        level thread function_3fe54271a36d4f0d();
    #/
    scripts\mp\gametypes\bradley_spawner::inittankspawns();
    level thread scripts\mp\gametypes\br_vehicles::brvehiclesonstartgametype();
    initvehicles();
    level thread initprematchc130();
}

// Namespace brtdm_mgl / namespace_4d5e7f721f017b0a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13b6
// Size: 0x312
function updategametypedvars() {
    scripts\mp\gametypes\common::updatecommongametypedvars();
    setdvar(@"hash_de79e5c6b8a17221", getdvarint(@"hash_29a2aab7afd7a31a", 225));
    setdvar(@"hash_18e2dda6aaf07dc3", getdvarint(@"hash_6f3ca3679ac76b3c", 590));
    setdvar(@"hash_180a6f432cfb6644", getdvarint(@"hash_2cfd86efae0c680d", 225));
    setdvar(@"hash_5dfbfd642e45b4b2", getdvarint(@"hash_7f04d2bb2f5714a7", 590));
    level.autorespawnwaittime = getdvarint(@"hash_4beac336193a373d", 3);
    level.parachutedeploydelay = getdvarfloat(@"hash_12027360b079c1db", 0.5);
    level.brtdm_config = spawnstruct();
    level.brtdm_config.locale = getdvar(@"hash_7dcd947b5e9add11", "");
    applylocaledefaults();
    level.brtdm_config.circlecenter = getdvarvector(@"hash_1afadbbba931661", level.brtdm_config.locale_defaults["scr_brtdm_circle_center"]);
    level.brtdm_config.circleradius = getdvarint(@"hash_9a25e652b393bfce", level.brtdm_config.locale_defaults["scr_brtdm_circle_radius"]);
    if (!matchmakinggame()) {
        setdvar(@"hash_1afadbbba931661", level.brtdm_config.circlecenter);
        setdvar(@"hash_9a25e652b393bfce", level.brtdm_config.circleradius);
    }
    level.brtdm_config.disabledvehicles = [];
    allvehicles = ["little_bird", "atv", "tac_rover"];
    foreach (vehicle in allvehicles) {
        if (getdvarint(hashcat(@"hash_ce84d111a575beeb", vehicle), 0) == 1) {
            level.brtdm_config.disabledvehicles[vehicle] = 1;
        }
    }
    level.brtdm_config.spectatepoint = spawnstruct();
    level.brtdm_config.spectatepoint.origin = getdvarvector(@"hash_4177165117bb5cab", level.brtdm_config.locale_defaults["scr_brtdm_spectate_origin"]);
    level.brtdm_config.spectatepoint.angles = getdvarvector(@"hash_25377000b8772425", level.brtdm_config.locale_defaults["scr_brtdm_spectate_angles"]);
}

// Namespace brtdm_mgl / namespace_4d5e7f721f017b0a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x16d0
// Size: 0x2a
function setlocaledefaultvalue(dvar, value) {
    level.brtdm_config.locale_defaults[dvar] = value;
}

// Namespace brtdm_mgl / namespace_4d5e7f721f017b0a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1702
// Size: 0x2fd6
function applylocaledefaults() {
    level.brtdm_config.locale_defaults = [];
    setlocaledefaultvalue("scr_brtdm_circle_center", (0, 0, 0));
    setlocaledefaultvalue("scr_brtdm_circle_radius", 10000);
    setlocaledefaultvalue("scr_brtdm_spawn_angles_allies", 0);
    setlocaledefaultvalue("scr_brtdm_spawn_angles_axis", 180);
    setlocaledefaultvalue("scr_brtdm_spawn_height_allies", 2500);
    setlocaledefaultvalue("scr_brtdm_spawn_height_axis", 2500);
    setlocaledefaultvalue("scr_brtdm_spawn_angle_min", 0);
    setlocaledefaultvalue("scr_brtdm_spawn_angle_max", 30);
    setlocaledefaultvalue("scr_brtdm_spawn_dist_min", 0.9);
    setlocaledefaultvalue("scr_brtdm_spawn_dist_max", 0.99);
    setlocaledefaultvalue("scr_brtdm_spawn_face_enemy", 1);
    setlocaledefaultvalue("scr_brtdm_spectate_origin", (0, 0, 0));
    setlocaledefaultvalue("scr_brtdm_spectate_angles", (0, 0, 0));
    setlocaledefaultvalue("scr_brtdm_disable_radiant_vehicles", 0);
    setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_0", (0, 0, 0));
    setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_0", (0, 0, 0));
    setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_0", (0, 0, 0));
    setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_0", (0, 0, 0));
    setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_origin_0", (0, 0, 0));
    setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_angles_0", (0, 0, 0));
    setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_0", (0, 0, 0));
    setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_0", (0, 0, 0));
    setlocaledefaultvalue("scr_brtdm_vehicle_little_bird_origin_0", (0, 0, 0));
    setlocaledefaultvalue("scr_brtdm_vehicle_little_bird_angles_0", (0, 0, 0));
    switch (level.brtdm_config.locale) {
    case #"hash_da04b46361bbb6a6": 
        setlocaledefaultvalue("scr_brtdm_circle_center", (51500, 3500, 0));
        setlocaledefaultvalue("scr_brtdm_circle_radius", 12000);
        setlocaledefaultvalue("scr_brtdm_spawn_angles_allies", 238);
        setlocaledefaultvalue("scr_brtdm_spawn_angles_axis", 67);
        setlocaledefaultvalue("scr_brtdm_spectate_origin", (48265, 2555, 1580));
        setlocaledefaultvalue("scr_brtdm_spectate_angles", (27, 12, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_0", (53308, 6374, 100));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_0", (0, 155, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_1", (52810, 6734, 100));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_1", (0, 250, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_2", (49169, -478, 100));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_2", (0, 72, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_3", (49156, 1313, 100));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_3", (0, 60, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_origin_0", (52481, 5490, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_angles_0", (0, 247, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_origin_1", (49837, 1321, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_angles_1", (0, 26, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_0", (54585, 6990, 100));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_0", (0, 323, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_1", (51816, 6727, 100));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_1", (0, 200, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_2", (49599, -109, 100));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_2", (0, 333, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_3", (48721, 1557, 100));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_3", (0, 131, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_0", (53180, 7980, 100));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_0", (0, 255, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_1", (53767, 7455, 100));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_1", (0, 270, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_2", (48642, -115, 100));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_2", (0, 23, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_3", (50339, 559, 100));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_3", (0, 58, 0));
        break;
    case #"hash_4cbd499903f3cda3": 
        setlocaledefaultvalue("scr_brtdm_circle_center", (783, 36394, 2700));
        setlocaledefaultvalue("scr_brtdm_circle_radius", 10500);
        setlocaledefaultvalue("scr_brtdm_spawn_angles_allies", 117);
        setlocaledefaultvalue("scr_brtdm_spawn_angles_axis", 346);
        setlocaledefaultvalue("scr_brtdm_spawn_angle_max", 25);
        setlocaledefaultvalue("scr_brtdm_spawn_face_enemy", 1);
        setlocaledefaultvalue("scr_brtdm_spectate_origin", (8400, 33925, 4834));
        setlocaledefaultvalue("scr_brtdm_spectate_angles", (34, 104, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_0", (571, 45632, 1500));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_0", (0, 223, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_1", (-3332, 40505, 2140));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_1", (0, 253, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_origin_0", (-8780, 34027, 25));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_angles_0", (0, 317, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_0", (-3948, 43505, 2329));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_0", (0, 303, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_1", (-7129, 40319, 959));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_1", (0, 291, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_0", (-3004, 43593, 2356));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_0", (0, 271, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_1", (588, 44667, 1495));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_1", (0, 323, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_2", (10118, 36471, 1902));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_2", (0, 141, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_3", (9073, 32831, 1692));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_3", (0, 103, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_origin_1", (2617, 27523, 72));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_angles_1", (0, 142, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_2", (5061, 30887, 425));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_2", (0, 168, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_3", (9013, 37678, 1752));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_3", (0, 194, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_2", (7568, 33763, 1912));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_2", (0, 135, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_3", (9777, 33387, 1700));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_3", (0, 128, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_4", (-699, 30843, -34));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_4", (0, 147, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_5", (-4770, 30535, -219));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_5", (0, 343, 0));
        break;
    case #"hash_928e7733339a3d9d": 
        setlocaledefaultvalue("scr_brtdm_circle_center", (40225, -30954, -100));
        setlocaledefaultvalue("scr_brtdm_circle_radius", 10250);
        setlocaledefaultvalue("scr_brtdm_spawn_angles_allies", 216);
        setlocaledefaultvalue("scr_brtdm_spawn_angles_axis", 55);
        setlocaledefaultvalue("scr_brtdm_spawn_height_allies", 2000);
        setlocaledefaultvalue("scr_brtdm_spawn_height_axis", 2000);
        setlocaledefaultvalue("scr_brtdm_spawn_angle_max", 15);
        setlocaledefaultvalue("scr_brtdm_spawn_dist_max", 0.95);
        setlocaledefaultvalue("scr_brtdm_spectate_origin", (38843, -39882, -25));
        setlocaledefaultvalue("scr_brtdm_spectate_angles", (1, 43, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_0", (0, 88, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_1", (34474, -38278, -483));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_1", (0, 330, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_2", (32135, -34379, -449));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_2", (0, 105, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_0", (34938, -35005, -350));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_0", (0, 358, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_1", (35742, -39576, -519));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_1", (0, 31, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_0", (31217, -33896, -506));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_0", (0, 88, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_1", (31178, -31874, -507));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_1", (0, 36, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_3", (46648, -25226, -369));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_3", (0, 228, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_4", (44233, -24413, -374));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_4", (0, 263, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_5", (42296, -23065, -382));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_5", (0, 195, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_origin_0", (42507, -24819, -441));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_angles_0", (0, 246, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_2", (40389, -22449, -505));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_2", (0, 216, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_3", (40090, -24011, -500));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_3", (0, 197, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_4", (46988, -24370, -337));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_4", (0, 252, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_2", (45277, -29397, 202));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_2", (0, 199, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_3", (40374, -24937, -507));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_3", (0, 284, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_little_bird_origin_0", (46500, -24005, -180));
        setlocaledefaultvalue("scr_brtdm_vehicle_little_bird_angles_0", (0, 245, 0));
        break;
    case #"hash_dcffa2d78be56a76": 
        setlocaledefaultvalue("scr_brtdm_circle_center", (20548, -30577, 0));
        setlocaledefaultvalue("scr_brtdm_circle_radius", 10000);
        setlocaledefaultvalue("scr_brtdm_spawn_angles_allies", 83);
        setlocaledefaultvalue("scr_brtdm_spawn_angles_axis", 224);
        setlocaledefaultvalue("scr_brtdm_spawn_height_allies", 1500);
        setlocaledefaultvalue("scr_brtdm_spawn_height_axis", 1500);
        setlocaledefaultvalue("scr_brtdm_spawn_angle_max", 15);
        setlocaledefaultvalue("scr_brtdm_spawn_dist_min", 0.65);
        setlocaledefaultvalue("scr_brtdm_spawn_dist_max", 0.75);
        setlocaledefaultvalue("scr_brtdm_spawn_face_enemy", 1);
        setlocaledefaultvalue("scr_brtdm_spectate_origin", (17027, -35357, 1505));
        setlocaledefaultvalue("scr_brtdm_spectate_angles", (21, 63, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_0", (21764, -24164, -142));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_0", (0, 174, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_1", (19780, -21087, -78));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_1", (0, 212, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_origin_0", (21514, -23467, -131));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_angles_0", (0, 225, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_0", (21033, -22870, -174));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_0", (0, 223, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_1", (24268, -23630, -134));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_1", (0, 277, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_0", (19014, -23313, -181));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_0", (0, 138, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_1", (27090, -24785, -334));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_1", (0, 267, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_2", (16600, -34006, 378));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_2", (0, 37, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_3", (19450, -35595, -350));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_3", (0, 7, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_origin_1", (13998, -33209, -183));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_angles_1", (0, 88, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_2", (14357, -33952, -198));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_2", (0, 91, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_3", (16839, -32558, 76));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_3", (0, 86, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_2", (17902, -37318, -312));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_2", (0, 14, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_3", (18828, -34025, 75));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_3", (0, 15, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_4", (17563, -32733, 75));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_4", (0, 58, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_little_bird_origin_1", (15583, -36396, 500));
        setlocaledefaultvalue("scr_brtdm_vehicle_little_bird_angles_1", (0, 71, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_5", (19482, -27539, -210));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_5", (0, 335, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_6", (19072, -30488, -208));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_7", (0, 33, 0));
        break;
    case #"hash_1d70ac83665cd7": 
        setlocaledefaultvalue("scr_brtdm_circle_center", (3381, -6288, 750));
        setlocaledefaultvalue("scr_brtdm_circle_radius", 10000);
        setlocaledefaultvalue("scr_brtdm_spawn_angles_allies", 64);
        setlocaledefaultvalue("scr_brtdm_spawn_angles_axis", 234);
        setlocaledefaultvalue("scr_brtdm_spawn_height_allies", 3000);
        setlocaledefaultvalue("scr_brtdm_spawn_angle_max", 20);
        setlocaledefaultvalue("scr_brtdm_spectate_origin", (-384, -14886, 2237));
        setlocaledefaultvalue("scr_brtdm_spectate_angles", (19, 54, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_0", (7968, 1753, 164));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_0", (0, 328, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_1", (5668, 2760, -514));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_1", (0, 172, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_origin_0", (4071, 2010, -450));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_angles_0", (0, 250, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_0", (10647, -2434, -256));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_0", (0, 355, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_1", (2658, 2352, -392));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_1", (0, 192, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_0", (4700, 1713, -510));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_0", (0, 269, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_1", (9716, 596, -235));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_1", (0, 268, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_2", (-4398, -11073, -150));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_2", (0, 58, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_3", (1755, -15241, -223));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_3", (0, 12, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_origin_1", (-5265, -8379, -430));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_angles_1", (0, 18, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_2", (4103, -13423, -229));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_2", (0, 110, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_3", (6098, -13238, -228));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_3", (0, 85, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_2", (-2860, -9972, 109));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_2", (0, 120, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_3", (-4575, -6185, -330));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_3", (0, 321, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_little_bird_origin_0", (-4760, -2885, 750));
        setlocaledefaultvalue("scr_brtdm_vehicle_little_bird_angles_0", (0, 360, 0));
        break;
    case #"hash_e7c353a7633e101c": 
        setlocaledefaultvalue("scr_brtdm_circle_center", (3995, -22767, 0));
        setlocaledefaultvalue("scr_brtdm_circle_radius", 8000);
        setlocaledefaultvalue("scr_brtdm_spawn_angles_allies", 11);
        setlocaledefaultvalue("scr_brtdm_spawn_angles_axis", 171);
        setlocaledefaultvalue("scr_brtdm_spectate_origin", (-2763, -18250, 2498));
        setlocaledefaultvalue("scr_brtdm_spectate_angles", (32, 309, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_0", (11226, -22558, -150));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_0", (0, 103, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_1", (9301, -19445, -226));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_1", (0, 191, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_origin_0", (9728, -21523, -235));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_angles_0", (0, 193, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_0", (9504, -25962, -228));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_0", (0, 130, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_1", (8586, -19265, -228));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_1", (0, 173, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_0", (4201, -29392, -60));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_0", (0, 199, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_1", (7613, -27816, -92));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_1", (0, 140, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_2", (-2062, -19315, -228));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_2", (0, 87, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_3", (-2783, -26033, -74));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_3", (0, 347, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_origin_1", (-2419, -23019, -230));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_angles_1", (0, 357, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_2", (-1356, -20139, -228));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_2", (0, 250, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_3", (-1413, -25619, -225));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_3", (0, 36, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_2", (-1456, -26500, -134));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_2", (0, 345, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_3", (-91, -18495, -228));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_3", (0, 323, 0));
        break;
    case #"hash_ae810f469f12c03b": 
        setlocaledefaultvalue("scr_brtdm_circle_center", (-9500, -36128, 0));
        setlocaledefaultvalue("scr_brtdm_circle_radius", 11500);
        setlocaledefaultvalue("scr_brtdm_spawn_angles_allies", 40);
        setlocaledefaultvalue("scr_brtdm_spawn_angles_axis", 156);
        setlocaledefaultvalue("scr_brtdm_spawn_angle_max", 25);
        setlocaledefaultvalue("scr_brtdm_spectate_origin", (-6862, -28777, 2602));
        setlocaledefaultvalue("scr_brtdm_spectate_angles", (39, 323, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_0", (-2042, -37869, 763));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_0", (0, 168, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_1", (-3384, -27953, 345));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_1", (0, 218, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_origin_0", (-1681, -32452, 99));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_angles_0", (0, 219, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_0", (-4163, -29770, 337));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_0", (0, 203, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_1", (-3076, -28450, 345));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_1", (0, 149, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_0", (-4725, -38714, 669));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_0", (0, 263, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_1", (-5249, -27281, 98));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_1", (0, 174, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_2", (-17139, -33568, 306));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_2", (0, 7, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_3", (-16560, -28505, 120));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_3", (0, 35, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_origin_1", (-16037, -32024, 277));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_angles_1", (0, 314, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_2", (-18517, -36246, 572));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_2", (0, 350, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_3", (-14810, -41243, 575));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_3", (0, 67, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_2", (-18733, -34650, 345));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_2", (0, 359, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_3", (-15813, -31002, 281));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_3", (0, 58, 0));
        break;
    case #"hash_5cfdd14ee0daa46": 
        setlocaledefaultvalue("scr_brtdm_circle_center", (-25639, 7915, 0));
        setlocaledefaultvalue("scr_brtdm_circle_radius", 6500);
        setlocaledefaultvalue("scr_brtdm_spawn_angles_allies", 100);
        setlocaledefaultvalue("scr_brtdm_spawn_angles_axis", 260);
        setlocaledefaultvalue("scr_brtdm_spawn_height_allies", 550);
        setlocaledefaultvalue("scr_brtdm_spawn_height_axis", 550);
        setlocaledefaultvalue("scr_brtdm_spawn_dist_min", 0.74);
        setlocaledefaultvalue("scr_brtdm_spawn_dist_max", 0.78);
        setlocaledefaultvalue("scr_brtdm_spectate_origin", (-28789, 3796, 279));
        setlocaledefaultvalue("scr_brtdm_spectate_angles", (15, 48, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_0", (-28176, 13758, -520));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_0", (0, 178, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_1", (-19765, 13864, -257));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_1", (0, 290, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_origin_0", (-25942, 14835, -267));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_angles_0", (0, 270, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_0", (-22269, 13624, -259));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_0", (0, 243, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_1", (-29275, 12892, -246));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_1", (0, 198, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_0", (-25599, 14007, -622));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_0", (0, 272, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_1", (-20449, 13593, -258));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_1", (0, 357, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_2", (-24803, 1040, -259));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_2", (0, 48, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_3", (-31106, 2103, -240));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_3", (0, 109, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_origin_1", (-21457, 1579, -256));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_angles_1", (0, 90, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_2", (-31346, 3447, -228));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_2", (0, 176, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_3", (-22954, 2747, -151));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_3", (0, 90, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_2", (-24697, 3934, -256));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_2", (0, 357, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_3", (-27133, 1184, -252));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_3", (0, 351, 0));
        break;
    case #"hash_c05282737bd2fbb9": 
        setlocaledefaultvalue("scr_brtdm_circle_center", (-25973, 7847, 0));
        setlocaledefaultvalue("scr_brtdm_circle_radius", 4400);
        setlocaledefaultvalue("scr_brtdm_spawn_angles_allies", 90);
        setlocaledefaultvalue("scr_brtdm_spawn_angles_axis", 270);
        setlocaledefaultvalue("scr_brtdm_spawn_height_allies", 1250);
        setlocaledefaultvalue("scr_brtdm_spawn_height_axis", 1250);
        setlocaledefaultvalue("scr_brtdm_spectate_origin", (-27896, 3953, 571));
        setlocaledefaultvalue("scr_brtdm_spectate_angles", (21, 59, 0));
        setlocaledefaultvalue("scr_brtdm_disable_radiant_vehicles", 1);
        break;
    case #"hash_f48a166c03bb39c1": 
        setlocaledefaultvalue("scr_brtdm_circle_center", (-20452, 43152, 5000));
        setlocaledefaultvalue("scr_brtdm_circle_radius", 12000);
        setlocaledefaultvalue("scr_brtdm_spawn_angles_allies", 204);
        setlocaledefaultvalue("scr_brtdm_spawn_angles_axis", 11);
        setlocaledefaultvalue("scr_brtdm_spectate_origin", (-19516, 36814, -422));
        setlocaledefaultvalue("scr_brtdm_spectate_angles", (357, 100, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_0", (-17241, 31978, -160));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_0", (0, 78, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_1", (-28316, 45020, 2750));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_1", (0, 107, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_origin_0", (-24699, 36333, 390));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_angles_0", (0, 55, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_0", (-23725, 35187, 310));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_0", (0, 327, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_1", (-15420, 32642, -170));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_1", (0, 149, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_0", (-29762, 42138, 2660));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_0", (0, 83, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_1", (-22650, 31751, -75));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_1", (0, 64, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_little_bird_origin_0", (-25554, 36568, 475));
        setlocaledefaultvalue("scr_brtdm_vehicle_little_bird_angles_0", (0, 336, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_2", (-16037, 51673, 2750));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_2", (0, 180, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_3", (-9893, 39929, 775));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_3", (0, 182, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_origin_1", (-12436, 46957, 1845));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_angles_1", (0, 36, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_2", (-10316, 39418, 788));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_2", (0, 76, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_3", (-17210, 52283, 2800));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_3", (0, 215, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_2", (-12629, 47575, 1895));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_2", (0, 332, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_3", (-12104, 37484, 70));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_3", (0, 122, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_little_bird_origin_1", (-13447, 46437, 1900));
        setlocaledefaultvalue("scr_brtdm_vehicle_little_bird_angles_1", (0, 206, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_little_bird_origin_2", (-24476, 43361, 660));
        setlocaledefaultvalue("scr_brtdm_vehicle_little_bird_angles_2", (0, 298, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_4", (-23603, 44704, 160));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_4", (0, 10, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_4", (-25505, 43962, 154));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_4", (0, 233, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_5", (-17379, 43475, -470));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_5", (0, 298, 0));
        break;
    case #"hash_cfd1886f226cbfab": 
        setlocaledefaultvalue("scr_brtdm_circle_center", (5872, 50100, 0));
        setlocaledefaultvalue("scr_brtdm_circle_radius", 10000);
        setlocaledefaultvalue("scr_brtdm_spawn_angles_allies", 136);
        setlocaledefaultvalue("scr_brtdm_spawn_angles_axis", 297);
        setlocaledefaultvalue("scr_brtdm_spectate_origin", (9131, 54369, 1406));
        setlocaledefaultvalue("scr_brtdm_spectate_angles", (11, 240, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_0", (2545, 58630, 762));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_0", (0, 323, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_1", (1443, 55766, 1083));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_1", (0, 261, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_origin_0", (-991, 53487, 1101));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_angles_0", (0, 313, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_0", (4966, 57483, 1092));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_0", (0, 314, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_1", (1123, 57730, 753));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_1", (0, 276, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_0", (-2161, 54088, 986));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_0", (0, 357, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_1", (3129, 53312, 1076));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_1", (0, 357, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_2", (9361, 43795, 1542));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_2", (0, 105, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_3", (11464, 44385, 1376));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_3", (0, 103, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_origin_1", (11606, 45427, 1127));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_angles_1", (0, 134, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_2", (5657, 45721, 1205));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_2", (0, 45, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_3", (2119, 44324, 1494));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_3", (0, 221, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_2", (12290, 46715, 1089));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_2", (0, 78, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_3", (4415, 46102, 1221));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_3", (0, 133, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_little_bird_origin_0", (2150, 46000, 1600));
        setlocaledefaultvalue("scr_brtdm_vehicle_little_bird_angles_0", (0, 42, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_little_bird_origin_1", (12276, 48974, 1200));
        setlocaledefaultvalue("scr_brtdm_vehicle_little_bird_angles_1", (0, 132, 0));
        break;
    case #"hash_21749bc997bc8dca": 
        setlocaledefaultvalue("scr_brtdm_circle_center", (42455, 16503, 0));
        setlocaledefaultvalue("scr_brtdm_circle_radius", 10500);
        setlocaledefaultvalue("scr_brtdm_spawn_angles_allies", 25);
        setlocaledefaultvalue("scr_brtdm_spawn_angles_axis", 203);
        setlocaledefaultvalue("scr_brtdm_spawn_angle_max", 35);
        setlocaledefaultvalue("scr_brtdm_spectate_origin", (39686, 15544, -120));
        setlocaledefaultvalue("scr_brtdm_spectate_angles", (12, 11, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_0", (51614, 15518, 263));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_0", (0, 148, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_1", (45811, 24263, -330));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_1", (0, 228, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_origin_0", (48137, 16713, -270));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_angles_0", (0, 96, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_0", (44736, 17006, -305));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_0", (0, 291, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_1", (44518, 13224, -310));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_1", (0, 155, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_0", (49733, 18097, 15));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_0", (0, 153, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_1", (45970, 24954, -340));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_1", (0, 181, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_little_bird_origin_0", (46588, 19953, 150));
        setlocaledefaultvalue("scr_brtdm_vehicle_little_bird_angles_0", (0, 295, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_2", (34523, 19026, 313));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_2", (0, 320, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_3", (37466, 11429, 745));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_3", (0, 53, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_origin_1", (37558, 13535, 160));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_angles_1", (0, 257, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_2", (38461, 15634, -205));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_2", (0, 310, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_3", (38067, 20032, -170));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_3", (0, 49, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_2", (37354, 22300, 35));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_2", (0, 42, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_3", (36457, 13677, 368));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_3", (0, 335, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_little_bird_origin_1", (37203, 13902, 340));
        setlocaledefaultvalue("scr_brtdm_vehicle_little_bird_angles_1", (0, 20, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_origin_2", (40540, 15603, -302));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_angles_2", (0, 25, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_origin_3", (43693, 17090, -302));
        setlocaledefaultvalue("scr_brtdm_vehicle_cargo_truck_angles_3", (0, 204, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_4", (41479, 16080, -560));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_4", (0, 82, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_5", (43042, 16740, -570));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_5", (0, 266, 0));
        break;
    case #"hash_a86d6bdba8e7b140": 
        setlocaledefaultvalue("scr_brtdm_circle_center", (28681, 2318, 0));
        setlocaledefaultvalue("scr_brtdm_circle_radius", 8200);
        setlocaledefaultvalue("scr_brtdm_spawn_angles_allies", 45);
        setlocaledefaultvalue("scr_brtdm_spawn_angles_axis", 223);
        setlocaledefaultvalue("scr_brtdm_spawn_angle_max", 40);
        setlocaledefaultvalue("scr_brtdm_spawn_height_allies", 1200);
        setlocaledefaultvalue("scr_brtdm_spawn_height_axis", 1200);
        setlocaledefaultvalue("scr_brtdm_spectate_origin", (31146, 7827, 6721));
        setlocaledefaultvalue("scr_brtdm_spectate_angles", (52, 243, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_0", (33225, 7277, -452));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_0", (0, 172, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_1", (29981, 6843, -540));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_1", (0, 353, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_0", (32595, 5128, -615));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_0", (0, 312, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_1", (29427, 7834, -519));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_1", (0, 177, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_0", (28792, 9326, -387));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_0", (0, 172, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_little_bird_origin_0", (33644, 7831, -420));
        setlocaledefaultvalue("scr_brtdm_vehicle_little_bird_angles_0", (0, 227, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_2", (27088, -2862, -806));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_2", (0, 338, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_3", (22958, 866, -515));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_3", (0, 61, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_origin_4", (28840, -4019, -806));
        setlocaledefaultvalue("scr_brtdm_vehicle_atv_angles_4", (0, 6, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_origin_2", (25896, -1985, -802));
        setlocaledefaultvalue("scr_brtdm_vehicle_jeep_angles_2", (0, 46, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_origin_1", (22851, 2160, -506));
        setlocaledefaultvalue("scr_brtdm_vehicle_tac_rover_angles_1", (0, 64, 0));
        setlocaledefaultvalue("scr_brtdm_vehicle_little_bird_origin_1", (23764, -2676, -400));
        setlocaledefaultvalue("scr_brtdm_vehicle_little_bird_angles_1", (0, 39, 0));
        break;
    case #"hash_e73ed69a192339d4": 
        setlocaledefaultvalue("scr_brtdm_spawn_height_allies", 5000);
        setlocaledefaultvalue("scr_brtdm_spawn_height_axis", 5000);
        setlocaledefaultvalue("scr_brtdm_spectate_origin", (0, 0, 1500));
        setlocaledefaultvalue("scr_brtdm_spectate_angles", (27, 12, 0));
        break;
    }
}

// Namespace brtdm_mgl / namespace_4d5e7f721f017b0a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x46e0
// Size: 0x243
function initcircledata() {
    level.br_level = spawnstruct();
    level.br_level.staticcircle = 1;
    level.br_level.br_mapcenter = level.brtdm_config.circlecenter;
    level.br_level.br_mapbounds = [];
    level.br_level.br_mapbounds[0] = (level.br_level.br_mapcenter[0] + level.brtdm_config.circleradius, level.br_level.br_mapcenter[1] + level.brtdm_config.circleradius, 0);
    level.br_level.br_mapbounds[1] = (level.br_level.br_mapcenter[0] - level.brtdm_config.circleradius, level.br_level.br_mapcenter[1] - level.brtdm_config.circleradius, 0);
    level.br_level.br_circleminimapradii = [level.brtdm_config.circleradius, level.brtdm_config.circleradius];
    level.br_level.br_circleradii = [level.brtdm_config.circleradius, level.brtdm_config.circleradius];
    scripts\mp\gametypes\br_circle::initcircle();
    level thread scripts\mp\gametypes\br_circle::runcircles(0);
    level.br_circle.circleindex = 0;
    setomnvar("ui_br_circle_num", 1);
    setomnvar("ui_br_minimap_radius", level.br_level.br_circleminimapradii[0]);
    scripts\mp\gametypes\br_circle::setstaticuicircles(9999, level.br_circle.safecircleui, level.br_circle.dangercircleui, 0);
}

// Namespace brtdm_mgl / namespace_4d5e7f721f017b0a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x492b
// Size: 0x3ca
function initspawns() {
    level.spawnmins = (0, 0, 0);
    level.spawnmaxs = (0, 0, 0);
    level.mapcenter = scripts\mp\spawnlogic::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
    level.brtdm_config.spawnheight["allies"] = getdvarfloat(@"hash_1fe5744c6a2c50a7", level.brtdm_config.locale_defaults["scr_brtdm_spawn_height_allies"]);
    level.brtdm_config.spawnheight["axis"] = getdvarfloat(@"hash_3c77d706ffd2c5cc", level.brtdm_config.locale_defaults["scr_brtdm_spawn_height_allies"]);
    level.brtdm_config.spawnvector["allies"] = anglestoforward((0, getdvarfloat(@"hash_745c9bab39ea32b6", level.brtdm_config.locale_defaults["scr_brtdm_spawn_angles_allies"]), 0));
    level.brtdm_config.spawnvector["axis"] = anglestoforward((0, getdvarfloat(@"hash_1aeb7a215cb83ef1", level.brtdm_config.locale_defaults["scr_brtdm_spawn_angles_axis"]), 0));
    level.brtdm_config.spawnanglemin = getdvarfloat(@"hash_b3655fcea6bd08d", level.brtdm_config.locale_defaults["scr_brtdm_spawn_angle_min"]);
    level.brtdm_config.spawnanglemax = getdvarfloat(@"hash_b133ffcea455873", level.brtdm_config.locale_defaults["scr_brtdm_spawn_angle_max"]);
    level.brtdm_config.spawndistancemin = getdvarfloat(@"hash_70a9803740aa086c", level.brtdm_config.locale_defaults["scr_brtdm_spawn_dist_min"]);
    level.brtdm_config.spawndistancemax = getdvarfloat(@"hash_70858e374081ac7e", level.brtdm_config.locale_defaults["scr_brtdm_spawn_dist_max"]);
    level.brtdm_config.spawnoffsettacinsertmin = getdvarfloat(@"hash_c8e62aaddc230556", 1000);
    level.brtdm_config.spawnoffsettacinsertmax = getdvarfloat(@"hash_c9091caddc492e44", 3000);
    level.brtdm_config.spawnorigin["allies"] = level.brtdm_config.circlecenter + level.brtdm_config.spawnvector["allies"] * level.brtdm_config.circleradius * level.brtdm_config.spawndistancemin;
    level.brtdm_config.spawnorigin["axis"] = level.brtdm_config.circlecenter + level.brtdm_config.spawnvector["axis"] * level.brtdm_config.circleradius * level.brtdm_config.spawndistancemin;
    level.brtdm_config.faceenemyspawn = getdvarint(@"hash_651c49187e1db2a1", level.brtdm_config.locale_defaults["scr_brtdm_spawn_face_enemy"]);
    level thread pregeneratespawnpoints();
}

// Namespace brtdm_mgl / namespace_4d5e7f721f017b0a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4cfd
// Size: 0x4d2
function getspawnpoint() {
    if (!isdefined(self.redeployspawn)) {
        self.redeployspawn = spawnstruct();
        return generatespawnpoint();
    }
    self.ti_spawn = 0;
    if (isdefined(self.setspawnpoint)) {
        spawnpoint = self.setspawnpoint;
        if (!istrue(self.setspawnpoint.notti)) {
            self.ti_spawn = 1;
            self playlocalsound("tactical_spawn");
            foreach (entry in level.teamnamelist) {
                if (entry != self.team) {
                    self playsoundtoteam("tactical_spawn", entry);
                }
            }
        }
        foreach (tank in level.ugvs) {
            if (distancesquared(tank.origin, self.setspawnpoint.playerspawnpos) < 1024) {
                tank notify("damage", 5000, tank.owner, (0, 0, 0), (0, 0, 0), "MOD_EXPLOSIVE", "", "", "", undefined, makeweapon("killstreak_jammer_mp"));
            }
        }
        assert(isdefined(self.setspawnpoint.playerspawnpos));
        assert(isdefined(self.setspawnpoint.angles));
        spawnangles = vectortoangles(level.brtdm_config.spawnvector[self.team]);
        randomyaw = randomfloatrange(level.brtdm_config.spawnanglemin, level.brtdm_config.spawnanglemax);
        spawnvector = anglestoforward((0, spawnangles[1] + ter_op(cointoss(), randomyaw, randomyaw * -1), 0));
        randomdist = randomfloatrange(level.brtdm_config.spawnoffsettacinsertmin, level.brtdm_config.spawnoffsettacinsertmax);
        spawnorigin = self.setspawnpoint.playerspawnpos + spawnvector * randomdist;
        if (distance2dsquared(spawnorigin, level.brtdm_config.circlecenter) > level.brtdm_config.circleradius * level.brtdm_config.circleradius) {
            var_2099c256f875ad40 = vectornormalize(spawnorigin - level.brtdm_config.circlecenter);
            spawnorigin = level.brtdm_config.circlecenter + var_2099c256f875ad40 * level.brtdm_config.circleradius * 0.99;
        }
        tracecontents = scripts\engine\trace::create_default_contents(1);
        groundorigin = drop_to_ground(spawnorigin, 10000, -20000, undefined, tracecontents);
        spawnorigin = (spawnorigin[0], spawnorigin[1], groundorigin[2]);
        spawnorigin += (0, 0, 1) * level.brtdm_config.spawnheight[self.team];
        if (getdvarint(@"hash_53b56fcd1ad4a8ce") == 1) {
            thread drawline(spawnorigin, groundorigin, 15, (1, 1, 0));
        }
        self.redeployspawn.origin = spawnorigin;
        self.redeployspawn.angles = self.setspawnpoint.playerspawnangles;
        self.redeployspawn.lifeid = self.lifeid;
        self.redeployspawn.time = gettime();
        scripts\mp\equipment\tac_insert::spawnpoint_clearspawnpoint(0, 1);
    } else if (self.redeployspawn.team != self.team || self.redeployspawn.lifeid != self.lifeid) {
        return generatespawnpoint();
    }
    return self.redeployspawn;
}

// Namespace brtdm_mgl / namespace_4d5e7f721f017b0a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x51d8
// Size: 0x3a5
function pregeneratespawnpoints() {
    level.redeployspawns = [];
    level.redeployspawns["allies"] = [];
    level.redeployspawns["axis"] = [];
    spawncount = getdvarint(@"hash_e1111ce9b4b5eb16", 50);
    tracecount = getdvarint(@"hash_5951fd67c37a0e30", 5);
    var_7426330c61b55320 = 0;
    foreach (team in level.teamnamelist) {
        for (i = 0; i < spawncount; i++) {
            spawnpoint = spawnstruct();
            spawnangles = vectortoangles(level.brtdm_config.spawnvector[team]);
            randomyaw = randomfloatrange(level.brtdm_config.spawnanglemin, level.brtdm_config.spawnanglemax);
            spawnvector = anglestoforward((0, spawnangles[1] + ter_op(cointoss(), randomyaw, randomyaw * -1), 0));
            randomdist = randomfloatrange(level.brtdm_config.spawndistancemin, level.brtdm_config.spawndistancemax);
            spawnorigin = level.brtdm_config.circlecenter + spawnvector * level.brtdm_config.circleradius * randomdist;
            if (istrue(level.brtdm_config.faceenemyspawn)) {
                toenemyspawn = level.brtdm_config.spawnorigin[getotherteam(team)[0]] - spawnorigin;
                spawnangles = vectortoangles(toenemyspawn);
            } else {
                spawnangles = vectortoangles(spawnvector * -1);
            }
            tracecontents = scripts\engine\trace::create_default_contents(1);
            highestz = 0;
            highesttraceindex = 0;
            anglestep = 10;
            results = [];
            for (j = 0; j < tracecount; j++) {
                result = scripts\engine\trace::ray_trace(spawnorigin + (0, 0, 10000), spawnorigin - (0, 0, 20000) + anglestoforward(spawnangles) * j * 2000, undefined, tracecontents)["position"];
                results[results.size] = result;
                if (result[2] > highestz) {
                    highestz = result[2];
                    highesttraceindex = j;
                }
                var_7426330c61b55320++;
                if (var_7426330c61b55320 == 5) {
                    waitframe();
                    var_7426330c61b55320 = 0;
                }
            }
            spawnorigin = (spawnorigin[0], spawnorigin[1], highestz + level.brtdm_config.spawnheight[team]);
            spawnpoint.origin = spawnorigin;
            spawnpoint.traceresults = results;
            spawnpoint.highesttraceindex = highesttraceindex;
            spawnpoint.angles = spawnangles;
            spawnpoint.time = gettime();
            spawnpoint.team = team;
            spawnpoint.index = -1;
            level.redeployspawns[team][level.redeployspawns[team].size] = spawnpoint;
        }
    }
}

// Namespace brtdm_mgl / namespace_4d5e7f721f017b0a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5585
// Size: 0xf6
function generatespawnpoint() {
    index = randomint(level.redeployspawns[self.team].size);
    spawnpoint = level.redeployspawns[self.team][index];
    self.redeployspawn.origin = spawnpoint.origin;
    self.redeployspawn.angles = spawnpoint.angles;
    self.redeployspawn.time = gettime();
    self.redeployspawn.team = self.team;
    self.redeployspawn.index = -1;
    self.redeployspawn.lifeid = self.lifeid;
    return self.redeployspawn;
}

/#

    // Namespace brtdm_mgl / namespace_4d5e7f721f017b0a
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x5684
    // Size: 0xcc5
    function function_14d9ef66ff3c55fe() {
        while (true) {
            if (getdvarint(@"hash_53b56fcd1ad4a8ce") == 1) {
                thread drawline(level.brtdm_config.circlecenter + (0, 0, 10), level.brtdm_config.circlecenter + level.brtdm_config.spawnvector["<dev string:x1c>"] * level.brtdm_config.circleradius * level.brtdm_config.spawndistancemin + (0, 0, 10), level.framedurationseconds, (0, 1, 0));
                thread drawline(level.brtdm_config.circlecenter, level.brtdm_config.circlecenter + level.brtdm_config.spawnvector["<dev string:x1c>"] * level.brtdm_config.circleradius * level.brtdm_config.spawndistancemax, level.framedurationseconds, (1, 0, 0));
                thread drawline(level.brtdm_config.circlecenter + (0, 0, 10), level.brtdm_config.circlecenter + level.brtdm_config.spawnvector["<dev string:x23>"] * level.brtdm_config.circleradius * level.brtdm_config.spawndistancemin + (0, 0, 10), level.framedurationseconds, (0, 1, 0));
                thread drawline(level.brtdm_config.circlecenter, level.brtdm_config.circlecenter + level.brtdm_config.spawnvector["<dev string:x23>"] * level.brtdm_config.circleradius * level.brtdm_config.spawndistancemax, level.framedurationseconds, (1, 0, 0));
                spawnangles = vectortoangles(level.brtdm_config.spawnvector["<dev string:x1c>"]);
                spawnvector = anglestoforward((0, spawnangles[1] + level.brtdm_config.spawnanglemin, 0));
                thread drawline(level.brtdm_config.circlecenter + (0, 0, 10), level.brtdm_config.circlecenter + spawnvector * level.brtdm_config.circleradius * level.brtdm_config.spawndistancemin + (0, 0, 10), level.framedurationseconds, (0, 1, 0));
                thread drawline(level.brtdm_config.circlecenter, level.brtdm_config.circlecenter + spawnvector * level.brtdm_config.circleradius * level.brtdm_config.spawndistancemax, level.framedurationseconds, (1, 0, 0));
                spawnvector = anglestoforward((0, spawnangles[1] - level.brtdm_config.spawnanglemin, 0));
                thread drawline(level.brtdm_config.circlecenter + (0, 0, 10), level.brtdm_config.circlecenter + spawnvector * level.brtdm_config.circleradius * level.brtdm_config.spawndistancemin + (0, 0, 10), level.framedurationseconds, (0, 1, 0));
                thread drawline(level.brtdm_config.circlecenter, level.brtdm_config.circlecenter + spawnvector * level.brtdm_config.circleradius * level.brtdm_config.spawndistancemax, level.framedurationseconds, (1, 0, 0));
                spawnvector = anglestoforward((0, spawnangles[1] + level.brtdm_config.spawnanglemax, 0));
                thread drawline(level.brtdm_config.circlecenter + (0, 0, 10), level.brtdm_config.circlecenter + spawnvector * level.brtdm_config.circleradius * level.brtdm_config.spawndistancemin + (0, 0, 10), level.framedurationseconds, (0, 1, 0));
                thread drawline(level.brtdm_config.circlecenter, level.brtdm_config.circlecenter + spawnvector * level.brtdm_config.circleradius * level.brtdm_config.spawndistancemax, level.framedurationseconds, (1, 0, 0));
                spawnvector = anglestoforward((0, spawnangles[1] - level.brtdm_config.spawnanglemax, 0));
                thread drawline(level.brtdm_config.circlecenter + (0, 0, 10), level.brtdm_config.circlecenter + spawnvector * level.brtdm_config.circleradius * level.brtdm_config.spawndistancemin + (0, 0, 10), level.framedurationseconds, (0, 1, 0));
                thread drawline(level.brtdm_config.circlecenter, level.brtdm_config.circlecenter + spawnvector * level.brtdm_config.circleradius * level.brtdm_config.spawndistancemax, level.framedurationseconds, (1, 0, 0));
                spawnangles = vectortoangles(level.brtdm_config.spawnvector["<dev string:x23>"]);
                spawnvector = anglestoforward((0, spawnangles[1] + level.brtdm_config.spawnanglemin, 0));
                thread drawline(level.brtdm_config.circlecenter + (0, 0, 10), level.brtdm_config.circlecenter + spawnvector * level.brtdm_config.circleradius * level.brtdm_config.spawndistancemin + (0, 0, 10), level.framedurationseconds, (0, 1, 0));
                thread drawline(level.brtdm_config.circlecenter, level.brtdm_config.circlecenter + spawnvector * level.brtdm_config.circleradius * level.brtdm_config.spawndistancemax, level.framedurationseconds, (1, 0, 0));
                spawnvector = anglestoforward((0, spawnangles[1] - level.brtdm_config.spawnanglemin, 0));
                thread drawline(level.brtdm_config.circlecenter + (0, 0, 10), level.brtdm_config.circlecenter + spawnvector * level.brtdm_config.circleradius * level.brtdm_config.spawndistancemin + (0, 0, 10), level.framedurationseconds, (0, 1, 0));
                thread drawline(level.brtdm_config.circlecenter, level.brtdm_config.circlecenter + spawnvector * level.brtdm_config.circleradius * level.brtdm_config.spawndistancemax, level.framedurationseconds, (1, 0, 0));
                spawnvector = anglestoforward((0, spawnangles[1] + level.brtdm_config.spawnanglemax, 0));
                thread drawline(level.brtdm_config.circlecenter + (0, 0, 10), level.brtdm_config.circlecenter + spawnvector * level.brtdm_config.circleradius * level.brtdm_config.spawndistancemin + (0, 0, 10), level.framedurationseconds, (0, 1, 0));
                thread drawline(level.brtdm_config.circlecenter, level.brtdm_config.circlecenter + spawnvector * level.brtdm_config.circleradius * level.brtdm_config.spawndistancemax, level.framedurationseconds, (1, 0, 0));
                spawnvector = anglestoforward((0, spawnangles[1] - level.brtdm_config.spawnanglemax, 0));
                thread drawline(level.brtdm_config.circlecenter + (0, 0, 10), level.brtdm_config.circlecenter + spawnvector * level.brtdm_config.circleradius * level.brtdm_config.spawndistancemin + (0, 0, 10), level.framedurationseconds, (0, 1, 0));
                thread drawline(level.brtdm_config.circlecenter, level.brtdm_config.circlecenter + spawnvector * level.brtdm_config.circleradius * level.brtdm_config.spawndistancemax, level.framedurationseconds, (1, 0, 0));
                foreach (team in level.teamnamelist) {
                    foreach (spawnpoint in level.redeployspawns[team]) {
                        for (i = 0; i < spawnpoint.traceresults.size; i++) {
                            color = (1, 1, 0);
                            if (spawnpoint.highesttraceindex == i) {
                                color = (0, 1, 0);
                            }
                            thread drawline(spawnpoint.origin, spawnpoint.traceresults[i], level.framedurationseconds, color);
                        }
                    }
                }
            }
            waitframe();
        }
    }

    // Namespace brtdm_mgl / namespace_4d5e7f721f017b0a
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x6351
    // Size: 0xa5
    function function_4e89ea3291f12198() {
        while (true) {
            if (getdvarint(@"hash_7f2b6c7d2b29dde9") == 1) {
                if (isdefined(level.vehiclespawnlocs)) {
                    foreach (vehicle in level.vehiclespawnlocs) {
                        thread drawsphere(vehicle.origin, 128, 1.01, (1, 0, 0));
                    }
                }
            }
            wait 1;
        }
    }

    // Namespace brtdm_mgl / namespace_4d5e7f721f017b0a
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x63fe
    // Size: 0xa0
    function function_3fe54271a36d4f0d() {
        while (true) {
            if (getdvarint(@"hash_bceac01d51fb87ef") == 1) {
                if (isdefined(level.vehiclespawnlocs)) {
                    thread drawsphere(level.brtdm_config.circlecenter, level.brtdm_config.circleradius, 1.01, (0, 0, 1));
                    thread drawsphere(level.brtdm_config.circlecenter, 64, 1.01, (0, 0, 1));
                }
            }
            wait 1;
        }
    }

#/

// Namespace brtdm_mgl / namespace_4d5e7f721f017b0a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x64a6
// Size: 0x10a
function onplayerconnect(player) {
    duration = 9999;
    safecircleent = level.br_circle.safecircleui;
    var_fb3b2613d6f0eb05 = level.br_circle.dangercircleui;
    if (!isbot(player)) {
        var_416318ee02bcd7d9 = scripts\mp\gametypes\br_circle::_safecircledurationforplayer(player, duration);
        player setclientomnvar("ui_br_circle0_start_time", gettime());
        player setclientomnvar("ui_br_circle0_duration", var_416318ee02bcd7d9);
        player setclientomnvar("ui_br_circle0_start_entity", safecircleent);
        player setclientomnvar("ui_br_circle0_end_entity", safecircleent);
        player scripts\mp\gametypes\br_circle::_hidesafecircleui();
        var_416318ee02bcd7d9 = scripts\mp\gametypes\br_circle::_dangercircledurationforplayer(player, duration);
        player setclientomnvar("ui_br_circle1_start_time", gettime());
        player setclientomnvar("ui_br_circle1_duration", var_416318ee02bcd7d9);
        player setclientomnvar("ui_br_circle1_start_entity", var_fb3b2613d6f0eb05);
        player setclientomnvar("ui_br_circle1_end_entity", var_fb3b2613d6f0eb05);
    }
    if (!scripts\mp\flags::gameflag("prematch_done")) {
        player thread manageprematchfade();
    }
}

// Namespace brtdm_mgl / namespace_4d5e7f721f017b0a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x65b8
// Size: 0x81
function manageprematchfade(delay_time, var_c82eabb722c361a7) {
    self endon("disconnect");
    thread infil_radio_idle();
    if (isplayer(self)) {
        self setclienttriggeraudiozone("brtdm_intro", 1);
    }
    var_ad4dd16f29e24b77 = 0;
    var_dfab0807d83a77fe = 0.5;
    thread scripts\mp\playerlogic::managerespawnfade(var_ad4dd16f29e24b77, var_dfab0807d83a77fe);
    scripts\mp\flags::gameflagwait("prematch_done");
    self clearallsoundsubmixes(6);
    self clearclienttriggeraudiozone(6);
}

// Namespace brtdm_mgl / namespace_4d5e7f721f017b0a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6641
// Size: 0x15
function modespawn(revivespawn) {
    thread playerrespawn();
    return true;
}

// Namespace brtdm_mgl / namespace_4d5e7f721f017b0a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x665f
// Size: 0x28
function playerkilledspawn(deathdata, finaldeath) {
    deathdata.victim thread playerrespawn();
    return true;
}

// Namespace brtdm_mgl / namespace_4d5e7f721f017b0a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6690
// Size: 0x111
function playerrespawn() {
    level endon("game_ended");
    self endon("disconnect");
    if (istrue(level.gameended)) {
        return;
    }
    scripts\mp\playerlogic::waitforremoteend();
    if (getdvarint(@"hash_fe3afd6ead4aa523", 1) == 1) {
        self endon("brWaitAndSpawnClientComplete");
    }
    spawnpoint = getspawnpoint();
    streamorigin = namespace_8bfdb6eb5a3df67a::playerprestreamrespawnorigin(spawnpoint);
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
    scripts\mp\gametypes\br_pickups::initplayer(1);
    scripts\mp\gametypes\br_gulag::gulagwinnerrespawn(1, undefined, spawnpoint, 1, streamorigin, undefined, undefined, 0, 0, 1);
    scripts\mp\damage::resetplayervariables();
    scripts\mp\damage::resetplayeromnvarsonspawn();
}

// Namespace brtdm_mgl / namespace_4d5e7f721f017b0a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x67a9
// Size: 0x90
function onspawnplayer(revivespawn) {
    if (level.parachutecancutautodeploy) {
        self skydive_cutautodeployon();
    } else {
        self skydive_cutautodeployoff();
    }
    if (level.parachutecancutparachute) {
        self skydive_cutparachuteon();
    } else {
        self skydive_cutparachuteoff();
    }
    scripts\mp\hud_message::function_f004ef4606b9efdc("kill");
    if (level.spawnprotectiontimer > 0) {
        thread removespawnprotectiononnotify();
        thread removespawnprotectiononads();
    }
    thread manageafktracking();
    namespace_9bb409deb69fb31d::updatesquadomnvars(self.team, self.sessionsquadid);
}

// Namespace brtdm_mgl / namespace_4d5e7f721f017b0a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6841
// Size: 0x2d
function removespawnprotectiononnotify() {
    self endon("death_or_disconnect");
    self endon("remove_spawn_protection");
    waittill_any_3("parachute_landed", "vehicle_enter", "weapon_fired");
    scripts\mp\gametypes\common::removespawnprotection();
}

// Namespace brtdm_mgl / namespace_4d5e7f721f017b0a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6876
// Size: 0x2a
function removespawnprotectiononads() {
    self endon("death_or_disconnect");
    self endon("remove_spawn_protection");
    while (self playerads() < 0.7) {
        waitframe();
    }
    scripts\mp\gametypes\common::removespawnprotection();
}

// Namespace brtdm_mgl / namespace_4d5e7f721f017b0a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x68a8
// Size: 0x4d
function manageafktracking() {
    self endon("disconnect");
    self notify("manageAFKTracking");
    self endon("manageAFKTracking");
    self.ignoreafkcheck = 1;
    thread scripts\mp\class::blockclasschange();
    self waittill("parachute_landed");
    thread scripts\mp\class::unblockclasschange();
    self.ignoreafkcheck = undefined;
    self notify("afk_tracking_resume");
}

// Namespace brtdm_mgl / namespace_4d5e7f721f017b0a
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x68fd
// Size: 0x40
function onnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    scripts\mp\gametypes\common::oncommonnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon);
}

// Namespace brtdm_mgl / namespace_4d5e7f721f017b0a
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x6945
// Size: 0x6c
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, killid) {
    namespace_9bb409deb69fb31d::updatesquadomnvars(self.team, self.sessionsquadid);
}

// Namespace brtdm_mgl / namespace_4d5e7f721f017b0a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x69b9
// Size: 0x52
function ontimelimit() {
    winner = scripts\mp\gamescore::gethighestscoringteam();
    if (game["status"] == "overtime") {
        winner = "forfeit";
    } else if ("tie") {
        winner = "overtime";
    }
    thread scripts\mp\gamelogic::endgame(winner, game["end_reason"]["time_limit_reached"]);
}

// Namespace brtdm_mgl / namespace_4d5e7f721f017b0a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6a13
// Size: 0x4e
function shouldgamelobbyremainintact() {
    axisscore = int(game["teamScores"]["axis"]);
    alliesscore = int(game["teamScores"]["allies"]);
    differential = axisscore - alliesscore;
    return differential < 10;
}

// Namespace brtdm_mgl / namespace_4d5e7f721f017b0a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6a6a
// Size: 0x69
function vehiclespawn_getspawndata(loc) {
    spawndata = spawnstruct();
    spawndata.origin = loc.origin;
    spawndata.angles = loc.angles;
    spawndata.spawntype = "GAME_MODE";
    spawndata.showheadicon = 1;
    return spawndata;
}

// Namespace brtdm_mgl / namespace_4d5e7f721f017b0a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6adc
// Size: 0x7d
function registervehicletype(refname, spawnvehiclecallback) {
    assert(isdefined(refname));
    vehicleinfo = spawnstruct();
    vehicleinfo.refname = refname;
    vehicleinfo.spawncallback = spawnvehiclecallback;
    vehicleinfo.vehiclespawns = function_b08e7e3a0b14f76f(refname);
    assert(isdefined(vehicleinfo.vehiclespawns));
    level.vehicleinfo[refname] = vehicleinfo;
}

// Namespace brtdm_mgl / namespace_4d5e7f721f017b0a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6b61
// Size: 0x3a5
function initvehicles() {
    if (!isdefined(level.vehicleinfo)) {
        level.vehicleinfo = [];
    }
    if (!isdefined(level.brtdm_config.disabledvehicles["little_bird"])) {
        registervehicletype("little_bird", &vehiclespawn_littlebird);
    }
    if (!isdefined(level.brtdm_config.disabledvehicles["atv"])) {
        registervehicletype("atv", &vehiclespawn_atv);
    }
    if (!isdefined(level.brtdm_config.disabledvehicles["tac_rover"])) {
        registervehicletype("tac_rover", &vehiclespawn_tacrover);
    }
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
    if (false) {
        foreach (loc in level.vehiclespawnlocs) {
            thread drawline(loc.origin, loc.origin + (0, 0, 1500), 1000, (1, 0, 0));
        }
    }
    level.vehiclespawnlocs = array_randomize(level.vehiclespawnlocs);
    numtospawn = level.numnonrallyvehicles;
    if (!isdefined(level.numnonrallyvehicles)) {
        numtospawn = 25;
    }
    if (false) {
        for (i = 0; i < numtospawn; i++) {
            loc = level.vehiclespawnlocs[i];
            thread drawline(loc.origin + (0, 0, 1500), loc.origin + (0, 0, 2500), 1000, (0, 1, 0));
        }
    }
    for (i = 0; i < numtospawn; i++) {
        loc = level.vehiclespawnlocs[i];
        if (isdefined(loc)) {
            vehicleinfo = level.vehicleinfo[loc.refname];
            [[ vehicleinfo.spawncallback ]](loc);
        }
    }
}

// Namespace brtdm_mgl / namespace_4d5e7f721f017b0a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6f0e
// Size: 0x19f
function getvehiclespawns(vehicleref, vehicletype) {
    spawns = [];
    dvarstring = hashcat(@"hash_ad95d7262a11119e", vehicleref);
    for (index = 0; true; index++) {
        origindvarstring = hashcat(dvarstring, "_origin_", index);
        angledvarstring = hashcat(dvarstring, "_angles_", index);
        defaultorigin = (0, 0, 0);
        if (isdefined(level.brtdm_config.locale_defaults[origindvarstring])) {
            defaultorigin = level.brtdm_config.locale_defaults[origindvarstring];
        }
        origin = getdvarvector(origindvarstring, defaultorigin);
        if (origin == (0, 0, 0)) {
            break;
        }
        if (!scripts\mp\gametypes\br_circle::ispointincurrentsafecircle(origin)) {
            index++;
            continue;
        }
        vehicle = spawnstruct();
        vehicle.origin = origin;
        var_7224bacab3f8ee26 = (0, 0, 0);
        if (isdefined(level.brtdm_config.locale_defaults[angledvarstring])) {
            var_7224bacab3f8ee26 = level.brtdm_config.locale_defaults[angledvarstring];
        }
        vehicle.angles = getdvarvector(angledvarstring, var_7224bacab3f8ee26);
        vehicle.targetname = vehicleref;
        vehicle.vehicletype = vehicletype;
        spawns[spawns.size] = vehicle;
    }
    return spawns;
}

// Namespace brtdm_mgl / namespace_4d5e7f721f017b0a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x70b6
// Size: 0x297
function getatvspawns() {
    spawns = [];
    switch (level.brtdm_config.locale) {
    case #"hash_da04b46361bbb6a6": 
        vehicle = spawnstruct();
        vehicle.origin = (53308, 6374, 100);
        vehicle.angles = (0, 155, 0);
        vehicle.targetname = "atv";
        vehicle.vehicletype = "veh9_mil_lnd_atv_physics_mp";
        spawns[spawns.size] = vehicle;
        vehicle = spawnstruct();
        vehicle.origin = (52810, 6734, 100);
        vehicle.angles = (0, 250, 0);
        vehicle.targetname = "atv";
        vehicle.vehicletype = "veh9_mil_lnd_atv_physics_mp";
        spawns[spawns.size] = vehicle;
        vehicle = spawnstruct();
        vehicle.origin = (49169, -478, 100);
        vehicle.angles = (0, 72, 0);
        vehicle.targetname = "atv";
        vehicle.vehicletype = "veh9_mil_lnd_atv_physics_mp";
        spawns[spawns.size] = vehicle;
        vehicle = spawnstruct();
        vehicle.origin = (49156, 1313, 100);
        vehicle.angles = (0, 60, 0);
        vehicle.targetname = "atv";
        vehicle.vehicletype = "veh9_mil_lnd_atv_physics_mp";
        spawns[spawns.size] = vehicle;
        break;
    case #"": 
        vehicle = spawnstruct();
        vehicle.origin = (500, -3000, 0);
        vehicle.angles = (0, 90, 0);
        vehicle.targetname = "atv";
        vehicle.vehicletype = "veh9_mil_lnd_atv_physics_mp";
        spawns[spawns.size] = vehicle;
        vehicle = spawnstruct();
        vehicle.origin = (-500, 2000, 0);
        vehicle.angles = (0, 270, 0);
        vehicle.targetname = "atv";
        vehicle.vehicletype = "veh9_mil_lnd_atv_physics_mp";
        spawns[spawns.size] = vehicle;
        break;
    }
    return spawns;
}

// Namespace brtdm_mgl / namespace_4d5e7f721f017b0a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7356
// Size: 0x297
function gettacroverspawns() {
    spawns = [];
    switch (level.brtdm_config.locale) {
    case #"hash_da04b46361bbb6a6": 
        vehicle = spawnstruct();
        vehicle.origin = (53180, 7980, 100);
        vehicle.angles = (0, 255, 0);
        vehicle.targetname = "tac_rover";
        vehicle.vehicletype = "tromeo_physics_mp";
        spawns[spawns.size] = vehicle;
        vehicle = spawnstruct();
        vehicle.origin = (53767, 7455, 100);
        vehicle.angles = (0, 270, 0);
        vehicle.targetname = "tac_rover";
        vehicle.vehicletype = "tromeo_physics_mp";
        spawns[spawns.size] = vehicle;
        vehicle = spawnstruct();
        vehicle.origin = (48642, -115, 100);
        vehicle.angles = (0, 23, 0);
        vehicle.targetname = "tac_rover";
        vehicle.vehicletype = "tromeo_physics_mp";
        spawns[spawns.size] = vehicle;
        vehicle = spawnstruct();
        vehicle.origin = (50339, 559, 100);
        vehicle.angles = (0, 58, 0);
        vehicle.targetname = "tac_rover";
        vehicle.vehicletype = "tromeo_physics_mp";
        spawns[spawns.size] = vehicle;
        break;
    case #"": 
        vehicle = spawnstruct();
        vehicle.origin = (2000, -3000, 0);
        vehicle.angles = (0, 90, 0);
        vehicle.targetname = "tac_rover";
        vehicle.vehicletype = "tromeo_physics_mp";
        spawns[spawns.size] = vehicle;
        vehicle = spawnstruct();
        vehicle.origin = (-2000, 2000, 0);
        vehicle.angles = (0, 270, 0);
        vehicle.targetname = "tac_rover";
        vehicle.vehicletype = "tromeo_physics_mp";
        spawns[spawns.size] = vehicle;
        break;
    }
    return spawns;
}

// Namespace brtdm_mgl / namespace_4d5e7f721f017b0a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x75f6
// Size: 0x58
function vehiclespawn_littlebird(loc, faildata) {
    if (!isdefined(loc.angles)) {
        loc.angles = (0, randomfloat(360), 0);
    }
    spawndata = vehiclespawn_getspawndata(loc);
    return scripts\cp_mp\vehicles\vehicle::vehicle_spawn("little_bird", spawndata, faildata);
}

// Namespace brtdm_mgl / namespace_4d5e7f721f017b0a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7657
// Size: 0x58
function vehiclespawn_atv(loc, faildata) {
    if (!isdefined(loc.angles)) {
        loc.angles = (0, randomfloat(360), 0);
    }
    spawndata = vehiclespawn_getspawndata(loc);
    return scripts\cp_mp\vehicles\vehicle::vehicle_spawn("atv", spawndata, faildata);
}

// Namespace brtdm_mgl / namespace_4d5e7f721f017b0a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x76b8
// Size: 0x58
function vehiclespawn_tacrover(loc, faildata) {
    if (!isdefined(loc.angles)) {
        loc.angles = (0, randomfloat(360), 0);
    }
    spawndata = vehiclespawn_getspawndata(loc);
    return scripts\cp_mp\vehicles\vehicle::vehicle_spawn("tac_rover", spawndata, faildata);
}

// Namespace brtdm_mgl / namespace_4d5e7f721f017b0a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7719
// Size: 0xe4
function filtervehiclespawnstructs(structs) {
    filtered = [];
    if (getdvarint(@"hash_adb05b8132ec13b", level.brtdm_config.locale_defaults[@"hash_adb05b8132ec13b"]) == 1) {
        return filtered;
    }
    foreach (struct in structs) {
        if (distance2dsquared(struct.origin, level.brtdm_config.circlecenter) < level.brtdm_config.circleradius * level.brtdm_config.circleradius) {
            filtered[filtered.size] = struct;
        }
    }
    return filtered;
}

// Namespace brtdm_mgl / namespace_4d5e7f721f017b0a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7806
// Size: 0x4c3
function initprematchc130() {
    level waittill("prematch_countdown");
    var_fba760f7c08b6fbb = 15000;
    var_dc12f67d76b34297 = 50000;
    var_478490addcc8aa79 = 5000;
    var_65a8a4791ddd85d8 = 10;
    var_6f680ee249f67b0d = vectortoangles(level.brtdm_config.spawnvector["allies"] * -1);
    pathdir = anglestoforward((0, var_6f680ee249f67b0d[1] + var_65a8a4791ddd85d8, 0));
    startpt = level.brtdm_config.circlecenter + level.brtdm_config.spawnvector["allies"] * (level.brtdm_config.circleradius + var_fba760f7c08b6fbb) + (0, 0, 1);
    endpt = level.brtdm_config.circlecenter + pathdir * (level.brtdm_config.circleradius * 2 + var_dc12f67d76b34297);
    tracecontents = scripts\engine\trace::create_default_contents(1);
    startpt = drop_to_ground(startpt, level.brtdm_config.spawnheight["allies"], -1 * level.brtdm_config.spawnheight["allies"], undefined, tracecontents);
    startpt += (0, 0, 1) * (level.brtdm_config.spawnheight["allies"] + var_478490addcc8aa79);
    endpt = drop_to_ground(endpt, level.brtdm_config.spawnheight["allies"], -1 * level.brtdm_config.spawnheight["allies"], undefined, tracecontents);
    endpt += (0, 0, 1) * (level.brtdm_config.spawnheight["allies"] + var_478490addcc8aa79);
    pathstruct = spawnstruct();
    pathstruct.startpt = startpt;
    pathstruct.endpt = endpt;
    pathstruct.angle = vectortoangles(pathdir);
    dist = distance(pathstruct.startpt, pathstruct.endpt);
    travelspeed = scripts\mp\gametypes\br_c130::getc130speed();
    time = dist / travelspeed;
    c130airdrop = scripts\mp\gametypes\br_c130airdrop::c130airdrop_spawn(pathstruct, dist, travelspeed, time);
    c130airdrop scripts\mp\gametypes\br_c130airdrop::c130airdrop_startdelivery(0);
    var_6f680ee249f67b0d = vectortoangles(level.brtdm_config.spawnvector["axis"] * -1);
    pathdir = anglestoforward((0, var_6f680ee249f67b0d[1] + var_65a8a4791ddd85d8, 0));
    startpt = level.brtdm_config.circlecenter + level.brtdm_config.spawnvector["axis"] * (level.brtdm_config.circleradius + var_fba760f7c08b6fbb) + (0, 0, 1);
    endpt = level.brtdm_config.circlecenter + pathdir * (level.brtdm_config.circleradius * 2 + var_dc12f67d76b34297);
    startpt = drop_to_ground(startpt, level.brtdm_config.spawnheight["axis"], -1 * level.brtdm_config.spawnheight["axis"], undefined, tracecontents);
    startpt += (0, 0, 1) * (level.brtdm_config.spawnheight["axis"] + var_478490addcc8aa79);
    endpt = drop_to_ground(endpt, level.brtdm_config.spawnheight["axis"], -1 * level.brtdm_config.spawnheight["axis"], undefined, tracecontents);
    endpt += (0, 0, 1) * (level.brtdm_config.spawnheight["axis"] + var_478490addcc8aa79);
    pathstruct = spawnstruct();
    pathstruct.startpt = startpt;
    pathstruct.endpt = endpt;
    pathstruct.angle = vectortoangles(pathdir);
    dist = distance(pathstruct.startpt, pathstruct.endpt);
    travelspeed = scripts\mp\gametypes\br_c130::getc130speed();
    time = dist / travelspeed;
    c130airdrop = scripts\mp\gametypes\br_c130airdrop::c130airdrop_spawn(pathstruct, dist, travelspeed, time);
    c130airdrop scripts\mp\gametypes\br_c130airdrop::c130airdrop_startdelivery(0);
}

// Namespace brtdm_mgl / namespace_4d5e7f721f017b0a
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7cd1
// Size: 0xbb
function infil_radio_idle() {
    self endon("death_or_disconnect");
    if (isplayer(self)) {
        radio_sfx = spawn("script_origin", (0, 0, 0));
        radio_sfx showonlytoplayer(self);
        if (isdefined(self.team)) {
            var_1d6df6a17cee3314 = scripts\mp\utility\teams::getteamvoiceinfix(self.team);
            dronechatter = "dx_mpo_" + var_1d6df6a17cee3314 + "op_drone_deathchatter";
        } else {
            dronechatter = "dx_mpo_ruop_drone_deathchatter";
        }
        if (!soundexists(dronechatter)) {
            dronechatter = "dx_mpo_ruop_drone_deathchatter";
        }
        radio_sfx playloopsound(dronechatter);
        scripts\mp\flags::gameflagwait("prematch_done");
        wait 2;
        radio_sfx stoploopsound(dronechatter);
        radio_sfx delete();
    }
}

// Namespace brtdm_mgl / namespace_4d5e7f721f017b0a
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7d94
// Size: 0x15
function vehicle_compass_br_shouldbevisibletoplayer(vehicle, player) {
    return true;
}

