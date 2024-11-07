#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp\cp_hud_message.gsc;
#using scripts\cp\inventory\cp_target_marker.gsc;
#using scripts\cp\utility.gsc;
#using scripts\cp_mp\killstreaks\sentry_gun.gsc;
#using scripts\cp_mp\killstreaks\manual_turret.gsc;
#using script_74502a9e0ef1f19c;
#using scripts\cp\cp_objectives.gsc;
#using script_25845aca699d038d;

#namespace namespace_78eac0fe80c5560b;

// Namespace namespace_78eac0fe80c5560b / scripts\cp\killstreaks\sentry_gun_cp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6a0
// Size: 0xcf
function init() {
    scripts\engine\utility::registersharedfunc("sentry_gun", "createHintObject", &sentryturret_createhintobject);
    scripts\engine\utility::registersharedfunc("sentry_gun", "getTargetMarker", &sentryturret_gettargetmarker);
    scripts\engine\utility::registersharedfunc("sentry_gun", "munitionUsed", &sentryturret_munitionused);
    scripts\engine\utility::registersharedfunc("sentry_gun", "munitionSplash", &scripts\cp\cp_hud_message::showsplash);
    scripts\engine\utility::registersharedfunc("sentry_gun", "initSentrySettings", &sentryturret_initsentrysettings);
    scripts\engine\utility::registersharedfunc("sentry_gun", "watchForPlayerEnteringLastStand", &sentryturret_laststandwatcher);
    scripts\engine\utility::registersharedfunc("sentry_gun", "allowPickupOfTurret", &sentryturret_allowpickupofturret);
    scripts\engine\utility::registersharedfunc("sentry_gun", "monitorDamage", &sentryturret_monitordamage);
    scripts\engine\utility::registersharedfunc("sentry_gun", "setActionSets", &function_44f3449aec8bc267);
    function_d54473cdf3e580d7();
}

// Namespace namespace_78eac0fe80c5560b / scripts\cp\killstreaks\sentry_gun_cp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x777
// Size: 0x2a
function function_d54473cdf3e580d7() {
    level.var_73bf0234360f5232 = "sentry_turret_placement";
    val::group_register(level.var_73bf0234360f5232, ["cp_munitions_pickup"]);
}

// Namespace namespace_78eac0fe80c5560b / scripts\cp\killstreaks\sentry_gun_cp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7a9
// Size: 0x35
function function_44f3449aec8bc267(value) {
    if (value == 0) {
        val::group_set(level.var_73bf0234360f5232, 0);
        return;
    }
    val::group_reset(level.var_73bf0234360f5232);
}

// Namespace namespace_78eac0fe80c5560b / scripts\cp\killstreaks\sentry_gun_cp
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7e6
// Size: 0x2f
function sentryturret_gettargetmarker(streakinfo, ignorecancel) {
    assertex(isplayer(self), "this function needs to be called on a player Entity");
    return scripts\cp\inventory\cp_target_marker::gettargetmarker(streakinfo, ignorecancel);
}

// Namespace namespace_78eac0fe80c5560b / scripts\cp\killstreaks\sentry_gun_cp
// Params 12, eflags: 0x0
// Checksum 0x0, Offset: 0x81e
// Size: 0x7b
function sentryturret_createhintobject(org, type, icon, hintstring, priority, duration, onobstruction, hintdist, hintfov, usedist, usefov, useent) {
    return scripts\cp\utility::createhintobject(org, type, icon, hintstring, priority, duration, onobstruction, hintdist, hintfov, usedist, usefov, useent);
}

// Namespace namespace_78eac0fe80c5560b / scripts\cp\killstreaks\sentry_gun_cp
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8a2
// Size: 0x2d
function sentryturret_munitionused(streakinfo, ignorecancel) {
    self notify("munitions_used", "sentry");
    scripts\cp\utility::function_98f7ca3781dac77c(self, "sentry");
}

