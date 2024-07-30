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

// Namespace manual_turret_mp / scripts\mp\killstreaks\manual_turret_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x400
// Size: 0xbb
function init() {
    scripts\mp\killstreaks\killstreaks::registerkillstreak("manual_turret", &scripts\cp_mp\killstreaks\manual_turret::tryusemanualturretfromstruct);
    init_manual_turret_settings();
    init_manual_turret_vo();
    scripts\engine\utility::registersharedfunc("manual_turret", "monitorDamage", &manual_turret_monitordamage);
    scripts\engine\utility::registersharedfunc("manual_turret", "createHintObject", &manual_turret_createhintobject);
    scripts\engine\utility::registersharedfunc("manual_turret", "getTargetMarker", &manual_turret_gettargetmarker);
    scripts\engine\utility::registersharedfunc("manual_turret", "getEnemyPlayers", &manual_turret_getenemyplayers);
    scripts\engine\utility::registersharedfunc("manual_turret", "watchForPlayerEnteringLastStand", &manual_turret_laststandwatcher);
    scripts\engine\utility::registersharedfunc("manual_turret", "handleMovingPlatform", &manual_turret_handlemovingplatform);
    scripts\engine\utility::registersharedfunc("manual_turret", "allowPickupOfTurret", &manual_turret_canpickup);
}

// Namespace manual_turret_mp / scripts\mp\killstreaks\manual_turret_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4c3
// Size: 0x475
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
    level.sentrysettings["manual_turret"].placementhintstring = %KILLSTREAKS_HINTS/SENTRY_PLACE;
    level.sentrysettings["manual_turret"].ownerusehintstring = %KILLSTREAKS_HINTS/SENTRY_OWNER_USE;
    level.sentrysettings["manual_turret"].otherusehintstring = %KILLSTREAKS_HINTS/SENTRY_OTHER_USE;
    level.sentrysettings["manual_turret"].dismantlehintstring = %KILLSTREAKS_HINTS/SENTRY_DISMANTLE;
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

// Namespace manual_turret_mp / scripts\mp\killstreaks\manual_turret_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x940
// Size: 0x28
function init_manual_turret_vo() {
    game["dialog"]["manual_turret_low_ammo"] = "manual_turret_ammo_low";
    game["dialog"]["manual_turret_no_ammo"] = "manual_turret_no_ammo";
}

// Namespace manual_turret_mp / scripts\mp\killstreaks\manual_turret_mp
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x970
// Size: 0xb3
function manual_turret_equipment_wrapper(ref, slot, objweapon) {
    scripts\mp\equipment::takeequipment(slot);
    used = scripts\cp_mp\killstreaks\manual_turret::tryusemanualturret("manual_turret");
    if (!used) {
        scripts\mp\equipment::giveequipment("equip_shieldturret", slot);
        return;
    }
    init_manual_turret_settings();
    init_manual_turret_vo();
    scripts\engine\utility::registersharedfunc("manual_turret", "monitorDamage", &manual_turret_monitordamage);
    scripts\engine\utility::registersharedfunc("manual_turret", "createHintObject", &manual_turret_createhintobject);
    scripts\engine\utility::registersharedfunc("manual_turret", "getTargetMarker", &manual_turret_gettargetmarker);
    scripts\engine\utility::registersharedfunc("manual_turret", "getEnemyPlayers", &manual_turret_getenemyplayers);
}

// Namespace manual_turret_mp / scripts\mp\killstreaks\manual_turret_mp
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa2b
// Size: 0x2f
function manual_turret_gettargetmarker(streakinfo, ignorecancel) {
    assertex(isplayer(self), "this function needs to be called on a player Entity");
    return scripts\mp\killstreaks\target_marker::gettargetmarker(streakinfo, ignorecancel);
}

// Namespace manual_turret_mp / scripts\mp\killstreaks\manual_turret_mp
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa63
// Size: 0x71
function manual_turret_createhintobject(hintpos, hinttype, hinticon, hintstring, priority, duration, onobstruction, hintdist, hintfov, usedist, usefov) {
    return scripts\mp\gameobjects::createhintobject(hintpos, hinttype, hinticon, hintstring, priority, duration, onobstruction, hintdist, hintfov, usedist, usefov);
}

// Namespace manual_turret_mp / scripts\mp\killstreaks\manual_turret_mp
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xadd
// Size: 0x4a
function manual_turret_monitordamage(maxhealth, damagefeedback, ondeathfunc, var_d7b6456018542238, biskillstreak, rumble, resetdamagetaken) {
    scripts\mp\damage::monitordamage(maxhealth, damagefeedback, ondeathfunc, var_d7b6456018542238, biskillstreak, rumble, resetdamagetaken);
}

// Namespace manual_turret_mp / scripts\mp\killstreaks\manual_turret_mp
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb2f
// Size: 0x12
function manual_turret_getenemyplayers(team) {
    return scripts\mp\utility\teams::getenemyplayers(team);
}

// Namespace manual_turret_mp / scripts\mp\killstreaks\manual_turret_mp
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb4a
// Size: 0x9b
function manual_turret_handlemovingplatform(turret) {
    if (isdefined(turret.moving_platform)) {
        data = spawnstruct();
        data.linkparent = turret.moving_platform;
        data.linkoffset = turret.moving_platform_offset;
        data.angleoffset = turret.moving_platform_angles_offset;
        data.endonstring = "carried";
        data.deathoverridecallback = &manualturret_moving_platform_death;
        turret thread scripts\mp\movers::handle_moving_platforms(data);
    }
}

// Namespace manual_turret_mp / scripts\mp\killstreaks\manual_turret_mp
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbed
// Size: 0x13
function manualturret_moving_platform_death(data) {
    self notify("death");
}

// Namespace manual_turret_mp / scripts\mp\killstreaks\manual_turret_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc08
// Size: 0x3c
function manual_turret_laststandwatcher() {
    self endon("death_or_disconnect");
    self notify("stop_manual_turret_lastStandWatcher");
    self endon("stop_manual_turret_lastStandWatcher");
    self endon("turret_placement_finished");
    thread scripts\cp_mp\killstreaks\manual_turret::manualturret_clearplacementinstructions("last_stand_start");
    self waittill("last_stand_start");
    self notify("equip_deploy_cancel");
}

// Namespace manual_turret_mp / scripts\mp\killstreaks\manual_turret_mp
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc4c
// Size: 0x20
function manual_turret_canpickup() {
    if (scripts\cp_mp\utility\inventory_utility::isanymonitoredweaponswitchinprogress()) {
        return false;
    }
    if (scripts\cp_mp\utility\killstreak_utility::iskillstreakdeployweapon(self getcurrentweapon())) {
        return false;
    }
    return true;
}

