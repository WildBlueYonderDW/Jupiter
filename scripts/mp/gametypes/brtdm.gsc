// mwiii decomp prototype
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
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\cp_mp\parachute.gsc;
#using scripts\mp\gametypes\br_c130airdrop.gsc;
#using script_3bdadfff7554ceba;
#using scripts\mp\gametypes\br_vehicles.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\gametypes\bradley_spawner.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\equipment\tac_insert.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\class.gsc;
#using script_5bab271917698dc4;
#using scripts\mp\gametypes\br_spectate.gsc;
#using scripts\mp\gametypes\br.gsc;
#using scripts\mp\spectating.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_gulag.gsc;
#using scripts\mp\damage.gsc;
#using scripts\mp\hud_message.gsc;
#using script_76cc264b397db9cb;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\mp\gametypes\br_c130.gsc;

#namespace brtdm;

// Namespace brtdm / scripts/mp/gametypes/brtdm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6d8
// Size: 0x319
function main() {
    if (getdvar(@"hash_f644e90eb9a008cf") == "mp_background") {
        return;
    }
    scripts/mp/globallogic::init();
    scripts/mp/globallogic::setupcallbacks();
    allowed[0] = getgametype();
    scripts/mp/gameobjects::main(allowed);
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
    level.teambased = 1;
    level.disablespawncamera = 1;
    level.ignoregulagredeploysplash = 1;
    scripts/mp/gametypes/br_gametypes::init();
    scripts/mp/gametypes/br_gametypes::disablefeature("kiosk");
    scripts/mp/gametypes/br_gametypes::disablefeature("armor");
    scripts/mp/gametypes/br_gametypes::disablefeature("missions");
    scripts/mp/gametypes/br_gametypes::disablefeature("loot");
    scripts/mp/gametypes/br_gametypes::disablefeature("dropbag");
    scripts/mp/gametypes/br_gametypes::disablefeature("weapons");
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
    if (getdvarint(@"hash_666591e03aeed927", 0) == 1) {
        level.var_4e353dc2c64b19b1 = 1;
        level.modespawnclient = &function_68bc8caeffea7a83;
        level.var_a7f81dfdc88e53e6 = 1;
        scripts/mp/gametypes/br_gametypes::disablefeature("circle");
    }
    game["dialog"]["gametype"] = "gametype_tdm";
    game["dialog"]["boost"] = "boost_tdm";
    game["dialog"]["offense_obj"] = "boost_tdm";
    game["dialog"]["defense_obj"] = "boost_tdm";
    level scripts/cp_mp/parachute::initparachutedvars();
    thread scripts/mp/gametypes/br_c130airdrop::init();
    if (matchmakinggame()) {
        level.shouldgamelobbyremainintact = &shouldgamelobbyremainintact;
    }
    namespace_2c19af30dc7a566c::pause();
    namespace_2c19af30dc7a566c::function_4a18dd73a966821e(4);
    namespace_2c19af30dc7a566c::function_6cce72ce8bb6af87(["allies", "axis", "team_three", "team_four", "team_five"]);
    scripts/mp/gametypes/br_vehicles::brvehiclesinit();
    level.var_152d5a9c5ac5cdad = getdvarfloat(@"hash_ba9e8fbf0254be1e", 0.857);
    level.var_aa1aaed4a9b80d4b = getdvarint(@"hash_3196e3743c6871b2", 3);
}

// Namespace brtdm / scripts/mp/gametypes/brtdm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9f8
// Size: 0x38
function initializematchrules() {
    setcommonrulesfrommatchrulesdata();
    setdynamicdvar(@"hash_6e7da31aae47b8e0", 0);
    registerhalftimedvar(getgametype(), 0);
    setdynamicdvar(@"hash_bb6e8f8d9be104f4", 0);
}

// Namespace brtdm / scripts/mp/gametypes/brtdm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa37
// Size: 0x15b
function onstartgametype() {
    setclientnamemode("auto_change");
    scripts/mp/gametypes/br_pickups::br_pickups_init();
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
    registersharedfunc("vehicle_compass", "shouldBeVisibleToPlayer", &vehicle_compass_br_shouldbevisibletoplayer);
    initcircledata();
    initspawns();
    /#
        level thread function_14d9ef66ff3c55fe();
        level thread function_4e89ea3291f12198();
        level thread function_3fe54271a36d4f0d();
    #/
    scripts/mp/gametypes/bradley_spawner::inittankspawns();
    level thread scripts/mp/gametypes/br_vehicles::brvehiclesonstartgametype();
    initvehicles();
    level thread initprematchc130();
}

// Namespace brtdm / scripts/mp/gametypes/brtdm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb99
// Size: 0x323
function updategametypedvars() {
    scripts/mp/gametypes/common::updatecommongametypedvars();
    setdvar(@"hash_de79e5c6b8a17221", getdvarint(@"hash_29a2aab7afd7a31a", 225));
    setdvar(@"hash_18e2dda6aaf07dc3", getdvarint(@"hash_6f3ca3679ac76b3c", 590));
    setdvar(@"hash_180a6f432cfb6644", getdvarint(@"hash_2cfd86efae0c680d", 225));
    setdvar(@"hash_5dfbfd642e45b4b2", getdvarint(@"hash_7f04d2bb2f5714a7", 590));
    level.autorespawnwaittime = getdvarint(@"hash_4beac336193a373d", 3);
    level.parachutedeploydelay = getdvarfloat(@"hash_12027360b079c1db", 0.5);
    level.brtdm_config = spawnstruct();
    level.brtdm_config.locale = getdvar(@"hash_7dcd947b5e9add11", "");
    applylocaledefaults();
    level.brtdm_config.circlecenter = getdvarvector(@"hash_1afadbbba931661", level.brtdm_config.locale_defaults[@"hash_1afadbbba931661"]);
    level.brtdm_config.circleradius = getdvarint(@"hash_9a25e652b393bfce", level.brtdm_config.locale_defaults[@"hash_9a25e652b393bfce"]);
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
    level.brtdm_config.spectatepoint.origin = getdvarvector(@"hash_4177165117bb5cab", level.brtdm_config.locale_defaults[@"hash_4177165117bb5cab"]);
    level.brtdm_config.spectatepoint.angles = getdvarvector(@"hash_25377000b8772425", level.brtdm_config.locale_defaults[@"hash_25377000b8772425"]);
}

// Namespace brtdm / scripts/mp/gametypes/brtdm
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xec3
// Size: 0x2b
function setlocaledefaultvalue(dvar, value) {
    level.brtdm_config.locale_defaults[dvar] = value;
}

