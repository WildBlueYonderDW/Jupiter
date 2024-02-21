// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\dev.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\mp\class.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\weapon.gsc;
#using script_3214e6fcdce468a7;
#using scripts\engine\trace.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\damage.gsc;
#using scripts\mp\flags.gsc;
#using scripts\mp\carriable.gsc;
#using scripts\mp\gametypes\br_weapons.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using script_70f8c085c6bde77e;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using scripts\mp\calloutmarkerping_mp.gsc;
#using script_7ab5b649fa408138;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\omnvar_utility.gsc;
#using script_2669878cf5a1b6bc;
#using script_5762ac2f22202ba2;
#using scripts\cp_mp\challenges.gsc;
#using script_3e5a8aa5923bd393;
#using script_530f3ea26428deba;
#using scripts\mp\gamelogic.gsc;
#using script_2d9d24f7c63ac143;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\globallogic.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\cp_mp\parachute.gsc;
#using scripts\mp\gametypes\br_spectate.gsc;
#using script_2342b8aad723994e;
#using scripts\mp\utility\join_team_aggregator.gsc;
#using scripts\mp\gametypes\br_respawn.gsc;
#using script_930a1e7bd882c1d;
#using script_5bab271917698dc4;
#using scripts\mp\gametypes\br_analytics.gsc;
#using scripts\mp\gametypes\br_vehicles.gsc;
#using script_75377e59f5becac8;
#using script_7933519955f32c4e;
#using scripts\mp\gametypes\br_ending.gsc;
#using scripts\mp\gametypes\br_killstreaks.gsc;
#using scripts\mp\gametypes\br_skydive_protection.gsc;
#using script_669760f0500e4358;
#using script_744cad313ed0a87e;
#using script_21c19cfc7139d773;
#using script_15038e9b270f1b31;
#using script_5bc60484d17fa95c;
#using script_3583ff375ab3a91e;
#using script_7eafd8f2b77a1870;
#using scripts\mp\gametypes\br_alt_mode_inflation.gsc;
#using scripts\mp\gametypes\br_c130airdrop.gsc;
#using scripts\mp\gametypes\br_jugg_common.gsc;
#using scripts\mp\gametypes\br_dev.gsc;
#using script_48814951e916af89;
#using script_2391409ef7b431e1;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using script_47deb71f27d46832;
#using script_72af5a878a9d3397;
#using scripts\mp\music_and_dialog.gsc;
#using scripts\stealth\manager.gsc;
#using scripts\mp\playerstats_interface.gsc;
#using scripts\mp\gametypes\br.gsc;
#using script_7c40fa80892a721;
#using scripts\mp\gametypes\br_gulag.gsc;
#using scripts\mp\supers.gsc;
#using scripts\mp\tweakables.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\gametypes\br_c130.gsc;
#using scripts\mp\gametypes\br_functional_poi.gsc;
#using scripts\mp\gametypes\br_callouts.gsc;
#using scripts\mp\gametypes\br_quest_util.gsc;
#using script_64acb6ce534155b7;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using scripts\mp\gametypes\br_events.gsc;
#using scripts\mp\gametypes\br_publicevents.gsc;
#using scripts\mp\gametypes\br_attractions.gsc;
#using scripts\mp\gametypes\br_challenges.gsc;
#using script_261e315c49e5e4ef;
#using script_600b944a95c3a7bf;
#using script_342e51952b63e594;
#using script_e43e8e28e88639e;
#using script_3ff084f114b7f6c9;
#using script_14d3930854cb398c;
#using scripts\cp_mp\tripwire.gsc;
#using script_60e3273df6b5f7d1;
#using script_72d6af97cfc97305;
#using script_439d01e25d19543b;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using scripts\mp\utility\lui_game_event_aggregator.gsc;
#using scripts\mp\utility\disconnect_event_aggregator.gsc;
#using scripts\mp\loot.gsc;
#using script_6a8ec730b2bfa844;
#using scripts\mp\gametypes\br_rewards.gsc;
#using script_44e32214e5970458;
#using scripts\mp\equipment\molotov.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\javelin.gsc;
#using scripts\mp\scoreboard.gsc;
#using scripts\mp\callouts.gsc;
#using scripts\cp_mp\gasmask.gsc;
#using scripts\mp\spawnlogic.gsc;
#using script_b0385bb45379222;
#using scripts\mp\equipment\tac_insert.gsc;
#using scripts\mp\validation.gsc;
#using script_548072087c9fd504;
#using script_53da3333b83b3527;
#using scripts\stealth\player.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using script_55e418c5cc946593;
#using scripts\mp\perks\perks.gsc;
#using scripts\mp\damage.gsc;
#using scripts\cp_mp\utility\damage_utility.gsc;
#using script_40e63dd222434655;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\pet_watch.gsc;
#using scripts\mp\hud_message.gsc;
#using script_728ffcee8cbf30ee;
#using script_a34750d17473c49;
#using scripts\mp\gametypes\br_plunder.gsc;
#using script_ef36a50d9b4627d;
#using scripts\mp\utility\script.gsc;
#using script_58be75c518bf0d40;
#using script_76cc264b397db9cb;
#using scripts\mp\rank.gsc;
#using script_697b7ae06ba9b28c;
#using script_4cdabcd91a92977;
#using script_1f97a44d1761c919;
#using scripts\mp\utility\lower_message.gsc;
#using script_3aacf02225ca0da5;
#using scripts\mp\utility\points.gsc;
#using scripts\mp\weaponrank.gsc;
#using script_4a6760982b403bad;
#using scripts\mp\teams.gsc;
#using scripts\mp\potg.gsc;
#using scripts\mp\final_killcam.gsc;
#using scripts\mp\laststand.gsc;
#using script_6a5d3bf7a5b7064a;
#using script_40f4c8f2b94c5cd9;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_48614492ef09b23;
#using scripts\mp\equipment.gsc;
#using scripts\mp\gametypes\br_armory_kiosk.gsc;
#using scripts\mp\playerlogic.gsc;
#using scripts\mp\spectating.gsc;
#using scripts\mp\menus.gsc;
#using scripts\mp\gametypes\br_extract_quest.gsc;
#using scripts\cp_mp\killstreaks\airdrop.gsc;
#using scripts\cp_mp\gestures.gsc;
#using scripts\cp_mp\execution.gsc;
#using scripts\mp\perks\perkfunctions.gsc;
#using scripts\mp\equipment\support_box.gsc;
#using script_7ef95bba57dc4b82;
#using scripts\mp\equipment\fulton.gsc;
#using script_1d393929cf0bd6a2;
#using scripts\mp\bots\bots_gametype_br.gsc;
#using script_556b8aeaa691317f;
#using script_15eddb0fac236a22;
#using scripts\mp\events.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using script_26ccbfe3954cacf4;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using script_371b4c2ab5861e62;
#using script_16ddd685a448c6d2;

#namespace br;

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ee8
// Size: 0x1555
function main() {
    /#
        level thread function_3a8fbdf9155f1b79();
    #/
    level.var_ef4c0a9630e35946 = 1;
    level.clearstockondrop = 1;
    level.disablespawncamera = 1;
    level.armoronweaponswitchlongpress = 1;
    level.dangerzoneskipequipment = 1;
    level.noweaponfalloff = 0;
    level.clampstepbulletdamage = 2;
    level.var_45496c9df00f2bd4 = getdvarint(@"hash_736b569488dc222c", 1);
    if (isusingmatchrulesdata()) {
        level.br_allowloadout = getmatchrulesdata("brData", "allowLoadout");
        level.var_66113aa6fc12be57 = getmatchrulesdata("brData", "allowLoadoutPreLobbyOnly");
    } else {
        level.br_allowloadout = getdvarint(@"hash_c0dba6a7250aad33", 0);
        level.var_66113aa6fc12be57 = getdvarint(@"hash_746bef1d96c7472d", 0);
    }
    var_715b3bac241cdb32 = getdvarint(@"hash_8ef1bd8f6066b1ba", 0);
    if (var_715b3bac241cdb32) {
        level.br_allowloadout = var_715b3bac241cdb32 == 2;
    }
    level.var_6d1d9e1b59c6f37 = getdvarint(@"hash_1a1007f742526dfd", 0);
    level.var_f561fc43a226dae4 = getdvarint(@"hash_74c08dc52c036afa", 0);
    level.var_7d17e26667be2792 = getdvarint(@"hash_55d9444d8a3ce31a", 0);
    level.var_472d7a6d15e57940 = getdvarint(@"hash_586d32848f833922", 1);
    level.var_1d814f83596d0a02 = getdvarint(@"hash_7a1da73fa673ed8", 1);
    level.var_47207b7b330cf8e0 = getdvarint(@"hash_7a10dc1404d50bc2", 0);
    level.var_f478c1f94caa7e9 = getdvarint(@"hash_4f0a12b17756a2d0", 1);
    level.var_d914655fe46b8e34 = getdvarint(@"hash_6282debf96cfbaee", 0);
    level.var_87a4731d4dce4c3f = &namespace_aead94004cf4c147::function_8237b4eeab275f08;
    namespace_36f464722d326bbe::removematchingents_bykey("delete_on_load", "targetname");
    namespace_77cb23aada5edffd::init();
    namespace_77cb23aada5edffd::setupcallbacks();
    level.var_c62d39d6e6afb119 = istrue(level.var_62f6f7640e4431e3.var_86488a8f183d526d);
    level.var_58adce74179ab9ef = getsubgametype() != "dmz" && getsubgametype() != "exgm";
    allowed[0] = getgametype();
    allowed[allowed.size] = getsubgametype();
    if (getgametype() != "br") {
        allowed[allowed.size] = "br";
    }
    namespace_19b4203b51d56488::main(allowed);
    if (getdvarint(@"hash_169cf144591321b3", 0) == 1) {
        setdvar(@"hash_a85ba82ffd9faefe", 0);
        setdvar(@"hash_c5d765aefb9658bd", 2200);
        if (getdvarint(@"hash_23235702fbea7b42", 0) == 1) {
            setdvar(@"hash_2c9195a6f431585d", 1);
            setdvar(@"hash_58a078a367c02ab3", 1);
        } else {
            setdvar(@"hash_2c9195a6f431585d", 0);
        }
    } else {
        setdvar(@"hash_a85ba82ffd9faefe", 0);
        setdvar(@"hash_2c9195a6f431585d", 0);
    }
    level.var_e028ca551ecc95a3 = getdvarint(@"hash_38c2fc8b2e1387e8", 0);
    level.var_cc9e990b6e83975b = getdvarint(@"hash_ad47420125a85024", 0);
    level.var_a101059dea76957c = getdvarint(@"hash_97a6fd51b5e218ee", 0);
    namespace_71073fa38f11492::init();
    if (isusingmatchrulesdata()) {
        level.initializematchrules = &initializematchrules;
        [[ level.initializematchrules ]]();
        level thread reinitializematchrulesonmigration();
    } else {
        registerscorelimitdvar(getgametype(), 1);
        registertimelimitdvar(getgametype(), 0);
        registerroundlimitdvar(getgametype(), 1);
        registerwinlimitdvar(getgametype(), 1);
        registernumlivesdvar(getgametype(), 1);
        registerhalftimedvar(getgametype(), 0);
        registerlaststandhealthdvar(100);
        registerlaststandrevivehealthdvar(30);
        registerlaststandtimerdvar(60);
        registerlaststandinvulntimerdvar(0);
        registerlaststandsuicidetimerdvar(10);
        registerlaststandrevivetimerdvar(5);
        registerlaststandweapondvar("iw9_gunless");
        registerlaststandrevivedecayscaledvar(0.5);
        registerlaststandweapondelaydvar(1);
        setdvar(@"hash_8236ed50fad3839d", 5);
        setdvar(@"hash_b1dd4b297385282c", 1);
        setdvarifuninitialized(@"hash_ddd02929770fcc8c", 0);
        setdvarifuninitialized(@"hash_7a493092f8a1c04c", getdvarint(@"hash_ddd02929770fcc8c", 0));
        setdvarifuninitialized(@"hash_a3a7191f4314591f", 2);
        setdvarifuninitialized(@"hash_bba79eeb1c990103", 1);
        setdvarifuninitialized(@"hash_1a0de898609317b4", 1);
        setdvarifuninitialized(@"hash_5c93dcd7535822e6", 0);
        setdvarifuninitialized(@"hash_1c8c6ec12cb275ca", 1);
        setdvarifuninitialized(@"hash_296dec2cbcfb6606", 0);
    }
    defineplayerloadout();
    updategametypedvars();
    namespace_5078ee98abb32db9::initparachutedvars();
    table = "classtable:classtable_br_prematch";
    level.var_3dc5c06b446489 = 10;
    if (getdvarint(@"hash_39c3947a2e4f5f9e", 0)) {
        table = "classtable:classtable_br_default_mgl";
    }
    if (namespace_71073fa38f11492::isfeatureenabled("prematchBlueprints")) {
        level thread prematchinitblueprintloadouts();
    } else {
        prematchinitloadouts(table);
    }
    if (istrue(level.br_allowloadout)) {
        level.modeloadoutupdateammo = &brloadoutupdateammo;
        if (!istrue(level.var_66113aa6fc12be57)) {
            level.br_loadout_option = 0;
        }
        level.giveloadouteverytime = 1;
    }
    thread function_b01c9196b051f596();
    thread waitthensetstatgroupreadonly();
    level.teambased = 0;
    level.overridecrateusetime = 0.5;
    level.onplayerscore = &onplayerscore;
    level.onprecachegametype = &onprecachegametype;
    level.onstartgametype = &onstartgametype;
    level.onplayerconnect = &onplayerconnect;
    level.getspawnpoint = &getspawnpoint;
    level.modeonspawnplayer = &onspawnplayer;
    level.modifyplayerdamage = &brmodifyplayerdamage;
    level.modifyvehicledamage = &brmodifyvehicledamage;
    level.onplayerdamaged = &onplayerdamaged;
    level.onnormaldeath = &onnormaldeath;
    level.ondeadevent = &ondeadevent;
    level.ononeleftevent = &ononeleftevent;
    level.onplayerkilled = &onplayerkilled;
    level.onsuicidedeath = &onsuicidedeath;
    level.objvisall = 1;
    level.ontimelimit = &ontimelimit;
    level.prewaitandspawnclient = &brprewaitandspawnclient;
    level.modeplayerskipdialog = &modeplayerskipdialog;
    level.allowfauxdeath = 0;
    level.var_b9c50a4fd9223cc7 = &brendgame;
    level.var_62a7b43f2b60646d = &function_6760d3783dfac7dd;
    level.var_67a646dc2b984dac = &function_67a646dc2b984dac;
    level.var_4038d35f2cb73fd7 = &namespace_71073fa38f11492::isfeaturedisabled;
    level.migratespectators = &namespace_a9c534dc7832aba4::migratespectators;
    namespace_c31609f90efcf2ca::registeronplayerjoinsquadcallback(&onplayerjoinsquad);
    namespace_1309ce202b9aa92b::registeronplayerjointeamcallback(&onplayerjointeam);
    if (!istrue(level.br_allowloadout) && !istrue(level.var_e4a482edc1542597)) {
        level.parachutetakeweaponscb = &namespace_5078ee98abb32db9::takeweaponsdefaultfunc;
        level.parachuterestoreweaponscb = &nakeddrop;
    } else {
        level.parachutetakeweaponscb = &namespace_5078ee98abb32db9::takeweaponsdefaultfunc;
        level.parachuterestoreweaponscb = &loadoutdrop;
    }
    level.modeshoulddofauxdeathfunc = &namespace_4f9f94245708410d::playershoulddofauxdeath;
    level.modeonlaststandfunc = &namespace_4f9f94245708410d::playersetinlaststand;
    level.modeonexitlaststandfunc = &playerexitlaststand;
    level.endgame = &brendgame;
    level.laststandweaponcallback = &brchooselaststandweapon;
    level.modelaststandallowed = &modelaststandallowed;
    level.preplayerdamaged = &brpreplayerdamaged;
    level.modevalidatekillcam = &brvalidatekillcam;
    level.modespawnclient = &spawnclientbr;
    level.onsupportboxusedbyplayer = &onsupportboxusedbyplayer;
    level.onarmorboxusedbyplayer = &onarmorboxusedbyplayer;
    level.var_f41d94b42b42e948 = &function_f41d94b42b42e948;
    level.var_130bc3f5f33bb97d = &function_130bc3f5f33bb97d;
    level.var_f24ae0993efca48f = &function_f24ae0993efca48f;
    level.onnewequipmentpickup = &onnewequipmentpickup;
    level.ongrenadeused = &ongrenadeused;
    level.onweapontaken = &onweapontaken;
    level.modeplayerkilledspawn = &brplayerkilledspawn;
    level.modemayconsiderplayerdead = &brmayconsiderplayerdead;
    level.onplayerconnectstream = &onplayerconnectstream;
    level.playerisstreaming = &playerisstreaming;
    level.lastdroppableweaponchanged = &lastdroppableweaponchanged;
    level.regenhealthaddfunc = &brregenhealthadd;
    level.regendelayspeedfunc = &brregendelayspeed;
    level.modeaddtoteamlives = &brmodeaddtoteamlives;
    level.moderemovefromteamlives = &brmoderemovefromteamlives;
    level.modeallowmeleevehicledamage = &modeallowmeleevehicledamage;
    level.modeignorevehicleexplosivedamage = &modeignorevehicleexplosivedamage;
    level.modevalidatekillstreakslot = &brmodevalidatekillstreakslot;
    level.var_9e34d99a98d2ff67 = &function_9e34d99a98d2ff67;
    level.var_29f84151a47f0a35 = &function_342438311e316357;
    level.var_58a42cd072629ca = &namespace_81156089ff1fe819::function_59e8b4ed75ca8b92;
    if (!isdefined(level.modeiskillstreakallowed)) {
        level.modeiskillstreakallowed = &briskillstreakallowed;
    }
    if (!istrue(getdvarint(@"hash_dd7b87825ab4422", 0))) {
        level.var_d1df695cab85185c = &function_aa670c3018e4340e;
        level.var_331f0fbe61a03f2b = &function_758ee105bdf0c62d;
        level.var_36ed758616fc9e8d = &function_dd137d458f25fefb;
    } else {
        level.onscavengerbagpickup = &onscavengerbagpickup;
    }
    level.updategameevents = &br_updategameevents;
    level.checkforlaststandfinish = &br_checkforlaststandfinish;
    level.checkforlaststandwipe = &br_checkforlaststandwipe;
    level.vehicleoccupantdeathcustomcallback = &br_onvehicledeath;
    level.var_d95b39e262c1049a = &function_bd2737827d4fc5d7;
    level.var_f1659f4dcd686291 = &function_d62ff7c7859f5b9c;
    level.allowclasschoicefunc = &brallowclasschoicefunc;
    level.tacticaltimemod = dvarfloatvalue("tacticalTimeMod", 2.5, 0.5, 5);
    level.addlaststandoverheadiconcallback = &void;
    level.dontshootwhileparachuting = 1;
    level.disablecopycatloadout = 1;
    level.disableinitplayergameobjects = 1;
    level.laststandkillteamifdowndisable = 1;
    level.killstreakweaponfiredcontinue = &killstreakweaponfiredcontinue;
    level.makedroneguardscrambler = 1;
    level.traceselectedmaplocation = &traceselectedmaplocation;
    level.var_947925f5fc6939a3 = &function_227ca42a35b0398b;
    if (getdvarint(@"hash_18b7464a93050781", 1)) {
        level.br_prematchffa = 1;
        if (!istrue(level.var_78db23c4f4816114)) {
            level.allowprematchdamage = 1;
        }
        level.recordfinalkillcam = 0;
        if (getdvarint(@"hash_e76748b9932f4dbd", 0) == 0) {
            level.ignorescoring = 1;
            level.disableweaponstats = 1;
            level.disablestattracking = 1;
            if (getsubgametype() != "dmz") {
                level.challengesdisabled = 1;
            }
        }
        level.prematchaddkillfunc = &brprematchaddkill;
        level.onattackerdamagenottracked = &bronattackerdamagenottracked;
        setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_numLives"), 0);
    }
    level.var_b89a535236a6f3d8 = &function_b89a535236a6f3d8;
    level.br_prematchloot = [];
    level.br_prematchlootparts = [];
    setomnvar("scriptable_loot_hide", 1);
    setomnvar("ui_killcam_copycat", 0);
    level.bypassclasschoicefunc = &pickclassbr;
    setomnvarforallclients("ui_skip_loadout", 0);
    level.assists_disabled = undefined;
    game["dialog"]["gametype"] = "wrzn_wzan_gmty";
    game["dialog"]["offense_obj"] = "klll_grav_hint";
    game["dialog"]["defense_obj"] = "hint_ffa";
    game["dialog"]["obj_extraction"] = "objective_extraction";
    game["dialog"]["prematch_enter"] = "prmt_grav_gmst";
    game["dialog"]["prematch_end"] = "prmn_grav_gmst";
    game["dialog"]["deploy_squad_leader"] = "dpsl_grav_gmst";
    game["dialog"]["first_circle"] = "crcf_grav_gmst";
    game["dialog"]["new_circle"] = "crcn_grav_gmst";
    game["dialog"]["circle_closing"] = "crrc_grav_gmst";
    game["dialog"]["final_circle"] = "crrf_grav_gmst";
    game["dialog"]["last_man_standing"] = "lsms_grav_gmst";
    game["dialog"]["match_start"] = "btry_grav_gmty";
    game["dialog"]["primary_objective"] = "btry_grav_objt";
    game["dialog"]["supply_drop_incoming"] = "sppd_grav_gmst";
    game["dialog"]["team_loss"] = "lose_grav_gmst";
    game["dialog"]["team_victory"] = "win1_grav_gmst";
    game["dialog"]["top_2"] = "tp02_grav_gmst";
    game["dialog"]["top_3"] = "tp03_grav_gmst";
    game["dialog"]["top_5"] = "tp05_grav_gmst";
    game["dialog"]["top_10"] = "tp10_grav_gmst";
    game["dialog"]["top_25"] = "tp25_grav_gmst";
    game["dialog"]["top_50"] = "tp50_grav_gmst";
    game["dialog"]["top_5_lose"] = "t05l_grav_gmty";
    game["dialog"]["top_10_lose"] = "t10l_grav_gmty";
    game["dialog"]["top_25_lose"] = "t25l_grav_gmty";
    game["dialog"]["finish_calls"] = "game_end_prompt_finish_calls";
    game["dialog"]["respawning_enemy_in_area"] = "nmnr_grav_rspw";
    game["dialog"]["br_sitrep_circle_in"] = "rdtn_grav_bscn";
    game["dialog"]["br_sitrep_circle_mixed"] = "rdtn_grav_bscm";
    game["dialog"]["br_sitrep_circle_out"] = "rdtn_grav_bsco";
    game["dialog"]["br_sitrep_circle_outfar"] = "rdtn_grav_bscf";
    level notify("br_dialog_initialized");
    level.disabledamagestattracking = 1;
    level.disabledamagestattrackingfunc = &brdisabledamagestattracking;
    level.startingspawns = [];
    level._effect["vfx_smk_signal"] = loadfx("vfx/_requests/mp_gameplay/vfx_smk_signal");
    level._effect["vfx_smk_signal_gr"] = loadfx("vfx/_requests/mp_gameplay/vfx_smk_signal_gr");
    level._effect["vfx_smk_signal_red"] = loadfx("vfx/iw8_cp/prop/vfx_smk_signal_red");
    level.bots_ignore_team_balance = 1;
    if (!isdefined(level.teammaxfill)) {
        level.teammaxfill = getdvarint(@"hash_87507e11eadd4db4", 1) > 0;
    }
    level.lowpopcheck = getdvarint(@"hash_be00f4eebc5a0aca", 0);
    level.modespecificparachutecompletecb = &parachutecomplete;
    level.onfirstlandcallback = &onfirstlandcallback;
    level.var_387cd21817428092 = getdvarint(@"hash_8ad87bd26869ec0d", 0);
    if (!isdefined(level.skipprematchdropspawn)) {
        level.skipprematchdropspawn = getdvarint(@"hash_d182f4551b978e2b", 0);
    }
    level.br_debugsolotest = getdvarint(@"hash_c163d5db19834c48", 0);
    level.var_d804888d9484ff69 = getdvarint(@"hash_732cd1e227920a87", 0);
    if (function_a587b0b0998c6d13()) {
        level.disableforfeit = 1;
    }
    level.br_infils_disabled = getdvarint(@"hash_98f4cdf3fa51a9d0", 0) || namespace_71073fa38f11492::isfeaturedisabled("infil");
    level.br_circle_disabled = getdvarint(@"hash_d65846276aeae13", 0);
    level.extractplunderheliinvulnerable = getdvarint(@"hash_9126054077cbefac", 1);
    level.br_ending_delay = getdvarint(@"hash_1122632b784e1b7", 4);
    level.roundenddelay = 0.5;
    level.postroundtime = 9;
    if (!istrue(level.var_ece60df4b8bc448)) {
        level.var_ed844db90cb6d370 = 0;
    }
    level.br_pelletmaxdamage = getdvarint(@"hash_316757c170fc976d", -1);
    level.var_2caca637693d024d = getdvarint(@"hash_fc3e181b5b3e5b7", -1);
    level.var_22db86fd48fee384 = getdvarint(@"hash_a72b8dad6edb5d9e", -1);
    level.var_e247454ac2869696 = getdvarint(@"hash_5fcbce13ef8d5f", 9);
    level.var_a7f81dfdc88e53e6 = getdvarint(@"hash_4449685517101675", 0);
    level.var_4941fc1ee570d4cb = &function_c8915ac8c8987452;
    level.var_4c124f424cdfa325 = getdvarint(@"hash_170c10715af6a431", -1);
    level.var_6bed852a909e4f70 = getdvarint(@"hash_eca4cf1db65156c9", 0);
    level.var_68c03dccce80d6f8 = getdvarint(@"hash_ccd72baa1f9838c", 1);
    level.var_e97d3de5b99775a6 = getdvarint(@"hash_bb9ca2724c97686b", 1);
    level.var_7f3aafcf56c9ce14 = getdvarint(@"hash_a5369146af094f2c", 1);
    level.var_f2c468b1d700a1bd = getdvarint(@"hash_3bbab476317628c6", 1) == 1;
    level.var_455a4e4b5e61f55f = getdvarint(@"hash_4dd57309d51b9d0a", 1) == 1;
    level.var_8a854ec031bb41f1 = getdvarint(@"hash_aeb97a5fada9c62f", 1) == 1;
    level.var_318de67b5265b4c6 = getdvarint(@"hash_6132d06d6475b2e0", 1) == 1;
    level.var_2f60d02380cd603d = &function_ad8c1e6228a10058;
    level.var_b13e35608b336d65 = &namespace_aead94004cf4c147::function_b13e35608b336d65;
    level.var_6196d9ea9a30e609 = &namespace_aead94004cf4c147::function_6196d9ea9a30e609;
    level.var_afa6afa7165491d8 = &namespace_aead94004cf4c147::function_897b29adb37f06a7;
    level.var_dc52a11d1ee2690e = getdvarint(@"hash_4f15f2aa925e8391", 14000);
    level.var_5b5a1fcd1024eda5 = getdvarint(@"hash_6928f1749ee75af5", 0);
    level.var_b257658f289a3108 = getdvarfloat(@"hash_c8e65e0736e16b65", 0.09);
    level.var_27506e83d743e391 = getdvarint(@"hash_71f3055701408861", 6);
    level.var_5321a1377f9cc5aa = getdvarint(@"hash_81d2ecdee8b86aba", 6500);
    level.var_6fbd98e2b09d3c26 = throttle::function_e4c99b0f178ffb98("dist_tracking", getdvarint(@"hash_a5863203bd890f51", 1));
    level.var_493c039ada7d082e = throttle::function_e4c99b0f178ffb98("log_starting_loadout", getdvarint(@"hash_7753e675e77cb21f", 1));
    level.var_b24b5841e002edae = throttle::function_e4c99b0f178ffb98("inc_rank_xp", getdvarint(@"hash_4261bac4ca06ff45", 1));
    function_525d65f5d0d3200e();
    function_cda409f3a76dac5();
    if (!isdefined(level.br_loadout_option)) {
        brinitloadoutoption();
    }
    namespace_8bfdb6eb5a3df67a::function_600cc18a5b7b64b0();
    namespace_a011fbf6d93f25e5::branalytics_init();
    namespace_15d3019056d1bcea::brvehiclesinit();
    namespace_56a3588493afc984::main();
    namespace_973962356ce55fee::main();
    namespace_d92c3c983abee514::br_ending_init();
    namespace_7015c4c971547a66::init();
    namespace_250014dec221561c::init();
    level thread namespace_872204d77e9872c0::init(getsubgametype() != "dmz");
    if (istrue(level.var_c62d39d6e6afb119)) {
        thread namespace_bd614c3c2275579a::init();
    } else {
        thread function_9c8dfd3b19180b63();
    }
    level thread namespace_88bfae359020fdd3::init();
    level thread namespace_eca7530e5715bb19::init();
    level thread namespace_13e4e9def5bc390d::init();
    level thread namespace_eb17b46cdcb98eea::function_dbdca8ca57e8d71d();
    level thread namespace_ad49798629176e96::function_61b256ed26c0a7f7();
    level thread namespace_e70667b4168cd6::function_5675a69bbcea259();
    thread function_4708e0cb7eea8875();
    thread function_d1618645a2c0e3e6();
    initializetweakableoverrides();
    entcleanup();
    level thread announceplayercountlandmarks();
    level.var_c59c301eaabc2e32 = getdvarint(@"hash_19fae1aad58e8c50", 0);
    setdvarifuninitialized(@"hash_a5ab8ed6cc1b486a", 3);
    setdvarifuninitialized(@"hash_d9b119233df13ac1", 600);
    setdvarifuninitialized(@"hash_fdeb104ec6908df8", 600);
    setdvarifuninitialized(@"hash_9775c39c335aab23", 600);
    setdvar(@"hash_7b5549fcfa5138bc", 30);
    namespace_b08dd2d4e74abdfa::function_c238e4c6605e99f8();
    namespace_85358e51a5be9d59::init();
    thread namespace_d58f8bbad53774ad::init();
    thread namespace_cf880efca02c6010::init();
    thread namespace_e4c20df2c9115a56::init();
    if (!istrue(level.var_4fe0c43951f6ce37)) {
        thread namespace_bfef6903bca5845d::init();
    }
    thread namespace_85cd45b4fe0d86fb::function_d22b3026c3183ead();
    thread function_828026e0c887cd11();
    thread function_be78b07e93d46175();
    namespace_bfef6903bca5845d::function_93add0b65db9f722(&function_56869e118720ca3b, level);
    level.var_9a849908e60b857c = getdvarint(@"hash_9b611cf0cb4bf80e", 0);
    if (!flag_exist("stealth_enabled")) {
        flag_init("stealth_enabled");
        flag_init("level_stealth_initialized");
        flag_init("stealth_spotted");
    }
    if (getdvarint(@"hash_110917caea6fc144", 1) == 1) {
        level thread function_ea010c4d09365b32();
    }
    registersharedfunc("hud", "showBrDMZSplash", &namespace_d696adde758cbe79::showDMZSplash);
    namespace_20e47d4600ec88ae::init();
    if (namespace_36f464722d326bbe::function_ba5574c7f287c587() || namespace_36f464722d326bbe::function_6493ec89ae923684()) {
        namespace_92443376a63aa4bd::initialize();
    }
    if (!namespace_71073fa38f11492::isbrgametypefuncdefined("lootAllowedInBackpack")) {
        namespace_71073fa38f11492::registerbrgametypefunc("lootAllowedInBackpack", &function_e83ab39a1e762ead);
    }
    function_30887b17705338b6();
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x5444
// Size: 0x14
function private function_3a8fbdf9155f1b79() {
    /#
        wait(1);
        adddebugcommand("prmn_grav_gmst");
    #/
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x545f
// Size: 0x1d
function function_30887b17705338b6() {
    level.var_1bc9ccb3f47cf947 = istrue(getdvarint(@"hash_2e5b8ec324d79730", 1));
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5483
// Size: 0x3e
function function_b01c9196b051f596() {
    var_faf0d2fac3f47583 = getsubgametype();
    level.nosuspensemusic = 1;
    waittillframeend();
    thread namespace_3bde6869e44a2770::stopsuspensemusic();
    if (var_faf0d2fac3f47583 != "dmz") {
        function_f1aed36ab4598ea("mp_gamemode_br");
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54c8
// Size: 0xb
function function_d1618645a2c0e3e6() {
    level waittill("infils_ready");
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x54da
// Size: 0x354
function function_4708e0cb7eea8875() {
    if (!istrue(getdvarint(@"hash_72ae262a8559256", 0))) {
        return;
    }
    level waittill("infils_ready");
    function_71a28a935629a941("br_saba_aieventlist");
    array["spotted"]["ally_damaged"] = 512;
    array["hidden"]["ally_damaged"] = 512;
    array["spotted"]["ally_hurt_peripheral"] = 512;
    array["hidden"]["ally_hurt_peripheral"] = 512;
    array["spotted"]["ally_killed"] = 256;
    array["hidden"]["ally_killed"] = 256;
    array["spotted"]["attack"] = 512;
    array["hidden"]["attack"] = 512;
    array["spotted"]["object_impact"] = 128;
    array["hidden"]["object_impact"] = 128;
    array["spotted"]["death"] = 256;
    array["hidden"]["death"] = 128;
    array["spotted"]["decoy_grenade"] = 256;
    array["hidden"]["decoy_grenade"] = 128;
    array["spotted"]["defaultevent"] = 256;
    array["hidden"]["defaultevent"] = 128;
    array["spotted"]["door_bash"] = 512;
    array["hidden"]["door_bash"] = 256;
    array["spotted"]["explosion"] = 256;
    array["hidden"]["explosion"] = 128;
    array["spotted"]["footstep"] = 180;
    array["hidden"]["footstep"] = 180;
    array["spotted"]["footstep_walk"] = 180;
    array["hidden"]["footstep_walk"] = 180;
    array["spotted"]["footstep_sprint"] = 360;
    array["hidden"]["footstep_sprint"] = 240;
    array["spotted"]["glass_destroyed"] = 384;
    array["hidden"]["glass_destroyed"] = 256;
    array["spotted"]["grenade danger"] = 256;
    array["hidden"]["grenade danger"] = 128;
    array["spotted"]["grenade_ping"] = 256;
    array["hidden"]["grenade_ping"] = 128;
    array["spotted"]["gunshot"] = 960;
    array["hidden"]["gunshot"] = 480;
    array["spotted"]["gunshot_impact"] = 240;
    array["hidden"]["gunshot_impact"] = 180;
    array["spotted"]["gunshot_teammate"] = 256;
    array["hidden"]["gunshot_teammate"] = 256;
    array["spotted"]["pain"] = 256;
    array["hidden"]["pain"] = 128;
    array["spotted"]["projectile_impact"] = 256;
    array["hidden"]["projectile_impact"] = 256;
    array["spotted"]["silenced_shot_impact"] = 64;
    array["hidden"]["silenced_shot_impact"] = 64;
    array["spotted"]["throwingknife_impact"] = 96;
    array["hidden"]["throwingknife_impact"] = 96;
    array["spotted"]["window_open"] = 128;
    array["hidden"]["window_open"] = 0;
    namespace_833595e973766257::set_event_distances(array);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5835
// Size: 0x32
function waitthensetstatgroupreadonly() {
    self endon("game_ended");
    wait(1);
    if (isdefined(level.playerstats)) {
        namespace_a9b836227bcbf6e6::makeplayerstatgroupreadonly("losses");
        namespace_a9b836227bcbf6e6::makeplayerstatgroupreadonly("winLoss");
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x586e
// Size: 0x41
function entcleanup() {
    for (i = 1; i < 10; i++) {
        _delete_ents("script_noteworthy", "locale_" + i);
    }
    _delete_ents("script_noteworthy", "locale_99");
}

// Namespace br/namespace_d20f8ef223912e12
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58b6
// Size: 0x31
function _delete_ents(key, value) {
    ents = getentarray(value, key);
    array_call(ents, &delete);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58ee
// Size: 0x418
function initstandardloadout(tablename, classindex) {
    var_a300fa75277719ee = namespace_d19129e4fa5d176::function_df2933f96d726d71(tablename);
    /#
        assert(classindex < var_a300fa75277719ee);
    #/
    loadout["loadoutArchetype"] = "archetype_assault";
    loadout["loadoutPrimary"] = namespace_d19129e4fa5d176::function_c7a0b640c398497(tablename, classindex).primaryweapon.weapon;
    loadout["loadoutPrimaryAttachment"] = namespace_d19129e4fa5d176::function_c7a0b640c398497(tablename, classindex).primaryweapon.attachment1;
    loadout["loadoutPrimaryAttachment2"] = namespace_d19129e4fa5d176::function_c7a0b640c398497(tablename, classindex).primaryweapon.attachment2;
    loadout["loadoutPrimaryAttachment3"] = namespace_d19129e4fa5d176::function_c7a0b640c398497(tablename, classindex).primaryweapon.attachment3;
    loadout["loadoutPrimaryAttachment4"] = namespace_d19129e4fa5d176::function_c7a0b640c398497(tablename, classindex).primaryweapon.attachment4;
    loadout["loadoutPrimaryAttachment5"] = namespace_d19129e4fa5d176::function_c7a0b640c398497(tablename, classindex).primaryweapon.attachment5;
    loadout["loadoutPrimaryCamo"] = namespace_d19129e4fa5d176::function_c7a0b640c398497(tablename, classindex).primaryweapon.camo;
    loadout["loadoutPrimaryReticle"] = namespace_d19129e4fa5d176::function_c7a0b640c398497(tablename, classindex).primaryweapon.reticle;
    loadout["loadoutSecondary"] = namespace_d19129e4fa5d176::function_c7a0b640c398497(tablename, classindex).secondaryweapon.weapon;
    loadout["loadoutSecondaryAttachment"] = namespace_d19129e4fa5d176::function_c7a0b640c398497(tablename, classindex).secondaryweapon.attachment1;
    loadout["loadoutSecondaryAttachment2"] = namespace_d19129e4fa5d176::function_c7a0b640c398497(tablename, classindex).secondaryweapon.attachment2;
    loadout["loadoutSecondaryAttachment3"] = namespace_d19129e4fa5d176::function_c7a0b640c398497(tablename, classindex).secondaryweapon.attachment3;
    loadout["loadoutSecondaryAttachment4"] = namespace_d19129e4fa5d176::function_c7a0b640c398497(tablename, classindex).secondaryweapon.attachment4;
    loadout["loadoutSecondaryAttachment5"] = namespace_d19129e4fa5d176::function_c7a0b640c398497(tablename, classindex).secondaryweapon.attachment5;
    loadout["loadoutSecondaryCamo"] = namespace_d19129e4fa5d176::function_c7a0b640c398497(tablename, classindex).secondaryweapon.camo;
    loadout["loadoutSecondaryReticle"] = namespace_d19129e4fa5d176::function_c7a0b640c398497(tablename, classindex).secondaryweapon.reticle;
    loadout["loadoutMeleeSlot"] = "none";
    loadout["loadoutEquipmentPrimary"] = namespace_d19129e4fa5d176::function_c7a0b640c398497(tablename, classindex).equipment.primary;
    loadout["loadoutEquipmentSecondary"] = namespace_d19129e4fa5d176::function_c7a0b640c398497(tablename, classindex).equipment.secondary;
    loadout["loadoutStreakType"] = "assault";
    loadout["loadoutKillstreak1"] = "none";
    loadout["loadoutKillstreak2"] = "none";
    loadout["loadoutKillstreak3"] = "none";
    loadout["loadoutSuper"] = "super_br_extract";
    loadout["loadoutPerks"] = [0:namespace_d19129e4fa5d176::function_c7a0b640c398497(tablename, classindex).perks.perk1, 1:namespace_d19129e4fa5d176::function_c7a0b640c398497(tablename, classindex).perks.perk2, 2:namespace_d19129e4fa5d176::function_c7a0b640c398497(tablename, classindex).perks.perk3, 3:namespace_d19129e4fa5d176::function_c7a0b640c398497(tablename, classindex).extraperks.perk1, 4:namespace_d19129e4fa5d176::function_c7a0b640c398497(tablename, classindex).extraperks.perk2, 5:namespace_d19129e4fa5d176::function_c7a0b640c398497(tablename, classindex).extraperks.perk3];
    loadout["loadoutGesture"] = "playerData";
    loadout["loadoutFieldUpgrade1"] = "none";
    loadout["loadoutFieldUpgrade2"] = "none";
    loadout["tableColumn"] = classindex;
    return loadout;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d0e
// Size: 0x11a
function givestandardtableloadout(classindex, var_2fefed9bb7ea82d8, var_c179e44bd14d2d12) {
    if (!isdefined(level.br_standard_loadout)) {
        level.br_standard_loadout = initstandardloadout("classtable:classtable_br", classindex);
        /#
            assert(isdefined(level.br_standard_loadout));
        #/
    }
    self.pers["gamemodeLoadout"] = level.br_standard_loadout;
    self.class = "gamemode";
    self.prevweaponobj = undefined;
    struct = namespace_d19129e4fa5d176::loadout_getclassstruct();
    struct = namespace_d19129e4fa5d176::loadout_updateclass(struct, "gamemode");
    namespace_d19129e4fa5d176::preloadandqueueclassstruct(struct, 1, 1);
    self takeallweapons();
    namespace_d19129e4fa5d176::giveloadout(self.team, "gamemode", var_2fefed9bb7ea82d8, var_2fefed9bb7ea82d8);
    self givestartammo(struct.loadoutprimaryobject);
    self givestartammo(struct.loadoutsecondaryobject);
    namespace_d20f8ef223912e12::givelaststandifneeded(self);
    namespace_3bcd40a3005712ec::br_ammo_player_clear();
    if (!istrue(var_c179e44bd14d2d12)) {
        namespace_3bcd40a3005712ec::br_give_starting_ammo();
    }
    namespace_3bcd40a3005712ec::br_ammo_update_weapons(self);
    self notify("ammo_update");
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e2f
// Size: 0x174
function nakeddrophandleloadout() {
    if (function_31651d3fd72991aa()) {
        var_33d4cdf6cb6338fd = namespace_8bfdb6eb5a3df67a::function_eee8abc18302f5ef();
        level.br_standard_loadout = var_33d4cdf6cb6338fd[0];
        var_c179e44bd14d2d12 = var_33d4cdf6cb6338fd[1];
        givestandardtableloadout(0, 1, var_c179e44bd14d2d12);
    } else if (brdoesloadoutoptiongivestandardloadoutimmediately()) {
        var_2fefed9bb7ea82d8 = 0;
        if (istrue(self.hasspawnweapons)) {
            return;
        }
        var_cf45f8ef8ed86b4c = isdefined(self.hasspawnweapons) && !self.hasspawnweapons;
        if (var_cf45f8ef8ed86b4c) {
            var_2fefed9bb7ea82d8 = 1;
        }
        loadoutindex = brgetloadoutoptionstandardloadoutindex();
        givestandardtableloadout(loadoutindex, var_2fefed9bb7ea82d8);
        if (namespace_36f464722d326bbe::isBRStyleGameType() && !istrue(level.var_595938569c3fe806) && getdvarint(@"hash_1ca10ca828658cf7", 1) == 1) {
            var_dc6bf94dbaaa7056 = getmatchrulesdata("commonOption", "infilArmor");
            infilReservePlates = getmatchrulesdata("commonOption", "infilReservePlates");
            namespace_f8d3520d3483c1::givestartingarmor(var_dc6bf94dbaaa7056, undefined, infilReservePlates);
        }
        if (var_cf45f8ef8ed86b4c) {
            self.hasspawnweapons = 1;
        }
    } else if (brdoesloadoutoptionusedropbags()) {
        givematchloadoutfordropbags();
    } else if (brdoesloadoutoptiongivecustomweaponsimmediately()) {
        var_94c2510160259cc5 = brgetloadoutammomultiplier();
        ammomax = brgetloadoutammomax();
        givematchloadout(var_94c2510160259cc5, ammomax);
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5faa
// Size: 0x31
function isInstancedSpace() {
    if (!isdefined(level.var_5954867ad88105fa)) {
        level.var_5954867ad88105fa = getdvarint(@"hash_741256d4a75b3e28", 0);
    }
    return level.var_5954867ad88105fa;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5fe3
// Size: 0x108
function nakeddrop() {
    if (namespace_71073fa38f11492::isbrgametypefuncdefined("playerDropBonuses")) {
        namespace_71073fa38f11492::runbrgametypefunc("playerDropBonuses");
    }
    var_e97c69489cc1637a = namespace_47fd1e79a44628cd::gulagwinnerrestoreloadout();
    if (!var_e97c69489cc1637a && istrue(level.br_prematchstarted) && !istrue(self.gulag)) {
        if (getdvarint(@"hash_4799897b190d65", 1)) {
            if (issharedfuncdefined("backpack", "isBackpackInventoryEnabled") && [[ getsharedfunc("backpack", "isBackpackInventoryEnabled") ]]()) {
                for (var_a6f8d8115e0f1e79 = 0; var_a6f8d8115e0f1e79 < namespace_aead94004cf4c147::function_b13e35608b336d65(self); var_a6f8d8115e0f1e79++) {
                    namespace_aead94004cf4c147::function_db1dd76061352e5b(var_a6f8d8115e0f1e79);
                }
            }
        }
        if (namespace_71073fa38f11492::isbrgametypefuncdefined("playerNakedDropLoadout")) {
            namespace_71073fa38f11492::runbrgametypefunc("playerNakedDropLoadout");
        } else {
            nakeddrophandleloadout();
        }
    }
    if (namespace_aead94004cf4c147::isBackpackInventoryEnabled() && getdvarint(@"hash_68a323d5bd07266c", 0) == 1) {
        namespace_aead94004cf4c147::function_c2f16e2bbb4e38c0("brloot_nvg");
    }
    thread br_displayperkinfo();
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60f2
// Size: 0x19c
function loadoutdrop() {
    if (namespace_71073fa38f11492::isbrgametypefuncdefined("playerDropBonuses")) {
        namespace_71073fa38f11492::runbrgametypefunc("playerDropBonuses");
    }
    if (istrue(self.isredeploykeepweapons)) {
        self.isredeploykeepweapons = undefined;
        return;
    }
    class = self.class;
    if (istrue(self.initiallandingcomplete) && !istrue(level.giveloadouteverytime)) {
        self.pers["gamemodeLoadout"] = level.br_respawn_loadout;
        class = "gamemode";
    }
    struct = namespace_d19129e4fa5d176::preloadandqueueclass(class, 1);
    thread namespace_d19129e4fa5d176::swaploadout();
    if (class != "gamemode") {
        _takeweapon("iw9_me_fists_mp");
    }
    self.tokenrespawned = 0;
    if (!istrue(self.prematchintiallandingcomplete)) {
        if (istrue(level.giveloadouteverytime)) {
            brgivestartfieldupgrade();
        }
    }
    self.prematchintiallandingcomplete = 1;
    if (!istrue(self.initiallandingcomplete)) {
        if (istrue(level.br_prematchstarted)) {
            if (istrue(level.giveloadouteverytime)) {
                brgivestartfieldupgrade();
            }
            self.initiallandingcomplete = 1;
        }
    }
    if (namespace_36f464722d326bbe::isBRStyleGameType() && getsubgametype() != "dmz" && getdvarint(@"hash_1ca10ca828658cf7", 1) == 1) {
        var_968bd61837a9c038 = getdvarint(@"hash_3c87ccc2c15b53a4", 100);
        var_381776cae951da48 = getdvarint(@"hash_8b8e8245086efdd1", 0);
        namespace_f8d3520d3483c1::givestartingarmor(var_968bd61837a9c038, undefined, var_381776cae951da48);
    }
    thread br_displayperkinfo();
}

// Namespace br/namespace_d20f8ef223912e12
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6295
// Size: 0x275
function function_5357c1261661e9e4(var_12bff32d91032009, player, var_84d0c3e36addfa4, var_191ebd2dd0d5f975) {
    var_1f0f661b1f135896 = -2400;
    contents = namespace_2a184fc4902783dc::create_contents(0, 1, 1, 1, 0, 1, 1);
    var_741196a281686ee = namespace_2a184fc4902783dc::function_b88b8bd51ea7fe24();
    contents = contents & ~var_741196a281686ee;
    var_8d213e19bb3a154a = 70;
    var_7ab60aa67d45982f = player.origin - var_12bff32d91032009.origin;
    var_4d339274da6847d6 = (var_7ab60aa67d45982f[0], var_7ab60aa67d45982f[1], 0);
    var_80385098e14f48c8 = 0;
    if (length2d(var_4d339274da6847d6) > 0.001) {
        var_ec0a3044d861d58e = vectornormalize(var_4d339274da6847d6);
        var_cd09032c027520d1 = vectortoangles(var_ec0a3044d861d58e);
        var_80385098e14f48c8 = angleclamp180(var_cd09032c027520d1[1]);
    }
    var_8c4038f0270de13e = var_12bff32d91032009.origin;
    traceoffset = (cos(var_80385098e14f48c8), sin(var_80385098e14f48c8), 0);
    traceoffset = vectornormalize(traceoffset);
    traceoffset = traceoffset * var_8d213e19bb3a154a;
    result = namespace_d3d40f75bb4e4c32::raytraceoffset(var_8c4038f0270de13e, traceoffset[0], traceoffset[1], var_84d0c3e36addfa4, var_191ebd2dd0d5f975, contents, var_12bff32d91032009);
    if (result["fraction"] < 1) {
        var_9077c073def296aa = result["position"] + (0, 0, 0.001);
        var_d228f1f35b586e32 = var_8c4038f0270de13e + (0, 0, 30);
        var_c4afec3695912ed3 = namespace_2a184fc4902783dc::ray_trace(var_d228f1f35b586e32, var_9077c073def296aa, var_12bff32d91032009, contents);
        if (var_c4afec3695912ed3["fraction"] >= 1) {
            player setorigin(var_9077c073def296aa);
            return;
        }
    LOC_000001f1:
    }
LOC_000001f1:
    result = namespace_d3d40f75bb4e4c32::raytraceoffset(var_8c4038f0270de13e, 0, 0, var_84d0c3e36addfa4, var_191ebd2dd0d5f975, contents);
    if (result["fraction"] < 1) {
        var_74bb7b7c25a2f978 = result["position"] + (0, 0, 0.2);
        var_cf47c99b295d9d6b = result["position"] + (0, 0, 1);
        var_1b37fc247c529ee3 = playerphysicstrace(var_74bb7b7c25a2f978, var_cf47c99b295d9d6b);
        if (var_1b37fc247c529ee3 == var_cf47c99b295d9d6b) {
            player setorigin(result["position"]);
            return;
        }
    }
    player kill(var_12bff32d91032009.origin);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6511
// Size: 0x53
function brgivestartfieldupgrade() {
    if (level.var_47207b7b330cf8e0) {
        return;
    }
    if (istrue(level.allowsupers)) {
        super = namespace_85d036cb78063c4a::getcurrentsuper();
        if (isdefined(super)) {
            namespace_85d036cb78063c4a::givesuperpoints(namespace_85d036cb78063c4a::getsuperpointsneeded());
        }
    } else {
        namespace_cb965d2f71fefddc::forcegivesuper(self.loadoutbrfieldupgrade);
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x656b
// Size: 0x7a
function brplayerhudoutlineforteammatessafe(player, otherplayer) {
    if (!isdefined(player)) {
        return 0;
    }
    if (!isalive(player)) {
        return 0;
    }
    if (istrue(player.gulag)) {
        return 0;
    }
    if (!isdefined(player.team)) {
        return 0;
    }
    if (isdefined(otherplayer) && otherplayer.team != player.team) {
        return 0;
    }
    if (isdefined(otherplayer) && otherplayer == player) {
        return 0;
    }
    return 1;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x65ed
// Size: 0x1e6
function brplayerhudoutlineforteammatesupdate(player) {
    if (!isdefined(player) || !isdefined(player.var_3f78c6a0862f9e25) || !isdefined(player.teammateoutlineids)) {
        return;
    }
    /#
        assert(issharedfuncdefined("game", "getFriendlyPlayers"));
    #/
    var_96674628376eaba6 = [[ getsharedfunc("game", "getFriendlyPlayers") ]](player.team, 1);
    assetname = "outline_nodepth_brplayer" + player.var_3f78c6a0862f9e25 + 1;
    distmax = getdvarint(@"hash_4530f1e48da9e83a", 1024);
    var_671bcaffb2f4070a = squared(distmax);
    var_cb981010db503fe6 = brplayerhudoutlineforteammatessafe(player);
    foreach (teammate in var_96674628376eaba6) {
        entnum = teammate getentitynumber();
        var_29f49a35acc51689 = var_cb981010db503fe6 && brplayerhudoutlineforteammatessafe(teammate, player);
        if (var_29f49a35acc51689) {
            dist = distancesquared(player.origin, teammate.origin);
            if (dist > var_671bcaffb2f4070a) {
                var_29f49a35acc51689 = 0;
            }
        }
        if (!var_29f49a35acc51689) {
            if (isdefined(player.teammateoutlineids[entnum])) {
                namespace_cbd3754a0c69cc63::outlinedisable(player.teammateoutlineids[entnum], player);
                player.teammateoutlineids[entnum] = undefined;
            }
        } else if (!isdefined(player.teammateoutlineids[entnum])) {
            player.teammateoutlineids[entnum] = namespace_cbd3754a0c69cc63::outlineenableforplayer(player, teammate, assetname, "level_script");
        }
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67da
// Size: 0x2b
function brplayerhudoutlineupdatefromnotify(player) {
    player endon("disconnect");
    while (1) {
        level waittill("update_circle_hide");
        brplayerhudoutlineforteammatesupdate(player);
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x680c
// Size: 0x62
function brplayerhudoutlineforteammates(player) {
    player endon("disconnect");
    if (!isdefined(player.var_3f78c6a0862f9e25)) {
        return;
    }
    if (!istrue(level.br_infils_disabled)) {
        player waittill("infil_jump_done");
    }
    player.teammateoutlineids = [];
    player thread brplayerhudoutlineupdatefromnotify(player);
    while (1) {
        brplayerhudoutlineforteammatesupdate(player);
        wait(1);
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6875
// Size: 0x18
function initializetweakableoverrides() {
    if (!isdefined(level.tweakablesinitialized)) {
        thread namespace_775507ba36294dfb::init();
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6894
// Size: 0x1b2
function initializematchrules() {
    /#
        assert(isusingmatchrulesdata());
    #/
    setcommonrulesfrommatchrulesdata();
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_brLoadouts"), getmatchrulesdata("brData", "brLoadouts"));
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_crateDropTimer"), getmatchrulesdata("brData", "crateDropTimer"));
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_infilC130"), getmatchrulesdata("brData", "infilC130"));
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_gulag"), getmatchrulesdata("brData", "gulag"));
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_circleDamageMultiplier"), getmatchrulesdata("brData", "circleDamageMultiplier"));
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_startingWeapon"), getmatchrulesdata("brData", "startingWeapon"));
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_roundlimit"), 1);
    registerroundlimitdvar("br", 1);
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_winlimit"), 1);
    registerwinlimitdvar("br", 1);
    setdynamicdvar(function_2ef675c13ca1c4af(@"hash_d98c82b5a26dc973", getgametype(), "_promode"), 0);
    registerlaststandinvulntimerdvar(0);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6a4d
// Size: 0xfa
function updategametypedvars() {
    namespace_310ba947928891df::updatecommongametypedvars();
    level.numendgame = dvarintvalue("numEndGame", 4, 0, 20);
    level.brloadouts = dvarintvalue("brLoadouts", 0, 0, 5);
    level.cratedroptimer = dvarintvalue("crateDropTimer", 60, 0, 300);
    level.goalenabletimer = dvarfloatvalue("goalEnableTimer", 60, 0, 300);
    level.goalmovetimer = dvarfloatvalue("goalMoveTimer", 0, 0, 300);
    level.radarendgame = dvarfloatvalue("radarEndGame", 1, 0, 1);
    level.usegulag = dvarintvalue("gulag", 1, 0, 1);
    level.circledamagemultiplier = dvarfloatvalue("circleDamageMultiplier", 1, 0.5, 4);
    level.startingweapon = dvarintvalue("startingWeapon", 0, 0, 8);
    level.timetoadd = 30;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b4e
// Size: 0xae
function pickclassbr() {
    class = "";
    if (!istrue(level.br_prematchstarted) && istrue(level.br_prematchffa) && getdvarint(@"hash_25ad2925d6075c8f", 0) == 0) {
        class = pickprematchrandomloadout();
    } else {
        var_2b838d5ca576ae83 = level.br_loadouts["default"];
        if (namespace_71073fa38f11492::isbrgametypefuncdefined("getDefaultLoadout")) {
            var_2b838d5ca576ae83 = namespace_71073fa38f11492::runbrgametypefunc("getDefaultLoadout");
        }
        self.pers["gamemodeLoadout"] = var_2b838d5ca576ae83;
        class = "gamemode";
    }
    self.pers["class"] = class;
    return class;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c04
// Size: 0x138
function function_20f91635cfffbdcf() {
    wait(5);
    iprintln("Loadout verification starting in 10 seconds.");
    wait(5);
    iprintln("5 seconds to start.");
    wait(5);
    iprintln("Verification start!");
    for (var_465df4a45cdb81bf = 0; var_465df4a45cdb81bf < level.var_3dc5c06b446489; var_465df4a45cdb81bf++) {
        iprintln("Loadout: " + var_465df4a45cdb81bf);
        self.pers["gamemodeLoadout"] = level.prematchloadouts[level.prematchrandomloadout[var_465df4a45cdb81bf]];
        self.class = "gamemode";
        preloadandqueueclass(self.pers["class"]);
        namespace_d19129e4fa5d176::swaploadout();
        br_ammo_player_max_out();
        wait(5);
        _switchtoweapon(self.secondaryweapon);
        wait(4);
    }
    self.pers["gamemodeLoadout"] = level.prematchloadouts[level.prematchrandomloadout[0]];
    self.class = "gamemode";
    preloadandqueueclass(self.pers["class"]);
    namespace_d19129e4fa5d176::swaploadout();
    br_ammo_player_max_out();
    iprintln("Verification done!");
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d43
// Size: 0x45
function function_788f7c22fa09824() {
    if (self isplayerheadless()) {
        if (self.pers["gamemodeLoadout"]["loadoutEquipmentPrimary"] == "equip_molotov") {
            self.pers["gamemodeLoadout"]["loadoutEquipmentPrimary"] = "equip_frag";
        }
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6d8f
// Size: 0x1a2
function pickprematchrandomloadout() {
    class = "";
    if (getdvarint(@"hash_c7eeced4234b1158", 1)) {
        if (!isdefined(level.prematchrandomloadout)) {
            level.prematchrandomloadout = [];
            for (index = 0; index < level.var_3dc5c06b446489; index++) {
                level.prematchrandomloadout[level.prematchrandomloadout.size] = index;
            }
            if (getdvar(@"hash_fc5f34b202c7515e") == "" && getdvarint(@"hash_8fd5e2fbd99396a4", 0) == 0) {
                level.prematchrandomloadout = array_randomize(level.prematchrandomloadout);
            }
            self.prematchloadoutindex = level.var_3dc5c06b446489 - 2;
        }
        if (!isdefined(self.prematchloadoutindex) || self.prematchloadoutindex < 0 || self.prematchloadoutindex >= level.var_3dc5c06b446489 - 1) {
            self.prematchloadoutindex = 0;
        } else {
            self.prematchloadoutindex++;
        }
        /#
            assertex(level.prematchloadouts[level.prematchrandomloadout[self.prematchloadoutindex]]["loadoutPrimary"] != "", "Pregame loadout missing primary! Check dvar: scr_br_prematch_loadout_override");
        #/
        self.pers["gamemodeLoadout"] = level.prematchloadouts[level.prematchrandomloadout[self.prematchloadoutindex]];
        class = "gamemode";
        function_788f7c22fa09824();
    } else {
        class = "default" + randomint(10) + 1;
    }
    return class;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f39
// Size: 0x104
function prematchinitblueprintloadouts() {
    level endon("game_ended");
    while (!isdefined(level.weaponlootmapdata)) {
        waitframe();
    }
    level.prematchloadouts = [];
    var_3dc1e231ad1d8fd2 = [];
    var_3dc1e231ad1d8fd2["classIdxPrimaryArray"] = [];
    var_3dc1e231ad1d8fd2["classIdxSecondaryArray"] = [];
    table = "classtable:classtable_br_prematch_bp";
    /#
        var_d6f262bbec7b0caa = getdvarint(@"hash_a1967148d48b7992", -1);
        if (var_d6f262bbec7b0caa >= 0) {
            level.prematchloadouts[level.prematchloadouts.size] = updateprematchloadoutarray(table, var_d6f262bbec7b0caa, var_d6f262bbec7b0caa);
            return;
        }
    #/
    var_3dc1e231ad1d8fd2 = buildloadoutindices(var_3dc1e231ad1d8fd2);
    for (var_fa1ae55f729ddc96 = 0; var_fa1ae55f729ddc96 < var_3dc1e231ad1d8fd2["classIdxPrimaryArray"].size; var_fa1ae55f729ddc96++) {
        var_f0ec1d955c38855b = var_3dc1e231ad1d8fd2["classIdxPrimaryArray"][var_fa1ae55f729ddc96];
        var_6fbc31e9f6cbe69b = var_3dc1e231ad1d8fd2["classIdxSecondaryArray"][var_fa1ae55f729ddc96];
        level.prematchloadouts[level.prematchloadouts.size] = updateprematchloadoutarray(table, var_f0ec1d955c38855b, var_6fbc31e9f6cbe69b);
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7044
// Size: 0x1ce
function buildloadoutindices(var_3dc1e231ad1d8fd2) {
    var_7c8feb9da40f13a2 = 0;
    var_7a97ce49e361e991 = 2;
    var_399cea81ad587e4d = 2;
    var_154c735b7d5ac474 = 1;
    var_a4f11b0b6adffaff = 1;
    var_6a1d197e7f97f97c = 2;
    var_b93db625cd6f699 = 2;
    var_b125376fe94819e1 = [0:var_7a97ce49e361e991, 1:var_399cea81ad587e4d, 2:var_154c735b7d5ac474, 3:var_a4f11b0b6adffaff, 4:var_6a1d197e7f97f97c, 5:var_b93db625cd6f699];
    while (var_7c8feb9da40f13a2 < var_b125376fe94819e1.size) {
        var_f8134fcd629eb9dd = 0;
        retry = 0;
        var_9ea228bee6fc0ede = 5;
        while (var_f8134fcd629eb9dd < var_b125376fe94819e1[var_7c8feb9da40f13a2]) {
            var_8b0cadb1c3acc65c = giverandomloadoutindex(var_7c8feb9da40f13a2);
            if (!array_contains(var_3dc1e231ad1d8fd2["classIdxPrimaryArray"], var_8b0cadb1c3acc65c) || retry >= var_9ea228bee6fc0ede) {
                var_f8134fcd629eb9dd++;
                retry = 0;
                var_3dc1e231ad1d8fd2["classIdxPrimaryArray"][var_3dc1e231ad1d8fd2["classIdxPrimaryArray"].size] = var_8b0cadb1c3acc65c;
            } else {
                retry++;
            }
        }
        var_7c8feb9da40f13a2++;
    }
    var_6ae6a640c4c9252b = 0;
    for (var_8f3618cf7570d373 = 0; var_8f3618cf7570d373 < var_3dc1e231ad1d8fd2["classIdxPrimaryArray"].size; var_8f3618cf7570d373++) {
        if (var_6ae6a640c4c9252b < 3) {
            if (randomint(4) == 1) {
                var_fc4aae5cba71022c = giverandomloadoutindex(6);
            } else {
                var_fc4aae5cba71022c = giverandomloadoutindex(5);
            }
            var_6ae6a640c4c9252b++;
        } else {
            var_fc4aae5cba71022c = giverandomloadoutindex(7);
        }
        var_3dc1e231ad1d8fd2["classIdxSecondaryArray"][var_3dc1e231ad1d8fd2["classIdxSecondaryArray"].size] = var_fc4aae5cba71022c;
    }
    var_3dc1e231ad1d8fd2["classIdxPrimaryArray"] = array_randomize(var_3dc1e231ad1d8fd2["classIdxPrimaryArray"]);
    var_3dc1e231ad1d8fd2["classIdxSecondaryArray"] = array_randomize(var_3dc1e231ad1d8fd2["classIdxSecondaryArray"]);
    return var_3dc1e231ad1d8fd2;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x721a
// Size: 0x113
function giverandomloadoutindex(index) {
    var_e98acf9fa9d0767d = 0;
    switch (index) {
    case 0:
        var_e98acf9fa9d0767d = 0 + randomint(10);
        break;
    case 1:
        var_e98acf9fa9d0767d = 10 + randomint(7);
        break;
    case 2:
        var_e98acf9fa9d0767d = 23 + randomint(5);
        break;
    case 3:
        var_e98acf9fa9d0767d = 28 + randomint(8);
        break;
    case 4:
        var_e98acf9fa9d0767d = 36 + randomint(6);
        break;
    case 5:
        var_e98acf9fa9d0767d = randomint(42);
        break;
    case 6:
        var_e98acf9fa9d0767d = 42 + randomint(3);
        break;
    case 7:
        var_e98acf9fa9d0767d = 17 + randomint(6);
        break;
    default:
        /#
            assertmsg("Loadout Index Not Supported");
        #/
        break;
    }
    return var_e98acf9fa9d0767d;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7335
// Size: 0x405
function updateprematchloadoutarray(table, var_f0ec1d955c38855b, var_6fbc31e9f6cbe69b) {
    if (var_f0ec1d955c38855b == var_6fbc31e9f6cbe69b) {
        if (var_6fbc31e9f6cbe69b > 0) {
            var_6fbc31e9f6cbe69b--;
        } else {
            var_6fbc31e9f6cbe69b = 1;
        }
    }
    var_e698df1ec0933ce4 = [];
    var_e698df1ec0933ce4["loadoutArchetype"] = "archetype_assault";
    var_e698df1ec0933ce4["loadoutPrimaryAttachment"] = "none";
    var_e698df1ec0933ce4["loadoutPrimaryAttachment2"] = "none";
    var_e698df1ec0933ce4["loadoutPrimaryAttachment3"] = "none";
    var_e698df1ec0933ce4["loadoutPrimaryAttachment4"] = "none";
    var_e698df1ec0933ce4["loadoutPrimaryAttachment5"] = "none";
    var_e698df1ec0933ce4["loadoutPrimaryCosmeticAttachment"] = "none";
    var_e698df1ec0933ce4["loadoutPrimarySticker"] = "none";
    var_e698df1ec0933ce4["loadoutPrimarySticker1"] = "none";
    var_e698df1ec0933ce4["loadoutPrimarySticker2"] = "none";
    var_e698df1ec0933ce4["loadoutPrimarySticker3"] = "none";
    var_e698df1ec0933ce4["loadoutSecondary"] = "none";
    var_e698df1ec0933ce4["loadoutSecondaryAttachment"] = "none";
    var_e698df1ec0933ce4["loadoutSecondaryAttachment2"] = "none";
    var_e698df1ec0933ce4["loadoutSecondaryAttachment3"] = "none";
    var_e698df1ec0933ce4["loadoutSecondaryAttachment4"] = "none";
    var_e698df1ec0933ce4["loadoutSecondaryAttachment5"] = "none";
    var_e698df1ec0933ce4["loadoutSecondarySticker"] = "none";
    var_e698df1ec0933ce4["loadoutSecondarySticker1"] = "none";
    var_e698df1ec0933ce4["loadoutSecondarySticker2"] = "none";
    var_e698df1ec0933ce4["loadoutSecondarySticker3"] = "none";
    var_e698df1ec0933ce4["loadoutSecondarySticker4"] = "none";
    var_e698df1ec0933ce4["loadoutMeleeSlot"] = "none";
    var_e698df1ec0933ce4["loadoutStreakType"] = "assault";
    var_e698df1ec0933ce4["loadoutKillstreak1"] = "none";
    var_e698df1ec0933ce4["loadoutKillstreak2"] = "none";
    var_e698df1ec0933ce4["loadoutKillstreak3"] = "none";
    var_e698df1ec0933ce4["loadoutSuper"] = "none";
    var_e698df1ec0933ce4["loadoutFieldUpgrade1"] = "none";
    var_e698df1ec0933ce4["loadoutFieldUpgrade2"] = "none";
    var_e698df1ec0933ce4["tableColumn"] = var_f0ec1d955c38855b;
    var_e698df1ec0933ce4["loadoutPrimaryAddBlueprintAttachments"] = namespace_d19129e4fa5d176::table_getaddblueprintattachments(table, var_f0ec1d955c38855b, 0);
    var_e698df1ec0933ce4["loadoutPrimary"] = namespace_d19129e4fa5d176::table_getweapon(table, var_f0ec1d955c38855b, 0);
    for (attachmentindex = 0; attachmentindex < namespace_d19129e4fa5d176::getmaxprimaryattachments(); attachmentindex++) {
        var_efbdcd88107af5f9 = namespace_d19129e4fa5d176::getattachmentloadoutstring(attachmentindex, #"primary");
        var_e698df1ec0933ce4[var_efbdcd88107af5f9] = namespace_d19129e4fa5d176::table_getweaponattachment(table, var_f0ec1d955c38855b, 0, attachmentindex);
    }
    var_e698df1ec0933ce4["loadoutPrimaryCamo"] = namespace_d19129e4fa5d176::table_getweaponcamo(table, var_f0ec1d955c38855b, 0);
    var_e698df1ec0933ce4["loadoutPrimaryReticle"] = namespace_d19129e4fa5d176::table_getweaponreticle(table, var_f0ec1d955c38855b, 0);
    var_e698df1ec0933ce4["loadoutPrimaryVariantID"] = namespace_d19129e4fa5d176::table_getweaponvariantid(table, var_f0ec1d955c38855b, 0, var_e698df1ec0933ce4["loadoutPrimary"]);
    var_e698df1ec0933ce4["loadoutSecondaryAddBlueprintAttachments"] = namespace_d19129e4fa5d176::table_getaddblueprintattachments(table, var_6fbc31e9f6cbe69b, 0);
    var_e698df1ec0933ce4["loadoutSecondary"] = namespace_d19129e4fa5d176::table_getweapon(table, var_6fbc31e9f6cbe69b, 0);
    for (attachmentindex = 0; attachmentindex < namespace_d19129e4fa5d176::getmaxsecondaryattachments(); attachmentindex++) {
        var_efbdcd88107af5f9 = namespace_d19129e4fa5d176::getattachmentloadoutstring(attachmentindex, #"secondary");
        var_e698df1ec0933ce4[var_efbdcd88107af5f9] = namespace_d19129e4fa5d176::table_getweaponattachment(table, var_6fbc31e9f6cbe69b, 0, attachmentindex);
    }
    var_e698df1ec0933ce4["loadoutSecondaryCamo"] = namespace_d19129e4fa5d176::table_getweaponcamo(table, var_6fbc31e9f6cbe69b, 0);
    var_e698df1ec0933ce4["loadoutSecondaryReticle"] = namespace_d19129e4fa5d176::table_getweaponreticle(table, var_6fbc31e9f6cbe69b, 0);
    var_e698df1ec0933ce4["loadoutSecondaryVariantID"] = namespace_d19129e4fa5d176::table_getweaponvariantid(table, var_6fbc31e9f6cbe69b, 0, var_e698df1ec0933ce4["loadoutSecondary"]);
    var_e698df1ec0933ce4["loadoutEquipmentPrimary"] = getrandomprematchequipment("lethal");
    if (cointoss()) {
        var_e698df1ec0933ce4["loadoutExtraEquipmentPrimary"] = "TRUE";
    } else {
        var_e698df1ec0933ce4["loadoutExtraEquipmentPrimary"] = "FALSE";
    }
    var_e698df1ec0933ce4["loadoutEquipmentSecondary"] = getrandomprematchequipment("tactical");
    if (var_e698df1ec0933ce4["loadoutEquipmentSecondary"] != "equip_smoke" && cointoss()) {
        var_e698df1ec0933ce4["loadoutExtraEquipmentSecondary"] = "TRUE";
    } else {
        var_e698df1ec0933ce4["loadoutExtraEquipmentSecondary"] = "FALSE";
    }
    var_e698df1ec0933ce4["loadoutPerks"] = [];
    for (i = 0; i < 3; i++) {
        perk = namespace_d19129e4fa5d176::table_getperk(table, var_f0ec1d955c38855b, i);
        if (perk != "specialty_null") {
            var_e698df1ec0933ce4["loadoutPerks"][var_e698df1ec0933ce4["loadoutPerks"].size] = perk;
        }
    }
    var_e698df1ec0933ce4["loadoutGesture"] = "playerData";
    var_e698df1ec0933ce4["loadoutExecution"] = "playerData";
    return var_e698df1ec0933ce4;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7742
// Size: 0x39c
function updatex1prematchloadoutarray(table, var_901e4a7f9eb06eb6) {
    var_e698df1ec0933ce4 = [];
    var_e698df1ec0933ce4["loadoutArchetype"] = "archetype_assault";
    var_e698df1ec0933ce4["loadoutPrimaryAttachment"] = "none";
    var_e698df1ec0933ce4["loadoutPrimaryAttachment2"] = "none";
    var_e698df1ec0933ce4["loadoutPrimaryAttachment3"] = "none";
    var_e698df1ec0933ce4["loadoutPrimaryAttachment4"] = "none";
    var_e698df1ec0933ce4["loadoutPrimaryAttachment5"] = "none";
    var_e698df1ec0933ce4["loadoutPrimaryCosmeticAttachment"] = "none";
    var_e698df1ec0933ce4["loadoutPrimarySticker"] = "none";
    var_e698df1ec0933ce4["loadoutPrimarySticker1"] = "none";
    var_e698df1ec0933ce4["loadoutPrimarySticker2"] = "none";
    var_e698df1ec0933ce4["loadoutPrimarySticker3"] = "none";
    var_e698df1ec0933ce4["loadoutSecondary"] = "none";
    var_e698df1ec0933ce4["loadoutSecondaryAttachment"] = "none";
    var_e698df1ec0933ce4["loadoutSecondaryAttachment2"] = "none";
    var_e698df1ec0933ce4["loadoutSecondaryAttachment3"] = "none";
    var_e698df1ec0933ce4["loadoutSecondaryAttachment4"] = "none";
    var_e698df1ec0933ce4["loadoutSecondaryAttachment5"] = "none";
    var_e698df1ec0933ce4["loadoutSecondarySticker"] = "none";
    var_e698df1ec0933ce4["loadoutSecondarySticker1"] = "none";
    var_e698df1ec0933ce4["loadoutSecondarySticker2"] = "none";
    var_e698df1ec0933ce4["loadoutSecondarySticker3"] = "none";
    var_e698df1ec0933ce4["loadoutSecondarySticker4"] = "none";
    var_e698df1ec0933ce4["loadoutMeleeSlot"] = "none";
    var_e698df1ec0933ce4["loadoutStreakType"] = "assault";
    var_e698df1ec0933ce4["loadoutKillstreak1"] = "none";
    var_e698df1ec0933ce4["loadoutKillstreak2"] = "none";
    var_e698df1ec0933ce4["loadoutKillstreak3"] = "none";
    var_e698df1ec0933ce4["loadoutSuper"] = "none";
    var_e698df1ec0933ce4["loadoutFieldUpgrade1"] = "none";
    var_e698df1ec0933ce4["loadoutFieldUpgrade2"] = "none";
    var_e698df1ec0933ce4["tableColumn"] = var_901e4a7f9eb06eb6;
    var_e698df1ec0933ce4["loadoutPrimaryAddBlueprintAttachments"] = namespace_d19129e4fa5d176::table_getaddblueprintattachments(table, var_901e4a7f9eb06eb6, 0);
    var_e698df1ec0933ce4["loadoutPrimary"] = namespace_d19129e4fa5d176::table_getweapon(table, var_901e4a7f9eb06eb6, 0);
    for (attachmentindex = 0; attachmentindex < namespace_d19129e4fa5d176::getmaxprimaryattachments(); attachmentindex++) {
        var_efbdcd88107af5f9 = namespace_d19129e4fa5d176::getattachmentloadoutstring(attachmentindex, #"primary");
        var_e698df1ec0933ce4[var_efbdcd88107af5f9] = namespace_d19129e4fa5d176::table_getweaponattachment(table, var_901e4a7f9eb06eb6, 0, attachmentindex);
    }
    var_e698df1ec0933ce4["loadoutPrimaryCamo"] = namespace_d19129e4fa5d176::table_getweaponcamo(table, var_901e4a7f9eb06eb6, 0);
    var_e698df1ec0933ce4["loadoutPrimaryReticle"] = namespace_d19129e4fa5d176::table_getweaponreticle(table, var_901e4a7f9eb06eb6, 0);
    var_e698df1ec0933ce4["loadoutPrimaryVariantID"] = namespace_d19129e4fa5d176::table_getweaponvariantid(table, var_901e4a7f9eb06eb6, 0, var_e698df1ec0933ce4["loadoutPrimary"]);
    var_e698df1ec0933ce4["loadoutSecondaryAddBlueprintAttachments"] = namespace_d19129e4fa5d176::table_getaddblueprintattachments(table, var_901e4a7f9eb06eb6, 1);
    var_e698df1ec0933ce4["loadoutSecondary"] = namespace_d19129e4fa5d176::table_getweapon(table, var_901e4a7f9eb06eb6, 1);
    for (attachmentindex = 0; attachmentindex < namespace_d19129e4fa5d176::getmaxsecondaryattachments(); attachmentindex++) {
        var_efbdcd88107af5f9 = namespace_d19129e4fa5d176::getattachmentloadoutstring(attachmentindex, #"secondary");
        var_e698df1ec0933ce4[var_efbdcd88107af5f9] = namespace_d19129e4fa5d176::table_getweaponattachment(table, var_901e4a7f9eb06eb6, 1, attachmentindex);
    }
    var_e698df1ec0933ce4["loadoutSecondaryCamo"] = namespace_d19129e4fa5d176::table_getweaponcamo(table, var_901e4a7f9eb06eb6, 1);
    var_e698df1ec0933ce4["loadoutSecondaryReticle"] = namespace_d19129e4fa5d176::table_getweaponreticle(table, var_901e4a7f9eb06eb6, 1);
    var_e698df1ec0933ce4["loadoutSecondaryVariantID"] = int(tablelookup(table, 0, "loadoutSecondaryVariantID", var_901e4a7f9eb06eb6 + 1));
    var_e698df1ec0933ce4["loadoutEquipmentPrimary"] = tablelookup(table, 0, "loadoutEquipmentPrimary", var_901e4a7f9eb06eb6 + 1);
    if (cointoss()) {
        var_e698df1ec0933ce4["loadoutExtraEquipmentPrimary"] = "TRUE";
    } else {
        var_e698df1ec0933ce4["loadoutExtraEquipmentPrimary"] = "FALSE";
    }
    var_e698df1ec0933ce4["loadoutEquipmentSecondary"] = tablelookup(table, 0, "loadoutEquipmentSecondary", var_901e4a7f9eb06eb6 + 1);
    if (var_e698df1ec0933ce4["loadoutEquipmentSecondary"] != "equip_smoke" && cointoss()) {
        var_e698df1ec0933ce4["loadoutExtraEquipmentSecondary"] = "TRUE";
    } else {
        var_e698df1ec0933ce4["loadoutExtraEquipmentSecondary"] = "FALSE";
    }
    var_e698df1ec0933ce4["loadoutPerks"] = [];
    var_e698df1ec0933ce4["loadoutGesture"] = "playerData";
    var_e698df1ec0933ce4["loadoutExecution"] = "playerData";
    return var_e698df1ec0933ce4;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ae6
// Size: 0x104
function getrandomprematchequipment(slot) {
    var_98fa4b76d957b210 = [];
    /#
        assertex(isdefined(slot), "slot not defined to give random equipment");
    #/
    if (slot == "lethal") {
        var_98fa4b76d957b210 = [0:"equip_at_mine", 1:"equip_claymore", 2:"equip_c4", 3:"equip_frag", 4:"equip_molotov", 5:"equip_semtex", 6:"equip_thermite", 7:"equip_throwing_knife", 8:"equip_throwing_knife_fire", 9:"equip_throwing_knife_electric"];
    } else if (slot == "tactical") {
        var_98fa4b76d957b210 = [0:"equip_adrenaline", 1:"equip_concussion", 2:"equip_decoy", 3:"equip_flash", 4:"equip_gas_grenade", 5:"equip_smoke", 6:"equip_snapshot_grenade"];
    } else {
        /#
            assertmsg("Incorrect slot defined to give random equipment");
        #/
    }
    equipment = var_98fa4b76d957b210[randomint(var_98fa4b76d957b210.size)];
    return equipment;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7bf2
// Size: 0x1b9
function prematchinitloadouts(table) {
    var_7d958726e11b327 = namespace_d19129e4fa5d176::function_df2933f96d726d71(table);
    level.prematchloadouts = [];
    var_e5f44e7fdd29acdd = 0;
    if (getdvar(@"hash_fc5f34b202c7515e") != "") {
        var_d61ea355b2c5b7d5 = strtok(getdvar(@"hash_fc5f34b202c7515e"), " ");
        var_4d4aa257c98f2157 = [];
        for (var_2613246720524878 = 0; var_2613246720524878 < var_d61ea355b2c5b7d5.size; var_2613246720524878++) {
            var_4d4aa257c98f2157[var_4d4aa257c98f2157.size] = int(var_d61ea355b2c5b7d5[var_4d4aa257c98f2157.size]);
        }
        for (var_1ba75f00acfec3a6 = 0; var_1ba75f00acfec3a6 < var_4d4aa257c98f2157.size; var_1ba75f00acfec3a6++) {
            level.prematchloadouts[level.prematchloadouts.size] = initstandardloadout(table, var_4d4aa257c98f2157[var_1ba75f00acfec3a6]);
        }
        level.var_3dc5c06b446489 = var_4d4aa257c98f2157.size;
        return;
    } else if (getdvarint(@"hash_c7eeced4234b1158", 1)) {
        if (getdvarint(@"hash_8fd5e2fbd99396a4", 0) == 1 && getdvarint(@"hash_b1d09189d817146", -1) == -1) {
            var_e5f44e7fdd29acdd = 0;
            level.var_3dc5c06b446489 = var_7d958726e11b327;
        } else {
            var_e5f44e7fdd29acdd = int(randomint(var_7d958726e11b327 - 1) * 0.1) * 10;
            if (getdvarint(@"hash_b1d09189d817146", -1) != -1) {
                var_e5f44e7fdd29acdd = getdvarint(@"hash_b1d09189d817146", -1);
            }
            var_7d958726e11b327 = var_e5f44e7fdd29acdd + 10;
        }
    }
    for (classindex = var_e5f44e7fdd29acdd; classindex < var_7d958726e11b327; classindex++) {
        level.prematchloadouts[level.prematchloadouts.size] = initstandardloadout(table, classindex);
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7db2
// Size: 0x2e0
function defineplayerloadout() {
    level.br_loadouts["default"]["loadoutArchetype"] = "archetype_assault";
    level.br_loadouts["default"]["loadoutPrimary"] = "none";
    level.br_loadouts["default"]["loadoutPrimaryAttachment"] = "none";
    level.br_loadouts["default"]["loadoutPrimaryAttachment2"] = "none";
    level.br_loadouts["default"]["loadoutPrimaryCamo"] = "none";
    level.br_loadouts["default"]["loadoutPrimaryReticle"] = "none";
    level.br_loadouts["default"]["loadoutSecondary"] = "none";
    level.br_loadouts["default"]["loadoutSecondaryAttachment"] = "none";
    level.br_loadouts["default"]["loadoutSecondaryAttachment2"] = "none";
    level.br_loadouts["default"]["loadoutSecondaryCamo"] = "none";
    level.br_loadouts["default"]["loadoutSecondaryReticle"] = "none";
    level.br_loadouts["default"]["loadoutMeleeSlot"] = "iw9_me_fists_mp";
    level.br_loadouts["default"]["loadoutEquipmentPrimary"] = "none";
    level.br_loadouts["default"]["loadoutEquipmentSecondary"] = "none";
    level.br_loadouts["default"]["loadoutStreakType"] = "assault";
    level.br_loadouts["default"]["loadoutKillstreak1"] = "none";
    level.br_loadouts["default"]["loadoutKillstreak2"] = "none";
    level.br_loadouts["default"]["loadoutKillstreak3"] = "none";
    level.br_loadouts["default"]["loadoutSuper"] = "super_br_extract";
    level.br_loadouts["default"]["loadoutPerks"] = [0:"specialty_null"];
    level.br_loadouts["default"]["loadoutGesture"] = "playerData";
    level.br_loadouts["default"]["loadoutFieldUpgrade1"] = "none";
    level.br_loadouts["default"]["loadoutFieldUpgrade2"] = "none";
    level.br_loadouts["allies"] = level.br_loadouts["default"];
    level.br_loadouts["axis"] = level.br_loadouts["default"];
    level.br_respawn_loadout = level.br_loadouts["default"];
    level.br_respawn_loadout["loadoutSecondary"] = "jup_cp24_pi_glima21";
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8099
// Size: 0xed
function onprecachegametype() {
    level._effect["vfx_gas_ring_player"] = loadfx("vfx/iw8_cp/br_ring/vfx_gas_ring_player.vfx");
    level._effect["vfx_gas_ring_puffy"] = loadfx("vfx/iw8_cp/br_ring/vfx_gas_ring_puffy.vfx");
    level._effect["vfx_br_infil_cloud_scroll"] = loadfx("vfx/iw8_br/gameplay/infil/vfx_br_infil_cloud_scroll.vfx");
    level._effect["vfx_br_infil_jump_smoke_01"] = loadfx("vfx/iw8_br/gameplay/infil/vfx_br_infil_jump_smoke_01.vfx");
    level._effect["vfx_br_infil_jump_wisp_01"] = loadfx("vfx/iw8_br/gameplay/infil/vfx_br_infil_jump_wisp_01.vfx");
    level._effect["vfx_br_infil_jump_wisp_02"] = loadfx("vfx/iw8_br/gameplay/infil/vfx_br_infil_jump_wisp_02.vfx");
    level._effect["vfx_gas_mask_break"] = loadfx("vfx/iw8_br/gameplay/vfx_br_gasmask_dest.vfx");
    level._effect["vfx_gameplay_tier2_helmet_pop"] = loadfx("vfx/iw9/gameplay/mp/vfx_gameplay_tier2_helmet_pop.vfx");
    level._effect["vfx_gameplay_tier3_helmet_pop"] = loadfx("vfx/iw9/gameplay/mp/vfx_gameplay_tier3_helmet_pop.vfx");
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x818d
// Size: 0x5e3
function onstartgametype() {
    /#
        println("supply_drop_incoming");
    #/
    namespace_71073fa38f11492::runbrgametypefunc("onStartGameTypePre");
    level.blockweapondrops = 1;
    level.customlaststandactionset = "brlaststand";
    val::function_2d6e7e0b80767910(level.customlaststandactionset, [0:"usability", 1:"vehicle_use", 2:"crate_use", 3:"ascender_use", 4:"weapon_switch", 5:"weapon_switch_clip", 6:"offhand_primary_weapons", 7:"offhand_secondary_weapons", 8:"killstreaks", 9:"supers", 10:"gesture", 11:"allow_jump", 12:"sprint", 13:"crouch", 14:"prone", 15:"melee", 16:"fire", 17:"show_operator_pet"]);
    level.graceperiod = 3;
    level.ingraceperiod = level.graceperiod;
    level.prematchperiodend = 0;
    if (isdefined(level.var_d191ab4628e775cd)) {
        level.prematchperiodend = level.var_d191ab4628e775cd;
    }
    namespace_aead94004cf4c147::function_e0948a1e98e82ae1();
    setclientnamemode("auto_change");
    foreach (entry in level.teamnamelist) {
        setobjectivetext(entry, "OBJECTIVES/DM");
        if (level.splitscreen) {
            setobjectivescoretext(entry, "OBJECTIVES/DM");
        } else {
            setobjectivescoretext(entry, "OBJECTIVES/DM_SCORE");
        }
        setobjectivehinttext(entry, "OBJECTIVES/DM_HINT");
    }
    initspawns();
    if (!lowpopallowtweaks()) {
        namespace_c5622898120e827f::initcircle();
    }
    br_ammo_init();
    namespace_ad389306d44fc6b4::init();
    namespace_cb965d2f71fefddc::br_pickups_init();
    namespace_cb965d2f71fefddc::initpickupusability();
    namespace_15111e421d79d07d::init();
    if (getdvarint(@"hash_e4187d1543c7477e", 0) != 1) {
        namespace_cf43e8181d279e3e::init();
    }
    if (!lowpopallowtweaks()) {
        if (getdvarint(@"hash_82bde055b11e6698", 0)) {
            namespace_4bc0ead8d2af3d84::init_quest_util();
        } else {
            thread namespace_1eb3c4e0e28fac71::function_bf4fd0b5a7c2f528();
        }
    }
    namespace_65c7485efe2b8314::calloutmarkerping_init();
    namespace_1b7e64f50cca9321::brlootcache_init();
    namespace_8fdab8b8e292dc72::breventsinit();
    namespace_d76af9f804655767::init();
    namespace_8bbc300af6d3c2fb::init();
    namespace_a553e80c09b00591::init();
    namespace_f51c41a139e03299::init();
    namespace_38b993c4618e76cd::init();
    level thread namespace_25c7d0f5cb1e4346::init();
    level.br_pickups.crates = [];
    level.br_pickups.outercrates = [];
    namespace_47fd1e79a44628cd::initgulag();
    registersharedfunc("vehicle_compass", "shouldBeVisibleToPlayer", &vehicle_compass_br_shouldbevisibletoplayer);
    registersharedfunc("br", "superSlotCleanUp", &namespace_cb965d2f71fefddc::superslotcleanup);
    registersharedfunc("br", "challengeEvaluator", &namespace_a553e80c09b00591::challengeevaluator);
    registersharedfunc("airdrop", "registerCrateForCleanup", &airdrop_registercrateforcleanup);
    registersharedfunc("airdrop", "brLoadoutCrateFirstActivation", &airdop_brloadoutcratefirstactivation);
    registersharedfunc("airdrop", "makeWeaponFromCrate", &airdrop_makeweaponfromcrate);
    registersharedfunc("airdrop", "makeItemFromCrate", &airdrop_makeitemfromcrate);
    registersharedfunc("airdrop", "makeItemsFromCrate", &airdrop_makeitemsfromcrate);
    registersharedfunc("airdrop", "br_giveDropBagLoadout", &airdrop_br_givedropbagloadout);
    registersharedfunc("airdrop", "brOnLoadoutCrateDestroyed", &airdrop_bronloadoutcratedestroyed);
    registersharedfunc("gasmask", "breakGasMaskBR", &namespace_cb965d2f71fefddc::breakgasmaskbr);
    registersharedfunc("backpack", "isBackpackInventoryEnabled", &namespace_aead94004cf4c147::isBackpackInventoryEnabled);
    registersharedfunc("backpack", "removeSmallestItemStackBackpack", &namespace_aead94004cf4c147::removeSmallestItemStackBackpack);
    registersharedfunc("backpack", "addItemToBackpackByRef", &namespace_aead94004cf4c147::addItemToBackpackByRef);
    registersharedfunc("backpack", "getTotalItemCountInBag", &namespace_aead94004cf4c147::getTotalItemCountInBag);
    registersharedfunc("ping", "calloutMarkerPing_markerAdded", &function_1b1c1195e27710b9);
    registersharedfunc("br", "isInstancedSpace", &isInstancedSpace);
    registersharedfunc("br", "packClientMatchData", &function_3ac2a599d142369d);
    registersharedfunc("popsmoke", "deploy", &namespace_5867b152e0697992::function_933806fb8408353d);
    registersharedfunc("outline", "outlineEnableForTeam", &namespace_cbd3754a0c69cc63::outlineenableforteam);
    registersharedfunc("audio", "brLeaderDialogTeam", &namespace_d3d40f75bb4e4c32::brleaderdialogteam);
    namespace_c758024ed02b8875::initcarriables();
    if (namespace_76a219af07c28c13::function_6934349b7823d888()) {
        namespace_76a219af07c28c13::init();
        if (namespace_51790b5acb47a506::function_4db915a9ce0e903a()) {
            namespace_51790b5acb47a506::init();
        }
    }
    initloot();
    namespace_5a43e3b1b17bfdcc::init();
    namespace_4338aec4322f6fdd::init();
    namespace_696ea23262b006d1::init();
    level thread onprematchstarted();
    thread turnofftimer();
    level thread watchprematchdone();
    level thread namespace_15d3019056d1bcea::brvehiclesonstartgametype();
    namespace_acc3d8ec1f00ce29::init();
    level.var_e4669b797013d077 = namespace_dace9d390bc4a290::function_b08e7e3a0b14f76f("veh9_mil_lnd_mrap");
    if (getsubgametype() == "dmz") {
        namespace_acc3d8ec1f00ce29::function_e456f5964ba54d64();
        namespace_d696adde758cbe79::function_b52f35a3ff450ecd();
    }
    thread waitandstartparachuteoverheadmonitoring();
    level thread updateplayerlocationcallouts();
    namespace_3846cfb60b2ef12f::registeronluieventcallback(&function_db908ecaccbe933c);
    namespace_f1d40c362677777e::registerondisconnecteventcallback(&onplayerdisconnect);
    namespace_f1d40c362677777e::function_5b91df923c38392b(&function_c11d61293d7e8ba);
    namespace_3846cfb60b2ef12f::registeronluieventcallback(&handleexitsquadeliminatedstate);
    if (namespace_3f0ea7483345a2c0::function_310ab06891cb4517()) {
        namespace_3846cfb60b2ef12f::registeronluieventcallback(&namespace_3f0ea7483345a2c0::function_e146f016a8a7244f);
    }
    if (namespace_8361bad7391de074::function_cff2f4f168b29b81()) {
        namespace_8361bad7391de074::function_5a9c4bf10785ce1e();
    } else {
        namespace_8361bad7391de074::cleanup();
    }
    if (brdoesloadoutoptionusedropbags()) {
        thread namespace_c3059e55bc606259::initdropbagsystem();
        thread cleanupdropbagsoncircle();
    }
    level.killstreakbeginusefunc = &brkillstreakbeginusefunc;
    namespace_e9cc5762e80bb016::init();
    namespace_92443376a63aa4bd::start();
    namespace_71073fa38f11492::runbrgametypefunc("onStartGameType");
}

// Namespace br/namespace_d20f8ef223912e12
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8777
// Size: 0x16
function vehicle_compass_br_shouldbevisibletoplayer(vehicle, player) {
    return 1;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8795
// Size: 0xa3
function cleanupmolotovs() {
    /#
        println("stealth_spotted");
    #/
    grenades = getentarray("grenade", "classname");
    foreach (grenade in grenades) {
        if (isdefined(grenade) && isdefined(grenade.weapon_name) && grenade.weapon_name == "molotov_mp") {
            thread namespace_df478cc572a311d3::molotov_cleanup_pool(grenade);
        }
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x883f
// Size: 0x24d
function onprematchfadedone() {
    namespace_4b0406965e556711::gameflagwait("prematch_fade_done");
    if (!istrue(level.skipprematch)) {
        level thread resetalldoors(2.1);
        level thread namespace_ede58c1e66c2c280::calloutmarkerping_removeallcalloutsforallplayers(1);
        if (getsubgametype() != "dmz") {
            level thread namespace_15d3019056d1bcea::brvehicleonprematchstarted();
        }
        level thread namespace_c758024ed02b8875::clean_and_spawn_carriables();
        resetglass();
    }
    level thread namespace_15111e421d79d07d::onprematchdone();
    if (!istrue(level.skipprematch)) {
        cleanupmolotovs();
        namespace_15d3019056d1bcea::emptyallvehicles();
        if (!istrue(level.br_infils_disabled)) {
            foreach (player in level.players) {
                if (!istrue(level.var_e4a482edc1542597)) {
                    player setplayerprematchallows();
                    player thread namespace_cb965d2f71fefddc::resetplayerinventory(undefined, 1);
                }
                if (istrue(player.hasspawned)) {
                    if (player function_9cc921a57ff4deb5()) {
                        player function_fd357ca89e5e29d9();
                    }
                    player thread namespace_3bbb5a98b932c46f::deleteplacedequipment(1);
                }
                if (istrue(level.var_387cd21817428092)) {
                    player setclientomnvar("ui_squad_leader_pack_dropped", 0);
                }
            }
        }
        foreach (player in level.players) {
            if (isdefined(player.burninginfo)) {
                player namespace_df478cc572a311d3::molotov_clear_burning();
            }
            player namespace_484d135e1e3717ed::javelin_forceclear();
        }
        level notify("prematch_cleanup");
    }
    level.disabledamagestattracking = 0;
    foreach (i, var_65d040b6fa76f410 in level.br_prematchloot) {
        var_65d040b6fa76f410 setscriptablepartstate(level.br_prematchlootparts[i], "visible");
    }
    level.br_prematchloot = undefined;
    level.br_prematchlootparts = undefined;
    if (!istrue(level.br_circle_disabled)) {
        level thread namespace_c5622898120e827f::runcircles(1);
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a93
// Size: 0x1d2
function onprematchstarted() {
    level thread onprematchfadedone();
    namespace_973962356ce55fee::function_5df8c6abd0b861cd();
    if (!istrue(level.skipprematch) && !namespace_36f464722d326bbe::function_b2c4b42f9236924() && !getdvarint(@"hash_1bf2afd8a32b6892", 0)) {
        foreach (team in level.teamnamelist) {
            setteamradar(team, 1);
            setteamradarstrength(team, 1);
        }
    }
    level waittill("prematch_started");
    if (lowpopallowtweaks()) {
        namespace_c5622898120e827f::initcircle();
        if (getdvarint(@"hash_82bde055b11e6698", 0)) {
            namespace_4bc0ead8d2af3d84::init_quest_util();
        } else {
            thread namespace_1eb3c4e0e28fac71::function_bf4fd0b5a7c2f528();
        }
    }
    if (!istrue(level.skipprematch)) {
        foreach (team in level.teamnamelist) {
            setteamradar(team, 0);
            setteamradarstrength(team, 0);
        }
    }
    if (istrue(level.br_allowloadout) && istrue(level.var_66113aa6fc12be57)) {
        setomnvarforallclients("ui_options_menu", 0);
    }
    if (namespace_973962356ce55fee::function_b4e9d46918f067bb()) {
        namespace_973962356ce55fee::function_f5c1889669d23a75();
    } else {
        gameflagwait("br_ready_to_jump");
    }
    if (istrue(level.var_bf269015710de2dd)) {
        level thread namespace_88bfae359020fdd3::function_da05e0125fa8bbf4();
    }
    level thread function_67179ffa48ecb2c9();
    level thread handlematchscoreboardinfo();
    if (!namespace_71073fa38f11492::isfeaturedisabled("teamSpectate")) {
        level thread namespace_a9c534dc7832aba4::spectate_init();
    }
    level.br_prematchstarted = 1;
    level notify("infils_ready");
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c6c
// Size: 0x6c
function handlematchscoreboardinfo() {
    if (isprophuntgametype()) {
        return;
    }
    namespace_633301c58b0b0cec::processmatchscoreboardinfo();
    if (getdvarint(@"hash_1bc373211683e0b6") != 0) {
        if (matchmakinggame() && !privatematch()) {
            setclientmatchdata("isPublicMatch", 1);
        } else {
            setclientmatchdata("isPublicMatch", 0);
        }
    }
    level waittill_notify_or_timeout("br_c130_left_bounds", 120);
    namespace_633301c58b0b0cec::processmatchscoreboardinfo();
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8cdf
// Size: 0xc4
function function_67179ffa48ecb2c9() {
    if (getdvarint(@"hash_4c8e33496c92cd2e", 0)) {
        return;
    }
    if (getdvarint(@"hash_c0833dddb3742de3", 0)) {
        return;
    }
    level endon("game_ended");
    if (!istutorial() && !isBrPracticeMode()) {
        if (brdoesloadoutoptionusedropbags() && brareloadoutdropbagsdelayed()) {
            var_70bcbf0ad5028219 = brgetloadoutdropbagsdelayseconds();
            namespace_c3059e55bc606259::delaydropbags(var_70bcbf0ad5028219);
            if (namespace_71073fa38f11492::isfeatureenabled("dropBagLoop")) {
                while (1) {
                    namespace_c3059e55bc606259::delaydropbags(var_70bcbf0ad5028219);
                }
            }
        } else if (function_d27f645c3282a371() && !istrue(level.br_circle_disabled)) {
            var_70bcbf0ad5028219 = function_8209cc6a885e9a2e();
            level thread namespace_f51c41a139e03299::function_607167c18661377b(var_70bcbf0ad5028219);
        }
    }
    level.dropbagstruct = undefined;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8daa
// Size: 0x23
function resetalldoors(delaytime) {
    level endon("game_ended");
    if (isdefined(delaytime)) {
        wait(delaytime);
    }
    brclosealldoors(50);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8dd4
// Size: 0x31
function handleexitsquadeliminatedstate(notification, var_e1d097c517c3af5b) {
    if (isdefined(notification) && notification == "exit_squad_eliminated") {
        self setclientomnvar("ui_br_squad_eliminated_active", 0);
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e0c
// Size: 0xd7
function waitandstartparachuteoverheadmonitoring() {
    level endon("game_ended");
    level.activeparachutersfactionvo = [];
    level.activeparachutersfactionvo["uktl"] = "dx_bra_uktl_respawning_enemy_in_area";
    level.activeparachutersfactionvo["rutl"] = "dx_bra_rutl_respawning_enemy_in_area";
    level.parachuteoverheadwarningtimeoutms = getmatchrulesdata("commonOption", "parachuteOverheadWarningTimeoutMs");
    level.parachuteoverheadwarningprematchtimeoutms = getmatchrulesdata("commonOption", "parachuteOverheadWarningPrematchTimeoutMs");
    level.parachuteoverheadwarningradius = getmatchrulesdata("commonOption", "parachuteOverheadWarningRadius");
    level.parachuteoverheadwarningheight = getmatchrulesdata("commonOption", "parachuteOverheadWarningHeight");
    level thread watchparachutersoverhead(level.parachuteoverheadwarningprematchtimeoutms);
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    level notify("cancel_watch_parachuters_overhead");
    waitframe();
    level thread watchparachutersoverhead(level.parachuteoverheadwarningtimeoutms);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8eea
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

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9164
// Size: 0x1c7
function updateplayerlocationcallouts() {
    level endon("game_ended");
    level.calloutglobals.calloutzones = getentarray("location_volume", "targetname");
    if (!level.calloutglobals.calloutzones.size) {
        return;
    }
    while (1) {
        var_2f04eb838ce020dc = 0;
        foreach (player in level.players) {
            if (!isplayer(player) || !isalive(player)) {
                continue;
            }
            if (isdefined(player.br_currentcalloutzone) && player istouching(player.br_currentcalloutzone)) {
                continue;
            }
            isinzone = 0;
            foreach (var_7fcbffdac2386d7d in level.calloutglobals.calloutzones) {
                if (player istouching(var_7fcbffdac2386d7d)) {
                    isinzone = 1;
                    player.br_currentcalloutzone = var_7fcbffdac2386d7d;
                    player namespace_8554064ba5e7d07::setplayercalloutarea(var_7fcbffdac2386d7d.script_noteworthy);
                    player thread namespace_71073fa38f11492::runbrgametypefunc("onEnterCalloutArea", var_7fcbffdac2386d7d.script_noteworthy);
                    break;
                }
            }
            if (!isinzone) {
                player.br_currentcalloutzone = undefined;
                player namespace_8554064ba5e7d07::setplayercalloutarea("none");
            }
            var_2f04eb838ce020dc = (var_2f04eb838ce020dc + 1) % 2;
            if (var_2f04eb838ce020dc == 0) {
                waitframe();
            }
        }
        waitframe();
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9332
// Size: 0x207
function function_cda409f3a76dac5() {
    versionnum = getdvarint(@"hash_2dbefc43a77efb18", 4);
    level.useLootableCorpse = getmatchrulesdata("brData", "useLootableCorpse");
    switch (versionnum) {
    case 0:
        level.var_51225d738094457d = 0;
        level.var_aa5679ebf3504e13 = 1;
        level.var_a3499c286ac570e4 = 1;
        level.var_4bc57ebffee174b = 0;
        break;
    case 1:
        level.var_51225d738094457d = 1;
        level.var_aa5679ebf3504e13 = 1;
        level.var_a3499c286ac570e4 = 1;
        level.var_4bc57ebffee174b = 0;
        level.var_a1aab37ec3423e39 = getdvarint(@"hash_3f8e6e632099c5f", 1);
        break;
    case 2:
        level.var_51225d738094457d = 0;
        level.var_aa5679ebf3504e13 = 1;
        level.var_a3499c286ac570e4 = 1;
        level.var_4bc57ebffee174b = 1;
        break;
    case 3:
        level.var_51225d738094457d = 0;
        level.var_aa5679ebf3504e13 = 0;
        level.var_a3499c286ac570e4 = 0;
        level.var_4bc57ebffee174b = 0;
        break;
    case 4:
        level.var_51225d738094457d = 1;
        level.var_aa5679ebf3504e13 = 0;
        level.var_a3499c286ac570e4 = 0;
        level.var_4bc57ebffee174b = 0;
        level.var_813b4b2211fbaf1d = 1;
        break;
    case 5:
        level.var_51225d738094457d = 0;
        level.var_aa5679ebf3504e13 = 1;
        level.var_a3499c286ac570e4 = 1;
        level.var_4bc57ebffee174b = 0;
        level.var_73dc8cb1481e4a36 = 1;
        level.var_4ca052423b9bb316 = 1;
        break;
    default:
        level.var_51225d738094457d = 0;
        level.var_aa5679ebf3504e13 = 1;
        level.var_a3499c286ac570e4 = 1;
        level.var_4bc57ebffee174b = 0;
        break;
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9540
// Size: 0x4
function getusingproxdoors() {
    return 0;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x954c
// Size: 0x1c3
function function_a9f21df27cd2286f(var_973f8e42fb3c591b, position) {
    foreach (player in self.playersintrigger) {
        if (isdefined(player.gasmaskhealth) && player.gasmaskhealth > 0) {
            player namespace_9c6cddd872ad75f7::processdamage(var_973f8e42fb3c591b);
            player namespace_aead94004cf4c147::function_5323bef1ad6244b9(var_973f8e42fb3c591b);
        }
    }
    var_712cdccb35195a95 = getlootscriptablearrayinradius("brloot_equip_gasmask", undefined, position, self.radius);
    var_23106d73c98f992 = getlootscriptablearrayinradius("brloot_equip_gasmask_durable", undefined, position, self.radius);
    var_d189e34e29b13a24 = array_combine(var_712cdccb35195a95, var_23106d73c98f992);
    for (index = var_d189e34e29b13a24.size - 1; index >= 0; index--) {
        gasmask = var_d189e34e29b13a24[index];
        var_114a79e4e06f3eda = gasmask.origin[2] - self.origin[2];
        if (istrue(gasmask.var_1b46a808091ea19c) || var_114a79e4e06f3eda < 0 || var_114a79e4e06f3eda > self.height) {
            continue;
        }
        newhealth = int(gasmask.count - var_973f8e42fb3c591b);
        if (newhealth <= 0) {
            gasmask setscriptablepartstate(gasmask.type, "death");
            gasmask namespace_cb965d2f71fefddc::deletescriptableinstanceaftertime(1);
            level thread deregistergasmaskscriptableatframeend(index);
        } else {
            loot_setitemcount(gasmask, newhealth);
        }
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9716
// Size: 0x41
function function_4b2456ab9e1c7b81(position) {
    self endon("death");
    wait(0.1);
    function_a9f21df27cd2286f(20, position);
    while (1) {
        wait(1);
        function_a9f21df27cd2286f(5, position);
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x975e
// Size: 0x2b6
function watchprematchdone() {
    namespace_4b0406965e556711::gameflagwait("prematch_fade_done");
    level notify("br_prematchEnded");
    totalplayers = getlivingplayers();
    level.totalplayers = totalplayers.size;
    startingteamcount = 0;
    foreach (entry in level.teamnamelist) {
        if (getteamdata(entry, "aliveCount") > 0) {
            startingteamcount++;
        }
    }
    level.startingteamcount = max(1, startingteamcount);
    level.prematchendtime = gettime();
    level.recordfinalkillcam = 1;
    level.ignorescoring = 0;
    level.disableweaponstats = 0;
    level.disablestattracking = 0;
    level.prematchaddkillfunc = undefined;
    level.challengesdisabled = 0;
    brclearscoreboardstats();
    if (getdvarint(@"hash_169cf144591321b3", 0) == 1) {
        setdvar(@"hash_2c9195a6f431585d", 1);
        setdvar(@"hash_58a078a367c02ab3", 1);
    } else {
        setdvar(@"hash_2c9195a6f431585d", 0);
    }
    foreach (player in level.players) {
        player resetchallengetimers();
    }
    if (!namespace_71073fa38f11492::isfeatureenabled("allowLateJoiners")) {
        level.allowlatecomers = 0;
        setnojiptime(1, 1);
        setnojipscore(1, 1);
    }
    brmatchstarted();
    setomnvar("scriptable_loot_hide", 0);
    level notify("scriptable_loot_hide_off");
    foreach (player in level.players) {
        player setclientdvar(@"hash_cbb22e2fb1a57873", 1);
        if (isalive(player)) {
            player.health = player.maxhealth;
            player startchallengetimer("alive_not_downed");
        }
    }
    namespace_a011fbf6d93f25e5::branalytics_playercount(totalplayers.size);
    level setplacementxpshare();
    if (getdvarint(@"hash_1295aa08e53fc39d", 0) == 0) {
        removeallcorpses();
    }
    if (getdvarint(@"hash_3d82b17bac600216", 1) == 1) {
        function_cea1d94b4418bcc();
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9a1b
// Size: 0x13
function turnofftimer() {
    wait(1);
    setomnvar("ui_match_timer_hidden", 1);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9a35
// Size: 0x73
function initspawns() {
    namespace_b2d5aa2baf2b5701::setactivespawnlogic("FreeForAll", "Crit_Default");
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    level.mapcenter = namespace_b2d5aa2baf2b5701::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9aaf
// Size: 0x1aa
function initprematchspawnlocations() {
    if (!namespace_d3d40f75bb4e4c32::isBrPracticeMode()) {
        level.startingspawns = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_dm_spawn_start");
        if (level.startingspawns.size == 0) {
            level.startingspawns = namespace_b2d5aa2baf2b5701::getspawnpointarray("mp_tdm_spawn_allies_start");
        }
        level.prematchspawnorigins = getprematchlocationspawnorigins();
        if (level.var_6bed852a909e4f70 == 1) {
            arenas = getstructarray("gulag_dom", "targetname");
            if (isdefined(arenas) && arenas.size > 0) {
                foreach (arena in arenas) {
                    var_bb81957d1ae1cf3a = getstructarray(arena.target, "targetname");
                    foreach (var_bdf25d8a73ff7dad in var_bb81957d1ae1cf3a) {
                        if (var_bdf25d8a73ff7dad.script_noteworthy == "gulag_dom_prematch_spawn") {
                            level.prematchspawnorigins[0].origin = var_bdf25d8a73ff7dad.origin;
                        }
                    }
                }
            }
        } else if (level.var_6bed852a909e4f70 == 2) {
            if (namespace_5a1ea9d54418bd42::function_9005af34e01bf8fe()) {
                level.prematchspawnorigins[0].origin = (-1880, -640, 430);
            }
        }
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9c60
// Size: 0xdd
function function_6e4f8e741562e931() {
    /#
        while (1) {
            if (isdefined(level.prematchspawnorigins)) {
                foreach (location in level.prematchspawnorigins) {
                    var_c0014262498c3f37 = getprematchradius(location);
                    radius = var_c0014262498c3f37[1];
                    minradius = var_c0014262498c3f37[0];
                    sphere(location.origin, radius, (0, 1, 0));
                    if (minradius > 0) {
                        sphere(location.origin, minradius, (1, 1, 0));
                    }
                }
            }
            waitframe();
        }
    #/
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d44
// Size: 0x59
function usedropspawn() {
    var_18b417329dc24bf0 = getdvarint(@"hash_3f36284b49b3d7a", 0) != 0;
    return (!istrue(level.br_prematchstarted) || istrue(level.br_allowdropspawnafterprematch)) && !istrue(level.skipprematchdropspawn) && !var_18b417329dc24bf0 && !istrue(level.infilcinematicactive);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9da5
// Size: 0x2d2
function getspawnpoint(var_6039638fd494a229) {
    if (getsubgametype() == "dmz" || getsubgametype() == "exgm") {
        return namespace_d696adde758cbe79::getspawnpoint();
    }
    if (isdefined(self.prespawnspawn)) {
        spawnpoint = self.prespawnspawn;
        self.prespawnspawn = undefined;
        return spawnpoint;
    }
    if (isdefined(self.initialprespawn)) {
        spawnpoint = self.initialprespawn;
        return spawnpoint;
    }
    var_f423081b135e1c9f = gameflagexists("prematch_done") && gameflag("prematch_done");
    if (!isdefined(level.prematchspawnorigins) && !var_f423081b135e1c9f) {
        initprematchspawnlocations();
    }
    if (istrue(var_6039638fd494a229) || usedropspawn()) {
        var_c40592d1d3225ac7 = (0, randomintrange(0, 360), 0);
        dropstruct = getprematchspawnorigin();
        var_c0014162498c3d04 = getprematchradius(dropstruct);
        radius = var_c0014162498c3d04[1];
        minradius = var_c0014162498c3d04[0];
        var_553aa30efc389cb5 = randomfloatrange(minradius, radius);
        if (isdefined(level.var_4c124f424cdfa325) && level.var_4c124f424cdfa325 > -1) {
            var_553aa30efc389cb5 = level.var_4c124f424cdfa325;
        }
        if (getdvarint(@"hash_8b70bee2041ed89d", 0) == 1) {
            var_352cce1afcdaa37d = vectortoangles(dropstruct.origin);
            var_c40592d1d3225ac7 = (0, var_352cce1afcdaa37d[1], 0) * -1;
            var_553aa30efc389cb5 = radius;
        }
        var_6c3da2dafc41d197 = anglestoforward(var_c40592d1d3225ac7) * -1;
        offsetvector = var_6c3da2dafc41d197 * var_553aa30efc389cb5;
        var_51c508b23ef96d39 = dropstruct.origin + offsetvector;
        if (isdefined(self.setspawnpoint)) {
            spawnoffset = namespace_81156089ff1fe819::getinfilspawnoffset();
            var_51c508b23ef96d39 = self.setspawnpoint.playerspawnpos + (0, 0, spawnoffset);
            var_c40592d1d3225ac7 = self.setspawnpoint.playerspawnangles;
            namespace_add8ab90fc53d7f7::spawnpoint_clearspawnpoint(0, 1);
        }
        spawnpoint = spawnstruct();
        spawnpoint.origin = var_51c508b23ef96d39;
        spawnpoint.angles = var_c40592d1d3225ac7;
        spawnpoint.index = -1;
        return spawnpoint;
    }
    spawnpoints = level.startingspawns;
    spawnpoint = namespace_b2d5aa2baf2b5701::getspawnpoint_random(spawnpoints);
    if (!isdefined(spawnpoint)) {
        spawnpoint = spawnstruct();
        spawnpoint.origin = (0, 0, 0);
        spawnpoint.angles = (0, 0, 0);
        spawnpoint.index = -1;
    }
    return spawnpoint;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa07f
// Size: 0x54
function createspawnlocation(origin, minradius, maxradius) {
    loc = spawnstruct();
    loc.origin = origin;
    loc.minradius = minradius;
    loc.radius = maxradius;
    return loc;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa0db
// Size: 0x32c
function getprematchlocationspawnorigins() {
    var_115964aea2202001 = 0;
    spawnlocations = getstructarray("br_prematch_insertion_point", "targetname");
    var_402e8b8d0e252db6 = getdvarint(@"hash_500929cf224e1d03", 0);
    if (var_402e8b8d0e252db6) {
        var_a055cd5ea13faa2c = getdvarvector(@"hash_15fab3c9c51ca75e", (0, 0, 0));
        var_13af2a3f5d343ce4 = getdvarint(@"hash_d7079d5a45600c6a", 0);
        /#
            assert(var_a055cd5ea13faa2c != (0, 0, 0) && var_13af2a3f5d343ce4 != 0);
        #/
        spawnlocations = [0:namespace_d20f8ef223912e12::createspawnlocation(var_a055cd5ea13faa2c, 0, var_13af2a3f5d343ce4)];
    } else if (isdefined(level.br_prematchspawnlocations)) {
        var_115964aea2202001 = 1;
        spawnlocations = level.br_prematchspawnlocations;
    } else if (!spawnlocations.size) {
        var_115964aea2202001 = 1;
        spawnlocations = getentarray("vehicle_volume", "script_noteworthy");
    }
    /#
        if (!spawnlocations.size && getdvar(@"hash_344ec7639d9d44", "defaultevent") != "defaultevent") {
            spawnlocations = level.startingspawns;
            if (level.var_6bed852a909e4f70 == 1) {
                spawnlocations[0].origin = level.prematchspawnorigins[0].origin;
            }
            return spawnlocations;
        }
    #/
    /#
        assertex(spawnlocations.size, "[BR Prematch] No prematch insertion locations were found!");
    #/
    foreach (location in spawnlocations) {
        location.groundorigin = location.origin;
        if (!isdefined(location.radius)) {
            location.radius = 5000;
        }
        if (!isdefined(location.minradius)) {
            location.minradius = 500;
        }
    }
    var_504a04c57a458dd1 = getdvarint(@"hash_23f58bfef9c3dd88", 5);
    if (isdefined(level.var_2f78f22edf92faa9) && level.var_2f78f22edf92faa9 < var_504a04c57a458dd1) {
        var_504a04c57a458dd1 = level.var_2f78f22edf92faa9;
    }
    if (var_504a04c57a458dd1 > 0 && var_504a04c57a458dd1 < spawnlocations.size) {
        spawnlocations = array_slice(array_randomize(spawnlocations), 0, var_504a04c57a458dd1);
    }
    foreach (location in spawnlocations) {
        if (var_115964aea2202001) {
            location.origin = getoffsetspawnorigin(location.origin);
        } else {
            minz = getoffsetspawnorigin(location.origin)[2];
            if (location.origin[2] < minz) {
                location.origin = (location.origin[0], location.origin[1], minz);
            }
        }
    }
    return spawnlocations;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa40f
// Size: 0x5
function function_cb40f77c51717ea1() {
    return 5;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa41c
// Size: 0xba
function getoffsetspawnorigin(origin, var_a6427a6a24f058dc) {
    var_fbcabd62b8f66eb8 = namespace_2a184fc4902783dc::create_default_contents(1);
    traceoffset = (0, 0, 5000);
    tracestart = origin + traceoffset;
    traceend = origin - traceoffset;
    trace = namespace_2a184fc4902783dc::ray_trace(tracestart, traceend, undefined, var_fbcabd62b8f66eb8);
    var_8721071772476c47 = origin;
    if (trace["hittype"] != "hittype_none") {
        var_8721071772476c47 = trace["position"];
    }
    if (!isdefined(var_a6427a6a24f058dc)) {
        zoffset = namespace_81156089ff1fe819::getinfilspawnoffset();
        var_a6427a6a24f058dc = (0, 0, zoffset);
    }
    return var_8721071772476c47 + var_a6427a6a24f058dc;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa4de
// Size: 0x78
function getoffsetspawnoriginmultitrace(origin, var_a6427a6a24f058dc) {
    var_fbcabd62b8f66eb8 = namespace_2a184fc4902783dc::create_default_contents(1);
    var_84d0c3e36addfa4 = 5000;
    var_191ebd2dd0d5f975 = 5000;
    groundorigin = namespace_d3d40f75bb4e4c32::droptogroundmultitrace(origin, var_84d0c3e36addfa4, var_191ebd2dd0d5f975, var_fbcabd62b8f66eb8);
    if (!isdefined(var_a6427a6a24f058dc)) {
        zoffset = namespace_81156089ff1fe819::getinfilspawnoffset();
        var_a6427a6a24f058dc = (0, 0, zoffset);
    }
    return groundorigin + var_a6427a6a24f058dc;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa55e
// Size: 0x20
function getexpectednumberofteams() {
    numteams = int(150 / level.maxteamsize);
    return numteams;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa586
// Size: 0x1f5
function getprematchspawnorigin() {
    /#
        assert(isdefined(self.sessionteam));
    #/
    /#
        assert(array_contains(level.teamnamelist, self.sessionteam));
    #/
    if (!isdefined(level.prematchspawnoriginsforteams)) {
        level.prematchspawnoriginsforteams = [];
        level.prematchspawnoriginnextidx = randomint(level.prematchspawnorigins.size);
        level.prematchspawnoriginteamcount = [];
        for (i = 0; i < level.prematchspawnorigins.size; i++) {
            level.prematchspawnoriginteamcount[i] = 0;
        }
    }
    if (!isdefined(level.prematchspawnoriginsforteams[self.sessionteam])) {
        level.prematchspawnoriginsforteams[self.sessionteam] = level.prematchspawnorigins[level.prematchspawnoriginnextidx];
        level.prematchspawnoriginteamcount[level.prematchspawnoriginnextidx]++;
        var_8158644ca35340a1 = namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73();
        if (var_8158644ca35340a1) {
            level.prematchspawnoriginnextidx = (level.prematchspawnoriginnextidx + 1) % level.prematchspawnorigins.size;
        } else {
            var_51febe69a426f521 = getexpectednumberofteams();
            var_ec868d5a67804395 = int(var_51febe69a426f521 / level.prematchspawnorigins.size);
            if (level.prematchspawnoriginteamcount[level.prematchspawnoriginnextidx] >= var_ec868d5a67804395) {
                level.prematchspawnoriginnextidx = (level.prematchspawnoriginnextidx + 1) % level.prematchspawnorigins.size;
            }
        }
    }
    spawnorigin = level.prematchspawnoriginsforteams[self.sessionteam];
    var_de8ce87f4113a890 = getdvarint(@"hash_da9368d09cdd8075", -1);
    if (var_de8ce87f4113a890 >= 0 && var_de8ce87f4113a890 < level.prematchspawnorigins.size) {
        spawnorigin = level.prematchspawnorigins[var_de8ce87f4113a890];
    }
    /#
        assert(isdefined(spawnorigin));
    #/
    return spawnorigin;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa783
// Size: 0x37d
function onplayerconnect(player) {
    level endon("game_ended");
    player endon("disconnect");
    if (!istrue(level.var_5dee688f6db9ad0b) && !level.var_ec2fb549b15ad827) {
        player namespace_6502912624889105::function_f6d25a34b1d286b1();
    }
    if (level.var_58adce74179ab9ef) {
        player initpersstat("objectivesCompleted");
    }
    player.needtoplayintro = undefined;
    player.br_infil_type = undefined;
    player.equipment = [];
    player.var_d2dbb2fa012e6d9c = [];
    player.br_isplayerbeforeinitialinfildeploy = 1;
    if (istrue(level.var_9a849908e60b857c)) {
        player.pers["perkPackageTier3State"] = 2;
        player.pers["perkPackageTier2Earned"] = 1;
    }
    namespace_aead94004cf4c147::function_b4f4561fdb86fa25(player);
    player thread namespace_aead94004cf4c147::function_631fd0855c653a68(player, 1);
    player thread br_ammo_player_init();
    player thread function_210b4d286feae145();
    if (namespace_71073fa38f11492::isbrgametypefuncdefined("playerWelcomeSplashes")) {
        player thread namespace_71073fa38f11492::runbrgametypefunc("playerWelcomeSplashes");
    } else {
        player thread playerwelcomesplashes();
    }
    player resetchallengetimers();
    if (namespace_aead94004cf4c147::function_720d227d0e55a960()) {
        namespace_85cd45b4fe0d86fb::function_941fe2b16d6fff9d(player);
    }
    namespace_71073fa38f11492::runbrgametypefunc("onPlayerConnect", player);
    if (isdefined(player) && player iscodcaster()) {
        if (!isdefined(level.var_c5877dbe60fddbf6)) {
            level.var_c5877dbe60fddbf6 = [];
        }
        level.var_c5877dbe60fddbf6[level.var_c5877dbe60fddbf6.size] = player;
        player.var_58c7d0139e08b036 = player getentitynumber();
        player thread namespace_47fd1e79a44628cd::function_7959e2df2cc7c5b4();
        player thread namespace_f5675568ccc8acc6::function_d2f9149adfa20419();
    }
    if (isdefined(player) && namespace_76a219af07c28c13::function_6934349b7823d888() && getdvarint(@"hash_e57fc6a3ec1c560b", 1)) {
        player thread function_a0394891c6cb41a5();
    }
    if (isdefined(player) && utility::function_a10967d736dc56e5()) {
        if (!isdefined(level.difficultytype)) {
            level namespace_bfef6903bca5845d::function_c8393014dd7f8ab6();
        }
        player.gameskill = namespace_310bdaa3cf041c47::get_gameskill();
        player namespace_310bdaa3cf041c47::set_difficulty_from_locked_settings();
        player.owner = undefined;
        flag_wait("level_stealth_initialized");
        while (!isdefined(player.team)) {
            waitframe();
        }
        player namespace_975f381a5813b0fd::main();
    }
    if (isdefined(level.var_e3ac672a3513883f)) {
        player [[ level.var_e3ac672a3513883f ]]();
    }
    player namespace_a011fbf6d93f25e5::function_8ed813c1b731ca42();
    if (!istrue(level.prematchstarted)) {
        player.radarmode = "slow_radar";
        level waittill("prematch_started");
        wait(1.4);
    }
    if (!isdefined(player.streakdata)) {
        waittillframeend();
    }
    if (isdefined(player)) {
        if (!function_d6ae35e0ce14bbaf() && !istutorial() && !isBrPracticeMode() && !isprophuntgametype()) {
            if (!istrue(level.skipprematch)) {
                if (!istrue(level.var_5dee688f6db9ad0b)) {
                    player br_ammo_player_clear();
                    player namespace_cb965d2f71fefddc::resetplayerinventory(0, 1);
                }
            }
            player namespace_36f464722d326bbe::startkeyearning();
        }
        if (function_e88ea7c360ea7fdf() && !istutorial() && !function_d6ae35e0ce14bbaf() && !isprophuntgametype()) {
            player thread monitorweaponswitchbr();
        }
        player.radarmode = "normal_radar";
        if (getdvarint(@"hash_82bde055b11e6698", 0)) {
            namespace_4bc0ead8d2af3d84::onplayerconnect(player);
        } else {
            thread namespace_1eb3c4e0e28fac71::onplayerconnect(player);
        }
        if (!istrue(level.var_c3d1e9e6a5024479)) {
            initializeaardata(player);
        }
        player namespace_47fd1e79a44628cd::function_dd93503cf95b6277();
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab07
// Size: 0x48
function function_e88ea7c360ea7fdf() {
    if (istrue(level.var_f60a3be40c34023d)) {
        return 0;
    }
    switch (getsubgametype()) {
    case #"hash_59b8e9d05b31ff9":
    case #"hash_343d3f3f77c83350":
    case #"hash_dddecc2751311914":
        return 0;
        break;
    }
    return 1;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xab57
// Size: 0xba
function playerwelcomesplashes() {
    self endon("disconnect");
    self waittill("spawned_player");
    wait(1);
    if (!istrue(game["liveLobbyCompleted"])) {
    }
    if (!istrue(level.br_infils_disabled)) {
        self waittill("br_jump");
        var_31c5dac60b438208 = self isonground() || self isswimming() || self function_415fe9eeca7b2e2b();
        var_a2b5f51a86d266ad = self isonladder();
        binvehicle = self function_793f941d7dff15ed();
        while (!var_31c5dac60b438208 && !var_a2b5f51a86d266ad && !binvehicle) {
            waitframe();
        }
    } else {
        level waittill("prematch_done");
    }
    namespace_a011fbf6d93f25e5::branalytics_landing(self);
    wait(1);
    namespace_d3d40f75bb4e4c32::brleaderdialogplayer("primary_objective", self, 0);
    function_ad8c1e6228a10058();
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac18
// Size: 0x1dd
function onspawnplayer(var_9156b53bcf7ce573) {
    self notify("br_spawned");
    var_9e83064e74fa428c = istrue(self.gulag) || istrue(level.var_faec6e12b831873d) && !istrue(self.var_908f8ac4bbcdb65e);
    namespace_cb965d2f71fefddc::initplayer(var_9e83064e74fa428c);
    namespace_15111e421d79d07d::initplayer(var_9156b53bcf7ce573);
    if (!namespace_71073fa38f11492::isfeaturedisabled("teamSpectate")) {
        namespace_a9c534dc7832aba4::initplayer();
    }
    self.oldprimarygun = undefined;
    self.newprimarygun = undefined;
    self.healthregendisabled = 0;
    self.needtoplayintro = undefined;
    self.gunnlessweapon = undefined;
    self.brdownedbyairstriketime = undefined;
    if (!namespace_71073fa38f11492::isfeaturedisabled("waitLoadoutDone")) {
        thread waitloadoutdone(var_9156b53bcf7ce573);
    }
    level.superdelay = 0;
    level.superpointsmod = 1;
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
    if (getdvarint(@"hash_621ca7153d2b5c1d", 0) > 0) {
        level thread brplayerhudoutlineforteammates(self);
    }
    namespace_d3d40f75bb4e4c32::setplayerdownedextrainfo(0);
    namespace_d3d40f75bb4e4c32::setplayerbeingrevivedextrainfo(0);
    namespace_d3d40f75bb4e4c32::function_c2afa687bc871d71(0);
    updatesquadmemberlaststandreviveprogress(self, self, 0, 1);
    self setclientomnvar("ui_securing", 0);
    if (namespace_71073fa38f11492::isbrgametypefuncdefined("onSpawnPlayer")) {
        namespace_71073fa38f11492::runbrgametypefunc("onSpawnPlayer");
    }
    thread function_467380e90c7db5a7();
    if (getdvarint(@"hash_12ca000dd2976ebc", 0) && getdvarint(@"hash_dc29833577096d47", 0)) {
        thread tnbrMonitorLauncherAmmoRestock();
    }
    var_8a4f9dfefaea3ee7 = self getclientomnvar("ui_speedboost_overlay");
    if (var_8a4f9dfefaea3ee7 == 0) {
        self setclientomnvar("ui_speedboost_overlay", 2);
    }
    level thread updateplayerandteamcountui();
}

// Namespace br/namespace_d20f8ef223912e12
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xadfc
// Size: 0x51
function waittill_return(var_12e3586b64301806, ent) {
    if (var_12e3586b64301806 != "death") {
        self endon("death");
    }
    ent endon("die");
    angle = location = self waittill(var_12e3586b64301806);
    ent notify("returned", location);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xae54
// Size: 0xf4
function waittill_confirm_or_cancel(var_12e3586b64301806, var_9ba4fcfeb48763ba, endstring) {
    if ((!isdefined(var_12e3586b64301806) || var_12e3586b64301806 != "death") && (!isdefined(var_9ba4fcfeb48763ba) || var_9ba4fcfeb48763ba != "death")) {
        self endon("death");
    }
    ent = spawnstruct();
    if (isdefined(var_12e3586b64301806)) {
        childthread waittill_return(var_12e3586b64301806, ent);
    }
    if (isdefined(var_9ba4fcfeb48763ba)) {
        childthread waittill_return(var_9ba4fcfeb48763ba, ent);
    }
    if (isdefined(endstring)) {
        childthread waittill_return(endstring, ent);
    }
    string = angle = location = ent waittill("returned");
    ent notify("die");
    var_6e586a99fa56a20f = spawnstruct();
    var_6e586a99fa56a20f.location = location;
    var_6e586a99fa56a20f.angles = angle;
    var_6e586a99fa56a20f.string = string;
    return var_6e586a99fa56a20f;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaf50
// Size: 0xa4
function traceselectedmaplocation(location) {
    var_5883d53023334465 = location + (0, 0, 10000);
    var_3cb14aea5687b8f6 = location - (0, 0, 10000);
    var_f590bcbaffb210c5 = namespace_f64231d5b7a2c3c4::vehicle_tracking_getgameinstancesforall();
    var_d4c559b594ad3df9 = level.activekillstreaks;
    var_b9d5783a4f34efbc = array_combine(var_f590bcbaffb210c5, var_d4c559b594ad3df9);
    contentoverride = namespace_2a184fc4902783dc::create_contents(0, 1, 0, 1, 1, 0, 0, 0, 0);
    return namespace_2a184fc4902783dc::ray_trace(var_5883d53023334465, var_3cb14aea5687b8f6, var_b9d5783a4f34efbc, contentoverride, 0, 1);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xaffc
// Size: 0x40
function giveprematchloadout() {
    self endon("death_or_disconnect");
    if (!istrue(level.br_prematchffa)) {
        return;
    }
    if (isdefined(level.var_b89a535236a6f3d8) && !istrue(level.var_8281a47e2cecb257)) {
        self [[ level.var_b89a535236a6f3d8 ]]();
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb043
// Size: 0xb0
function function_b89a535236a6f3d8() {
    var_7cde6fd13210763d = getdvarint(@"hash_9a965c244b485a82", 0) == 1;
    if (!var_7cde6fd13210763d) {
        namespace_d19129e4fa5d176::loadout_clearperks(undefined, 1);
        if (namespace_708f627020de59d3::function_c0d385a09d173a36()) {
            namespace_708f627020de59d3::function_19868614946c4df4();
        }
        if (istrue(level.var_1bc9ccb3f47cf947) && !_hasperk("specialty_br_movement_mod")) {
            giveperk("specialty_br_movement_mod");
        }
    }
    if (!level.allowsupers && !istrue(level.giveloadouteverytime) && !level.var_47207b7b330cf8e0) {
        waitframe();
        namespace_cb965d2f71fefddc::resetsuper();
        if (!istrue(level.var_4b56eabbc77bfd21)) {
            namespace_cb965d2f71fefddc::forcegivesuper("super_ammo_drop", 0);
        }
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb0fa
// Size: 0x220
function givematchloadout(var_94c2510160259cc5, ammomax) {
    if (!isdefined(var_94c2510160259cc5)) {
        var_94c2510160259cc5 = 0.5;
    }
    if (!isdefined(ammomax)) {
        ammomax = 20;
    }
    player = self;
    var_ddfacdf2215c052e = player namespace_d19129e4fa5d176::loadout_getorbuildclassstruct(player.class);
    if (!isdefined(var_ddfacdf2215c052e)) {
        return;
    }
    player.prevweaponobj = undefined;
    player loadout_clearperks();
    player loadout_updateplayerperks(var_ddfacdf2215c052e);
    givelaststandifneeded(player);
    var_9b82c9cd52fe9e6b = 0;
    if (isdefined(var_ddfacdf2215c052e.loadoutsecondaryobject) && !isnullweapon(var_ddfacdf2215c052e.loadoutsecondaryobject)) {
        namespace_3bcd40a3005712ec::br_forcegivecustomweapon(player, var_ddfacdf2215c052e.loadoutsecondaryobject, var_ddfacdf2215c052e.loadoutsecondaryfullname, var_ddfacdf2215c052e.loadoutsecondary, var_94c2510160259cc5, ammomax);
        var_9b82c9cd52fe9e6b++;
    }
    if (isdefined(var_ddfacdf2215c052e.loadoutprimaryobject) && !isnullweapon(var_ddfacdf2215c052e.loadoutprimaryobject)) {
        namespace_3bcd40a3005712ec::br_forcegivecustomweapon(player, var_ddfacdf2215c052e.loadoutprimaryobject, var_ddfacdf2215c052e.loadoutprimaryfullname, var_ddfacdf2215c052e.loadoutprimary, var_94c2510160259cc5, ammomax);
        var_9b82c9cd52fe9e6b++;
    }
    if (var_9b82c9cd52fe9e6b > 1) {
        player takeweapon("iw9_me_fists_mp");
    }
    equipment = [];
    if (isdefined(var_ddfacdf2215c052e.loadoutequipmentprimary)) {
        equipment[equipment.size] = var_ddfacdf2215c052e.loadoutequipmentprimary;
    }
    if (isdefined(var_ddfacdf2215c052e.loadoutequipmentsecondary)) {
        equipment[equipment.size] = var_ddfacdf2215c052e.loadoutequipmentsecondary;
    }
    foreach (var_1189bd7fbe2861f8 in equipment) {
        if (isdefined(level.br_pickups.br_equipnametoscriptable[var_1189bd7fbe2861f8])) {
            scriptablename = level.br_pickups.br_equipnametoscriptable[var_1189bd7fbe2861f8];
            br_forcegivecustompickupitem(player, scriptablename, 1);
        }
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb321
// Size: 0x2a
function givematchloadoutfordropbags() {
    player = self;
    player.prevweaponobj = undefined;
    player loadout_clearperks();
    givelaststandifneeded(player);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb352
// Size: 0x30
function prematchdeployparachute() {
    self endon("disconnect");
    while (self.sessionstate != "playing") {
        waitframe();
    }
    thread namespace_5078ee98abb32db9::startfreefall(2, 0, undefined, undefined, 1, 0);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb389
// Size: 0x8e
function getprematchradius(dropstruct) {
    radius = dropstruct.radius;
    minradius = dropstruct.minradius;
    var_e5bd279d3767139f = getdvarint(@"hash_3e97a62800ff7a1a", -1);
    if (var_e5bd279d3767139f >= 0) {
        radius = var_e5bd279d3767139f;
    }
    var_e5bd279d3767139f = getdvarint(@"hash_cad542096552c754", -1);
    if (var_e5bd279d3767139f >= 0) {
        minradius = var_e5bd279d3767139f;
    }
    if (minradius >= radius) {
        radius = minradius + 1;
    }
    return [0:minradius, 1:radius];
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb41f
// Size: 0x9a
function givelaststandifneeded(player) {
    if (istrue(level.forcedisablelaststand)) {
        return;
    }
    if (!level.teambased) {
        return;
    }
    var_4ad7c03ec4fa687 = level.maxteamsize == 1;
    hasselfrevivetoken = player namespace_d3d40f75bb4e4c32::hasselfrevivetoken();
    if (var_4ad7c03ec4fa687 && !hasselfrevivetoken && !istrue(level.var_f4e4fae260bddff3)) {
        return;
    }
    if (!iscontender(player)) {
        return;
    }
    if (player _hasperk("specialty_pistoldeath")) {
        return;
    }
    if (!namespace_36f464722d326bbe::isBRStyleGameType()) {
        return;
    }
    player giveperk("specialty_pistoldeath");
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb4c0
// Size: 0x34
function givespecialistbonusifneeded(player) {
    if (!iscontender(player)) {
        return;
    }
    if (!player hasspecialistbonus()) {
        return;
    }
    if (!namespace_36f464722d326bbe::isBRStyleGameType()) {
        return;
    }
    player namespace_b6a8027f477010e1::addspecialistbonus();
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb4fb
// Size: 0x333
function waitloadoutdone(var_9156b53bcf7ce573) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("death");
    self notify("waitLoadoutDone");
    self endon("waitLoadoutDone");
    self waittill("giveLoadout");
    if (!isagent(self)) {
        val::function_c9d0b43701bdba00("spawnVehicleDelay");
    }
    if (istrue(level.var_d034183abf2e274d)) {
        self.attached_bag = undefined;
        var_342175a1b9f9067e = self getplayerdata(level.var_5d69837cf4db0407, level.var_342175a1b9f9067e);
        var_8f24a28261fb9da3 = namespace_aead94004cf4c147::function_565cbea3437267d9(self);
        namespace_d696adde758cbe79::function_c3f3fceeddda6f6(var_8f24a28261fb9da3);
    }
    if (istutorial() || function_d6ae35e0ce14bbaf() || istrue(var_9156b53bcf7ce573)) {
        return;
    }
    if (isBrPracticeMode()) {
        if (!namespace_71073fa38f11492::isfeaturedisabled("armor")) {
            thread function_50434e55c7907057();
        }
        return;
    }
    var_f4fb517b368c5e9b = 0;
    if (!istrue(level.br_prematchstarted)) {
        var_f4fb517b368c5e9b = 1;
        thread giveprematchloadout();
        if (!namespace_71073fa38f11492::isfeaturedisabled("armor")) {
            thread function_50434e55c7907057();
        }
        giveperk("specialty_pistoldraw");
        if (!istrue(self.prematchplayedwelcomevo)) {
            self.prematchplayedwelcomevo = 1;
            if (getsubgametype() != "dmz" && getsubgametype() != "exgm") {
                delaythread(1, &namespace_d3d40f75bb4e4c32::brleaderdialogplayer, "prematch_enter", self);
                if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
                    br_lobby_intro = function_17ee301cf0b5ba85("br_lobby_intro");
                    self setplayermusicstate(br_lobby_intro);
                }
            }
        }
        level waittill("infils_ready");
        if (level.allowsupers) {
            namespace_85d036cb78063c4a::clearsuper(0);
        }
    }
    if (istrue(level.var_376762409014cc8e)) {
        br_ammo_player_clear();
    }
    var_9e83064e74fa428c = istrue(self.gulag) || namespace_d3d40f75bb4e4c32::istutorial() || istrue(self.respawningbr) || istrue(level.var_faec6e12b831873d) && !istrue(self.var_908f8ac4bbcdb65e) || namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73();
    var_f7e8a863407717b3 = istrue(var_f4fb517b368c5e9b);
    namespace_cb965d2f71fefddc::resetplayerinventory(var_9e83064e74fa428c, var_f7e8a863407717b3);
    if (!istrue(var_f4fb517b368c5e9b) && !istrue(self.gulag) && !namespace_71073fa38f11492::isfeaturedisabled("armor")) {
        thread function_50434e55c7907057();
    }
    if (isdefined(level.var_f38e7b13448998b4)) {
        self thread [[ level.var_f38e7b13448998b4 ]]();
    }
    givelaststandifneeded(self);
    /#
        if (getdvarint(@"hash_f66218d4c610a345", 0) > 0) {
            if (!istrue(level.usegulag)) {
                level.gulag = spawnstruct();
                namespace_47fd1e79a44628cd::gulaggesturesinit();
            }
            thread namespace_47fd1e79a44628cd::playergulaggestures();
        }
    #/
    if (istrue(self.isrespawn)) {
        return;
    }
    if (istrue(self.gulag) || istrue(self.respawningbr)) {
        return;
    }
    if (getsubgametype() == "dmz" || getsubgametype() == "exgm") {
        return;
    }
    if (!istrue(level.br_infils_disabled) && !istrue(self.latetoinfil)) {
        thread setplayerprematchallows();
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb835
// Size: 0x2d
function onplayerscore(event, player, points, victim, var_7ec7671a1e0c788f) {
    return points;
}

// Namespace br/namespace_d20f8ef223912e12
// Params b, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb86a
// Size: 0x647
function brmodifyplayerdamage(einflictor, victim, eattacker, idamage, smeansofdeath, objweapon, vpoint, vdir, shitloc, idflags, var_be4285b26ed99ab1) {
    if (namespace_36f464722d326bbe::function_b2c4b42f9236924()) {
        idamage = namespace_3e725f3cc58bddd3::gamemodemodifyplayerdamage(einflictor, victim, eattacker, idamage, smeansofdeath, objweapon, vpoint, vdir, shitloc, idflags, var_be4285b26ed99ab1);
    }
    if (isdefined(eattacker) && istrue(eattacker.var_6c66afbc7f2ce4b0)) {
        var_38d7ad5b3efce8c9 = getdvarfloat(@"hash_fdf0ec912bf92434", 49);
        idamage = min(var_38d7ad5b3efce8c9, idamage);
    }
    if (isdefined(eattacker) && isagent(eattacker) && isdefined(eattacker.agent_type) && issubstr(eattacker.agent_type, "rusher") && smeansofdeath == "MOD_MELEE") {
        idamage = min(idamage, getdvarint(@"hash_22b45420bf5f62c5", 30));
        var_be4285b26ed99ab1 = idamage;
    }
    if (victim isplayeringulag() && isdefined(eattacker) && isagent(eattacker) && isdefined(eattacker.agent_type) && issubstr(eattacker.agent_type, "baton")) {
        switch (smeansofdeath) {
        case #"hash_61e42661ac27b9f2":
            return idamage;
        case #"hash_17b830a6c297d440":
            return idamage;
            break;
        }
    }
    if ((namespace_36f464722d326bbe::function_ba5574c7f287c587() || namespace_36f464722d326bbe::function_6493ec89ae923684()) && isbot(eattacker) && eattacker isplayeringulag() && istrue(eattacker.gulagarena)) {
        damagedata = namespace_169cd7a8fbc76ee5::packdamagedata(eattacker, victim, idamage, objweapon, smeansofdeath, einflictor, vpoint, vdir);
        damagedata.shitloc = shitloc;
        idamage = thread namespace_bc2665cbe6cf4e1f::function_92a85a0dda6ca085(damagedata);
        return idamage;
    }
    if (victim isplayeringulag() && istrue(victim.gulagarena) && getdvarint(@"hash_af4f48da15fd9ba1", 1)) {
        return idamage;
    }
    if (!isdefined(var_be4285b26ed99ab1)) {
        var_be4285b26ed99ab1 = idamage;
    }
    if (idamage > 0) {
        if (!victim _hasperk("specialty_outlander")) {
            if (istrue(victim.insertingarmorplate) && (!victim namespace_169cd7a8fbc76ee5::function_cb9ba92488b23c5(objweapon) || getdvarint(@"hash_22aa9e2b2bd6a191", 0) == 1)) {
                victim notify("try_armor_cancel", "damage_received");
            }
        }
        if (namespace_3f0ea7483345a2c0::function_6f45e7311f77eac4(victim) && !namespace_169cd7a8fbc76ee5::function_cb9ba92488b23c5(objweapon) && !namespace_3f0ea7483345a2c0::function_73d8c72e055e8640(victim)) {
            victim notify("close_container");
        }
        var_49e6ef3edadd524e = getweaponrootname(objweapon);
        var_5c3f9357f11d2223 = getweaponbasenamescript(objweapon);
        weapontype = weaponclass(objweapon);
        if (smeansofdeath == "MOD_FALLING") {
            if (isdefined(level.modifybrfalldamage)) {
                idamage = victim [[ level.modifybrfalldamage ]](idamage);
            } else {
                if (victim namespace_a2f809133c566621::isjuggernaut()) {
                    goto LOC_0000037d;
                }
                if (getdvarint(@"hash_69f152910149bc10", 0)) {
                    if (victim isskydiving()) {
                        victim skydive_interrupt();
                    }
                    idamage = 0;
                LOC_0000037d:
                }
            LOC_0000037d:
            }
        LOC_0000037d:
        } else if (isdefined(einflictor) && einflictor namespace_1f188a13f7e79610::isvehicle()) {
            if (isdefined(level.modifybrvehicledamage)) {
                idamage = victim [[ level.modifybrvehicledamage ]](idamage);
            }
        } else {
            if (var_49e6ef3edadd524e == "iw9_dm_crossbow" && smeansofdeath != "MOD_PISTOL_BULLET") {
                goto LOC_000004c7;
            }
            if (smeansofdeath == "MOD_MELEE") {
                idamage = int(var_be4285b26ed99ab1);
            } else if (namespace_e0ee43ef2dddadaa::iskillstreakweapon(objweapon)) {
                if (istrue(victim.inlaststand) && namespace_a2f809133c566621::getkillstreaknamefromweapon(objweapon) == "precision_airstrike") {
                    if (isdefined(victim.brdownedbyairstriketime)) {
                        var_30f68af7e399b74d = gettime() - victim.brdownedbyairstriketime < 5000;
                        if (var_30f68af7e399b74d) {
                            idamage = 0;
                        }
                    }
                }
            } else if (getdvarint(@"hash_ad67cf67992fe5f2", 0) && smeansofdeath != "MOD_TRIGGER_HURT") {
                idamage = brclampdamagealtmodegg(idflags, weapontype, var_49e6ef3edadd524e, shitloc, idamage);
            } else if (istrue(level.var_f561fc43a226dae4) && !victim namespace_f8d3520d3483c1::hasarmor() && getdvarint(@"hash_6b68c911dbd04fd2", istrue(level.clampstepbulletdamage)) && smeansofdeath != "MOD_TRIGGER_HURT") {
                idamage = brclampdamage(idflags, weapontype, var_49e6ef3edadd524e, shitloc, var_be4285b26ed99ab1, idamage, objweapon, smeansofdeath);
            LOC_000004c7:
            }
        LOC_000004c7:
        }
    LOC_000004c7:
        if (brgulagdamagefilter(victim)) {
            if (var_49e6ef3edadd524e != "rock_mp") {
                idamage = 0;
                if (isdefined(eattacker)) {
                    eattacker updatedamagefeedback("standard", 0, 0, "standard", 0);
                }
            } else {
                idamage = 1;
            }
            if (victim.health - idamage <= 0) {
                idamage = 0;
            }
        }
        if (isdefined(einflictor) && getdvarint(@"hash_69f152910149bc10", 0)) {
            if (function_f7f3032369f275c6(smeansofdeath)) {
                damagescale = getdvarfloat(@"hash_d4f0bbe5df7312cc", 0.1);
                if (isdefined(eattacker) && eattacker == victim) {
                    damagescale = 0;
                }
                idamage = int(idamage * damagescale);
                victim thread br_alt_mode_impulse_player(einflictor);
            }
        }
        if (namespace_71073fa38f11492::isbrgametypefuncdefined("modifyPlayerDamage")) {
            damagedata = namespace_169cd7a8fbc76ee5::packdamagedata(eattacker, victim, idamage, objweapon, smeansofdeath, einflictor, vpoint, vdir);
            damagedata.shitloc = shitloc;
            idamage = thread namespace_71073fa38f11492::runbrgametypefunc("modifyPlayerDamage", damagedata);
        }
        var_3e6c39a65d0cfc00 = function_f581838ce4328f7a(objweapon);
        if (isdefined(level.var_664eba510919348e) && isdefined(level.var_664eba510919348e[var_3e6c39a65d0cfc00])) {
            idamage = [[ level.var_664eba510919348e[var_3e6c39a65d0cfc00] ]](einflictor, victim, eattacker, idamage, smeansofdeath, objweapon, vpoint, vdir, shitloc, idflags, var_be4285b26ed99ab1);
        }
        if (namespace_36f464722d326bbe::function_6493ec89ae923684()) {
            damagedata = namespace_169cd7a8fbc76ee5::packdamagedata(eattacker, victim, idamage, objweapon, smeansofdeath, einflictor, vpoint, vdir);
            damagedata.shitloc = shitloc;
            idamage = thread namespace_bc2665cbe6cf4e1f::function_92a85a0dda6ca085(damagedata);
        }
    }
    return idamage;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbeb9
// Size: 0x32
function brmodifyvehicledamage(data) {
    if (namespace_71073fa38f11492::isbrgametypefuncdefined("modifyVehicleDamage")) {
        return namespace_71073fa38f11492::runbrgametypefunc("modifyVehicleDamage", data);
    }
    return data.damage;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbef3
// Size: 0x28
function modeallowmeleevehicledamage(data) {
    if (namespace_71073fa38f11492::isbrgametypefuncdefined("allowMeleeVehicleDamage")) {
        return namespace_71073fa38f11492::runbrgametypefunc("allowMeleeVehicleDamage", data);
    }
    return 0;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf23
// Size: 0x28
function modeignorevehicleexplosivedamage(data) {
    if (namespace_71073fa38f11492::isbrgametypefuncdefined("ignoreVehicleExplosiveDamage")) {
        return namespace_71073fa38f11492::runbrgametypefunc("ignoreVehicleExplosiveDamage", data);
    }
    return 0;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf53
// Size: 0x1d4
function function_9e34d99a98d2ff67(player, mover) {
    if (isdefined(mover) && istrue(mover.var_c23ca3472233553d)) {
        function_5357c1261661e9e4(mover, player, 75, -75);
        return 1;
    }
    if (isnavmeshloaded() && (!isdefined(mover.var_db03bf8e1712fd09) || mover.var_db03bf8e1712fd09)) {
        var_9077c073def296aa = undefined;
        if (isdefined(mover)) {
            var_9077c073def296aa = getclosestpointonnavmesh(mover.origin);
            if (isdefined(var_9077c073def296aa)) {
                var_bf5b3f9ea7746ac0 = var_9077c073def296aa + (0, 0, 5);
                endpos = playerphysicstrace(var_9077c073def296aa, var_bf5b3f9ea7746ac0);
                if (endpos != var_bf5b3f9ea7746ac0) {
                    var_9077c073def296aa = undefined;
                }
            }
        }
        if (!isdefined(var_9077c073def296aa)) {
            groundorigin = namespace_d3d40f75bb4e4c32::droptogroundmultitrace(player.origin, 30);
            var_9077c073def296aa = getclosestpointonnavmesh(groundorigin);
        }
        if (isdefined(var_9077c073def296aa) && isdefined(mover) && istrue(mover.var_5395a5cca02eae60)) {
            var_705a4bb89f63d4c4 = [];
            if (isdefined(mover.var_705a4bb89f63d4c4) && isarray(mover.var_705a4bb89f63d4c4)) {
                var_705a4bb89f63d4c4 = mover.var_705a4bb89f63d4c4;
            }
            contents = namespace_2a184fc4902783dc::create_contents(1, 1, 1, 1, 1, 1);
            trace = namespace_2a184fc4902783dc::ray_trace(player gettagorigin("tag_eye"), var_9077c073def296aa, array_add(var_705a4bb89f63d4c4, mover), contents);
            if (isdefined(trace["hittype"]) && trace["hittype"] != "hittype_none" || !canspawn(var_9077c073def296aa)) {
                var_9077c073def296aa = undefined;
            }
        }
        if (isdefined(var_9077c073def296aa)) {
            player setorigin(var_9077c073def296aa);
            return 1;
        }
    }
    return 0;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc12f
// Size: 0x212
function br_alt_mode_impulse_player(einflictor) {
    var_aa2fc3cc3a2bcf35 = (self.origin[0], self.origin[1], self.origin[2] + 36);
    if (self isonground()) {
        tracestart = self.origin + (0, 0, 18);
        traceend = self.origin + (0, 0, 90);
        contents = namespace_2a184fc4902783dc::create_contents(0, 1, 0, 1, 1, 0, 1);
        var_868513209fa17242 = namespace_2a184fc4902783dc::capsule_trace_passed(tracestart, traceend, 12, 72, undefined, einflictor, contents);
        if (var_868513209fa17242) {
            neworigin = (self.origin[0], self.origin[1], self.origin[2] + 18);
            self setorigin(neworigin);
        }
    }
    vdir = var_aa2fc3cc3a2bcf35 - einflictor.origin;
    vdir = vectornormalize(vdir);
    var_22e9f9cf6e83c4d7 = getdvarfloat(@"hash_f904c89ec86aed27", 1300);
    minz = undefined;
    if (vdir[2] > -0.3) {
        minz = getdvarfloat(@"hash_1b50fa9f9d44136f", 600);
    }
    explosiondist = distance2d(einflictor.origin, self.origin) - 20;
    var_808b4caff75e3e3d = clamp(explosiondist, 0, 80) / 100 * 0.5;
    var_1b5b75666fa5b0f0 = 1;
    scalar = var_1b5b75666fa5b0f0 - var_808b4caff75e3e3d;
    vdir = vdir * var_22e9f9cf6e83c4d7 * scalar;
    if (isdefined(minz)) {
        var_2a3d8284e254788f = var_1b5b75666fa5b0f0 - var_808b4caff75e3e3d * 0.5;
        minz = minz * var_2a3d8284e254788f;
        vdir = (vdir[0], vdir[1], max(minz, vdir[2]));
    }
    self setvelocity(vdir);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc348
// Size: 0x170
function function_f7f3032369f275c6(smeansofdeath) {
    var_8b3a4b8aafa9740 = !isdefined(level.var_6bfb61f13a7d6a4);
    /#
        var_8b3a4b8aafa9740 = var_8b3a4b8aafa9740 || getdvarint(@"hash_dacba2db6c050591", 0);
    #/
    if (var_8b3a4b8aafa9740) {
        /#
            setdvar(@"hash_dacba2db6c050591", 0);
        #/
        if (getdvarint(@"hash_33ac50155c7ef8f8", 0)) {
            var_d6cf0029db971fe9 = [0:"MOD_EXPLOSIVE_BULLET", 1:"MOD_GRENADE", 2:"MOD_GRENADE_SPLASH", 3:"MOD_PROJECTILE", 4:"MOD_PROJECTILE_SPLASH", 5:"MOD_EXPLOSIVE", 6:"MOD_IMPACT", 7:"MOD_FIRE", 8:"MOD_FIRE_BULLET"];
            level.var_6bfb61f13a7d6a4 = [];
            for (i = 0; i < var_d6cf0029db971fe9.size; i++) {
                var_1e11f8621108597d = function_2ef675c13ca1c4af(@"hash_69cfaef4362b6a26", tolower(var_d6cf0029db971fe9[i]));
                if (getdvarint(var_1e11f8621108597d)) {
                    level.var_6bfb61f13a7d6a4[level.var_6bfb61f13a7d6a4.size] = var_d6cf0029db971fe9[i];
                }
            }
        } else {
            level.var_6bfb61f13a7d6a4 = [0:"MOD_EXPLOSIVE", 1:"MOD_EXPLOSIVE_BULLET", 2:"MOD_GRENADE_SPLASH", 3:"MOD_PROJECTILE_SPLASH", 4:"MOD_FIRE"];
        }
    }
    return array_contains(level.var_6bfb61f13a7d6a4, smeansofdeath);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc4c0
// Size: 0xca
function brclampdamagealtmodegg(idflags, weapontype, var_49e6ef3edadd524e, shitloc, idamage) {
    if (isdefined(idflags) && idflags & 8) {
        var_1646fe11681a5388 = 1;
    } else {
        var_1646fe11681a5388 = 0;
    }
    if (!var_1646fe11681a5388) {
        switch (weapontype) {
        case #"hash_719417cb1de832b6":
            if (var_49e6ef3edadd524e == "iw8_pi_decho" || var_49e6ef3edadd524e == "iw8_pi_cpapa") {
                if (shitloc == "head" || shitloc == "helmet") {
                    idamage = 250;
                } else {
                    idamage = 150;
                }
            }
            break;
        case #"hash_6191aaef9f922f96":
            if (var_49e6ef3edadd524e == "iw9_dm_crossbow") {
                idamage = 250;
            }
            break;
        default:
            break;
        }
    }
    return idamage;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc592
// Size: 0x16
function isbulletpenetration(idflags) {
    return isdefined(idflags) && idflags & 8;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc5b0
// Size: 0x3f
function issnipersemi(var_49e6ef3edadd524e) {
    return var_49e6ef3edadd524e == "iw8_sn_delta" || var_49e6ef3edadd524e == "iw8_sn_golf28" || var_49e6ef3edadd524e == "iw8_sn_mike14" || var_49e6ef3edadd524e == "iw8_sn_sbeta" || var_49e6ef3edadd524e == "iw8_sn_sksierra";
}

// Namespace br/namespace_d20f8ef223912e12
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc5f7
// Size: 0x36
function isxmike109explosivedamage(var_49e6ef3edadd524e, smeansofdeath, idamage) {
    return var_49e6ef3edadd524e == "iw8_sn_xmike109" && smeansofdeath == "MOD_PISTOL_BULLET" && idamage == 1;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc635
// Size: 0x2ca
function brclampdamage(idflags, weapontype, var_49e6ef3edadd524e, shitloc, var_be4285b26ed99ab1, idamage, objweapon, smeansofdeath) {
    var_1646fe11681a5388 = isbulletpenetration(idflags);
    if (!var_1646fe11681a5388) {
        switch (weapontype) {
        case #"hash_8cdaf2e4ecfe5b51":
            scaler = idamage / var_be4285b26ed99ab1;
            if (getweaponammopoolname(objweapon) == %"hash_6aa606a18241ad16") {
                if (level.var_22db86fd48fee384 >= 0) {
                    scaler = idamage / var_be4285b26ed99ab1;
                    idamage = min(idamage, level.var_22db86fd48fee384);
                    idamage = int(scaler * idamage);
                }
                break;
            }
            if (var_49e6ef3edadd524e == "iw8_ar_falpha") {
                var_6e367c2ab8a94b0d = 1;
            } else {
                var_6e367c2ab8a94b0d = level.clampstepbulletdamage;
            }
            idamage = brclampstepdamage(var_be4285b26ed99ab1, objweapon, var_6e367c2ab8a94b0d);
            idamage = int(scaler * idamage);
            break;
        case #"hash_719417cb1de832b6":
        case #"hash_fa24dff6bd60a12d":
            scaler = idamage / var_be4285b26ed99ab1;
            idamage = brclampstepdamage(var_be4285b26ed99ab1, objweapon, level.clampstepbulletdamage);
            idamage = int(scaler * idamage);
            break;
        case #"hash_6191aaef9f922f96":
            if (shitloc == "head" || shitloc == "helmet") {
                if (isxmike109explosivedamage(var_49e6ef3edadd524e, smeansofdeath, idamage)) {
                    idamage = 75;
                } else if (issnipersemi(var_49e6ef3edadd524e)) {
                    idamage = 175;
                } else {
                    idamage = 250;
                }
            } else if (isxmike109explosivedamage(var_49e6ef3edadd524e, smeansofdeath, idamage)) {
                return idamage;
            } else if (var_49e6ef3edadd524e == "iw9_dm_crossbow") {
                idamage = 200;
            } else {
                scaler = idamage / var_be4285b26ed99ab1;
                if (issnipersemi(var_49e6ef3edadd524e)) {
                    var_5439fcc28091b721 = 1;
                } else {
                    var_5439fcc28091b721 = level.clampstepbulletdamage;
                }
                idamage = brclampstepdamage(var_be4285b26ed99ab1, objweapon, var_5439fcc28091b721);
                idamage = int(scaler * idamage);
            }
            break;
        case #"hash_900cb96c552c5e8e":
            scaler = idamage / var_be4285b26ed99ab1;
            idamage = brclampstepdamage(var_be4285b26ed99ab1, objweapon, 3);
            idamage = int(scaler * idamage);
            break;
        case #"hash_690c0d6a821b42e":
            jumpiffalse(level.br_pelletmaxdamage >= 0) LOC_0000026c;
            if ((var_49e6ef3edadd524e == "iw8_sh_oscar12" || var_49e6ef3edadd524e == "iw8_sh_aalpha12") && level.var_2caca637693d024d >= 0) {
                var_65a460bbd41d8d09 = level.var_2caca637693d024d;
            } else {
                var_65a460bbd41d8d09 = level.br_pelletmaxdamage;
            }
            scaler = idamage / var_be4285b26ed99ab1;
            idamage = min(idamage, var_65a460bbd41d8d09);
            idamage = int(scaler * idamage);
        default:
        LOC_0000026c:
            break;
        }
    }
    return idamage;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc907
// Size: 0x28
function brgulagdamagefilter(player) {
    return istrue(player.gulag) && !istrue(player.gulagarena);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc937
// Size: 0x9b
function brclampstepdamage(var_be4285b26ed99ab1, weapon, var_4efcc1874038117a) {
    var_e7ec701163e1b30c = 0;
    if (var_4efcc1874038117a == 4) {
        var_e7ec701163e1b30c = weapon getmid3damage();
    } else if (var_4efcc1874038117a == 3) {
        var_e7ec701163e1b30c = weapon getmid2damage();
    } else if (var_4efcc1874038117a == 2) {
        var_e7ec701163e1b30c = weapon getmid1damage();
    }
    if (var_e7ec701163e1b30c <= 0) {
        var_e7ec701163e1b30c = weapon.mindamage;
    }
    if (var_4efcc1874038117a == 1 || var_e7ec701163e1b30c <= 0) {
        var_e7ec701163e1b30c = weapon.maxdamage;
    }
    if (var_be4285b26ed99ab1 < var_e7ec701163e1b30c) {
        return int(var_e7ec701163e1b30c);
    } else {
        return var_be4285b26ed99ab1;
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 15, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc9d9
// Size: 0x2c3
function onplayerdamaged(einflictor, eattacker, victim, idamage, idflags, smeansofdeath, objweapon, var_fcdf19e3cdd29669, vpoint, vdir, shitloc, psoffsettime, modelindex, partname, var_1da1a66b5c6a06a7) {
    damagedata = namespace_169cd7a8fbc76ee5::packdamagedata(eattacker, victim, idamage, objweapon, smeansofdeath, einflictor, vpoint, vdir, var_1da1a66b5c6a06a7);
    damagedata.shitloc = shitloc;
    if (namespace_71073fa38f11492::isbrgametypefuncdefined("onPlayerDamaged")) {
        namespace_71073fa38f11492::runbrgametypefunc("onPlayerDamaged", damagedata);
    }
    if (istrue(victim.gulag)) {
        arena = namespace_ad49798629176e96::function_2f4344abdc200e43(victim);
        if (isdefined(arena)) {
            if (!isdefined(victim.var_3a7c9a3e9aa20358)) {
                victim.var_3a7c9a3e9aa20358 = 0;
            }
            victim.var_3a7c9a3e9aa20358 = victim.var_3a7c9a3e9aa20358 + idamage;
        }
    }
    if (isdefined(eattacker) && eattacker != victim && isplayer(eattacker)) {
        if (idamage >= var_fcdf19e3cdd29669) {
            idamage = var_fcdf19e3cdd29669;
        }
        if (idamage > 0) {
            victim namespace_88bfae359020fdd3::function_d0ccb374806fe494();
            var_5c3f9357f11d2223 = getweaponbasenamescript(objweapon);
            if (var_5c3f9357f11d2223 == "rock_mp" && isalive(victim)) {
                victim playlocalsound("br_gulag_rock_player_impact");
            }
        }
        eattacker namespace_d3d40f75bb4e4c32::updatebrscoreboardstat("damageDealt", eattacker namespace_3c5a4254f2b957ea::getpersstat("damage"));
    } else if (isdefined(einflictor) && einflictor namespace_1f188a13f7e79610::isvehicle()) {
        vehicle = einflictor;
        if (isdefined(vehicle.owner) && isplayer(vehicle.owner) && vehicle.owner != victim) {
            victim namespace_88bfae359020fdd3::function_d0ccb374806fe494();
            vehicle.owner namespace_d3d40f75bb4e4c32::updatebrscoreboardstat("damageDealt", vehicle.owner namespace_3c5a4254f2b957ea::getpersstat("damage"));
        }
    } else if (isdefined(eattacker) && eattacker != victim && isagent(eattacker)) {
        victim namespace_88bfae359020fdd3::function_d0ccb374806fe494();
    }
    if (isdefined(objweapon) && namespace_e0ee43ef2dddadaa::iskillstreakweapon(objweapon)) {
        var_8fcd15f752798a79 = idamage >= var_fcdf19e3cdd29669 && namespace_a2f809133c566621::getkillstreaknamefromweapon(objweapon) == "precision_airstrike";
        var_d3837504f686b986 = istrue(victim.inlaststand);
        if (var_8fcd15f752798a79 && var_d3837504f686b986) {
            victim.brdownedbyairstriketime = gettime();
        }
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcca3
// Size: 0x27a
function onnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    if (!istrue(level.br_prematchstarted)) {
        return;
    }
    namespace_310ba947928891df::oncommonnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon);
    if (victim isswimming()) {
        function_3eb5723089c90994(victim);
    } else {
        victim.var_60d0a5246848ae8c = 0;
    }
    if (getsubgametype() == "dmz" || getsubgametype() == "exgm" || getsubgametype() == "plunder" || getsubgametype() == "risk" || getsubgametype() == "kingslayer" || getsubgametype() == "rumble_mgl" || getsubgametype() == "champion") {
        return;
    }
    var_677ae66df2125f53 = getlivingplayers();
    if (isdefined(level.numendgame)) {
        if (var_677ae66df2125f53.size <= level.numendgame) {
            level thread startendgame(1);
        }
    }
    var_bedb769cc0e5e018 = level.totalplayers - var_677ae66df2125f53.size;
    highestscore = 0;
    foreach (player in level.players) {
        if (isdefined(player.score) && player.score > highestscore) {
            highestscore = player.score;
        }
        if (isdefined(player.petwatch) && isalive(player)) {
            var_b85f94bb6cbb1d8c = 1 - var_bedb769cc0e5e018 / level.totalplayers;
            player namespace_74465391b3cf76b::tryupdategenericprogress(var_b85f94bb6cbb1d8c, 5);
        }
    }
    if (!level.teambased) {
        victim.score = level.totalplayers - var_677ae66df2125f53.size;
        foreach (player in var_677ae66df2125f53) {
            player.score = victim.score + 1;
        }
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcf24
// Size: 0x171
function getalivecount(var_d50ae4dc9841fd21) {
    var_1f7bcaa53ca6d399 = 0;
    if (istrue(var_d50ae4dc9841fd21)) {
        foreach (entry in level.teamnamelist) {
            var_1f7bcaa53ca6d399 = var_1f7bcaa53ca6d399 + getteamdata(entry, "aliveCount");
        }
    } else {
        foreach (entry in level.teamnamelist) {
            alivecount = getteamdata(entry, "aliveCount");
            if (alivecount) {
                aliveplayers = getteamdata(entry, "alivePlayers");
                foreach (player in aliveplayers) {
                    if (isdefined(player) && !istrue(player.gulag) && !player function_7dbb8165d792b06c()) {
                        var_1f7bcaa53ca6d399 = var_1f7bcaa53ca6d399 + 1;
                    }
                }
            }
        }
    }
    var_1f7bcaa53ca6d399 = var_1f7bcaa53ca6d399 + function_1bbd21d289ba8a92();
    return var_1f7bcaa53ca6d399;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd09d
// Size: 0xe8
function doplayerkilledsplashes(victim, attacker) {
    if (istrue(level.usegulag) && victim namespace_d3d40f75bb4e4c32::isplayeringulag()) {
        return;
    }
    if (getsubgametype() == "rumble_mgl") {
        teammates = function_3d0f2343793d709b(victim.team, victim.var_ff97225579de16a, 1);
    } else {
        teammates = level.teamdata[victim.team]["alivePlayers"];
    }
    foreach (teammate in teammates) {
        if (!isdefined(teammate)) {
            continue;
        }
        if (teammate != victim) {
            teammate thread namespace_44abc05161e2e2cb::showsplash("br_teammate_dead", undefined, victim);
        }
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd18c
// Size: 0x5c
function shutdowngulagforalivecount() {
    if (istrue(level.usegulag) && !istrue(level.gulag.shutdown)) {
        count = getalivecount(0);
        if (count <= getdvarint(@"hash_2665fc757a822eb2", -1)) {
            namespace_47fd1e79a44628cd::shutdowngulag("player_count", count);
        }
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd1ef
// Size: 0x180
function onplayerdisconnect(player) {
    if (!namespace_71073fa38f11492::isfeaturedisabled("teamSpectate")) {
        if (!istrue(player.var_632bad3edb4e449e)) {
            namespace_a9c534dc7832aba4::migratespectators(player, undefined, 0);
        }
    }
    if (istrue(level.br_prematchstarted)) {
        shutdowngulagforalivecount();
        namespace_47fd1e79a44628cd::onplayerdisconnect(player);
        var_c2416b3bcaf44892 = isdefined(player) && istrue(player.inlaststand) && !player function_7dbb8165d792b06c() && istrue(level.var_8a854ec031bb41f1) && !istrue(player.var_ded04cdd264a7e00);
        if (var_c2416b3bcaf44892) {
            if (namespace_aead94004cf4c147::function_720d227d0e55a960()) {
                namespace_85cd45b4fe0d86fb::function_f6d685cabfad2ce9(player, player.laststandattacker);
            }
            if (isdefined(player.laststandattacker)) {
                player.laststandattacker namespace_3e725f3cc58bddd3::playerincrementscoreboardkills();
            }
        }
    }
    namespace_a011fbf6d93f25e5::branalytics_disconnect(player, int(isreallyalive(player)));
    if (namespace_71073fa38f11492::isbrgametypefuncdefined("onPlayerDisconnect")) {
        namespace_71073fa38f11492::runbrgametypefunc("onPlayerDisconnect", player);
    }
    level thread updateplayerandteamcountui();
    namespace_8bbc300af6d3c2fb::onplayerdisconnect(player);
    if (istrue(level.var_8a854ec031bb41f1) && istrue(level.br_prematchstarted) && !istrue(player.var_3dad98a9e686fb) && isreallyalive(player) && getsubgametype() != "dmz" && !(namespace_36f464722d326bbe::function_6910a4c65560c44b() && isbot(player))) {
        player namespace_cb965d2f71fefddc::droponplayerdeath();
    }
    namespace_6c622b52017c6808::function_601137842b64c899(player);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd376
// Size: 0x1ed
function function_c11d61293d7e8ba(player) {
    if (isdefined(player) && player.team != "codcaster") {
        var_b0c33d224b825287 = getenemyteams(player.team);
        var_a9ceb9b39c78fb07 = [];
        foreach (entry in var_b0c33d224b825287) {
            UIBotCount = function_d0f9fbf3f0f8c739(entry);
            if (getteamdata(entry, "aliveCount") || UIBotCount > 0) {
                var_a9ceb9b39c78fb07[var_a9ceb9b39c78fb07.size] = entry;
            }
        }
        teamplacement = var_a9ceb9b39c78fb07.size + 1;
        if (namespace_4b0406965e556711::gameflag("prematch_done")) {
            if (!istrue(player.extracted)) {
                var_c01bbc6249a9748f = player calculatebrbonusxp(teamplacement, player.team);
                var_d6a23fdabd1d282c = var_c01bbc6249a9748f[2];
                var_1b70c48b930405f0 = var_c01bbc6249a9748f[1];
                var_b5d67493fb854f58 = var_c01bbc6249a9748f[0];
                if (var_b5d67493fb854f58 > 0) {
                    player givebrbonusxp(var_b5d67493fb854f58, undefined, "disconnect");
                    player.matchbonus = var_1b70c48b930405f0;
                    player.placementbonus = var_d6a23fdabd1d282c;
                    if (issharedfuncdefined("seasonalevents", "getFieldRepEventActive")) {
                        if (function_f3bb4f4911a1beb2("seasonalevents", "getFieldRepEventActive")) {
                            function_3f2ab7272697e5b8(player);
                        }
                    }
                }
                player setplacementstats(teamplacement);
                player stopchallengetimers();
                namespace_d576b6dc7cef9c62::_setplayerteamrank(player, teamplacement);
                updateclientmatchdata(player);
            }
            if (isdefined(level.var_c3edd7b8c279a3e)) {
                player thread [[ level.var_c3edd7b8c279a3e ]]();
            }
        }
        player thread handlebrdefeatedpostgamestate(teamplacement);
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd56a
// Size: 0xe2
function function_ad8c1e6228a10058() {
    player = self;
    if (!level.var_318de67b5265b4c6) {
        return;
    }
    for (i = 0; i < namespace_aead94004cf4c147::function_b13e35608b336d65(player); i++) {
        var_eeeae9defa0c1e95 = player namespace_aead94004cf4c147::function_6196d9ea9a30e609(i);
        var_ff239359935aa777 = player namespace_aead94004cf4c147::function_897b29adb37f06a7(i);
        player setplayerdata(level.var_5d69837cf4db0407, level.var_201c841c4668a94f, i, "lootID", 1);
        player setplayerdata(level.var_5d69837cf4db0407, level.var_201c841c4668a94f, i, "quantity", 1);
        player setplayerdata(level.var_5d69837cf4db0407, level.var_201c841c4668a94f, i, "lootID", var_eeeae9defa0c1e95);
        player setplayerdata(level.var_5d69837cf4db0407, level.var_201c841c4668a94f, i, "quantity", var_ff239359935aa777);
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd653
// Size: 0x41
function updateclientmatchdata(player) {
    namespace_d576b6dc7cef9c62::processlobbydataforclient(player);
    namespace_633301c58b0b0cec::processcommonplayerdataforplayer(player);
    var_877e2fc32734dd14 = getdvarint(@"hash_1bc373211683e0b6", 0);
    if (var_877e2fc32734dd14) {
        player sendclientmatchdataforclient();
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd69b
// Size: 0x38d
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00) {
    if (istrue(level.br_prematchstarted)) {
        if (namespace_aead94004cf4c147::function_720d227d0e55a960()) {
            namespace_85cd45b4fe0d86fb::function_f6d685cabfad2ce9(self, attacker, objweapon);
        }
        if (smeansofdeath == "MOD_EXECUTION") {
            self.wasexecuted = 1;
        } else {
            self.wasexecuted = 0;
        }
        namespace_cb965d2f71fefddc::droponplayerdeath(attacker);
        doplayerkilledsplashes(self, attacker);
        shutdowngulagforalivecount();
        namespace_80cec6cfc70c4f95::function_8311407ea8b66f9a(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00);
    }
    namespace_cf880efca02c6010::onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, var_61b5d0250b328f00);
    if (istrue(attacker.gulag)) {
        if (namespace_eb17b46cdcb98eea::function_cfe304859f30e747("gulagOnPlayerKilled")) {
            namespace_eb17b46cdcb98eea::function_3cceb052d780fef1("gulagOnPlayerKilled", attacker);
        }
    }
    br_ammo_player_clear();
    var_d4b54dc4008c298c = self.lastdroppableweaponobj;
    var_d4b54dc4008c298c = mapweapon(var_d4b54dc4008c298c, einflictor);
    var_b2b6cafcdb2218d2 = getcompleteweaponname(var_d4b54dc4008c298c);
    if (isdefined(var_b2b6cafcdb2218d2)) {
        thread namespace_d576b6dc7cef9c62::trackleaderboarddeathstats(attacker, self, var_b2b6cafcdb2218d2, smeansofdeath);
        self.var_f08da114ffd85042 = self.lifeid;
    }
    namespace_cb965d2f71fefddc::resetplayerinventory(undefined, undefined, 1);
    onplayerscore("kill", attacker, 0, self);
    if (isdefined(self.laststandoutlineid)) {
        namespace_cbd3754a0c69cc63::outlinedisable(self.laststandoutlineid, self);
        self.laststandoutlineid = undefined;
    }
    namespace_92443376a63aa4bd::function_2ea4c1db39176769(attacker, self, smeansofdeath, idamage);
    var_642470e1abc1bbf9 = namespace_169cd7a8fbc76ee5::packdamagedata(attacker, self, idamage, objweapon, smeansofdeath, einflictor, undefined, vdir);
    if (namespace_71073fa38f11492::isbrgametypefuncdefined("onPlayerKilled")) {
        thread namespace_71073fa38f11492::runbrgametypefunc("onPlayerKilled", var_642470e1abc1bbf9);
    }
    if (!istrue(level.br_prematchstarted)) {
        namespace_c6ccccd95254983f::playerplunderlivelobbydropondeath(smeansofdeath);
        return;
    }
    if (istrue(level.var_c62d39d6e6afb119)) {
        if (getdvarint(@"hash_ec7375cc2a0ca633", 1)) {
            namespace_a011fbf6d93f25e5::function_4eb467c8f2a4c7ae(var_642470e1abc1bbf9);
        }
        thread namespace_d4eb7462ff000665::function_b2616afcad011728(var_642470e1abc1bbf9);
    }
    if (namespace_708f627020de59d3::function_c0d385a09d173a36()) {
        thread namespace_708f627020de59d3::onplayerkilled(attacker, self);
    }
    if (getdvarint(@"hash_82bde055b11e6698", 0)) {
        thread namespace_4bc0ead8d2af3d84::onplayerkilled(attacker, self);
    } else {
        thread namespace_1eb3c4e0e28fac71::onplayerkilled(attacker, self);
    }
    if (namespace_d3d40f75bb4e4c32::function_57244bfdbe157401()) {
        if (isdefined(level.wztrain_info) && isdefined(level.wztrain_info.var_d17ae48dc6e221d3)) {
            [[ level.wztrain_info.var_d17ae48dc6e221d3 ]](self, attacker, smeansofdeath);
        }
    }
    thread namespace_4f9f94245708410d::playerdied(attacker, objweapon);
    namespace_d3d40f75bb4e4c32::setplayerdownedextrainfo(0);
    namespace_d3d40f75bb4e4c32::setplayerbeingrevivedextrainfo(0);
    updatesquadmemberlaststandreviveprogress(self, self, 0, 1);
    if (istrue(self.inlaststand)) {
        if (isplayer(attacker)) {
            attacker incrementcleanupsstat();
        }
    }
    eliminated = namespace_71073fa38f11492::runbrgametypefunc("markPlayerAsEliminatedOnKilled");
    if (!isdefined(eliminated)) {
        eliminated = !istrue(level.usegulag);
    }
    if (eliminated) {
        namespace_80cec6cfc70c4f95::markplayeraseliminated(self, "onPlayerKilled");
    }
    if (namespace_d3d40f75bb4e4c32::isBrPracticeMode()) {
        if (isbot(self) && isplayer(attacker) && !istrue(attacker namespace_d3d40f75bb4e4c32::isplayeringulag())) {
            attacker notify("killed_enemy");
        }
    }
    level thread updateplayerandteamcountui();
    level notify("player_killed");
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xda2f
// Size: 0x4f
function incrementcleanupsstat() {
    player = self;
    if (!isdefined(player.br_cleanups)) {
        player.br_cleanups = 0;
    }
    player.br_cleanups++;
    player namespace_d3d40f75bb4e4c32::updatebrscoreboardstat("cleanups", player.br_cleanups);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xda85
// Size: 0x36
function registercrateforcleanup(crate) {
    level.br_pickups.crates[level.br_pickups.crates.size] = crate;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdac2
// Size: 0xc
function brloadoutcratefirstactivation(crate) {
    
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdad5
// Size: 0x10b
function makeitemsfromcrate(player) {
    cratedata = self.data;
    if (cratedata.type == "personal") {
        makepersonalweaponfromcrate(player);
        return;
    }
    if (cratedata.type == "weapon") {
        var_fac9c78fd161dd04 = randomintrange(2, 4);
        var_5a13070af1d88b0 = 6 - var_fac9c78fd161dd04;
    } else {
        var_fac9c78fd161dd04 = randomintrange(1, 2);
        var_5a13070af1d88b0 = 6 - var_fac9c78fd161dd04;
    }
    var_2891322c71ef74a8 = 0;
    for (i = 0; i < var_fac9c78fd161dd04 && var_2891322c71ef74a8 < level.br_pickups.br_dropoffsets.size; i++) {
        if (isdefined(namespace_d20f8ef223912e12::makeweaponfromcrate(var_2891322c71ef74a8))) {
            var_2891322c71ef74a8++;
        }
    }
    for (i = 0; i < var_5a13070af1d88b0 && var_2891322c71ef74a8 < level.br_pickups.br_dropoffsets.size; i++) {
        if (isdefined(namespace_d20f8ef223912e12::makeitemfromcrate(var_2891322c71ef74a8))) {
            var_2891322c71ef74a8++;
        }
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdbe7
// Size: 0xcb
function makeweaponfromcrate(var_2891322c71ef74a8) {
    var_5fba91f7c0fc9c89 = random(level.br_pickups.br_crateguns);
    fullweaponobj = getfullweaponobjforscriptablepartname(var_5fba91f7c0fc9c89);
    if (!isdefined(fullweaponobj)) {
        return;
    }
    groundpos = drop_to_ground(self.origin + level.br_pickups.br_dropoffsets[var_2891322c71ef74a8], 50, -200, (0, 0, 1)) + (0, 0, 24);
    weapon = createspawnweaponatpos(groundpos, (0, 0, 90), fullweaponobj);
    if (isdefined(weapon)) {
        weapon.isweaponfromcrate = 1;
    }
    return weapon;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdcba
// Size: 0xc0
function makeitemfromcrate(var_2891322c71ef74a8) {
    groundpos = drop_to_ground(self.origin + level.br_pickups.br_dropoffsets[var_2891322c71ef74a8], 50, -200, (0, 0, 1)) + (0, 0, 12);
    scriptablename = random(level.br_pickups.br_crateitems);
    itemname = scriptablename;
    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(groundpos, (0, 0, 90));
    pickupent = namespace_cb965d2f71fefddc::spawnpickup(itemname, var_cb4fad49263e20c4, 1);
    return pickupent;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdd82
// Size: 0xc4
function makepersonalweaponfromcrate(player) {
    cratedata = self.data;
    /#
        assert(isdefined(cratedata.personalweaponfullname));
    #/
    groundpos = drop_to_ground(self.origin + (0, 0, 6), 50, -200, (0, 0, 1)) + (0, 0, 24);
    weapon = createspawnweaponatposfromname(groundpos, cratedata.personalweaponfullname);
    if (isdefined(weapon)) {
        weapon.isweaponfromcrate = 1;
        player loadweaponsforplayer([0:cratedata.personalweaponfullname]);
    }
    return weapon;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xde4e
// Size: 0x204
function initloot() {
    level.br_weaponweights = [];
    level.br_weaponweights["iw8_ar_mike4"] = 20;
    level.br_weaponweights["iw8_sm_mpapa5"] = 40;
    level.br_weaponweights["iw8_sh_dpapa12"] = 40;
    level.br_weaponweights["iw8_la_gromeo"] = 30;
    level.br_weaponweights["iw8_lm_kilo121"] = 10;
    level.br_weaponweights["iw8_sn_alpha50"] = 10;
    level.br_weaponweights["iw8_knife"] = 5;
    level.br_weaponweights["iw8_pi_golf21"] = 50;
    level.br_weaponweights["iw8_ar_akilo47"] = 20;
    level.br_weaponweighttotal = 0;
    foreach (weight in level.br_weaponweights) {
        level.br_weaponweighttotal = level.br_weaponweighttotal + weight;
    }
    level.baseraritymap = [];
    level.baseraritymap["iw8_ar_mike4"] = 1;
    level.baseraritymap["iw8_ar_akilo47"] = 1;
    level.baseraritymap["iw8_sm_mpapa5"] = 1;
    level.baseraritymap["iw8_sh_dpapa12"] = 1;
    level.baseraritymap["iw8_la_gromeo"] = 1;
    level.baseraritymap["iw8_lm_kilo121"] = 1;
    level.baseraritymap["iw8_sn_alpha50"] = 3;
    level.baseraritymap["iw8_knife"] = 0;
    level.baseraritymap["iw8_pi_golf21"] = 0;
    level.attachraritymap = [];
    level.attachraritymap["holo"] = 1;
    level.attachraritymap["silencer"] = 2;
    level.attachraritymap["gl"] = 2;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xe059
// Size: 0xe5
function weaponlocallowed(loc, var_62fc582f58179b24) {
    foreach (l in var_62fc582f58179b24) {
        low = l.origin[2] - 24;
        high = l.origin[2] + 90 - 24;
        if (distance_2d_squared(l.origin, loc.origin) < 147456 && loc.origin[2] >= low && loc.origin[2] <= high) {
            return 0;
        }
    }
    return 1;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe146
// Size: 0x36
function startendgame(firsttime) {
    if (function_a587b0b0998c6d13()) {
        return;
    }
    namespace_d576b6dc7cef9c62::pausetimer();
    level.timepausestart = gettime();
    level.timelimitoverride = 1;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe183
// Size: 0x151
function debugtestcirclevfx(number) {
    if (isdefined(level.circleemitters)) {
        destroyemitters(level.circleemitters);
    }
    level notify("runDebugVFXCircleTest");
    waitframe();
    switch (number) {
    case 1:
        level thread rundebugvfxcircletest(1000, 0, 15, 2000);
        break;
    case 2:
        level thread rundebugvfxcircletest(2500, 1000, 20, 2000);
        break;
    case 3:
        level thread rundebugvfxcircletest(4500, 2500, 25, 2000);
        break;
    case 4:
        level thread rundebugvfxcircletest(7000, 4500, 40, 2000);
        break;
    case 5:
        level thread rundebugvfxcircletest(10500, 7000, 70, 2000);
        break;
    case 6:
        level thread rundebugvfxcircletest(15000, 10500, 80, 2000);
        break;
    case 7:
        level thread rundebugvfxcircletest(20000, 15000, 80, 2000);
        break;
    case 8:
        level thread rundebugvfxcircletest(50000, 20000, 80, 2000);
        break;
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe2db
// Size: 0x9a
function groundraycast(pos) {
    contents = namespace_2a184fc4902783dc::create_contents(0, 1, 0, 0, 1, 1);
    caststart = pos + (0, 0, 10000);
    castend = caststart + (0, 0, -20000);
    var_e021c2744cc7ed68 = physics_raycast(caststart, castend, contents, undefined, 0, "physicsquery_closest", 1);
    if (isdefined(var_e021c2744cc7ed68) && var_e021c2744cc7ed68.size > 0) {
        return var_e021c2744cc7ed68[0]["position"];
    }
    return (0, 0, 0);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe37d
// Size: 0xec
function debugplayercirclevfx() {
    while (1) {
        waitframe();
        if (!isdefined(level.circledebugpos) || !isdefined(level.circledebugradius)) {
            continue;
        }
        var_b1e1b0a993dbd52a = distance2d(self.origin, level.circledebugpos) < level.circledebugradius;
        if (istrue(self.debugcircleincircle)) {
            if (!var_b1e1b0a993dbd52a && level.debugcircleplayerfx == 0) {
                playfxontag(level._effect["vfx_gas_ring_player"], self, "tag_eye");
                level.debugcircleplayerfx = 1;
                self.debugcircleincircle = 0;
            }
        } else if (var_b1e1b0a993dbd52a && !self.debugcircleincircle) {
            self.debugcircleincircle = 1;
            stopfxontag(level._effect["vfx_gas_ring_player"], self, "tag_eye");
            level.debugcircleplayerfx = 0;
        }
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe470
// Size: 0x182
function rundebugvfxcircletest(startradius, var_15b8ff04c24c09f4, time, var_713a986ea7b77210) {
    level endon("game_ended");
    level endon("runDebugVFXCircleTest");
    if (!istrue(level.debugcircleplayerfx)) {
        level.players[0] thread debugplayercirclevfx();
    }
    respawntime = 5;
    groundpos = level.players[0] groundraycast(level.players[0].origin);
    level.circleemitters = spawnentsincircle(groundpos, startradius, var_713a986ea7b77210);
    level.circledebugpos = groundpos;
    wait(0.1);
    spawnvfxincircle(level.circleemitters);
    starttime = time;
    while (time > 0) {
        var_b1d0bc03029f6a2c = time / starttime;
        newradius = var_15b8ff04c24c09f4 + (startradius - var_15b8ff04c24c09f4) * var_b1d0bc03029f6a2c;
        if (respawntime < 0) {
            destroyemitters(level.circleemitters);
            if (newradius <= 0) {
                return;
            }
            level.circledebugradius = newradius;
            respawntime = 5;
            level.circleemitters = spawnentsincircle(groundpos, newradius, var_713a986ea7b77210);
            wait(0.1);
            spawnvfxincircle(level.circleemitters);
        } else {
            updateemitterpositions(groundpos, newradius, level.circleemitters);
        }
        time = time - level.framedurationseconds;
        respawntime = respawntime - level.framedurationseconds;
        waitframe();
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe5f9
// Size: 0x52
function destroyemitters(var_cee4e2853864526e) {
    for (i = 0; i < var_cee4e2853864526e.size; i++) {
        if (isdefined(var_cee4e2853864526e[i])) {
            stopfxontag(level._effect["vfx_gas_ring_puffy"], var_cee4e2853864526e[i], "tag_origin");
            var_cee4e2853864526e[i] delete();
        }
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe652
// Size: 0xd9
function updateemitterpositions(center, newradius, var_cee4e2853864526e) {
    count = var_cee4e2853864526e.size;
    var_eb2eeb8b58bfd8a0 = 6.2831 * newradius;
    var_44706ed8e238a53c = 360 / count;
    for (i = 0; i < count; i++) {
        angle = var_44706ed8e238a53c * i;
        y = sin(angle) * newradius;
        x = cos(angle) * newradius;
        groundpos = groundraycast(center + (x, y, 0));
        var_cee4e2853864526e[i].origin = groundpos;
        var_cee4e2853864526e[i].angles = (0, angle + 180, 0);
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe732
// Size: 0x14e
function spawnentsincircle(center, radius, var_713a986ea7b77210) {
    var_cee4e2853864526e = [];
    var_eb2eeb8b58bfd8a0 = 6.2831 * radius;
    steps = var_eb2eeb8b58bfd8a0 / var_713a986ea7b77210;
    if (steps < 200) {
        iprintlnbold("Using " + int(steps) + " emitters");
    } else {
        iprintlnbold("Can't use " + int(steps) + " emitters, using 200 instead");
    }
    steps = min(steps, 200);
    var_44706ed8e238a53c = 360 / steps;
    for (i = 0; i < steps; i++) {
        angle = var_44706ed8e238a53c * i;
        y = sin(angle) * radius;
        x = cos(angle) * radius;
        groundpos = groundraycast(center + (x, y, 0));
        var_cee4e2853864526e[i] = spawn("script_model", groundpos);
        var_cee4e2853864526e[i] setmodel("tag_origin");
        var_cee4e2853864526e[i].origin = groundpos;
        var_cee4e2853864526e[i].angles = (0, angle + 180, 0);
    }
    return var_cee4e2853864526e;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe888
// Size: 0x42
function spawnvfxincircle(var_cee4e2853864526e) {
    for (i = 0; i < var_cee4e2853864526e.size; i++) {
        playfxontag(level._effect["vfx_gas_ring_puffy"], var_cee4e2853864526e[i], "tag_origin");
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe8d1
// Size: 0x25
function ontimelimit() {
    if (isdefined(level.numendgame)) {
        level thread startendgame(1);
    }
    level.numendgame = undefined;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe8fd
// Size: 0x131
function onplayerjoinsquad(player) {
    if (!isdefined(player.team)) {
        namespace_9c840bb9f2ecbf00::demoforcesre("onPlayerJoinTeam: !IsDefined( player.team ) - " + player.name);
    }
    if (!isgameplayteam(player.team)) {
        namespace_9c840bb9f2ecbf00::demoforcesre("onPlayerJoinTeam: !isGameplayTeam( player.team ) - " + player.name + " " + player.team);
    }
    if (level.teambased) {
        squadleader = namespace_ca7b90256548aa40::getsquadleader(player.team, player.var_ff97225579de16a);
        if (!namespace_71073fa38f11492::isfeaturedisabled("squadLeader")) {
            if (namespace_9bb409deb69fb31d::function_3d93807e453d0770()) {
                teamplayers = namespace_54d20dd0dd79277f::getteamdata(player.team, "players");
                foreach (player in teamplayers) {
                    player setplayerbrsquadleader(squadleader == player);
                }
            } else {
                player setplayerbrsquadleader(squadleader == player);
            }
        }
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xea35
// Size: 0x2b
function onplayerjointeam(player) {
    if (getdvarint(@"hash_b2b6bc454af40904", 0)) {
        player.var_3f78c6a0862f9e25 = 0;
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xea67
// Size: 0x1e4
function ondeadevent(team) {
    if (istrue(level.br_debugsolotest) || getsubgametype() == "plunder" || getsubgametype() == "risk" || getsubgametype() == "kingslayer" || getsubgametype() == "rumble_mgl" || !function_227ca42a35b0398b(team)) {
        return;
    }
    if (namespace_eb17b46cdcb98eea::function_1980065ce4dc067b() && istrue(self.gulagarena)) {
        return;
    }
    if (istrue(namespace_71073fa38f11492::runbrgametypefunc("onDeadEvent", team))) {
        return;
    }
    if (getsubgametype() == "dmz") {
        shouldwait = namespace_51790b5acb47a506::function_1714ffea633dcfed(team);
        if (shouldwait) {
            return;
        }
    }
    if (isdefined(team)) {
        if (team != "all") {
            teamplayers = getteamdata(team, "players");
            foreach (player in teamplayers) {
                if (isdefined(player)) {
                    player thread namespace_80cec6cfc70c4f95::function_1b5da10393c9c50e(1);
                }
            }
            namespace_80cec6cfc70c4f95::function_def20f6aa082fcf5(team);
            thread onsquadeliminated(team);
            namespace_d576b6dc7cef9c62::default_ondeadevent(team);
        } else {
            level notify("all_players_dead");
            foreach (player in level.players) {
                if (player getclientomnvar("ui_league_play_br_leave_penalty_timer") > namespace_80cec6cfc70c4f95::function_b5b049c4b47cf929()) {
                    player thread namespace_80cec6cfc70c4f95::function_1b5da10393c9c50e(1);
                }
            }
        }
    }
    if (isdefined(level.var_44691e82f0c05d37) && isdefined(team)) {
        thread [[ level.var_44691e82f0c05d37 ]](team);
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xec52
// Size: 0x176
function function_99e3948bfd8a99b8(team) {
    if ((namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73() || namespace_36f464722d326bbe::function_6910a4c65560c44b()) && isdefined(level.var_7b37b2193f163b9b)) {
        players = getteamdata(team, "players");
        alivecount = 0;
        foreach (player in players) {
            if (!istrue(player.br_iseliminated) && !player function_7dbb8165d792b06c()) {
                alivecount++;
            }
        }
        UIBotCount = function_d0f9fbf3f0f8c739(team);
        alivecount = alivecount + UIBotCount;
        return alivecount;
    } else if (namespace_eb17b46cdcb98eea::function_1980065ce4dc067b() && level.var_68c03dccce80d6f8) {
        alivecount = getteamdata(team, "aliveCount");
        players = getteamdata(team, "players");
        foreach (player in players) {
            if (!isalive(player) && istrue(player.gulagarena)) {
                alivecount++;
            }
        }
        return alivecount;
    } else {
        return getteamdata(team, "aliveCount");
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xedcf
// Size: 0x2c7
function function_50e7496b6d13c173(var_82de8fe11fd79526) {
    var_405ce5d0e4be823a = [];
    foreach (player in var_82de8fe11fd79526) {
        if (isdefined(player)) {
            var_405ce5d0e4be823a = function_6d6af8144a5131f1(var_405ce5d0e4be823a, player.team);
        }
    }
    var_a9ceb9b39c78fb07 = [];
    remainingplayers = 0;
    foreach (entry in level.teamnamelist) {
        if (array_contains(var_405ce5d0e4be823a, entry)) {
            continue;
        }
        var_849d01afb2fc0f0a = function_99e3948bfd8a99b8(entry);
        if (var_849d01afb2fc0f0a > 0) {
            var_a9ceb9b39c78fb07[var_a9ceb9b39c78fb07.size] = entry;
            remainingplayers = remainingplayers + var_849d01afb2fc0f0a;
        }
    }
    teamplacement = function_fc66f14c9b47443d(var_a9ceb9b39c78fb07.size);
    foreach (player in var_82de8fe11fd79526) {
        if (isdefined(player)) {
            var_c012c062499f5ead = player calculatebrbonusxp(teamplacement, player.team);
            var_d6a23fdabd1d282c = var_c012c062499f5ead[2];
            var_1b70c48b930405f0 = var_c012c062499f5ead[1];
            var_b5d67493fb854f58 = var_c012c062499f5ead[0];
            var_b01aca3236595958 = function_87ecb716bc207294(player);
            player givebrbonusxp(var_b5d67493fb854f58, undefined, "squadEliminated", var_b01aca3236595958);
            player.matchbonus = namespace_62c556437da28f50::function_c18c8bb0776284c6(var_1b70c48b930405f0, var_b01aca3236595958);
            player.placementbonus = namespace_62c556437da28f50::function_9e1336d25eb66326(var_d6a23fdabd1d282c, var_b01aca3236595958);
            if (issharedfuncdefined("seasonalevents", "getFieldRepEventActive")) {
                if (function_f3bb4f4911a1beb2("seasonalevents", "getFieldRepEventActive")) {
                    function_3f2ab7272697e5b8(player);
                }
            }
        }
    }
    foreach (player in var_82de8fe11fd79526) {
        if (isdefined(player)) {
            player thread handlebrdefeatedpostgamestate(teamplacement);
            player stopchallengetimers();
            namespace_d576b6dc7cef9c62::_setplayerteamrank(player, teamplacement);
            updateclientmatchdata(player);
            if (istrue(level.var_77907d733abe8b63)) {
                player namespace_2c7976a64ea24d6a::match_end(teamplacement, 0, 0);
            }
        }
    }
    setaardata(undefined, var_82de8fe11fd79526);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf09d
// Size: 0x10
function function_fc66f14c9b47443d(var_972e9e8fa4db479e) {
    return var_972e9e8fa4db479e + 1;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf0b5
// Size: 0x1f5
function onsquadeliminated(team) {
    var_a9ceb9b39c78fb07 = [];
    remainingplayers = 0;
    foreach (entry in level.teamnamelist) {
        if (entry == team) {
            continue;
        }
        var_849d01afb2fc0f0a = function_99e3948bfd8a99b8(entry);
        if (var_849d01afb2fc0f0a > 0) {
            var_a9ceb9b39c78fb07[var_a9ceb9b39c78fb07.size] = entry;
            remainingplayers = remainingplayers + var_849d01afb2fc0f0a;
        }
    }
    level.var_67b3435949f31707 = var_a9ceb9b39c78fb07.size;
    if (isdefined(level.var_ed844db90cb6d370)) {
        var_e0466189b4ca60a3 = getdvarint(@"hash_b732d750ae36e4e0", 3);
        if (var_e0466189b4ca60a3 != -1 && var_a9ceb9b39c78fb07.size <= var_e0466189b4ca60a3 && issharedfuncdefined("teamAssim", "permanentlyDisableAssim")) {
            [[ getsharedfunc("teamAssim", "permanentlyDisableAssim") ]]();
        }
    }
    if (namespace_71073fa38f11492::isfeatureenabled("pleaForHelp")) {
        self [[ namespace_3c37cb17ade254d::getsharedfunc("pleaForHelp", "deletePleasFromTeam") ]](team);
    }
    teamplacement = function_fc66f14c9b47443d(var_a9ceb9b39c78fb07.size);
    onsquadeliminatedplacement(team, teamplacement, remainingplayers, 0);
    if (isdefined(level.var_561addf876799987)) {
        [[ level.var_561addf876799987 ]]("placement", team);
    }
    level callback::callback("on_squad_eliminated", {var_d8c86217d2b13382:remainingplayers, var_5d9b595857f46dee:var_a9ceb9b39c78fb07, placement:teamplacement, team:team});
    if (istrue(level.var_77907d733abe8b63)) {
        if (getdvarint(@"hash_ec4c94a9646f819f", 1) == 1) {
            if (!namespace_bf9ffd2b22c7d819::function_c9b26cfb4d93ae50()) {
                namespace_2c7976a64ea24d6a::function_9a30317c91cfaf5e();
            } else if (istrue(level.var_e20af527a1d336f6)) {
                namespace_2c7976a64ea24d6a::function_e197f06b7037e7a1(team);
            }
        }
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf2b1
// Size: 0xcf
function function_79a4861772547bc2(team, remainingplayers, var_6fddab94c52a873c) {
    wait(1.5);
    var_faf0d2fac3f47583 = getsubgametype();
    if (var_faf0d2fac3f47583 != "dmz" && var_faf0d2fac3f47583 != "exgm") {
        teamplayers = getteamdata(team, "players");
        if (!istrue(var_6fddab94c52a873c) && remainingplayers < 5) {
            namespace_d3d40f75bb4e4c32::brleaderdialog("top_5_lose", 0, teamplayers, 1);
        } else if (!istrue(var_6fddab94c52a873c) && remainingplayers < 10) {
            namespace_d3d40f75bb4e4c32::brleaderdialog("top_10_lose", 0, teamplayers, 1);
        } else if (!istrue(var_6fddab94c52a873c) && remainingplayers < 25) {
            namespace_d3d40f75bb4e4c32::brleaderdialog("top_25_lose", 0, teamplayers, 1);
        }
        namespace_d3d40f75bb4e4c32::brleaderdialog("team_loss", 0, teamplayers, 1);
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf387
// Size: 0x227
function onsquadeliminatedplacement(team, teamplacement, remainingplayers, var_6fddab94c52a873c) {
    setteamplacement(team, teamplacement);
    namespace_a011fbf6d93f25e5::branalytics_teameliminated(team, teamplacement);
    teamplayers = getteamdata(team, "players");
    foreach (player in teamplayers) {
        if (isdefined(player) && !istrue(player.extracted)) {
            var_bfe233624969cc59 = player calculatebrbonusxp(teamplacement, team);
            var_d6a23fdabd1d282c = var_bfe233624969cc59[2];
            var_1b70c48b930405f0 = var_bfe233624969cc59[1];
            var_b5d67493fb854f58 = var_bfe233624969cc59[0];
            var_b01aca3236595958 = function_87ecb716bc207294(player);
            player givebrbonusxp(var_b5d67493fb854f58, undefined, "squadEliminated", var_b01aca3236595958);
            player.matchbonus = namespace_62c556437da28f50::function_c18c8bb0776284c6(var_1b70c48b930405f0, var_b01aca3236595958);
            player.placementbonus = namespace_62c556437da28f50::function_9e1336d25eb66326(var_d6a23fdabd1d282c, var_b01aca3236595958);
            if (issharedfuncdefined("seasonalevents", "getFieldRepEventActive")) {
                if (function_f3bb4f4911a1beb2("seasonalevents", "getFieldRepEventActive")) {
                    function_3f2ab7272697e5b8(player);
                }
            }
        }
    }
    level thread function_79a4861772547bc2(team, remainingplayers, var_6fddab94c52a873c);
    foreach (player in teamplayers) {
        if (isdefined(player) && !istrue(player.extracted)) {
            player thread handlebrdefeatedpostgamestate(teamplacement);
            player setplacementstats(teamplacement);
            player stopchallengetimers();
            namespace_d576b6dc7cef9c62::_setplayerteamrank(player, teamplacement);
            updateclientmatchdata(player);
            if (istrue(level.var_77907d733abe8b63)) {
                player namespace_2c7976a64ea24d6a::match_end(teamplacement, 1, 0);
            }
        }
    }
    setaardata(team);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf5b5
// Size: 0x1c8
function handlebrdefeatedpostgamestate(teamplacement) {
    player = self;
    player endon("disconnnect");
    if (isdefined(teamplacement)) {
        if (teamplacement < 4) {
            player namespace_74465391b3cf76b::addtop3brcharge();
        }
        if (getdvarint(@"hash_a6b52f16f3853a9a", 0) == 1) {
            player namespace_eca7530e5715bb19::function_397f011c8120ea71();
        } else {
            player setclientomnvar("ui_br_player_position", teamplacement);
        }
    }
    player namespace_88bfae359020fdd3::function_5b732dd6ab2ee2d6();
    if (istrue(player.extracted)) {
        return;
    }
    starttime = gettime();
    if (!istrue(player.br_spectatorinitialized)) {
        player waittill("br_spectatorInitialized");
        if (!isdefined(player)) {
            return;
        }
    }
    if (istrue(level.var_c7aedf1af259f045)) {
        player setclientomnvar("ui_dmz_extract_successful", 0);
        currentstreak = player getplayerdata(level.var_5d69837cf4db0407, "currentStreakCount");
        /#
            if (getdvarint(@"hash_539db9b5fa27f149", 0)) {
                currentstreak = getdvarint(@"hash_539db9b5fa27f149", 0);
            }
        #/
        if (isdefined(currentstreak) && currentstreak > 0) {
            if (currentstreak == 1) {
                namespace_446fc987a980892f::function_d87d5deb069bf8e5("streak_fail_single", [0:player], undefined, 1);
            } else {
                namespace_446fc987a980892f::function_d87d5deb069bf8e5("streak_fail_multiple", [0:player], undefined, 1);
            }
        }
    }
    player setclientomnvar("ui_br_squad_eliminated_active", 1);
    player setclientomnvar("ui_round_end_title", game["round_end"]["defeat"]);
    player setclientomnvar("ui_round_end_reason", game["end_reason"]["br_eliminated"]);
    player setclientdvar(@"hash_cbb22e2fb1a57873", 1);
    if (istrue(level.var_82ef5f20ebbf6b59)) {
        player namespace_d696adde758cbe79::function_1a425272955d5f75();
        player namespace_d696adde758cbe79::function_865b1a5a62c49d7();
    }
    player namespace_58fb4f2e73fd41a0::setlowermessageomnvar("clear_lower_msg");
    player notify("br_team_fully_eliminated");
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf784
// Size: 0xef
function setplacementstats(teamplacement) {
    player = self;
    if (!isdefined(player) || istrue(player.placementstatsset)) {
        return;
    }
    player.placementstatsset = 1;
    player.teamplacement = teamplacement;
    player.pers["telemetry"].teamplacement = teamplacement;
    if (teamplacement <= 25) {
        player namespace_3c5a4254f2b957ea::incpersstat("topTwentyFive", 1);
        if (teamplacement <= 10) {
            player namespace_3c5a4254f2b957ea::incpersstat("topTen", 1);
            if (teamplacement <= 5) {
                player namespace_3c5a4254f2b957ea::incpersstat("topFive", 1);
                if (teamplacement == 1) {
                    player namespace_3c5a4254f2b957ea::incpersstat("wins", 1);
                    if (namespace_a8b2b88699fc40fb::function_5a7168b0b511bec3(player)) {
                        player namespace_3c5a4254f2b957ea::incpersstat("weaponCaseWins", 1);
                        namespace_aad14af462a74d08::function_8359cadd253f9604(player, "weapons_case_win", 1);
                    }
                }
            }
        }
        player namespace_d576b6dc7cef9c62::updateplayerleaderboardstats();
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf87a
// Size: 0x57
function getBRBonusXPperMillisecond() {
    var_5a3fb630188efac = 0.00162;
    if (getdvarint(@"hash_78c13a450d84f3c1", 0) == 1) {
        return getdvarfloat(@"hash_11afd7f54bfebd24", var_5a3fb630188efac);
    }
    if (namespace_71073fa38f11492::isbrgametypefuncdefined("getBRBonusXPperMillisecond")) {
        return namespace_71073fa38f11492::runbrgametypefunc("getBRBonusXPperMillisecond");
    } else {
        return var_5a3fb630188efac;
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf8d8
// Size: 0x31f
function calculatebrbonusxp(teamplacement, var_dd267bfab9a8d3c3) {
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        return [0:0, 1:0, 2:0];
    }
    if (namespace_71073fa38f11492::isbrgametypefuncdefined("calculateBonusXPOverride")) {
        return namespace_71073fa38f11492::runbrgametypefunc("calculateBonusXPOverride");
    }
    var_faf0d2fac3f47583 = getsubgametype();
    if (var_faf0d2fac3f47583 == "dmz" || var_faf0d2fac3f47583 == "exgm" || var_faf0d2fac3f47583 == "plunder" || var_faf0d2fac3f47583 == "risk" || var_faf0d2fac3f47583 == "kingslayer") {
        return [0:0, 1:0, 2:0];
    }
    var_cd8245b7e413feef = getBRBonusXPperMillisecond();
    if (!isdefined(level.startofxptime) || !isdefined(teamplacement) || !isdefined(level.xpperplayerpershare) || level.startofxptime <= 0 || teamplacement <= 0 || level.xpperplayerpershare <= 0) {
        return [0:0, 1:0, 2:0];
    }
    var_5458808b1a085c02 = gettime() - level.startofxptime;
    var_5db83a557fcd180 = int(var_cd8245b7e413feef * var_5458808b1a085c02 + 0.5);
    placementxp = int(level.xpperplayerpershare * (level.xpteamsatmatchstart - teamplacement + 1));
    if (isdefined(self)) {
        if (isdefined(self.var_9afa50b51d5682f6)) {
            var_5db83a557fcd180 = var_5db83a557fcd180 - self.var_9afa50b51d5682f6;
            self.var_9afa50b51d5682f6 = self.var_9afa50b51d5682f6 + var_5db83a557fcd180;
        } else {
            self.var_9afa50b51d5682f6 = var_5db83a557fcd180;
        }
        if (isdefined(self.var_899c8788f1299a96)) {
            var_b8fa7fdaab174658 = int(max(self.var_899c8788f1299a96, placementxp));
            placementxp = int(max(0, var_b8fa7fdaab174658 - self.var_899c8788f1299a96));
            self.var_899c8788f1299a96 = self.var_899c8788f1299a96 + placementxp;
        } else {
            self.var_899c8788f1299a96 = placementxp;
        }
    }
    logstring("PLACEMENT PART LOGa: time               =" + var_5458808b1a085c02 + "; timeXP=" + var_5db83a557fcd180 + "; teamPlacement=" + teamplacement + "; placementXp=" + placementxp);
    logstring("PLACEMENT PART LOGb: xp_per_millisecond =" + var_cd8245b7e413feef + "; xpPerPlayerPerShare=" + level.xpperplayerpershare);
    if (isdefined(var_dd267bfab9a8d3c3)) {
        players = getteamdata(var_dd267bfab9a8d3c3, "players");
        validplayer = 0;
        foreach (player in players) {
            if (!player function_7dbb8165d792b06c()) {
                validplayer++;
            }
        }
        if (validplayer > 0) {
            placementxp = int(placementxp * level.maxteamsize / validplayer);
        }
    }
    rewardxp = var_5db83a557fcd180 + placementxp;
    return [0:rewardxp, 1:var_5db83a557fcd180, 2:placementxp];
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfbff
// Size: 0x27
function resetchallengetimers() {
    namespace_aad14af462a74d08::resetchallengetimer("driving");
    namespace_aad14af462a74d08::resetchallengetimer("alive_in_gas");
    namespace_aad14af462a74d08::resetchallengetimer("alive_not_downed");
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfc2d
// Size: 0x27
function stopchallengetimers() {
    namespace_aad14af462a74d08::stopchallengetimer("driving");
    namespace_aad14af462a74d08::stopchallengetimer("alive_in_gas");
    namespace_aad14af462a74d08::stopchallengetimer("alive_not_downed");
}

// Namespace br/namespace_d20f8ef223912e12
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfc5b
// Size: 0x1b9
function givebrbonusxp(var_b5d67493fb854f58, objweapon, reason, var_b01aca3236595958) {
    if (!isdefined(self) || isbot(self) || istestclient(self)) {
        return;
    }
    if (!game["timePassed"]) {
        return;
    }
    if (!(matchmakinggame() || getdvarint(@"hash_37acf332efd205cc"))) {
        return;
    }
    var_faf0d2fac3f47583 = getsubgametype();
    if (var_faf0d2fac3f47583 == "dmz" || var_faf0d2fac3f47583 == "exgm" || var_faf0d2fac3f47583 == "plunder" || var_faf0d2fac3f47583 == "risk" || var_faf0d2fac3f47583 == "kingslayer") {
        return;
    }
    if (isdefined(self.brbonusxpallowed) && self.brbonusxpallowed == 0) {
        return;
    }
    /#
        if (isdefined(var_b01aca3236595958)) {
            logstring("door_bash" + var_b01aca3236595958);
        }
    #/
    var_719b93858d7b1c94 = 0;
    if (!isdefined(reason)) {
        reason = "undefined";
    }
    switch (reason) {
    case #"hash_8a3297e83141974b":
        var_719b93858d7b1c94 = 1;
        break;
    case #"hash_58fc9e134ee88311":
        var_719b93858d7b1c94 = 1;
        break;
    case #"hash_2e41475963f16ce8":
    case #"hash_6201f99dbadb9e66":
        var_719b93858d7b1c94 = 1;
        break;
    case #"hash_b61583709daf623":
    default:
        var_719b93858d7b1c94 = 0;
        /#
            assertmsg("undefined 'reason' passed to giveBRBonusXP");
        #/
        break;
    }
    if (var_b5d67493fb854f58 > 0) {
        var_8197b2ce199b9025 = 1;
        namespace_62c556437da28f50::giverankxp(#"hash_9be8184eb12293ba", var_b5d67493fb854f58, undefined, var_719b93858d7b1c94, var_8197b2ce199b9025, 1, var_b01aca3236595958);
        namespace_a011fbf6d93f25e5::branalytics_bonusxp_debugdata(namespace_62c556437da28f50::function_fe885eed6609e08a(var_b5d67493fb854f58, var_b01aca3236595958), reason);
    }
    self.brbonusxpallowed = 0;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfe1b
// Size: 0x68
function setplacementxpshare() {
    if (namespace_71073fa38f11492::isbrgametypefuncdefined("getPlacementXPShareValues")) {
        var_bfe6bc62496eef7b = namespace_71073fa38f11492::runbrgametypefunc("getPlacementXPShareValues");
        min = var_bfe6bc62496eef7b[2];
        max = var_bfe6bc62496eef7b[1];
        pool = var_bfe6bc62496eef7b[0];
        function_690f2ce02fd51b3d(pool, max, min);
    } else {
        function_690f2ce02fd51b3d();
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfe8a
// Size: 0x1df
function function_690f2ce02fd51b3d(var_2b195188bf4738e7, var_786dc59a2e215fc5, var_7890cf9a2e47bd7b) {
    var_e0f4d3685ff5c5bc = isdefined(var_2b195188bf4738e7) ? var_2b195188bf4738e7 : 99250;
    var_2121aa51c2c8132e = isdefined(var_786dc59a2e215fc5) ? var_786dc59a2e215fc5 : 80;
    var_409d356961c27474 = isdefined(var_7890cf9a2e47bd7b) ? var_7890cf9a2e47bd7b : 15;
    var_d176c6fa97ae9438 = var_e0f4d3685ff5c5bc;
    teamsize = max(1, level.maxteamsize);
    var_e34e0f7b6e831845 = 0;
    foreach (entry in level.teamnamelist) {
        if (getteamdata(entry, "teamCount")) {
            var_e34e0f7b6e831845++;
        }
    }
    var_e34e0f7b6e831845 = max(1, var_e34e0f7b6e831845);
    var_2ce07ac87b732035 = int(var_e34e0f7b6e831845 * (var_e34e0f7b6e831845 + 1) / 2);
    var_2ce07ac87b732035 = max(var_2ce07ac87b732035, 1);
    xpperplayerpershare = int(var_d176c6fa97ae9438 / var_2ce07ac87b732035 * teamsize + 0.9);
    xpperplayerpershare = int(clamp(xpperplayerpershare, var_409d356961c27474, var_2121aa51c2c8132e));
    if (getdvarint(@"hash_4910824add4f33d9", 0) == 1) {
        var_fffc590ce12509e3 = getdvarint(@"hash_bd328f0dbc44aacc", xpperplayerpershare);
    } else {
        var_fffc590ce12509e3 = xpperplayerpershare;
    }
    logstring("PLACEMENT CALCULATION LOGa: placementPool=" + var_e0f4d3685ff5c5bc + "; numberOfTeams=" + var_e34e0f7b6e831845 + "; totalShares=" + var_2ce07ac87b732035 + "; xpPerPlayerPerShare=" + xpperplayerpershare + "; xpToUse=" + var_fffc590ce12509e3);
    level.xpperplayerpershare = var_fffc590ce12509e3;
    level.xpteamsatmatchstart = var_e34e0f7b6e831845;
    level.startofxptime = gettime();
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10070
// Size: 0x66
function giveweaponxpfromtimebr(var_68944c6870da247b) {
    var_b70ceb1820db04ac = getdvarfloat(@"hash_64ab4e1c10d28ab0", 0.0017);
    lastweaponobj = self.lastnormalweaponobj;
    value = int(var_68944c6870da247b * var_b70ceb1820db04ac);
    givebrweaponxp(#"", value, lastweaponobj, 1, 0);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x100dd
// Size: 0xcc
function givebrweaponxp(type, value, objweapon, var_719b93858d7b1c94, var_8197b2ce199b9025) {
    if (!isdefined(objweapon) || iskillstreakweapon(objweapon) || isvehicleweapon(objweapon)) {
        return;
    }
    if (isdefined(self.owner) && !isbot(self)) {
        self.owner givebrweaponxp(type, value, objweapon);
        return;
    }
    if (isai(self) || !isplayer(self)) {
        return;
    }
    if (!isdefined(value) || value <= 0) {
        return;
    }
    if (!isdefined(var_719b93858d7b1c94)) {
        var_719b93858d7b1c94 = 0;
    }
    if (!isdefined(var_8197b2ce199b9025)) {
        var_8197b2ce199b9025 = 0;
    }
    if (!var_719b93858d7b1c94) {
        namespace_48a08c5037514e04::displayscoreeventpoints(value, type);
    }
    if (!level.playerxpenabled) {
        return;
    }
    thread waitandapplybrweaponxp(type, value, objweapon, var_8197b2ce199b9025);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x101b0
// Size: 0x131
function waitandapplybrweaponxp(type, value, objweapon, var_8197b2ce199b9025) {
    self endon("disconnect");
    if (!isdefined(var_8197b2ce199b9025)) {
        var_8197b2ce199b9025 = 0;
    }
    if (!var_8197b2ce199b9025) {
        waitframe();
        namespace_9c840bb9f2ecbf00::waittillslowprocessallowed();
    }
    var_de29895dca8987ce = 0;
    if (!isdefined(objweapon) || !namespace_4cd6e0abb58d4200::weaponshouldgetxp(objweapon)) {
        return;
    }
    var_de29895dca8987ce = value;
    var_de29895dca8987ce = var_de29895dca8987ce * namespace_4cd6e0abb58d4200::getweaponrankxpmultipliertotal();
    var_de29895dca8987ce = int(var_de29895dca8987ce);
    namespace_62c556437da28f50::incrankxp(0, objweapon, var_de29895dca8987ce, #"hash_9b80f8e3667071c1");
    if (level.playerxpenabled && !isai(self)) {
        if (isdefined(objweapon) && (namespace_68e641469fde3fa7::iscacprimaryweapon(objweapon) || namespace_68e641469fde3fa7::iscacsecondaryweapon(objweapon))) {
            var_7e2c53b0bcf117d9 = spawnstruct();
            var_7e2c53b0bcf117d9.weaponname = namespace_e0ee43ef2dddadaa::getweaponrootname(objweapon);
            var_7e2c53b0bcf117d9.fullweaponname = getcompleteweaponname(objweapon);
            var_7e2c53b0bcf117d9.statname = "xp_earned";
            var_7e2c53b0bcf117d9.var_a1d4e7d5ef9da660 = var_de29895dca8987ce;
            var_7e2c53b0bcf117d9.variantid = -1;
            var_7e2c53b0bcf117d9.weaponobj = objweapon;
            namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_update_weapon_stats", var_7e2c53b0bcf117d9);
        }
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x102e8
// Size: 0x8a
function calculatepurchasexp(var_465ab95dd1230bd3, itemtype) {
    var_23c60c77cb5dc35b = getdvarint(@"hash_b6bd80ba75fa61af", 0);
    var_b50692d04e77586b = getdvarfloat(@"hash_e8d8c6b25c9b387", 80);
    var_465ab95dd1230bd3 = var_465ab95dd1230bd3 / 100;
    var_eac5ac0a940e674e = var_23c60c77cb5dc35b + int(var_465ab95dd1230bd3 * var_b50692d04e77586b);
    var_700c8b9fff678a6f = getdvarint(@"hash_e3ca7808574d931b", 1000);
    if (var_eac5ac0a940e674e > var_700c8b9fff678a6f) {
        var_eac5ac0a940e674e = var_700c8b9fff678a6f;
    }
    return var_eac5ac0a940e674e;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1037a
// Size: 0x69
function resetpostgamestateonjoinedspectators() {
    self endon("disconnect");
    starttime = gettime();
    if (!istrue(self.br_spectatorinitialized)) {
        self waittill("br_spectatorInitialized");
    }
    var_bad00f4b9d75dfbd = 3;
    var_63aad0d428c51772 = (gettime() - starttime) / 1000;
    if (var_63aad0d428c51772 < var_bad00f4b9d75dfbd) {
        wait(var_bad00f4b9d75dfbd - var_63aad0d428c51772);
    }
    self setclientomnvar("post_game_state", 0);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x103ea
// Size: 0x2d
function function_a587b0b0998c6d13() {
    return istrue(level.br_debugsolotest) || getsubgametype() == "dmz" || getsubgametype() == "exgm";
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1041f
// Size: 0x93
function ononeleftevent(team) {
    if (function_a587b0b0998c6d13() || !function_227ca42a35b0398b(team)) {
        return;
    }
    if (level.teambased) {
        var_8a4678ac12287d01 = getlastlivingplayer(team);
        if (isdefined(var_8a4678ac12287d01)) {
            var_8a4678ac12287d01 delaythread(0.5, &namespace_d3d40f75bb4e4c32::brleaderdialog, "last_man_standing", 0, [0:var_8a4678ac12287d01]);
        }
    } else {
        level.lastplayerwins = getlastlivingplayer();
        level thread namespace_d576b6dc7cef9c62::endgame(level.lastplayerwins, game["end_reason"]["enemies_eliminated"]);
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x104b9
// Size: 0x80
function function_3eb5723089c90994(victim) {
    if (istrue(victim.brneverlanded) || istrue(victim.var_91a2b1303b861667)) {
        if (!isdefined(victim.var_60d0a5246848ae8c)) {
            victim.var_60d0a5246848ae8c = 1;
        } else {
            victim.var_60d0a5246848ae8c++;
        }
        if (victim.var_60d0a5246848ae8c >= getdvarint(@"hash_f43737c13c504e05", 5)) {
            level thread namespace_6d8da2b47f878104::kickafkplayer(victim);
        }
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10540
// Size: 0xa8
function onsuicidedeath(victim) {
    if (!level.teambased) {
        var_677ae66df2125f53 = getlivingplayers();
        victim.score = level.totalplayers - var_677ae66df2125f53.size;
        foreach (player in var_677ae66df2125f53) {
            player.score = victim.score + 1;
        }
    }
    function_3eb5723089c90994(victim);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x105ef
// Size: 0x25
function needdefaultendgameflowonly() {
    if (isdefined(level.forcedend)) {
        return (namespace_d3d40f75bb4e4c32::isBrPracticeMode() && level.forcedend);
    }
    return 0;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1061c
// Size: 0xbe1
function brendgame(winner, endreasontext, nukedetonated) {
    if (level.gameended) {
        return;
    }
    waittillframeend();
    level.gameendtime = gettime();
    level.gameended = 1;
    level notify("game_ended");
    if (namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73()) {
        level.var_c2111af4e4ece485 = 1;
    }
    if (isdefined(winner) && winner != "tie") {
        logstring("[KEY_MOMENT] gameEnded winner = " + winner);
    } else {
        logstring("[KEY_MOMENT] gameEnded");
    }
    if (namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
        if (endreasontext == 25) {
            level.br_ending_delay = 0;
            if (issharedfuncdefined("DMZTut", "empty")) {
                func = getsharedfunc("DMZTut", "empty");
                level.br_endgamesplashcallback = func;
            }
        } else if (issharedfuncdefined("DMZTut", "endGameVO")) {
            [[ getsharedfunc("DMZTut", "endGameVO") ]]();
        }
    }
    namespace_47fd1e79a44628cd::shutdowngulag("end_game", 0, 1);
    if (isBrPracticeMode()) {
        level.gameisending = 1;
    }
    namespace_15d3019056d1bcea::emptyallvehicles();
    thread namespace_71073fa38f11492::runbrgametypefunc("endGame", winner);
    if (needdefaultendgameflowonly()) {
        namespace_d576b6dc7cef9c62::endgame_regularmp(winner, endreasontext, game["end_reason"]["br_eliminated"], nukedetonated);
        return;
    }
    if (!istrue(nukedetonated)) {
        if (!isdefined(level.finalkillcam_winner)) {
            level.finalkillcam_winner = winner;
        }
        thread namespace_ab70c875589b8f6a::onroundended(winner);
        thread namespace_70d685b02aaee20e::preloadfinalkillcam();
    }
    setomnvarforallclients("ui_br_transition_type", 0);
    var_3784e17637539b8 = undefined;
    var_b01aca3236595958 = undefined;
    if (isdefined(winner) && winner != "tie") {
        winnerviewsetup();
        var_3784e17637539b8 = [];
        teamplayers = getteamdata(winner, "players");
        foreach (var_736d8d9188ccbd45 in teamplayers) {
            if (isdefined(var_736d8d9188ccbd45) && !istrue(var_736d8d9188ccbd45.extracted)) {
                var_3784e17637539b8[var_3784e17637539b8.size] = var_736d8d9188ccbd45;
            }
        }
        foreach (var_6dd753add7d1c236 in var_3784e17637539b8) {
            var_6dd753add7d1c236 namespace_3c37cb17ade254d::function_f3bb4f4911a1beb2("scorpion_event", "player_win");
        }
        namespace_a8b2b88699fc40fb::function_25a4b6a2083e2ab(var_3784e17637539b8);
        var_4c15a6f75cc4a6d = 1;
        if (function_d6ae35e0ce14bbaf() && is_equal(endreasontext, 25)) {
            var_4c15a6f75cc4a6d = 0;
        }
        if (istrue(nukedetonated)) {
            var_4c15a6f75cc4a6d = 0;
        }
        if (var_4c15a6f75cc4a6d) {
            namespace_d3d40f75bb4e4c32::brleaderdialog("team_victory", 0, var_3784e17637539b8, undefined, 1.5);
        }
        namespace_d92c3c983abee514::function_e50b941afd09e62e(var_3784e17637539b8);
        var_3784e17637539b8 = array_combine(var_3784e17637539b8, level.var_c5877dbe60fddbf6);
        foreach (player in var_3784e17637539b8) {
            if (!isdefined(player)) {
                continue;
            }
            var_ec8d4e27d5467e76 = player calculatebrbonusxp(1, winner);
            var_d6a23fdabd1d282c = var_ec8d4e27d5467e76[2];
            var_1b70c48b930405f0 = var_ec8d4e27d5467e76[1];
            var_b5d67493fb854f58 = var_ec8d4e27d5467e76[0];
            if (endreasontext == game["end_reason"]["nuke_end"]) {
                var_b5d67493fb854f58 = var_b5d67493fb854f58 * ter_op(isdefined(level.arrow), level.arrow.var_9a8c945fe45c8e5.var_ecd0f4eb1e770d6c, 1);
            }
            var_b01aca3236595958 = function_87ecb716bc207294(player);
            if (istrue(player.inlaststand)) {
                if (player namespace_10260b963310d30e::finishreviveplayer("self_revive_on_kill_success", player)) {
                    player namespace_10260b963310d30e::onrevive(1);
                }
            }
            if (istrue(player.gasmaskequipped)) {
                player thread namespace_cb965d2f71fefddc::removegasmaskbr();
            }
            if (istrue(player.insertingarmorplate)) {
                player notify("try_armor_cancel", "game_end");
            }
            player namespace_4887422e77f3514e::onexitdeathsdoor(0);
            player namespace_8bfdb6eb5a3df67a::function_e68e4bb4f65f5fe4();
            player.spawnprotection = 1;
            if (!player iscodcaster()) {
                player setclientomnvar("ui_br_player_position", 1);
            } else {
                teamindex = namespace_3c37cb17ade254d::array_find(level.allteamnamelist, winner);
                player setclientomnvar("ui_br_player_position", teamindex);
            }
            player givebrbonusxp(var_b5d67493fb854f58, undefined, "winner", var_b01aca3236595958);
            player.matchbonus = namespace_62c556437da28f50::function_c18c8bb0776284c6(var_1b70c48b930405f0, var_b01aca3236595958);
            player.placementbonus = namespace_62c556437da28f50::function_9e1336d25eb66326(var_d6a23fdabd1d282c, var_b01aca3236595958);
            if (issharedfuncdefined("seasonalevents", "getFieldRepEventActive")) {
                if (function_f3bb4f4911a1beb2("seasonalevents", "getFieldRepEventActive")) {
                    function_3f2ab7272697e5b8(player);
                }
            }
            player namespace_74465391b3cf76b::addtop3brcharge();
            namespace_a011fbf6d93f25e5::branalytics_inventory_snapshot(player, "player_win");
            player setplacementstats(1);
            player stopchallengetimers();
            namespace_d576b6dc7cef9c62::_setplayerteamrank(player, 0);
            player namespace_d576b6dc7cef9c62::updateplayerleaderboardstats();
            updateclientmatchdata(player);
            player namespace_88bfae359020fdd3::function_5b732dd6ab2ee2d6();
            if (player ispcplayer()) {
                player setclientomnvar("nVidiaHighlights_events", 23);
            }
            if (isBrPracticeMode() && !isbot(player)) {
                player thread [[ level.end_game_tutorial_func ]]();
            }
            if (istrue(level.var_77907d733abe8b63)) {
                player namespace_2c7976a64ea24d6a::match_end(1, 1, 0);
                player setclientomnvar("ui_league_play_br_can_leave_with_party", 1);
            }
        }
        var_c77c36c19fc6c0c2 = [];
        foreach (var_1c1dee64df9a9c2e in level.teamnamelist) {
            if (var_1c1dee64df9a9c2e == winner) {
                continue;
            }
            alivecount = function_99e3948bfd8a99b8(var_1c1dee64df9a9c2e);
            if (alivecount > 0) {
                var_c77c36c19fc6c0c2 = array_add(var_c77c36c19fc6c0c2, var_1c1dee64df9a9c2e);
            }
        }
        if (var_c77c36c19fc6c0c2.size > 0) {
            var_c77c36c19fc6c0c2 = array_sort_with_func(var_c77c36c19fc6c0c2, &namespace_d92c3c983abee514::function_4b3d6ad67eba0f73);
            for (var_1e40d5d61118a436 = 0; var_1e40d5d61118a436 < var_c77c36c19fc6c0c2.size; var_1e40d5d61118a436++) {
                var_1c1dee64df9a9c2e = var_c77c36c19fc6c0c2[var_1e40d5d61118a436];
                if (namespace_71073fa38f11492::isbrgametypefuncdefined("getGametypeTeamPlacement")) {
                    teamplacement = namespace_71073fa38f11492::runbrgametypefunc("getGametypeTeamPlacement", var_1c1dee64df9a9c2e);
                } else {
                    teamplacement = var_1e40d5d61118a436 + 2;
                }
                onsquadeliminatedplacement(var_1c1dee64df9a9c2e, teamplacement, undefined, 1);
            }
        }
        setaardata(winner);
        level notify("team_won", winner);
    } else {
        var_a9ceb9b39c78fb07 = [];
        foreach (entry in level.teamnamelist) {
            if (getteamdata(entry, "aliveCount")) {
                var_a9ceb9b39c78fb07[var_a9ceb9b39c78fb07.size] = entry;
            }
        }
        teamplacement = var_a9ceb9b39c78fb07.size;
        foreach (player in level.players) {
            if (!isdefined(player)) {
                continue;
            }
            if (isbot(player) || istestclient(player)) {
                continue;
            }
            if (!isreallyalive(player)) {
                continue;
            }
            var_ec8d5727d5469241 = player calculatebrbonusxp(teamplacement);
            var_d6a23fdabd1d282c = var_ec8d5727d5469241[2];
            var_1b70c48b930405f0 = var_ec8d5727d5469241[1];
            var_b5d67493fb854f58 = var_ec8d5727d5469241[0];
            var_316b7c07d5e17e08 = function_87ecb716bc207294(player);
            player givebrbonusxp(var_b5d67493fb854f58, undefined, "endGame", var_316b7c07d5e17e08);
            if (issharedfuncdefined("seasonalevents", "getFieldRepEventActive")) {
                if (function_f3bb4f4911a1beb2("seasonalevents", "getFieldRepEventActive")) {
                    function_3f2ab7272697e5b8(player);
                }
            }
            player stopchallengetimers();
            player.spawnprotection = 1;
            player setclientomnvar("ui_br_player_position", 1);
            player namespace_88bfae359020fdd3::function_5b732dd6ab2ee2d6();
        }
        foreach (entry in var_a9ceb9b39c78fb07) {
            setaardata(entry);
        }
    }
    var_f7b694a4edf7dc9a = undefined;
    if (isdefined(var_3784e17637539b8)) {
        var_f7b694a4edf7dc9a = namespace_66f3c297681603ad::get_center_of_array(var_3784e17637539b8);
    }
    activeplayers = [];
    if (getdvarint(@"hash_82bde055b11e6698", 0)) {
        activeplayers = namespace_4bc0ead8d2af3d84::getvalidplayersinarray(level.players, level.questinfo.defaultfilter);
    } else {
        foreach (var_8ed1ae79096aa264 in level.players) {
            if (!var_8ed1ae79096aa264 namespace_d3d40f75bb4e4c32::isplayeringulag() && isreallyalive(var_8ed1ae79096aa264)) {
                activeplayers[activeplayers.size] = var_8ed1ae79096aa264;
            }
        }
    }
    namespace_a011fbf6d93f25e5::branalytics_economy_snapshot(activeplayers);
    function_89e9bd04f1ea27f3();
    if (!istrue(level.var_3aa0c134e5099b90)) {
        wait(1.5);
    }
    var_d1190ca89743235e = getdvarint(@"hash_dd208e4b059eae0f") != 1;
    if (namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73() && isdefined(var_3784e17637539b8) && var_d1190ca89743235e) {
        foreach (player in level.players) {
            level thread namespace_36f464722d326bbe::fadetoblackforplayer(player, 1, 2);
        }
        wait(2);
        foreach (player in level.players) {
            level thread namespace_36f464722d326bbe::fadetoblackforplayer(player, 0, 0.1);
        }
    }
    if (isdefined(level.br_endgamesplashcallback)) {
        level thread [[ level.br_endgamesplashcallback ]](winner);
    } else {
        level thread handleendgamesplash(winner, nukedetonated);
        level thread handleendgamespectatingsplash(winner, nukedetonated);
        if (istrue(level.shownonspectatingwinnersplash)) {
            level thread handleendgamenonwinnersplash(winner, nukedetonated);
        }
        if (isdefined(level.var_79c116f876dc27eb)) {
            level thread [[ level.var_79c116f876dc27eb ]](var_3784e17637539b8, var_f7b694a4edf7dc9a);
        }
        if (isdefined(level.br_ending_delay)) {
            wait(level.br_ending_delay);
        }
        if (istrue(level.shownonspectatingwinnersplash)) {
            level thread handleendgamenonwinnersplash(winner, nukedetonated);
        }
    }
    namespace_71073fa38f11492::runbrgametypefunc("postEndGameSplash", winner);
    if (namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
        if (isdefined(level.dmztutendgame)) {
            level thread [[ level.dmztutendgame ]](winner, endreasontext, game["end_reason"]["br_eliminated"]);
            return;
        }
    }
    if (!istrue(nukedetonated)) {
        level.var_ebb6ebb71ce4a007 = 1;
        endgame_showkillcam();
        level.var_ebb6ebb71ce4a007 = 0;
    }
    thread function_b231ba80cd9da78e();
    function_a976ff9efe768b4(var_3784e17637539b8, var_f7b694a4edf7dc9a, nukedetonated);
    namespace_d576b6dc7cef9c62::endgame_regularmp(winner, endreasontext, game["end_reason"]["br_eliminated"]);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11204
// Size: 0x2f
function function_b231ba80cd9da78e() {
    var_eaf3ab5c681f642a = getdvarfloat(@"hash_2e566b9447582e8d", 90);
    if (var_eaf3ab5c681f642a < 0) {
        return;
    }
    wait(var_eaf3ab5c681f642a);
    level notify("ending_scene_terminate");
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1123a
// Size: 0xc
function function_89e9bd04f1ea27f3() {
    level thread namespace_a011fbf6d93f25e5::branalytics_endgame();
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1124d
// Size: 0xc
function winnerviewsetup(winners) {
    
}

// Namespace br/namespace_d20f8ef223912e12
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11260
// Size: 0x1f2
function handleendgamesplash(winner, nukedetonated, var_3784e17637539b8) {
    if (!isdefined(var_3784e17637539b8)) {
        var_3784e17637539b8 = [];
        if (isdefined(winner) && winner != "tie") {
            var_3784e17637539b8 = getteamdata(winner, "players");
            var_3784e17637539b8 = array_combine(var_3784e17637539b8, level.var_c5877dbe60fddbf6);
        }
    }
    var_464dd76c6ecb56fa = namespace_d576b6dc7cef9c62::getbrendsplashpostgamestate();
    var_faf0d2fac3f47583 = getsubgametype();
    if (var_faf0d2fac3f47583 == "dmz" || var_faf0d2fac3f47583 == "exgm" || var_faf0d2fac3f47583 == "plunder" || var_faf0d2fac3f47583 == "risk" || var_faf0d2fac3f47583 == "kingslayer" || var_faf0d2fac3f47583 == "rumble_mgl") {
        thread namespace_3bde6869e44a2770::plunder_endgame_music();
    }
    var_37e0fe1f4e33613 = var_3784e17637539b8[0].team;
    var_3784e17637539b8 = array_combine(var_3784e17637539b8, level.var_c5877dbe60fddbf6);
    foreach (player in var_3784e17637539b8) {
        player setclientomnvar("post_game_state", var_464dd76c6ecb56fa);
        player setclientomnvar("ui_br_end_game_splash_type", 1);
        if (istrue(nukedetonated)) {
            player setclientomnvar("ui_br_elite_ending", 1);
            if (!player iscodcaster()) {
                player setclientomnvar("ui_br_player_position", 1);
            } else {
                teamindex = namespace_3c37cb17ade254d::array_find(level.allteamnamelist, winner);
                player setclientomnvar("ui_br_player_position", teamindex);
            }
        } else if (isdefined(level.arrow) && isdefined(level.arrow.defused)) {
            if (level.arrow.defused == 1) {
                level thread function_2cf9e62c94779216();
            }
        }
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11459
// Size: 0x29
function function_2cf9e62c94779216() {
    wait(10);
    setomnvarforallclients("ui_br_elite_arrow_aar_state", 1);
    wait(5);
    setomnvarforallclients("ui_br_elite_arrow_aar_state", 2);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11489
// Size: 0x146
function handleendgamespectatingsplash(winner, nukedetonated) {
    if (isdefined(winner) && winner != "tie") {
        var_464dd76c6ecb56fa = namespace_d576b6dc7cef9c62::getbrendsplashpostgamestate();
        foreach (player in level.players) {
            if (isdefined(player.playertospectate) && player.team != winner && !isdefined(player.hasseenendgamesplash)) {
                player setclientomnvar("post_game_state", var_464dd76c6ecb56fa);
                player setclientomnvar("ui_br_end_game_splash_type", 1);
                player.hasseenendgamesplash = 1;
                if (istrue(nukedetonated)) {
                    player setclientomnvar("ui_br_elite_ending", 1);
                    player setclientomnvar("ui_br_player_position", 2);
                } else if (isdefined(level.arrow) && isdefined(level.arrow.defused)) {
                    if (level.arrow.defused == 1) {
                        level thread function_2cf9e62c94779216();
                    }
                }
            }
        }
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x115d6
// Size: 0x136
function handleendgamenonwinnersplash(winner, nukedetonated) {
    if (isdefined(winner) && winner != "tie") {
        var_464dd76c6ecb56fa = namespace_d576b6dc7cef9c62::getbrendsplashpostgamestate();
        foreach (player in level.players) {
            if (player.team != winner && !isdefined(player.hasseenendgamesplash)) {
                player setclientomnvar("post_game_state", var_464dd76c6ecb56fa);
                player setclientomnvar("ui_br_end_game_splash_type", 1);
                player.hasseenendgamesplash = 1;
                if (istrue(nukedetonated)) {
                    player setclientomnvar("ui_br_elite_ending", 1);
                    player setclientomnvar("ui_br_player_position", 2);
                } else if (isdefined(level.arrow) && isdefined(level.arrow.defused)) {
                    if (level.arrow.defused == 1) {
                        level thread function_2cf9e62c94779216();
                    }
                }
            }
        }
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11713
// Size: 0x47
function function_a976ff9efe768b4(var_3784e17637539b8, var_f7b694a4edf7dc9a, nukedetonated) {
    level endon("ending_scene_terminate");
    if (isdefined(var_3784e17637539b8) && isdefined(var_f7b694a4edf7dc9a)) {
        if (istrue(nukedetonated)) {
            namespace_6c622b52017c6808::function_f6e0bdd81a472b97(var_3784e17637539b8);
        } else {
            namespace_d92c3c983abee514::play_ending(var_3784e17637539b8, var_f7b694a4edf7dc9a);
        }
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11761
// Size: 0x14
function function_ab41acc7ac2f6642(var_421750c958bd3064) {
    return var_421750c958bd3064 & 256 - 1;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1177d
// Size: 0x1a
function function_86081f65c04e8ebe(var_421750c958bd3064) {
    return (var_421750c958bd3064 & 256 - 1 << 8) >> 8;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1179f
// Size: 0x59
function function_7c646c29ea7fcb5a(itemtype, itemindex) {
    if (itemtype == 10) {
        var_ec95dc27d54fa26e = namespace_aead94004cf4c147::function_6738846da50730f1(itemindex);
        quantity = var_ec95dc27d54fa26e[1];
        lootid = var_ec95dc27d54fa26e[0];
        if (namespace_cb965d2f71fefddc::function_f96674ba1a1ec2b3(lootid)) {
            return 1;
        }
    }
    return 0;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11800
// Size: 0x1020
function function_db908ecaccbe933c(notification, var_421750c958bd3064) {
    if (istrue(level.infilcinematicactive) || istrue(self.jailed)) {
        return;
    }
    if (istrue(self.isjuggernaut) && (var_421750c958bd3064 == 256 || var_421750c958bd3064 == 257)) {
        return;
    }
    if (isdefined(notification)) {
        switch (notification) {
        case #"hash_f9442c17e42ea782":
            itemtype = function_86081f65c04e8ebe(var_421750c958bd3064);
            itemindex = function_ab41acc7ac2f6642(var_421750c958bd3064);
            if (!function_420ec7054801a5bd(itemtype, itemindex)) {
                break;
            }
            if (istrue(self.var_859654e0445a36d9) && itemtype == 1) {
                if (isdefined(level.br_pickups.var_355cddb773cb000d)) {
                    namespace_44abc05161e2e2cb::showerrormessage(level.br_pickups.var_355cddb773cb000d);
                }
                break;
            }
            if (namespace_f8065cafc523dba5::isinvehicle()) {
                if (isdefined(level.br_pickups.var_7c27d71dbf683991)) {
                    namespace_44abc05161e2e2cb::showerrormessage(level.br_pickups.var_7c27d71dbf683991);
                }
                break;
            }
            if (namespace_92fc655e328c1a9f::function_5711a00587f71794(self) && (namespace_92fc655e328c1a9f::function_1225f23a18664f4c(self) || itemtype != 1)) {
                namespace_92fc655e328c1a9f::function_80bada2833945a7a(itemtype, itemindex);
            } else {
                thread namespace_cb965d2f71fefddc::quickdropitem(itemtype, itemindex);
            }
            if (isdefined(self.var_2fa5b49969def47) && isdefined(self.var_2fa5b49969def47.var_46a3a8565ac0c17c) && self.var_2fa5b49969def47.var_46a3a8565ac0c17c == 14) {
                thread namespace_cb965d2f71fefddc::function_f7e756154ec35632(itemtype, itemindex);
            }
            break;
        case #"hash_24d3e929a240e2d7":
            itemtype = function_86081f65c04e8ebe(var_421750c958bd3064);
            itemindex = function_ab41acc7ac2f6642(var_421750c958bd3064);
            if (istrue(self.insertingarmorplate) && itemtype == 2 && "health" == namespace_1a507865f681850e::function_4967838290cb31b9(itemindex)) {
                break;
            }
            if (!function_420ec7054801a5bd(itemtype, itemindex)) {
                break;
            }
            if (istrue(self.var_859654e0445a36d9) && itemtype == 1) {
                if (isdefined(level.br_pickups.var_355cddb773cb000d)) {
                    namespace_44abc05161e2e2cb::showerrormessage(level.br_pickups.var_355cddb773cb000d);
                }
                break;
            }
            if (namespace_f8065cafc523dba5::isinvehicle() && !namespace_d20f8ef223912e12::function_7c646c29ea7fcb5a(itemtype, itemindex)) {
                if (isdefined(level.br_pickups.var_7c27d71dbf683991)) {
                    namespace_44abc05161e2e2cb::showerrormessage(level.br_pickups.var_7c27d71dbf683991);
                }
                break;
            }
            if (namespace_92fc655e328c1a9f::function_5711a00587f71794(self) && (namespace_92fc655e328c1a9f::function_1225f23a18664f4c(self) || itemtype != 1)) {
                namespace_92fc655e328c1a9f::function_80bada2833945a7a(itemtype, itemindex, undefined, 1);
            } else {
                namespace_cb965d2f71fefddc::quickdropall(itemtype, itemindex);
            }
            if (isdefined(self.var_2fa5b49969def47) && isdefined(self.var_2fa5b49969def47.var_46a3a8565ac0c17c) && self.var_2fa5b49969def47.var_46a3a8565ac0c17c == 14) {
                thread namespace_cb965d2f71fefddc::function_f7e756154ec35632(itemtype, itemindex);
            }
            break;
        case #"hash_344a8be1e67f4848":
            itemtype = function_86081f65c04e8ebe(var_421750c958bd3064);
            itemindex = function_ab41acc7ac2f6642(var_421750c958bd3064);
            if (!function_420ec7054801a5bd(itemtype, itemindex, 1)) {
                break;
            }
            if (itemtype == 1 && itemindex == 2) {
                activeweapon = namespace_3bcd40a3005712ec::function_27ef2c36eb95d796();
                if (function_f32857a938336f2b(self, activeweapon)) {
                    break;
                }
                namespace_aead94004cf4c147::function_f5a1a13f0181bb66(self, undefined, 1);
            } else {
                thread namespace_cb965d2f71fefddc::function_cab3366841d709aa(itemindex);
            }
            break;
        case #"hash_57241c1e1ceb332d":
            itemtype = function_86081f65c04e8ebe(var_421750c958bd3064);
            itemindex = function_ab41acc7ac2f6642(var_421750c958bd3064);
            if (itemtype == 10) {
                namespace_cb965d2f71fefddc::function_f1a38d2ba0bbcb08(self, itemindex);
            }
            break;
        case #"hash_3319419c6206a325":
            itemtype = function_86081f65c04e8ebe(var_421750c958bd3064);
            itemindex = function_ab41acc7ac2f6642(var_421750c958bd3064);
            if (itemtype == 10) {
                namespace_cb965d2f71fefddc::function_f1a38d2ba0bbcb08(self, itemindex, 1);
            }
            break;
        case #"hash_ea4a05d8dc5311f9":
            namespace_cb965d2f71fefddc::function_64f0398b29cf7c3e(self);
            break;
        case #"hash_df97645422cac8a6":
            itemtype = function_86081f65c04e8ebe(var_421750c958bd3064);
            itemindex = function_ab41acc7ac2f6642(var_421750c958bd3064);
            if (itemtype != 1) {
                break;
            }
            if (istrue(self.var_859654e0445a36d9) && isdefined(level.br_pickups.var_355cddb773cb000d)) {
                namespace_44abc05161e2e2cb::showerrormessage(level.br_pickups.var_355cddb773cb000d);
                break;
            }
            var_17d89f18c1d0eb4f = namespace_cb965d2f71fefddc::function_13ecf3644442a3e7(self, itemindex);
            var_d5adafa612d0ba43 = ter_op(itemindex == 1, 0, 1);
            var_929e81472980ec28 = namespace_cb965d2f71fefddc::function_13ecf3644442a3e7(self, var_d5adafa612d0ba43);
            if (!isdefined(var_17d89f18c1d0eb4f)) {
                break;
            }
            if (var_17d89f18c1d0eb4f.basename == "iw9_me_fists_mp" || function_1e9278ba699927f7(var_17d89f18c1d0eb4f)) {
                break;
            }
            if (function_f32857a938336f2b(self, var_17d89f18c1d0eb4f)) {
                break;
            }
            if (namespace_aead94004cf4c147::function_efab78b72d131d76(self)) {
                namespace_aead94004cf4c147::function_f5a1a13f0181bb66(self, var_17d89f18c1d0eb4f, 1);
                break;
            }
            var_e1147886ccf51970 = function_86a5c7670325346b(self, itemindex);
            namespace_aead94004cf4c147::function_705889b7586cf34e(self, var_17d89f18c1d0eb4f, itemindex);
            function_ae30366a2d519a57(self, itemindex, undefined);
            function_ae30366a2d519a57(self, 2, var_e1147886ccf51970);
            self takeweapon(var_17d89f18c1d0eb4f);
            var_3184653fdf31db44 = undefined;
            if (!self hasweapon("iw9_me_fists_mp")) {
                var_3184653fdf31db44 = makeweapon("iw9_me_fists_mp");
                self giveweapon(var_3184653fdf31db44);
            }
            if (isdefined(var_929e81472980ec28)) {
                self switchtoweapon(var_929e81472980ec28);
            } else if (isdefined(var_3184653fdf31db44)) {
                self switchtoweapon(var_3184653fdf31db44);
            }
            break;
        case #"hash_21120d09fe99acc5":
            if (istrue(self.gulagarena) && !level.var_43307855f189eb31.var_ef02a6ec3343c9bd) {
                namespace_44abc05161e2e2cb::showerrormessage("MP_BR_INGAME/CANNOT_STOW_IN_GULAG");
                break;
            }
            var_27f4861ed723e273 = var_421750c958bd3064;
            var_a23a9d12025e9230 = getentitylessscriptablearray(undefined, undefined, self.origin, 110);
            var_f043dfd27dc3c769 = [];
            foreach (scriptable in var_a23a9d12025e9230) {
                if (!scriptable getscriptableisloot() && (!isdefined(scriptable.type) || isdefined(scriptable.type) && scriptable.type != "brloot_weapon_pi_decho_golden")) {
                    continue;
                }
                lootid = undefined;
                iscustomweapon = 0;
                scriptablename = namespace_cb965d2f71fefddc::function_155b1a2c8879bda5(scriptable);
                if (isdefined(scriptable.type) && scriptable getscriptablehaspart(scriptable.type) && scriptable getscriptablepartstate(scriptable.type) == "hidden") {
                    continue;
                }
                if (isweaponpickup(scriptablename)) {
                    if (!namespace_3f0ea7483345a2c0::isweaponitem(var_27f4861ed723e273)) {
                        continue;
                    }
                    if (isdefined(scriptable.customweaponname)) {
                        lootid = namespace_e0ee43ef2dddadaa::function_b0d37b9be0027733(scriptable.customweaponname);
                        iscustomweapon = 1;
                    } else {
                        weaponobj = getfullweaponobjforpickup(scriptable);
                        lootid = namespace_e0ee43ef2dddadaa::function_9c331f88be5a1478(weaponobj);
                    }
                } else {
                    lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(scriptablename);
                }
                if (isdefined(lootid) && (var_27f4861ed723e273 == lootid || iscustomweapon)) {
                    var_f043dfd27dc3c769[var_f043dfd27dc3c769.size] = scriptable;
                }
            }
            var_5d9d8662fc4251b8 = undefined;
            if (var_f043dfd27dc3c769.size == 1) {
                var_5d9d8662fc4251b8 = var_f043dfd27dc3c769[0];
            } else if (var_f043dfd27dc3c769.size > 1) {
                var_2b5718884854aa2b = 0;
                playerforward = anglestoforward(self getplayerangles());
                foreach (scriptable in var_f043dfd27dc3c769) {
                    var_cac6b8b7efddb0e4 = scriptable.origin - self.origin;
                    var_e6d3398e6e00bb9e = vectornormalize(var_cac6b8b7efddb0e4);
                    angle = vectordot(playerforward, var_e6d3398e6e00bb9e);
                    if (angle > 0 && angle > var_2b5718884854aa2b) {
                        var_2b5718884854aa2b = angle;
                        var_5d9d8662fc4251b8 = scriptable;
                    }
                }
            }
            namespace_aead94004cf4c147::function_a763f6f503206771(self, var_5d9d8662fc4251b8, var_27f4861ed723e273);
            break;
        case #"hash_1e7d2b97f26d79a5":
            itemtype = function_86081f65c04e8ebe(var_421750c958bd3064);
            itemindex = function_ab41acc7ac2f6642(var_421750c958bd3064);
            if (!function_420ec7054801a5bd(itemtype, itemindex)) {
                break;
            }
            loadoutdata = namespace_aead94004cf4c147::function_cf1bef64e94f2d1a(itemtype, itemindex);
            if (!isdefined(loadoutdata)) {
                break;
            }
            lootid = loadoutdata[0];
            quantity = loadoutdata[1];
            if (!isdefined(lootid) || !isdefined(quantity) || lootid == 0 || quantity == 0) {
                break;
            }
            namespace_cb965d2f71fefddc::function_d8cd9c1941a88194(lootid, quantity, undefined, 1, 1, 1);
            thread namespace_cb965d2f71fefddc::quickdropall(itemtype, itemindex, 1);
            if (isdefined(self.var_2fa5b49969def47) && isdefined(self.var_2fa5b49969def47.var_46a3a8565ac0c17c) && self.var_2fa5b49969def47.var_46a3a8565ac0c17c == 14) {
                thread namespace_cb965d2f71fefddc::function_f7e756154ec35632(itemtype, itemindex);
            }
            break;
        case #"hash_ae052d9aaad15cec":
            itemindex = var_421750c958bd3064;
            weap = function_13ecf3644442a3e7(self, itemindex);
            if (!isdefined(weap)) {
                break;
            }
            if (function_f32857a938336f2b(self, weap) || self isreloading()) {
                break;
            }
            ammotype = namespace_3bcd40a3005712ec::br_ammo_type_for_weapon(weap);
            if (isdefined(ammotype) && isdefined(self.br_ammo[ammotype]) && self.br_ammo[ammotype] > 0) {
                stacksize = level.br_pickups.counts[ammotype];
                if (!isdefined(stacksize)) {
                    break;
                }
                var_1f11155517c54c34 = int(min(self.br_ammo[ammotype], stacksize));
                var_74806f0c4caa7e55 = var_1f11155517c54c34;
                var_975c95468376cee8 = ter_op(itemindex == 2, self.br_ammo[ammotype], self getweaponammostock(weap));
                if (self.br_ammo[ammotype] > var_975c95468376cee8) {
                    var_74806f0c4caa7e55 = var_1f11155517c54c34 + self.br_ammo[ammotype] - var_975c95468376cee8;
                    if (var_74806f0c4caa7e55 > self.br_ammo[ammotype]) {
                        var_1f11155517c54c34 = var_975c95468376cee8;
                        var_74806f0c4caa7e55 = self.br_ammo[ammotype];
                    }
                }
                if (var_1f11155517c54c34 > 0) {
                    quickdropnewitem(10, ammotype, var_1f11155517c54c34);
                }
                namespace_3bcd40a3005712ec::br_ammo_take_type(self, ammotype, var_74806f0c4caa7e55);
            }
            break;
        case #"hash_970fe96b5f1fa60b":
            itemtype = function_86081f65c04e8ebe(var_421750c958bd3064);
            itemindex = function_ab41acc7ac2f6642(var_421750c958bd3064);
            if (!function_420ec7054801a5bd(itemtype, itemindex)) {
                break;
            }
            if (namespace_3f0ea7483345a2c0::function_6f45e7311f77eac4(self)) {
                break;
            }
            loadoutdata = namespace_aead94004cf4c147::function_cf1bef64e94f2d1a(itemtype, itemindex);
            if (!isdefined(loadoutdata)) {
                break;
            }
            lootid = loadoutdata[0];
            quantity = loadoutdata[1];
            thread namespace_cb965d2f71fefddc::quickdropall(itemtype, itemindex, 1);
            scriptablename = namespace_38b993c4618e76cd::getScriptableFromLootID(lootid);
            var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(self.origin, self.angles);
            pickup = spawnpickup(scriptablename, var_cb4fad49263e20c4, quantity, 0);
            if (pickup getscriptableparthasstate(scriptablename, "hidden")) {
                pickup setscriptablepartstate(scriptablename, "hidden");
            }
            var_491c9b4e02748831 = pickup;
            var_491c9b4e02748831.contents = [];
            var_491c9b4e02748831.var_46a3a8565ac0c17c = 14;
            var_491c9b4e02748831.contents[0] = [];
            var_491c9b4e02748831.contents[0]["quantity"] = pickup.count;
            var_491c9b4e02748831.contents[0]["lootID"] = lootid;
            var_491c9b4e02748831.var_343c584e7e00192 = 1;
            var_491c9b4e02748831.itemtype = itemtype;
            var_491c9b4e02748831.itemindex = itemindex;
            namespace_3f0ea7483345a2c0::function_68ca06034b8aaccd(self, var_491c9b4e02748831);
            break;
        case #"hash_9850714c18e73445":
            if (!istrue(level.var_c153eac6e7c0e1a2)) {
                break;
            }
            var_a073d6e49197691f = var_421750c958bd3064;
            if (!isdefined(var_a073d6e49197691f)) {
                break;
            }
            result = namespace_25c7d0f5cb1e4346::function_b03a252f9ab9bcfd(self, var_a073d6e49197691f);
            if (result) {
                self setclientomnvar("ui_barter_success", 1);
                level thread namespace_25c7d0f5cb1e4346::function_2b4f0bea679346ef(self);
            }
            break;
        case #"hash_acb659be46449aa6":
            var_47868f432c8fcb6b = function_86081f65c04e8ebe(var_421750c958bd3064);
            var_5e7ce68553217eaf = function_ab41acc7ac2f6642(var_421750c958bd3064);
            if (istrue(self.var_859654e0445a36d9) && isdefined(level.br_pickups.var_355cddb773cb000d)) {
                namespace_44abc05161e2e2cb::showerrormessage(level.br_pickups.var_355cddb773cb000d);
                break;
            }
            if (namespace_708f627020de59d3::function_c0d385a09d173a36()) {
                var_24b33f095a509811 = namespace_708f627020de59d3::function_3634d41e203bc04e(var_47868f432c8fcb6b);
                var_24b33c095a509178 = namespace_708f627020de59d3::function_3634d41e203bc04e(var_5e7ce68553217eaf);
                if (isdefined(var_24b33f095a509811) && isdefined(var_24b33f095a509811.perks)) {
                    namespace_708f627020de59d3::function_222999aad19f5b52(var_5e7ce68553217eaf, var_24b33f095a509811.perks);
                    namespace_708f627020de59d3::function_e8fd3389a3f6433a(var_47868f432c8fcb6b);
                }
                if (isdefined(var_24b33c095a509178) && isdefined(var_24b33c095a509178.perks)) {
                    namespace_708f627020de59d3::function_222999aad19f5b52(var_47868f432c8fcb6b, var_24b33c095a509178.perks);
                    if (!isdefined(var_24b33f095a509811)) {
                        namespace_708f627020de59d3::function_e8fd3389a3f6433a(var_5e7ce68553217eaf);
                    }
                }
            }
            namespace_aead94004cf4c147::function_68bca2c2e9f0a1d3(var_47868f432c8fcb6b, var_5e7ce68553217eaf);
            break;
        case #"hash_2fb159736216279c":
            activeweapon = self getcurrentweapon();
            if (function_1e9278ba699927f7(activeweapon)) {
                break;
            }
            if (function_f32857a938336f2b(self, activeweapon)) {
                break;
            }
            if (istrue(self.var_859654e0445a36d9) && isdefined(level.br_pickups.var_355cddb773cb000d)) {
                namespace_44abc05161e2e2cb::showerrormessage(level.br_pickups.var_355cddb773cb000d);
                break;
            }
            namespace_aead94004cf4c147::function_1d982e57487b7efe();
            break;
        case #"hash_58a41e1083b5974":
            activeweapon = self getcurrentweapon();
            if (function_f32857a938336f2b(self, activeweapon)) {
                break;
            }
            if (istrue(self.var_859654e0445a36d9) && isdefined(level.br_pickups.var_355cddb773cb000d)) {
                namespace_44abc05161e2e2cb::showerrormessage(level.br_pickups.var_355cddb773cb000d);
                break;
            }
            var_6b280abe56564ac7 = self.primaryweapons[var_421750c958bd3064];
            if (!function_1e9278ba699927f7(var_6b280abe56564ac7)) {
                namespace_aead94004cf4c147::function_f5a1a13f0181bb66(self, var_6b280abe56564ac7, 1);
            }
            break;
        case #"hash_4779239eb81d617b":
            var_3de70f4007ca2c9 = var_421750c958bd3064 & 255;
            var_d54a79024c228770 = var_421750c958bd3064 >> 8;
            activeweapon = self getcurrentweapon();
            if (function_f32857a938336f2b(self, activeweapon)) {
                break;
            }
            if (istrue(self.var_859654e0445a36d9) && isdefined(level.br_pickups.var_355cddb773cb000d)) {
                namespace_44abc05161e2e2cb::showerrormessage(level.br_pickups.var_355cddb773cb000d);
                break;
            }
            namespace_aead94004cf4c147::function_51301c83420d42b4(var_3de70f4007ca2c9, var_d54a79024c228770);
            break;
        case #"hash_95263a53b172f2e6":
            var_d54a79024c228770 = var_421750c958bd3064 >> 8;
            var_65b695f0c0d909ed = var_421750c958bd3064 & 255;
            namespace_aead94004cf4c147::function_ce92a41b8f3b666f(var_65b695f0c0d909ed, var_d54a79024c228770);
            break;
        case #"hash_71baeb7015ce2552":
            var_65b695f0c0d909ed = var_421750c958bd3064 & 1023;
            var_421750c958bd3064 = var_421750c958bd3064 >> 10;
            itemindex = var_421750c958bd3064 & 1023;
            var_421750c958bd3064 = var_421750c958bd3064 >> 10;
            itemtype = var_421750c958bd3064 & 1023;
            namespace_aead94004cf4c147::function_9f1f9042105e4240(itemtype, itemindex, var_65b695f0c0d909ed);
            break;
        default:
            break;
        }
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12827
// Size: 0x1bd
function function_420ec7054801a5bd(itemtype, itemindex, equip) {
    if (!function_ad443bbcdcf37b85(self)) {
        return 0;
    }
    if (istrue(self.insertingarmorplate) && itemtype == 2 && "health" == namespace_1a507865f681850e::function_4967838290cb31b9(itemindex)) {
        return 0;
    }
    issuper = 0;
    var_161692d8fa9cebec = 0;
    if (itemtype == 10 && istrue(equip)) {
        var_ec95d327d54f8ea3 = namespace_aead94004cf4c147::function_6738846da50730f1(itemindex);
        quantity = var_ec95d327d54f8ea3[1];
        lootid = var_ec95d327d54f8ea3[0];
        lootid = function_53c4c53197386572(lootid, 0);
        scriptablename = namespace_38b993c4618e76cd::getScriptableFromLootID(lootid);
        if (isdefined(scriptablename)) {
            issuper = issuperpickup(scriptablename);
            var_161692d8fa9cebec = isequipment(scriptablename);
        }
    }
    if ((self isthrowinggrenade() || self isgestureplaying("ges_vm_offhand_1h_stim_inject")) && (itemtype == 2 || itemtype == 4 || issuper || var_161692d8fa9cebec)) {
        return 0;
    }
    if (namespace_e0ee43ef2dddadaa::iskillstreakweapon(self getcurrentweapon())) {
        return 0;
    }
    if (itemtype == 10 && isdefined(self.var_e0c39101bfc15d2) && istrue(self.var_e0c39101bfc15d2[itemindex])) {
        return 0;
    }
    if (itemtype == 4 && (namespace_85d036cb78063c4a::issuperinuse() || namespace_85d036cb78063c4a::function_565913010c84ffca())) {
        loadoutdata = namespace_aead94004cf4c147::function_cf1bef64e94f2d1a(itemtype, itemindex);
        lootid = loadoutdata[0];
        quantity = loadoutdata[1];
        if (!isdefined(lootid) || !isdefined(quantity) || lootid == 0 || quantity == 0) {
            return 0;
        }
        scriptablename = namespace_38b993c4618e76cd::getScriptableFromLootID(lootid);
        if (!namespace_cb965d2f71fefddc::function_1be34022a4acce73(scriptablename)) {
            return 0;
        }
    }
    return 1;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x129ec
// Size: 0xc3
function function_1c7f3f4e23f94f86(scriptablename) {
    if (!function_ad443bbcdcf37b85(self)) {
        return 0;
    }
    if (!isdefined(scriptablename)) {
        return 1;
    }
    if (istrue(self.insertingarmorplate) && isarmorplate(scriptablename)) {
        return 0;
    }
    issuper = issuperpickup(scriptablename);
    var_161692d8fa9cebec = isequipment(scriptablename);
    var_36de08ea672b354c = function_36de08ea672b354c(scriptablename);
    if ((self isthrowinggrenade() || self isgestureplaying("ges_vm_offhand_1h_stim_inject")) && (issuper || var_161692d8fa9cebec)) {
        return 0;
    }
    if (istrue(namespace_85d036cb78063c4a::issuperdisabled()) && issuper) {
        return 0;
    }
    if (var_36de08ea672b354c) {
        return namespace_708f627020de59d3::function_bdd930eee0042052();
    }
    if (namespace_e0ee43ef2dddadaa::iskillstreakweapon(self getcurrentweapon())) {
        return 0;
    }
    return 1;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12ab7
// Size: 0x43
function function_f32857a938336f2b(player, var_a1c804ffa2416774) {
    return isdefined(player) && isdefined(player.var_55562bd5eb6065e5) && isdefined(var_a1c804ffa2416774) && player.var_55562bd5eb6065e5 != player getweaponammoclip(var_a1c804ffa2416774);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12b02
// Size: 0x19
function get_int_or_0(value) {
    if (!isdefined(value)) {
        return 0;
    }
    return int(value);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12b23
// Size: 0xc6
function parachutecomplete() {
    if (brdoesloadoutoptionusedropbags() && !brareloadoutdropbagsdelayed() && !istrue(self.dropbagspawned) && !istrue(level.precomputeddropbags)) {
        if (namespace_d3d40f75bb4e4c32::isplayerbrsquadleader()) {
            thread namespace_c3059e55bc606259::spawndropbagonlanding();
            foreach (player in level.teamdata[self.team]["players"]) {
                player.dropbagspawned = 1;
            }
        }
    }
    if (namespace_4b0406965e556711::gameflag("prematch_done")) {
        thread namespace_a4b43c1cf86c6fe5::showdiscountsplash(5);
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12bf0
// Size: 0x5f
function spawnintermission(spawnorigin, spawnangles) {
    namespace_99ac021a7547cae3::setspawnvariables();
    self freezecontrols(1);
    updatesessionstate("intermission");
    clearkillcamstate();
    self.friendlydamage = undefined;
    self spawn(spawnorigin, spawnangles);
    printspawnmessage("playerlogic::spawnIntermission() !!!CODE SPAWN!!! @" + spawnorigin);
    setdof_spectator();
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12c56
// Size: 0x11a
function brprewaitandspawnclient(var_9156b53bcf7ce573) {
    if (!isdefined(self.prespawnspawn) || self isplayerheadless()) {
        self setclientomnvar("ui_br_extended_load_screen", 0);
        return;
    }
    thread brprewaitandspawnclientcleanup();
    if (!isdefined(self.initialprespawn) && !istrue(var_9156b53bcf7ce573)) {
        var_11f3b4465c8b637b = self.prespawnspawn.origin;
        droporigin = playerstreamhintdroptoground(var_11f3b4465c8b637b);
        timeout = getdvarint(@"hash_6ce81e74109af8d3", 9000);
        playerstreamhintlocation(droporigin, timeout, 1);
        if (!istrue(level.x1playertransition) && !istrue(self.x1playertransition)) {
            namespace_d20f8ef223912e12::function_258c4f40dee8189a();
            self setclientomnvar("ui_br_transition_type", 4);
        }
        wait(0.5);
        spawnintermission(droporigin, self.prespawnspawn.angles);
        namespace_5aeecefc462876::setdisabled();
    } else {
        self.initialprespawn = undefined;
    }
    playerwaittillstreamhintcomplete();
    self freezecontrols(0);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12d77
// Size: 0x28
function function_6760d3783dfac7dd(var_9156b53bcf7ce573) {
    playerwaittillstreamhintcomplete();
    self setclientomnvar("ui_br_extended_load_screen", 0);
    self freezecontrols(0);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12da6
// Size: 0x49
function brprewaitandspawnclientcleanup() {
    self endon("disconnect");
    self waittill("brWaitAndSpawnClientComplete");
    if (namespace_81156089ff1fe819::function_59e8b4ed75ca8b92()) {
        self clearpredictedstreampos();
    }
    if (!istrue(level.x1playertransition)) {
        self setclientomnvar("ui_br_transition_type", 0);
    }
    self setclientomnvar("ui_br_extended_load_screen", 0);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12df6
// Size: 0xd
function brprematchaddkill() {
    self.kills++;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12e0a
// Size: 0x27
function bronattackerdamagenottracked(damage) {
    if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
        namespace_3c5a4254f2b957ea::incpersstat("damage", damage);
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12e38
// Size: 0xff
function brclearscoreboardstats() {
    foreach (player in level.players) {
        player.kills = 0;
        player.pers["kills"] = 0;
        player.deaths = 0;
        player.pers["deaths"] = 0;
        player.score = 0;
        player.pers["score"] = 0;
        player.brmissionscompleted = 0;
        player.pers["contracts"] = 0;
        player namespace_d3d40f75bb4e4c32::updatebrscoreboardstat("missionsCompleted", 0);
        player.pers["damage"] = 0;
        player namespace_d3d40f75bb4e4c32::updatebrscoreboardstat("damageDealt", 0);
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12f3e
// Size: 0xce
function brclosealldoors(var_41252dd8a866ad6a) {
    level endon("game_ended");
    doors = getentitylessscriptablearray(undefined, undefined, undefined, undefined, "door");
    var_3c98ca3b59c3efef = 0;
    var_884a98392ce1109b = isdefined(var_41252dd8a866ad6a) && isint(var_41252dd8a866ad6a);
    foreach (door in doors) {
        if (!door scriptabledoorisclosed() && door getscriptablepartstate("door") != "invisible") {
            door scriptabledoorclose();
            if (var_884a98392ce1109b) {
                var_3c98ca3b59c3efef++;
                if (var_3c98ca3b59c3efef >= var_41252dd8a866ad6a) {
                    var_3c98ca3b59c3efef = 0;
                    waitframe();
                }
            }
        }
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13013
// Size: 0x42
function function_4f4b9a3c68af0f7b(var_3a7fa5a908d33403) {
    var_624f473fe3ee62f1 = spawnstruct();
    thread function_d031b5b9bf72725b(var_624f473fe3ee62f1);
    thread function_fdc0cf0e13ef442b(var_624f473fe3ee62f1, var_3a7fa5a908d33403);
    var_624f473fe3ee62f1 waittill("waittill_proc");
    return var_624f473fe3ee62f1.result;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1305d
// Size: 0x50
function function_d031b5b9bf72725b(var_624f473fe3ee62f1) {
    var_624f473fe3ee62f1 endon("waittill_proc");
    newclass = channel = self waittill("luinotifyserver");
    var_624f473fe3ee62f1.result = [0:channel, 1:newclass];
    var_624f473fe3ee62f1 notify("waittill_proc");
}

// Namespace br/namespace_d20f8ef223912e12
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x130b4
// Size: 0x25
function function_fdc0cf0e13ef442b(var_624f473fe3ee62f1, var_3a7fa5a908d33403) {
    var_624f473fe3ee62f1 endon("waittill_proc");
    wait(var_3a7fa5a908d33403);
    var_624f473fe3ee62f1 notify("waittill_proc");
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x130e0
// Size: 0x270
function playerselectspawnclass() {
    self endon("death_or_disconnect");
    self endon("last_stand_start");
    self endon("halo_kick_c130");
    level endon("game_ended");
    level endon("end_spawn_selection");
    if (getdvarint(@"hash_206a763969420ce0", 0) == 1 && namespace_36f464722d326bbe::isBRStyleGameType() && getsubgametype() != "dmz" && getsubgametype() != "exgm" && getsubgametype() != "plunder" && getsubgametype() != "risk" && getsubgametype() != "sandbox" && getsubgametype() != "rumble_mgl") {
        var_891d91911e4c1ade = isdefined(level.allowclasschoicefunc) && istrue(self [[ level.allowclasschoicefunc ]]());
        namespace_9c840bb9f2ecbf00::demoforcesre("playerSelectSpawnClass() " + self.name + " ui_options_menu = 2, allowClassChoiceFunc = " + var_891d91911e4c1ade);
    }
    self setclientomnvar("ui_options_menu", 2);
    var_d2505540b9ff998c = "custom1";
    self.pers["class"] = var_d2505540b9ff998c;
    self.class = var_d2505540b9ff998c;
    namespace_d19129e4fa5d176::preloadandqueueclass(var_d2505540b9ff998c);
    var_646a3262e2aa2948 = getdvarfloat(@"hash_6f432a1782beb1", 10);
    var_5493cf7a76ff4176 = 0;
    var_9c35ba153f8c42 = var_646a3262e2aa2948 > 0;
    while (1) {
        channel = undefined;
        newclass = undefined;
        if (var_9c35ba153f8c42) {
            result = function_4f4b9a3c68af0f7b(1);
            if (!isdefined(result)) {
                var_5493cf7a76ff4176 = var_5493cf7a76ff4176 + 1;
                if (var_5493cf7a76ff4176 > var_646a3262e2aa2948) {
                    self setclientomnvar("ui_options_menu", 0);
                    return 0;
                }
                self setclientomnvar("ui_options_menu", 2);
                continue;
            }
            channel = result[0];
            newclass = result[1];
        } else {
            newclass = channel = self waittill("luinotifyserver");
        }
        if (channel == "exit_loadout_bag") {
            return 0;
        } else if (channel != "class_select") {
            continue;
        }
        retval = 0;
        if (newclass >= 0) {
            var_2d36749fdffc49b4 = namespace_e5ed2f5a5ee8410e::getclasschoice(newclass);
            self.pers["class"] = var_2d36749fdffc49b4;
            self.class = var_2d36749fdffc49b4;
            namespace_d19129e4fa5d176::preloadandqueueclass(var_2d36749fdffc49b4);
            retval = 1;
        }
        self setclientomnvar("ui_options_menu", 0);
        return retval;
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13357
// Size: 0x45
function playerstartselectspawnclassnonexclusion() {
    player = self;
    player endon("disconnect");
    player freezecontrols(1);
    if (brdoesloadoutoptionrequireclassselection()) {
        player playerselectspawnclass();
    }
    player setclientomnvar("ui_options_menu", 0);
    player freezecontrols(0);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x133a3
// Size: 0x16a
function monitorjumpmasterclaim() {
    player = self;
    player endon("disconnect");
    player thread listenforjumpmasterclaimluanotify();
    var_9770425da56e6488 = 0;
    while (!namespace_4b0406965e556711::gameflag("end_spawn_selection")) {
        msg = player waittill_any_ents_return(player, "attempt_jumpmaster_claim", player, "squad_jumpmaster_claimed", level, "end_spawn_selection");
        if (msg == "attempt_jumpmaster_claim") {
            if (!var_9770425da56e6488) {
                player namespace_d3d40f75bb4e4c32::updatebrscoreboardstat("jumpMasterState", 2);
                player.issquadleader = 1;
                player namespace_58fb4f2e73fd41a0::setlowermessageomnvar("br_player_is_jumpmaster");
                members = getfriendlyplayers(player.team, 0);
                foreach (member in members) {
                    if (member != player) {
                        member.issquadleader = 0;
                        member namespace_d3d40f75bb4e4c32::updatebrscoreboardstat("jumpMasterState", 0);
                        member notify("squad_jumpmaster_claimed");
                        member namespace_58fb4f2e73fd41a0::setlowermessageomnvar("br_teammate_is_jumpmaster");
                    }
                }
            } else {
                player namespace_d3d40f75bb4e4c32::updatebrscoreboardstat("jumpMasterState", 1);
                player namespace_58fb4f2e73fd41a0::setlowermessageomnvar("br_player_deploy_solo");
            }
        } else if (msg == "squad_jumpmaster_claimed") {
            var_9770425da56e6488 = 1;
        }
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13514
// Size: 0x60
function listenforjumpmasterclaimluanotify() {
    player = self;
    level endon("game_ended");
    player endon("disconnect");
    player notify("listenClaimJumpMaster");
    player endon("listenClaimJumpMaster");
    level endon("end_spawn_selection");
    while (1) {
        notification = player waittill("luinotifyserver");
        if (notification == "attempt_jumpmaster_claim") {
            player notify("attempt_jumpmaster_claim");
        }
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1357b
// Size: 0x4a
function sendafksquadmembertogulag() {
    player = self;
    player.br_infilstarted = 1;
    player setclientomnvar("ui_br_infil_started", 1);
    player setclientomnvar("ui_br_infiled", 1);
    player namespace_f8065cafc523dba5::function_6fb380927695ee76(1);
    player kill();
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x135cc
// Size: 0x46
function br_displayperkinfo() {
    self endon("disconnect");
    if (isdefined(level.isstandardsandbox) && !level.isstandardsandbox) {
        return;
    }
    self setclientomnvar("ui_br_display_perk_info", 1);
    wait(0.1);
    self setclientomnvar("ui_br_display_perk_info", 0);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13619
// Size: 0x3eb
function br_giveselectedclass(player, var_a5ab866673e5e99d, var_4047cb430f29ada4) {
    player.gettingloadout = 1;
    struct = undefined;
    if (isdefined(player.preloadedclassstruct)) {
        struct = player.preloadedclassstruct;
        player.preloadedclassstruct = undefined;
    } else {
        struct = player loadout_getclassstruct();
        struct = player loadout_updateclass(struct, player.class);
    }
    player.classstruct = struct;
    inlaststand = istrue(player.inlaststand);
    dropstruct = br_clearinventory(player, var_a5ab866673e5e99d, var_4047cb430f29ada4);
    player.prevweaponobj = undefined;
    player loadout_clearperks();
    player loadout_updateplayerperks(struct);
    givelaststandifneeded(player);
    givespecialistbonusifneeded(player);
    player function_9743c56a4d2dc135(struct);
    player function_a80b77a2abaa376e(struct);
    if (isdefined(player.classstruct.loadoutsecondaryobject)) {
        br_forcegivecustomweapon(player, player.classstruct.loadoutsecondaryobject, player.classstruct.loadoutsecondaryfullname, player.classstruct.loadoutsecondary);
    }
    if (isdefined(player.classstruct.loadoutprimaryobject)) {
        br_forcegivecustomweapon(player, player.classstruct.loadoutprimaryobject, player.classstruct.loadoutprimaryfullname, player.classstruct.loadoutprimary);
    }
    if (namespace_d19129e4fa5d176::function_da27e3343b019fde() && isdefined(player.classstruct.var_91e10e152b08ec1d)) {
        player namespace_d19129e4fa5d176::function_4ffce833ce15363c(player.classstruct);
    }
    var_e7d8e765ac9243a6 = "none";
    var_604669419e2560e6 = "none";
    var_6dc747a4410e0395 = 0;
    var_6e8f0546b97c1dd5 = 0;
    if (isdefined(player.classstruct.loadoutequipmentprimary)) {
        var_e7d8e765ac9243a6 = player.classstruct.loadoutequipmentprimary;
        if (isdefined(player.classstruct.var_b68e3a0a9c628d23) && player.classstruct.var_b68e3a0a9c628d23 > 0) {
            var_6dc747a4410e0395 = player.classstruct.var_b68e3a0a9c628d23;
        }
    }
    if (isdefined(player.classstruct.loadoutequipmentsecondary)) {
        var_604669419e2560e6 = player.classstruct.loadoutequipmentsecondary;
        if (isdefined(player.classstruct.var_a1dfc5ce15795a3) && player.classstruct.var_a1dfc5ce15795a3 > 0) {
            var_6e8f0546b97c1dd5 = player.classstruct.var_a1dfc5ce15795a3;
        }
    }
    player namespace_1a507865f681850e::giveequipment(var_e7d8e765ac9243a6, "primary", undefined, var_6dc747a4410e0395);
    player namespace_1a507865f681850e::giveequipment(var_604669419e2560e6, "secondary", undefined, var_6e8f0546b97c1dd5);
    player.gettingloadout = 0;
    player notify("giveLoadout");
    player thread br_displayperkinfo();
    if (inlaststand) {
        laststandoldweaponobj = player getcurrentprimaryweapon();
        if (!isweapon(laststandoldweaponobj)) {
            laststandoldweaponobj = makeweapon(laststandoldweaponobj);
        }
        self.laststandoldweaponobj = laststandoldweaponobj;
        laststandweapon = player brchooselaststandweapon();
        if (!isweapon(laststandweapon)) {
            laststandweapon = makeweapon(laststandweapon);
        }
        player namespace_10260b963310d30e::givelaststandweapon(laststandweapon);
        if (!player _hasperk("specialty_pistoldeath")) {
            player giveperk("specialty_pistoldeath");
        }
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13a0b
// Size: 0x43c
function br_clearinventory(player, var_a5ab866673e5e99d, var_4047cb430f29ada4) {
    dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
    dropstruct.weaponpickups = [];
    dropstruct.equipprimarypickup = undefined;
    dropstruct.equipsecondarypickup = undefined;
    if (istrue(var_4047cb430f29ada4)) {
        dropstruct.var_dfba5a2c3c6f0a07 = int(4);
        if (getdvarint(@"hash_ac8187887a7808aa", 0)) {
            dropstruct.var_dfba5a2c3c6f0a07 = dropstruct.var_dfba5a2c3c6f0a07 + 9;
        }
    }
    foreach (weapon in player.equippedweapons) {
        basename = namespace_e0ee43ef2dddadaa::getweaponrootname(weapon.basename);
        if (isweapon(weapon) && weapon.inventorytype == "primary") {
            if (namespace_cb965d2f71fefddc::shoulddropbrprimary(weapon, player)) {
                var_ec7ded352736c3b1 = player namespace_20c746953ff716b9::extract_ismissionweapon(weapon);
                if (istrue(var_a5ab866673e5e99d) && !var_ec7ded352736c3b1) {
                    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, player.origin, player.angles, player);
                    pickupent = namespace_3bcd40a3005712ec::weaponspawn(weapon, player, var_cb4fad49263e20c4, 0, 1);
                    if (isdefined(pickupent)) {
                        var_5413c446d646561a = player getweaponammoclip(weapon);
                        var_5f1e64f3e8613c52 = player getweaponammoclip(weapon, "left");
                        var_daa197e6c4b920ee = 0;
                        if (weapon.hasalternate) {
                            var_b6ff735c3690cc44 = weapon getaltweapon();
                            if (namespace_3bcd40a3005712ec::br_ammo_type_for_weapon(var_b6ff735c3690cc44) != namespace_3bcd40a3005712ec::br_ammo_type_for_weapon(weapon)) {
                                var_daa197e6c4b920ee = player getweaponammoclip(var_b6ff735c3690cc44);
                            }
                        }
                        if (br_weapons::function_4267b8888db52ea3(weapon)) {
                            var_5f1e64f3e8613c52 = player getweaponammostock(weapon);
                        }
                        namespace_cb965d2f71fefddc::loot_setitemcount(pickupent, var_5413c446d646561a, var_5f1e64f3e8613c52, var_daa197e6c4b920ee);
                        dropstruct.weaponpickups[dropstruct.weaponpickups.size] = pickupent;
                    }
                }
            }
            player _takeweapon(weapon);
        }
    }
    if (isdefined(player.equipment["primary"])) {
        if (istrue(var_a5ab866673e5e99d)) {
            ammocount = player namespace_1a507865f681850e::getequipmentslotammo("primary");
            var_feb782334dd23a66 = array_find(level.br_pickups.br_equipname, player.equipment["primary"]);
            if (isdefined(var_feb782334dd23a66) && ammocount > 0) {
                var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, player.origin, player.angles, player);
                pickupent = namespace_cb965d2f71fefddc::spawnpickup(var_feb782334dd23a66, var_cb4fad49263e20c4, ammocount, 1);
                if (isdefined(pickupent)) {
                    dropstruct.equipprimarypickup = pickupent;
                }
            }
        }
        player namespace_1a507865f681850e::takeequipment("primary");
    }
    if (isdefined(player.equipment["secondary"])) {
        if (istrue(var_a5ab866673e5e99d)) {
            ammocount = player namespace_1a507865f681850e::getequipmentslotammo("secondary");
            var_feb782334dd23a66 = array_find(level.br_pickups.br_equipname, player.equipment["secondary"]);
            if (isdefined(var_feb782334dd23a66) && ammocount > 0) {
                var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdroporiginandangles(dropstruct, player.origin, player.angles, player);
                if (issharedfuncdefined(var_feb782334dd23a66, "getAmmo")) {
                    ammocount = player [[ getsharedfunc(var_feb782334dd23a66, "getAmmo") ]]();
                }
                pickupent = namespace_cb965d2f71fefddc::spawnpickup(var_feb782334dd23a66, var_cb4fad49263e20c4, ammocount, 1);
                if (isdefined(pickupent)) {
                    dropstruct.equipsecondarypickup = pickupent;
                }
            }
        }
        player namespace_1a507865f681850e::takeequipment("secondary");
    }
    if (namespace_708f627020de59d3::function_c0d385a09d173a36() && isdefined(player.var_28c944f222f4814.var_183ec729c8876d57)) {
        if (istrue(var_a5ab866673e5e99d)) {
            player namespace_708f627020de59d3::function_3af23b0bfaf91dbd(dropstruct);
        }
    }
    player giveweapon(makeweapon("iw9_me_fists_mp"));
    return dropstruct;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13e4f
// Size: 0x55
function br_selectdropbagclass() {
    self endon("disconnect");
    self freezecontrols(1);
    self setclientomnvar("ui_open_loadout_bag", 1);
    retval = playerselectspawnclass();
    self setclientomnvar("ui_options_menu", 0);
    self setclientomnvar("ui_open_loadout_bag", 0);
    self freezecontrols(0);
    return retval;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13eac
// Size: 0x11d
function br_givedropbagloadout(player) {
    if (istrue(self.insertingarmorplate)) {
        player notify("try_armor_cancel", "loadout_open");
    }
    if (isbot(player, 1) && isdefined(level.bot_funcs["select_class_from_airdrop"])) {
        retval = player [[ level.bot_funcs["select_class_from_airdrop"] ]]();
    } else if (getdvarint(@"hash_f195e306ffa755d0", 0) == 1) {
        retval = player namespace_71073fa38f11492::runbrgametypefunc("GetRandomLoadout");
    } else {
        retval = player br_selectdropbagclass();
    }
    if (istrue(retval)) {
        namespace_6c578d6ef48f10ef::brloadoutcratepostcapture(player);
    } else {
        return;
    }
    br_giveselectedclass(player, 1, 1);
    loadouttype = ter_op(isstartstr(player.class, "custom"), 1, 0);
    player namespace_aad14af462a74d08::onloadout(loadouttype);
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        var_7bc6be581f50b614 = self.origin;
        wait(0.5);
        namespace_a011fbf6d93f25e5::branalytics_dropbagused(player, var_7bc6be581f50b614, self);
        namespace_a011fbf6d93f25e5::branalytics_inventory_snapshot(player, "dropbag_used");
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13fd0
// Size: 0x40
function bronloadoutcratedestroyed(immediate) {
    level notify("dropbag_kill_callout_" + self.origin);
    if (namespace_36f464722d326bbe::isBRStyleGameType()) {
        namespace_a011fbf6d93f25e5::branalytics_dropbagdestroyed(self.team, self.origin);
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14017
// Size: 0xf4
function cleanupdropbagsoncircle() {
    if (!getdvarint(@"hash_e91068b532510e98", 0)) {
        return;
    }
    level waittill("br_circle_started");
    while (level.br_pickups.crates.size > 0) {
        var_78cbe5db7f9353df = [];
        foreach (crate in level.br_pickups.crates) {
            if (isdefined(crate) && (!isdefined(crate.curprogress) || crate.curprogress == 0)) {
                crate thread namespace_6c578d6ef48f10ef::destroycrate();
            } else {
                var_78cbe5db7f9353df[var_78cbe5db7f9353df.size] = crate;
            }
        }
        level.br_pickups.crates = var_78cbe5db7f9353df;
        var_78cbe5db7f9353df = undefined;
        wait(1);
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14112
// Size: 0x2e
function brchooselaststandweapon() {
    var_1730c8d8475566cd = self;
    laststandweapon = var_1730c8d8475566cd playergetlaststandpistol();
    if (!isdefined(laststandweapon)) {
        laststandweapon = "iw9_gunless";
    }
    return laststandweapon;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14148
// Size: 0x14
function playerexitlaststand(revived) {
    namespace_47fd1e79a44628cd::playerexitlaststand(revived);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14163
// Size: 0x98
function modelaststandallowed(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration) {
    damagedata = namespace_169cd7a8fbc76ee5::packdamagedata(attacker, self, idamage, objweapon, smeansofdeath, einflictor, undefined, vdir);
    damagedata.hitloc = shitloc;
    if (namespace_71073fa38f11492::isbrgametypefuncdefined("lastStandAllowed") && !namespace_71073fa38f11492::runbrgametypefunc("lastStandAllowed", damagedata)) {
        return 0;
    }
    return 1;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14203
// Size: 0xb2
function isvalidkillcam(var_642470e1abc1bbf9) {
    attacker = var_642470e1abc1bbf9.attacker;
    if (!isdefined(attacker)) {
        return 0;
    }
    if (istrue(var_642470e1abc1bbf9.assistedsuicide)) {
        return 0;
    }
    var_bc18e17a39c9670b = namespace_71073fa38f11492::isfeaturedisabled("gulag");
    var_447aaad9abfbb2bd = isdefined(level.var_43307855f189eb31) && istrue(level.var_43307855f189eb31.var_cadc8d24186a8a91);
    var_182f678ba0afdacf = istrue(attacker.gulag);
    if (!var_bc18e17a39c9670b && !var_447aaad9abfbb2bd && var_182f678ba0afdacf) {
        return 0;
    }
    if (isBrPracticeMode()) {
        return 0;
    }
    return 1;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x142bd
// Size: 0x7f
function brvalidatekillcam(var_642470e1abc1bbf9) {
    if (isdefined(var_642470e1abc1bbf9)) {
        if (!isvalidkillcam(var_642470e1abc1bbf9)) {
            var_642470e1abc1bbf9.dokillcam = 0;
        }
        if (!var_642470e1abc1bbf9.dokillcam && namespace_81156089ff1fe819::function_59e8b4ed75ca8b92()) {
            var_642470e1abc1bbf9.victim clearpredictedstreampos();
        }
        if (!namespace_71073fa38f11492::isfeaturedisabled("teamSpectate")) {
            namespace_a9c534dc7832aba4::migratespectators(var_642470e1abc1bbf9.victim, var_642470e1abc1bbf9.attacker, 1);
        }
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14343
// Size: 0x42
function iscontender(player) {
    if (!isdefined(player)) {
        return 0;
    }
    if (!isalive(player)) {
        return 0;
    }
    if (istrue(player.gulag)) {
        return 0;
    }
    if (istrue(player.inlaststand)) {
        return 0;
    }
    return 1;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1438d
// Size: 0x85
function getteamcontenders(team) {
    var_946a4601500e7c66 = [];
    teamplayers = getteamdata(team, "players");
    foreach (player in teamplayers) {
        if (iscontender(player)) {
            var_946a4601500e7c66[var_946a4601500e7c66.size] = player;
        }
    }
    return var_946a4601500e7c66;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1441a
// Size: 0xa3
function onkillingblow(eattacker, victim) {
    laststandpistol = playergetlaststandpistol();
    eattacker thread namespace_88bfae359020fdd3::function_5a4b82ce1c8d94d6(victim);
    if (iscontender(victim) && !isdefined(laststandpistol)) {
        var_282d9ac5fa39bf7f = getteamcontenders(victim.team);
        if (var_282d9ac5fa39bf7f.size < 2 && !istrue(level.laststandkillteamifdowndisable)) {
            if (victim _hasperk("specialty_pistoldeath")) {
                victim removeperk("specialty_pistoldeath");
            }
        }
        if (!namespace_71073fa38f11492::isfeaturedisabled("armor")) {
            victim namespace_f8d3520d3483c1::breakarmor();
        }
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 13, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x144c4
// Size: 0x98
function brpreplayerdamaged(einflictor, eattacker, victim, idamage, idflags, smeansofdeath, objweapon, vpoint, vdir, shitloc, psoffsettime, modelindex, partname) {
    if (isdefined(eattacker) && eattacker != victim && idamage >= victim.health) {
        onkillingblow(eattacker, victim);
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14563
// Size: 0xc8
function brgetloadoutoptionforname(optionname) {
    switch (optionname) {
    case #"hash_637736d2cc79a66a":
        return 0;
    case #"hash_6802d55b718bb80c":
        return 1;
    case #"hash_5c4a066eee06656f":
        return 2;
    case #"hash_1044c90df8c82a06":
        return 3;
    case #"hash_b7bf6d462722cd22":
        return 4;
    case #"hash_7e142e28390437c3":
        return 5;
    case #"hash_598a22fbc1839c23":
        return 6;
    case #"hash_20b5567cb6b9bd05":
        return 7;
    case #"hash_13736900bcbfc080":
        return 8;
    case #"hash_d038971dd19d318e":
        return 9;
    default:
        /#
            assertmsg("Invalid loadout option: " + optionname);
        #/
        return 0;
        break;
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14632
// Size: 0x71
function brinitloadoutoption() {
    if (isusingmatchrulesdata()) {
        optionname = getmatchrulesdata("brData", "loadoutOption");
    } else {
        optionname = getdvar(@"hash_f6f24e020168ade8", "pistolarmordropbagtime");
    }
    var_e4aae95542f412af = brgetloadoutoptionforname(optionname);
    level.br_loadout_option = var_e4aae95542f412af;
    level.var_58c406e460511ea8 = getdvarint(@"hash_d70b4de72ad5ad0b", 0);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x146aa
// Size: 0x3d
function brdoesloadoutoptionrequireclassselection() {
    return isdefined(level.br_loadout_option) && (level.br_loadout_option == 1 || level.br_loadout_option == 2 || level.br_loadout_option == 3);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x146ef
// Size: 0x4d
function brdoesloadoutoptionusedropbags() {
    if (namespace_71073fa38f11492::isfeaturedisabled("drogBagLoadout")) {
        return 0;
    }
    return isdefined(level.br_loadout_option) && (level.br_loadout_option == 4 || level.br_loadout_option == 5 || level.br_loadout_option == 6);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14744
// Size: 0x3d
function brareloadoutdropbagsdelayed() {
    if (namespace_71073fa38f11492::isfeaturedisabled("drogBagLoadout")) {
        return 0;
    }
    return isdefined(level.br_loadout_option) && (level.br_loadout_option == 5 || level.br_loadout_option == 6);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14789
// Size: 0x2b
function function_374b5ec4199e8b21() {
    return isdefined(level.br_loadout_option) && istrue(level.var_58c406e460511ea8) && level.br_loadout_option == 6;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x147bc
// Size: 0x2d
function function_d27f645c3282a371() {
    if (namespace_71073fa38f11492::isfeaturedisabled("drogBagLoadout")) {
        return 0;
    }
    return isdefined(level.br_loadout_option) && level.br_loadout_option == 9;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x147f1
// Size: 0x12b
function brgetloadoutdropbagsdelayseconds() {
    var_70bcbf0ad5028219 = [];
    if (!isdefined(level.br_level)) {
        var_70bcbf0ad5028219[var_70bcbf0ad5028219.size] = 1;
        return var_70bcbf0ad5028219;
    }
    var_7e2390b12cb7fc63 = namespace_71073fa38f11492::getbrgametypedata("dropBagDelay");
    if (isdefined(var_7e2390b12cb7fc63)) {
        if (isarray(var_7e2390b12cb7fc63)) {
            var_70bcbf0ad5028219 = var_7e2390b12cb7fc63;
        } else {
            var_70bcbf0ad5028219[var_70bcbf0ad5028219.size] = var_7e2390b12cb7fc63;
        }
        return var_70bcbf0ad5028219;
    }
    var_21be5f4d451efd18 = -15;
    firsttime = namespace_c5622898120e827f::getcircleclosetime(0);
    var_5fd1d7eeebe96215 = max(0, firsttime + var_21be5f4d451efd18);
    var_23f3a96159a40d18 = getdvarfloat(@"hash_b81b25bcd8c7d749", var_5fd1d7eeebe96215);
    var_70bcbf0ad5028219[var_70bcbf0ad5028219.size] = var_23f3a96159a40d18;
    if (getdvarint(@"hash_b29888d711d2b473", 0) && !namespace_71073fa38f11492::isfeatureenabled("dropBagLoop")) {
        var_9c06dbdbe08eb98c = 15;
        var_4cd425aab99f4f0 = namespace_47fd1e79a44628cd::gettimetogulagclosed();
        var_5582e42c9ccdd59 = max(0, var_4cd425aab99f4f0 + var_9c06dbdbe08eb98c);
        var_f2e56fb5a709ff9c = getdvarfloat(@"hash_3771b5264b3f0789", var_5582e42c9ccdd59);
        var_70bcbf0ad5028219[var_70bcbf0ad5028219.size] = var_f2e56fb5a709ff9c;
    }
    return var_70bcbf0ad5028219;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14924
// Size: 0x10d
function function_8209cc6a885e9a2e() {
    var_70bcbf0ad5028219 = [];
    var_7e2390b12cb7fc63 = namespace_71073fa38f11492::getbrgametypedata("dropPlaneDelay");
    if (isdefined(var_7e2390b12cb7fc63)) {
        var_70bcbf0ad5028219[var_70bcbf0ad5028219.size] = var_7e2390b12cb7fc63;
        return var_70bcbf0ad5028219;
    }
    circleindex = getdvarint(@"hash_7073e48b9fd3d775", 1) - 1;
    var_2568210352be1ecf = getdvarint(@"hash_431d9d141b0ff196", 1);
    if (circleindex >= 0) {
        waittime = function_335119d3d9efed24(circleindex, var_2568210352be1ecf);
        var_2c83fae7f97dce2a = getdvarint(@"hash_edb26fb318f05407", 40);
        waittime = max(5, waittime - var_2c83fae7f97dce2a);
        var_70bcbf0ad5028219[var_70bcbf0ad5028219.size] = waittime;
    }
    circleindex = getdvarint(@"hash_c65a2ca664793f10", 4) - 1;
    var_2568210352be1ecf = getdvarint(@"hash_a1fa1d5514626abd", 1);
    if (circleindex >= 0) {
        waittime = function_335119d3d9efed24(circleindex, var_2568210352be1ecf);
        var_2c83fae7f97dce2a = getdvarint(@"hash_3d529093f4ec34e2", 15);
        waittime = max(5, waittime - var_2c83fae7f97dce2a);
        var_70bcbf0ad5028219[var_70bcbf0ad5028219.size] = waittime;
    }
    return var_70bcbf0ad5028219;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14a39
// Size: 0x44
function function_335119d3d9efed24(circleindex, var_2568210352be1ecf) {
    waittime = namespace_c5622898120e827f::getcircleclosetime(circleindex);
    if (!var_2568210352be1ecf) {
        waittime = waittime - level.br_level.br_circleclosetimes[circleindex];
    }
    return waittime;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14a85
// Size: 0x4d
function brdoesloadoutoptiongivestandardloadoutimmediately() {
    return isdefined(level.br_loadout_option) && (level.br_loadout_option == 6 || level.br_loadout_option == 7 || level.br_loadout_option == 8 || level.br_loadout_option == 9);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14ada
// Size: 0x73
function brgetloadoutoptionstandardloadoutindex() {
    /#
        assert(isdefined(level.br_loadout_option));
    #/
    switch (level.br_loadout_option) {
    case 6:
    case 7:
    case 8:
    case 9:
        return 0;
    default:
        /#
            assertmsg("Invalid loadout option");
        #/
        break;
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14b54
// Size: 0x3d
function brdoesloadoutoptiongivecustomweaponsimmediately() {
    return isdefined(level.br_loadout_option) && (level.br_loadout_option == 1 || level.br_loadout_option == 2 || level.br_loadout_option == 3);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14b99
// Size: 0x42
function brgetloadoutammomultiplier() {
    if (isdefined(level.br_loadout_option)) {
        if (level.br_loadout_option == 2) {
            return 0.5;
        } else if (level.br_loadout_option == 3) {
            return 1;
        }
    }
    return 0;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14be3
// Size: 0x22
function brgetloadoutammomax() {
    if (isdefined(level.br_loadout_option)) {
        if (level.br_loadout_option == 2) {
            return 20;
        }
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14c0d
// Size: 0xd
function function_31651d3fd72991aa() {
    return isdefined(level.var_33d4cdf6cb6338fd);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14c22
// Size: 0x22
function function_4043e420432f59f0(var_67765e10502fcd44) {
    var_990bf19e67ec2d89 = undefined;
    var_990bf19e67ec2d89 = namespace_d19129e4fa5d176::preloadandqueueclass(var_67765e10502fcd44);
    return var_990bf19e67ec2d89;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14c4c
// Size: 0x422
function function_10ffa1071b1c2681() {
    var_5fb036c33cddd360 = spawnstruct();
    var_5fb036c33cddd360.primaries = [];
    var_5fb036c33cddd360.ammoclip = [];
    var_5fb036c33cddd360.var_734357a0b88e3a30 = [];
    var_5fb036c33cddd360.ammostock = [];
    var_5fb036c33cddd360.offhands = [];
    var_5fb036c33cddd360.var_aca871f9745fc8 = [];
    var_d39a4e49be46e576 = [];
    var_34ca738e6f3870de = self getweaponslistprimaries();
    foreach (primary in var_34ca738e6f3870de) {
        if (!namespace_68e641469fde3fa7::ismeleeoverrideweapon(primary) && !issubstr(primary.basename, "iw9_me_fists_mp") && !namespace_68e641469fde3fa7::isgunlessweapon(primary.basename) && !namespace_68e641469fde3fa7::function_d3c77884d93d850(primary.basename) && !namespace_68e641469fde3fa7::function_3f15e5e526ff94ce(primary.basename) && !namespace_3bcd40a3005712ec::function_4267b8888db52ea3(primary)) {
            var_d39a4e49be46e576[var_d39a4e49be46e576.size] = primary;
        }
    }
    foreach (weaponobj in var_d39a4e49be46e576) {
        weaponname = getcompleteweaponname(weaponobj);
        var_5fb036c33cddd360.ammoclip[weaponname] = weaponclipsize(weaponobj);
        var_5fb036c33cddd360.ammostock[weaponname] = self getweaponammostock(weaponobj);
        if (namespace_68e641469fde3fa7::isakimbo(weaponobj)) {
            var_5fb036c33cddd360.var_734357a0b88e3a30[weaponname] = self getweaponammoclip(weaponobj, "left");
        }
        if (getsubstr(weaponname, 0, 4) == "alt_") {
            continue;
        }
        var_5fb036c33cddd360.primaries[var_5fb036c33cddd360.primaries.size] = weaponobj;
    }
    if (isdefined(self.lastcacweaponobj) && self.lastcacweaponobj != makeweapon("none")) {
        foreach (primary in var_5fb036c33cddd360.primaries) {
            if (self.lastcacweaponobj == primary) {
                var_5fb036c33cddd360.current = self.lastcacweaponobj;
                break;
            }
        }
    }
    var_a8b87696ab744141 = self getweaponslistoffhands();
    foreach (var_32d16745c91dbe50 in var_a8b87696ab744141) {
        if (var_32d16745c91dbe50.basename == "bandage_br") {
            continue;
        }
        var_26d3ccffc7bebec9 = self getweaponammoclip(var_32d16745c91dbe50);
        if (var_26d3ccffc7bebec9 <= 0) {
            continue;
        }
        var_5fb036c33cddd360.offhands[var_5fb036c33cddd360.offhands.size] = var_32d16745c91dbe50;
        var_fe758e8b3e5f9ec0 = getcompleteweaponname(var_32d16745c91dbe50);
        var_5fb036c33cddd360.ammoclip[var_fe758e8b3e5f9ec0] = var_26d3ccffc7bebec9;
    }
    foreach (slot, var_1189bd7fbe2861f8 in self.equipment) {
        var_5fb036c33cddd360.var_aca871f9745fc8[var_1189bd7fbe2861f8] = slot;
    }
    var_5fb036c33cddd360.super = undefined;
    if (isdefined(self.super) && !self.super.usepercent) {
        var_5fb036c33cddd360.super = self.equipment["super"];
    }
    self.var_5fb036c33cddd360 = var_5fb036c33cddd360;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15075
// Size: 0x41f
function function_7fbb2e52f100474e() {
    self endon("disconnect");
    self takeallweapons(0, 1);
    namespace_3bcd40a3005712ec::br_ammo_player_clear();
    self.equipment["primary"] = undefined;
    self.equipment["secondary"] = undefined;
    self.equipment["health"] = undefined;
    self.equipment["super"] = undefined;
    var_2b1d0e57c66a43d0 = makeweapon("iw9_me_fists_mp");
    if (self.var_5fb036c33cddd360.primaries.size < 2) {
        self giveweapon(var_2b1d0e57c66a43d0);
    }
    var_cf6837e74d470965 = 0;
    foreach (weaponobj in self.var_5fb036c33cddd360.primaries) {
        weaponname = getcompleteweaponname(weaponobj);
        if (namespace_68e641469fde3fa7::function_72ce982d9fc26f1c(weaponobj)) {
            self giveweapon(weaponobj, 0, 0, 0, 1, 1);
        } else {
            namespace_df5cfdbe6e2d3812::_giveweapon(weaponobj);
        }
        if (!var_cf6837e74d470965) {
            self assignweaponprimaryslot(weaponname);
            namespace_df5cfdbe6e2d3812::_switchtoweapon(weaponobj);
            var_cf6837e74d470965 = 1;
        }
        namespace_e0ee43ef2dddadaa::fixupplayerweapons(self, weaponname);
    }
    foreach (var_32d16745c91dbe50 in self.var_5fb036c33cddd360.offhands) {
        var_1189bd7fbe2861f8 = namespace_1a507865f681850e::getequipmentreffromweapon(var_32d16745c91dbe50);
        if (!isdefined(var_1189bd7fbe2861f8)) {
            continue;
        }
        slot = self.var_5fb036c33cddd360.var_aca871f9745fc8[var_1189bd7fbe2861f8];
        if (!isdefined(slot)) {
            continue;
        }
        namespace_1a507865f681850e::giveequipment(var_1189bd7fbe2861f8, slot);
    }
    foreach (weaponname, ammo in self.var_5fb036c33cddd360.ammostock) {
        self setweaponammostock(weaponname, ammo);
        weaponobj = makeweapon(getweaponbasename(weaponname));
        var_811abfdb6c33f17f = namespace_3bcd40a3005712ec::br_ammo_type_for_weapon(weaponobj);
        if (isdefined(var_811abfdb6c33f17f)) {
            self.br_ammo[var_811abfdb6c33f17f] = ammo;
            namespace_3bcd40a3005712ec::br_ammo_player_hud_update_ammotype(var_811abfdb6c33f17f);
        }
    }
    foreach (weaponname, ammo in self.var_5fb036c33cddd360.ammoclip) {
        self setweaponammoclip(weaponname, ammo);
    }
    foreach (weaponname, ammo in self.var_5fb036c33cddd360.var_734357a0b88e3a30) {
        self setweaponammoclip(weaponname, ammo, "left");
    }
    waitframe();
    var_b8f86333b805d701 = var_2b1d0e57c66a43d0;
    if (isdefined(self.var_5fb036c33cddd360.current)) {
        var_b8f86333b805d701 = self.var_5fb036c33cddd360.current;
    } else if (isdefined(self.var_5fb036c33cddd360.primaries[0])) {
        var_b8f86333b805d701 = self.var_5fb036c33cddd360.primaries[0];
    }
    self switchtoweaponimmediate(var_b8f86333b805d701);
    if (isdefined(self.var_5fb036c33cddd360.super)) {
        var_ebec497ff8b18a45 = level.br_pickups.br_superreference[level.br_pickups.br_equipnametoscriptable[self.var_5fb036c33cddd360.super]];
        namespace_cb965d2f71fefddc::forcegivesuper(var_ebec497ff8b18a45, 0);
    }
    thread namespace_46e9069d8502773a::tryreenablescriptablevfx();
    self.var_5fb036c33cddd360 = undefined;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1549b
// Size: 0x7a
function brskipplayerkillcams() {
    foreach (player in level.players) {
        if (isplayer(player) && player isinkillcam()) {
            player notify("abort_killcam");
            player.cancelkillcam = 1;
        }
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1551c
// Size: 0x55
function brhandleinvulnerability(time) {
    var_180fb0a14520c9a9 = getdvarint(@"hash_eddaebb33871cf7d", 30);
    if (var_180fb0a14520c9a9 > time) {
        var_180fb0a14520c9a9 = time;
    }
    wait(time - var_180fb0a14520c9a9);
    level.allowprematchdamage = 0;
    wait(var_180fb0a14520c9a9 / 2);
    brskipplayerkillcams();
    wait(var_180fb0a14520c9a9 / 2);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15578
// Size: 0x35f
function spawnclientbr(var_9156b53bcf7ce573) {
    self endon("disconnect");
    self.var_47f9a068df7c5418 = undefined;
    if (namespace_d3d40f75bb4e4c32::iswaitingtoentergulag(self)) {
        self notify("attempted_spawn");
        namespace_47fd1e79a44628cd::entergulag(self);
        self.waitingtospawn = 0;
    } else if (istrue(self.waitingtospawnamortize) || namespace_d3d40f75bb4e4c32::isrespawningfromtoken(self) || istrue(namespace_71073fa38f11492::runbrgametypefunc("spawnHandled", self))) {
        self notify("attempted_spawn");
        self.waitingtospawn = 0;
    } else if (!namespace_99ac021a7547cae3::mayspawn()) {
        waitframe();
        self notify("attempted_spawn");
        if (istrue(level.infiltransistioning) || istrue(level.snatchspawnalltoc130done) || istrue(level.br_c130spawndone)) {
            if (isdefined(level.brlatespawnplayer)) {
                self thread [[ level.brlatespawnplayer ]]();
            }
            return;
        }
    } else {
        if (istrue(var_9156b53bcf7ce573)) {
            level.snatchspawnalltoc130done = 0;
        }
        if (istrue(level.var_466a09c79541fc26) && !istrue(var_9156b53bcf7ce573)) {
            if (isdefined(level.var_924a9707bdcbfc46)) {
                self thread [[ level.var_924a9707bdcbfc46 ]]();
            }
            return;
        }
        if (istrue(level.infiltransistioning) || istrue(level.snatchspawnalltoc130done) || istrue(level.br_c130spawndone)) {
            if (isdefined(level.brlatespawnplayer)) {
                self thread [[ level.brlatespawnplayer ]]();
            }
            return;
        }
        if (!istrue(level.br_allowloadout)) {
            if (isdefined(level.bypassclasschoicefunc)) {
                self.class = self [[ level.bypassclasschoicefunc ]]();
            } else {
                self.class = pickclassbr();
            }
        }
        if (getdvarint(@"hash_8fd5e2fbd99396a4", 0) == 1) {
            thread function_20f91635cfffbdcf();
        }
        /#
            println("loadoutSecondaryAttachment3");
        #/
        var_4e7e70a167dfad45 = getdvarint(@"hash_c04bdbe0595bf776", 1);
        var_6039638fd494a229 = var_4e7e70a167dfad45 && namespace_d20f8ef223912e12::usedropspawn() && !isbot(self);
        if (var_4e7e70a167dfad45 > 1) {
            var_6039638fd494a229 = var_6039638fd494a229 && !istrue(self.hasspawned);
        }
        if (var_6039638fd494a229) {
            self.prespawnspawn = namespace_d20f8ef223912e12::getspawnpoint(var_6039638fd494a229);
        }
        self.var_2676523c73704bb0 = 1;
        namespace_99ac021a7547cae3::waitandspawnclient(var_9156b53bcf7ce573);
        self freezecontrols(1);
        if (usedropspawn()) {
            thread prematchdeployparachute();
        }
        waitframe();
        if (getsubgametype() != "dmz" && getsubgametype() != "exgm") {
            self skydive_setdeploymentstatus(0);
            self skydive_setbasejumpingstatus(0);
        }
        var_4de859b9228e5cfd = !self isplayerheadless();
        body = namespace_6d8da2b47f878104::getcustomization()["body"];
        var_c30ac8f00cb1cc8a = gettime();
        if (var_4de859b9228e5cfd) {
            while (isalive(self) && isdefined(body) && isdefined(self.weaponlist) && !self hasloadedcustomizationviewmodels(body) && !self hasloadedviewweapons(self.weaponlist)) {
                if (var_c30ac8f00cb1cc8a + 3000 < gettime()) {
                    break;
                }
                waitframe();
            }
            var_de6ef125511e1141 = getdvarfloat(@"hash_3e0e124917f2104b", 1);
            if (var_de6ef125511e1141 > 0) {
                wait(var_de6ef125511e1141);
            }
        }
        self notify("brWaitAndSpawnClientComplete");
        self.waitingtospawn = 0;
        self freezecontrols(0);
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x158de
// Size: 0x2c
function playerexecutionsdisable() {
    if (namespace_f446f6030ca8cff8::hasexecution()) {
        self.savedexecutionref = self.executionref;
        namespace_f446f6030ca8cff8::_clearexecution();
        self disableexecutionattack();
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15911
// Size: 0x31
function playerexecutionsenable() {
    if (isdefined(self.savedexecutionref)) {
        namespace_f446f6030ca8cff8::_giveexecution(self.savedexecutionref);
        self enableexecutionattack();
        self.savedexecutionref = undefined;
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15949
// Size: 0x141
function watchforbrsquadleadershift() {
    level endon("game_ended");
    self notify("br_squad_leader_shift");
    self endon("br_squad_leader_shift");
    player = self;
    teamname = player.team;
    while (1) {
        msg = "";
        if (getsubgametype() == "dmz" || getsubgametype() == "exgm" || getsubgametype() == "plunder" || getsubgametype() == "sandbox" || getsubgametype() == "risk" || getsubgametype() == "rumble_mgl") {
            msg = player waittill_any_return_no_endon_death_2("disconnect", "br_pass_squad_leader");
        } else {
            msg = player waittill_any_return_no_endon_death_4("death", "disconnect", "remove_from_alive_count", "br_pass_squad_leader");
        }
        if (msg == "br_pass_squad_leader") {
            if (!teamhasfreshsquadleadercandidate(teamname)) {
                player playlocalsound("br_pickup_deny");
                continue;
            }
        }
        if (msg != "disconnect") {
            if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
                continue;
            }
            if (!istrue(player.br_infilstarted)) {
                continue;
            }
        }
        if (player abandonbrsquadleader(teamname)) {
            return;
        }
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15a91
// Size: 0x44
function setplayersquadindex(squadindex) {
    player = self;
    var_573aa6be0b25acd9 = player.game_extrainfo & 65528;
    var_573aa6be0b25acd9 = var_573aa6be0b25acd9 | squadindex;
    player.game_extrainfo = var_573aa6be0b25acd9;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15adc
// Size: 0x79
function setplayerbrsquadleader(isleader) {
    player = self;
    if (isleader == player namespace_d3d40f75bb4e4c32::isplayerbrsquadleader()) {
        return;
    }
    player.isbrsquadleader = isleader;
    if (isleader) {
        player.game_extrainfo = player.game_extrainfo | 256;
        player thread watchforbrsquadleadershift();
    } else {
        player.game_extrainfo = player.game_extrainfo & ~256;
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15b5c
// Size: 0x161
function abandonbrsquadleader(teamname) {
    player = self;
    if (!isdefined(teamname)) {
        teamname = player.team;
    }
    if (isdefined(player) && !player namespace_d3d40f75bb4e4c32::isplayerbrsquadleader()) {
        /#
            /#
                assertmsg("Loadout: ");
            #/
        #/
        return 0;
    }
    if (isdefined(player)) {
        player.haspassedsquadleader = 1;
    }
    teamplayers = getteamdata(teamname, "players");
    var_bc415f6b9edcb228 = 0;
    var_980dda0cd0e207d2 = undefined;
    foreach (squadmember in teamplayers) {
        var_382b22d1fddea86f = playerbrsquadleaderscore(squadmember);
        if (var_382b22d1fddea86f > var_bc415f6b9edcb228) {
            var_bc415f6b9edcb228 = var_382b22d1fddea86f;
            var_980dda0cd0e207d2 = squadmember;
        }
    }
    success = 0;
    if (isdefined(var_980dda0cd0e207d2)) {
        if (isdefined(player)) {
            player setplayerbrsquadleader(0);
        }
        var_980dda0cd0e207d2 setplayerbrsquadleader(1);
        success = 1;
        if (!istrue(level.br_c130spawndone) && getsubgametype() == "br") {
            level namespace_d3d40f75bb4e4c32::brleaderdialogplayer("deploy_squad_leader", var_980dda0cd0e207d2, 1, 0);
        }
    }
    updatesquadleaderpassstateforteam(teamname);
    return success;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15cc5
// Size: 0xce
function teamhasfreshsquadleadercandidate(teamname) {
    teamplayers = getteamdata(teamname, "players");
    var_a782b5b8fccc6409 = 0;
    foreach (squadmember in teamplayers) {
        if (!isdefined(squadmember) || squadmember namespace_d3d40f75bb4e4c32::isplayerbrsquadleader()) {
            continue;
        }
        if (!isalive(squadmember)) {
            continue;
        }
        if (squadmember iscodcaster() || squadmember isspectatingplayer()) {
            continue;
        }
        if (squadmember namespace_d3d40f75bb4e4c32::isplayeringulag()) {
            continue;
        }
        if (!istrue(squadmember.haspassedsquadleader)) {
            var_a782b5b8fccc6409 = 1;
            break;
        }
    }
    return var_a782b5b8fccc6409;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15d9b
// Size: 0x87
function updatesquadleaderpassstateforteam(teamname) {
    teamplayers = getteamdata(teamname, "players");
    var_a782b5b8fccc6409 = teamhasfreshsquadleadercandidate(teamname);
    foreach (squadmember in teamplayers) {
        squadmember setclientomnvar("ui_br_squad_leader_can_pass", var_a782b5b8fccc6409);
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15e29
// Size: 0x70
function playerbrsquadleaderscore(player) {
    if (!isdefined(player) || player namespace_d3d40f75bb4e4c32::isplayerbrsquadleader() || player iscodcaster() || player isspectatingplayer() || !isalive(player)) {
        return 0;
    }
    if (player namespace_d3d40f75bb4e4c32::isplayeringulag()) {
        return 1;
    }
    if (istrue(player.inlaststand)) {
        return 2;
    }
    if (istrue(player.haspassedsquadleader)) {
        return 3;
    }
    return 4;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15ea1
// Size: 0xa9
function teamsplashbr(var_1b4ada49a21b51ca, owner, team, optionalnumber, var_42b1e877ab187c6) {
    teamplayers = getteamdata(team, "players");
    foreach (player in teamplayers) {
        if (!istrue(player.gulag)) {
            player thread namespace_44abc05161e2e2cb::showsplash(var_1b4ada49a21b51ca, optionalnumber, owner, undefined, undefined, var_42b1e877ab187c6);
        }
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15f51
// Size: 0xbb
function endsuperdisableweaponbr() {
    var_27cebae05627958 = "super_delay_mp";
    var_d3c112e63bf53ee5 = namespace_85d036cb78063c4a::getcurrentsuper();
    if (isdefined(var_d3c112e63bf53ee5)) {
        var_641083e829d5514c = var_d3c112e63bf53ee5.staticdata.weapon;
        ammo = 0;
        if (namespace_282db5a41b643e19::function_66f0cbd5ff8458fe()) {
            ammo = ter_op(namespace_85d036cb78063c4a::issuperready(), 1, 0);
        } else {
            ammo = ter_op(istrue(self.var_1066fbd86c88a6df), 1, 0);
        }
        _giveweapon(var_641083e829d5514c);
        self setweaponammoclip(var_641083e829d5514c, ammo);
        self assignweaponoffhandspecial(var_641083e829d5514c);
        _takeweapon(var_27cebae05627958);
    }
    self notify("super_disable_end");
    self.var_b310ffbb7df412dd = 1;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16013
// Size: 0x37
function getsuperweapondisabledammobr() {
    ammo = namespace_1a507865f681850e::getequipmentslotammo("super");
    if (!istrue(namespace_85d036cb78063c4a::issuperdisabled())) {
        return ammo;
    }
    if (istrue(self.var_1066fbd86c88a6df)) {
        ammo = 1;
    }
    return ammo;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16052
// Size: 0x262
function onsupportboxusedbyplayer(player, dropstruct) {
    var_509d86412c9d7426 = player getweaponslistprimaries();
    if (player namespace_a2f809133c566621::isjuggernaut()) {
        if (!isdefined(var_509d86412c9d7426) || var_509d86412c9d7426.size == 0) {
            minigun = player getcurrentweapon();
            var_d0bae9fa43b9e424 = player getcurrentweaponclipammo();
            var_e21a1fe75ea20307 = weaponclipsize(minigun);
            if (var_d0bae9fa43b9e424 < var_e21a1fe75ea20307) {
                player setweaponammoclip(minigun, var_e21a1fe75ea20307);
                player hudicontype("br_ammo");
                player playlocalsound("iw9_support_box_use");
                return 1;
            }
        }
    }
    if (!isdefined(dropstruct)) {
        dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
    }
    foreach (weap in var_509d86412c9d7426) {
        ammotype = br_ammo_type_for_weapon(weap);
        if (weap.isalternate && namespace_e0ee43ef2dddadaa::function_de04e13ab01e1a10(weap.underbarrel)) {
            clipammo = weaponclipsize(weap);
            newammo = int(clipammo);
            player setweaponammoclip(weap, newammo);
            continue;
        } else if (namespace_e0ee43ef2dddadaa::isminigunweapon(weap)) {
            player setweaponammoclip(weap, weap.clipsize);
            continue;
        } else if (!isdefined(ammotype)) {
            continue;
        }
        function_c668c8660ab99773(weap, player, dropstruct);
    }
    if (namespace_aead94004cf4c147::function_efab78b72d131d76(player)) {
        var_9ac5e72784815708 = namespace_aead94004cf4c147::function_2985254128b1c262(player);
        function_c668c8660ab99773(var_9ac5e72784815708, player, dropstruct);
    }
    if (isdefined(player.equipment["primary"])) {
        var_117e7dc4f772ce21 = 2;
        function_fb4e05597755dd4c(player, var_117e7dc4f772ce21, player.equipment["primary"], dropstruct);
    }
    if (isdefined(player.equipment["secondary"])) {
        var_117e7dc4f772ce21 = 2;
        function_fb4e05597755dd4c(player, var_117e7dc4f772ce21, player.equipment["secondary"], dropstruct);
    }
    player hudicontype("ammobox");
    namespace_f9accfe6b1adc8f4::supportbox_playusesound(player);
    thread namespace_f9accfe6b1adc8f4::supportbox_onplayeruseanim();
    return 1;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x162bc
// Size: 0xff
function function_fb4e05597755dd4c(player, var_75e244e5f45c894d, equipmentref, dropstruct) {
    var_35a4276ef6519a = player namespace_4fb9dddfb8c1a67a::getequipmentammo(equipmentref);
    var_5ecd4ef83f881c83 = player namespace_4fb9dddfb8c1a67a::getequipmentmaxammo(equipmentref);
    var_bab9e4f8ba9f23d0 = var_5ecd4ef83f881c83 - var_35a4276ef6519a;
    player namespace_1a507865f681850e::incrementequipmentammo(equipmentref, var_35a4276ef6519a + var_bab9e4f8ba9f23d0);
    var_416102a18fc1fd69 = var_75e244e5f45c894d - var_bab9e4f8ba9f23d0;
    if (var_416102a18fc1fd69 > 0) {
        lootid = namespace_38b993c4618e76cd::function_a50b607d2500dda5(equipmentref);
        scriptablename = namespace_38b993c4618e76cd::getScriptableFromLootID(lootid);
        if (istrue(level.var_1aa4ff5576b74b2) && isdefined(dropstruct)) {
            namespace_f9accfe6b1adc8f4::function_225b99924f316bc1(dropstruct, player, scriptablename, var_416102a18fc1fd69);
        } else {
            var_4a9b06aed9f99334 = spawnstruct();
            var_4a9b06aed9f99334.scriptablename = scriptablename;
            var_4a9b06aed9f99334.count = var_416102a18fc1fd69;
            player namespace_aead94004cf4c147::addItemToBackpack(lootid, var_4a9b06aed9f99334);
        }
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x163c2
// Size: 0x18c
function onarmorboxusedbyplayer(player, dropstruct) {
    armoramount = getdvarint(@"hash_796878180a8e250", 6);
    var_3e26af1f7d06878b = "brloot_armor_plate";
    var_9ffb530e039a041 = player namespace_1a507865f681850e::getequipmentslotammo("health");
    var_9ffb530e039a041 = function_53c4c53197386572(var_9ffb530e039a041, 0);
    var_989dbbd449c282ca = player namespace_1a507865f681850e::getequipmentmaxammo("equip_armorplate");
    var_e5dd98c912b3b189 = var_989dbbd449c282ca - var_9ffb530e039a041;
    result = namespace_cb965d2f71fefddc::br_forcegivecustompickupitem(player, var_3e26af1f7d06878b, 1, var_e5dd98c912b3b189, 0);
    if (result) {
        player hudicontype("br_armor");
        var_42ac611ed3e82a3c = armoramount - var_e5dd98c912b3b189;
        if (var_42ac611ed3e82a3c > 0) {
            if (istrue(level.var_f2c468b1d700a1bd)) {
                if (!isdefined(dropstruct)) {
                    dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
                }
                namespace_f9accfe6b1adc8f4::function_225b99924f316bc1(dropstruct, player, var_3e26af1f7d06878b, var_42ac611ed3e82a3c);
            } else {
                var_4a9b06aed9f99334 = spawnstruct();
                var_4a9b06aed9f99334.scriptablename = var_3e26af1f7d06878b;
                var_4a9b06aed9f99334.count = var_42ac611ed3e82a3c;
                lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(var_3e26af1f7d06878b);
                player namespace_aead94004cf4c147::addItemToBackpack(lootid, var_4a9b06aed9f99334);
            }
        }
    } else {
        var_4a9b06aed9f99334 = spawnstruct();
        var_4a9b06aed9f99334.scriptablename = var_3e26af1f7d06878b;
        var_4a9b06aed9f99334.count = armoramount;
        lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(var_3e26af1f7d06878b);
        player namespace_aead94004cf4c147::addItemToBackpack(lootid, var_4a9b06aed9f99334);
    }
    namespace_f9accfe6b1adc8f4::supportbox_playusesound(player);
    thread namespace_f9accfe6b1adc8f4::supportbox_onplayeruseanim();
    return 1;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16556
// Size: 0xe
function function_f41d94b42b42e948(player) {
    return 1;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1656c
// Size: 0xc5
function function_130bc3f5f33bb97d(player) {
    var_456c4271ed8779b9 = "brloot_self_revive";
    result = namespace_cb965d2f71fefddc::br_forcegivecustompickupitem(player, var_456c4271ed8779b9, 1, 1, 0);
    if (result) {
        player hudicontype("br_armor");
        method = namespace_aad14af462a74d08::function_6d40f12a09494350(0, 0);
        method = namespace_aad14af462a74d08::function_6d40f12a09494350(method, 2);
        lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(var_456c4271ed8779b9);
        namespace_aad14af462a74d08::function_d24138b32084fc3e(player, lootid, undefined, method, 1);
    } else {
        var_4a9b06aed9f99334 = spawnstruct();
        var_4a9b06aed9f99334.scriptablename = var_456c4271ed8779b9;
        var_4a9b06aed9f99334.count = 1;
        lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(var_456c4271ed8779b9);
        player namespace_aead94004cf4c147::addItemToBackpack(lootid, var_4a9b06aed9f99334);
    }
    return 1;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16639
// Size: 0x195
function function_f24ae0993efca48f(player) {
    var_d72dfd0df23d5877 = tolower(getdvar(function_2ef675c13ca1c4af(@"hash_af9284300060dcb3", "")));
    if (!isdefined(var_d72dfd0df23d5877) || var_d72dfd0df23d5877 == "") {
        namespace_cb965d2f71fefddc::br_forcegivecustompickupitem(player, "brloot_plate_carrier_2", 1, 1, 0);
    } else {
        itemlist = strtok(var_d72dfd0df23d5877, " ");
        foreach (item in itemlist) {
            if (!isdefined(namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(item))) {
                /#
                    assertmsg("ERROR: Unsupported brloot item ( " + item + " ) Was this item spelled correctly?");
                #/
            } else {
                switch (item) {
                case #"hash_755a9bafcd63b343":
                    namespace_cb965d2f71fefddc::br_forcegivecustompickupitem(player, item, 1, getdvarint(@"hash_e2706d365ad75b50", 3), 0);
                    break;
                case #"hash_1cd9ffa488237604":
                case #"hash_57e5eda4a702c559":
                case #"hash_672892a4af1e94cc":
                case #"hash_f1734c15f85881ca":
                    namespace_cb965d2f71fefddc::br_forcegivecustompickupitem(player, item, 1, getdvarint(@"hash_5970233d0ac3eb9e", 30), 0);
                    break;
                default:
                    namespace_cb965d2f71fefddc::br_forcegivecustompickupitem(player, item, 1, 1, 0);
                    break;
                }
            }
        }
    }
    player hudicontype("br_ammo");
    namespace_f9accfe6b1adc8f4::supportbox_playusesound(player);
    thread namespace_f9accfe6b1adc8f4::supportbox_onplayeruseanim();
    return 1;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x167d6
// Size: 0x14
function airdrop_registercrateforcleanup(crate) {
    registercrateforcleanup(crate);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x167f1
// Size: 0x14
function airdop_brloadoutcratefirstactivation(crate) {
    brloadoutcratefirstactivation(crate);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1680c
// Size: 0xa
function airdrop_makeweaponfromcrate() {
    makeweaponfromcrate();
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1681d
// Size: 0xa
function airdrop_makeitemfromcrate() {
    makeitemfromcrate();
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1682e
// Size: 0x14
function airdrop_makeitemsfromcrate(player) {
    makeitemsfromcrate(player);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16849
// Size: 0x14
function airdrop_br_givedropbagloadout(player) {
    br_givedropbagloadout(player);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16864
// Size: 0x14
function airdrop_bronloadoutcratedestroyed(immediate) {
    bronloadoutcratedestroyed(immediate);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1687f
// Size: 0x22
function onnewequipmentpickup(player, equipmentref) {
    player namespace_cb965d2f71fefddc::handleexplosivepickup(equipmentref, "primary");
}

// Namespace br/namespace_d20f8ef223912e12
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x168a8
// Size: 0xab
function ongrenadeused(weaponname, grenade) {
    switch (weaponname) {
    case #"hash_83ef591efa62a73b":
        thread namespace_35493d8b6027046f::fulton_used(grenade);
        break;
    case #"hash_519ff1c7ffcf10c":
        thread namespace_47fd1e79a44628cd::rock_used(grenade);
        break;
    case #"hash_aacc8564841797ba":
        thread namespace_eaf4e9860fe32d68::function_231a038d18c51203(grenade);
        break;
    default:
        namespace_71073fa38f11492::runbrgametypefunc("onGrenadeUsed", weaponname, grenade);
        break;
    }
    if (weaponname == "rock_mp" && istrue(self.var_47f9a068df7c5418)) {
        grenade delete();
        self.var_47f9a068df7c5418 = undefined;
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1695a
// Size: 0x14
function onweapontaken(var_f42f309550e65575) {
    namespace_3bcd40a3005712ec::takeweaponpickup(var_f42f309550e65575);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16975
// Size: 0x48
function playershouldrespawn() {
    if (namespace_71073fa38f11492::isbrgametypefuncdefined("playerShouldRespawn")) {
        return namespace_71073fa38f11492::runbrgametypefunc("playerShouldRespawn");
    }
    if (!istrue(level.br_prematchstarted)) {
        return 1;
    }
    if (namespace_d3d40f75bb4e4c32::iswaitingtoentergulag(self)) {
        return 1;
    }
    if (namespace_d3d40f75bb4e4c32::isrespawningfromtoken(self)) {
        return 1;
    }
    return 0;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x169c5
// Size: 0x288
function brplayerkilledspawn(var_642470e1abc1bbf9, var_8b3f6477dbed24d7) {
    result = namespace_71073fa38f11492::runbrgametypefunc("playerKilledSpawn", var_642470e1abc1bbf9, var_8b3f6477dbed24d7);
    if (isdefined(result)) {
        return result;
    } else if (getsubgametype() == "plunder" || getsubgametype() == "risk" || getsubgametype() == "kingslayer" || getsubgametype() == "rumble_mgl") {
        if (getdvarint(@"hash_fe3afd6ead4aa523", 1) == 1) {
            if (istrue(isdefined(self.c130))) {
                return 1;
            }
            if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
                return 0;
            }
            if (istrue(var_642470e1abc1bbf9.victim.hasrespawntoken) || istrue(level.useautorespawn)) {
                if (namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
                    if (isbot(var_642470e1abc1bbf9.victim)) {
                        return 1;
                    }
                }
                var_642470e1abc1bbf9.victim thread namespace_8bfdb6eb5a3df67a::function_844bdf70e8a61534();
                teamcount = getteamdata(var_642470e1abc1bbf9.victim.team, "teamCount");
                if (teamcount > 1 && !namespace_71073fa38f11492::isfeaturedisabled("spectateOnDeath")) {
                    var_642470e1abc1bbf9.victim thread namespace_a9c534dc7832aba4::spawnspectator(var_642470e1abc1bbf9, var_8b3f6477dbed24d7, 1);
                }
                return 1;
            }
        } else {
            if (!namespace_4b0406965e556711::gameflag("prematch_done")) {
                return 0;
            }
            if (istrue(var_642470e1abc1bbf9.victim.hasrespawntoken) || istrue(level.useautorespawn)) {
                if (namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
                    if (isbot(var_642470e1abc1bbf9.victim)) {
                        return 1;
                    }
                } else if (!namespace_d3d40f75bb4e4c32::function_d6ae35e0ce14bbaf()) {
                    var_642470e1abc1bbf9.victim thread namespace_99ac021a7547cae3::respawn_asspectator(var_642470e1abc1bbf9.victim.origin + (0, 0, 60), var_642470e1abc1bbf9.victim.angles);
                }
                var_642470e1abc1bbf9.victim thread namespace_8bfdb6eb5a3df67a::function_844bdf70e8a61534();
                return 1;
            }
        }
    } else if (!playershouldrespawn()) {
        if (!namespace_a12dc1d0c8a64946::playershoulddofauxdeath(0) && !namespace_71073fa38f11492::isfeaturedisabled("spectateOnDeath")) {
            var_642470e1abc1bbf9.victim thread namespace_a9c534dc7832aba4::spawnspectator(var_642470e1abc1bbf9, var_8b3f6477dbed24d7);
        } else if (istrue(level.var_b7ad06255200033c)) {
            self.br_spectatorinitialized = 1;
            self notify("br_spectatorInitialized");
        }
        return 1;
    }
    return 0;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16c55
// Size: 0xc3
function brmayconsiderplayerdead(player) {
    result = namespace_71073fa38f11492::runbrgametypefunc("mayConsiderPlayerDead", player);
    if (isdefined(result)) {
        return result;
    }
    if (namespace_4b0406965e556711::gameflag("prematch_done") && issharedfuncdefined("teamAssim", "isEnabled") && [[ getsharedfunc("teamAssim", "isEnabled") ]]() && issharedfuncdefined("teamAssim", "disablePlayer")) {
        [[ getsharedfunc("teamAssim", "disablePlayer") ]](player, "player_dead");
    }
    var_e111bc24345972ff = player namespace_47fd1e79a44628cd::trygulagspawn();
    if (namespace_4b0406965e556711::gameflag("prematch_done") && !var_e111bc24345972ff) {
        namespace_80cec6cfc70c4f95::markplayeraseliminated(player, "brMayConsiderPlayerDead");
    }
    return !var_e111bc24345972ff;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16d20
// Size: 0xd
function unreachable_function() {
    /#
        namespace_a36a697bb5de283b::setup_callbacks();
    #/
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16d34
// Size: 0x65
function monitorweaponswitchbr() {
    level endon("game_ended");
    self endon("disconnect");
    lastweaponchangetime = gettime();
    while (1) {
        self waittill("weapon_change");
        newtime = gettime();
        if (newtime - lastweaponchangetime >= 3000) {
            var_68944c6870da247b = newtime - lastweaponchangetime;
            thread giveweaponxpfromtimebr(var_68944c6870da247b);
        }
        lastweaponchangetime = newtime;
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16da0
// Size: 0x25
function weaponshouldgetxp(weapon) {
    rootname = getweaponrootname(weapon);
    return weaponhasranks(rootname);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16dcd
// Size: 0x76
function weaponhasranks(rootname) {
    if (!isdefined(level.weaponranktable.maxweaponranks[rootname])) {
        return 0;
    }
    var_77492b2ecbe850e2 = level.weaponranktable.maxweaponranks[rootname] > 0;
    /#
        assertex(!var_77492b2ecbe850e2 || isenumvaluevalid("common", "LoadoutWeapon", rootname), """ + rootname + "" has a max weapon rank listed in statstable.csv, but is not in the LoadoutWeapons enum in playerdata");
    #/
    return var_77492b2ecbe850e2;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16e4b
// Size: 0xa5
function announceplayercountlandmarks() {
    var_2fe5e740a0022889 = getdvarfloat(@"hash_7383409df4ea8bd2", 0.6);
    if (!var_2fe5e740a0022889) {
        return;
    }
    level endon("game_ended");
    level waittill("prematch_started");
    if (getdvarint(@"hash_d9f5b4d05943b70c", 0) == 1) {
        level function_773c7f13e1254d74(50, var_2fe5e740a0022889);
        level function_773c7f13e1254d74(25, var_2fe5e740a0022889);
        level function_773c7f13e1254d74(10, var_2fe5e740a0022889);
        level function_773c7f13e1254d74(5, var_2fe5e740a0022889);
    } else {
        level playersleftloop(50, var_2fe5e740a0022889);
        level playersleftloop(25, var_2fe5e740a0022889);
        level playersleftloop(10, var_2fe5e740a0022889);
        level playersleftloop(5, var_2fe5e740a0022889);
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16ef7
// Size: 0x101
function playersleftloop(numplayers, var_2fe5e740a0022889) {
    if (istrue(level.brgametype.var_c435bc516c8091ca)) {
        return;
    }
    if (getdvarint(@"hash_818c699a5caaee4f", 20) * var_2fe5e740a0022889 < numplayers) {
        return;
    }
    level endon("game_ended");
    var_bedb769cc0e5e018 = getbrplayersnoteliminated();
    var_ada79dbc285a1b55 = getsubgametype() == "resurgence" && level.brgametype.var_4ad7c03ec4fa687;
    while (var_bedb769cc0e5e018.size > numplayers) {
        level waittill_either("br_player_eliminated", "players_remaining_changed");
        var_bedb769cc0e5e018 = getbrplayersnoteliminated();
        if (var_bedb769cc0e5e018.size <= numplayers) {
            var_457d1ba9ea64fd1 = !istrue(level.usegulag) || istrue(level.gulag.shutdown);
            if (var_ada79dbc285a1b55 || var_457d1ba9ea64fd1) {
                namespace_d3d40f75bb4e4c32::brleaderdialog("top_" + numplayers, 0, undefined, 1);
            }
            break;
        }
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16fff
// Size: 0x241
function function_773c7f13e1254d74(numplayers, var_2fe5e740a0022889) {
    if (getdvarint(@"hash_818c699a5caaee4f", 20) * var_2fe5e740a0022889 < numplayers) {
        return;
    }
    level endon("game_ended");
    var_bedb769cc0e5e018 = getbrplayersnoteliminated();
    var_ada79dbc285a1b55 = getsubgametype() == "resurgence" && level.brgametype.var_4ad7c03ec4fa687;
    var_9ea582cfef3850c6 = [];
    var_a4c3a5afe5b8da9b = [];
    for (i = 0; i < var_bedb769cc0e5e018.size; i++) {
        player = var_bedb769cc0e5e018[i];
        if (player function_7dbb8165d792b06c()) {
            continue;
        }
        if (!isdefined(var_a4c3a5afe5b8da9b[player.team])) {
            var_a4c3a5afe5b8da9b[player.team] = 1;
            var_9ea582cfef3850c6[var_9ea582cfef3850c6.size] = player.team;
        }
    }
    while (var_bedb769cc0e5e018.size > numplayers && var_9ea582cfef3850c6.size > 0) {
        level waittill_either("br_player_eliminated", "players_remaining_changed");
        var_bedb769cc0e5e018 = getbrplayersnoteliminated();
        var_8986cc772c6de270 = [];
        foreach (team in var_9ea582cfef3850c6) {
            var_dadcb19d1b7db056 = getteamdata(team, "alivePlayers");
            if (!isdefined(var_dadcb19d1b7db056)) {
                var_dadcb19d1b7db056 = [];
            }
            if (var_bedb769cc0e5e018.size - var_dadcb19d1b7db056.size <= numplayers) {
                var_457d1ba9ea64fd1 = !istrue(level.usegulag) || istrue(level.gulag.shutdown);
                if (var_ada79dbc285a1b55 || var_457d1ba9ea64fd1) {
                    namespace_d3d40f75bb4e4c32::brleaderdialogteam("top_" + numplayers, team, 0, undefined, 1);
                }
                var_8986cc772c6de270[var_8986cc772c6de270.size] = team;
            }
        }
        foreach (team in var_8986cc772c6de270) {
            var_9ea582cfef3850c6 = array_remove(var_9ea582cfef3850c6, team);
        }
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17247
// Size: 0x9a
function getbrplayersnoteliminated() {
    var_f7bc4ef9c5601076 = [];
    foreach (player in level.players) {
        if (istrue(player.br_iseliminated)) {
            continue;
        }
        if (player playeriszombie()) {
            continue;
        }
        if (level.codcasterenabled) {
            jumpiffalse(player iscodcaster()) LOC_0000007f;
        } else {
        LOC_0000007f:
            var_f7bc4ef9c5601076[var_f7bc4ef9c5601076.size] = player;
        }
    }
    return var_f7bc4ef9c5601076;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x172e9
// Size: 0xe7
function function_f297f4741391514d() {
    var_c0bddb9fbe492af7 = [];
    foreach (team in level.teamnamelist) {
        if (function_f8167aab51948bf0(team)) {
            continue;
        }
        foreach (player in getteamdata(team, "players")) {
            if (player playeriszombie()) {
                continue;
            }
            if (level.codcasterenabled) {
                jumpiffalse(player iscodcaster()) LOC_000000b8;
            } else {
            LOC_000000b8:
                var_c0bddb9fbe492af7[var_c0bddb9fbe492af7.size] = player;
            }
        }
    }
    return var_c0bddb9fbe492af7;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x173d8
// Size: 0x50
function function_f8167aab51948bf0(team) {
    var_7b7b91fce61d92f0 = getteamdata(team, "aliveCount") == 0;
    teamcanrespawn = isdefined(level.teamcanrespawn) && istrue(level.teamcanrespawn[team]);
    return var_7b7b91fce61d92f0 && !teamcanrespawn;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17430
// Size: 0xea
function resetafkchecks(player, var_8feafcea3627eb2b) {
    if (isdefined(player.gulaguses) && player.gulaguses > 0 || istrue(player.ffsm_isgulagrespawn) || istrue(var_8feafcea3627eb2b)) {
        player.ignoreafkcheck = 0;
        if (!istrue(player.pers["distTrackingPassed"])) {
            player.pers["distTrackingPassedOrResetTime"] = player namespace_6d8da2b47f878104::function_19300abfbb10928b();
            player thread namespace_99ac021a7547cae3::totaldisttracking(player.origin);
        } else {
            player notify("afk_tracking_resume");
        }
        return;
    }
    player.pers["distTrackingPassed"] = 0;
    player.pers["totalDistTraveledAFK"] = 0;
    player.var_cb9581fc7ff5f394 = undefined;
    player thread namespace_99ac021a7547cae3::totaldisttracking(player.origin);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17521
// Size: 0x2c
function function_49738978a130d729(player) {
    level endon("game_ended");
    player endon("death_or_disconnect");
    player waittill("laststand_revived");
    function_f7fc6d074e78a084(player, 1);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17554
// Size: 0x34
function onfirstlandcallback(player) {
    if (!isreallyalive(player)) {
        return;
    }
    if (isinlaststand(player)) {
        level thread function_49738978a130d729(player);
        return;
    }
    function_f7fc6d074e78a084(player);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1758f
// Size: 0x3f
function function_b6c2bd8342c0670e(player) {
    level endon("game_ended");
    player endon("death_or_disconnect");
    while (1) {
        if (!player isswimming()) {
            player.var_91a2b1303b861667 = undefined;
            break;
        }
        wait(0.5);
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x175d5
// Size: 0xf7
function function_f7fc6d074e78a084(player, var_8feafcea3627eb2b) {
    if (!isdefined(var_8feafcea3627eb2b)) {
        var_8feafcea3627eb2b = 0;
    }
    resetafkchecks(player, var_8feafcea3627eb2b);
    player.brneverlanded = undefined;
    player calloutmarkerping_squadleaderbeaconplayerfirstlanded();
    level thread function_b6c2bd8342c0670e(player);
    if (getdvarint(@"hash_9f0aea8fba119184", 1) == 1) {
        player namespace_f8065cafc523dba5::function_6fb380927695ee76(1);
    }
    if (istrue(level.var_387cd21817428092)) {
        if (level.var_387cd21817428092 != 0) {
            if (!istrue(level.teamdata[player.team]["squadBoonDropped"])) {
                if (namespace_4b0406965e556711::gameflag("prematch_done") && namespace_4b0406965e556711::gameflag("br_ready_to_jump")) {
                    if (player namespace_d3d40f75bb4e4c32::isplayerbrsquadleader()) {
                        player function_90011db2fca825a8();
                        level.teamdata[player.team]["squadBoonDropped"] = 1;
                    }
                }
            }
        }
    }
    namespace_71073fa38f11492::runbrgametypefunc("onPlayerFirstLand", player);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x176d3
// Size: 0x1f9
function updatesquadmemberlaststandreviveprogress(revivee, reviver, progress, var_979d1594b4f7f7be) {
    /#
        assert(isdefined(revivee) && isdefined(reviver));
    #/
    if (namespace_ca7b90256548aa40::shouldmodesetsquads()) {
        if (!isdefined(level.br_squadrevivestatus)) {
            level.br_squadrevivestatus = [];
        }
        var_70401238acb839bc = get_int_or_0(level.br_squadrevivestatus[revivee.team]);
        if (!isalive(revivee)) {
            var_979d1594b4f7f7be = 1;
            progress = 0;
        }
        var_53b0b2667f5ceb2 = revivee == reviver;
        squadindex = revivee.var_3f78c6a0862f9e25;
        var_98c2f6161f41a683 = int(ceil(clamp(progress, 0, 1) * 15));
        var_b792d342072a35c0 = var_98c2f6161f41a683;
        if (istrue(var_979d1594b4f7f7be)) {
            revivee namespace_d3d40f75bb4e4c32::setplayerselfrevivingextrainfo(0);
        } else if (var_53b0b2667f5ceb2) {
            revivee namespace_d3d40f75bb4e4c32::setplayerselfrevivingextrainfo(1);
        }
        if (squadindex == -1) {
            return;
        }
        var_64571e3aeccd1a07 = squadindex * 5;
        var_b27d0eff739466e0 = (var_b792d342072a35c0 & 31) << var_64571e3aeccd1a07;
        var_f8f977081d3da8b4 = ~(31 << var_64571e3aeccd1a07);
        var_ed711aeaf5e8cb76 = var_70401238acb839bc & var_f8f977081d3da8b4;
        var_454d6756fb16ff83 = var_ed711aeaf5e8cb76 + var_b27d0eff739466e0;
        level.br_squadrevivestatus[revivee.team] = var_454d6756fb16ff83;
        teammates = getteamdata(revivee.team, "players");
        if (isdefined(teammates) && teammates.size > 0) {
            foreach (teammate in teammates) {
                teammate setclientomnvar("ui_br_squad_revive_status", var_454d6756fb16ff83);
            }
        }
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x178d3
// Size: 0x1a6
function calculateclientmatchdataextrainfopayload(player) {
    var_53cf4afa40bcddc4 = [0:0, 1:0, 2:0, 3:0];
    if (isdefined(player) && isdefined(player.brmissiontypescompleted)) {
        var_b6a02fdcef39dd11 = 0;
        foreach (var_5744fafd565864d7, var_cfbaa84bf8594e2a in player.brmissiontypescompleted) {
            contractid = undefined;
            if (getdvarint(@"hash_82bde055b11e6698", 0)) {
                contractid = namespace_4bc0ead8d2af3d84::getquesttableindex(var_5744fafd565864d7);
            } else {
                contractid = namespace_1eb3c4e0e28fac71::getquesttableindex(var_5744fafd565864d7);
            }
            /#
                assert(contractid < 15);
            #/
            var_7417822db1ebf4b1 = int(clamp(var_cfbaa84bf8594e2a, 0, 15)) << 4;
            var_53cf4afa40bcddc4[var_b6a02fdcef39dd11] = var_7417822db1ebf4b1 + contractid;
            var_b6a02fdcef39dd11++;
            if (var_b6a02fdcef39dd11 >= 4) {
                break;
            }
        }
    }
    var_6207408622bd0e3e = [];
    var_6207408622bd0e3e[0] = (var_53cf4afa40bcddc4[0] << 8) + var_53cf4afa40bcddc4[1];
    var_6207408622bd0e3e[1] = (var_53cf4afa40bcddc4[2] << 8) + var_53cf4afa40bcddc4[3];
    var_6207408622bd0e3e[2] = get_int_or_0(player.br_contractxpearned);
    var_1b83acb5f45683ac = int(clamp(get_int_or_0(player.var_3f78c6a0862f9e25) - 1, 0, 3));
    var_6207408622bd0e3e[3] = var_1b83acb5f45683ac << 14;
    var_6207408622bd0e3e[3] = var_6207408622bd0e3e[3] + get_int_or_0(player namespace_3c5a4254f2b957ea::getpersstat("damage"));
    return var_6207408622bd0e3e;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17a81
// Size: 0x11c
function onplayerconnectstream() {
    if (!isdefined(self.sessionteam) || self.sessionteam == "spectator" || self.sessionteam == "none" || isdefined(self.initialprespawn) || self isplayerheadless()) {
        return 0;
    }
    if (istrue(level.codcasterenabled) && self iscodcaster()) {
        return 1;
    }
    if (isBrPracticeMode() && !isbot(self)) {
        self setclientomnvar("ui_br_extended_load_screen", 1);
        return 0;
    }
    if (!usedropspawn()) {
        return 1;
    }
    spawnpoint = getspawnpoint();
    self.initialprespawn = spawnpoint;
    self setclientomnvar("ui_br_extended_load_screen", 1);
    droporigin = playerstreamhintdroptoground(spawnpoint.origin);
    spawnintermission(droporigin, spawnpoint.angles);
    timeout = getdvarint(@"hash_3f23e1c2bbc2681a", 15000);
    namespace_d3d40f75bb4e4c32::playerstreamhintlocation(droporigin, timeout, 1, 1);
    return 0;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17ba5
// Size: 0x8c
function function_67a646dc2b984dac() {
    if (!isdefined(self.sessionteam) || self.sessionteam == "spectator" || self.sessionteam == "none" || self isplayerheadless()) {
        return 0;
    }
    spawnpoint = self getorigin();
    self setclientomnvar("ui_br_extended_load_screen", 1);
    timeout = getdvarint(@"hash_3f23e1c2bbc2681a", 15000);
    namespace_d3d40f75bb4e4c32::playerstreamhintlocation(spawnpoint, timeout, 1, 1);
    return 0;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17c39
// Size: 0x20
function playerisstreaming() {
    return self.sessionstate == "intermission" && isdefined(self.initialprespawn);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17c61
// Size: 0x3a
function lastdroppableweaponchanged() {
    var_ee490a6916fe49b7 = -1;
    if (isdefined(self.lastdroppableweaponobj)) {
        var_ee490a6916fe49b7 = getweaponindex(self.lastdroppableweaponobj);
    }
    self setclientomnvar("ui_br_last_droppable_weapon", var_ee490a6916fe49b7);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17ca2
// Size: 0x2f
function brregenhealthadd(var_7c90dd5575d81006) {
    var_15123138426896f0 = namespace_71073fa38f11492::runbrgametypefunc("regenHealthAdd", var_7c90dd5575d81006);
    if (isdefined(var_15123138426896f0)) {
        return var_15123138426896f0;
    } else {
        return var_7c90dd5575d81006;
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17cd8
// Size: 0x2f
function brregendelayspeed(var_1f1bd121b3eaa21) {
    var_15123138426896f0 = namespace_71073fa38f11492::runbrgametypefunc("regenDelaySpeed", var_1f1bd121b3eaa21);
    if (isdefined(var_15123138426896f0)) {
        return var_15123138426896f0;
    } else {
        return var_1f1bd121b3eaa21;
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17d0e
// Size: 0x36
function brmodeaddtoteamlives(player, team, context) {
    namespace_71073fa38f11492::runbrgametypefunc("addToTeamLives", player, team);
    player namespace_80cec6cfc70c4f95::function_b5483af58ee9f2c3(1, team, context);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17d4b
// Size: 0x35
function brmoderemovefromteamlives(player, team, context) {
    namespace_71073fa38f11492::runbrgametypefunc("removeFromTeamLives", player, team);
    player namespace_80cec6cfc70c4f95::function_b5483af58ee9f2c3(0, team, context);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17d87
// Size: 0x21c
function updateplayerandteamcountui() {
    level notify("updatePlayerAndTeamCountUI");
    level endon("updatePlayerAndTeamCountUI");
    waittillframeend();
    if (namespace_71073fa38f11492::isbrgametypefuncdefined("updatePlayerAndTeamCountUI")) {
        namespace_71073fa38f11492::runbrgametypefunc("updatePlayerAndTeamCountUI");
        return;
    }
    totalplayers = level.players.size;
    aliveplayercount = 0;
    var_35068b9b9dc4c73f = 0;
    var_a4c3a5afe5b8da9b = [];
    for (i = 0; i < totalplayers; i++) {
        player = level.players[i];
        if (player function_7dbb8165d792b06c() || player.team == "spectator" || player.team == "codcaster") {
            continue;
        }
        if (!istrue(player.br_iseliminated)) {
            if (istrue(player.iszombie)) {
                var_35068b9b9dc4c73f++;
            } else {
                aliveplayercount++;
                var_a4c3a5afe5b8da9b[player.team] = 1;
            }
        }
        if (!isdefined(var_a4c3a5afe5b8da9b[player.team])) {
            result = namespace_71073fa38f11492::runbrgametypefunc("isTeamEliminated", player.team);
            if (isdefined(result)) {
                if (!result) {
                    var_a4c3a5afe5b8da9b[player.team] = 1;
                }
            }
        }
    }
    foreach (var_b4adde4c68bb0f24 in function_749723c2a45a0233()) {
        aliveplayercount++;
        var_a4c3a5afe5b8da9b[var_b4adde4c68bb0f24.team] = 1;
    }
    /#
        var_6837562bca96ad34 = int(pow(2, 8)) - 1;
        /#
            assert(var_35068b9b9dc4c73f <= var_6837562bca96ad34);
        #/
        /#
            assert(aliveplayercount <= var_6837562bca96ad34);
        #/
        /#
            assert(var_a4c3a5afe5b8da9b.size <= var_6837562bca96ad34);
        #/
    #/
    var_47bf15e70ee220a = (var_35068b9b9dc4c73f << 16) + (var_a4c3a5afe5b8da9b.size << 8) + aliveplayercount;
    setomnvar("ui_br_match_stats", var_47bf15e70ee220a);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17faa
// Size: 0x851
function br_updategameevents() {
    totalplayers = 0;
    level.teamswithplayers = [];
    var_9aa4910df893fab = 0;
    foreach (team in level.teamnamelist) {
        teamcount = getteamdata(team, "teamCount");
        if (isdefined(level.var_7b37b2193f163b9b)) {
            teamcount = teamcount + getteamdata(team, "UIBotCount");
        }
        if (teamcount) {
            totalplayers = totalplayers + teamcount;
            var_9aa4910df893fab++;
            level.teamswithplayers[level.teamswithplayers.size] = team;
            if (var_9aa4910df893fab > 1) {
                break;
            }
        }
    }
    if (matchmakinggame() && !level.ingraceperiod && (!isdefined(level.disableforfeit) || !level.disableforfeit) && !namespace_36f464722d326bbe::function_fa7bfcc1d68b7b73()) {
        if (level.teambased) {
            if (level.teamswithplayers.size == 1 && game["state"] == "playing") {
                thread namespace_d576b6dc7cef9c62::onforfeit(level.teamswithplayers[0]);
                return;
            }
            if (level.teamswithplayers.size > 1) {
                level.forfeitinprogress = undefined;
                level notify("abort_forfeit");
            }
        } else {
            if (totalplayers == 1 && level.maxplayercount > 1) {
                thread namespace_d576b6dc7cef9c62::onforfeit();
                return;
            }
            if (totalplayers > 1) {
                level.forfeitinprogress = undefined;
                level notify("abort_forfeit");
            }
        }
    }
    if (level.teamswithplayers.size == 1 && istrue(level.br_debugsolotest)) {
        return;
    }
    if (!getgametypenumlives() && (!isdefined(level.disablespawning) || !level.disablespawning)) {
        return;
    }
    if (!gamehasstarted()) {
        return;
    }
    if (level.ingraceperiod && !isdefined(level.overrideingraceperiod)) {
        return;
    }
    br_checkforlaststandfinish();
    if (isdefined(level.checkforlaststandwipe)) {
        [[ level.checkforlaststandwipe ]]();
    }
    if (level.teambased) {
        livescount = [];
        var_3ed276c562480671 = 0;
        var_4351d3695cbe4fd7 = 0;
        var_3c4188e57ee38e07 = [];
        var_388b9e43b508cd03 = [];
        var_86e43c44ce72320b = 0;
        foreach (entry in level.teamnamelist) {
            livescount[entry] = 0;
            var_8194f843d1b15396 = 0;
            if (!istrue(level.disablespawning)) {
                foreach (player in getteamdata(entry, "players")) {
                    if (!istrue(player.hasspawned) || player.team == "spectator" || player.team == "codcaster" || player.team == "free") {
                        continue;
                    }
                    if (player namespace_3c5a4254f2b957ea::getpersstat("lives")) {
                        livescount[entry] = livescount[entry] + player namespace_3c5a4254f2b957ea::getpersstat("lives");
                        var_3ed276c562480671 = 1;
                    }
                    if (isdefined(level.var_e12707853f4ca495)) {
                        var_da4225c984f1ac5e = 1;
                        if (istrue([[ level.var_e12707853f4ca495 ]](player, var_da4225c984f1ac5e))) {
                            var_8194f843d1b15396 = 1;
                            var_86e43c44ce72320b = 1;
                        }
                    }
                }
            }
            alivecount = getteamdata(entry, "aliveCount");
            UIBotCount = function_d0f9fbf3f0f8c739(entry);
            var_f5ed82f1f755bb2d = alivecount > 0 || UIBotCount > 0;
            if (!var_4351d3695cbe4fd7 && var_f5ed82f1f755bb2d) {
                var_4351d3695cbe4fd7 = 1;
            }
            alivecount = alivecount + UIBotCount;
            var_4f212c7c91f56842 = 1;
            result = namespace_71073fa38f11492::runbrgametypefunc("isTeamEliminated", entry);
            if (isdefined(result)) {
                if (!result) {
                    var_4f212c7c91f56842 = 0;
                }
            }
            if (istrue(var_8194f843d1b15396)) {
                var_4f212c7c91f56842 = 0;
            }
            if (var_4f212c7c91f56842 && getteamdata(entry, "hasSpawned") && !var_f5ed82f1f755bb2d && !livescount[entry] && !getteamdata(entry, "deathEvent")) {
                var_3c4188e57ee38e07[var_3c4188e57ee38e07.size] = entry;
            } else if (alivecount == 1) {
                if (gettime() > getteamdata(entry, "oneLeftTime") + 5000 && !getteamdata(entry, "oneLeft")) {
                    var_91595db4ccf80384 = 0;
                    players = getteamdata(entry, "players");
                    foreach (player in players) {
                        if (!isalive(player)) {
                            var_91595db4ccf80384 = var_91595db4ccf80384 + player namespace_3c5a4254f2b957ea::getpersstat("lives");
                        }
                    }
                    if (var_91595db4ccf80384 == 0) {
                        setteamdata(entry, "oneLeftTime", gettime());
                        setteamdata(entry, "oneLeft", 1);
                        if (players.size + UIBotCount > 1) {
                            [[ level.ononeleftevent ]](entry);
                        }
                    }
                }
            } else {
                setteamdata(entry, "oneLeft", 0);
            }
        }
        if (!var_4351d3695cbe4fd7 && !var_3ed276c562480671 && !istrue(var_86e43c44ce72320b)) {
            if (istrue(level.postgameexfil) && level.gameended) {
                level notify("exfil_continue_game_end");
            }
            if (istrue(level.nukeinfo.var_9dccaba98b643cad)) {
                return;
            }
            return [[ level.ondeadevent ]]("all");
        }
        if (istrue(level.postgameexfil) && level.gameended) {
            level notify("exfil_continue_game_end");
        }
        if (!istrue(level.skipondeadevent) && !istrue(level.nukeinfo.var_9dccaba98b643cad)) {
            foreach (entry in var_3c4188e57ee38e07) {
                if (level.multiteambased) {
                    setteamdata(entry, "deathEvent", 1);
                    [[ level.ondeadevent ]](entry);
                } else {
                    return [[ level.ondeadevent ]](entry);
                }
            }
        }
    } else {
        livescount = 0;
        foreach (player in level.players) {
            if (player.team == "spectator" || player.team == "codcaster") {
                continue;
            }
            livescount = livescount + player namespace_3c5a4254f2b957ea::getpersstat("lives");
        }
        var_1f7bcaa53ca6d399 = 0;
        foreach (entry in level.teamnamelist) {
            var_1f7bcaa53ca6d399 = var_1f7bcaa53ca6d399 + getteamdata(entry, "aliveCount");
        }
        if (!var_1f7bcaa53ca6d399 && !livescount) {
            if (istrue(level.nukeinfo.var_9dccaba98b643cad)) {
                return;
            }
            return [[ level.ondeadevent ]]("all");
        }
        var_677ae66df2125f53 = getpotentiallivingplayers();
        if (var_677ae66df2125f53.size == 1) {
            return [[ level.ononeleftevent ]]("all");
        }
    }
    namespace_71073fa38f11492::runbrgametypefunc("postUpdateGameEvents");
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18802
// Size: 0x21
function lowpopallowtweaks() {
    return istrue(level.lowpopcheck) && getdvarint(@"hash_7c1f8a5958fe9d4", 1);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1882b
// Size: 0x3c
function br_laststandfinishplayerisincapacitated(var_a11643fdeedee81b) {
    var_f750eac01a3c640a = istrue(var_a11643fdeedee81b) && namespace_47fd1e79a44628cd::checkgulagusecount();
    return istrue(self.inlaststand) && !namespace_d3d40f75bb4e4c32::hasselfrevivetoken() && !var_f750eac01a3c640a;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1886f
// Size: 0x315
function br_highlightlaststandfinishplayers() {
    attackers = [];
    victims = [];
    var_a11643fdeedee81b = isdefined(level.gulag) && !istrue(level.gulag.shutdown);
    if (level.teambased) {
        foreach (entry in level.teamnamelist) {
            var_17077b9dae232349 = 0;
            foreach (player in level.teamdata[entry]["alivePlayers"]) {
                if (player br_laststandfinishplayerisincapacitated(var_a11643fdeedee81b)) {
                    continue;
                }
                var_17077b9dae232349 = 1;
                break;
            }
            if (var_17077b9dae232349) {
                foreach (player in level.teamdata[entry]["alivePlayers"]) {
                    if (player br_laststandfinishplayerisincapacitated(var_a11643fdeedee81b)) {
                        continue;
                    }
                    attackers[attackers.size] = player;
                }
            } else {
                foreach (player in level.teamdata[entry]["alivePlayers"]) {
                    if (player br_laststandfinishplayerisincapacitated(var_a11643fdeedee81b)) {
                        victims[victims.size] = player;
                    }
                }
            }
        }
    } else {
        foreach (player in level.players) {
            if (player br_laststandfinishplayerisincapacitated(var_a11643fdeedee81b)) {
                victims[victims.size] = player;
            } else if (isalive(player)) {
                attackers[attackers.size] = player;
            }
        }
    }
    if (!namespace_d3d40f75bb4e4c32::istutorial()) {
        namespace_d3d40f75bb4e4c32::brleaderdialog("finish_calls", 0, attackers);
        foreach (player in attackers) {
            player setclientomnvar("ui_br_end_game_splash_type", 19);
            player playlocalsound("br_finish_them_splash");
        }
        foreach (player in victims) {
            player hudoutlineenable("outline_nodepth_red");
        }
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18b8b
// Size: 0x22e
function br_checkforlaststandfinish() {
    if (!getdvarint(@"hash_9513d33b9343f1a0", 0)) {
        return;
    }
    if (istrue(level.laststandfinisherdone)) {
        return;
    }
    if (getsubgametype() == "plunder" || getsubgametype() == "risk" || getsubgametype() == "kingslayer" || getsubgametype() == "rumble_mgl") {
        return;
    }
    var_a11643fdeedee81b = isdefined(level.gulag) && !istrue(level.gulag.shutdown);
    var_90b405fe6856a3a4 = 0;
    var_1d0bd18dd6759d61 = 0;
    if (level.teambased) {
        foreach (entry in level.teamnamelist) {
            var_17077b9dae232349 = 0;
            foreach (player in level.teamdata[entry]["alivePlayers"]) {
                if (player br_laststandfinishplayerisincapacitated(var_a11643fdeedee81b)) {
                    var_1d0bd18dd6759d61 = 1;
                } else {
                    var_17077b9dae232349 = 1;
                    break;
                }
            }
            if (var_17077b9dae232349) {
                var_90b405fe6856a3a4++;
                if (var_90b405fe6856a3a4 > 1) {
                    return;
                }
            }
        }
    } else {
        foreach (player in level.players) {
            if (!isalive(player)) {
                continue;
            }
            if (player br_laststandfinishplayerisincapacitated(var_a11643fdeedee81b)) {
                var_1d0bd18dd6759d61 = 1;
            } else {
                var_90b405fe6856a3a4++;
                if (var_90b405fe6856a3a4 > 1) {
                    return;
                }
            }
        }
    }
    if (var_90b405fe6856a3a4 == 0 || !var_1d0bd18dd6759d61) {
        return;
    }
    /#
        assert(var_90b405fe6856a3a4 == 1);
    #/
    level.laststandfinisherdone = 1;
    br_highlightlaststandfinishplayers();
}

// Namespace br/namespace_d20f8ef223912e12
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18dc0
// Size: 0x5ff
function br_checkforlaststandwipe(victim, var_9c14ae6e04bbd667) {
    if (!getdvarint(@"hash_b11f030e3dc6e3ff", 1)) {
        return 0;
    }
    if (istrue(isBrPracticeMode())) {
        return 0;
    }
    if (isdefined(level.var_f44d8c2d0a8691a8)) {
        return 0;
    }
    level.var_f44d8c2d0a8691a8 = 1;
    var_a11643fdeedee81b = isdefined(level.gulag) && !istrue(level.gulag.shutdown);
    var_f22fb09a173dcc1c = [];
    var_c9fa03a7d2163c24 = 0;
    var_6a9853a7ef309b8f = [];
    var_fa2dfb970d051f16 = [];
    foreach (entry in level.teamnamelist) {
        var_b1fd2c57a16c6e04 = 1;
        var_f22fb09a173dcc1c = [];
        var_7b618684adbe33f6 = 0;
        foreach (player in level.teamdata[entry]["alivePlayers"]) {
            var_1b7f5108008d55b6 = istrue(var_a11643fdeedee81b) && player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag();
            if (var_1b7f5108008d55b6) {
                continue;
            }
            if (istrue(var_9c14ae6e04bbd667) && isdefined(victim) && victim == player) {
                var_7b618684adbe33f6 = 1;
            } else {
                isinlaststand = istrue(player.inlaststand) || isdefined(victim) && victim == player;
                if (isinlaststand && !player namespace_d3d40f75bb4e4c32::hasselfrevivetoken() && !istrue(player namespace_833bd5cc623ca701::function_a35fff2ff233592a()) && !player playeriszombie()) {
                    var_f22fb09a173dcc1c[var_f22fb09a173dcc1c.size] = player;
                } else {
                    var_b1fd2c57a16c6e04 = 0;
                    break;
                }
            }
        }
        var_db5c349fb62d9ac6 = !istrue(level.brgametype.var_b43745b85f249e68) && var_b1fd2c57a16c6e04 && (var_f22fb09a173dcc1c.size > 0 || istrue(var_9c14ae6e04bbd667) && var_7b618684adbe33f6);
        if (istrue(var_db5c349fb62d9ac6)) {
            var_39341f43dd2cc6f0 = istrue(level.brgametype.var_c42e40ec22a1f0d4) && isdefined(victim) && istrue(victim.var_1e309fa83f9fbe2e) && (!isdefined(victim.respawndelay) || victim.respawndelay <= 0);
            var_db5c349fb62d9ac6 = !istrue(var_39341f43dd2cc6f0);
            if (var_39341f43dd2cc6f0) {
                var_c9fa03a7d2163c24 = 1;
            }
        }
        if (istrue(var_db5c349fb62d9ac6)) {
            attackers = [];
            foreach (var_e3d55abd84ad4ca9 in var_f22fb09a173dcc1c) {
                if (isdefined(var_e3d55abd84ad4ca9.laststandattacker) && !array_contains(attackers, var_e3d55abd84ad4ca9.laststandattacker)) {
                    var_e3d55abd84ad4ca9.laststandattacker.wipeweapon = var_e3d55abd84ad4ca9.laststandweaponobj;
                    attackers[attackers.size] = var_e3d55abd84ad4ca9.laststandattacker;
                }
                if (isdefined(victim) && victim == var_e3d55abd84ad4ca9) {
                    var_c9fa03a7d2163c24 = 1;
                }
                var_e3d55abd84ad4ca9 notify("squad_wipe_death");
                var_e3d55abd84ad4ca9.squadwiped = 1;
                var_e3d55abd84ad4ca9.var_4ce88b2dfe0bfa52 = 1;
                var_e3d55abd84ad4ca9 _suicide(0);
                var_e3d55abd84ad4ca9.var_4ce88b2dfe0bfa52 = undefined;
            }
            if (istrue(var_9c14ae6e04bbd667) && isdefined(victim) && isdefined(victim.laststandattacker) && !array_contains(attackers, victim.laststandattacker)) {
                attackers[attackers.size] = victim.laststandattacker;
            }
            foreach (attacker in attackers) {
                if (isdefined(attacker.team) && !isdefined(var_fa2dfb970d051f16[attacker.team])) {
                    var_fa2dfb970d051f16[attacker.team] = 1;
                    var_ffcddbab91473037 = level.teamdata[attacker.team]["alivePlayers"];
                    foreach (var_78d4262a23453d9e in var_ffcddbab91473037) {
                        var_78d4262a23453d9e thread namespace_6b49ddb858f34366::function_8c38798d6a558ad0();
                        var_78d4262a23453d9e thread namespace_391de535501b0143::killeventtextpopup(#"team_wiped", 0);
                        var_78d4262a23453d9e thread namespace_48a08c5037514e04::doScoreEvent(#"team_wiped", var_78d4262a23453d9e.wipeweapon);
                    }
                    wipeweapon = self.laststandweaponobj;
                    if (!isdefined(wipeweapon)) {
                        if (isdefined(victim) && isdefined(victim.laststandattacker)) {
                            wipeweapon = victim.laststandattacker.currentweapon;
                        } else {
                            wipeweapon = attacker.currentweapon;
                        }
                    }
                    attacker thread teamwipedobituary(victim, attacker, wipeweapon);
                }
                attacker.wipeweapon = undefined;
                if (!isdefined(var_6a9853a7ef309b8f[attacker.team]) && !namespace_3e725f3cc58bddd3::function_80ade967129c9845()) {
                    var_6a9853a7ef309b8f[attacker.team] = 1;
                    attacker playsoundtoteam("ui_team_wipe_splash", attacker.team);
                }
            }
            level callback::callback("on_squad_wiped", {victim:victim, attackers:attackers});
            namespace_8361bad7391de074::function_63fedb7f004da23b(attackers);
        }
    }
    level.var_f44d8c2d0a8691a8 = undefined;
    return var_c9fa03a7d2163c24;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x193c7
// Size: 0x8c
function teamwipedobituary(victim, attacker, laststandweapon) {
    waitframe();
    if (getdvarint(@"hash_6084a01accf3b2eb", 1)) {
        if (isdefined(victim)) {
            var_f86da5d91524e369 = [];
            if (isdefined(level.var_c5877dbe60fddbf6)) {
                var_f86da5d91524e369 = level.var_c5877dbe60fddbf6;
            }
            var_f86da5d91524e369 = array_combine(var_f86da5d91524e369, level.teamdata[attacker.team]["alivePlayers"]);
            obituary(victim, attacker, laststandweapon, "MOD_TEAM_WIPED", var_f86da5d91524e369);
        }
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1945a
// Size: 0x25
function brdisabledamagestattracking(player) {
    if (brgulagdamagefilter(player)) {
        return 0;
    }
    if (isagent(player)) {
        return 0;
    }
    return 1;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19487
// Size: 0x11c
function initializeaardata(player) {
    if (player rankingenabled() && player hasplayerdata()) {
        player setplayerdata(level.var_5d69837cf4db0407, "aarValue", 0, 0);
        player setplayerdata(level.var_5d69837cf4db0407, "aarValue", 1, 0);
        player setplayerdata(level.var_5d69837cf4db0407, "aarValue", 2, 0);
        player setplayerdata(level.var_5d69837cf4db0407, "aarValue", 3, 0);
        player setplayerdata(level.var_5d69837cf4db0407, "aarValue", 4, 0);
        player setplayerdata(level.var_5d69837cf4db0407, "aarValue", 5, 0);
        player setplayerdata(level.var_5d69837cf4db0407, "aarValue", 6, 0);
        var_bf587c66b60ef10f = player getplayerdata("common", "mpProgression", "playerLevel", "xp");
        player setplayerdata(level.var_5d69837cf4db0407, "aarValue", 7, var_bf587c66b60ef10f);
        player setplayerdata(level.var_5d69837cf4db0407, "aarValue", 8, var_bf587c66b60ef10f);
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x195aa
// Size: 0x2d1
function setaardata(team, players) {
    if (istrue(level.var_c3d1e9e6a5024479)) {
        return;
    }
    if (!isdefined(players)) {
        players = getteamdata(team, "players");
    }
    foreach (player in players) {
        if (!player rankingenabled() || !player hasplayerdata() || istrue(player.extracted)) {
            continue;
        }
        combatXP = player namespace_3c5a4254f2b957ea::getpersstat("combatXP");
        if (!isdefined(combatXP)) {
            combatXP = 0;
        }
        player setplayerdata(level.var_5d69837cf4db0407, "aarValue", 0, combatXP);
        missionXP = player namespace_3c5a4254f2b957ea::getpersstat("missionXP");
        if (!isdefined(missionXP)) {
            missionXP = 0;
        }
        player setplayerdata(level.var_5d69837cf4db0407, "aarValue", 1, missionXP);
        lootingXP = player namespace_3c5a4254f2b957ea::getpersstat("lootingXP");
        if (!isdefined(lootingXP)) {
            lootingXP = 0;
        }
        player setplayerdata(level.var_5d69837cf4db0407, "aarValue", 2, lootingXP);
        supportXP = player namespace_3c5a4254f2b957ea::getpersstat("supportXP");
        if (!isdefined(supportXP)) {
            supportXP = 0;
        }
        player setplayerdata(level.var_5d69837cf4db0407, "aarValue", 3, supportXP);
        reconXP = player namespace_3c5a4254f2b957ea::getpersstat("reconXP");
        if (!isdefined(reconXP)) {
            reconXP = 0;
        }
        player setplayerdata(level.var_5d69837cf4db0407, "aarValue", 4, reconXP);
        matchbonus = 0;
        if (isdefined(player.matchbonus)) {
            matchbonus = int(player.matchbonus);
        }
        player setplayerdata(level.var_5d69837cf4db0407, "aarValue", 5, matchbonus);
        placementbonus = 0;
        if (isdefined(player.placementbonus)) {
            placementbonus = int(player.placementbonus);
        }
        player setplayerdata(level.var_5d69837cf4db0407, "aarValue", 6, placementbonus);
        var_bf587c66b60ef10f = player getplayerdata(level.var_5d69837cf4db0407, "aarValue", 7);
        var_efe4124eaa21ea43 = var_bf587c66b60ef10f + player namespace_3c5a4254f2b957ea::getpersstat("summary")["xp"];
        player setplayerdata(level.var_5d69837cf4db0407, "aarValue", 8, var_efe4124eaa21ea43);
        player setplayerdata("common", "brSubGameType", namespace_36f464722d326bbe::function_6c1fce6f6b8779d5());
        player notify("br_player_aar_data_set");
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19882
// Size: 0x45
function briskillstreakallowed(var_16efcf27e6efcbe8, var_15314da30b44470) {
    if (isdefined(self.vehicle)) {
        streakname = var_16efcf27e6efcbe8.streakname;
        if (streakname == "manual_turret") {
            return 0;
        }
    }
    return 1;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x198cf
// Size: 0x5e
function brkillstreakbeginusefunc(streakinfo) {
    if (!isdefined(streakinfo)) {
        return 0;
    }
    player = streakinfo.owner;
    if (!isdefined(player)) {
        return 0;
    }
    if (isplayer(player) && !istrue(streakinfo.skipequippedstreakcheck) && !player namespace_cb965d2f71fefddc::doesstreakinfomatchequippedstreak(streakinfo)) {
        return 0;
    }
    return namespace_58a74e7d54b56e8d::streakglobals_onkillstreakbeginuse(streakinfo);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19935
// Size: 0x10
function brmodevalidatekillstreakslot(var_15314da30b44470) {
    return var_15314da30b44470 == 1;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1994d
// Size: 0x52
function killstreakweaponfiredcontinue() {
    curweapon = self.currentprimaryweapon;
    if (isdefined(curweapon) && isdefined(curweapon.basename) && curweapon.basename == "iw9_spotter_scope_mp") {
        self setweaponammoclip(curweapon, self getcurrentweaponclipammo() + 1);
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x199a6
// Size: 0x129
function function_258c4f40dee8189a(var_bde7478b4a6080ad, var_bde7468b4a607e7a, radius) {
    if (isdefined(var_bde7478b4a6080ad) && isdefined(var_bde7468b4a607e7a) && isdefined(radius)) {
        setcachedclientomnvar("ui_compass_tacopsmap_cursor_pos_override_x", var_bde7478b4a6080ad);
        setcachedclientomnvar("ui_compass_tacopsmap_cursor_pos_override_y", var_bde7468b4a607e7a);
        setcachedclientomnvar("ui_compass_tacopsmap_size_override", radius);
    } else if (isdefined(level.br_circle) && isdefined(level.br_circle.dangercircleent)) {
        setcachedclientomnvar("ui_compass_tacopsmap_cursor_pos_override_x", level.br_circle.dangercircleent.origin[0]);
        setcachedclientomnvar("ui_compass_tacopsmap_cursor_pos_override_y", level.br_circle.dangercircleent.origin[1]);
        setcachedclientomnvar("ui_compass_tacopsmap_size_override", level.br_circle.dangercircleent.origin[2]);
    } else {
        setcachedclientomnvar("ui_compass_tacopsmap_cursor_pos_override_x", 0);
        setcachedclientomnvar("ui_compass_tacopsmap_cursor_pos_override_y", 0);
        setcachedclientomnvar("ui_compass_tacopsmap_size_override", 0);
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19ad6
// Size: 0x9
function function_7dbb8165d792b06c() {
    return namespace_95d8d8ec67e3e074::function_3ae9c05025cbac2d();
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19ae7
// Size: 0x9
function function_749723c2a45a0233() {
    return namespace_95d8d8ec67e3e074::function_749723c2a45a0233();
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19af8
// Size: 0x9
function function_1bbd21d289ba8a92() {
    return namespace_95d8d8ec67e3e074::function_1bbd21d289ba8a92();
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19b09
// Size: 0x99
function function_227ca42a35b0398b(team) {
    var_156f390a5362bc55 = function_749723c2a45a0233();
    if (!level.teambased || !isdefined(team) || team == "all") {
        return (var_156f390a5362bc55.size == 0);
    }
    foreach (var_b4adde4c68bb0f24 in var_156f390a5362bc55) {
        if (var_b4adde4c68bb0f24.team == team) {
            return 0;
        }
    }
    return 1;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19baa
// Size: 0x25
function function_72ce5f47da0f5661() {
    return istrue(level.usegulag) && istrue(level.gulag.shutdown);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19bd7
// Size: 0x8b
function function_50434e55c7907057() {
    self endon("disconnect");
    if (!istrue(level.br_prematchstarted)) {
        if (namespace_36f464722d326bbe::isBRStyleGameType() && !istrue(level.var_595938569c3fe806)) {
            return;
        }
        var_968bd61837a9c038 = getdvarint(@"hash_3c87ccc2c15b53a4", 150);
        var_381776cae951da48 = getdvarint(@"hash_8b8e8245086efdd1", 0);
        namespace_f8d3520d3483c1::givestartingarmor(var_968bd61837a9c038, undefined, var_381776cae951da48);
        return;
    }
    if (!istrue(level.br_prematchstarted)) {
        level waittill("infils_ready");
    }
    namespace_f8d3520d3483c1::givestartingarmor();
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19c69
// Size: 0x6d
function function_c8915ac8c8987452() {
    var_a81adeb0e1f89320 = level.br_pickups.maxcounts["brloot_armor_plate"];
    if (istrue(level.var_6d1d9e1b59c6f37)) {
        var_a81adeb0e1f89320 = level.var_6d1d9e1b59c6f37;
    }
    if (istrue(self.hasplatepouch)) {
        var_a81adeb0e1f89320 = var_a81adeb0e1f89320 + level.var_6835a3d279520dc9;
    }
    if (istrue(level.var_75c3b6e138fd717c)) {
        var_a81adeb0e1f89320 = var_a81adeb0e1f89320 + 1;
    }
    return var_a81adeb0e1f89320;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19cde
// Size: 0x32
function setplayerprematchallows() {
    val::set("prematch", "player_for_spawn_logic", 0);
    self allowmelee(0);
    self disableoffhandweapons();
    level.freefallstartcb = &freefallstartfunc;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19d17
// Size: 0x13
function freefallstartfunc() {
    self allowmelee(1);
    self enableoffhandweapons();
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x19d31
// Size: 0x1e
function function_79762aa9e99f73a5(var_fa142a966b10d0e6) {
    function_15fa5f9b3a2b7a52();
    [[ var_fa142a966b10d0e6 ]]();
    function_84e10866b5154784();
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19d56
// Size: 0x40
function function_15fa5f9b3a2b7a52() {
    /#
        /#
            assertex(!istrue(level.var_9d0412c6ba5a4084), "crate_use");
        #/
    #/
    if (!isdefined(level.var_15fa5f9b3a2b7a52)) {
        level.var_15fa5f9b3a2b7a52 = 0;
    }
    level.var_15fa5f9b3a2b7a52++;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19d9d
// Size: 0x31
function function_84e10866b5154784() {
    if (!isdefined(level.var_15fa5f9b3a2b7a52)) {
        return;
    }
    level.var_15fa5f9b3a2b7a52--;
    if (!level.var_15fa5f9b3a2b7a52) {
        level.var_15fa5f9b3a2b7a52 = undefined;
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19dd5
// Size: 0x4c
function function_ea010c4d09365b32() {
    waittillframeend();
    while (!namespace_4b0406965e556711::gameflagexists("prematch_done")) {
        waitframe();
    }
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    waittillframeend();
    while (istrue(level.var_15fa5f9b3a2b7a52)) {
        waitframe();
    }
    /#
        level.var_9d0412c6ba5a4084 = 1;
    #/
    level.struct_class_names = undefined;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19e28
// Size: 0x44
function function_90011db2fca825a8() {
    player = self;
    teamsize = level.teamdata[player.team]["players"].size;
    namespace_aead94004cf4c147::function_1db038329eb56917(player, 8554, 1, teamsize);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19e73
// Size: 0x117
function function_56869e118720ca3b(agent, killer) {
    if (isdefined(killer) && killer namespace_1f188a13f7e79610::isvehicle()) {
        killer = namespace_1fbd40990ee60ede::vehicle_occupancy_getdriver(killer);
    }
    if (isdefined(killer) && isplayer(killer)) {
        if (!isdefined(killer.agentKills)) {
            killer.agentKills = 1;
        } else {
            killer.agentKills = killer.agentKills + 1;
        }
        if (getsubgametype() != "plunder" && getsubgametype() != "risk") {
            killer namespace_d3d40f75bb4e4c32::updatebrscoreboardstat("agentKills", killer.agentKills);
        }
        var_832c0f7147235e86 = killer getplayerdata(level.var_5d69837cf4db0407, "playerStats", "modeStats", level.gametype, "agentKills");
        var_832c0f7147235e86 = var_832c0f7147235e86 + 1;
        killer setplayerdata(level.var_5d69837cf4db0407, "playerStats", "modeStats", level.gametype, "agentKills", var_832c0f7147235e86);
        killer function_affe08e0629d5b85(agent);
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19f91
// Size: 0xb6
function function_affe08e0629d5b85(agent) {
    if (isagent(agent)) {
        category = namespace_14d36171baccf528::function_e2292dcf63eccf7a(agent, "category");
        tier = namespace_14d36171baccf528::function_e2292dcf63eccf7a(agent, "tier");
        elite = namespace_14d36171baccf528::function_e2292dcf63eccf7a(agent, "elite");
        if (category == "elites") {
            incpersstat("bossAgentKills", 1);
        } else if (isdefined(tier)) {
            if (isdefined(elite) && elite == 1) {
                incpersstat("tier" + tier + "EliteAgentKills", 1);
            } else {
                incpersstat("tier" + tier + "NormalAgentKills", 1);
            }
        }
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a04e
// Size: 0x17c
function tnbrMonitorLauncherAmmoRestock() {
    if (!isdefined(self) || !isplayer(self)) {
        return;
    }
    level endon("game_ended");
    self endon("death");
    self endon("disconnect");
    self notify("tnbrMonitorLauncherAmmoRestock");
    self endon("tnbrMonitorLauncherAmmoRestock");
    while (!namespace_4b0406965e556711::gameflagexists("prematch_done")) {
        waitframe();
    }
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    while (1) {
        var_1f2c0996928e3110 = getdvarfloat(@"hash_2c016fd52c45f297", 5);
        wait(var_1f2c0996928e3110);
        if (!function_ad443bbcdcf37b85(self)) {
            continue;
        }
        if (isplayerinorgoingtogulag()) {
            continue;
        }
        var_da2c96c009b81a2f = 0;
        var_d6e9347c3618a5bb = self getweaponslistprimaries();
        foreach (weapon in var_d6e9347c3618a5bb) {
            ammotype = br_ammo_type_for_weapon(weapon);
            if (isdefined(ammotype) && ammotype == "brloot_ammo_rocket") {
                var_da2c96c009b81a2f = 1;
                break;
            }
        }
        if (!var_da2c96c009b81a2f) {
            continue;
        }
        var_438e5fad74ee0d44 = get_int_or_0(self.br_ammo["brloot_ammo_rocket"]);
        var_79f8cd87b2a5ec53 = level.var_e6ea72fc5e3fcd00["brloot_ammo_rocket"];
        if (var_438e5fad74ee0d44 < var_79f8cd87b2a5ec53) {
            br_ammo_give_type(self, "brloot_ammo_rocket", 1, 0);
        }
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a1d1
// Size: 0x1e
function function_342438311e316357() {
    var_6f2ab6d7f309b05d = getdvarint(@"hash_4bded611decf41c5", 0);
    return var_6f2ab6d7f309b05d;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a1f7
// Size: 0x55
function function_8d739ec62c568c41(var_3474b4e818850c46) {
    if (!isdefined(self.carryflag)) {
        self.carryflag = ter_op(isdefined(var_3474b4e818850c46), var_3474b4e818850c46, "prop_king_game_flag");
        self attach(self.carryflag, "tag_stowed_back3", 1);
        self setclientomnvar("ui_flag_player_hud_icon", 1);
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a253
// Size: 0x3c
function function_96d6b5e51dd4a63b() {
    if (isdefined(self.carryflag)) {
        self detach(self.carryflag, "tag_stowed_back3");
        self.carryflag = undefined;
        self setclientomnvar("ui_flag_player_hud_icon", 0);
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a296
// Size: 0x6e
function function_a0394891c6cb41a5() {
    self endon("disconnect");
    if (issharedfuncdefined("teamAssim", "disablePlayer")) {
        [[ getsharedfunc("teamAssim", "disablePlayer") ]](self, "untilMatchStart");
    }
    gameflagwait("br_ready_to_jump");
    if (issharedfuncdefined("teamAssim", "enablePlayer")) {
        [[ getsharedfunc("teamAssim", "enablePlayer") ]](self, "untilMatchStart");
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a30b
// Size: 0x79
function function_be78b07e93d46175() {
    level endon("game_ended");
    var_9c88e85cf506df15 = getdvarint(@"hash_f4d1714fd7d712eb", 0);
    if (var_9c88e85cf506df15 > 0) {
        level waittill("prematch_done");
        wait(max(0, var_9c88e85cf506df15 - 10));
        for (countdown = 10; countdown > 0; countdown--) {
            iprintln("MAP SWAP STARTING IN " + countdown);
            wait(1);
        }
        function_195990d8affba85b("test_observatory", "after", 10);
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a38b
// Size: 0x66
function function_1b1c1195e27710b9(var_93a0836a10e99c34, var_394466c2ddb208cb) {
    if (isdefined(var_93a0836a10e99c34) && isdefined(var_394466c2ddb208cb)) {
        var_a1823e6b1cb4b46d = var_93a0836a10e99c34 calloutmarkerping_gettype(var_394466c2ddb208cb);
        if (isdefined(var_a1823e6b1cb4b46d) && var_a1823e6b1cb4b46d == 9) {
            if (!isdefined(var_93a0836a10e99c34.var_cb9581fc7ff5f394)) {
                var_93a0836a10e99c34.var_cb9581fc7ff5f394 = 0;
            }
            var_93a0836a10e99c34.var_cb9581fc7ff5f394++;
        }
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a3f8
// Size: 0x51
function function_9c8dfd3b19180b63() {
    if (getdvarint(@"hash_738b7382a23ac132", 0)) {
        return;
    }
    while (!namespace_4b0406965e556711::gameflagexists("prematch_done")) {
        waitframe();
    }
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    namespace_3c37cb17ade254d::registersharedfunc("ai", "dropLootOnAgentDeath", &namespace_bfef6903bca5845d::function_82ed67ae79913551);
    namespace_bfef6903bca5845d::function_5aee5d819f7dfd1c();
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a450
// Size: 0x3b
function function_525d65f5d0d3200e() {
    level.var_abe4208a372b7336 = [];
    level.var_27feb4a06fd158e3 = [];
    namespace_e2a930dc2e127364::function_de7ceb99406215a9(&function_d034a10c85c82581);
    namespace_e2a930dc2e127364::function_605a755fde14133a(&function_da2be124a9597ee2);
    namespace_e2a930dc2e127364::function_547c48dc070b2109(&function_8751cff989bde6a0);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a492
// Size: 0x22
function function_6315a065e5b1efa2(func) {
    level.var_abe4208a372b7336[level.var_abe4208a372b7336.size] = func;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a4bb
// Size: 0x22
function function_80fc169a9ec33825(func) {
    level.var_27feb4a06fd158e3[level.var_27feb4a06fd158e3.size] = func;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a4e4
// Size: 0xa1
function function_d034a10c85c82581(instance, player, edgeindex, var_7a117370745e5467, isinverted, var_9cb491b9ab8ea354) {
    foreach (func in level.var_abe4208a372b7336) {
        result = [[ func ]](instance, player, edgeindex, var_7a117370745e5467, isinverted, var_9cb491b9ab8ea354);
        if (isdefined(result)) {
            return result;
        }
    }
    return undefined;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a58d
// Size: 0x8e
function function_da2be124a9597ee2(instance, player, edgeindex, isinverted) {
    foreach (func in level.var_27feb4a06fd158e3) {
        result = [[ func ]](instance, player, edgeindex, isinverted);
        if (isdefined(result)) {
            return result;
        }
    }
    return 1;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a623
// Size: 0x53
function function_8751cff989bde6a0(instance, player, edgeindex, isinverted, var_7a117370745e5467, var_7bd9fd9d3e7c7aa) {
    if (!isdefined(player) || istrue(var_7a117370745e5467) || !isdefined(var_7bd9fd9d3e7c7aa)) {
        return;
    }
    instance thread function_35d52997ae7d7e1b(player, edgeindex, var_7bd9fd9d3e7c7aa);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1a67d
// Size: 0x198
function private function_35d52997ae7d7e1b(player, edgeindex, var_7bd9fd9d3e7c7aa) {
    if (!isdefined(var_7bd9fd9d3e7c7aa)) {
        var_7bd9fd9d3e7c7aa = (0, 0, 1);
    }
    result = player waittill_any_timeout_2(1, "death_or_disconnect", "ascender_attached");
    if (is_equal(result, "ascender_attached")) {
        player setclientomnvar("ui_speedboost_overlay", 0);
        var_439e2b807544b397 = vectortoangles(var_7bd9fd9d3e7c7aa);
        pos = player gettagorigin("tag_accessory_left");
        player.var_33cb9daa5bf01ec1 = spawn("script_model", pos);
        player.var_33cb9daa5bf01ec1 setmodel("misc_vm_zipline_device_top_01");
        player.var_33cb9daa5bf01ec1 function_97daa6bf60d4b5ec(player, "tag_accessory_left", (0, 0, 0), var_439e2b807544b397);
        player.var_33cb9daa5bf01ec1 function_ecd4ddf18220a2d4(1);
        if (!player GetCameraThirdPerson()) {
            player.var_33cb9daa5bf01ec1 hidefromplayer(player);
        }
        player waittill_any_4("death_or_disconnect", "ascender_detached", "ascender_cancel", "ascender_solo_cancel");
        if (isreallyalive(player) && (!isdefined(player.deadsilenceuistate) || player.deadsilenceuistate == -1)) {
            player setclientomnvar("ui_speedboost_overlay", 2);
        }
        player.var_33cb9daa5bf01ec1 kill();
        player.var_33cb9daa5bf01ec1 delete();
        player.var_33cb9daa5bf01ec1 = undefined;
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a81c
// Size: 0x3a
function function_467380e90c7db5a7() {
    self endon("death_or_disconnect");
    if (isdefined(self.var_31d13939f28644d4)) {
        return;
    }
    self.var_31d13939f28644d4 = 1;
    while (!self isonground()) {
        waitframe();
    }
    self.var_31d13939f28644d4 = undefined;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a85d
// Size: 0x35
function function_bd2737827d4fc5d7(weaponobj) {
    ammotype = br_ammo_type_for_weapon(weaponobj);
    var_31b36738ff4eacd = self.br_ammo[ammotype];
    return var_31b36738ff4eacd;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a89a
// Size: 0x30
function function_d62ff7c7859f5b9c(weaponobj, var_3e9ba1ba3b3ac105) {
    ammotype = br_ammo_type_for_weapon(weaponobj);
    br_ammo_take_type(self, ammotype, var_3e9ba1ba3b3ac105);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a8d1
// Size: 0x46a
function function_828026e0c887cd11() {
    level.var_29592a532aaec801 = getdvarint(@"hash_f1a9c0b8c6ed7aa0", 0) != 0;
    level.var_b33f1f9e5160d095 = getdvarint(@"hash_840ecb3adebe57f7", 1) != 0;
    level.var_4fb44898c7e0006a = getdvarint(@"hash_545b8c1ed10fbed0", 1) != 0;
    level.var_e442ba065dd78f24 = getdvarint(@"hash_823c8ce2368209b2", 0) != 0;
    if (!level.var_29592a532aaec801) {
        return;
    }
    while (!isdefined(level.struct_class_names)) {
        waitframe();
    }
    if (level.mapname == "mp_br_mechanics") {
        var_f13412448e4cd8a6 = spawnstruct();
        var_f13412448e4cd8a6.origin = (3956.32, -1963.43, 0);
        var_f13412448e4cd8a6.angles = (0, -84.4941, 0);
        var_f13412448e4cd8a6.script_noteworthy = "april_rainbow_1";
        function_1f6c1a9b7564dc61(var_f13412448e4cd8a6);
        var_f3f3c199ab11b6e = spawnstruct();
        var_f3f3c199ab11b6e.origin = (3906.32, -1963.43, 0);
        var_f3f3c199ab11b6e.angles = (0, 0, 0);
        var_f3f3c199ab11b6e.script_noteworthy = "april_cache_1_1";
        function_1f6c1a9b7564dc61(var_f3f3c199ab11b6e);
        var_f3f3c199ab11b6e = spawnstruct();
        var_f3f3c199ab11b6e.origin = (4006.32, -1963.43, 0);
        var_f3f3c199ab11b6e.angles = (0, 0, 0);
        var_f3f3c199ab11b6e.script_noteworthy = "april_cache_1_2";
        function_1f6c1a9b7564dc61(var_f3f3c199ab11b6e);
        var_f3f3c199ab11b6e = spawnstruct();
        var_f3f3c199ab11b6e.origin = (3956.32, -1963.43, 0);
        var_f3f3c199ab11b6e.angles = (0, 0, 0);
        var_f3f3c199ab11b6e.script_noteworthy = "april_cache_1_3";
        function_1f6c1a9b7564dc61(var_f3f3c199ab11b6e);
    }
    var_1a9cebee5b016e80 = 0;
    i = 1;
    for (;;) {
        for (;;) {
            if (!isdefined(getstruct("april_rainbow_" + i, "script_noteworthy"))) {
                break;
            }
            var_1a9cebee5b016e80 = var_1a9cebee5b016e80 + 1;
        }
    }
    if (var_1a9cebee5b016e80 == 0) {
        return;
    }
    var_a620cb0e6444887f = randomint(var_1a9cebee5b016e80) + 1;
    var_2fff16a950675118 = getstruct("april_rainbow_" + var_a620cb0e6444887f, "script_noteworthy");
    rainbow = spawn("script_model", var_2fff16a950675118.origin);
    rainbow.angles = var_2fff16a950675118.angles;
    rainbow setmodel("br_april_rainbow");
    rainbow setscriptablepartstate("rainbow", "on");
    if (getdvarint(@"hash_4292bf6ab9d3b43c", 1) == 1) {
        return;
    }
    caches = [];
    for (j = 1; ; j++) {
        var_3531236d1a437a5c = getstruct("april_cache_" + var_a620cb0e6444887f + "_" + j, "script_noteworthy");
        if (!isdefined(var_3531236d1a437a5c)) {
            break;
        }
        cache = spawnscriptable("br_loot_cache_april", var_3531236d1a437a5c.origin, var_3531236d1a437a5c.angles);
        cache setscriptablepartstate("body", "closed_usable");
        caches[caches.size] = cache;
    }
    if (caches.size > 0) {
        foreach (cache in caches) {
            cache.contents = getscriptablelootcachecontents(cache);
            cache.contents[cache.contents.size] = "brloot_plunder_cash_legendary_1";
        }
        var_d84cbc950e239e80 = random(caches);
        var_d84cbc950e239e80.contents[var_d84cbc950e239e80.contents.size] = "brloot_weapon_sn_alpha50_april";
    }
    for (j = 1; ; j++) {
        var_3531236d1a437a5c = getstruct("april_fake_cache_" + var_a620cb0e6444887f + "_" + j, "script_noteworthy");
        if (!isdefined(var_3531236d1a437a5c)) {
            break;
        }
        cache = spawnscriptable("br_loot_cache_april", var_3531236d1a437a5c.origin, var_3531236d1a437a5c.angles);
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ad42
// Size: 0x85
function function_e83ab39a1e762ead(itemname) {
    if (isdefined(itemname) && namespace_cb965d2f71fefddc::function_36de08ea672b354c(itemname)) {
        return namespace_708f627020de59d3::function_bdd930eee0042052();
    }
    if (isdefined(itemname) && namespace_cb965d2f71fefddc::isquesttablet(itemname)) {
        return 0;
    }
    if (isdefined(itemname) && namespace_a548bd428a566cf3::isammo(itemname) && istrue(level.var_cf32b38db66d1f3b) && !istrue(level.var_3ea6ceb7358d49df)) {
        return 0;
    }
    if (isdefined(itemname) && br_pickups::function_f8f4cf026fb2b9f8(itemname) && !istrue(level.var_3d804d3022029476)) {
        return 0;
    }
    return 1;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1adcf
// Size: 0x4d
function function_d0f9fbf3f0f8c739(team) {
    UIBotCount = 0;
    if (isdefined(level.var_7b37b2193f163b9b)) {
        UIBotCount = getteamdata(team, "UIBotCount");
        if (UIBotCount < 0) {
            /#
                assertmsg("UIBotCount is negative! team =" + team);
            #/
            UIBotCount = 0;
        }
    }
    return UIBotCount;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ae24
// Size: 0x44
function function_3ac2a599d142369d() {
    var_81dab8953b9df82 = 0;
    var_c5c0c138d608be6a = 0;
    if (isdefined(self.brmissionscompleted)) {
        var_c5c0c138d608be6a = var_c5c0c138d608be6a + self.brmissionscompleted;
    }
    if (var_c5c0c138d608be6a > 15) {
        var_c5c0c138d608be6a = 15;
    }
    var_81dab8953b9df82 = var_c5c0c138d608be6a;
    return var_81dab8953b9df82;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ae70
// Size: 0x99
function function_aa670c3018e4340e(attacker) {
    dropstruct = namespace_cb965d2f71fefddc::function_7b9f3966a7a42003();
    var_cb4fad49263e20c4 = getitemdroporiginandangles(dropstruct, self.origin, self.angles, self, randomint(359));
    var_cb4fad49263e20c4.var_4187ebc9bb02e5b8 = [0:#"hash_5f9c433bdcfb4e14", 1:attacker getentitynumber()];
    dropbag = spawnpickup("brloot_scavenger_bag", var_cb4fad49263e20c4, 1, 1, undefined, 1);
    dropbag.player = attacker;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1af10
// Size: 0x408
function onscavengerbagpickup(var_b5ecc103c0e9710d) {
    self endon("death_or_disconnect");
    function_5833a495de752d1d(var_b5ecc103c0e9710d);
    var_c8a8cadcfbff950a = getdvarint(@"hash_897ac2ba3a23b63c", 50);
    var_c8cc171531c09a7 = getdvarint(@"hash_92da4d55bf73435e", 1);
    var_5cde174b082ce9cb = [];
    var_26cb9b5f43f1613c = [];
    var_a5bc8377313a9018 = [];
    if (var_c8cc171531c09a7 > 0) {
        primaryweapons = self getweaponslistprimaries();
        if (isdefined(primaryweapons) && primaryweapons.size > 0) {
            foreach (weapon in primaryweapons) {
                if (weapon.isalternate || weapon.basename == "iw9_pi_stimpistol_mp") {
                    continue;
                }
                ammotype = br_ammo_type_for_weapon(weapon);
                if (isdefined(ammotype)) {
                    var_c1192c297bbf292f = level.br_ammo_clipsize[ammotype] * var_c8cc171531c09a7;
                    var_26cb9b5f43f1613c[var_26cb9b5f43f1613c.size] = [0:ammotype, 1:var_c1192c297bbf292f];
                }
            }
        }
    }
    if (var_c8a8cadcfbff950a > 0 && istrue(level.br_plunder_enabled)) {
        var_68552b43573a5b6c = int(max(self.plundercount + var_c8a8cadcfbff950a - level.br_plunder.plunderlimit, 0));
        var_d72f2599b722086 = int(var_c8a8cadcfbff950a - var_68552b43573a5b6c);
        var_8e5dd667f5bf1e1e = "brloot_plunder_cash_uncommon_1";
        if (var_d72f2599b722086 > 0) {
            var_26cb9b5f43f1613c[var_26cb9b5f43f1613c.size] = [0:var_8e5dd667f5bf1e1e, 1:var_c8a8cadcfbff950a];
        } else if (var_68552b43573a5b6c > 0) {
            var_a5bc8377313a9018[var_a5bc8377313a9018.size] = [0:var_8e5dd667f5bf1e1e, 1:var_68552b43573a5b6c];
        }
    }
    if (getmatchrulesdata("brData", "scavengerGiveArmor")) {
        var_de1443493303f024 = getdvarint(@"hash_2e6456a167d44e6e", 2);
        var_26cb9b5f43f1613c[var_26cb9b5f43f1613c.size] = [0:"brloot_armor_plate", 1:var_de1443493303f024];
    }
    if (var_26cb9b5f43f1613c.size > 0) {
        foreach (arr in var_26cb9b5f43f1613c) {
            scriptablename = arr[0];
            count = arr[1];
            fakeent = spawnstruct();
            fakeent.scriptablename = scriptablename;
            fakeent.count = count;
            fakeent.var_8598d3d3bc3d9ceb = 1;
            fakeent.origin = self.origin;
            fakeent.isautouse = 1;
            var_dfa02eaccc952a61 = namespace_cb965d2f71fefddc::onusecompleted(fakeent, 1, 1);
            var_8ba940763cda3a94 = count - var_dfa02eaccc952a61;
            if (var_dfa02eaccc952a61 > 0) {
                var_a5bc8377313a9018[var_a5bc8377313a9018.size] = [0:scriptablename, 1:var_dfa02eaccc952a61];
            }
            if (var_8ba940763cda3a94 > 0) {
                var_5cde174b082ce9cb[var_5cde174b082ce9cb.size] = [0:scriptablename, 1:var_8ba940763cda3a94];
            }
        }
    }
    if (var_a5bc8377313a9018.size > 0) {
        foreach (itemdata in var_a5bc8377313a9018) {
            scriptablename = itemdata[0];
            count = itemdata[1];
            dropstruct = function_7b9f3966a7a42003();
            var_cb4fad49263e20c4 = getitemdroporiginandangles(dropstruct, self.origin, self.angles, self);
            spawnpickup(scriptablename, var_cb4fad49263e20c4, int(count), 1, undefined, 0);
        }
    }
    childthread function_a67bddd1f14c2074(var_5cde174b082ce9cb);
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1b31f
// Size: 0xb6
function private function_a67bddd1f14c2074(var_745efa8e3fc97f41) {
    if (isdefined(var_745efa8e3fc97f41) && var_745efa8e3fc97f41.size > 0) {
        fakeent = spawnstruct();
        foreach (var_9b4bc09d34e9990c in var_745efa8e3fc97f41) {
            if (var_9b4bc09d34e9990c.size > 0) {
                fakeent.scriptablename = var_9b4bc09d34e9990c[0];
                fakeent.count = 0;
                if (var_9b4bc09d34e9990c.size > 1) {
                    fakeent.count = int(var_9b4bc09d34e9990c[1]);
                }
                namespace_cb965d2f71fefddc::function_54cbf68f2e4a6d31(fakeent);
            }
        }
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x1b3dc
// Size: 0x1fb
function private function_22edbbcb7270df86(var_a0ce8000d303764c, quantity, var_4b851655045b6066, var_adb699ae85f741b) {
    if (!isdefined(var_4b851655045b6066)) {
        var_4b851655045b6066 = 1;
    }
    if (!isdefined(var_adb699ae85f741b)) {
        var_adb699ae85f741b = 1;
    }
    results = spawnstruct();
    var_b72d8066efdfd136 = quantity;
    var_8ba940763cda3a94 = 0;
    itemsdropped = 0;
    if (var_b72d8066efdfd136 > 0 && namespace_aead94004cf4c147::isBackpackInventoryEnabled() && istrue(var_4b851655045b6066)) {
        lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(var_a0ce8000d303764c);
        var_65c97a3768828398 = namespace_aead94004cf4c147::function_ed8f025d796c038(lootid);
        if (isdefined(var_65c97a3768828398) && var_65c97a3768828398.size > 0) {
            foreach (index in var_65c97a3768828398) {
                slotcount = namespace_aead94004cf4c147::function_897b29adb37f06a7(index);
                var_28a6c51a0e2c03d0 = namespace_aead94004cf4c147::function_e02526fc6db8443f(var_a0ce8000d303764c);
                var_de4683afe6be36e5 = min(var_28a6c51a0e2c03d0 - slotcount, var_b72d8066efdfd136);
                if (var_de4683afe6be36e5 > 0) {
                    var_b72d8066efdfd136 = var_b72d8066efdfd136 - var_de4683afe6be36e5;
                    var_8ba940763cda3a94 = var_8ba940763cda3a94 + var_de4683afe6be36e5;
                    namespace_aead94004cf4c147::function_84772ebf836af5db(index, var_de4683afe6be36e5);
                }
                if (var_b72d8066efdfd136 <= 0) {
                    break;
                }
            }
        }
    }
    if (var_b72d8066efdfd136 > 0 && istrue(var_adb699ae85f741b)) {
        dropstruct = function_7b9f3966a7a42003();
        var_cb4fad49263e20c4 = getitemdroporiginandangles(dropstruct, self.origin, self.angles, self);
        spawnpickup(var_a0ce8000d303764c, var_cb4fad49263e20c4, int(var_b72d8066efdfd136), 1, undefined, 0);
        itemsdropped = var_b72d8066efdfd136;
        var_b72d8066efdfd136 = 0;
    }
    results.initialcount = quantity;
    results.var_1025b1092bab01b5 = var_b72d8066efdfd136;
    results.var_8ba940763cda3a94 = var_8ba940763cda3a94;
    results.itemsdropped = itemsdropped;
    return results;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b5df
// Size: 0x9e
function function_2e1567e33e6cddf9(player) {
    var_b3c92413c48e5f33 = undefined;
    var_92fa0daf335cad50 = getlootscriptablearray("brloot_scavenger_bag");
    if (isdefined(var_92fa0daf335cad50) && var_92fa0daf335cad50.size > 0) {
        foreach (var_b5ecc103c0e9710d in var_92fa0daf335cad50) {
            if (var_b5ecc103c0e9710d.player == player) {
                if (!isdefined(var_b3c92413c48e5f33)) {
                    var_b3c92413c48e5f33 = [];
                }
                var_b3c92413c48e5f33[var_b3c92413c48e5f33.size] = var_b5ecc103c0e9710d;
            }
        }
    }
    return var_b3c92413c48e5f33;
}

// Namespace br/namespace_d20f8ef223912e12
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b685
// Size: 0x25
function function_5833a495de752d1d(var_b5ecc103c0e9710d) {
    if (function_f483aacd19d70a1(var_b5ecc103c0e9710d)) {
        deregisterscriptableinstance(var_b5ecc103c0e9710d);
    }
    var_b5ecc103c0e9710d freescriptable();
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b6b1
// Size: 0x85
function function_ac65cef844e77ef3() {
    level endon("game_ended");
    if (isdefined(self) && isplayer(self)) {
        var_92fa0daf335cad50 = function_2e1567e33e6cddf9(self);
        if (isdefined(var_92fa0daf335cad50) && var_92fa0daf335cad50.size > 0) {
            foreach (var_b5ecc103c0e9710d in var_92fa0daf335cad50) {
                function_5833a495de752d1d(var_b5ecc103c0e9710d);
            }
        }
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b73d
// Size: 0x23
function function_758ee105bdf0c62d() {
    if (!istrue(self.var_54b9c134995ce717)) {
        self.var_54b9c134995ce717 = 1;
        thread function_ff6ad74932d3303b();
    }
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b767
// Size: 0xb
function function_dd137d458f25fefb() {
    self notify("scavenger_unset");
}

// Namespace br/namespace_d20f8ef223912e12
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1b779
// Size: 0x2c
function private function_ff6ad74932d3303b() {
    level endon("game_ended");
    waittill_any_2("death_or_disconnect", "scavenger_unset");
    namespace_d20f8ef223912e12::function_ac65cef844e77ef3();
    self.var_54b9c134995ce717 = undefined;
}

