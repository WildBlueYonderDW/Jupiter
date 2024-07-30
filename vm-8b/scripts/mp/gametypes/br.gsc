#using scripts\engine\utility.gsc;
#using scripts\engine\dev.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using scripts\mp\class.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\dvars.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\engine\throttle.gsc;
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
#using scripts\mp\globallogic.gsc;
#using script_2d9d24f7c63ac143;
#using scripts\cp_mp\utility\game_utility.gsc;
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
#using scripts\mp\gametypes\br_alt_mode_inflation.gsc;
#using script_5bc60484d17fa95c;
#using script_3583ff375ab3a91e;
#using script_7eafd8f2b77a1870;
#using scripts\mp\gametypes\br_c130airdrop.gsc;
#using scripts\mp\gametypes\br_jugg_common.gsc;
#using scripts\mp\gametypes\br_dev.gsc;
#using script_48814951e916af89;
#using script_2391409ef7b431e1;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using script_47deb71f27d46832;
#using script_72af5a878a9d3397;
#using script_55e418c5cc946593;
#using scripts\mp\music_and_dialog.gsc;
#using scripts\stealth\manager.gsc;
#using scripts\mp\playerstats_interface.gsc;
#using scripts\mp\gametypes\br.gsc;
#using script_7c40fa80892a721;
#using scripts\mp\gametypes\br_gulag.gsc;
#using scripts\mp\supers.gsc;
#using scripts\mp\tweakables.gsc;
#using scripts\mp\gametypes\common.gsc;
#using scripts\mp\gametypes\br_publicevents.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\gametypes\br_c130.gsc;
#using scripts\mp\gametypes\br_functional_poi.gsc;
#using scripts\mp\gametypes\br_callouts.gsc;
#using scripts\mp\gametypes\br_quest_util.gsc;
#using script_64acb6ce534155b7;
#using scripts\mp\gametypes\br_lootcache.gsc;
#using scripts\mp\gametypes\br_events.gsc;
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
#using scripts\mp\fire_traps.gsc;
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
#using scripts\mp\events.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\mp\damage.gsc;
#using scripts\cp_mp\utility\damage_utility.gsc;
#using script_40e63dd222434655;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\pet_watch.gsc;
#using scripts\mp\hud_message.gsc;
#using script_728ffcee8cbf30ee;
#using scripts\mp\gametypes\br_utility.gsc;
#using scripts\mp\gametypes\br_plunder.gsc;
#using script_ef36a50d9b4627d;
#using scripts\mp\utility\script.gsc;
#using script_58be75c518bf0d40;
#using script_76cc264b397db9cb;
#using scripts\mp\rank.gsc;
#using script_697b7ae06ba9b28c;
#using script_4cdabcd91a92977;
#using script_6ad351ebd5a33280;
#using script_15eddb0fac236a22;
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
#using scripts\mp\killcam.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_48614492ef09b23;
#using scripts\mp\equipment.gsc;
#using script_11a95cb71d0cda4;
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
#using scripts\mp\killstreaks\killstreaks.gsc;
#using script_26ccbfe3954cacf4;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using script_371b4c2ab5861e62;
#using script_16ddd685a448c6d2;
#using scripts\mp\ammorestock.gsc;
#using script_58f20490049af6ac;

#namespace br;

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x49bc
// Size: 0x156e
function main() {
    scripts\mp\globallogic::init();
    scripts\mp\globallogic::setupcallbacks();
    level.var_ef4c0a9630e35946 = 1;
    level.clearstockondrop = 1;
    level.disablespawncamera = 1;
    level.armoronweaponswitchlongpress = 1;
    level.dangerzoneskipequipment = 1;
    level.noweaponfalloff = 0;
    level.clampstepbulletdamage = 2;
    level.var_45496c9df00f2bd4 = getdvarint(@"hash_736b569488dc222c", 1);
    level.br_allowloadout = getmatchrulesdata("brData", "allowLoadout");
    level.var_66113aa6fc12be57 = getmatchrulesdata("brData", "allowLoadoutPreLobbyOnly");
    overridestate = getdvarint(@"hash_8ef1bd8f6066b1ba", 0);
    if (overridestate) {
        level.br_allowloadout = overridestate == 2;
    }
    level.var_6d1d9e1b59c6f37 = getdvarint(@"hash_1a1007f742526dfd", 0);
    level.var_f561fc43a226dae4 = getdvarint(@"hash_74c08dc52c036afa", 0);
    level.var_7d17e26667be2792 = getdvarint(@"hash_55d9444d8a3ce31a", 0);
    level.var_472d7a6d15e57940 = getdvarint(@"hash_586d32848f833922", 1);
    level.var_1d814f83596d0a02 = getdvarint(@"hash_7a1da73fa673ed8", 1);
    level.var_47207b7b330cf8e0 = getdvarint(@"hash_7a10dc1404d50bc2", 0);
    level.var_f478c1f94caa7e9 = getdvarint(@"hash_4f0a12b17756a2d0", 1);
    level.var_d914655fe46b8e34 = getdvarint(@"hash_6282debf96cfbaee", 0);
    level.var_78eeb0925326ec37 = getdvarint(@"hash_e1c7f11528b8f4fd", 0);
    level.var_87a4731d4dce4c3f = &namespace_aead94004cf4c147::function_8237b4eeab275f08;
    scripts\cp_mp\utility\game_utility::removematchingents_bykey("delete_on_load", "targetname");
    level.var_c62d39d6e6afb119 = istrue(level.gametypebundle.var_86488a8f183d526d);
    level.var_58adce74179ab9ef = getsubgametype() != "dmz" && getsubgametype() != "exgm";
    allowed[0] = getgametype();
    allowed[allowed.size] = getsubgametype();
    if (getgametype() != "br") {
        allowed[allowed.size] = "br";
    }
    scripts\mp\gameobjects::main(allowed);
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
    scripts\mp\gametypes\br_gametypes::init();
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
        setdvarifuninitialized(@"hash_bba79eeb1c990103", 1);
        setdvarifuninitialized(@"hash_1a0de898609317b4", 1);
        setdvarifuninitialized(@"hash_5c93dcd7535822e6", 0);
        setdvarifuninitialized(@"hash_1c8c6ec12cb275ca", 1);
        setdvarifuninitialized(@"hash_296dec2cbcfb6606", 0);
    }
    defineplayerloadout();
    updategametypedvars();
    scripts\cp_mp\parachute::initparachutedvars();
    table = "classtable:classtable_br_prematch";
    level.var_3dc5c06b446489 = 10;
    if (getdvarint(@"hash_39c3947a2e4f5f9e", 0)) {
        table = "classtable:classtable_br_default_mgl";
    }
    if (scripts\mp\gametypes\br_gametypes::isfeatureenabled("prematchBlueprints")) {
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
    thread initsound();
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
    level.var_4038d35f2cb73fd7 = &scripts\mp\gametypes\br_gametypes::isfeaturedisabled;
    level.migratespectators = &scripts\mp\gametypes\br_spectate::migratespectators;
    namespace_c31609f90efcf2ca::registeronplayerjoinsquadcallback(&onplayerjoinsquad);
    scripts\mp\utility\join_team_aggregator::registeronplayerjointeamcallback(&onplayerjointeam);
    if (!istrue(level.br_allowloadout) && !istrue(level.var_e4a482edc1542597)) {
        level.parachutetakeweaponscb = &scripts\cp_mp\parachute::takeweaponsdefaultfunc;
        level.parachuterestoreweaponscb = &nakeddrop;
    } else {
        level.parachutetakeweaponscb = &scripts\cp_mp\parachute::takeweaponsdefaultfunc;
        level.parachuterestoreweaponscb = &loadoutdrop;
    }
    level.modeshoulddofauxdeathfunc = &scripts\mp\gametypes\br_respawn::playershoulddofauxdeath;
    level.modeonlaststandfunc = &scripts\mp\gametypes\br_respawn::playersetinlaststand;
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
        setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_numLives"), 0);
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
    level.squadleaderboon = getdvarint(@"hash_8ad87bd26869ec0d", 0);
    if (!isdefined(level.skipprematchdropspawn)) {
        level.skipprematchdropspawn = getdvarint(@"hash_d182f4551b978e2b", 0);
    }
    level.br_debugsolotest = getdvarint(@"hash_c163d5db19834c48", 0);
    level.var_d804888d9484ff69 = getdvarint(@"hash_732cd1e227920a87", 0);
    if (function_a587b0b0998c6d13()) {
        level.disableforfeit = 1;
    }
    level.br_infils_disabled = getdvarint(@"hash_98f4cdf3fa51a9d0", 0) || scripts\mp\gametypes\br_gametypes::isfeaturedisabled("infil");
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
    level.var_ae3b17e71eb3bec7 = getdvarint(@"hash_166b51bf7450fc22", 0) == 0;
    level.var_a9cc50f70b867cde = getdvarint(@"hash_171034830e297d9d", 6);
    level.var_318de67b5265b4c6 = getdvarint(@"hash_6132d06d6475b2e0", 1) == 1;
    level.var_2f60d02380cd603d = &function_ad8c1e6228a10058;
    level.var_b13e35608b336d65 = &namespace_aead94004cf4c147::function_b13e35608b336d65;
    level.var_6196d9ea9a30e609 = &namespace_aead94004cf4c147::function_6196d9ea9a30e609;
    level.var_afa6afa7165491d8 = &namespace_aead94004cf4c147::function_897b29adb37f06a7;
    level.var_85cda66c74550adc = &function_85cda66c74550adc;
    level.var_dc52a11d1ee2690e = getdvarint(@"hash_4f15f2aa925e8391", 14000);
    level.var_5b5a1fcd1024eda5 = getdvarint(@"hash_6928f1749ee75af5", 0);
    level.var_b257658f289a3108 = getdvarfloat(@"hash_c8e65e0736e16b65", 0.09);
    level.var_27506e83d743e391 = getdvarint(@"hash_71f3055701408861", 6);
    level.var_5321a1377f9cc5aa = getdvarint(@"hash_81d2ecdee8b86aba", 6500);
    level.var_6fbd98e2b09d3c26 = throttle::throttle_initialize("dist_tracking", getdvarint(@"hash_a5863203bd890f51", 1));
    level.var_493c039ada7d082e = throttle::throttle_initialize("log_starting_loadout", getdvarint(@"hash_7753e675e77cb21f", 1));
    level.var_b24b5841e002edae = throttle::throttle_initialize("inc_rank_xp", getdvarint(@"hash_4261bac4ca06ff45", 1));
    function_525d65f5d0d3200e();
    function_cda409f3a76dac5();
    if (!isdefined(level.br_loadout_option)) {
        brinitloadoutoption();
    }
    namespace_8bfdb6eb5a3df67a::function_600cc18a5b7b64b0();
    scripts\mp\gametypes\br_analytics::branalytics_init();
    scripts\mp\gametypes\br_vehicles::brvehiclesinit();
    namespace_56a3588493afc984::main();
    namespace_973962356ce55fee::main();
    scripts\mp\gametypes\br_ending::br_ending_init();
    scripts\mp\gametypes\br_killstreaks::init();
    scripts\mp\gametypes\br_skydive_protection::init();
    level thread namespace_872204d77e9872c0::init(getsubgametype() != "dmz");
    if (istrue(level.var_c62d39d6e6afb119)) {
        thread namespace_bd614c3c2275579a::init();
    } else {
        thread function_9c8dfd3b19180b63();
    }
    level thread namespace_88bfae359020fdd3::init();
    level thread namespace_eca7530e5715bb19::init();
    level thread namespace_13e4e9def5bc390d::init();
    scripts\mp\gametypes\br_alt_mode_inflation::init();
    level thread namespace_eb17b46cdcb98eea::function_dbdca8ca57e8d71d();
    level thread namespace_ad49798629176e96::function_61b256ed26c0a7f7();
    level thread namespace_e70667b4168cd6::function_5675a69bbcea259();
    thread function_4708e0cb7eea8875();
    thread function_d1618645a2c0e3e6();
    initializetweakableoverrides();
    entcleanup();
    level thread announceplayercountlandmarks();
    level.noinventory = getdvarint(@"hash_19fae1aad58e8c50", 0);
    setdvarifuninitialized(@"hash_a5ab8ed6cc1b486a", 3);
    setdvarifuninitialized(@"hash_d9b119233df13ac1", 600);
    setdvarifuninitialized(@"hash_fdeb104ec6908df8", 600);
    setdvarifuninitialized(@"hash_9775c39c335aab23", 600);
    setdvar(@"hash_7b5549fcfa5138bc", 30);
    namespace_b08dd2d4e74abdfa::function_c238e4c6605e99f8();
    thread scripts\mp\gametypes\br_c130airdrop::init();
    thread scripts\mp\gametypes\br_jugg_common::init();
    thread scripts\mp\gametypes\br_dev::init();
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
    registersharedfunc("hud", "showBrDMZSplash", &scripts\mp\gametypes\br_gametype_dmz::showdmzsplash);
    namespace_20e47d4600ec88ae::init();
    if (scripts\cp_mp\utility\game_utility::function_ba5574c7f287c587() || scripts\cp_mp\utility\game_utility::function_6493ec89ae923684()) {
        namespace_92443376a63aa4bd::initialize();
    }
    if (!scripts\mp\gametypes\br_gametypes::isbrgametypefuncdefined("lootAllowedInBackpack")) {
        scripts\mp\gametypes\br_gametypes::registerbrgametypefunc("lootAllowedInBackpack", &function_e83ab39a1e762ead);
    }
    if (namespace_708f627020de59d3::function_c0d385a09d173a36()) {
        scripts\mp\gametypes\br_gametypes::registerbrgametypefunc("canItemFitInBackpack", &function_af6a6066a0a69f0f);
    }
    function_30887b17705338b6();
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5f32
// Size: 0x1c
function function_30887b17705338b6() {
    level.var_1bc9ccb3f47cf947 = istrue(getdvarint(@"hash_2e5b8ec324d79730", 1));
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5f56
// Size: 0x3e
function initsound() {
    subgametype = getsubgametype();
    level.nosuspensemusic = 1;
    waittillframeend();
    thread scripts\mp\music_and_dialog::stopsuspensemusic();
    if (subgametype != "dmz") {
        function_f1aed36ab4598ea("mp_gamemode_br");
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5f9c
// Size: 0xa
function function_d1618645a2c0e3e6() {
    level waittill("infils_ready");
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5fae
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
    scripts\stealth\manager::set_event_distances(array);
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x630a
// Size: 0x31
function waitthensetstatgroupreadonly() {
    self endon("game_ended");
    wait 1;
    if (isdefined(level.playerstats)) {
        scripts\mp\playerstats_interface::makeplayerstatgroupreadonly("losses");
        scripts\mp\playerstats_interface::makeplayerstatgroupreadonly("winLoss");
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6343
// Size: 0x41
function entcleanup() {
    for (i = 1; i < 10; i++) {
        _delete_ents("script_noteworthy", "locale_" + i);
    }
    _delete_ents("script_noteworthy", "locale_99");
}

// Namespace br / scripts\mp\gametypes\br
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x638c
// Size: 0x31
function _delete_ents(key, value) {
    ents = getentarray(value, key);
    array_call(ents, &delete);
}

// Namespace br / scripts\mp\gametypes\br
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x63c5
// Size: 0x417
function initstandardloadout(tablename, classindex) {
    numloadouts = scripts\mp\class::function_df2933f96d726d71(tablename);
    assert(classindex < numloadouts);
    loadout["loadoutArchetype"] = "archetype_assault";
    loadout["loadoutPrimary"] = scripts\mp\class::function_c7a0b640c398497(tablename, classindex).primaryweapon.weapon;
    loadout["loadoutPrimaryAttachment"] = scripts\mp\class::function_c7a0b640c398497(tablename, classindex).primaryweapon.attachment1;
    loadout["loadoutPrimaryAttachment2"] = scripts\mp\class::function_c7a0b640c398497(tablename, classindex).primaryweapon.attachment2;
    loadout["loadoutPrimaryAttachment3"] = scripts\mp\class::function_c7a0b640c398497(tablename, classindex).primaryweapon.attachment3;
    loadout["loadoutPrimaryAttachment4"] = scripts\mp\class::function_c7a0b640c398497(tablename, classindex).primaryweapon.attachment4;
    loadout["loadoutPrimaryAttachment5"] = scripts\mp\class::function_c7a0b640c398497(tablename, classindex).primaryweapon.attachment5;
    loadout["loadoutPrimaryCamo"] = scripts\mp\class::function_c7a0b640c398497(tablename, classindex).primaryweapon.camo;
    loadout["loadoutPrimaryReticle"] = scripts\mp\class::function_c7a0b640c398497(tablename, classindex).primaryweapon.reticle;
    loadout["loadoutSecondary"] = scripts\mp\class::function_c7a0b640c398497(tablename, classindex).secondaryweapon.weapon;
    loadout["loadoutSecondaryAttachment"] = scripts\mp\class::function_c7a0b640c398497(tablename, classindex).secondaryweapon.attachment1;
    loadout["loadoutSecondaryAttachment2"] = scripts\mp\class::function_c7a0b640c398497(tablename, classindex).secondaryweapon.attachment2;
    loadout["loadoutSecondaryAttachment3"] = scripts\mp\class::function_c7a0b640c398497(tablename, classindex).secondaryweapon.attachment3;
    loadout["loadoutSecondaryAttachment4"] = scripts\mp\class::function_c7a0b640c398497(tablename, classindex).secondaryweapon.attachment4;
    loadout["loadoutSecondaryAttachment5"] = scripts\mp\class::function_c7a0b640c398497(tablename, classindex).secondaryweapon.attachment5;
    loadout["loadoutSecondaryCamo"] = scripts\mp\class::function_c7a0b640c398497(tablename, classindex).secondaryweapon.camo;
    loadout["loadoutSecondaryReticle"] = scripts\mp\class::function_c7a0b640c398497(tablename, classindex).secondaryweapon.reticle;
    loadout["loadoutMeleeSlot"] = "none";
    loadout["loadoutEquipmentPrimary"] = scripts\mp\class::function_c7a0b640c398497(tablename, classindex).equipment.primary;
    loadout["loadoutEquipmentSecondary"] = scripts\mp\class::function_c7a0b640c398497(tablename, classindex).equipment.secondary;
    loadout["loadoutStreakType"] = "assault";
    loadout["loadoutKillstreak1"] = "none";
    loadout["loadoutKillstreak2"] = "none";
    loadout["loadoutKillstreak3"] = "none";
    loadout["loadoutSuper"] = "super_br_extract";
    loadout["loadoutPerks"] = [scripts\mp\class::function_c7a0b640c398497(tablename, classindex).perks.perk1, scripts\mp\class::function_c7a0b640c398497(tablename, classindex).perks.perk2, scripts\mp\class::function_c7a0b640c398497(tablename, classindex).perks.perk3, scripts\mp\class::function_c7a0b640c398497(tablename, classindex).extraperks.perk1, scripts\mp\class::function_c7a0b640c398497(tablename, classindex).extraperks.perk2, scripts\mp\class::function_c7a0b640c398497(tablename, classindex).extraperks.perk3];
    loadout["loadoutGesture"] = "playerData";
    loadout["loadoutFieldUpgrade1"] = "none";
    loadout["loadoutFieldUpgrade2"] = "none";
    loadout["tableColumn"] = classindex;
    return loadout;
}

// Namespace br / scripts\mp\gametypes\br
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x67e5
// Size: 0x11a
function givestandardtableloadout(classindex, quickloadout, noextraammo) {
    if (!isdefined(level.br_standard_loadout)) {
        level.br_standard_loadout = initstandardloadout("classtable:classtable_br", classindex);
        assert(isdefined(level.br_standard_loadout));
    }
    self.pers["gamemodeLoadout"] = level.br_standard_loadout;
    self.class = "gamemode";
    self.prevweaponobj = undefined;
    struct = scripts\mp\class::loadout_getclassstruct();
    struct = scripts\mp\class::loadout_updateclass(struct, "gamemode");
    scripts\mp\class::preloadandqueueclassstruct(struct, 1, 1);
    self takeallweapons();
    scripts\mp\class::giveloadout(self.team, "gamemode", quickloadout, quickloadout);
    self givestartammo(struct.loadoutprimaryobject);
    self givestartammo(struct.loadoutsecondaryobject);
    scripts\mp\gametypes\br::givelaststandifneeded(self);
    scripts\mp\gametypes\br_weapons::br_ammo_player_clear();
    if (!istrue(noextraammo)) {
        scripts\mp\gametypes\br_weapons::br_give_starting_ammo();
    }
    scripts\mp\gametypes\br_weapons::br_ammo_update_weapons(self);
    self notify("ammo_update");
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6907
// Size: 0x16c
function nakeddrophandleloadout() {
    if (function_31651d3fd72991aa()) {
        respawnloadout = namespace_8bfdb6eb5a3df67a::function_eee8abc18302f5ef();
        level.br_standard_loadout = respawnloadout[0];
        noextraammo = respawnloadout[1];
        givestandardtableloadout(0, 1, noextraammo);
        return;
    }
    if (brdoesloadoutoptiongivestandardloadoutimmediately()) {
        quickloadout = 0;
        if (istrue(self.hasspawnweapons)) {
            return;
        }
        var_cf45f8ef8ed86b4c = isdefined(self.hasspawnweapons) && !self.hasspawnweapons;
        if (var_cf45f8ef8ed86b4c) {
            quickloadout = 1;
        }
        loadoutindex = brgetloadoutoptionstandardloadoutindex();
        givestandardtableloadout(loadoutindex, quickloadout);
        if (scripts\cp_mp\utility\game_utility::isbrstylegametype() && !istrue(level.var_595938569c3fe806) && getdvarint(@"hash_1ca10ca828658cf7", 1) == 1) {
            var_dc6bf94dbaaa7056 = getmatchrulesdata("commonOption", "infilArmor");
            infilReservePlates = getmatchrulesdata("commonOption", "infilReservePlates");
            namespace_f8d3520d3483c1::givestartingarmor(var_dc6bf94dbaaa7056, undefined, infilReservePlates);
        }
        if (var_cf45f8ef8ed86b4c) {
            self.hasspawnweapons = 1;
        }
        return;
    }
    if (brdoesloadoutoptionusedropbags()) {
        givematchloadoutfordropbags();
        return;
    }
    if (brdoesloadoutoptiongivecustomweaponsimmediately()) {
        ammomult = brgetloadoutammomultiplier();
        ammomax = brgetloadoutammomax();
        givematchloadout(ammomult, ammomax);
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6a7b
// Size: 0x30
function isInstancedSpace() {
    if (!isdefined(level.var_5954867ad88105fa)) {
        level.var_5954867ad88105fa = getdvarint(@"hash_741256d4a75b3e28", 0);
    }
    return level.var_5954867ad88105fa;
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6ab4
// Size: 0x107
function nakeddrop() {
    if (scripts\mp\gametypes\br_gametypes::isbrgametypefuncdefined("playerDropBonuses")) {
        scripts\mp\gametypes\br_gametypes::runbrgametypefunc("playerDropBonuses");
    }
    var_e97c69489cc1637a = scripts\mp\gametypes\br_gulag::gulagwinnerrestoreloadout();
    if (!var_e97c69489cc1637a && istrue(level.br_prematchstarted) && !istrue(self.gulag)) {
        if (getdvarint(@"hash_4799897b190d65", 1)) {
            if (issharedfuncdefined("backpack", "isBackpackInventoryEnabled") && [[ getsharedfunc("backpack", "isBackpackInventoryEnabled") ]]()) {
                for (packitemindex = 0; packitemindex < namespace_aead94004cf4c147::function_b13e35608b336d65(self); packitemindex++) {
                    namespace_aead94004cf4c147::function_db1dd76061352e5b(packitemindex);
                }
            }
        }
        if (scripts\mp\gametypes\br_gametypes::isbrgametypefuncdefined("playerNakedDropLoadout")) {
            scripts\mp\gametypes\br_gametypes::runbrgametypefunc("playerNakedDropLoadout");
        } else {
            nakeddrophandleloadout();
        }
    }
    if (namespace_aead94004cf4c147::isbackpackinventoryenabled() && getdvarint(@"hash_68a323d5bd07266c", 0) == 1) {
        namespace_aead94004cf4c147::function_c2f16e2bbb4e38c0("brloot_nvg");
    }
    thread br_displayperkinfo();
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6bc3
// Size: 0x19a
function loadoutdrop() {
    if (scripts\mp\gametypes\br_gametypes::isbrgametypefuncdefined("playerDropBonuses")) {
        scripts\mp\gametypes\br_gametypes::runbrgametypefunc("playerDropBonuses");
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
    struct = scripts\mp\class::preloadandqueueclass(class, 1);
    thread scripts\mp\class::swaploadout();
    if (class != "gamemode") {
        _takeweapon("iw9_me_fists_mp");
    }
    self.tokenrespawned = 0;
    if (!istrue(self.prematchintiallandingcomplete)) {
        if (istrue(level.giveloadouteverytime)) {
            thread brgivestartfieldupgrade();
        }
    }
    self.prematchintiallandingcomplete = 1;
    if (!istrue(self.initiallandingcomplete)) {
        if (istrue(level.br_prematchstarted)) {
            if (istrue(level.giveloadouteverytime)) {
                thread brgivestartfieldupgrade();
            }
            self.initiallandingcomplete = 1;
        }
    }
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype() && getsubgametype() != "dmz" && getdvarint(@"hash_1ca10ca828658cf7", 1) == 1) {
        var_968bd61837a9c038 = getmatchrulesdata("commonOption", "respawnArmor");
        respawnReservePlates = getmatchrulesdata("commonOption", "respawnReservePlates");
        namespace_f8d3520d3483c1::givestartingarmor(var_968bd61837a9c038, undefined, respawnReservePlates);
    }
    thread br_displayperkinfo();
}

// Namespace br / scripts\mp\gametypes\br
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x6d65
// Size: 0x264
function function_5357c1261661e9e4(cratemover, player, updist, downdist) {
    var_1f0f661b1f135896 = -2400;
    contents = scripts\engine\trace::create_contents(0, 1, 1, 1, 0, 1, 1);
    watercontents = scripts\engine\trace::function_b88b8bd51ea7fe24();
    contents &= ~watercontents;
    crateradius = 70;
    toplayerorigin = player.origin - cratemover.origin;
    var_4d339274da6847d6 = (toplayerorigin[0], toplayerorigin[1], 0);
    toplayeryaw = 0;
    if (length2d(var_4d339274da6847d6) > 0.001) {
        var_ec0a3044d861d58e = vectornormalize(var_4d339274da6847d6);
        toplayerangles = vectortoangles(var_ec0a3044d861d58e);
        toplayeryaw = angleclamp180(toplayerangles[1]);
    }
    crateorigin = cratemover.origin;
    traceoffset = (cos(toplayeryaw), sin(toplayeryaw), 0);
    traceoffset = vectornormalize(traceoffset);
    traceoffset *= crateradius;
    result = scripts\mp\gametypes\br_public::raytraceoffset(crateorigin, traceoffset[0], traceoffset[1], updist, downdist, contents, cratemover);
    if (result["fraction"] < 1) {
        safepoint = result["position"] + (0, 0, 0.001);
        walltracestart = crateorigin + (0, 0, 30);
        walltraceresult = scripts\engine\trace::ray_trace(walltracestart, safepoint, cratemover, contents);
        if (walltraceresult["fraction"] >= 1) {
            player setorigin(safepoint);
            return;
        }
    }
    result = scripts\mp\gametypes\br_public::raytraceoffset(crateorigin, 0, 0, updist, downdist, contents);
    if (result["fraction"] < 1) {
        clearstartpoint = result["position"] + (0, 0, 0.2);
        clearendpoint = result["position"] + (0, 0, 1);
        cleartracepoint = playerphysicstrace(clearstartpoint, clearendpoint);
        if (cleartracepoint == clearendpoint) {
            player setorigin(result["position"]);
            return;
        }
    }
    player kill(cratemover.origin);
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6fd1
// Size: 0x78
function brgivestartfieldupgrade() {
    level endon("prematch_done");
    self endon("death_or_disconnect");
    if (level.var_47207b7b330cf8e0) {
        return;
    }
    if (gameflag("prematch_done")) {
        return;
    }
    self waittill("parachute_landed");
    if (istrue(level.allowsupers)) {
        super = scripts\mp\supers::getcurrentsuper();
        if (isdefined(super)) {
            scripts\mp\supers::givesuperpoints(scripts\mp\supers::getsuperpointsneeded());
        }
        return;
    }
    scripts\mp\gametypes\br_pickups::forcegivesuper(self.loadoutbrfieldupgrade);
}

// Namespace br / scripts\mp\gametypes\br
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7051
// Size: 0x79
function brplayerhudoutlineforteammatessafe(player, otherplayer) {
    if (!isdefined(player)) {
        return false;
    }
    if (!isalive(player)) {
        return false;
    }
    if (istrue(player.gulag)) {
        return false;
    }
    if (!isdefined(player.team)) {
        return false;
    }
    if (isdefined(otherplayer) && otherplayer.team != player.team) {
        return false;
    }
    if (isdefined(otherplayer) && otherplayer == player) {
        return false;
    }
    return true;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x70d3
// Size: 0x1dc
function brplayerhudoutlineforteammatesupdate(player) {
    if (!isdefined(player) || !isdefined(player.var_3f78c6a0862f9e25) || !isdefined(player.teammateoutlineids)) {
        return;
    }
    assert(issharedfuncdefined("<dev string:x1c>", "<dev string:x24>"));
    playersquad = [[ getsharedfunc("game", "getFriendlyPlayers") ]](player.team, 1);
    assetname = "outline_nodepth_brplayer" + player.var_3f78c6a0862f9e25 + 1;
    distmax = getdvarint(@"hash_4530f1e48da9e83a", 1024);
    var_671bcaffb2f4070a = squared(distmax);
    playerisvalid = brplayerhudoutlineforteammatessafe(player);
    foreach (teammate in playersquad) {
        entnum = teammate getentitynumber();
        var_29f49a35acc51689 = playerisvalid && brplayerhudoutlineforteammatessafe(teammate, player);
        if (var_29f49a35acc51689) {
            dist = distancesquared(player.origin, teammate.origin);
            if (dist > var_671bcaffb2f4070a) {
                var_29f49a35acc51689 = 0;
            }
        }
        if (!var_29f49a35acc51689) {
            if (isdefined(player.teammateoutlineids[entnum])) {
                scripts\mp\utility\outline::outlinedisable(player.teammateoutlineids[entnum], player);
                player.teammateoutlineids[entnum] = undefined;
            }
            continue;
        }
        if (!isdefined(player.teammateoutlineids[entnum])) {
            player.teammateoutlineids[entnum] = scripts\mp\utility\outline::outlineenableforplayer(player, teammate, assetname, "level_script");
        }
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x72b7
// Size: 0x2a
function brplayerhudoutlineupdatefromnotify(player) {
    player endon("disconnect");
    while (true) {
        level waittill("update_circle_hide");
        brplayerhudoutlineforteammatesupdate(player);
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x72e9
// Size: 0x61
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
    while (true) {
        brplayerhudoutlineforteammatesupdate(player);
        wait 1;
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7352
// Size: 0x17
function initializetweakableoverrides() {
    if (!isdefined(level.tweakablesinitialized)) {
        thread scripts\mp\tweakables::init();
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7371
// Size: 0x1b1
function initializematchrules() {
    assert(isusingmatchrulesdata());
    setcommonrulesfrommatchrulesdata();
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_brLoadouts"), getmatchrulesdata("brData", "brLoadouts"));
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_crateDropTimer"), getmatchrulesdata("brData", "crateDropTimer"));
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_infilC130"), getmatchrulesdata("brData", "infilC130"));
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_gulag"), getmatchrulesdata("brData", "gulag"));
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_circleDamageMultiplier"), getmatchrulesdata("brData", "circleDamageMultiplier"));
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_startingWeapon"), getmatchrulesdata("brData", "startingWeapon"));
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_roundlimit"), 1);
    registerroundlimitdvar("br", 1);
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_winlimit"), 1);
    registerwinlimitdvar("br", 1);
    setdynamicdvar(hashcat(@"hash_d98c82b5a26dc973", getgametype(), "_promode"), 0);
    registerlaststandinvulntimerdvar(0);
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x752a
// Size: 0xf9
function updategametypedvars() {
    scripts\mp\gametypes\common::updatecommongametypedvars();
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

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x762b
// Size: 0xad
function pickclassbr() {
    class = "";
    if (!istrue(level.br_prematchstarted) && istrue(level.br_prematchffa) && getdvarint(@"hash_25ad2925d6075c8f", 0) == 0) {
        class = pickprematchrandomloadout();
    } else {
        pickedloadout = level.br_loadouts["default"];
        if (scripts\mp\gametypes\br_gametypes::isbrgametypefuncdefined("getDefaultLoadout")) {
            pickedloadout = scripts\mp\gametypes\br_gametypes::runbrgametypefunc("getDefaultLoadout");
        }
        self.pers["gamemodeLoadout"] = pickedloadout;
        class = "gamemode";
    }
    self.pers["class"] = class;
    return class;
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x76e1
// Size: 0x138
function function_20f91635cfffbdcf() {
    wait 5;
    iprintln("Loadout verification starting in 10 seconds.");
    wait 5;
    iprintln("5 seconds to start.");
    wait 5;
    iprintln("Verification start!");
    for (testindex = 0; testindex < level.var_3dc5c06b446489; testindex++) {
        iprintln("Loadout: " + testindex);
        self.pers["gamemodeLoadout"] = level.prematchloadouts[level.prematchrandomloadout[testindex]];
        self.class = "gamemode";
        preloadandqueueclass(self.pers["class"]);
        scripts\mp\class::swaploadout();
        br_ammo_player_max_out();
        wait 5;
        _switchtoweapon(self.secondaryweapon);
        wait 4;
    }
    self.pers["gamemodeLoadout"] = level.prematchloadouts[level.prematchrandomloadout[0]];
    self.class = "gamemode";
    preloadandqueueclass(self.pers["class"]);
    scripts\mp\class::swaploadout();
    br_ammo_player_max_out();
    iprintln("Verification done!");
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7821
// Size: 0x44
function function_788f7c22fa09824() {
    if (self isplayerheadless()) {
        if (self.pers["gamemodeLoadout"]["loadoutEquipmentPrimary"] == "equip_molotov") {
            self.pers["gamemodeLoadout"]["loadoutEquipmentPrimary"] = "equip_frag";
        }
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x786d
// Size: 0x1a1
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
        assertex(level.prematchloadouts[level.prematchrandomloadout[self.prematchloadoutindex]]["<dev string:x3a>"] != "<dev string:x4c>", "<dev string:x50>");
        self.pers["gamemodeLoadout"] = level.prematchloadouts[level.prematchrandomloadout[self.prematchloadoutindex]];
        class = "gamemode";
        function_788f7c22fa09824();
    } else {
        class = "default" + randomint(10) + 1;
    }
    return class;
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7a17
// Size: 0xff
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
        classidx = getdvarint(@"hash_a1967148d48b7992", -1);
        if (classidx >= 0) {
            level.prematchloadouts[level.prematchloadouts.size] = updateprematchloadoutarray(table, classidx, classidx);
            return;
        }
    #/
    var_3dc1e231ad1d8fd2 = buildloadoutindices(var_3dc1e231ad1d8fd2);
    for (var_fa1ae55f729ddc96 = 0; var_fa1ae55f729ddc96 < var_3dc1e231ad1d8fd2["classIdxPrimaryArray"].size; var_fa1ae55f729ddc96++) {
        primaryindex = var_3dc1e231ad1d8fd2["classIdxPrimaryArray"][var_fa1ae55f729ddc96];
        secondaryindex = var_3dc1e231ad1d8fd2["classIdxSecondaryArray"][var_fa1ae55f729ddc96];
        level.prematchloadouts[level.prematchloadouts.size] = updateprematchloadoutarray(table, primaryindex, secondaryindex);
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7b1e
// Size: 0x1c0
function buildloadoutindices(var_3dc1e231ad1d8fd2) {
    var_7c8feb9da40f13a2 = 0;
    var_7a97ce49e361e991 = 2;
    var_399cea81ad587e4d = 2;
    var_154c735b7d5ac474 = 1;
    var_a4f11b0b6adffaff = 1;
    var_6a1d197e7f97f97c = 2;
    var_b93db625cd6f699 = 2;
    allloadouts = [var_7a97ce49e361e991, var_399cea81ad587e4d, var_154c735b7d5ac474, var_a4f11b0b6adffaff, var_6a1d197e7f97f97c, var_b93db625cd6f699];
    while (var_7c8feb9da40f13a2 < allloadouts.size) {
        var_f8134fcd629eb9dd = 0;
        retry = 0;
        maxtry = 5;
        while (var_f8134fcd629eb9dd < allloadouts[var_7c8feb9da40f13a2]) {
            var_8b0cadb1c3acc65c = giverandomloadoutindex(var_7c8feb9da40f13a2);
            if (!array_contains(var_3dc1e231ad1d8fd2["classIdxPrimaryArray"], var_8b0cadb1c3acc65c) || retry >= maxtry) {
                var_f8134fcd629eb9dd++;
                retry = 0;
                var_3dc1e231ad1d8fd2["classIdxPrimaryArray"][var_3dc1e231ad1d8fd2["classIdxPrimaryArray"].size] = var_8b0cadb1c3acc65c;
                continue;
            }
            retry++;
        }
        var_7c8feb9da40f13a2++;
    }
    var_6ae6a640c4c9252b = 0;
    for (secondarycounter = 0; secondarycounter < var_3dc1e231ad1d8fd2["classIdxPrimaryArray"].size; secondarycounter++) {
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

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7ce7
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
        assertmsg("<dev string:xa1>");
        break;
    }
    return var_e98acf9fa9d0767d;
}

// Namespace br / scripts\mp\gametypes\br
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x7e03
// Size: 0x401
function updateprematchloadoutarray(table, primaryindex, secondaryindex) {
    if (primaryindex == secondaryindex) {
        if (secondaryindex > 0) {
            secondaryindex--;
        } else {
            secondaryindex = 1;
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
    var_e698df1ec0933ce4["tableColumn"] = primaryindex;
    var_e698df1ec0933ce4["loadoutPrimaryAddBlueprintAttachments"] = scripts\mp\class::table_getaddblueprintattachments(table, primaryindex, 0);
    var_e698df1ec0933ce4["loadoutPrimary"] = scripts\mp\class::table_getweapon(table, primaryindex, 0);
    for (attachmentindex = 0; attachmentindex < scripts\mp\class::getmaxprimaryattachments(); attachmentindex++) {
        attachstring = scripts\mp\class::getattachmentloadoutstring(attachmentindex, #"primary");
        var_e698df1ec0933ce4[attachstring] = scripts\mp\class::table_getweaponattachment(table, primaryindex, 0, attachmentindex);
    }
    var_e698df1ec0933ce4["loadoutPrimaryCamo"] = scripts\mp\class::table_getweaponcamo(table, primaryindex, 0);
    var_e698df1ec0933ce4["loadoutPrimaryReticle"] = scripts\mp\class::table_getweaponreticle(table, primaryindex, 0);
    var_e698df1ec0933ce4["loadoutPrimaryVariantID"] = scripts\mp\class::table_getweaponvariantid(table, primaryindex, 0, var_e698df1ec0933ce4["loadoutPrimary"]);
    var_e698df1ec0933ce4["loadoutSecondaryAddBlueprintAttachments"] = scripts\mp\class::table_getaddblueprintattachments(table, secondaryindex, 0);
    var_e698df1ec0933ce4["loadoutSecondary"] = scripts\mp\class::table_getweapon(table, secondaryindex, 0);
    for (attachmentindex = 0; attachmentindex < scripts\mp\class::getmaxsecondaryattachments(); attachmentindex++) {
        attachstring = scripts\mp\class::getattachmentloadoutstring(attachmentindex, #"secondary");
        var_e698df1ec0933ce4[attachstring] = scripts\mp\class::table_getweaponattachment(table, secondaryindex, 0, attachmentindex);
    }
    var_e698df1ec0933ce4["loadoutSecondaryCamo"] = scripts\mp\class::table_getweaponcamo(table, secondaryindex, 0);
    var_e698df1ec0933ce4["loadoutSecondaryReticle"] = scripts\mp\class::table_getweaponreticle(table, secondaryindex, 0);
    var_e698df1ec0933ce4["loadoutSecondaryVariantID"] = scripts\mp\class::table_getweaponvariantid(table, secondaryindex, 0, var_e698df1ec0933ce4["loadoutSecondary"]);
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
        perk = scripts\mp\class::table_getperk(table, primaryindex, i);
        if (perk != "specialty_null") {
            var_e698df1ec0933ce4["loadoutPerks"][var_e698df1ec0933ce4["loadoutPerks"].size] = perk;
        }
    }
    var_e698df1ec0933ce4["loadoutGesture"] = "playerData";
    var_e698df1ec0933ce4["loadoutExecution"] = "playerData";
    return var_e698df1ec0933ce4;
}

// Namespace br / scripts\mp\gametypes\br
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x820d
// Size: 0x39a
function updatex1prematchloadoutarray(table, loadoutidx) {
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
    var_e698df1ec0933ce4["tableColumn"] = loadoutidx;
    var_e698df1ec0933ce4["loadoutPrimaryAddBlueprintAttachments"] = scripts\mp\class::table_getaddblueprintattachments(table, loadoutidx, 0);
    var_e698df1ec0933ce4["loadoutPrimary"] = scripts\mp\class::table_getweapon(table, loadoutidx, 0);
    for (attachmentindex = 0; attachmentindex < scripts\mp\class::getmaxprimaryattachments(); attachmentindex++) {
        attachstring = scripts\mp\class::getattachmentloadoutstring(attachmentindex, #"primary");
        var_e698df1ec0933ce4[attachstring] = scripts\mp\class::table_getweaponattachment(table, loadoutidx, 0, attachmentindex);
    }
    var_e698df1ec0933ce4["loadoutPrimaryCamo"] = scripts\mp\class::table_getweaponcamo(table, loadoutidx, 0);
    var_e698df1ec0933ce4["loadoutPrimaryReticle"] = scripts\mp\class::table_getweaponreticle(table, loadoutidx, 0);
    var_e698df1ec0933ce4["loadoutPrimaryVariantID"] = scripts\mp\class::table_getweaponvariantid(table, loadoutidx, 0, var_e698df1ec0933ce4["loadoutPrimary"]);
    var_e698df1ec0933ce4["loadoutSecondaryAddBlueprintAttachments"] = scripts\mp\class::table_getaddblueprintattachments(table, loadoutidx, 1);
    var_e698df1ec0933ce4["loadoutSecondary"] = scripts\mp\class::table_getweapon(table, loadoutidx, 1);
    for (attachmentindex = 0; attachmentindex < scripts\mp\class::getmaxsecondaryattachments(); attachmentindex++) {
        attachstring = scripts\mp\class::getattachmentloadoutstring(attachmentindex, #"secondary");
        var_e698df1ec0933ce4[attachstring] = scripts\mp\class::table_getweaponattachment(table, loadoutidx, 1, attachmentindex);
    }
    var_e698df1ec0933ce4["loadoutSecondaryCamo"] = scripts\mp\class::table_getweaponcamo(table, loadoutidx, 1);
    var_e698df1ec0933ce4["loadoutSecondaryReticle"] = scripts\mp\class::table_getweaponreticle(table, loadoutidx, 1);
    var_e698df1ec0933ce4["loadoutSecondaryVariantID"] = int(tablelookup(table, 0, "loadoutSecondaryVariantID", loadoutidx + 1));
    var_e698df1ec0933ce4["loadoutEquipmentPrimary"] = tablelookup(table, 0, "loadoutEquipmentPrimary", loadoutidx + 1);
    if (cointoss()) {
        var_e698df1ec0933ce4["loadoutExtraEquipmentPrimary"] = "TRUE";
    } else {
        var_e698df1ec0933ce4["loadoutExtraEquipmentPrimary"] = "FALSE";
    }
    var_e698df1ec0933ce4["loadoutEquipmentSecondary"] = tablelookup(table, 0, "loadoutEquipmentSecondary", loadoutidx + 1);
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

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x85b0
// Size: 0x103
function getrandomprematchequipment(slot) {
    equipmentarray = [];
    assertex(isdefined(slot), "<dev string:xc0>");
    if (slot == "lethal") {
        equipmentarray = ["equip_at_mine", "equip_claymore", "equip_c4", "equip_frag", "equip_molotov", "equip_semtex", "equip_thermite", "equip_throwing_knife", "equip_throwing_knife_fire", "equip_throwing_knife_electric"];
    } else if (slot == "tactical") {
        equipmentarray = ["equip_adrenaline", "equip_concussion", "equip_decoy", "equip_flash", "equip_gas_grenade", "equip_smoke", "equip_snapshot_grenade"];
    } else {
        assertmsg("<dev string:xed>");
    }
    equipment = equipmentarray[randomint(equipmentarray.size)];
    return equipment;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x86bc
// Size: 0x1b3
function prematchinitloadouts(table) {
    var_7d958726e11b327 = scripts\mp\class::function_df2933f96d726d71(table);
    level.prematchloadouts = [];
    loadoutset = 0;
    if (getdvar(@"hash_fc5f34b202c7515e") != "") {
        debugloadouts = strtok(getdvar(@"hash_fc5f34b202c7515e"), " ");
        intloadouts = [];
        for (debugindex = 0; debugindex < debugloadouts.size; debugindex++) {
            intloadouts[intloadouts.size] = int(debugloadouts[intloadouts.size]);
        }
        for (intindex = 0; intindex < intloadouts.size; intindex++) {
            level.prematchloadouts[level.prematchloadouts.size] = initstandardloadout(table, intloadouts[intindex]);
        }
        level.var_3dc5c06b446489 = intloadouts.size;
        return;
    } else if (getdvarint(@"hash_c7eeced4234b1158", 1)) {
        if (getdvarint(@"hash_8fd5e2fbd99396a4", 0) == 1 && getdvarint(@"hash_b1d09189d817146", -1) == -1) {
            loadoutset = 0;
            level.var_3dc5c06b446489 = var_7d958726e11b327;
        } else {
            loadoutset = int(randomint(var_7d958726e11b327 - 1) * 0.1) * 10;
            if (getdvarint(@"hash_b1d09189d817146", -1) != -1) {
                loadoutset = getdvarint(@"hash_b1d09189d817146", -1);
            }
            var_7d958726e11b327 = loadoutset + 10;
        }
    }
    for (classindex = loadoutset; classindex < var_7d958726e11b327; classindex++) {
        level.prematchloadouts[level.prematchloadouts.size] = initstandardloadout(table, classindex);
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8877
// Size: 0x2df
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
    level.br_loadouts["default"]["loadoutPerks"] = ["specialty_null"];
    level.br_loadouts["default"]["loadoutGesture"] = "playerData";
    level.br_loadouts["default"]["loadoutFieldUpgrade1"] = "none";
    level.br_loadouts["default"]["loadoutFieldUpgrade2"] = "none";
    level.br_loadouts["allies"] = level.br_loadouts["default"];
    level.br_loadouts["axis"] = level.br_loadouts["default"];
    level.br_respawn_loadout = level.br_loadouts["default"];
    level.br_respawn_loadout["loadoutSecondary"] = "jup_cp24_pi_glima21";
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8b5e
// Size: 0xec
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

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8c52
// Size: 0x61e
function onstartgametype() {
    println("<dev string:x120>");
    scripts\mp\gametypes\br_gametypes::runbrgametypefunc("onStartGameTypePre");
    level.blockweapondrops = 1;
    level.customlaststandactionset = "brlaststand";
    val::group_register(level.customlaststandactionset, ["usability", "vehicle_use", "crate_use", "ascender_use", "weapon_switch", "weapon_switch_clip", "offhand_primary_weapons", "offhand_secondary_weapons", "killstreaks", "supers", "gesture", "allow_jump", "sprint", "crouch", "prone", "melee", "fire", "show_operator_pet"]);
    level.graceperiod = 3;
    level.ingraceperiod = level.graceperiod;
    level.prematchperiodend = 0;
    if (isdefined(level.var_d191ab4628e775cd)) {
        level.prematchperiodend = level.var_d191ab4628e775cd;
    }
    namespace_aead94004cf4c147::function_e0948a1e98e82ae1();
    setclientnamemode("auto_change");
    foreach (entry in level.teamnamelist) {
        setobjectivetext(entry, %OBJECTIVES/DM);
        if (level.splitscreen) {
            setobjectivescoretext(entry, %OBJECTIVES/DM);
        } else {
            setobjectivescoretext(entry, %OBJECTIVES/DM_SCORE);
        }
        setobjectivehinttext(entry, %OBJECTIVES/DM_HINT);
    }
    initspawns();
    scripts\mp\gametypes\br_publicevents::init();
    flag_set("public_event_init_attempted");
    if (!lowpopallowtweaks()) {
        scripts\mp\gametypes\br_circle::initcircle();
    }
    br_ammo_init();
    scripts\mp\gametypes\br_c130::init();
    scripts\mp\gametypes\br_pickups::br_pickups_init();
    scripts\mp\gametypes\br_pickups::initpickupusability();
    scripts\mp\gametypes\br_functional_poi::init();
    if (getdvarint(@"hash_e4187d1543c7477e", 0) != 1) {
        scripts\mp\gametypes\br_callouts::init();
    }
    if (!lowpopallowtweaks()) {
        if (getdvarint(@"hash_82bde055b11e6698", 0)) {
            scripts\mp\gametypes\br_quest_util::init_quest_util();
        } else {
            thread namespace_1eb3c4e0e28fac71::function_bf4fd0b5a7c2f528();
        }
    }
    scripts\mp\calloutmarkerping_mp::calloutmarkerping_init();
    scripts\mp\gametypes\br_lootcache::brlootcache_init();
    scripts\mp\gametypes\br_events::breventsinit();
    scripts\mp\gametypes\br_attractions::init();
    scripts\mp\gametypes\br_challenges::init();
    namespace_f51c41a139e03299::init();
    namespace_38b993c4618e76cd::init();
    level thread namespace_25c7d0f5cb1e4346::init();
    level.br_pickups.crates = [];
    level.br_pickups.outercrates = [];
    scripts\mp\gametypes\br_gulag::initgulag();
    registersharedfunc("vehicle_compass", "shouldBeVisibleToPlayer", &vehicle_compass_br_shouldbevisibletoplayer);
    registersharedfunc("br", "superSlotCleanUp", &scripts\mp\gametypes\br_pickups::superslotcleanup);
    registersharedfunc("br", "challengeEvaluator", &scripts\mp\gametypes\br_challenges::challengeevaluator);
    registersharedfunc("airdrop", "registerCrateForCleanup", &airdrop_registercrateforcleanup);
    registersharedfunc("airdrop", "brLoadoutCrateFirstActivation", &airdop_brloadoutcratefirstactivation);
    registersharedfunc("airdrop", "makeWeaponFromCrate", &airdrop_makeweaponfromcrate);
    registersharedfunc("airdrop", "makeItemFromCrate", &airdrop_makeitemfromcrate);
    registersharedfunc("airdrop", "makeItemsFromCrate", &airdrop_makeitemsfromcrate);
    registersharedfunc("airdrop", "br_giveDropBagLoadout", &airdrop_br_givedropbagloadout);
    registersharedfunc("airdrop", "brOnLoadoutCrateDestroyed", &airdrop_bronloadoutcratedestroyed);
    registersharedfunc("gasmask", "breakGasMaskBR", &scripts\mp\gametypes\br_pickups::breakgasmaskbr);
    registersharedfunc("backpack", "isBackpackInventoryEnabled", &namespace_aead94004cf4c147::isbackpackinventoryenabled);
    registersharedfunc("backpack", "removeSmallestItemStackBackpack", &namespace_aead94004cf4c147::removeSmallestItemStackBackpack);
    registersharedfunc("backpack", "addItemToBackpackByRef", &namespace_aead94004cf4c147::addItemToBackpackByRef);
    registersharedfunc("backpack", "getTotalItemCountInBag", &namespace_aead94004cf4c147::getTotalItemCountInBag);
    registersharedfunc("ping", "calloutMarkerPing_markerAdded", &function_1b1c1195e27710b9);
    registersharedfunc("br", "isInstancedSpace", &isInstancedSpace);
    registersharedfunc("br", "packClientMatchData", &function_3ac2a599d142369d);
    registersharedfunc("popsmoke", "deploy", &namespace_5867b152e0697992::function_933806fb8408353d);
    registersharedfunc("outline", "outlineEnableForTeam", &scripts\mp\utility\outline::outlineenableforteam);
    registersharedfunc("audio", "brLeaderDialogTeam", &scripts\mp\gametypes\br_public::brleaderdialogteam);
    registersharedfunc("ammorestock", "ammorestockGametypeInit", &function_d2a98a2a8cc2018b);
    scripts\mp\carriable::initcarriables();
    if (namespace_76a219af07c28c13::function_6934349b7823d888()) {
        namespace_76a219af07c28c13::init();
        if (namespace_51790b5acb47a506::function_4db915a9ce0e903a()) {
            namespace_51790b5acb47a506::init();
        }
    }
    initloot();
    scripts\cp_mp\tripwire::init();
    namespace_4338aec4322f6fdd::init();
    scripts\mp\fire_traps::init();
    level thread onprematchstarted();
    thread turnofftimer();
    level thread watchprematchdone();
    level thread scripts\mp\gametypes\br_vehicles::brvehiclesonstartgametype();
    namespace_acc3d8ec1f00ce29::init();
    level.var_e4669b797013d077 = scripts\cp_mp\vehicles\vehicle_spawn::function_b08e7e3a0b14f76f("veh9_mil_lnd_mrap");
    if (getsubgametype() == "dmz") {
        namespace_acc3d8ec1f00ce29::spawnpalfa();
        scripts\mp\gametypes\br_gametype_dmz::function_b52f35a3ff450ecd();
    }
    thread waitandstartparachuteoverheadmonitoring();
    level thread updateplayerlocationcallouts();
    scripts\mp\utility\lui_game_event_aggregator::registeronluieventcallback(&function_db908ecaccbe933c);
    scripts\mp\utility\disconnect_event_aggregator::registerondisconnecteventcallback(&onplayerdisconnect);
    scripts\mp\utility\disconnect_event_aggregator::function_5b91df923c38392b(&function_c11d61293d7e8ba);
    scripts\mp\utility\lui_game_event_aggregator::registeronluieventcallback(&handleexitsquadeliminatedstate);
    if (scripts\mp\loot::function_310ab06891cb4517()) {
        scripts\mp\utility\lui_game_event_aggregator::registeronluieventcallback(&scripts\mp\loot::function_e146f016a8a7244f);
    }
    level.var_9712837e844488b8 = [];
    callback::add("changedSeats", &function_ae3e9266021180fb);
    if (namespace_8361bad7391de074::function_cff2f4f168b29b81()) {
        namespace_8361bad7391de074::pmc_init();
    } else {
        namespace_8361bad7391de074::cleanup();
    }
    if (brdoesloadoutoptionusedropbags()) {
        thread scripts\mp\gametypes\br_rewards::initdropbagsystem();
        thread cleanupdropbagsoncircle();
    }
    level.killstreakbeginusefunc = &brkillstreakbeginusefunc;
    namespace_e9cc5762e80bb016::init();
    namespace_92443376a63aa4bd::start();
    scripts\mp\gametypes\br_gametypes::runbrgametypefunc("onStartGameType");
}

// Namespace br / scripts\mp\gametypes\br
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9278
// Size: 0x15
function vehicle_compass_br_shouldbevisibletoplayer(vehicle, player) {
    return true;
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9296
// Size: 0xa0
function cleanupmolotovs() {
    println("<dev string:x153>");
    grenades = getentarray("grenade", "classname");
    foreach (grenade in grenades) {
        if (isdefined(grenade) && isdefined(grenade.weapon_name) && grenade.weapon_name == "molotov_mp") {
            thread scripts\mp\equipment\molotov::molotov_cleanup_pool(grenade);
        }
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x933e
// Size: 0x246
function onprematchfadedone() {
    scripts\mp\flags::gameflagwait("prematch_fade_done");
    if (!istrue(level.skipprematch)) {
        level thread resetalldoors(2.1);
        level thread scripts\cp_mp\calloutmarkerping::calloutmarkerping_removeallcalloutsforallplayers(1);
        if (getsubgametype() != "dmz") {
            level thread scripts\mp\gametypes\br_vehicles::brvehicleonprematchstarted();
        }
        level thread scripts\mp\carriable::clean_and_spawn_carriables();
        resetglass();
    }
    level thread scripts\mp\gametypes\br_functional_poi::onprematchdone();
    if (!istrue(level.skipprematch)) {
        cleanupmolotovs();
        scripts\mp\gametypes\br_vehicles::emptyallvehicles();
        if (!istrue(level.br_infils_disabled)) {
            foreach (player in level.players) {
                if (!istrue(level.var_e4a482edc1542597)) {
                    player setplayerprematchallows();
                    player thread scripts\mp\gametypes\br_pickups::resetplayerinventory(undefined, 1);
                }
                if (istrue(player.hasspawned)) {
                    if (player function_9cc921a57ff4deb5()) {
                        player function_fd357ca89e5e29d9();
                    }
                    player thread scripts\mp\weapons::deleteplacedequipment(1);
                }
                if (istrue(level.squadleaderboon)) {
                    player setclientomnvar("ui_squad_leader_pack_dropped", 0);
                }
            }
        }
        foreach (player in level.players) {
            if (isdefined(player.burninginfo)) {
                player scripts\mp\equipment\molotov::molotov_clear_burning();
            }
            player scripts\mp\javelin::javelin_forceclear();
        }
        level notify("prematch_cleanup");
    }
    level.disabledamagestattracking = 0;
    foreach (i, lootinstance in level.br_prematchloot) {
        lootinstance setscriptablepartstate(level.br_prematchlootparts[i], "visible");
    }
    level.br_prematchloot = undefined;
    level.br_prematchlootparts = undefined;
    if (!istrue(level.br_circle_disabled)) {
        level thread scripts\mp\gametypes\br_circle::runcircles(1);
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x958c
// Size: 0x1ce
function onprematchstarted() {
    level thread onprematchfadedone();
    namespace_973962356ce55fee::function_5df8c6abd0b861cd();
    if (!istrue(level.skipprematch) && !scripts\cp_mp\utility\game_utility::function_b2c4b42f9236924() && !getdvarint(@"hash_1bf2afd8a32b6892", 0)) {
        foreach (team in level.teamnamelist) {
            setteamradar(team, 1);
            setteamradarstrength(team, 1);
        }
    }
    level waittill("prematch_started");
    if (lowpopallowtweaks()) {
        scripts\mp\gametypes\br_circle::initcircle();
        if (getdvarint(@"hash_82bde055b11e6698", 0)) {
            scripts\mp\gametypes\br_quest_util::init_quest_util();
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
        namespace_973962356ce55fee::postprematch();
    } else {
        gameflagwait("br_ready_to_jump");
    }
    if (istrue(level.var_bf269015710de2dd)) {
        level thread namespace_88bfae359020fdd3::function_da05e0125fa8bbf4();
    }
    level thread function_67179ffa48ecb2c9();
    level thread handlematchscoreboardinfo();
    if (!scripts\mp\gametypes\br_gametypes::isfeaturedisabled("teamSpectate")) {
        level thread scripts\mp\gametypes\br_spectate::spectate_init();
    }
    level.br_prematchstarted = 1;
    level notify("infils_ready");
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9762
// Size: 0x6b
function handlematchscoreboardinfo() {
    if (isprophuntgametype()) {
        return;
    }
    scripts\mp\scoreboard::processmatchscoreboardinfo();
    if (getdvarint(@"hash_1bc373211683e0b6") != 0) {
        if (matchmakinggame() && !privatematch()) {
            setclientmatchdata("isPublicMatch", 1);
        } else {
            setclientmatchdata("isPublicMatch", 0);
        }
    }
    level waittill_notify_or_timeout("br_c130_left_bounds", 120);
    scripts\mp\scoreboard::processmatchscoreboardinfo();
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x97d5
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
            scripts\mp\gametypes\br_rewards::delaydropbags(var_70bcbf0ad5028219);
            if (scripts\mp\gametypes\br_gametypes::isfeatureenabled("dropBagLoop")) {
                while (true) {
                    scripts\mp\gametypes\br_rewards::delaydropbags(var_70bcbf0ad5028219);
                }
            }
        } else if (function_d27f645c3282a371() && !istrue(level.br_circle_disabled)) {
            var_70bcbf0ad5028219 = function_8209cc6a885e9a2e();
            level thread namespace_f51c41a139e03299::function_607167c18661377b(var_70bcbf0ad5028219);
        }
    }
    level.dropbagstruct = undefined;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x98a1
// Size: 0x22
function resetalldoors(delaytime) {
    level endon("game_ended");
    if (isdefined(delaytime)) {
        wait delaytime;
    }
    brclosealldoors(50);
}

// Namespace br / scripts\mp\gametypes\br
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x98cb
// Size: 0x30
function handleexitsquadeliminatedstate(notification, slotindex) {
    if (isdefined(notification) && notification == "exit_squad_eliminated") {
        self setclientomnvar("ui_br_squad_eliminated_active", 0);
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9903
// Size: 0xd6
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
    scripts\mp\flags::gameflagwait("prematch_done");
    level notify("cancel_watch_parachuters_overhead");
    waitframe();
    level thread watchparachutersoverhead(level.parachuteoverheadwarningtimeoutms);
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x99e1
// Size: 0x265
function watchparachutersoverhead(intervalms) {
    level endon("game_ended");
    level endon("cancel_watch_parachuters_overhead");
    while (true) {
        foreach (xuid, player in level.activeparachuters) {
            if (!isdefined(player) || !scripts\mp\utility\player::isreallyalive(player) || !(player isparachuting() || player isinfreefall())) {
                level.activeparachuters[xuid] = undefined;
                continue;
            }
            nearbyplayers = utility::playersincylinder(player.origin, level.parachuteoverheadwarningradius, undefined, level.parachuteoverheadwarningheight);
            teamcompare = player.team;
            foreach (targetplayer in nearbyplayers) {
                if (isdefined(targetplayer.c130)) {
                    continue;
                }
                sameteam = teamcompare == targetplayer.team;
                if (sameteam) {
                    continue;
                }
                var_cda71aec07aab082 = !scripts\mp\utility\player::isreallyalive(targetplayer) || istrue(targetplayer.inlaststand);
                if (var_cda71aec07aab082) {
                    continue;
                }
                var_744496cccbbfcb78 = targetplayer isparachuting() || targetplayer isinfreefall();
                if (var_744496cccbbfcb78) {
                    continue;
                }
                time = gettime();
                var_8edff54c680323 = isdefined(targetplayer.heardparachuteoverheadtime) && time - targetplayer.heardparachuteoverheadtime < intervalms;
                if (var_8edff54c680323) {
                    continue;
                }
                targetplayer.heardparachuteoverheadtime = time;
                if (scripts\cp_mp\utility\game_utility::function_fa7bfcc1d68b7b73()) {
                    operatorteam = scripts\mp\gametypes\br_public::brgetoperatorteam(targetplayer);
                    if (!isdefined(operatorteam)) {
                        operatorteam = "allies";
                    }
                    var_7570afa45d86040f = game["voice"][operatorteam];
                    targetplayer queuedialogforplayer(level.activeparachutersfactionvo[var_7570afa45d86040f], "respawning_enemy_in_area", 2);
                    continue;
                }
                scripts\mp\gametypes\br_public::brleaderdialog("respawning_enemy_in_area", 1, [targetplayer]);
            }
            waitframe();
        }
        waitframe();
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9c4e
// Size: 0x1c0
function updateplayerlocationcallouts() {
    level endon("game_ended");
    level.calloutglobals.calloutzones = getentarray("location_volume", "targetname");
    if (!level.calloutglobals.calloutzones.size) {
        return;
    }
    while (true) {
        var_2f04eb838ce020dc = 0;
        foreach (player in level.players) {
            if (!isplayer(player) || !isalive(player)) {
                continue;
            }
            if (isdefined(player.br_currentcalloutzone) && player istouching(player.br_currentcalloutzone)) {
                continue;
            }
            isinzone = 0;
            foreach (calloutzone in level.calloutglobals.calloutzones) {
                if (player istouching(calloutzone)) {
                    isinzone = 1;
                    player.br_currentcalloutzone = calloutzone;
                    player scripts\mp\callouts::setplayercalloutarea(calloutzone.script_noteworthy);
                    player thread scripts\mp\gametypes\br_gametypes::runbrgametypefunc("onEnterCalloutArea", calloutzone.script_noteworthy);
                    break;
                }
            }
            if (!isinzone) {
                player.br_currentcalloutzone = undefined;
                player scripts\mp\callouts::setplayercalloutarea("none");
            }
            var_2f04eb838ce020dc = (var_2f04eb838ce020dc + 1) % 2;
            if (var_2f04eb838ce020dc == 0) {
                waitframe();
            }
        }
        waitframe();
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9e16
// Size: 0x207
function function_cda409f3a76dac5() {
    versionnum = getdvarint(@"hash_2dbefc43a77efb18", 4);
    level.useLootableCorpse = getmatchrulesdata("brData", "useLootableCorpse");
    switch (versionnum) {
    case 0: 
        level.var_51225d738094457d = 0;
        level.var_aa5679ebf3504e13 = 1;
        level.var_a3499c286ac570e4 = 1;
        level.explodingbackpack = 0;
        break;
    case 1: 
        level.var_51225d738094457d = 1;
        level.var_aa5679ebf3504e13 = 1;
        level.var_a3499c286ac570e4 = 1;
        level.explodingbackpack = 0;
        level.var_a1aab37ec3423e39 = getdvarint(@"hash_3f8e6e632099c5f", 1);
        break;
    case 2: 
        level.var_51225d738094457d = 0;
        level.var_aa5679ebf3504e13 = 1;
        level.var_a3499c286ac570e4 = 1;
        level.explodingbackpack = 1;
        break;
    case 3: 
        level.var_51225d738094457d = 0;
        level.var_aa5679ebf3504e13 = 0;
        level.var_a3499c286ac570e4 = 0;
        level.explodingbackpack = 0;
        break;
    case 4: 
        level.var_51225d738094457d = 1;
        level.var_aa5679ebf3504e13 = 0;
        level.var_a3499c286ac570e4 = 0;
        level.explodingbackpack = 0;
        level.var_813b4b2211fbaf1d = 1;
        break;
    case 5: 
        level.var_51225d738094457d = 0;
        level.var_aa5679ebf3504e13 = 1;
        level.var_a3499c286ac570e4 = 1;
        level.explodingbackpack = 0;
        level.var_73dc8cb1481e4a36 = 1;
        level.var_4ca052423b9bb316 = 1;
        break;
    default: 
        level.var_51225d738094457d = 0;
        level.var_aa5679ebf3504e13 = 1;
        level.var_a3499c286ac570e4 = 1;
        level.explodingbackpack = 0;
        break;
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa025
// Size: 0x3
function getusingproxdoors() {
    return false;
}

// Namespace br / scripts\mp\gametypes\br
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa031
// Size: 0x1bc
function function_a9f21df27cd2286f(gasmaskdamage, position) {
    foreach (player in self.playersintrigger) {
        if (isdefined(player.gasmaskhealth) && player.gasmaskhealth > 0) {
            player scripts\cp_mp\gasmask::processdamage(gasmaskdamage);
            player namespace_aead94004cf4c147::function_5323bef1ad6244b9(gasmaskdamage);
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
        newhealth = int(gasmask.count - gasmaskdamage);
        if (newhealth <= 0) {
            gasmask setscriptablepartstate(gasmask.type, "death");
            gasmask scripts\mp\gametypes\br_pickups::deletescriptableinstanceaftertime(1, 1);
            level thread deregistergasmaskscriptableatframeend(index);
            continue;
        }
        loot_setitemcount(gasmask, newhealth);
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa1f5
// Size: 0x40
function function_4b2456ab9e1c7b81(position) {
    self endon("death");
    wait 0.1;
    function_a9f21df27cd2286f(20, position);
    while (true) {
        wait 1;
        function_a9f21df27cd2286f(5, position);
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa23d
// Size: 0x2b9
function watchprematchdone() {
    scripts\mp\flags::gameflagwait("prematch_fade_done");
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
    if (!scripts\mp\gametypes\br_gametypes::isfeatureenabled("allowLateJoiners")) {
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
    scripts\mp\gametypes\br_analytics::branalytics_playercount(totalplayers.size);
    level setplacementxpshare();
    if (getdvarint(@"hash_1295aa08e53fc39d", 0) == 0) {
        removeallcorpses();
    }
    if (getdvarint(@"hash_3d82b17bac600216", 1) == 1) {
        function_cea1d94b4418bcc();
    }
    scripts\mp\gametypes\br_gametypes::runbrgametypefunc("onPrematchDone");
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa4fe
// Size: 0x12
function turnofftimer() {
    wait 1;
    setomnvar("ui_match_timer_hidden", 1);
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa518
// Size: 0x72
function initspawns() {
    scripts\mp\spawnlogic::setactivespawnlogic("FreeForAll", "Crit_Default");
    level.spawnmins = (2.14748e+09, 2.14748e+09, 2.14748e+09);
    level.spawnmaxs = (-2147483647, -2147483647, -2147483647);
    level.mapcenter = scripts\mp\spawnlogic::findboxcenter(level.spawnmins, level.spawnmaxs);
    setmapcenter(level.mapcenter);
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa592
// Size: 0x1a3
function initprematchspawnlocations() {
    if (!scripts\mp\gametypes\br_public::isBrPracticeMode()) {
        level.startingspawns = scripts\mp\spawnlogic::getspawnpointarray("mp_dm_spawn_start");
        if (level.startingspawns.size == 0) {
            level.startingspawns = scripts\mp\spawnlogic::getspawnpointarray("mp_tdm_spawn_allies_start");
        }
        level.prematchspawnorigins = getprematchlocationspawnorigins();
        if (level.var_6bed852a909e4f70 == 1) {
            arenas = getstructarray("gulag_dom", "targetname");
            if (isdefined(arenas) && arenas.size > 0) {
                foreach (arena in arenas) {
                    arenastructs = getstructarray(arena.target, "targetname");
                    foreach (arenastruct in arenastructs) {
                        if (arenastruct.script_noteworthy == "gulag_dom_prematch_spawn") {
                            level.prematchspawnorigins[0].origin = arenastruct.origin;
                        }
                    }
                }
            }
            return;
        }
        if (level.var_6bed852a909e4f70 == 2) {
            if (namespace_5a1ea9d54418bd42::function_9005af34e01bf8fe()) {
                level.prematchspawnorigins[0].origin = (-1880, -640, 430);
            }
        }
    }
}

/#

    // Namespace br / scripts\mp\gametypes\br
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0xa73d
    // Size: 0xd8
    function function_6e4f8e741562e931() {
        while (true) {
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
    }

#/

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa81d
// Size: 0x59
function usedropspawn() {
    var_18b417329dc24bf0 = getdvarint(@"hash_3f36284b49b3d7a", 0) != 0;
    return (!istrue(level.br_prematchstarted) || istrue(level.br_allowdropspawnafterprematch)) && !istrue(level.skipprematchdropspawn) && !var_18b417329dc24bf0 && !istrue(level.infilcinematicactive);
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa87f
// Size: 0x2c5
function getspawnpoint(prespawn) {
    if (getsubgametype() == "dmz" || getsubgametype() == "exgm") {
        return scripts\mp\gametypes\br_gametype_dmz::getspawnpoint();
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
    if (istrue(prespawn) || usedropspawn()) {
        dropspawnangles = (0, randomintrange(0, 360), 0);
        dropstruct = getprematchspawnorigin();
        var_c0014162498c3d04 = getprematchradius(dropstruct);
        radius = var_c0014162498c3d04[1];
        minradius = var_c0014162498c3d04[0];
        var_553aa30efc389cb5 = randomfloatrange(minradius, radius);
        if (isdefined(level.var_4c124f424cdfa325) && level.var_4c124f424cdfa325 > -1) {
            var_553aa30efc389cb5 = level.var_4c124f424cdfa325;
        }
        if (getdvarint(@"hash_8b70bee2041ed89d", 0) == 1) {
            farspawnangles = vectortoangles(dropstruct.origin);
            dropspawnangles = (0, farspawnangles[1], 0) * -1;
            var_553aa30efc389cb5 = radius;
        }
        dropvector = anglestoforward(dropspawnangles) * -1;
        offsetvector = dropvector * var_553aa30efc389cb5;
        dropspawnorigin = dropstruct.origin + offsetvector;
        if (isdefined(self.setspawnpoint)) {
            spawnoffset = namespace_81156089ff1fe819::getinfilspawnoffset();
            dropspawnorigin = self.setspawnpoint.playerspawnpos + (0, 0, spawnoffset);
            dropspawnangles = self.setspawnpoint.playerspawnangles;
            scripts\mp\equipment\tac_insert::spawnpoint_clearspawnpoint(0, 1);
        }
        spawnpoint = spawnstruct();
        spawnpoint.origin = dropspawnorigin;
        spawnpoint.angles = dropspawnangles;
        spawnpoint.index = -1;
        return spawnpoint;
    }
    spawnpoints = level.startingspawns;
    spawnpoint = scripts\mp\spawnlogic::getspawnpoint_random(spawnpoints);
    if (!isdefined(spawnpoint)) {
        spawnpoint = spawnstruct();
        spawnpoint.origin = (0, 0, 0);
        spawnpoint.angles = (0, 0, 0);
        spawnpoint.index = -1;
    }
    return spawnpoint;
}

// Namespace br / scripts\mp\gametypes\br
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xab4d
// Size: 0x54
function createspawnlocation(origin, minradius, maxradius) {
    loc = spawnstruct();
    loc.origin = origin;
    loc.minradius = minradius;
    loc.radius = maxradius;
    return loc;
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xabaa
// Size: 0x321
function getprematchlocationspawnorigins() {
    var_115964aea2202001 = 0;
    spawnlocations = getstructarray("br_prematch_insertion_point", "targetname");
    var_402e8b8d0e252db6 = getdvarint(@"hash_500929cf224e1d03", 0);
    if (var_402e8b8d0e252db6) {
        prematchspawnpos = getdvarvector(@"hash_15fab3c9c51ca75e", (0, 0, 0));
        var_13af2a3f5d343ce4 = getdvarint(@"hash_d7079d5a45600c6a", 0);
        assert(prematchspawnpos != (0, 0, 0) && var_13af2a3f5d343ce4 != 0);
        spawnlocations = [scripts\mp\gametypes\br::createspawnlocation(prematchspawnpos, 0, var_13af2a3f5d343ce4)];
    } else if (isdefined(level.br_prematchspawnlocations)) {
        var_115964aea2202001 = 1;
        spawnlocations = level.br_prematchspawnlocations;
    } else if (!spawnlocations.size) {
        var_115964aea2202001 = 1;
        spawnlocations = getentarray("vehicle_volume", "script_noteworthy");
    }
    /#
        if (!spawnlocations.size && getdvar(@"hash_344ec7639d9d44", "<dev string:x4c>") != "<dev string:x4c>") {
            spawnlocations = level.startingspawns;
            if (level.var_6bed852a909e4f70 == 1) {
                spawnlocations[0].origin = level.prematchspawnorigins[0].origin;
            }
            return spawnlocations;
        }
    #/
    assertex(spawnlocations.size, "<dev string:x166>");
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
            continue;
        }
        minz = getoffsetspawnorigin(location.origin)[2];
        if (location.origin[2] < minz) {
            location.origin = (location.origin[0], location.origin[1], minz);
        }
    }
    return spawnlocations;
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xaed4
// Size: 0x4
function function_cb40f77c51717ea1() {
    return 5;
}

// Namespace br / scripts\mp\gametypes\br
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xaee1
// Size: 0xb4
function getoffsetspawnorigin(origin, dropspawnoffset) {
    tracecontents = scripts\engine\trace::create_default_contents(1);
    traceoffset = (0, 0, 5000);
    tracestart = origin + traceoffset;
    traceend = origin - traceoffset;
    trace = scripts\engine\trace::ray_trace(tracestart, traceend, undefined, tracecontents);
    locationbase = origin;
    if (trace["hittype"] != "hittype_none") {
        locationbase = trace["position"];
    }
    if (!isdefined(dropspawnoffset)) {
        zoffset = namespace_81156089ff1fe819::getinfilspawnoffset();
        dropspawnoffset = (0, 0, zoffset);
    }
    return locationbase + dropspawnoffset;
}

// Namespace br / scripts\mp\gametypes\br
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xaf9e
// Size: 0x74
function getoffsetspawnoriginmultitrace(origin, dropspawnoffset) {
    tracecontents = scripts\engine\trace::create_default_contents(1);
    updist = 5000;
    downdist = 5000;
    groundorigin = scripts\mp\gametypes\br_public::droptogroundmultitrace(origin, updist, downdist, tracecontents);
    if (!isdefined(dropspawnoffset)) {
        zoffset = namespace_81156089ff1fe819::getinfilspawnoffset();
        dropspawnoffset = (0, 0, zoffset);
    }
    return groundorigin + dropspawnoffset;
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb01b
// Size: 0x20
function getexpectednumberofteams() {
    numteams = int(150 / level.maxteamsize);
    return numteams;
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb044
// Size: 0x1f0
function getprematchspawnorigin() {
    assert(isdefined(self.sessionteam));
    assert(array_contains(level.teamnamelist, self.sessionteam));
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
        var_8158644ca35340a1 = scripts\cp_mp\utility\game_utility::function_fa7bfcc1d68b7b73();
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
    spawnoverrideindex = getdvarint(@"hash_da9368d09cdd8075", -1);
    if (spawnoverrideindex >= 0 && spawnoverrideindex < level.prematchspawnorigins.size) {
        spawnorigin = level.prematchspawnorigins[spawnoverrideindex];
    }
    assert(isdefined(spawnorigin));
    return spawnorigin;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb23d
// Size: 0x3a8
function onplayerconnect(player) {
    level endon("game_ended");
    player endon("disconnect");
    if (!istrue(level.var_5dee688f6db9ad0b) && !level.var_ec2fb549b15ad827) {
        player scripts\mp\validation::function_f6d25a34b1d286b1();
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
    player.var_893c74118f0f4c3e = 0;
    player.var_f7ff6a8d6c6a2804 = 0;
    player thread scripts\cp_mp\gasmask::function_156ee9d604eac35c();
    namespace_aead94004cf4c147::function_b4f4561fdb86fa25(player);
    player thread namespace_aead94004cf4c147::function_631fd0855c653a68(player, 1);
    player thread br_ammo_player_init();
    player thread function_210b4d286feae145();
    if (scripts\mp\gametypes\br_gametypes::isbrgametypefuncdefined("playerWelcomeSplashes")) {
        player thread scripts\mp\gametypes\br_gametypes::runbrgametypefunc("playerWelcomeSplashes");
    } else {
        player thread playerwelcomesplashes();
    }
    player thread function_caf743a2d0bd4946();
    player resetchallengetimers();
    if (namespace_aead94004cf4c147::function_720d227d0e55a960()) {
        namespace_85cd45b4fe0d86fb::function_941fe2b16d6fff9d(player);
    }
    scripts\mp\gametypes\br_gametypes::runbrgametypefunc("onPlayerConnect", player);
    if (isdefined(player) && player iscodcaster()) {
        if (!isdefined(level.var_c5877dbe60fddbf6)) {
            level.var_c5877dbe60fddbf6 = [];
        }
        level.var_c5877dbe60fddbf6[level.var_c5877dbe60fddbf6.size] = player;
        player.lastclientnum = player getentitynumber();
        player thread scripts\mp\gametypes\br_gulag::function_7959e2df2cc7c5b4();
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
        player scripts\stealth\player::main();
    }
    if (isdefined(level.var_e3ac672a3513883f)) {
        player [[ level.var_e3ac672a3513883f ]]();
    }
    player scripts\mp\gametypes\br_analytics::function_8ed813c1b731ca42();
    if (!istrue(level.prematchstarted)) {
        player.radarmode = "slow_radar";
        level waittill("prematch_started");
        wait 1.4;
    }
    if (!isdefined(player.streakdata)) {
        waittillframeend();
    }
    if (isdefined(player)) {
        if (!function_d6ae35e0ce14bbaf() && !istutorial() && !isBrPracticeMode() && !isprophuntgametype()) {
            if (!istrue(level.skipprematch)) {
                if (!istrue(level.var_5dee688f6db9ad0b)) {
                    player br_ammo_player_clear();
                    player scripts\mp\gametypes\br_pickups::resetplayerinventory(0, 1);
                }
            }
            player scripts\cp_mp\utility\game_utility::startkeyearning();
        }
        if (function_e88ea7c360ea7fdf() && !istutorial() && !function_d6ae35e0ce14bbaf() && !isprophuntgametype()) {
            player thread monitorweaponswitchbr();
        }
        player.radarmode = "normal_radar";
        if (getdvarint(@"hash_82bde055b11e6698", 0)) {
            scripts\mp\gametypes\br_quest_util::onplayerconnect(player);
        } else {
            thread namespace_1eb3c4e0e28fac71::onplayerconnect(player);
        }
        if (!istrue(level.var_c3d1e9e6a5024479)) {
            initializeaardata(player);
        }
        player scripts\mp\gametypes\br_gulag::function_dd93503cf95b6277();
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb5ed
// Size: 0x47
function function_e88ea7c360ea7fdf() {
    if (istrue(level.var_f60a3be40c34023d)) {
        return false;
    }
    switch (getsubgametype()) {
    case #"hash_59b8e9d05b31ff9":
    case #"hash_343d3f3f77c83350":
    case #"hash_dddecc2751311914": 
        return false;
    }
    return true;
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb63d
// Size: 0x4c
function playerwelcomesplashes() {
    self endon("disconnect");
    self waittill("spawned_player");
    wait 1;
    if (istrue(game["liveLobbyCompleted"])) {
    }
    if (!istrue(self.infil_landing_done)) {
        self waittill("infil_landing_done");
    }
    wait 1;
    scripts\mp\gametypes\br_public::brleaderdialogplayer("primary_objective", self, 0);
    function_ad8c1e6228a10058();
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb691
// Size: 0x81
function function_caf743a2d0bd4946() {
    self endon("disconnect");
    level endon("game_ended");
    if (!istrue(level.br_infils_disabled)) {
        self waittill("br_jump");
        while (!self isonground() && !self isswimming() && !self ishanging() && !self isonladder() && !self function_793f941d7dff15ed()) {
            waitframe();
        }
    } else {
        level waittill("prematch_done");
    }
    self.infil_landing_done = 1;
    self notify("infil_landing_done");
    scripts\mp\gametypes\br_analytics::branalytics_landing(self);
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb71a
// Size: 0x1e4
function onspawnplayer(revivespawn) {
    self notify("br_spawned");
    keeploadout = istrue(self.gulag) || istrue(level.var_faec6e12b831873d) && !istrue(self.var_908f8ac4bbcdb65e);
    scripts\mp\gametypes\br_pickups::initplayer(keeploadout);
    scripts\mp\gametypes\br_functional_poi::initplayer(revivespawn);
    if (!scripts\mp\gametypes\br_gametypes::isfeaturedisabled("teamSpectate")) {
        scripts\mp\gametypes\br_spectate::initplayer();
    }
    self.oldprimarygun = undefined;
    self.newprimarygun = undefined;
    self.healthregendisabled = 0;
    self.needtoplayintro = undefined;
    self.gunnlessweapon = undefined;
    self.brdownedbyairstriketime = undefined;
    if (!scripts\mp\gametypes\br_gametypes::isfeaturedisabled("waitLoadoutDone")) {
        thread waitloadoutdone(revivespawn);
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
    scripts\mp\gametypes\br_public::setplayerdownedextrainfo(0);
    scripts\mp\gametypes\br_public::setplayerbeingrevivedextrainfo(0);
    scripts\mp\gametypes\br_public::function_c2afa687bc871d71(0);
    updatesquadmemberlaststandreviveprogress(self, self, 0, 1);
    self setclientomnvar("ui_securing", 0);
    if (scripts\mp\gametypes\br_gametypes::isbrgametypefuncdefined("onSpawnPlayer")) {
        scripts\mp\gametypes\br_gametypes::runbrgametypefunc("onSpawnPlayer");
    }
    thread function_467380e90c7db5a7();
    if (getdvarint(@"hash_12ca000dd2976ebc", 0) && getdvarint(@"hash_dc29833577096d47", 0)) {
        thread tnbrMonitorLauncherAmmoRestock();
    }
    boostval = self getclientomnvar("ui_speedboost_overlay");
    if (boostval == 0) {
        self setclientomnvar("ui_speedboost_overlay", 2);
    }
    thread scripts\mp\events::function_6cdce3cb6d284ccc();
    level thread updateplayerandteamcountui();
}

// Namespace br / scripts\mp\gametypes\br
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb906
// Size: 0x50
function waittill_return(confirmstring, ent) {
    if (confirmstring != "death") {
        self endon("death");
    }
    ent endon("die");
    location, angle = self waittill(confirmstring);
    ent notify("returned", location, angle, confirmstring);
}

// Namespace br / scripts\mp\gametypes\br
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xb95e
// Size: 0xf0
function waittill_confirm_or_cancel(confirmstring, cancelstring, endstring) {
    if ((!isdefined(confirmstring) || confirmstring != "death") && (!isdefined(cancelstring) || cancelstring != "death")) {
        self endon("death");
    }
    ent = spawnstruct();
    if (isdefined(confirmstring)) {
        childthread waittill_return(confirmstring, ent);
    }
    if (isdefined(cancelstring)) {
        childthread waittill_return(cancelstring, ent);
    }
    if (isdefined(endstring)) {
        childthread waittill_return(endstring, ent);
    }
    location, angle, string = ent waittill("returned");
    ent notify("die");
    returninfo = spawnstruct();
    returninfo.location = location;
    returninfo.angles = angle;
    returninfo.string = string;
    return returninfo;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xba57
// Size: 0x9f
function traceselectedmaplocation(location) {
    startlocationtrace = location + (0, 0, 10000);
    var_3cb14aea5687b8f6 = location - (0, 0, 10000);
    drivablevehicles = scripts\cp_mp\vehicles\vehicle_tracking::vehicle_tracking_getgameinstancesforall();
    killstreakmodels = level.activekillstreaks;
    var_b9d5783a4f34efbc = array_combine(drivablevehicles, killstreakmodels);
    contentoverride = scripts\engine\trace::create_contents(0, 1, 0, 1, 1, 0, 0, 0, 0);
    return scripts\engine\trace::ray_trace(startlocationtrace, var_3cb14aea5687b8f6, var_b9d5783a4f34efbc, contentoverride, 0, 1);
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbaff
// Size: 0x3f
function giveprematchloadout() {
    self endon("death_or_disconnect");
    if (!istrue(level.br_prematchffa)) {
        return;
    }
    if (isdefined(level.var_b89a535236a6f3d8) && !istrue(level.var_8281a47e2cecb257)) {
        self [[ level.var_b89a535236a6f3d8 ]]();
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbb46
// Size: 0xb0
function function_b89a535236a6f3d8() {
    var_7cde6fd13210763d = getdvarint(@"hash_9a965c244b485a82", 0) == 1;
    if (!var_7cde6fd13210763d) {
        scripts\mp\class::loadout_clearperks(undefined, 1);
        if (namespace_708f627020de59d3::function_c0d385a09d173a36()) {
            namespace_708f627020de59d3::function_19868614946c4df4();
        }
        if (istrue(level.var_1bc9ccb3f47cf947) && !_hasperk("specialty_br_movement_mod")) {
            giveperk("specialty_br_movement_mod");
        }
    }
    if (!level.allowsupers && !istrue(level.giveloadouteverytime) && !level.var_47207b7b330cf8e0) {
        waitframe();
        scripts\mp\gametypes\br_pickups::resetsuper();
        if (!istrue(level.var_4b56eabbc77bfd21)) {
            scripts\mp\gametypes\br_pickups::forcegivesuper("super_ammo_drop", 0);
        }
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xbbfe
// Size: 0x219
function givematchloadout(ammomult, ammomax) {
    if (!isdefined(ammomult)) {
        ammomult = 0.5;
    }
    if (!isdefined(ammomax)) {
        ammomax = 20;
    }
    player = self;
    var_ddfacdf2215c052e = player scripts\mp\class::loadout_getorbuildclassstruct(player.class);
    if (!isdefined(var_ddfacdf2215c052e)) {
        return;
    }
    player.prevweaponobj = undefined;
    player loadout_clearperks();
    player loadout_updateplayerperks(var_ddfacdf2215c052e);
    givelaststandifneeded(player);
    gunsgiven = 0;
    if (isdefined(var_ddfacdf2215c052e.loadoutsecondaryobject) && !isnullweapon(var_ddfacdf2215c052e.loadoutsecondaryobject)) {
        scripts\mp\gametypes\br_weapons::br_forcegivecustomweapon(player, var_ddfacdf2215c052e.loadoutsecondaryobject, var_ddfacdf2215c052e.loadoutsecondaryfullname, var_ddfacdf2215c052e.loadoutsecondary, ammomult, ammomax);
        gunsgiven++;
    }
    if (isdefined(var_ddfacdf2215c052e.loadoutprimaryobject) && !isnullweapon(var_ddfacdf2215c052e.loadoutprimaryobject)) {
        scripts\mp\gametypes\br_weapons::br_forcegivecustomweapon(player, var_ddfacdf2215c052e.loadoutprimaryobject, var_ddfacdf2215c052e.loadoutprimaryfullname, var_ddfacdf2215c052e.loadoutprimary, ammomult, ammomax);
        gunsgiven++;
    }
    if (gunsgiven > 1) {
        player takeweapon("iw9_me_fists_mp");
    }
    equipment = [];
    if (isdefined(var_ddfacdf2215c052e.loadoutequipmentprimary)) {
        equipment[equipment.size] = var_ddfacdf2215c052e.loadoutequipmentprimary;
    }
    if (isdefined(var_ddfacdf2215c052e.loadoutequipmentsecondary)) {
        equipment[equipment.size] = var_ddfacdf2215c052e.loadoutequipmentsecondary;
    }
    foreach (equipref in equipment) {
        if (isdefined(level.br_pickups.br_equipnametoscriptable[equipref])) {
            scriptablename = level.br_pickups.br_equipnametoscriptable[equipref];
            br_forcegivecustompickupitem(player, scriptablename, 1);
        }
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbe1f
// Size: 0x2a
function givematchloadoutfordropbags() {
    player = self;
    player.prevweaponobj = undefined;
    player loadout_clearperks();
    givelaststandifneeded(player);
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbe51
// Size: 0x2f
function prematchdeployparachute() {
    self endon("disconnect");
    while (self.sessionstate != "playing") {
        waitframe();
    }
    thread scripts\cp_mp\parachute::startfreefall(2, 0, undefined, undefined, 1, 0);
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbe88
// Size: 0x8c
function getprematchradius(dropstruct) {
    radius = dropstruct.radius;
    minradius = dropstruct.minradius;
    radiusoverride = getdvarint(@"hash_3e97a62800ff7a1a", -1);
    if (radiusoverride >= 0) {
        radius = radiusoverride;
    }
    radiusoverride = getdvarint(@"hash_cad542096552c754", -1);
    if (radiusoverride >= 0) {
        minradius = radiusoverride;
    }
    if (minradius >= radius) {
        radius = minradius + 1;
    }
    return [minradius, radius];
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbf1d
// Size: 0x99
function givelaststandifneeded(player) {
    if (istrue(level.forcedisablelaststand)) {
        return;
    }
    if (!level.teambased) {
        return;
    }
    issolos = level.maxteamsize == 1;
    hasselfrevivetoken = player scripts\mp\gametypes\br_public::hasselfrevivetoken();
    if (issolos && !hasselfrevivetoken && !istrue(level.var_f4e4fae260bddff3)) {
        return;
    }
    if (!iscontender(player)) {
        return;
    }
    if (player _hasperk("specialty_pistoldeath")) {
        return;
    }
    if (!scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        return;
    }
    player giveperk("specialty_pistoldeath");
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbfbe
// Size: 0x32e
function waitloadoutdone(revivespawn) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("death");
    self notify("waitLoadoutDone");
    self endon("waitLoadoutDone");
    self waittill("giveLoadout");
    if (!isagent(self)) {
        val::reset_all("spawnVehicleDelay");
    }
    if (istrue(level.var_d034183abf2e274d)) {
        self.attached_bag = undefined;
        backpacksize = self getplayerdata(level.var_5d69837cf4db0407, level.backpacksize);
        var_8f24a28261fb9da3 = namespace_aead94004cf4c147::function_565cbea3437267d9(self);
        scripts\mp\gametypes\br_gametype_dmz::attachbag(var_8f24a28261fb9da3);
    }
    if (istutorial() || function_d6ae35e0ce14bbaf() || istrue(revivespawn)) {
        return;
    }
    if (isBrPracticeMode()) {
        if (!scripts\mp\gametypes\br_gametypes::isfeaturedisabled("armor")) {
            thread function_50434e55c7907057();
        }
        return;
    }
    fromprematch = 0;
    if (!istrue(level.br_prematchstarted)) {
        fromprematch = 1;
        thread giveprematchloadout();
        if (!scripts\mp\gametypes\br_gametypes::isfeaturedisabled("armor")) {
            thread function_50434e55c7907057();
        }
        giveperk("specialty_pistoldraw");
        if (!istrue(self.prematchplayedwelcomevo)) {
            self.prematchplayedwelcomevo = 1;
            if (getsubgametype() != "dmz" && getsubgametype() != "exgm") {
                delaythread(1, &scripts\mp\gametypes\br_public::brleaderdialogplayer, "prematch_enter", self);
                if (!scripts\mp\flags::gameflag("prematch_done")) {
                    br_lobby_intro = function_17ee301cf0b5ba85("br_lobby_intro");
                    self setplayermusicstate(br_lobby_intro);
                }
            }
        }
        level waittill("infils_ready");
        if (level.allowsupers) {
            scripts\mp\supers::clearsuper(0);
        }
    }
    if (istrue(level.var_376762409014cc8e)) {
        br_ammo_player_clear();
    }
    keeploadout = istrue(self.gulag) || scripts\mp\gametypes\br_public::istutorial() || istrue(self.respawningbr) || istrue(level.var_faec6e12b831873d) && !istrue(self.var_908f8ac4bbcdb65e) || scripts\cp_mp\utility\game_utility::function_fa7bfcc1d68b7b73();
    var_f7e8a863407717b3 = istrue(fromprematch);
    scripts\mp\gametypes\br_pickups::resetplayerinventory(keeploadout, var_f7e8a863407717b3);
    if (!istrue(fromprematch) && !istrue(self.gulag) && !scripts\mp\gametypes\br_gametypes::isfeaturedisabled("armor")) {
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
                scripts\mp\gametypes\br_gulag::gulaggesturesinit();
            }
            thread scripts\mp\gametypes\br_gulag::playergulaggestures();
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

// Namespace br / scripts\mp\gametypes\br
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xc2f4
// Size: 0x2c
function onplayerscore(event, player, points, victim, eventinfo) {
    return points;
}

// Namespace br / scripts\mp\gametypes\br
// Params 11, eflags: 0x0
// Checksum 0x0, Offset: 0xc329
// Size: 0x6a8
function brmodifyplayerdamage(einflictor, victim, eattacker, idamage, smeansofdeath, objweapon, vpoint, vdir, shitloc, idflags, var_be4285b26ed99ab1) {
    if (scripts\cp_mp\utility\game_utility::function_b2c4b42f9236924()) {
        idamage = scripts\mp\damage::gamemodemodifyplayerdamage(einflictor, victim, eattacker, idamage, smeansofdeath, objweapon, vpoint, vdir, shitloc, idflags, var_be4285b26ed99ab1);
    }
    if (isdefined(eattacker) && istrue(eattacker.gulagjailer)) {
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
        }
    }
    if ((scripts\cp_mp\utility\game_utility::function_ba5574c7f287c587() || scripts\cp_mp\utility\game_utility::function_6493ec89ae923684()) && isbot(eattacker) && eattacker isplayeringulag() && istrue(eattacker.gulagarena)) {
        damagedata = scripts\cp_mp\utility\damage_utility::packdamagedata(eattacker, victim, idamage, objweapon, smeansofdeath, einflictor, vpoint, vdir);
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
        if (istrue(victim.insertingarmorplate) && (!victim scripts\cp_mp\utility\damage_utility::function_cb9ba92488b23c5(objweapon) || !victim _hasperk("specialty_outlander") || istrue(getdvarint(@"hash_22aa9e2b2bd6a191", 0)))) {
            victim notify("try_armor_cancel", "damage_received");
        }
        if (scripts\mp\loot::function_6f45e7311f77eac4(victim) && !scripts\cp_mp\utility\damage_utility::function_cb9ba92488b23c5(objweapon) && !scripts\mp\loot::function_73d8c72e055e8640(victim)) {
            victim notify("close_container");
        }
        var_49e6ef3edadd524e = getweaponrootname(objweapon);
        weaponbasename = getweaponbasenamescript(objweapon);
        weapontype = weaponclass(objweapon);
        if (smeansofdeath == "MOD_FALLING") {
            if (isdefined(level.modifybrfalldamage)) {
                idamage = victim [[ level.modifybrfalldamage ]](idamage);
            } else if (victim scripts\mp\utility\killstreak::isjuggernaut()) {
            } else if (getdvarint(@"hash_69f152910149bc10", 0)) {
                if (victim isskydiving()) {
                    victim skydive_interrupt();
                }
                idamage = 0;
            }
        } else if (isdefined(einflictor) && einflictor scripts\cp_mp\vehicles\vehicle::isvehicle()) {
            if (isdefined(level.modifybrvehicledamage)) {
                idamage = victim [[ level.modifybrvehicledamage ]](idamage);
            }
        } else if (var_49e6ef3edadd524e == "iw9_dm_crossbow" && smeansofdeath != "MOD_PISTOL_BULLET") {
        } else if (smeansofdeath == "MOD_MELEE") {
            idamage = int(var_be4285b26ed99ab1);
            if (scripts\engine\utility::issharedfuncdefined(#"hash_309e179113ce358b", #"hash_2984f255833c7f76") && victim _hasperk("specialty_close_quarter")) {
                idamage = [[ scripts\engine\utility::getsharedfunc(#"hash_309e179113ce358b", #"hash_2984f255833c7f76") ]](idamage, victim, eattacker, 0);
            }
        } else if (namespace_e0ee43ef2dddadaa::iskillstreakweapon(objweapon)) {
            if (istrue(victim.inlaststand) && scripts\mp\utility\killstreak::getkillstreaknamefromweapon(objweapon) == "precision_airstrike") {
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
        }
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
        if ((isdefined(einflictor) || istrue(level.brgametype.var_c79664d8cbeb31c)) && getdvarint(@"hash_69f152910149bc10", 0)) {
            if (function_f7f3032369f275c6(smeansofdeath)) {
                damagescale = getdvarfloat(@"hash_d4f0bbe5df7312cc", 0.1);
                if (isdefined(eattacker) && eattacker == victim) {
                    damagescale = 0;
                }
                idamage = int(idamage * damagescale);
                victim thread br_alt_mode_impulse_player(einflictor, vpoint);
            }
        }
        if (scripts\mp\gametypes\br_gametypes::isbrgametypefuncdefined("modifyPlayerDamage")) {
            damagedata = scripts\cp_mp\utility\damage_utility::packdamagedata(eattacker, victim, idamage, objweapon, smeansofdeath, einflictor, vpoint, vdir);
            damagedata.shitloc = shitloc;
            idamage = thread scripts\mp\gametypes\br_gametypes::runbrgametypefunc("modifyPlayerDamage", damagedata);
        }
        var_3e6c39a65d0cfc00 = function_f581838ce4328f7a(objweapon);
        if (isdefined(level.var_664eba510919348e) && isdefined(level.var_664eba510919348e[var_3e6c39a65d0cfc00])) {
            idamage = [[ level.var_664eba510919348e[var_3e6c39a65d0cfc00] ]](einflictor, victim, eattacker, idamage, smeansofdeath, objweapon, vpoint, vdir, shitloc, idflags, var_be4285b26ed99ab1);
        }
        if (scripts\cp_mp\utility\game_utility::function_6493ec89ae923684()) {
            damagedata = scripts\cp_mp\utility\damage_utility::packdamagedata(eattacker, victim, idamage, objweapon, smeansofdeath, einflictor, vpoint, vdir);
            damagedata.shitloc = shitloc;
            idamage = thread namespace_bc2665cbe6cf4e1f::function_92a85a0dda6ca085(damagedata);
        }
    }
    return idamage;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc9da
// Size: 0x31
function brmodifyvehicledamage(data) {
    if (scripts\mp\gametypes\br_gametypes::isbrgametypefuncdefined("modifyVehicleDamage")) {
        return scripts\mp\gametypes\br_gametypes::runbrgametypefunc("modifyVehicleDamage", data);
    }
    return data.damage;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xca14
// Size: 0x27
function modeallowmeleevehicledamage(data) {
    if (scripts\mp\gametypes\br_gametypes::isbrgametypefuncdefined("allowMeleeVehicleDamage")) {
        return scripts\mp\gametypes\br_gametypes::runbrgametypefunc("allowMeleeVehicleDamage", data);
    }
    return 0;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xca44
// Size: 0x27
function modeignorevehicleexplosivedamage(data) {
    if (scripts\mp\gametypes\br_gametypes::isbrgametypefuncdefined("ignoreVehicleExplosiveDamage")) {
        return scripts\mp\gametypes\br_gametypes::runbrgametypefunc("ignoreVehicleExplosiveDamage", data);
    }
    return 0;
}

// Namespace br / scripts\mp\gametypes\br
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xca74
// Size: 0x1ce
function function_9e34d99a98d2ff67(player, mover) {
    if (isdefined(mover) && istrue(mover.var_c23ca3472233553d)) {
        function_5357c1261661e9e4(mover, player, 75, -75);
        return true;
    }
    if (isnavmeshloaded() && (!isdefined(mover.var_db03bf8e1712fd09) || mover.var_db03bf8e1712fd09)) {
        safepoint = undefined;
        if (isdefined(mover)) {
            safepoint = getclosestpointonnavmesh(mover.origin);
            if (isdefined(safepoint)) {
                testendpoint = safepoint + (0, 0, 5);
                endpos = playerphysicstrace(safepoint, testendpoint);
                if (endpos != testendpoint) {
                    safepoint = undefined;
                }
            }
        }
        if (!isdefined(safepoint)) {
            groundorigin = scripts\mp\gametypes\br_public::droptogroundmultitrace(player.origin, 30);
            safepoint = getclosestpointonnavmesh(groundorigin);
        }
        if (isdefined(safepoint) && isdefined(mover) && istrue(mover.var_5395a5cca02eae60)) {
            var_705a4bb89f63d4c4 = [];
            if (isdefined(mover.var_705a4bb89f63d4c4) && isarray(mover.var_705a4bb89f63d4c4)) {
                var_705a4bb89f63d4c4 = mover.var_705a4bb89f63d4c4;
            }
            contents = scripts\engine\trace::create_contents(1, 1, 1, 1, 1, 1);
            trace = scripts\engine\trace::ray_trace(player gettagorigin("tag_eye"), safepoint, array_add(var_705a4bb89f63d4c4, mover), contents);
            if (isdefined(trace["hittype"]) && trace["hittype"] != "hittype_none" || !canspawn(safepoint)) {
                safepoint = undefined;
            }
        }
        if (isdefined(safepoint)) {
            player setorigin(safepoint);
            return true;
        }
    }
    return false;
}

// Namespace br / scripts\mp\gametypes\br
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xcc4b
// Size: 0x22c
function br_alt_mode_impulse_player(einflictor, vpoint) {
    playercenter = (self.origin[0], self.origin[1], self.origin[2] + 36);
    if (self isonground()) {
        tracestart = self.origin + (0, 0, 18);
        traceend = self.origin + (0, 0, 90);
        contents = scripts\engine\trace::create_contents(0, 1, 0, 1, 1, 0, 1);
        var_868513209fa17242 = scripts\engine\trace::capsule_trace_passed(tracestart, traceend, 12, 72, undefined, einflictor, contents);
        if (var_868513209fa17242) {
            neworigin = (self.origin[0], self.origin[1], self.origin[2] + 18);
            self setorigin(neworigin);
        }
    }
    var_a25bfe29a290834a = istrue(level.brgametype.var_c79664d8cbeb31c) ? vpoint : einflictor.origin;
    vdir = playercenter - var_a25bfe29a290834a;
    vdir = vectornormalize(vdir);
    var_22e9f9cf6e83c4d7 = getdvarfloat(@"hash_f904c89ec86aed27", 1300);
    minz = undefined;
    if (vdir[2] > -0.3) {
        minz = getdvarfloat(@"hash_1b50fa9f9d44136f", 600);
    }
    explosiondist = distance2d(var_a25bfe29a290834a, self.origin) - 20;
    distscalar = clamp(explosiondist, 0, 80) / 100 * 0.5;
    basescalar = 1;
    scalar = basescalar - distscalar;
    vdir = vdir * var_22e9f9cf6e83c4d7 * scalar;
    if (isdefined(minz)) {
        minzscalar = basescalar - distscalar * 0.5;
        minz *= minzscalar;
        vdir = (vdir[0], vdir[1], max(minz, vdir[2]));
    }
    self setvelocity(vdir);
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xce7f
// Size: 0x16d
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
            var_d6cf0029db971fe9 = ["MOD_EXPLOSIVE_BULLET", "MOD_GRENADE", "MOD_GRENADE_SPLASH", "MOD_PROJECTILE", "MOD_PROJECTILE_SPLASH", "MOD_EXPLOSIVE", "MOD_IMPACT", "MOD_FIRE", "MOD_FIRE_BULLET"];
            level.var_6bfb61f13a7d6a4 = [];
            for (i = 0; i < var_d6cf0029db971fe9.size; i++) {
                moddvarstr = hashcat(@"hash_69cfaef4362b6a26", tolower(var_d6cf0029db971fe9[i]));
                if (getdvarint(moddvarstr)) {
                    level.var_6bfb61f13a7d6a4[level.var_6bfb61f13a7d6a4.size] = var_d6cf0029db971fe9[i];
                }
            }
        } else {
            level.var_6bfb61f13a7d6a4 = ["MOD_EXPLOSIVE", "MOD_EXPLOSIVE_BULLET", "MOD_GRENADE_SPLASH", "MOD_PROJECTILE_SPLASH", "MOD_FIRE"];
        }
    }
    return array_contains(level.var_6bfb61f13a7d6a4, smeansofdeath);
}

// Namespace br / scripts\mp\gametypes\br
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0xcff5
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

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd0c8
// Size: 0x15
function isbulletpenetration(idflags) {
    return isdefined(idflags) && idflags & 8;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd0e6
// Size: 0x3e
function issnipersemi(var_49e6ef3edadd524e) {
    return var_49e6ef3edadd524e == "iw8_sn_delta" || var_49e6ef3edadd524e == "iw8_sn_golf28" || var_49e6ef3edadd524e == "iw8_sn_mike14" || var_49e6ef3edadd524e == "iw8_sn_sbeta" || var_49e6ef3edadd524e == "iw8_sn_sksierra";
}

// Namespace br / scripts\mp\gametypes\br
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xd12d
// Size: 0x35
function isxmike109explosivedamage(var_49e6ef3edadd524e, smeansofdeath, idamage) {
    return var_49e6ef3edadd524e == "iw8_sn_xmike109" && smeansofdeath == "MOD_PISTOL_BULLET" && idamage == 1;
}

// Namespace br / scripts\mp\gametypes\br
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0xd16b
// Size: 0x2ce
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
                arclamp = 1;
            } else {
                arclamp = level.clampstepbulletdamage;
            }
            idamage = brclampstepdamage(var_be4285b26ed99ab1, objweapon, arclamp, idflags);
            idamage = int(scaler * idamage);
            break;
        case #"hash_719417cb1de832b6":
        case #"hash_fa24dff6bd60a12d": 
            scaler = idamage / var_be4285b26ed99ab1;
            idamage = brclampstepdamage(var_be4285b26ed99ab1, objweapon, level.clampstepbulletdamage, idflags);
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
                    sniperclamp = 1;
                } else {
                    sniperclamp = level.clampstepbulletdamage;
                }
                idamage = brclampstepdamage(var_be4285b26ed99ab1, objweapon, sniperclamp, idflags);
                idamage = int(scaler * idamage);
            }
            break;
        case #"hash_900cb96c552c5e8e": 
            scaler = idamage / var_be4285b26ed99ab1;
            idamage = brclampstepdamage(var_be4285b26ed99ab1, objweapon, 3, idflags);
            idamage = int(scaler * idamage);
            break;
        case #"hash_690c0d6a821b42e": 
            if (level.br_pelletmaxdamage >= 0) {
                if ((var_49e6ef3edadd524e == "iw8_sh_oscar12" || var_49e6ef3edadd524e == "iw8_sh_aalpha12") && level.var_2caca637693d024d >= 0) {
                    var_65a460bbd41d8d09 = level.var_2caca637693d024d;
                } else {
                    var_65a460bbd41d8d09 = level.br_pelletmaxdamage;
                }
                scaler = idamage / var_be4285b26ed99ab1;
                idamage = min(idamage, var_65a460bbd41d8d09);
                idamage = int(scaler * idamage);
            }
        default: 
            break;
        }
    }
    return idamage;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd442
// Size: 0x27
function brgulagdamagefilter(player) {
    return istrue(player.gulag) && !istrue(player.gulagarena);
}

// Namespace br / scripts\mp\gametypes\br
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xd472
// Size: 0xba
function brclampstepdamage(var_be4285b26ed99ab1, weapon, stepclamp, idflags) {
    var_e7ec701163e1b30c = 0;
    if (idflags & 262144) {
        var_cc5a11780bf1efb0 = 2;
    } else {
        var_cc5a11780bf1efb0 = 0;
    }
    if (stepclamp == 4) {
        var_e7ec701163e1b30c = weapon getmid3damage(var_cc5a11780bf1efb0);
    } else if (stepclamp == 3) {
        var_e7ec701163e1b30c = weapon getmid2damage(var_cc5a11780bf1efb0);
    } else if (stepclamp == 2) {
        var_e7ec701163e1b30c = weapon getmid1damage(var_cc5a11780bf1efb0);
    }
    if (var_e7ec701163e1b30c <= 0) {
        var_e7ec701163e1b30c = weapon function_dca0db73e11bc7d0(var_cc5a11780bf1efb0);
    }
    if (stepclamp == 1 || var_e7ec701163e1b30c <= 0) {
        var_e7ec701163e1b30c = weapon getmaxdamage(var_cc5a11780bf1efb0);
    }
    if (var_be4285b26ed99ab1 < var_e7ec701163e1b30c) {
        return int(var_e7ec701163e1b30c);
    }
    return var_be4285b26ed99ab1;
}

// Namespace br / scripts\mp\gametypes\br
// Params 15, eflags: 0x0
// Checksum 0x0, Offset: 0xd534
// Size: 0x2be
function onplayerdamaged(einflictor, eattacker, victim, idamage, idflags, smeansofdeath, objweapon, var_fcdf19e3cdd29669, vpoint, vdir, shitloc, psoffsettime, modelindex, partname, var_1da1a66b5c6a06a7) {
    damagedata = scripts\cp_mp\utility\damage_utility::packdamagedata(eattacker, victim, idamage, objweapon, smeansofdeath, einflictor, vpoint, vdir, var_1da1a66b5c6a06a7);
    damagedata.shitloc = shitloc;
    if (scripts\mp\gametypes\br_gametypes::isbrgametypefuncdefined("onPlayerDamaged")) {
        scripts\mp\gametypes\br_gametypes::runbrgametypefunc("onPlayerDamaged", damagedata);
    }
    if (istrue(victim.gulag)) {
        arena = namespace_ad49798629176e96::function_2f4344abdc200e43(victim);
        if (isdefined(arena)) {
            if (!isdefined(victim.var_3a7c9a3e9aa20358)) {
                victim.var_3a7c9a3e9aa20358 = 0;
            }
            victim.var_3a7c9a3e9aa20358 += idamage;
        }
    }
    if (isdefined(eattacker) && eattacker != victim && isplayer(eattacker)) {
        if (idamage >= var_fcdf19e3cdd29669) {
            idamage = var_fcdf19e3cdd29669;
        }
        if (idamage > 0) {
            victim namespace_88bfae359020fdd3::function_d0ccb374806fe494();
            weaponbasename = getweaponbasenamescript(objweapon);
            if (weaponbasename == "rock_mp" && isalive(victim)) {
                victim playlocalsound("br_gulag_rock_player_impact");
            }
        }
        eattacker scripts\mp\gametypes\br_public::updatebrscoreboardstat("damageDealt", eattacker scripts\mp\utility\stats::getpersstat("damage"));
    } else if (isdefined(einflictor) && einflictor scripts\cp_mp\vehicles\vehicle::isvehicle()) {
        vehicle = einflictor;
        if (isdefined(vehicle.owner) && isplayer(vehicle.owner) && vehicle.owner != victim) {
            victim namespace_88bfae359020fdd3::function_d0ccb374806fe494();
            vehicle.owner scripts\mp\gametypes\br_public::updatebrscoreboardstat("damageDealt", vehicle.owner scripts\mp\utility\stats::getpersstat("damage"));
        }
    } else if (isdefined(eattacker) && eattacker != victim && isagent(eattacker)) {
        victim namespace_88bfae359020fdd3::function_d0ccb374806fe494();
    }
    if (isdefined(objweapon) && namespace_e0ee43ef2dddadaa::iskillstreakweapon(objweapon)) {
        var_8fcd15f752798a79 = idamage >= var_fcdf19e3cdd29669 && scripts\mp\utility\killstreak::getkillstreaknamefromweapon(objweapon) == "precision_airstrike";
        var_d3837504f686b986 = istrue(victim.inlaststand);
        if (var_8fcd15f752798a79 && var_d3837504f686b986) {
            victim.brdownedbyairstriketime = gettime();
        }
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0xd7fa
// Size: 0x272
function onnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon) {
    if (!istrue(level.br_prematchstarted)) {
        return;
    }
    scripts\mp\gametypes\common::oncommonnormaldeath(victim, attacker, lifeid, meansofdeath, objweapon, iskillstreakweapon);
    if (victim isswimming()) {
        function_3eb5723089c90994(victim);
    } else {
        victim.consecutivesuicides = 0;
    }
    if (getsubgametype() == "dmz" || getsubgametype() == "exgm" || getsubgametype() == "plunder" || getsubgametype() == "risk" || getsubgametype() == "kingslayer" || getsubgametype() == "rumble_mgl" || getsubgametype() == "champion") {
        return;
    }
    liveplayers = getlivingplayers();
    if (isdefined(level.numendgame)) {
        if (liveplayers.size <= level.numendgame) {
            level thread startendgame(1);
        }
    }
    playersleft = level.totalplayers - liveplayers.size;
    highestscore = 0;
    foreach (player in level.players) {
        if (isdefined(player.score) && player.score > highestscore) {
            highestscore = player.score;
        }
        if (isdefined(player.petwatch) && isalive(player)) {
            pctstanding = 1 - playersleft / level.totalplayers;
            player scripts\cp_mp\pet_watch::tryupdategenericprogress(pctstanding, 5);
        }
    }
    if (!level.teambased) {
        victim.score = level.totalplayers - liveplayers.size;
        foreach (player in liveplayers) {
            player.score = victim.score + 1;
        }
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xda74
// Size: 0x167
function getalivecount(var_d50ae4dc9841fd21) {
    alivecounttotal = 0;
    if (istrue(var_d50ae4dc9841fd21)) {
        foreach (entry in level.teamnamelist) {
            alivecounttotal += getteamdata(entry, "aliveCount");
        }
    } else {
        foreach (entry in level.teamnamelist) {
            alivecount = getteamdata(entry, "aliveCount");
            if (alivecount) {
                aliveplayers = getteamdata(entry, "alivePlayers");
                foreach (player in aliveplayers) {
                    if (isdefined(player) && !istrue(player.gulag) && !player function_7dbb8165d792b06c()) {
                        alivecounttotal += 1;
                    }
                }
            }
        }
    }
    alivecounttotal += function_1bbd21d289ba8a92();
    return alivecounttotal;
}

// Namespace br / scripts\mp\gametypes\br
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xdbe4
// Size: 0xe5
function doplayerkilledsplashes(victim, attacker) {
    if (istrue(level.usegulag) && victim scripts\mp\gametypes\br_public::isplayeringulag()) {
        return;
    }
    if (getsubgametype() == "rumble_mgl") {
        teammates = getsquadmates(victim.team, victim.sessionsquadid, 1);
    } else {
        teammates = level.teamdata[victim.team]["alivePlayers"];
    }
    foreach (teammate in teammates) {
        if (!isdefined(teammate)) {
            continue;
        }
        if (teammate != victim) {
            teammate thread scripts\mp\hud_message::showsplash("br_teammate_dead", undefined, victim);
        }
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdcd1
// Size: 0x5c
function shutdowngulagforalivecount() {
    if (istrue(level.usegulag) && !istrue(level.gulag.shutdown)) {
        count = getalivecount(0);
        if (count <= getdvarint(@"hash_2665fc757a822eb2", -1)) {
            scripts\mp\gametypes\br_gulag::shutdowngulag("player_count", count);
        }
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdd35
// Size: 0x180
function onplayerdisconnect(player) {
    if (!scripts\mp\gametypes\br_gametypes::isfeaturedisabled("teamSpectate")) {
        if (!istrue(player.var_632bad3edb4e449e)) {
            scripts\mp\gametypes\br_spectate::migratespectators(player, undefined, 0);
        }
    }
    if (istrue(level.br_prematchstarted)) {
        shutdowngulagforalivecount();
        scripts\mp\gametypes\br_gulag::onplayerdisconnect(player);
        shouldhandledeath = isdefined(player) && istrue(player.inlaststand) && !player function_7dbb8165d792b06c() && istrue(level.var_8a854ec031bb41f1) && !istrue(player.var_ded04cdd264a7e00);
        if (shouldhandledeath) {
            if (namespace_aead94004cf4c147::function_720d227d0e55a960()) {
                namespace_85cd45b4fe0d86fb::function_f6d685cabfad2ce9(player, player.laststandattacker);
            }
            if (isdefined(player.laststandattacker)) {
                player.laststandattacker scripts\mp\damage::playerincrementscoreboardkills();
            }
        }
    }
    scripts\mp\gametypes\br_analytics::branalytics_disconnect(player, int(isreallyalive(player)));
    if (scripts\mp\gametypes\br_gametypes::isbrgametypefuncdefined("onPlayerDisconnect")) {
        scripts\mp\gametypes\br_gametypes::runbrgametypefunc("onPlayerDisconnect", player);
    }
    level thread updateplayerandteamcountui();
    scripts\mp\gametypes\br_attractions::onplayerdisconnect(player);
    if (istrue(level.var_8a854ec031bb41f1) && istrue(level.br_prematchstarted) && !istrue(player.infilactive) && isreallyalive(player) && getsubgametype() != "dmz" && !(scripts\cp_mp\utility\game_utility::function_6910a4c65560c44b() && isbot(player))) {
        player scripts\mp\gametypes\br_pickups::droponplayerdeath();
    }
    namespace_6c622b52017c6808::arrow_onplayerdisconnect(player);
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xdebd
// Size: 0x1e3
function function_c11d61293d7e8ba(player) {
    if (isdefined(player) && player.team != "codcaster") {
        enemyteams = getenemyteams(player.team);
        remainingteams = [];
        foreach (entry in enemyteams) {
            UIBotCount = function_d0f9fbf3f0f8c739(entry);
            if (getteamdata(entry, "aliveCount") || UIBotCount > 0) {
                remainingteams[remainingteams.size] = entry;
            }
        }
        teamplacement = remainingteams.size + 1;
        if (scripts\mp\flags::gameflag("prematch_done")) {
            if (!istrue(player.extracted)) {
                var_c01bbc6249a9748f = player calculatebrbonusxp(teamplacement, player.team);
                var_d6a23fdabd1d282c = var_c01bbc6249a9748f[2];
                var_1b70c48b930405f0 = var_c01bbc6249a9748f[1];
                brbonusxp = var_c01bbc6249a9748f[0];
                if (brbonusxp > 0) {
                    player givebrbonusxp(brbonusxp, undefined, "disconnect");
                    player.matchbonus = var_1b70c48b930405f0;
                    player.placementbonus = var_d6a23fdabd1d282c;
                    if (issharedfuncdefined("seasonalevents", "getFeaturedLootEventActive")) {
                        if (function_f3bb4f4911a1beb2("seasonalevents", "getFeaturedLootEventActive")) {
                            function_34708e1f426d9a19(player);
                        }
                    }
                }
                player setplacementstats(teamplacement);
                player stopchallengetimers();
                scripts\mp\gamelogic::_setplayerteamrank(player, teamplacement);
                updateclientmatchdata(player);
            }
            if (isdefined(level.var_c3edd7b8c279a3e)) {
                player thread [[ level.var_c3edd7b8c279a3e ]]();
            }
        }
        player thread handlebrdefeatedpostgamestate(teamplacement);
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe0a8
// Size: 0xdf
function function_ad8c1e6228a10058() {
    player = self;
    if (!level.var_318de67b5265b4c6) {
        return;
    }
    for (i = 0; i < namespace_aead94004cf4c147::function_b13e35608b336d65(player); i++) {
        currentlootid = player namespace_aead94004cf4c147::function_6196d9ea9a30e609(i);
        currentquantity = player namespace_aead94004cf4c147::function_897b29adb37f06a7(i);
        player setplayerdata(level.var_5d69837cf4db0407, level.backpackdata, i, "lootID", 1);
        player setplayerdata(level.var_5d69837cf4db0407, level.backpackdata, i, "quantity", 1);
        player setplayerdata(level.var_5d69837cf4db0407, level.backpackdata, i, "lootID", currentlootid);
        player setplayerdata(level.var_5d69837cf4db0407, level.backpackdata, i, "quantity", currentquantity);
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe18f
// Size: 0x41
function updateclientmatchdata(player) {
    scripts\mp\gamelogic::processlobbydataforclient(player);
    scripts\mp\scoreboard::processcommonplayerdataforplayer(player);
    var_877e2fc32734dd14 = getdvarint(@"hash_1bc373211683e0b6", 0);
    if (var_877e2fc32734dd14) {
        player sendclientmatchdataforclient();
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 10, eflags: 0x0
// Checksum 0x0, Offset: 0xe1d8
// Size: 0x3a4
function onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, killid) {
    deathdata = scripts\cp_mp\utility\damage_utility::packdamagedata(attacker, self, idamage, objweapon, smeansofdeath, einflictor, undefined, vdir);
    scripts\common\callbacks::callback("br_player_killed_early", deathdata);
    if (istrue(level.br_prematchstarted)) {
        if (namespace_aead94004cf4c147::function_720d227d0e55a960()) {
            namespace_85cd45b4fe0d86fb::function_f6d685cabfad2ce9(self, attacker, objweapon);
        }
        if (smeansofdeath == "MOD_EXECUTION") {
            self.wasexecuted = 1;
        } else {
            self.wasexecuted = 0;
        }
        scripts\mp\gametypes\br_pickups::droponplayerdeath(attacker);
        doplayerkilledsplashes(self, attacker);
        shutdowngulagforalivecount();
        scripts\mp\gametypes\br_utility::function_8311407ea8b66f9a(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, killid);
    }
    scripts\mp\gametypes\br_jugg_common::onplayerkilled(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration, killid);
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
        thread scripts\mp\gamelogic::trackleaderboarddeathstats(attacker, self, var_b2b6cafcdb2218d2, smeansofdeath);
        self.var_f08da114ffd85042 = self.lifeid;
    }
    scripts\mp\gametypes\br_pickups::resetplayerinventory(undefined, undefined, 1);
    onplayerscore("kill", attacker, 0, self);
    if (isdefined(self.laststandoutlineid)) {
        scripts\mp\utility\outline::outlinedisable(self.laststandoutlineid, self);
        self.laststandoutlineid = undefined;
    }
    namespace_92443376a63aa4bd::logplayerkilled(attacker, self, smeansofdeath, idamage);
    if (scripts\mp\gametypes\br_gametypes::isbrgametypefuncdefined("onPlayerKilled")) {
        thread scripts\mp\gametypes\br_gametypes::runbrgametypefunc("onPlayerKilled", deathdata);
    }
    scripts\common\callbacks::callback("br_player_killed", deathdata);
    if (!istrue(level.br_prematchstarted)) {
        scripts\mp\gametypes\br_plunder::playerplunderlivelobbydropondeath(smeansofdeath);
        return;
    }
    if (istrue(level.var_c62d39d6e6afb119)) {
        if (getdvarint(@"hash_ec7375cc2a0ca633", 1)) {
            scripts\mp\gametypes\br_analytics::function_4eb467c8f2a4c7ae(deathdata);
        }
        thread namespace_d4eb7462ff000665::function_b2616afcad011728(deathdata);
    }
    if (namespace_708f627020de59d3::function_c0d385a09d173a36()) {
        thread namespace_708f627020de59d3::onplayerkilled(attacker, self);
    }
    if (getdvarint(@"hash_82bde055b11e6698", 0)) {
        thread scripts\mp\gametypes\br_quest_util::onplayerkilled(attacker, self);
    } else {
        thread namespace_1eb3c4e0e28fac71::onplayerkilled(attacker, self);
    }
    if (scripts\mp\gametypes\br_public::function_57244bfdbe157401()) {
        if (isdefined(level.wztrain_info) && isdefined(level.wztrain_info.var_d17ae48dc6e221d3)) {
            [[ level.wztrain_info.var_d17ae48dc6e221d3 ]](self, attacker, smeansofdeath);
        }
    }
    thread scripts\mp\gametypes\br_respawn::playerdied(attacker, objweapon);
    scripts\mp\gametypes\br_public::setplayerdownedextrainfo(0);
    scripts\mp\gametypes\br_public::setplayerbeingrevivedextrainfo(0);
    updatesquadmemberlaststandreviveprogress(self, self, 0, 1);
    if (istrue(self.inlaststand)) {
        if (isplayer(attacker)) {
            attacker incrementcleanupsstat();
        }
    }
    eliminated = scripts\mp\gametypes\br_gametypes::runbrgametypefunc("markPlayerAsEliminatedOnKilled");
    if (!isdefined(eliminated)) {
        eliminated = !istrue(level.usegulag);
    }
    if (eliminated) {
        scripts\mp\gametypes\br_utility::markplayeraseliminated(self, "onPlayerKilled");
    }
    if (scripts\mp\gametypes\br_public::isBrPracticeMode()) {
        if (isbot(self) && isplayer(attacker) && !istrue(attacker scripts\mp\gametypes\br_public::isplayeringulag())) {
            attacker notify("killed_enemy");
        }
    }
    level thread updateplayerandteamcountui();
    level notify("player_killed");
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe584
// Size: 0x4f
function incrementcleanupsstat() {
    player = self;
    if (!isdefined(player.br_cleanups)) {
        player.br_cleanups = 0;
    }
    player.br_cleanups++;
    player scripts\mp\gametypes\br_public::updatebrscoreboardstat("cleanups", player.br_cleanups);
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe5db
// Size: 0x35
function registercrateforcleanup(crate) {
    level.br_pickups.crates[level.br_pickups.crates.size] = crate;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe618
// Size: 0xb
function brloadoutcratefirstactivation(crate) {
    
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe62b
// Size: 0x107
function makeitemsfromcrate(player) {
    cratedata = self.data;
    if (cratedata.type == "personal") {
        makepersonalweaponfromcrate(player);
        return;
    }
    if (cratedata.type == "weapon") {
        numweapons = randomintrange(2, 4);
        numextras = 6 - numweapons;
    } else {
        numweapons = randomintrange(1, 2);
        numextras = 6 - numweapons;
    }
    dropnum = 0;
    for (i = 0; i < numweapons && dropnum < level.br_pickups.br_dropoffsets.size; i++) {
        if (isdefined(scripts\mp\gametypes\br::makeweaponfromcrate(dropnum))) {
            dropnum++;
        }
    }
    for (i = 0; i < numextras && dropnum < level.br_pickups.br_dropoffsets.size; i++) {
        if (isdefined(scripts\mp\gametypes\br::makeitemfromcrate(dropnum))) {
            dropnum++;
        }
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe73a
// Size: 0xc8
function makeweaponfromcrate(dropnum) {
    var_5fba91f7c0fc9c89 = random(level.br_pickups.br_crateguns);
    fullweaponobj = getfullweaponobjforscriptablepartname(var_5fba91f7c0fc9c89);
    if (!isdefined(fullweaponobj)) {
        return;
    }
    groundpos = drop_to_ground(self.origin + level.br_pickups.br_dropoffsets[dropnum], 50, -200, (0, 0, 1)) + (0, 0, 24);
    weapon = createspawnweaponatpos(groundpos, (0, 0, 90), fullweaponobj);
    if (isdefined(weapon)) {
        weapon.isweaponfromcrate = 1;
    }
    return weapon;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe80b
// Size: 0xbc
function makeitemfromcrate(dropnum) {
    groundpos = drop_to_ground(self.origin + level.br_pickups.br_dropoffsets[dropnum], 50, -200, (0, 0, 1)) + (0, 0, 12);
    scriptablename = random(level.br_pickups.br_crateitems);
    itemname = scriptablename;
    dropinfo = scripts\mp\gametypes\br_pickups::getitemdropinfo(groundpos, (0, 0, 90));
    pickupent = scripts\mp\gametypes\br_pickups::spawnpickup(itemname, dropinfo, 1);
    return pickupent;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xe8d0
// Size: 0xc2
function makepersonalweaponfromcrate(player) {
    cratedata = self.data;
    assert(isdefined(cratedata.personalweaponfullname));
    groundpos = drop_to_ground(self.origin + (0, 0, 6), 50, -200, (0, 0, 1)) + (0, 0, 24);
    weapon = createspawnweaponatposfromname(groundpos, cratedata.personalweaponfullname);
    if (isdefined(weapon)) {
        weapon.isweaponfromcrate = 1;
        player loadweaponsforplayer([cratedata.personalweaponfullname]);
    }
    return weapon;
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe99b
// Size: 0x202
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
        level.br_weaponweighttotal += weight;
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

// Namespace br / scripts\mp\gametypes\br
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xeba5
// Size: 0xe1
function weaponlocallowed(loc, locused) {
    foreach (l in locused) {
        low = l.origin[2] - 24;
        high = l.origin[2] + 90 - 24;
        if (distance_2d_squared(l.origin, loc.origin) < 147456 && loc.origin[2] >= low && loc.origin[2] <= high) {
            return false;
        }
    }
    return true;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xec8f
// Size: 0x35
function startendgame(firsttime) {
    if (function_a587b0b0998c6d13()) {
        return;
    }
    scripts\mp\gamelogic::pausetimer();
    level.timepausestart = gettime();
    level.timelimitoverride = 1;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xeccc
// Size: 0x150
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

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xee24
// Size: 0x97
function groundraycast(pos) {
    contents = scripts\engine\trace::create_contents(0, 1, 0, 0, 1, 1);
    caststart = pos + (0, 0, 10000);
    castend = caststart + (0, 0, -20000);
    castresults = physics_raycast(caststart, castend, contents, undefined, 0, "physicsquery_closest", 1);
    if (isdefined(castresults) && castresults.size > 0) {
        return castresults[0]["position"];
    }
    return (0, 0, 0);
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xeec4
// Size: 0xec
function debugplayercirclevfx() {
    while (true) {
        waitframe();
        if (!isdefined(level.circledebugpos) || !isdefined(level.circledebugradius)) {
            continue;
        }
        incircle = distance2d(self.origin, level.circledebugpos) < level.circledebugradius;
        if (istrue(self.debugcircleincircle)) {
            if (!incircle && level.debugcircleplayerfx == 0) {
                playfxontag(level._effect["vfx_gas_ring_player"], self, "tag_eye");
                level.debugcircleplayerfx = 1;
                self.debugcircleincircle = 0;
            }
            continue;
        }
        if (incircle && !self.debugcircleincircle) {
            self.debugcircleincircle = 1;
            stopfxontag(level._effect["vfx_gas_ring_player"], self, "tag_eye");
            level.debugcircleplayerfx = 0;
        }
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xefb8
// Size: 0x17e
function rundebugvfxcircletest(startradius, endradius, time, var_713a986ea7b77210) {
    level endon("game_ended");
    level endon("runDebugVFXCircleTest");
    if (!istrue(level.debugcircleplayerfx)) {
        level.players[0] thread debugplayercirclevfx();
    }
    respawntime = 5;
    groundpos = level.players[0] groundraycast(level.players[0].origin);
    level.circleemitters = spawnentsincircle(groundpos, startradius, var_713a986ea7b77210);
    level.circledebugpos = groundpos;
    wait 0.1;
    spawnvfxincircle(level.circleemitters);
    starttime = time;
    while (time > 0) {
        pct = time / starttime;
        newradius = endradius + (startradius - endradius) * pct;
        if (respawntime < 0) {
            destroyemitters(level.circleemitters);
            if (newradius <= 0) {
                return;
            }
            level.circledebugradius = newradius;
            respawntime = 5;
            level.circleemitters = spawnentsincircle(groundpos, newradius, var_713a986ea7b77210);
            wait 0.1;
            spawnvfxincircle(level.circleemitters);
        } else {
            updateemitterpositions(groundpos, newradius, level.circleemitters);
        }
        time -= level.framedurationseconds;
        respawntime -= level.framedurationseconds;
        waitframe();
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf13e
// Size: 0x52
function destroyemitters(emitters) {
    for (i = 0; i < emitters.size; i++) {
        if (isdefined(emitters[i])) {
            stopfxontag(level._effect["vfx_gas_ring_puffy"], emitters[i], "tag_origin");
            emitters[i] delete();
        }
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xf198
// Size: 0xd2
function updateemitterpositions(center, newradius, emitters) {
    count = emitters.size;
    circum = 6.2831 * newradius;
    stepdegrees = 360 / count;
    for (i = 0; i < count; i++) {
        angle = stepdegrees * i;
        y = sin(angle) * newradius;
        x = cos(angle) * newradius;
        groundpos = groundraycast(center + (x, y, 0));
        emitters[i].origin = groundpos;
        emitters[i].angles = (0, angle + 180, 0);
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xf272
// Size: 0x146
function spawnentsincircle(center, radius, var_713a986ea7b77210) {
    emitters = [];
    circum = 6.2831 * radius;
    steps = circum / var_713a986ea7b77210;
    if (steps < 200) {
        iprintlnbold("Using " + int(steps) + " emitters");
    } else {
        iprintlnbold("Can't use " + int(steps) + " emitters, using 200 instead");
    }
    steps = min(steps, 200);
    stepdegrees = 360 / steps;
    for (i = 0; i < steps; i++) {
        angle = stepdegrees * i;
        y = sin(angle) * radius;
        x = cos(angle) * radius;
        groundpos = groundraycast(center + (x, y, 0));
        emitters[i] = spawn("script_model", groundpos);
        emitters[i] setmodel("tag_origin");
        emitters[i].origin = groundpos;
        emitters[i].angles = (0, angle + 180, 0);
    }
    return emitters;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf3c1
// Size: 0x42
function spawnvfxincircle(emitters) {
    for (i = 0; i < emitters.size; i++) {
        playfxontag(level._effect["vfx_gas_ring_puffy"], emitters[i], "tag_origin");
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf40b
// Size: 0x24
function ontimelimit() {
    if (isdefined(level.numendgame)) {
        level thread startendgame(1);
    }
    level.numendgame = undefined;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf437
// Size: 0x12e
function onplayerjoinsquad(player) {
    if (!isdefined(player.team)) {
        scripts\mp\utility\script::demoforcesre("onPlayerJoinTeam: !IsDefined( player.team ) - " + player.name);
    }
    if (!isgameplayteam(player.team)) {
        scripts\mp\utility\script::demoforcesre("onPlayerJoinTeam: !isGameplayTeam( player.team ) - " + player.name + " " + player.team);
    }
    if (level.teambased) {
        squadleader = namespace_ca7b90256548aa40::getsquadleader(player.team, player.sessionsquadid);
        if (!scripts\mp\gametypes\br_gametypes::isfeaturedisabled("squadLeader")) {
            if (namespace_9bb409deb69fb31d::function_3d93807e453d0770()) {
                teamplayers = scripts\mp\utility\teams::getteamdata(player.team, "players");
                foreach (player in teamplayers) {
                    player setplayerbrsquadleader(squadleader == player);
                }
                return;
            }
            player setplayerbrsquadleader(squadleader == player);
        }
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf56d
// Size: 0x2a
function onplayerjointeam(player) {
    if (getdvarint(@"hash_b2b6bc454af40904", 0)) {
        player.var_3f78c6a0862f9e25 = 0;
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf59f
// Size: 0x1de
function ondeadevent(team) {
    if (istrue(level.br_debugsolotest) || getsubgametype() == "plunder" || getsubgametype() == "risk" || getsubgametype() == "kingslayer" || getsubgametype() == "rumble_mgl" || !function_227ca42a35b0398b(team)) {
        return;
    }
    if (namespace_eb17b46cdcb98eea::function_1980065ce4dc067b() && istrue(self.gulagarena)) {
        return;
    }
    if (istrue(scripts\mp\gametypes\br_gametypes::runbrgametypefunc("onDeadEvent", team))) {
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
                    player thread scripts\mp\gametypes\br_utility::function_1b5da10393c9c50e(1);
                }
            }
            scripts\mp\gametypes\br_utility::printteameliminated(team);
            thread onsquadeliminated(team);
            scripts\mp\gamelogic::default_ondeadevent(team);
        } else {
            level notify("all_players_dead");
            foreach (player in level.players) {
                if (player getclientomnvar("ui_league_play_br_leave_penalty_timer") > scripts\mp\gametypes\br_utility::function_b5b049c4b47cf929()) {
                    player thread scripts\mp\gametypes\br_utility::function_1b5da10393c9c50e(1);
                }
            }
        }
    }
    if (isdefined(level.var_44691e82f0c05d37) && isdefined(team)) {
        thread [[ level.var_44691e82f0c05d37 ]](team);
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf785
// Size: 0x16f
function function_99e3948bfd8a99b8(team) {
    if ((scripts\cp_mp\utility\game_utility::function_fa7bfcc1d68b7b73() || scripts\cp_mp\utility\game_utility::function_6910a4c65560c44b()) && isdefined(level.var_7b37b2193f163b9b)) {
        players = getteamdata(team, "players");
        alivecount = 0;
        foreach (player in players) {
            if (!istrue(player.br_iseliminated) && !player function_7dbb8165d792b06c()) {
                alivecount++;
            }
        }
        UIBotCount = function_d0f9fbf3f0f8c739(team);
        alivecount += UIBotCount;
        return alivecount;
    }
    if (namespace_eb17b46cdcb98eea::function_1980065ce4dc067b() && level.var_68c03dccce80d6f8) {
        alivecount = getteamdata(team, "aliveCount");
        players = getteamdata(team, "players");
        foreach (player in players) {
            if (!isalive(player) && istrue(player.gulagarena)) {
                alivecount++;
            }
        }
        return alivecount;
    }
    return getteamdata(team, "aliveCount");
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf8fc
// Size: 0x90
function function_85cda66c74550adc() {
    player = self;
    if (istrue(level.var_ae3b17e71eb3bec7)) {
        var_972e9e8fa4db479e = level.var_67b3435949f31707;
        if (!isdefined(var_972e9e8fa4db479e)) {
            var_c012b662499f48af = function_46cdf9b3dc38d289([player.team]);
            remainingplayers = var_c012b662499f48af[1];
            remainingteams = var_c012b662499f48af[0];
            var_972e9e8fa4db479e = remainingteams.size;
        }
        teamplacement = getteamplacement(var_972e9e8fa4db479e);
        if (teamplacement == 2) {
            return true;
        }
    }
    return false;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf995
// Size: 0x24a
function function_50e7496b6d13c173(var_82de8fe11fd79526) {
    var_405ce5d0e4be823a = [];
    foreach (player in var_82de8fe11fd79526) {
        if (isdefined(player)) {
            var_405ce5d0e4be823a = function_6d6af8144a5131f1(var_405ce5d0e4be823a, player.team);
        }
    }
    var_c012b362499f4216 = function_46cdf9b3dc38d289(var_405ce5d0e4be823a);
    remainingplayers = var_c012b362499f4216[1];
    remainingteams = var_c012b362499f4216[0];
    teamplacement = getteamplacement(remainingteams.size);
    foreach (player in var_82de8fe11fd79526) {
        if (isdefined(player)) {
            var_c012c062499f5ead = player calculatebrbonusxp(teamplacement, player.team);
            var_d6a23fdabd1d282c = var_c012c062499f5ead[2];
            var_1b70c48b930405f0 = var_c012c062499f5ead[1];
            brbonusxp = var_c012c062499f5ead[0];
            var_b01aca3236595958 = function_87ecb716bc207294(player);
            player givebrbonusxp(brbonusxp, undefined, "squadEliminated", var_b01aca3236595958);
            player.matchbonus = scripts\mp\rank::function_c18c8bb0776284c6(var_1b70c48b930405f0, var_b01aca3236595958);
            player.placementbonus = scripts\mp\rank::function_9e1336d25eb66326(var_d6a23fdabd1d282c, var_b01aca3236595958);
            if (issharedfuncdefined("seasonalevents", "getFeaturedLootEventActive")) {
                if (function_f3bb4f4911a1beb2("seasonalevents", "getFeaturedLootEventActive")) {
                    function_34708e1f426d9a19(player);
                }
            }
        }
    }
    foreach (player in var_82de8fe11fd79526) {
        if (isdefined(player)) {
            player thread handlebrdefeatedpostgamestate(teamplacement);
            player stopchallengetimers();
            scripts\mp\gamelogic::_setplayerteamrank(player, teamplacement);
            updateclientmatchdata(player);
            if (istrue(level.var_77907d733abe8b63)) {
                player namespace_2c7976a64ea24d6a::match_end(teamplacement, 0, 0);
            }
        }
    }
    setaardata(undefined, var_82de8fe11fd79526);
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfbe7
// Size: 0xa9
function function_46cdf9b3dc38d289(var_70c90462fa89cb94) {
    remainingteams = [];
    remainingplayers = 0;
    foreach (entry in level.teamnamelist) {
        if (array_contains(var_70c90462fa89cb94, entry)) {
            continue;
        }
        var_849d01afb2fc0f0a = function_99e3948bfd8a99b8(entry);
        if (var_849d01afb2fc0f0a > 0) {
            remainingteams[remainingteams.size] = entry;
            remainingplayers += var_849d01afb2fc0f0a;
        }
    }
    return [remainingteams, remainingplayers];
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfc99
// Size: 0xf
function getteamplacement(var_972e9e8fa4db479e) {
    return var_972e9e8fa4db479e + 1;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfcb1
// Size: 0x27b
function onsquadeliminated(team) {
    remainingteams = [];
    remainingplayers = 0;
    foreach (entry in level.teamnamelist) {
        if (entry == team) {
            continue;
        }
        var_849d01afb2fc0f0a = function_99e3948bfd8a99b8(entry);
        if (var_849d01afb2fc0f0a > 0) {
            remainingteams[remainingteams.size] = entry;
            remainingplayers += var_849d01afb2fc0f0a;
        }
    }
    level.var_67b3435949f31707 = remainingteams.size;
    if (isdefined(level.var_ed844db90cb6d370)) {
        var_e0466189b4ca60a3 = getdvarint(@"hash_b732d750ae36e4e0", 3);
        if (var_e0466189b4ca60a3 != -1 && remainingteams.size <= var_e0466189b4ca60a3 && issharedfuncdefined("teamAssim", "permanentlyDisableAssim")) {
            [[ getsharedfunc("teamAssim", "permanentlyDisableAssim") ]]();
        }
    }
    if (scripts\mp\gametypes\br_gametypes::isfeatureenabled("pleaForHelp")) {
        self [[ scripts\engine\utility::getsharedfunc("pleaForHelp", "deletePleasFromTeam") ]](team);
    }
    teamplacement = getteamplacement(remainingteams.size);
    level callback::callback("on_squad_eliminated", {#remaining_players:remainingplayers, #remaining_teams:remainingteams, #placement:teamplacement, #team:team});
    onsquadeliminatedplacement(team, teamplacement, remainingplayers, 0);
    if (isdefined(level.var_561addf876799987)) {
        [[ level.var_561addf876799987 ]]("placement", team);
    }
    if (function_fe8f110892c02b38("ui_br_player_personal_best") && !istrue(level.brgametype.var_550e36ff15e08141)) {
        teamplayers = getteamdata(team, "players");
        foreach (player in teamplayers) {
            level thread function_496ccc75ee79f04a(player);
        }
    }
    if (istrue(level.var_77907d733abe8b63)) {
        if (getdvarint(@"hash_ec4c94a9646f819f", 1) == 1) {
            if (!namespace_bf9ffd2b22c7d819::function_c9b26cfb4d93ae50()) {
                namespace_2c7976a64ea24d6a::function_9a30317c91cfaf5e();
                return;
            }
            if (istrue(level.var_e20af527a1d336f6)) {
                namespace_2c7976a64ea24d6a::function_e197f06b7037e7a1(team);
            }
        }
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0xff34
// Size: 0x2c9
function private function_496ccc75ee79f04a(player) {
    if (!isdefined(player) || istrue(level.brgametype.var_550e36ff15e08141)) {
        return;
    }
    categories = ["kills", "revives", "assist", "contracts", "respawns"];
    var_38e6e416af923249 = ["_c"];
    var_f8de20b059622a74 = ["pb_kill", "pb_revive", "pb_assist", "pb_contract", "pb_return"];
    var_652d3ceeda2e30b6 = ["_chapter", "_seasonal", "_rolling"];
    var_a61fa8e23f24fb92 = [];
    var_a61fa8e23f24fb92[0] = player scripts\mp\utility\stats::getpersstat("kills");
    var_a61fa8e23f24fb92[1] = player scripts\mp\utility\stats::getpersstat("rescues");
    var_a61fa8e23f24fb92[2] = player scripts\mp\utility\stats::getpersstat("assists");
    var_a61fa8e23f24fb92[3] = player scripts\mp\utility\stats::getpersstat("contracts");
    var_a61fa8e23f24fb92[4] = player scripts\mp\utility\stats::getpersstat("kioskRevives");
    var_650f159419fc2ffe = undefined;
    var_607115bb5f35e65f = 0;
    for (j = 0; j < var_38e6e416af923249.size; j++) {
        for (i = 0; i < categories.size; i++) {
            pb = namespace_8885c19c053dcb46::function_cfab25659633eefc(player, categories[i] + var_38e6e416af923249[j]);
            if (var_a61fa8e23f24fb92[i] > pb) {
                var_650f159419fc2ffe = var_f8de20b059622a74[i] + var_652d3ceeda2e30b6[j];
                var_607115bb5f35e65f = var_a61fa8e23f24fb92[i];
                break;
            }
        }
        if (isdefined(var_650f159419fc2ffe)) {
            break;
        }
    }
    /#
        dvarval = getdvar(@"hash_a14c5b08548457d8", "<dev string:x4c>");
        if (dvarval != "<dev string:x4c>") {
            stringlist = strtok(dvarval, "<dev string:x1a3>");
            if (stringlist.size > 1) {
                var_650f159419fc2ffe = stringlist[0];
                var_607115bb5f35e65f = int(stringlist[1]);
            }
        }
    #/
    if (isdefined(var_650f159419fc2ffe)) {
        var_caa2afb2cdcb7815 = level.var_e3fca817c22e740d[var_650f159419fc2ffe];
        var_56c090a52d545d89 = int(var_607115bb5f35e65f);
        assert(isdefined(var_caa2afb2cdcb7815));
        assert(var_caa2afb2cdcb7815 >= 0 && var_caa2afb2cdcb7815 < 256);
        var_c7df9d76114d30f4 = 0;
        if (isdefined(player)) {
            var_c7df9d76114d30f4 = player getentitynumber();
        }
        assert(var_c7df9d76114d30f4 >= 0 && var_c7df9d76114d30f4 < 256);
        var_5c9ddcf56d36f133 = var_c7df9d76114d30f4;
        var_5c9ddcf56d36f133 |= var_caa2afb2cdcb7815 << 8;
        if (var_56c090a52d545d89 != 0) {
            var_5c9ddcf56d36f133 |= var_56c090a52d545d89 << 16;
        }
        player setclientomnvar("ui_br_player_personal_best", var_5c9ddcf56d36f133);
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x10205
// Size: 0xce
function function_79a4861772547bc2(team, remainingplayers, skipremainingplayers) {
    wait 1.5;
    subgametype = getsubgametype();
    if (subgametype != "dmz" && subgametype != "exgm") {
        teamplayers = getteamdata(team, "players");
        if (!istrue(skipremainingplayers) && remainingplayers < 5) {
            scripts\mp\gametypes\br_public::brleaderdialog("top_5_lose", 0, teamplayers, 1);
        } else if (!istrue(skipremainingplayers) && remainingplayers < 10) {
            scripts\mp\gametypes\br_public::brleaderdialog("top_10_lose", 0, teamplayers, 1);
        } else if (!istrue(skipremainingplayers) && remainingplayers < 25) {
            scripts\mp\gametypes\br_public::brleaderdialog("top_25_lose", 0, teamplayers, 1);
        }
        scripts\mp\gametypes\br_public::brleaderdialog("team_loss", 0, teamplayers, 1);
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x102db
// Size: 0x233
function onsquadeliminatedplacement(team, teamplacement, remainingplayers, skipremainingplayers) {
    setteamplacement(team, teamplacement);
    scripts\mp\gametypes\br_analytics::branalytics_teameliminated(team, teamplacement);
    teamplayers = getteamdata(team, "players");
    foreach (player in teamplayers) {
        if (isdefined(player) && !istrue(player.extracted)) {
            var_bfe23f624969e6bd = player calculatebrbonusxp(teamplacement, team);
            var_d6a23fdabd1d282c = var_bfe23f624969e6bd[2];
            var_1b70c48b930405f0 = var_bfe23f624969e6bd[1];
            brbonusxp = var_bfe23f624969e6bd[0];
            var_b01aca3236595958 = function_87ecb716bc207294(player);
            player givebrbonusxp(brbonusxp, undefined, "squadEliminated", var_b01aca3236595958);
            player.matchbonus = scripts\mp\rank::function_c18c8bb0776284c6(var_1b70c48b930405f0, var_b01aca3236595958);
            player.placementbonus = scripts\mp\rank::function_9e1336d25eb66326(var_d6a23fdabd1d282c, var_b01aca3236595958);
            if (issharedfuncdefined("seasonalevents", "getFeaturedLootEventActive")) {
                if (function_f3bb4f4911a1beb2("seasonalevents", "getFeaturedLootEventActive")) {
                    function_34708e1f426d9a19(player);
                }
            }
            if (isplayer(player)) {
                player namespace_6b49ddb858f34366::function_adcb155953291ec7(undefined, 1);
            }
        }
    }
    level thread function_79a4861772547bc2(team, remainingplayers, skipremainingplayers);
    foreach (player in teamplayers) {
        if (isdefined(player) && !istrue(player.extracted)) {
            player thread handlebrdefeatedpostgamestate(teamplacement);
            player setplacementstats(teamplacement);
            player stopchallengetimers();
            scripts\mp\gamelogic::_setplayerteamrank(player, teamplacement);
            updateclientmatchdata(player);
            if (istrue(level.var_77907d733abe8b63)) {
                player namespace_2c7976a64ea24d6a::match_end(teamplacement, 1, 0);
            }
        }
    }
    setaardata(team);
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10516
// Size: 0x1c6
function handlebrdefeatedpostgamestate(teamplacement) {
    player = self;
    player endon("disconnnect");
    if (isdefined(teamplacement)) {
        if (teamplacement < 4) {
            player scripts\cp_mp\pet_watch::addtop3brcharge();
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
                namespace_446fc987a980892f::playevent("streak_fail_single", [player], undefined, 1);
            } else {
                namespace_446fc987a980892f::playevent("streak_fail_multiple", [player], undefined, 1);
            }
        }
    }
    player setclientomnvar("ui_br_squad_eliminated_active", 1);
    player setclientomnvar("ui_round_end_title", game["round_end"]["defeat"]);
    player setclientomnvar("ui_round_end_reason", game["end_reason"]["br_eliminated"]);
    player setclientdvar(@"hash_cbb22e2fb1a57873", 1);
    if (istrue(level.var_82ef5f20ebbf6b59)) {
        player scripts\mp\gametypes\br_gametype_dmz::function_1a425272955d5f75();
        player scripts\mp\gametypes\br_gametype_dmz::function_865b1a5a62c49d7();
    }
    player scripts\mp\utility\lower_message::setlowermessageomnvar("clear_lower_msg");
    player notify("br_team_fully_eliminated");
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x106e4
// Size: 0xf7
function setplacementstats(teamplacement) {
    player = self;
    if (!isdefined(player) || istrue(player.placementstatsset)) {
        return;
    }
    player.placementstatsset = 1;
    player.teamplacement = teamplacement;
    player.pers["telemetry"].teamplacement = teamplacement;
    scripts\cp_mp\challenges::function_57f4ba1fd9ececba(player);
    if (teamplacement <= 25) {
        player scripts\mp\utility\stats::incpersstat("topTwentyFive", 1);
        if (teamplacement <= 10) {
            player scripts\mp\utility\stats::incpersstat("topTen", 1);
            if (teamplacement <= 5) {
                player scripts\mp\utility\stats::incpersstat("topFive", 1);
                if (teamplacement == 1) {
                    player scripts\mp\utility\stats::incpersstat("wins", 1);
                    if (namespace_a8b2b88699fc40fb::function_5a7168b0b511bec3(player)) {
                        player scripts\mp\utility\stats::incpersstat("weaponCaseWins", 1);
                        scripts\cp_mp\challenges::function_8359cadd253f9604(player, "weapons_case_win", 1);
                    }
                }
            }
        }
        player scripts\mp\gamelogic::updateplayerleaderboardstats();
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x107e3
// Size: 0x57
function getBRBonusXPperMillisecond() {
    var_5a3fb630188efac = 0.00162;
    if (getdvarint(@"hash_78c13a450d84f3c1", 0) == 1) {
        return getdvarfloat(@"hash_11afd7f54bfebd24", var_5a3fb630188efac);
    }
    if (scripts\mp\gametypes\br_gametypes::isbrgametypefuncdefined("getBRBonusXPperMillisecond")) {
        return scripts\mp\gametypes\br_gametypes::runbrgametypefunc("getBRBonusXPperMillisecond");
    }
    return var_5a3fb630188efac;
}

// Namespace br / scripts\mp\gametypes\br
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x10842
// Size: 0x328
function calculatebrbonusxp(teamplacement, inteam) {
    if (!scripts\mp\flags::gameflag("prematch_done")) {
        return [0, 0, 0];
    }
    if (scripts\mp\gametypes\br_gametypes::isbrgametypefuncdefined("calculateBonusXPOverride")) {
        return scripts\mp\gametypes\br_gametypes::runbrgametypefunc("calculateBonusXPOverride");
    }
    subgametype = getsubgametype();
    if (subgametype == "dmz" || subgametype == "exgm" || subgametype == "plunder" || subgametype == "risk" || subgametype == "kingslayer") {
        return [0, 0, 0];
    }
    var_cd8245b7e413feef = getBRBonusXPperMillisecond();
    if (!isdefined(level.startofxptime) || !isdefined(teamplacement) || !isdefined(level.xpperplayerpershare) || level.startofxptime <= 0 || teamplacement <= 0 || level.xpperplayerpershare <= 0) {
        return [0, 0, 0];
    }
    timeactive = gettime() - level.startofxptime;
    timexp = int(var_cd8245b7e413feef * timeactive + 0.5);
    placementxp = int(level.xpperplayerpershare * (level.xpteamsatmatchstart - teamplacement + 1));
    if (isdefined(self)) {
        if (isdefined(self.var_9afa50b51d5682f6)) {
            timexp -= self.var_9afa50b51d5682f6;
            self.var_9afa50b51d5682f6 += timexp;
        } else {
            self.var_9afa50b51d5682f6 = timexp;
        }
        if (isdefined(self.var_899c8788f1299a96)) {
            newplacement = int(max(self.var_899c8788f1299a96, placementxp));
            placementxp = int(max(0, newplacement - self.var_899c8788f1299a96));
            self.var_899c8788f1299a96 += placementxp;
        } else {
            self.var_899c8788f1299a96 = placementxp;
        }
    }
    logstring("PLACEMENT PART LOGa: time               =" + timeactive + "; timeXP=" + timexp + "; teamPlacement=" + teamplacement + "; placementXp=" + placementxp);
    logstring("PLACEMENT PART LOGb: xp_per_millisecond =" + var_cd8245b7e413feef + "; xpPerPlayerPerShare=" + level.xpperplayerpershare);
    if (isdefined(inteam)) {
        players = getteamdata(inteam, "players");
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
    rewardxp = timexp + placementxp;
    timexp = scripts\mp\rank::function_752af98b96c243e0(timexp);
    placementxp = scripts\mp\rank::function_752af98b96c243e0(placementxp);
    return [rewardxp, timexp, placementxp];
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10b73
// Size: 0x26
function resetchallengetimers() {
    scripts\cp_mp\challenges::resetchallengetimer("driving");
    scripts\cp_mp\challenges::resetchallengetimer("alive_in_gas");
    scripts\cp_mp\challenges::resetchallengetimer("alive_not_downed");
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10ba1
// Size: 0x26
function stopchallengetimers() {
    scripts\cp_mp\challenges::stopchallengetimer("driving");
    scripts\cp_mp\challenges::stopchallengetimer("alive_in_gas");
    scripts\cp_mp\challenges::stopchallengetimer("alive_not_downed");
}

// Namespace br / scripts\mp\gametypes\br
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x10bcf
// Size: 0x1b7
function givebrbonusxp(brbonusxp, objweapon, reason, var_b01aca3236595958) {
    if (!isdefined(self) || isbot(self) || istestclient(self)) {
        return;
    }
    if (!game["timePassed"]) {
        return;
    }
    if (!(matchmakinggame() || getdvarint(@"hash_37acf332efd205cc"))) {
        return;
    }
    subgametype = getsubgametype();
    if (subgametype == "dmz" || subgametype == "exgm" || subgametype == "plunder" || subgametype == "risk" || subgametype == "kingslayer") {
        return;
    }
    if (isdefined(self.brbonusxpallowed) && self.brbonusxpallowed == 0) {
        return;
    }
    /#
        if (isdefined(var_b01aca3236595958)) {
            logstring("<dev string:x1a8>" + var_b01aca3236595958);
        }
    #/
    suppresspopup = 0;
    if (!isdefined(reason)) {
        reason = "undefined";
    }
    switch (reason) {
    case #"hash_8a3297e83141974b": 
        suppresspopup = 1;
        break;
    case #"hash_58fc9e134ee88311": 
        suppresspopup = 1;
        break;
    case #"hash_2e41475963f16ce8":
    case #"hash_6201f99dbadb9e66": 
        suppresspopup = 1;
        break;
    case #"hash_b61583709daf623":
    default: 
        suppresspopup = 0;
        assertmsg("<dev string:x1ce>");
        break;
    }
    if (brbonusxp > 0) {
        forceimmediate = 1;
        scripts\mp\rank::giverankxp(#"hash_9be8184eb12293ba", brbonusxp, undefined, suppresspopup, forceimmediate, 1, var_b01aca3236595958);
        scripts\mp\gametypes\br_analytics::branalytics_bonusxp_debugdata(scripts\mp\rank::function_fe885eed6609e08a(brbonusxp, var_b01aca3236595958), reason);
    }
    self.brbonusxpallowed = 0;
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x10d8e
// Size: 0x65
function setplacementxpshare() {
    if (scripts\mp\gametypes\br_gametypes::isbrgametypefuncdefined("getPlacementXPShareValues")) {
        var_bfe6c062496ef847 = scripts\mp\gametypes\br_gametypes::runbrgametypefunc("getPlacementXPShareValues");
        min = var_bfe6c062496ef847[2];
        max = var_bfe6c062496ef847[1];
        pool = var_bfe6c062496ef847[0];
        function_690f2ce02fd51b3d(pool, max, min);
        return;
    }
    function_690f2ce02fd51b3d();
}

// Namespace br / scripts\mp\gametypes\br
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x10dfb
// Size: 0x1d4
function function_690f2ce02fd51b3d(overridepool, overridemax, overridemin) {
    var_e0f4d3685ff5c5bc = isdefined(overridepool) ? overridepool : 99250;
    var_2121aa51c2c8132e = isdefined(overridemax) ? overridemax : 80;
    var_409d356961c27474 = isdefined(overridemin) ? overridemin : 15;
    var_d176c6fa97ae9438 = var_e0f4d3685ff5c5bc;
    teamsize = max(1, level.maxteamsize);
    numberofteams = 0;
    foreach (entry in level.teamnamelist) {
        if (getteamdata(entry, "teamCount")) {
            numberofteams++;
        }
    }
    numberofteams = max(1, numberofteams);
    totalshares = int(numberofteams * (numberofteams + 1) / 2);
    totalshares = max(totalshares, 1);
    xpperplayerpershare = int(var_d176c6fa97ae9438 / totalshares * teamsize + 0.9);
    xpperplayerpershare = int(clamp(xpperplayerpershare, var_409d356961c27474, var_2121aa51c2c8132e));
    if (getdvarint(@"hash_4910824add4f33d9", 0) == 1) {
        xptouse = getdvarint(@"hash_bd328f0dbc44aacc", xpperplayerpershare);
    } else {
        xptouse = xpperplayerpershare;
    }
    logstring("PLACEMENT CALCULATION LOGa: placementPool=" + var_e0f4d3685ff5c5bc + "; numberOfTeams=" + numberofteams + "; totalShares=" + totalshares + "; xpPerPlayerPerShare=" + xpperplayerpershare + "; xpToUse=" + xptouse);
    level.xpperplayerpershare = xptouse;
    level.xpteamsatmatchstart = numberofteams;
    level.startofxptime = gettime();
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10fd7
// Size: 0x64
function giveweaponxpfromtimebr(awardtime) {
    var_b70ceb1820db04ac = getdvarfloat(@"hash_64ab4e1c10d28ab0", 0.0017);
    lastweaponobj = self.lastnormalweaponobj;
    value = int(awardtime * var_b70ceb1820db04ac);
    givebrweaponxp(#"", value, lastweaponobj, 1, 0);
}

// Namespace br / scripts\mp\gametypes\br
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x11043
// Size: 0xcb
function givebrweaponxp(type, value, objweapon, suppresspopup, forceimmediate) {
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
    if (!isdefined(suppresspopup)) {
        suppresspopup = 0;
    }
    if (!isdefined(forceimmediate)) {
        forceimmediate = 0;
    }
    if (!suppresspopup) {
        scripts\mp\utility\points::displayscoreeventpoints(value, type);
    }
    if (!level.playerxpenabled) {
        return;
    }
    thread waitandapplybrweaponxp(type, value, objweapon, forceimmediate);
}

// Namespace br / scripts\mp\gametypes\br
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x11116
// Size: 0x130
function waitandapplybrweaponxp(type, value, objweapon, forceimmediate) {
    self endon("disconnect");
    if (!isdefined(forceimmediate)) {
        forceimmediate = 0;
    }
    if (!forceimmediate) {
        waitframe();
        scripts\mp\utility\script::waittillslowprocessallowed();
    }
    weapon_xp = 0;
    if (!isdefined(objweapon) || !scripts\mp\weaponrank::weaponshouldgetxp(objweapon)) {
        return;
    }
    weapon_xp = value;
    weapon_xp *= scripts\mp\weaponrank::getweaponrankxpmultipliertotal();
    weapon_xp = int(weapon_xp);
    scripts\mp\rank::incrankxp(0, objweapon, weapon_xp, #"hash_9b80f8e3667071c1");
    if (level.playerxpenabled && !isai(self)) {
        if (isdefined(objweapon) && (scripts\mp\utility\weapon::iscacprimaryweapon(objweapon) || scripts\mp\utility\weapon::iscacsecondaryweapon(objweapon))) {
            var_7e2c53b0bcf117d9 = spawnstruct();
            var_7e2c53b0bcf117d9.weaponname = namespace_e0ee43ef2dddadaa::getweaponrootname(objweapon);
            var_7e2c53b0bcf117d9.fullweaponname = getcompleteweaponname(objweapon);
            var_7e2c53b0bcf117d9.statname = "xp_earned";
            var_7e2c53b0bcf117d9.incvalue = weapon_xp;
            var_7e2c53b0bcf117d9.variantid = -1;
            var_7e2c53b0bcf117d9.weaponobj = objweapon;
            namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_update_weapon_stats", var_7e2c53b0bcf117d9);
        }
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1124e
// Size: 0x87
function calculatepurchasexp(plunderspent, itemtype) {
    var_23c60c77cb5dc35b = getdvarint(@"hash_b6bd80ba75fa61af", 0);
    var_b50692d04e77586b = getdvarfloat(@"hash_e8d8c6b25c9b387", 80);
    plunderspent /= 100;
    xpvalue = var_23c60c77cb5dc35b + int(plunderspent * var_b50692d04e77586b);
    xpcap = getdvarint(@"hash_e3ca7808574d931b", 1000);
    if (xpvalue > xpcap) {
        xpvalue = xpcap;
    }
    return xpvalue;
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x112de
// Size: 0x67
function resetpostgamestateonjoinedspectators() {
    self endon("disconnect");
    starttime = gettime();
    if (!istrue(self.br_spectatorinitialized)) {
        self waittill("br_spectatorInitialized");
    }
    var_bad00f4b9d75dfbd = 3;
    deltasec = (gettime() - starttime) / 1000;
    if (deltasec < var_bad00f4b9d75dfbd) {
        wait var_bad00f4b9d75dfbd - deltasec;
    }
    self setclientomnvar("post_game_state", 0);
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1134d
// Size: 0x2c
function function_a587b0b0998c6d13() {
    return istrue(level.br_debugsolotest) || getsubgametype() == "dmz" || getsubgametype() == "exgm";
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11382
// Size: 0x93
function ononeleftevent(team) {
    if (function_a587b0b0998c6d13() || !function_227ca42a35b0398b(team)) {
        return;
    }
    if (level.teambased) {
        var_8a4678ac12287d01 = getlastlivingplayer(team);
        if (isdefined(var_8a4678ac12287d01)) {
            var_8a4678ac12287d01 delaythread(0.5, &scripts\mp\gametypes\br_public::brleaderdialog, "last_man_standing", 0, [var_8a4678ac12287d01]);
        }
        return;
    }
    level.lastplayerwins = getlastlivingplayer();
    level thread scripts\mp\gamelogic::endgame(level.lastplayerwins, game["end_reason"]["enemies_eliminated"]);
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1141d
// Size: 0x7f
function function_3eb5723089c90994(victim) {
    if (istrue(victim.brneverlanded) || istrue(victim.var_91a2b1303b861667)) {
        if (!isdefined(victim.consecutivesuicides)) {
            victim.consecutivesuicides = 1;
        } else {
            victim.consecutivesuicides++;
        }
        if (victim.consecutivesuicides >= getdvarint(@"hash_f43737c13c504e05", 5)) {
            level thread scripts\mp\teams::kickafkplayer(victim);
        }
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x114a4
// Size: 0xa5
function onsuicidedeath(victim) {
    if (!level.teambased) {
        liveplayers = getlivingplayers();
        victim.score = level.totalplayers - liveplayers.size;
        foreach (player in liveplayers) {
            player.score = victim.score + 1;
        }
    }
    function_3eb5723089c90994(victim);
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x11551
// Size: 0x24
function needdefaultendgameflowonly() {
    if (isdefined(level.forcedend)) {
        return (scripts\mp\gametypes\br_public::isBrPracticeMode() && level.forcedend);
    }
    return false;
}

// Namespace br / scripts\mp\gametypes\br
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1157e
// Size: 0xbdf
function brendgame(winner, endreasontext, nukedetonated) {
    if (level.gameended) {
        return;
    }
    waittillframeend();
    level.gameendtime = gettime();
    level.gameended = 1;
    level notify("game_ended");
    namespace_6b49ddb858f34366::function_adcb155953291ec7(undefined, 1);
    if (scripts\cp_mp\utility\game_utility::function_fa7bfcc1d68b7b73()) {
        level.var_c2111af4e4ece485 = 1;
    }
    if (isdefined(winner) && winner != "tie") {
        logstring("[KEY_MOMENT] gameEnded winner = " + winner);
    } else {
        logstring("[KEY_MOMENT] gameEnded");
    }
    if (scripts\mp\gametypes\br_public::function_d6ae35e0ce14bbaf()) {
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
    scripts\mp\gametypes\br_gulag::shutdowngulag("end_game", 0, 1);
    if (isBrPracticeMode()) {
        level.gameisending = 1;
    }
    scripts\mp\gametypes\br_vehicles::emptyallvehicles();
    thread scripts\mp\gametypes\br_gametypes::runbrgametypefunc("endGame", winner);
    if (needdefaultendgameflowonly()) {
        scripts\mp\gamelogic::endgame_regularmp(winner, endreasontext, game["end_reason"]["br_eliminated"], nukedetonated);
        return;
    }
    if (!istrue(nukedetonated) && istrue(level.var_ae3b17e71eb3bec7)) {
        if (!isdefined(level.finalkillcam_winner)) {
            level.finalkillcam_winner = winner;
        }
        thread scripts\mp\potg::onroundended(winner);
        thread scripts\mp\final_killcam::preloadfinalkillcam();
    }
    namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_altered_strain_eom");
    namespace_de6e6777b0937bd7::function_80820d6d364c1836("callback_altered_strain_eom_match");
    setomnvarforallclients("ui_br_transition_type", 0);
    winnerplayers = undefined;
    var_b01aca3236595958 = undefined;
    if (isdefined(winner) && winner != "tie") {
        winnerviewsetup();
        winnerplayers = [];
        teamplayers = getteamdata(winner, "players");
        foreach (teamplayer in teamplayers) {
            if (isdefined(teamplayer) && !istrue(teamplayer.extracted)) {
                winnerplayers[winnerplayers.size] = teamplayer;
            }
        }
        foreach (winningplayer in winnerplayers) {
            winningplayer scripts\engine\utility::function_f3bb4f4911a1beb2("scorpion_event", "player_win");
        }
        namespace_a8b2b88699fc40fb::function_25a4b6a2083e2ab(winnerplayers);
        var_4c15a6f75cc4a6d = 1;
        if (function_d6ae35e0ce14bbaf() && is_equal(endreasontext, 25)) {
            var_4c15a6f75cc4a6d = 0;
        }
        if (istrue(nukedetonated)) {
            var_4c15a6f75cc4a6d = 0;
        }
        if (var_4c15a6f75cc4a6d) {
            scripts\mp\gametypes\br_public::brleaderdialog("team_victory", 0, winnerplayers, undefined, 1.5);
        }
        scripts\mp\gametypes\br_ending::function_e50b941afd09e62e(winnerplayers);
        winnerplayers = array_combine(winnerplayers, level.var_c5877dbe60fddbf6);
        foreach (player in winnerplayers) {
            if (!isdefined(player)) {
                continue;
            }
            var_ec8d5227d5468742 = player calculatebrbonusxp(1, winner);
            var_d6a23fdabd1d282c = var_ec8d5227d5468742[2];
            var_1b70c48b930405f0 = var_ec8d5227d5468742[1];
            brbonusxp = var_ec8d5227d5468742[0];
            if (endreasontext == game["end_reason"]["nuke_end"]) {
                brbonusxp *= ter_op(isdefined(level.arrow), level.arrow.dvars.var_ecd0f4eb1e770d6c, 1);
            }
            var_b01aca3236595958 = function_87ecb716bc207294(player);
            if (istrue(player.inlaststand)) {
                if (player scripts\mp\laststand::finishreviveplayer("self_revive_on_kill_success", player)) {
                    player scripts\mp\laststand::onrevive(1);
                }
            }
            if (istrue(player.gasmaskequipped)) {
                player thread scripts\mp\gametypes\br_pickups::removegasmaskbr();
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
                teamindex = scripts\engine\utility::array_find(level.allteamnamelist, winner);
                player setclientomnvar("ui_br_player_position", teamindex);
            }
            player givebrbonusxp(brbonusxp, undefined, "winner", var_b01aca3236595958);
            player.matchbonus = scripts\mp\rank::function_c18c8bb0776284c6(var_1b70c48b930405f0, var_b01aca3236595958);
            player.placementbonus = scripts\mp\rank::function_9e1336d25eb66326(var_d6a23fdabd1d282c, var_b01aca3236595958);
            if (issharedfuncdefined("seasonalevents", "getFeaturedLootEventActive")) {
                if (function_f3bb4f4911a1beb2("seasonalevents", "getFeaturedLootEventActive")) {
                    function_34708e1f426d9a19(player);
                }
            }
            player scripts\cp_mp\pet_watch::addtop3brcharge();
            scripts\mp\gametypes\br_analytics::branalytics_inventory_snapshot(player, "player_win");
            player setplacementstats(1);
            player stopchallengetimers();
            scripts\mp\gamelogic::_setplayerteamrank(player, 0);
            player scripts\mp\gamelogic::updateplayerleaderboardstats();
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
        foreach (losingteam in level.teamnamelist) {
            if (losingteam == winner) {
                continue;
            }
            alivecount = function_99e3948bfd8a99b8(losingteam);
            if (alivecount > 0) {
                var_c77c36c19fc6c0c2 = array_add(var_c77c36c19fc6c0c2, losingteam);
            }
        }
        if (var_c77c36c19fc6c0c2.size > 0) {
            var_c77c36c19fc6c0c2 = array_sort_with_func(var_c77c36c19fc6c0c2, &scripts\mp\gametypes\br_ending::function_4b3d6ad67eba0f73);
            for (var_1e40d5d61118a436 = 0; var_1e40d5d61118a436 < var_c77c36c19fc6c0c2.size; var_1e40d5d61118a436++) {
                losingteam = var_c77c36c19fc6c0c2[var_1e40d5d61118a436];
                if (scripts\mp\gametypes\br_gametypes::isbrgametypefuncdefined("getGametypeTeamPlacement")) {
                    teamplacement = scripts\mp\gametypes\br_gametypes::runbrgametypefunc("getGametypeTeamPlacement", losingteam);
                } else {
                    teamplacement = var_1e40d5d61118a436 + 2;
                }
                onsquadeliminatedplacement(losingteam, teamplacement, undefined, 1);
            }
        }
        setaardata(winner);
        level notify("team_won", winner);
    } else {
        remainingteams = [];
        foreach (entry in level.teamnamelist) {
            if (getteamdata(entry, "aliveCount")) {
                remainingteams[remainingteams.size] = entry;
            }
        }
        teamplacement = remainingteams.size;
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
            var_ec88cb27d5416886 = player calculatebrbonusxp(teamplacement);
            var_d6a23fdabd1d282c = var_ec88cb27d5416886[2];
            var_1b70c48b930405f0 = var_ec88cb27d5416886[1];
            brbonusxp = var_ec88cb27d5416886[0];
            var_316b7c07d5e17e08 = function_87ecb716bc207294(player);
            player givebrbonusxp(brbonusxp, undefined, "endGame", var_316b7c07d5e17e08);
            if (issharedfuncdefined("seasonalevents", "getFeaturedLootEventActive")) {
                if (function_f3bb4f4911a1beb2("seasonalevents", "getFeaturedLootEventActive")) {
                    function_34708e1f426d9a19(player);
                }
            }
            player stopchallengetimers();
            player.spawnprotection = 1;
            player setclientomnvar("ui_br_player_position", 1);
            player namespace_88bfae359020fdd3::function_5b732dd6ab2ee2d6();
        }
        foreach (entry in remainingteams) {
            setaardata(entry);
        }
    }
    var_f7b694a4edf7dc9a = undefined;
    if (isdefined(winnerplayers)) {
        var_f7b694a4edf7dc9a = namespace_66f3c297681603ad::get_center_of_array(winnerplayers);
    }
    activeplayers = [];
    if (getdvarint(@"hash_82bde055b11e6698", 0)) {
        activeplayers = scripts\mp\gametypes\br_quest_util::getvalidplayersinarray(level.players, level.questinfo.defaultfilter);
    } else {
        foreach (potentialplayer in level.players) {
            if (!potentialplayer scripts\mp\gametypes\br_public::isplayeringulag() && isreallyalive(potentialplayer)) {
                activeplayers[activeplayers.size] = potentialplayer;
            }
        }
    }
    scripts\mp\gametypes\br_analytics::branalytics_economy_snapshot(activeplayers);
    function_89e9bd04f1ea27f3();
    if (!istrue(level.var_3aa0c134e5099b90)) {
        wait 1.5;
    }
    var_d1190ca89743235e = getdvarint(@"hash_dd208e4b059eae0f") != 1;
    if (scripts\cp_mp\utility\game_utility::function_fa7bfcc1d68b7b73() && isdefined(winnerplayers) && var_d1190ca89743235e) {
        foreach (player in level.players) {
            level thread scripts\cp_mp\utility\game_utility::fadetoblackforplayer(player, 1, 2);
        }
        wait 2;
        foreach (player in level.players) {
            level thread scripts\cp_mp\utility\game_utility::fadetoblackforplayer(player, 0, 0.1);
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
            level thread [[ level.var_79c116f876dc27eb ]](winnerplayers, var_f7b694a4edf7dc9a);
        }
        if (isdefined(level.br_ending_delay)) {
            wait level.br_ending_delay;
        }
        if (istrue(level.shownonspectatingwinnersplash)) {
            level thread handleendgamenonwinnersplash(winner, nukedetonated);
        }
    }
    scripts\mp\gametypes\br_gametypes::runbrgametypefunc("postEndGameSplash", winner);
    if (scripts\mp\gametypes\br_public::function_d6ae35e0ce14bbaf()) {
        if (isdefined(level.dmztutendgame)) {
            level thread [[ level.dmztutendgame ]](winner, endreasontext, game["end_reason"]["br_eliminated"]);
            return;
        }
    }
    if (!istrue(nukedetonated) && istrue(level.var_ae3b17e71eb3bec7)) {
        function_783cc7213b40c873();
    }
    thread function_b231ba80cd9da78e();
    function_a976ff9efe768b4(winnerplayers, var_f7b694a4edf7dc9a, nukedetonated);
    scripts\mp\gamelogic::endgame_regularmp(winner, endreasontext, game["end_reason"]["br_eliminated"]);
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12165
// Size: 0xa6
function function_783cc7213b40c873() {
    wait level.br_ending_delay;
    function_89e6ca15ec10115e();
    level.var_262278c955a4e742 = 1;
    level.var_ebb6ebb71ce4a007 = 1;
    endgame_showkillcam();
    level.var_ebb6ebb71ce4a007 = 0;
    foreach (player in level.players) {
        if (istrue(level.showingfinalkillcam)) {
            player scripts\mp\killcam::killcamcleanup(0, undefined, 1);
        }
        player clearclienttriggeraudiozone();
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x12213
// Size: 0x2f
function function_b231ba80cd9da78e() {
    var_eaf3ab5c681f642a = getdvarfloat(@"hash_2e566b9447582e8d", 90);
    if (var_eaf3ab5c681f642a < 0) {
        return;
    }
    wait var_eaf3ab5c681f642a;
    level notify("ending_scene_terminate");
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1224a
// Size: 0xb
function function_89e9bd04f1ea27f3() {
    level thread scripts\mp\gametypes\br_analytics::branalytics_endgame();
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1225d
// Size: 0xb
function winnerviewsetup(winners) {
    
}

// Namespace br / scripts\mp\gametypes\br
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x12270
// Size: 0x1d4
function handleendgamesplash(winner, nukedetonated, winnerplayers) {
    if (!isdefined(winnerplayers)) {
        winnerplayers = [];
        if (isdefined(winner) && winner != "tie") {
            winnerplayers = getteamdata(winner, "players");
            winnerplayers = array_combine(winnerplayers, level.var_c5877dbe60fddbf6);
        }
    }
    var_464dd76c6ecb56fa = scripts\mp\gamelogic::getbrendsplashpostgamestate();
    subgametype = getsubgametype();
    if (subgametype == "dmz" || subgametype == "exgm" || subgametype == "plunder" || subgametype == "risk" || subgametype == "kingslayer" || subgametype == "rumble_mgl") {
        thread scripts\mp\music_and_dialog::plunder_endgame_music();
    }
    winnerplayers = array_combine(winnerplayers, level.var_c5877dbe60fddbf6);
    foreach (player in winnerplayers) {
        player setclientomnvar("post_game_state", var_464dd76c6ecb56fa);
        player setclientomnvar("ui_br_end_game_splash_type", 1);
        if (istrue(nukedetonated)) {
            player setclientomnvar("ui_br_elite_ending", 1);
            if (!player iscodcaster()) {
                player setclientomnvar("ui_br_player_position", 1);
            } else {
                teamindex = scripts\engine\utility::array_find(level.allteamnamelist, winner);
                player setclientomnvar("ui_br_player_position", teamindex);
            }
            continue;
        }
        if (isdefined(level.arrow) && isdefined(level.arrow.defused)) {
            if (level.arrow.defused == 1) {
                level thread function_2cf9e62c94779216();
            }
        }
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1244c
// Size: 0x28
function function_2cf9e62c94779216() {
    wait 10;
    setomnvarforallclients("ui_br_elite_arrow_aar_state", 1);
    wait 5;
    setomnvarforallclients("ui_br_elite_arrow_aar_state", 2);
}

// Namespace br / scripts\mp\gametypes\br
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1247c
// Size: 0x143
function handleendgamespectatingsplash(winner, nukedetonated) {
    if (isdefined(winner) && winner != "tie") {
        var_464dd76c6ecb56fa = scripts\mp\gamelogic::getbrendsplashpostgamestate();
        foreach (player in level.players) {
            if (isdefined(player.playertospectate) && player.team != winner && !isdefined(player.hasseenendgamesplash)) {
                player setclientomnvar("post_game_state", var_464dd76c6ecb56fa);
                player setclientomnvar("ui_br_end_game_splash_type", 1);
                player.hasseenendgamesplash = 1;
                if (istrue(nukedetonated)) {
                    player setclientomnvar("ui_br_elite_ending", 1);
                    player setclientomnvar("ui_br_player_position", 2);
                    continue;
                }
                if (isdefined(level.arrow) && isdefined(level.arrow.defused)) {
                    if (level.arrow.defused == 1) {
                        level thread function_2cf9e62c94779216();
                    }
                }
            }
        }
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x125c7
// Size: 0x133
function handleendgamenonwinnersplash(winner, nukedetonated) {
    if (isdefined(winner) && winner != "tie") {
        var_464dd76c6ecb56fa = scripts\mp\gamelogic::getbrendsplashpostgamestate();
        foreach (player in level.players) {
            if (player.team != winner && !isdefined(player.hasseenendgamesplash)) {
                player setclientomnvar("post_game_state", var_464dd76c6ecb56fa);
                player setclientomnvar("ui_br_end_game_splash_type", 1);
                player.hasseenendgamesplash = 1;
                if (istrue(nukedetonated)) {
                    player setclientomnvar("ui_br_elite_ending", 1);
                    player setclientomnvar("ui_br_player_position", 2);
                    continue;
                }
                if (isdefined(level.arrow) && isdefined(level.arrow.defused)) {
                    if (level.arrow.defused == 1) {
                        level thread function_2cf9e62c94779216();
                    }
                }
            }
        }
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x12702
// Size: 0x46
function function_a976ff9efe768b4(winnerplayers, var_f7b694a4edf7dc9a, nukedetonated) {
    level endon("ending_scene_terminate");
    if (isdefined(winnerplayers) && isdefined(var_f7b694a4edf7dc9a)) {
        if (istrue(nukedetonated)) {
            namespace_6c622b52017c6808::function_f6e0bdd81a472b97(winnerplayers);
            return;
        }
        scripts\mp\gametypes\br_ending::play_ending(winnerplayers, var_f7b694a4edf7dc9a);
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12750
// Size: 0x13
function function_ab41acc7ac2f6642(var_421750c958bd3064) {
    return var_421750c958bd3064 & 256 - 1;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1276c
// Size: 0x19
function function_86081f65c04e8ebe(var_421750c958bd3064) {
    return (var_421750c958bd3064 & 256 - 1 << 8) >> 8;
}

// Namespace br / scripts\mp\gametypes\br
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1278e
// Size: 0x57
function function_7c646c29ea7fcb5a(itemtype, itemindex) {
    if (itemtype == 10) {
        var_ec95d227d54f8c70 = namespace_aead94004cf4c147::function_6738846da50730f1(itemindex);
        quantity = var_ec95d227d54f8c70[1];
        lootid = var_ec95d227d54f8c70[0];
        if (scripts\mp\gametypes\br_pickups::function_f96674ba1a1ec2b3(lootid)) {
            return true;
        }
    }
    return false;
}

// Namespace br / scripts\mp\gametypes\br
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x127ee
// Size: 0x1052
function function_db908ecaccbe933c(notification, var_421750c958bd3064) {
    if (istrue(level.infilcinematicactive) || istrue(self.jailed)) {
        return;
    }
    if (istrue(self.isjuggernaut)) {
        if (var_421750c958bd3064 == 256 || var_421750c958bd3064 == 257) {
            return;
        }
        if (issharedfuncdefined("br_juggernaut", "shouldHandleInventoryNotification")) {
            if (!istrue(function_f3bb4f4911a1beb2("br_juggernaut", "shouldHandleInventoryNotification", notification, var_421750c958bd3064))) {
                return;
            }
        }
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
                    scripts\mp\hud_message::showerrormessage(level.br_pickups.var_355cddb773cb000d);
                }
                break;
            }
            if (scripts\cp_mp\utility\player_utility::isinvehicle()) {
                if (isdefined(level.br_pickups.var_7c27d71dbf683991)) {
                    scripts\mp\hud_message::showerrormessage(level.br_pickups.var_7c27d71dbf683991);
                }
                break;
            }
            if (namespace_92fc655e328c1a9f::function_5711a00587f71794(self) && (namespace_92fc655e328c1a9f::function_1225f23a18664f4c(self) || itemtype != 1)) {
                namespace_92fc655e328c1a9f::function_80bada2833945a7a(itemtype, itemindex);
            } else {
                thread scripts\mp\gametypes\br_pickups::quickdropitem(itemtype, itemindex);
            }
            if (isdefined(self.var_2fa5b49969def47) && isdefined(self.var_2fa5b49969def47.containertype) && self.var_2fa5b49969def47.containertype == 14) {
                thread scripts\mp\gametypes\br_pickups::function_f7e756154ec35632(itemtype, itemindex);
            }
            break;
        case #"hash_24d3e929a240e2d7": 
            itemtype = function_86081f65c04e8ebe(var_421750c958bd3064);
            itemindex = function_ab41acc7ac2f6642(var_421750c958bd3064);
            if (istrue(self.insertingarmorplate) && itemtype == 2 && "health" == scripts\mp\equipment::function_4967838290cb31b9(itemindex)) {
                break;
            }
            if (!function_420ec7054801a5bd(itemtype, itemindex)) {
                break;
            }
            if (istrue(self.var_859654e0445a36d9) && itemtype == 1) {
                if (isdefined(level.br_pickups.var_355cddb773cb000d)) {
                    scripts\mp\hud_message::showerrormessage(level.br_pickups.var_355cddb773cb000d);
                }
                break;
            }
            if (scripts\cp_mp\utility\player_utility::isinvehicle() && !scripts\mp\gametypes\br::function_7c646c29ea7fcb5a(itemtype, itemindex)) {
                if (isdefined(level.br_pickups.var_7c27d71dbf683991)) {
                    scripts\mp\hud_message::showerrormessage(level.br_pickups.var_7c27d71dbf683991);
                }
                break;
            }
            if (namespace_92fc655e328c1a9f::function_5711a00587f71794(self) && (namespace_92fc655e328c1a9f::function_1225f23a18664f4c(self) || itemtype != 1)) {
                namespace_92fc655e328c1a9f::function_80bada2833945a7a(itemtype, itemindex, undefined, 1);
            } else {
                scripts\mp\gametypes\br_pickups::quickdropall(itemtype, itemindex);
            }
            if (isdefined(self.var_2fa5b49969def47) && isdefined(self.var_2fa5b49969def47.containertype) && self.var_2fa5b49969def47.containertype == 14) {
                thread scripts\mp\gametypes\br_pickups::function_f7e756154ec35632(itemtype, itemindex);
            }
            break;
        case #"hash_344a8be1e67f4848": 
            itemtype = function_86081f65c04e8ebe(var_421750c958bd3064);
            itemindex = function_ab41acc7ac2f6642(var_421750c958bd3064);
            if (!function_420ec7054801a5bd(itemtype, itemindex, 1)) {
                break;
            }
            if (itemtype == 1 && itemindex == 2) {
                activeweapon = scripts\mp\gametypes\br_weapons::function_27ef2c36eb95d796();
                if (function_f32857a938336f2b(self, activeweapon)) {
                    break;
                }
                namespace_aead94004cf4c147::function_f5a1a13f0181bb66(self, undefined, 1);
            } else {
                thread scripts\mp\gametypes\br_pickups::function_cab3366841d709aa(itemindex);
            }
            break;
        case #"hash_57241c1e1ceb332d": 
            itemtype = function_86081f65c04e8ebe(var_421750c958bd3064);
            itemindex = function_ab41acc7ac2f6642(var_421750c958bd3064);
            if (itemtype == 10) {
                scripts\mp\gametypes\br_pickups::function_f1a38d2ba0bbcb08(self, itemindex);
            }
            break;
        case #"hash_3319419c6206a325": 
            itemtype = function_86081f65c04e8ebe(var_421750c958bd3064);
            itemindex = function_ab41acc7ac2f6642(var_421750c958bd3064);
            if (itemtype == 10) {
                scripts\mp\gametypes\br_pickups::function_f1a38d2ba0bbcb08(self, itemindex, 1);
            }
            break;
        case #"hash_ea4a05d8dc5311f9": 
            scripts\mp\gametypes\br_pickups::function_64f0398b29cf7c3e(self);
            break;
        case #"hash_df97645422cac8a6": 
            itemtype = function_86081f65c04e8ebe(var_421750c958bd3064);
            itemindex = function_ab41acc7ac2f6642(var_421750c958bd3064);
            if (itemtype != 1) {
                break;
            }
            if (istrue(self.var_859654e0445a36d9) && isdefined(level.br_pickups.var_355cddb773cb000d)) {
                scripts\mp\hud_message::showerrormessage(level.br_pickups.var_355cddb773cb000d);
                break;
            }
            var_17d89f18c1d0eb4f = scripts\mp\gametypes\br_pickups::function_13ecf3644442a3e7(self, itemindex);
            switchindex = ter_op(itemindex == 1, 0, 1);
            weapontoswitch = scripts\mp\gametypes\br_pickups::function_13ecf3644442a3e7(self, switchindex);
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
            pastteam = function_86a5c7670325346b(self, itemindex);
            namespace_aead94004cf4c147::function_705889b7586cf34e(self, var_17d89f18c1d0eb4f, itemindex);
            function_ae30366a2d519a57(self, itemindex, undefined);
            function_ae30366a2d519a57(self, 2, pastteam);
            self takeweapon(var_17d89f18c1d0eb4f);
            fistsweapon = undefined;
            if (!self hasweapon("iw9_me_fists_mp")) {
                fistsweapon = makeweapon("iw9_me_fists_mp");
                self giveweapon(fistsweapon);
            }
            if (isdefined(weapontoswitch)) {
                self switchtoweapon(weapontoswitch);
            } else if (isdefined(fistsweapon)) {
                self switchtoweapon(fistsweapon);
            }
            break;
        case #"hash_21120d09fe99acc5": 
            if (istrue(self.gulagarena) && !level.var_43307855f189eb31.var_ef02a6ec3343c9bd) {
                scripts\mp\hud_message::showerrormessage("MP_BR_INGAME/CANNOT_STOW_IN_GULAG");
                break;
            }
            stowlootid = var_421750c958bd3064;
            var_a23a9d12025e9230 = getentitylessscriptablearray(undefined, undefined, self.origin, 110);
            sameitems = [];
            foreach (scriptable in var_a23a9d12025e9230) {
                if (!scriptable getscriptableisloot() && (!isdefined(scriptable.type) || isdefined(scriptable.type) && scriptable.type != "brloot_weapon_pi_decho_golden")) {
                    continue;
                }
                lootid = undefined;
                iscustomweapon = 0;
                scriptablename = scripts\mp\gametypes\br_pickups::lootgetscriptablename(scriptable);
                if (isdefined(scriptable.type) && scriptable getscriptablehaspart(scriptable.type) && scriptable getscriptablepartstate(scriptable.type) == "hidden") {
                    continue;
                }
                if (isweaponpickup(scriptablename)) {
                    if (!scripts\mp\loot::isweaponitem(stowlootid)) {
                        continue;
                    }
                    if (isdefined(scriptable.customweaponname)) {
                        lootid = namespace_e0ee43ef2dddadaa::function_b0d37b9be0027733(scriptable.customweaponname);
                        iscustomweapon = 1;
                    } else {
                        weaponobj = getfullweaponobjforpickup(scriptable);
                        lootid = namespace_e0ee43ef2dddadaa::getweaponlootid(weaponobj);
                    }
                } else {
                    lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(scriptablename);
                }
                if (isdefined(lootid) && (stowlootid == lootid || iscustomweapon)) {
                    sameitems[sameitems.size] = scriptable;
                }
            }
            var_5d9d8662fc4251b8 = undefined;
            if (sameitems.size == 1) {
                var_5d9d8662fc4251b8 = sameitems[0];
            } else if (sameitems.size > 1) {
                var_2b5718884854aa2b = 0;
                playerforward = anglestoforward(self getplayerangles());
                foreach (scriptable in sameitems) {
                    directionvec = scriptable.origin - self.origin;
                    normalizedvec = vectornormalize(directionvec);
                    angle = vectordot(playerforward, normalizedvec);
                    if (angle > 0 && angle > var_2b5718884854aa2b) {
                        var_2b5718884854aa2b = angle;
                        var_5d9d8662fc4251b8 = scriptable;
                    }
                }
            }
            namespace_aead94004cf4c147::function_a763f6f503206771(self, var_5d9d8662fc4251b8, stowlootid);
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
            scriptablename = loot::getScriptableFromLootID(lootid);
            if (isdefined(scriptablename)) {
                if (!namespace_aead94004cf4c147::function_7e103028c464ab9a(scriptablename)) {
                    break;
                }
            }
            scripts\mp\gametypes\br_pickups::lootitem(lootid, quantity, undefined, 1, 1, 1);
            thread scripts\mp\gametypes\br_pickups::quickdropall(itemtype, itemindex, 1);
            if (isdefined(self.var_2fa5b49969def47) && isdefined(self.var_2fa5b49969def47.containertype) && self.var_2fa5b49969def47.containertype == 14) {
                thread scripts\mp\gametypes\br_pickups::function_f7e756154ec35632(itemtype, itemindex);
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
            ammotype = scripts\mp\gametypes\br_weapons::br_ammo_type_for_weapon(weap);
            if (isdefined(ammotype) && isdefined(self.br_ammo[ammotype]) && self.br_ammo[ammotype] > 0) {
                stacksize = level.br_pickups.counts[ammotype];
                if (!isdefined(stacksize)) {
                    break;
                }
                var_1f11155517c54c34 = int(min(self.br_ammo[ammotype], stacksize));
                var_74806f0c4caa7e55 = var_1f11155517c54c34;
                currentweaponstock = ter_op(itemindex == 2, self.br_ammo[ammotype], self getweaponammostock(weap));
                if (self.br_ammo[ammotype] > currentweaponstock) {
                    var_74806f0c4caa7e55 = var_1f11155517c54c34 + self.br_ammo[ammotype] - currentweaponstock;
                    if (var_74806f0c4caa7e55 > self.br_ammo[ammotype]) {
                        var_1f11155517c54c34 = currentweaponstock;
                        var_74806f0c4caa7e55 = self.br_ammo[ammotype];
                    }
                }
                if (var_1f11155517c54c34 > 0) {
                    quickdropnewitem(10, ammotype, var_1f11155517c54c34);
                }
                scripts\mp\gametypes\br_weapons::br_ammo_take_type(self, ammotype, var_74806f0c4caa7e55);
            }
            break;
        case #"hash_970fe96b5f1fa60b": 
            itemtype = function_86081f65c04e8ebe(var_421750c958bd3064);
            itemindex = function_ab41acc7ac2f6642(var_421750c958bd3064);
            if (!function_420ec7054801a5bd(itemtype, itemindex)) {
                break;
            }
            if (scripts\mp\loot::function_6f45e7311f77eac4(self)) {
                break;
            }
            loadoutdata = namespace_aead94004cf4c147::function_cf1bef64e94f2d1a(itemtype, itemindex);
            if (!isdefined(loadoutdata)) {
                break;
            }
            lootid = loadoutdata[0];
            quantity = loadoutdata[1];
            if (itemtype == 6 && quantity > 0) {
                namespace_8beea18646ea4c36::function_ca27f3fd3dad0c1f();
            }
            thread scripts\mp\gametypes\br_pickups::quickdropall(itemtype, itemindex, 1);
            scriptablename = namespace_38b993c4618e76cd::getScriptableFromLootID(lootid);
            dropinfo = scripts\mp\gametypes\br_pickups::getitemdropinfo(self.origin, self.angles);
            pickup = spawnpickup(scriptablename, dropinfo, quantity, 0);
            if (pickup getscriptableparthasstate(scriptablename, "hidden")) {
                pickup setscriptablepartstate(scriptablename, "hidden");
            }
            tmpcontainer = pickup;
            tmpcontainer.contents = [];
            tmpcontainer.containertype = 14;
            tmpcontainer.contents[0] = [];
            tmpcontainer.contents[0]["quantity"] = pickup.count;
            tmpcontainer.contents[0]["lootID"] = lootid;
            tmpcontainer.loadoutcontainer = 1;
            tmpcontainer.itemtype = itemtype;
            tmpcontainer.itemindex = itemindex;
            scripts\mp\loot::function_68ca06034b8aaccd(self, tmpcontainer);
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
            firstindex = function_86081f65c04e8ebe(var_421750c958bd3064);
            secondindex = function_ab41acc7ac2f6642(var_421750c958bd3064);
            if (istrue(self.var_859654e0445a36d9) && isdefined(level.br_pickups.var_355cddb773cb000d)) {
                scripts\mp\hud_message::showerrormessage(level.br_pickups.var_355cddb773cb000d);
                break;
            }
            if (namespace_708f627020de59d3::function_c0d385a09d173a36()) {
                customdata1 = namespace_708f627020de59d3::function_3634d41e203bc04e(firstindex);
                customdata2 = namespace_708f627020de59d3::function_3634d41e203bc04e(secondindex);
                if (isdefined(customdata1) && isdefined(customdata1.perks)) {
                    namespace_708f627020de59d3::function_222999aad19f5b52(secondindex, customdata1.perks);
                    namespace_708f627020de59d3::function_e8fd3389a3f6433a(firstindex);
                }
                if (isdefined(customdata2) && isdefined(customdata2.perks)) {
                    namespace_708f627020de59d3::function_222999aad19f5b52(firstindex, customdata2.perks);
                    if (!isdefined(customdata1)) {
                        namespace_708f627020de59d3::function_e8fd3389a3f6433a(secondindex);
                    }
                }
            }
            namespace_aead94004cf4c147::function_68bca2c2e9f0a1d3(firstindex, secondindex);
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
                scripts\mp\hud_message::showerrormessage(level.br_pickups.var_355cddb773cb000d);
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
                scripts\mp\hud_message::showerrormessage(level.br_pickups.var_355cddb773cb000d);
                break;
            }
            var_6b280abe56564ac7 = self.primaryweapons[var_421750c958bd3064];
            if (!function_1e9278ba699927f7(var_6b280abe56564ac7)) {
                namespace_aead94004cf4c147::function_f5a1a13f0181bb66(self, var_6b280abe56564ac7, 1);
            }
            break;
        case #"hash_4779239eb81d617b": 
            inventoryindex = var_421750c958bd3064 & 255;
            containerindex = var_421750c958bd3064 >> 8;
            activeweapon = self getcurrentweapon();
            if (function_f32857a938336f2b(self, activeweapon)) {
                break;
            }
            if (istrue(self.var_859654e0445a36d9) && isdefined(level.br_pickups.var_355cddb773cb000d)) {
                scripts\mp\hud_message::showerrormessage(level.br_pickups.var_355cddb773cb000d);
                break;
            }
            namespace_aead94004cf4c147::function_51301c83420d42b4(inventoryindex, containerindex);
            break;
        case #"hash_95263a53b172f2e6": 
            containerindex = var_421750c958bd3064 >> 8;
            backpackindex = var_421750c958bd3064 & 255;
            namespace_aead94004cf4c147::function_ce92a41b8f3b666f(backpackindex, containerindex);
            break;
        case #"hash_71baeb7015ce2552": 
            backpackindex = var_421750c958bd3064 & 1023;
            var_421750c958bd3064 >>= 10;
            itemindex = var_421750c958bd3064 & 1023;
            var_421750c958bd3064 >>= 10;
            itemtype = var_421750c958bd3064 & 1023;
            namespace_aead94004cf4c147::function_9f1f9042105e4240(itemtype, itemindex, backpackindex);
            break;
        default: 
            break;
        }
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x13848
// Size: 0x1d9
function function_420ec7054801a5bd(itemtype, itemindex, equip) {
    if (!function_ad443bbcdcf37b85(self)) {
        return false;
    }
    if (istrue(self.insertingarmorplate) && itemtype == 2 && "health" == scripts\mp\equipment::function_4967838290cb31b9(itemindex)) {
        return false;
    }
    issuper = 0;
    isequipmentitem = 0;
    if (itemtype == 10 && istrue(equip)) {
        var_ec915127d54a7ae6 = namespace_aead94004cf4c147::function_6738846da50730f1(itemindex);
        quantity = var_ec915127d54a7ae6[1];
        lootid = var_ec915127d54a7ae6[0];
        lootid = default_to(lootid, 0);
        scriptablename = namespace_38b993c4618e76cd::getScriptableFromLootID(lootid);
        if (isdefined(scriptablename)) {
            issuper = issuperpickup(scriptablename);
            isequipmentitem = isequipment(scriptablename);
        }
    }
    heldoffhand = self getheldoffhand();
    if (isdefined(heldoffhand) && !isnullweapon(heldoffhand)) {
        return false;
    }
    if ((self isthrowinggrenade() || self isgestureplaying("ges_vm_offhand_1h_stim_inject")) && (itemtype == 2 || itemtype == 4 || issuper || isequipmentitem)) {
        return false;
    }
    if (namespace_e0ee43ef2dddadaa::iskillstreakweapon(self getcurrentweapon())) {
        return false;
    }
    if (itemtype == 10 && isdefined(self.var_e0c39101bfc15d2) && istrue(self.var_e0c39101bfc15d2[itemindex])) {
        return false;
    }
    if (itemtype == 4 && (scripts\mp\supers::issuperinuse() || scripts\mp\supers::function_565913010c84ffca())) {
        loadoutdata = namespace_aead94004cf4c147::function_cf1bef64e94f2d1a(itemtype, itemindex);
        lootid = loadoutdata[0];
        quantity = loadoutdata[1];
        if (!isdefined(lootid) || !isdefined(quantity) || lootid == 0 || quantity == 0) {
            return false;
        }
        scriptablename = namespace_38b993c4618e76cd::getScriptableFromLootID(lootid);
        if (!scripts\mp\gametypes\br_pickups::function_1be34022a4acce73(scriptablename)) {
            return false;
        }
    }
    return true;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13a2a
// Size: 0xc1
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
    isequipmentitem = isequipment(scriptablename);
    var_36de08ea672b354c = function_36de08ea672b354c(scriptablename);
    if ((self isthrowinggrenade() || self isgestureplaying("ges_vm_offhand_1h_stim_inject")) && (issuper || isequipmentitem)) {
        return 0;
    }
    if (istrue(scripts\mp\supers::issuperdisabled()) && issuper) {
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

// Namespace br / scripts\mp\gametypes\br
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x13af4
// Size: 0x42
function function_f32857a938336f2b(player, weapontocheck) {
    return isdefined(player) && isdefined(player.var_55562bd5eb6065e5) && isdefined(weapontocheck) && player.var_55562bd5eb6065e5 != player getweaponammoclip(weapontocheck);
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13b3f
// Size: 0x18
function get_int_or_0(value) {
    if (!isdefined(value)) {
        return 0;
    }
    return int(value);
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13b60
// Size: 0xc4
function parachutecomplete() {
    if (brdoesloadoutoptionusedropbags() && !brareloadoutdropbagsdelayed() && !istrue(self.dropbagspawned) && !istrue(level.precomputeddropbags)) {
        if (scripts\mp\gametypes\br_public::isplayerbrsquadleader()) {
            thread scripts\mp\gametypes\br_rewards::spawndropbagonlanding();
            foreach (player in level.teamdata[self.team]["players"]) {
                player.dropbagspawned = 1;
            }
        }
    }
    if (scripts\mp\flags::gameflag("prematch_done")) {
        thread scripts\mp\gametypes\br_armory_kiosk::showdiscountsplash(5);
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x13c2c
// Size: 0x5e
function spawnintermission(spawnorigin, spawnangles) {
    scripts\mp\playerlogic::setspawnvariables();
    self freezecontrols(1);
    updatesessionstate("intermission");
    clearkillcamstate();
    self.friendlydamage = undefined;
    self spawn(spawnorigin, spawnangles);
    printspawnmessage("playerlogic::spawnIntermission() !!!CODE SPAWN!!! @" + spawnorigin);
    setdof_spectator();
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13c92
// Size: 0x118
function brprewaitandspawnclient(revivespawn) {
    if (!isdefined(self.prespawnspawn) || self isplayerheadless()) {
        self setclientomnvar("ui_br_extended_load_screen", 0);
        return;
    }
    thread brprewaitandspawnclientcleanup();
    if (!isdefined(self.initialprespawn) && !istrue(revivespawn)) {
        streamorigin = self.prespawnspawn.origin;
        droporigin = playerstreamhintdroptoground(streamorigin);
        timeout = getdvarint(@"hash_6ce81e74109af8d3", 9000);
        playerstreamhintlocation(droporigin, timeout, 1);
        if (!istrue(level.x1playertransition) && !istrue(self.x1playertransition)) {
            scripts\mp\gametypes\br::function_258c4f40dee8189a();
            self setclientomnvar("ui_br_transition_type", 4);
        }
        wait 0.5;
        spawnintermission(droporigin, self.prespawnspawn.angles);
        scripts\mp\spectating::setdisabled();
    } else {
        self.initialprespawn = undefined;
    }
    playerwaittillstreamhintcomplete();
    self freezecontrols(0);
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13db2
// Size: 0x27
function function_6760d3783dfac7dd(revivespawn) {
    playerwaittillstreamhintcomplete();
    self setclientomnvar("ui_br_extended_load_screen", 0);
    self freezecontrols(0);
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13de1
// Size: 0x48
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

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13e31
// Size: 0xc
function brprematchaddkill() {
    self.kills++;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13e45
// Size: 0x26
function bronattackerdamagenottracked(damage) {
    if (!scripts\mp\flags::gameflag("prematch_done")) {
        scripts\mp\utility\stats::incpersstat("damage", damage);
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x13e73
// Size: 0xfd
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
        player scripts\mp\gametypes\br_public::updatebrscoreboardstat("missionsCompleted", 0);
        player.pers["damage"] = 0;
        player scripts\mp\gametypes\br_public::updatebrscoreboardstat("damageDealt", 0);
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x13f78
// Size: 0xc9
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

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14049
// Size: 0x42
function function_4f4b9a3c68af0f7b(timeoutval) {
    notifystruct = spawnstruct();
    thread function_d031b5b9bf72725b(notifystruct);
    thread function_fdc0cf0e13ef442b(notifystruct, timeoutval);
    notifystruct waittill("waittill_proc");
    return notifystruct.result;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14094
// Size: 0x4f
function function_d031b5b9bf72725b(notifystruct) {
    notifystruct endon("waittill_proc");
    channel, newclass = self waittill("luinotifyserver");
    notifystruct.result = [channel, newclass];
    notifystruct notify("waittill_proc");
}

// Namespace br / scripts\mp\gametypes\br
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x140eb
// Size: 0x24
function function_fdc0cf0e13ef442b(notifystruct, timeoutval) {
    notifystruct endon("waittill_proc");
    wait timeoutval;
    notifystruct notify("waittill_proc");
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14117
// Size: 0x267
function playerselectspawnclass() {
    self endon("death_or_disconnect");
    self endon("last_stand_start");
    self endon("halo_kick_c130");
    level endon("game_ended");
    level endon("end_spawn_selection");
    if (getdvarint(@"hash_206a763969420ce0", 0) == 1 && scripts\cp_mp\utility\game_utility::isbrstylegametype() && getsubgametype() != "dmz" && getsubgametype() != "exgm" && getsubgametype() != "plunder" && getsubgametype() != "risk" && getsubgametype() != "sandbox" && getsubgametype() != "rumble_mgl") {
        var_891d91911e4c1ade = isdefined(level.allowclasschoicefunc) && istrue(self [[ level.allowclasschoicefunc ]]());
        scripts\mp\utility\script::demoforcesre("playerSelectSpawnClass() " + self.name + " ui_options_menu = 2, allowClassChoiceFunc = " + var_891d91911e4c1ade);
    }
    self setclientomnvar("ui_options_menu", 2);
    initialchoice = "custom1";
    self.pers["class"] = initialchoice;
    self.class = initialchoice;
    scripts\mp\class::preloadandqueueclass(initialchoice);
    var_646a3262e2aa2948 = getdvarfloat(@"hash_6f432a1782beb1", 10);
    var_5493cf7a76ff4176 = 0;
    var_9c35ba153f8c42 = var_646a3262e2aa2948 > 0;
    while (true) {
        channel = undefined;
        newclass = undefined;
        if (var_9c35ba153f8c42) {
            result = function_4f4b9a3c68af0f7b(1);
            if (!isdefined(result)) {
                var_5493cf7a76ff4176 += 1;
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
            channel, newclass = self waittill("luinotifyserver");
        }
        if (channel == "exit_loadout_bag") {
            return 0;
        } else if (channel != "class_select") {
            continue;
        }
        retval = 0;
        if (newclass >= 0) {
            newclasschoice = scripts\mp\menus::getclasschoice(newclass);
            self.pers["class"] = newclasschoice;
            self.class = newclasschoice;
            scripts\mp\class::preloadandqueueclass(newclasschoice);
            retval = 1;
        }
        self setclientomnvar("ui_options_menu", 0);
        return retval;
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14386
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

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x143d3
// Size: 0x164
function monitorjumpmasterclaim() {
    player = self;
    player endon("disconnect");
    player thread listenforjumpmasterclaimluanotify();
    for (var_9770425da56e6488 = 0; !scripts\mp\flags::gameflag("end_spawn_selection"); var_9770425da56e6488 = 1) {
        msg = player waittill_any_ents_return(player, "attempt_jumpmaster_claim", player, "squad_jumpmaster_claimed", level, "end_spawn_selection");
        if (msg == "attempt_jumpmaster_claim") {
            if (!var_9770425da56e6488) {
                player scripts\mp\gametypes\br_public::updatebrscoreboardstat("jumpMasterState", 2);
                player.issquadleader = 1;
                player scripts\mp\utility\lower_message::setlowermessageomnvar("br_player_is_jumpmaster");
                members = getfriendlyplayers(player.team, 0);
                foreach (member in members) {
                    if (member != player) {
                        member.issquadleader = 0;
                        member scripts\mp\gametypes\br_public::updatebrscoreboardstat("jumpMasterState", 0);
                        member notify("squad_jumpmaster_claimed");
                        member scripts\mp\utility\lower_message::setlowermessageomnvar("br_teammate_is_jumpmaster");
                    }
                }
            } else {
                player scripts\mp\gametypes\br_public::updatebrscoreboardstat("jumpMasterState", 1);
                player scripts\mp\utility\lower_message::setlowermessageomnvar("br_player_deploy_solo");
            }
            continue;
        }
        if (msg == "squad_jumpmaster_claimed") {
        }
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1453f
// Size: 0x5f
function listenforjumpmasterclaimluanotify() {
    player = self;
    level endon("game_ended");
    player endon("disconnect");
    player notify("listenClaimJumpMaster");
    player endon("listenClaimJumpMaster");
    level endon("end_spawn_selection");
    while (true) {
        notification = player waittill("luinotifyserver");
        if (notification == "attempt_jumpmaster_claim") {
            player notify("attempt_jumpmaster_claim");
        }
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x145a6
// Size: 0x4a
function sendafksquadmembertogulag() {
    player = self;
    player.br_infilstarted = 1;
    player setclientomnvar("ui_br_infil_started", 1);
    player setclientomnvar("ui_br_infiled", 1);
    player scripts\cp_mp\utility\player_utility::function_6fb380927695ee76(1);
    player kill();
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x145f8
// Size: 0x45
function br_displayperkinfo() {
    self endon("disconnect");
    if (isdefined(level.isstandardsandbox) && !level.isstandardsandbox) {
        return;
    }
    self setclientomnvar("ui_br_display_perk_info", 1);
    wait 0.1;
    self setclientomnvar("ui_br_display_perk_info", 0);
}

// Namespace br / scripts\mp\gametypes\br
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x14645
// Size: 0x61d
function br_giveselectedclass(player, dropcurrent, dropbehind) {
    player.gettingloadout = 1;
    struct = undefined;
    if (isdefined(player.preloadedclassstruct)) {
        struct = player.preloadedclassstruct;
        player.preloadedclassstruct = undefined;
    } else {
        struct = player loadout_getclassstruct();
        struct = player loadout_updateclass(struct, player.class);
    }
    struct = player scripts\mp\validation::validateloadout(struct);
    player.classstruct = struct;
    inlaststand = istrue(player.inlaststand);
    var_2a7cb5348d575b6c = player function_29631935be756574("primary");
    var_e8a57369c51048ac = player function_29631935be756574("secondary");
    var_c4b556d701b0775c = var_2a7cb5348d575b6c != 1;
    var_5c916ba3a4d6bbac = var_e8a57369c51048ac != 1;
    dropstruct = br_clearinventory(player, dropcurrent, dropbehind, var_c4b556d701b0775c, var_5c916ba3a4d6bbac);
    if (!namespace_708f627020de59d3::function_c0d385a09d173a36() || !isdefined(player.var_28c944f222f4814.var_183ec729c8876d57) || player.var_28c944f222f4814.var_183ec729c8876d57 != "brloot_perkpack_specialist_jup") {
        player.prevweaponobj = undefined;
        player loadout_clearperks();
        player loadout_updateplayerperks(struct);
        givelaststandifneeded(player);
    } else {
        dropinfo = br_pickups::getitemdropinfo(player.origin);
        var_fda032b4e0c2523b = namespace_708f627020de59d3::function_98f34de164fb4757(struct.loadoutperks);
        if (var_fda032b4e0c2523b == "brloot_perkpack_custom") {
            dropinfo namespace_708f627020de59d3::function_4f3873e207497c27(struct.loadoutperks);
        }
        scripts\mp\gametypes\br_pickups::spawnpickup(var_fda032b4e0c2523b, dropinfo, 1, 1, undefined, 0);
    }
    player function_9743c56a4d2dc135(struct);
    player function_a80b77a2abaa376e(struct);
    if (isdefined(player.classstruct.loadoutsecondaryobject)) {
        br_forcegivecustomweapon(player, player.classstruct.loadoutsecondaryobject, player.classstruct.loadoutsecondaryfullname, player.classstruct.loadoutsecondary);
    }
    if (isdefined(player.classstruct.loadoutprimaryobject)) {
        br_forcegivecustomweapon(player, player.classstruct.loadoutprimaryobject, player.classstruct.loadoutprimaryfullname, player.classstruct.loadoutprimary);
    }
    if (scripts\mp\class::function_da27e3343b019fde() && isdefined(player.classstruct.var_91e10e152b08ec1d)) {
        player scripts\mp\class::function_4ffce833ce15363c(player.classstruct);
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
    if (var_2a7cb5348d575b6c == 2) {
        scriptablename = array_find(level.br_pickups.br_equipname, var_e7d8e765ac9243a6);
        dropinfo = scripts\mp\gametypes\br_pickups::getitemdroporiginandangles(dropstruct, player.origin, player.angles, player);
        pickupent = scripts\mp\gametypes\br_pickups::spawnpickup(scriptablename, dropinfo, 1, 1);
    } else if (var_2a7cb5348d575b6c == 1) {
        player scripts\mp\equipment::giveequipment(var_e7d8e765ac9243a6, "primary", undefined, var_6dc747a4410e0395);
    }
    if (var_e8a57369c51048ac == 2) {
        scriptablename = array_find(level.br_pickups.br_equipname, var_604669419e2560e6);
        dropinfo = scripts\mp\gametypes\br_pickups::getitemdroporiginandangles(dropstruct, player.origin, player.angles, player);
        pickupent = scripts\mp\gametypes\br_pickups::spawnpickup(scriptablename, dropinfo, 1, 1);
    } else if (var_e8a57369c51048ac == 1) {
        player scripts\mp\equipment::giveequipment(var_604669419e2560e6, "secondary", undefined, var_6e8f0546b97c1dd5);
    }
    if (getdvarint(@"hash_b8f058869941e6eb", 1)) {
        if (var_6dc747a4410e0395 == 0 && var_6e8f0546b97c1dd5 == 0) {
            player.var_a6dd5c7e74106ce3 = undefined;
        } else {
            player.var_a6dd5c7e74106ce3 = [];
            if (var_6dc747a4410e0395 != 0) {
                player.var_a6dd5c7e74106ce3[var_e7d8e765ac9243a6] = var_6dc747a4410e0395;
            }
            if (var_6e8f0546b97c1dd5 != 0) {
                player.var_a6dd5c7e74106ce3[var_604669419e2560e6] = var_6e8f0546b97c1dd5;
            }
        }
    }
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
        player scripts\mp\laststand::givelaststandweapon(laststandweapon);
        if (!player _hasperk("specialty_pistoldeath")) {
            player giveperk("specialty_pistoldeath");
        }
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14c6a
// Size: 0xc2
function function_29631935be756574(slot) {
    if (isdefined(level.gametypebundle)) {
        if (slot == "primary" && istrue(level.gametypebundle.var_547c0a89adb929ba)) {
            return 0;
        } else if (slot == "secondary" && istrue(level.gametypebundle.var_2404a9a3dc3669ae)) {
            return 0;
        }
    }
    equipname = self.equipment[slot];
    if (isdefined(equipname)) {
        scriptablename = level.br_pickups.br_equipnametoscriptable[equipname];
        if (isdefined(scriptablename) && isdefined(level.br_pickups.var_fac5bc934b8ffaa6[scriptablename])) {
            return 2;
        }
    }
    return 1;
}

// Namespace br / scripts\mp\gametypes\br
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x14d35
// Size: 0x24c
function function_981b2abc44534a59(player, dropcurrent, dropbehind) {
    dropstruct = scripts\mp\gametypes\br_pickups::function_7b9f3966a7a42003();
    dropstruct.weaponpickups = [];
    dropstruct.equipprimarypickup = undefined;
    dropstruct.equipsecondarypickup = undefined;
    if (istrue(dropbehind)) {
        dropstruct.dropidx = int(4);
        if (getdvarint(@"hash_ac8187887a7808aa", 0)) {
            dropstruct.dropidx += 9;
        }
    }
    foreach (weapon in player.equippedweapons) {
        basename = namespace_e0ee43ef2dddadaa::getweaponrootname(weapon.basename);
        if (isweapon(weapon) && weapon.inventorytype == "primary") {
            if (scripts\mp\gametypes\br_pickups::shoulddropbrprimary(weapon, player)) {
                var_ec7ded352736c3b1 = player scripts\mp\gametypes\br_extract_quest::extract_ismissionweapon(weapon);
                if (istrue(dropcurrent) && !var_ec7ded352736c3b1) {
                    dropinfo = scripts\mp\gametypes\br_pickups::getitemdroporiginandangles(dropstruct, player.origin, player.angles, player);
                    pickupent = scripts\mp\gametypes\br_weapons::weaponspawn(weapon, player, dropinfo, 0, 1);
                    if (isdefined(pickupent)) {
                        var_5413c446d646561a = player getweaponammoclip(weapon);
                        var_5f1e64f3e8613c52 = player getweaponammoclip(weapon, "left");
                        var_daa197e6c4b920ee = 0;
                        if (weapon.hasalternate) {
                            weaponalt = weapon getaltweapon();
                            if (scripts\mp\gametypes\br_weapons::br_ammo_type_for_weapon(weaponalt) != scripts\mp\gametypes\br_weapons::br_ammo_type_for_weapon(weapon)) {
                                var_daa197e6c4b920ee = player getweaponammoclip(weaponalt);
                            }
                        }
                        if (br_weapons::isexcludedweapon(weapon)) {
                            var_5f1e64f3e8613c52 = player getweaponammostock(weapon);
                        }
                        scripts\mp\gametypes\br_pickups::loot_setitemcount(pickupent, var_5413c446d646561a, var_5f1e64f3e8613c52, var_daa197e6c4b920ee);
                        dropstruct.weaponpickups[dropstruct.weaponpickups.size] = pickupent;
                    }
                }
            }
            player _takeweapon(weapon);
        }
    }
    return dropstruct;
}

// Namespace br / scripts\mp\gametypes\br
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x14f8a
// Size: 0x256
function br_clearinventory(player, dropcurrent, dropbehind, var_c457ebb5d2cd3f65, var_e2261019d2303fc1) {
    dropstruct = function_981b2abc44534a59(player, dropcurrent, dropbehind);
    if (isdefined(player.equipment["primary"]) && !istrue(var_c457ebb5d2cd3f65)) {
        if (istrue(dropcurrent)) {
            ammocount = player scripts\mp\equipment::getequipmentslotammo("primary");
            var_feb782334dd23a66 = array_find(level.br_pickups.br_equipname, player.equipment["primary"]);
            if (isdefined(var_feb782334dd23a66) && ammocount > 0) {
                dropinfo = scripts\mp\gametypes\br_pickups::getitemdroporiginandangles(dropstruct, player.origin, player.angles, player);
                pickupent = scripts\mp\gametypes\br_pickups::spawnpickup(var_feb782334dd23a66, dropinfo, ammocount, 1);
                if (isdefined(pickupent)) {
                    dropstruct.equipprimarypickup = pickupent;
                }
            }
        }
        player scripts\mp\equipment::takeequipment("primary");
    }
    if (isdefined(player.equipment["secondary"]) && !istrue(var_e2261019d2303fc1)) {
        if (istrue(dropcurrent)) {
            ammocount = player scripts\mp\equipment::getequipmentslotammo("secondary");
            var_feb782334dd23a66 = array_find(level.br_pickups.br_equipname, player.equipment["secondary"]);
            if (isdefined(var_feb782334dd23a66) && ammocount > 0) {
                dropinfo = scripts\mp\gametypes\br_pickups::getitemdroporiginandangles(dropstruct, player.origin, player.angles, player);
                if (issharedfuncdefined(var_feb782334dd23a66, "getAmmo")) {
                    ammocount = player [[ getsharedfunc(var_feb782334dd23a66, "getAmmo") ]]();
                }
                pickupent = scripts\mp\gametypes\br_pickups::spawnpickup(var_feb782334dd23a66, dropinfo, ammocount, 1);
                if (isdefined(pickupent)) {
                    dropstruct.equipsecondarypickup = pickupent;
                }
            }
        }
        player scripts\mp\equipment::takeequipment("secondary");
    }
    if (namespace_708f627020de59d3::function_c0d385a09d173a36() && isdefined(player.var_28c944f222f4814.var_183ec729c8876d57) && player.var_28c944f222f4814.var_183ec729c8876d57 != "brloot_perkpack_specialist_jup") {
        if (istrue(dropcurrent)) {
            player namespace_708f627020de59d3::function_3af23b0bfaf91dbd(dropstruct);
        }
    }
    player giveweapon(makeweapon("iw9_me_fists_mp"));
    return dropstruct;
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x151e9
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

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15247
// Size: 0x11b
function br_givedropbagloadout(player) {
    if (istrue(self.insertingarmorplate)) {
        player notify("try_armor_cancel", "loadout_open");
    }
    if (isbot(player, 1) && isdefined(level.bot_funcs["select_class_from_airdrop"])) {
        retval = player [[ level.bot_funcs["select_class_from_airdrop"] ]]();
    } else if (getdvarint(@"hash_f195e306ffa755d0", 0) == 1) {
        retval = player scripts\mp\gametypes\br_gametypes::runbrgametypefunc("GetRandomLoadout");
    } else {
        retval = player br_selectdropbagclass();
    }
    if (istrue(retval)) {
        scripts\cp_mp\killstreaks\airdrop::brloadoutcratepostcapture(player);
    } else {
        return;
    }
    br_giveselectedclass(player, 1, 1);
    loadouttype = ter_op(isstartstr(player.class, "custom"), 1, 0);
    player scripts\cp_mp\challenges::onloadout(loadouttype);
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        var_7bc6be581f50b614 = self.origin;
        wait 0.5;
        scripts\mp\gametypes\br_analytics::branalytics_dropbagused(player, var_7bc6be581f50b614, self);
        scripts\mp\gametypes\br_analytics::branalytics_inventory_snapshot(player, "dropbag_used");
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1536a
// Size: 0x3f
function bronloadoutcratedestroyed(immediate) {
    level notify("dropbag_kill_callout_" + self.origin);
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        scripts\mp\gametypes\br_analytics::branalytics_dropbagdestroyed(self.team, self.origin);
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x153b1
// Size: 0xf1
function cleanupdropbagsoncircle() {
    if (!getdvarint(@"hash_e91068b532510e98", 0)) {
        return;
    }
    level waittill("br_circle_started");
    while (level.br_pickups.crates.size > 0) {
        var_78cbe5db7f9353df = [];
        foreach (crate in level.br_pickups.crates) {
            if (isdefined(crate) && (!isdefined(crate.curprogress) || crate.curprogress == 0)) {
                crate thread scripts\cp_mp\killstreaks\airdrop::destroycrate();
                continue;
            }
            var_78cbe5db7f9353df[var_78cbe5db7f9353df.size] = crate;
        }
        level.br_pickups.crates = var_78cbe5db7f9353df;
        var_78cbe5db7f9353df = undefined;
        wait 1;
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x154aa
// Size: 0x2d
function brchooselaststandweapon() {
    downedplayer = self;
    laststandweapon = downedplayer playergetlaststandpistol();
    if (!isdefined(laststandweapon)) {
        laststandweapon = "iw9_gunless";
    }
    return laststandweapon;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x154e0
// Size: 0x13
function playerexitlaststand(revived) {
    scripts\mp\gametypes\br_gulag::playerexitlaststand(revived);
}

// Namespace br / scripts\mp\gametypes\br
// Params 9, eflags: 0x0
// Checksum 0x0, Offset: 0x154fb
// Size: 0x98
function modelaststandallowed(einflictor, attacker, idamage, smeansofdeath, objweapon, vdir, shitloc, psoffsettime, deathanimduration) {
    damagedata = scripts\cp_mp\utility\damage_utility::packdamagedata(attacker, self, idamage, objweapon, smeansofdeath, einflictor, undefined, vdir);
    damagedata.hitloc = shitloc;
    if (scripts\mp\gametypes\br_gametypes::isbrgametypefuncdefined("lastStandAllowed") && !scripts\mp\gametypes\br_gametypes::runbrgametypefunc("lastStandAllowed", damagedata)) {
        return false;
    }
    return true;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1559c
// Size: 0xaf
function isvalidkillcam(deathdata) {
    attacker = deathdata.attacker;
    if (!isdefined(attacker)) {
        return false;
    }
    if (istrue(deathdata.assistedsuicide)) {
        return false;
    }
    var_bc18e17a39c9670b = scripts\mp\gametypes\br_gametypes::isfeaturedisabled("gulag");
    enabledkillcam = isdefined(level.var_43307855f189eb31) && istrue(level.var_43307855f189eb31.var_cadc8d24186a8a91);
    var_182f678ba0afdacf = istrue(attacker.gulag);
    if (!var_bc18e17a39c9670b && !enabledkillcam && var_182f678ba0afdacf) {
        return false;
    }
    if (isBrPracticeMode()) {
        return false;
    }
    return true;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15654
// Size: 0x7e
function brvalidatekillcam(deathdata) {
    if (isdefined(deathdata)) {
        if (!isvalidkillcam(deathdata)) {
            deathdata.dokillcam = 0;
        }
        if (!deathdata.dokillcam && namespace_81156089ff1fe819::function_59e8b4ed75ca8b92()) {
            deathdata.victim clearpredictedstreampos();
        }
        if (!scripts\mp\gametypes\br_gametypes::isfeaturedisabled("teamSpectate")) {
            scripts\mp\gametypes\br_spectate::migratespectators(deathdata.victim, deathdata.attacker, 1);
        }
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x156da
// Size: 0x41
function iscontender(player) {
    if (!isdefined(player)) {
        return false;
    }
    if (!isalive(player)) {
        return false;
    }
    if (istrue(player.gulag)) {
        return false;
    }
    if (istrue(player.inlaststand)) {
        return false;
    }
    return true;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15724
// Size: 0x81
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

// Namespace br / scripts\mp\gametypes\br
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x157ae
// Size: 0xa2
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
        if (!scripts\mp\gametypes\br_gametypes::isfeaturedisabled("armor")) {
            victim namespace_f8d3520d3483c1::breakarmor();
        }
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 13, eflags: 0x0
// Checksum 0x0, Offset: 0x15858
// Size: 0x97
function brpreplayerdamaged(einflictor, eattacker, victim, idamage, idflags, smeansofdeath, objweapon, vpoint, vdir, shitloc, psoffsettime, modelindex, partname) {
    if (isdefined(eattacker) && eattacker != victim && idamage >= victim.health) {
        onkillingblow(eattacker, victim);
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x158f7
// Size: 0xc7
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
        assertmsg("<dev string:x1fc>" + optionname);
        return 0;
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x159c6
// Size: 0x70
function brinitloadoutoption() {
    if (isusingmatchrulesdata()) {
        optionname = getmatchrulesdata("brData", "loadoutOption");
    } else {
        optionname = getdvar(@"hash_f6f24e020168ade8", "pistolarmordropbagtime");
    }
    optionval = brgetloadoutoptionforname(optionname);
    level.br_loadout_option = optionval;
    level.var_58c406e460511ea8 = getdvarint(@"hash_d70b4de72ad5ad0b", 0);
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15a3e
// Size: 0x3c
function brdoesloadoutoptionrequireclassselection() {
    return isdefined(level.br_loadout_option) && (level.br_loadout_option == 1 || level.br_loadout_option == 2 || level.br_loadout_option == 3);
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15a83
// Size: 0x4c
function brdoesloadoutoptionusedropbags() {
    if (scripts\mp\gametypes\br_gametypes::isfeaturedisabled("drogBagLoadout")) {
        return false;
    }
    return isdefined(level.br_loadout_option) && (level.br_loadout_option == 4 || level.br_loadout_option == 5 || level.br_loadout_option == 6);
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15ad8
// Size: 0x3c
function brareloadoutdropbagsdelayed() {
    if (scripts\mp\gametypes\br_gametypes::isfeaturedisabled("drogBagLoadout")) {
        return false;
    }
    return isdefined(level.br_loadout_option) && (level.br_loadout_option == 5 || level.br_loadout_option == 6);
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15b1d
// Size: 0x2a
function function_374b5ec4199e8b21() {
    return isdefined(level.br_loadout_option) && istrue(level.var_58c406e460511ea8) && level.br_loadout_option == 6;
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15b50
// Size: 0x2c
function function_d27f645c3282a371() {
    if (scripts\mp\gametypes\br_gametypes::isfeaturedisabled("drogBagLoadout")) {
        return false;
    }
    return isdefined(level.br_loadout_option) && level.br_loadout_option == 9;
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15b85
// Size: 0x122
function brgetloadoutdropbagsdelayseconds() {
    var_70bcbf0ad5028219 = [];
    if (!isdefined(level.br_level)) {
        var_70bcbf0ad5028219[var_70bcbf0ad5028219.size] = 1;
        return var_70bcbf0ad5028219;
    }
    var_7e2390b12cb7fc63 = scripts\mp\gametypes\br_gametypes::getbrgametypedata("dropBagDelay");
    if (isdefined(var_7e2390b12cb7fc63)) {
        if (isarray(var_7e2390b12cb7fc63)) {
            var_70bcbf0ad5028219 = var_7e2390b12cb7fc63;
        } else {
            var_70bcbf0ad5028219[var_70bcbf0ad5028219.size] = var_7e2390b12cb7fc63;
        }
        return var_70bcbf0ad5028219;
    }
    var_21be5f4d451efd18 = -15;
    firsttime = scripts\mp\gametypes\br_circle::getcircleclosetime(0);
    firstdefaultval = max(0, firsttime + var_21be5f4d451efd18);
    firstdelay = getdvarfloat(@"hash_b81b25bcd8c7d749", firstdefaultval);
    var_70bcbf0ad5028219[var_70bcbf0ad5028219.size] = firstdelay;
    if (getdvarint(@"hash_b29888d711d2b473", 0) && !scripts\mp\gametypes\br_gametypes::isfeatureenabled("dropBagLoop")) {
        var_9c06dbdbe08eb98c = 15;
        secondtime = scripts\mp\gametypes\br_gulag::gettimetogulagclosed();
        seconddefaultval = max(0, secondtime + var_9c06dbdbe08eb98c);
        seconddelay = getdvarfloat(@"hash_3771b5264b3f0789", seconddefaultval);
        var_70bcbf0ad5028219[var_70bcbf0ad5028219.size] = seconddelay;
    }
    return var_70bcbf0ad5028219;
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15cb0
// Size: 0x108
function function_8209cc6a885e9a2e() {
    var_70bcbf0ad5028219 = [];
    var_7e2390b12cb7fc63 = scripts\mp\gametypes\br_gametypes::getbrgametypedata("dropPlaneDelay");
    if (isdefined(var_7e2390b12cb7fc63)) {
        var_70bcbf0ad5028219[var_70bcbf0ad5028219.size] = var_7e2390b12cb7fc63;
        return var_70bcbf0ad5028219;
    }
    circleindex = getdvarint(@"hash_7073e48b9fd3d775", 1) - 1;
    var_2568210352be1ecf = getdvarint(@"hash_431d9d141b0ff196", 1);
    if (circleindex >= 0) {
        waittime = function_335119d3d9efed24(circleindex, var_2568210352be1ecf);
        waitdelta = getdvarint(@"hash_edb26fb318f05407", 40);
        waittime = max(5, waittime - waitdelta);
        var_70bcbf0ad5028219[var_70bcbf0ad5028219.size] = waittime;
    }
    circleindex = getdvarint(@"hash_c65a2ca664793f10", 4) - 1;
    var_2568210352be1ecf = getdvarint(@"hash_a1fa1d5514626abd", 1);
    if (circleindex >= 0) {
        waittime = function_335119d3d9efed24(circleindex, var_2568210352be1ecf);
        waitdelta = getdvarint(@"hash_3d529093f4ec34e2", 15);
        waittime = max(5, waittime - waitdelta);
        var_70bcbf0ad5028219[var_70bcbf0ad5028219.size] = waittime;
    }
    return var_70bcbf0ad5028219;
}

// Namespace br / scripts\mp\gametypes\br
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x15dc1
// Size: 0x44
function function_335119d3d9efed24(circleindex, var_2568210352be1ecf) {
    waittime = scripts\mp\gametypes\br_circle::getcircleclosetime(circleindex);
    if (!var_2568210352be1ecf) {
        waittime -= level.br_level.br_circleclosetimes[circleindex];
    }
    return waittime;
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15e0e
// Size: 0x4c
function brdoesloadoutoptiongivestandardloadoutimmediately() {
    return isdefined(level.br_loadout_option) && (level.br_loadout_option == 6 || level.br_loadout_option == 7 || level.br_loadout_option == 8 || level.br_loadout_option == 9);
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15e63
// Size: 0x72
function brgetloadoutoptionstandardloadoutindex() {
    assert(isdefined(level.br_loadout_option));
    switch (level.br_loadout_option) {
    case 6:
    case 7:
    case 8:
    case 9: 
        return 0;
    default: 
        assertmsg("<dev string:x218>");
        break;
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15edd
// Size: 0x3c
function brdoesloadoutoptiongivecustomweaponsimmediately() {
    return isdefined(level.br_loadout_option) && (level.br_loadout_option == 1 || level.br_loadout_option == 2 || level.br_loadout_option == 3);
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15f22
// Size: 0x41
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

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15f6c
// Size: 0x21
function brgetloadoutammomax() {
    if (isdefined(level.br_loadout_option)) {
        if (level.br_loadout_option == 2) {
            return 20;
        }
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15f96
// Size: 0xc
function function_31651d3fd72991aa() {
    return isdefined(level.respawnloadout);
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15fab
// Size: 0x22
function function_4043e420432f59f0(loadoutchoice) {
    var_990bf19e67ec2d89 = undefined;
    var_990bf19e67ec2d89 = scripts\mp\class::preloadandqueueclass(loadoutchoice);
    return var_990bf19e67ec2d89;
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x15fd6
// Size: 0x41d
function function_10ffa1071b1c2681() {
    savedloadout = spawnstruct();
    savedloadout.primaries = [];
    savedloadout.ammoclip = [];
    savedloadout.ammoclipleft = [];
    savedloadout.ammostock = [];
    savedloadout.offhands = [];
    savedloadout.equipslots = [];
    savedprimaries = [];
    allprimaries = self getweaponslistprimaries();
    foreach (primary in allprimaries) {
        if (!scripts\mp\utility\weapon::ismeleeoverrideweapon(primary) && !issubstr(primary.basename, "iw9_me_fists_mp") && !scripts\mp\utility\weapon::isgunlessweapon(primary.basename) && !scripts\mp\utility\weapon::isunderwaterweapon(primary.basename) && !scripts\mp\utility\weapon::function_3f15e5e526ff94ce(primary.basename) && !scripts\mp\gametypes\br_weapons::isexcludedweapon(primary)) {
            savedprimaries[savedprimaries.size] = primary;
        }
    }
    foreach (weaponobj in savedprimaries) {
        weaponname = getcompleteweaponname(weaponobj);
        savedloadout.ammoclip[weaponname] = weaponclipsize(weaponobj);
        savedloadout.ammostock[weaponname] = self getweaponammostock(weaponobj);
        if (scripts\mp\utility\weapon::isakimbo(weaponobj)) {
            savedloadout.ammoclipleft[weaponname] = self getweaponammoclip(weaponobj, "left");
        }
        if (getsubstr(weaponname, 0, 4) == "alt_") {
            continue;
        }
        savedloadout.primaries[savedloadout.primaries.size] = weaponobj;
    }
    if (isdefined(self.lastcacweaponobj) && self.lastcacweaponobj != makeweapon("none")) {
        foreach (primary in savedloadout.primaries) {
            if (self.lastcacweaponobj == primary) {
                savedloadout.current = self.lastcacweaponobj;
                break;
            }
        }
    }
    var_a8b87696ab744141 = self getweaponslistoffhands();
    foreach (offhandobj in var_a8b87696ab744141) {
        if (offhandobj.basename == "bandage_br") {
            continue;
        }
        var_26d3ccffc7bebec9 = self getweaponammoclip(offhandobj);
        if (var_26d3ccffc7bebec9 <= 0) {
            continue;
        }
        savedloadout.offhands[savedloadout.offhands.size] = offhandobj;
        offhandname = getcompleteweaponname(offhandobj);
        savedloadout.ammoclip[offhandname] = var_26d3ccffc7bebec9;
    }
    foreach (slot, equipref in self.equipment) {
        savedloadout.equipslots[equipref] = slot;
    }
    savedloadout.super = undefined;
    if (!istrue(level.var_78eeb0925326ec37) && isdefined(self.super) && !self.super.usepercent) {
        savedloadout.super = self.equipment["super"];
    }
    self.savedloadout = savedloadout;
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x163fb
// Size: 0x40e
function playerloadoutrestore() {
    self endon("disconnect");
    self takeallweapons(0, 1);
    scripts\mp\gametypes\br_weapons::br_ammo_player_clear();
    self.equipment["primary"] = undefined;
    self.equipment["secondary"] = undefined;
    self.equipment["health"] = undefined;
    self.equipment["super"] = undefined;
    fists = makeweapon("iw9_me_fists_mp");
    if (self.savedloadout.primaries.size < 2) {
        self giveweapon(fists);
    }
    var_cf6837e74d470965 = 0;
    foreach (weaponobj in self.savedloadout.primaries) {
        weaponname = getcompleteweaponname(weaponobj);
        if (namespace_e0ee43ef2dddadaa::function_72ce982d9fc26f1c(weaponobj)) {
            self giveweapon(weaponobj, 0, 0, 0, 1, 1);
        } else {
            scripts\cp_mp\utility\inventory_utility::_giveweapon(weaponobj);
        }
        if (!var_cf6837e74d470965) {
            self assignweaponprimaryslot(weaponname);
            scripts\cp_mp\utility\inventory_utility::_switchtoweapon(weaponobj);
            var_cf6837e74d470965 = 1;
        }
        namespace_e0ee43ef2dddadaa::fixupplayerweapons(self, weaponname);
    }
    foreach (offhandobj in self.savedloadout.offhands) {
        equipref = scripts\mp\equipment::getequipmentreffromweapon(offhandobj);
        if (!isdefined(equipref)) {
            continue;
        }
        slot = self.savedloadout.equipslots[equipref];
        if (!isdefined(slot)) {
            continue;
        }
        scripts\mp\equipment::giveequipment(equipref, slot);
    }
    foreach (weaponname, ammo in self.savedloadout.ammostock) {
        self setweaponammostock(weaponname, ammo);
        weaponobj = makeweapon(getweaponbasename(weaponname));
        weaponammotype = scripts\mp\gametypes\br_weapons::br_ammo_type_for_weapon(weaponobj);
        if (isdefined(weaponammotype)) {
            self.br_ammo[weaponammotype] = ammo;
            scripts\mp\gametypes\br_weapons::br_ammo_player_hud_update_ammotype(weaponammotype);
        }
    }
    foreach (weaponname, ammo in self.savedloadout.ammoclip) {
        self setweaponammoclip(weaponname, ammo);
    }
    foreach (weaponname, ammo in self.savedloadout.ammoclipleft) {
        self setweaponammoclip(weaponname, ammo, "left");
    }
    waitframe();
    var_b8f86333b805d701 = fists;
    if (isdefined(self.savedloadout.current)) {
        var_b8f86333b805d701 = self.savedloadout.current;
    } else if (isdefined(self.savedloadout.primaries[0])) {
        var_b8f86333b805d701 = self.savedloadout.primaries[0];
    }
    self switchtoweaponimmediate(var_b8f86333b805d701);
    if (isdefined(self.savedloadout.super)) {
        superref = level.br_pickups.br_superreference[level.br_pickups.br_equipnametoscriptable[self.savedloadout.super]];
        scripts\mp\gametypes\br_pickups::forcegivesuper(superref, 0);
    }
    thread scripts\cp_mp\gestures::tryreenablescriptablevfx();
    self.savedloadout = undefined;
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16811
// Size: 0xce
function function_89e6ca15ec10115e() {
    var_40add1f647ac736 = 0;
    var_fa7dbf784df9623 = 1;
    while (var_fa7dbf784df9623 && var_40add1f647ac736 < level.var_a9cc50f70b867cde) {
        var_c36d4783953313b9 = 0;
        foreach (player in level.players) {
            if (isplayer(player) && player isinkillcam()) {
                var_c36d4783953313b9 = 1;
                break;
            }
        }
        var_fa7dbf784df9623 = var_c36d4783953313b9;
        if (var_fa7dbf784df9623) {
            var_40add1f647ac736 += function_676cfe2ab64ea758() / 1000;
            waitframe();
        }
    }
    if (var_40add1f647ac736 >= level.var_a9cc50f70b867cde) {
        brskipplayerkillcams();
        wait 1;
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x168e7
// Size: 0x78
function brskipplayerkillcams() {
    foreach (player in level.players) {
        if (isplayer(player) && player isinkillcam()) {
            player notify("abort_killcam");
            player.cancelkillcam = 1;
        }
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16967
// Size: 0x55
function brhandleinvulnerability(time) {
    invulnerabilitytime = getdvarint(@"hash_eddaebb33871cf7d", 30);
    if (invulnerabilitytime > time) {
        invulnerabilitytime = time;
    }
    wait time - invulnerabilitytime;
    level.allowprematchdamage = 0;
    wait invulnerabilitytime / 2;
    brskipplayerkillcams();
    wait invulnerabilitytime / 2;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x169c4
// Size: 0x35a
function spawnclientbr(revivespawn) {
    self endon("disconnect");
    self.var_47f9a068df7c5418 = undefined;
    if (scripts\mp\gametypes\br_public::iswaitingtoentergulag(self)) {
        self notify("attempted_spawn");
        scripts\mp\gametypes\br_gulag::entergulag(self);
        self.waitingtospawn = 0;
        return;
    }
    if (istrue(self.waitingtospawnamortize) || scripts\mp\gametypes\br_public::isrespawningfromtoken(self) || istrue(scripts\mp\gametypes\br_gametypes::runbrgametypefunc("spawnHandled", self))) {
        self notify("attempted_spawn");
        self.waitingtospawn = 0;
        return;
    }
    if (!scripts\mp\playerlogic::mayspawn()) {
        waitframe();
        self notify("attempted_spawn");
        if (istrue(level.infiltransistioning) || istrue(level.snatchspawnalltoc130done) || istrue(level.br_c130spawndone)) {
            if (isdefined(level.brlatespawnplayer)) {
                self thread [[ level.brlatespawnplayer ]]();
            }
            return;
        }
        return;
    }
    if (istrue(revivespawn)) {
        level.snatchspawnalltoc130done = 0;
    }
    if (istrue(level.infilcompleted) && !istrue(revivespawn)) {
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
    println("<dev string:x232>");
    prespawndvarvalue = getdvarint(@"hash_c04bdbe0595bf776", 1);
    prespawn = prespawndvarvalue && scripts\mp\gametypes\br::usedropspawn() && !isbot(self);
    if (prespawndvarvalue > 1) {
        prespawn = prespawn && !istrue(self.hasspawned);
    }
    if (prespawn) {
        self.prespawnspawn = scripts\mp\gametypes\br::getspawnpoint(prespawn);
    }
    self.var_2676523c73704bb0 = 1;
    scripts\mp\playerlogic::waitandspawnclient(revivespawn);
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
    body = scripts\mp\teams::getcustomization()["body"];
    var_c30ac8f00cb1cc8a = gettime();
    if (var_4de859b9228e5cfd) {
        while (isalive(self) && isdefined(body) && isdefined(self.weaponlist) && !self hasloadedcustomizationviewmodels(body) && !self hasloadedviewweapons(self.weaponlist)) {
            if (var_c30ac8f00cb1cc8a + 3000 < gettime()) {
                break;
            }
            waitframe();
        }
        extrawaittime = getdvarfloat(@"hash_3e0e124917f2104b", 1);
        if (extrawaittime > 0) {
            wait extrawaittime;
        }
    }
    self notify("brWaitAndSpawnClientComplete");
    self.waitingtospawn = 0;
    self freezecontrols(0);
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16d26
// Size: 0x2b
function playerexecutionsdisable() {
    if (scripts\cp_mp\execution::hasexecution()) {
        self.savedexecutionref = self.executionref;
        scripts\cp_mp\execution::_clearexecution();
        self disableexecutionattack();
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16d59
// Size: 0x30
function playerexecutionsenable() {
    if (isdefined(self.savedexecutionref)) {
        scripts\cp_mp\execution::_giveexecution(self.savedexecutionref);
        self enableexecutionattack();
        self.savedexecutionref = undefined;
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x16d91
// Size: 0x13f
function watchforbrsquadleadershift() {
    level endon("game_ended");
    self notify("br_squad_leader_shift");
    self endon("br_squad_leader_shift");
    player = self;
    teamname = player.team;
    while (true) {
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
            if (!scripts\mp\flags::gameflag("prematch_done")) {
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

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16ed8
// Size: 0x43
function setplayersquadindex(squadindex) {
    player = self;
    newextrainfo = player.game_extrainfo & 65528;
    newextrainfo |= squadindex;
    player.game_extrainfo = newextrainfo;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16f23
// Size: 0x79
function setplayerbrsquadleader(isleader) {
    player = self;
    if (isleader == player scripts\mp\gametypes\br_public::isplayerbrsquadleader()) {
        return;
    }
    player.isbrsquadleader = isleader;
    if (isleader) {
        player.game_extrainfo |= 256;
        player thread watchforbrsquadleadershift();
        return;
    }
    player.game_extrainfo &= ~256;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16fa4
// Size: 0x159
function abandonbrsquadleader(teamname) {
    player = self;
    if (!isdefined(teamname)) {
        teamname = player.team;
    }
    if (isdefined(player) && !player scripts\mp\gametypes\br_public::isplayerbrsquadleader()) {
        assertmsg("<dev string:x27b>");
        return 0;
    }
    if (isdefined(player)) {
        player.haspassedsquadleader = 1;
    }
    teamplayers = getteamdata(teamname, "players");
    bestplayerscore = 0;
    bestsquadleader = undefined;
    foreach (squadmember in teamplayers) {
        squadmemberscore = playerbrsquadleaderscore(squadmember);
        if (squadmemberscore > bestplayerscore) {
            bestplayerscore = squadmemberscore;
            bestsquadleader = squadmember;
        }
    }
    success = 0;
    if (isdefined(bestsquadleader)) {
        if (isdefined(player)) {
            player setplayerbrsquadleader(0);
        }
        bestsquadleader setplayerbrsquadleader(1);
        success = 1;
        if (!istrue(level.br_c130spawndone) && getsubgametype() == "br") {
            level scripts\mp\gametypes\br_public::brleaderdialogplayer("deploy_squad_leader", bestsquadleader, 1, 0);
        }
    }
    updatesquadleaderpassstateforteam(teamname);
    return success;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17106
// Size: 0xca
function teamhasfreshsquadleadercandidate(teamname) {
    teamplayers = getteamdata(teamname, "players");
    var_a782b5b8fccc6409 = 0;
    foreach (squadmember in teamplayers) {
        if (!isdefined(squadmember) || squadmember scripts\mp\gametypes\br_public::isplayerbrsquadleader()) {
            continue;
        }
        if (!isalive(squadmember)) {
            continue;
        }
        if (squadmember iscodcaster() || squadmember isspectatingplayer()) {
            continue;
        }
        if (squadmember scripts\mp\gametypes\br_public::isplayeringulag()) {
            continue;
        }
        if (!istrue(squadmember.haspassedsquadleader)) {
            var_a782b5b8fccc6409 = 1;
            break;
        }
    }
    return var_a782b5b8fccc6409;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x171d9
// Size: 0x83
function updatesquadleaderpassstateforteam(teamname) {
    teamplayers = getteamdata(teamname, "players");
    var_a782b5b8fccc6409 = teamhasfreshsquadleadercandidate(teamname);
    foreach (squadmember in teamplayers) {
        squadmember setclientomnvar("ui_br_squad_leader_can_pass", var_a782b5b8fccc6409);
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17264
// Size: 0x6f
function playerbrsquadleaderscore(player) {
    if (!isdefined(player) || player scripts\mp\gametypes\br_public::isplayerbrsquadleader() || player iscodcaster() || player isspectatingplayer() || !isalive(player)) {
        return 0;
    }
    if (player scripts\mp\gametypes\br_public::isplayeringulag()) {
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

// Namespace br / scripts\mp\gametypes\br
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x172dc
// Size: 0xa6
function teamsplashbr(splash, owner, team, optionalnumber, var_42b1e877ab187c6) {
    teamplayers = getteamdata(team, "players");
    foreach (player in teamplayers) {
        if (!istrue(player.gulag)) {
            player thread scripts\mp\hud_message::showsplash(splash, optionalnumber, owner, undefined, undefined, var_42b1e877ab187c6);
        }
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1738a
// Size: 0xb8
function endsuperdisableweaponbr() {
    var_27cebae05627958 = "super_delay_mp";
    currentsuper = scripts\mp\supers::getcurrentsuper();
    if (isdefined(currentsuper)) {
        superweapon = currentsuper.staticdata.weapon;
        ammo = 0;
        if (scripts\mp\perks\perkfunctions::function_66f0cbd5ff8458fe()) {
            ammo = ter_op(scripts\mp\supers::issuperready(), 1, 0);
        } else {
            ammo = ter_op(istrue(self.var_1066fbd86c88a6df), 1, 0);
        }
        _giveweapon(superweapon);
        self setweaponammoclip(superweapon, ammo);
        self assignweaponoffhandspecial(superweapon);
        _takeweapon(var_27cebae05627958);
    }
    self notify("super_disable_end");
    self.var_b310ffbb7df412dd = 1;
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1744a
// Size: 0x37
function getsuperweapondisabledammobr() {
    ammo = scripts\mp\equipment::getequipmentslotammo("super");
    if (!istrue(scripts\mp\supers::issuperdisabled())) {
        return ammo;
    }
    if (istrue(self.var_1066fbd86c88a6df)) {
        ammo = 1;
    }
    return ammo;
}

// Namespace br / scripts\mp\gametypes\br
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1748a
// Size: 0x257
function onsupportboxusedbyplayer(player, dropstruct) {
    var_509d86412c9d7426 = player getweaponslistprimaries();
    if (player scripts\mp\utility\killstreak::isjuggernaut()) {
        if (!isdefined(var_509d86412c9d7426) || var_509d86412c9d7426.size == 0) {
            minigun = player getcurrentweapon();
            var_d0bae9fa43b9e424 = player getcurrentweaponclipammo();
            var_e21a1fe75ea20307 = weaponclipsize(minigun);
            if (var_d0bae9fa43b9e424 < var_e21a1fe75ea20307) {
                player setweaponammoclip(minigun, var_e21a1fe75ea20307);
                player hudicontype("br_ammo");
                player playlocalsound("iw9_support_box_use");
                return true;
            }
        }
    }
    if (!isdefined(dropstruct)) {
        dropstruct = scripts\mp\gametypes\br_pickups::function_7b9f3966a7a42003();
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
    scripts\mp\equipment\support_box::supportbox_playusesound(player);
    thread scripts\mp\equipment\support_box::supportbox_onplayeruseanim();
    return true;
}

// Namespace br / scripts\mp\gametypes\br
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x176ea
// Size: 0x122
function function_fb4e05597755dd4c(player, var_75e244e5f45c894d, equipmentref, dropstruct) {
    var_35a4276ef6519a = player namespace_4fb9dddfb8c1a67a::getequipmentammo(equipmentref);
    var_5ecd4ef83f881c83 = player namespace_4fb9dddfb8c1a67a::getequipmentmaxammo(equipmentref);
    var_bab9e4f8ba9f23d0 = var_5ecd4ef83f881c83 - var_35a4276ef6519a;
    player scripts\mp\equipment::incrementequipmentammo(equipmentref, var_35a4276ef6519a + var_bab9e4f8ba9f23d0);
    if (issharedfuncdefined(equipmentref, "overrideExtraEquipmentAmmoDrop")) {
        var_416102a18fc1fd69 = player [[ getsharedfunc(equipmentref, "overrideExtraEquipmentAmmoDrop") ]](var_75e244e5f45c894d, var_bab9e4f8ba9f23d0);
    } else {
        var_416102a18fc1fd69 = var_75e244e5f45c894d - var_bab9e4f8ba9f23d0;
    }
    if (var_416102a18fc1fd69 > 0) {
        lootid = namespace_38b993c4618e76cd::getlootidfromref(equipmentref);
        scriptablename = namespace_38b993c4618e76cd::getScriptableFromLootID(lootid);
        if (istrue(level.var_1aa4ff5576b74b2) && isdefined(dropstruct)) {
            scripts\mp\equipment\support_box::function_225b99924f316bc1(dropstruct, player, scriptablename, var_416102a18fc1fd69);
            return;
        }
        droppickup = spawnstruct();
        droppickup.scriptablename = scriptablename;
        droppickup.count = var_416102a18fc1fd69;
        player namespace_aead94004cf4c147::addItemToBackpack(lootid, droppickup);
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x17814
// Size: 0x184
function onarmorboxusedbyplayer(player, dropstruct) {
    armoramount = getdvarint(@"hash_796878180a8e250", 4);
    var_3e26af1f7d06878b = "brloot_armor_plate";
    var_9ffb530e039a041 = player scripts\mp\equipment::getequipmentslotammo("health");
    var_9ffb530e039a041 = default_to(var_9ffb530e039a041, 0);
    var_989dbbd449c282ca = player scripts\mp\equipment::getequipmentmaxammo("equip_armorplate");
    var_e5dd98c912b3b189 = var_989dbbd449c282ca - var_9ffb530e039a041;
    result = scripts\mp\gametypes\br_pickups::br_forcegivecustompickupitem(player, var_3e26af1f7d06878b, 1, var_e5dd98c912b3b189, 0);
    if (result) {
        player hudicontype("br_armor");
        var_42ac611ed3e82a3c = armoramount - var_e5dd98c912b3b189;
        if (var_42ac611ed3e82a3c > 0) {
            if (istrue(level.var_f2c468b1d700a1bd)) {
                if (!isdefined(dropstruct)) {
                    dropstruct = scripts\mp\gametypes\br_pickups::function_7b9f3966a7a42003();
                }
                scripts\mp\equipment\support_box::function_225b99924f316bc1(dropstruct, player, var_3e26af1f7d06878b, var_42ac611ed3e82a3c);
            } else {
                droppickup = spawnstruct();
                droppickup.scriptablename = var_3e26af1f7d06878b;
                droppickup.count = var_42ac611ed3e82a3c;
                lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(var_3e26af1f7d06878b);
                player namespace_aead94004cf4c147::addItemToBackpack(lootid, droppickup);
            }
        }
    } else {
        droppickup = spawnstruct();
        droppickup.scriptablename = var_3e26af1f7d06878b;
        droppickup.count = armoramount;
        lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(var_3e26af1f7d06878b);
        player namespace_aead94004cf4c147::addItemToBackpack(lootid, droppickup);
    }
    scripts\mp\equipment\support_box::supportbox_playusesound(player);
    thread scripts\mp\equipment\support_box::supportbox_onplayeruseanim();
    return true;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x179a1
// Size: 0xd
function function_f41d94b42b42e948(player) {
    return true;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x179b7
// Size: 0xc1
function function_130bc3f5f33bb97d(player) {
    var_456c4271ed8779b9 = "brloot_self_revive";
    result = scripts\mp\gametypes\br_pickups::br_forcegivecustompickupitem(player, var_456c4271ed8779b9, 1, 1, 0);
    if (result) {
        player hudicontype("br_armor");
        method = scripts\cp_mp\challenges::function_6d40f12a09494350(0, 0);
        method = scripts\cp_mp\challenges::function_6d40f12a09494350(method, 2);
        lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(var_456c4271ed8779b9);
        scripts\cp_mp\challenges::function_d24138b32084fc3e(player, lootid, undefined, method, 1);
    } else {
        droppickup = spawnstruct();
        droppickup.scriptablename = var_456c4271ed8779b9;
        droppickup.count = 1;
        lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(var_456c4271ed8779b9);
        player namespace_aead94004cf4c147::addItemToBackpack(lootid, droppickup);
    }
    return true;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17a81
// Size: 0x191
function function_f24ae0993efca48f(player) {
    altitemlist = tolower(getdvar(hashcat(@"hash_af9284300060dcb3", "")));
    if (!isdefined(altitemlist) || altitemlist == "") {
        scripts\mp\gametypes\br_pickups::br_forcegivecustompickupitem(player, "brloot_plate_carrier_2", 1, 1, 0);
    } else {
        itemlist = strtok(altitemlist, " ");
        foreach (item in itemlist) {
            if (!isdefined(namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(item))) {
                assertmsg("<dev string:x2c8>" + item + "<dev string:x2ed>");
                continue;
            }
            switch (item) {
            case #"hash_755a9bafcd63b343": 
                scripts\mp\gametypes\br_pickups::br_forcegivecustompickupitem(player, item, 1, getdvarint(@"hash_e2706d365ad75b50", 3), 0);
                break;
            case #"hash_1cd9ffa488237604":
            case #"hash_57e5eda4a702c559":
            case #"hash_672892a4af1e94cc":
            case #"hash_f1734c15f85881ca": 
                scripts\mp\gametypes\br_pickups::br_forcegivecustompickupitem(player, item, 1, getdvarint(@"hash_5970233d0ac3eb9e", 30), 0);
                break;
            default: 
                scripts\mp\gametypes\br_pickups::br_forcegivecustompickupitem(player, item, 1, 1, 0);
                break;
            }
        }
    }
    player hudicontype("br_ammo");
    scripts\mp\equipment\support_box::supportbox_playusesound(player);
    thread scripts\mp\equipment\support_box::supportbox_onplayeruseanim();
    return true;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17c1b
// Size: 0x13
function airdrop_registercrateforcleanup(crate) {
    registercrateforcleanup(crate);
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17c36
// Size: 0x13
function airdop_brloadoutcratefirstactivation(crate) {
    brloadoutcratefirstactivation(crate);
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17c51
// Size: 0x9
function airdrop_makeweaponfromcrate() {
    makeweaponfromcrate();
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17c62
// Size: 0x9
function airdrop_makeitemfromcrate() {
    makeitemfromcrate();
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17c73
// Size: 0x13
function airdrop_makeitemsfromcrate(player) {
    makeitemsfromcrate(player);
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17c8e
// Size: 0x13
function airdrop_br_givedropbagloadout(player) {
    br_givedropbagloadout(player);
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17ca9
// Size: 0x13
function airdrop_bronloadoutcratedestroyed(immediate) {
    bronloadoutcratedestroyed(immediate);
}

// Namespace br / scripts\mp\gametypes\br
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x17cc4
// Size: 0x21
function onnewequipmentpickup(player, equipmentref) {
    player scripts\mp\gametypes\br_pickups::handleexplosivepickup(equipmentref, "primary");
}

// Namespace br / scripts\mp\gametypes\br
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x17ced
// Size: 0xaa
function ongrenadeused(weaponname, grenade) {
    switch (weaponname) {
    case #"hash_83ef591efa62a73b": 
        thread scripts\mp\equipment\fulton::fulton_used(grenade);
        break;
    case #"hash_519ff1c7ffcf10c": 
        thread scripts\mp\gametypes\br_gulag::rock_used(grenade);
        break;
    case #"hash_aacc8564841797ba": 
        thread namespace_eaf4e9860fe32d68::function_231a038d18c51203(grenade);
        break;
    default: 
        scripts\mp\gametypes\br_gametypes::runbrgametypefunc("onGrenadeUsed", weaponname, grenade);
        break;
    }
    if (weaponname == "rock_mp" && istrue(self.var_47f9a068df7c5418)) {
        grenade delete();
        self.var_47f9a068df7c5418 = undefined;
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x17d9f
// Size: 0x13
function onweapontaken(desiredweapon) {
    scripts\mp\gametypes\br_weapons::takeweaponpickup(desiredweapon);
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x17dba
// Size: 0x47
function playershouldrespawn() {
    if (scripts\mp\gametypes\br_gametypes::isbrgametypefuncdefined("playerShouldRespawn")) {
        return scripts\mp\gametypes\br_gametypes::runbrgametypefunc("playerShouldRespawn");
    }
    if (!istrue(level.br_prematchstarted)) {
        return 1;
    }
    if (scripts\mp\gametypes\br_public::iswaitingtoentergulag(self)) {
        return 1;
    }
    if (scripts\mp\gametypes\br_public::isrespawningfromtoken(self)) {
        return 1;
    }
    return 0;
}

// Namespace br / scripts\mp\gametypes\br
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x17e0a
// Size: 0x2bb
function brplayerkilledspawn(deathdata, finaldeath) {
    victim = deathdata.victim;
    if (isdefined(victim) && isplayer(victim)) {
        victim resetplayervariables();
        victim resetplayeromnvarsonspawn();
    }
    result = scripts\mp\gametypes\br_gametypes::runbrgametypefunc("playerKilledSpawn", deathdata, finaldeath);
    if (isdefined(result)) {
        return result;
    } else if (getsubgametype() == "plunder" || getsubgametype() == "risk" || getsubgametype() == "kingslayer" || getsubgametype() == "rumble_mgl") {
        if (getdvarint(@"hash_fe3afd6ead4aa523", 1) == 1) {
            if (istrue(isdefined(self.c130))) {
                return 1;
            }
            if (!scripts\mp\flags::gameflag("prematch_done")) {
                return 0;
            }
            if (istrue(deathdata.victim.hasrespawntoken) || istrue(level.useautorespawn)) {
                if (scripts\mp\gametypes\br_public::function_d6ae35e0ce14bbaf()) {
                    if (isbot(deathdata.victim)) {
                        return 1;
                    }
                }
                deathdata.victim thread namespace_8bfdb6eb5a3df67a::plunderplayerrespawn();
                teamcount = getteamdata(deathdata.victim.team, "teamCount");
                if (teamcount > 1 && !scripts\mp\gametypes\br_gametypes::isfeaturedisabled("spectateOnDeath")) {
                    deathdata.victim thread scripts\mp\gametypes\br_spectate::spawnspectator(deathdata, finaldeath, 1);
                }
                return 1;
            }
        } else {
            if (!scripts\mp\flags::gameflag("prematch_done")) {
                return 0;
            }
            if (istrue(deathdata.victim.hasrespawntoken) || istrue(level.useautorespawn)) {
                if (scripts\mp\gametypes\br_public::function_d6ae35e0ce14bbaf()) {
                    if (isbot(deathdata.victim)) {
                        return 1;
                    }
                } else if (!scripts\mp\gametypes\br_public::function_d6ae35e0ce14bbaf()) {
                    deathdata.victim thread scripts\mp\playerlogic::respawn_asspectator(deathdata.victim.origin + (0, 0, 60), deathdata.victim.angles);
                }
                deathdata.victim thread namespace_8bfdb6eb5a3df67a::plunderplayerrespawn();
                return 1;
            }
        }
    } else if (!playershouldrespawn()) {
        if (!scripts\mp\utility\damage::playershoulddofauxdeath(0) && !scripts\mp\gametypes\br_gametypes::isfeaturedisabled("spectateOnDeath")) {
            deathdata.victim thread scripts\mp\gametypes\br_spectate::spawnspectator(deathdata, finaldeath);
        } else if (istrue(level.var_b7ad06255200033c)) {
            self.br_spectatorinitialized = 1;
            self notify("br_spectatorInitialized");
        }
        return 1;
    }
    return 0;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x180ce
// Size: 0xc2
function brmayconsiderplayerdead(player) {
    result = scripts\mp\gametypes\br_gametypes::runbrgametypefunc("mayConsiderPlayerDead", player);
    if (isdefined(result)) {
        return result;
    }
    if (scripts\mp\flags::gameflag("prematch_done") && issharedfuncdefined("teamAssim", "isEnabled") && [[ getsharedfunc("teamAssim", "isEnabled") ]]() && issharedfuncdefined("teamAssim", "disablePlayer")) {
        [[ getsharedfunc("teamAssim", "disablePlayer") ]](player, "player_dead");
    }
    var_e111bc24345972ff = player scripts\mp\gametypes\br_gulag::trygulagspawn();
    if (scripts\mp\flags::gameflag("prematch_done") && !var_e111bc24345972ff) {
        scripts\mp\gametypes\br_utility::markplayeraseliminated(player, "brMayConsiderPlayerDead");
    }
    return !var_e111bc24345972ff;
}

/#

    // Namespace br / scripts\mp\gametypes\br
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x18199
    // Size: 0xc
    function unreachable_function() {
        scripts\mp\bots\bots_gametype_br::setup_callbacks();
    }

#/

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x181ad
// Size: 0x63
function monitorweaponswitchbr() {
    level endon("game_ended");
    self endon("disconnect");
    for (lastweaponchangetime = gettime(); true; lastweaponchangetime = newtime) {
        self waittill("weapon_change");
        newtime = gettime();
        if (newtime - lastweaponchangetime >= 3000) {
            awardtime = newtime - lastweaponchangetime;
            thread giveweaponxpfromtimebr(awardtime);
        }
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18218
// Size: 0x25
function weaponshouldgetxp(weapon) {
    rootname = getweaponrootname(weapon);
    return weaponhasranks(rootname);
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18246
// Size: 0x76
function weaponhasranks(rootname) {
    if (!isdefined(level.weaponranktable.maxweaponranks[rootname])) {
        return 0;
    }
    hasranks = level.weaponranktable.maxweaponranks[rootname] > 0;
    assertex(!hasranks || isenumvaluevalid("<dev string:x314>", "<dev string:x31e>", rootname), "<dev string:x32f>" + rootname + "<dev string:x334>");
    return hasranks;
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x182c5
// Size: 0xa5
function announceplayercountlandmarks() {
    f_threshold = getdvarfloat(@"hash_7383409df4ea8bd2", 0.6);
    if (!f_threshold) {
        return;
    }
    level endon("game_ended");
    level waittill("prematch_started");
    if (getdvarint(@"hash_d9f5b4d05943b70c", 0) == 1) {
        level function_773c7f13e1254d74(50, f_threshold);
        level function_773c7f13e1254d74(25, f_threshold);
        level function_773c7f13e1254d74(10, f_threshold);
        level function_773c7f13e1254d74(5, f_threshold);
        return;
    }
    level playersleftloop(50, f_threshold);
    level playersleftloop(25, f_threshold);
    level playersleftloop(10, f_threshold);
    level playersleftloop(5, f_threshold);
}

// Namespace br / scripts\mp\gametypes\br
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x18372
// Size: 0xff
function playersleftloop(numplayers, f_threshold) {
    if (istrue(level.brgametype.var_c435bc516c8091ca)) {
        return;
    }
    if (getdvarint(@"hash_818c699a5caaee4f", 20) * f_threshold < numplayers) {
        return;
    }
    level endon("game_ended");
    playersleft = getbrplayersnoteliminated();
    var_ada79dbc285a1b55 = getsubgametype() == "resurgence" && level.brgametype.issolos;
    while (playersleft.size > numplayers) {
        level waittill_either("br_player_eliminated", "players_remaining_changed");
        playersleft = getbrplayersnoteliminated();
        if (playersleft.size <= numplayers) {
            var_457d1ba9ea64fd1 = !istrue(level.usegulag) || istrue(level.gulag.shutdown);
            if (var_ada79dbc285a1b55 || var_457d1ba9ea64fd1) {
                scripts\mp\gametypes\br_public::brleaderdialog("top_" + numplayers, 0, undefined, 1);
            }
            break;
        }
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x18479
// Size: 0x234
function function_773c7f13e1254d74(numplayers, f_threshold) {
    if (getdvarint(@"hash_818c699a5caaee4f", 20) * f_threshold < numplayers) {
        return;
    }
    level endon("game_ended");
    playersleft = getbrplayersnoteliminated();
    var_ada79dbc285a1b55 = getsubgametype() == "resurgence" && level.brgametype.issolos;
    var_9ea582cfef3850c6 = [];
    activeteams = [];
    for (i = 0; i < playersleft.size; i++) {
        player = playersleft[i];
        if (player function_7dbb8165d792b06c()) {
            continue;
        }
        if (!isdefined(activeteams[player.team])) {
            activeteams[player.team] = 1;
            var_9ea582cfef3850c6[var_9ea582cfef3850c6.size] = player.team;
        }
    }
    while (playersleft.size > numplayers && var_9ea582cfef3850c6.size > 0) {
        level waittill_either("br_player_eliminated", "players_remaining_changed");
        playersleft = getbrplayersnoteliminated();
        var_8986cc772c6de270 = [];
        foreach (team in var_9ea582cfef3850c6) {
            var_dadcb19d1b7db056 = getteamdata(team, "alivePlayers");
            if (!isdefined(var_dadcb19d1b7db056)) {
                var_dadcb19d1b7db056 = [];
            }
            if (playersleft.size - var_dadcb19d1b7db056.size <= numplayers) {
                var_457d1ba9ea64fd1 = !istrue(level.usegulag) || istrue(level.gulag.shutdown);
                if (var_ada79dbc285a1b55 || var_457d1ba9ea64fd1) {
                    scripts\mp\gametypes\br_public::brleaderdialogteam("top_" + numplayers, team, 0, undefined, 1);
                }
                var_8986cc772c6de270[var_8986cc772c6de270.size] = team;
            }
        }
        foreach (team in var_8986cc772c6de270) {
            var_9ea582cfef3850c6 = array_remove(var_9ea582cfef3850c6, team);
        }
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x186b5
// Size: 0x97
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
            if (player iscodcaster()) {
                continue;
            }
        }
        var_f7bc4ef9c5601076[var_f7bc4ef9c5601076.size] = player;
    }
    return var_f7bc4ef9c5601076;
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18755
// Size: 0xe1
function function_f297f4741391514d() {
    playersactive = [];
    foreach (team in level.teamnamelist) {
        if (function_f8167aab51948bf0(team)) {
            continue;
        }
        foreach (player in getteamdata(team, "players")) {
            if (player playeriszombie()) {
                continue;
            }
            if (level.codcasterenabled) {
                if (player iscodcaster()) {
                    continue;
                }
            }
            playersactive[playersactive.size] = player;
        }
    }
    return playersactive;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1883f
// Size: 0x4f
function function_f8167aab51948bf0(team) {
    allplayersdead = getteamdata(team, "aliveCount") == 0;
    teamcanrespawn = isdefined(level.teamcanrespawn) && istrue(level.teamcanrespawn[team]);
    return allplayersdead && !teamcanrespawn;
}

// Namespace br / scripts\mp\gametypes\br
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x18897
// Size: 0xe9
function resetafkchecks(player, fromlaststand) {
    if (isdefined(player.gulaguses) && player.gulaguses > 0 || istrue(player.ffsm_isgulagrespawn) || istrue(fromlaststand)) {
        player.ignoreafkcheck = 0;
        if (!istrue(player.pers["distTrackingPassed"])) {
            player.pers["distTrackingPassedOrResetTime"] = player scripts\mp\teams::function_19300abfbb10928b();
            player thread scripts\mp\playerlogic::totaldisttracking(player.origin);
            return;
        }
        player notify("afk_tracking_resume");
        return;
    }
    player.pers["distTrackingPassed"] = 0;
    player.pers["totalDistTraveledAFK"] = 0;
    player.var_cb9581fc7ff5f394 = undefined;
    player thread scripts\mp\playerlogic::totaldisttracking(player.origin);
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18988
// Size: 0x2b
function function_49738978a130d729(player) {
    level endon("game_ended");
    player endon("death_or_disconnect");
    player waittill("laststand_revived");
    function_f7fc6d074e78a084(player, 1);
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x189bb
// Size: 0x3b
function onfirstlandcallback(player) {
    player function_25d1f410e0cf11bc(0);
    if (!isreallyalive(player)) {
        return;
    }
    if (isinlaststand(player)) {
        level thread function_49738978a130d729(player);
        return;
    }
    function_f7fc6d074e78a084(player);
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x189fe
// Size: 0x3e
function function_b6c2bd8342c0670e(player) {
    level endon("game_ended");
    player endon("death_or_disconnect");
    while (true) {
        if (!player isswimming()) {
            player.var_91a2b1303b861667 = undefined;
            break;
        }
        wait 0.5;
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x18a44
// Size: 0xf6
function function_f7fc6d074e78a084(player, fromlaststand) {
    if (!isdefined(fromlaststand)) {
        fromlaststand = 0;
    }
    resetafkchecks(player, fromlaststand);
    player.brneverlanded = undefined;
    player calloutmarkerping_squadleaderbeaconplayerfirstlanded();
    level thread function_b6c2bd8342c0670e(player);
    if (getdvarint(@"hash_9f0aea8fba119184", 1) == 1) {
        player scripts\cp_mp\utility\player_utility::function_6fb380927695ee76(1);
    }
    if (istrue(level.squadleaderboon)) {
        if (level.squadleaderboon != 0) {
            if (!istrue(level.teamdata[player.team]["squadBoonDropped"])) {
                if (scripts\mp\flags::gameflag("prematch_done") && scripts\mp\flags::gameflag("br_ready_to_jump")) {
                    if (player scripts\mp\gametypes\br_public::isplayerbrsquadleader()) {
                        player function_90011db2fca825a8();
                        level.teamdata[player.team]["squadBoonDropped"] = 1;
                    }
                }
            }
        }
    }
    scripts\mp\gametypes\br_gametypes::runbrgametypefunc("onPlayerFirstLand", player);
}

// Namespace br / scripts\mp\gametypes\br
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x18b42
// Size: 0x1ec
function updatesquadmemberlaststandreviveprogress(revivee, reviver, progress, var_979d1594b4f7f7be) {
    assert(isdefined(revivee) && isdefined(reviver));
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
        progresspayload = var_98c2f6161f41a683;
        if (istrue(var_979d1594b4f7f7be)) {
            revivee scripts\mp\gametypes\br_public::setplayerselfrevivingextrainfo(0);
        } else if (var_53b0b2667f5ceb2) {
            revivee scripts\mp\gametypes\br_public::setplayerselfrevivingextrainfo(1);
        }
        if (squadindex == -1) {
            return;
        }
        bitoffset = squadindex * 5;
        var_b27d0eff739466e0 = (progresspayload & 31) << bitoffset;
        var_f8f977081d3da8b4 = ~(31 << bitoffset);
        cleanedbase = var_70401238acb839bc & var_f8f977081d3da8b4;
        statuspayload = cleanedbase + var_b27d0eff739466e0;
        level.br_squadrevivestatus[revivee.team] = statuspayload;
        teammates = getteamdata(revivee.team, "players");
        if (isdefined(teammates) && teammates.size > 0) {
            foreach (teammate in teammates) {
                teammate setclientomnvar("ui_br_squad_revive_status", statuspayload);
            }
        }
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18d36
// Size: 0x19e
function calculateclientmatchdataextrainfopayload(player) {
    var_53cf4afa40bcddc4 = [0, 0, 0, 0];
    if (isdefined(player) && isdefined(player.brmissiontypescompleted)) {
        currentidx = 0;
        foreach (contracttype, completioncount in player.brmissiontypescompleted) {
            contractid = undefined;
            if (getdvarint(@"hash_82bde055b11e6698", 0)) {
                contractid = scripts\mp\gametypes\br_quest_util::getquesttableindex(contracttype);
            } else {
                contractid = namespace_1eb3c4e0e28fac71::getquesttableindex(contracttype);
            }
            assert(contractid < 15);
            var_7417822db1ebf4b1 = int(clamp(completioncount, 0, 15)) << 4;
            var_53cf4afa40bcddc4[currentidx] = var_7417822db1ebf4b1 + contractid;
            currentidx++;
            if (currentidx >= 4) {
                break;
            }
        }
    }
    payloadbundles = [];
    payloadbundles[0] = (var_53cf4afa40bcddc4[0] << 8) + var_53cf4afa40bcddc4[1];
    payloadbundles[1] = (var_53cf4afa40bcddc4[2] << 8) + var_53cf4afa40bcddc4[3];
    payloadbundles[2] = get_int_or_0(player.br_contractxpearned);
    var_1b83acb5f45683ac = int(clamp(get_int_or_0(player.var_3f78c6a0862f9e25) - 1, 0, 3));
    payloadbundles[3] = var_1b83acb5f45683ac << 14;
    payloadbundles[3] = payloadbundles[3] + get_int_or_0(player scripts\mp\utility\stats::getpersstat("damage"));
    return payloadbundles;
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18edd
// Size: 0x11a
function onplayerconnectstream() {
    if (!isdefined(self.sessionteam) || self.sessionteam == "spectator" || self.sessionteam == "none" || isdefined(self.initialprespawn) || self isplayerheadless()) {
        return false;
    }
    if (istrue(level.codcasterenabled) && self iscodcaster()) {
        return true;
    }
    if (isBrPracticeMode() && !isbot(self)) {
        self setclientomnvar("ui_br_extended_load_screen", 1);
        return false;
    }
    if (!usedropspawn()) {
        return true;
    }
    spawnpoint = getspawnpoint();
    self.initialprespawn = spawnpoint;
    self setclientomnvar("ui_br_extended_load_screen", 1);
    droporigin = playerstreamhintdroptoground(spawnpoint.origin);
    spawnintermission(droporigin, spawnpoint.angles);
    timeout = getdvarint(@"hash_3f23e1c2bbc2681a", 15000);
    scripts\mp\gametypes\br_public::playerstreamhintlocation(droporigin, timeout, 1, 1);
    return false;
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19000
// Size: 0x8b
function function_67a646dc2b984dac() {
    if (!isdefined(self.sessionteam) || self.sessionteam == "spectator" || self.sessionteam == "none" || self isplayerheadless()) {
        return false;
    }
    spawnpoint = self getorigin();
    self setclientomnvar("ui_br_extended_load_screen", 1);
    timeout = getdvarint(@"hash_3f23e1c2bbc2681a", 15000);
    scripts\mp\gametypes\br_public::playerstreamhintlocation(spawnpoint, timeout, 1, 1);
    return false;
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19094
// Size: 0x1f
function playerisstreaming() {
    return self.sessionstate == "intermission" && isdefined(self.initialprespawn);
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x190bc
// Size: 0x3a
function lastdroppableweaponchanged() {
    weap_index = -1;
    if (isdefined(self.lastdroppableweaponobj)) {
        weap_index = getweaponindex(self.lastdroppableweaponobj);
    }
    self setclientomnvar("ui_br_last_droppable_weapon", weap_index);
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x190fe
// Size: 0x2f
function brregenhealthadd(var_7c90dd5575d81006) {
    var_15123138426896f0 = scripts\mp\gametypes\br_gametypes::runbrgametypefunc("regenHealthAdd", var_7c90dd5575d81006);
    if (isdefined(var_15123138426896f0)) {
        return var_15123138426896f0;
    }
    return var_7c90dd5575d81006;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x19135
// Size: 0x2f
function brregendelayspeed(regenspeed) {
    var_15123138426896f0 = scripts\mp\gametypes\br_gametypes::runbrgametypefunc("regenDelaySpeed", regenspeed);
    if (isdefined(var_15123138426896f0)) {
        return var_15123138426896f0;
    }
    return regenspeed;
}

// Namespace br / scripts\mp\gametypes\br
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1916c
// Size: 0x35
function brmodeaddtoteamlives(player, team, context) {
    scripts\mp\gametypes\br_gametypes::runbrgametypefunc("addToTeamLives", player, team);
    player scripts\mp\gametypes\br_utility::function_b5483af58ee9f2c3(1, team, context);
}

// Namespace br / scripts\mp\gametypes\br
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x191a9
// Size: 0x34
function brmoderemovefromteamlives(player, team, context) {
    scripts\mp\gametypes\br_gametypes::runbrgametypefunc("removeFromTeamLives", player, team);
    player scripts\mp\gametypes\br_utility::function_b5483af58ee9f2c3(0, team, context);
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x191e5
// Size: 0x211
function updateplayerandteamcountui() {
    level notify("updatePlayerAndTeamCountUI");
    level endon("updatePlayerAndTeamCountUI");
    waittillframeend();
    if (scripts\mp\gametypes\br_gametypes::isbrgametypefuncdefined("updatePlayerAndTeamCountUI")) {
        scripts\mp\gametypes\br_gametypes::runbrgametypefunc("updatePlayerAndTeamCountUI");
        return;
    }
    totalplayers = level.players.size;
    aliveplayercount = 0;
    var_35068b9b9dc4c73f = 0;
    activeteams = [];
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
                activeteams[player.team] = 1;
            }
        }
        if (!isdefined(activeteams[player.team])) {
            result = scripts\mp\gametypes\br_gametypes::runbrgametypefunc("isTeamEliminated", player.team);
            if (isdefined(result)) {
                if (!result) {
                    activeteams[player.team] = 1;
                }
            }
        }
    }
    foreach (uibot in function_749723c2a45a0233()) {
        aliveplayercount++;
        activeteams[uibot.team] = 1;
    }
    /#
        var_6837562bca96ad34 = int(pow(2, 8)) - 1;
        assert(var_35068b9b9dc4c73f <= var_6837562bca96ad34);
        assert(aliveplayercount <= var_6837562bca96ad34);
        assert(activeteams.size <= var_6837562bca96ad34);
    #/
    var_47bf15e70ee220a = (var_35068b9b9dc4c73f << 16) + (activeteams.size << 8) + aliveplayercount;
    setomnvar("ui_br_match_stats", var_47bf15e70ee220a);
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x193fe
// Size: 0x82d
function br_updategameevents() {
    totalplayers = 0;
    level.teamswithplayers = [];
    var_9aa4910df893fab = 0;
    foreach (team in level.teamnamelist) {
        teamcount = getteamdata(team, "teamCount");
        if (isdefined(level.var_7b37b2193f163b9b)) {
            teamcount += getteamdata(team, "UIBotCount");
        }
        if (teamcount) {
            totalplayers += teamcount;
            var_9aa4910df893fab++;
            level.teamswithplayers[level.teamswithplayers.size] = team;
            if (var_9aa4910df893fab > 1) {
                break;
            }
        }
    }
    if (matchmakinggame() && !level.ingraceperiod && (!isdefined(level.disableforfeit) || !level.disableforfeit) && !scripts\cp_mp\utility\game_utility::function_fa7bfcc1d68b7b73()) {
        if (level.teambased) {
            if (level.teamswithplayers.size == 1 && game["state"] == "playing") {
                thread scripts\mp\gamelogic::onforfeit(level.teamswithplayers[0]);
                return;
            }
            if (level.teamswithplayers.size > 1) {
                level.forfeitinprogress = undefined;
                level notify("abort_forfeit");
            }
        } else {
            if (totalplayers == 1 && level.maxplayercount > 1) {
                thread scripts\mp\gamelogic::onforfeit();
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
        haslivescount = 0;
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
                    if (player scripts\mp\utility\stats::getpersstat("lives")) {
                        livescount[entry] = livescount[entry] + player scripts\mp\utility\stats::getpersstat("lives");
                        haslivescount = 1;
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
            alivecount += UIBotCount;
            var_4f212c7c91f56842 = 1;
            result = scripts\mp\gametypes\br_gametypes::runbrgametypefunc("isTeamEliminated", entry);
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
                continue;
            }
            if (alivecount == 1) {
                if (gettime() > getteamdata(entry, "oneLeftTime") + 5000 && !getteamdata(entry, "oneLeft")) {
                    teammatelives = 0;
                    players = getteamdata(entry, "players");
                    foreach (player in players) {
                        if (!isalive(player)) {
                            teammatelives += player scripts\mp\utility\stats::getpersstat("lives");
                        }
                    }
                    if (teammatelives == 0) {
                        setteamdata(entry, "oneLeftTime", gettime());
                        setteamdata(entry, "oneLeft", 1);
                        if (players.size + UIBotCount > 1) {
                            [[ level.ononeleftevent ]](entry);
                        }
                    }
                }
                continue;
            }
            setteamdata(entry, "oneLeft", 0);
        }
        if (!var_4351d3695cbe4fd7 && !haslivescount && !istrue(var_86e43c44ce72320b)) {
            if (istrue(level.postgameexfil) && level.gameended) {
                level notify("exfil_continue_game_end");
            }
            if (istrue(level.nukeinfo.incoming)) {
                return;
            }
            return [[ level.ondeadevent ]]("all");
        }
        if (istrue(level.postgameexfil) && level.gameended) {
            level notify("exfil_continue_game_end");
        }
        if (!istrue(level.skipondeadevent) && !istrue(level.nukeinfo.incoming)) {
            foreach (entry in var_3c4188e57ee38e07) {
                if (level.multiteambased) {
                    setteamdata(entry, "deathEvent", 1);
                    [[ level.ondeadevent ]](entry);
                    continue;
                }
                return [[ level.ondeadevent ]](entry);
            }
        }
    } else {
        livescount = 0;
        foreach (player in level.players) {
            if (player.team == "spectator" || player.team == "codcaster") {
                continue;
            }
            livescount += player scripts\mp\utility\stats::getpersstat("lives");
        }
        alivecounttotal = 0;
        foreach (entry in level.teamnamelist) {
            alivecounttotal += getteamdata(entry, "aliveCount");
        }
        if (!alivecounttotal && !livescount) {
            if (istrue(level.nukeinfo.incoming)) {
                return;
            }
            return [[ level.ondeadevent ]]("all");
        }
        liveplayers = getpotentiallivingplayers();
        if (liveplayers.size == 1) {
            return [[ level.ononeleftevent ]]("all");
        }
    }
    scripts\mp\gametypes\br_gametypes::runbrgametypefunc("postUpdateGameEvents");
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19c33
// Size: 0x20
function lowpopallowtweaks() {
    return istrue(level.lowpopcheck) && getdvarint(@"hash_7c1f8a5958fe9d4", 1);
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x19c5c
// Size: 0x3c
function br_laststandfinishplayerisincapacitated(var_a11643fdeedee81b) {
    var_f750eac01a3c640a = istrue(var_a11643fdeedee81b) && scripts\mp\gametypes\br_gulag::checkgulagusecount();
    return istrue(self.inlaststand) && !scripts\mp\gametypes\br_public::hasselfrevivetoken() && !var_f750eac01a3c640a;
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19ca1
// Size: 0x302
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
                continue;
            }
            foreach (player in level.teamdata[entry]["alivePlayers"]) {
                if (player br_laststandfinishplayerisincapacitated(var_a11643fdeedee81b)) {
                    victims[victims.size] = player;
                }
            }
        }
    } else {
        foreach (player in level.players) {
            if (player br_laststandfinishplayerisincapacitated(var_a11643fdeedee81b)) {
                victims[victims.size] = player;
                continue;
            }
            if (isalive(player)) {
                attackers[attackers.size] = player;
            }
        }
    }
    if (!scripts\mp\gametypes\br_public::istutorial()) {
        scripts\mp\gametypes\br_public::brleaderdialog("finish_calls", 0, attackers);
        foreach (player in attackers) {
            player setclientomnvar("ui_br_end_game_splash_type", 19);
            player playlocalsound("br_finish_them_splash");
        }
        foreach (player in victims) {
            player hudoutlineenable("outline_nodepth_red");
        }
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19fab
// Size: 0x223
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
                    continue;
                }
                var_17077b9dae232349 = 1;
                break;
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
                continue;
            }
            var_90b405fe6856a3a4++;
            if (var_90b405fe6856a3a4 > 1) {
                return;
            }
        }
    }
    if (var_90b405fe6856a3a4 == 0 || !var_1d0bd18dd6759d61) {
        return;
    }
    assert(var_90b405fe6856a3a4 == 1);
    level.laststandfinisherdone = 1;
    br_highlightlaststandfinishplayers();
}

// Namespace br / scripts\mp\gametypes\br
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1a1d6
// Size: 0x639
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
    killedvictim = 0;
    var_6a9853a7ef309b8f = [];
    var_fa2dfb970d051f16 = [];
    foreach (entry in level.teamnamelist) {
        var_b1fd2c57a16c6e04 = 1;
        var_f22fb09a173dcc1c = [];
        var_7b618684adbe33f6 = 0;
        foreach (player in level.teamdata[entry]["alivePlayers"]) {
            isingulag = istrue(var_a11643fdeedee81b) && player scripts\mp\gametypes\br_public::isplayerinorgoingtogulag();
            if (isingulag) {
                continue;
            }
            if (istrue(var_9c14ae6e04bbd667) && isdefined(victim) && victim == player) {
                var_7b618684adbe33f6 = 1;
                continue;
            }
            isinlaststand = istrue(player.inlaststand) || isdefined(victim) && victim == player;
            if (isinlaststand && !player scripts\mp\gametypes\br_public::hasselfrevivetoken() && !istrue(player namespace_833bd5cc623ca701::function_a35fff2ff233592a()) && !player playeriszombie()) {
                var_f22fb09a173dcc1c[var_f22fb09a173dcc1c.size] = player;
                continue;
            }
            var_b1fd2c57a16c6e04 = 0;
            break;
        }
        var_db5c349fb62d9ac6 = !istrue(level.brgametype.var_b43745b85f249e68) && var_b1fd2c57a16c6e04 && (var_f22fb09a173dcc1c.size > 0 || istrue(var_9c14ae6e04bbd667) && var_7b618684adbe33f6);
        if (istrue(var_db5c349fb62d9ac6)) {
            var_39341f43dd2cc6f0 = istrue(level.brgametype.respawnenable) && isdefined(victim) && istrue(victim.issolo) && (!isdefined(victim.respawndelay) || victim.respawndelay <= 0);
            var_db5c349fb62d9ac6 = !istrue(var_39341f43dd2cc6f0);
            if (var_39341f43dd2cc6f0) {
                killedvictim = 1;
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
                    killedvictim = 1;
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
                    attackerteammates = level.teamdata[attacker.team]["alivePlayers"];
                    foreach (attackerteammate in attackerteammates) {
                        attackerteammate thread namespace_6b49ddb858f34366::function_8c38798d6a558ad0();
                        attackerteammate thread scripts\mp\events::killeventtextpopup(#"team_wiped", 0);
                        attackerteammate thread scripts\mp\utility\points::doScoreEvent(#"team_wiped", attackerteammate.wipeweapon);
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
                if (!isdefined(var_6a9853a7ef309b8f[attacker.team]) && !scripts\mp\damage::function_80ade967129c9845()) {
                    var_6a9853a7ef309b8f[attacker.team] = 1;
                    foreach (player in level.teamdata[attacker.team]["players"]) {
                        if (!istrue(player isplayeringulag())) {
                            player playlocalsound("ui_team_wipe_splash");
                        }
                    }
                }
            }
            level callback::callback("on_squad_wiped", {#victim:victim, #attackers:attackers});
            namespace_8361bad7391de074::onsquadwiped(attackers);
        }
    }
    level.var_f44d8c2d0a8691a8 = undefined;
    return killedvictim;
}

// Namespace br / scripts\mp\gametypes\br
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1a818
// Size: 0x8c
function teamwipedobituary(victim, attacker, laststandweapon) {
    waitframe();
    if (getdvarint(@"hash_6084a01accf3b2eb", 1)) {
        if (isdefined(victim)) {
            obitplayers = [];
            if (isdefined(level.var_c5877dbe60fddbf6)) {
                obitplayers = level.var_c5877dbe60fddbf6;
            }
            obitplayers = array_combine(obitplayers, level.teamdata[attacker.team]["alivePlayers"]);
            obituary(victim, attacker, laststandweapon, "MOD_TEAM_WIPED", obitplayers);
        }
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a8ac
// Size: 0x24
function brdisabledamagestattracking(player) {
    if (brgulagdamagefilter(player)) {
        return false;
    }
    if (isagent(player)) {
        return false;
    }
    return true;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a8d9
// Size: 0x134
function initializeaardata(player) {
    if (player rankingenabled() && player hasplayerdata()) {
        player setplayerdata(level.var_5d69837cf4db0407, "aarValue", 0, 0);
        player setplayerdata(level.var_5d69837cf4db0407, "aarValue", 1, 0);
        player setplayerdata(level.var_5d69837cf4db0407, "aarValue", 2, 0);
        player setplayerdata(level.var_5d69837cf4db0407, "aarValue", 3, 0);
        player setplayerdata(level.var_5d69837cf4db0407, "aarValue", 4, 0);
        player setplayerdata(level.var_5d69837cf4db0407, "aarValue", 5, 0);
        player setplayerdata(level.var_5d69837cf4db0407, "aarValue", 6, 0);
        player setplayerdata(level.var_5d69837cf4db0407, "aarValue", 7, 0);
        initialxp = player getplayerdata("common", "mpProgression", "playerLevel", "xp");
        player setplayerdata(level.var_5d69837cf4db0407, "aarValue", 8, initialxp);
        player setplayerdata(level.var_5d69837cf4db0407, "aarValue", 9, initialxp);
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1aa15
// Size: 0x301
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
        combatXP = player scripts\mp\utility\stats::getpersstat("combatXP");
        if (!isdefined(combatXP)) {
            combatXP = 0;
        }
        player setplayerdata(level.var_5d69837cf4db0407, "aarValue", 0, combatXP);
        missionXP = player scripts\mp\utility\stats::getpersstat("missionXP");
        if (!isdefined(missionXP)) {
            missionXP = 0;
        }
        player setplayerdata(level.var_5d69837cf4db0407, "aarValue", 1, missionXP);
        lootingXP = player scripts\mp\utility\stats::getpersstat("lootingXP");
        if (!isdefined(lootingXP)) {
            lootingXP = 0;
        }
        player setplayerdata(level.var_5d69837cf4db0407, "aarValue", 2, lootingXP);
        supportXP = player scripts\mp\utility\stats::getpersstat("supportXP");
        if (!isdefined(supportXP)) {
            supportXP = 0;
        }
        player setplayerdata(level.var_5d69837cf4db0407, "aarValue", 3, supportXP);
        reconXP = player scripts\mp\utility\stats::getpersstat("reconXP");
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
        squadPlayXP = player scripts\mp\utility\stats::getpersstat("squadPlayXP");
        player setplayerdata(level.var_5d69837cf4db0407, "aarValue", 7, isdefined(squadPlayXP) ? squadPlayXP : 0);
        initialxp = player getplayerdata(level.var_5d69837cf4db0407, "aarValue", 8);
        finalxp = initialxp + player scripts\mp\utility\stats::getpersstat("summary")["xp"];
        player setplayerdata(level.var_5d69837cf4db0407, "aarValue", 9, finalxp);
        player setplayerdata("common", "brSubGameType", scripts\cp_mp\utility\game_utility::function_6c1fce6f6b8779d5());
        player notify("br_player_aar_data_set");
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1ad1e
// Size: 0x45
function briskillstreakallowed(streakitem, slotnumber) {
    if (isdefined(self.vehicle)) {
        streakname = streakitem.streakname;
        if (streakname == "manual_turret") {
            return false;
        }
    }
    return true;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ad6c
// Size: 0x5e
function brkillstreakbeginusefunc(streakinfo) {
    if (!isdefined(streakinfo)) {
        return 0;
    }
    player = streakinfo.owner;
    if (!isdefined(player)) {
        return 0;
    }
    if (isplayer(player) && !istrue(streakinfo.skipequippedstreakcheck) && !player scripts\mp\gametypes\br_pickups::doesstreakinfomatchequippedstreak(streakinfo)) {
        return 0;
    }
    return scripts\mp\killstreaks\killstreaks::streakglobals_onkillstreakbeginuse(streakinfo);
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1add3
// Size: 0xf
function brmodevalidatekillstreakslot(slotnumber) {
    return slotnumber == 1;
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1adeb
// Size: 0x52
function killstreakweaponfiredcontinue() {
    curweapon = self.currentprimaryweapon;
    if (isdefined(curweapon) && isdefined(curweapon.basename) && curweapon.basename == "iw9_spotter_scope_mp") {
        self setweaponammoclip(curweapon, self getcurrentweaponclipammo() + 1);
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1ae45
// Size: 0x128
function function_258c4f40dee8189a(var_bde7478b4a6080ad, var_bde7468b4a607e7a, radius) {
    if (isdefined(var_bde7478b4a6080ad) && isdefined(var_bde7468b4a607e7a) && isdefined(radius)) {
        setcachedclientomnvar("ui_compass_tacopsmap_cursor_pos_override_x", var_bde7478b4a6080ad);
        setcachedclientomnvar("ui_compass_tacopsmap_cursor_pos_override_y", var_bde7468b4a607e7a);
        setcachedclientomnvar("ui_compass_tacopsmap_size_override", radius);
        return;
    }
    if (isdefined(level.br_circle) && isdefined(level.br_circle.dangercircleent)) {
        setcachedclientomnvar("ui_compass_tacopsmap_cursor_pos_override_x", level.br_circle.dangercircleent.origin[0]);
        setcachedclientomnvar("ui_compass_tacopsmap_cursor_pos_override_y", level.br_circle.dangercircleent.origin[1]);
        setcachedclientomnvar("ui_compass_tacopsmap_size_override", level.br_circle.dangercircleent.origin[2]);
        return;
    }
    setcachedclientomnvar("ui_compass_tacopsmap_cursor_pos_override_x", 0);
    setcachedclientomnvar("ui_compass_tacopsmap_cursor_pos_override_y", 0);
    setcachedclientomnvar("ui_compass_tacopsmap_size_override", 0);
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1af75
// Size: 0x8
function function_7dbb8165d792b06c() {
    return namespace_95d8d8ec67e3e074::function_3ae9c05025cbac2d();
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1af86
// Size: 0x8
function function_749723c2a45a0233() {
    return namespace_95d8d8ec67e3e074::function_749723c2a45a0233();
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1af97
// Size: 0x8
function function_1bbd21d289ba8a92() {
    return namespace_95d8d8ec67e3e074::function_1bbd21d289ba8a92();
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1afa8
// Size: 0x96
function function_227ca42a35b0398b(team) {
    uibots = function_749723c2a45a0233();
    if (!level.teambased || !isdefined(team) || team == "all") {
        return (uibots.size == 0);
    }
    foreach (uibot in uibots) {
        if (uibot.team == team) {
            return false;
        }
    }
    return true;
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b047
// Size: 0x24
function isgulagshutdown() {
    return istrue(level.usegulag) && istrue(level.gulag.shutdown);
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b074
// Size: 0x89
function function_50434e55c7907057() {
    self endon("disconnect");
    if (!istrue(level.br_prematchstarted)) {
        if (scripts\cp_mp\utility\game_utility::isbrstylegametype() && !istrue(level.var_595938569c3fe806)) {
            return;
        }
        var_968bd61837a9c038 = getmatchrulesdata("commonOption", "respawnArmor");
        respawnReservePlates = getmatchrulesdata("commonOption", "respawnReservePlates");
        namespace_f8d3520d3483c1::givestartingarmor(var_968bd61837a9c038, undefined, respawnReservePlates);
        return;
    }
    if (!istrue(level.br_prematchstarted)) {
        level waittill("infils_ready");
    }
    namespace_f8d3520d3483c1::givestartingarmor();
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b105
// Size: 0x5a
function function_c8915ac8c8987452() {
    var_a81adeb0e1f89320 = level.br_pickups.maxcounts["brloot_armor_plate"];
    if (istrue(level.var_6d1d9e1b59c6f37)) {
        var_a81adeb0e1f89320 = level.var_6d1d9e1b59c6f37;
    }
    if (istrue(self.hasplatepouch)) {
        var_a81adeb0e1f89320 += level.var_6835a3d279520dc9;
    }
    return var_a81adeb0e1f89320;
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b168
// Size: 0x31
function setplayerprematchallows() {
    val::set("prematch", "player_for_spawn_logic", 0);
    self allowmelee(0);
    self disableoffhandweapons();
    level.freefallstartcb = &freefallstartfunc;
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b1a1
// Size: 0x12
function freefallstartfunc() {
    self allowmelee(1);
    self enableoffhandweapons();
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b1bb
// Size: 0x1d
function function_79762aa9e99f73a5(callbackthread) {
    function_15fa5f9b3a2b7a52();
    [[ callbackthread ]]();
    function_84e10866b5154784();
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b1e0
// Size: 0x3f
function function_15fa5f9b3a2b7a52() {
    assertex(!istrue(level.var_9d0412c6ba5a4084), "<dev string:x39d>");
    if (!isdefined(level.var_15fa5f9b3a2b7a52)) {
        level.var_15fa5f9b3a2b7a52 = 0;
    }
    level.var_15fa5f9b3a2b7a52++;
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b227
// Size: 0x30
function function_84e10866b5154784() {
    if (!isdefined(level.var_15fa5f9b3a2b7a52)) {
        return;
    }
    level.var_15fa5f9b3a2b7a52--;
    if (!level.var_15fa5f9b3a2b7a52) {
        level.var_15fa5f9b3a2b7a52 = undefined;
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b25f
// Size: 0x4b
function function_ea010c4d09365b32() {
    waittillframeend();
    while (!scripts\mp\flags::gameflagexists("prematch_done")) {
        waitframe();
    }
    scripts\mp\flags::gameflagwait("prematch_done");
    waittillframeend();
    while (istrue(level.var_15fa5f9b3a2b7a52)) {
        waitframe();
    }
    /#
        level.var_9d0412c6ba5a4084 = 1;
    #/
    level.struct_class_names = undefined;
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b2b2
// Size: 0x43
function function_90011db2fca825a8() {
    player = self;
    teamsize = level.teamdata[player.team]["players"].size;
    namespace_aead94004cf4c147::function_1db038329eb56917(player, 8554, 1, teamsize);
}

// Namespace br / scripts\mp\gametypes\br
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1b2fd
// Size: 0x117
function function_56869e118720ca3b(agent, killer) {
    if (isdefined(killer) && killer scripts\cp_mp\vehicles\vehicle::isvehicle()) {
        killer = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getdriver(killer);
    }
    if (isdefined(killer) && isplayer(killer)) {
        if (!isdefined(killer.agentkills)) {
            killer.agentkills = 1;
        } else {
            killer.agentkills += 1;
        }
        if (getsubgametype() != "plunder" && getsubgametype() != "risk") {
            killer scripts\mp\gametypes\br_public::updatebrscoreboardstat("agentKills", killer.agentkills);
        }
        var_832c0f7147235e86 = killer getplayerdata(level.var_5d69837cf4db0407, "playerStats", "modeStats", level.gametype, "agentKills");
        var_832c0f7147235e86 += 1;
        killer setplayerdata(level.var_5d69837cf4db0407, "playerStats", "modeStats", level.gametype, "agentKills", var_832c0f7147235e86);
        killer function_affe08e0629d5b85(agent);
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b41c
// Size: 0xb4
function function_affe08e0629d5b85(agent) {
    if (isagent(agent)) {
        category = namespace_14d36171baccf528::agentpers_getagentpersdata(agent, "category");
        tier = namespace_14d36171baccf528::agentpers_getagentpersdata(agent, "tier");
        elite = namespace_14d36171baccf528::agentpers_getagentpersdata(agent, "elite");
        if (category == "elites") {
            incpersstat("bossAgentKills", 1);
            return;
        }
        if (isdefined(tier)) {
            if (isdefined(elite) && elite == 1) {
                incpersstat("tier" + tier + "EliteAgentKills", 1);
                return;
            }
            incpersstat("tier" + tier + "NormalAgentKills", 1);
        }
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b4d8
// Size: 0x174
function tnbrMonitorLauncherAmmoRestock() {
    if (!isdefined(self) || !isplayer(self)) {
        return;
    }
    level endon("game_ended");
    self endon("death");
    self endon("disconnect");
    self notify("tnbrMonitorLauncherAmmoRestock");
    self endon("tnbrMonitorLauncherAmmoRestock");
    while (!scripts\mp\flags::gameflagexists("prematch_done")) {
        waitframe();
    }
    scripts\mp\flags::gameflagwait("prematch_done");
    while (true) {
        var_1f2c0996928e3110 = getdvarfloat(@"hash_2c016fd52c45f297", 5);
        wait var_1f2c0996928e3110;
        if (!function_ad443bbcdcf37b85(self)) {
            continue;
        }
        if (isplayerinorgoingtogulag()) {
            continue;
        }
        var_da2c96c009b81a2f = 0;
        weaponsarray = self getweaponslistprimaries();
        foreach (weapon in weaponsarray) {
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

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b654
// Size: 0x1e
function function_342438311e316357() {
    var_6f2ab6d7f309b05d = getdvarint(@"hash_4bded611decf41c5", 0);
    return var_6f2ab6d7f309b05d;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b67b
// Size: 0x54
function function_8d739ec62c568c41(modeloverride) {
    if (!isdefined(self.carryflag)) {
        self.carryflag = ter_op(isdefined(modeloverride), modeloverride, "prop_king_game_flag");
        self attach(self.carryflag, "tag_stowed_back3", 1);
        self setclientomnvar("ui_flag_player_hud_icon", 1);
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b6d7
// Size: 0x3b
function function_96d6b5e51dd4a63b() {
    if (isdefined(self.carryflag)) {
        self detach(self.carryflag, "tag_stowed_back3");
        self.carryflag = undefined;
        self setclientomnvar("ui_flag_player_hud_icon", 0);
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b71a
// Size: 0x6d
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

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b78f
// Size: 0x78
function function_be78b07e93d46175() {
    level endon("game_ended");
    var_9c88e85cf506df15 = getdvarint(@"hash_f4d1714fd7d712eb", 0);
    if (var_9c88e85cf506df15 > 0) {
        level waittill("prematch_done");
        wait max(0, var_9c88e85cf506df15 - 10);
        for (countdown = 10; countdown > 0; countdown--) {
            iprintln("MAP SWAP STARTING IN " + countdown);
            wait 1;
        }
        function_195990d8affba85b("test_observatory", "after", 10);
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1b80f
// Size: 0x66
function function_1b1c1195e27710b9(pingowner, pingindex) {
    if (isdefined(pingowner) && isdefined(pingindex)) {
        pingtype = pingowner calloutmarkerping_gettype(pingindex);
        if (isdefined(pingtype) && pingtype == 9) {
            if (!isdefined(pingowner.var_cb9581fc7ff5f394)) {
                pingowner.var_cb9581fc7ff5f394 = 0;
            }
            pingowner.var_cb9581fc7ff5f394++;
        }
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b87d
// Size: 0x50
function function_9c8dfd3b19180b63() {
    if (getdvarint(@"hash_738b7382a23ac132", 0)) {
        return;
    }
    while (!scripts\mp\flags::gameflagexists("prematch_done")) {
        waitframe();
    }
    scripts\mp\flags::gameflagwait("prematch_done");
    scripts\engine\utility::registersharedfunc("ai", "dropLootOnAgentDeath", &namespace_bfef6903bca5845d::function_82ed67ae79913551);
    namespace_bfef6903bca5845d::function_5aee5d819f7dfd1c();
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1b8d5
// Size: 0x6c
function function_525d65f5d0d3200e() {
    level.var_abe4208a372b7336 = [];
    level.var_27feb4a06fd158e3 = [];
    namespace_e2a930dc2e127364::function_de7ceb99406215a9(&function_d034a10c85c82581);
    namespace_e2a930dc2e127364::function_605a755fde14133a(&function_da2be124a9597ee2);
    namespace_e2a930dc2e127364::function_547c48dc070b2109(&function_8751cff989bde6a0);
    if (getdvarint(@"hash_eb0811ead28c4f53", 0)) {
        level.var_fb612dfbdcf2216b = [];
        utility::registersharedfunc("redeploy_drone", "can_use_callback", &function_556068401b385b9a);
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b949
// Size: 0x21
function function_6315a065e5b1efa2(func) {
    level.var_abe4208a372b7336[level.var_abe4208a372b7336.size] = func;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b972
// Size: 0x21
function function_80fc169a9ec33825(func) {
    level.var_27feb4a06fd158e3[level.var_27feb4a06fd158e3.size] = func;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b99b
// Size: 0x21
function function_e618af88d1d372ed(func) {
    level.var_fb612dfbdcf2216b[level.var_fb612dfbdcf2216b.size] = func;
}

// Namespace br / scripts\mp\gametypes\br
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1b9c4
// Size: 0x9e
function function_d034a10c85c82581(instance, player, edgeindex, isvertical, isinverted, var_9cb491b9ab8ea354) {
    foreach (func in level.var_abe4208a372b7336) {
        result = [[ func ]](instance, player, edgeindex, isvertical, isinverted, var_9cb491b9ab8ea354);
        if (isdefined(result)) {
            return result;
        }
    }
    return undefined;
}

// Namespace br / scripts\mp\gametypes\br
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1ba6b
// Size: 0xa1
function function_da2be124a9597ee2(instance, player, edgeindex, isinverted) {
    foreach (func in level.var_27feb4a06fd158e3) {
        result = [[ func ]](instance, player, edgeindex, isinverted);
        if (isdefined(result)) {
            return result;
        }
    }
    if (armor::function_6aa482957b62905c(player.currentweapon)) {
        return 0;
    }
    return 1;
}

// Namespace br / scripts\mp\gametypes\br
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1bb15
// Size: 0x77
function function_556068401b385b9a(instance, player) {
    foreach (func in level.var_fb612dfbdcf2216b) {
        result = [[ func ]](instance, player);
        if (isdefined(result)) {
            return result;
        }
    }
    return 1;
}

// Namespace br / scripts\mp\gametypes\br
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x1bb95
// Size: 0x5e
function function_8751cff989bde6a0(instance, player, edgeindex, isinverted, isvertical, var_7bd9fd9d3e7c7aa) {
    if (!isdefined(player) || !isdefined(var_7bd9fd9d3e7c7aa)) {
        return;
    }
    if (istrue(isvertical)) {
        instance thread function_21f56aff95282deb(player, var_7bd9fd9d3e7c7aa, isinverted);
        return;
    }
    instance thread function_35d52997ae7d7e1b(player, edgeindex, var_7bd9fd9d3e7c7aa);
}

// Namespace br / scripts\mp\gametypes\br
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x1bbfb
// Size: 0xfd
function private function_21f56aff95282deb(player, var_7bd9fd9d3e7c7aa, isinverted) {
    player endon("death_or_disconnect");
    if (getdvarint(@"hash_85915b7dc4e50c15", 1) == 1) {
        dir = var_7bd9fd9d3e7c7aa[2];
        if (istrue(isinverted)) {
            dir *= -1;
        }
        if (dir == -1) {
            player waittill_any_3("ascender_detached", "ascender_cancel", "ascender_solo_cancel");
            wait 0.5;
            contents = scripts\engine\trace::create_contents(0, 1, 1, 1, 0, 1, 1);
            result = scripts\mp\gametypes\br_public::raytraceoffset(player.origin, 0, 0, 5, -20000, contents);
            if (result["fraction"] == 1 || result["position"][2] < function_cc755ff7170d3dd0()) {
                snappedorigin = getclosestpointonnavmesh(player.origin);
                player setorigin(snappedorigin);
            }
        }
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x1bd00
// Size: 0x1a6
function private function_35d52997ae7d7e1b(player, edgeindex, var_7bd9fd9d3e7c7aa) {
    if (!isdefined(var_7bd9fd9d3e7c7aa)) {
        var_7bd9fd9d3e7c7aa = (0, 0, 1);
    }
    result = player waittill_any_timeout_2(1, "death_or_disconnect", "ascender_attached");
    if (is_equal(result, "ascender_attached") && !isdefined(player.var_33cb9daa5bf01ec1)) {
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

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1beae
// Size: 0x39
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

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1beef
// Size: 0x34
function function_bd2737827d4fc5d7(weaponobj) {
    ammotype = br_ammo_type_for_weapon(weaponobj);
    var_31b36738ff4eacd = self.br_ammo[ammotype];
    return var_31b36738ff4eacd;
}

// Namespace br / scripts\mp\gametypes\br
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1bf2c
// Size: 0x30
function function_d62ff7c7859f5b9c(weaponobj, var_3e9ba1ba3b3ac105) {
    ammotype = br_ammo_type_for_weapon(weaponobj);
    br_ammo_take_type(self, ammotype, var_3e9ba1ba3b3ac105);
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1bf64
// Size: 0x45d
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
        addstruct(var_f13412448e4cd8a6);
        structcache = spawnstruct();
        structcache.origin = (3906.32, -1963.43, 0);
        structcache.angles = (0, 0, 0);
        structcache.script_noteworthy = "april_cache_1_1";
        addstruct(structcache);
        structcache = spawnstruct();
        structcache.origin = (4006.32, -1963.43, 0);
        structcache.angles = (0, 0, 0);
        structcache.script_noteworthy = "april_cache_1_2";
        addstruct(structcache);
        structcache = spawnstruct();
        structcache.origin = (3956.32, -1963.43, 0);
        structcache.angles = (0, 0, 0);
        structcache.script_noteworthy = "april_cache_1_3";
        addstruct(structcache);
    }
    var_1a9cebee5b016e80 = 0;
    for (i = 1; ; i++) {
        if (!isdefined(getstruct("april_rainbow_" + i, "script_noteworthy"))) {
            break;
        }
        var_1a9cebee5b016e80 += 1;
    }
    if (var_1a9cebee5b016e80 == 0) {
        return;
    }
    tospawn = randomint(var_1a9cebee5b016e80) + 1;
    var_2fff16a950675118 = getstruct("april_rainbow_" + tospawn, "script_noteworthy");
    rainbow = spawn("script_model", var_2fff16a950675118.origin);
    rainbow.angles = var_2fff16a950675118.angles;
    rainbow setmodel("br_april_rainbow");
    rainbow setscriptablepartstate("rainbow", "on");
    if (getdvarint(@"hash_4292bf6ab9d3b43c", 1) == 1) {
        return;
    }
    caches = [];
    for (j = 1; ; j++) {
        cachespawn = getstruct("april_cache_" + tospawn + "_" + j, "script_noteworthy");
        if (!isdefined(cachespawn)) {
            break;
        }
        cache = spawnscriptable("br_loot_cache_april", cachespawn.origin, cachespawn.angles);
        cache setscriptablepartstate("body", "closed_usable");
        caches[caches.size] = cache;
    }
    if (caches.size > 0) {
        foreach (cache in caches) {
            cache.contents = getscriptablelootcachecontents(cache);
            cache.contents[cache.contents.size] = "brloot_plunder_cash_legendary_1";
        }
        snipercache = random(caches);
        snipercache.contents[snipercache.contents.size] = "brloot_weapon_sn_alpha50_april";
    }
    for (j = 1; ; j++) {
        cachespawn = getstruct("april_fake_cache_" + tospawn + "_" + j, "script_noteworthy");
        if (!isdefined(cachespawn)) {
            break;
        }
        cache = spawnscriptable("br_loot_cache_april", cachespawn.origin, cachespawn.angles);
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c3c9
// Size: 0x84
function function_e83ab39a1e762ead(itemname) {
    if (isdefined(itemname) && scripts\mp\gametypes\br_pickups::function_36de08ea672b354c(itemname)) {
        return namespace_708f627020de59d3::function_bdd930eee0042052();
    }
    if (isdefined(itemname) && scripts\mp\gametypes\br_pickups::isquesttablet(itemname)) {
        return 0;
    }
    if (isdefined(itemname) && br_public::isammo(itemname) && istrue(level.var_cf32b38db66d1f3b) && !istrue(level.var_3ea6ceb7358d49df)) {
        return 0;
    }
    if (isdefined(itemname) && br_pickups::function_f8f4cf026fb2b9f8(itemname) && !istrue(level.var_3d804d3022029476)) {
        return 0;
    }
    return 1;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c456
// Size: 0x4d
function function_d0f9fbf3f0f8c739(team) {
    UIBotCount = 0;
    if (isdefined(level.var_7b37b2193f163b9b)) {
        UIBotCount = getteamdata(team, "UIBotCount");
        if (UIBotCount < 0) {
            assertmsg("<dev string:x3cc>" + team);
            UIBotCount = 0;
        }
    }
    return UIBotCount;
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c4ac
// Size: 0x43
function function_3ac2a599d142369d() {
    packedvalue = 0;
    missionvalue = 0;
    if (isdefined(self.brmissionscompleted)) {
        missionvalue += self.brmissionscompleted;
    }
    if (missionvalue > 15) {
        missionvalue = 15;
    }
    packedvalue = missionvalue;
    return packedvalue;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c4f8
// Size: 0x97
function function_aa670c3018e4340e(attacker) {
    dropstruct = scripts\mp\gametypes\br_pickups::function_7b9f3966a7a42003();
    dropinfo = getitemdroporiginandangles(dropstruct, self.origin, self.angles, self, randomint(359));
    dropinfo.teamselect = [#"teamselect", attacker getentitynumber()];
    dropbag = spawnpickup("brloot_scavenger_bag", dropinfo, 1, 1, undefined, 1);
    dropbag.player = attacker;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c597
// Size: 0x3ed
function onscavengerbagpickup(bag) {
    self endon("death_or_disconnect");
    function_5833a495de752d1d(bag);
    var_c8a8cadcfbff950a = getdvarint(@"hash_897ac2ba3a23b63c", 50);
    var_c8cc171531c09a7 = getdvarint(@"hash_92da4d55bf73435e", 1);
    var_5cde174b082ce9cb = [];
    var_26cb9b5f43f1613c = [];
    spawnitemsdata = [];
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
                    var_26cb9b5f43f1613c[var_26cb9b5f43f1613c.size] = [ammotype, var_c1192c297bbf292f];
                }
            }
        }
    }
    if (var_c8a8cadcfbff950a > 0 && istrue(level.br_plunder_enabled)) {
        var_68552b43573a5b6c = int(max(self.plundercount + var_c8a8cadcfbff950a - level.br_plunder.plunderlimit, 0));
        var_d72f2599b722086 = int(var_c8a8cadcfbff950a - var_68552b43573a5b6c);
        var_8e5dd667f5bf1e1e = "brloot_plunder_cash_uncommon_1";
        if (var_d72f2599b722086 > 0) {
            var_26cb9b5f43f1613c[var_26cb9b5f43f1613c.size] = [var_8e5dd667f5bf1e1e, var_c8a8cadcfbff950a];
        } else if (var_68552b43573a5b6c > 0) {
            spawnitemsdata[spawnitemsdata.size] = [var_8e5dd667f5bf1e1e, var_68552b43573a5b6c];
        }
    }
    if (getmatchrulesdata("brData", "scavengerGiveArmor")) {
        var_de1443493303f024 = getdvarint(@"hash_2e6456a167d44e6e", 2);
        var_26cb9b5f43f1613c[var_26cb9b5f43f1613c.size] = ["brloot_armor_plate", var_de1443493303f024];
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
            remainingitems = scripts\mp\gametypes\br_pickups::onusecompleted(fakeent, 1, 1);
            itemsgiven = count - remainingitems;
            if (remainingitems > 0) {
                spawnitemsdata[spawnitemsdata.size] = [scriptablename, remainingitems];
            }
            if (itemsgiven > 0) {
                var_5cde174b082ce9cb[var_5cde174b082ce9cb.size] = [scriptablename, itemsgiven];
            }
        }
    }
    if (spawnitemsdata.size > 0) {
        foreach (itemdata in spawnitemsdata) {
            scriptablename = itemdata[0];
            count = itemdata[1];
            dropstruct = function_7b9f3966a7a42003();
            dropinfo = getitemdroporiginandangles(dropstruct, self.origin, self.angles, self);
            spawnpickup(scriptablename, dropinfo, int(count), 1, undefined, 0);
        }
    }
    childthread function_a67bddd1f14c2074(var_5cde174b082ce9cb);
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1c98c
// Size: 0xb3
function private function_a67bddd1f14c2074(var_745efa8e3fc97f41) {
    if (isdefined(var_745efa8e3fc97f41) && var_745efa8e3fc97f41.size > 0) {
        fakeent = spawnstruct();
        foreach (dataarr in var_745efa8e3fc97f41) {
            if (dataarr.size > 0) {
                fakeent.scriptablename = dataarr[0];
                fakeent.count = 0;
                if (dataarr.size > 1) {
                    fakeent.count = int(dataarr[1]);
                }
                scripts\mp\gametypes\br_pickups::updatelootsplash(fakeent);
            }
        }
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x1ca47
// Size: 0x1ee
function private function_22edbbcb7270df86(lootref, quantity, var_4b851655045b6066, dropexcess) {
    if (!isdefined(var_4b851655045b6066)) {
        var_4b851655045b6066 = 1;
    }
    if (!isdefined(dropexcess)) {
        dropexcess = 1;
    }
    results = spawnstruct();
    remainingcount = quantity;
    itemsgiven = 0;
    itemsdropped = 0;
    if (remainingcount > 0 && namespace_aead94004cf4c147::isbackpackinventoryenabled() && istrue(var_4b851655045b6066)) {
        lootid = namespace_38b993c4618e76cd::function_fae5e1d3de32d3f7(lootref);
        backpackslots = namespace_aead94004cf4c147::function_ed8f025d796c038(lootid);
        if (isdefined(backpackslots) && backpackslots.size > 0) {
            foreach (index in backpackslots) {
                slotcount = namespace_aead94004cf4c147::function_897b29adb37f06a7(index);
                slotmaxcount = namespace_aead94004cf4c147::function_e02526fc6db8443f(lootref);
                var_de4683afe6be36e5 = min(slotmaxcount - slotcount, remainingcount);
                if (var_de4683afe6be36e5 > 0) {
                    remainingcount -= var_de4683afe6be36e5;
                    itemsgiven += var_de4683afe6be36e5;
                    namespace_aead94004cf4c147::function_84772ebf836af5db(index, var_de4683afe6be36e5);
                }
                if (remainingcount <= 0) {
                    break;
                }
            }
        }
    }
    if (remainingcount > 0 && istrue(dropexcess)) {
        dropstruct = function_7b9f3966a7a42003();
        dropinfo = getitemdroporiginandangles(dropstruct, self.origin, self.angles, self);
        spawnpickup(lootref, dropinfo, int(remainingcount), 1, undefined, 0);
        itemsdropped = remainingcount;
        remainingcount = 0;
    }
    results.initialcount = quantity;
    results.itemsremaining = remainingcount;
    results.itemsgiven = itemsgiven;
    results.itemsdropped = itemsdropped;
    return results;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1cc3e
// Size: 0x9a
function function_2e1567e33e6cddf9(player) {
    var_b3c92413c48e5f33 = undefined;
    var_92fa0daf335cad50 = getlootscriptablearray("brloot_scavenger_bag");
    if (isdefined(var_92fa0daf335cad50) && var_92fa0daf335cad50.size > 0) {
        foreach (bag in var_92fa0daf335cad50) {
            if (bag.player == player) {
                if (!isdefined(var_b3c92413c48e5f33)) {
                    var_b3c92413c48e5f33 = [];
                }
                var_b3c92413c48e5f33[var_b3c92413c48e5f33.size] = bag;
            }
        }
    }
    return var_b3c92413c48e5f33;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1cce1
// Size: 0x24
function function_5833a495de752d1d(bag) {
    if (function_f483aacd19d70a1(bag)) {
        deregisterscriptableinstance(bag);
    }
    bag freescriptable();
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cd0d
// Size: 0x82
function function_ac65cef844e77ef3() {
    level endon("game_ended");
    if (isdefined(self) && isplayer(self)) {
        var_92fa0daf335cad50 = function_2e1567e33e6cddf9(self);
        if (isdefined(var_92fa0daf335cad50) && var_92fa0daf335cad50.size > 0) {
            foreach (bag in var_92fa0daf335cad50) {
                function_5833a495de752d1d(bag);
            }
        }
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cd97
// Size: 0x22
function function_758ee105bdf0c62d() {
    if (!istrue(self.var_54b9c134995ce717)) {
        self.var_54b9c134995ce717 = 1;
        thread function_ff6ad74932d3303b();
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cdc1
// Size: 0xa
function function_dd137d458f25fefb() {
    self notify("scavenger_unset");
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x1cdd3
// Size: 0x2b
function private function_ff6ad74932d3303b() {
    level endon("game_ended");
    waittill_any_2("death_or_disconnect", "scavenger_unset");
    scripts\mp\gametypes\br::function_ac65cef844e77ef3();
    self.var_54b9c134995ce717 = undefined;
}

// Namespace br / scripts\mp\gametypes\br
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x1ce06
// Size: 0x88
function private function_ae3e9266021180fb(params) {
    if (scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_isdriverseat(params.vehicle, params.seatid)) {
        if (!istrue(level.var_9712837e844488b8[params.player.guid])) {
            level.var_9712837e844488b8[params.player.guid] = 1;
            scripts\cp_mp\challenges::function_8359cadd253f9604(params.player, "drive_once", 1);
        }
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1ce96
// Size: 0x68
function function_af6a6066a0a69f0f(lootid, lootname, quantity, maxcount) {
    if (namespace_708f627020de59d3::function_8a2768bc7f7c63ec(lootid)) {
        for (i = 0; i < function_b13e35608b336d65(self); i++) {
            currentlootid = namespace_aead94004cf4c147::function_6196d9ea9a30e609(i);
            if (currentlootid == 0) {
                return 1;
            }
        }
        return 0;
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1cf06
// Size: 0x33
function function_d2a98a2a8cc2018b() {
    if (getdvarint(@"hash_a9a2c1cfa33b946b", 0) == 0) {
        scripts\mp\gametypes\br_circle::function_eca79fa0f341ee08(21, &function_cfcd7e0ea59a1ff7, &function_f9708b9015e87ffa, &scripts\mp\ammorestock::function_bae375f2dcee0889, &scripts\mp\ammorestock::function_64716349b6b346ee);
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1cf41
// Size: 0xc8
function function_cfcd7e0ea59a1ff7(var_819edacdacb810e4, dangercircleradius, thresholdradius) {
    if (istrue(level.var_1d5700ca4212f585)) {
        return;
    }
    maxdistance = dangercircleradius + level.var_53c0fa66001cff52;
    maxdistancesquared = maxdistance * maxdistance;
    foreach (loc in level.ammorestocklocs) {
        if (!istrue(loc.disabled) && distance2dsquared(loc.origin, var_819edacdacb810e4) > maxdistancesquared) {
            scripts\mp\ammorestock::function_9cabc01b47357528(loc);
        }
    }
}

// Namespace br / scripts\mp\gametypes\br
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d011
// Size: 0xa4
function function_f9708b9015e87ffa() {
    if (istrue(level.var_1d5700ca4212f585)) {
        return;
    }
    var_e5ceb61e77e932a = [];
    foreach (loc in level.ammorestocklocs) {
        if (!istrue(loc.disabled) && !namespace_bbc79db4c3949a5c::function_ee854fdd1e77efc4(loc.origin, level.var_53c0fa66001cff52)) {
            var_e5ceb61e77e932a[var_e5ceb61e77e932a.size] = loc;
            scripts\mp\ammorestock::function_9cabc01b47357528(loc);
        }
    }
    return var_e5ceb61e77e932a;
}