// Namespace brtdm / scripts/mp/gametypes/brtdm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xef5
// Size: 0x3802
function applylocaledefaults() {
    level.brtdm_config.locale_defaults = [];
    setlocaledefaultvalue(@"hash_1afadbbba931661", (0, 0, 0));
    setlocaledefaultvalue(@"hash_9a25e652b393bfce", 10000);
    setlocaledefaultvalue(@"hash_745c9bab39ea32b6", 0);
    setlocaledefaultvalue(@"hash_1aeb7a215cb83ef1", 180);
    setlocaledefaultvalue(@"hash_1fe5744c6a2c50a7", 2500);
    setlocaledefaultvalue(@"hash_3c77d706ffd2c5cc", 2500);
    setlocaledefaultvalue(@"hash_b3655fcea6bd08d", 0);
    setlocaledefaultvalue(@"hash_b133ffcea455873", 30);
    setlocaledefaultvalue(@"hash_70a9803740aa086c", 0.9);
    setlocaledefaultvalue(@"hash_70858e374081ac7e", 0.99);
    setlocaledefaultvalue(@"hash_651c49187e1db2a1", 0);
    setlocaledefaultvalue(@"hash_4177165117bb5cab", (0, 0, 0));
    setlocaledefaultvalue(@"hash_25377000b8772425", (0, 0, 0));
    setlocaledefaultvalue(@"hash_adb05b8132ec13b", 0);
    setlocaledefaultvalue(@"hash_979cd905b422cd9d", (0, 0, 0));
    setlocaledefaultvalue(@"hash_ad4d63f12515684f", (0, 0, 0));
    setlocaledefaultvalue(@"hash_ba8a45c2f2e56b62", (0, 0, 0));
    setlocaledefaultvalue(@"hash_f2d88163a7692e9c", (0, 0, 0));
    setlocaledefaultvalue(@"hash_8026f711a428350a", (0, 0, 0));
    setlocaledefaultvalue(@"hash_9f71eff87c6b69c4", (0, 0, 0));
    setlocaledefaultvalue(@"hash_f9537f723768dcd7", (0, 0, 0));
    setlocaledefaultvalue(@"hash_1b42e78798ae8b6d", (0, 0, 0));
    setlocaledefaultvalue(@"hash_a3c8ab9f8f7cea34", (0, 0, 0));
    setlocaledefaultvalue(@"hash_3c75551769e244ca", (0, 0, 0));
    switch (level.brtdm_config.locale) {
    case #"hash_da04b46361bbb6a6":
        setlocaledefaultvalue(@"hash_1afadbbba931661", (51500, 3500, 0));
        setlocaledefaultvalue(@"hash_9a25e652b393bfce", 12000);
        setlocaledefaultvalue(@"hash_745c9bab39ea32b6", 238);
        setlocaledefaultvalue(@"hash_1aeb7a215cb83ef1", 67);
        setlocaledefaultvalue(@"hash_4177165117bb5cab", (48265, 2555, 1580));
        setlocaledefaultvalue(@"hash_25377000b8772425", (27, 12, 0));
        setlocaledefaultvalue(@"hash_979cd905b422cd9d", (53308, 6374, 100));
        setlocaledefaultvalue(@"hash_ad4d63f12515684f", (0, 155, 0));
        setlocaledefaultvalue(@"hash_979cd805b422cb6a", (52810, 6734, 100));
        setlocaledefaultvalue(@"hash_ad4d62f12515661c", (0, 250, 0));
        setlocaledefaultvalue(@"hash_979cd705b422c937", (49169, -478, 100));
        setlocaledefaultvalue(@"hash_ad4d65f125156cb5", (0, 72, 0));
        setlocaledefaultvalue(@"hash_979cd605b422c704", (49156, 1313, 100));
        setlocaledefaultvalue(@"hash_ad4d64f125156a82", (0, 60, 0));
        setlocaledefaultvalue(@"hash_8026f711a428350a", (52481, 5490, 0));
        setlocaledefaultvalue(@"hash_9f71eff87c6b69c4", (0, 247, 0));
        setlocaledefaultvalue(@"hash_8026f811a428373d", (49837, 1321, 0));
        setlocaledefaultvalue(@"hash_9f71f0f87c6b6bf7", (0, 26, 0));
        setlocaledefaultvalue(@"hash_ba8a45c2f2e56b62", (54585, 6990, 100));
        setlocaledefaultvalue(@"hash_f2d88163a7692e9c", (0, 323, 0));
        setlocaledefaultvalue(@"hash_ba8a46c2f2e56d95", (51816, 6727, 100));
        setlocaledefaultvalue(@"hash_f2d88263a76930cf", (0, 200, 0));
        setlocaledefaultvalue(@"hash_ba8a43c2f2e566fc", (49599, -109, 100));
        setlocaledefaultvalue(@"hash_f2d88363a7693302", (0, 333, 0));
        setlocaledefaultvalue(@"hash_ba8a44c2f2e5692f", (48721, 1557, 100));
        setlocaledefaultvalue(@"hash_f2d88463a7693535", (0, 131, 0));
        setlocaledefaultvalue(@"hash_f9537f723768dcd7", (53180, 7980, 100));
        setlocaledefaultvalue(@"hash_1b42e78798ae8b6d", (0, 255, 0));
        setlocaledefaultvalue(@"hash_f9537e723768daa4", (53767, 7455, 100));
        setlocaledefaultvalue(@"hash_1b42e68798ae893a", (0, 270, 0));
        setlocaledefaultvalue(@"hash_f95381723768e13d", (48642, -115, 100));
        setlocaledefaultvalue(@"hash_1b42e58798ae8707", (0, 23, 0));
        setlocaledefaultvalue(@"hash_f95380723768df0a", (50339, 559, 100));
        setlocaledefaultvalue(@"hash_1b42e48798ae84d4", (0, 58, 0));
        break;
    case #"hash_4cbd499903f3cda3":
        setlocaledefaultvalue(@"hash_1afadbbba931661", (783, 36394, 2700));
        setlocaledefaultvalue(@"hash_9a25e652b393bfce", 10500);
        setlocaledefaultvalue(@"hash_745c9bab39ea32b6", 117);
        setlocaledefaultvalue(@"hash_1aeb7a215cb83ef1", 346);
        setlocaledefaultvalue(@"hash_b133ffcea455873", 25);
        setlocaledefaultvalue(@"hash_651c49187e1db2a1", 1);
        setlocaledefaultvalue(@"hash_4177165117bb5cab", (8400, 33925, 4834));
        setlocaledefaultvalue(@"hash_25377000b8772425", (34, 104, 0));
        setlocaledefaultvalue(@"hash_979cd905b422cd9d", (571, 45632, 1500));
        setlocaledefaultvalue(@"hash_ad4d63f12515684f", (0, 223, 0));
        setlocaledefaultvalue(@"hash_979cd805b422cb6a", (-3332, 40505, 2140));
        setlocaledefaultvalue(@"hash_ad4d62f12515661c", (0, 253, 0));
        setlocaledefaultvalue(@"hash_8026f711a428350a", (-8780, 34027, 25));
        setlocaledefaultvalue(@"hash_9f71eff87c6b69c4", (0, 317, 0));
        setlocaledefaultvalue(@"hash_ba8a45c2f2e56b62", (-3948, 43505, 2329));
        setlocaledefaultvalue(@"hash_f2d88163a7692e9c", (0, 303, 0));
        setlocaledefaultvalue(@"hash_ba8a46c2f2e56d95", (-7129, 40319, 959));
        setlocaledefaultvalue(@"hash_f2d88263a76930cf", (0, 291, 0));
        setlocaledefaultvalue(@"hash_f9537f723768dcd7", (-3004, 43593, 2356));
        setlocaledefaultvalue(@"hash_1b42e78798ae8b6d", (0, 271, 0));
        setlocaledefaultvalue(@"hash_f9537e723768daa4", (588, 44667, 1495));
        setlocaledefaultvalue(@"hash_1b42e68798ae893a", (0, 323, 0));
        setlocaledefaultvalue(@"hash_979cd705b422c937", (10118, 36471, 1902));
        setlocaledefaultvalue(@"hash_ad4d65f125156cb5", (0, 141, 0));
        setlocaledefaultvalue(@"hash_979cd605b422c704", (9073, 32831, 1692));
        setlocaledefaultvalue(@"hash_ad4d64f125156a82", (0, 103, 0));
        setlocaledefaultvalue(@"hash_8026f811a428373d", (2617, 27523, 72));
        setlocaledefaultvalue(@"hash_9f71f0f87c6b6bf7", (0, 142, 0));
        setlocaledefaultvalue(@"hash_ba8a43c2f2e566fc", (5061, 30887, 425));
        setlocaledefaultvalue(@"hash_f2d88363a7693302", (0, 168, 0));
        setlocaledefaultvalue(@"hash_ba8a44c2f2e5692f", (9013, 37678, 1752));
        setlocaledefaultvalue(@"hash_f2d88463a7693535", (0, 194, 0));
        setlocaledefaultvalue(@"hash_f95381723768e13d", (7568, 33763, 1912));
        setlocaledefaultvalue(@"hash_1b42e58798ae8707", (0, 135, 0));
        setlocaledefaultvalue(@"hash_f95380723768df0a", (9777, 33387, 1700));
        setlocaledefaultvalue(@"hash_1b42e48798ae84d4", (0, 128, 0));
        setlocaledefaultvalue(@"hash_ba8a41c2f2e56296", (-699, 30843, -34));
        setlocaledefaultvalue(@"hash_f2d87d63a76925d0", (0, 147, 0));
        setlocaledefaultvalue(@"hash_ba8a42c2f2e564c9", (-4770, 30535, -219));
        setlocaledefaultvalue(@"hash_f2d87e63a7692803", (0, 343, 0));
        break;
    case #"hash_928e7733339a3d9d":
        setlocaledefaultvalue(@"hash_1afadbbba931661", (40225, -30954, -100));
        setlocaledefaultvalue(@"hash_9a25e652b393bfce", 10250);
        setlocaledefaultvalue(@"hash_745c9bab39ea32b6", 216);
        setlocaledefaultvalue(@"hash_1aeb7a215cb83ef1", 55);
        setlocaledefaultvalue(@"hash_1fe5744c6a2c50a7", 2000);
        setlocaledefaultvalue(@"hash_3c77d706ffd2c5cc", 2000);
        setlocaledefaultvalue(@"hash_b133ffcea455873", 15);
        setlocaledefaultvalue(@"hash_70858e374081ac7e", 0.95);
        setlocaledefaultvalue(@"hash_4177165117bb5cab", (38843, -39882, -25));
        setlocaledefaultvalue(@"hash_25377000b8772425", (1, 43, 0));
        setlocaledefaultvalue(@"hash_ad4d63f12515684f", (0, 88, 0));
        setlocaledefaultvalue(@"hash_979cd805b422cb6a", (34474, -38278, -483));
        setlocaledefaultvalue(@"hash_ad4d62f12515661c", (0, 330, 0));
        setlocaledefaultvalue(@"hash_979cd705b422c937", (32135, -34379, -449));
        setlocaledefaultvalue(@"hash_ad4d65f125156cb5", (0, 105, 0));
        setlocaledefaultvalue(@"hash_f9537f723768dcd7", (34938, -35005, -350));
        setlocaledefaultvalue(@"hash_1b42e78798ae8b6d", (0, 358, 0));
        setlocaledefaultvalue(@"hash_f9537e723768daa4", (35742, -39576, -519));
        setlocaledefaultvalue(@"hash_1b42e68798ae893a", (0, 31, 0));
        setlocaledefaultvalue(@"hash_ba8a45c2f2e56b62", (31217, -33896, -506));
        setlocaledefaultvalue(@"hash_f2d88163a7692e9c", (0, 88, 0));
        setlocaledefaultvalue(@"hash_ba8a46c2f2e56d95", (31178, -31874, -507));
        setlocaledefaultvalue(@"hash_f2d88263a76930cf", (0, 36, 0));
        setlocaledefaultvalue(@"hash_979cd605b422c704", (46648, -25226, -369));
        setlocaledefaultvalue(@"hash_ad4d64f125156a82", (0, 228, 0));
        setlocaledefaultvalue(@"hash_979cd505b422c4d1", (44233, -24413, -374));
        setlocaledefaultvalue(@"hash_ad4d5ff125155f83", (0, 263, 0));
        setlocaledefaultvalue(@"hash_979cd405b422c29e", (42296, -23065, -382));
        setlocaledefaultvalue(@"hash_ad4d5ef125155d50", (0, 195, 0));
        setlocaledefaultvalue(@"hash_8026f711a428350a", (42507, -24819, -441));
        setlocaledefaultvalue(@"hash_9f71eff87c6b69c4", (0, 246, 0));
        setlocaledefaultvalue(@"hash_f95381723768e13d", (40389, -22449, -505));
        setlocaledefaultvalue(@"hash_1b42e58798ae8707", (0, 216, 0));
        setlocaledefaultvalue(@"hash_f95380723768df0a", (40090, -24011, -500));
        setlocaledefaultvalue(@"hash_1b42e48798ae84d4", (0, 197, 0));
        setlocaledefaultvalue(@"hash_f9537b723768d40b", (46988, -24370, -337));
        setlocaledefaultvalue(@"hash_1b42e38798ae82a1", (0, 252, 0));
        setlocaledefaultvalue(@"hash_ba8a43c2f2e566fc", (45277, -29397, 202));
        setlocaledefaultvalue(@"hash_f2d88363a7693302", (0, 199, 0));
        setlocaledefaultvalue(@"hash_ba8a44c2f2e5692f", (40374, -24937, -507));
        setlocaledefaultvalue(@"hash_f2d88463a7693535", (0, 284, 0));
        setlocaledefaultvalue(@"hash_a3c8ab9f8f7cea34", (46500, -24005, -180));
        setlocaledefaultvalue(@"hash_3c75551769e244ca", (0, 245, 0));
        break;
    case #"hash_dcffa2d78be56a76":
        setlocaledefaultvalue(@"hash_1afadbbba931661", (20548, -30577, 0));
        setlocaledefaultvalue(@"hash_9a25e652b393bfce", 10000);
        setlocaledefaultvalue(@"hash_745c9bab39ea32b6", 83);
        setlocaledefaultvalue(@"hash_1aeb7a215cb83ef1", 224);
        setlocaledefaultvalue(@"hash_1fe5744c6a2c50a7", 1500);
        setlocaledefaultvalue(@"hash_3c77d706ffd2c5cc", 1500);
        setlocaledefaultvalue(@"hash_b133ffcea455873", 15);
        setlocaledefaultvalue(@"hash_70a9803740aa086c", 0.65);
        setlocaledefaultvalue(@"hash_70858e374081ac7e", 0.75);
        setlocaledefaultvalue(@"hash_651c49187e1db2a1", 1);
        setlocaledefaultvalue(@"hash_4177165117bb5cab", (17027, -35357, 1505));
        setlocaledefaultvalue(@"hash_25377000b8772425", (21, 63, 0));
        setlocaledefaultvalue(@"hash_979cd905b422cd9d", (21764, -24164, -142));
        setlocaledefaultvalue(@"hash_ad4d63f12515684f", (0, 174, 0));
        setlocaledefaultvalue(@"hash_979cd805b422cb6a", (19780, -21087, -78));
        setlocaledefaultvalue(@"hash_ad4d62f12515661c", (0, 212, 0));
        setlocaledefaultvalue(@"hash_8026f711a428350a", (21514, -23467, -131));
        setlocaledefaultvalue(@"hash_9f71eff87c6b69c4", (0, 225, 0));
        setlocaledefaultvalue(@"hash_ba8a45c2f2e56b62", (21033, -22870, -174));
        setlocaledefaultvalue(@"hash_f2d88163a7692e9c", (0, 223, 0));
        setlocaledefaultvalue(@"hash_ba8a46c2f2e56d95", (24268, -23630, -134));
        setlocaledefaultvalue(@"hash_f2d88263a76930cf", (0, 277, 0));
        setlocaledefaultvalue(@"hash_f9537f723768dcd7", (19014, -23313, -181));
        setlocaledefaultvalue(@"hash_1b42e78798ae8b6d", (0, 138, 0));
        setlocaledefaultvalue(@"hash_f9537e723768daa4", (27090, -24785, -334));
        setlocaledefaultvalue(@"hash_1b42e68798ae893a", (0, 267, 0));
        setlocaledefaultvalue(@"hash_979cd705b422c937", (16600, -34006, 378));
        setlocaledefaultvalue(@"hash_ad4d65f125156cb5", (0, 37, 0));
        setlocaledefaultvalue(@"hash_979cd605b422c704", (19450, -35595, -350));
        setlocaledefaultvalue(@"hash_ad4d64f125156a82", (0, 7, 0));
        setlocaledefaultvalue(@"hash_8026f811a428373d", (13998, -33209, -183));
        setlocaledefaultvalue(@"hash_9f71f0f87c6b6bf7", (0, 88, 0));
        setlocaledefaultvalue(@"hash_ba8a43c2f2e566fc", (14357, -33952, -198));
        setlocaledefaultvalue(@"hash_f2d88363a7693302", (0, 91, 0));
        setlocaledefaultvalue(@"hash_ba8a44c2f2e5692f", (16839, -32558, 76));
        setlocaledefaultvalue(@"hash_f2d88463a7693535", (0, 86, 0));
        setlocaledefaultvalue(@"hash_f95381723768e13d", (17902, -37318, -312));
        setlocaledefaultvalue(@"hash_1b42e58798ae8707", (0, 14, 0));
        setlocaledefaultvalue(@"hash_f95380723768df0a", (18828, -34025, 75));
        setlocaledefaultvalue(@"hash_1b42e48798ae84d4", (0, 15, 0));
        setlocaledefaultvalue(@"hash_f9537b723768d40b", (17563, -32733, 75));
        setlocaledefaultvalue(@"hash_1b42e38798ae82a1", (0, 58, 0));
        setlocaledefaultvalue(@"hash_a3c8ac9f8f7cec67", (15583, -36396, 500));
        setlocaledefaultvalue(@"hash_3c75561769e246fd", (0, 71, 0));
        setlocaledefaultvalue(@"hash_f9537a723768d1d8", (19482, -27539, -210));
        setlocaledefaultvalue(@"hash_1b42e28798ae806e", (0, 335, 0));
        setlocaledefaultvalue(@"hash_f9537d723768d871", (19072, -30488, -208));
        setlocaledefaultvalue(@"hash_1b42e08798ae7c08", (0, 33, 0));
        break;
    case #"hash_1d70ac83665cd7":
        setlocaledefaultvalue(@"hash_1afadbbba931661", (3381, -6288, 750));
        setlocaledefaultvalue(@"hash_9a25e652b393bfce", 10000);
        setlocaledefaultvalue(@"hash_745c9bab39ea32b6", 64);
        setlocaledefaultvalue(@"hash_1aeb7a215cb83ef1", 234);
        setlocaledefaultvalue(@"hash_1fe5744c6a2c50a7", 3000);
        setlocaledefaultvalue(@"hash_b133ffcea455873", 20);
        setlocaledefaultvalue(@"hash_4177165117bb5cab", (-384, -14886, 2237));
        setlocaledefaultvalue(@"hash_25377000b8772425", (19, 54, 0));
        setlocaledefaultvalue(@"hash_979cd905b422cd9d", (7968, 1753, 164));
        setlocaledefaultvalue(@"hash_ad4d63f12515684f", (0, 328, 0));
        setlocaledefaultvalue(@"hash_979cd805b422cb6a", (5668, 2760, -514));
        setlocaledefaultvalue(@"hash_ad4d62f12515661c", (0, 172, 0));
        setlocaledefaultvalue(@"hash_8026f711a428350a", (4071, 2010, -450));
        setlocaledefaultvalue(@"hash_9f71eff87c6b69c4", (0, 250, 0));
        setlocaledefaultvalue(@"hash_ba8a45c2f2e56b62", (10647, -2434, -256));
        setlocaledefaultvalue(@"hash_f2d88163a7692e9c", (0, 355, 0));
        setlocaledefaultvalue(@"hash_ba8a46c2f2e56d95", (2658, 2352, -392));
        setlocaledefaultvalue(@"hash_f2d88263a76930cf", (0, 192, 0));
        setlocaledefaultvalue(@"hash_f9537f723768dcd7", (4700, 1713, -510));
        setlocaledefaultvalue(@"hash_1b42e78798ae8b6d", (0, 269, 0));
        setlocaledefaultvalue(@"hash_f9537e723768daa4", (9716, 596, -235));
        setlocaledefaultvalue(@"hash_1b42e68798ae893a", (0, 268, 0));
        setlocaledefaultvalue(@"hash_979cd705b422c937", (-4398, -11073, -150));
        setlocaledefaultvalue(@"hash_ad4d65f125156cb5", (0, 58, 0));
        setlocaledefaultvalue(@"hash_979cd605b422c704", (1755, -15241, -223));
        setlocaledefaultvalue(@"hash_ad4d64f125156a82", (0, 12, 0));
        setlocaledefaultvalue(@"hash_8026f811a428373d", (-5265, -8379, -430));
        setlocaledefaultvalue(@"hash_9f71f0f87c6b6bf7", (0, 18, 0));
        setlocaledefaultvalue(@"hash_ba8a43c2f2e566fc", (4103, -13423, -229));
        setlocaledefaultvalue(@"hash_f2d88363a7693302", (0, 110, 0));
        setlocaledefaultvalue(@"hash_ba8a44c2f2e5692f", (6098, -13238, -228));
        setlocaledefaultvalue(@"hash_f2d88463a7693535", (0, 85, 0));
        setlocaledefaultvalue(@"hash_f95381723768e13d", (-2860, -9972, 109));
        setlocaledefaultvalue(@"hash_1b42e58798ae8707", (0, 120, 0));
        setlocaledefaultvalue(@"hash_f95380723768df0a", (-4575, -6185, -330));
        setlocaledefaultvalue(@"hash_1b42e48798ae84d4", (0, 321, 0));
        setlocaledefaultvalue(@"hash_a3c8ab9f8f7cea34", (-4760, -2885, 750));
        setlocaledefaultvalue(@"hash_3c75551769e244ca", (0, 360, 0));
        break;
    case #"hash_e7c353a7633e101c":
        setlocaledefaultvalue(@"hash_1afadbbba931661", (3995, -22767, 0));
        setlocaledefaultvalue(@"hash_9a25e652b393bfce", 8000);
        setlocaledefaultvalue(@"hash_745c9bab39ea32b6", 11);
        setlocaledefaultvalue(@"hash_1aeb7a215cb83ef1", 171);
        setlocaledefaultvalue(@"hash_4177165117bb5cab", (-2763, -18250, 2498));
        setlocaledefaultvalue(@"hash_25377000b8772425", (32, 309, 0));
        setlocaledefaultvalue(@"hash_979cd905b422cd9d", (11226, -22558, -150));
        setlocaledefaultvalue(@"hash_ad4d63f12515684f", (0, 103, 0));
        setlocaledefaultvalue(@"hash_979cd805b422cb6a", (9301, -19445, -226));
        setlocaledefaultvalue(@"hash_ad4d62f12515661c", (0, 191, 0));
        setlocaledefaultvalue(@"hash_8026f711a428350a", (9728, -21523, -235));
        setlocaledefaultvalue(@"hash_9f71eff87c6b69c4", (0, 193, 0));
        setlocaledefaultvalue(@"hash_ba8a45c2f2e56b62", (9504, -25962, -228));
        setlocaledefaultvalue(@"hash_f2d88163a7692e9c", (0, 130, 0));
        setlocaledefaultvalue(@"hash_ba8a46c2f2e56d95", (8586, -19265, -228));
        setlocaledefaultvalue(@"hash_f2d88263a76930cf", (0, 173, 0));
        setlocaledefaultvalue(@"hash_f9537f723768dcd7", (4201, -29392, -60));
        setlocaledefaultvalue(@"hash_1b42e78798ae8b6d", (0, 199, 0));
        setlocaledefaultvalue(@"hash_f9537e723768daa4", (7613, -27816, -92));
        setlocaledefaultvalue(@"hash_1b42e68798ae893a", (0, 140, 0));
        setlocaledefaultvalue(@"hash_979cd705b422c937", (-2062, -19315, -228));
        setlocaledefaultvalue(@"hash_ad4d65f125156cb5", (0, 87, 0));
        setlocaledefaultvalue(@"hash_979cd605b422c704", (-2783, -26033, -74));
        setlocaledefaultvalue(@"hash_ad4d64f125156a82", (0, 347, 0));
        setlocaledefaultvalue(@"hash_8026f811a428373d", (-2419, -23019, -230));
        setlocaledefaultvalue(@"hash_9f71f0f87c6b6bf7", (0, 357, 0));
        setlocaledefaultvalue(@"hash_ba8a43c2f2e566fc", (-1356, -20139, -228));
        setlocaledefaultvalue(@"hash_f2d88363a7693302", (0, 250, 0));
        setlocaledefaultvalue(@"hash_ba8a44c2f2e5692f", (-1413, -25619, -225));
        setlocaledefaultvalue(@"hash_f2d88463a7693535", (0, 36, 0));
        setlocaledefaultvalue(@"hash_f95381723768e13d", (-1456, -26500, -134));
        setlocaledefaultvalue(@"hash_1b42e58798ae8707", (0, 345, 0));
        setlocaledefaultvalue(@"hash_f95380723768df0a", (-91, -18495, -228));
        setlocaledefaultvalue(@"hash_1b42e48798ae84d4", (0, 323, 0));
        break;
    case #"hash_ae810f469f12c03b":
        setlocaledefaultvalue(@"hash_1afadbbba931661", (-9500, -36128, 0));
        setlocaledefaultvalue(@"hash_9a25e652b393bfce", 11500);
        setlocaledefaultvalue(@"hash_745c9bab39ea32b6", 40);
        setlocaledefaultvalue(@"hash_1aeb7a215cb83ef1", 156);
        setlocaledefaultvalue(@"hash_b133ffcea455873", 25);
        setlocaledefaultvalue(@"hash_4177165117bb5cab", (-6862, -28777, 2602));
        setlocaledefaultvalue(@"hash_25377000b8772425", (39, 323, 0));
        setlocaledefaultvalue(@"hash_979cd905b422cd9d", (-2042, -37869, 763));
        setlocaledefaultvalue(@"hash_ad4d63f12515684f", (0, 168, 0));
        setlocaledefaultvalue(@"hash_979cd805b422cb6a", (-3384, -27953, 345));
        setlocaledefaultvalue(@"hash_ad4d62f12515661c", (0, 218, 0));
        setlocaledefaultvalue(@"hash_8026f711a428350a", (-1681, -32452, 99));
        setlocaledefaultvalue(@"hash_9f71eff87c6b69c4", (0, 219, 0));
        setlocaledefaultvalue(@"hash_ba8a45c2f2e56b62", (-4163, -29770, 337));
        setlocaledefaultvalue(@"hash_f2d88163a7692e9c", (0, 203, 0));
        setlocaledefaultvalue(@"hash_ba8a46c2f2e56d95", (-3076, -28450, 345));
        setlocaledefaultvalue(@"hash_f2d88263a76930cf", (0, 149, 0));
        setlocaledefaultvalue(@"hash_f9537f723768dcd7", (-4725, -38714, 669));
        setlocaledefaultvalue(@"hash_1b42e78798ae8b6d", (0, 263, 0));
        setlocaledefaultvalue(@"hash_f9537e723768daa4", (-5249, -27281, 98));
        setlocaledefaultvalue(@"hash_1b42e68798ae893a", (0, 174, 0));
        setlocaledefaultvalue(@"hash_979cd705b422c937", (-17139, -33568, 306));
        setlocaledefaultvalue(@"hash_ad4d65f125156cb5", (0, 7, 0));
        setlocaledefaultvalue(@"hash_979cd605b422c704", (-16560, -28505, 120));
        setlocaledefaultvalue(@"hash_ad4d64f125156a82", (0, 35, 0));
        setlocaledefaultvalue(@"hash_8026f811a428373d", (-16037, -32024, 277));
        setlocaledefaultvalue(@"hash_9f71f0f87c6b6bf7", (0, 314, 0));
        setlocaledefaultvalue(@"hash_ba8a43c2f2e566fc", (-18517, -36246, 572));
        setlocaledefaultvalue(@"hash_f2d88363a7693302", (0, 350, 0));
        setlocaledefaultvalue(@"hash_ba8a44c2f2e5692f", (-14810, -41243, 575));
        setlocaledefaultvalue(@"hash_f2d88463a7693535", (0, 67, 0));
        setlocaledefaultvalue(@"hash_f95381723768e13d", (-18733, -34650, 345));
        setlocaledefaultvalue(@"hash_1b42e58798ae8707", (0, 359, 0));
        setlocaledefaultvalue(@"hash_f95380723768df0a", (-15813, -31002, 281));
        setlocaledefaultvalue(@"hash_1b42e48798ae84d4", (0, 58, 0));
        break;
    case #"hash_5cfdd14ee0daa46":
        setlocaledefaultvalue(@"hash_1afadbbba931661", (-25639, 7915, 0));
        setlocaledefaultvalue(@"hash_9a25e652b393bfce", 9000);
        setlocaledefaultvalue(@"hash_745c9bab39ea32b6", 65);
        setlocaledefaultvalue(@"hash_1aeb7a215cb83ef1", 250);
        setlocaledefaultvalue(@"hash_4177165117bb5cab", (-28789, 3796, 279));
        setlocaledefaultvalue(@"hash_25377000b8772425", (15, 48, 0));
        setlocaledefaultvalue(@"hash_979cd905b422cd9d", (-28176, 13758, -520));
        setlocaledefaultvalue(@"hash_ad4d63f12515684f", (0, 178, 0));
        setlocaledefaultvalue(@"hash_979cd805b422cb6a", (-19765, 13864, -257));
        setlocaledefaultvalue(@"hash_ad4d62f12515661c", (0, 290, 0));
        setlocaledefaultvalue(@"hash_8026f711a428350a", (-25942, 14835, -267));
        setlocaledefaultvalue(@"hash_9f71eff87c6b69c4", (0, 270, 0));
        setlocaledefaultvalue(@"hash_ba8a45c2f2e56b62", (-22269, 13624, -259));
        setlocaledefaultvalue(@"hash_f2d88163a7692e9c", (0, 243, 0));
        setlocaledefaultvalue(@"hash_ba8a46c2f2e56d95", (-29275, 12892, -246));
        setlocaledefaultvalue(@"hash_f2d88263a76930cf", (0, 198, 0));
        setlocaledefaultvalue(@"hash_f9537f723768dcd7", (-25599, 14007, -622));
        setlocaledefaultvalue(@"hash_1b42e78798ae8b6d", (0, 272, 0));
        setlocaledefaultvalue(@"hash_f9537e723768daa4", (-20449, 13593, -258));
        setlocaledefaultvalue(@"hash_1b42e68798ae893a", (0, 357, 0));
        setlocaledefaultvalue(@"hash_979cd705b422c937", (-24803, 1040, -259));
        setlocaledefaultvalue(@"hash_ad4d65f125156cb5", (0, 48, 0));
        setlocaledefaultvalue(@"hash_979cd605b422c704", (-31106, 2103, -240));
        setlocaledefaultvalue(@"hash_ad4d64f125156a82", (0, 109, 0));
        setlocaledefaultvalue(@"hash_8026f811a428373d", (-21457, 1579, -256));
        setlocaledefaultvalue(@"hash_9f71f0f87c6b6bf7", (0, 90, 0));
        setlocaledefaultvalue(@"hash_ba8a43c2f2e566fc", (-31346, 3447, -228));
        setlocaledefaultvalue(@"hash_f2d88363a7693302", (0, 176, 0));
        setlocaledefaultvalue(@"hash_ba8a44c2f2e5692f", (-22954, 2747, -151));
        setlocaledefaultvalue(@"hash_f2d88463a7693535", (0, 90, 0));
        setlocaledefaultvalue(@"hash_f95381723768e13d", (-24697, 3934, -256));
        setlocaledefaultvalue(@"hash_1b42e58798ae8707", (0, 357, 0));
        setlocaledefaultvalue(@"hash_f95380723768df0a", (-27133, 1184, -252));
        setlocaledefaultvalue(@"hash_1b42e48798ae84d4", (0, 351, 0));
        break;
    case #"hash_c05282737bd2fbb9":
        setlocaledefaultvalue(@"hash_1afadbbba931661", (-25973, 7847, 0));
        setlocaledefaultvalue(@"hash_9a25e652b393bfce", 4400);
        setlocaledefaultvalue(@"hash_745c9bab39ea32b6", 90);
        setlocaledefaultvalue(@"hash_1aeb7a215cb83ef1", 270);
        setlocaledefaultvalue(@"hash_1fe5744c6a2c50a7", 1250);
        setlocaledefaultvalue(@"hash_3c77d706ffd2c5cc", 1250);
        setlocaledefaultvalue(@"hash_4177165117bb5cab", (-27896, 3953, 571));
        setlocaledefaultvalue(@"hash_25377000b8772425", (21, 59, 0));
        setlocaledefaultvalue(@"hash_adb05b8132ec13b", 1);
        break;
    case #"hash_f48a166c03bb39c1":
        setlocaledefaultvalue(@"hash_1afadbbba931661", (-20452, 43152, 5000));
        setlocaledefaultvalue(@"hash_9a25e652b393bfce", 12000);
        setlocaledefaultvalue(@"hash_745c9bab39ea32b6", 204);
        setlocaledefaultvalue(@"hash_1aeb7a215cb83ef1", 11);
        setlocaledefaultvalue(@"hash_4177165117bb5cab", (-19516, 36814, -422));
        setlocaledefaultvalue(@"hash_25377000b8772425", (357, 100, 0));
        setlocaledefaultvalue(@"hash_979cd905b422cd9d", (-17241, 31978, -160));
        setlocaledefaultvalue(@"hash_ad4d63f12515684f", (0, 78, 0));
        setlocaledefaultvalue(@"hash_979cd805b422cb6a", (-28316, 45020, 2750));
        setlocaledefaultvalue(@"hash_ad4d62f12515661c", (0, 107, 0));
        setlocaledefaultvalue(@"hash_8026f711a428350a", (-24699, 36333, 390));
        setlocaledefaultvalue(@"hash_9f71eff87c6b69c4", (0, 55, 0));
        setlocaledefaultvalue(@"hash_ba8a45c2f2e56b62", (-23725, 35187, 310));
        setlocaledefaultvalue(@"hash_f2d88163a7692e9c", (0, 327, 0));
        setlocaledefaultvalue(@"hash_ba8a46c2f2e56d95", (-15420, 32642, -170));
        setlocaledefaultvalue(@"hash_f2d88263a76930cf", (0, 149, 0));
        setlocaledefaultvalue(@"hash_f9537f723768dcd7", (-29762, 42138, 2660));
        setlocaledefaultvalue(@"hash_1b42e78798ae8b6d", (0, 83, 0));
        setlocaledefaultvalue(@"hash_f9537e723768daa4", (-22650, 31751, -75));
        setlocaledefaultvalue(@"hash_1b42e68798ae893a", (0, 64, 0));
        setlocaledefaultvalue(@"hash_a3c8ab9f8f7cea34", (-25554, 36568, 475));
        setlocaledefaultvalue(@"hash_3c75551769e244ca", (0, 336, 0));
        setlocaledefaultvalue(@"hash_979cd705b422c937", (-16037, 51673, 2750));
        setlocaledefaultvalue(@"hash_ad4d65f125156cb5", (0, 180, 0));
        setlocaledefaultvalue(@"hash_979cd605b422c704", (-9893, 39929, 775));
        setlocaledefaultvalue(@"hash_ad4d64f125156a82", (0, 182, 0));
        setlocaledefaultvalue(@"hash_8026f811a428373d", (-12436, 46957, 1845));
        setlocaledefaultvalue(@"hash_9f71f0f87c6b6bf7", (0, 36, 0));
        setlocaledefaultvalue(@"hash_ba8a43c2f2e566fc", (-10316, 39418, 788));
        setlocaledefaultvalue(@"hash_f2d88363a7693302", (0, 76, 0));
        setlocaledefaultvalue(@"hash_ba8a44c2f2e5692f", (-17210, 52283, 2800));
        setlocaledefaultvalue(@"hash_f2d88463a7693535", (0, 215, 0));
        setlocaledefaultvalue(@"hash_f95381723768e13d", (-12629, 47575, 1895));
        setlocaledefaultvalue(@"hash_1b42e58798ae8707", (0, 332, 0));
        setlocaledefaultvalue(@"hash_f95380723768df0a", (-12104, 37484, 70));
        setlocaledefaultvalue(@"hash_1b42e48798ae84d4", (0, 122, 0));
        setlocaledefaultvalue(@"hash_a3c8ac9f8f7cec67", (-13447, 46437, 1900));
        setlocaledefaultvalue(@"hash_3c75561769e246fd", (0, 206, 0));
        setlocaledefaultvalue(@"hash_a3c8ad9f8f7cee9a", (-24476, 43361, 660));
        setlocaledefaultvalue(@"hash_3c75531769e24064", (0, 298, 0));
        setlocaledefaultvalue(@"hash_f9537b723768d40b", (-23603, 44704, 160));
        setlocaledefaultvalue(@"hash_1b42e38798ae82a1", (0, 10, 0));
        setlocaledefaultvalue(@"hash_ba8a41c2f2e56296", (-25505, 43962, 154));
        setlocaledefaultvalue(@"hash_f2d87d63a76925d0", (0, 233, 0));
        setlocaledefaultvalue(@"hash_ba8a42c2f2e564c9", (-17379, 43475, -470));
        setlocaledefaultvalue(@"hash_f2d87e63a7692803", (0, 298, 0));
        break;
    case #"hash_cfd1886f226cbfab":
        setlocaledefaultvalue(@"hash_1afadbbba931661", (5872, 50100, 0));
        setlocaledefaultvalue(@"hash_9a25e652b393bfce", 10000);
        setlocaledefaultvalue(@"hash_745c9bab39ea32b6", 136);
        setlocaledefaultvalue(@"hash_1aeb7a215cb83ef1", 297);
        setlocaledefaultvalue(@"hash_4177165117bb5cab", (9131, 54369, 1406));
        setlocaledefaultvalue(@"hash_25377000b8772425", (11, 240, 0));
        setlocaledefaultvalue(@"hash_979cd905b422cd9d", (2545, 58630, 762));
        setlocaledefaultvalue(@"hash_ad4d63f12515684f", (0, 323, 0));
        setlocaledefaultvalue(@"hash_979cd805b422cb6a", (1443, 55766, 1083));
        setlocaledefaultvalue(@"hash_ad4d62f12515661c", (0, 261, 0));
        setlocaledefaultvalue(@"hash_8026f711a428350a", (-991, 53487, 1101));
        setlocaledefaultvalue(@"hash_9f71eff87c6b69c4", (0, 313, 0));
        setlocaledefaultvalue(@"hash_ba8a45c2f2e56b62", (4966, 57483, 1092));
        setlocaledefaultvalue(@"hash_f2d88163a7692e9c", (0, 314, 0));
        setlocaledefaultvalue(@"hash_ba8a46c2f2e56d95", (1123, 57730, 753));
        setlocaledefaultvalue(@"hash_f2d88263a76930cf", (0, 276, 0));
        setlocaledefaultvalue(@"hash_f9537f723768dcd7", (-2161, 54088, 986));
        setlocaledefaultvalue(@"hash_1b42e78798ae8b6d", (0, 357, 0));
        setlocaledefaultvalue(@"hash_f9537e723768daa4", (3129, 53312, 1076));
        setlocaledefaultvalue(@"hash_1b42e68798ae893a", (0, 357, 0));
        setlocaledefaultvalue(@"hash_979cd705b422c937", (9361, 43795, 1542));
        setlocaledefaultvalue(@"hash_ad4d65f125156cb5", (0, 105, 0));
        setlocaledefaultvalue(@"hash_979cd605b422c704", (11464, 44385, 1376));
        setlocaledefaultvalue(@"hash_ad4d64f125156a82", (0, 103, 0));
        setlocaledefaultvalue(@"hash_8026f811a428373d", (11606, 45427, 1127));
        setlocaledefaultvalue(@"hash_9f71f0f87c6b6bf7", (0, 134, 0));
        setlocaledefaultvalue(@"hash_ba8a43c2f2e566fc", (5657, 45721, 1205));
        setlocaledefaultvalue(@"hash_f2d88363a7693302", (0, 45, 0));
        setlocaledefaultvalue(@"hash_ba8a44c2f2e5692f", (2119, 44324, 1494));
        setlocaledefaultvalue(@"hash_f2d88463a7693535", (0, 221, 0));
        setlocaledefaultvalue(@"hash_f95381723768e13d", (12290, 46715, 1089));
        setlocaledefaultvalue(@"hash_1b42e58798ae8707", (0, 78, 0));
        setlocaledefaultvalue(@"hash_f95380723768df0a", (4415, 46102, 1221));
        setlocaledefaultvalue(@"hash_1b42e48798ae84d4", (0, 133, 0));
        setlocaledefaultvalue(@"hash_a3c8ab9f8f7cea34", (2150, 46000, 1600));
        setlocaledefaultvalue(@"hash_3c75551769e244ca", (0, 42, 0));
        setlocaledefaultvalue(@"hash_a3c8ac9f8f7cec67", (12276, 48974, 1200));
        setlocaledefaultvalue(@"hash_3c75561769e246fd", (0, 132, 0));
        break;
    case #"hash_21749bc997bc8dca":
        setlocaledefaultvalue(@"hash_1afadbbba931661", (42455, 16503, 0));
        setlocaledefaultvalue(@"hash_9a25e652b393bfce", 10500);
        setlocaledefaultvalue(@"hash_745c9bab39ea32b6", 25);
        setlocaledefaultvalue(@"hash_1aeb7a215cb83ef1", 203);
        setlocaledefaultvalue(@"hash_b133ffcea455873", 35);
        setlocaledefaultvalue(@"hash_4177165117bb5cab", (39686, 15544, -120));
        setlocaledefaultvalue(@"hash_25377000b8772425", (12, 11, 0));
        setlocaledefaultvalue(@"hash_979cd905b422cd9d", (51614, 15518, 263));
        setlocaledefaultvalue(@"hash_ad4d63f12515684f", (0, 148, 0));
        setlocaledefaultvalue(@"hash_979cd805b422cb6a", (45811, 24263, -330));
        setlocaledefaultvalue(@"hash_ad4d62f12515661c", (0, 228, 0));
        setlocaledefaultvalue(@"hash_8026f711a428350a", (48137, 16713, -270));
        setlocaledefaultvalue(@"hash_9f71eff87c6b69c4", (0, 96, 0));
        setlocaledefaultvalue(@"hash_ba8a45c2f2e56b62", (44736, 17006, -305));
        setlocaledefaultvalue(@"hash_f2d88163a7692e9c", (0, 291, 0));
        setlocaledefaultvalue(@"hash_ba8a46c2f2e56d95", (44518, 13224, -310));
        setlocaledefaultvalue(@"hash_f2d88263a76930cf", (0, 155, 0));
        setlocaledefaultvalue(@"hash_f9537f723768dcd7", (49733, 18097, 15));
        setlocaledefaultvalue(@"hash_1b42e78798ae8b6d", (0, 153, 0));
        setlocaledefaultvalue(@"hash_f9537e723768daa4", (45970, 24954, -340));
        setlocaledefaultvalue(@"hash_1b42e68798ae893a", (0, 181, 0));
        setlocaledefaultvalue(@"hash_a3c8ab9f8f7cea34", (46588, 19953, 150));
        setlocaledefaultvalue(@"hash_3c75551769e244ca", (0, 295, 0));
        setlocaledefaultvalue(@"hash_979cd705b422c937", (34523, 19026, 313));
        setlocaledefaultvalue(@"hash_ad4d65f125156cb5", (0, 320, 0));
        setlocaledefaultvalue(@"hash_979cd605b422c704", (37466, 11429, 745));
        setlocaledefaultvalue(@"hash_ad4d64f125156a82", (0, 53, 0));
        setlocaledefaultvalue(@"hash_8026f811a428373d", (37558, 13535, 160));
        setlocaledefaultvalue(@"hash_9f71f0f87c6b6bf7", (0, 257, 0));
        setlocaledefaultvalue(@"hash_ba8a43c2f2e566fc", (38461, 15634, -205));
        setlocaledefaultvalue(@"hash_f2d88363a7693302", (0, 310, 0));
        setlocaledefaultvalue(@"hash_ba8a44c2f2e5692f", (38067, 20032, -170));
        setlocaledefaultvalue(@"hash_f2d88463a7693535", (0, 49, 0));
        setlocaledefaultvalue(@"hash_f95381723768e13d", (37354, 22300, 35));
        setlocaledefaultvalue(@"hash_1b42e58798ae8707", (0, 42, 0));
        setlocaledefaultvalue(@"hash_f95380723768df0a", (36457, 13677, 368));
        setlocaledefaultvalue(@"hash_1b42e48798ae84d4", (0, 335, 0));
        setlocaledefaultvalue(@"hash_a3c8ac9f8f7cec67", (37203, 13902, 340));
        setlocaledefaultvalue(@"hash_3c75561769e246fd", (0, 20, 0));
        setlocaledefaultvalue(@"hash_8026f511a42830a4", (40540, 15603, -302));
        setlocaledefaultvalue(@"hash_9f71f1f87c6b6e2a", (0, 25, 0));
        setlocaledefaultvalue(@"hash_8026f611a42832d7", (43693, 17090, -302));
        setlocaledefaultvalue(@"hash_9f71f2f87c6b705d", (0, 204, 0));
        setlocaledefaultvalue(@"hash_979cd505b422c4d1", (41479, 16080, -560));
        setlocaledefaultvalue(@"hash_ad4d5ff125155f83", (0, 82, 0));
        setlocaledefaultvalue(@"hash_979cd405b422c29e", (43042, 16740, -570));
        setlocaledefaultvalue(@"hash_ad4d5ef125155d50", (0, 266, 0));
        break;
    case #"hash_a86d6bdba8e7b140":
        setlocaledefaultvalue(@"hash_1afadbbba931661", (28681, 2318, 0));
        setlocaledefaultvalue(@"hash_9a25e652b393bfce", 8200);
        setlocaledefaultvalue(@"hash_745c9bab39ea32b6", 45);
        setlocaledefaultvalue(@"hash_1aeb7a215cb83ef1", 223);
        setlocaledefaultvalue(@"hash_b133ffcea455873", 40);
        setlocaledefaultvalue(@"hash_1fe5744c6a2c50a7", 1200);
        setlocaledefaultvalue(@"hash_3c77d706ffd2c5cc", 1200);
        setlocaledefaultvalue(@"hash_4177165117bb5cab", (31146, 7827, 6721));
        setlocaledefaultvalue(@"hash_25377000b8772425", (52, 243, 0));
        setlocaledefaultvalue(@"hash_979cd905b422cd9d", (33225, 7277, -452));
        setlocaledefaultvalue(@"hash_ad4d63f12515684f", (0, 172, 0));
        setlocaledefaultvalue(@"hash_979cd805b422cb6a", (29981, 6843, -540));
        setlocaledefaultvalue(@"hash_ad4d62f12515661c", (0, 353, 0));
        setlocaledefaultvalue(@"hash_ba8a45c2f2e56b62", (32595, 5128, -615));
        setlocaledefaultvalue(@"hash_f2d88163a7692e9c", (0, 312, 0));
        setlocaledefaultvalue(@"hash_ba8a46c2f2e56d95", (29427, 7834, -519));
        setlocaledefaultvalue(@"hash_f2d88263a76930cf", (0, 177, 0));
        setlocaledefaultvalue(@"hash_f9537f723768dcd7", (28792, 9326, -387));
        setlocaledefaultvalue(@"hash_1b42e78798ae8b6d", (0, 172, 0));
        setlocaledefaultvalue(@"hash_a3c8ab9f8f7cea34", (33644, 7831, -420));
        setlocaledefaultvalue(@"hash_3c75551769e244ca", (0, 227, 0));
        setlocaledefaultvalue(@"hash_979cd705b422c937", (27088, -2862, -806));
        setlocaledefaultvalue(@"hash_ad4d65f125156cb5", (0, 338, 0));
        setlocaledefaultvalue(@"hash_979cd605b422c704", (22958, 866, -515));
        setlocaledefaultvalue(@"hash_ad4d64f125156a82", (0, 61, 0));
        setlocaledefaultvalue(@"hash_979cd505b422c4d1", (28840, -4019, -806));
        setlocaledefaultvalue(@"hash_ad4d5ff125155f83", (0, 6, 0));
        setlocaledefaultvalue(@"hash_ba8a43c2f2e566fc", (25896, -1985, -802));
        setlocaledefaultvalue(@"hash_f2d88363a7693302", (0, 46, 0));
        setlocaledefaultvalue(@"hash_f9537e723768daa4", (22851, 2160, -506));
        setlocaledefaultvalue(@"hash_1b42e68798ae893a", (0, 64, 0));
        setlocaledefaultvalue(@"hash_a3c8ac9f8f7cec67", (23764, -2676, -400));
        setlocaledefaultvalue(@"hash_3c75561769e246fd", (0, 39, 0));
        break;
    case #"hash_e73ed69a192339d4":
        setlocaledefaultvalue(@"hash_1fe5744c6a2c50a7", 5000);
        setlocaledefaultvalue(@"hash_3c77d706ffd2c5cc", 5000);
        setlocaledefaultvalue(@"hash_4177165117bb5cab", (0, 0, 1500));
        setlocaledefaultvalue(@"hash_25377000b8772425", (27, 12, 0));
        break;
    }
    if (is_equal(level.mapname, "mp_jup_st_e")) {
        setlocaledefaultvalue(@"hash_1afadbbba931661", (505.218, 2073.68, 2109.71));
        setlocaledefaultvalue(@"hash_9a25e652b393bfce", 8200);
        setlocaledefaultvalue(@"hash_4177165117bb5cab", (2457.48, 10460.4, 3227.22));
        setlocaledefaultvalue(@"hash_25377000b8772425", (0, -112.91, 0));
    }
}

