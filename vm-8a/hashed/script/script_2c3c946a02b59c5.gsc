#using scripts\mp\hud_util.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\teams.gsc;
#using script_439fa02b5251fa5b;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using script_1455d908ff492105;
#using scripts\mp\killstreaks\manual_turret_mp.gsc;
#using scripts\mp\killstreaks\target_marker.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\mp\damage.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\mp\hud_message.gsc;

#namespace remote_turret_mp;

// Namespace remote_turret_mp / namespace_a85f2875287e720d
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0x40b
// Size: 0x18
function autoexec main() {
    registersharedfunc("remote_turret", "init", &init);
}

// Namespace remote_turret_mp / namespace_a85f2875287e720d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42b
// Size: 0xd9
function init() {
    scripts\mp\killstreaks\killstreaks::registerkillstreak("remote_turret", &namespace_2f1467074a1bbe09::function_c916c5b82db1290);
    registersharedfunc("remote_turret", "monitorDamage", &sentryturret_monitordamage);
    registersharedfunc("remote_turret", "createHintObject", &sentryturret_createhintobject);
    registersharedfunc("remote_turret", "getTargetMarker", &sentryturret_gettargetmarker);
    registersharedfunc("remote_turret", "initSentrySettings", &sentryturret_initsentrysettings);
    registersharedfunc("remote_turret", "allowPickupOfTurret", &sentryturret_canpickup);
    registersharedfunc("remote_turret", "handleMovingPlatform", &scripts\mp\killstreaks\manual_turret_mp::manual_turret_handlemovingplatform);
    registersharedfunc("remote_turret", "empStarted", &sentryturret_empstarted);
    registersharedfunc("remote_turret", "empCleared", &sentryturret_empcleared);
    registersharedfunc("remote_turret", "attachXRays", &function_21ed6c77fb27d039);
}

// Namespace remote_turret_mp / namespace_a85f2875287e720d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50c
// Size: 0x2f
function sentryturret_gettargetmarker(streakinfo, ignorecancel) {
    assertex(isplayer(self), "this function needs to be called on a player Entity");
    return scripts\mp\killstreaks\target_marker::gettargetmarker(streakinfo, ignorecancel);
}

// Namespace remote_turret_mp / namespace_a85f2875287e720d
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x544
// Size: 0x71
function sentryturret_createhintobject(hintpos, hinttype, hinticon, hintstring, priority, duration, onobstruction, hintdist, hintfov, usedist, usefov) {
    return scripts\mp\gameobjects::createhintobject(hintpos, hinttype, hinticon, hintstring, priority, duration, onobstruction, hintdist, hintfov, usedist, usefov);
}

// Namespace remote_turret_mp / namespace_a85f2875287e720d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5be
// Size: 0x44
function sentryturret_monitordamage(turret) {
    assertex(isplayer(self), "this function needs to be called on a player Entity");
    turret thread scripts\mp\damage::monitordamage(turret.maxhealth, "hitequip", &sentryturret_handledeathdamage, &sentryturret_modifydamage, 1);
}

// Namespace remote_turret_mp / namespace_a85f2875287e720d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x60a
// Size: 0x14b
function sentryturret_handledeathdamage(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    idflags = data.idflags;
    config = level.sentrysettings[self.turrettype];
    var_3737240cefe2c793 = scripts\mp\damage::onkillstreakkilled(config.streakname, attacker, objweapon, type, damage, config.scorepopup, config.vodestroyed, config.destroyedsplash);
    if (var_3737240cefe2c793) {
        attacker notify("destroyed_equipment");
    }
    explosivedamage = 0;
    if (type == "MOD_EXPLOSIVE" || type == "MOD_PROJECTILE" || type == "MOD_PROJECTILE_SPLASH" || type == "MOD_GRENADE_SPLASH") {
        explosivedamage = 1;
    }
    if (istrue(self.var_e42f0fcd6e0c1153)) {
        self stopbarrelspin();
        self.var_e42f0fcd6e0c1153 = undefined;
    }
    self notify("kill_turret", explosivedamage, 1);
}

