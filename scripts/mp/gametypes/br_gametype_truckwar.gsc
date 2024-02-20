// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\mp\utility\stats.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\gamescore.gsc;
#using scripts\mp\utility\debug.gsc;
#using scripts\mp\utility\sound.gsc;
#using scripts\cp_mp\utility\omnvar_utility.gsc;
#using scripts\mp\gametypes\br_gametype_truckwar.gsc;
#using scripts\mp\gametypes\br.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\engine\scriptable.gsc;
#using scripts\mp\utility\disconnect_event_aggregator.gsc;
#using scripts\mp\gametypes\br_gametypes.gsc;
#using scripts\mp\gametypes\br_circle.gsc;
#using scripts\mp\flags.gsc;
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;
#using scripts\mp\class.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\hud_message.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using scripts\mp\gametypes\br_analytics.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\mp\gametypes\br_armory_kiosk.gsc;
#using script_21c19cfc7139d773;
#using scripts\engine\trace.gsc;
#using scripts\mp\gametypes\br_spectate.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using script_5bab271917698dc4;
#using scripts\mp\playerlogic.gsc;
#using scripts\cp_mp\execution.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\mp\gametypes\br_gulag.gsc;
#using script_a34750d17473c49;
#using scripts\mp\battlechatter_mp.gsc;
#using scripts\mp\gametypes\br_quest_util.gsc;
#using scripts\mp\utility\player.gsc;
#using script_4cdabcd91a92977;
#using scripts\mp\spectating.gsc;
#using scripts\mp\equipment\tac_insert.gsc;
#using scripts\common\anim.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;
#using scripts\mp\deathicons.gsc;
#using script_7c40fa80892a721;
#using scripts\mp\gametypes\br_c130.gsc;
#using scripts\mp\gametypes\obj_dom.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using script_5762ac2f22202ba2;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\supers.gsc;
#using script_2d9d24f7c63ac143;