// Namespace brtdm / scripts/mp/gametypes/brtdm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x46fe
// Size: 0x25f
function initcircledata() {
    if (istrue(level.var_4e353dc2c64b19b1)) {
        return;
    }
    if (!isdefined(level.br_level)) {
        level.br_level = spawnstruct();
    }
    level.br_level.staticcircle = 1;
    level.br_level.br_mapcenter = level.brtdm_config.circlecenter;
    level.br_level.br_mapbounds = [];
    level.br_level.br_mapbounds[0] = (level.br_level.br_mapcenter[0] + level.brtdm_config.circleradius, level.br_level.br_mapcenter[1] + level.brtdm_config.circleradius, 0);
    level.br_level.br_mapbounds[1] = (level.br_level.br_mapcenter[0] - level.brtdm_config.circleradius, level.br_level.br_mapcenter[1] - level.brtdm_config.circleradius, 0);
    level.br_level.br_circleminimapradii = [level.brtdm_config.circleradius, level.brtdm_config.circleradius];
    level.br_level.br_circleradii = [level.brtdm_config.circleradius, level.brtdm_config.circleradius];
    scripts/mp/gametypes/br_circle::initcircle();
    level thread scripts/mp/gametypes/br_circle::runcircles(0);
    level.br_circle.circleindex = 0;
    setomnvar("ui_br_circle_num", 1);
    setomnvar("ui_br_minimap_radius", level.br_level.br_circleminimapradii[0]);
    scripts/mp/gametypes/br_circle::setstaticuicircles(9999, level.br_circle.safecircleui, level.br_circle.dangercircleui, 0);
}

