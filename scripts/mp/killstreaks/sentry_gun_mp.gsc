// mwiii decomp prototype
#using scripts\mp\hud_util.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_439fa02b5251fa5b;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\cp_mp\killstreaks\sentry_gun.gsc;
#using scripts\mp\killstreaks\manual_turret_mp.gsc;
#using scripts\mp\killstreaks\target_marker.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\damage.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\mp\hud_message.gsc;

#namespace namespace_7916bcfe80f5b3a5;

// Namespace namespace_7916bcfe80f5b3a5/namespace_46189c51f4b96e6c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fe
// Size: 0xdc
function init() {
    namespace_58a74e7d54b56e8d::registerkillstreak("sentry_gun", &namespace_c5e4bf96a5150e88::tryusesentryturretfromstruct);
    namespace_3c37cb17ade254d::registersharedfunc("sentry_gun", "monitorDamage", &sentryturret_monitordamage, 1);
    namespace_3c37cb17ade254d::registersharedfunc("sentry_gun", "createHintObject", &sentryturret_createhintobject);
    namespace_3c37cb17ade254d::registersharedfunc("sentry_gun", "getTargetMarker", &sentryturret_gettargetmarker);
    namespace_3c37cb17ade254d::registersharedfunc("sentry_gun", "initSentrySettings", &sentryturret_initsentrysettings);
    namespace_3c37cb17ade254d::registersharedfunc("sentry_gun", "allowPickupOfTurret", &sentryturret_canpickup);
    namespace_3c37cb17ade254d::registersharedfunc("sentry_gun", "handleMovingPlatform", &namespace_786d7cfd93ab29c1::manual_turret_handlemovingplatform);
    namespace_3c37cb17ade254d::registersharedfunc("sentry_gun", "empStarted", &sentryturret_empstarted);
    namespace_3c37cb17ade254d::registersharedfunc("sentry_gun", "empCleared", &sentryturret_empcleared);
    namespace_3c37cb17ade254d::registersharedfunc("sentry_gun", "attachXRays", &function_21ed6c77fb27d039);
}

// Namespace namespace_7916bcfe80f5b3a5/namespace_46189c51f4b96e6c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4e1
// Size: 0x30
function sentryturret_gettargetmarker(streakinfo, var_6152d24062d26039) {
    /#
        assertex(isplayer(self), "this function needs to be called on a player Entity");
    #/
    return namespace_85d5d0fd4ecd2e9e::gettargetmarker(streakinfo, var_6152d24062d26039);
}

// Namespace namespace_7916bcfe80f5b3a5/namespace_46189c51f4b96e6c
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x519
// Size: 0x72
function sentryturret_createhintobject(var_963953c3478bf4fe, var_ee1f571f85c89c5c, var_efe526bf6a23d275, hintstring, priority, duration, onobstruction, hintdist, hintfov, usedist, usefov) {
    return namespace_19b4203b51d56488::createhintobject(var_963953c3478bf4fe, var_ee1f571f85c89c5c, var_efe526bf6a23d275, hintstring, priority, duration, onobstruction, hintdist, hintfov, usedist, usefov);
}

// Namespace namespace_7916bcfe80f5b3a5/namespace_46189c51f4b96e6c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x593
// Size: 0x45
function sentryturret_monitordamage(turret) {
    /#
        assertex(isplayer(self), "this function needs to be called on a player Entity");
    #/
    turret thread namespace_3e725f3cc58bddd3::monitordamage(turret.maxhealth, "hitequip", &sentryturret_handledeathdamage, &sentryturret_modifydamage, 1);
}

// Namespace namespace_7916bcfe80f5b3a5/namespace_46189c51f4b96e6c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5df
// Size: 0x138
function sentryturret_handledeathdamage(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    idflags = data.idflags;
    config = level.sentrysettings[self.turrettype];
    var_3737240cefe2c793 = namespace_3e725f3cc58bddd3::onkillstreakkilled(config.streakname, attacker, objweapon, type, damage, config.scorepopup, config.vodestroyed, config.destroyedsplash);
    if (var_3737240cefe2c793) {
        attacker notify("destroyed_equipment");
    }
    self notify("enemy_destroyed_equipment", attacker);
    explosivedamage = 0;
    if (type == "MOD_EXPLOSIVE" || type == "MOD_PROJECTILE" || type == "MOD_PROJECTILE_SPLASH" || type == "MOD_GRENADE_SPLASH") {
        explosivedamage = 1;
    }
    self notify("kill_turret", explosivedamage);
}

// Namespace namespace_7916bcfe80f5b3a5/namespace_46189c51f4b96e6c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x71e
// Size: 0x19c
function sentryturret_modifydamage(data) {
    var_3a8030d138e837c8 = level.sentrysettings["sentry_turret"];
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["sentry_gun"];
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    idflags = data.idflags;
    modifieddamage = damage;
    if (istrue(level.var_be6a42242be00b66)) {
        modifieddamage = getModifiedDamageUsingDamageTuning(attacker, objweapon, type, modifieddamage, self.maxhealth, bundle.var_e913079a5ffda56d);
    } else {
        modifieddamage = getmodifiedantikillstreakdamage(attacker, objweapon, type, modifieddamage, self.maxhealth, 2, 3, 4, 12, 400);
    }
    if (!isdefined(self.damagetaken)) {
        self.damagetaken = 0;
    }
    if (isdefined(objweapon) && objweapon.basename == "throwstar_mp") {
        modifieddamage = 0;
    }
    var_8ed0a351aa70ec7 = self.damagetaken + modifieddamage;
    if (var_8ed0a351aa70ec7 >= var_3a8030d138e837c8.lowhealth && !istrue(self.var_f6f5159041c139cd)) {
        self.var_f6f5159041c139cd = 1;
        self setscriptablepartstate("turret_damage", "on", 0);
    }
    return modifieddamage;
}