#namespace namespace_7164d2949dc2f2a;

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1d0b
// Size: 0x18
function main() {
    level.var_cdc15ee14362fbf = &namespace_ea497db8cab34561::init;
    namespace_d20f8ef223912e12::main();
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d2a
// Size: 0x482
function init() {
    namespace_1f188a13f7e79610::function_66ab4fb2175555e1("veh9_mil_lnd_mrap");
    level thread brtruck_initfeatures();
    level thread brtruck_initpostmain();
    level thread brtruck_initdialog();
    level thread brtruck_initexternalfeatures();
    level.respawntimedisable = getdvarint(@"hash_e12689cc1f69a798", 0);
    level.var_4b3d0771df2c44a9 = 0;
    level.var_45496c9df00f2bd4 = 1;
    level.var_af6ec941d2b4e283 = getdvarint(@"hash_fad98da2f37e7fcf", 1) == 1;
    level.var_e12122c5431959b5 = getdvarint(@"hash_bc6debd70e4d4f9", 1) == 1;
    level.var_944b40a215902330 = 15;
    var_ae79928dc9519c10 = getdvar(@"hash_8fa9e9db3f08ed0c", "80000 50000 40000 30000 20000 15000 10000 0");
    if (var_ae79928dc9519c10 != "") {
        level.var_5a41c5287237c308 = [];
        var_ed059b813d0a9274 = strtok(var_ae79928dc9519c10, " ");
        foreach (size in var_ed059b813d0a9274) {
            level.var_5a41c5287237c308[level.var_5a41c5287237c308.size] = float(size);
        }
    }
    var_3de8c20ba880c90e = getdvar(@"hash_a957db23ca8fab2a", "330 120 100 90 80 70 60 50");
    if (var_3de8c20ba880c90e != "") {
        level.var_3d86f613dc0bfa16 = [];
        var_52903c0c13091421 = strtok(var_3de8c20ba880c90e, " ");
        foreach (size in var_52903c0c13091421) {
            level.var_3d86f613dc0bfa16[level.var_3d86f613dc0bfa16.size] = float(size);
        }
    }
    var_58fe32902d17047d = getdvar(@"hash_61ae4ac51ff20d99", "120 120 90 75 60 45 30 20");
    if (var_58fe32902d17047d != "") {
        level.var_dc008290077a7185 = [];
        var_4c462de43e6a8ed0 = strtok(var_58fe32902d17047d, " ");
        foreach (size in var_4c462de43e6a8ed0) {
            level.var_dc008290077a7185[level.var_dc008290077a7185.size] = float(size);
        }
    }
    level.var_59ff09549058dda2 = 1;
    level.var_5431e3914cfc0e23 = 1;
    level.var_a9ccaf325f3a76d = getdvarint(@"hash_e1a4b7a04f5a3725", 1) == 1;
    level.var_a02389e5d5497129 = getdvarfloat(@"hash_952460a08702c65", 50000);
    level.var_8fc109df2d334cda = getdvarfloat(@"hash_6940ee2d192ff206", 40000);
    level.var_463aba47317cacc2 = getdvarfloat(@"hash_4b8f9a9113c965f6", 10000);
    level.var_886566e69ee53d98 = getdvarfloat(@"hash_c06d40315e54bc8c", 30);
    level.var_e182232b582aa5d6 = getdvarfloat(@"hash_85028cd7a792b52", 220);
    level.var_411ce67dc4849722 = getdvarfloat(@"hash_c9183f48bb5dc926", 40);
    level.var_f28e1ed7f6adf52d = getdvarfloat(@"hash_3863b34660bf0d09", 60);
    level.var_84f1c23ed82e4ec5 = getdvarfloat(@"hash_b7628db816399549", 10);
    level.var_4d77d157099cf459 = getdvarfloat(@"hash_941583466b9ccb2d", 10);
    level.var_be52f2d0dee6b894 = getdvarint(@"hash_d4939fdb84b794f0", 1);
    level.var_15415172069d735f = getdvarfloat(@"hash_620ba5611e3d420b", 120);
    level.var_837cd01dc6486d8c = getdvarfloat(@"hash_92b3c04bd3014008", 330);
    level.var_6d02a364e8331928 = getdvarfloat(@"hash_f56e42c98f9f52bc", 1);
    if (level.var_af6ec941d2b4e283) {
        setdvar(@"hash_39a8907d7f184021", 1);
        level.br_circle_init_func = &alternatebrcircle;
    }
    namespace_17c25f0877bfb620::scriptable_addusedcallbackbypart("tag_buystation", &function_fe081d074870c23d);
    level init_airdrop_anims();
    level thread function_a614e0fee13eca53();
    namespace_f1d40c362677777e::registerondisconnecteventcallback(&function_c21d160bc19fc200);
    /#
        setdevdvarifuninitialized(@"hash_32b7f75982043672", 0);
        level thread watchspawninput();
    #/
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21b3
// Size: 0x78
function brtruck_initfeatures() {
    if (getdvarint(@"hash_32b7f75982043672", 0) == 1) {
        namespace_71073fa38f11492::disablefeature("circle");
        namespace_71073fa38f11492::disablefeature("dropbag");
        namespace_71073fa38f11492::enablefeature("allowLateJoiners");
    }
    namespace_71073fa38f11492::disablefeature("gulag");
    namespace_71073fa38f11492::disablefeature("plunderSites");
    namespace_71073fa38f11492::disablefeature("vehicleSpawns");
    namespace_71073fa38f11492::disablefeature("c130PlaneLine");
    namespace_71073fa38f11492::enablefeature("tabletReplace");
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2232
// Size: 0x250
function brtruck_initpostmain() {
    namespace_71073fa38f11492::registerbrgametypefunc("playerWelcomeSplashes", &brtruck_playerwelcomesplashes);
    namespace_71073fa38f11492::registerbrgametypefunc("onStartGameType", &onstartgametype);
    namespace_71073fa38f11492::registerbrgametypefunc("playerKilledSpawn", &playerkilledspawn);
    namespace_71073fa38f11492::registerbrgametypefunc("markPlayerAsEliminatedOnKilled", &markplayeraseliminatedonkilled);
    namespace_71073fa38f11492::registerbrgametypefunc("mayConsiderPlayerDead", &mayconsiderplayerdead);
    namespace_71073fa38f11492::registerbrgametypefunc("isTeamEliminated", &isteameliminated);
    namespace_71073fa38f11492::registerbrgametypefunc("infilSequence", &function_73bdf8b18e29b13f);
    namespace_71073fa38f11492::registerbrgametypefunc("playerNakedDropLoadout", &function_8d45ff943de1cfc4);
    waittillframeend();
    function_a5e20d193142774d();
    if (!isdefined(level.br_badcircleareas)) {
        level.br_badcircleareas = [];
    }
    if (issubstr(level.mapname, "saba")) {
        level.br_badcircleareas[level.br_badcircleareas.size] = namespace_c5622898120e827f::createinvalidcirclearea((67000, -40000, 0), 30000);
        level.br_badcircleareas[level.br_badcircleareas.size] = namespace_c5622898120e827f::createinvalidcirclearea((-3500, -47300, 0), 20000);
        level.br_badcircleareas[level.br_badcircleareas.size] = namespace_c5622898120e827f::createinvalidcirclearea((-42000, -64500, 0), 20000);
        level.br_badcircleareas[level.br_badcircleareas.size] = namespace_c5622898120e827f::createinvalidcirclearea((-39500, -31000, 0), 22000);
        level.br_badcircleareas[level.br_badcircleareas.size] = namespace_c5622898120e827f::createinvalidcirclearea((-49000, -8200, 0), 21000);
    }
    namespace_4b0406965e556711::gameflaginit("use_truck_respawn", 0);
    level.ontimelimit = &brtruck_ontimelimit;
    level.modeplayerkilledspawn = &playerkilledspawn;
    brtruck_cleanupents();
    level.validautoassignquests = [];
    level.validautoassignquests[0] = "assassination";
    level.validautoassignquests[1] = "domination";
    level.validautoassignquests[2] = "scavenger";
    level.startjuggdelivery = 0;
    if (!isdefined(level.var_c7b9749bcc6a6207)) {
        level.var_c7b9749bcc6a6207 = namespace_141c4634b6ea7b27::vehicle_interact_getleveldataforvehicle("veh9_mil_lnd_mrap").var_29f1ea79ed2b40dd;
    }
    if (level.var_af6ec941d2b4e283) {
        level thread function_d4864f0577158363();
    }
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2489
// Size: 0x27
function function_a5e20d193142774d() {
    function_70da934903ac5a5d("classtable:classtable_br_resurgence");
    function_70da934903ac5a5d("classtable:classtable_br_resurgence_circle2");
    function_70da934903ac5a5d("classtable:classtable_br_resurgence_circle3");
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24b7
// Size: 0x128
function function_70da934903ac5a5d(table) {
    if (!isdefined(level.var_c04b5edf3f9ea340)) {
        level.var_c04b5edf3f9ea340 = [];
    }
    var_a78225c464121e51 = level.var_c04b5edf3f9ea340.size;
    var_7d958726e11b327 = namespace_d19129e4fa5d176::function_df2933f96d726d71(table);
    level.var_c04b5edf3f9ea340[var_a78225c464121e51] = [];
    for (classindex = 0; classindex < var_7d958726e11b327; classindex++) {
        level.var_c04b5edf3f9ea340[var_a78225c464121e51][level.var_c04b5edf3f9ea340[var_a78225c464121e51].size] = function_a89b0ef8d36b3436(classindex, table);
    }
    level.var_77c121d31e587ba8 = [];
    foreach (circleindex, var_1a9e152363126a93 in level.var_c04b5edf3f9ea340) {
        if (isdefined(level.var_c04b5edf3f9ea340[circleindex]) && level.var_c04b5edf3f9ea340[circleindex].size > 0) {
            level.var_77c121d31e587ba8[circleindex] = randomintrange(0, level.var_c04b5edf3f9ea340[circleindex].size);
        }
    }
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25e6
// Size: 0x34b
function function_a89b0ef8d36b3436(classindex, table) {
    var_cfa6985254954fb3 = namespace_d19129e4fa5d176::function_c7a0b640c398497(table, classindex);
    loadout["loadoutArchetype"] = "archetype_assault";
    loadout["loadoutPrimary"] = var_cfa6985254954fb3.primaryweapon.weapon;
    loadout["loadoutPrimaryAttachment"] = var_cfa6985254954fb3.primaryweapon.attachment1;
    loadout["loadoutPrimaryAttachment2"] = var_cfa6985254954fb3.primaryweapon.attachment2;
    loadout["loadoutPrimaryAttachment3"] = var_cfa6985254954fb3.primaryweapon.attachment3;
    loadout["loadoutPrimaryAttachment4"] = var_cfa6985254954fb3.primaryweapon.attachment4;
    loadout["loadoutPrimaryAttachment5"] = var_cfa6985254954fb3.primaryweapon.attachment5;
    loadout["loadoutPrimaryCamo"] = var_cfa6985254954fb3.primaryweapon.camo;
    loadout["loadoutPrimaryReticle"] = var_cfa6985254954fb3.primaryweapon.reticle;
    loadout["loadoutSecondary"] = var_cfa6985254954fb3.secondaryweapon.weapon;
    loadout["loadoutSecondaryAttachment"] = var_cfa6985254954fb3.secondaryweapon.attachment1;
    loadout["loadoutSecondaryAttachment2"] = var_cfa6985254954fb3.secondaryweapon.attachment2;
    loadout["loadoutSecondaryAttachment3"] = var_cfa6985254954fb3.secondaryweapon.attachment3;
    loadout["loadoutSecondaryAttachment4"] = var_cfa6985254954fb3.secondaryweapon.attachment4;
    loadout["loadoutSecondaryAttachment5"] = var_cfa6985254954fb3.secondaryweapon.attachment5;
    loadout["loadoutSecondaryCamo"] = var_cfa6985254954fb3.secondaryweapon.camo;
    loadout["loadoutSecondaryReticle"] = var_cfa6985254954fb3.secondaryweapon.reticle;
    loadout["loadoutMeleeSlot"] = "none";
    loadout["loadoutEquipmentPrimary"] = var_cfa6985254954fb3.equipment.primary;
    loadout["loadoutEquipmentSecondary"] = var_cfa6985254954fb3.equipment.secondary;
    loadout["loadoutStreakType"] = "assault";
    loadout["loadoutKillstreak1"] = "none";
    loadout["loadoutKillstreak2"] = "none";
    loadout["loadoutKillstreak3"] = "none";
    loadout["loadoutSuper"] = "super_br_extract";
    loadout["loadoutPerks"] = [0:var_cfa6985254954fb3.perks.perk1, 1:var_cfa6985254954fb3.perks.perk2, 2:var_cfa6985254954fb3.perks.perk3, 3:var_cfa6985254954fb3.extraperks.perk1, 4:var_cfa6985254954fb3.extraperks.perk2, 5:var_cfa6985254954fb3.extraperks.perk3];
    loadout["loadoutGesture"] = "playerData";
    loadout["tableColumn"] = classindex;
    return loadout;
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2939
// Size: 0x13a
function brtruck_initdialog() {
    level endon("game_ended");
    game["dialog"]["match_start"] = "trkw_wzan_mdnt";
    game["dialog"]["primary_objective"] = "trkw_wzan_mdbs";
    game["dialog"]["vehicle_spawn_enabled"] = "trkw_wzan_vsnb";
    game["dialog"]["vehicle_spawn_disabled"] = "trkw_wzan_vsds";
    game["dialog"]["vehicle_under_attack"] = "trkw_wzan_vndt";
    game["dialog"]["vehicle_destroyed"] = "trkw_wzan_vhcd";
    game["dialog"]["vehicle_spawn_over"] = "trkw_wzan_vsvr";
    game["dialog"]["armor_upgraded"] = "trkw_wzan_armr";
    game["dialog"]["trophy_activated"] = "trkw_wzan_trph";
    game["dialog"]["uav_activated"] = "trkw_wzan_uav0";
    game["dialog"]["barrel_activated"] = "trkw_wzan_brrl";
    game["dialog"]["grenade_turret_activated"] = "trkw_wzan_trrt";
    game["dialog"]["engine_activated"] = "trkw_wzan_engn";
    game["dialog"]["smoke_activated"] = "trkw_wzan_smke";
    game["dialog"]["reminder_purchase"] = "trkw_wzan_rmdp";
    game["dialog"]["resurgence_on_player_disconnect"] = "rsrg_grav_tmrd";
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a7a
// Size: 0x3e
function brtruck_cleanupents() {
    namespace_36f464722d326bbe::removematchingents_bykey("delete_on_load", "targetname");
    namespace_36f464722d326bbe::removematchingents_bymodel("door_prison_cell_metal_mp", 1);
    namespace_36f464722d326bbe::removematchingents_bymodel("door_wooden_panel_mp_01", 1);
    namespace_36f464722d326bbe::removematchingents_bymodel("me_electrical_box_street_01", 1);
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2abf
// Size: 0x1d
function brtruck_initexternalfeatures() {
    level._effect["light_tank_land"] = loadfx("vfx/iw8_mp/killstreak/vfx_tank_dropoff_dust.vfx");
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ae3
// Size: 0x25
function onstartgametype() {
    initspawns();
    level thread initvehicles();
    level thread function_8d947898c35b8068();
    level thread function_6e7b6151aba26dc2();
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b0f
// Size: 0xe9
function brtruck_playerwelcomesplashes(data) {
    self endon("disconnect");
    self waittill("spawned_player");
    if (!istrue(self.pers["streamSyncComplete"])) {
        self waittill("player_active");
    }
    wait(1);
    namespace_44abc05161e2e2cb::showsplash("br_gametype_truckwar_prematch_welcome");
    self waittill("do_welcome_splashes");
    wait(2);
    soundalias = namespace_d3d40f75bb4e4c32::function_93550b34f0a49dd9("match_start", self, "dx_br_bds5_");
    var_1499e7c2d69e0074 = undefined;
    if (isdefined(soundalias) && soundexists(soundalias)) {
        var_1499e7c2d69e0074 = lookupsoundlength(soundalias) * 0.001 + 2;
    }
    thread function_9f5606e3bd1c508d("match_start", [0:self]);
    thread function_9f5606e3bd1c508d("primary_objective", [0:self], var_1499e7c2d69e0074);
    namespace_d696adde758cbe79::showDMZSplash("truckwar_welcome", [0:self]);
    while (!self isonground()) {
        waitframe();
    }
    namespace_a011fbf6d93f25e5::branalytics_landing(self);
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bff
// Size: 0x25
function brtruck_ontimelimit() {
    if (isdefined(level.numendgame)) {
        level thread namespace_d20f8ef223912e12::startendgame(1);
    }
    level.numendgame = undefined;
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c2b
// Size: 0xe
function mayconsiderplayerdead(player) {
    return 1;
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c41
// Size: 0x5
function markplayeraseliminatedonkilled() {
    return 1;
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c4e
// Size: 0x6a
function vehiclespawn_getspawndata(loc) {
    spawndata = spawnstruct();
    spawndata.origin = loc.origin;
    spawndata.angles = loc.angles;
    spawndata.spawntype = "GAME_MODE";
    spawndata.showheadicon = 1;
    return spawndata;
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cc0
// Size: 0x7e
function registervehicletype(refname, var_e4015cfe956f4f3f) {
    /#
        assert(isdefined(refname));
    #/
    vehicleinfo = spawnstruct();
    vehicleinfo.refname = refname;
    vehicleinfo.spawncallback = var_e4015cfe956f4f3f;
    vehicleinfo.vehiclespawns = namespace_dace9d390bc4a290::function_b08e7e3a0b14f76f(refname);
    /#
        assert(isdefined(vehicleinfo.vehiclespawns));
    #/
    level.vehicleinfo[refname] = vehicleinfo;
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d45
// Size: 0xae
function function_5c3211a52b3b56f9(loc, var_ee8da5624236dc89) {
    if (!isdefined(loc.angles)) {
        loc.angles = (0, randomfloat(360), 0);
    }
    spawndata = vehiclespawn_getspawndata(loc);
    spawndata.var_427538f5a2ad4f8b = 1;
    spawndata.var_ec76ffdbe2f37c5b = 1;
    spawndata.var_65da0a245b653cc = 1;
    spawndata.var_d04816fe2f5bcee6 = 1;
    var_efb5620deead5e9b = namespace_1f188a13f7e79610::vehicle_spawn("veh9_mil_lnd_mrap", spawndata, var_ee8da5624236dc89);
    var_efb5620deead5e9b setscriptablepartstate("tag_buystation", "buystation_usable");
    return var_efb5620deead5e9b;
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2dfb
// Size: 0x59
function vehiclespawn_littlebird(loc, var_ee8da5624236dc89) {
    if (!isdefined(loc.angles)) {
        loc.angles = (0, randomfloat(360), 0);
    }
    spawndata = vehiclespawn_getspawndata(loc);
    return namespace_1f188a13f7e79610::vehicle_spawn("little_bird", spawndata, var_ee8da5624236dc89);
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e5c
// Size: 0x59
function vehiclespawn_atv(loc, var_ee8da5624236dc89) {
    if (!isdefined(loc.angles)) {
        loc.angles = (0, randomfloat(360), 0);
    }
    spawndata = vehiclespawn_getspawndata(loc);
    return namespace_1f188a13f7e79610::vehicle_spawn("atv", spawndata, var_ee8da5624236dc89);
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ebd
// Size: 0x59
function vehiclespawn_tacrover(loc, var_ee8da5624236dc89) {
    if (!isdefined(loc.angles)) {
        loc.angles = (0, randomfloat(360), 0);
    }
    spawndata = vehiclespawn_getspawndata(loc);
    return namespace_1f188a13f7e79610::vehicle_spawn("tac_rover", spawndata, var_ee8da5624236dc89);
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f1e
// Size: 0x59
function function_c43c5200d882b134(loc, var_ee8da5624236dc89) {
    if (!isdefined(loc.angles)) {
        loc.angles = (0, randomfloat(360), 0);
    }
    spawndata = vehiclespawn_getspawndata(loc);
    return namespace_1f188a13f7e79610::vehicle_spawn("veh9_utv", spawndata, var_ee8da5624236dc89);
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f7f
// Size: 0x59
function function_c6436c7f3e995d85(loc, var_ee8da5624236dc89) {
    if (!isdefined(loc.angles)) {
        loc.angles = (0, randomfloat(360), 0);
    }
    spawndata = vehiclespawn_getspawndata(loc);
    return namespace_1f188a13f7e79610::vehicle_spawn("veh9_hummer", spawndata, var_ee8da5624236dc89);
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fe0
// Size: 0x59
function function_9d7d93def34d9958(loc, var_ee8da5624236dc89) {
    if (!isdefined(loc.angles)) {
        loc.angles = (0, randomfloat(360), 0);
    }
    spawndata = vehiclespawn_getspawndata(loc);
    return namespace_1f188a13f7e79610::vehicle_spawn("veh9_overland_2016", spawndata, var_ee8da5624236dc89);
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3041
// Size: 0x59
function function_292bae242d3583b7(loc, var_ee8da5624236dc89) {
    if (!isdefined(loc.angles)) {
        loc.angles = (0, randomfloat(360), 0);
    }
    spawndata = vehiclespawn_getspawndata(loc);
    return namespace_1f188a13f7e79610::vehicle_spawn("veh9_civ_lnd_dirt_bike", spawndata, var_ee8da5624236dc89);
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30a2
// Size: 0x1bc
function initvehicles() {
    if (!isdefined(level.vehicleinfo)) {
        level.vehicleinfo = [];
    }
    if (getdvarint(function_2ef675c13ca1c4af(@"hash_e4fa5e1677f011e4", "veh9_mil_lnd_mrap"), 1) == 1) {
        registervehicletype("veh9_mil_lnd_mrap", &function_5c3211a52b3b56f9);
    }
    if (getdvarint(function_2ef675c13ca1c4af(@"hash_e4fa5e1677f011e4", "little_bird"), 1) == 1) {
        registervehicletype("little_bird", &vehiclespawn_littlebird);
    }
    if (getdvarint(function_2ef675c13ca1c4af(@"hash_e4fa5e1677f011e4", "atv"), 1) == 1) {
        registervehicletype("atv", &vehiclespawn_atv);
    }
    if (getdvarint(function_2ef675c13ca1c4af(@"hash_e4fa5e1677f011e4", "tac_rover"), 1) == 1) {
        registervehicletype("tac_rover", &vehiclespawn_tacrover);
    }
    if (getdvarint(function_2ef675c13ca1c4af(@"hash_e4fa5e1677f011e4", "veh9_utv"), 1) == 1) {
        registervehicletype("veh9_utv", &function_c43c5200d882b134);
    }
    if (getdvarint(function_2ef675c13ca1c4af(@"hash_e4fa5e1677f011e4", "veh9_hummer"), 1) == 1) {
        registervehicletype("veh9_hummer", &function_c6436c7f3e995d85);
    }
    if (getdvarint(function_2ef675c13ca1c4af(@"hash_e4fa5e1677f011e4", "veh9_overland_2016"), 1) == 1) {
        registervehicletype("veh9_overland_2016", &function_9d7d93def34d9958);
    }
    if (getdvarint(function_2ef675c13ca1c4af(@"hash_e4fa5e1677f011e4", "veh9_civ_lnd_dirt_bike"), 1) == 1) {
        registervehicletype("veh9_civ_lnd_dirt_bike", &function_292bae242d3583b7);
    }
    level waittill("prematch_fade_done");
    wait(2);
    /#
        level thread function_6de134dad6c879cf();
    #/
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3265
// Size: 0x391
function function_9e97f797dc8e211c() {
    level.vehiclespawnlocs = [];
    level.var_8d137603bd840e40 = [];
    foreach (vehicleinfo in level.vehicleinfo) {
        switch (vehicleinfo.refname) {
        case #"hash_9396a18356201b4a":
            vehicleinfo.vehiclespawns = gettruckspawns("veh9_mil_lnd_mrap");
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
            if (loc.refname != "veh9_mil_lnd_mrap") {
                continue;
            }
            thread drawline(loc.origin, loc.origin + (0, 0, 1500), 1000, (1, 0, 0));
            thread drawangles(loc.origin, loc.angles, 1000, 100);
        }
    }
    level.vehiclespawnlocs = array_randomize(level.vehiclespawnlocs);
    if (0) {
        for (i = 0; i < level.vehiclespawnlocs.size; i++) {
            loc = level.vehiclespawnlocs[i];
            if (loc.refname != "veh9_mil_lnd_mrap") {
                continue;
            }
            thread drawline(loc.origin + (0, 0, 1500), loc.origin + (0, 0, 2500), 1000, (0, 1, 0));
            thread drawangles(loc.origin, loc.angles, 1000, 100);
        }
    }
    var_ed58edb716c4a6c3 = 0;
    foreach (entry in level.teamnamelist) {
        if (getteamdata(entry, "players").size == 0) {
            continue;
        }
        while (var_ed58edb716c4a6c3 < level.vehiclespawnlocs.size) {
            loc = level.vehiclespawnlocs[var_ed58edb716c4a6c3];
            if (isdefined(loc)) {
                if (loc.refname == "veh9_mil_lnd_mrap") {
                    level.var_8d137603bd840e40[entry] = loc;
                    var_ed58edb716c4a6c3++;
                    break;
                }
            }
            var_ed58edb716c4a6c3++;
        }
    }
    namespace_4b0406965e556711::gameflagset("trucks_spawn_complete");
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35fd
// Size: 0x14d
function spawnvehicles() {
    vehicles = [];
    foreach (loc in level.var_8d137603bd840e40) {
        vehicleinfo = level.vehicleinfo[loc.refname];
        vehicle = [[ vehicleinfo.spawncallback ]](loc);
        vehicles[vehicles.size] = vehicle;
    }
    level.teamvehicles = vehicles;
    maxvehiclecount = getdvarint(@"hash_58c9645bc2b9d636", 120);
    var_95d1b9edae469d81 = maxvehiclecount - vehicles.size;
    for (index = 0; index < level.vehiclespawnlocs.size && var_95d1b9edae469d81 > 0; index++) {
        loc = level.vehiclespawnlocs[index];
        if (isdefined(loc)) {
            if (loc.refname != "veh9_mil_lnd_mrap") {
                vehicleinfo = level.vehicleinfo[loc.refname];
                vehicle = [[ vehicleinfo.spawncallback ]](loc);
                var_95d1b9edae469d81--;
            }
        }
    }
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3751
// Size: 0xbd
function assignvehiclestoteams() {
    vehicles = level.teamvehicles;
    level.teamvehicles = [];
    level.teamcanrespawn = [];
    level.var_e3ccf0898a949bec = [];
    index = 0;
    foreach (entry in level.teamnamelist) {
        if (getteamdata(entry, "players").size == 0) {
            continue;
        }
        vehicle = vehicles[index];
        function_20b77fbf1af1a5d(vehicle, entry);
        index++;
    }
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3815
// Size: 0x1a3
function function_20b77fbf1af1a5d(vehicle, team, revive) {
    if (!isdefined(team)) {
        return;
    }
    level.teamvehicles[team] = vehicle;
    level.teamcanrespawn[team] = 1;
    setomnvar("ui_truckwar_trucks_remaining", level.teamvehicles.size);
    level thread watchvehicleingas(vehicle, team);
    level thread function_66e49bf742fccb61(vehicle, team);
    level thread function_3e5a0635a240ede5(vehicle, team);
    level thread notifyteamonvehicledeath(vehicle, team);
    level thread function_46ed8b0b237087f8(vehicle, team);
    level thread function_ad382245d8d861f3(vehicle, team);
    namespace_1fbd40990ee60ede::vehicle_occupancy_setteam(vehicle, team);
    vehicle setscriptablepartstate("objective", "on");
    players = getteamdata(team, "players");
    foreach (player in players) {
        player namespace_e0a7597be4f2b843::setcachedclientomnvar("ui_br_team_cash_pockets", vehicle.health);
        player namespace_e0a7597be4f2b843::setcachedclientomnvar("ui_br_team_cash_banked", vehicle.maxhealth);
        if (istrue(revive) && getdvarint(@"hash_51df9c2ca5ee638", 1) == 1 && !istrue(level.var_24380db31e302a78)) {
            if (istrue(player.br_iseliminated)) {
                player.setspawnpoint = undefined;
                player thread playerrespawn(1);
            }
        }
    }
    function_5fd118f91ae96e57(vehicle);
    function_256806bcfdf38c83(team);
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39bf
// Size: 0x444
function watchvehicleingas(vehicle, team) {
    vehicle endon("death");
    level endon("game_ended");
    vehicle.var_a8c0f140c771864f = 0;
    vehicle.var_8636e467ba2ce9a = 0;
    vehicle.var_5d74ae3615ff1bba = 0;
    var_42eec56be1c18a86 = getdvarfloat(@"hash_6e9602adcd53f742", 15);
    var_57d36501a55eb4d9 = getdvarfloat(@"hash_88fad367b10fc4cd", 30);
    var_18dfc5318aa3c007 = getdvarfloat(@"hash_593518c70a322693", 45);
    players = getteamdata(team, "players");
    foreach (player in players) {
        player ent_flag_init("respawn_vehicle_in_gas");
    }
    while (isdefined(vehicle)) {
        if (istrue(vehicle.var_fb98158aaba0ae49)) {
            waitframe();
            continue;
        }
        if (istrue(level.circleclosing)) {
            if (!vehicle.var_a8c0f140c771864f && function_875871597ab85666(vehicle.origin, var_42eec56be1c18a86)) {
                showsplashtoteam(team, "truckwar_gas_close");
                vehicle.var_a8c0f140c771864f = 1;
                vehicle.var_8636e467ba2ce9a = 1;
                vehicle.var_5d74ae3615ff1bba = 1;
            } else if (!vehicle.var_8636e467ba2ce9a && function_875871597ab85666(vehicle.origin, var_57d36501a55eb4d9)) {
                showsplashtoteam(team, "truckwar_gas_medium");
                vehicle.var_8636e467ba2ce9a = 1;
                vehicle.var_5d74ae3615ff1bba = 1;
            } else if (!vehicle.var_5d74ae3615ff1bba && function_875871597ab85666(vehicle.origin, var_18dfc5318aa3c007)) {
                showsplashtoteam(team, "truckwar_gas_far");
                vehicle.var_5d74ae3615ff1bba = 1;
            }
        } else {
            vehicle.var_a8c0f140c771864f = 0;
            vehicle.var_8636e467ba2ce9a = 0;
            vehicle.var_5d74ae3615ff1bba = 0;
        }
        var_819edacdacb810e4 = namespace_c5622898120e827f::getdangercircleorigin();
        var_e86632d645c137d0 = namespace_c5622898120e827f::getdangercircleradius();
        var_dcdcea34083b6b8 = getdvarint(@"hash_54e04086872e7d2c", 0) == 1;
        if (var_dcdcea34083b6b8 || distance2dsquared(var_819edacdacb810e4, vehicle.origin) > var_e86632d645c137d0 * var_e86632d645c137d0) {
            vehicle thread function_6c35d65fc1f38eb8();
            if (level.teamcanrespawn[team] == 1) {
                level.teamcanrespawn[team] = 0;
                players = getteamdata(team, "players");
                foreach (player in players) {
                    player ent_flag_set("respawn_vehicle_in_gas");
                }
                showsplashtoteam(team, "truckwar_vehicle_spawn_disabled");
                thread function_9f5606e3bd1c508d("vehicle_spawn_disabled", level.teamdata[team]["players"]);
                level thread [[ level.updategameevents ]]();
            }
        } else if (level.teamcanrespawn[team] == 0) {
            vehicle notify("vehicle_gas_exit");
            vehicle.var_c2b8326ef7abcae6 = 0;
            level.teamcanrespawn[team] = 1;
            players = getteamdata(team, "players");
            foreach (player in players) {
                player ent_flag_clear("respawn_vehicle_in_gas");
            }
            showsplashtoteam(team, "truckwar_vehicle_spawn_enabled");
            thread function_9f5606e3bd1c508d("vehicle_spawn_enabled", level.teamdata[team]["players"]);
            level thread [[ level.updategameevents ]]();
        }
        waitframe();
    }
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e0a
// Size: 0x89
function function_6c35d65fc1f38eb8() {
    self endon("death");
    self endon("vehicle_gas_exit");
    if (istrue(self.var_c2b8326ef7abcae6)) {
        return;
    }
    self.var_c2b8326ef7abcae6 = 1;
    damagepct = getdvarfloat(@"hash_a705a5caa6ea4daf", 0.05);
    damageamount = self.maxhealth * damagepct;
    while (isdefined(self)) {
        wait(1);
        self dodamage(damageamount, self.origin, undefined, undefined, "MOD_TRIGGER_HURT", "danger_circle_br");
    }
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e9a
// Size: 0x1fb
function function_66e49bf742fccb61(vehicle, team) {
    vehicle endon("death");
    level endon("game_ended");
    vehicle.var_35a334482f930be6 = 0;
    var_ec4ad047de451525 = getdvarfloat(@"hash_38e9f472cca85346", 15);
    var_b36b64992d102a16 = getdvarfloat(@"hash_32657fe607d73d8c", 5);
    var_9b92432ed202e143 = vehicle.isempty;
    var_3d655108468fa202 = 0;
    var_58e94f4fcb19bd9b = undefined;
    while (1) {
        if (!var_9b92432ed202e143 && vehicle.isempty) {
            var_58e94f4fcb19bd9b = gettime() + var_ec4ad047de451525 * 1000;
        }
        var_9b92432ed202e143 = vehicle.isempty;
        if (isdefined(var_58e94f4fcb19bd9b) && gettime() < var_58e94f4fcb19bd9b || var_3d655108468fa202) {
            isoob = 0;
            inflictor = undefined;
            foreach (trigger in level.outofboundstriggers) {
                if (vehicle istouching(trigger)) {
                    vehicle.var_35a334482f930be6 = vehicle.var_35a334482f930be6 + level.framedurationseconds;
                    isoob = 1;
                    inflictor = trigger;
                    break;
                }
            }
            var_3d655108468fa202 = isoob;
            if (!isoob) {
                vehicle.var_35a334482f930be6 = vehicle.var_35a334482f930be6 - level.framedurationseconds;
            }
            vehicle.var_35a334482f930be6 = clamp(vehicle.var_35a334482f930be6, 0, var_b36b64992d102a16);
            if (vehicle.var_35a334482f930be6 == var_b36b64992d102a16) {
                vehicle dodamage(999999, vehicle.origin, inflictor, inflictor, "MOD_TRIGGER_HURT");
            }
        }
        waitframe();
    }
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x409c
// Size: 0x1fd
function function_3e5a0635a240ede5(vehicle, team) {
    vehicle endon("death");
    level endon("game_ended");
    var_5cc086a792b04fce = getdvarfloat(@"hash_def42f45937be461", 15) * 1000;
    lastplayedtime = undefined;
    while (isdefined(vehicle)) {
        objweapon = dflags = partname = tagname = modelname = smeansofdeath = damagelocation = direction_vec = eattacker = idamage = vehicle waittill("damage");
        vehicle.lastdamagedtime = gettime();
        function_256806bcfdf38c83(team);
        players = getteamdata(team, "players");
        foreach (player in players) {
            player namespace_e0a7597be4f2b843::setcachedclientomnvar("ui_br_team_cash_pockets", vehicle.health);
            player namespace_e0a7597be4f2b843::setcachedclientomnvar("ui_br_team_cash_banked", vehicle.maxhealth);
        }
        if (smeansofdeath == "MOD_TRIGGER_HURT" || isdefined(eattacker) && eattacker.classname == "worldspawn") {
            continue;
        }
        if (isdefined(lastplayedtime) && lastplayedtime + var_5cc086a792b04fce > gettime()) {
            continue;
        }
        lastplayedtime = gettime();
        players = getteamdata(team, "players");
        showsplashtoteam(team, "truckwar_vehicle_under_attack");
        thread function_9f5606e3bd1c508d("vehicle_under_attack", level.teamdata[team]["players"]);
    }
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x42a0
// Size: 0x67
function blockHealing(team) {
    self endon("death");
    self notify("blockHealing");
    self endon("blockHealing");
    self.var_a2da885fcc826d37 = 1;
    function_256806bcfdf38c83(team);
    var_5cc086a792b04fce = getdvarfloat(@"hash_aa27dea6d1c24ca3", 15);
    wait(var_5cc086a792b04fce);
    self.var_a2da885fcc826d37 = 0;
    function_256806bcfdf38c83(team);
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x430e
// Size: 0x141
function function_46ed8b0b237087f8(vehicle, team) {
    vehicle endon("death");
    level endon("game_ended");
    while (isdefined(vehicle)) {
        message = vehicle waittill("upgrade_message");
        if (message != "trophy_ammo_used") {
            var_f7b6cc6c062a7a43 = function_e50c00059892a159(message);
            showsplashtoteam(team, var_f7b6cc6c062a7a43);
            thread function_9f5606e3bd1c508d(message, level.teamdata[team]["players"]);
            foreach (player in level.teamdata[team]["players"]) {
                if (isdefined(player.br_kiosk) && player.br_kiosk.var_114e759371623080) {
                    kiosk = player.br_kiosk;
                    var_6b3c6b40c0598d85 = player namespace_a4b43c1cf86c6fe5::function_b88d64cd67bbe60f(kiosk);
                    player setclientomnvar("ui_buystation_limited_item_amount", var_6b3c6b40c0598d85);
                }
            }
        }
        function_256806bcfdf38c83(team);
    }
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4456
// Size: 0x8e
function private function_ad382245d8d861f3(vehicle, team) {
    level endon("game_ended");
    vehicle endon("death");
    vehicle endon("give_upgrade");
    wait(60);
    foreach (player in level.teamdata[team]["players"]) {
        player namespace_88bfae359020fdd3::function_1976438a8865ac27("br_ftue_truckwar_upgrade");
    }
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44eb
// Size: 0xb7
function function_e50c00059892a159(message) {
    switch (message) {
    case #"hash_88165be29e007e7d":
        return "truckwar_vehicle_armor_upgraded";
    case #"hash_1dce51fa1fb3327f":
        return "truckwar_vehicle_trophy_upgraded";
    case #"hash_94c61044fbf1888f":
        return "truckwar_vehicle_portable_radar_upgraded";
    case #"hash_63f403be29b3b53d":
        return "truckwar_vehicle_barrel_upgraded";
    case #"hash_ee8297c26c0e28ee":
        return "truckwar_vehicle_trophy_no_ammo";
    case #"hash_3c02a3c6ca5098cf":
        return "truckwar_vehicle_trophy_refilled";
    case #"hash_1bee7c040eb03ea4":
        return "truckwar_vehicle_turret_upgraded";
    case #"hash_e9e3a7d0d2276ee6":
        return "truckwar_vehicle_smoke_upgraded";
    case #"hash_280d7476aeedef2b":
        return "truckwar_vehicle_engine_upgraded";
        break;
    }
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x45a9
// Size: 0x180
function notifyteamonvehicledeath(vehicle, team) {
    level endon("game_ended");
    players = getteamdata(team, "players");
    foreach (player in players) {
        player ent_flag_init("respawn_vehicle_death");
    }
    vehicle waittill("death");
    level.teamcanrespawn[team] = 0;
    level.teamvehicles[team] = undefined;
    setomnvar("ui_truckwar_trucks_remaining", level.teamvehicles.size);
    players = getteamdata(team, "players");
    foreach (player in players) {
        player namespace_e0a7597be4f2b843::setcachedclientomnvar("ui_br_team_cash_pockets", 0);
        player namespace_e0a7597be4f2b843::setcachedclientomnvar("ui_br_team_cash_banked", 1);
        player ent_flag_set("respawn_vehicle_death");
    }
    showsplashtoteam(team, "truckwar_vehicle_destroyed");
    thread function_9f5606e3bd1c508d("vehicle_destroyed", level.teamdata[team]["players"]);
    thread function_bc2cb59695039e19(team);
    level thread [[ level.updategameevents ]]();
    function_256806bcfdf38c83(team);
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4730
// Size: 0x62
function function_bc2cb59695039e19(team) {
    level endon("game_ended");
    while (1) {
        waittime = randomfloatrange(180, 300);
        wait(waittime);
        if (istrue(level.teamcanrespawn[team])) {
            break;
        }
        thread function_9f5606e3bd1c508d("reminder_purchase", level.teamdata[team]["players"]);
    }
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4799
// Size: 0x241
function gettruckspawns(vehicleRef) {
    if (level.mapname != "mp_br_mechanics" && getdvarint(@"hash_692b4b274d3b7bdc", 0) == 0) {
        spawns = getpresettruckspawns(vehicleRef);
        if (isdefined(spawns) && spawns.size > 0) {
            return spawns;
        }
    }
    var_eb62fad9344bda2 = level.teamnamelist.size;
    var_f806489200f3b88b = 0;
    foreach (entry in level.teamnamelist) {
        if (getteamdata(entry, "players").size > 0) {
            var_f806489200f3b88b++;
        }
    }
    var_eb62fad9344bda2 = var_f806489200f3b88b;
    var_c0fd4e75a105deae = 360 / var_eb62fad9344bda2;
    circlecenter = (0, 0, 100);
    if (level.mapname == "mp_br_mechanics") {
        circlecenter = (0, 0, 100);
        var_73562bf0ddc8b02d = 9000;
    } else {
        circlecenter = (0, 0, 100);
        var_73562bf0ddc8b02d = 40000;
    }
    var_fbcabd62b8f66eb8 = namespace_2a184fc4902783dc::create_default_contents(1);
    spawns = [];
    for (i = 0; i < var_eb62fad9344bda2; i++) {
        angles = i * var_c0fd4e75a105deae;
        forward = anglestoforward((0, angles, 0));
        origin = circlecenter + forward * var_73562bf0ddc8b02d;
        groundorigin = namespace_d3d40f75bb4e4c32::droptogroundmultitrace(origin, 10000, -20000, var_fbcabd62b8f66eb8);
        origin = (origin[0], origin[1], groundorigin[2] + 200);
        vehicle = spawnstruct();
        vehicle.origin = origin;
        var_7224bacab3f8ee26 = (0, 0, 0);
        vehicle.angles = vectortoangles(forward * -1);
        vehicle.targetname = vehicleRef;
        spawns[spawns.size] = vehicle;
    }
    return spawns;
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49e2
// Size: 0x1a4
function getpresettruckspawns(vehicleRef) {
    var_a36aa7ae98da9c1f = [];
    var_a36aa7ae98da9c1f = getstructarray("mp_truckwar_team_start_spawn", "targetname");
    if (var_a36aa7ae98da9c1f.size == 0) {
        return undefined;
    }
    var_a36aa7ae98da9c1f = array_randomize(var_a36aa7ae98da9c1f);
    var_fbcabd62b8f66eb8 = namespace_2a184fc4902783dc::create_default_contents(1);
    var_20acb030a0bf7a84 = 0;
    foreach (struct in var_a36aa7ae98da9c1f) {
        groundorigin = namespace_d3d40f75bb4e4c32::droptogroundmultitrace(struct.origin, 10000, -20000, var_fbcabd62b8f66eb8);
        origin = (struct.origin[0], struct.origin[1], struct.origin[2] + 200);
        struct.origin = origin;
        var_20acb030a0bf7a84++;
        if (var_20acb030a0bf7a84 >= 5) {
            var_20acb030a0bf7a84 = 0;
            waitframe();
        }
    }
    spawns = [];
    var_eb62fad9344bda2 = var_a36aa7ae98da9c1f.size;
    for (i = 0; i < var_eb62fad9344bda2; i++) {
        vehicle = spawnstruct();
        vehicle.origin = var_a36aa7ae98da9c1f[i].origin;
        vehicle.angles = var_a36aa7ae98da9c1f[i].angles;
        vehicle.targetname = vehicleRef;
        spawns[spawns.size] = vehicle;
    }
    return spawns;
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4b8e
// Size: 0x10b
function gethelispawns(vehicleRef) {
    spawns = [];
    var_eb62fad9344bda2 = 3;
    var_c0fd4e75a105deae = 360 / var_eb62fad9344bda2;
    circlecenter = (0, 0, 100);
    var_73562bf0ddc8b02d = 1000;
    for (i = 0; i < var_eb62fad9344bda2; i++) {
        angles = i * var_c0fd4e75a105deae;
        forward = anglestoforward((0, angles, 0));
        origin = circlecenter + forward * var_73562bf0ddc8b02d;
        vehicle = spawnstruct();
        vehicle.origin = origin;
        var_7224bacab3f8ee26 = (0, 0, 0);
        vehicle.angles = vectortoangles(forward * -1);
        vehicle.targetname = vehicleRef;
        spawns[spawns.size] = vehicle;
    }
    return spawns;
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ca1
// Size: 0x48
function isteameliminated(team) {
    if (!isdefined(level.teamcanrespawn)) {
        return 0;
    }
    return getteamdata(team, "aliveCount") == 0 && (!istrue(level.teamcanrespawn[team]) || istrue(level.var_24380db31e302a78));
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cf1
// Size: 0x51
function playerkilledspawn(var_642470e1abc1bbf9, var_8b3f6477dbed24d7) {
    if (!namespace_4b0406965e556711::gameflag("use_truck_respawn")) {
        return 0;
    }
    var_642470e1abc1bbf9.victim thread playerrespawn(0, var_642470e1abc1bbf9, var_8b3f6477dbed24d7);
    var_642470e1abc1bbf9.victim thread namespace_a9c534dc7832aba4::spawnspectator(var_642470e1abc1bbf9, var_8b3f6477dbed24d7);
    return 1;
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d4a
// Size: 0x48d
function playerrespawn(var_5a1633a0a398bee1, var_642470e1abc1bbf9, var_8b3f6477dbed24d7) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("gulag_auto_win");
    self notify("playerRespawn");
    self endon("playerRespawn");
    if (istrue(level.gameended)) {
        return;
    }
    if (istrue(level.var_24380db31e302a78) || isteameliminated(self.team) || ent_flag_exist("respawn_vehicle_death") && ent_flag("respawn_vehicle_death")) {
        thread namespace_a9c534dc7832aba4::triggereliminatedoverlay();
        return;
    }
    if (getdvarint(@"hash_1560eca11fd78307", 1) == 1) {
        self endon("brWaitAndSpawnClientComplete");
    }
    var_30839284add41ced = function_cc3f506623daf71d(self);
    if (istrue(var_5a1633a0a398bee1)) {
        var_30839284add41ced = 0;
    }
    var_ac5cf023ca77db21 = getdvarint(@"hash_de56eb4b8051c0e", 5);
    if (var_30839284add41ced < var_ac5cf023ca77db21) {
        var_30839284add41ced = var_ac5cf023ca77db21;
    }
    if (level.respawntimedisable != 0) {
        var_30839284add41ced = 0;
    }
    ent_flag_init("playerRespawn_intermission_spawned");
    self.intermissionspawnorigin = undefined;
    self.intermissionspawntime = undefined;
    var_a294c35cbb452cbf = var_30839284add41ced - var_ac5cf023ca77db21;
    var_d2f5422694822652 = var_30839284add41ced - var_a294c35cbb452cbf;
    blackscreenwait = var_30839284add41ced - getdvarint(@"hash_3ae7661f87c2cf43", 5);
    if (var_30839284add41ced > 0) {
        function_b6b4285e173dd004(self);
        thread function_74ae749db3acb35e(self, var_30839284add41ced);
    }
    result = waittill_notify_or_timeout_return("respawn_vehicle_death", var_a294c35cbb452cbf);
    if (result != "respawn_vehicle_death") {
        thread updateprestreamrespawn();
        result = waittill_notify_or_timeout_return("respawn_vehicle_death", var_d2f5422694822652);
    }
    self notify("stop_updatePrestreamRespawn");
    thread fadeoutin();
    function_218d7f561bc41a41(self);
    wait(0.5);
    if (ent_flag_exist("respawn_vehicle_death") && ent_flag("respawn_vehicle_death")) {
        thread namespace_a9c534dc7832aba4::setbuybackpingmessage();
    } else if (ent_flag("respawn_vehicle_in_gas")) {
        namespace_58fb4f2e73fd41a0::setlowermessageomnvar("vehicle_in_gas");
    }
    while (ent_flag_exist("respawn_vehicle_death") && !ent_flag("respawn_vehicle_death") && !level.teamcanrespawn[self.team] || namespace_448ccf1ca136fbbe::isusingremote()) {
        waitframe();
    }
    if (ent_flag_exist("respawn_vehicle_death") && ent_flag("respawn_vehicle_death")) {
        thread namespace_a9c534dc7832aba4::setbuybackpingmessage();
    }
    if (isteameliminated(self.team) || ent_flag_exist("respawn_vehicle_death") && ent_flag("respawn_vehicle_death")) {
        thread namespace_a9c534dc7832aba4::spawnspectator(var_642470e1abc1bbf9, var_8b3f6477dbed24d7);
        thread namespace_a9c534dc7832aba4::triggereliminatedoverlay();
        setcachedclientomnvar("ui_br_transition_type", 0);
        namespace_8bfdb6eb5a3df67a::function_e68e4bb4f65f5fe4();
        return;
    }
    spawnpoint = getspawnpoint();
    var_11f3b4465c8b637b = namespace_8bfdb6eb5a3df67a::playerprestreamrespawnorigin(spawnpoint);
    flareorigin = level.teamvehicles[self.team].origin;
    if (getdvarint(@"hash_df02345c60008647", 1) == 0) {
        namespace_d3d40f75bb4e4c32::playerwaittillstreamhintcomplete();
    }
    ent_flag_clear("playerRespawn_intermission_spawned");
    self.intermissionspawnorigin = undefined;
    self.intermissionspawntime = undefined;
    namespace_58fb4f2e73fd41a0::setlowermessageomnvar("clear_lower_msg");
    namespace_99ac021a7547cae3::spawnplayer(undefined, 0);
    self.cachedomnars = [];
    namespace_f446f6030ca8cff8::_clearexecution();
    namespace_cb965d2f71fefddc::initplayer();
    namespace_47fd1e79a44628cd::gulagwinnerrespawn(1, undefined, spawnpoint, 1, var_11f3b4465c8b637b, 1, undefined, 0, 0, 1);
    spawnangles = vectortoangles(flareorigin - var_11f3b4465c8b637b);
    self setplayerangles(spawnangles);
    self notify("respawn_view_set");
    namespace_80cec6cfc70c4f95::unmarkplayeraseliminated(self);
    level thread namespace_25c5a6f43bb97b43::trysaylocalsound(self, "player_respawn");
    if (isdefined(level.teamvehicles[self.team])) {
        flareorigin = level.teamvehicles[self.team].origin;
        namespace_e0a7597be4f2b843::setcachedclientomnvar("ui_br_team_cash_pockets", level.teamvehicles[self.team].health);
        namespace_e0a7597be4f2b843::setcachedclientomnvar("ui_br_team_cash_banked", level.teamvehicles[self.team].maxhealth);
    }
    level thread namespace_4bc0ead8d2af3d84::utilflare_shootflare(flareorigin, "revive");
    setcachedclientomnvar("ui_br_transition_type", 0);
    function_256806bcfdf38c83(self.team);
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x51de
// Size: 0x21b
function private function_64e94e8b1e610263() {
    level.brgametype.respawndelay["_solos"][0] = getdvarint(@"hash_bc01b0a06d2dbde9", 15);
    level.brgametype.respawndelay["_solos"][1] = getdvarint(@"hash_bc01ada06d2db750", 20);
    level.brgametype.respawndelay["_solos"][2] = getdvarint(@"hash_bc01aea06d2db983", 30);
    level.brgametype.respawndelay["_duos"][0] = getdvarint(@"hash_fc1ef4784978935a", 15);
    level.brgametype.respawndelay["_duos"][1] = getdvarint(@"hash_fc1ef37849789127", 20);
    level.brgametype.respawndelay["_duos"][2] = getdvarint(@"hash_fc1ef27849788ef4", 30);
    level.brgametype.respawndelay["_trios"][0] = getdvarint(@"hash_cc07978496a297a0", 20);
    level.brgametype.respawndelay["_trios"][1] = getdvarint(@"hash_cc079a8496a29e39", 30);
    level.brgametype.respawndelay["_trios"][2] = getdvarint(@"hash_cc07998496a29c06", 40);
    level.brgametype.respawndelay["_quads"][0] = getdvarint(@"hash_f5bdd5587fd7f1f9", 25);
    level.brgametype.respawndelay["_quads"][1] = getdvarint(@"hash_f5bdd2587fd7eb60", 35);
    level.brgametype.respawndelay["_quads"][2] = getdvarint(@"hash_f5bdd3587fd7ed93", 45);
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5400
// Size: 0xed
function private function_338ba9b353a9a78b(player) {
    var_89850b370a87aa3c = namespace_36f464722d326bbe::function_4fb37368ae3585bb() - 1;
    if (istrue(level.brgametype.var_bb9b77186cb79ae6)) {
        players = namespace_7e17181d03156026::getteamarray(player.team);
        var_89850b370a87aa3c = players.size - 1;
        foreach (player in players) {
            if (isdefined(player) && istrue(player.var_632bad3edb4e449e)) {
                var_89850b370a87aa3c--;
            }
        }
    }
    var_89850b370a87aa3c = int(max(min(var_89850b370a87aa3c, level.brgametype.var_34af112c77c2c381.size - 1), 0));
    return level.brgametype.var_34af112c77c2c381[var_89850b370a87aa3c];
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x54f5
// Size: 0xa6
function private function_cc3f506623daf71d(player) {
    var_53a4a1c920def4bd = function_338ba9b353a9a78b(player);
    if (level.br_circle.circleindex < 0) {
        return level.brgametype.respawndelay[var_53a4a1c920def4bd][0];
    }
    circleindex = int(min(level.br_circle.circleindex, level.brgametype.respawndelay[var_53a4a1c920def4bd].size - 1));
    return level.brgametype.respawndelay[var_53a4a1c920def4bd][circleindex];
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x55a3
// Size: 0x4f
function private function_74ae749db3acb35e(player, time) {
    level endon("game_ended");
    player endon("disconnect");
    player endon("respawn_vehicle_death");
    while (time >= 0) {
        function_53c22fbe6b489ec1(player, time);
        player namespace_d3d40f75bb4e4c32::updatebrscoreboardstat("respawnInSeconds", time);
        time--;
        wait(1);
    }
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x55f9
// Size: 0x3f
function private function_b6b4285e173dd004(player) {
    currentvalue = player getclientomnvar("ui_resurgenceRespawnTimer");
    newvalue = currentvalue | 16384;
    player setclientomnvar("ui_resurgenceRespawnTimer", newvalue);
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x563f
// Size: 0x40
function private function_218d7f561bc41a41(player) {
    currentvalue = player getclientomnvar("ui_resurgenceRespawnTimer");
    newvalue = currentvalue & ~16384;
    player setclientomnvar("ui_resurgenceRespawnTimer", newvalue);
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5686
// Size: 0x6a
function private function_53c22fbe6b489ec1(player, value) {
    /#
        assert(value <= 16384 - 1);
    #/
    currentvalue = player getclientomnvar("ui_resurgenceRespawnTimer");
    var_a31ae8d2963fa9d = currentvalue & ~(16384 - 1);
    newvalue = var_a31ae8d2963fa9d | value;
    player setclientomnvar("ui_resurgenceRespawnTimer", newvalue);
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x56f7
// Size: 0x3c2
function private function_6e7b6151aba26dc2() {
    level endon("game_ended");
    level.brgametype.var_c42e40ec22a1f0d4 = 1;
    level.brgametype.respawndelay = [];
    level.brgametype.var_34af112c77c2c381 = [0:"_solos", 1:"_duos", 2:"_trios", 3:"_quads"];
    level.brgametype.var_bb9b77186cb79ae6 = getdvarint(@"hash_ecd9594bd7c0b2ad", 1) == 1;
    level.brgametype.var_9524142eb719a321 = getdvarint(@"hash_ca8ddd67c2b5771a", 1) == 1;
    level.brgametype.var_8947d8f4e61494fa = getdvarint(@"hash_24d595ecd1de09dc", 1) == 1 && istrue(level.brgametype.var_bb9b77186cb79ae6);
    level.brgametype.var_fb997d1846bd5cf4 = getdvarint(@"hash_895f0d248f2c4008", 1) == 1 && istrue(level.brgametype.var_9524142eb719a321);
    level.brgametype.var_4ad7c03ec4fa687 = namespace_36f464722d326bbe::function_4fb37368ae3585bb() == 1;
    setomnvar("ui_br_resurgence_respawn_enabled", 1);
    namespace_4b0406965e556711::gameflagwait("prematch_done");
    namespace_4b0406965e556711::gameflagwait("prematch_fade_done");
    thread function_64e94e8b1e610263();
    thread function_89473c1117c46c57();
    var_6b3fe6b83b1c6b9e = namespace_ea497db8cab34561::function_e501cce5c715caf();
    foreach (var_53a4a1c920def4bd in level.brgametype.var_34af112c77c2c381) {
        for (i = 0; i < var_6b3fe6b83b1c6b9e; i++) {
            var_33bfdc2307cf55b4 = getdvarint(function_2ef675c13ca1c4af(@"hash_fd72eab87b422f51", i + 1, var_53a4a1c920def4bd), -1);
            if (var_33bfdc2307cf55b4 >= 0) {
                level.brgametype.respawndelay[var_53a4a1c920def4bd][i] = var_33bfdc2307cf55b4;
            } else if (i >= level.brgametype.respawndelay[var_53a4a1c920def4bd].size) {
                level.brgametype.respawndelay[var_53a4a1c920def4bd][i] = level.brgametype.respawndelay[var_53a4a1c920def4bd][i - 1];
            }
        }
    }
    waittime = 0;
    for (i = 0; i < var_6b3fe6b83b1c6b9e; i++) {
        waittime = waittime + level.br_level.br_circleclosetimes[i] + level.br_level.br_circledelaytimes[i];
    }
    var_8911f71726832879 = int(waittime * 1000);
    var_bd5fd506df61590d = getdvarint(@"hash_342776b421ce99fa", 90000);
    level waittill("infils_ready");
    var_e493cd71687bbcc3 = var_8911f71726832879 - var_bd5fd506df61590d;
    if (var_e493cd71687bbcc3 > 0) {
        wait(var_e493cd71687bbcc3 * 0.001);
        var_8911f71726832879 = var_bd5fd506df61590d;
    }
    setomnvarforallclients("ui_br_resurgence_will_disable", 1);
    setomnvarforallclients("ui_br_timed_feature_end_time", int(gettime() + var_8911f71726832879));
    wait(var_8911f71726832879 * 0.001);
    setomnvarforallclients("ui_br_timed_feature_end_time", 0);
    level.brgametype.var_c42e40ec22a1f0d4 = 0;
    level.brgametype.var_9524142eb719a321 = 0;
    level.brgametype.var_fb997d1846bd5cf4 = 0;
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5ac0
// Size: 0x68
function private function_89473c1117c46c57() {
    level endon("game_ended");
    level namespace_3c37cb17ade254d::flag_wait("StartGameTypeCallbackFinished");
    level.brgametype.var_38d22e79b27c8a08 = namespace_bf9ffd2b22c7d819::function_e3bd94413509bc25() && getdvarint(@"hash_fa76fc54e37da65d", 1);
    if (istrue(level.brgametype.var_38d22e79b27c8a08)) {
        namespace_bf9ffd2b22c7d819::function_8fe6d6539ed31a88(&function_fea438ae40d5637b);
    }
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5b2f
// Size: 0xeb
function private function_fea438ae40d5637b(player) {
    if (!namespace_4b0406965e556711::gameflag("prematch_fade_done")) {
        return;
    }
    if (istrue(level.brgametype.var_4ad7c03ec4fa687)) {
        return;
    }
    if (!istrue(level.brgametype.var_c42e40ec22a1f0d4)) {
        return;
    }
    if (!istrue(level.brgametype.var_bb9b77186cb79ae6)) {
        return;
    }
    if (istrue(level.brgametype.var_8947d8f4e61494fa)) {
        remainingplayers = namespace_7e17181d03156026::getteamarray(player.team);
        foreach (var_55604b242897e62e in remainingplayers) {
            var_55604b242897e62e thread namespace_44abc05161e2e2cb::showsplash("truckwar_ally_rejoin_improvement", undefined, player);
        }
    }
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5c21
// Size: 0x13b
function private function_c21d160bc19fc200(player) {
    if (!namespace_4b0406965e556711::gameflag("prematch_fade_done")) {
        return;
    }
    if (istrue(level.brgametype.var_4ad7c03ec4fa687)) {
        return;
    }
    if (!istrue(level.brgametype.var_c42e40ec22a1f0d4)) {
        return;
    }
    remainingplayers = level.teamdata[player.team]["players"];
    if (remainingplayers.size == 1) {
        if (istrue(level.brgametype.var_fb997d1846bd5cf4)) {
            remainingplayers[0] thread namespace_44abc05161e2e2cb::showsplash("truckwar_left_behind_improvement");
        }
    } else {
        foreach (var_55604b242897e62e in remainingplayers) {
            if (istrue(level.brgametype.var_8947d8f4e61494fa)) {
                var_55604b242897e62e thread namespace_44abc05161e2e2cb::showsplash("truckwar_ally_left_improvement", undefined, player, undefined, 1);
            }
        }
    }
    if (istrue(level.brgametype.var_bb9b77186cb79ae6)) {
        namespace_d3d40f75bb4e4c32::brleaderdialog("resurgence_on_player_disconnect", 1, remainingplayers, undefined, 0, undefined);
    }
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5d63
// Size: 0x161
function fadetogearingup(waittime) {
    level endon("game_ended");
    self endon("disconnect");
    self endon("spawned_player");
    self notify("fadeToGearingUp");
    self endon("fadeToGearingUp");
    if (isdefined(waittime) && waittime > 0) {
        wait(waittime);
    }
    if (isteameliminated(self.team) || !level.teamcanrespawn[self.team]) {
        return;
    }
    var_b59f471c2c064e56 = 1;
    thread fadeoutin();
    wait(var_b59f471c2c064e56 - 0.25);
    namespace_d20f8ef223912e12::function_258c4f40dee8189a();
    setcachedclientomnvar("ui_br_transition_type", 2);
    wait(0.25);
    if (isteameliminated(self.team) || !level.teamcanrespawn[self.team]) {
        setcachedclientomnvar("ui_br_transition_type", 0);
        return;
    }
    if (getdvarint(@"hash_e912e88184530f28", 1) == 1) {
        namespace_d3d40f75bb4e4c32::playerclearstreamhintorigin();
        spawnpoint = getspawnpoint();
        namespace_a9c534dc7832aba4::playerclearspectatekillchainsystem();
        namespace_d20f8ef223912e12::spawnintermission(spawnpoint.origin, spawnpoint.angles);
        namespace_5aeecefc462876::setdisabled();
        self.intermissionspawnorigin = spawnpoint.origin;
        self.intermissionspawntime = gettime();
        ent_flag_set("playerRespawn_intermission_spawned");
    }
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ecb
// Size: 0x6c
function fadeoutin() {
    level endon("game_ended");
    self endon("disconnect");
    namespace_8bfdb6eb5a3df67a::function_334a8fe67e88bbe7();
    result = waittill_any_return_no_endon_death_3("spawned_player", "respawn_vehicle_in_gas", "gulag_auto_win");
    if (result == "spawned_player" || result == "respawn_vehicle_in_gas") {
        self waittill("respawn_view_set");
    } else {
        setcachedclientomnvar("ui_br_transition_type", 0);
    }
    namespace_8bfdb6eb5a3df67a::function_e68e4bb4f65f5fe4();
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5f3e
// Size: 0xd7
function updateprestreamrespawn() {
    self endon("disconnect");
    self endon("spawned_player");
    self endon("stop_updatePrestreamRespawn");
    self endon("respawn_vehicle_death");
    while (1) {
        if (ent_flag("playerRespawn_intermission_spawned")) {
            spawnpoint = getspawnpoint();
            currenttime = gettime();
            /#
                assert(isdefined(self.intermissionspawntime));
            #/
            /#
                assert(self.intermissionspawntime <= currenttime);
            #/
            if (currenttime - self.intermissionspawntime >= getdvarfloat(@"hash_b72fc168d3582ece", 2) * 1000) {
                spawnpoint = getspawnpoint();
                var_11f3b4465c8b637b = namespace_8bfdb6eb5a3df67a::playerprestreamrespawnorigin(spawnpoint);
            }
        } else {
            spawnpoint = getspawnpoint();
            var_11f3b4465c8b637b = namespace_8bfdb6eb5a3df67a::playerprestreamrespawnorigin(spawnpoint);
        }
        wait(1);
    }
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x601c
// Size: 0x1d
function initspawns() {
    level.spawnheight = getdvarfloat(@"hash_1cdb6b91e9c4a104", 2500);
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6040
// Size: 0x294
function getspawnpoint(isplanejump) {
    if (!isdefined(self.redeployspawn)) {
        self.redeployspawn = spawnstruct();
        return generatespawnpoint(istrue(isplanejump));
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
        spawnorigin = self.setspawnpoint.playerspawnpos;
        var_fbcabd62b8f66eb8 = namespace_2a184fc4902783dc::create_default_contents(1);
        groundorigin = namespace_d3d40f75bb4e4c32::droptogroundmultitrace(spawnorigin, 10000, -20000, var_fbcabd62b8f66eb8);
        spawnorigin = (spawnorigin[0], spawnorigin[1], groundorigin[2]);
        spawnorigin = spawnorigin + (0, 0, 1) * level.brtdm_config.spawnheight[self.team];
        if (getdvarint(@"hash_53b56fcd1ad4a8ce") == 1) {
            thread drawline(spawnorigin, groundorigin, 15, (1, 1, 0));
        }
        self.redeployspawn.origin = spawnorigin;
        self.redeployspawn.angles = self.setspawnpoint.playerspawnangles;
        self.redeployspawn.lifeid = self.lifeid;
        self.redeployspawn.time = gettime();
        namespace_add8ab90fc53d7f7::spawnpoint_clearspawnpoint(0, 1);
    } else if (self.redeployspawn.team != self.team || self.redeployspawn.lifeid != self.lifeid || istrue(self.redeployspawn.isplanejump)) {
        return generatespawnpoint(istrue(isplanejump));
    }
    return self.redeployspawn;
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62dc
// Size: 0x361
function generatespawnpoint(isplanejump) {
    spawnorigin = level.teamvehicles[self.team].origin;
    var_fbcabd62b8f66eb8 = namespace_2a184fc4902783dc::create_default_contents(1);
    result = namespace_2a184fc4902783dc::ray_trace(spawnorigin + (0, 0, 10000), spawnorigin - (0, 0, 20000), undefined, var_fbcabd62b8f66eb8)["position"];
    spawnorigin = (spawnorigin[0], spawnorigin[1], result[2] + level.spawnheight);
    if (istrue(level.var_af6ec941d2b4e283) && getdvarint(@"hash_202e933fd3431d24", 1) == 1) {
        if (istrue(level.circleclosing)) {
            var_add4fd7502a75a8a = namespace_c5622898120e827f::getsafecircleorigin();
            var_77e882da07e78cfe = namespace_c5622898120e827f::getsafecircleradius();
            var_29d5d9f11d8593c1 = var_add4fd7502a75a8a - spawnorigin;
            var_e1261bd8c0a31088 = distance2d(var_add4fd7502a75a8a, spawnorigin);
            if (var_e1261bd8c0a31088 > var_77e882da07e78cfe) {
                var_12878f234651556d = vectornormalize(var_29d5d9f11d8593c1);
                var_ffeb7fabc1a11eef = 0;
                var_283154a1960efb8d = 0;
                if (level.br_circle.circleindex == 0) {
                    var_ec8d1efd53e76629 = level.br_level.br_circleradii[level.br_circle.circleindex];
                    var_ffeb7fabc1a11eef = var_ec8d1efd53e76629 - var_77e882da07e78cfe;
                } else {
                    var_fb0f5a7f828190b1 = level.br_level.br_circlecenters[level.br_circle.circleindex];
                    var_ffeb7fabc1a11eef = distance2d(var_add4fd7502a75a8a, var_fb0f5a7f828190b1);
                }
                closetime = level.br_level.br_circleclosetimes[level.br_circle.circleindex + 1];
                velocity = var_ffeb7fabc1a11eef / closetime;
                var_5fe3a6ebd9433e80 = velocity * getdvarfloat(@"hash_4f1aee380c4c64f8", 10);
                spawnorigin = spawnorigin + var_12878f234651556d * var_5fe3a6ebd9433e80;
                var_819edacdacb810e4 = namespace_c5622898120e827f::getdangercircleorigin();
                var_e86632d645c137d0 = namespace_c5622898120e827f::getdangercircleradius();
                if (distance2dsquared(spawnorigin, var_819edacdacb810e4) > var_e86632d645c137d0 * var_e86632d645c137d0) {
                    var_2099c256f875ad40 = vectornormalize(spawnorigin - var_819edacdacb810e4);
                    spawnorigin = var_819edacdacb810e4 + var_2099c256f875ad40 * var_e86632d645c137d0 * 0.99;
                }
            }
        }
    }
    self.redeployspawn.origin = spawnorigin;
    self.redeployspawn.angles = level.teamvehicles[self.team].angles;
    self.redeployspawn.time = gettime();
    self.redeployspawn.team = self.team;
    self.redeployspawn.index = -1;
    self.redeployspawn.lifeid = self.lifeid;
    self.redeployspawn.isplanejump = isplanejump;
    return self.redeployspawn;
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6645
// Size: 0xa3
function watchspawninput() {
    /#
        setdevdvar(@"hash_c8b7643c6637e674", 0);
    #/
    while (!isdefined(level.players) || level.players.size == 0) {
        waitframe();
    }
    var_c6bd826ca92175d8 = 1;
    while (1) {
        waitframe();
        if (getdvarint(@"hash_c8b7643c6637e674", 0) != 0) {
            damage = 1000;
            radiusdamage(level.teamvehicles["axis"].origin, 1000, damage, damage);
            /#
                setdevdvar("domination", 0);
            #/
        }
    }
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x66ef
// Size: 0xb7
function addspawnlocation() {
    if (!isdefined(level.truckwarspawnlocations)) {
        level.truckwarspawnlocations = [];
    }
    level.truckwarspawnlocations[level.truckwarspawnlocations.size] = level.players[0].origin;
    /#
        println("loadoutMeleeSlot");
        foreach (origin in level.truckwarspawnlocations) {
            println("vehicle_destroyed" + origin);
        }
        println("trkw_wzan_rmdp");
    #/
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x67ad
// Size: 0xe0
function init_airdrop_anims() {
    level.scr_animtree["ac130"] = %script_model;
    level.scr_anim["ac130"]["truck_drop"] = script_model%mp_mkilo23_gunner_drop_acharlie130;
    level.scr_anim["ac130"]["truck_drop_trimmed"] = script_model%mp_mkilo23_gunner_drop_acharlie130_trimmed;
    level.scr_animtree["parachute"] = %script_model;
    level.scr_anim["parachute"]["truck_drop"] = script_model%mp_mkilo23_gunner_drop_parachute;
    namespace_bc4a4b9456315863::addnotetrack_customfunction("parachute", "parachute_detach_sfx", &parachute_detach_sfx, "truck_drop");
    level.scr_anim["parachute"]["truck_drop_trimmed"] = script_model%mp_mkilo23_gunner_drop_parachute_trimmed;
    namespace_bc4a4b9456315863::addnotetrack_customfunction("parachute", "parachute_detach_sfx", &parachute_detach_sfx, "truck_drop_trimmed");
    init_airrop_vehicle_anims();
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6894
// Size: 0x81
function private function_a614e0fee13eca53() {
    flag_wait("vehicle_init_complete");
    if (!namespace_1f188a13f7e79610::function_89dc39dc11f3988c("veh9_mil_lnd_mrap")) {
        return;
    }
    data = namespace_1f188a13f7e79610::function_29b4292c92443328("veh9_mil_lnd_mrap");
    data.damage.class = "heavy";
    namespace_5a0f3ca265d3a4c8::vehicle_damage_applytabletovehicle("veh9_mil_lnd_mrap");
    data.damage.var_3259f2f4faf8eaa8 = getdvarint(@"hash_e20f6b4a3c18e03a", 3);
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x691c
// Size: 0x53
function init_airrop_vehicle_anims() {
    level.scr_animtree["truck"] = %script_model;
    level.scr_anim["truck"]["truck_drop"] = mp_vehicles_always_loaded%mp_mkilo23_gunner_drop_mkilo23;
    level.scr_anim["truck"]["truck_drop_trimmed"] = mp_vehicles_always_loaded%mp_mkilo23_gunner_drop_mkilo23_trimmed;
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6976
// Size: 0x2d9
function truck_airdrop(vehicle, position, angles, var_134736684b51c14b) {
    animation = ter_op(istrue(var_134736684b51c14b), "truck_drop", "truck_drop_trimmed");
    vehicle.animname = "truck";
    vehicle.var_ae21e3bf76862551 = 1;
    vehicle vehphys_forcekeyframedmotion();
    vehicle hide();
    scenenode = spawn("script_model", position);
    scenenode.angles = angles;
    scenenode setmodel("tag_origin");
    objent = undefined;
    parachute = spawn("script_model", position);
    parachute.angles = angles;
    parachute.animname = "parachute";
    parachute setmodel("veh8_mil_lnd_bromeo_parachute");
    parachute namespace_bc4a4b9456315863::setanimtree();
    parachute forcenetfieldhighlod(1);
    parachute hide();
    carrier = undefined;
    if (istrue(var_134736684b51c14b)) {
        carrier = spawn("script_model", position);
        carrier.angles = angles;
        carrier.animname = "ac130";
        carrier setmodel("veh8_mil_air_acharlie130_ks_carrier");
        carrier namespace_bc4a4b9456315863::setanimtree();
        carrier hide();
    }
    scenenode.vehicle = vehicle;
    scenenode.parachute = parachute;
    scenenode.carrier = carrier;
    scenenode.objent = objent;
    var_5119eba6031edf54 = gettime() + level.frameduration;
    scenenode.endtime = gettime();
    scenenode.vehicleendtime = var_5119eba6031edf54 + getanimlength(level.scr_anim["truck"][animation]) * 1000;
    if (scenenode.vehicleendtime > scenenode.endtime) {
        scenenode.endtime = scenenode.vehicleendtime;
    }
    scenenode.parachuteendtime = var_5119eba6031edf54 + getanimlength(level.scr_anim["parachute"][animation]) * 1000;
    if (scenenode.parachuteendtime > scenenode.endtime) {
        scenenode.endtime = scenenode.parachuteendtime;
    }
    scenenode.carrierendtime = var_5119eba6031edf54 + getanimlength(level.scr_anim["ac130"][animation]) * 1000;
    if (scenenode.carrierendtime > scenenode.endtime) {
        scenenode.endtime = scenenode.carrierendtime;
    }
    scenenode thread truck_airdropinternal(animation);
    return vehicle;
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6c57
// Size: 0x243
function truck_airdropinternal(animation) {
    namespace_bc4a4b9456315863::anim_first_frame_solo(self.vehicle, animation);
    namespace_bc4a4b9456315863::anim_first_frame_solo(self.parachute, animation);
    if (isdefined(self.carrier)) {
        namespace_bc4a4b9456315863::anim_first_frame_solo(self.carrier, animation);
    }
    waitframe();
    if (isdefined(self.vehicle)) {
        self.vehicle show();
        self.vehicle.var_fb98158aaba0ae49 = 1;
        thread namespace_bc4a4b9456315863::anim_single_solo(self.vehicle, animation);
    }
    if (isdefined(self.parachute)) {
        self.parachute show();
        thread namespace_bc4a4b9456315863::anim_single_solo(self.parachute, animation);
    }
    if (isdefined(self.carrier)) {
        self.carrier show();
        self.carrier playloopsound("iw8_cargotruck_drop_c130");
        self.carrier setscriptablepartstate("lights2", "on", 0);
        self.carrier setscriptablepartstate("contrails", "on", 0);
        thread namespace_bc4a4b9456315863::anim_single_solo(self.carrier, animation);
    }
    while (gettime() <= self.endtime) {
        if (!isdefined(self.vehicle) || istrue(self.vehicle.isdestroyed) || gettime() >= self.vehicleendtime) {
            thread truck_detachvehiclefromairdropsequence(self.vehicle);
        }
        if (isdefined(self.parachute) && gettime() >= self.parachuteendtime) {
            self.parachute delete();
        }
        if (isdefined(self.carrier) && gettime() >= self.carrierendtime) {
            self.carrier delete();
        }
        waitframe();
    }
    thread truck_detachvehiclefromairdropsequence(self.vehicle);
    if (isdefined(self.parachute)) {
        self.parachute delete();
    }
    if (isdefined(self.carrier)) {
        self.carrier delete();
    }
    self delete();
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ea1
// Size: 0x2b
function truck_detachvehiclefromairdropsequence(vehicle) {
    self.vehicle = undefined;
    if (isdefined(vehicle)) {
        vehicle vehphys_setdefaultmotion();
        vehicle thread function_f004d4b200aa4c84();
    }
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ed3
// Size: 0xe1
function function_f004d4b200aa4c84() {
    self endon("death");
    self physics_registerforcollisioncallback();
    waitframe();
    endtime = gettime() + 5000;
    var_e66474b0ba499331 = undefined;
    var_bec445e79e2f5b6a = undefined;
    while (gettime() < endtime) {
        if (!isdefined(var_e66474b0ba499331)) {
            var_e66474b0ba499331 = vectordot(self vehicle_getvelocity(), (0, 0, -1));
        } else {
            var_544768e59992f277 = vectordot(self vehicle_getvelocity(), (0, 0, -1));
            var_cdd8b2d07410aab0 = (var_544768e59992f277 - var_e66474b0ba499331) / level.framedurationseconds;
            if (isdefined(var_bec445e79e2f5b6a)) {
                if (var_bec445e79e2f5b6a - var_cdd8b2d07410aab0 >= 300) {
                    function_327619a999339e18(self.origin, self.angles);
                    break;
                }
            }
            var_e66474b0ba499331 = var_544768e59992f277;
            var_bec445e79e2f5b6a = var_cdd8b2d07410aab0;
        }
        waitframe();
    }
    self physics_unregisterforcollisioncallback();
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6fbb
// Size: 0x7a
function function_327619a999339e18(position, angles) {
    self.var_fb98158aaba0ae49 = 0;
    thread function_c1bfb96a5e39a0a7(self);
    thread function_2d381b790dc27f9f(self);
    playfx(getfx("light_tank_land"), position, anglestoforward(angles));
    earthquake(0.3, 0.7, position, 800);
    playrumbleonposition("grenade_rumble", position);
    physicsexplosionsphere(position, 800, 400, 0.5);
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x703c
// Size: 0xc
function parachute_detach_sfx(parachute) {
    
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x704f
// Size: 0x2d
function showsplashtoteam(team, splashname) {
    namespace_d696adde758cbe79::showDMZSplash(splashname, level.teamdata[team]["players"]);
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7083
// Size: 0x4e
function function_9f5606e3bd1c508d(ref, players, delay) {
    if (isdefined(game["dialog"][ref])) {
        /#
            assert(isdefined(players) && players.size > 0);
        #/
        namespace_d3d40f75bb4e4c32::brleaderdialog(ref, 0, players, undefined, delay, undefined, "dx_br_bds5_");
    }
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x70d8
// Size: 0x2bf
function function_73bdf8b18e29b13f(players) {
    thread function_664ea636b19a418f(players);
    level.var_6273d0c32535d86e = getdvarint(@"hash_ec075eaac396b9bb", 0) == 1;
    level.var_eb56e1684153708a = getdvarint(@"hash_4e6765b5f47964df", 0) == 1;
    foreach (station in level.var_354f6e3eebce5123) {
        if (!istrue(station.var_6234172895d0c06f)) {
            station setscriptablepartstate(station function_ec5f4851431f3382(), "idle");
        }
    }
    if (istrue(level.var_6273d0c32535d86e)) {
        level thread function_e3327f035a47191b();
    }
    if (!namespace_71073fa38f11492::isfeaturedisabled("oneLife")) {
        level.disablespawning = 1;
        setdynamicdvar(@"hash_6dc954f6c8bf5237", 1);
    }
    namespace_b984803e2ef247a2::removealldeathicons();
    namespace_4b0406965e556711::gameflaginit("trucks_spawn_complete", 0);
    level thread function_9e97f797dc8e211c();
    namespace_4b0406965e556711::gameflagwait("trucks_spawn_complete");
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        if (!isalive(player)) {
            player namespace_99ac021a7547cae3::spawnplayer(0);
        }
        if (istrue(player.br_iseliminated)) {
            namespace_80cec6cfc70c4f95::unmarkplayeraseliminated(player);
        }
        player setclientomnvar("ui_br_infil_started", 1);
        player setclientomnvar("ui_br_infiled", 1);
        player namespace_8bfdb6eb5a3df67a::function_334a8fe67e88bbe7();
        player thread function_8aa3182c50a3094();
    }
    wait(2);
    namespace_4b0406965e556711::gameflagset("prematch_fade_done");
    foreach (player in level.players) {
        player playsoundtoplayer("tw_ac130_flyby", player, player);
    }
    wait(2);
    spawnvehicles();
    assignvehiclestoteams();
    foreach (player in level.players) {
        if (!isdefined(player)) {
            continue;
        }
        player thread function_927a1c74689ce55a();
    }
    level thread function_4ec88c05d0625ca0();
    namespace_4b0406965e556711::gameflagset("use_truck_respawn");
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x739e
// Size: 0xc
function function_664ea636b19a418f(players) {
    
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x73b1
// Size: 0x6b
function function_8aa3182c50a3094() {
    spawnpoint = spawnstruct();
    spawnpoint.origin = level.var_8d137603bd840e40[self.team].origin;
    spawnpoint.height = getdvarint(@"hash_7b079d61a6a1b553", 3000);
    var_11f3b4465c8b637b = namespace_8bfdb6eb5a3df67a::playerprestreamrespawnorigin(spawnpoint);
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7423
// Size: 0x1a6
function function_927a1c74689ce55a() {
    namespace_d3d40f75bb4e4c32::playerwaittillstreamhintcomplete();
    if (!isalive(self)) {
        namespace_99ac021a7547cae3::spawnplayer(0);
    }
    if (istrue(self.br_iseliminated)) {
        namespace_80cec6cfc70c4f95::unmarkplayeraseliminated(self);
    }
    vehicle = level.teamvehicles[self.team];
    if (!istrue(vehicle.var_ae21e3bf76862551)) {
        level thread truck_airdrop(vehicle, vehicle.origin, vehicle.angles, 0);
    }
    getspawnpoint(1);
    var_c1763d3130bbe79a = anglestoforward((0, randomint(360), 0));
    offset = getdvarint(@"hash_152992667994717b", 500);
    height = getdvarint(@"hash_7b079d61a6a1b553", 3000);
    spawnorigin = self.redeployspawn.origin + var_c1763d3130bbe79a * offset + (0, 0, 1) * height;
    spawnangles = vectortoangles(self.redeployspawn.origin - spawnorigin);
    while (self isinexecutionattack() || self isinexecutionvictim()) {
        waitframe();
    }
    waitframe();
    namespace_f8d3520d3483c1::givestartingarmor();
    self setorigin(spawnorigin, 1);
    self setplayerangles(spawnangles);
    thread namespace_ad389306d44fc6b4::parachute(undefined, 0, undefined, 0);
    namespace_8bfdb6eb5a3df67a::function_e68e4bb4f65f5fe4();
    self.plotarmor = undefined;
    self clearsoundsubmix("mp_br_lobby_fade", 1.5);
    self clearsoundsubmix("deaths_door_mp", 1);
    self notify("do_welcome_splashes");
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75d0
// Size: 0x2cf
function function_e3327f035a47191b() {
    level.var_2c467b902768c15 = [];
    if (istrue(level.var_eb56e1684153708a)) {
        _setdomflagiconinfo("waypoint_repair_station_idle", 1, "neutral", "MP_BR_INGAME/REPAIR_STATION", "ui_mp_br_mapmenu_icon_truckwar_repair_idle", 0);
        _setdomflagiconinfo("waypoint_repair_station_in_use", 1, "neutral", "MP_BR_INGAME/REPAIR_STATION", "ui_mp_br_mapmenu_icon_truckwar_repair_in_use", 0);
    }
    if (getdvarint(@"hash_e9acc6ac1a49f7c0", 0) != 1) {
        var_757d4d2ce1701811 = getdvarint(@"hash_b4a41eb239a45bb2", 90000);
        origins = function_da77fee0cba3f65a();
        foreach (origin in origins) {
            station = function_204a1f1178f8ca87(origin, sqrt(var_757d4d2ce1701811));
            station.var_757d4d2ce1701811 = var_757d4d2ce1701811;
            level.var_2c467b902768c15[level.var_2c467b902768c15.size] = station;
        }
    }
    var_757d4d2ce1701811 = getdvarint(@"hash_15f14ba39b98e2d7", 90000);
    origins = function_d1ecd71915270559();
    foreach (origin in origins) {
        station = function_204a1f1178f8ca87(origin, sqrt(var_757d4d2ce1701811));
        station.var_757d4d2ce1701811 = var_757d4d2ce1701811;
        level.var_2c467b902768c15[level.var_2c467b902768c15.size] = station;
    }
    var_757d4d2ce1701811 = getdvarint(@"hash_c266f4671f4c6f79", 90000);
    origins = function_b680f9a0df0c0507();
    foreach (origin in origins) {
        station = function_204a1f1178f8ca87(origin, sqrt(var_757d4d2ce1701811));
        station.var_757d4d2ce1701811 = var_757d4d2ce1701811;
        level.var_2c467b902768c15[level.var_2c467b902768c15.size] = station;
    }
    var_757d4d2ce1701811 = getdvarint(@"hash_a2c43cbb69aa6a83", 90000);
    origins = function_40a9065852fc3b1();
    foreach (origin in origins) {
        station = function_204a1f1178f8ca87(origin, sqrt(var_757d4d2ce1701811));
        station.var_757d4d2ce1701811 = var_757d4d2ce1701811;
        level.var_2c467b902768c15[level.var_2c467b902768c15.size] = station;
    }
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x78a6
// Size: 0x75
function _setdomflagiconinfo(name, var_96d1603beeefa4ea, colors, string, image, var_b50e35d9c370899b) {
    level.waypointcolors[name] = colors;
    level.waypointbgtype[name] = var_96d1603beeefa4ea;
    level.waypointstring[name] = string;
    level.waypointshader[name] = image;
    level.waypointpulses[name] = var_b50e35d9c370899b;
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7922
// Size: 0x107
function function_204a1f1178f8ca87(origin, radius) {
    station = undefined;
    if (istrue(level.var_eb56e1684153708a)) {
        trigger = spawn("trigger_radius", origin, 0, int(radius), int(radius));
        station = namespace_98b55913d2326ac8::setupobjective(trigger);
        station.pinobj = 0;
        station namespace_19b4203b51d56488::allowuse("none");
        station.flagmodel hide();
        namespace_5a22b6f3a56f7e9b::update_objective_position(station.objidnum, station.curorigin + (0, 0, 60));
        function_865f9c5d005f9a08(station.objidnum, 1);
        station namespace_19b4203b51d56488::setobjectivestatusicons("waypoint_repair_station_idle");
    } else {
        station = spawnscriptable("truckwar_repair_station", origin, (0, 0, 1));
    }
    station.inuse = 0;
    station.var_18e4b96d492d6950 = 0;
    return station;
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a31
// Size: 0x190
function function_da77fee0cba3f65a() {
    origins = [];
    if (level.mapname == "mp_br_mechanics") {
        origins[origins.size] = (1850, -50, 0);
    } else if (level.mapname == "mp_don4") {
        origins[origins.size] = (-18964, -22238, -165);
        origins[origins.size] = (5507, -29862, 62);
        origins[origins.size] = (-21604, 1168, -254);
        origins[origins.size] = (-6975, 19920, -262);
        origins[origins.size] = (-28578, 46653, 2746);
        origins[origins.size] = (-3099, 56987, 678);
        origins[origins.size] = (19946, 3582, -390);
        origins[origins.size] = (16578, -22869, -146);
        origins[origins.size] = (46055, 24809, -342);
    } else {
        origins[origins.size] = (-18964, -22238, -165);
        origins[origins.size] = (5507, -29862, 62);
        origins[origins.size] = (-21604, 1168, -254);
        origins[origins.size] = (-6975, 19920, -262);
        origins[origins.size] = (-28578, 46653, 2746);
        origins[origins.size] = (-3080, 56856, 678);
        origins[origins.size] = (19946, 3582, -390);
        origins[origins.size] = (16578, -22869, -146);
        origins[origins.size] = (46055, 24809, -342);
    }
    return origins;
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7bc9
// Size: 0x241
function function_d1ecd71915270559() {
    origins = [];
    if (level.mapname == "mp_don4") {
        origins[origins.size] = (-30563, 3055, -232);
        origins[origins.size] = (-21165, -15396, -246);
        origins[origins.size] = (-27563, -2557, -256);
        origins[origins.size] = (-22268, -27419, -82);
        origins[origins.size] = (-9895, -34131, 218);
        origins[origins.size] = (10254, -20711, -231);
        origins[origins.size] = (4552, -14424, -229);
        origins[origins.size] = (-11881, 1482, -262);
        origins[origins.size] = (-18095, 6481, -262);
        origins[origins.size] = (10306, 14001, -270);
        origins[origins.size] = (17112, 2074, -534);
        origins[origins.size] = (33549, 26531, 627);
        origins[origins.size] = (44925, 17451, -308);
        origins[origins.size] = (45326, -265, 20);
        origins[origins.size] = (5317, 24973, 50);
        origins[origins.size] = (47951, -9453, 154);
    } else {
        origins[origins.size] = (-30563, 3055, -232);
        origins[origins.size] = (-21165, -15396, -246);
        origins[origins.size] = (-27563, -2557, -256);
        origins[origins.size] = (-22268, -27419, -82);
        origins[origins.size] = (-9895, -34131, 218);
        origins[origins.size] = (10254, -20711, -231);
        origins[origins.size] = (4552, -14424, -229);
        origins[origins.size] = (-11881, 1482, -262);
        origins[origins.size] = (-18095, 6481, -262);
        origins[origins.size] = (10306, 14001, -270);
        origins[origins.size] = (17112, 2074, -534);
        origins[origins.size] = (33549, 26531, 627);
        origins[origins.size] = (44925, 17451, -308);
        origins[origins.size] = (45326, -265, 20);
    }
    return origins;
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e12
// Size: 0x145
function function_b680f9a0df0c0507() {
    origins = [];
    if (level.mapname == "mp_don4") {
        origins[origins.size] = (15625, 36254, 1510);
        origins[origins.size] = (28400, 39129, 762);
        origins[origins.size] = (-7544, 33510, -10);
        origins[origins.size] = (25786, 20693, 1383);
        origins[origins.size] = (-13791, 46397, 1833);
        origins[origins.size] = (3195, 50010, 1120);
        origins[origins.size] = (-24770, 34814, 390);
        origins[origins.size] = (-4988, 16480, -214);
    } else {
        origins[origins.size] = (15625, 36254, 1510);
        origins[origins.size] = (28400, 39129, 762);
        origins[origins.size] = (-7544, 33510, -10);
        origins[origins.size] = (26074, 20938, 1384);
        origins[origins.size] = (-13791, 46397, 1833);
        origins[origins.size] = (3195, 50010, 1120);
        origins[origins.size] = (-24770, 34814, 390);
        origins[origins.size] = (-4988, 16480, -214);
    }
    return origins;
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f5f
// Size: 0xb5
function function_40a9065852fc3b1() {
    origins = [];
    if (level.mapname == "mp_don4") {
        origins[origins.size] = (18940, -24914, -199);
        origins[origins.size] = (13021, -35175, -422);
        origins[origins.size] = (37931, -30644, -513);
        origins[origins.size] = (54024, -23960, -83);
    } else {
        origins[origins.size] = (18940, -24914, -199);
        origins[origins.size] = (13021, -35175, -422);
        origins[origins.size] = (37931, -30644, -513);
        origins[origins.size] = (54024, -23960, -83);
    }
    return origins;
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x801c
// Size: 0x380
function function_4ec88c05d0625ca0() {
    if (!istrue(level.var_6273d0c32535d86e)) {
        return;
    }
    var_1cb68a5e7cc26c0f = getdvarfloat(@"hash_e7c32b801c5b43a2", 0.025);
    var_bed888265c10fcc1 = getdvarfloat(@"hash_9e06adb574328430", 1);
    while (1) {
        foreach (station in level.var_2c467b902768c15) {
            station.var_59e9b68f790a1ef1 = 0;
        }
        foreach (team, truck in level.teamvehicles) {
            if (!isdefined(truck)) {
                continue;
            }
            var_bbbaf88370f158b8 = istrue(truck.healing);
            var_279ebfb6b9dcf247 = 0;
            foreach (station in level.var_2c467b902768c15) {
                distsq = distancesquared(truck.origin, ter_op(isdefined(station.origin), station.origin, station.curorigin));
                if (distsq < station.var_757d4d2ce1701811) {
                    station function_d3210b6035722f9a();
                    station.var_59e9b68f790a1ef1 = 1;
                    var_279ebfb6b9dcf247 = 1;
                    if (istrue(truck.var_a2da885fcc826d37)) {
                        continue;
                    }
                    if (truck.health == truck.maxhealth) {
                        continue;
                    }
                    truck.healing = 1;
                    if (!var_bbbaf88370f158b8) {
                        function_256806bcfdf38c83(team);
                    }
                    var_6f17073f208628d6 = int(var_1cb68a5e7cc26c0f * truck.maxhealth);
                    truck namespace_5a0f3ca265d3a4c8::function_653b96ce8310763e(var_6f17073f208628d6);
                    players = getteamdata(team, "players");
                    foreach (player in players) {
                        if (getdvarint(@"hash_38d15e2d7ddbf066", 0) == 1) {
                            player namespace_e072c8407b2a861c::hudicontype("truckheal");
                        }
                        player namespace_e0a7597be4f2b843::setcachedclientomnvar("ui_br_team_cash_pockets", truck.health);
                        player namespace_e0a7597be4f2b843::setcachedclientomnvar("ui_br_team_cash_banked", truck.maxhealth);
                    }
                    break;
                }
            }
            if (var_bbbaf88370f158b8 && !var_279ebfb6b9dcf247) {
                truck.healing = 0;
                function_256806bcfdf38c83(team);
            }
        }
        foreach (station in level.var_2c467b902768c15) {
            if (!station.var_59e9b68f790a1ef1) {
                station function_ec3b48f24927f84e();
            }
        }
        wait(var_bed888265c10fcc1);
    }
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83a3
// Size: 0x4f
function function_d3210b6035722f9a() {
    self.var_18e4b96d492d6950 = self.inuse;
    self.inuse = 1;
    if (self.inuse != self.var_18e4b96d492d6950) {
        if (istrue(level.var_eb56e1684153708a)) {
            namespace_19b4203b51d56488::setobjectivestatusicons("waypoint_repair_station_in_use");
        }
    }
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83f9
// Size: 0x4e
function function_ec3b48f24927f84e() {
    self.var_18e4b96d492d6950 = self.inuse;
    self.inuse = 0;
    if (self.inuse != self.var_18e4b96d492d6950) {
        if (istrue(level.var_eb56e1684153708a)) {
            namespace_19b4203b51d56488::setobjectivestatusicons("waypoint_repair_station_idle");
        }
    }
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x844e
// Size: 0x54
function private function_e501cce5c715caf() {
    var_5cb3866995416341 = getdvarint(@"hash_856015437dc2f753", 5);
    if (var_5cb3866995416341 > level.br_level.br_circleclosetimes.size - 1) {
        var_5cb3866995416341 = level.br_level.br_circleclosetimes.size - 1;
    }
    return var_5cb3866995416341;
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x84aa
// Size: 0x11a
function function_8d947898c35b8068() {
    level endon("game_ended");
    level.var_24380db31e302a78 = 0;
    level waittill("infils_ready");
    var_5cb3866995416341 = function_e501cce5c715caf();
    var_2948ca54731de34f = 0;
    for (i = 0; i < var_5cb3866995416341 - 1; i++) {
        var_2948ca54731de34f = var_2948ca54731de34f + level.br_level.br_circleclosetimes[i];
        var_2948ca54731de34f = var_2948ca54731de34f + level.br_level.br_circledelaytimes[i];
    }
    var_754110404c0d574f = gettime() + var_2948ca54731de34f * 1000;
    setomnvar("ui_gulag_timer", int(var_754110404c0d574f));
    while (1) {
        level waittill("br_circle_set");
        if (level.br_circle.circleindex == var_5cb3866995416341) {
            namespace_d696adde758cbe79::showDMZSplash("truckwar_spawn_disabled", level.players);
            thread function_9f5606e3bd1c508d("vehicle_spawn_over", level.players);
            level.var_24380db31e302a78 = 1;
            setomnvar("ui_gulag_timer", 0);
            break;
        }
    }
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x85cb
// Size: 0xd5
function function_6de134dad6c879cf() {
    /#
        level endon("veh9_hummer");
        var_f7632b4589b2bed4 = undefined;
        foreach (player in level.players) {
            if (isdefined(player)) {
                var_f7632b4589b2bed4 = player;
                break;
            }
        }
        var_71bf9194c15c05ac = @"hash_419dc795b2a889e0";
        setdevdvarifuninitialized(var_71bf9194c15c05ac, 0);
        while (1) {
            if (getdvarint(var_71bf9194c15c05ac, 0) == 0) {
                waitframe();
                continue;
            }
            playervehicle = var_f7632b4589b2bed4 namespace_f8065cafc523dba5::getvehicle();
            if (isdefined(playervehicle) && !istrue(playervehicle.var_bf7d577f0efb6d92)) {
                function_2b6f04cb613a01e8(playervehicle);
            }
            waitframe();
        }
    #/
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x86a7
// Size: 0x37e
function alternatebrcircle() {
    var_d232dbfd1f080af = level.var_a02389e5d5497129;
    level.br_level.br_circleclosetimes = [0:level.var_837cd01dc6486d8c];
    level.br_level.br_circledelaytimes = [0:level.var_15415172069d735f];
    level.br_level.br_circleshowdelaydanger = [0:1];
    var_8a0c6190284443b7 = level.br_level.br_circleminimapradii;
    var_141bcdd92479e414 = ter_op(isdefined(level.var_5a41c5287237c308), level.var_5a41c5287237c308, level.br_level.br_circleradii);
    if (level.var_e12122c5431959b5) {
        level.br_level.br_circleshowdelaysafe = [0:0];
        level.br_level.br_circleminimapradii = [0:var_8a0c6190284443b7[0]];
        level.br_level.br_circleradii = [0:var_141bcdd92479e414[0], 1:var_141bcdd92479e414[var_141bcdd92479e414.size - 1]];
    } else {
        level.br_level.br_circleshowdelaysafe = [0:0];
        level.br_level.br_circleminimapradii = [0:int(var_d232dbfd1f080af / 2)];
        level.br_level.br_circleradii = [0:var_d232dbfd1f080af, 1:var_d232dbfd1f080af];
    }
    setdvar(@"hash_2499127213b409af", level.var_944b40a215902330);
    circleradius = [];
    var_4f81729168c0b8a = [];
    delaytime = [];
    var_1afd23e03d011ec6 = [];
    var_525c3ed89b299a14 = level.var_e182232b582aa5d6;
    var_fcd89a21f4b87835 = level.var_f28e1ed7f6adf52d;
    for (i = 1; i < level.var_944b40a215902330; i++) {
        if (level.var_e12122c5431959b5) {
            size = ter_op(i + 1 < var_141bcdd92479e414.size - 1, var_141bcdd92479e414[i], var_141bcdd92479e414[var_141bcdd92479e414.size - 2]);
            var_e5bb6f1dd3c507d1 = ter_op(i + 1 < var_8a0c6190284443b7.size - 1, var_8a0c6190284443b7[i], var_8a0c6190284443b7[var_8a0c6190284443b7.size - 2]);
            circleradius[circleradius.size] = size;
            var_1afd23e03d011ec6[var_1afd23e03d011ec6.size] = var_e5bb6f1dd3c507d1;
        } else {
            circleradius[circleradius.size] = 57300;
            var_1afd23e03d011ec6[var_1afd23e03d011ec6.size] = 10500;
        }
        if (isdefined(level.var_3d86f613dc0bfa16)) {
            index = ter_op(level.var_3d86f613dc0bfa16.size <= i, level.var_3d86f613dc0bfa16.size - 1, i);
            var_525c3ed89b299a14 = level.var_3d86f613dc0bfa16[index];
        } else {
            var_525c3ed89b299a14 = max(level.var_886566e69ee53d98, var_525c3ed89b299a14 - level.var_411ce67dc4849722);
        }
        if (isdefined(level.var_dc008290077a7185)) {
            index = ter_op(level.var_dc008290077a7185.size <= i, level.var_dc008290077a7185.size - 1, i);
            var_fcd89a21f4b87835 = level.var_dc008290077a7185[index];
        } else {
            var_fcd89a21f4b87835 = max(level.var_4d77d157099cf459, var_fcd89a21f4b87835 - level.var_84f1c23ed82e4ec5);
        }
        var_4f81729168c0b8a[var_4f81729168c0b8a.size] = var_525c3ed89b299a14;
        delaytime[delaytime.size] = var_fcd89a21f4b87835;
    }
    namespace_c5622898120e827f::extendcirclelist(circleradius, var_4f81729168c0b8a, delaytime, var_1afd23e03d011ec6);
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a2c
// Size: 0x114
function function_d4864f0577158363() {
    level endon("game_ended");
    variance = getdvarint(@"hash_35ac52b0e7e835aa", 10000);
    xoffset = randomfloatrange(variance * -1, variance);
    yoffset = randomfloatrange(variance * -1, variance);
    level.br_level.br_circlecenters[0] = level.br_level.br_mapcenter + (xoffset, yoffset, 0);
    level.br_level.br_circlecenters[1] = level.br_level.br_mapcenter + (xoffset, yoffset, 0);
    if (getdvarint(@"hash_869eba038d752c6e", 1) == 1) {
        for (i = 2; i < level.br_level.br_circlecenters.size - 1; i++) {
            function_a7efa595a4c994c(i);
        }
    } else {
        while (1) {
            level waittill("br_circle_set");
            function_a7efa595a4c994c();
        }
    }
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8b47
// Size: 0x1e7
function function_a7efa595a4c994c(index) {
    if (!isdefined(index)) {
        index = level.br_circle.circleindex + 1;
    }
    if (level.br_level.br_circlecenters.size <= index || !istrue(level.var_af6ec941d2b4e283)) {
        return;
    }
    var_d303e81057b8a554 = level.br_level.br_circlecenters[index];
    var_b65a1bda511e60ab = level.br_level.br_circleradii[index - 1] * level.var_6d02a364e8331928;
    randompoint = namespace_c5622898120e827f::getrandompointinboundscircle(var_d303e81057b8a554, var_b65a1bda511e60ab, 0.8, 1, 1, 0, 1);
    var_71e7cde0a5dbe9da = vectornormalize(randompoint - var_d303e81057b8a554) * var_b65a1bda511e60ab;
    var_da9544331d11402c = var_d303e81057b8a554 + var_71e7cde0a5dbe9da;
    if (getdvarint(@"hash_668d5b4706735002", 1) == 1 && !namespace_c5622898120e827f::isvalidpointinbounds(var_da9544331d11402c, 1)) {
        var_da9544331d11402c = var_d303e81057b8a554 - var_71e7cde0a5dbe9da;
    }
    var_b755813c92f9bd4a = getdvarint(@"hash_5664da3ca3493f97", 10000);
    var_e93890b0c58ec649 = vectornormalize(level.br_level.br_mapcenter - var_da9544331d11402c);
    contents = physics_createcontents([0:"physicscontents_trigger"]);
    trace = namespace_2a184fc4902783dc::ray_trace_ents(var_d303e81057b8a554, var_da9544331d11402c, level.outofboundstriggers, contents);
    while (!namespace_c5622898120e827f::isvalidpointinbounds(var_da9544331d11402c, 1) || trace["fraction"] < 1) {
        var_da9544331d11402c = var_da9544331d11402c + var_e93890b0c58ec649 * var_b755813c92f9bd4a;
        trace = namespace_2a184fc4902783dc::ray_trace_ents(var_d303e81057b8a554, var_da9544331d11402c, level.outofboundstriggers, contents);
    }
    level.br_level.br_circlecenters[index + 1] = var_da9544331d11402c;
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8d35
// Size: 0x88
function function_1e7c5cadd2c12a32(var_cdcd3178f5176585) {
    bounds = level.br_level.br_mapbounds;
    var_b1d9d00302a9b4d6 = level.var_be52f2d0dee6b894;
    inmapbounds = var_cdcd3178f5176585[0] < bounds[0][0] * var_b1d9d00302a9b4d6 && var_cdcd3178f5176585[0] > bounds[1][0] * var_b1d9d00302a9b4d6 && var_cdcd3178f5176585[1] < bounds[0][1] * var_b1d9d00302a9b4d6 && var_cdcd3178f5176585[1] > bounds[1][1] * var_b1d9d00302a9b4d6;
    return inmapbounds;
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8dc5
// Size: 0x1c6
function function_875871597ab85666(point, time) {
    var_add4fd7502a75a8a = namespace_c5622898120e827f::getsafecircleorigin();
    var_77e882da07e78cfe = namespace_c5622898120e827f::getsafecircleradius();
    var_29d5d9f11d8593c1 = var_add4fd7502a75a8a - point;
    var_e1261bd8c0a31088 = distance2d(var_add4fd7502a75a8a, point);
    if (var_e1261bd8c0a31088 < var_77e882da07e78cfe) {
        return 0;
    }
    var_b5bd7f541cd7da40 = 0;
    var_38a99723f45fa9a2 = (0, 0, 0);
    var_59786c4080c725a3 = 0;
    var_d262fcbb7ff54d34 = 0;
    var_910f0a634bf6e83e = 0;
    var_6f62ced051b4427f = 0;
    closetime = level.br_level.br_circleclosetimes[level.br_circle.circleindex];
    if (level.br_circle.circleindex > 0) {
        var_fb0f5a7f828190b1 = level.br_level.br_circlecenters[level.br_circle.circleindex];
        var_b5bd7f541cd7da40 = distance2d(var_add4fd7502a75a8a, var_fb0f5a7f828190b1);
        var_38a99723f45fa9a2 = vectornormalize(var_add4fd7502a75a8a - var_fb0f5a7f828190b1);
    }
    var_59786c4080c725a3 = var_b5bd7f541cd7da40 / closetime;
    var_ec8d1efd53e76629 = level.br_level.br_circleradii[level.br_circle.circleindex];
    var_d262fcbb7ff54d34 = var_ec8d1efd53e76629 - var_77e882da07e78cfe;
    var_910f0a634bf6e83e = vectornormalize(var_29d5d9f11d8593c1);
    var_6f62ced051b4427f = var_d262fcbb7ff54d34 / closetime;
    testpoint = point + var_38a99723f45fa9a2 * -1 * time * var_59786c4080c725a3 + var_910f0a634bf6e83e * -1 * time * var_6f62ced051b4427f;
    return namespace_c5622898120e827f::function_24c5a8d31ae262f(testpoint);
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f93
// Size: 0xef
function function_c1bfb96a5e39a0a7(vehicle) {
    vehicle endon("death");
    while (1) {
        var_5473a133b9d77893 = vehicle waittill("give_upgrade");
        switch (var_5473a133b9d77893) {
        case #"hash_25789111b74943b4":
            function_22f556fab80598eb(vehicle);
            break;
        case #"hash_13d1f84d0ae96a5f":
            function_852abb774ff2a90e(vehicle);
            break;
        case #"hash_c59e6484a3367f4":
            function_8f4da0f65951c0b(vehicle);
            break;
        case #"hash_634b246c3da5c56f":
            function_2b6f04cb613a01e8(vehicle);
            break;
        case #"hash_27cab410c0232a31":
            function_60fde27c0dd8510(vehicle);
            break;
        case #"hash_d4850e4dfbc48417":
            function_e8779dce7e960d56(vehicle);
            break;
        case #"hash_d8f795eb14c75e6":
            function_3cf1ac037cdbc2a5(vehicle);
            break;
        case #"hash_ec69fbee2cad5b9b":
            function_ab77860b63be6da6(vehicle);
            break;
        }
    }
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9089
// Size: 0x53
function function_22f556fab80598eb(vehicle) {
    function_e9b1e17b0d0ba3(vehicle);
    vehicle.var_4f3e23ee48660f12 = 1;
    vehicle notify("upgrade_message", "armor_upgraded");
    playsoundatpos(vehicle.origin + (0, 0, 20), "veh_truckwars_add_armor");
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90e3
// Size: 0x2b8
function function_e9b1e17b0d0ba3(vehicle) {
    armor = [0:"tag_armor_body_back_01", 1:"tag_armor_body_back_02", 2:"tag_armor_body_back_03", 3:"tag_armor_body_back_04", 4:"tag_armor_body_back_05", 5:"tag_armor_body_back_06", 6:"tag_armor_body_back_07", 7:"tag_armor_body_back_08", 8:"tag_armor_body_back_09", 9:"tag_armor_body_back_10", 10:"tag_armor_body_back_11", 11:"tag_armor_body_back_12", 12:"tag_armor_body_left_01", 13:"tag_armor_body_left_02", 14:"tag_armor_body_left_03", 15:"tag_armor_body_left_04", 16:"tag_armor_body_left_05", 17:"tag_armor_body_left_06", 18:"tag_armor_body_left_07", 19:"tag_armor_body_left_08", 20:"tag_armor_body_left_09", 21:"tag_armor_body_left_10", 22:"tag_armor_body_left_11", 23:"tag_armor_body_right_01", 24:"tag_armor_body_right_02", 25:"tag_armor_body_right_03", 26:"tag_armor_body_right_04", 27:"tag_armor_body_right_05", 28:"tag_armor_body_right_06", 29:"tag_armor_body_right_07", 30:"tag_armor_body_right_08", 31:"tag_armor_body_right_09", 32:"tag_armor_body_right_10", 33:"tag_armor_body_right_11", 34:"tag_armor_bumper_back", 35:"tag_armor_bumper_front", 36:"tag_armor_cabin_front_01", 37:"tag_armor_cabin_front_02", 38:"tag_armor_cabin_front_03", 39:"tag_armor_cabin_front_04", 40:"tag_armor_cabin_front_05", 41:"tag_armor_cabin_front_06", 42:"tag_armor_cabin_front_07", 43:"tag_armor_cabin_front_09", 44:"tag_armor_cabin_left_01", 45:"tag_armor_cabin_left_02", 46:"tag_armor_cabin_left_03", 47:"tag_armor_cabin_left_04", 48:"tag_armor_cabin_left_05", 49:"tag_armor_cabin_right_01", 50:"tag_armor_cabin_right_02", 51:"tag_armor_cabin_right_03", 52:"tag_armor_cabin_right_04", 53:"tag_armor_cabin_right_05", 54:"tag_armor_cabin_top", 55:"tag_armor_door_left", 56:"tag_armor_door_right", 57:"tag_armor_wheel_back_left", 58:"tag_armor_wheel_back_right", 59:"tag_armor_wheel_front_left", 60:"tag_armor_wheel_front_right", 61:"tag_armor_wheel_middle1_left", 62:"tag_armor_wheel_middle1_right", 63:"tag_armor_wheel_middle2_left", 64:"tag_armor_wheel_middle2_right", 65:"tag_armor_wheel_middle2_right"];
    foreach (tag in armor) {
        namespace_5a0f3ca265d3a4c8::function_963f1cb109b9c186(vehicle, tag);
    }
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x93a2
// Size: 0x89
function function_35f2ff0427594776(vehicle) {
    doors = [0:"tag_door_front_left", 1:"tag_door_front_right", 2:"tag_windshield_front"];
    foreach (tag in doors) {
        namespace_5a0f3ca265d3a4c8::function_963f1cb109b9c186(vehicle, tag);
    }
    namespace_5a0f3ca265d3a4c8::function_9ae605ed3dc3bd1(vehicle);
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9432
// Size: 0xab
function function_852abb774ff2a90e(vehicle) {
    if (namespace_3c37cb17ade254d::issharedfuncdefined("vehicle_trophy", "init")) {
        var_d9a1da35dbde5e4f = namespace_3c37cb17ade254d::getsharedfunc("vehicle_trophy", "init");
        vehicle.var_fa8480818f379e09 = 3;
        vehicle.isdisabled = 0;
        vehicle thread [[ var_d9a1da35dbde5e4f ]](72, 280900, &function_9f13cc66529c6e8f, &trophy_protectionsuccessful);
        if (namespace_3c37cb17ade254d::issharedfuncdefined("vehicle_trophyCreateExplosion", "init")) {
            vehicle.explosion = [[ namespace_3c37cb17ade254d::getsharedfunc("vehicle_trophyCreateExplosion", "init") ]](vehicle);
        }
        vehicle notify("upgrade_message", "trophy_activated");
    }
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x94e4
// Size: 0x34
function function_8f4da0f65951c0b(vehicle) {
    vehicle.var_fa8480818f379e09 = 3;
    vehicle.isdisabled = 0;
    vehicle notify("upgrade_message", "trophy_ammo_refill");
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x951f
// Size: 0x5
function function_9f13cc66529c6e8f() {
    return 1;
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x952c
// Size: 0x100
function trophy_protectionsuccessful(var_1dbabe317739127e) {
    var_d7030318ca9e674a = var_1dbabe317739127e.origin;
    if (namespace_3c37cb17ade254d::issharedfuncdefined("vehicle_trophyDestroyTarget", "init")) {
        [[ namespace_3c37cb17ade254d::getsharedfunc("vehicle_trophyDestroyTarget", "init") ]](var_1dbabe317739127e);
    }
    tag = "tag_origin";
    var_1331aefd6d9a100 = vectortoangles(self gettagorigin(tag) - var_d7030318ca9e674a);
    var_cc29543de9737588 = combineangles(var_1331aefd6d9a100, (-90, 0, 0));
    if (namespace_3c37cb17ade254d::issharedfuncdefined("vehicle_trophyExplode", "init")) {
        self.explosion thread [[ namespace_3c37cb17ade254d::getsharedfunc("vehicle_trophyExplode", "init") ]](var_d7030318ca9e674a, var_cc29543de9737588);
    }
    if (self.var_fa8480818f379e09 > 0) {
        self.var_fa8480818f379e09--;
    }
    if (self.var_fa8480818f379e09 == 0) {
        self.isdisabled = 1;
        self notify("upgrade_message", "trophy_no_ammo");
    }
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9633
// Size: 0x22
function function_2b6f04cb613a01e8(vehicle) {
    vehicle thread function_8f5f2701e3cb8e9c();
    vehicle notify("upgrade_message", "uav_activated");
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x965c
// Size: 0x78
function function_8f5f2701e3cb8e9c() {
    self endon("death");
    radius = getdvarint(@"hash_bc348a829ed932", 12000);
    time = getdvarint(@"hash_4523720be81f63ad", 5);
    timems = time * 1000;
    while (1) {
        triggerportableradarpingteam(self.origin, self.team, radius, timems);
        wait(time);
    }
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x96db
// Size: 0x64
function function_60fde27c0dd8510(vehicle) {
    turret = namespace_1f188a13f7e79610::vehicle_getturretbyweapon(vehicle, "iw9_mg_mrap_mp");
    turret function_8f6d35f8c518e9a0(getdvarfloat(@"hash_6b8ca746928c55dd", 0.07));
    turret function_ec33a72c0cb03aa6(getdvarfloat(@"hash_8282dfac90ba34d7", 0.35));
    vehicle notify("upgrade_message", "barrel_activated");
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9746
// Size: 0xc8
function function_e8779dce7e960d56(vehicle) {
    spawndata = spawnstruct();
    if (isdefined(vehicle.var_fadc8ce0c904abda)) {
        spawndata.var_14cde247ac3313a4 = vehicle.var_fadc8ce0c904abda;
    }
    if (namespace_3c37cb17ade254d::issharedfuncdefined("veh9_mil_lnd_mrap", "createGrenadeTurret")) {
        turret = [[ namespace_3c37cb17ade254d::getsharedfunc("veh9_mil_lnd_mrap", "createGrenadeTurret") ]](vehicle, spawndata);
        namespace_1f188a13f7e79610::vehicle_registerturret(vehicle, turret, makeweapon("iw9_tur_mrap_mp"));
        vehicle.occupantsreserving["gunner"] = undefined;
        vehicle.var_65da0a245b653cc = undefined;
        namespace_141c4634b6ea7b27::vehicle_interact_setvehicledirty(vehicle);
        namespace_141c4634b6ea7b27::vehicle_interact_setpointsdirty(vehicle);
        namespace_141c4634b6ea7b27::vehicle_interact_updateusability(vehicle);
    }
    vehicle notify("upgrade_message", "grenade_turret_activated");
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9815
// Size: 0x34
function function_3cf1ac037cdbc2a5(vehicle) {
    vehicle.var_ec76ffdbe2f37c5b = 0;
    vehicle.var_9cd07317ba52df4 = 1;
    vehicle notify("upgrade_message", "smoke_activated");
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9850
// Size: 0x33
function function_ab77860b63be6da6(vehicle) {
    vehicle vehicle_settopspeedforward(42);
    vehicle.var_580db2147190028a = 0.5;
    vehicle notify("upgrade_message", "engine_activated");
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x988a
// Size: 0x2e
function function_5b776e8c62234d00() {
    level endon("game_ended");
    self waittill("death");
    if (isdefined(self.radar)) {
        self.radar delete();
    }
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x98bf
// Size: 0x89
function function_5fd118f91ae96e57(vehicle) {
    spawnorigin = vehicle gettagorigin("tag_screen_left");
    buystation = spawn("script_model", spawnorigin);
    buystation linkto(vehicle, "tag_screen_left");
    buystation.index = 1;
    buystation.var_7940dcde72827af7 = 10;
    buystation.playersusing = [];
    buystation.var_114e759371623080 = 1;
    vehicle.buystation = buystation;
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x994f
// Size: 0xa3
function function_fe081d074870c23d(instance, part, state, player, var_a5b2c541413aa895, var_cc38472e36be1b61) {
    player.var_c77002478cdfd85f = level.teamvehicles[player.team];
    buystation = level.teamvehicles[player.team].buystation;
    buystation.playersusing[buystation.playersusing.size] = player;
    player thread namespace_a4b43c1cf86c6fe5::_runpurchasemenu(buystation);
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x99f9
// Size: 0x33
function function_2d381b790dc27f9f(vehicle) {
    vehicle endon("death");
    while (1) {
        function_256806bcfdf38c83(vehicle.team);
        wait(0.1);
    }
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9a33
// Size: 0x2e0
function function_256806bcfdf38c83(team, player) {
    vehicle = level.teamvehicles[team];
    var_5c9ddcf56d36f133 = 0;
    if (isdefined(vehicle) && !istrue(vehicle.isdestroyed)) {
        if (namespace_141c4634b6ea7b27::function_97c32f66eff29610(vehicle, "uav")) {
            var_5c9ddcf56d36f133 = var_5c9ddcf56d36f133 + 1;
        }
        if (namespace_141c4634b6ea7b27::function_97c32f66eff29610(vehicle, "armor")) {
            var_5c9ddcf56d36f133 = var_5c9ddcf56d36f133 + 2;
        }
        if (namespace_141c4634b6ea7b27::function_97c32f66eff29610(vehicle, "trophy")) {
            var_5c9ddcf56d36f133 = var_5c9ddcf56d36f133 + 4;
            var_5c9ddcf56d36f133 = var_5c9ddcf56d36f133 + (vehicle.var_fa8480818f379e09 << 3);
            if (isdefined(vehicle.var_fa8480818f379e09) && vehicle.var_fa8480818f379e09 == 3) {
                var_5c9ddcf56d36f133 = var_5c9ddcf56d36f133 + 32;
            }
        }
        if (namespace_141c4634b6ea7b27::function_97c32f66eff29610(vehicle, "barrel")) {
            var_5c9ddcf56d36f133 = var_5c9ddcf56d36f133 + 64;
        }
        if (namespace_141c4634b6ea7b27::function_97c32f66eff29610(vehicle, "turret")) {
            var_5c9ddcf56d36f133 = var_5c9ddcf56d36f133 + 128;
        }
        if (namespace_141c4634b6ea7b27::function_97c32f66eff29610(vehicle, "smoke")) {
            var_5c9ddcf56d36f133 = var_5c9ddcf56d36f133 + 256;
        }
        if (namespace_141c4634b6ea7b27::function_97c32f66eff29610(vehicle, "engine")) {
            var_5c9ddcf56d36f133 = var_5c9ddcf56d36f133 + 512;
        }
        if (vehicle.health == vehicle.maxhealth) {
            var_5c9ddcf56d36f133 = var_5c9ddcf56d36f133 + 8192;
        } else if (!vehicle namespace_141c4634b6ea7b27::function_fc271f387096702f()) {
            var_5c9ddcf56d36f133 = var_5c9ddcf56d36f133 + 2048;
        } else if (isdefined(vehicle.var_90c69f8ba6618910)) {
            var_5c9ddcf56d36f133 = var_5c9ddcf56d36f133 + 4096;
        }
        if (istrue(vehicle.flipped)) {
            var_5c9ddcf56d36f133 = var_5c9ddcf56d36f133 + 16384;
        }
    } else if (function_81c029669130c0d4(team)) {
        var_5c9ddcf56d36f133 = var_5c9ddcf56d36f133 + 32768;
    } else {
        var_5c9ddcf56d36f133 = var_5c9ddcf56d36f133 + 1024;
    }
    var_a776f097eb36e500 = 0;
    var_ef26f6c03156ba96 = 0;
    if (isdefined(vehicle)) {
        var_a776f097eb36e500 = clamp(vehicle.health / vehicle.maxhealth, 0, 1);
        var_ef26f6c03156ba96 = clamp(vehicle.fuel / level.var_c7b9749bcc6a6207, 0, 1);
    }
    if (isdefined(player)) {
        player namespace_e0a7597be4f2b843::setcachedclientomnvar("ui_armored_truck_status", var_5c9ddcf56d36f133);
        player namespace_e0a7597be4f2b843::setcachedclientomnvar("ui_armored_truck_health", var_a776f097eb36e500);
        player namespace_e0a7597be4f2b843::setcachedclientomnvar("ui_armored_truck_fuel", var_ef26f6c03156ba96);
    } else {
        players = getteamdata(team, "players");
        foreach (p in players) {
            p namespace_e0a7597be4f2b843::setcachedclientomnvar("ui_armored_truck_status", var_5c9ddcf56d36f133);
            p namespace_e0a7597be4f2b843::setcachedclientomnvar("ui_armored_truck_health", var_a776f097eb36e500);
            p namespace_e0a7597be4f2b843::setcachedclientomnvar("ui_armored_truck_fuel", var_ef26f6c03156ba96);
        }
    }
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9d1a
// Size: 0x13a
function function_de1ac98379235d8b(itemname, var_1de514083a2fbc8d) {
    if (!isdefined(var_1de514083a2fbc8d)) {
        return undefined;
    }
    player = self;
    /#
        assertex(isdefined(player));
    #/
    stock = 0;
    var_7637bed9334618e = "";
    switch (itemname) {
    case #"hash_816539877a1d1fdc":
        var_7637bed9334618e = "armor";
        break;
    case #"hash_ad9b9dd5f299d159":
        var_7637bed9334618e = "barrel";
        break;
    case #"hash_72146e01d3915d7":
        var_7637bed9334618e = "uav";
        break;
    case #"hash_7f669e169bdba303":
        var_7637bed9334618e = "engine";
        break;
    case #"hash_b7d856499be19287":
        var_7637bed9334618e = "turret";
        break;
    case #"hash_f7b4d170b800b77e":
        var_7637bed9334618e = "smoke";
        break;
    case #"hash_1bbe99c97bde7d67":
        var_7637bed9334618e = "trophy";
        break;
    }
    if (var_7637bed9334618e != "") {
        vehicle = level.teamvehicles[player.team];
        if (!isdefined(vehicle)) {
            return undefined;
        }
        if (namespace_141c4634b6ea7b27::function_97c32f66eff29610(vehicle, var_7637bed9334618e)) {
            return 0;
        } else {
            return 1;
        }
    } else {
        return var_1de514083a2fbc8d;
    }
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e5b
// Size: 0x13
function function_59566a4ce3c2c3e2() {
    return getdvarint(@"hash_9e315c398cde8b75", 1);
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9e76
// Size: 0x7c
function function_60d5992f51286201(team) {
    if (!isdefined(self) || !isdefined(self.team)) {
        return 0;
    }
    team = self.team;
    if (!isdefined(level.var_b5a6f27d40059c6a)) {
        level.var_b5a6f27d40059c6a = [];
    }
    level.var_b5a6f27d40059c6a[self.team] = 1;
    function_256806bcfdf38c83(self.team, self);
    if (function_59566a4ce3c2c3e2()) {
        thread function_7106da00352cd1e0();
    }
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9ef9
// Size: 0x4d
function function_81c029669130c0d4(team) {
    if (!isdefined(team)) {
        if (!isdefined(self) || !isdefined(self.team)) {
            return 0;
        }
        team = self.team;
    }
    if (!isdefined(level.var_b5a6f27d40059c6a)) {
        return 0;
    }
    return istrue(level.var_b5a6f27d40059c6a[team]);
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f4e
// Size: 0x26
function function_d5d633c35998ebe7(team) {
    if (!isdefined(team)) {
        return 0;
    }
    level.var_b5a6f27d40059c6a[team] = undefined;
    function_256806bcfdf38c83(team);
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f7b
// Size: 0x5d
function function_7106da00352cd1e0() {
    level endon("game_ended");
    self endon("vehicle_drop_success");
    if (!isdefined(self) || !isdefined(self.team)) {
        return;
    }
    team = self.team;
    level notify("monitor_death_for_airdrop_" + team);
    level endon("monitor_death_for_airdrop_" + team);
    self waittill("death_or_disconnect");
    function_d5d633c35998ebe7(team);
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9fdf
// Size: 0x58
function function_8d45ff943de1cfc4() {
    level.br_standard_loadout = function_93e3d45fc14694a2();
    var_c179e44bd14d2d12 = function_9577fcf1998c53b7();
    namespace_d20f8ef223912e12::givestandardtableloadout(0, 1, var_c179e44bd14d2d12);
    if (!isdefined(self.equipment) || !isdefined(self.equipment["health"])) {
        namespace_f8d3520d3483c1::function_be5c0cdfa0202544();
    }
    return 0;
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa03f
// Size: 0xaa
function function_93e3d45fc14694a2() {
    loadout = level.br_standard_loadout;
    if (isdefined(level.var_c04b5edf3f9ea340)) {
        circleindex = 0;
        if (isdefined(level.br_circle) && isdefined(level.br_circle.circleindex)) {
            circleindex = min(level.br_circle.circleindex, level.var_c04b5edf3f9ea340.size);
            circleindex = int(circleindex);
        }
        if (isdefined(level.var_77c121d31e587ba8[circleindex])) {
            loadout = level.var_c04b5edf3f9ea340[circleindex][level.var_77c121d31e587ba8[circleindex]];
        }
    }
    return loadout;
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa0f1
// Size: 0x6a
function function_9577fcf1998c53b7() {
    var_c179e44bd14d2d12 = 0;
    if (isdefined(level.var_c04b5edf3f9ea340)) {
        if (isdefined(level.br_circle) && isdefined(level.br_circle.circleindex)) {
            if (level.br_circle.circleindex == level.var_c04b5edf3f9ea340.size - 1) {
                var_c179e44bd14d2d12 = 1;
            }
        }
    }
    return var_c179e44bd14d2d12;
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa163
// Size: 0x4c
function function_81124b7b16101f8b() {
    var_fb932f46ef5ec56 = namespace_cd0b2d039510b38d::getsubgametype() == "truckwar";
    if (!var_fb932f46ef5ec56) {
        return;
    }
    var_13d86b0aea4f84af = namespace_ea497db8cab34561::function_59566a4ce3c2c3e2();
    if (var_13d86b0aea4f84af) {
        if (function_6e4f7e117d4651c3()) {
            return 0;
        }
    }
    if (!function_d48c5142f8271c18()) {
        return 0;
    }
    return 1;
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa1b7
// Size: 0x107
function function_6e4f7e117d4651c3() {
    player = self;
    squad = namespace_54d20dd0dd79277f::getteamdata(player.team, "players");
    foreach (var_8f7040e569ec9e98 in squad) {
        if (isdefined(var_8f7040e569ec9e98)) {
            var_ebec497ff8b18a45 = var_8f7040e569ec9e98 namespace_85d036cb78063c4a::getcurrentsuperref();
            if (isdefined(var_ebec497ff8b18a45) && var_ebec497ff8b18a45 == "super_vehicle_drop") {
                if (var_8f7040e569ec9e98 getammocount(var_8f7040e569ec9e98.super.staticdata.weapon) > 0) {
                    return 1;
                }
            } else if (var_8f7040e569ec9e98 namespace_aead94004cf4c147::function_36b1968bfe78916b(9245)) {
                return 1;
            }
        }
    }
    if (isdefined(level.var_e3ccf0898a949bec) && istrue(level.var_e3ccf0898a949bec[player.team])) {
        return 1;
    }
    return 0;
}

// Namespace namespace_7164d2949dc2f2a/namespace_ea497db8cab34561
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa2c6
// Size: 0x37
function function_d48c5142f8271c18() {
    if (namespace_ea497db8cab34561::function_81c029669130c0d4()) {
        return 0;
    }
    if (isdefined(level.teamvehicles) && !isdefined(level.teamvehicles[self.team])) {
        return 1;
    }
    return 0;
}