// Namespace namespace_78eac0fe80c5560b / scripts\cp\killstreaks\sentry_gun_cp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8d7
// Size: 0x3a
function function_dad8d4cd587ec141(vehicle) {
    wasdestroyed = 1;
    skipshutdown = 1;
    self.var_455a731f2701dd65 = 1;
    self notify("kill_turret", skipshutdown, wasdestroyed);
}

// Namespace namespace_78eac0fe80c5560b / scripts\cp\killstreaks\sentry_gun_cp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x919
// Size: 0x4d8
function sentryturret_initsentrysettings() {
    var_3d7610cd3e0a75e6 = 120;
    if (getdvarint(@"hash_dd4f9aae14a06a39", 9999) > 0) {
        var_3d7610cd3e0a75e6 = getdvarint(@"hash_dd4f9aae14a06a39", 9999);
    }
    var_ca6267f941b2e4b8 = 250;
    if (getdvarint(@"hash_203e0ca521e512ae", 250) != 250) {
        var_ca6267f941b2e4b8 = getdvarint(@"hash_203e0ca521e512ae", 250);
    }
    level.sentrysettings["sentry_turret"] = spawnstruct();
    level.sentrysettings["sentry_turret"].health = 999999;
    level.sentrysettings["sentry_turret"].maxhealth = getdvarint(@"hash_8b8eec11ecd348e3", 400);
    level.sentrysettings["sentry_turret"].burstmin = 20;
    level.sentrysettings["sentry_turret"].burstmax = 120;
    level.sentrysettings["sentry_turret"].pausemin = 0.15;
    level.sentrysettings["sentry_turret"].pausemax = 0.35;
    level.sentrysettings["sentry_turret"].lockstrength = 2;
    level.sentrysettings["sentry_turret"].sentrymodeon = "sentry";
    level.sentrysettings["sentry_turret"].sentrymodeoff = "sentry_offline";
    level.sentrysettings["sentry_turret"].ammo = var_ca6267f941b2e4b8;
    level.sentrysettings["sentry_turret"].timeout = var_3d7610cd3e0a75e6;
    level.sentrysettings["sentry_turret"].spinuptime = 0.65;
    level.sentrysettings["sentry_turret"].overheattime = 8;
    level.sentrysettings["sentry_turret"].cooldowntime = 0.1;
    level.sentrysettings["sentry_turret"].fxtime = 0.3;
    level.sentrysettings["sentry_turret"].streakname = "sentry_gun";
    level.sentrysettings["sentry_turret"].weaponinfo = "sentry_turret_mp";
    level.sentrysettings["sentry_turret"].playerweaponinfo = "sentry_turret_mp";
    level.sentrysettings["sentry_turret"].scriptable = "ks_sentry_turret_mp";
    level.sentrysettings["sentry_turret"].modelbaseground = "wpn_wm_p45_mg_auto_sentry_v0_mp";
    level.sentrysettings["sentry_turret"].modeldestroyedground = "wpn_wm_p45_mg_auto_sentry_v0_mp";
    level.sentrysettings["sentry_turret"].placementhintstring = %KILLSTREAKS_HINTS/SENTRY_GUN_PLACE;
    level.sentrysettings["sentry_turret"].ownerusehintstring = %KILLSTREAKS_HINTS/SENTRY_USE;
    level.sentrysettings["sentry_turret"].otherusehintstring = %KILLSTREAKS_HINTS/SENTRY_OTHER_USE;
    level.sentrysettings["sentry_turret"].dismantlehintstring = %KILLSTREAKS_HINTS/SENTRY_DISMANTLE;
    level.sentrysettings["sentry_turret"].headicon = 1;
    level.sentrysettings["sentry_turret"].teamsplash = "used_sentry_gun";
    level.sentrysettings["sentry_turret"].destroyedsplash = "callout_destroyed_sentry_gun";
    level.sentrysettings["sentry_turret"].shouldsplash = 1;
    level.sentrysettings["sentry_turret"].votimeout = "sentry_gun_teamleader_crash";
    level.sentrysettings["sentry_turret"].vodestroyed = "sentry_gun_teamleader_crash";
    level.sentrysettings["sentry_turret"].scorepopup = "destroyed_sentry";
    level.sentrysettings["sentry_turret"].lightfxtag = "tag_fx";
    level.sentrysettings["sentry_turret"].iskillstreak = 1;
    level.sentrysettings["sentry_turret"].headiconoffset = (0, 0, 75);
    level.sentrysettings["sentry_turret"].var_34d24162c014a897 = &function_dad8d4cd587ec141;
}