// Namespace brtdm / scripts/mp/gametypes/brtdm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4964
// Size: 0x3f2
function initspawns() {
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    level.mapcenter = scripts/mp/spawnlogic::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
    level.brtdm_config.spawnheight["allies"] = getdvarfloat(@"hash_1fe5744c6a2c50a7", level.brtdm_config.locale_defaults[@"hash_1fe5744c6a2c50a7"]);
    level.brtdm_config.spawnheight["axis"] = getdvarfloat(@"hash_3c77d706ffd2c5cc", level.brtdm_config.locale_defaults[@"hash_1fe5744c6a2c50a7"]);
    level.brtdm_config.spawnvector["allies"] = anglestoforward((0, getdvarfloat(@"hash_745c9bab39ea32b6", level.brtdm_config.locale_defaults[@"hash_745c9bab39ea32b6"]), 0));
    level.brtdm_config.spawnvector["axis"] = anglestoforward((0, getdvarfloat(@"hash_1aeb7a215cb83ef1", level.brtdm_config.locale_defaults[@"hash_1aeb7a215cb83ef1"]), 0));
    level.brtdm_config.spawnanglemin = getdvarfloat(@"hash_b3655fcea6bd08d", level.brtdm_config.locale_defaults[@"hash_b3655fcea6bd08d"]);
    level.brtdm_config.spawnanglemax = getdvarfloat(@"hash_b133ffcea455873", level.brtdm_config.locale_defaults[@"hash_b133ffcea455873"]);
    level.brtdm_config.spawndistancemin = getdvarfloat(@"hash_70a9803740aa086c", level.brtdm_config.locale_defaults[@"hash_70a9803740aa086c"]);
    level.brtdm_config.spawndistancemax = getdvarfloat(@"hash_70858e374081ac7e", level.brtdm_config.locale_defaults[@"hash_70858e374081ac7e"]);
    level.brtdm_config.spawnoffsettacinsertmin = getdvarfloat(@"hash_c8e62aaddc230556", 1000);
    level.brtdm_config.spawnoffsettacinsertmax = getdvarfloat(@"hash_c9091caddc492e44", 3000);
    level.brtdm_config.spawnorigin["allies"] = level.brtdm_config.circlecenter + level.brtdm_config.spawnvector["allies"] * level.brtdm_config.circleradius * level.brtdm_config.spawndistancemin;
    level.brtdm_config.spawnorigin["axis"] = level.brtdm_config.circlecenter + level.brtdm_config.spawnvector["axis"] * level.brtdm_config.circleradius * level.brtdm_config.spawndistancemin;
    level.brtdm_config.faceenemyspawn = getdvarint(@"hash_651c49187e1db2a1", level.brtdm_config.locale_defaults[@"hash_651c49187e1db2a1"]);
    level thread pregeneratespawnpoints();
}

