// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\utility\omnvar_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_5762ac2f22202ba2;
#using script_3b64eb40368c1450;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\gamescore.gsc;
#using script_56055017e5e588fe;
#using scripts\mp\gametypes\br.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\gametypes\br_lootchopper.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\utility\spawn_event_aggregator.gsc;
#using scripts\mp\utility\disconnect_event_aggregator.gsc;
#using scripts\mp\gametypes\br_c130airdrop.gsc;
#using script_5e7a036feaf4f8b7;
#using scripts\mp\gametypes\br_analytics.gsc;
#using script_2d9d24f7c63ac143;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using script_21c19cfc7139d773;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using scripts\cp_mp\killstreaks\nuke.gsc;
#using scripts\mp\gametypes\br_c130.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using script_64acb6ce534155b7;
#using script_5bab271917698dc4;
#using scripts\mp\gametypes\br_plunder.gsc;
#using scripts\mp\music_and_dialog.gsc;
#using scripts\mp\gametypes\br_publicevents.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\mp\killstreaks\flares.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\common\vehicle.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\gametypes\br_quest_util.gsc;
#using scripts\cp_mp\killstreaks\uav.gsc;
#using scripts\mp\rank.gsc;

#namespace namespace_4662b30263ed0da1;

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19e8
// Size: 0x18
function main() {
    level.var_cdc15ee14362fbf = &namespace_e71e954c5bb55904::init;
    namespace_d20f8ef223912e12::main();
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a07
// Size: 0xdb4
function init() {
    namespace_71073fa38f11492::disablefeature("gulag");
    namespace_71073fa38f11492::disablefeature("dropbag");
    if (getdvarint(@"hash_fe3afd6ead4aa523", 1) == 0) {
        namespace_71073fa38f11492::disablefeature("teamSpectate");
    }
    namespace_71073fa38f11492::enablefeature("allowLateJoiners");
    namespace_71073fa38f11492::disablefeature("oneLife");
    namespace_71073fa38f11492::disablefeature("kioskXP");
    if (getdvarint(@"hash_d507d3832769e0d7", 1) == 0) {
        namespace_71073fa38f11492::disablefeature("kiosk");
    }
    if (getdvarint(@"hash_df75008333710e55", 1) == 1) {
        namespace_71073fa38f11492::enablefeature("tabletReplace");
    }
    namespace_71073fa38f11492::enablefeature("infilParachuteVfx");
    function_597185764a5679f4();
    namespace_71073fa38f11492::registerbrgametypefunc("playerDropPlunderOnDeath", &playerdropplunderondeath);
    namespace_71073fa38f11492::registerbrgametypefunc("playerShouldRespawn", &playershouldrespawn);
    namespace_71073fa38f11492::registerbrgametypefunc("playerWelcomeSplashes", &playerwelcomesplashes);
    namespace_71073fa38f11492::registerbrgametypefunc("spawnHandled", &spawnhandled);
    namespace_71073fa38f11492::registerbrgametypefunc("onPickupTakenIntoBackpack", &onPickupTakenIntoBackpack);
    namespace_71073fa38f11492::registerbrgametypefunc("markPlayerAsEliminatedOnKilled", &markplayeraseliminatedonkilled);
    if (!namespace_71073fa38f11492::isbrgametypefuncdefined("lootAllowedInBackpack")) {
        namespace_71073fa38f11492::registerbrgametypefunc("lootAllowedInBackpack", &lootAllowedInBackpack);
    }
    namespace_3c37cb17ade254d::registersharedfunc("plunder", "packClientMatchData", &packclientmatchdata);
    namespace_3c37cb17ade254d::registersharedfunc("plunder", "getPlunderExtractLocations", &_getplunderextractlocations);
    level.teamplunderscoremechanic = getdvarint(@"hash_1a7a6d4ee3338761", 0);
    level.brgametype.maxextractions = getdvarint(@"hash_b6a790d232323e81", 5);
    level.brgametype.numextractions = 0;
    level.brgametype.firstteam = "tie";
    level.brgametype.var_be0c10911fec189f = 1;
    level.brgametype.var_98ade9e8627af484 = 1;
    level.br_prematchffa = 0;
    setdvar(@"hash_c0dba6a7250aad33", 1);
    level.topteamsever = [];
    level.lootleaders = [];
    level.expiredlootleaders = [];
    level.called50percentprogress = 0;
    level.called75percentprogress = 0;
    level.called90percentprogress = 0;
    level.dontendonscore = 1;
    scorelimit = getdvarint(@"hash_a07d25d87bb595de", 1000);
    if (scorelimit > 0) {
        scorelimit = scorelimit * 10;
        scorelimit = scorelimit * 100;
        setdvar(@"hash_163241713430bfed", scorelimit);
        registerscorelimitdvar(getgametype(), scorelimit);
    }
    setdvar(@"hash_da4f64f6eb4d97da", 3);
    setdvar(@"hash_f6f24e020168ade8", "nothing");
    setdvarifuninitialized(@"hash_8d9ad523f40be455", 12000);
    setomnvar("ui_br_circle_state", 4);
    setomnvar("ui_gulag_state", 1);
    setomnvar("ui_hide_redeploy_timer", 1);
    setdvarifuninitialized(@"hash_bbb179520c2c4a14", 1);
    level.giveloadouteverytime = getdvarint(@"hash_2efff4c3f474f5c7", 1);
    level.instantbleedoutsquadwipe = getdvarint(@"hash_c6acab01f606ff92", 1);
    level.bottompercentagetoadjusteconomy = getdvarint(@"hash_55e51828a59c2c5b", 50);
    level.toppercentagetoadjusteconomy = getdvarint(@"hash_a1970e3c66611a73", 5);
    level.usemilestonephases = getdvarint(@"hash_d7a5882fe16d92e3", 1);
    level.milestonephasepercent_vips = getdvarint(@"hash_59cba3276a3a96c6", 10);
    level.milestonephasepercent_lzs = getdvarint(@"hash_7fdccbee87a1ff6d", 30);
    level.milestonephasepercent_drops = getdvarint(@"hash_d6ab3431e584ead8", 50);
    level.milestonephasepercent_helis = getdvarint(@"hash_beac4d91ad3af5d7", 75);
    level.airdropbasecashamount = getdvarint(@"hash_f21f22782971c2ac", 750);
    level.hideplacementuntilpercent = getdvarint(@"hash_bfb818fa6a83f7d2", 10);
    level.hideleaderhashuntilpercent = getdvarint(@"hash_c124a7a4afb14348", 0);
    level.showplacementsplashesandmusic = getdvarint(@"hash_63908c5e06402524", 1);
    level.secondsbeforeplacementupdates = getdvarint(@"hash_e616cb0e727859dd", 60);
    level.disablepercentageannouncements = getdvarint(@"hash_69e6435403e5c322", 0);
    level.var_29af3a470e92b6e1 = getdvarint(@"hash_50c18d3651edf35d", 0);
    level.lootleadermarkcount = getdvarint(@"hash_3ada79b2236a5c12", 3);
    level.maxlootleadermarkcount = getdvarint(@"hash_3ada79b2236a5c12", 3);
    level.lootleadermarksize = getdvarint(@"hash_1650346812659df2", 5000);
    level.lootleaderoneperteam = getdvarint(@"hash_5fd1126ec81d6b0b", 1) == 1;
    level.lootleadermarksizedynamic = getdvarint(@"hash_1b7554a04b02683c", 1);
    level.lootleadermarkstrongsize = getdvarint(@"hash_210471fb05950431", 2000);
    level.lootleadermarkstrongvalue = getdvarint(@"hash_f53e6f6fddbbbc11", 5000);
    level.lootleadermarkweaksize = getdvarint(@"hash_fc8b22a888365974", 5000);
    level.lootleadermarkweakvalue = getdvarint(@"hash_43d67f5054412e02", 1000);
    level.expiredlootleaderenabled = getdvarint(@"hash_a88980519c8d01b6", 0) == 1;
    level.lootleadermarksontopteams = getdvarint(@"hash_66caf7f753f08487", 2);
    level.plundermusicfirst = getdvarfloat(@"hash_24c7c305d1ead986", 0.3);
    level.plundermusicsecond = getdvarfloat(@"hash_3f1f73f0aeec8fd4", 0.5);
    level.plundermusicthird = getdvarfloat(@"hash_25360b6a507d1e21", 0.75);
    level.plundermusicfourth = getdvarfloat(@"hash_11b704eda4d01a78", 0.9);
    level.useautorespawn = getdvarint(@"hash_9ea6558e3fdc02d8", 1);
    level.autorespawnwaittime = getdvarint(@"hash_4beac336193a373d", 20);
    level.tokenrespawnwaittime = getdvarint(@"hash_728cba7a2adc64db", level.autorespawnwaittime);
    level.incrementalrespawnpunish = getdvarint(@"hash_fc3a0f4f0cdd615e", 0);
    level.incrementalrespawnpunishmax = getdvarfloat(@"hash_5eb645f42926f53b", 15);
    level.respawnheightoverride = getdvarint(@"hash_8495ad89c3580163", 6000);
    level.respawntimedisable = getdvarint(@"hash_73dbc19ad4c85d57", 0);
    level.parachutedeploydelay = getdvarfloat(@"hash_12027360b079c1db", 1.5);
    level.bonusdeathplunder = getdvarint(@"hash_d8ce253f7d3b81ff", 400);
    level.bonusdeathplunderot = getdvarint(@"hash_8d7f79a8e24f83cb", 800);
    level.maxplunderdropondeath = getdvarint(@"hash_39f9da18bb66e22a", 20000);
    level.minplunderdropondeath = getdvarint(@"hash_e0a487b88d0e4410", 400);
    level.percentageplunderdrop = getdvarint(@"hash_efd614d3ef385a53", 50);
    level.var_b5bc63fa8162fce0 = getdvarint(@"hash_4e0de97531d62635", 25);
    level.plunderfxondropthreashold = getdvarint(@"hash_9421b492cb2d2db8", 1500);
    level.maxplunderdropinovertime = getdvarint(@"hash_f9a79b878dee90d", 20000);
    level.executioncashmultiplier = getdvarfloat(@"hash_3f5135381420d42e", 1);
    level.autoassignfirstquest = getdvarint(@"hash_4a06e0523640f8fa", 0);
    level.quest_domdistmin = getdvarint(@"hash_ad5a509fceccdbca", 5000);
    level.quest_domdistmax = getdvarint(@"hash_ad7d5a9fcef33980", 10000);
    level.quest_assdistmin = getdvarint(@"hash_f976a86d8da6cc4d", 2500);
    level.quest_assdistmax = getdvarint(@"hash_f952926d8d7e2133", 7500);
    level.quest_scavdistmin = getdvarint(@"hash_f6aa125a8f31d115", 5000);
    level.quest_scavdistmax = getdvarint(@"hash_f6cdfc5a8f5a1b6b", 8000);
    level.quest_secretdistmin = getdvarint(@"hash_f6aa125a8f31d115", 5000);
    level.quest_secretdistmax = getdvarint(@"hash_f6cdfc5a8f5a1b6b", 8000);
    level.tabletreplacefrequency = getdvarfloat(@"hash_b72a5778b96923f9", 1.5);
    level.skipweapondropondeath = getdvarint(@"hash_8d982a8e8331b9f7", 0);
    level.skipequipmentdropondeath = getdvarint(@"hash_370fb0965baf2ad5", 1);
    level.allowfultondropondeath = getdvarint(@"hash_9250bef0872b6dfd", 1);
    level.teamplunderexfil = getdvarint(@"hash_53675cdab06dbcf5", 0) == 1;
    level.teamplunderexfilshowviponly = getdvarint(@"hash_7a6732d6b24b1690", 0) == 1;
    level.teamplunderexfilvipuav = getdvarint(@"hash_efe218d17bdae2fd", 0) == 1;
    level.teamplunderexfiltimer = getdvarint(@"hash_c655a0b01b13910a", 180);
    level.showplunderextracticonsinworld = getdvarint(@"hash_25741495f8eabdbe", 1) == 1;
    level.shownonscriptableextracticons = getdvarint(@"hash_9f64abb53e8eb4f5", 0);
    level.timeoutplunderextractionsites = getdvarint(@"hash_1908e4e2a813777f", 0);
    level.moveplunderextractionsitesonuse = getdvarint(@"hash_e5556c731830e8a", 0) == 1;
    level.extractplunderhelihealth = int(getdvarint(@"hash_4806b7415b66c1b5", 999) * 100);
    level.extractplunderheliinvulnerable = getdvarint(@"hash_9126054077cbefac", 1);
    level.bankplunderextractinstantly = getdvarint(@"hash_96c1cdc24f5c05ae", 1);
    level.plunderextractalertnearby = getdvarint(@"hash_2878716b2c2faf01", 1);
    level.matchstartextractsitedelay = getdvarint(@"hash_33b1cb6fd6a90efd", 120);
    level.hideallunselectedextractpads = getdvarint(@"hash_ea045e50c8947e0f", 1);
    level.setupevenlydistributedpads = ter_op(getdvar(@"hash_f644e90eb9a008cf") == "mp_br_mechanics", 0, getdvarint(@"hash_25feb62305248c26", 1));
    level.scorerequiresbanking = getdvarint(@"hash_2bc34d5113d02622", 0);
    level.disablewinonscore = getdvarint(@"hash_1bcb79588e18be26", 0);
    level.doendofmatchotsequence = getdvarint(@"hash_c567928926183d31", 180);
    level.setallclientomnvarot = level.doendofmatchotsequence > 0;
    level.overtimebuiltintomatchtimer = getdvarint(@"hash_6c0f2aa1bb3e2b02", 1);
    level.bankingoverlimitwillendot = getdvarint(@"hash_5406c1b726ff327c", 0);
    level.mapedgeextractionlocs = getdvarint(@"hash_da53957720737131", 0);
    level.modespawnendofgame = &playerspawnendofgame;
    level.endmatchcameratransitions = getdvarint(@"hash_ec4443371f0f6367", 1);
    level.overtimecashmultiplier = getdvarfloat(@"hash_b236ecb84f9d1953", 2);
    setomnvar("ui_br_overtime_cash_multiplier", level.overtimecashmultiplier);
    level.disableonemilannounce = getdvarint(@"hash_b94883083ec8eb80", 0);
    level.dmzlootleaderupdateonpickup = getdvarint(@"hash_9efdb377e7ae2dff", 0) == 1;
    level.dmzwincost = getdvarint(@"hash_a07d25d87bb595de", 1000) * 10;
    level.dmzextractcost = getdvarint(@"hash_5cb48fb038ec819f", 300);
    level.dmzminextractcost = getdvarint(@"hash_2c2d8ae182cf1fc", 40);
    level.dmzextractcostdecrease = getdvarint(@"hash_27a4ecc9aa9f8224", 20);
    level.minplunderextractions = getdvarint(@"hash_eaacc4689dd5d721", 7);
    level.maxplunderextractions = getdvarint(@"hash_23f4eae3aeebefd3", 7);
    level.var_ad5e78c78f492751 = getdvarint(@"hash_2be698011074fc01", 1) == 1;
    level.var_3bee9b0a6835e07b = getdvarint(@"hash_5a9165d11e511873", 0);
    var_813da151d7b2ca7e = ter_op(function_ba5574c7f287c587(), 0, 1);
    level.var_a83a4e71446bfef7 = getdvarint(@"hash_9e2a261d00656441", var_813da151d7b2ca7e);
    level.var_5a2620a56cf4bb = getdvarint(@"hash_b61802a00edccfa9", var_813da151d7b2ca7e);
    level.var_37172573e0865e02 = getdvarint(@"hash_3f51edcd4ab0e8e0", 0);
    level.var_db813db0fa91a0ce = getdvarint(@"hash_b86cdc68f61cf84", 0);
    level.var_36871639aadbfd77 = getdvarint(@"hash_d29e2cf0e9e41d98", 0);
    level.var_7f1716b735a38c9f = getdvarint(@"hash_a4a28649ef4389f4", 1);
    level.brdisablefinalkillcam = 1;
    thread namespace_479f2912131dabfc::init();
    thread initpostmain();
    thread initdialog();
    /#
        thread function_89c5c5be1e85310();
    #/
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27c2
// Size: 0x36b
function initpostmain() {
    waittillframeend();
    level.uavsettings["uav"].timeout = 60;
    namespace_4b0406965e556711::gameflaginit("collect_done", 0);
    namespace_4b0406965e556711::gameflaginit("helipad_wait_done", 0);
    namespace_4b0406965e556711::gameflaginit("placement_updates_allowed", 0);
    namespace_4b0406965e556711::gameflaginit("activate_cash_lzs", 0);
    namespace_4b0406965e556711::gameflaginit("activate_cash_drops", 0);
    namespace_4b0406965e556711::gameflaginit("activate_cash_helis", 0);
    level.modemayconsiderplayerdead = &brmayconsiderplayerdead;
    level.brmodevariantrewardcullfunc = &missions_clearinappropriaterewards;
    level.ononeleftevent = &ononeleftevent;
    level.onplayerkilled = &onplayerkilled;
    level.onpostkillcamcallback = &onpostkillcamcallback;
    level.ontimelimit = &ontimelimit;
    namespace_71eef510d7f364cf::registeronplayerspawncallback(&playerlootleadervalidity);
    namespace_f1d40c362677777e::registerondisconnecteventcallback(&onplayerdisconnect);
    thread setupmission();
    thread namespace_479f2912131dabfc::lootchopper_managespawns();
    thread namespace_d58f8bbad53774ad::c130airdrop_managedrop();
    level thread namespace_ba90759e150897e3::init();
    level.lootleadermarks = [];
    level.expiredlootleadermarks = [];
    for (i = 0; i < level.lootleadermarkcount; i++) {
        if (level.lootleadermarksontopteams > 0 && i == 0) {
            var_e08fdf5d9199f540 = "LootLeaderTop_Plunder";
        } else {
            var_e08fdf5d9199f540 = "LootLeader_Plunder";
        }
        instance = spawnstruct();
        /#
            instance.debugtype = "helipad_wait_done";
        #/
        instance.modifier = "";
        instance function_6b6b6273f8180522(var_e08fdf5d9199f540, undefined, level.lootleadermarksize);
        level.lootleadermarks[i] = instance;
        instance = spawnstruct();
        /#
            instance.debugtype = "helipad_wait_done";
        #/
        instance.modifier = "";
        instance function_6b6b6273f8180522("Expired_" + var_e08fdf5d9199f540, undefined, level.lootleadermarksize);
        level.expiredlootleadermarks[i] = instance;
    }
    if (!istrue(level.usemilestonephases)) {
        level thread placementupdatewait();
    }
    thread waitandstartplunderpolling();
    level thread namespace_a011fbf6d93f25e5::initcashtracking();
    cleanupents();
    if (level.teamplunderscoremechanic) {
        if (getdvarfloat(@"hash_81be161d3102cc0e", 15) > 0) {
            level thread updatelootleadersonfixedinterval();
        }
    }
    if (level.showplunderextracticonsinworld && level.shownonscriptableextracticons) {
        level thread createheliextractobjectiveicons();
    }
    thread function_dc2b625c4d2e4f5();
    if (istrue(level.mapedgeextractionlocs)) {
        level thread initextractionlocations();
    }
    level.validautoassignquests = [];
    level.validautoassignquests[0] = "assassination";
    level.validautoassignquests[1] = "domination";
    level.validautoassignquests[2] = "scavenger";
    level thread eomawardplayerxp();
    if (istrue(level.endmatchcameratransitions)) {
        level thread initendcameralocations();
    }
    speed = getdvarint(@"hash_541028f96f581a0a", -1);
    if (speed > 0) {
        level.br_level.c130_speedoverride = speed;
    }
    level thread changecirclestateatlowtime();
    if (level.doendofmatchotsequence && level.overtimebuiltintomatchtimer) {
        level thread changetimertoovertimetimer();
    }
    thread onprematchfadedone();
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b34
// Size: 0x65
function onprematchfadedone() {
    namespace_4b0406965e556711::gameflagwait("prematch_fade_done");
    foreach (player in level.players) {
        player thread namespace_aead94004cf4c147::function_5c5e6619f0b24f90();
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ba0
// Size: 0x3e
function function_dc2b625c4d2e4f5() {
    if (level.timeoutplunderextractionsites > 0) {
        namespace_4b0406965e556711::gameflagwait("prematch_done");
        if (level.matchstartextractsitedelay > 0) {
            wait(level.matchstartextractsitedelay);
        }
        level thread startplunderextractiontimers();
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2be5
// Size: 0x86
function changecirclestateatlowtime() {
    level endon("game_ended");
    if (namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
        return;
    }
    level endon("end_circlestate_timer");
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    timer = getdvarint(@"hash_e022fd0199a95f84");
    setomnvar("ui_br_circle_state", 5);
    setomnvar("ui_hardpoint_timer", gettime() + int(timer * 1000));
    wait(int(max(timer - 300, 0)));
    setomnvar("ui_br_circle_state", 6);
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2c72
// Size: 0x6e
function changetimertoovertimetimer() {
    level endon("game_ended");
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    timer = getdvarint(@"hash_e022fd0199a95f84");
    waittime = int(max(timer - level.doendofmatchotsequence, 0));
    if (waittime <= 0) {
        return;
    }
    wait(waittime);
    level notify("end_circlestate_timer");
    level thread triggerovertimetimer(undefined, undefined, 1);
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ce7
// Size: 0x1e
function waitandstartplunderpolling() {
    level endon("game_ended");
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    thread plunderrankupdate();
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d0c
// Size: 0x3e
function cleanupents() {
    namespace_36f464722d326bbe::removematchingents_bykey("delete_on_load", "targetname");
    namespace_36f464722d326bbe::removematchingents_bymodel("door_prison_cell_metal_mp", 1);
    namespace_36f464722d326bbe::removematchingents_bymodel("door_wooden_panel_mp_01", 1);
    namespace_36f464722d326bbe::removematchingents_bymodel("me_electrical_box_street_01", 1);
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d51
// Size: 0x6a
function onplayerdisconnect(player) {
    if (isdefined(player) && namespace_4b0406965e556711::gameflag("prematch_done")) {
        player namespace_cb965d2f71fefddc::droponplayerdeath();
        if (isdefined(level.var_153f283bcbffa477)) {
            if (level.teamdata[player.team]["players"].size == 0) {
                level.var_153f283bcbffa477--;
            }
        } else {
            namespace_54d20dd0dd79277f::calculatenumteamswithplayers();
        }
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2dc2
// Size: 0xc
function ononeleftevent(team) {
    
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2dd5
// Size: 0x56
function onPickupTakenIntoBackpack(pickupent) {
    if (!(isdefined(pickupent.scriptablename) && istrue(level.var_b19067b41fd5cfe8))) {
        return;
    }
    var_7c0646d93451368c = namespace_cb965d2f71fefddc::function_b77386f2a0293169(pickupent.scriptablename);
    if (var_7c0646d93451368c) {
        namespace_88bfae359020fdd3::function_1976438a8865ac27("br_ftue_valuables");
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e32
// Size: 0x111
function playerwelcomesplashes(data) {
    self endon("disconnect");
    self waittill("spawned_player");
    wait(1);
    if (!istrue(level.br_infils_disabled)) {
        self waittill("joining_Infil");
    } else {
        namespace_4b0406965e556711::gameflagwait("prematch_done");
    }
    wait(1);
    /#
        if (level.mapname == "assassination" && getdvarint(@"hash_7713e10380b6cb97", 0) == 0) {
            if (isdefined(self.plotarmor)) {
                self.plotarmor = undefined;
            }
        }
    #/
    level thread namespace_54d20dd0dd79277f::calculatenumteamswithplayers();
    if (soundexists("dx_bra_uktl_bm_tut_earn_cash")) {
        level namespace_d3d40f75bb4e4c32::brleaderdialogplayer("bm_tut_earn_cash", self);
    }
    if (level.var_36871639aadbfd77) {
        namespace_44abc05161e2e2cb::showsplash("br_gametype_plunder_welcome", undefined, undefined, undefined, undefined, "splash_list_br_plunder_iw9_mp");
    }
    if (istrue(self.isbrsquadleader)) {
        level namespace_d3d40f75bb4e4c32::brleaderdialogplayer("deploy_squad_leader", self, 1, 0, 4.5);
    }
    if (istrue(level.autoassignfirstquest) && istrue(level.br_prematchstarted)) {
        autoassignquest(self);
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f4a
// Size: 0x27
function spawnhandled(player) {
    return istrue(player.br_infilstarted) && namespace_4b0406965e556711::gameflag("prematch_done");
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f79
// Size: 0x3
function getdropbagdelay() {
    
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2f83
// Size: 0x231
function trackserverend() {
    level endon("game_ended");
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    var_4c473852188edc3f = 0;
    var_99d0e04b2137bd95 = 0;
    var_26482caeea97c1f9 = 0;
    if (namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
        return;
    }
    while (1) {
        wait(1);
        timeremaining = namespace_d576b6dc7cef9c62::gettimeremaining() / 1000;
        if (istrue(level.bmoovertime)) {
            break;
        }
        if (timeremaining <= 600 && !var_4c473852188edc3f) {
            var_4c473852188edc3f = 1;
            setomnvar("ui_br_circle_state", 1);
            foreach (player in level.players) {
                player namespace_58fb4f2e73fd41a0::setlowermessageomnvar("br_dmz_10minwarning", undefined, 10);
            }
        } else if (timeremaining <= 300 && !var_99d0e04b2137bd95) {
            var_99d0e04b2137bd95 = 1;
            setomnvar("ui_br_circle_state", 2);
            foreach (player in level.players) {
                player namespace_58fb4f2e73fd41a0::setlowermessageomnvar("br_dmz_5minwarning", undefined, 10);
            }
        } else if (timeremaining <= 0 && !var_26482caeea97c1f9) {
            var_26482caeea97c1f9 = 1;
            if (level.teamplunderscoremechanic) {
                return;
            }
            setomnvar("ui_nuke_countdown_active", 0);
            level.mercywintriggered = 1;
            var_39e8f33513c716cd = findanyaliveplayer();
            if (isplayer(var_39e8f33513c716cd)) {
                var_39e8f33513c716cd namespace_670e1516d92a7a2b::tryusenuke();
                wait(10);
                var_3cc335047305b1b = findteamwithnoplayers();
                level thread namespace_d576b6dc7cef9c62::endgame(var_3cc335047305b1b, game["end_reason"]["mercy_win"], game["end_reason"]["mercy_loss"], 0, 1);
            } else {
                var_3cc335047305b1b = findteamwithnoplayers();
                level thread namespace_d576b6dc7cef9c62::endgame(var_3cc335047305b1b, game["end_reason"]["mercy_win"], game["end_reason"]["mercy_loss"], 0, 1);
            }
        }
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x31bb
// Size: 0x8d
function findanyaliveplayer() {
    teamkeys = getarraykeys(level.teamdata);
    foreach (key in teamkeys) {
        if (level.teamdata[key]["alivePlayers"].size > 0) {
            return level.teamdata[key]["alivePlayers"][0];
        }
    }
    return undefined;
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3250
// Size: 0x7f
function findteamwithnoplayers() {
    teamkeys = getarraykeys(level.teamdata);
    foreach (key in teamkeys) {
        if (level.teamdata[key]["players"].size == 0) {
            return key;
        }
    }
    return "tie";
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0x32d7
// Size: 0x148
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00) {
    namespace_d20f8ef223912e12::onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00);
    if (namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
        return;
    }
    var_1cf59dc12f7225cb = getdvarint(@"hash_2af6e6a061931dc", 7500);
    if (isdefined(level.splashtime_vip) && level.splashtime_vip + var_1cf59dc12f7225cb > gettime()) {
        namespace_44abc05161e2e2cb::showsplash("bm_vips_marked");
    }
    if (isdefined(level.splashtime_lzs) && level.splashtime_lzs + var_1cf59dc12f7225cb > gettime()) {
        namespace_44abc05161e2e2cb::showsplash("bm_extract_heli_start");
    }
    if (isdefined(level.splashtime_drops) && level.splashtime_drops + var_1cf59dc12f7225cb > gettime()) {
        namespace_44abc05161e2e2cb::showsplash("br_c130airdrop_incoming");
    }
    if (isdefined(level.splashtime_helis) && level.splashtime_helis + var_1cf59dc12f7225cb > gettime()) {
        namespace_44abc05161e2e2cb::showsplash("br_lootchopper_incoming");
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3426
// Size: 0xe
function brmayconsiderplayerdead(player) {
    return 1;
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x343c
// Size: 0xe
function playershouldrespawn(data) {
    return 1;
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3452
// Size: 0x25
function setupmission() {
    level.brgametype.extractposition = getextractionposition();
    thread makeextractionobjective();
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x347e
// Size: 0xfa
function getextractionposition() {
    var_4bf102a2e23c6c84 = 2500;
    centerpt = level.br_level.br_mapcenter;
    var_d8235976ea87d0d2 = (0, randomfloatrange(0, 360), 0);
    pathdir = anglestoforward(var_d8235976ea87d0d2);
    var_5619b7bbc3745888 = level.br_level.br_circleradii[0] * 2;
    endpt = centerpt + pathdir * var_5619b7bbc3745888;
    endpt = namespace_ad389306d44fc6b4::snappointtooutofboundstriggertrace(centerpt, endpt);
    startheight = 0;
    var_5fa1e1697a302583 = namespace_9abe40d2af041eb2::getkillstreakairstrikeheightent();
    if (isdefined(var_5fa1e1697a302583)) {
        startheight = var_5fa1e1697a302583.origin[2];
    }
    start = (endpt[0], endpt[1], startheight);
    var_aa5a7071f7a4c106 = tracegroundpoint(start);
    endpt = var_aa5a7071f7a4c106 + (0, 0, var_4bf102a2e23c6c84);
    return endpt;
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3580
// Size: 0x75
function makeextractionobjective() {
    objectiveiconid = namespace_5a22b6f3a56f7e9b::requestobjectiveid(1);
    level.brgametype.objectiveiconid = objectiveiconid;
    /#
        assert(objectiveiconid != -1);
    #/
    if (objectiveiconid != -1) {
        namespace_5a22b6f3a56f7e9b::objective_add_objective(objectiveiconid, "current", level.brgametype.extractposition, "icon_waypoint_koth");
        namespace_5a22b6f3a56f7e9b::update_objective_setbackground(objectiveiconid, 0);
        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(objectiveiconid);
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x35fc
// Size: 0x95
function setupmissionwidget() {
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    xp = getcurrentxp();
    startindex = namespace_1eb3c4e0e28fac71::getquesttableindex("gt_extract_1");
    foreach (player in level.players) {
        player namespace_1eb3c4e0e28fac71::setquestindexomnvar(startindex);
        player namespace_1eb3c4e0e28fac71::uiobjectivesetparameter(xp);
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3698
// Size: 0x81
function getcurrentxp() {
    xp = getdvarint(@"hash_911e056fab287a06", 5000);
    var_1483ba069eb69db = getdvarint(@"hash_728f3c5d729a3f2d", 2000);
    var_3af7b46cfd065ebd = getdvarint(@"hash_802cc155c089e133", 200);
    if (var_1483ba069eb69db > 0) {
        xp = int(max(var_1483ba069eb69db, xp - level.brgametype.numextractions * var_3af7b46cfd065ebd));
    }
    return xp;
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3721
// Size: 0x88
function showextractionobjectivetoteam(team) {
    teammates = level.teamdata[team]["players"];
    foreach (player in teammates) {
        namespace_5a22b6f3a56f7e9b::objective_playermask_addshowplayer(level.brgametype.objectiveiconid, player);
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x37b0
// Size: 0x88
function hideextractionobjectivefromteam(team) {
    teammates = level.teamdata[team]["players"];
    foreach (player in teammates) {
        namespace_5a22b6f3a56f7e9b::objective_playermask_hidefrom(level.brgametype.objectiveiconid, player);
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x383f
// Size: 0x19f
function doteamextractedupdate() {
    level.brgametype.numextractions++;
    level.brgametype.hudextractnum setvalue(level.brgametype.numextractions);
    level.brgametype.hudextractnum thread huddopulse();
    level.brgametype.hudextractmax thread huddopulse();
    cost = getcost();
    level.brgametype.hudcost setvalue(cost * 10);
    foreach (entry, teamdata in level.teamdata) {
        if (isdefined(teamdata["teamCount"]) && teamdata["teamCount"] > 0) {
            updateteamplunderhud(entry);
        }
    }
    xp = getcurrentxp();
    foreach (player in level.players) {
        if (!namespace_8bfdb6eb5a3df67a::isteamextracted(player.team)) {
            player thread namespace_44abc05161e2e2cb::showsplash("br_gametype_extract_extracted");
            player namespace_1eb3c4e0e28fac71::uiobjectivesetparameter(xp);
        }
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x39e5
// Size: 0x44
function brendgame() {
    wait(1.5);
    handleendgamesplash();
    namespace_d576b6dc7cef9c62::endgame_regularmp(level.brgametype.firstteam, game["end_reason"]["objective_completed"], game["end_reason"]["br_eliminated"]);
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3a30
// Size: 0x73
function handleendgamesplash() {
    foreach (player in level.players) {
        if (!namespace_8bfdb6eb5a3df67a::isteamextracted(player.team)) {
            player setcachedclientomnvar("post_game_state", 2);
        }
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3aaa
// Size: 0x54b
function function_34e46d26df79fdad() {
    if (!isdefined(self.var_db548fc480c33eac)) {
        self.var_db548fc480c33eac = [];
        self.var_db548fc480c33eac[0] = 0;
        self.var_db548fc480c33eac[1] = 0;
        self.var_db548fc480c33eac[2] = 0;
        self.var_db548fc480c33eac[3] = 0;
        self.var_db548fc480c33eac[4] = 0;
    }
    var_bbac576aade31a1e = self.plundercount + self.plunderbanked;
    var_cdf68f979a48cea6 = self.var_db548fc480c33eac[0] + self.var_db548fc480c33eac[1] + self.var_db548fc480c33eac[2] - self.var_db548fc480c33eac[3] - self.var_db548fc480c33eac[4];
    var_4e673c880cb3ff65 = var_cdf68f979a48cea6 - var_bbac576aade31a1e;
    self setplayerdata(level.var_5d69837cf4db0407, "plunderAARValue", 0, int(var_4e673c880cb3ff65));
    self setplayerdata(level.var_5d69837cf4db0407, "plunderAARValue", 1, int(self.var_db548fc480c33eac[4]));
    self setplayerdata(level.var_5d69837cf4db0407, "plunderAARValue", 2, int(self.var_db548fc480c33eac[3]));
    self setplayerdata(level.var_5d69837cf4db0407, "plunderAARValue", 3, int(self.var_db548fc480c33eac[2]));
    self setplayerdata(level.var_5d69837cf4db0407, "plunderAARValue", 4, int(self.var_db548fc480c33eac[1]));
    self setplayerdata(level.var_5d69837cf4db0407, "plunderAARValue", 5, int(self.var_db548fc480c33eac[0]));
    self setplayerdata(level.var_5d69837cf4db0407, "plunderAARValue", 6, int(var_bbac576aade31a1e));
    namespace_a011fbf6d93f25e5::function_9d458fb3a5d1e86a(namespace_c6ccccd95254983f::getteamplunder(self.team) * 10, game["teamPlacements"][self.team], var_bbac576aade31a1e, self.var_db548fc480c33eac[0], self.var_db548fc480c33eac[1], self.var_db548fc480c33eac[2], self.var_db548fc480c33eac[3], self.var_db548fc480c33eac[4]);
    if (istrue(level.var_db813db0fa91a0ce)) {
        team = self.team;
        if (!isdefined(level.var_e224ccaf8102eea7)) {
            level.var_e224ccaf8102eea7 = [];
        }
        if (!isdefined(level.var_e224ccaf8102eea7[team])) {
            level.var_e224ccaf8102eea7[team] = spawnstruct();
            level.var_e224ccaf8102eea7[team].var_42623c2865853280 = 0;
            level.var_e224ccaf8102eea7[team].var_5aef484ac6780f1c = 0;
            level.var_e224ccaf8102eea7[team].var_690d93b2142ecf7 = 0;
            level.var_e224ccaf8102eea7[team].var_f86b346fef47a962 = 0;
            level.var_e224ccaf8102eea7[team].var_a9cfda826f991c30 = 0;
            level.var_e224ccaf8102eea7[team].var_a3442da3fded2730 = 0;
            level.var_e224ccaf8102eea7[team].var_bea7a1b2df733cdc = 0;
        }
        level.var_e224ccaf8102eea7[team].var_42623c2865853280 = level.var_e224ccaf8102eea7[team].var_42623c2865853280 + var_bbac576aade31a1e;
        level.var_e224ccaf8102eea7[team].var_5aef484ac6780f1c = level.var_e224ccaf8102eea7[team].var_5aef484ac6780f1c + self.var_db548fc480c33eac[0];
        level.var_e224ccaf8102eea7[team].var_690d93b2142ecf7 = level.var_e224ccaf8102eea7[team].var_690d93b2142ecf7 + self.var_db548fc480c33eac[1];
        level.var_e224ccaf8102eea7[team].var_f86b346fef47a962 = level.var_e224ccaf8102eea7[team].var_f86b346fef47a962 + self.var_db548fc480c33eac[2];
        level.var_e224ccaf8102eea7[team].var_a9cfda826f991c30 = level.var_e224ccaf8102eea7[team].var_a9cfda826f991c30 + self.var_db548fc480c33eac[3];
        level.var_e224ccaf8102eea7[team].var_a3442da3fded2730 = level.var_e224ccaf8102eea7[team].var_a3442da3fded2730 + self.var_db548fc480c33eac[4];
        level.var_e224ccaf8102eea7[team].var_bea7a1b2df733cdc = level.var_e224ccaf8102eea7[team].var_bea7a1b2df733cdc + var_4e673c880cb3ff65;
    }
    if (istrue(level.var_37172573e0865e02)) {
        logstring("Player Plunder Total: { Name: " + self.name + ", Team: " + self.team + ", Total Cash: " + var_bbac576aade31a1e + ", Looted: " + self.var_db548fc480c33eac[0] + ", Contracts: " + self.var_db548fc480c33eac[1] + ", Valuables: " + self.var_db548fc480c33eac[2] + ", Lost On Death: " + self.var_db548fc480c33eac[3] + ", Lost On Purchase: " + self.var_db548fc480c33eac[4] + ", Net Dropped: " + var_4e673c880cb3ff65 + " }");
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ffc
// Size: 0x21b
function setuptimelimit() {
    level endon("game_ended");
    var_b0fca93213e625c7 = 120;
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    if (!istrue(level.br_infils_disabled)) {
        level waittill("br_ready_to_jump");
    }
    waitframe();
    var_abf148b8b3fe55c6 = createhudelem("MP_BR_INGAME/EXTRACT_COLLECT_PLUNDER", undefined, "CENTER", "CENTER", 0, -170);
    var_abf148b8b3fe55c6.alpha = 1;
    timerhud = namespace_52f6938dd902c7d0::createservertimer("default", 1.5);
    timerhud namespace_52f6938dd902c7d0::setpoint("CENTER", "CENTER", 0, -150);
    var_d7daa4eee8e4bd3c = getdvarint(@"hash_a718bf7355e667a3", 180);
    if (var_d7daa4eee8e4bd3c > 0) {
        setomnvar("ui_hardpoint_timer", gettime() + int(var_d7daa4eee8e4bd3c * 1000));
        timerhud settimer(var_d7daa4eee8e4bd3c);
        wait(var_d7daa4eee8e4bd3c);
    }
    namespace_4b0406965e556711::gameflagset("collect_done");
    var_532c835e523ef572 = getdvarint(@"hash_9fd551b851144f28", 180);
    if (var_532c835e523ef572 > 0) {
        var_abf148b8b3fe55c6.label = "MP_BR_INGAME/EXTRACT_HELIPADS_ACTIVE";
        var_abf148b8b3fe55c6 thread huddopulse();
        setomnvar("ui_hardpoint_timer", gettime() + int(var_532c835e523ef572 * 1000));
        timerhud settimer(var_532c835e523ef572);
        wait(var_532c835e523ef572);
    }
    namespace_4b0406965e556711::gameflagset("helipad_wait_done");
    var_f8dd42f6bc48954b = getdvarint(@"hash_db683ed24a430594", 840);
    var_abf148b8b3fe55c6.label = "MP_BR_INGAME/EXTRACT_HELIPAD";
    var_abf148b8b3fe55c6 thread huddopulse();
    setomnvar("ui_hardpoint_timer", gettime() + int(var_f8dd42f6bc48954b * 1000));
    timerhud settimer(var_f8dd42f6bc48954b);
    var_98ee5131da5693 = max(var_f8dd42f6bc48954b - var_b0fca93213e625c7, 0);
    wait(var_98ee5131da5693);
    timeleft = max(var_f8dd42f6bc48954b - var_98ee5131da5693, 0);
    timerhud.color = (1, 0, 0);
    timerhud thread huddopulse();
    thread clocksounds(timeleft);
    wait(timeleft);
    timerhud destroy();
    thread brendgame();
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x421e
// Size: 0xd3
function clocksounds(timeleft) {
    level endon("game_ended");
    while (timeleft > 0) {
        dosound = 0;
        var_14ccd6e81fce3bd4 = namespace_d576b6dc7cef9c62::getclocksoundaliasfortimeleft(timeleft);
        if (timeleft > 60 && timeleft % 10 == 0 || timeleft <= 60 && timeleft > 30 && timeleft % 2 == 0 || timeleft <= 30) {
            dosound = 1;
        }
        if (dosound) {
            foreach (player in level.players) {
                player playlocalsound(var_14ccd6e81fce3bd4);
            }
        }
        timeleft = timeleft - 1;
        wait(1);
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x42f8
// Size: 0xb0
function function_9846f99ee86791d8(timeleft) {
    level endon("game_ended");
    wait(2);
    while (isdefined(timeleft) && timeleft > 0) {
        dosound = 0;
        var_14ccd6e81fce3bd4 = namespace_d576b6dc7cef9c62::getclocksoundaliasfortimeleft(timeleft);
        if (timeleft <= 10) {
            dosound = 1;
        }
        if (dosound) {
            foreach (player in level.players) {
                player playlocalsound(var_14ccd6e81fce3bd4);
            }
        }
        timeleft = timeleft - 1;
        wait(1);
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x43af
// Size: 0x340
function setupteamplunderhud() {
    var_d1f0e5189f1576d0 = 155;
    var_a1ca4daa7621c02f = 15;
    var_b4c134e149b2e70b = -3;
    var_d2c8c88f6ff982fa = 3;
    if (level.teamplunderscoremechanic) {
        cost = getwincost();
        text = "MP_BR_INGAME/WIN_COST_TEXT";
        hudcost = cost;
    } else {
        cost = getcost();
        text = "MP_BR_INGAME/EXTRACT_COST_TEXT";
        hudcost = cost * 10;
    }
    level.brgametype.hudcoststring = createhudelem(text, undefined, "LEFT", "CENTER", var_d2c8c88f6ff982fa, var_d1f0e5189f1576d0, undefined, undefined, 1);
    level.brgametype.hudcost = createhudelem("MP_BR_INGAME/EXTRACT_COST_MILLION", undefined, "LEFT", "CENTER", 65 + var_d2c8c88f6ff982fa, var_d1f0e5189f1576d0, undefined, undefined, 1);
    level.brgametype.hudplunderstring = createhudelem("MP_BR_INGAME/YOUR_TEAM_PLUNDER_TEXT", undefined, "RIGHT", "CENTER", 5 + var_b4c134e149b2e70b, var_d1f0e5189f1576d0, undefined, undefined, 1);
    var_a7f7937dc17270c2 = 0;
    level.brgametype.leaderplunderstring = createhudelem("MP_BR_INGAME/LEADER_PLUNDER_TEXT", var_a7f7937dc17270c2, "CENTER", "CENTER", 0, var_d1f0e5189f1576d0 + var_a1ca4daa7621c02f, undefined, undefined, 1);
    foreach (team in level.teamnamelist) {
        hudPlunder = createhudelem("MP_BR_INGAME/EXTRACT_PLUNDER", 0, "RIGHT", "CENTER", 70 + var_b4c134e149b2e70b, var_d1f0e5189f1576d0, undefined, team, 1);
        var_a6c3de7cc9ced93d = createhudelem("MP_BR_INGAME/ST_PLACE", undefined, "RIGHT", "CENTER", -65 + var_b4c134e149b2e70b, var_d1f0e5189f1576d0, undefined, team, 1);
        var_a6c3de7cc9ced93d setvalue(1);
        hudPlunder.placement = var_a6c3de7cc9ced93d;
        setteamplunderhud(team, hudPlunder);
    }
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    if (!istrue(level.br_infils_disabled)) {
        level waittill("br_ready_to_jump");
    }
    level.brgametype.hudcoststring.alpha = 1;
    level.brgametype.hudcost.alpha = 1;
    level.brgametype.hudplunderstring.alpha = 1;
    level.brgametype.leaderplunderstring.alpha = 1;
    foreach (team in level.teamnamelist) {
        hudPlunder = getteamplunderhud(team);
        hudPlunder.alpha = 1;
        hudPlunder.placement.alpha = 1;
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x46f6
// Size: 0x41
function setteamplunderhud(team, hudelem) {
    level.teamdata[team]["hudPlunder"] = hudelem;
    hudelem.plundercount = 0;
    hudelem.plundercountroll = 0;
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x473e
// Size: 0x1d
function getteamplunderhud(team) {
    return level.teamdata[team]["hudPlunder"];
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params a, eflags: 0x0
// Checksum 0x0, Offset: 0x4763
// Size: 0x1a6
function createhudelem(label, value, point, relativepoint, xoffset, yoffset, color, team, fontscale, player) {
    if (!isdefined(fontscale)) {
        fontscale = 1.5;
    }
    if (isdefined(team)) {
        fontelem = newteamhudelem(team);
    } else if (isdefined(player)) {
        fontelem = newclienthudelem(player);
    } else {
        fontelem = newhudelem();
    }
    fontelem.elemtype = "font";
    fontelem.font = "default";
    fontelem.fontscale = fontscale;
    fontelem.basefontscale = fontscale;
    fontelem.x = 0;
    fontelem.y = 0;
    fontelem.width = 0;
    fontelem.height = int(level.fontheight * fontscale);
    fontelem.xoffset = 0;
    fontelem.yoffset = 0;
    fontelem.children = [];
    fontelem namespace_52f6938dd902c7d0::setparent(level.uiparent);
    fontelem.hidden = 0;
    fontelem.alpha = 0;
    fontelem namespace_52f6938dd902c7d0::setpoint(point, relativepoint, xoffset, yoffset);
    if (isdefined(label)) {
        fontelem.label = label;
    }
    if (isdefined(value)) {
        fontelem setvalue(value);
    }
    if (isdefined(color)) {
        fontelem.color = color;
    }
    return fontelem;
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4911
// Size: 0x17
function sortplayerplunderscores(var_c2b61e43fa917c18, var_c2b62143fa9182b1) {
    return var_c2b61e43fa917c18 > var_c2b62143fa9182b1;
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4930
// Size: 0x4b
function hackclientomnvarclamp(omnvar, val) {
    var_68a4063209579d4f = int(min(val, 131072));
    /#
        assertex(val == var_68a4063209579d4f, "plunderRankUpdate() passed invalid omnvar value of: " + val);
    #/
    setcachedclientomnvar(omnvar, var_68a4063209579d4f);
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4982
// Size: 0x4b
function hackomnvarclamp(omnvar, val) {
    var_68a4063209579d4f = int(min(val, 131072));
    /#
        assertex(val == var_68a4063209579d4f, "plunderRankUpdate() passed invalid omnvar value of: " + val);
    #/
    setcachedgameomnvar(omnvar, var_68a4063209579d4f);
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x49d4
// Size: 0xe0b
function plunderrankupdate() {
    level endon("game_ended");
    var_61a13391e0337903 = 0;
    var_5a1b98786f638bb3 = [];
    var_53ba034cdc687f01 = 0;
    var_9d41c15dc3dfa5e4 = 0;
    var_556e0039a439cd2 = 0;
    var_73f830db146a9277 = 0;
    var_ad5e6d3e7e4cc004 = 0;
    var_f6780228ec69f8d5 = 0;
    var_39926f7b2de6c632 = level.hideleaderhashuntilpercent != 0;
    level.splashtime_vip = undefined;
    level.splashtime_lzs = undefined;
    level.splashtime_drops = undefined;
    level.splashtime_helis = undefined;
    while (1) {
        waittillframeend();
        var_20085f3d87bac60b = level.called50percentprogress && level.called75percentprogress && level.called90percentprogress;
        var_4e21022c04d88e00 = getwincost();
        var_61a13391e0337903 = var_61a13391e0337903 + level.framedurationseconds;
        if (istrue(level.usemilestonephases)) {
            var_1910592d7cd985fe = namespace_4b0406965e556711::gameflag("placement_updates_allowed");
        } else {
            var_1910592d7cd985fe = var_61a13391e0337903 > level.secondsbeforeplacementupdates;
        }
        var_9c81a0995e8f1c76 = level.showplacementsplashesandmusic && var_1910592d7cd985fe;
        var_c3e10a42a81ade25 = getteamscoreplacements();
        var_89f63b69f41ad35a = level.teamplunderscoremechanic;
        var_745ae0b656709a1 = undefined;
        var_73d1d0b655ddf10 = undefined;
        var_734360b6553f75d = undefined;
        var_44578707af5385ce = [];
        var_87b32cca2597530f = [];
        var_e3759b02f55695c2 = [];
        winningteam = "none";
        var_276b54e205081271 = "none";
        highscore = -1;
        var_8acbb0d8ac1fc9fa = -1;
        foreach (team in level.teamnamelist) {
            plundercount = namespace_c6ccccd95254983f::getteamplunder(team);
            var_6d2f3c5e7285f710 = namespace_c6ccccd95254983f::getbankedplunder(team);
            delta = updateteamplunderscore(plundercount, team, level.brgametype.firstteam);
            var_ba2432a58dd7ebd3 = getpreviousplacement(team);
            placement = var_c3e10a42a81ade25[team];
            if (plundercount > highscore) {
                if (highscore > var_8acbb0d8ac1fc9fa) {
                    var_8acbb0d8ac1fc9fa = highscore;
                    var_276b54e205081271 = winningteam;
                }
                highscore = plundercount;
                winningteam = team;
            } else if (winningteam != "none") {
                if (plundercount > var_8acbb0d8ac1fc9fa) {
                    var_8acbb0d8ac1fc9fa = plundercount;
                    var_276b54e205081271 = team;
                }
            }
            var_bc8fbd02e2c5e2b8 = (plundercount - var_6d2f3c5e7285f710) * 10;
            total = plundercount * 10;
            var_d8fed4d7ad83256a = total - var_bc8fbd02e2c5e2b8;
            if (var_bc8fbd02e2c5e2b8 < 0) {
                /#
                    println("spawned_player" + plundercount + "gamestate_75_perc_enemy" + var_6d2f3c5e7285f710 + "ui_br_timed_feature_end_time" + var_bc8fbd02e2c5e2b8);
                #/
                var_bc8fbd02e2c5e2b8 = 0;
            }
            if (total >= var_4e21022c04d88e00 * 0.9) {
                var_745ae0b656709a1 = team;
            } else if (total >= var_4e21022c04d88e00 * 0.75) {
                var_73d1d0b655ddf10 = team;
            } else if (total >= var_4e21022c04d88e00 * 0.5) {
                var_734360b6553f75d = team;
            }
            if (total >= var_4e21022c04d88e00 * level.plundermusicfourth) {
                thread namespace_3bde6869e44a2770::plunder_ninetypercent_music();
            } else if (total >= var_4e21022c04d88e00 * level.plundermusicthird) {
                thread namespace_3bde6869e44a2770::plunder_seventyfivepercent_music();
            } else if (total >= var_4e21022c04d88e00 * level.plundermusicsecond) {
                thread namespace_3bde6869e44a2770::plunder_fiftypercent_music();
            } else if (total >= var_4e21022c04d88e00 * level.plundermusicfirst) {
                thread namespace_3bde6869e44a2770::plunder_thirtypercent_music();
            }
            players = getfriendlyplayers(team, 0);
            foreach (player in players) {
                placement = var_c3e10a42a81ade25[player.team];
                if (!var_ad5e6d3e7e4cc004) {
                    placement = 155;
                }
                player setcachedclientomnvar("ui_br_team_placement", placement);
                player setcachedclientomnvar("ui_br_player_position", placement);
                player hackclientomnvarclamp("ui_br_team_cash_banked", int(var_d8fed4d7ad83256a * 0.1));
                player hackclientomnvarclamp("ui_br_team_cash_pockets", int(var_bc8fbd02e2c5e2b8 * 0.1));
                var_87b32cca2597530f[player.guid] = player.plundercount;
                var_e3759b02f55695c2[player.guid] = player;
            }
            if (var_9c81a0995e8f1c76) {
                if (placement == 1) {
                    var_44578707af5385ce[var_44578707af5385ce.size] = team;
                } else if (placement <= 5) {
                    if (var_ba2432a58dd7ebd3 > 5) {
                        if (getdvarint(@"hash_eabb43d303ca5c9c", 0)) {
                            showsplashtoteam(team, "bm_top_5", undefined, undefined, undefined, undefined, "splash_list_br_plunder_iw9_mp");
                        }
                    }
                } else if (placement <= 10) {
                    if (var_ba2432a58dd7ebd3 > 10) {
                        if (getdvarint(@"hash_a245d6517f1b4f1c", 0)) {
                            showsplashtoteam(team, "bm_top_10", undefined, undefined, undefined, undefined, "splash_list_br_plunder_iw9_mp");
                        }
                    }
                }
            }
            if (total >= var_4e21022c04d88e00) {
                autobankteamplunder(team);
                if (var_89f63b69f41ad35a && level.doendofmatchotsequence > 0 && !level.disablewinonscore) {
                    level thread triggerovertimetimer(team, level.teamdata[team]["plunderBanked"] * 10 >= var_4e21022c04d88e00);
                } else if (var_89f63b69f41ad35a && level.doendofmatchotsequence > 0 && level.disablewinonscore) {
                    level.initialwinningteam = team;
                } else if (level.teamplunderexfil && !istrue(level.exfilactive)) {
                    level.exfilactive = 1;
                    level thread startbmoexfilprocess(team);
                } else if (!level.teamplunderexfil && var_89f63b69f41ad35a && !level.disablewinonscore) {
                    level thread givewincondition(team);
                }
            }
        }
        var_ddd20d819a369a7d = [];
        var_348ab76f83b33509 = [];
        if (level.lootleadermarksontopteams == 1) {
            var_ddd20d819a369a7d = tablesort(game["teamPlacements"], "up");
        } else if (level.lootleadermarksontopteams == 2) {
            var_ddd20d819a369a7d[0] = winningteam;
            var_348ab76f83b33509 = tablesort(var_87b32cca2597530f, "down");
        } else {
            var_348ab76f83b33509 = tablesort(var_87b32cca2597530f, "down");
        }
        level.brgametype.firstteam = winningteam;
        if (winningteam == "none") {
            var_5a1b98786f638bb3 = [];
            waitframe();
            continue;
        }
        if (var_276b54e205081271 != "none") {
            hackomnvarclamp("ui_br_cash_second", int(var_8acbb0d8ac1fc9fa));
        }
        hackomnvarclamp("ui_br_cash_leader", int(highscore));
        if (!var_39926f7b2de6c632 && highscore * 10 >= var_4e21022c04d88e00 * level.hideleaderhashuntilpercent * 0.01) {
            setomnvar("ui_br_leader_hash_percentage_hit", 1);
            var_39926f7b2de6c632 = 1;
        }
        if (!istrue(var_f6780228ec69f8d5) && istrue(level.usemilestonephases)) {
            if (!var_53ba034cdc687f01 && highscore * 10 >= var_4e21022c04d88e00 * level.milestonephasepercent_vips * 0.01) {
                var_53ba034cdc687f01 = 1;
                level.splashtime_vip = gettime();
                namespace_4b0406965e556711::gameflagset("placement_updates_allowed");
                if (!namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
                    showsplashtoall("bm_vips_marked", undefined, undefined, undefined, undefined, "splash_list_br_plunder_iw9_mp");
                }
            }
            if (!var_9d41c15dc3dfa5e4 && (level.scorerequiresbanking || highscore * 10 >= var_4e21022c04d88e00 * level.milestonephasepercent_lzs * 0.01)) {
                var_9d41c15dc3dfa5e4 = 1;
                level.splashtime_lzs = gettime();
                namespace_4b0406965e556711::gameflagset("activate_cash_lzs");
                if (!namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
                    namespace_d3d40f75bb4e4c32::brleaderdialog("extract_enabled", 0, undefined, undefined, undefined, "bm");
                }
            }
            if (!var_556e0039a439cd2 && highscore * 10 >= var_4e21022c04d88e00 * level.milestonephasepercent_drops * 0.01) {
                var_556e0039a439cd2 = 1;
                level.splashtime_drops = gettime();
                level.br_level.c130_speedoverride = 3044;
                namespace_4b0406965e556711::gameflagset("activate_cash_drops");
                if (!namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
                    namespace_d3d40f75bb4e4c32::brleaderdialog("event_airdrop", 0, undefined, undefined, undefined, "bm");
                }
            }
            if (!var_73f830db146a9277 && (istrue(level.bmoovertime) || highscore * 10 >= var_4e21022c04d88e00 * level.milestonephasepercent_helis * 0.01)) {
                var_73f830db146a9277 = 1;
                level.splashtime_helis = gettime();
                namespace_4b0406965e556711::gameflagset("activate_cash_helis");
                if (!namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
                    namespace_d3d40f75bb4e4c32::brleaderdialog("event_chopper", 0, undefined, undefined, undefined, "bm");
                }
            }
            if (var_53ba034cdc687f01 && var_9d41c15dc3dfa5e4 && var_556e0039a439cd2 && var_73f830db146a9277) {
                var_f6780228ec69f8d5 = 1;
            }
        }
        if (!var_ad5e6d3e7e4cc004 && highscore * 10 >= var_4e21022c04d88e00 * level.hideplacementuntilpercent * 0.01) {
            var_ad5e6d3e7e4cc004 = 1;
        }
        if (!var_9c81a0995e8f1c76 || highscore == 0) {
            waitframe();
            continue;
        }
        if (level.lootleadermarksontopteams > 0) {
            if (level.dmzlootleaderupdateonpickup || istrue(level.plunderupdatelootleadermarks)) {
                updatelootleadermarks(var_87b32cca2597530f, var_348ab76f83b33509, var_e3759b02f55695c2, var_ddd20d819a369a7d);
                level.plunderupdatelootleadermarks = 0;
            }
        } else if (level.dmzlootleaderupdateonpickup || istrue(level.plunderupdatelootleadermarks)) {
            updatelootleadermarks(var_87b32cca2597530f, var_348ab76f83b33509, var_e3759b02f55695c2);
            level.plunderupdatelootleadermarks = 0;
        }
        foreach (team in var_44578707af5385ce) {
            if (!array_contains(var_5a1b98786f638bb3, team)) {
                if (istrue(level.topteamsever[team])) {
                    if (getdvarint(@"hash_fb39b1c02691c31b", 0)) {
                        if (!namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
                            showsplashtoteam(team, "br_plunder_took_the_lead", undefined, undefined, undefined, undefined, "splash_list_br_plunder_iw9_mp");
                        }
                    }
                } else {
                    if (!namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
                        showsplashtoteam(team, "br_plunder_took_the_lead", undefined, undefined, undefined, undefined, "splash_list_br_plunder_iw9_mp");
                    }
                    level.topteamsever[team] = 1;
                }
            }
        }
        if (getdvarint(@"hash_7e82fb8d960e5fea", 0)) {
            if (var_44578707af5385ce.size > 0) {
                foreach (team in var_5a1b98786f638bb3) {
                    if (!array_contains(var_44578707af5385ce, team)) {
                        showsplashtoteam(team, "br_plunder_lead_lost", undefined, undefined, undefined, undefined, "splash_list_br_plunder_iw9_mp");
                    }
                }
            }
        }
        var_5a1b98786f638bb3 = var_44578707af5385ce;
        level.topteam = winningteam;
        level.previousplacements = var_c3e10a42a81ade25;
        if (!var_20085f3d87bac60b) {
            if (!level.called90percentprogress && isdefined(var_745ae0b656709a1)) {
                level.called90percentprogress = 1;
                if (!namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
                    if (!level.disablepercentageannouncements) {
                        showsplashtoallexceptteam(var_745ae0b656709a1, "bm_first_to_90_them", undefined, undefined, undefined, undefined, "splash_list_br_plunder_iw9_mp");
                        showsplashtoteam(var_745ae0b656709a1, "bm_first_to_90_us", undefined, undefined, undefined, undefined, "splash_list_br_plunder_iw9_mp");
                        if (istrue(level.var_29af3a470e92b6e1)) {
                            level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("gamestate_90_perc_first", var_745ae0b656709a1, 1, undefined, "bm");
                            foreach (entry in level.teamnamelist) {
                                if (entry != var_745ae0b656709a1) {
                                    level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("gamestate_90_perc_enemy", entry, 1, undefined, "bm");
                                }
                            }
                        }
                    }
                }
            } else if (!level.called75percentprogress && isdefined(var_73d1d0b655ddf10)) {
                level.called75percentprogress = 1;
                if (!namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
                    if (!level.disablepercentageannouncements) {
                        showsplashtoallexceptteam(var_73d1d0b655ddf10, "bm_first_to_75_them", undefined, undefined, undefined, undefined, "splash_list_br_plunder_iw9_mp");
                        showsplashtoteam(var_73d1d0b655ddf10, "bm_first_to_75_us", undefined, undefined, undefined, undefined, "splash_list_br_plunder_iw9_mp");
                        if (istrue(level.var_29af3a470e92b6e1)) {
                            level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("gamestate_75_perc_first", var_73d1d0b655ddf10, 1, undefined, "bm");
                            foreach (entry in level.teamnamelist) {
                                if (entry != var_73d1d0b655ddf10) {
                                    level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("gamestate_75_perc_enemy", entry, 1, undefined, "bm");
                                }
                            }
                        }
                    }
                }
            } else if (!level.called50percentprogress && isdefined(var_734360b6553f75d)) {
                level.called50percentprogress = 1;
                if (!namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
                    if (!level.disablepercentageannouncements) {
                        showsplashtoallexceptteam(var_734360b6553f75d, "bm_first_to_50_them", undefined, undefined, undefined, undefined, "splash_list_br_plunder_iw9_mp");
                        showsplashtoteam(var_734360b6553f75d, "bm_first_to_50_us", undefined, undefined, undefined, undefined, "splash_list_br_plunder_iw9_mp");
                        if (istrue(level.var_29af3a470e92b6e1)) {
                            level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("gamestate_50_perc_first", var_734360b6553f75d, 1, undefined, "bm");
                            foreach (entry in level.teamnamelist) {
                                if (entry != var_734360b6553f75d) {
                                    level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("gamestate_50_perc_enemy", entry, 1, undefined, "bm");
                                }
                            }
                        }
                    }
                }
            }
        }
        waitframe();
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x57e6
// Size: 0x109
function autobankteamplunder(team) {
    if (!level.var_ad5e78c78f492751) {
        return;
    }
    if (!isdefined(level.autobankedteams)) {
        level.autobankedteams = [];
    }
    if (array_contains(level.autobankedteams, team)) {
        return;
    }
    players = getteamdata(team, "players");
    data = namespace_c6ccccd95254983f::createplayerplundereventdata();
    data.playanimation = 0;
    foreach (player in players) {
        if (isdefined(player.plundercount) && player.plundercount > 0) {
            player namespace_c6ccccd95254983f::playerplunderbank(player.plundercount, undefined, data);
        }
    }
    level.autobankedteams[level.autobankedteams.size] = team;
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x58f6
// Size: 0x15
function overtimecashmultiplier() {
    level thread namespace_c6ccccd95254983f::processcashpileovertimemultiplier(level.overtimecashmultiplier);
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5912
// Size: 0x32
function placementupdatewait() {
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    if (isdefined(level.secondsbeforeplacementupdates)) {
        wait(level.secondsbeforeplacementupdates);
    }
    namespace_4b0406965e556711::gameflagset("placement_updates_allowed");
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x594b
// Size: 0x27
function getpreviousplacement(team) {
    if (isdefined(level.previousplacements)) {
        return level.previousplacements[team];
    }
    return -1;
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x597a
// Size: 0x98
function triggermatchendtimer(endtime) {
    namespace_d576b6dc7cef9c62::resumetimer();
    level.starttime = gettime();
    level.discardtime = 0;
    level.timerpausetime = 0;
    timelimit = getdvarfloat(@"hash_4dcbff985e3e175e", 10);
    gamemode = function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_timelimit");
    level.watchdvars[gamemode].value = timelimit;
    level.overridewatchdvars[gamemode] = timelimit;
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5a19
// Size: 0xed
function updateteamplunderhud(team) {
    hudPlunder = getteamplunderhud(team);
    plundercount = namespace_c6ccccd95254983f::getteamplunder(team);
    cost = getcost();
    if (plundercount >= cost && hudPlunder.color != (0, 1, 0)) {
        hudPlunder.color = (0, 1, 0);
        teammates = level.teamdata[team]["players"];
        foreach (player in teammates) {
            player playlocalsound("br_plunder_atm_deposit_gtr");
        }
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5b0d
// Size: 0xf2
function dohudplunderrollsound(sign, team) {
    teammates = level.teamdata[team]["players"];
    foreach (player in teammates) {
        if (sign > 0) {
            if (isdefined(player.hudplunderstart)) {
                duration = gettime() - player.hudplunderstart;
                if (duration <= 6000) {
                    break;
                }
            }
            player.hudplunderstart = gettime();
            if (isalive(player)) {
                player playlocalsound("br_plunder_atm_use");
            }
        } else {
            player.hudplunderstart = undefined;
            player stoplocalsound("br_plunder_atm_use");
        }
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5c06
// Size: 0x62
function givewincondition(var_65669339223f29b4) {
    if (istrue(level.triggeredwincondition)) {
        return;
    }
    if (!istrue(level.triggeredwincondition)) {
        level thread printallteamsplundercount();
    }
    level.triggeredwincondition = 1;
    level thread namespace_d576b6dc7cef9c62::endgame(var_65669339223f29b4, game["end_reason"]["plunder_win"], game["end_reason"]["plunder_loss"], 0, 1);
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5c6f
// Size: 0x3b9
function playerdropplunderondeath(dropstruct, attacker) {
    if (isdefined(self.c130)) {
        return 1;
    }
    if (istrue(level.gameended)) {
        return 1;
    }
    var_47545befc5dedb97 = 0;
    var_6aee9c9054f09ed5 = 0;
    var_b64f283113c99581 = 0;
    if (isdefined(self.plundercount)) {
        var_47545befc5dedb97 = self.plundercount;
    }
    if (istrue(self.isdisconnecting)) {
        var_b64f283113c99581 = self.plundercount;
        var_ae5066e110a1c221 = self.plundercount;
        var_6aee9c9054f09ed5 = 0;
    } else {
        var_cb4fad49263e20c4 = namespace_c6ccccd95254983f::function_79275e2fab13f54d();
        var_b64f283113c99581 = var_cb4fad49263e20c4.var_b64f283113c99581;
        var_6aee9c9054f09ed5 = var_cb4fad49263e20c4.var_6aee9c9054f09ed5;
        var_f89b84ff9f1f99a1 = 1;
        var_42481e73fc7b0f4b = 0;
        if (istrue(self.wasexecuted)) {
            var_70a6fb3167529e17 = level.executioncashmultiplier;
            if (namespace_d76af9f804655767::ispubliceventoftypeactive(12)) {
                var_70a6fb3167529e17 = var_70a6fb3167529e17 * level.br_pe_data[12].var_ee5fb771f83add5e;
            }
            var_f89b84ff9f1f99a1 = var_f89b84ff9f1f99a1 * var_70a6fb3167529e17;
        }
        if (istrue(level.bmoovertime) && (!isdefined(attacker) || self != attacker)) {
            var_f89b84ff9f1f99a1 = var_f89b84ff9f1f99a1 * level.overtimecashmultiplier;
        }
        var_b64f283113c99581 = var_b64f283113c99581 * var_f89b84ff9f1f99a1;
        var_b64f283113c99581 = var_b64f283113c99581 + var_42481e73fc7b0f4b;
        var_651927b6a8813428 = level.minplunderdropondeath;
        var_f84c055c8b9bf87e = level.maxplunderdropondeath;
        if (istrue(level.bmoovertime)) {
            if (isdefined(level.bonusdeathplunderot) && (!isdefined(var_651927b6a8813428) || level.bonusdeathplunderot > var_651927b6a8813428)) {
                var_651927b6a8813428 = level.bonusdeathplunderot;
            }
            if (isdefined(level.maxplunderdropinovertime)) {
                var_f84c055c8b9bf87e = level.maxplunderdropinovertime;
            }
        }
        if (!isdefined(var_651927b6a8813428)) {
            var_651927b6a8813428 = 0;
        }
        if (isdefined(var_f84c055c8b9bf87e)) {
            var_b64f283113c99581 = int(clamp(var_b64f283113c99581, var_651927b6a8813428, var_f84c055c8b9bf87e));
        } else {
            var_b64f283113c99581 = int(max(var_b64f283113c99581, var_651927b6a8813428));
        }
    }
    var_ae5066e110a1c221 = int(max(var_47545befc5dedb97 - var_6aee9c9054f09ed5, 0));
    self.plundercountondeath = var_6aee9c9054f09ed5;
    if (var_ae5066e110a1c221 > 0) {
        namespace_c6ccccd95254983f::playerplunderdrop(var_ae5066e110a1c221);
    }
    if (var_b64f283113c99581 > 0) {
        var_e05413a53b5d9167 = dropplunderbyrarity(var_b64f283113c99581, dropstruct);
        foreach (ent in var_e05413a53b5d9167) {
            ent.lootsource = "combat";
        }
    }
    if (isdefined(level.lootleaders) && array_contains(level.lootleaders, self)) {
        playfx(getfx("money"), self.origin + (0, 0, 64));
    }
    if (isdefined(attacker) && self == attacker || !level.killcam) {
        self setclientomnvar("ui_cash_dropped", var_ae5066e110a1c221);
    } else {
        self.postkillcamplunderlost = var_ae5066e110a1c221;
    }
    namespace_a011fbf6d93f25e5::trackcashevent(self, "combat", var_ae5066e110a1c221 * -1);
    namespace_c6ccccd95254983f::function_5a2284274d70f7d(3, var_ae5066e110a1c221);
    if (namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
        level notify("victim_death_drop", self);
    }
    /#
        var_73dc67ec76d54557 = string(max(var_47545befc5dedb97 - var_6aee9c9054f09ed5 + var_b64f283113c99581, 0));
        println("veh_apache_plunder_mp" + var_47545befc5dedb97 + "tag_fx" + var_6aee9c9054f09ed5 + "EXE/PLAYERKICKED_EXTRACTED" + var_b64f283113c99581 + "brData" + var_73dc67ec76d54557);
    #/
    return 1;
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6030
// Size: 0x34
function onpostkillcamcallback() {
    if (isdefined(self.postkillcamplunderlost)) {
        self setclientomnvar("ui_cash_dropped", int(self.postkillcamplunderlost));
        self.postkillcamplunderlost = undefined;
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x606b
// Size: 0x230
function dropplunderbyrarity(amount, dropstruct) {
    if (!istrue(level.br_plunder_enabled)) {
        return;
    }
    var_e05413a53b5d9167 = [];
    numspawns = [];
    totalcount = 0;
    for (i = level.br_plunder.quantity.size - 1; i >= 0; i--) {
        numspawns[i] = int(amount / level.br_plunder.quantity[i]);
        totalcount = totalcount + numspawns[i];
        if (amount <= 0) {
            break;
        } else {
            amount = amount - numspawns[i] * level.br_plunder.quantity[i];
        }
    }
    for (var_f90d0e006a1f717b = level.br_plunder.quantity.size - 1; var_f90d0e006a1f717b >= 0; var_f90d0e006a1f717b--) {
        if (!isdefined(numspawns[var_f90d0e006a1f717b])) {
            continue;
        }
        for (itemindex = 0; itemindex < numspawns[var_f90d0e006a1f717b]; itemindex++) {
            var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, self.origin, self.angles, self);
            pickupent = namespace_cb965d2f71fefddc::spawnpickup(level.br_plunder.names[var_f90d0e006a1f717b], var_cb4fad49263e20c4, level.br_plunder.quantity[var_f90d0e006a1f717b], 1);
            namespace_c6ccccd95254983f::modify_plunder_itemsinworld(level.br_plunder.names[var_f90d0e006a1f717b], 1);
            if (isdefined(pickupent)) {
                var_e05413a53b5d9167[var_e05413a53b5d9167.size] = pickupent;
                if (namespace_c6ccccd95254983f::inplunderlivelobby()) {
                    level.br_plunder_ents[level.br_plunder_ents.size] = pickupent;
                }
            }
        }
    }
    level.br_plunder.plunder_items_dropped = level.br_plunder.plunder_items_dropped + totalcount;
    level.br_plunder.plunder_value_dropped = level.br_plunder.plunder_value_dropped + amount;
    level thread namespace_c6ccccd95254983f::dropplundersounds(self.origin, var_e05413a53b5d9167.size);
    return var_e05413a53b5d9167;
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x62a3
// Size: 0x5f
function getcost() {
    if (level.dmzminextractcost > 0) {
        cost = int(max(level.dmzminextractcost, level.dmzextractcost - level.brgametype.numextractions * level.dmzextractcostdecrease));
    }
    return level.dmzextractcost;
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x630a
// Size: 0xc
function getwincost() {
    return level.dmzwincost;
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x631e
// Size: 0x63
function playertakeextractionplunder(amount) {
    if (self.plundercount < amount) {
        amount = self.plundercount;
    }
    if (!isdefined(self.plunderforextract)) {
        self.plunderforextract = 0;
    }
    self.plunderforextract = self.plunderforextract + amount;
    namespace_c6ccccd95254983f::playersetplundercount(self.plundercount - amount);
    return amount;
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6389
// Size: 0x7a
function teamclearextractplunder(team) {
    teammates = level.teamdata[team]["players"];
    foreach (player in teammates) {
        player.plunderforextract = 0;
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x640a
// Size: 0xac
function teamrefundplunder(team) {
    teammates = level.teamdata[team]["players"];
    foreach (player in teammates) {
        if (isdefined(player.plunderforextract)) {
            player namespace_c6ccccd95254983f::playerplunderpickup(player.plunderforextract, undefined, undefined, 1);
            player.plunderforextract = 0;
            player iprintlnbold("Extraction refunded, chopper shot down.");
        }
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x64bd
// Size: 0x84
function huddopulse() {
    self endon("death");
    if (istrue(self.pulsing)) {
        return;
    }
    var_cc2c2f3eac3c7bd2 = 0.5;
    var_5f2809f4e8852c13 = 4;
    self.pulsing = 1;
    var_b96028986997e29c = self.fontscale;
    self changefontscaleovertime(var_cc2c2f3eac3c7bd2);
    self.fontscale = var_5f2809f4e8852c13;
    wait(var_cc2c2f3eac3c7bd2);
    self changefontscaleovertime(var_cc2c2f3eac3c7bd2);
    self.fontscale = var_b96028986997e29c;
    self.pulsing = undefined;
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6548
// Size: 0x11b
function drophelicrate(heli) {
    crate = spawn("script_model", heli.origin);
    crate setmodel("military_skyhook_backpack");
    startorg = heli.origin;
    end = (startorg[0], startorg[1], -12000);
    contents = create_contents(0, 1, 1, 1, 1, 1, 0);
    trace = ray_trace(startorg, end, heli, contents);
    var_1230ea36a300368 = trace["position"];
    dist = startorg[2] - var_1230ea36a300368[2];
    if (dist > 0) {
        time = sqrt(2 * dist / 800);
        crate moveto(var_1230ea36a300368, time, time, 0);
        wait(time);
    }
    crate.origin = var_1230ea36a300368;
    playfx(getfx("airdrop_crate_impact_ground"), var_1230ea36a300368);
    crate cratedropplunder();
    crate delete();
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x666a
// Size: 0x2e
function cratedropplunder() {
    amount = getcost();
    dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
    namespace_c6ccccd95254983f::dropplunderbyrarity(amount, dropstruct);
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x669f
// Size: 0x92
function calculatehelitimetoflysec(var_c45865d4c48493c1, var_88125f10d2b34aa3, var_b2bdd90249635576) {
    var_3d0ec1c05f1e1001 = var_c45865d4c48493c1 * 1.57828e-05;
    a = 0.5 * var_b2bdd90249635576;
    b = var_88125f10d2b34aa3;
    c = -1 * var_3d0ec1c05f1e1001;
    flytime = (-1 * b + sqrt(b * b - 4 * a * c)) / 2 * a;
    flytime = flytime * 3600;
    flytime = flytime + 1.5;
    return flytime;
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6739
// Size: 0x4f
function calculatehelitimetoarrive(var_625180ce8d2f8f77) {
    var_5301ebed8d610fdb = calculatehelitimetoflysec(30000, 100, 125);
    var_eb0fae3483a10d88 = calculatehelitimetoflysec(var_625180ce8d2f8f77, 25, 31.25);
    totaltime = var_5301ebed8d610fdb + var_eb0fae3483a10d88;
    return totaltime;
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x6790
// Size: 0xb5
function helisetteamextractionhud(state, timesec) {
    var_754110404c0d574f = gettime() + int(timesec * 1000);
    teamplayers = level.teamdata[self.team]["alivePlayers"];
    foreach (player in teamplayers) {
        player setcachedclientomnvar("ui_br_plunder_extract_state", state);
        player setcachedclientomnvar("ui_br_timed_feature_end_time", var_754110404c0d574f);
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x684c
// Size: 0x129
function helibankplunder() {
    if (!isdefined(self.plunder)) {
        return;
    }
    level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("plunder_extract_success", self.team, 1);
    var_a8eeb94dcc610b78 = 0;
    var_235f1174e9faa6d2 = 0;
    foreach (item in self.plunder) {
        var_a8eeb94dcc610b78 = var_a8eeb94dcc610b78 + item.plundercount;
        if (item.player.team != self.team) {
            var_235f1174e9faa6d2 = 1;
        }
    }
    namespace_a011fbf6d93f25e5::branalytics_plunder_extraction_success(self.plunder.size, var_a8eeb94dcc610b78, "little_bird", var_235f1174e9faa6d2, self.endpoint);
    level.br_plunder.extraction_helicoptor_total_plunder = level.br_plunder.extraction_helicoptor_total_plunder + var_a8eeb94dcc610b78;
    level.br_plunder.extraction_helicoptor_num_completed++;
    namespace_c6ccccd95254983f::entityplunderbankalldeposited();
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x697c
// Size: 0x3b
function heliusecleanup() {
    if (isdefined(self.usable)) {
        level.br_depots = array_remove(level.br_depots, self.usable);
        self.usable = undefined;
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x69be
// Size: 0x33
function helicleanupdepotonleaving(usable) {
    self.usable endon("death");
    waittill_either("leaving", "death");
    heliusecleanup();
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x69f8
// Size: 0x82
function helicreateextractvfx(position) {
    self.vfxent = spawn("script_model", position);
    self.vfxent setmodel("scr_smoke_grenade");
    self.vfxent.angles = (0, 90, 90);
    self.vfxent playloopsound("smoke_carepackage_smoke_lp");
    self.vfxent setscriptablepartstate("smoke", "on");
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6a81
// Size: 0x7f
function helicleanupextract(var_7158bfc28b4bea09) {
    if (isdefined(self.vfxent)) {
        self.vfxent stoploopsound();
        self.vfxent delete();
    }
    if (istrue(var_7158bfc28b4bea09) && isdefined(self.site)) {
        self.site setscriptablepartstate(self.site.type, self.site.activestate);
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6b07
// Size: 0x7e
function helidisapateextractvfx() {
    self endon("death");
    if (!isdefined(self.vfxent)) {
        return;
    }
    wait(5);
    self.vfxent endon("death");
    self.vfxent setscriptablepartstate("smoke", "dissipate");
    self.vfxent playsound("smoke_canister_tail_dissipate");
    wait(1);
    self.vfxent stoploopsound();
    wait(4.5);
    self.vfxent delete();
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x6b8c
// Size: 0x23b
function spawnheli(owner, pathstart, pathgoal, pathexit) {
    angles = vectortoangles(pathgoal - pathstart);
    numflares = 99;
    modelname = "veh8_mil_air_mindia8_plunder_x";
    vehicle = "veh_apache_plunder_mp";
    if (istrue(level.var_a83a4e71446bfef7)) {
        modelname = "veh9_mil_air_heli_blima_mp_x";
        vehicle = "veh9_mil_air_heli_blima_nophysics_br";
    }
    heli = namespace_f64231d5b7a2c3c4::_spawnhelicopter(owner, pathstart, angles, vehicle, modelname);
    if (!isdefined(heli)) {
        return;
    }
    endpoint = pathgoal * (1, 1, 0);
    heli.damagecallback = &callback_vehicledamage;
    heli.speed = 50;
    heli.accel = 99999;
    heli.health = 1000;
    heli.maxhealth = heli.health;
    heli.team = owner.team;
    heli.owner = owner;
    heli.defendloc = pathgoal;
    heli.lifeid = 0;
    heli.flaresreservecount = numflares;
    heli.pathgoal = pathgoal;
    heli.pathexit = pathexit;
    heli.endpoint = endpoint;
    heli.goalyaw = angles[1];
    heli.vehiclename = "magma_plunder_chopper";
    heli setcandamage(1);
    heli setmaxpitchroll(10, 25);
    heli vehicle_setspeed(heli.speed, heli.accel);
    heli sethoverparams(50, 100, 50);
    heli setturningability(0.05);
    heli setyawspeed(45, 25, 25, 0.5);
    heli setotherent(owner);
    spawnrope(heli);
    heli thread namespace_dc0d47ddf0ead8a3::flares_handleincomingstinger(undefined, undefined);
    heli thread healdamage();
    heli thread handledestroydamage();
    heli thread helidestroyed();
    return heli;
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6dcf
// Size: 0xd0
function spawnrope(heli) {
    rope = spawn("script_model", (0, 0, 0));
    rope setmodel("br_plunder_extraction_delivery_rope");
    rope linkto(heli, "side_door_l_jnt", (11, 20, 42), (0, 180, 0));
    crate = spawn("script_model", (0, 0, 0));
    crate setmodel("br_plunder_extraction_delivery_bag");
    crate linkto(rope, "dyn_rope_end", (0, 0, 0), (0, 0, 0));
    heli.rope = rope;
    heli.crate = crate;
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6ea6
// Size: 0xc7
function helidestroyed() {
    self endon("heli_gone");
    self endon("swapped");
    owner = self.owner;
    team = self.team;
    damagelocation = weaponobject = meansofdeath = attacker = self waittill("death");
    teamrefundplunder(team);
    helicleanup();
    if (!isdefined(self)) {
        return;
    }
    if (!isdefined(self.largeprojectiledamage) && !istrue(self.isdepot)) {
        self vehicle_setspeed(25, 5);
        thread helicrash(75);
        namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(2.7);
    }
    heliexplode(attacker);
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6f74
// Size: 0x3b
function helicleanup() {
    if (isdefined(self.rope)) {
        self.rope delete();
    }
    if (isdefined(self.crate)) {
        self.crate delete();
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6fb6
// Size: 0xf5
function heliexplode(attacker) {
    var_240a4f3d560753ff = self gettagorigin("tag_origin") + (0, 0, 40);
    self radiusdamage(var_240a4f3d560753ff, 256, 140, 70, attacker, "MOD_EXPLOSIVE");
    playfx(getfx("little_bird_explode"), var_240a4f3d560753ff, anglestoforward(self.angles), anglestoup(self.angles));
    playsoundatpos(var_240a4f3d560753ff, "veh_chopper_support_crash");
    earthquake(0.4, 800, var_240a4f3d560753ff, 0.7);
    playrumbleonposition("grenade_rumble", var_240a4f3d560753ff);
    physicsexplosionsphere(var_240a4f3d560753ff, 500, 200, 1);
    self notify("explode");
    wait(0.35);
    level thread namespace_d20f8ef223912e12::teamsplashbr("br_gametype_extract_heli_shot_down", self.owner, self.owner.team);
    helicleanupextract(1);
    helidelete();
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x70b2
// Size: 0xb
function helidelete() {
    namespace_f64231d5b7a2c3c4::_deletevehicle(self);
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x70c4
// Size: 0x6c
function helicrash(speed) {
    self endon("explode");
    self notify("heli_crashing");
    self setvehgoalpos(self.origin + (0, 0, 100), 1);
    namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(1.5);
    self setyawspeed(speed, speed, speed);
    self settargetyaw(self.angles[1] + speed * 2.5);
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7137
// Size: 0x136
function handledestroydamage() {
    self endon("death");
    self endon("leaving");
    self endon("swapped");
    while (1) {
        inflictor = normal = angles = origin = objweapon = idflags = partname = tagname = modelname = meansofdeath = point = direction_vec = attacker = damage = self waittill("damage");
        objweapon = mapweapon(objweapon, inflictor);
        if ((objweapon.basename == "aamissile_projectile_mp" || objweapon.basename == "nuke_mp") && meansofdeath == "MOD_EXPLOSIVE" && damage >= self.health) {
            callback_vehicledamage(attacker, attacker, 9001, 0, meansofdeath, objweapon, point, direction_vec, point, 0, 0, partname);
            helicleanupextract(1);
        }
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 13, eflags: 0x0
// Checksum 0x0, Offset: 0x7274
// Size: 0x18f
function callback_vehicledamage(inflictor, attacker, damage, dflags, meansofdeath, objweapon, point, dir, hitloc, timeoffset, modelindex, partname, eventid) {
    if (isdefined(attacker)) {
        if (isdefined(attacker.owner)) {
            attacker = attacker.owner;
        }
    }
    if ((attacker == self || isdefined(attacker.pers) && attacker.pers["team"] == self.team && !level.friendlyfire && level.teambased) && attacker != self.owner) {
        return;
    }
    if (self.health <= 0) {
        return;
    }
    damage = namespace_a2f809133c566621::getmodifiedantikillstreakdamage(attacker, objweapon, meansofdeath, damage, self.maxhealth, 3, 4, 5);
    namespace_58a74e7d54b56e8d::killstreakhit(attacker, objweapon, self, meansofdeath, damage);
    attacker updatedamagefeedback("");
    if (self.health - damage <= 900 && (!isdefined(self.smoking) || !self.smoking)) {
        self.smoking = 1;
    }
    self vehicle_finishdamage(inflictor, attacker, damage, dflags, meansofdeath, objweapon, point, dir, hitloc, timeoffset, modelindex, partname);
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x740a
// Size: 0xc2
function helileave() {
    self endon("death");
    self notify("leaving");
    self.leaving = 1;
    self setvehgoalpos(self.pathgoal, 1);
    self settargetyaw(self.goalyaw);
    helisetteamextractionhud(3, self.flytime);
    self waittill("goal");
    self vehicle_setspeed(self.speed, self.accel);
    self setvehgoalpos(self.pathexit, 1);
    self settargetyaw(self.goalyaw);
    self waittill("goal");
    self stoploopsound();
    helibankplunder();
    helisetteamextractionhud(0, 0);
    self notify("heli_gone");
    helidelete();
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x74d3
// Size: 0xa5
function helidescend(location, groundz) {
    self endon("death");
    locationx = location[0];
    locationy = location[1];
    newpos = (locationx, locationy, groundz);
    self setvehgoalpos(newpos, 1);
    self settargetyaw(self.goalyaw);
    self vehicle_setspeed(25, 31.25);
    thread helidestroyvehiclestouchnotify();
    thread helidestroyvehiclestouchtrace();
    self waittill("goal");
    self sethoverparams(1, 1);
    wait(1);
    self sethoverparams(25, 20, 10);
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x757f
// Size: 0x34
function entisalivevehicle() {
    return isalive(self) && (namespace_dbbb37eb352edf96::isvehicle() || isdefined(self.classname) && self.classname == "script_vehicle");
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x75bb
// Size: 0x5e
function helidestroyvehiclestouchnotify() {
    self endon("leaving");
    self endon("death");
    while (1) {
        vehicle = self waittill("touch");
        if (isdefined(vehicle) && vehicle entisalivevehicle()) {
            vehicle dodamage(vehicle.health, self.origin, vehicle, vehicle, "MOD_CRUSH");
        }
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7620
// Size: 0x28c
function helidestroyvehiclestouchtrace() {
    self endon("leaving");
    self endon("death");
    radius = 70;
    var_7cfe8395a8cf5836 = -80;
    forward = 150;
    middle = 25;
    back = -100;
    while (1) {
        vehicles = getentarrayinradius("script_vehicle", "classname", self.origin, getdvarfloat(@"hash_d8d9dc5f1a9e75a9", 400));
        if (vehicles.size <= 1) {
            wait(0.5);
            continue;
        }
        var_7346eb0e818b60c5 = create_vehicle_contents();
        dir = anglestoforward(self.angles);
        origin = self.origin + dir * getdvarfloat(@"hash_c99873a79b22a9f7", forward) + (0, 0, getdvarfloat(@"hash_c99875a79b22ae5d", var_7cfe8395a8cf5836));
        trace = sphere_trace(origin, origin + (0, 0, 1), radius, self, var_7346eb0e818b60c5);
        ent = trace["entity"];
        if (isdefined(ent) && ent entisalivevehicle()) {
            ent dodamage(ent.health, self.origin, ent, ent, "MOD_CRUSH");
            waitframe();
            continue;
        }
        origin = self.origin + dir * getdvarfloat(@"hash_c9986ca79b229a92", middle) + (0, 0, getdvarfloat(@"hash_c99875a79b22ae5d", var_7cfe8395a8cf5836));
        trace = sphere_trace(origin, origin + (0, 0, 1), radius, self, var_7346eb0e818b60c5);
        ent = trace["entity"];
        if (isdefined(ent) && ent entisalivevehicle()) {
            ent dodamage(ent.health, self.origin, ent, ent, "MOD_CRUSH");
            waitframe();
            continue;
        }
        origin = self.origin + dir * getdvarfloat(@"hash_c9986fa79b22a12b", back) + (0, 0, getdvarfloat(@"hash_c99875a79b22ae5d", var_7cfe8395a8cf5836));
        trace = sphere_trace(origin, origin + (0, 0, 1), radius, self, var_7346eb0e818b60c5);
        ent = trace["entity"];
        if (isdefined(ent) && ent entisalivevehicle()) {
            ent dodamage(ent.health, self.origin, ent, ent, "MOD_CRUSH");
            waitframe();
            continue;
        }
        waitframe();
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x78b3
// Size: 0x51
function tracegroundheight(start) {
    var_dc8bb6300463cf1e = 125;
    var_aa5a7071f7a4c106 = tracegroundpoint(start, 100, [0:self]);
    var_e7a7d619f927d791 = var_aa5a7071f7a4c106[2];
    var_1dc672cfe0f0128e = var_e7a7d619f927d791 + var_dc8bb6300463cf1e;
    return var_1dc672cfe0f0128e;
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x790c
// Size: 0x87
function tracegroundpoint(start, radius, ignorelist) {
    var_379ff849b3cda7d7 = -99999;
    end = (start[0], start[1], var_379ff849b3cda7d7);
    contents = create_world_contents();
    var_e96577032a7740fc = undefined;
    if (isdefined(radius)) {
        var_e96577032a7740fc = sphere_trace(start, end, radius, ignorelist, contents);
    } else {
        var_e96577032a7740fc = ray_trace(start, end, ignorelist, contents);
    }
    return var_e96577032a7740fc["position"];
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x799b
// Size: 0x21
function heliwatchgameendleave() {
    self endon("death");
    self endon("leaving");
    level waittill("game_ended");
    thread helileave();
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x79c3
// Size: 0x175
function initextractionlocations() {
    extractionlocations = [];
    if (namespace_36f464722d326bbe::isdonetskmap()) {
        extractionlocations[extractionlocations.size] = (-33750, -36000, 155);
        extractionlocations[extractionlocations.size] = (-41550, -7950, 515);
        extractionlocations[extractionlocations.size] = (-37500, 15350, 1130);
        extractionlocations[extractionlocations.size] = (-31950, 52015, 2265);
        extractionlocations[extractionlocations.size] = (-18510, 64815, 1940);
        extractionlocations[extractionlocations.size] = (15565, 60050, 2680);
        extractionlocations[extractionlocations.size] = (44400, 39255, -50);
        extractionlocations[extractionlocations.size] = (59780, 13800, 555);
        extractionlocations[extractionlocations.size] = (61200, -8445, 30);
        extractionlocations[extractionlocations.size] = (59325, -38390, -210);
        extractionlocations[extractionlocations.size] = (8660, -36630, -640);
    } else {
        switch (level.mapname) {
        case #"hash_4aa5d6e97851bdbd":
            extractionlocations[extractionlocations.size] = (1500, 1500, 0);
            extractionlocations[extractionlocations.size] = (2500, 1500, 0);
            extractionlocations[extractionlocations.size] = (3500, 1500, 0);
            extractionlocations[extractionlocations.size] = (4500, 1500, 0);
            break;
        case #"hash_822ffed9bd418efc":
            break;
        }
    }
    level.extractionlocations = extractionlocations;
    level.extractingplayers = [];
    level thread monitorextractionlocations();
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7b3f
// Size: 0xc
function createextractionlocation(origin) {
    
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7b52
// Size: 0x247
function monitorextractionlocations() {
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    foreach (location in level.extractionlocations) {
        objectiveiconid = namespace_5a22b6f3a56f7e9b::requestobjectiveid(1);
        /#
            assert(objectiveiconid != -1);
        #/
        if (objectiveiconid != -1) {
            namespace_5a22b6f3a56f7e9b::objective_add_objective(objectiveiconid, "active", location, "icon_waypoint_flag");
            namespace_5a22b6f3a56f7e9b::update_objective_setbackground(objectiveiconid, 0);
            namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(objectiveiconid);
            namespace_5a22b6f3a56f7e9b::objective_playermask_showtoall(objectiveiconid);
        }
        level thread spawnextractsmoke(location);
    }
    while (1) {
        foreach (location in level.extractionlocations) {
            players = namespace_7e17181d03156026::getplayersinradius(location, 300);
            foreach (player in players) {
                if (!array_contains(level.extractingplayers, player) && !istrue(player.extractioncomplete)) {
                    player extactionstart(location);
                }
            }
        }
        foreach (player in level.extractingplayers) {
            if (distancesquared(player.origin, player.extractionlocation) > 90000) {
                player extactioncancel();
            } else {
                player.extractiontime = player.extractiontime - level.framedurationseconds;
                if (player.extractiontime <= 0) {
                    player extactioncomplete();
                }
            }
        }
        waitframe();
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7da0
// Size: 0x7b
function spawnextractsmoke(location) {
    pos = namespace_d3d40f75bb4e4c32::droptogroundmultitrace(location, 50, -200);
    vfxent = spawn("script_model", pos + (0, 0, 3));
    vfxent setmodel("scr_smoke_grenade");
    wait(1);
    playfxontag(getfx("vfx_smk_signal_red"), vfxent, "tag_fx");
    vfxent playloopsound("mp_flare_burn_lp");
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7e22
// Size: 0x4e
function extactionstart(location) {
    self iprintlnbold("Extraction Start!");
    level.extractingplayers = array_add(level.extractingplayers, self);
    self.extractionlocation = location;
    self.extractiontime = 10;
    thread showextractiontime();
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7e77
// Size: 0x41
function showextractiontime() {
    self endon("death_or_disconnect");
    self endon("extactionCancel");
    while (self.extractiontime > 0) {
        self iprintlnbold("Extracting in " + math::round_float(self.extractiontime, 1));
        waitframe();
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7ebf
// Size: 0x44
function extactioncancel() {
    self notify("extactionCancel");
    self iprintlnbold("Extraction Canceled!");
    level.extractingplayers = array_remove(level.extractingplayers, self);
    self.extractionlocation = undefined;
    self.extractiontime = undefined;
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7f0a
// Size: 0x44
function extactioncomplete() {
    self iprintlnbold("Extraction Complete!");
    level.extractingplayers = array_remove(level.extractingplayers, self);
    self.extractioncomplete = 1;
    kick(self getentitynumber(), "EXE/PLAYERKICKED_EXTRACTED");
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7f55
// Size: 0x192
function autoassignquest(player) {
    if (!isdefined(level.questinfo.teamsonquests) || array_contains(level.questinfo.teamsonquests, player.team)) {
        return;
    }
    var_73a1687c46c4d341 = [];
    foreach (type in level.validautoassignquests) {
        var_73a1687c46c4d341 = array_combine(var_73a1687c46c4d341, getlootscriptablearray("brloot_" + type + "_tablet"));
    }
    var_73a1687c46c4d341 = array_randomize(var_73a1687c46c4d341);
    var_d62cc2e2bfa94d60 = undefined;
    var_31a0a0ed9e70e900 = undefined;
    foreach (var_670aa0df96f7de65 in var_73a1687c46c4d341) {
        dist = distance_2d_squared(player.origin, var_670aa0df96f7de65.origin);
        if (dist <= 16777216 && dist >= 16384) {
            player namespace_1eb3c4e0e28fac71::function_bb413728bc5231d0(var_670aa0df96f7de65);
            return;
        }
        if (!isdefined(var_d62cc2e2bfa94d60) || dist < var_31a0a0ed9e70e900) {
            var_d62cc2e2bfa94d60 = var_670aa0df96f7de65;
            var_31a0a0ed9e70e900 = dist;
        }
    }
    if (isdefined(var_d62cc2e2bfa94d60)) {
        player namespace_1eb3c4e0e28fac71::function_bb413728bc5231d0(var_d62cc2e2bfa94d60);
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x80ee
// Size: 0x70
function missions_clearinappropriaterewards(rewards) {
    var_36f04620526242ff = [];
    foreach (key, reward in rewards) {
        if (key == "circle_peek") {
            continue;
        }
        var_36f04620526242ff[key] = reward;
    }
    return var_36f04620526242ff;
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8166
// Size: 0xe4
function handleplunderendgamesplash(winner) {
    var_3784e17637539b8 = [];
    if (isdefined(winner) && winner != "tie") {
        var_3784e17637539b8 = getteamdata(winner, "players");
    }
    var_464dd76c6ecb56fa = namespace_d576b6dc7cef9c62::getbrendsplashpostgamestate();
    foreach (player in level.players) {
        if (var_3784e17637539b8.size > 0 && array_contains(var_3784e17637539b8, player)) {
            player setcachedclientomnvar("post_game_state", var_464dd76c6ecb56fa);
            player setcachedclientomnvar("ui_br_end_game_splash_type", 11);
        } else {
            player setcachedclientomnvar("post_game_state", var_464dd76c6ecb56fa);
            player setcachedclientomnvar("ui_br_end_game_splash_type", 12);
        }
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x8251
// Size: 0x6c
function updateteamplunderscore(var_7eddf19f11da2f94, team, var_c6544e2c82d62dfb) {
    var_4bf0adee32bc3338 = _getteamscore(team);
    delta = var_7eddf19f11da2f94 - var_4bf0adee32bc3338;
    if (delta != 0) {
        var_61a16df4892db7b5 = ter_op(namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf(), 1, undefined);
        level thread giveteamscoreforobjective(team, delta, 0, undefined, var_61a16df4892db7b5, var_c6544e2c82d62dfb);
    }
    return delta;
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x82c5
// Size: 0xfc
function updatelootleadersonfixedinterval() {
    level notify("restartLootLeaders");
    level endon("restartLootLeaders");
    level endon("game_ended");
    interval = getdvarfloat(@"hash_81be161d3102cc0e", 15);
    var_35d7d56101fb07a0 = getdvarfloat(@"hash_b82244f91b963437", 5);
    var_9c18968676df1094 = getdvarint(@"hash_114aa0db563f4c19", 800);
    var_32e688c1e2cf28c0 = getdvarint(@"hash_4f47f4bd5cfef308", 200);
    var_1f88f11926c68559 = interval - var_35d7d56101fb07a0;
    namespace_4b0406965e556711::gameflagwait("placement_updates_allowed");
    firstpass = 1;
    while (1) {
        level.plunderupdatelootleadermarks = 1;
        namespace_3c37cb17ade254d::waittill_notify_or_timeout("bmo_overtime_start", var_1f88f11926c68559);
        if (var_35d7d56101fb07a0 > 0) {
            function_b97f3e1b29916d34("Expired_");
            namespace_3c37cb17ade254d::waittill_notify_or_timeout("bmo_overtime_start", var_35d7d56101fb07a0);
            function_b97f3e1b29916d34();
        }
        firstpass = 0;
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x83c8
// Size: 0x78
function function_b97f3e1b29916d34(var_eb75df0fe3b7eedb) {
    for (i = 0; i < level.lootleadermarkcount; i++) {
        if (level.lootleadermarksontopteams > 0 && i == 0) {
            var_e08fdf5d9199f540 = "LootLeaderTop_Plunder";
        } else {
            var_e08fdf5d9199f540 = "LootLeader_Plunder";
        }
        if (isdefined(var_eb75df0fe3b7eedb)) {
            var_e08fdf5d9199f540 = var_eb75df0fe3b7eedb + var_e08fdf5d9199f540;
        }
        level.lootleadermarks[i] namespace_36f464722d326bbe::function_6a52fd9d448df322(var_e08fdf5d9199f540);
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x8447
// Size: 0xcf
function updatecirclepulse(startval, endval, duration) {
    currenttime = gettime();
    duration = duration * 1000;
    endtime = int(currenttime + duration);
    diff = abs(startval - endval);
    while (1) {
        currenttime = gettime();
        t = clamp(1 - (endtime - currenttime) / duration, 0, 1);
        frac = ter_op(startval < endval, diff * t + startval, startval - diff * t);
        setdvar(@"hash_1256574652334627", frac);
        if (t == 1) {
            break;
        }
        waitframe();
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x851d
// Size: 0x642
function updatelootleadermarks(var_87b32cca2597530f, var_348ab76f83b33509, var_e3759b02f55695c2, var_ddd20d819a369a7d) {
    level.lootleadersprev = level.lootleaders;
    level.lootleaders = [];
    if (level.lootleaderoneperteam) {
        if (istrue(level.bmoovertime)) {
            level.lootleadermarkcount = adjustlootleadermarkcount();
            foreach (mark in level.lootleadermarks) {
                mark function_4eaf685bc40a3b9();
            }
        }
    }
    if (level.lootleadermarksontopteams == 1) {
        for (i = 0; i < level.lootleadermarkcount; i++) {
            var_d546f00edc1b5fc7 = getlootteamleader(i, var_87b32cca2597530f, var_ddd20d819a369a7d);
            if (isdefined(var_d546f00edc1b5fc7)) {
                level.lootleaders[level.lootleaders.size] = var_e3759b02f55695c2[var_d546f00edc1b5fc7];
                if (istrue(level.expiredlootleaderenabled)) {
                    if (isdefined(var_e3759b02f55695c2[var_d546f00edc1b5fc7].expiredlootleaderinstance)) {
                        removeplayerasexpiredlootleader(var_e3759b02f55695c2[var_d546f00edc1b5fc7].expiredlootleaderinstance);
                    }
                }
            }
        }
    } else if (level.lootleadermarksontopteams == 2) {
        var_d546f00edc1b5fc7 = getlootteamleader(0, var_87b32cca2597530f, var_ddd20d819a369a7d);
        if (isdefined(var_d546f00edc1b5fc7)) {
            level.lootleaders[0] = var_e3759b02f55695c2[var_d546f00edc1b5fc7];
            if (istrue(level.expiredlootleaderenabled)) {
                if (isdefined(var_e3759b02f55695c2[var_d546f00edc1b5fc7].expiredlootleaderinstance)) {
                    removeplayerasexpiredlootleader(var_e3759b02f55695c2[var_d546f00edc1b5fc7].expiredlootleaderinstance);
                }
            }
        }
        foreach (var_b7739b4d7e762d6b in var_348ab76f83b33509) {
            player = var_e3759b02f55695c2[var_b7739b4d7e762d6b];
            plunder = var_87b32cca2597530f[var_b7739b4d7e762d6b];
            if (plunder == 0) {
                break;
            }
            if (array_contains(level.lootleaders, player)) {
                continue;
            }
            level.lootleaders[level.lootleaders.size] = player;
            if (istrue(level.expiredlootleaderenabled)) {
                if (isdefined(player.expiredlootleaderinstance)) {
                    removeplayerasexpiredlootleader(player.expiredlootleaderinstance);
                }
            }
            if (level.lootleaders.size == level.lootleadermarkcount) {
                break;
            }
        }
    } else {
        foreach (player in var_348ab76f83b33509) {
            plunder = var_87b32cca2597530f[player];
            if (plunder == 0) {
                break;
            }
            level.lootleaders[level.lootleaders.size] = var_e3759b02f55695c2[player];
            if (istrue(level.expiredlootleaderenabled)) {
                if (isdefined(var_e3759b02f55695c2[player].expiredlootleaderinstance)) {
                    removeplayerasexpiredlootleader(var_e3759b02f55695c2[player].expiredlootleaderinstance);
                }
            }
            if (level.lootleaders.size == level.lootleadermarkcount) {
                break;
            }
        }
    }
    foreach (player in level.lootleadersprev) {
        if (isdefined(player) && !array_contains(level.lootleaders, player)) {
            removeplayeraslootleader(player);
        }
    }
    for (i = 0; i < level.lootleadermarkcount; i++) {
        instance = level.lootleadermarks[i];
        if (isdefined(level.lootleaders[i])) {
            instance.targetplayer = level.lootleaders[i];
            instance.targetplayer.lootleaderinstance = instance;
            location = (instance.targetplayer.origin[0], instance.targetplayer.origin[1], level.lootleadermarksize);
            if (!namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
                location = location + math::random_vector_2d() * randomfloatrange(100, 1000);
            }
            instance function_6e148c8da2e4db13(location);
            if (istrue(level.lootleadermarksizedynamic)) {
                updatelootleadercirclesize(instance);
            }
            var_bff2d9d4105d9618 = array_contains(level.lootleaders, instance.targetplayer) && !array_contains(level.lootleadersprev, instance.targetplayer);
            var_be4e32b47ad61c7d = namespace_54d20dd0dd79277f::getenemyplayers(instance.targetplayer.team, 0);
            foreach (player in var_be4e32b47ad61c7d) {
                instance function_cfd53c8f6878014f(player);
            }
            var_1e502b02d01cf98d = namespace_54d20dd0dd79277f::getfriendlyplayers(instance.targetplayer.team, 0);
            foreach (player in var_1e502b02d01cf98d) {
                instance function_d7d113d56ef0ef5b(player);
            }
            if (var_bff2d9d4105d9618) {
                addplayeraslootleader(instance);
            }
        } else {
            instance.targetplayer = undefined;
            foreach (player in level.players) {
                instance function_d7d113d56ef0ef5b(player);
            }
        }
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x8b66
// Size: 0x102
function getlootteamleader(index, var_87b32cca2597530f, var_ddd20d819a369a7d) {
    team = var_ddd20d819a369a7d[index];
    var_9fb5def50e853261 = 0;
    plunder = 0;
    if (level.teamdata[team]["players"].size == 0) {
        return undefined;
    }
    var_d546f00edc1b5fc7 = level.teamdata[team]["players"][0].guid;
    foreach (player in level.teamdata[team]["players"]) {
        var_9fb5def50e853261 = var_87b32cca2597530f[player.guid];
        if (var_9fb5def50e853261 > plunder) {
            plunder = var_9fb5def50e853261;
            var_d546f00edc1b5fc7 = player.guid;
        }
    }
    return var_d546f00edc1b5fc7;
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8c70
// Size: 0x6a
function addplayeraslootleader(instance) {
    player = instance.targetplayer;
    if (isreallyalive(player)) {
        if (!namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
            player namespace_44abc05161e2e2cb::showsplash("br_plunder_you_are_marked", undefined, undefined, undefined, undefined, "splash_list_br_plunder_iw9_mp");
        }
        player cashleaderbag_attach();
        if (istrue(level.expiredlootleaderenabled)) {
            player thread watchforplayerdeath(instance);
        }
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8ce1
// Size: 0xfd
function removeplayeraslootleader(player) {
    if (isdefined(player.attached_bag)) {
        player cashleaderbag_detach();
    }
    if (isdefined(player.lootleaderinstance)) {
        foreach (entry in level.players) {
            player.lootleaderinstance function_d7d113d56ef0ef5b(entry);
        }
        circleorigin = player.lootleaderinstance function_d9583306c5a171e4();
        if (istrue(level.expiredlootleaderenabled)) {
            addplayerasexpiredlootleader(player, circleorigin);
        }
        player.lootleaderinstance.targetplayer = undefined;
        player.lootleaderinstance = undefined;
    }
    level.lootleaders = array_remove(level.lootleaders, player);
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8de5
// Size: 0x46
function watchforplayerdeath(instance) {
    self endon("disconnect");
    self waittill("death");
    circleorigin = self.lootleaderinstance function_d9583306c5a171e4();
    removeplayeraslootleader(self);
    addplayerasexpiredlootleader(self, circleorigin);
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8e32
// Size: 0x2e6
function addplayerasexpiredlootleader(player, circleorigin) {
    if (array_contains(level.expiredlootleaders, player)) {
        return;
    }
    level.expiredlootleaders = array_add(level.expiredlootleaders, player);
    instance = undefined;
    foreach (entry in level.expiredlootleadermarks) {
        if (!isdefined(entry.targetplayer)) {
            instance = entry;
            break;
        }
    }
    if (!isdefined(instance)) {
        var_3071102f98cbed33 = undefined;
        foreach (entry in level.expiredlootleadermarks) {
            if (!isdefined(var_3071102f98cbed33) || entry.lastusedtime < var_3071102f98cbed33) {
                var_3071102f98cbed33 = entry.lastusedtime;
                instance = entry;
            }
        }
        instance.targetplayer notify("stop_update");
    }
    instance.targetplayer = player;
    instance.lastusedtime = gettime();
    player.expiredlootleaderinstance = instance;
    if (isdefined(circleorigin)) {
        instance function_6e148c8da2e4db13(circleorigin);
    } else {
        location = (instance.targetplayer.origin[0], instance.targetplayer.origin[1], level.lootleadermarksize);
        location = location + math::random_vector_2d() * randomfloatrange(100, 1000);
        instance function_6e148c8da2e4db13(location);
    }
    if (istrue(level.lootleadermarksizedynamic)) {
        updatelootleadercirclesize(instance);
    }
    var_be4e32b47ad61c7d = namespace_54d20dd0dd79277f::getenemyplayers(instance.targetplayer.team, 0);
    foreach (entry in var_be4e32b47ad61c7d) {
        instance function_cfd53c8f6878014f(entry);
    }
    var_1e502b02d01cf98d = namespace_54d20dd0dd79277f::getfriendlyplayers(instance.targetplayer.team, 0);
    foreach (entry in var_1e502b02d01cf98d) {
        instance function_d7d113d56ef0ef5b(entry);
    }
    thread updateexpiredlootleader(instance);
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x911f
// Size: 0x2b
function updateexpiredlootleader(instance) {
    instance.targetplayer endon("stop_update");
    wait(5);
    removeplayerasexpiredlootleader(instance);
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9151
// Size: 0xc3
function removeplayerasexpiredlootleader(instance) {
    player = instance.targetplayer;
    level.expiredlootleaders = array_remove(level.expiredlootleaders, instance.targetplayer);
    instance.targetplayer.expiredlootleaderinstance = undefined;
    instance.targetplayer = undefined;
    foreach (entry in level.players) {
        instance function_d7d113d56ef0ef5b(entry);
    }
    player notify("stop_update");
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x921b
// Size: 0xc5
function cashleaderbag_attach() {
    /#
        assertex(isplayer(self), "cashleaderBag_attach() should only be called on a Player Entity type ");
    #/
    /#
        assertex(!isdefined(self.attached_bag), " trying to attach a Cash Leader Bag when the player is already a leader ");
    #/
    var_d8943d63ec472996 = getmatchrulesdata("brData", "plunderModelType");
    modelname = "accessory_money_bag_large_closed_player";
    switch (var_d8943d63ec472996) {
    case #"hash_59b8e9d05b31ff9":
        modelname = "accessory_money_bag_large_closed_player_plunder";
        break;
    }
    self attach(modelname, "tag_stowed_back3", 1, 1);
    self.attached_bag = modelname;
    if (self tagexists("j_bag_left")) {
        playfxontag(level._effect["vfx_br_cashLeaderBag"], self, "j_bag_left");
    }
    thread cashleader_trackdeath();
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x92e7
// Size: 0x92
function cashleaderbag_detach() {
    /#
        assertex(isplayer(self), "cashleaderBag_detach() should only be called on a Player Entity type ");
    #/
    /#
        assertex(isdefined(self.attached_bag), " trying to Unlink a Cash Leader Bag when the player doesn't have one! ");
    #/
    if (isdefined(self) && isdefined(self.attached_bag)) {
        if (self tagexists("j_bag_left")) {
            stopfxontag(level._effect["vfx_br_cashLeaderBag"], self, "j_bag_left");
        }
        self detach(self.attached_bag, "tag_stowed_back3");
        self.attached_bag = undefined;
    }
    self notify("killthread_bagModelSwap");
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9380
// Size: 0x28
function cashleader_trackdeath() {
    self notify("cashleader_trackDeath");
    self endon("cashleader_trackDeath");
    self endon("killthread_bagModelSwap");
    self waittill("death");
    cashleaderbag_detach();
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x93af
// Size: 0xde
function packextrascore0(data) {
    if (!namespace_36f464722d326bbe::isBRStyleGameType()) {
        return;
    }
    if (getsubgametype() == "kingslayer" || getsubgametype() == "resurgence") {
        return;
    }
    var_81dab8953b9df82 = 0;
    var_b87f7fae01ce754f = 0;
    if (isdefined(self.plundercount)) {
        var_b87f7fae01ce754f = var_b87f7fae01ce754f + self.plundercount;
    }
    if (isdefined(self.plunderbanked)) {
        var_b87f7fae01ce754f = var_b87f7fae01ce754f + self.plunderbanked;
    }
    var_b87f7fae01ce754f = int(var_b87f7fae01ce754f / 10);
    if (var_b87f7fae01ce754f > 4095) {
        var_b87f7fae01ce754f = 4095;
    }
    var_81dab8953b9df82 = var_b87f7fae01ce754f;
    var_c5c0c138d608be6a = 0;
    if (isdefined(self.missionparticipation)) {
        var_c5c0c138d608be6a = var_c5c0c138d608be6a + self.missionparticipation;
    }
    if (var_c5c0c138d608be6a > 15) {
        var_c5c0c138d608be6a = 15;
    }
    var_81dab8953b9df82 = var_81dab8953b9df82 + (var_c5c0c138d608be6a << 12);
    setextrascore0(var_81dab8953b9df82);
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9494
// Size: 0xa4
function packclientmatchdata() {
    var_81dab8953b9df82 = 0;
    var_b87f7fae01ce754f = 0;
    if (isdefined(self.plundercount)) {
        var_b87f7fae01ce754f = var_b87f7fae01ce754f + self.plundercount;
    }
    if (isdefined(self.plunderbanked)) {
        var_b87f7fae01ce754f = var_b87f7fae01ce754f + self.plunderbanked;
    }
    var_b87f7fae01ce754f = int(var_b87f7fae01ce754f / 10);
    if (var_b87f7fae01ce754f > 4095) {
        var_b87f7fae01ce754f = 4095;
    }
    var_81dab8953b9df82 = var_b87f7fae01ce754f;
    var_c5c0c138d608be6a = 0;
    if (isdefined(self.brmissionscompleted)) {
        var_c5c0c138d608be6a = var_c5c0c138d608be6a + self.brmissionscompleted;
    }
    if (var_c5c0c138d608be6a > 15) {
        var_c5c0c138d608be6a = 15;
    }
    var_81dab8953b9df82 = var_81dab8953b9df82 + (var_c5c0c138d608be6a << 12);
    return var_81dab8953b9df82;
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9540
// Size: 0x47
function playerlootleadervalidity() {
    self endon("disconnect");
    if (isdefined(level.lootleaders) && array_contains(level.lootleaders, self)) {
        namespace_44abc05161e2e2cb::showsplash("br_plunder_you_are_marked", undefined, undefined, undefined, undefined, "splash_list_br_plunder_iw9_mp");
        cashleaderbag_attach();
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x958e
// Size: 0xda
function updatelootleadercirclesize(instance) {
    if (isdefined(instance.targetplayer.plundercount)) {
        var_c2d1738d79d98c15 = instance.targetplayer.plundercount;
    } else {
        var_c2d1738d79d98c15 = 0;
    }
    var_c2d1738d79d98c15 = clamp(var_c2d1738d79d98c15, level.lootleadermarkweakvalue, level.lootleadermarkstrongvalue);
    range = level.lootleadermarkstrongvalue - level.lootleadermarkweakvalue;
    frac = (var_c2d1738d79d98c15 - level.lootleadermarkweakvalue) / range;
    var_794b260201f063c2 = level.lootleadermarkweaksize - level.lootleadermarkstrongsize;
    var_6e831c5902e07b4c = level.lootleadermarkweaksize - frac * var_794b260201f063c2;
    instance function_4584ad1c0e2c58ec(var_6e831c5902e07b4c);
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x966f
// Size: 0xf1
function adjustlootleadermarkcount(var_c3e10a42a81ade25) {
    var_11a4492adc953ff5 = 0;
    var_c3e10a42a81ade25 = getteamscoreplacements();
    var_620f245e58ff4740 = getwincost();
    for (i = 1; i < level.maxlootleadermarkcount + 1; i++) {
        foreach (team in level.teamnamelist) {
            if (var_c3e10a42a81ade25[team] != i) {
                continue;
            }
            var_4828ed9b88a47362 = namespace_c6ccccd95254983f::getteamplunder(team) * 10;
            if (var_4828ed9b88a47362 >= var_620f245e58ff4740 || var_c3e10a42a81ade25[team] == 1) {
                var_11a4492adc953ff5++;
            }
        }
    }
    if (var_11a4492adc953ff5 > level.maxlootleadermarkcount) {
        var_11a4492adc953ff5 = level.maxlootleadermarkcount;
    }
    return var_11a4492adc953ff5;
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9768
// Size: 0x208
function displayplunderloss(player, delta) {
    var_83e60cf2f8b66836 = 0;
    var_350f8764871aa143 = 0;
    var_1e89d40fe2954ab6 = 20;
    delta = delta * 10;
    var_4828ed9b88a47362 = player.plundercount * 10;
    var_f1bc35c0df4ec92f = var_4828ed9b88a47362 + delta;
    current = var_f1bc35c0df4ec92f;
    target = var_4828ed9b88a47362;
    diff = target - var_f1bc35c0df4ec92f;
    sign = sign(diff);
    var_b749e3228ec71e90 = diff / 2;
    var_585aae66e20728c4 = int(var_b749e3228ec71e90 * 2 * level.framedurationseconds);
    if (var_585aae66e20728c4 == 0) {
        return;
    }
    var_c61e1bda6bef78eb = createhudelem("MP_BR_INGAME/PLUNDER_DEATH_LOSS", delta, "RIGHT", "CENTER", var_83e60cf2f8b66836 + 46, var_350f8764871aa143, undefined, undefined, 1.25, player);
    var_c61e1bda6bef78eb.alpha = 1;
    var_a85ec6ac5846d65f = createhudelem("MP_BR_INGAME/YOUR_PLUNDER_TEXT", undefined, "RIGHT", "CENTER", var_83e60cf2f8b66836, var_350f8764871aa143 + var_1e89d40fe2954ab6, undefined, undefined, 1.25, player);
    var_a85ec6ac5846d65f.alpha = 1;
    var_aa9c740500dd5694 = createhudelem("MP_BR_INGAME/EXTRACT_PLUNDER", var_f1bc35c0df4ec92f, "LEFT", "CENTER", var_83e60cf2f8b66836 + 45, var_350f8764871aa143 + var_1e89d40fe2954ab6, undefined, undefined, 1.25, player);
    var_aa9c740500dd5694.alpha = 1;
    wait(1);
    while (current != target) {
        current = current + var_585aae66e20728c4;
        if (sign > 0 && current > target || sign < 0 && current < target) {
            current = target;
        }
        var_aa9c740500dd5694 setvalue(current);
        wait(level.framedurationseconds);
    }
    wait(3);
    var_c61e1bda6bef78eb destroy();
    var_a85ec6ac5846d65f destroy();
    var_aa9c740500dd5694 destroy();
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x9977
// Size: 0x39e
function _getplunderextractlocations(var_532388c61e12b9df, var_e296217c9fcd337f, var_395f0c06f7abdcc1) {
    if (var_532388c61e12b9df.size == 0 || var_e296217c9fcd337f == 0) {
        return;
    }
    var_bfe291b401a9bf2a = [];
    var_ffae32b49df07dbf = [];
    if (var_532388c61e12b9df.size > 0) {
        var_532388c61e12b9df = namespace_3c37cb17ade254d::array_randomize(var_532388c61e12b9df);
        var_ffae32b49df07dbf = int(min(var_e296217c9fcd337f, var_532388c61e12b9df.size));
    }
    if (level.setupevenlydistributedpads) {
        dist = 0;
        if (level.adjusteventdistributionpadding > 0 && istrue(var_395f0c06f7abdcc1)) {
            var_233c184a379e961e = 0;
            for (i = 0; i < var_ffae32b49df07dbf; i++) {
                if (var_233c184a379e961e > level.paddedquadgridcenterpoints.size - 1) {
                    var_233c184a379e961e = 0;
                }
                var_ed7960f0edb5f2a0 = level.paddedquadgridcenterpoints[var_233c184a379e961e];
                foreach (var_eb7ff65bd7004ad7 in var_532388c61e12b9df) {
                    if (pointinsquare(var_eb7ff65bd7004ad7.origin, var_ed7960f0edb5f2a0, level.pointinsquarewidth)) {
                        var_bfe291b401a9bf2a[var_bfe291b401a9bf2a.size] = var_eb7ff65bd7004ad7;
                        var_532388c61e12b9df = array_remove(var_532388c61e12b9df, var_eb7ff65bd7004ad7);
                        break;
                    }
                }
                var_233c184a379e961e++;
            }
        } else {
            foreach (var_eb7ff65bd7004ad7 in var_532388c61e12b9df) {
                dist = 0;
                foreach (quad in level.quadgridcenterpoints) {
                    newdist = namespace_3c37cb17ade254d::distance_2d_squared(quad, var_eb7ff65bd7004ad7.origin);
                    if (dist == 0 || newdist < dist) {
                        dist = newdist;
                        var_eb7ff65bd7004ad7.closestquad = quad;
                    }
                }
            }
            var_233c184a379e961e = 0;
            for (i = 0; i < var_ffae32b49df07dbf; i++) {
                if (var_233c184a379e961e > level.quadgridcenterpoints.size - 1) {
                    var_233c184a379e961e = 0;
                }
                var_ed7960f0edb5f2a0 = level.quadgridcenterpoints[var_233c184a379e961e];
                foreach (var_eb7ff65bd7004ad7 in var_532388c61e12b9df) {
                    if (isdefined(var_eb7ff65bd7004ad7.closestquad) && var_eb7ff65bd7004ad7.closestquad == var_ed7960f0edb5f2a0) {
                        var_bfe291b401a9bf2a[var_bfe291b401a9bf2a.size] = var_eb7ff65bd7004ad7;
                        var_532388c61e12b9df = array_remove(var_532388c61e12b9df, var_eb7ff65bd7004ad7);
                        break;
                    }
                }
                var_233c184a379e961e++;
            }
        }
    } else if (var_532388c61e12b9df.size > 0) {
        var_532388c61e12b9df = namespace_3c37cb17ade254d::array_randomize(var_532388c61e12b9df);
        var_ffae32b49df07dbf = int(min(var_e296217c9fcd337f, var_532388c61e12b9df.size));
        for (i = 0; i < var_ffae32b49df07dbf; i++) {
            var_bfe291b401a9bf2a[var_bfe291b401a9bf2a.size] = var_532388c61e12b9df[i];
        }
    }
    if (istrue(level.hideallunselectedextractpads)) {
        foreach (site in var_532388c61e12b9df) {
            if (!array_contains(var_bfe291b401a9bf2a, site)) {
                site setscriptablepartstate(site.type, "hidden");
            }
        }
    }
    return var_bfe291b401a9bf2a;
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x9d1d
// Size: 0x80
function pointinsquare(point, center, width) {
    var_4e9bdd57294562fd = center[0] - width;
    var_4e78e757291f3143 = center[0] + width;
    var_a056773a8ab0b014 = center[1] - width;
    var_a07a653a8ad90336 = center[1] + width;
    return point[0] >= var_4e9bdd57294562fd && point[0] <= var_4e78e757291f3143 && point[1] >= var_a056773a8ab0b014 && point[1] <= var_a07a653a8ad90336;
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9da5
// Size: 0x76
function _getsingleplunderextractlocations(var_532388c61e12b9df, var_e296217c9fcd337f) {
    if (var_532388c61e12b9df.size == 0 || var_e296217c9fcd337f == 0) {
        return;
    }
    site = undefined;
    if (var_532388c61e12b9df.size > 0) {
        var_532388c61e12b9df = namespace_3c37cb17ade254d::array_randomize(var_532388c61e12b9df);
        for (i = 0; i < var_532388c61e12b9df.size; i++) {
            if (!array_contains(level.br_plunder_sites, var_532388c61e12b9df[i])) {
                site = var_532388c61e12b9df[i];
                break;
            }
        }
    }
    return site;
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x9e23
// Size: 0x159
function findnewplunderextractsite(var_eedc39992a492091) {
    var_179ac3acee8f7af6 = _getsingleplunderextractlocations(namespace_c6ccccd95254983f::getallextractspawninstances(), level.maxplunderextractions);
    var_179ac3acee8f7af6.disabled = undefined;
    var_179ac3acee8f7af6.helidisabled = undefined;
    scriptablestate = ter_op(level.showplunderextracticonsinworld && !level.shownonscriptableextracticons, var_179ac3acee8f7af6.activecurrstate, var_179ac3acee8f7af6.activestate);
    var_179ac3acee8f7af6 setscriptablepartstate(var_179ac3acee8f7af6.type, scriptablestate);
    if (level.showplunderextracticonsinworld && level.shownonscriptableextracticons) {
        namespace_5a22b6f3a56f7e9b::returnobjectiveid(var_eedc39992a492091.locale.objectiveiconid);
        var_eedc39992a492091.locale.objectiveiconid = -1;
        locale = spawnstruct();
        locale namespace_4bc0ead8d2af3d84::createquestobjicon("ui_mp_br_mapmenu_icon_atm", "current", var_179ac3acee8f7af6.origin + (0, 0, 200));
        var_179ac3acee8f7af6.locale = locale;
    }
    level.br_plunder_sites = array_remove(level.br_plunder_sites, var_eedc39992a492091);
    level.br_plunder_sites = array_add(level.br_plunder_sites, var_179ac3acee8f7af6);
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9f83
// Size: 0xf6
function startplunderextractiontimers() {
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    waitframe();
    foreach (extract in level.br_plunder_sites) {
        extract.disabled = undefined;
        scriptablestate = ter_op(level.showplunderextracticonsinworld && !level.shownonscriptableextracticons, extract.activecurrstate, extract.activestate);
        extract setscriptablepartstate(extract.type, scriptablestate);
        extract thread runplunderextractsitetimer();
        if (level.showplunderextracticonsinworld && level.shownonscriptableextracticons) {
            extract.locale thread timeoutradialunfill();
        }
    }
    level thread runextractreroll();
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa080
// Size: 0x3c
function runplunderextractsitetimer() {
    wait(level.timeoutplunderextractionsites);
    self.disabled = 1;
    self.helidisabled = 1;
    self setscriptablepartstate(self.type, self.disabledstate);
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa0c3
// Size: 0x59
function runextractreroll() {
    wait(level.timeoutplunderextractionsites + 1);
    level.br_plunder_sites = _getplunderextractlocations(namespace_c6ccccd95254983f::getallextractspawninstances(), level.maxplunderextractions);
    if (level.showplunderextracticonsinworld && level.shownonscriptableextracticons) {
        level thread createheliextractobjectiveicons();
    }
    level thread startplunderextractiontimers();
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa123
// Size: 0xa4
function createheliextractobjectiveicons() {
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    foreach (extract in level.br_plunder_sites) {
        locale = spawnstruct();
        locale namespace_4bc0ead8d2af3d84::createquestobjicon("ui_mp_br_mapmenu_icon_atm", "current", extract.origin + (0, 0, 200));
        extract.locale = locale;
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa1ce
// Size: 0xd2
function timeoutradialunfill() {
    timer = level.timeoutplunderextractionsites;
    updaterate = level.framedurationseconds;
    var_a1dfe9d4920a43fa = updaterate * 1000;
    var_acfa0707dd372692 = timer * 1000;
    var_d3d9f3ad00693948 = var_acfa0707dd372692 - var_a1dfe9d4920a43fa;
    endtime = gettime() + var_acfa0707dd372692;
    while (gettime() < endtime) {
        var_6403fb28fbb44896 = var_d3d9f3ad00693948 / var_acfa0707dd372692;
        namespace_5a22b6f3a56f7e9b::objective_show_progress(self.objectiveiconid, 1);
        namespace_5a22b6f3a56f7e9b::objective_set_progress(self.objectiveiconid, var_6403fb28fbb44896);
        var_d3d9f3ad00693948 = max(var_d3d9f3ad00693948 - var_a1dfe9d4920a43fa, 1);
        waitframe();
    }
    namespace_5a22b6f3a56f7e9b::returnobjectiveid(self.objectiveiconid);
    self.objectiveiconid = -1;
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xa2a7
// Size: 0xb6
function createquestobjicon(var_cb8e582431cf1641, state, var_38116998df9814d4) {
    self.objectiveiconid = namespace_5a22b6f3a56f7e9b::requestobjectiveid(1);
    if (self.objectiveiconid != -1) {
        namespace_5a22b6f3a56f7e9b::objective_add_objective(self.objectiveiconid, state, (0, 0, 0), var_cb8e582431cf1641);
        namespace_5a22b6f3a56f7e9b::update_objective_setbackground(self.objectiveiconid, 1);
        objective_showtoplayersinmask(self.objectiveiconid);
        namespace_5a22b6f3a56f7e9b::objective_set_play_intro(self.objectiveiconid, 1);
        if (isdefined(var_38116998df9814d4)) {
            movequestobjicon(var_38116998df9814d4);
        }
    } else {
        /#
            println(self.category + "cashleader_trackDeath");
        #/
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa364
// Size: 0x1d
function movequestobjicon(neworigin) {
    namespace_5a22b6f3a56f7e9b::update_objective_position(self.objectiveiconid, neworigin);
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa388
// Size: 0x1c
function showquestobjicontoplayer(player) {
    objective_addclienttomask(self.objectiveiconid, player);
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa3ab
// Size: 0x13
function showquestobjicontoall(objid) {
    objective_addalltomask(objid);
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa3c5
// Size: 0x1c
function hidequestobjiconfromplayer(player) {
    objective_removeclientfrommask(self.objectiveiconid, player);
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa3e8
// Size: 0x23
function deletequestobjicon() {
    namespace_5a22b6f3a56f7e9b::objective_playermask_hidefromall(self.objectiveiconid);
    namespace_5a22b6f3a56f7e9b::returnobjectiveid(self.objectiveiconid);
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa412
// Size: 0x5c
function startbmoexfilprocess(team) {
    level setexfiltimer();
    level thread showexfilstartsplash(team);
    if (level.teamplunderexfilvipuav) {
        level thread startvipteamuav(team);
    }
    if (level.teamplunderexfilshowviponly) {
        level thread removenonvipteamlocations();
    }
    level thread startexfilchoppers();
    level thread nuke_startexfilcountdown(team);
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa475
// Size: 0x8f
function setexfiltimer() {
    namespace_d576b6dc7cef9c62::resumetimer();
    level.starttime = gettime();
    level.discardtime = 0;
    level.timerpausetime = 0;
    timelimit = getdvarfloat(@"hash_c655a0b01b13910a", 180);
    gamemode = function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_timelimit");
    level.watchdvars[gamemode].value = timelimit;
    level.overridewatchdvars[gamemode] = timelimit;
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa50b
// Size: 0xd1
function showexfilstartsplash(winningteam) {
    foreach (team in level.teamnamelist) {
        namespace_d3d40f75bb4e4c32::brleaderdialogteam("plunder_extract_requested", team);
    }
    foreach (player in level.players) {
        player thread namespace_44abc05161e2e2cb::showsplash("callout_bmo_exfil_winners");
        player namespace_58fb4f2e73fd41a0::setlowermessageomnvar("bmo_exfil_start", undefined, 20);
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa5e3
// Size: 0x42
function startvipteamuav(team) {
    level.radarmode[team] = "normal_radar";
    level.activeuavs[team] = 1;
    level.activeadvanceduavs[team] = 0;
    namespace_f1fe279354a7da2::function_484d86ce003c2526(team, 4);
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa62c
// Size: 0x48
function removenonvipteamlocations() {
    level.lootleadermarkcount = 1;
    if (getdvarint(@"hash_9efdb377e7ae2dff", 0) == 1) {
        if (getdvarfloat(@"hash_81be161d3102cc0e", 15) > 0) {
            level thread updatelootleadersonfixedinterval();
        }
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa67b
// Size: 0x15a
function startexfilchoppers() {
    foreach (site in level.br_plunder_sites) {
        site setscriptablepartstate(site.type, "inuse");
        var_1230ea36a300368 = getgroundposition(site.origin, 1) + (0, 0, 2);
        var_6b2ff09e35c441ce = level.players[0];
        for (i = 0; i < 200; i++) {
            var_6b2ff09e35c441ce = findanyaliveplayer();
            if (isplayer(var_6b2ff09e35c441ce)) {
                break;
            }
        }
        var_1230ea36a300368 = getgroundposition(site.origin, 1) + (0, 0, 2);
        heli = var_6b2ff09e35c441ce playerspawnexfilchopper(var_1230ea36a300368, site);
        if (isdefined(heli)) {
            heli.site = site;
            site.heli = heli;
            heli helicreateextractvfx(var_1230ea36a300368);
            heli thread extractplayers();
            level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("plunder_extract_requested", var_6b2ff09e35c441ce.team, 1);
        }
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa7dc
// Size: 0x10e
function playerspawnexfilchopper(position, site) {
    var_26a6f862062e4340 = position;
    var_c2c23ab40723a8d = var_26a6f862062e4340 + (0, 0, 2500);
    yaw = findclearflightyaw(var_c2c23ab40723a8d, site);
    angles = (0, yaw, 0);
    if (getdvarint(@"hash_d5878ca9e558dd32", 1) == 1) {
        var_cb2dc60f7cafc6d4 = -100;
        var_f0db3d408327db23 = 60;
        var_67c2f437706de4a1 = anglestoforward(angles);
        dirright = anglestoright(angles);
        var_26a6f862062e4340 = var_26a6f862062e4340 + var_67c2f437706de4a1 * var_cb2dc60f7cafc6d4 + dirright * var_f0db3d408327db23;
    }
    var_16cedb94faf4d596 = var_c2c23ab40723a8d + -1 * anglestoforward(angles) * 30000;
    exitposition = var_c2c23ab40723a8d + anglestoforward(angles) * 30000;
    heli = spawnheli(self, var_16cedb94faf4d596, var_c2c23ab40723a8d, exitposition);
    return heli;
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa8f2
// Size: 0x1db
function extractplayers() {
    self endon("death");
    self endon("leaving");
    self setvehgoalpos(self.pathgoal, 1);
    self settargetyaw(self.goalyaw);
    groundz = tracegroundheightexfil(self.pathgoal);
    var_625180ce8d2f8f77 = self.pathgoal[2] - groundz;
    self.flytime = calculatehelitimetoarrive(var_625180ce8d2f8f77);
    helisetteamextractionhud(1, self.flytime);
    self waittill("goal");
    foreach (player in level.players) {
        player namespace_58fb4f2e73fd41a0::setlowermessageomnvar("bmo_exfil_arrive", undefined, 20);
    }
    thread heliwatchgameendleave();
    thread helidisapateextractvfx();
    helidescend(self.endpoint, groundz);
    foreach (entry in level.teamnamelist) {
        level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("plunder_extract_chopper_arrive", entry, 1);
    }
    helimakeexfilwait();
    helicleanupextract();
    foreach (entry in level.teamnamelist) {
        level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("plunder_extract_chopper_leave", entry, 1);
    }
    thread helileave();
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xaad4
// Size: 0x11a
function helimakeexfilwait() {
    self.isdepot = 1;
    self.usable = self.crate;
    usable = self.usable;
    usable makeusable();
    usable setcursorhint("HINT_NOICON");
    usable setuseholdduration("duration_medium");
    usable sethintrequiresholding(1);
    usable setuserange(230);
    usable sethintstring("MP/BR_USE_EXFIL_CHOPPER");
    var_bdf913fbadcce9a7 = level.br_depots.size;
    level.br_depots[var_bdf913fbadcce9a7] = usable;
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
    }
    thread helicleanupdepotonleaving();
    thread heliexfilthink(usable);
    helisetteamextractionhud(2, 300);
    wait(300);
    self.isdepot = 0;
    heliusecleanup();
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xabf5
// Size: 0xf4
function heliexfilthink(usable) {
    self endon("death");
    usable endon("death");
    while (1) {
        player = usable waittill("trigger");
        player namespace_44abc05161e2e2cb::showsplash("callout_exfil_success");
        player function_a593971d75d82113();
        player function_379bb555405c16bb("br_gametype_plunder::heliExfilThink()");
        player sethidenameplate(0);
        player allowmovement(0);
        player allowfire(0);
        player disableoffhandprimaryweapons(0);
        player disableoffhandsecondaryweapons(0);
        player disableweapons(0);
        player disableweaponswitch(0);
        player setcamerathirdperson(1);
        player allowcrouch(0);
        player allowmelee(0);
        player allowjump(0);
        player allowprone(0);
        player val::set("heliExfil", "killstreaks", 0);
        player val::set("heliExfil", "supers", 0);
        player.safefromnuke = 1;
        usable disableplayeruse(player);
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xacf0
// Size: 0xd0
function healdamage() {
    self endon("death");
    self endon("leaving");
    self endon("swapped");
    while (1) {
        inflictor = normal = angles = origin = objweapon = idflags = partname = tagname = modelname = meansofdeath = point = direction_vec = attacker = damage = self waittill("damage");
        self.health = 99999;
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xadc7
// Size: 0x52
function tracegroundheightexfil(start) {
    var_dc8bb6300463cf1e = 256;
    var_aa5a7071f7a4c106 = tracegroundpoint(start, 100, [0:self]);
    var_e7a7d619f927d791 = var_aa5a7071f7a4c106[2];
    var_1dc672cfe0f0128e = var_e7a7d619f927d791 + var_dc8bb6300463cf1e;
    return var_1dc672cfe0f0128e;
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xae21
// Size: 0x153
function findclearflightyaw(var_c2c23ab40723a8d, site) {
    if (isdefined(site) && isdefined(site.flightyaw)) {
        return site.flightyaw;
    }
    var_3fb4a86293ed25a6 = 10;
    contents = create_world_contents();
    yaw = 0;
    while (yaw < 360) {
        angles = (0, yaw, 0);
        start = var_c2c23ab40723a8d + -1 * anglestoforward(angles) * 30000;
        end = var_c2c23ab40723a8d + anglestoforward(angles) * 30000;
        trace = sphere_trace(var_c2c23ab40723a8d, end, 100, undefined, contents, 1);
        if (trace["fraction"] == 1) {
            /#
                line(start, end, (0, 1, 0), 1, 0, 2000);
            #/
            if (isdefined(site)) {
                site.flightyaw = yaw;
            }
            return yaw;
        }
        /#
            line(start, end, (1, 0, 0), 1, 0, 2000);
        #/
        if (yaw % 3 == 0) {
            waitframe();
        }
        yaw = yaw + var_3fb4a86293ed25a6;
    }
    yaw = randomfloat(360);
    if (isdefined(site)) {
        site.flightyaw = yaw;
    }
    return yaw;
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaf7c
// Size: 0xd6
function nuke_startexfilcountdown(var_65669339223f29b4) {
    level notify("mercy_ending_timer_started");
    level endon("mercy_ending_triggered");
    setomnvar("ui_nuke_timer_type", 1);
    setomnvar("ui_nuke_timer_time", level.teamplunderexfiltimer);
    setomnvar("ui_nuke_countdown_active", 1);
    starttime = gettime();
    endtime = level.teamplunderexfiltimer * 1000 + starttime;
    setomnvar("ui_nuke_end_milliseconds", level.teamplunderexfiltimer * 1000 + starttime);
    while (1) {
        waitframe();
        if (gettime() > endtime) {
            break;
        }
    }
    level thread namespace_d576b6dc7cef9c62::endgame(var_65669339223f29b4, game["end_reason"]["plunder_win"], game["end_reason"]["plunder_loss"], 0, 1);
    setomnvar("ui_nuke_countdown_active", 0);
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb059
// Size: 0x342
function triggerovertimetimer(team, var_c0174fb6729764e5, ontimelimitot) {
    if (istrue(level.bmoovertime)) {
        if (istrue(level.bankingoverlimitwillendot) && istrue(var_c0174fb6729764e5)) {
            level thread bmoendgameot();
        }
        return;
    }
    level.bmoovertime = 1;
    level notify("cancel_announcer_dialog");
    thread namespace_3bde6869e44a2770::plunder_overtime_music();
    namespace_d76af9f804655767::cancelupcomingpublicevents();
    level thread overtimecashmultiplier();
    splash = "bm_overtime_double_cash_2x";
    if (isdefined(team) && (level.disablewinonscore || !level.disableonemilannounce)) {
        level.initialwinningteam = team;
        showsplashtoallexceptteam(team, "bm_overtime_start_them", undefined, undefined, undefined, undefined, "splash_list_br_plunder_iw9_mp");
        showsplashtoteam(team, "bm_overtime_start_us", undefined, undefined, undefined, undefined, "splash_list_br_plunder_iw9_mp");
        level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("bm_gamestate_overtime", team);
        foreach (entry in level.teamnamelist) {
            if (entry != team) {
                level thread namespace_d3d40f75bb4e4c32::brleaderdialogteam("bm_gamestate_overtime_enemy", entry);
            }
        }
    } else {
        level.initialwinningteam = getinitialwinningteam();
    }
    if (!isdefined(ontimelimitot)) {
        namespace_d576b6dc7cef9c62::resumetimer();
        level.starttime = gettime();
        level.discardtime = 0;
        level.timerpausetime = 0;
        timelimit = ter_op(level.disableonemilannounce || istrue(ontimelimitot), 7, 12);
        gamemode = function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_timelimit");
        level.watchdvars[gamemode].value = timelimit;
        level.overridewatchdvars[gamemode] = timelimit;
        if (!level.disableonemilannounce) {
            wait(5);
        }
        showsplashtoall(splash, undefined, undefined, undefined, undefined, "splash_list_br_plunder_iw9_mp");
        wait(5);
        level.ontimelimitgraceperiod = level.doendofmatchotsequence;
        level.currenttimelimitdelay = 0;
        level.canprocessot = 1;
        level notify("bmo_overtime_start");
    } else {
        level.ontimelimitgraceperiod = level.doendofmatchotsequence;
        level.currenttimelimitdelay = 0;
        level.canprocessot = 1;
        level notify("bmo_overtime_start");
        level.forcehideottimer = 1;
        level.forceotlogictorun = 1;
        showsplashtoall(splash, undefined, undefined, undefined, undefined, "splash_list_br_plunder_iw9_mp");
        wait(5);
    }
    level.forcehideottimer = undefined;
    namespace_4b0406965e556711::gameflagwait("overtime_started");
    thread function_9846f99ee86791d8(level.doendofmatchotsequence);
    setomnvar("ui_br_circle_state", 7);
    if (!isdefined(ontimelimitot)) {
        timer = gettime() + int(level.doendofmatchotsequence * 1000);
        setomnvar("ui_hardpoint_timer", timer);
    }
    wait(int(max(level.doendofmatchotsequence - 60, 0)));
    setomnvar("ui_br_circle_state", 8);
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb3a2
// Size: 0x82
function getinitialwinningteam() {
    winningteam = "";
    foreach (team in level.teamnamelist) {
        placement = game["teamPlacements"][team];
        if (placement == 1) {
            winningteam = team;
            break;
        }
    }
    return winningteam;
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb42c
// Size: 0xb1
function ontimelimit() {
    if (level.teamplunderscoremechanic && level.doendofmatchotsequence > 0 && !istrue(level.bmoovertime)) {
        if (!isdefined(level.initialwinningteam)) {
            level.initialwinningteam = getinitialwinningteam();
        }
        level thread triggerovertimetimer(level.initialwinningteam, level.teamdata[level.initialwinningteam]["plunderBanked"] * 10 >= getwincost());
        level waittill("bmo_overtime_start");
        while (level.currenttimelimitdelay < level.ontimelimitgraceperiod) {
            wait(level.framedurationseconds);
        }
    }
    level thread bmoendgameot();
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb4e4
// Size: 0x53
function bmoendgameot() {
    if (istrue(level.gameended)) {
        return;
    }
    level thread handlebmoendgamesplash();
    level thread namespace_d576b6dc7cef9c62::endgame(level.brgametype.firstteam, game["end_reason"]["plunder_win"], game["end_reason"]["plunder_loss"], 0, 1);
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb53e
// Size: 0x6f
function handlebmoendgamesplash() {
    var_464dd76c6ecb56fa = namespace_d576b6dc7cef9c62::getbrendsplashpostgamestate();
    foreach (player in level.players) {
        player setcachedclientomnvar("post_game_state", var_464dd76c6ecb56fa);
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb5b4
// Size: 0x104
function playerspawnendofgame() {
    if (level.var_7f1716b735a38c9f) {
        return 0;
    }
    if (!istrue(self.controlsfrozen)) {
        _freezecontrols(1);
    }
    spawnpoint = spawnstruct();
    player = self getspectatingplayer();
    if (!isdefined(player)) {
        player = self;
    }
    spawnpoint.origin = player.origin;
    spawnpoint.angles = player.angles;
    if (!player isonground()) {
        var_fbcabd62b8f66eb8 = namespace_2a184fc4902783dc::create_default_contents(1);
        spawnpoint.origin = namespace_d3d40f75bb4e4c32::droptogroundmultitrace(spawnpoint.origin, 0, -20000, var_fbcabd62b8f66eb8);
    }
    spawnpoint.origin = spawnpoint.origin + (0, 0, 100);
    if (!isdefined(level.endmatchcamerastriggered)) {
        level.endmatchcamerastriggered = 1;
        level thread triggerbloodmoneyendcameras();
    }
    return 1;
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb6c0
// Size: 0x581
function eomawardplayerxp() {
    level waittill("give_match_bonus");
    waitframe();
    var_7c3103094888139a = getdvarfloat(@"hash_624dff063fdc19e4", 0.001);
    var_e7e8ca63000a1c32 = getdvarfloat(@"hash_5776e92fc7e990f4", 0.05);
    var_e649b857d1df196f = getdvarint(@"hash_a0c1b8638163484e", 10000);
    var_bcda60d01edd703c = getdvarint(@"hash_7845f9181d5707ba", 7500);
    var_563b1704964abc60 = getdvarint(@"hash_163aca343e614b6e", 5000);
    foreach (team in level.teamnamelist) {
        var_4828ed9b88a47362 = namespace_c6ccccd95254983f::getteamplunder(team) * 10;
        var_9b88e8a64bd55390 = var_4828ed9b88a47362 >= getwincost();
        placement = game["teamPlacements"][team];
        var_8ae4367b9827d09e = 0;
        if (var_9b88e8a64bd55390) {
            var_8ae4367b9827d09e = var_bcda60d01edd703c;
        } else if (placement <= 10) {
            var_8ae4367b9827d09e = var_563b1704964abc60;
        }
        players = getteamdata(team, "players");
        foreach (player in players) {
            player namespace_d20f8ef223912e12::stopchallengetimers();
            if (!player rankingenabled() || !player hasplayerdata()) {
                continue;
            }
            player namespace_3c5a4254f2b957ea::incpersstat("cash", int(var_4828ed9b88a47362 / 10000));
            combatXP = player.pers["combatXP"];
            if (!isdefined(combatXP)) {
                combatXP = 0;
            }
            player setplayerdata(level.var_5d69837cf4db0407, "aarValue", 0, combatXP);
            missionXP = player.pers["missionXP"];
            if (!isdefined(missionXP)) {
                missionXP = 0;
            }
            player setplayerdata(level.var_5d69837cf4db0407, "aarValue", 1, missionXP);
            lootingXP = player.pers["lootingXP"];
            if (!isdefined(lootingXP)) {
                lootingXP = 0;
            }
            player setplayerdata(level.var_5d69837cf4db0407, "aarValue", 2, lootingXP);
            var_d239a4de12b2338 = 0;
            if (isdefined(player.plundercount)) {
                var_d239a4de12b2338 = int(player.plundercount * var_7c3103094888139a);
            }
            var_452885d9ffe85530 = 0;
            if (isdefined(player.plunderbanked)) {
                var_452885d9ffe85530 = int(player.plunderbanked * var_e7e8ca63000a1c32);
            }
            score = var_d239a4de12b2338 + var_452885d9ffe85530;
            if (score > 0) {
                player namespace_62c556437da28f50::giverankxp(#"hash_31a9f06f2a47aeff", score, undefined, 1, 1);
            }
            player setplayerdata(level.var_5d69837cf4db0407, "aarValue", 3, score);
            reconXP = player.pers["reconXP"];
            if (!isdefined(reconXP)) {
                reconXP = 0;
            }
            player setplayerdata(level.var_5d69837cf4db0407, "aarValue", 4, reconXP);
            matchbonus = 0;
            if (isdefined(player.matchbonus)) {
                matchbonus = int(player.matchbonus);
            }
            player setplayerdata(level.var_5d69837cf4db0407, "aarValue", 5, matchbonus);
            if (var_8ae4367b9827d09e > 0) {
                player namespace_62c556437da28f50::giverankxp(#"hash_9353d15b3ea6b33c", var_8ae4367b9827d09e, undefined, 1, 1);
            }
            player setplayerdata(level.var_5d69837cf4db0407, "aarValue", 6, var_8ae4367b9827d09e);
            var_bf587c66b60ef10f = player getplayerdata(level.var_5d69837cf4db0407, "aarValue", 7);
            var_efe4124eaa21ea43 = var_bf587c66b60ef10f + player.pers["summary"]["xp"];
            player setplayerdata(level.var_5d69837cf4db0407, "aarValue", 8, var_efe4124eaa21ea43);
            player function_34e46d26df79fdad();
        }
        if (istrue(level.var_db813db0fa91a0ce) && isdefined(level.var_e224ccaf8102eea7) && isdefined(level.var_e224ccaf8102eea7[team])) {
            logstring("Team Plunder Total: { Team: " + team + ", Placement: " + placement + ", Total Cash: " + level.var_e224ccaf8102eea7[team].var_42623c2865853280 + ", Looted: " + level.var_e224ccaf8102eea7[team].var_5aef484ac6780f1c + ", Contracts: " + level.var_e224ccaf8102eea7[team].var_690d93b2142ecf7 + ", Valuables: " + level.var_e224ccaf8102eea7[team].var_f86b346fef47a962 + ", Lost On Death: " + level.var_e224ccaf8102eea7[team].var_a9cfda826f991c30 + ", Lost On Purchase: " + level.var_e224ccaf8102eea7[team].var_a3442da3fded2730 + ", Net Dropped: " + level.var_e224ccaf8102eea7[team].var_bea7a1b2df733cdc + " }");
        }
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbc48
// Size: 0x261
function function_89c5c5be1e85310() {
    /#
        setdevdvarifuninitialized(@"hash_73759683c80b1a3d", 0);
        setdevdvarifuninitialized(@"hash_60ce22543dc3ff22", 0);
        setdevdvarifuninitialized(@"hash_67c33745f53b14d", 0);
        while (1) {
            if (getdvarint(@"hash_c5963975fc37d256", 0) != 0) {
                doteamextractedupdate();
                setdvar(@"hash_c5963975fc37d256", 0);
            }
            if (getdvarint(@"hash_67c33745f53b14d", 0) != 0) {
                setdvar(@"hash_67c33745f53b14d", 0);
                host = namespace_d576b6dc7cef9c62::gethostplayer();
                level.brgametype.firstteam = host.team;
                thread bmoendgameot();
            }
            if (getdvarint(@"hash_73759683c80b1a3d", 0) != 0) {
                setdvar(@"hash_73759683c80b1a3d", 0);
                var_620f245e58ff4740 = getwincost();
                var_620f245e58ff4740 = int(var_620f245e58ff4740 / 100);
                host = namespace_d576b6dc7cef9c62::gethostplayer();
                targetteam = "ui_nuke_timer_time";
                foreach (player in level.players) {
                    if (isalive(player) && player != host && player.team != host.team) {
                        targetteam = player.team;
                        level.teamdata[targetteam]["ui_nuke_end_milliseconds"] = int(var_620f245e58ff4740 - 100);
                        break;
                    }
                }
                wait(15);
                level.teamdata[targetteam]["ui_nuke_end_milliseconds"] = int(var_620f245e58ff4740);
            }
            if (getdvarint(@"hash_60ce22543dc3ff22", 0) != 0) {
                setdvar(@"hash_60ce22543dc3ff22", 0);
                var_620f245e58ff4740 = getwincost();
                var_620f245e58ff4740 = int(var_620f245e58ff4740 / 100);
                host = namespace_d576b6dc7cef9c62::gethostplayer();
                targetteam = host.team;
                level.teamdata[targetteam]["ui_nuke_end_milliseconds"] = int(var_620f245e58ff4740 - 100);
                break;
            }
            waitframe();
        }
    #/
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbeb0
// Size: 0x587
function initendcameralocations() {
    var_6f0d91b3ab59b3e8 = [];
    level.endcameraorigins = [];
    level.endcameraangles = [];
    if (level.mapname == "mp_br_mechanics") {
        level.endcameraorigins[0] = (8682, -1036, 427);
        level.endcameraangles[0] = (14, 163, 0);
        level.endcameraorigins[1] = (-1139, -3425, 1116);
        level.endcameraangles[1] = (33, 75, 0);
        level.endcameraorigins[2] = (-5567, -4786, 1116);
        level.endcameraangles[2] = (37, 192, 0);
    } else {
        level.endcameraorigins[0] = (-36548, -31983, 2400);
        level.endcameraangles[0] = (12, 72, 0);
        level.endcameraorigins[1] = (-17592, -36440, 1379);
        level.endcameraangles[1] = (17, 90, 0);
        level.endcameraorigins[2] = (-3520, -34298, 1217);
        level.endcameraangles[2] = (11, 110, 0);
        level.endcameraorigins[3] = (-9577, -25957, 360);
        level.endcameraangles[3] = (357, 82, 0);
        level.endcameraorigins[4] = (23022, -26926, 1359);
        level.endcameraangles[4] = (16, 101, 0);
        level.endcameraorigins[5] = (31261, -29753, 1359);
        level.endcameraangles[5] = (27, 52, 0);
        level.endcameraorigins[6] = (44843, -41261, 3220);
        level.endcameraangles[6] = (16, 52, 0);
        level.endcameraorigins[7] = (44229, -15403, 1331);
        level.endcameraangles[7] = (13, 72, 0);
        level.endcameraorigins[8] = (44491, 3484, 1638);
        level.endcameraangles[8] = (23, 11, 0);
        level.endcameraorigins[9] = (16047, -3206, 2613);
        level.endcameraangles[9] = (27, 309, 0);
        level.endcameraorigins[10] = (5668, -5905, 1614);
        level.endcameraangles[10] = (23, 304, 0);
        level.endcameraorigins[11] = (-13412, -20443, 1033);
        level.endcameraangles[11] = (11, 109, 0);
        level.endcameraorigins[12] = (-30369, -7811, 1680);
        level.endcameraangles[12] = (31, 339, 0);
        level.endcameraorigins[13] = (-26278, 4081, 142);
        level.endcameraangles[13] = (6, 110, 0);
        level.endcameraorigins[14] = (-16429, 6021, 847);
        level.endcameraangles[14] = (21, 57, 0);
        level.endcameraorigins[15] = (-7525, 11672, 1082);
        level.endcameraangles[15] = (14, 46, 0);
        level.endcameraorigins[16] = (8356, 15296, 2021);
        level.endcameraangles[16] = (12, 38, 0);
        level.endcameraorigins[17] = (26010, 29975, 2716);
        level.endcameraangles[17] = (13, 68, 0);
        level.endcameraorigins[18] = (12043, 30910, 3081);
        level.endcameraangles[18] = (21, 88, 0);
        level.endcameraorigins[19] = (7127, 52592, 2100);
        level.endcameraangles[19] = (28, 241, 0);
        level.endcameraorigins[20] = (-6693, 56481, 4026);
        level.endcameraangles[20] = (16, 246, 0);
        level.endcameraorigins[21] = (-21394, 37175, 757);
        level.endcameraangles[21] = (2, 124, 0);
        level.endcameraorigins[22] = (-26151, 25577, 271);
        level.endcameraangles[22] = (357, 10, 0);
    }
    if (0) {
        endcameradebug_think();
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc43e
// Size: 0x7b
function triggerbloodmoneyendcameras() {
    var_cdfa1020bbc3f969 = 0;
    foreach (player in level.players) {
        player thread playmatchendcamera(player, getbestcameraindex(player));
        var_cdfa1020bbc3f969++;
        if (var_cdfa1020bbc3f969 == 5) {
            waitframe();
            var_cdfa1020bbc3f969 = 0;
        }
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc4c0
// Size: 0x62
function endcameradebug_think() {
    while (1) {
        var_ed43777427f1dc38 = getdvarint(@"hash_f91d2c0618ed9086", -1);
        if (var_ed43777427f1dc38 > -1) {
            playmatchendcamera(level.players[0], getbestcameraindex(level.players[0]));
            setdvar(@"hash_f91d2c0618ed9086", -1);
        }
        waitframe();
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc529
// Size: 0xad
function getbestcameraindex(player) {
    var_bcd1f02c15cf8f02 = undefined;
    var_bf97af9158bcf3 = undefined;
    foreach (index, origin in level.endcameraorigins) {
        dist = distance2dsquared(player.origin, origin);
        if (dist <= 9000000) {
            return index;
        }
        if (!isdefined(var_bf97af9158bcf3) || var_bf97af9158bcf3 > dist) {
            var_bf97af9158bcf3 = dist;
            var_bcd1f02c15cf8f02 = index;
        }
    }
    return var_bcd1f02c15cf8f02;
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xc5de
// Size: 0xc3
function playmatchendcamera(player, cameraindex) {
    var_e0134dce95218ed1 = level.endcameraorigins[cameraindex];
    var_6e88057a6fa92c7 = level.endcameraangles[cameraindex];
    var_f0ffc87d0db8e9f0 = var_e0134dce95218ed1 + anglestoright(var_6e88057a6fa92c7) * 1000;
    var_9a8cb976407ae8c2 = var_6e88057a6fa92c7;
    var_5940f376a254619d = spawn("script_model", var_e0134dce95218ed1);
    var_5940f376a254619d setmodel("tag_origin");
    var_5940f376a254619d.angles = var_6e88057a6fa92c7;
    player cameralinkto(var_5940f376a254619d, "tag_origin");
    var_5940f376a254619d moveto(var_f0ffc87d0db8e9f0, 60);
    var_5940f376a254619d rotateto(var_9a8cb976407ae8c2, 60);
    if (0) {
        wait(5);
        player cameraunlink();
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc6a8
// Size: 0x97
function printallteamsplundercount() {
    /#
        wait(1);
        var_620f245e58ff4740 = getwincost();
        var_ddd20d819a369a7d = tablesort(game["Team Plunder Total: { Team: "], "75pf_grav_bmgm");
        for (i = 0; i < var_ddd20d819a369a7d.size - 1; i++) {
            if (isdefined(level.teamdata[var_ddd20d819a369a7d[i]]["ui_nuke_end_milliseconds"])) {
                var_4828ed9b88a47362 = namespace_c6ccccd95254983f::getteamplunder(var_ddd20d819a369a7d[i]) * 10;
                println("gamestate_90_perc" + var_ddd20d819a369a7d[i] + "ldls_grav_bmgm" + var_4828ed9b88a47362);
            }
        }
    #/
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc746
// Size: 0x2dd
function initdialog() {
    level endon("game_ended");
    waitframe();
    game["dialog"]["match_start"] = "bmlt_grav_gmty";
    game["dialog"]["offense_obj"] = "bmol_grav_boos";
    game["dialog"]["defense_obj"] = "bmol_grav_boos";
    game["dialog"]["event_chopper"] = "chpp_grav_bmev";
    game["dialog"]["event_airdrop"] = "ardr_grav_bmev";
    game["dialog"]["extract_enabled"] = "nbld_grav_bmxt";
    game["dialog"]["gamestate_25_perc"] = "25pf_grav_bmgm";
    game["dialog"]["gamestate_50_perc"] = "50pf_grav_bmgm";
    game["dialog"]["gamestate_75_perc"] = "75pf_grav_bmgm";
    game["dialog"]["gamestate_90_perc"] = "90pf_grav_bmgm";
    game["dialog"]["gamestate_25_perc_enemy"] = "25pn_grav_bmgm";
    game["dialog"]["gamestate_50_perc_enemy"] = "50pn_grav_bmgm";
    game["dialog"]["gamestate_75_perc_enemy"] = "75pn_grav_bmgm";
    game["dialog"]["gamestate_90_perc_enemy"] = "90pn_grav_bmgm";
    game["dialog"]["gamestate_25_perc_first"] = "25pf_grav_bmgm";
    game["dialog"]["gamestate_50_perc_first"] = "50pf_grav_bmgm";
    game["dialog"]["gamestate_75_perc_first"] = "75pf_grav_bmgm";
    game["dialog"]["gamestate_90_perc_first"] = "90pf_grav_bmgm";
    game["dialog"]["lead_lost"] = "ldls_grav_bmgm";
    game["dialog"]["lead_taken"] = "ldtk_grav_bmgm";
    game["dialog"]["mission_failure"] = "plnd_grav_msnf";
    game["dialog"]["mission_success"] = "plnd_grav_msnc";
    game["dialog"]["gamestate_top_5"] = "tp05_grav_bmgm";
    game["dialog"]["gamestate_top_10"] = "tp10_grav_gmst";
    game["dialog"]["bm_gamestate_overtime"] = "vrtm_grav_bgvb";
    game["dialog"]["bm_gamestate_overtime_enemy"] = "vrtn_grav_bmgm";
    game["dialog"]["team_loss"] = "lost_grav_bmgm";
    game["dialog"]["team_victory"] = "win1_grav_bmgm";
    game["dialog"]["event_bank"] = "event_bank";
    game["dialog"]["exfil_arrived"] = "exfil_arrived";
    game["dialog"]["exfil_failed"] = "exfil_failed";
    game["dialog"]["exfil_inbound"] = "exfil_inbound";
    game["dialog"]["exfil_leaving"] = "exfil_leaving";
    game["dialog"]["exfil_start_generic"] = "exfil_start_generic";
    game["dialog"]["exfil_start_win"] = "exfil_start_win";
    game["dialog"]["exfil_start_win_lz"] = "exfil_start_win_lz";
    game["dialog"]["exfil_success_full"] = "exfil_success_full";
    game["dialog"]["exfil_success_partial"] = "exfil_success_partial";
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xca2a
// Size: 0xdf
function function_597185764a5679f4() {
    var_89ce56155940323f = getdvarfloat(@"hash_ddfa90008c99da3c", 0.25) > randomfloat(1);
    if (!var_89ce56155940323f) {
        namespace_71073fa38f11492::disablefeature("circle");
        return;
    }
    game["dialog"]["public_events_choke_hold_start"] = "chkh_grav_name";
    namespace_71073fa38f11492::enablefeature("circleEarlyStart");
    level.var_e486acb8f70c45a2 = spawnstruct();
    level.var_e486acb8f70c45a2.delaytime = getdvarint(@"hash_9d3b9b1136287d59", 1500);
    level.var_e486acb8f70c45a2.circleradius = getdvarint(@"hash_7c47c81509bb5bef", 37500);
    level.var_e486acb8f70c45a2.var_4f81729168c0b8a = getdvarint(@"hash_76caafb421164ba8", 300);
    level thread function_af537bbd5b957fa6();
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcb10
// Size: 0x51
function function_af537bbd5b957fa6() {
    level endon("game_ended");
    level waittill("br_circle_started");
    namespace_d76af9f804655767::showsplashtoall("br_plunder_pe_choke_hold_active", "splash_list_br_plunder_iw9_mp");
    namespace_d3d40f75bb4e4c32::brleaderdialog("public_events_choke_hold_start");
    wait(level.var_e486acb8f70c45a2.var_4f81729168c0b8a);
    flag_set("chokehold_closed", 1);
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcb68
// Size: 0x27
function lootAllowedInBackpack(scriptablename) {
    if (istrue(level.var_3bee9b0a6835e07b)) {
        return namespace_cb965d2f71fefddc::isvaluable(scriptablename);
    } else {
        return 1;
    }
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcb96
// Size: 0x4
function markplayeraseliminatedonkilled() {
    return 0;
}

// Namespace namespace_4662b30263ed0da1/namespace_e71e954c5bb55904
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcba2
// Size: 0x273
function watchparachutersoverhead(var_2b029fe0e94cb290) {
    level endon("game_ended");
    level endon("cancel_watch_parachuters_overhead");
    while (1) {
        foreach (xuid, player in level.activeparachuters) {
            if (!isdefined(player) || !namespace_7e17181d03156026::isreallyalive(player) || !(player isparachuting() || player isinfreefall())) {
                level.activeparachuters[xuid] = undefined;
            } else {
                nearbyplayers = utility::playersincylinder(player.origin, level.parachuteoverheadwarningradius, undefined, level.parachuteoverheadwarningheight);
                var_55b4fa124c5108ff = player.team;
                foreach (targetplayer in nearbyplayers) {
                    if (isdefined(targetplayer.c130)) {
                        continue;
                    }
                    var_8b1b7044e27e6a56 = var_55b4fa124c5108ff == targetplayer.team;
                    if (var_8b1b7044e27e6a56) {
                        continue;
                    }
                    var_cda71aec07aab082 = !namespace_7e17181d03156026::isreallyalive(targetplayer) || istrue(targetplayer.inlaststand);
                    if (var_cda71aec07aab082) {
                        continue;
                    }
                    var_744496cccbbfcb78 = targetplayer isparachuting() || targetplayer isinfreefall();
                    if (var_744496cccbbfcb78) {
                        continue;
                    }
                    time = gettime();
                    var_8edff54c680323 = isdefined(targetplayer.heardparachuteoverheadtime) && time - targetplayer.heardparachuteoverheadtime < var_2b029fe0e94cb290;
                    if (var_8edff54c680323) {
                        continue;
                    }
                    targetplayer.heardparachuteoverheadtime = time;
                    if (namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73()) {
                        var_95ce4f91d0f58568 = namespace_d3d40f75bb4e4c32::brgetoperatorteam(targetplayer);
                        if (!isdefined(var_95ce4f91d0f58568)) {
                            var_95ce4f91d0f58568 = "allies";
                        }
                        var_7570afa45d86040f = game["voice"][var_95ce4f91d0f58568];
                        targetplayer queuedialogforplayer(level.activeparachutersfactionvo[var_7570afa45d86040f], "respawning_enemy_in_area", 2);
                    } else {
                        namespace_d3d40f75bb4e4c32::brleaderdialog("respawning_enemy_in_area", 1, [0:targetplayer]);
                    }
                }
                waitframe();
            }
        }
        waitframe();
    }
}