// Namespace namespace_78eac0fe80c5560b / scripts\cp\killstreaks\sentry_gun_cp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xdf9
// Size: 0x62
function sentryturret_laststandwatcher() {
    self endon("disconnect");
    self endon("death");
    self notify("stop_sentryTurret_lastStandWatcher");
    self endon("stop_sentryTurret_lastStandWatcher");
    self endon("turret_placement_finished");
    thread scripts\cp_mp\killstreaks\sentry_gun::function_5c005d2b1101bc78();
    thread scripts\cp_mp\killstreaks\manual_turret::manualturret_clearplacementinstructions("last_stand");
    self waittill("last_stand");
    val::group_reset("target_marker");
    scripts\cp_mp\killstreaks\manual_turret::manualturret_toggleallowplacementactions(1);
    self.bgivensentry = 0;
}

// Namespace namespace_78eac0fe80c5560b / scripts\cp\killstreaks\sentry_gun_cp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe63
// Size: 0xc2
function sentryturret_allowpickupofturret() {
    if (isdefined(level.nuclear_core_carrier)) {
        if (self == level.nuclear_core_carrier) {
            return false;
        }
    }
    if (istrue(self.isjuggernaut)) {
        if (self getclientomnvar("ui_assault_suit_on") == 0) {
            scripts\cp\cp_hud_message::showerrormessage("KILLSTREAKS/JUGG_CANNOT_BE_PICKED_UP");
            return false;
        }
    }
    if (self isswimming()) {
        scripts\cp\cp_hud_message::showerrormessage("EQUIPMENT/ARMAMENT_CANNOT_BE_USED_WATER");
        return false;
    }
    if (!self isonground()) {
        scripts\cp\cp_hud_message::showerrormessage("EQUIPMENT/ARMAMENT_CANNOT_BE_USED");
        return false;
    }
    if (self getstance() != "stand" && self getstance() != "crouch") {
        scripts\cp\cp_hud_message::showerrormessage("EQUIPMENT/ARMAMENT_CANNOT_BE_USED");
        return false;
    }
    if (istrue(self.has_gl)) {
        scripts\cp\cp_hud_message::showerrormessage("EQUIPMENT/ARMAMENT_CANNOT_BE_USED");
        return false;
    }
    return true;
}

// Namespace namespace_78eac0fe80c5560b / scripts\cp\killstreaks\sentry_gun_cp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xf2e
// Size: 0x16
function sentryturret_revivedwatcher() {
    self waittill("revive");
    val::reset_all("sentry");
}

// Namespace namespace_78eac0fe80c5560b / scripts\cp\killstreaks\sentry_gun_cp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf4c
// Size: 0x4d
function sentryturret_monitordamage(turret) {
    assertex(isplayer(self), "this function needs to be called on a player Entity");
    thread function_29ff97aed2607bbb(turret);
    turret thread namespace_a0628d6954815ef8::monitordamage(turret.maxhealth, "hitequip", &sentryturret_handledeathdamage, &sentryturret_modifydamage, 1);
}

// Namespace namespace_78eac0fe80c5560b / scripts\cp\killstreaks\sentry_gun_cp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xfa1
// Size: 0x12d
function sentryturret_handledeathdamage(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    idflags = data.idflags;
    config = level.sentrysettings[self.turrettype];
    var_3737240cefe2c793 = scripts\cp\utility::onkillstreakkilled(config.streakname, attacker, objweapon, type, damage, config.scorepopup, config.vodestroyed, config.destroyedsplash);
    if (var_3737240cefe2c793) {
        attacker notify("destroyed_equipment");
    }
    explosivedamage = 0;
    if (type == "MOD_EXPLOSIVE" || type == "MOD_PROJECTILE" || type == "MOD_PROJECTILE_SPLASH" || type == "MOD_GRENADE_SPLASH") {
        explosivedamage = 1;
    }
    self notify("kill_turret", explosivedamage, 1);
}