// Namespace brtdm / scripts/mp/gametypes/brtdm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4d5d
// Size: 0x4d3
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
                tank notify("damage", 5000);
            }
        }
        /#
            assert(isdefined(self.setspawnpoint.playerspawnpos));
        #/
        /#
            assert(isdefined(self.setspawnpoint.angles));
        #/
        spawnangles = vectortoangles(level.brtdm_config.spawnvector[self.team]);
        randomyaw = randomfloatrange(level.brtdm_config.spawnanglemin, level.brtdm_config.spawnanglemax);
        spawnvector = anglestoforward((0, spawnangles[1] + ter_op(cointoss(), randomyaw, randomyaw * -1), 0));
        randomdist = randomfloatrange(level.brtdm_config.spawnoffsettacinsertmin, level.brtdm_config.spawnoffsettacinsertmax);
        spawnorigin = self.setspawnpoint.playerspawnpos + spawnvector * randomdist;
        if (distance2dsquared(spawnorigin, level.brtdm_config.circlecenter) > level.brtdm_config.circleradius * level.brtdm_config.circleradius) {
            var_2099c256f875ad40 = vectornormalize(spawnorigin - level.brtdm_config.circlecenter);
            spawnorigin = level.brtdm_config.circlecenter + var_2099c256f875ad40 * level.brtdm_config.circleradius * 0.99;
        }
        tracecontents = scripts/engine/trace::create_default_contents(1);
        groundorigin = drop_to_ground(spawnorigin, 10000, -20000, undefined, tracecontents);
        spawnorigin = (spawnorigin[0], spawnorigin[1], groundorigin[2]);
        spawnorigin = spawnorigin + (0, 0, 1) * level.brtdm_config.spawnheight[self.team];
        if (getdvarint(@"hash_53b56fcd1ad4a8ce") == 1) {
            thread drawline(spawnorigin, groundorigin, 15, (1, 1, 0));
        }
        self.redeployspawn.origin = spawnorigin;
        self.redeployspawn.angles = self.setspawnpoint.playerspawnangles;
        self.redeployspawn.lifeid = self.lifeid;
        self.redeployspawn.time = gettime();
        scripts/mp/equipment/tac_insert::spawnpoint_clearspawnpoint(0, 1);
    } else if (self.redeployspawn.team != self.team || self.redeployspawn.lifeid != self.lifeid) {
        return generatespawnpoint();
    }
    return self.redeployspawn;
}