// Namespace namespace_7916bcfe80f5b3a5/namespace_46189c51f4b96e6c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c2
// Size: 0x4ff
function sentryturret_initsentrysettings() {
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["sentry_gun"];
    if (!isdefined(bundle)) {
        return;
    }
    /#
        assert(isdefined(bundle.maxhealth));
    #/
    /#
        assert(isdefined(bundle.var_7298a55518bba252));
    #/
    /#
        assert(isdefined(bundle.spawnweapon));
    #/
    level.sentrysettings["sentry_turret"] = spawnstruct();
    level.sentrysettings["sentry_turret"].health = 999999;
    level.sentrysettings["sentry_turret"].maxhealth = function_53c4c53197386572(bundle.maxhealth, 650);
    level.sentrysettings["sentry_turret"].lowhealth = function_53c4c53197386572(bundle.var_7298a55518bba252, level.sentrysettings["sentry_turret"].maxhealth * 0.5);
    level.sentrysettings["sentry_turret"].burstmin = 35;
    level.sentrysettings["sentry_turret"].burstmax = 70;
    level.sentrysettings["sentry_turret"].pausemin = 0.15;
    level.sentrysettings["sentry_turret"].pausemax = 0.25;
    level.sentrysettings["sentry_turret"].lockstrength = 6;
    level.sentrysettings["sentry_turret"].sentrymodeon = "sentry";
    level.sentrysettings["sentry_turret"].sentrymodeoff = "sentry_offline";
    level.sentrysettings["sentry_turret"].timeout = 120;
    level.sentrysettings["sentry_turret"].spinuptime = 0.65;
    level.sentrysettings["sentry_turret"].overheattime = 8;
    level.sentrysettings["sentry_turret"].cooldowntime = 0.3;
    level.sentrysettings["sentry_turret"].fxtime = 0.3;
    level.sentrysettings["sentry_turret"].streakname = "sentry_gun";
    level.sentrysettings["sentry_turret"].weaponinfo = function_53c4c53197386572(bundle.spawnweapon, "sentry_turret_mp");
    level.sentrysettings["sentry_turret"].playerweaponinfo = "sentry_turret_mp";
    level.sentrysettings["sentry_turret"].modelbaseground = function_53c4c53197386572(bundle.var_5fa14c2e0b04da9, "wpn_wm_p45_mg_auto_sentry_v0_mp");
    level.sentrysettings["sentry_turret"].modeldestroyedground = function_53c4c53197386572(bundle.var_68bcc71e755cf4b2, "wpn_wm_p45_mg_auto_sentry_v0_mp");
    level.sentrysettings["sentry_turret"].placementhintstring = "KILLSTREAKS_HINTS/SENTRY_GUN_PLACE";
    level.sentrysettings["sentry_turret"].ownerusehintstring = "KILLSTREAKS_HINTS/SENTRY_USE";
    level.sentrysettings["sentry_turret"].otherusehintstring = "KILLSTREAKS_HINTS/SENTRY_OTHER_USE";
    level.sentrysettings["sentry_turret"].dismantlehintstring = "KILLSTREAKS_HINTS/SENTRY_DISMANTLE";
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
}

// Namespace namespace_7916bcfe80f5b3a5/namespace_46189c51f4b96e6c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdc8
// Size: 0x6d
function sentryturret_canpickup() {
    if (namespace_df5cfdbe6e2d3812::isanymonitoredweaponswitchinprogress()) {
        return 0;
    }
    if (namespace_9abe40d2af041eb2::iskillstreakdeployweapon(self getcurrentweapon())) {
        return 0;
    }
    if (istrue(self.isjuggernaut)) {
        namespace_44abc05161e2e2cb::showerrormessage("KILLSTREAKS/JUGG_CANNOT_BE_PICKED_UP");
        return 0;
    }
    if (self isswimming()) {
        namespace_44abc05161e2e2cb::showerrormessage("KILLSTREAKS/CANNOT_BE_PICKED_UP_WATER");
        return 0;
    }
    if (!self isonground()) {
        return 0;
    }
    if (istrue(self.oob)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_7916bcfe80f5b3a5/namespace_46189c51f4b96e6c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe3d
// Size: 0x15
function sentryturret_empstarted() {
    self setscriptablepartstate("empd", "active", 0);
}

// Namespace namespace_7916bcfe80f5b3a5/namespace_46189c51f4b96e6c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe59
// Size: 0x15
function sentryturret_empcleared() {
    self setscriptablepartstate("empd", "neutral", 0);
}

// Namespace namespace_7916bcfe80f5b3a5/namespace_46189c51f4b96e6c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe75
// Size: 0x21
function function_21ed6c77fb27d039(turret) {
    turret function_5226227bce83ebe9(3, turret.team);
    return turret;
}

