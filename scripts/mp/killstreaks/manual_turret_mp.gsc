// mwiii decomp prototype
#using scripts\mp\hud_util.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\print.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\cp_mp\killstreaks\manual_turret.gsc;
#using scripts\mp\equipment.gsc;
#using scripts\mp\killstreaks\target_marker.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\damage.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\movers.gsc;

#namespace manual_turret_mp;

// Namespace manual_turret_mp/namespace_786d7cfd93ab29c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x400
// Size: 0xbc
function init() {
    namespace_58a74e7d54b56e8d::registerkillstreak("manual_turret", &namespace_ac45d22648d4adff::tryusemanualturretfromstruct);
    init_manual_turret_settings();
    init_manual_turret_vo();
    namespace_3c37cb17ade254d::registersharedfunc("manual_turret", "monitorDamage", &manual_turret_monitordamage);
    namespace_3c37cb17ade254d::registersharedfunc("manual_turret", "createHintObject", &manual_turret_createhintobject);
    namespace_3c37cb17ade254d::registersharedfunc("manual_turret", "getTargetMarker", &manual_turret_gettargetmarker);
    namespace_3c37cb17ade254d::registersharedfunc("manual_turret", "getEnemyPlayers", &manual_turret_getenemyplayers);
    namespace_3c37cb17ade254d::registersharedfunc("manual_turret", "watchForPlayerEnteringLastStand", &manual_turret_laststandwatcher);
    namespace_3c37cb17ade254d::registersharedfunc("manual_turret", "handleMovingPlatform", &manual_turret_handlemovingplatform);
    namespace_3c37cb17ade254d::registersharedfunc("manual_turret", "allowPickupOfTurret", &manual_turret_canpickup);
}

// Namespace manual_turret_mp/namespace_786d7cfd93ab29c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c3
// Size: 0x476
function init_manual_turret_settings() {
    level.sentrysettings["manual_turret"] = spawnstruct();
    level.sentrysettings["manual_turret"].health = 999999;
    level.sentrysettings["manual_turret"].maxhealth = 650;
    level.sentrysettings["manual_turret"].burstmin = 20;
    level.sentrysettings["manual_turret"].burstmax = 120;
    level.sentrysettings["manual_turret"].pausemin = 0.15;
    level.sentrysettings["manual_turret"].pausemax = 0.35;
    level.sentrysettings["manual_turret"].sentrymodeon = "manual";
    level.sentrysettings["manual_turret"].sentrymodeoff = "sentry_offline";
    level.sentrysettings["manual_turret"].ammo = 200;
    level.sentrysettings["manual_turret"].timeout = getdvarfloat(@"hash_9775c39c335aab23", 90);
    level.sentrysettings["manual_turret"].spinuptime = 0.05;
    level.sentrysettings["manual_turret"].overheattime = 8;
    level.sentrysettings["manual_turret"].cooldowntime = 0.1;
    level.sentrysettings["manual_turret"].fxtime = 0.3;
    level.sentrysettings["manual_turret"].streakname = "manual_turret";
    level.sentrysettings["manual_turret"].weaponinfo = "manual_turret_mp";
    level.sentrysettings["manual_turret"].playerweaponinfo = "manual_turret_mp";
    level.sentrysettings["manual_turret"].scriptable = "ks_manual_turret_mp";
    level.sentrysettings["manual_turret"].modelbasecover = "killstreak_wm_mounted_turret";
    level.sentrysettings["manual_turret"].modelbaseground = "weapon_wm_mg_mobile_turret";
    level.sentrysettings["manual_turret"].modeldestroyedcover = "killstreak_wm_mounted_turret";
    level.sentrysettings["manual_turret"].modeldestroyedground = "weapon_wm_mg_mobile_turret";
    level.sentrysettings["manual_turret"].placementhintstring = "KILLSTREAKS_HINTS/SENTRY_PLACE";
    level.sentrysettings["manual_turret"].ownerusehintstring = "KILLSTREAKS_HINTS/SENTRY_OWNER_USE";
    level.sentrysettings["manual_turret"].otherusehintstring = "KILLSTREAKS_HINTS/SENTRY_OTHER_USE";
    level.sentrysettings["manual_turret"].dismantlehintstring = "KILLSTREAKS_HINTS/SENTRY_DISMANTLE";
    level.sentrysettings["manual_turret"].headicon = 1;
    level.sentrysettings["manual_turret"].teamsplash = "used_manual_turret";
    level.sentrysettings["manual_turret"].destroyedsplash = "callout_destroyed_manual_turret";
    level.sentrysettings["manual_turret"].shouldsplash = 1;
    level.sentrysettings["manual_turret"].votimeout = "timeout_manual_turret";
    level.sentrysettings["manual_turret"].vodestroyed = "destroyed_manual_turret";
    level.sentrysettings["manual_turret"].scorepopup = "destroyed_manual_turret";
    level.sentrysettings["manual_turret"].lightfxtag = "tag_fx";
    level.sentrysettings["manual_turret"].iskillstreak = 1;
    level.sentrysettings["manual_turret"].headiconoffset = (0, 0, 75);
}