// Namespace remote_turret_mp / namespace_a85f2875287e720d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x75d
// Size: 0x1a6
function sentryturret_modifydamage(data) {
    var_3a8030d138e837c8 = level.sentrysettings["remote_turret"];
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    idflags = data.idflags;
    modifieddamage = damage;
    if (istrue(level.var_be6a42242be00b66)) {
        bundle = level.streakglobals.streakbundles["remote_turret"];
        modifieddamage = getmodifieddamageusingdamagetuning(attacker, objweapon, type, modifieddamage, self.maxhealth, bundle.var_e913079a5ffda56d);
    } else if (issharedfuncdefined("killstreak", "getModifiedAntiKillstreakDamage")) {
        modifieddamage = self [[ getsharedfunc("killstreak", "getModifiedAntiKillstreakDamage") ]](attacker, objweapon, type, modifieddamage, self.maxhealth, 2, 3, 4, 6, 400);
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

// Namespace remote_turret_mp / namespace_a85f2875287e720d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90c
// Size: 0x50e
function sentryturret_initsentrysettings() {
    bundle = level.streakglobals.streakbundles["remote_turret"];
    if (!isdefined(bundle)) {
        return;
    }
    assert(isdefined(bundle.var_43ff7040cc6d3bbf));
    assert(isdefined(bundle.var_aba787e073c32c97));
    assert(isdefined(bundle.spawnweapon));
    level.sentrysettings["remote_turret"] = spawnstruct();
    level.sentrysettings["remote_turret"].health = 999999;
    level.sentrysettings["remote_turret"].maxhealth = getdvarfloat(@"hash_6193a5498d47f5c4", default_to(bundle.var_43ff7040cc6d3bbf, 650));
    level.sentrysettings["remote_turret"].lowhealth = default_to(bundle.var_aba787e073c32c97, level.sentrysettings["remote_turret"].maxhealth * 0.5);
    level.sentrysettings["remote_turret"].burstmin = 35;
    level.sentrysettings["remote_turret"].burstmax = 70;
    level.sentrysettings["remote_turret"].pausemin = 0.15;
    level.sentrysettings["remote_turret"].pausemax = 0.25;
    level.sentrysettings["remote_turret"].lockstrength = 2;
    level.sentrysettings["remote_turret"].sentrymodeon = "sentry";
    level.sentrysettings["remote_turret"].sentrymodeoff = "sentry_offline";
    level.sentrysettings["remote_turret"].timeout = getdvarfloat(@"hash_9503f52bebc75e92", 120);
    level.sentrysettings["remote_turret"].spinuptime = 0.65;
    level.sentrysettings["remote_turret"].overheattime = 8;
    level.sentrysettings["remote_turret"].cooldowntime = 0.3;
    level.sentrysettings["remote_turret"].fxtime = 0.3;
    level.sentrysettings["remote_turret"].streakname = "remote_turret";
    level.sentrysettings["remote_turret"].weaponinfo = "remote_turret_mp";
    level.sentrysettings["remote_turret"].playerweaponinfo = "remote_turret_mp";
    level.sentrysettings["remote_turret"].modelbaseground = default_to(bundle.var_5fa14c2e0b04da9, "wm_jup_2h_remote_turret_00");
    level.sentrysettings["remote_turret"].modeldestroyedground = default_to(bundle.var_68bcc71e755cf4b2, "wm_jup_2h_remote_turret_00");
    level.sentrysettings["remote_turret"].placementhintstring = %KILLSTREAKS_HINTS/SENTRY_GUN_PLACE;
    level.sentrysettings["remote_turret"].ownerusehintstring = %KILLSTREAKS_HINTS/REMOTE_TURRET_PICKUP;
    level.sentrysettings["remote_turret"].otherusehintstring = %KILLSTREAKS_HINTS/SENTRY_OTHER_USE;
    level.sentrysettings["remote_turret"].dismantlehintstring = %KILLSTREAKS_HINTS/SENTRY_DISMANTLE;
    level.sentrysettings["remote_turret"].headicon = 1;
    level.sentrysettings["remote_turret"].teamsplash = "used_remote_turret";
    level.sentrysettings["remote_turret"].destroyedsplash = "callout_destroyed_sentry_gun";
    level.sentrysettings["remote_turret"].shouldsplash = 1;
    level.sentrysettings["remote_turret"].votimeout = "remote_turret_teamleader_destroyed";
    level.sentrysettings["remote_turret"].vodestroyed = "remote_turret_teamleader_destroyed";
    level.sentrysettings["remote_turret"].scorepopup = "destroyed_sentry";
    level.sentrysettings["remote_turret"].lightfxtag = "tag_fx";
    level.sentrysettings["remote_turret"].iskillstreak = 1;
    level.sentrysettings["remote_turret"].headiconoffset = (0, 0, 75);
}

// Namespace remote_turret_mp / namespace_a85f2875287e720d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe22
// Size: 0x52
function sentryturret_canpickup() {
    if (scripts\cp_mp\utility\inventory_utility::isanymonitoredweaponswitchinprogress()) {
        return false;
    }
    if (scripts\cp_mp\utility\killstreak_utility::iskillstreakdeployweapon(self getcurrentweapon())) {
        return false;
    }
    if (istrue(self.isjuggernaut)) {
        scripts\mp\hud_message::showerrormessage("KILLSTREAKS/JUGG_CANNOT_BE_PICKED_UP");
        return false;
    }
    if (self isswimming()) {
        scripts\mp\hud_message::showerrormessage("KILLSTREAKS/CANNOT_BE_PICKED_UP_WATER");
        return false;
    }
    return true;
}

// Namespace remote_turret_mp / namespace_a85f2875287e720d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe7d
// Size: 0x14
function sentryturret_empstarted() {
    self setscriptablepartstate("empd", "active", 0);
}

// Namespace remote_turret_mp / namespace_a85f2875287e720d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe99
// Size: 0x14
function sentryturret_empcleared() {
    self setscriptablepartstate("empd", "neutral", 0);
}

// Namespace remote_turret_mp / namespace_a85f2875287e720d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeb5
// Size: 0x20
function function_21ed6c77fb27d039(turret) {
    turret function_5226227bce83ebe9(3, turret.team);
    return turret;
}