// Namespace brtdm / scripts/mp/gametypes/brtdm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5238
// Size: 0x423
function pregeneratespawnpoints() {
    level.redeployspawns = [];
    baseteamarray = ["axis", "allies"];
    spawncount = getdvarint(@"hash_e1111ce9b4b5eb16", 50);
    tracecount = getdvarint(@"hash_5951fd67c37a0e30", 5);
    var_7426330c61b55320 = 0;
    foreach (team in baseteamarray) {
        level.redeployspawns[team] = [];
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
            tracecontents = scripts/engine/trace::create_default_contents(1);
            highestz = 0;
            highesttraceindex = 0;
            anglestep = 10;
            results = [];
            for (j = 0; j < tracecount; j++) {
                result = scripts/engine/trace::ray_trace(spawnorigin + (0, 0, 10000), spawnorigin - (0, 0, 20000) + anglestoforward(spawnangles) * j * 2000, undefined, tracecontents)["position"];
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
    foreach (team in level.teamnamelist) {
        if (!isdefined(level.redeployspawns[team])) {
            level.redeployspawns[team] = level.redeployspawns["axis"];
        }
    }
    namespace_2c19af30dc7a566c::run();
}

// Namespace brtdm / scripts/mp/gametypes/brtdm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5662
// Size: 0x109
function generatespawnpoint() {
    team = self.team;
    if (istrue(level.var_4e353dc2c64b19b1)) {
        team = function_58d40b27ff390fd1(team);
    }
    index = randomint(level.redeployspawns[team].size);
    spawnpoint = level.redeployspawns[team][index];
    self.redeployspawn.origin = spawnpoint.origin;
    self.redeployspawn.angles = spawnpoint.angles;
    self.redeployspawn.time = gettime();
    self.redeployspawn.team = team;
    self.redeployspawn.index = -1;
    self.redeployspawn.lifeid = self.lifeid;
    return self.redeployspawn;
}

// Namespace brtdm / scripts/mp/gametypes/brtdm
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5773
// Size: 0x39
function function_58d40b27ff390fd1(team) {
    if (!isdefined(level.redeployspawns[team])) {
        team = "allies";
    }
    if (!isdefined(level.redeployspawns[team])) {
        team = "axis";
    }
    return team;
}

// Namespace brtdm / scripts/mp/gametypes/brtdm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x57b4
// Size: 0xcc6
function function_14d9ef66ff3c55fe() {
    /#
        while (true) {
            if (getdvarint(@"hash_53b56fcd1ad4a8ce") == 1) {
                thread drawline(level.brtdm_config.circlecenter + (0, 0, 10), level.brtdm_config.circlecenter + level.brtdm_config.spawnvector["vehicle_compass"] * level.brtdm_config.circleradius * level.brtdm_config.spawndistancemin + (0, 0, 10), level.framedurationseconds, (0, 1, 0));
                thread drawline(level.brtdm_config.circlecenter, level.brtdm_config.circlecenter + level.brtdm_config.spawnvector["vehicle_compass"] * level.brtdm_config.circleradius * level.brtdm_config.spawndistancemax, level.framedurationseconds, (1, 0, 0));
                thread drawline(level.brtdm_config.circlecenter + (0, 0, 10), level.brtdm_config.circlecenter + level.brtdm_config.spawnvector["ui_br_minimap_radius"] * level.brtdm_config.circleradius * level.brtdm_config.spawndistancemin + (0, 0, 10), level.framedurationseconds, (0, 1, 0));
                thread drawline(level.brtdm_config.circlecenter, level.brtdm_config.circlecenter + level.brtdm_config.spawnvector["ui_br_minimap_radius"] * level.brtdm_config.circleradius * level.brtdm_config.spawndistancemax, level.framedurationseconds, (1, 0, 0));
                spawnangles = vectortoangles(level.brtdm_config.spawnvector["vehicle_compass"]);
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
                spawnangles = vectortoangles(level.brtdm_config.spawnvector["ui_br_minimap_radius"]);
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
    #/
}

// Namespace brtdm / scripts/mp/gametypes/brtdm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6481
// Size: 0xa6
function function_4e89ea3291f12198() {
    /#
        while (true) {
            if (getdvarint(@"hash_7f2b6c7d2b29dde9") == 1) {
                if (isdefined(level.vehiclespawnlocs)) {
                    foreach (vehicle in level.vehiclespawnlocs) {
                        thread drawsphere(vehicle.origin, 128, 1.01, (1, 0, 0));
                    }
                }
            }
            wait(1);
        }
    #/
}

// Namespace brtdm / scripts/mp/gametypes/brtdm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x652e
// Size: 0xa1
function function_3fe54271a36d4f0d() {
    /#
        while (true) {
            if (getdvarint(@"hash_bceac01d51fb87ef") == 1) {
                if (isdefined(level.vehiclespawnlocs)) {
                    thread drawsphere(level.brtdm_config.circlecenter, level.brtdm_config.circleradius, 1.01, (0, 0, 1));
                    thread drawsphere(level.brtdm_config.circlecenter, 64, 1.01, (0, 0, 1));
                }
            }
            wait(1);
        }
    #/
}

// Namespace brtdm / scripts/mp/gametypes/brtdm
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x65d6
// Size: 0x111
function onplayerconnect(player) {
    if (scripts/mp/gametypes/br_gametypes::isfeaturedisabled("circle")) {
        return;
    }
    duration = 9999;
    safecircleent = level.br_circle.safecircleui;
    var_fb3b2613d6f0eb05 = level.br_circle.dangercircleui;
    if (!isbot(player)) {
        var_416318ee02bcd7d9 = scripts/mp/gametypes/br_circle::_safecircledurationforplayer(player, duration);
        player setclientomnvar("ui_br_circle0_start_time", gettime());
        player setclientomnvar("ui_br_circle0_duration", var_416318ee02bcd7d9);
        player setclientomnvar("ui_br_circle0_start_entity", safecircleent);
        player setclientomnvar("ui_br_circle0_end_entity", safecircleent);
        player scripts/mp/gametypes/br_circle::_hidesafecircleui();
        var_416318ee02bcd7d9 = scripts/mp/gametypes/br_circle::_dangercircledurationforplayer(player, duration);
        player setclientomnvar("ui_br_circle1_start_time", gettime());
        player setclientomnvar("ui_br_circle1_duration", var_416318ee02bcd7d9);
        player setclientomnvar("ui_br_circle1_start_entity", var_fb3b2613d6f0eb05);
        player setclientomnvar("ui_br_circle1_end_entity", var_fb3b2613d6f0eb05);
    }
    if (scripts/mp/flags::gameflag("prematch_done")) {
    }
}

// Namespace brtdm / scripts/mp/gametypes/brtdm
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x66ee
// Size: 0x82
function manageprematchfade(delay_time, var_c82eabb722c361a7) {
    self endon("disconnect");
    thread infil_radio_idle();
    if (isplayer(self)) {
        self setclienttriggeraudiozone("brtdm_intro", 1);
    }
    var_ad4dd16f29e24b77 = 0;
    var_dfab0807d83a77fe = 0.5;
    thread scripts/mp/playerlogic::managerespawnfade(var_ad4dd16f29e24b77, var_dfab0807d83a77fe);
    scripts/mp/flags::gameflagwait("prematch_done");
    self clearallsoundsubmixes(6);
    self clearclienttriggeraudiozone(6);
}

// Namespace brtdm / scripts/mp/gametypes/brtdm
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6777
// Size: 0x16
function modespawn(revivespawn) {
    thread playerrespawn();
    return true;
}

// Namespace brtdm / scripts/mp/gametypes/brtdm
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6795
// Size: 0x61
function function_68bc8caeffea7a83(revivespawn) {
    if (isbot(self)) {
        scripts/mp/class::function_a16868d4dcd81a4b();
        self.var_b2f042bf9991295d = "botloadout_jup_mp_01";
    }
    while (!isdefined(level.redeployspawns) || !isdefined(level.redeployspawns[self.pers["team"]])) {
        waitframe();
    }
    return modespawn(revivespawn);
}

// Namespace brtdm / scripts/mp/gametypes/brtdm
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x67fe
// Size: 0x29
function playerkilledspawn(deathdata, finaldeath) {
    deathdata.victim thread playerrespawn();
    return true;
}

// Namespace brtdm / scripts/mp/gametypes/brtdm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x682f
// Size: 0x112
function playerrespawn() {
    level endon("game_ended");
    self endon("disconnect");
    if (istrue(level.gameended)) {
        return;
    }
    scripts/mp/playerlogic::waitforremoteend();
    if (getdvarint(@"hash_fe3afd6ead4aa523", 1) == 1) {
        self endon("brWaitAndSpawnClientComplete");
    }
    spawnpoint = getspawnpoint();
    streamorigin = namespace_8bfdb6eb5a3df67a::playerprestreamrespawnorigin(spawnpoint);
    if (scripts/mp/flags::gameflag("prematch_done")) {
        var_ad4dd16f29e24b77 = 0;
        var_dfab0807d83a77fe = 0.5;
        thread scripts/mp/playerlogic::managerespawnfade(var_ad4dd16f29e24b77, var_dfab0807d83a77fe);
        if (var_ad4dd16f29e24b77 > 0) {
            self waittill("fadeDown_complete");
        }
    }
    scripts/mp/gametypes/br_spectate::playerclearspectatekillchainsystem();
    scripts/mp/gametypes/br::spawnintermission(spawnpoint.origin, spawnpoint.angles);
    scripts/mp/spectating::setdisabled();
    scripts/mp/gametypes/br_public::playerwaittillstreamhintcomplete();
    scripts/mp/playerlogic::spawnplayer(undefined, 0);
    scripts/mp/gametypes/br_pickups::initplayer(1);
    scripts/mp/gametypes/br_gulag::gulagwinnerrespawn(1, undefined, spawnpoint, 1, streamorigin, undefined, undefined, 0, 0, 1);
    scripts/mp/damage::resetplayervariables();
    scripts/mp/damage::resetplayeromnvarsonspawn();
}

// Namespace brtdm / scripts/mp/gametypes/brtdm
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6948
// Size: 0x91
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
    scripts/mp/hud_message::function_f004ef4606b9efdc("kill");
    if (level.spawnprotectiontimer > 0) {
        thread removespawnprotectiononnotify();
        thread removespawnprotectiononads();
    }
    thread manageafktracking();
    namespace_9bb409deb69fb31d::updatesquadomnvars(self.team, self.sessionsquadid);
}

// Namespace brtdm / scripts/mp/gametypes/brtdm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x69e0
// Size: 0x2e
function removespawnprotectiononnotify() {
    self endon("death_or_disconnect");
    self endon("remove_spawn_protection");
    waittill_any_3("parachute_landed", "vehicle_enter", "weapon_fired");
    scripts/mp/gametypes/common::removespawnprotection();
}

// Namespace brtdm / scripts/mp/gametypes/brtdm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6a15
// Size: 0x2b
function removespawnprotectiononads() {
    self endon("death_or_disconnect");
    self endon("remove_spawn_protection");
    while (self playerads() < 0.7) {
        waitframe();
    }
    scripts/mp/gametypes/common::removespawnprotection();
}

// Namespace brtdm / scripts/mp/gametypes/brtdm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6a47
// Size: 0x4e
function manageafktracking() {
    self endon("disconnect");
    self notify("manageAFKTracking");
    self endon("manageAFKTracking");
    self.ignoreafkcheck = 1;
    thread scripts/mp/class::blockclasschange();
    self waittill("parachute_landed");
    thread scripts/mp/class::unblockclasschange();
    self.ignoreafkcheck = undefined;
    self notify("afk_tracking_resume");
}

// Namespace brtdm / scripts/mp/gametypes/brtdm
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x6a9c
// Size: 0x41
function onnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    scripts/mp/gametypes/common::oncommonnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon);
}

// Namespace brtdm / scripts/mp/gametypes/brtdm
// Params a, eflags: 0x0
// Checksum 0x0, Offset: 0x6ae4
// Size: 0x6d
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, killid) {
    namespace_9bb409deb69fb31d::updatesquadomnvars(self.team, self.sessionsquadid);
}