// Namespace manual_turret_mp/namespace_786d7cfd93ab29c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x940
// Size: 0x29
function init_manual_turret_vo() {
    game["dialog"]["manual_turret_low_ammo"] = "manual_turret_ammo_low";
    game["dialog"]["manual_turret_no_ammo"] = "manual_turret_no_ammo";
}

// Namespace manual_turret_mp/namespace_786d7cfd93ab29c1
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x970
// Size: 0xb4
function manual_turret_equipment_wrapper(ref, slot, objweapon) {
    namespace_1a507865f681850e::takeequipment(slot);
    used = namespace_ac45d22648d4adff::tryusemanualturret("manual_turret");
    if (!used) {
        namespace_1a507865f681850e::giveequipment("equip_shieldturret", slot);
    } else {
        init_manual_turret_settings();
        init_manual_turret_vo();
        namespace_3c37cb17ade254d::registersharedfunc("manual_turret", "monitorDamage", &manual_turret_monitordamage);
        namespace_3c37cb17ade254d::registersharedfunc("manual_turret", "createHintObject", &manual_turret_createhintobject);
        namespace_3c37cb17ade254d::registersharedfunc("manual_turret", "getTargetMarker", &manual_turret_gettargetmarker);
        namespace_3c37cb17ade254d::registersharedfunc("manual_turret", "getEnemyPlayers", &manual_turret_getenemyplayers);
    }
}

// Namespace manual_turret_mp/namespace_786d7cfd93ab29c1
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa2b
// Size: 0x30
function manual_turret_gettargetmarker(streakinfo, var_6152d24062d26039) {
    /#
        assertex(isplayer(self), "this function needs to be called on a player Entity");
    #/
    return namespace_85d5d0fd4ecd2e9e::gettargetmarker(streakinfo, var_6152d24062d26039);
}

// Namespace manual_turret_mp/namespace_786d7cfd93ab29c1
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa63
// Size: 0x72
function manual_turret_createhintobject(var_963953c3478bf4fe, var_ee1f571f85c89c5c, var_efe526bf6a23d275, hintstring, priority, duration, onobstruction, hintdist, hintfov, usedist, usefov) {
    return namespace_19b4203b51d56488::createhintobject(var_963953c3478bf4fe, var_ee1f571f85c89c5c, var_efe526bf6a23d275, hintstring, priority, duration, onobstruction, hintdist, hintfov, usedist, usefov);
}

// Namespace manual_turret_mp/namespace_786d7cfd93ab29c1
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xadd
// Size: 0x4b
function manual_turret_monitordamage(maxhealth, damagefeedback, var_c5d89c3a1224b118, var_d7b6456018542238, var_a1823ac1157568db, rumble, var_22435c27e2916650) {
    namespace_3e725f3cc58bddd3::monitordamage(maxhealth, damagefeedback, var_c5d89c3a1224b118, var_d7b6456018542238, var_a1823ac1157568db, rumble, var_22435c27e2916650);
}

// Namespace manual_turret_mp/namespace_786d7cfd93ab29c1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb2f
// Size: 0x13
function manual_turret_getenemyplayers(team) {
    return namespace_54d20dd0dd79277f::getenemyplayers(team);
}

// Namespace manual_turret_mp/namespace_786d7cfd93ab29c1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb4a
// Size: 0x9c
function manual_turret_handlemovingplatform(turret) {
    if (isdefined(turret.moving_platform)) {
        data = spawnstruct();
        data.linkparent = turret.moving_platform;
        data.linkoffset = turret.moving_platform_offset;
        data.angleoffset = turret.moving_platform_angles_offset;
        data.endonstring = "carried";
        data.deathoverridecallback = &manualturret_moving_platform_death;
        turret thread namespace_d7b023c7eb3949d0::handle_moving_platforms(data);
    }
}

// Namespace manual_turret_mp/namespace_786d7cfd93ab29c1
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbed
// Size: 0x14
function manualturret_moving_platform_death(data) {
    self notify("death");
}

// Namespace manual_turret_mp/namespace_786d7cfd93ab29c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc08
// Size: 0x3d
function manual_turret_laststandwatcher() {
    self endon("death_or_disconnect");
    self notify("stop_manual_turret_lastStandWatcher");
    self endon("stop_manual_turret_lastStandWatcher");
    self endon("turret_placement_finished");
    thread namespace_ac45d22648d4adff::manualturret_clearplacementinstructions("last_stand_start");
    self waittill("last_stand_start");
    self notify("equip_deploy_cancel");
}

// Namespace manual_turret_mp/namespace_786d7cfd93ab29c1
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc4c
// Size: 0x21
function manual_turret_canpickup() {
    if (namespace_df5cfdbe6e2d3812::isanymonitoredweaponswitchinprogress()) {
        return 0;
    }
    if (namespace_9abe40d2af041eb2::iskillstreakdeployweapon(self getcurrentweapon())) {
        return 0;
    }
    return 1;
}