// Namespace namespace_78eac0fe80c5560b / scripts\cp\killstreaks\sentry_gun_cp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10d6
// Size: 0x14c
function sentryturret_modifydamage(data) {
    var_3a8030d138e837c8 = level.sentrysettings["sentry_turret"];
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    idflags = data.idflags;
    modifieddamage = damage;
    if (issharedfuncdefined("killstreak", "getModifiedAntiKillstreakDamage")) {
        modifieddamage = self [[ getsharedfunc("killstreak", "getModifiedAntiKillstreakDamage") ]](attacker, objweapon, type, modifieddamage, var_3a8030d138e837c8.maxhealth, 1, 1, 1);
    }
    if (!isdefined(self.damagetaken)) {
        self.damagetaken = 0;
    }
    var_8ed0a351aa70ec7 = self.damagetaken + modifieddamage;
    if (var_8ed0a351aa70ec7 >= var_3a8030d138e837c8.maxhealth * 0.5 && !istrue(self.damagedstate)) {
        self.damagedstate = 1;
        self setscriptablepartstate("turret_damage", "on", 0);
    }
    return modifieddamage;
}

// Namespace namespace_78eac0fe80c5560b / scripts\cp\killstreaks\sentry_gun_cp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x122b
// Size: 0xd2
function function_29ff97aed2607bbb(turret) {
    assertex(isplayer(self), "this function needs to be called on a player Entity");
    if (!getdvarint(@"hash_6cc448ee583199a9", 1)) {
        return;
    }
    if (!isdefined(turret.var_7ed5bd10c0e0b451)) {
        objindex = scripts\cp\cp_objectives::requestworldid("sentrygun_healthbar");
        objective_state(objindex, "current");
        objective_setshowoncompass(objindex, 0);
        objective_setlabel(objindex, "");
        objective_icon(objindex, "hud_icon_killstreak_sentry");
        objective_onentity(objindex, turret);
        objective_setshowdistance(objindex, 0);
        objective_setbackground(objindex, 1);
        objective_setplayintro(objindex, 0);
        objective_setownerteam(objindex, "allies");
        turret.var_7ed5bd10c0e0b451 = objindex;
        turret thread function_ae1723f0f841d98a(turret);
        turret thread function_8f7dc0e13b5d8b1f(turret);
    }
}

// Namespace namespace_78eac0fe80c5560b / scripts\cp\killstreaks\sentry_gun_cp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1305
// Size: 0xf9
function function_ae1723f0f841d98a(turret) {
    self endon("death");
    level endon("game_ended");
    self endon("monitorDamageEnd");
    var_c463c0f8a46583c5 = self.ammocount;
    scripts\cp\utility::make_entity_sentient_cp("allies");
    self.var_10f81a6bf4f5ce9a = 1;
    objective_setlabel(turret.var_7ed5bd10c0e0b451, %COOP_CRAFTING/SENTRY_AMMO_100);
    running = 1;
    while (running) {
        waittill_any_2("turretstatechange", "updateAmmo");
        thread sentryTurret_updateAmmoWhileFiring();
        if (isdefined(turret.var_7ed5bd10c0e0b451)) {
            currentammo = 1 - self.streakinfo.shots_fired / var_c463c0f8a46583c5;
            label = function_a561a42bcd3d2aa0(currentammo);
            if (isdefined(label)) {
                objective_setlabel(turret.var_7ed5bd10c0e0b451, label);
            }
            if (currentammo <= 0) {
                turret notify("kill_turret", 0, 0);
            }
        }
    }
}

// Namespace namespace_78eac0fe80c5560b / scripts\cp\killstreaks\sentry_gun_cp
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1406
// Size: 0x40
function sentryTurret_updateAmmoWhileFiring() {
    self notify("sentryTurret_updateAmmoWhileFiring");
    self endon("sentryTurret_updateAmmoWhileFiring");
    self endon("kill_turret");
    self endon("carried");
    level endon("game_ended");
    while (self isfiringturret()) {
        wait 0.5;
        self notify("updateAmmo");
    }
}