// Namespace brtdm / scripts/mp/gametypes/brtdm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6b58
// Size: 0x53
function ontimelimit() {
    winner = scripts/mp/gamescore::gethighestscoringteam();
    if (game["status"] == "overtime") {
        winner = "forfeit";
    } else if ("tie") {
        winner = "overtime";
    }
    thread scripts/mp/gamelogic::endgame(winner, game["end_reason"]["time_limit_reached"]);
}

// Namespace brtdm / scripts/mp/gametypes/brtdm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6bb2
// Size: 0x4f
function shouldgamelobbyremainintact() {
    axisscore = int(game["teamScores"]["axis"]);
    alliesscore = int(game["teamScores"]["allies"]);
    differential = axisscore - alliesscore;
    return differential < 10;
}

// Namespace brtdm / scripts/mp/gametypes/brtdm
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6c09
// Size: 0x6a
function vehiclespawn_getspawndata(loc) {
    spawndata = spawnstruct();
    spawndata.origin = loc.origin;
    spawndata.angles = loc.angles;
    spawndata.spawntype = "GAME_MODE";
    spawndata.showheadicon = 1;
    return spawndata;
}

// Namespace brtdm / scripts/mp/gametypes/brtdm
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6c7b
// Size: 0x7e
function registervehicletype(refname, spawnvehiclecallback) {
    /#
        assert(isdefined(refname));
    #/
    vehicleinfo = spawnstruct();
    vehicleinfo.refname = refname;
    vehicleinfo.spawncallback = spawnvehiclecallback;
    vehicleinfo.vehiclespawns = function_b08e7e3a0b14f76f(refname);
    /#
        assert(isdefined(vehicleinfo.vehiclespawns));
    #/
    level.vehicleinfo[refname] = vehicleinfo;
}

