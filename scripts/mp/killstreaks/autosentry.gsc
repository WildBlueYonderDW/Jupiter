// mwiii decomp prototype
#using scripts\mp\hud_util.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\print.gsc;
#using scripts\mp\utility\perk.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\cp_mp\entityheadicons.gsc;
#using scripts\mp\damage.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\events.gsc;
#using scripts\mp\weapons.gsc;
#using scripts\mp\utility\lower_message.gsc;
#using scripts\mp\movers.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\mp\killstreaks\helicopter.gsc;
#using scripts\mp\battlechatter_mp.gsc;
#using scripts\mp\supers.gsc;

#namespace namespace_df66bd377221e9b5;

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe11
// Size: 0x718
function init() {
    level.sentrytype = [];
    level.sentrytype["super_trophy"] = "super_trophy";
    level.sentrytype["sentry_shock"] = "sentry_shock";
    level.sentrytype["manual_turret"] = "manual_turret";
    /#
        assertmsg("Shock Sentry needs to be updated to new killstreak usage if it is used again");
    #/
    level.sentrysettings = [];
    level.sentrysettings["super_trophy"] = spawnstruct();
    level.sentrysettings["super_trophy"].health = 999999;
    level.sentrysettings["super_trophy"].maxhealth = 100;
    level.sentrysettings["super_trophy"].sentrymodeon = "sentry";
    level.sentrysettings["super_trophy"].sentrymodeoff = "sentry_offline";
    level.sentrysettings["super_trophy"].weaponinfo = "sentry_laser_mp";
    level.sentrysettings["super_trophy"].modelbase = "super_trophy_mp";
    level.sentrysettings["super_trophy"].modelgood = "super_trophy_mp_placement";
    level.sentrysettings["super_trophy"].modelbad = "super_trophy_mp_placement_fail";
    level.sentrysettings["super_trophy"].modeldestroyed = "super_trophy_mp";
    level.sentrysettings["super_trophy"].hintstring = "SENTRY/PICKUP";
    level.sentrysettings["super_trophy"].headicon = 1;
    level.sentrysettings["super_trophy"].teamsplash = "used_super_trophy";
    level.sentrysettings["super_trophy"].shouldsplash = 0;
    level.sentrysettings["super_trophy"].lightfxtag = "tag_fx";
    level.sentrysettings["sentry_shock"] = spawnstruct();
    level.sentrysettings["sentry_shock"].health = 999999;
    level.sentrysettings["sentry_shock"].maxhealth = 670;
    level.sentrysettings["sentry_shock"].burstmin = 20;
    level.sentrysettings["sentry_shock"].burstmax = 120;
    level.sentrysettings["sentry_shock"].pausemin = 0.15;
    level.sentrysettings["sentry_shock"].pausemax = 0.35;
    level.sentrysettings["sentry_shock"].sentrymodeon = "sentry";
    level.sentrysettings["sentry_shock"].sentrymodeoff = "sentry_offline";
    level.sentrysettings["sentry_shock"].timeout = 90;
    level.sentrysettings["sentry_shock"].spinuptime = 0.05;
    level.sentrysettings["sentry_shock"].overheattime = 8;
    level.sentrysettings["sentry_shock"].cooldowntime = 0.1;
    level.sentrysettings["sentry_shock"].fxtime = 0.3;
    level.sentrysettings["sentry_shock"].streakname = "sentry_shock";
    level.sentrysettings["sentry_shock"].weaponinfo = "sentry_shock_mp";
    level.sentrysettings["sentry_shock"].scriptable = "ks_shock_sentry_mp";
    level.sentrysettings["sentry_shock"].modelbase = "shock_sentry_gun_wm";
    level.sentrysettings["sentry_shock"].modelgood = "shock_sentry_gun_wm_obj";
    level.sentrysettings["sentry_shock"].modelbad = "shock_sentry_gun_wm_obj_red";
    level.sentrysettings["sentry_shock"].modeldestroyed = "shock_sentry_gun_wm_destroyed";
    level.sentrysettings["sentry_shock"].hintstring = "SENTRY/PICKUP";
    level.sentrysettings["sentry_shock"].headicon = 1;
    level.sentrysettings["sentry_shock"].teamsplash = "used_shock_sentry";
    level.sentrysettings["sentry_shock"].destroyedsplash = "callout_destroyed_sentry_shock";
    level.sentrysettings["sentry_shock"].shouldsplash = 1;
    level.sentrysettings["sentry_shock"].votimeout = "sentry_gun_teamleader_crash";
    level.sentrysettings["sentry_shock"].vodestroyed = "sentry_gun_teamleader_crash";
    level.sentrysettings["sentry_shock"].scorepopup = "destroyed_sentry";
    level.sentrysettings["sentry_shock"].lightfxtag = "tag_fx";
    level.sentrysettings["sentry_shock"].iskillstreak = 1;
    level.sentrysettings["sentry_shock"].headiconoffset = 75;
    level._effect["sentry_overheat_mp"] = loadfx("vfx/core/mp/killstreaks/vfx_sg_overheat_smoke");
    level._effect["sentry_explode_mp"] = loadfx("vfx/iw7/_requests/mp/vfx_generic_equipment_exp_lg.vfx");
    level._effect["sentry_sparks_mp"] = loadfx("vfx/core/mp/killstreaks/vfx_sentry_gun_explosion");
    level._effect["sentry_smoke_mp"] = loadfx("vfx/iw7/_requests/mp/vfx_gen_equip_dam_spark_runner.vfx");
    level._effect["sentry_shock_charge"] = loadfx("vfx/iw7/_requests/mp/vfx_sentry_shock_charge_up.vfx");
    level._effect["sentry_shock_screen"] = loadfx("vfx/iw7/_requests/mp/vfx_sentry_shock_screen");
    level._effect["sentry_shock_base"] = loadfx("vfx/iw7/_requests/mp/vfx_sentry_shock_base");
    level._effect["sentry_shock_radius"] = loadfx("vfx/iw7/_requests/mp/vfx_sentry_shock_radius");
    level._effect["sentry_shock_explosion"] = loadfx("vfx/iw7/_requests/mp/vfx_sentry_shock_end.vfx");
    level._effect["sentry_shock_trail"] = loadfx("vfx/iw7/_requests/mp/vfx_sentry_shock_proj_trail.vfx");
    level._effect["sentry_shock_arc"] = loadfx("vfx/iw7/_requests/mp/vfx_sentry_shock_arc.vfx");
    /#
        setdevdvarifuninitialized(@"hash_7132e4633efb342c", 90);
    #/
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1530
// Size: 0x61
function tryuseautosentry(lifeid, streakname) {
    result = givesentry("sentry_minigun");
    if (result) {
        utility::trycall(level.matchdata_logkillstreakevent, level.sentrysettings["sentry_minigun"].streakname, self.origin);
    }
    return result;
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1599
// Size: 0x61
function tryusesam(lifeid, streakname) {
    result = givesentry("sam_turret");
    if (result) {
        utility::trycall(level.matchdata_logkillstreakevent, level.sentrysettings["sam_turret"].streakname, self.origin);
    }
    return result;
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1602
// Size: 0x51
function tryuseshocksentry(streakinfo) {
    result = givesentry("sentry_shock", undefined, streakinfo);
    if (result) {
        utility::trycall(level.matchdata_logkillstreakevent, streakinfo.streakname, self.origin);
    } else {
        waitframe();
    }
    return result;
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x165b
// Size: 0x51
function tryusemanualturret(streakinfo) {
    result = givesentry("manual_turret", undefined, streakinfo);
    if (result) {
        utility::trycall(level.matchdata_logkillstreakevent, streakinfo.streakname, self.origin);
    } else {
        waitframe();
    }
    return result;
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x16b4
// Size: 0xe4
function givesentry(sentrytype, var_7ff7ef0188f9b7ef, streakinfo) {
    self.last_sentry = sentrytype;
    if (!isdefined(self.placedsentries)) {
        self.placedsentries = [];
    }
    if (!isdefined(self.placedsentries[sentrytype])) {
        self.placedsentries[sentrytype] = [];
    }
    var_508482f603c6293e = 1;
    if (isdefined(var_7ff7ef0188f9b7ef)) {
        var_508482f603c6293e = var_7ff7ef0188f9b7ef;
    }
    sentrygun = createsentryforplayer(sentrytype, self, var_508482f603c6293e, streakinfo);
    if (isdefined(streakinfo)) {
        streakinfo.sentrygun = sentrygun;
    }
    removeperks();
    self.carriedsentry = sentrygun;
    result = setcarryingsentry(sentrygun, 1, var_508482f603c6293e);
    self.carriedsentry = undefined;
    thread waitrestoreperks();
    self.iscarrying = 0;
    if (isdefined(sentrygun)) {
        return 1;
    } else {
        return 0;
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x179f
// Size: 0x1a7
function setcarryingsentry(sentrygun, var_3a565847d875f3ec, var_508482f603c6293e, var_593f001fd97e03b8) {
    self endon("death_or_disconnect");
    /#
        assert(isreallyalive(self));
    #/
    sentrygun sentry_setcarried(self, var_508482f603c6293e, var_593f001fd97e03b8);
    val::set("sentry", "usability", 0);
    val::set("sentry", "melee", 0);
    allowweaponsforsentry(0);
    if (!isai(self)) {
        self notifyonplayercommand("place_sentry", "+attack");
        self notifyonplayercommand("place_sentry", "+attack_akimbo_accessible");
        self notifyonplayercommand("cancel_sentry", "+actionslot 4");
        if (!self isconsoleplayer()) {
            self notifyonplayercommand("cancel_sentry", "+actionslot 5");
            self notifyonplayercommand("cancel_sentry", "+actionslot 6");
            self notifyonplayercommand("cancel_sentry", "+actionslot 7");
        }
    }
    for (;;) {
        result = waittill_any_return_4("place_sentry", "cancel_sentry", "force_cancel_placement", "emp_applied");
        if (!isdefined(sentrygun)) {
            allowweaponsforsentry(1);
            thread enablemeleeforsentry();
            return 1;
        }
        if (result == "cancel_sentry" || result == "force_cancel_placement" || result == "emp_applied") {
            if (!var_3a565847d875f3ec && (result == "cancel_sentry" || result == "emp_applied")) {
                continue;
            }
            sentrygun sentry_setcancelled(result == "force_cancel_placement" && !isdefined(sentrygun.firstplacement));
            return 0;
        }
        if (!sentrygun.canbeplaced) {
            continue;
        }
        sentrygun sentry_setplaced(var_508482f603c6293e);
        return 1;
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x194d
// Size: 0x1c
function enablemeleeforsentry() {
    self endon("death_or_disconnect");
    wait(0.25);
    val::function_c9d0b43701bdba00("sentry");
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1970
// Size: 0x2b
function removeweapons() {
    if (self hasweapon("iw6_riotshield_mp")) {
        self.restoreweapon = "iw6_riotshield_mp";
        _takeweapon("iw6_riotshield_mp");
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19a2
// Size: 0x2b
function removeperks() {
    if (_hasperk("specialty_explosivebullets")) {
        self.restoreperk = "specialty_explosivebullets";
        removeperk("specialty_explosivebullets");
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x19d4
// Size: 0x2a
function restoreweapons() {
    if (isdefined(self.restoreweapon)) {
        _giveweapon(self.restoreweapon);
        self.restoreweapon = undefined;
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a05
// Size: 0x2a
function restoreperks() {
    if (isdefined(self.restoreperk)) {
        giveperk(self.restoreperk);
        self.restoreperk = undefined;
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1a36
// Size: 0x19
function waitrestoreperks() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    waitframe();
    restoreperks();
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1a56
// Size: 0xd1
function createsentryforplayer(sentrytype, owner, var_508482f603c6293e, streakinfo) {
    /#
        assertex(isdefined(owner), "createSentryForPlayer() called without owner specified");
    #/
    var_a74853f29ed4eeae = level.sentrysettings[sentrytype].weaponinfo;
    sentrygun = spawnturret("misc_turret", owner.origin, var_a74853f29ed4eeae);
    sentrygun.angles = owner.angles;
    sentrygun.streakinfo = streakinfo;
    sentrygun sentry_initsentry(sentrytype, owner, var_508482f603c6293e);
    sentrygun thread sentry_destroyongameend();
    sentrygun namespace_5a51aa78ea0b1b9f::allow_emp(0);
    sentrygun namespace_5a51aa78ea0b1b9f::set_start_emp_callback(&sentry_empstarted);
    sentrygun namespace_5a51aa78ea0b1b9f::set_clear_emp_callback(&sentry_empcleared);
    return sentrygun;
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1b2f
// Size: 0x4b8
function sentry_initsentry(sentrytype, owner, var_508482f603c6293e, timeout) {
    if (!isdefined(timeout)) {
        timeout = 1;
    }
    self.sentrytype = sentrytype;
    self.canbeplaced = 1;
    self setmodel(level.sentrysettings[sentrytype].modelbase);
    self setnodeploy(1);
    if (level.sentrysettings[sentrytype].shouldsplash) {
        self.shouldsplash = 1;
    } else {
        self.shouldsplash = 0;
    }
    self.firstplacement = 1;
    self setcandamage(1);
    switch (sentrytype) {
    case #"hash_8a144557bd5ac067":
    case #"hash_8f3bfcef6a436f5b":
    case #"hash_8f3bfdef6a4370ee":
    case #"hash_8f3bfeef6a437281":
    case #"hash_8f3bffef6a437414":
    case #"hash_9cc148005b0186d6":
    case #"hash_9cc14a005b0189fc":
    case #"hash_9cc14b005b018b8f":
    case #"hash_9cc14d005b018eb5":
    case #"hash_ce05fbb198b1f5dd":
        self setleftarc(80);
        self setrightarc(80);
        self setbottomarc(50);
        self setdefaultdroppitch(0);
        self.originalowner = owner;
        break;
    case #"hash_721f6bf62b0eb1bd":
    case #"hash_c72f9e2dc5fac20b":
        self maketurretinoperable();
        self setleftarc(180);
        self setrightarc(180);
        self settoparc(80);
        self setdefaultdroppitch(-89);
        self.laser_on = 0;
        killcament = spawn("script_model", self gettagorigin("tag_laser"));
        killcament linkto(self);
        self.killcament = killcament;
        self.killcament setscriptmoverkillcam("explosive");
        break;
    case #"hash_576b868dbf9eab17":
        self maketurretinoperable();
        var_d3dc97c59992d51 = anglestoforward(self.angles);
        var_a8ae5e047a5b6cb6 = self gettagorigin("tag_laser") + (0, 0, 10);
        var_a8ae5e047a5b6cb6 = var_a8ae5e047a5b6cb6 - var_d3dc97c59992d51 * 20;
        killcament = spawn("script_model", var_a8ae5e047a5b6cb6);
        killcament linkto(self);
        self.killcament = killcament;
        break;
    case #"hash_52d9b7ed584bec3e":
        var_d3dc97c59992d51 = anglestoforward(self.angles);
        var_a8ae5e047a5b6cb6 = self gettagorigin("tag_laser") + (0, 0, 10);
        var_a8ae5e047a5b6cb6 = var_a8ae5e047a5b6cb6 - var_d3dc97c59992d51 * 20;
        killcament = spawn("script_model", var_a8ae5e047a5b6cb6);
        killcament linkto(self);
        self.killcament = killcament;
        break;
    default:
        self maketurretinoperable();
        self setdefaultdroppitch(-89);
        break;
    }
    self setturretmodechangewait(1);
    sentry_setinactive();
    sentry_setowner(owner);
    if (timeout) {
        thread sentry_timeout();
    }
    switch (sentrytype) {
    case #"hash_8a144557bd5ac067":
    case #"hash_8f3bfcef6a436f5b":
    case #"hash_8f3bfdef6a4370ee":
    case #"hash_8f3bfeef6a437281":
    case #"hash_8f3bffef6a437414":
        self.momentum = 0;
        self.heatlevel = 0;
        self.overheated = 0;
        thread sentry_heatmonitor();
        break;
    case #"hash_9cc148005b0186d6":
    case #"hash_9cc14a005b0189fc":
    case #"hash_9cc14b005b018b8f":
    case #"hash_9cc14d005b018eb5":
    case #"hash_ce05fbb198b1f5dd":
        self.momentum = 0;
        self.heatlevel = 0;
        self.cooldownwaittime = 0;
        self.overheated = 0;
        thread turret_heatmonitor();
        thread turret_coolmonitor();
        break;
    case #"hash_576b868dbf9eab17":
    case #"hash_721f6bf62b0eb1bd":
    case #"hash_c72f9e2dc5fac20b":
        self.momentum = 0;
        thread sentry_handleuse(var_508482f603c6293e);
        thread sentry_beepsounds();
        break;
    case #"hash_52d9b7ed584bec3e":
        self.momentum = 0;
        thread sentry_handlemanualuse();
        thread sentry_handlealteratepickup(var_508482f603c6293e);
        break;
    case #"hash_b17ed5514d85b71b":
        thread sentry_handleuse(0);
        thread sentry_beepsounds();
        break;
    default:
        thread sentry_handleuse(var_508482f603c6293e);
        thread sentry_attacktargets();
        thread sentry_beepsounds();
        break;
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1fee
// Size: 0x81
function sentry_setteamheadicon() {
    headiconoffset = level.sentrysettings[self.sentrytype].headiconoffset;
    if (!isdefined(headiconoffset)) {
        return;
    }
    if (!isdefined(self.owner)) {
        return;
    }
    owner = self.owner;
    team = owner.team;
    self.headiconid = thread namespace_7bdde15c3500a23f::setheadicon_factionimage(0, headiconoffset, undefined, undefined, undefined, undefined, 1);
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2076
// Size: 0x41
function sentry_clearteamheadicon() {
    headiconoffset = level.sentrysettings[self.sentrytype].headiconoffset;
    if (!isdefined(headiconoffset)) {
        return;
    }
    namespace_7bdde15c3500a23f::setheadicon_deleteicon(self.headiconid);
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20be
// Size: 0x24
function sentry_destroyongameend() {
    self endon("death");
    level waittill_any_2("bro_shot_start", "game_ended");
    self notify("death");
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x20e9
// Size: 0x91
function sentry_handledamage() {
    self endon("carried");
    maxhealth = level.sentrysettings[self.sentrytype].maxhealth;
    var_4b9cd0374a51877c = 0;
    if (self.owner _hasperk("specialty_rugged_eqp")) {
        weaponname = self.weapon_name;
        if (isdefined(weaponname)) {
        }
    }
    maxhealth = maxhealth + int(var_4b9cd0374a51877c);
    namespace_3e725f3cc58bddd3::monitordamage(maxhealth, "sentry", &sentryhandledeathdamage, &sentrymodifydamage, 1);
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2181
// Size: 0xbd
function sentrymodifydamage(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    idflags = data.idflags;
    modifieddamage = damage;
    if (type == "MOD_MELEE") {
        modifieddamage = self.maxhealth * 0.34;
    }
    modifieddamage = getmodifiedantikillstreakdamage(attacker, objweapon, type, modifieddamage, self.maxhealth, 2, 3, 4);
    return modifieddamage;
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2246
// Size: 0x193
function sentryhandledeathdamage(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    idflags = data.idflags;
    config = level.sentrysettings[self.sentrytype];
    if (config.iskillstreak) {
        var_3737240cefe2c793 = namespace_3e725f3cc58bddd3::onkillstreakkilled(config.streakname, attacker, objweapon, type, damage, config.scorepopup, config.vodestroyed, config.destroyedsplash);
        if (var_3737240cefe2c793) {
            attacker notify("destroyed_equipment");
        }
    } else {
        var_2d113e958c753976 = undefined;
        var_43dbeb17e356bbb0 = attacker;
        if (isdefined(var_43dbeb17e356bbb0) && isdefined(self.owner)) {
            if (isdefined(attacker.owner) && isplayer(attacker.owner)) {
                var_43dbeb17e356bbb0 = attacker.owner;
            }
            if (self.owner namespace_f8065cafc523dba5::isenemy(var_43dbeb17e356bbb0)) {
                var_2d113e958c753976 = var_43dbeb17e356bbb0;
            }
        }
        if (isdefined(var_2d113e958c753976)) {
            var_2d113e958c753976 thread namespace_391de535501b0143::supershutdown(self.owner);
            var_2d113e958c753976 notify("destroyed_equipment");
        }
        self notify("death");
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x23e0
// Size: 0x6e
function sentry_empstarted(data) {
    self.disabled = 1;
    self setdefaultdroppitch(40);
    self setmode(level.sentrysettings[self.sentrytype].sentrymodeoff);
    self cleartargetentity();
    self setscriptablepartstate("muzzle", "neutral", 0);
    self setscriptablepartstate("stunned", "active");
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2455
// Size: 0x5c
function sentry_empcleared(isdeath) {
    if (isdeath) {
        return;
    }
    self setdefaultdroppitch(-89);
    self setmode(level.sentrysettings[self.sentrytype].sentrymodeon);
    self setscriptablepartstate("stunned", "neutral");
    self.disabled = undefined;
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x24b8
// Size: 0x346
function sentry_handledeath() {
    self endon("carried");
    self waittill("death");
    if (isdefined(self.owner)) {
        self.owner.placedsentries[self.sentrytype] = array_remove(self.owner.placedsentries[self.sentrytype], self);
    }
    if (!isdefined(self)) {
        return;
    }
    self cleartargetentity();
    self laseroff();
    self setmodel(level.sentrysettings[self.sentrytype].modeldestroyed);
    if (isdefined(self.fxentdeletelist) && self.fxentdeletelist.size > 0) {
        foreach (fxent in self.fxentdeletelist) {
            if (isdefined(fxent)) {
                fxent delete();
            }
        }
        self.fxentdeletelist = undefined;
    }
    sentry_setinactive();
    self setdefaultdroppitch(40);
    self setsentryowner(undefined);
    if (isdefined(self.inuseby)) {
        self useby(self.inuseby);
    }
    self setturretminimapvisible(0);
    if (isdefined(self.ownertrigger)) {
        self.ownertrigger delete();
    }
    self playsound("mp_equip_destroyed");
    switch (self.sentrytype) {
    case #"hash_8a144557bd5ac067":
    case #"hash_ce05fbb198b1f5dd":
        self.forcedisable = 1;
        self turretfiredisable();
        break;
    default:
        break;
    }
    if (isdefined(self.inuseby)) {
        playfxontag(getfx("sentry_explode_mp"), self, "tag_origin");
        playfxontag(getfx("sentry_smoke_mp"), self, "tag_aim");
        self.inuseby.turret_overheat_bar destroyelem();
        self.inuseby restoreperks();
        self.inuseby restoreweapons();
        self notify("deleting");
        wait(1);
        stopfxontag(getfx("sentry_explode_mp"), self, "tag_origin");
        stopfxontag(getfx("sentry_smoke_mp"), self, "tag_aim");
    } else {
        self playsound("sentry_explode_smoke");
        self setscriptablepartstate("destroyed", "sparks");
        wait(5);
        playfx(getfx("sentry_explode_mp"), self.origin + (0, 0, 10));
        self notify("deleting");
    }
    namespace_3bbb5a98b932c46f::equipmentdeletevfx();
    if (isdefined(self.killcament)) {
        self.killcament delete();
    }
    if (isdefined(self.airlookatent)) {
        self.airlookatent delete();
    }
    if (isdefined(self.manualpickuptrigger)) {
        self.manualpickuptrigger delete();
    }
    printgameaction("killstreak ended - shock_sentry", self.owner);
    self delete();
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2805
// Size: 0xeb
function sentry_handleuse(var_508482f603c6293e) {
    self endon("death");
    level endon("game_ended");
    for (;;) {
        player = self waittill("trigger");
        /#
            assert(player == self.owner);
        #/
        /#
            assert(!isdefined(self.carriedby));
        #/
        if (!isreallyalive(player)) {
            continue;
        }
        if (self.sentrytype == "sam_turret" || self.sentrytype == "scramble_turret") {
            self setmode(level.sentrysettings[self.sentrytype].sentrymodeoff);
        }
        player.placedsentries[self.sentrytype] = array_remove(player.placedsentries[self.sentrytype], self);
        player setcarryingsentry(self, 0, var_508482f603c6293e);
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x28f7
// Size: 0x161
function turret_handlepickup(turret) {
    self endon("disconnect");
    level endon("game_ended");
    turret endon("death");
    if (!isdefined(turret.ownertrigger)) {
        return;
    }
    buttontime = 0;
    for (;;) {
        for (;;) {
            if (isalive(self) && self istouching(turret.ownertrigger) && !isdefined(turret.inuseby) && !isdefined(turret.carriedby) && self isonground()) {
                if (self usebuttonpressed()) {
                    buttontime = 0;
                    while (self usebuttonpressed()) {
                        buttontime = buttontime + level.framedurationseconds;
                        waitframe();
                    }
                    /#
                        println("sentry_sparks_mp" + buttontime);
                    #/
                    if (buttontime >= 0.5) {
                        continue;
                    }
                    buttontime = 0;
                    while (!self usebuttonpressed() && buttontime < 0.5) {
                        buttontime = buttontime + level.framedurationseconds;
                        waitframe();
                    }
                    /#
                        println("vfx/iw7/_requests/mp/vfx_sentry_shock_proj_trail.vfx" + buttontime);
                    #/
                    if (buttontime >= 0.5) {
                        continue;
                    }
                    if (!isreallyalive(self)) {
                        continue;
                    }
                    turret setmode(level.sentrysettings[turret.sentrytype].sentrymodeoff);
                    thread setcarryingsentry(turret, 0);
                    turret.ownertrigger delete();
                    return;
                }
            }
        }
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2a5f
// Size: 0x45a
function turret_handleuse() {
    self notify("turret_handluse");
    self endon("turret_handleuse");
    self endon("deleting");
    level endon("game_ended");
    self.forcedisable = 0;
    var_b1dfdf129250e6ff = (1, 0.9, 0.7);
    var_541da7cf90e97010 = (1, 0.65, 0);
    var_e96ec83c82048ee1 = (1, 0.25, 0);
    for (;;) {
        player = self waittill("trigger");
        if (isdefined(self.carriedby)) {
            continue;
        }
        if (isdefined(self.inuseby)) {
            continue;
        }
        if (!isreallyalive(player)) {
            continue;
        }
        player removeperks();
        player removeweapons();
        self.inuseby = player;
        self setmode(level.sentrysettings[self.sentrytype].sentrymodeoff);
        sentry_setowner(player);
        self setmode(level.sentrysettings[self.sentrytype].sentrymodeon);
        player thread turret_shotmonitor(self);
        player.turret_overheat_bar = player createbar(var_b1dfdf129250e6ff, 100, 6);
        player.turret_overheat_bar setpoint("CENTER", "BOTTOM", 0, -70);
        player.turret_overheat_bar.alpha = 0.65;
        player.turret_overheat_bar.bar.alpha = 0.65;
        var_5fb0c5a6344c28a9 = 0;
        for (;;) {
            for (;;) {
                if (!isreallyalive(player)) {
                    self.inuseby = undefined;
                    player.turret_overheat_bar destroyelem();
                    break;
                }
                if (!player isusingturret()) {
                    self notify("player_dismount");
                    self.inuseby = undefined;
                    player.turret_overheat_bar destroyelem();
                    player restoreperks();
                    player restoreweapons();
                    self sethintstring(level.sentrysettings[self.sentrytype].hintstring);
                    self setmode(level.sentrysettings[self.sentrytype].sentrymodeoff);
                    sentry_setowner(self.originalowner);
                    self setmode(level.sentrysettings[self.sentrytype].sentrymodeon);
                    break;
                }
                if (self.heatlevel >= level.sentrysettings[self.sentrytype].overheattime) {
                    barfrac = 1;
                } else {
                    barfrac = self.heatlevel / level.sentrysettings[self.sentrytype].overheattime;
                }
                player.turret_overheat_bar updatebar(barfrac);
                if (string_starts_with(self.sentrytype, "minigun_turret")) {
                    minigun_turret = "minigun_turret";
                }
                if (self.forcedisable || self.overheated) {
                    self turretfiredisable();
                    player.turret_overheat_bar.bar.color = var_e96ec83c82048ee1;
                    var_5fb0c5a6344c28a9 = 0;
                } else if (self.heatlevel > level.sentrysettings[self.sentrytype].overheattime * 0.75 && string_starts_with(self.sentrytype, "minigun_turret")) {
                    player.turret_overheat_bar.bar.color = var_541da7cf90e97010;
                    if (randomintrange(0, 10) < 6) {
                        self turretfireenable();
                    } else {
                        self turretfiredisable();
                    }
                    if (!var_5fb0c5a6344c28a9) {
                        var_5fb0c5a6344c28a9 = 1;
                        thread playheatfx();
                    }
                } else {
                    player.turret_overheat_bar.bar.color = var_b1dfdf129250e6ff;
                    self turretfireenable();
                    var_5fb0c5a6344c28a9 = 0;
                    self notify("not_overheated");
                }
            }
        }
        self setdefaultdroppitch(0);
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2ec0
// Size: 0x47
function sentry_handleownerdisconnect() {
    self endon("death");
    level endon("game_ended");
    self notify("sentry_handleOwner");
    self endon("sentry_handleOwner");
    childthread sentry_watchownerstatus("disconnect");
    childthread sentry_watchownerstatus("joined_team");
    childthread sentry_watchownerstatus("joined_spectators");
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f0e
// Size: 0x20
function sentry_watchownerstatus(var_70687e0cc558a009) {
    self.owner waittill(var_70687e0cc558a009);
    self notify("death");
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f35
// Size: 0xa8
function sentry_setowner(owner) {
    /#
        assertex(isdefined(owner), "sentry_setOwner() called without owner specified");
    #/
    /#
        assertex(isplayer(owner), "sentry_setOwner() called on non-player entity type: " + owner.classname);
    #/
    self.owner = owner;
    self setsentryowner(self.owner);
    self setturretminimapvisible(1, self.sentrytype);
    if (level.teambased) {
        self.team = self.owner.team;
        self setturretteam(self.team);
    }
    thread sentry_handleownerdisconnect();
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2fe4
// Size: 0x14
function sentry_moving_platform_death(data) {
    self notify("death");
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2fff
// Size: 0x3fd
function sentry_setplaced(var_508482f603c6293e) {
    if (isdefined(self.owner)) {
        var_be6e776392e3983d = self.owner.placedsentries[self.sentrytype].size;
        self.owner.placedsentries[self.sentrytype][var_be6e776392e3983d] = self;
        if (var_be6e776392e3983d + 1 > 2) {
            self.owner.placedsentries[self.sentrytype][0] notify("death");
        }
        self.owner allowweaponsforsentry(1);
        self.owner thread enablemeleeforsentry();
        self.owner enableworldup(1);
    }
    self setmodel(level.sentrysettings[self.sentrytype].modelbase);
    if (self getmode() == "manual") {
        self setmode(level.sentrysettings[self.sentrytype].sentrymodeoff);
    }
    if (self.sentrytype == "sentry_shock") {
    }
    thread sentry_handledamage();
    thread sentry_handledeath();
    self setsentrycarrier(undefined);
    self setcandamage(1);
    switch (self.sentrytype) {
    case #"hash_8a144557bd5ac067":
    case #"hash_8f3bfcef6a436f5b":
    case #"hash_8f3bfdef6a4370ee":
    case #"hash_8f3bfeef6a437281":
    case #"hash_8f3bffef6a437414":
    case #"hash_9cc148005b0186d6":
    case #"hash_9cc14a005b0189fc":
    case #"hash_9cc14b005b018b8f":
    case #"hash_9cc14d005b018eb5":
    case #"hash_ce05fbb198b1f5dd":
        if (var_508482f603c6293e) {
            self.angles = self.carriedby.angles;
            if (isalive(self.originalowner)) {
                self.originalowner namespace_58fb4f2e73fd41a0::setlowermessage("pickup_hint", level.sentrysettings[self.sentrytype].ownerhintstring, 3, undefined, undefined, undefined, undefined, undefined, 1);
            }
            self.ownertrigger = spawn("trigger_radius", self.origin + (0, 0, 1), 0, 105, 64);
            self.ownertrigger enablelinkto();
            self.ownertrigger linkto(self);
            /#
                assert(isdefined(self.ownertrigger));
            #/
            self.originalowner thread turret_handlepickup(self);
            thread turret_handleuse();
        }
        break;
    case #"hash_52d9b7ed584bec3e":
        self setdefaultdroppitch(30);
        break;
    default:
        break;
    }
    sentry_makesolid();
    if (isdefined(self.bombsquadmodel)) {
        self.bombsquadmodel show();
        level notify("update_bombsquad");
    }
    self.carriedby forceusehintoff();
    self.carriedby = undefined;
    self.firstplacement = undefined;
    if (isdefined(self.owner)) {
        self.owner.iscarrying = 0;
        self.owner notify("new_sentry", self);
    }
    sentry_setactive(var_508482f603c6293e);
    data = spawnstruct();
    if (isdefined(self.moving_platform)) {
        data.linkparent = self.moving_platform;
    }
    data.endonstring = "carried";
    data.deathoverridecallback = &sentry_moving_platform_death;
    thread namespace_d7b023c7eb3949d0::handle_moving_platforms(data);
    if (self.sentrytype != "multiturret") {
        self playsound("sentry_gun_plant");
    }
    self notify("placed");
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3403
// Size: 0x9a
function sentry_setcancelled(var_ddd5b75d0cd367c5) {
    if (isdefined(self.carriedby)) {
        owner = self.carriedby;
        owner forceusehintoff();
        owner.iscarrying = undefined;
        owner.carrieditem = undefined;
        owner allowweaponsforsentry(1);
        owner thread enablemeleeforsentry();
        owner enableworldup(1);
        if (isdefined(self.bombsquadmodel)) {
            self.bombsquadmodel delete();
        }
    }
    if (isdefined(var_ddd5b75d0cd367c5) && var_ddd5b75d0cd367c5) {
        namespace_3bbb5a98b932c46f::equipmentdeletevfx();
    }
    self delete();
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x34a4
// Size: 0x174
function sentry_setcarried(carrier, var_508482f603c6293e, var_593f001fd97e03b8) {
    /#
        assert(isplayer(carrier));
    #/
    if (isdefined(self.originalowner)) {
        /#
            assertex(carrier == self.originalowner, "sentry_setCarried() specified carrier does not own this sentry");
        #/
    } else {
        /#
            assertex(carrier == self.owner, "sentry_setCarried() specified carrier does not own this sentry");
        #/
    }
    if (self.sentrytype == "sentry_shock") {
        self setscriptablepartstate("muzzle", "neutral", 0);
    }
    self setmodel(level.sentrysettings[self.sentrytype].modelgood);
    self setsentrycarrier(carrier);
    self setcandamage(0);
    sentry_makenotsolid();
    carrier enableworldup(0);
    self.carriedby = carrier;
    carrier.iscarrying = 1;
    self.pickupenabled = var_508482f603c6293e;
    thread sentry_oncarrierdeathoremp(carrier, var_593f001fd97e03b8);
    carrier thread updatesentryplacement(self);
    thread sentry_oncarrierdisconnect(carrier);
    thread sentry_oncarrierchangedteam(carrier);
    thread sentry_ongameended();
    namespace_5a51aa78ea0b1b9f::allow_emp(0);
    self setdefaultdroppitch(-89);
    sentry_setinactive();
    if (isdefined(self getlinkedparent())) {
        self unlink();
    }
    self notify("carried");
    if (isdefined(self.bombsquadmodel)) {
        self.bombsquadmodel hide();
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x361f
// Size: 0x1e5
function updatesentryplacement(sentrygun) {
    self endon("death_or_disconnect");
    level endon("game_ended");
    sentrygun endon("placed");
    sentrygun endon("death");
    sentrygun.canbeplaced = 1;
    var_a0c968fd72a36b5b = -1;
    for (;;) {
        placement = self canplayerplacesentry(1, 40);
        sentrygun.origin = placement["origin"];
        sentrygun.angles = placement["angles"];
        var_8509066f54f7c75a = array_combine(level.turrets, level.microturrets, level.supertrophy.trophies, level.mines);
        var_3b23c52ff5bbd6c7 = sentrygun getistouchingentities(var_8509066f54f7c75a);
        sentrygun.canbeplaced = self isonground() && placement["result"] && abs(sentrygun.origin[2] - self.origin[2]) < 30 && !istouchingboundstrigger(self) && var_3b23c52ff5bbd6c7.size == 0;
        if (isdefined(placement["entity"])) {
            sentrygun.moving_platform = placement["entity"];
        } else {
            sentrygun.moving_platform = undefined;
        }
        if (sentrygun.canbeplaced != var_a0c968fd72a36b5b) {
            if (sentrygun.canbeplaced) {
                sentrygun setmodel(level.sentrysettings[sentrygun.sentrytype].modelgood);
                sentrygun placehinton();
            } else {
                sentrygun setmodel(level.sentrysettings[sentrygun.sentrytype].modelbad);
                sentrygun cannotplacehinton();
            }
        }
        var_a0c968fd72a36b5b = sentrygun.canbeplaced;
        wait(0.05);
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x380b
// Size: 0x68
function sentry_oncarrierdeathoremp(carrier, var_593f001fd97e03b8) {
    self endon("placed");
    self endon("death");
    carrier endon("disconnect");
    carrier waittill_any_2("death", "emp_applied");
    if (self.canbeplaced && !istrue(var_593f001fd97e03b8)) {
        sentry_setplaced(self.pickupenabled);
    } else {
        sentry_setcancelled(0);
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x387a
// Size: 0x29
function sentry_oncarrierdisconnect(carrier) {
    self endon("placed");
    self endon("death");
    carrier waittill("disconnect");
    self delete();
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x38aa
// Size: 0x33
function sentry_oncarrierchangedteam(carrier) {
    self endon("placed");
    self endon("death");
    carrier waittill_any_2("joined_team", "joined_spectators");
    self delete();
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x38e4
// Size: 0x29
function sentry_ongameended(carrier) {
    self endon("placed");
    self endon("death");
    level waittill("game_ended");
    self delete();
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3914
// Size: 0x255
function sentry_setactive(var_508482f603c6293e) {
    self setmode(level.sentrysettings[self.sentrytype].sentrymodeon);
    if (var_508482f603c6293e) {
        self setcursorhint("HINT_NOICON");
        self sethintstring(level.sentrysettings[self.sentrytype].hintstring);
        self makeusable();
    }
    foreach (player in level.players) {
        switch (self.sentrytype) {
        case #"hash_8a144557bd5ac067":
        case #"hash_8f3bfcef6a436f5b":
        case #"hash_8f3bfdef6a4370ee":
        case #"hash_8f3bfeef6a437281":
        case #"hash_8f3bffef6a437414":
        case #"hash_9cc148005b0186d6":
        case #"hash_9cc14a005b0189fc":
        case #"hash_9cc14b005b018b8f":
        case #"hash_9cc14d005b018eb5":
        case #"hash_ce05fbb198b1f5dd":
            if (var_508482f603c6293e) {
                self enableplayeruse(player);
            }
            break;
        default:
            addtoactivekillstreaklist(self.sentrytype, "Killstreak_Ground", self.owner, 0, 1, 70, "carried");
            if (player == self.owner && var_508482f603c6293e) {
                self enableplayeruse(player);
            } else {
                self disableplayeruse(player);
            }
            break;
        }
    }
    splashname = level.sentrysettings[self.sentrytype].teamsplash;
    if (self.shouldsplash) {
        level thread teamplayercardsplash(splashname, self.owner);
        self.shouldsplash = 0;
    }
    if (self.sentrytype == "sam_turret") {
        thread sam_attacktargets();
    }
    if (self.sentrytype == "scramble_turret") {
        thread scrambleturretattacktargets();
    }
    if (self.sentrytype == "sentry_shock") {
        thread sentryshocktargets();
    }
    namespace_5a51aa78ea0b1b9f::allow_emp(1);
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3b70
// Size: 0x53
function sentry_setinactive() {
    if (self.sentrytype == "manual_turret") {
        self sethintstring("");
        self makeunusable();
    }
    self setmode(level.sentrysettings[self.sentrytype].sentrymodeoff);
    self makeunusable();
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3bca
// Size: 0xa
function sentry_makesolid() {
    self solid();
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3bdb
// Size: 0xa
function sentry_makenotsolid() {
    self notsolid();
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3bec
// Size: 0x35
function isfriendlytosentry(sentrygun) {
    if (level.teambased && self.team == sentrygun.team) {
        return 1;
    }
    return 0;
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3c29
// Size: 0x6e
function sentry_attacktargets() {
    self endon("death");
    level endon("game_ended");
    self.momentum = 0;
    self.heatlevel = 0;
    self.overheated = 0;
    thread sentry_heatmonitor();
    for (;;) {
        waittill_either("turretstatechange", "cooled");
        if (self isfiringturret()) {
            thread sentry_burstfirestart();
        } else {
            sentry_spindown();
            thread sentry_burstfirestop();
        }
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3c9e
// Size: 0x104
function sentry_timeout() {
    self endon("death");
    level endon("game_ended");
    lifespan = level.sentrysettings[self.sentrytype].timeout;
    /#
        if (!isdefined(lifespan)) {
            lifespan = getdvarfloat(@"hash_7132e4633efb342c");
        }
    #/
    if (isdefined(lifespan) && lifespan == 0) {
        return;
    }
    while (lifespan) {
        wait(1);
        namespace_e323c8674b44c8f4::waittillhostmigrationdone();
        if (!isdefined(self.carriedby)) {
            lifespan = max(0, lifespan - 1);
        }
    }
    if (isdefined(self.owner)) {
        if (isdefined(level.sentrysettings[self.sentrytype].votimeout)) {
            self.owner namespace_9abe40d2af041eb2::function_8959c1606f65e65(self.streakinfo.streakname, level.sentrysettings[self.sentrytype].votimeout);
        }
    }
    self notify("death");
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3da9
// Size: 0x3a
function sentry_targetlocksound() {
    self endon("death");
    self playsound("sentry_gun_beep");
    wait(0.1);
    self playsound("sentry_gun_beep");
    wait(0.1);
    self playsound("sentry_gun_beep");
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3dea
// Size: 0x56
function sentry_spinup() {
    thread sentry_targetlocksound();
    while (self.momentum < level.sentrysettings[self.sentrytype].spinuptime) {
        self.momentum = self.momentum + 0.1;
        wait(0.1);
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e47
// Size: 0xd
function sentry_spindown() {
    self.momentum = 0;
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e5b
// Size: 0x130
function sentry_laser_burstfirestart() {
    self endon("death");
    self endon("stop_shooting");
    level endon("game_ended");
    sentry_spinup();
    firetime = weaponfiretime(level.sentrysettings[self.sentrytype].weaponinfo);
    var_3746ec1befd86ae8 = level.sentrysettings[self.sentrytype].burstmin;
    var_3e92cd336a99ce02 = level.sentrysettings[self.sentrytype].burstmax;
    if (isdefined(self.supportturret) && self.supportturret) {
        firetime = 0.05;
        numshots = 50;
    } else {
        firetime = 0.5 / (self.listoffoundturrets.size + 1);
        numshots = var_3746ec1befd86ae8;
    }
    for (i = 0; i < numshots; i++) {
        turrettarget = self getturrettarget(1);
        if (!isdefined(turrettarget)) {
            break;
        }
        self shootturret();
        wait(firetime);
    }
    self notify("doneFiring");
    self cleartargetentity();
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3f92
// Size: 0x158
function sentry_burstfirestart() {
    self endon("death");
    self endon("stop_shooting");
    level endon("game_ended");
    sentry_spinup();
    firetime = weaponfiretime(level.sentrysettings[self.sentrytype].weaponinfo);
    var_3746ec1befd86ae8 = level.sentrysettings[self.sentrytype].burstmin;
    var_3e92cd336a99ce02 = level.sentrysettings[self.sentrytype].burstmax;
    var_5f622c39d6661b23 = level.sentrysettings[self.sentrytype].pausemin;
    var_42ae243cd994c3bd = level.sentrysettings[self.sentrytype].pausemax;
    for (;;) {
        numshots = randomintrange(var_3746ec1befd86ae8, var_3e92cd336a99ce02 + 1);
        for (i = 0; i < numshots && !self.overheated; i++) {
            self shootturret();
            self notify("bullet_fired");
            self.heatlevel = self.heatlevel + firetime;
            wait(firetime);
        }
        wait(randomfloatrange(var_5f622c39d6661b23, var_42ae243cd994c3bd));
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x40f1
// Size: 0xb
function sentry_burstfirestop() {
    self notify("stop_shooting");
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4103
// Size: 0x88
function turret_shotmonitor(turret) {
    self endon("death_or_disconnect");
    level endon("game_ended");
    turret endon("death");
    turret endon("player_dismount");
    firetime = weaponfiretime(level.sentrysettings[turret.sentrytype].weaponinfo);
    for (;;) {
        turret waittill("turret_fire");
        turret.heatlevel = turret.heatlevel + firetime;
        turret.cooldownwaittime = firetime;
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4192
// Size: 0x1bc
function sentry_heatmonitor() {
    self endon("death");
    firetime = weaponfiretime(level.sentrysettings[self.sentrytype].weaponinfo);
    var_c81d1ae9575cd803 = 0;
    var_6d613d4ed09f7ca = 0;
    overheattime = level.sentrysettings[self.sentrytype].overheattime;
    overheatcooldown = level.sentrysettings[self.sentrytype].cooldowntime;
    for (;;) {
        for (;;) {
            if (self.heatlevel != var_c81d1ae9575cd803) {
                wait(firetime);
            } else {
                self.heatlevel = max(0, self.heatlevel - 0.05);
            }
            if (self.heatlevel > overheattime) {
                self.overheated = 1;
                thread playheatfx();
                switch (self.sentrytype) {
                case #"hash_8a144557bd5ac067":
                case #"hash_8f3bfcef6a436f5b":
                case #"hash_8f3bfdef6a4370ee":
                case #"hash_8f3bfeef6a437281":
                case #"hash_8f3bffef6a437414":
                    playfxontag(getfx("sentry_smoke_mp"), self, "tag_aim");
                    break;
                default:
                    break;
                }
                while (self.heatlevel) {
                    self.heatlevel = max(0, self.heatlevel - overheatcooldown);
                    wait(0.1);
                }
                self.overheated = 0;
                self notify("not_overheated");
            }
            var_c81d1ae9575cd803 = self.heatlevel;
        }
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4355
// Size: 0xce
function turret_heatmonitor() {
    self endon("death");
    overheattime = level.sentrysettings[self.sentrytype].overheattime;
    while (1) {
        if (self.heatlevel > overheattime) {
            self.overheated = 1;
            thread playheatfx();
            switch (self.sentrytype) {
            case #"hash_ce05fbb198b1f5dd":
                playfxontag(getfx("sentry_smoke_mp"), self, "tag_aim");
                break;
            default:
                break;
            }
            while (self.heatlevel) {
                wait(0.1);
            }
            self.overheated = 0;
            self notify("not_overheated");
        }
        wait(0.05);
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x442a
// Size: 0x73
function turret_coolmonitor() {
    self endon("death");
    while (1) {
        if (self.heatlevel > 0) {
            if (self.cooldownwaittime <= 0) {
                self.heatlevel = max(0, self.heatlevel - 0.05);
            } else {
                self.cooldownwaittime = max(0, self.cooldownwaittime - 0.05);
            }
        }
        wait(0.05);
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x44a4
// Size: 0x5f
function playheatfx() {
    self endon("death");
    self endon("not_overheated");
    level endon("game_ended");
    self notify("playing_heat_fx");
    self endon("playing_heat_fx");
    for (;;) {
        playfxontag(getfx("sentry_overheat_mp"), self, "tag_flash");
        wait(level.sentrysettings[self.sentrytype].fxtime);
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x450a
// Size: 0x38
function playsmokefx() {
    self endon("death");
    self endon("not_overheated");
    level endon("game_ended");
    for (;;) {
        playfxontag(getfx("sentry_smoke_mp"), self, "tag_aim");
        wait(0.4);
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4549
// Size: 0x33
function sentry_beepsounds() {
    self endon("death");
    level endon("game_ended");
    for (;;) {
        wait(3);
        if (!isdefined(self.carriedby)) {
            self playsound("sentry_gun_beep");
        }
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4583
// Size: 0x50
function sam_attacktargets() {
    self endon("carried");
    self endon("death");
    level endon("game_ended");
    self.samtargetent = undefined;
    self.sammissilegroups = [];
    while (1) {
        self.samtargetent = sam_acquiretarget();
        sam_fireontarget();
        wait(0.05);
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x45da
// Size: 0x5ef
function sam_acquiretarget() {
    var_446576956fc59f64 = self gettagorigin("tag_laser");
    if (!isdefined(self.samtargetent)) {
        if (level.teambased) {
            entitylist = [];
            var_b0c33d224b825287 = getenemyteams(self.team);
            foreach (entry in var_b0c33d224b825287) {
                foreach (uav in level.uavmodels[entry]) {
                    entitylist[entitylist.size] = uav;
                }
            }
            foreach (uav in entitylist) {
                if (isdefined(uav.isleaving) && uav.isleaving) {
                    continue;
                }
                if (sighttracepassed(var_446576956fc59f64, uav.origin, 0, self)) {
                    return uav;
                }
            }
            foreach (lb in level.littlebirds) {
                if (isdefined(lb.team) && lb.team == self.team) {
                    continue;
                }
                if (sighttracepassed(var_446576956fc59f64, lb.origin, 0, self)) {
                    return lb;
                }
            }
            foreach (heli in level.helis) {
                if (isdefined(heli.team) && heli.team == self.team) {
                    continue;
                }
                if (sighttracepassed(var_446576956fc59f64, heli.origin, 0, self)) {
                    return heli;
                }
            }
            foreach (uav in level.remote_uav) {
                if (!isdefined(uav)) {
                    continue;
                }
                if (isdefined(uav.team) && uav.team == self.team) {
                    continue;
                }
                if (sighttracepassed(var_446576956fc59f64, uav.origin, 0, self, uav)) {
                    return uav;
                }
            }
        } else {
            foreach (uav in level.uavmodels) {
                if (isdefined(uav.isleaving) && uav.isleaving) {
                    continue;
                }
                if (isdefined(uav.owner) && isdefined(self.owner) && uav.owner == self.owner) {
                    continue;
                }
                if (sighttracepassed(var_446576956fc59f64, uav.origin, 0, self)) {
                    return uav;
                }
            }
            foreach (lb in level.littlebirds) {
                if (isdefined(lb.owner) && isdefined(self.owner) && lb.owner == self.owner) {
                    continue;
                }
                if (sighttracepassed(var_446576956fc59f64, lb.origin, 0, self)) {
                    return lb;
                }
            }
            foreach (heli in level.helis) {
                if (isdefined(heli.owner) && isdefined(self.owner) && heli.owner == self.owner) {
                    continue;
                }
                if (sighttracepassed(var_446576956fc59f64, heli.origin, 0, self)) {
                    return heli;
                }
            }
            foreach (uav in level.remote_uav) {
                if (!isdefined(uav)) {
                    continue;
                }
                if (isdefined(uav.owner) && isdefined(self.owner) && uav.owner == self.owner) {
                    continue;
                }
                if (sighttracepassed(var_446576956fc59f64, uav.origin, 0, self, uav)) {
                    return uav;
                }
            }
        }
        self cleartargetentity();
        return undefined;
    } else {
        if (!sighttracepassed(var_446576956fc59f64, self.samtargetent.origin, 0, self)) {
            self cleartargetentity();
            return undefined;
        }
        return self.samtargetent;
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4bd0
// Size: 0x262
function sam_fireontarget() {
    if (isdefined(self.samtargetent)) {
        if (self.samtargetent == level.gunship.planemodel && !isdefined(level.gunshipplayer)) {
            self.samtargetent = undefined;
            self cleartargetentity();
            return;
        }
        self settargetentity(self.samtargetent);
        self waittill("turret_on_target");
        if (!isdefined(self.samtargetent)) {
            return;
        }
        if (!self.laser_on) {
            thread sam_watchlaser();
            thread sam_watchcrashing();
            thread sam_watchleaving();
            thread sam_watchlineofsight();
        }
        wait(2);
        if (!isdefined(self.samtargetent)) {
            return;
        }
        if (self.samtargetent == level.gunship.planemodel && !isdefined(level.gunshipplayer)) {
            self.samtargetent = undefined;
            self cleartargetentity();
            return;
        }
        var_b3cd0252c480a4af = [];
        var_b3cd0252c480a4af[0] = self gettagorigin("tag_le_missile1");
        var_b3cd0252c480a4af[1] = self gettagorigin("tag_le_missile2");
        var_b3cd0252c480a4af[2] = self gettagorigin("tag_ri_missile1");
        var_b3cd0252c480a4af[3] = self gettagorigin("tag_ri_missile2");
        var_a512aa80ea6bf396 = self.sammissilegroups.size;
        for (i = 0; i < 4; i++) {
            if (!isdefined(self.samtargetent)) {
                return;
            }
            if (isdefined(self.carriedby)) {
                return;
            }
            self shootturret();
            rocket = _magicbullet(makeweapon("sam_projectile_mp"), var_b3cd0252c480a4af[i], self.samtargetent.origin, self.owner);
            rocket missile_settargetent(self.samtargetent);
            rocket missile_setflightmodedirect();
            rocket.samturret = self;
            rocket.sammissilegroup = var_a512aa80ea6bf396;
            self.sammissilegroups[var_a512aa80ea6bf396][i] = rocket;
            level notify("sam_missile_fired", self.owner);
            wait(0.25);
        }
    LOC_00000235:
        level notify("sam_fired", self.owner);
        wait(3);
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4e39
// Size: 0x9b
function sam_watchlineofsight() {
    level endon("game_ended");
    self endon("death");
    while (isdefined(self.samtargetent) && isdefined(self getturrettarget(1)) && self getturrettarget(1) == self.samtargetent) {
        var_446576956fc59f64 = self gettagorigin("tag_laser");
        if (!sighttracepassed(var_446576956fc59f64, self.samtargetent.origin, 0, self, self.samtargetent)) {
            self cleartargetentity();
            self.samtargetent = undefined;
            break;
        }
        wait(0.05);
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4edb
// Size: 0x61
function sam_watchlaser() {
    self endon("death");
    self laseron();
    self.laser_on = 1;
    while (isdefined(self.samtargetent) && isdefined(self getturrettarget(1)) && self getturrettarget(1) == self.samtargetent) {
        waitframe();
    }
    self laseroff();
    self.laser_on = 0;
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4f43
// Size: 0x52
function sam_watchcrashing() {
    self endon("death");
    self.samtargetent endon("death");
    if (!isdefined(self.samtargetent.helitype)) {
        return;
    }
    self.samtargetent waittill("crashing");
    self cleartargetentity();
    self.samtargetent = undefined;
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4f9c
// Size: 0x6e
function sam_watchleaving() {
    self endon("death");
    self.samtargetent endon("death");
    if (!isdefined(self.samtargetent.model)) {
        return;
    }
    if (self.samtargetent.model == "vehicle_uav_static_mp") {
        self.samtargetent waittill("leaving");
        self cleartargetentity();
        self.samtargetent = undefined;
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5011
// Size: 0x82
function scrambleturretattacktargets() {
    self endon("carried");
    self endon("death");
    level endon("game_ended");
    self.scrambletargetent = undefined;
    while (1) {
        self.scrambletargetent = scramble_acquiretarget();
        if (isdefined(self.scrambletargetent) && isdefined(self.scrambletargetent.scrambled) && !self.scrambletargetent.scrambled) {
            scrambletarget();
        }
        wait(0.05);
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x509a
// Size: 0x9
function scramble_acquiretarget() {
    return sam_acquiretarget();
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x50ab
// Size: 0x129
function scrambletarget() {
    if (isdefined(self.scrambletargetent)) {
        if (self.scrambletargetent == level.gunship.planemodel && !isdefined(level.gunshipplayer)) {
            self.scrambletargetent = undefined;
            self cleartargetentity();
            return;
        }
        self settargetentity(self.scrambletargetent);
        self waittill("turret_on_target");
        if (!isdefined(self.scrambletargetent)) {
            return;
        }
        if (!self.laser_on) {
            thread scramble_watchlaser();
            thread scramble_watchcrashing();
            thread scramble_watchleaving();
            thread scramble_watchlineofsight();
        }
        wait(2);
        if (!isdefined(self.scrambletargetent)) {
            return;
        }
        if (self.scrambletargetent == level.gunship.planemodel && !isdefined(level.gunshipplayer)) {
            self.scrambletargetent = undefined;
            self cleartargetentity();
            return;
        }
        if (!isdefined(self.scrambletargetent)) {
            return;
        }
        if (isdefined(self.carriedby)) {
            return;
        }
        self shootturret();
        thread setscrambled();
        self notify("death");
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x51db
// Size: 0x93
function setscrambled() {
    var_45b8a1e894f0e1f3 = self.scrambletargetent;
    var_45b8a1e894f0e1f3 notify("scramble_fired", self.owner);
    var_45b8a1e894f0e1f3 endon("scramble_fired");
    var_45b8a1e894f0e1f3 endon("death");
    var_45b8a1e894f0e1f3 thread namespace_f88f890445eec227::heli_targeting();
    var_45b8a1e894f0e1f3.scrambled = 1;
    var_45b8a1e894f0e1f3.secondowner = self.owner;
    var_45b8a1e894f0e1f3 notify("findNewTarget");
    wait(30);
    if (isdefined(var_45b8a1e894f0e1f3)) {
        var_45b8a1e894f0e1f3.scrambled = 0;
        var_45b8a1e894f0e1f3.secondowner = undefined;
        var_45b8a1e894f0e1f3 thread namespace_f88f890445eec227::heli_targeting();
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5275
// Size: 0x9b
function scramble_watchlineofsight() {
    level endon("game_ended");
    self endon("death");
    while (isdefined(self.scrambletargetent) && isdefined(self getturrettarget(1)) && self getturrettarget(1) == self.scrambletargetent) {
        var_446576956fc59f64 = self gettagorigin("tag_laser");
        if (!sighttracepassed(var_446576956fc59f64, self.scrambletargetent.origin, 0, self, self.scrambletargetent)) {
            self cleartargetentity();
            self.scrambletargetent = undefined;
            break;
        }
        wait(0.05);
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5317
// Size: 0x66
function scramble_watchlaser() {
    self endon("death");
    self laseron();
    self.laser_on = 1;
    while (isdefined(self.scrambletargetent) && isdefined(self getturrettarget(1)) && self getturrettarget(1) == self.scrambletargetent) {
        wait(0.05);
    }
    self laseroff();
    self.laser_on = 0;
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5384
// Size: 0x52
function scramble_watchcrashing() {
    self endon("death");
    self.scrambletargetent endon("death");
    if (!isdefined(self.scrambletargetent.helitype)) {
        return;
    }
    self.scrambletargetent waittill("crashing");
    self cleartargetentity();
    self.scrambletargetent = undefined;
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x53dd
// Size: 0x6e
function scramble_watchleaving() {
    self endon("death");
    self.scrambletargetent endon("death");
    if (!isdefined(self.scrambletargetent.model)) {
        return;
    }
    if (self.scrambletargetent.model == "vehicle_uav_static_mp") {
        self.scrambletargetent waittill("leaving");
        self cleartargetentity();
        self.scrambletargetent = undefined;
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5452
// Size: 0xcd
function sentryshocktargets() {
    self endon("death");
    self endon("carried");
    level endon("game_ended");
    thread watchsentryshockpickup();
    self.airlookatent = spawn_tag_origin(self.origin, self.angles);
    self.airlookatent linkto(self, "tag_flash");
    while (1) {
        result = waittill_any_timeout_1(1, "turret_on_target");
        if (result == "timeout") {
            continue;
        }
        self.sentryshocktargetent = self getturrettarget(1);
        if (isdefined(self.sentryshocktargetent) && isreallyalive(self.sentryshocktargetent)) {
            thread shocktarget(self.sentryshocktargetent);
            self waittill("done_firing");
        }
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5526
// Size: 0x22c
function searchforshocksentryairtarget() {
    if (isdefined(level.uavmodels)) {
        if (level.teambased) {
            var_b0c33d224b825287 = getenemyteams(self.owner.team);
            foreach (entry in var_b0c33d224b825287) {
                foreach (uav in level.uavmodels[entry]) {
                    if (targetvisibleinfront(uav)) {
                        return uav;
                    }
                }
            }
        } else {
            foreach (uav in level.uavmodels) {
                if (uav.owner == self.owner) {
                    continue;
                }
                if (targetvisibleinfront(uav)) {
                    return uav;
                }
            }
        }
    }
    if (isdefined(level.helis)) {
        foreach (heli in level.helis) {
            if (heli.streakname != "jackal") {
                continue;
            }
            if (level.teambased && heli.team == self.owner.team) {
                continue;
            }
            if (!level.teambased && heli.owner == self.owner) {
                continue;
            }
            if (targetvisibleinfront(heli)) {
                return heli;
            }
        }
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5759
// Size: 0x10d
function targetvisibleinfront(target) {
    if (!isdefined(target)) {
        return 0;
    }
    infront = 0;
    var_27653c8c1efd30b7 = self gettagorigin("tag_flash");
    targetpos = target.origin;
    var_11b27b4cc48cd1f4 = vectornormalize(targetpos - var_27653c8c1efd30b7);
    attackerforward = anglestoforward(self.angles);
    ignorelist = [0:self, 1:self.owner, 2:target];
    contents = physics_createcontents([0:"physicscontents_clipshot", 1:"physicscontents_glass", 2:"physicscontents_water", 3:"physicscontents_vehicle", 4:"physicscontents_item"]);
    if (ray_trace_passed(var_27653c8c1efd30b7, targetpos, ignorelist, contents) && vectordot(attackerforward, var_11b27b4cc48cd1f4) > 0.25 && distance2dsquared(var_27653c8c1efd30b7, targetpos) > 10000) {
        infront = 1;
    }
    return infront;
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x586e
// Size: 0x20f
function shootshocksentrysamtarget(target, var_bea243c252114a9c) {
    self endon("death");
    self endon("carried");
    level endon("game_ended");
    self setmode("manual");
    thread setshocksamtargetent(target, var_bea243c252114a9c);
    self.sentryshocksamtarget = undefined;
    self waittill("turret_on_target");
    thread marktargetlaser(target);
    self playsound("shock_sentry_charge_up");
    playfxontag(getfx("sentry_shock_charge"), self, "tag_laser");
    sentry_spinup();
    stopfxontag(getfx("sentry_shock_charge"), self, "tag_laser");
    self notify("start_firing");
    self setscriptablepartstate("coil", "active");
    firedelay = 2;
    var_89c026c489ddc1e3 = 1;
    while (isdefined(target) && targetvisibleinfront(target)) {
        var_27653c8c1efd30b7 = self gettagorigin("tag_flash");
        var_bcfeef729656e635 = _magicbullet(makeweapon("sentry_shock_missile_mp"), var_27653c8c1efd30b7, target.origin, self.owner);
        var_bcfeef729656e635 missile_settargetent(target);
        var_bcfeef729656e635 missile_setflightmodedirect();
        var_bcfeef729656e635.killcament = self.killcament;
        var_bcfeef729656e635.streakinfo = self.streakinfo;
        self setscriptablepartstate("muzzle", "fire" + var_89c026c489ddc1e3, 0);
        level notify("laserGuidedMissiles_incoming", self.owner);
        var_89c026c489ddc1e3++;
        if (var_89c026c489ddc1e3 > 2) {
            var_89c026c489ddc1e3 = 1;
        }
        wait(firedelay);
    }
    self setscriptablepartstate("muzzle", "neutral", 0);
    self notify("sentry_lost_target");
    var_bea243c252114a9c unlink();
    var_bea243c252114a9c.origin = self gettagorigin("tag_flash");
    var_bea243c252114a9c linkto(self, "tag_flash");
    self setmode("sentry");
    self cleartargetentity();
    self setscriptablepartstate("coil", "idle");
    sentry_spindown();
    self notify("done_firing");
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5a84
// Size: 0x4a
function sentry_handlemanualuse() {
    self endon("death");
    level endon("game_ended");
    while (1) {
        player = self waittill("trigger");
        while (player isusingturret()) {
            if (player attackbuttonpressed()) {
                self shootturret();
            }
            waitframe();
        }
        waitframe();
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5ad5
// Size: 0x155
function sentry_handlealteratepickup(var_508482f603c6293e) {
    self endon("death");
    self.owner endon("disconnect");
    level endon("game_ended");
    self.owner notifyonplayercommand("maunal_sentry_pickup", "+weapnext");
    self.manualpickuptrigger = spawn("trigger_radius", self.origin, 0, 128, 128);
    self.manualpickuptrigger enablelinkto();
    self.manualpickuptrigger linkto(self, "tag_origin");
    while (1) {
        if (isdefined(self.carriedby)) {
            waitframe();
        }
        if (!self.owner istouching(self.manualpickuptrigger)) {
            waitframe();
        }
        self.owner waittill("maunal_sentry_pickup");
        /#
            assert(!isdefined(self.carriedby));
        #/
        self setmode(level.sentrysettings[self.sentrytype].sentrymodeoff);
        self.owner.placedsentries[self.sentrytype] = array_remove(self.owner.placedsentries[self.sentrytype], self);
        self.owner setcarryingsentry(self, 0, var_508482f603c6293e);
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5c31
// Size: 0x37
function function_edb5f98849f3a4d6() {
    /#
        self endon("+actionslot 4");
        while (1) {
            sphere(self.origin, 50, (0, 1, 0), 0, 20);
            waitframe();
        }
    #/
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x5c6f
// Size: 0xb5
function setshocksamtargetent(target, var_bea243c252114a9c) {
    self endon("death");
    self endon("carried");
    self endon("sentry_lost_target");
    target endon("death");
    level endon("game_ended");
    while (1) {
        startpoint = self gettagorigin("tag_aim");
        endpoint = target.origin;
        var_734a884df1a36225 = vectornormalize(endpoint - startpoint);
        var_180854261168edda = startpoint + var_734a884df1a36225 * 500;
        var_bea243c252114a9c unlink();
        var_bea243c252114a9c.origin = var_180854261168edda;
        var_bea243c252114a9c linkto(self);
        self settargetentity(var_bea243c252114a9c);
        waitframe();
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5d2b
// Size: 0x4f
function watchsentryshockpickup() {
    self endon("death");
    while (1) {
        self waittill("carried");
        if (isdefined(self.sentryshocktargetent)) {
            self.sentryshocktargetent = undefined;
        }
        if (isdefined(self.sentryshocksamtarget)) {
            self.sentryshocksamtarget = undefined;
        }
        self cleartargetentity();
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5d81
// Size: 0xf2
function shocktarget(target) {
    self endon("death");
    self endon("carried");
    if (!isdefined(target)) {
        return;
    }
    thread marktargetlaser(target);
    self playsound("shock_sentry_charge_up");
    sentry_spinup();
    self notify("start_firing");
    level thread namespace_25c5a6f43bb97b43::saytoself(target, "plr_killstreak_target");
    firetime = weaponfiretime(level.sentrysettings[self.sentrytype].weaponinfo);
    while (isdefined(target) && isreallyalive(target) && isdefined(self getturrettarget(1)) && self getturrettarget(1) == target && !outlineoccluded(self gettagorigin("tag_flash"), target geteye())) {
        self shootturret();
        wait(firetime);
    }
    self.sentryshocktargetent = undefined;
    self cleartargetentity();
    sentry_spindown();
    self notify("done_firing");
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5e7a
// Size: 0xf9
function missileburstfire(target) {
    self endon("death");
    self endon("carried");
    var_c8cc9e14cbc6c616 = 3;
    var_89c026c489ddc1e3 = 1;
    while (var_c8cc9e14cbc6c616 > 0) {
        if (!isdefined(target)) {
            return;
        }
        if (!isdefined(self.owner)) {
            return;
        }
        var_261af406ee6924ea = _magicbullet(makeweapon("sentry_shock_grenade_mp"), self gettagorigin("tag_flash"), target.origin, self.owner);
        var_261af406ee6924ea missile_settargetent(target, gettargetoffset(target));
        var_261af406ee6924ea.killcament = self.killcament;
        var_261af406ee6924ea.streakinfo = self.streakinfo;
        self setscriptablepartstate("muzzle", "fire" + var_89c026c489ddc1e3, 0);
        var_89c026c489ddc1e3++;
        if (var_89c026c489ddc1e3 > 2) {
            var_89c026c489ddc1e3 = 1;
        }
        var_261af406ee6924ea thread watchtargetchange(target);
        var_c8cc9e14cbc6c616--;
        wait(0.2);
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5f7a
// Size: 0x99
function gettargetoffset(target) {
    heightoffset = (0, 0, 40);
    var_e8be66aec958de65 = target getstance();
    switch (var_e8be66aec958de65) {
    case #"hash_c6775c88e38f7803":
        heightoffset = (0, 0, 40);
        break;
    case #"hash_3fed0cbd303639eb":
        heightoffset = (0, 0, 20);
        break;
    case #"hash_d91940431ed7c605":
        heightoffset = (0, 0, 5);
        break;
    }
    return heightoffset;
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x601b
// Size: 0x3d
function watchtargetchange(target) {
    self endon("death");
    target endon("disconnect");
    while (1) {
        if (!isreallyalive(target)) {
            self missile_settargetent(target getcorpseentity());
            break;
        }
        waitframe();
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x605f
// Size: 0x47
function marktargetlaser(target) {
    self endon("death");
    self laseron();
    self.laser_on = 1;
    waittill_any_2("done_firing", "carried");
    self laseroff();
    self.laser_on = 0;
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x60ad
// Size: 0x1f0
function watchshockdamage(target) {
    self endon("death");
    self endon("done_firing");
    triggerradius = undefined;
    while (1) {
        psoffsettime = shitloc = vdir = vpoint = objweapon = smeansofdeath = idflags = idamage = einflictor = victim = self waittill("victim_damaged");
        if (victim == target) {
            damageradius = 100;
            var_b959b266290f9e13 = getplayersinradiusview(vpoint, damageradius, victim.team, self.owner);
            playfx(getfx("sentry_shock_explosion"), vpoint);
            if (var_b959b266290f9e13.size > 0) {
                foreach (info in var_b959b266290f9e13) {
                    if (info.player != victim) {
                        info.player dodamage(5, vpoint, self.owner, self, smeansofdeath, objweapon);
                        var_879997a46f725f30 = undefined;
                        randomindex = undefined;
                        if (info.visiblelocations.size > 1) {
                            randomindex = randomint(info.visiblelocations.size);
                            var_879997a46f725f30 = info.visiblelocations[randomindex];
                        } else {
                            var_879997a46f725f30 = info.visiblelocations[0];
                        }
                        playfxbetweenpoints(getfx("sentry_shock_arc"), vpoint, vectortoangles(var_879997a46f725f30 - vpoint), var_879997a46f725f30);
                    }
                }
            }
        }
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x62a4
// Size: 0x41
function allowweaponsforsentry(allow) {
    if (allow) {
        val::function_c9d0b43701bdba00("sentry_weapons");
        thread namespace_85d036cb78063c4a::unstowsuperweapon();
    } else {
        thread namespace_85d036cb78063c4a::allowsuperweaponstow();
        val::set("sentry_weapons", "weapon", 0);
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x62ec
// Size: 0x4d
function placehinton() {
    sentrytype = self.sentrytype;
    if (sentrytype == "super_trophy") {
        self.owner forceusehinton("LUA_MENU_MP/PLACE_SUPER_TROPHY");
        return;
    } else {
        self.owner forceusehinton("SENTRY/PLACE");
    }
}

// Namespace namespace_df66bd377221e9b5/namespace_d3164761cc58a612
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6340
// Size: 0x4d
function cannotplacehinton() {
    sentrytype = self.sentrytype;
    if (sentrytype == "super_trophy") {
        self.owner forceusehinton("LUA_MENU_MP/CANNOT_PLACE_SUPER_TROPHY");
        return;
    } else {
        self.owner forceusehinton("SENTRY/CANNOT_PLACE");
    }
}