// Namespace namespace_78eac0fe80c5560b / scripts\cp\killstreaks\sentry_gun_cp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x144e
// Size: 0xc3
function function_a561a42bcd3d2aa0(ammo) {
    if (ammo >= 1) {
        return %COOP_CRAFTING/SENTRY_AMMO_100;
    }
    if (ammo >= 0.9) {
        return %COOP_CRAFTING/SENTRY_AMMO_90;
    }
    if (ammo >= 0.8) {
        return %COOP_CRAFTING/SENTRY_AMMO_80;
    }
    if (ammo >= 0.7) {
        return %COOP_CRAFTING/SENTRY_AMMO_70;
    }
    if (ammo >= 0.6) {
        return %COOP_CRAFTING/SENTRY_AMMO_60;
    }
    if (ammo >= 0.5) {
        return %COOP_CRAFTING/SENTRY_AMMO_50;
    }
    if (ammo >= 0.4) {
        return %COOP_CRAFTING/SENTRY_AMMO_40;
    }
    if (ammo >= 0.3) {
        return %COOP_CRAFTING/SENTRY_AMMO_30;
    }
    if (ammo >= 0.2) {
        return %COOP_CRAFTING/SENTRY_AMMO_20;
    }
    if (ammo >= 0.1) {
        return %COOP_CRAFTING/SENTRY_AMMO_10;
    }
}

// Namespace namespace_78eac0fe80c5560b / scripts\cp\killstreaks\sentry_gun_cp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1519
// Size: 0xd5
function function_bc709891290f6e67(data) {
    turret = data.victim;
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    idflags = data.idflags;
    explosivedamage = 0;
    if (type == "MOD_EXPLOSIVE" || type == "MOD_PROJECTILE" || type == "MOD_PROJECTILE_SPLASH" || type == "MOD_GRENADE_SPLASH") {
        explosivedamage = 1;
    }
    self notify("kill_turret", explosivedamage, 1);
}

// Namespace namespace_78eac0fe80c5560b / scripts\cp\killstreaks\sentry_gun_cp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x15f6
// Size: 0x3b
function function_8f7dc0e13b5d8b1f(turret) {
    level endon("game_ended");
    turret waittill("kill_turret");
    if (isdefined(turret.var_7ed5bd10c0e0b451)) {
        scripts\cp\cp_objectives::freeworldidbyobjid(turret.var_7ed5bd10c0e0b451);
    }
}

// Namespace namespace_78eac0fe80c5560b / scripts\cp\killstreaks\sentry_gun_cp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1639
// Size: 0x35
function function_2d27a885e0d2bed0(damagedata) {
    var_d7b6456018542238 = &namespace_1b51be0488919ce5::modifydamage;
    modifieddamage = self [[ var_d7b6456018542238 ]](damagedata);
    modifieddamage *= 0.5;
    return modifieddamage;
}

// Namespace namespace_78eac0fe80c5560b / scripts\cp\killstreaks\sentry_gun_cp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1677
// Size: 0x78
function function_1654f6551333edf5(turret) {
    turret endon("death");
    level endon("game_ended");
    turret endon("monitorDamageEnd");
    var_5ff92924e81160f1 = turret.maxhealth * 0.05;
    delay = 16;
    while (true) {
        wait delay;
        if (isdefined(turret.carriedby)) {
            continue;
        }
        turret dodamage(var_5ff92924e81160f1, turret.origin);
    }
}

// Namespace namespace_78eac0fe80c5560b / scripts\cp\killstreaks\sentry_gun_cp
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x16f7
// Size: 0x5d
function function_42fd6416c3355566(player) {
    player.bgivensentry = 0;
    player thread scripts\cp_mp\killstreaks\sentry_gun::tryusesentryturret("sentry_gun");
    wait 0.05;
    failed = 0;
    if (isdefined(player.bgivensentry) && player.bgivensentry == 0) {
        failed = 1;
    }
    return failed;
}