// Namespace brtdm / scripts/mp/gametypes/brtdm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6d00
// Size: 0x3a6
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

// Namespace brtdm / scripts/mp/gametypes/brtdm
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x70ad
// Size: 0x1a0
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
        if (!scripts/mp/gametypes/br_circle::ispointincurrentsafecircle(origin)) {
            index++;
            continue;
        }
        vehicle = spawnstruct();
        vehicle.origin = origin;
        var_7224bacab3f8ee26 = (0, 0, 0);
        if (isdefined(level.brtdm_config.locale_defaults[angledvarstring])) {
            var_7224bacab3f8ee26 = level.brtdm_config.locale_defaults[angledvarstring];
        }
        vehicle.angles = getdvarvector(var_7224bacab3f8ee26, var_7224bacab3f8ee26);
        vehicle.targetname = vehicleref;
        vehicle.vehicletype = vehicletype;
        spawns[spawns.size] = vehicle;
    }
    return spawns;
}

// Namespace brtdm / scripts/mp/gametypes/brtdm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7255
// Size: 0x298
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

// Namespace brtdm / scripts/mp/gametypes/brtdm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x74f5
// Size: 0x298
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

// Namespace brtdm / scripts/mp/gametypes/brtdm
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7795
// Size: 0x59
function vehiclespawn_littlebird(loc, faildata) {
    if (!isdefined(loc.angles)) {
        loc.angles = (0, randomfloat(360), 0);
    }
    spawndata = vehiclespawn_getspawndata(loc);
    return scripts/cp_mp/vehicles/vehicle::vehicle_spawn("little_bird", spawndata, faildata);
}

// Namespace brtdm / scripts/mp/gametypes/brtdm
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x77f6
// Size: 0x59
function vehiclespawn_atv(loc, faildata) {
    if (!isdefined(loc.angles)) {
        loc.angles = (0, randomfloat(360), 0);
    }
    spawndata = vehiclespawn_getspawndata(loc);
    return scripts/cp_mp/vehicles/vehicle::vehicle_spawn("atv", spawndata, faildata);
}

// Namespace brtdm / scripts/mp/gametypes/brtdm
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7857
// Size: 0x59
function vehiclespawn_tacrover(loc, faildata) {
    if (!isdefined(loc.angles)) {
        loc.angles = (0, randomfloat(360), 0);
    }
    spawndata = vehiclespawn_getspawndata(loc);
    return scripts/cp_mp/vehicles/vehicle::vehicle_spawn("tac_rover", spawndata, faildata);
}

// Namespace brtdm / scripts/mp/gametypes/brtdm
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x78b8
// Size: 0xe5
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

// Namespace brtdm / scripts/mp/gametypes/brtdm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x79a5
// Size: 0x4c4
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
    tracecontents = scripts/engine/trace::create_default_contents(1);
    startpt = drop_to_ground(startpt, level.brtdm_config.spawnheight["allies"], -1 * level.brtdm_config.spawnheight["allies"], undefined, tracecontents);
    startpt = startpt + (0, 0, 1) * (level.brtdm_config.spawnheight["allies"] + var_478490addcc8aa79);
    endpt = drop_to_ground(endpt, level.brtdm_config.spawnheight["allies"], -1 * level.brtdm_config.spawnheight["allies"], undefined, tracecontents);
    endpt = endpt + (0, 0, 1) * (level.brtdm_config.spawnheight["allies"] + var_478490addcc8aa79);
    pathstruct = spawnstruct();
    pathstruct.startpt = startpt;
    pathstruct.endpt = endpt;
    pathstruct.angle = vectortoangles(pathdir);
    dist = distance(pathstruct.startpt, pathstruct.endpt);
    travelspeed = scripts/mp/gametypes/br_c130::getc130speed();
    time = dist / travelspeed;
    c130airdrop = scripts/mp/gametypes/br_c130airdrop::c130airdrop_spawn(pathstruct, dist, travelspeed, time);
    c130airdrop scripts/mp/gametypes/br_c130airdrop::c130airdrop_startdelivery(0);
    var_6f680ee249f67b0d = vectortoangles(level.brtdm_config.spawnvector["axis"] * -1);
    pathdir = anglestoforward((0, var_6f680ee249f67b0d[1] + var_65a8a4791ddd85d8, 0));
    startpt = level.brtdm_config.circlecenter + level.brtdm_config.spawnvector["axis"] * (level.brtdm_config.circleradius + var_fba760f7c08b6fbb) + (0, 0, 1);
    endpt = level.brtdm_config.circlecenter + pathdir * (level.brtdm_config.circleradius * 2 + var_dc12f67d76b34297);
    startpt = drop_to_ground(startpt, level.brtdm_config.spawnheight["axis"], -1 * level.brtdm_config.spawnheight["axis"], undefined, tracecontents);
    startpt = startpt + (0, 0, 1) * (level.brtdm_config.spawnheight["axis"] + var_478490addcc8aa79);
    endpt = drop_to_ground(endpt, level.brtdm_config.spawnheight["axis"], -1 * level.brtdm_config.spawnheight["axis"], undefined, tracecontents);
    endpt = endpt + (0, 0, 1) * (level.brtdm_config.spawnheight["axis"] + var_478490addcc8aa79);
    pathstruct = spawnstruct();
    pathstruct.startpt = startpt;
    pathstruct.endpt = endpt;
    pathstruct.angle = vectortoangles(pathdir);
    dist = distance(pathstruct.startpt, pathstruct.endpt);
    travelspeed = scripts/mp/gametypes/br_c130::getc130speed();
    time = dist / travelspeed;
    c130airdrop = scripts/mp/gametypes/br_c130airdrop::c130airdrop_spawn(pathstruct, dist, travelspeed, time);
    c130airdrop scripts/mp/gametypes/br_c130airdrop::c130airdrop_startdelivery(0);
}

// Namespace brtdm / scripts/mp/gametypes/brtdm
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7e70
// Size: 0xbc
function infil_radio_idle() {
    self endon("death_or_disconnect");
    if (isplayer(self)) {
        radio_sfx = spawn("script_origin", (0, 0, 0));
        radio_sfx showonlytoplayer(self);
        if (isdefined(self.team)) {
            var_1d6df6a17cee3314 = scripts/mp/utility/teams::getteamvoiceinfix(self.team);
            dronechatter = "dx_mpo_" + var_1d6df6a17cee3314 + "op_drone_deathchatter";
        } else {
            dronechatter = "dx_mpo_ruop_drone_deathchatter";
        }
        if (!soundexists(dronechatter)) {
            dronechatter = "dx_mpo_ruop_drone_deathchatter";
        }
        radio_sfx playloopsound(dronechatter);
        scripts/mp/flags::gameflagwait("prematch_done");
        wait(2);
        radio_sfx stoploopsound(dronechatter);
        radio_sfx delete();
    }
}

// Namespace brtdm / scripts/mp/gametypes/brtdm
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7f33
// Size: 0x16
function vehicle_compass_br_shouldbevisibletoplayer(vehicle, player) {
    return true;
}

