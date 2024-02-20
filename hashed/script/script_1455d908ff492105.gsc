// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\shellshock_utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using script_3db04fd1b466bdba;
#using script_58be75c518bf0d40;
#using script_3b64eb40368c1450;
#using scripts\mp\utility\script.gsc;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using script_736dec95a49487a6;
#using scripts\cp_mp\killstreaks\manual_turret.gsc;
#using scripts\cp_mp\hostmigration.gsc;
#using scripts\cp_mp\utility\train_utility.gsc;
#using scripts\mp\spawnlogic.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\math.gsc;
#using scripts\cp_mp\entityheadicons.gsc;

#namespace remote_turret;

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0xc16
// Size: 0x19
function autoexec main() {
    function_df7ab5b0f898e8bc(function_1823ff50bb28148d("remote_turret"), &init);
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc36
// Size: 0x86
function private init() {
    if (issharedfuncdefined("remote_turret", "init")) {
        [[ getsharedfunc("remote_turret", "init") ]]();
    }
    if (issharedfuncdefined("remote_turret", "initSentrySettings")) {
        [[ getsharedfunc("remote_turret", "initSentrySettings") ]]();
    }
    registervisibilityomnvarforkillstreak("remote_turret", "on", 16);
    /#
        setdevdvarifuninitialized(@"hash_c9bd691ce96079ac", 0);
        setdevdvarifuninitialized(@"hash_e19e5d308effeda3", 1);
    #/
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcc3
// Size: 0x29
function function_cf9f8b598647e363(streakinfo, var_41bf9bf4918115ac, weaponobj) {
    if (!istrue(var_41bf9bf4918115ac)) {
        namespace_b3d24e921998a8b::getridofkillstreakdeployweapon(weaponobj);
    }
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xcf3
// Size: 0x26
function function_3149fdf577104365(streakname) {
    streakinfo = createstreakinfo(streakname, self);
    return function_c916c5b82db1290(streakinfo);
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd21
// Size: 0x261
function function_c916c5b82db1290(streakinfo) {
    level endon("game_ended");
    self endon("disconnect");
    if (isdefined(level.killstreaktriggeredfunc)) {
        if (!level [[ level.killstreaktriggeredfunc ]](streakinfo)) {
            self.bgivensentry = 0;
            return 0;
        }
    }
    namespace_d325722f2754c2c4::saveweaponstates();
    endonnotify = "sentry_placement_failed";
    weaponobj = makeweapon("deploy_remote_turret_mp");
    if (issharedfuncdefined("weapons", "watchForPlacementFireState")) {
        self thread [[ getsharedfunc("weapons", "watchForPlacementFireState") ]](streakinfo, endonnotify, weaponobj);
    }
    var_9b1deb5e9d32bbe3 = namespace_b3d24e921998a8b::streakdeploy_doweaponswitchdeploy(streakinfo, weaponobj, 1, undefined, undefined, &function_cf9f8b598647e363);
    if (!istrue(var_9b1deb5e9d32bbe3)) {
        self.bgivensentry = 0;
        self notify(endonnotify);
        return 0;
    }
    if (isdefined(level.killstreakbeginusefunc)) {
        if (!level [[ level.killstreakbeginusefunc ]](streakinfo)) {
            self.bgivensentry = 0;
            return 0;
        }
    }
    turret = function_ff68719c4aed211e("remote_turret", streakinfo);
    if (!isdefined(turret)) {
        self.bgivensentry = 0;
        return 0;
    }
    marker = function_302dac858d0c3cf4(turret, streakinfo, 0, 1.25);
    if (!isdefined(marker)) {
        turret delete();
        self.bgivensentry = 0;
        return 0;
    }
    turret namespace_5a51aa78ea0b1b9f::set_start_emp_callback(&function_58cc23bccf168a2d);
    turret namespace_5a51aa78ea0b1b9f::set_clear_emp_callback(&function_aef483ef5ed5cff4);
    turret namespace_b6b4a3ac458ab6e2::function_172d848d58051fdf(&function_cc47405c2cd435e);
    turret namespace_b6b4a3ac458ab6e2::function_aa823a31304ed981(&function_fe21c57503ab070f);
    if (issharedfuncdefined("emp", "setEMP_Applied_Callback")) {
        turret [[ getsharedfunc("emp", "setEMP_Applied_Callback") ]](&function_371131da10a20bb);
    }
    if (issharedfuncdefined("emp", "setEMP_Cleared_Callback")) {
        turret [[ getsharedfunc("emp", "setEMP_Cleared_Callback") ]](&function_958fed8d4d1143fa);
    }
    turret function_a6f142a3e83c312e(self);
    turret function_e68434bdb941ed1e(turret.streakinfo.streakname, self, "KILLSTREAKS_HINTS/REMOTE_TURRET_USE", 1);
    turret.useobj setuseholdduration(500);
    function_688e15aadc8b2663(turret, marker);
    if (issharedfuncdefined("remote_turret", "munitionUsed")) {
        self [[ getsharedfunc("remote_turret", "munitionUsed") ]]();
    }
    thread function_3da5b516d6b9a223(turret);
    self.var_3b28db27cbdbc523 = 1;
    return 1;
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf8a
// Size: 0x6b
function function_a6f142a3e83c312e(owner) {
    if (!isdefined(owner) || !isdefined(owner.var_c112b4aeaf6ce9ae)) {
        return;
    }
    if (isdefined(owner.var_c112b4aeaf6ce9ae[self.streakinfo.streakname])) {
        owner.var_c112b4aeaf6ce9ae[self.streakinfo.streakname] delete();
    }
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xffc
// Size: 0x61
function function_3da5b516d6b9a223(turret) {
    self endon("disconnect");
    turret endon("death");
    while (1) {
        waittill_any_3("killstreakActionCalled", "super_started", "assaultDroneCalled");
        val::set("remote_turret", "usability", 0);
        wait(2);
        val::reset("remote_turret", "usability");
    }
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1064
// Size: 0x13c
function function_302dac858d0c3cf4(turret, streakinfo, var_6152d24062d26039, var_290b1442271ab369) {
    self.bgivensentry = 1;
    thread function_654def657f4f961(var_290b1442271ab369);
    marker = undefined;
    if (issharedfuncdefined("remote_turret", "watchForPlayerEnteringLastStand")) {
        self thread [[ getsharedfunc("remote_turret", "watchForPlayerEnteringLastStand") ]]();
    }
    if (issharedfuncdefined("remote_turret", "getTargetMarker")) {
        marker = self [[ getsharedfunc("remote_turret", "getTargetMarker") ]](streakinfo, var_6152d24062d26039);
    }
    self notify("turret_placement_finished");
    if (!isdefined(marker) || !isdefined(marker.location)) {
        if (namespace_f8065cafc523dba5::_isalive()) {
            function_8608f39517786dab("deploy_remote_turret_mp");
        }
        return undefined;
    }
    turret thread namespace_ac45d22648d4adff::manualturret_disablefire(self, 1, 1);
    if (self hasweapon("deploy_remote_turret_mp")) {
        thread function_8608f39517786dab("deploy_remote_turret_mp", 1, 1);
    }
    var_85cda42514dc11d2 = 0.85;
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(var_85cda42514dc11d2);
    params = spawnstruct();
    params.player = self;
    callback::callback("remote_turret_deployed", params);
    return marker;
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11a8
// Size: 0x51
function function_654def657f4f961(delaytime) {
    self endon("death_or_disconnect");
    self endon("turret_placement_finished");
    level endon("game_ended");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(delaytime);
    self setclientomnvar("ui_turret_placement", 1);
    thread namespace_ac45d22648d4adff::manualturret_clearplacementinstructions("death");
    thread namespace_ac45d22648d4adff::manualturret_clearplacementinstructions("turret_placement_finished");
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1200
// Size: 0x427
function function_ff68719c4aed211e(turrettype, streakinfo) {
    config = level.sentrysettings[turrettype];
    turret = spawnturret("misc_turret", self.origin, level.sentrysettings[turrettype].weaponinfo);
    turret.owner = self;
    turret.team = self.team;
    turret.angles = self.angles;
    turret.health = 9999;
    turret.maxhealth = config.maxhealth;
    turret.streakinfo = streakinfo;
    turret.turrettype = turrettype;
    turret.shouldsplash = 1;
    turret.ammocount = config.ammo;
    turret.timeout = config.timeout;
    turret.var_de4dbbca9f355800 = 0;
    if (issharedfuncdefined("remote_turret", "attachXRays")) {
        turret = [[ getsharedfunc("remote_turret", "attachXRays") ]](turret);
    }
    /#
        var_2a98d1683cf44153 = getdvarint(@"hash_2c01d701bac5d9d3", 0);
        if (var_2a98d1683cf44153) {
            turret.timeout = 9999;
        } else if (function_ec3aea190c440d29(@"hash_d17291ec1b4e806e")) {
            turret.timeout = getdvarint(@"hash_d17291ec1b4e806e");
        }
    #/
    if (!isdefined(turret.timeout)) {
        turret.timeout = 120;
    }
    turret.var_b4b2742fd2768cb8 = turret.timeout;
    turret.carriedby = self;
    turret function_20db11c0f7f046c1("placed");
    turret setturretowner(turret.owner);
    turret setturretteam(turret.team);
    turret makeunusable();
    turret setnodeploy(1);
    turret setdefaultdroppitch(0);
    turret hide();
    turret setautorotationdelay(0.2);
    turret.momentum = 0;
    turret.heatlevel = 0;
    turret.overheated = 0;
    turret.cooldownwaittime = 0.1;
    switch (turrettype) {
    case #"hash_ab5712e297cd430e":
    default:
        turret setleftarc(80);
        turret setrightarc(80);
        turret setbottomarc(50);
        turret settoparc(60);
        turret setconvergencetime(0.6, "pitch");
        turret setconvergencetime(0.6, "yaw");
        turret setconvergenceheightpercent(0.65);
        turret setdefaultdroppitch(-89);
        break;
    }
    turret setturretmodechangewait(1);
    turret namespace_5a51aa78ea0b1b9f::allow_emp(0);
    var_d3dc97c59992d51 = anglestoforward(turret.angles);
    var_a8ae5e047a5b6cb6 = turret gettagorigin("tag_barrel") + (0, 0, 10);
    var_a8ae5e047a5b6cb6 = var_a8ae5e047a5b6cb6 - var_d3dc97c59992d51 * 20;
    killcament = spawn("script_model", var_a8ae5e047a5b6cb6);
    killcament linkto(turret);
    turret.killcament = killcament;
    turret.colmodel = spawn("script_model", turret.origin);
    turret.colmodel.team = turret.team;
    turret.colmodel.owner = turret.owner;
    turret.colmodel setmodel("wm_jup_2h_remote_turret_00_invis_base");
    turret.colmodel dontinterpolate();
    turret.colmodel hide();
    turret function_9553839f6b149375();
    return turret;
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x162f
// Size: 0x734
function function_688e15aadc8b2663(turret, marker) {
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["remote_turret"];
    config = level.sentrysettings[turret.turrettype];
    turret function_20db11c0f7f046c1("placed");
    if (!isdefined(self.placedsentries)) {
        self.placedsentries = [];
    }
    if (!isdefined(self.placedsentries[turret.turrettype])) {
        self.placedsentries[turret.turrettype] = [];
    }
    if (istrue(turret.shouldsplash)) {
        if (issharedfuncdefined("sound", "playKillstreakDeployDialog")) {
            [[ getsharedfunc("sound", "playKillstreakDeployDialog") ]](self, turret.streakinfo.streakname);
        }
        splashname = config.teamsplash;
        if (issharedfuncdefined("hud", "teamPlayerCardSplash")) {
            level thread [[ getsharedfunc("hud", "teamPlayerCardSplash") ]](splashname, self);
        }
        turret.shouldsplash = 0;
    }
    turret show();
    turret dontinterpolate();
    turret.angles = marker.angles;
    turret.carriedby = undefined;
    if (isdefined(marker.moving_platform)) {
        turret.moving_platform = marker.moving_platform;
        turret.moving_platform_offset = marker.moving_platform_offset;
        turret.moving_platform_angles_offset = marker.moving_platform_angles_offset;
    }
    self.bgivensentry = 0;
    turret.origin = marker.location;
    turret setscriptablepartstate("turret_carry_state", "turret_plant");
    turret setscriptablepartstate("lights", "daytime", 0);
    turret.colmodel show();
    turret.colmodel.angles = turret.angles;
    turret.colmodel.origin = turret.origin;
    turret.colmodel linkto(turret);
    var_f96e4256f03c5f42 = bundle.minimapicon;
    if (issharedfuncdefined("game", "createObjective")) {
        turret.minimapid = turret.colmodel [[ getsharedfunc("game", "createObjective") ]](var_f96e4256f03c5f42, turret.team, undefined, 1, 1);
    }
    var_11d7f05662df0482 = self.placedsentries[turret.turrettype].size;
    if (var_11d7f05662df0482 + 1 > 1) {
        self.placedsentries[turret.turrettype][0] notify("kill_turret", 0);
    }
    headiconoffset = 70;
    if (issharedfuncdefined("killstreak", "addToActiveKillstreakList")) {
        turret [[ getsharedfunc("killstreak", "addToActiveKillstreakList") ]](turret.turrettype, "Killstreak_Ground", self, 0, 1, headiconoffset, "carried");
    }
    turret setmode(level.sentrysettings[turret.turrettype].sentrymodeon);
    var_5e8eb3c31f9c265c = "tag_aim_pivot";
    var_963953c3478bf4fe = turret gettagorigin(var_5e8eb3c31f9c265c);
    if (!isdefined(turret.useownerobj)) {
        if (issharedfuncdefined("remote_turret", "createHintObject")) {
            turret.useownerobj = [[ getsharedfunc("remote_turret", "createHintObject") ]](var_963953c3478bf4fe, "HINT_BUTTON", undefined, config.ownerusehintstring, undefined, undefined, "show");
        }
    } else {
        var_963953c3478bf4fe = turret gettagorigin(var_5e8eb3c31f9c265c);
        turret.useownerobj function_dfb78b3e724ad620(1);
        turret.useownerobj dontinterpolate();
        turret.useownerobj.origin = var_963953c3478bf4fe;
    }
    turret.useownerobj linkto(turret, var_5e8eb3c31f9c265c);
    foreach (guy in level.players) {
        if (guy != turret.owner) {
            turret.useownerobj disableplayeruse(guy);
        }
    }
    turret thread function_691b0d98100b44cd();
    if (issharedfuncdefined("game", "handlemovingplatforms")) {
        data = spawnstruct();
        data.deathoverridecallback = &function_3eccd3cd75317e53;
        if (isdefined(turret.moving_platform)) {
            data.linkparent = turret.moving_platform;
            data.linkoffset = turret.moving_platform_offset;
            data.angleoffset = turret.moving_platform_angles_offset;
            if (isdefined(level.wztrain_info) && namespace_9db09f982acd35b4::is_train_ent(turret.moving_platform)) {
                data.var_49cb2c45d3230ed8 = 1;
            }
        }
        turret thread [[ getsharedfunc("game", "handlemovingplatforms") ]](data);
    }
    turret namespace_5a51aa78ea0b1b9f::allow_emp(1);
    if (issharedfuncdefined("game", "registerSentient")) {
        turret [[ getsharedfunc("game", "registerSentient") ]]("Killstreak_Static", self);
    }
    if (!istrue(turret.owner.var_65219c911f198c95)) {
        turret function_66a63d2003156721();
        turret thread function_3bb43305bf56bfec(undefined, self);
    }
    /#
        turret thread function_1223f321ae6ff9a5();
    #/
    turret thread function_2c51e186f21ecfae();
    function_3650adfd6e0d1fb9(namespace_9abe40d2af041eb2::function_13276a05f9b52006("remote_turret"));
    function_ca5bd9a5609d8ba3();
    thread function_e4b89077ed169ef8(turret, marker);
    thread function_839405550006f5b9(turret);
    thread function_80ff81904f57cb37(turret, turret.useownerobj);
    if (!istrue(turret.owner.var_65219c911f198c95)) {
        thread function_2bd5e2012f429ae3(turret);
    }
    thread function_3b0cd265e614031a(turret);
    if (!istrue(turret.var_3c6ebafa9ae6ede3)) {
        thread function_24b36e1359ab805c(turret);
    }
    thread function_7a35c7c95b25b0e9(turret);
    thread function_1ad21168e3b8db0c(turret);
    thread function_cfb4701398c755b5(turret);
    thread function_40906ee89de6f708(turret);
    turret function_13a319439a116d2(self);
    turret.isplaced = 1;
    self.placedsentries[turret.turrettype][var_11d7f05662df0482] = turret;
    turret notify("turret_place_successful");
    turret function_a226c5202cb23d6();
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d6a
// Size: 0x6d
function function_a226c5202cb23d6() {
    if (istrue(level.dangerzoneskipequipment)) {
        return;
    }
    if (isdefined(self.dangerzone)) {
        namespace_b2d5aa2baf2b5701::removespawndangerzone(self.dangerzone);
    }
    self.dangerzone = namespace_b2d5aa2baf2b5701::addspawndangerzone(self.origin, 500, 350, self.owner.team, undefined, self.owner, 0, self, 1);
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1dde
// Size: 0x51
function function_3650adfd6e0d1fb9(killstreakid) {
    /#
        assertex(isdefined(killstreakid), "remote_turret.gsc: Killstreak Use Widget tried to show without a killstreakID reference");
    #/
    if (killstreakid == 0) {
        self setclientomnvar("ui_killstreak_use_widget", killstreakid);
        self.var_57d85036ea10552d = undefined;
        return;
    }
    self setclientomnvar("ui_killstreak_use_widget", killstreakid);
    self.var_57d85036ea10552d = killstreakid;
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e36
// Size: 0xed
function function_691b0d98100b44cd() {
    self notify("end_remote_monitor");
    self endon("end_remote_monitor");
    self endon("death");
    self endon("kill_turret");
    self endon("carried");
    level endon("game_ended");
    self.useobj enableplayeruse(self.owner);
    var_20eb2097521ffaed = 0;
    while (1) {
        if (istrue(self.owner utility::isusingremote()) && !var_20eb2097521ffaed && self.owner.usingremote != "remote_turret") {
            self.useobj disableplayeruse(self.owner);
            var_20eb2097521ffaed = 1;
        } else if (var_20eb2097521ffaed && !istrue(self.owner utility::isusingremote())) {
            wait(1);
            self.useobj enableplayeruse(self.owner);
            var_20eb2097521ffaed = 0;
        }
        wait(0.1);
    }
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f2a
// Size: 0x2db
function function_2bd5e2012f429ae3(turret) {
    self endon("remote_turret_empd");
    turret endon("remote_turret_death");
    turret endon("remote_turret_ownerDeath");
    turret endon("kill_turret");
    turret endon("carried");
    player = turret.useobj waittill("trigger");
    if (istrue(turret.isplaced) && !istrue(turret.owner.var_65219c911f198c95) && !istrue(utility::isusingremote()) && !self isswimming()) {
        self.var_6678ccff9684345e = 1;
        self disableweaponswitch();
        if (istrue(turret.var_e42f0fcd6e0c1153)) {
            turret stopbarrelspin();
            turret.var_e42f0fcd6e0c1153 = undefined;
        }
        val::set("remote_turret", "allow_movement", 0);
        val::set("remote_turret", "usability", 0);
        val::set("remote_turret", "killstreaks", 0);
        val::set("remote_turret", "supers", 0);
        val::set("remote_turret", "reload", 0);
        val::set("remote_turret", "offhand_weapons", 0);
        val::set("remote_turret", "melee", 0);
        turret setscriptablepartstate("turret_mode", "turret_mode_pre_manual");
        turret function_361d73970f697d6a();
        turret thread function_b7ffbe66f2c448fc();
        turret thread function_13a319439a116d2(self);
        thread function_ca5bd9a5609d8ba3();
        turret setmode("sentry_offline");
        turret notify("enterRemote");
        turret thread function_9cc5ca1b073338ab(self);
        thread function_a920f20104777b97(turret, turret.var_de4dbbca9f355800);
        /#
            function_45456bb78fa8eb2d("placed");
        #/
        function_baa645fe416db1d5(turret);
        /#
            function_45456bb78fa8eb2d("handlemovingplatforms");
        #/
        if (!istrue(turret.var_de4dbbca9f355800)) {
            wait(2);
            turret.var_de4dbbca9f355800 = 1;
        } else {
            wait(1);
        }
        /#
            if (getdvarint(@"hash_81827f5873d8d4c3", 0) == 1) {
                thread function_1f85068748abaa9b(turret);
            }
            function_45456bb78fa8eb2d("turret_mode_sentrytomanual_fadestart");
        #/
        thread function_478f159eb6d02ae8(turret);
        self waittill("remoteTurretFadeComplete");
        function_178aa80b91f36bf4();
        turret.var_ce4dc6c1d56eb0a9 = 1;
        self.usingremote = "remote_turret";
        turret notify("remote_enter");
        if (istrue(self.isjuggernaut)) {
            self notify("remote_enter");
        }
        turret setscriptablepartstate("turret_mode", "turret_mode_manual");
        turret setscriptablepartstate("lights", "remoted", 0);
        turret function_392e60623411ef42(self);
        self remotecontrolturret(turret);
        thread function_dc251dedf977c842(turret);
        val::reset("remote_turret", "allow_movement");
        self.var_6678ccff9684345e = undefined;
    }
    if (self isswimming()) {
        thread function_2bd5e2012f429ae3(turret);
    }
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x220c
// Size: 0x1e3
function function_a920f20104777b97(turret, var_de4dbbca9f355800) {
    level endon("game_ended");
    self endon("disconnect");
    var_df38b35b216fc51c = 0;
    result = waittill_any_ents_return(self, "remoteTurret_deployTabletFinished", self, "remote_turret_empd", turret, "remote_turret_death", turret, "kill_turret", turret, "carried");
    var_df38b35b216fc51c = !isdefined(result) || result != "remoteTurret_deployTabletFinished";
    if (!var_df38b35b216fc51c) {
        timeout = istrue(var_de4dbbca9f355800) ? 2 : 1;
        result = waittill_any_ents_or_timeout_return(timeout, self, "remote_turret_empd", turret, "remote_turret_death", turret, "kill_turret", turret, "carried");
        var_df38b35b216fc51c = !isdefined(result) || result != "timeout";
    }
    if (!var_df38b35b216fc51c) {
        var_c17ac30865717c64 = self waittill("remoteTurretFadeComplete");
        var_df38b35b216fc51c = !var_c17ac30865717c64;
    }
    if (var_df38b35b216fc51c) {
        /#
            function_45456bb78fa8eb2d("empStarted");
        #/
        function_178aa80b91f36bf4();
        currentweapon = self getcurrentweapon().basename;
        if (currentweapon == "ks_remote_device_mp") {
            _switchtoweapon(self.primaryweaponobj);
        }
        self enableweaponswitch();
        if (isdefined(turret.var_ac6546b5102546ae)) {
            self takeweapon(turret.var_ac6546b5102546ae);
            turret.var_ac6546b5102546ae = undefined;
        }
        val::reset("remote_turret", "allow_movement");
        val::reset("remote_turret", "usability");
        val::reset("remote_turret", "killstreaks");
        val::reset("remote_turret", "supers");
        val::reset("remote_turret", "reload");
        val::reset("remote_turret", "offhand_weapons");
        val::reset("remote_turret", "melee");
        self.usingremote = undefined;
    }
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23f6
// Size: 0x9f
function function_baa645fe416db1d5(turret) {
    turret endon("kill_turret");
    turret endon("remote_turret_death");
    weaponobj = makeweapon("ks_remote_device_mp");
    deployanim = script_model%vm_ks_tablet_tap_raise;
    _giveweapon(weaponobj, 0, 0, 1);
    turret.var_ac6546b5102546ae = weaponobj;
    var_41bf9bf4918115ac = domonitoredweaponswitch(weaponobj, 0);
    namespace_9abe40d2af041eb2::starttabletscreen(turret.streakinfo.streakname, 0);
    function_178aa80b91f36bf4();
    self notify("remoteTurret_deployTabletFinished");
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x249c
// Size: 0xf4
function function_478f159eb6d02ae8(turret) {
    level endon("game_ended");
    self endon("disconnect");
    if (_isalive()) {
        var_b1073e115b8f126a = turret getscriptablepartstate("turret_mode");
        if (var_b1073e115b8f126a == "turret_mode_manual") {
            turret setscriptablepartstate("turret_mode_fade", "turret_mode_manualtosentry_fadestart");
        } else {
            turret setscriptablepartstate("turret_mode_fade", "turret_mode_sentrytomanual_fadestart");
        }
        level thread namespace_36f464722d326bbe::fadetoblackforplayer(self, 1, 0.3);
        result = waittill_any_ents_or_timeout_return(0.7, self, "remote_turret_empd", turret, "remote_turret_death", self, "death", turret, "kill_turret", turret, "carried");
        var_c17ac30865717c64 = isdefined(result) && result == "timeout";
        if (!var_c17ac30865717c64) {
            turret namespace_448ccf1ca136fbbe::function_3677f2be30fdd581("turret_mode_fade", "turret_mode_sentrytomanual_fadeinterrupted");
        }
        level thread namespace_36f464722d326bbe::fadetoblackforplayer(self, 0, 0.3);
        self notify("remoteTurretFadeComplete", var_c17ac30865717c64);
    }
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2597
// Size: 0x1dc
function function_dc251dedf977c842(turret) {
    self endon("remote_turret_empd");
    turret endon("remote_turret_death");
    turret endon("kill_turret");
    turret endon("remote_turret_ownerDeath");
    turret endon("carried");
    childthread function_7317b5e0cedc533d(turret, 0.75);
    self waittill("remoteCamExit");
    if (istrue(turret.isplaced)) {
        turret stopbarrelspin();
        /#
            if (getdvarint(@"hash_8cb86e86af6483b0", 0) == 1) {
                thread function_1f85068748abaa9b(turret);
            }
        #/
        thread function_478f159eb6d02ae8(turret);
        self waittill("remoteTurretFadeComplete");
        self remotecontrolturretoff(turret);
        turret setmode("sentry");
        turret.var_ce4dc6c1d56eb0a9 = undefined;
        self.usingremote = undefined;
        turret notify("remote_exit");
        if (istrue(self.isjuggernaut)) {
            self notify("remote_exit");
        }
        turret setscriptablepartstate("turret_mode", "turret_mode_sentry");
        turret setscriptablepartstate("lights", "daytime", 0);
        turret function_13a319439a116d2(self);
        turret function_911cde43e0f3c6b6(self);
        _switchtoweapon(self.primaryweaponobj);
        self enableweaponswitch();
        turret thread function_3bb43305bf56bfec(undefined, self);
        wait(1);
        if (isdefined(turret.var_ac6546b5102546ae)) {
            self takeweapon(turret.var_ac6546b5102546ae);
            turret.var_ac6546b5102546ae = undefined;
        }
        val::reset("remote_turret", "allow_movement");
        val::reset("remote_turret", "usability");
        val::reset("remote_turret", "killstreaks");
        val::reset("remote_turret", "supers");
        val::reset("remote_turret", "reload");
        val::reset("remote_turret", "offhand_weapons");
        val::reset("remote_turret", "melee");
        thread function_2bd5e2012f429ae3(turret);
    }
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x277a
// Size: 0x109
function private function_7317b5e0cedc533d(turret, var_43b83976503b9e6d) {
    if (!isdefined(self) || !isdefined(turret)) {
        return;
    }
    level endon("game_ended");
    self endon("disconnect");
    self endon("end_remote");
    self endon("monitoringExit");
    turret endon("death");
    while (self usebuttonpressed()) {
        waitframe();
    }
    holdtime = 0.75;
    if (isdefined(var_43b83976503b9e6d)) {
        holdtime = var_43b83976503b9e6d;
    }
    updaterate = level.framedurationseconds;
    var_6a16936225a5a8ce = 1;
    while (1) {
        timeused = 0;
        if (var_6a16936225a5a8ce == 1) {
            self setclientomnvar("ui_exit_progress", 0);
            var_6a16936225a5a8ce = 0;
        }
        while (self usebuttonpressed()) {
            if (!self usinggamepad() && !self getuseholdkbmprofile()) {
                self notify("remoteCamExit");
                return;
            }
            timeused = timeused + updaterate;
            var_6a16936225a5a8ce = 1;
            self setclientomnvar("ui_exit_progress", timeused / holdtime);
            if (timeused > holdtime) {
                self notify("remoteCamExit");
                return;
            }
            wait(updaterate);
        }
        wait(updaterate);
    }
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x288a
// Size: 0x31
function function_fcf0bb8342007af(turret) {
    level endon("game_ended");
    self endon("disconnect");
    var_c17ac30865717c64 = self waittill("remoteTurretFadeComplete");
    if (!var_c17ac30865717c64) {
    }
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28c2
// Size: 0x2dc
function function_c35af9dc8b19b148(turret) {
    turret endon("kill_turret");
    self endon("death_or_disconnect");
    level endon("game_ended");
    if (getcompleteweaponname(self getcurrentweapon()) == "iw8_lm_dblmg_mp") {
        self notify("switched_from_minigun");
        while (getcompleteweaponname(self getcurrentweapon()) == "iw8_lm_dblmg_mp") {
            waitframe();
        }
    }
    if (isdefined(turret.moving_platform)) {
        turret.moving_platform = undefined;
        turret.moving_platform_offset = undefined;
        turret.moving_platform_angles_offset = undefined;
        turret unlink();
    }
    turret namespace_5a51aa78ea0b1b9f::allow_emp(0);
    if (issharedfuncdefined("game", "unregisterSentient")) {
        turret [[ getsharedfunc("game", "unregisterSentient") ]](turret.sentientpool, turret.sentientpoolindex);
    }
    var_e478ac91af0e92cb = turret getlinkedchildren();
    foreach (child in var_e478ac91af0e92cb) {
        if (isdefined(child)) {
            child unlink();
        }
    }
    if (isdefined(turret.minimapid)) {
        if (issharedfuncdefined("game", "returnObjectiveID")) {
            [[ getsharedfunc("game", "returnObjectiveID") ]](turret.minimapid);
        }
        turret.minimapid = undefined;
    }
    turret.colmodel unlink();
    turret.colmodel hide();
    function_fbce760dc23e09f(turret);
    turret hide();
    function_3650adfd6e0d1fb9(0);
    turret function_a6f142a3e83c312e(self);
    turret.carriedby = self;
    turret notify("carried");
    self playsound("kls_remote_turret_pickup");
    turret setscriptablepartstate("turret_carry_state", "turret_pickup");
    turret function_9cc5ca1b073338ab(self);
    thread function_ca5bd9a5609d8ba3();
    namespace_d325722f2754c2c4::saveweaponstates();
    endonnotify = "sentry_placement_failed";
    if (issharedfuncdefined("weapons", "watchForPlacementFireState")) {
        self thread [[ getsharedfunc("weapons", "watchForPlacementFireState") ]](turret.streakinfo, endonnotify);
    }
    _giveweapon("deploy_remote_turret_mp");
    namespace_df5cfdbe6e2d3812::_switchtoweapon("deploy_remote_turret_mp");
    namespace_ac45d22648d4adff::manualturret_toggleallowplacementactions(0);
    marker = function_302dac858d0c3cf4(turret, turret.streakinfo, 1, 2);
    namespace_ac45d22648d4adff::manualturret_toggleallowplacementactions(1);
    if (!isdefined(marker)) {
        return 0;
    }
    turret function_e68434bdb941ed1e(turret.streakinfo.streakname, self, "KILLSTREAKS_HINTS/REMOTE_TURRET_USE", 1);
    function_688e15aadc8b2663(turret, marker);
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ba5
// Size: 0x40
function function_7c80dd2c0c7ee701(var_eaf9953fb1b05ac6) {
    if (istrue(var_eaf9953fb1b05ac6)) {
        _switchtoweaponimmediate(self.lastdroppableweaponobj);
    } else {
        _switchtoweapon(self.lastdroppableweaponobj);
    }
    _takeweapon("deploy_remote_turret_mp");
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bec
// Size: 0x69
function function_fbce760dc23e09f(turret) {
    turret.isplaced = undefined;
    turret setdefaultdroppitch(30);
    turret setmode(level.sentrysettings[turret.turrettype].sentrymodeoff);
    turret.useownerobj function_dfb78b3e724ad620(0);
    turret.useownerobj unlink();
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c5c
// Size: 0x48
function function_e4b89077ed169ef8(turret, marker) {
    turret endon("kill_turret");
    level endon("game_ended");
    wait(0.25);
    if (isdefined(marker.visual)) {
        marker.visual delete();
    }
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cab
// Size: 0x58
function function_80ff81904f57cb37(turret, useobj) {
    if (isdefined(turret)) {
        turret endon("kill_turret");
        turret endon("carried");
    }
    self endon("disconnect");
    level endon("game_ended");
    while (1) {
        player = level waittill("connected");
        useobj disableplayeruse(player);
    }
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d0a
// Size: 0x133
function function_839405550006f5b9(turret) {
    turret endon("kill_turret");
    turret endon("carried");
    self endon("disconnect");
    level endon("game_ended");
    while (1) {
        player = turret.useownerobj waittill("trigger");
        if (player != turret.owner) {
            continue;
        }
        if (istrue(self.var_12bfb031c0a0efd8)) {
            continue;
        }
        if (issharedfuncdefined("remote_turret", "allowPickupOfTurret")) {
            if (!player [[ getsharedfunc("remote_turret", "allowPickupOfTurret") ]]()) {
                continue;
            }
        }
        turret.useownerobj function_dfb78b3e724ad620(0);
        turret setmode(level.sentrysettings[turret.turrettype].sentrymodeoff);
        turret.owner.placedsentries[turret.turrettype] = array_remove(turret.owner.placedsentries[turret.turrettype], turret);
        turret.owner thread function_c35af9dc8b19b148(turret);
        waitframe();
    }
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2e44
// Size: 0x5d
function function_9e8098735889a91c(turret) {
    turret endon("kill_turret");
    turret endon("carried");
    self endon("disconnect");
    level endon("game_ended");
    while (1) {
        player = level waittill("connected");
        player waittill("spawned_player");
        turret.useownerobj disableplayeruse(player);
    }
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2ea8
// Size: 0xdb
function function_60712857f1107040(turret) {
    turret endon("kill_turret");
    turret endon("carried");
    self endon("disconnect");
    level endon("game_ended");
    foreach (player in level.players) {
        if (level.teambased) {
            if (player.team != self.team) {
                continue;
            }
        } else if (player != self) {
            continue;
        }
    }
    thread function_7230352706ac17db(turret);
    while (1) {
        player = turret.dismantleobj waittill("trigger");
        turret notify("kill_turret", 0);
        break;
    }
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f8a
// Size: 0x5e
function function_24b36e1359ab805c(turret) {
    turret endon("kill_turret");
    turret endon("carried");
    self endon("disconnect");
    level endon("game_ended");
    if (issharedfuncdefined("remote_turret", "monitorDamage")) {
        self [[ getsharedfunc("remote_turret", "monitorDamage") ]](turret);
    }
    turret.var_3c6ebafa9ae6ede3 = 1;
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2fef
// Size: 0x72
function function_7230352706ac17db(turret) {
    turret endon("kill_turret");
    turret endon("carried");
    self endon("disconnect");
    level endon("game_ended");
    while (1) {
        player = level waittill("connected");
        player waittill("spawned_player");
        if (level.teambased) {
            if (player.team != self.team) {
                continue;
            }
        }
    }
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3068
// Size: 0x80
function function_58cc23bccf168a2d(data) {
    if (isdefined(data.attacker)) {
        if (issharedfuncdefined("player", "doScoreEvent")) {
            data.attacker thread [[ getsharedfunc("player", "doScoreEvent") ]]("disabled_sentry_gun");
        }
        if (issharedfuncdefined("remote_turret", "empStarted")) {
            self [[ getsharedfunc("remote_turret", "empStarted") ]]();
        }
    }
    function_66a63d2003156721();
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30ef
// Size: 0x3f
function function_aef483ef5ed5cff4(isdeath) {
    if (isdeath) {
        return;
    }
    if (issharedfuncdefined("remote_turret", "empStarted")) {
        self [[ getsharedfunc("remote_turret", "empCleared") ]]();
    }
    function_66a63d2003156721();
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3135
// Size: 0x29e
function function_371131da10a20bb(data) {
    if (isdefined(data.attacker)) {
        if (issharedfuncdefined("player", "doScoreEvent")) {
            data.attacker thread [[ getsharedfunc("player", "doScoreEvent") ]]("disabled_sentry_gun", undefined, undefined, undefined, undefined, undefined, undefined, undefined, undefined, 1);
        }
        if (issharedfuncdefined("remote_turret", "empStarted")) {
            self [[ getsharedfunc("remote_turret", "empStarted") ]]();
        }
    }
    if (isdefined(self.useobj)) {
        self.useobj disableplayeruse(self.useobj.owner);
        self.useobj.var_83b25e20c32fd3e9 = 0;
    }
    self.owner notify("stopSentryFire");
    self.owner notify("remote_turret_empd");
    if (istrue(self.var_e42f0fcd6e0c1153)) {
        self stopbarrelspin();
        self.var_e42f0fcd6e0c1153 = undefined;
    }
    self setmode("sentry_offline");
    self setscriptablepartstate("turret_mode", "turret_mode_sentry");
    if (istrue(self.var_ce4dc6c1d56eb0a9)) {
        self.owner remotecontrolturretoff(self);
        self.var_ce4dc6c1d56eb0a9 = undefined;
        self.owner.usingremote = undefined;
        self notify("remote_exit");
        if (istrue(self.owner.isjuggernaut)) {
            self.owner notify("remote_exit");
        }
        self setscriptablepartstate("lights", "daytime", 0);
        function_9cc5ca1b073338ab(self.owner);
        function_911cde43e0f3c6b6(self.owner);
        if (isdefined(self.owner)) {
            self.owner _switchtoweapon(self.owner.primaryweaponobj);
            self.owner enableweaponswitch();
            wait(1);
            self.owner val::reset("remote_turret", "usability");
            self.owner val::reset("remote_turret", "killstreaks");
            self.owner val::reset("remote_turret", "supers");
            self.owner val::reset("remote_turret", "reload");
            self.owner val::reset("remote_turret", "offhand_weapons");
            self.owner val::reset("remote_turret", "melee");
        }
    }
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33da
// Size: 0xb5
function function_958fed8d4d1143fa(data) {
    if (issharedfuncdefined("remote_turret", "empStarted")) {
        self [[ getsharedfunc("remote_turret", "empCleared") ]]();
    }
    if (isdefined(self.useobj)) {
        self.useobj enableplayeruse(self.useobj.owner);
        self.useobj.var_83b25e20c32fd3e9 = 1;
    }
    if (istrue(self.isplaced)) {
        self setmode("sentry");
        self.owner thread function_2bd5e2012f429ae3(self);
        thread function_3bb43305bf56bfec(undefined, self.owner);
    }
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3496
// Size: 0x52
function private function_1f85068748abaa9b(turret) {
    /#
        level endon("etype_ai");
        self endon("hittype");
        turret endon("ui_remote_turret_status");
        wait(0.3);
        var_65baebe4c4d46438 = spawnstruct();
        turret function_371131da10a20bb(var_65baebe4c4d46438);
        wait(4);
        turret function_958fed8d4d1143fa(var_65baebe4c4d46438);
    #/
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x34ef
// Size: 0x299
function function_cc47405c2cd435e(data) {
    if (!istrue(self.var_12bfb031c0a0efd8)) {
        self.var_12bfb031c0a0efd8 = 1;
        if (isdefined(data.attacker)) {
            if (issharedfuncdefined("remote_turret", "empStarted")) {
                self [[ getsharedfunc("remote_turret", "empStarted") ]]();
            }
        }
        if (isdefined(self.useobj)) {
            self.useobj disableplayeruse(self.useobj.owner);
            self.useobj.var_83b25e20c32fd3e9 = 0;
        }
        if (isdefined(self.useownerobj)) {
            self.useownerobj hide();
            self.useownerobj.var_83b25e20c32fd3e9 = 0;
        }
        self.owner notify("stopSentryFire");
        self.owner notify("remote_turret_empd");
        if (istrue(self.var_e42f0fcd6e0c1153)) {
            self stopbarrelspin();
            self.var_e42f0fcd6e0c1153 = undefined;
        }
        self setmode("sentry_offline");
        self setscriptablepartstate("turret_mode", "turret_mode_sentry");
        if (istrue(self.var_ce4dc6c1d56eb0a9)) {
            self.owner remotecontrolturretoff(self);
            self.var_ce4dc6c1d56eb0a9 = undefined;
            self.owner.usingremote = undefined;
            self notify("remote_exit");
            if (istrue(self.owner.isjuggernaut)) {
                self.owner notify("remote_exit");
            }
            self setscriptablepartstate("lights", "daytime", 0);
            function_9cc5ca1b073338ab(self.owner);
            function_911cde43e0f3c6b6(self.owner);
            self.owner _switchtoweapon(self.owner.primaryweaponobj);
            self.owner enableweaponswitch();
            wait(1);
            self.owner val::reset("remote_turret", "usability");
            self.owner val::reset("remote_turret", "killstreaks");
            self.owner val::reset("remote_turret", "supers");
            self.owner val::reset("remote_turret", "reload");
            self.owner val::reset("remote_turret", "offhand_weapons");
            self.owner val::reset("remote_turret", "melee");
        }
    }
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x378f
// Size: 0xf1
function function_fe21c57503ab070f(data) {
    if (issharedfuncdefined("remote_turret", "empStarted")) {
        self [[ getsharedfunc("remote_turret", "empCleared") ]]();
    }
    if (isdefined(self.useobj)) {
        self.useobj enableplayeruse(self.useobj.owner);
        self.useobj.var_83b25e20c32fd3e9 = 1;
    }
    if (isdefined(self.useownerobj)) {
        self.useownerobj show();
        self.useownerobj.var_83b25e20c32fd3e9 = 1;
    }
    if (istrue(self.isplaced)) {
        self setmode("sentry");
        self.owner thread function_2bd5e2012f429ae3(self);
        thread function_3bb43305bf56bfec(undefined, self.owner);
    }
    self.var_12bfb031c0a0efd8 = undefined;
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3887
// Size: 0x65
function function_66a63d2003156721() {
    if (namespace_5a51aa78ea0b1b9f::is_empd()) {
        self turretfiredisable();
        self setmode(level.sentrysettings[self.turrettype].sentrymodeoff);
    } else {
        self turretfireenable();
        self setmode(level.sentrysettings[self.turrettype].sentrymodeon);
    }
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38f3
// Size: 0x190
function function_3b0cd265e614031a(turret) {
    turret endon("death");
    turret endon("carried");
    while (1) {
        if (!_isalive()) {
            turret notify("remote_turret_ownerDeath");
            if (istrue(turret.var_ce4dc6c1d56eb0a9) && istrue(turret.isplaced) || istrue(self.var_6678ccff9684345e)) {
                self remotecontrolturretoff(turret);
                turret setmode("sentry");
                turret.var_ce4dc6c1d56eb0a9 = undefined;
                self.usingremote = undefined;
                turret notify("remote_exit");
                if (istrue(self.isjuggernaut)) {
                    self notify("remote_exit");
                }
                turret.overheated = 0;
                turret setscriptablepartstate("turret_mode", "turret_mode_sentry");
                turret setscriptablepartstate("lights", "daytime", 0);
                turret function_13a319439a116d2(self);
                turret function_911cde43e0f3c6b6(self);
                _switchtoweapon(self.primaryweaponobj);
                self enableweaponswitch();
                val::reset("remote_turret", "allow_movement");
                val::reset("remote_turret", "usability");
                val::reset("remote_turret", "killstreaks");
                val::reset("remote_turret", "supers");
                val::reset("remote_turret", "reload");
                val::reset("remote_turret", "offhand_weapons");
                val::reset("remote_turret", "melee");
                turret thread function_3bb43305bf56bfec(undefined, self);
            }
            thread function_2bd5e2012f429ae3(turret);
        }
        wait(0.1);
    }
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a8a
// Size: 0x3b6
function function_7a35c7c95b25b0e9(turret) {
    turret endon("carried");
    var_4fac8b8ce36e09f1 = var_b2797481a55c620 = turret waittill("kill_turret");
    turret notify("remote_turret_death");
    waitframe();
    self.var_3b28db27cbdbc523 = undefined;
    if (istrue(turret.var_ce4dc6c1d56eb0a9)) {
        turret function_911cde43e0f3c6b6(self);
        self remotecontrolturretoff(turret);
        turret.var_ce4dc6c1d56eb0a9 = undefined;
        self.usingremote = undefined;
        turret notify("remote_exit");
        if (istrue(self.isjuggernaut)) {
            self notify("remote_exit");
        }
        turret.overheated = 0;
        turret setscriptablepartstate("turret_mode", "turret_mode_sentry");
        turret setscriptablepartstate("lights", "daytime", 0);
    }
    if (isdefined(self)) {
        _switchtoweapon(self.primaryweaponobj);
        self enableweaponswitch();
        val::reset("remote_turret", "allow_movement");
        val::reset("remote_turret", "usability");
        val::reset("remote_turret", "killstreaks");
        val::reset("remote_turret", "supers");
        val::reset("remote_turret", "reload");
        val::reset("remote_turret", "offhand_weapons");
        val::reset("remote_turret", "melee");
        self.placedsentries[turret.turrettype] = array_remove(self.placedsentries[turret.turrettype], turret);
        function_fbce760dc23e09f(turret);
        turret thread function_9cc5ca1b073338ab(self);
        function_3650adfd6e0d1fb9(0);
        if (issharedfuncdefined("player", "printGameAction")) {
            self [[ getsharedfunc("player", "printGameAction") ]]("killstreak ended - manual_turret", self);
        }
        turret.streakinfo.expiredbydeath = istrue(var_4fac8b8ce36e09f1);
        namespace_9abe40d2af041eb2::recordkillstreakendstats(turret.streakinfo);
    }
    if (istrue(var_4fac8b8ce36e09f1)) {
        function_8959c1606f65e65(turret.streakinfo.streakname, turret.streakinfo.streakname + "_teamleader_destroyed");
    }
    turret function_20db11c0f7f046c1("destroyed");
    turret setturretowner(undefined);
    if (!istrue(var_b2797481a55c620)) {
        turret setscriptablepartstate("shutdown", "on");
        turret setscriptablepartstate("turret_carry_state", "off");
        namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(2);
        turret setscriptablepartstate("explode", "regular");
    } else {
        turret setscriptablepartstate("explode", "violent");
    }
    level callback::callback("killstreak_finish_use", {streakinfo:turret.streakinfo});
    if (isdefined(turret.var_3c6ebafa9ae6ede3)) {
        turret.var_3c6ebafa9ae6ede3 = undefined;
    }
    if (isdefined(turret.killcament)) {
        turret.killcament delete();
    }
    if (isdefined(turret.useownerobj)) {
        turret.useownerobj delete();
    }
    if (isdefined(turret.useotherobj)) {
        turret.useotherobj delete();
    }
    if (isdefined(turret.colmodel)) {
        turret.colmodel delete();
    }
    if (isdefined(turret.minimapid)) {
        if (issharedfuncdefined("game", "returnObjectiveID")) {
            [[ getsharedfunc("game", "returnObjectiveID") ]](turret.minimapid);
        }
        turret.minimapid = undefined;
    }
    wait(0.2);
    turret delete();
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e47
// Size: 0x18
function function_3eccd3cd75317e53(data) {
    self notify("kill_turret", 1);
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e66
// Size: 0x1a
function function_f8e82a6dd884bd91() {
    level endon("game_ended");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(5);
    self delete();
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e87
// Size: 0x104
function function_1ad21168e3b8db0c(turret) {
    turret endon("kill_turret");
    turret endon("carried");
    self endon("disconnect");
    level endon("game_ended");
    while (turret.timeout > 0) {
        if (istrue(turret.var_e42f0fcd6e0c1153)) {
            turret stopbarrelspin();
            turret.var_e42f0fcd6e0c1153 = undefined;
        }
        var_84fcd0bf6ba46b8c = int(100 * turret.timeout / turret.var_b4b2742fd2768cb8);
        self setclientomnvar("ui_killstreak_countdown", var_84fcd0bf6ba46b8c);
        turret.timeout = turret.timeout - 0.05;
        namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(0.05);
    }
    function_8959c1606f65e65(turret.streakinfo.streakname, turret.streakinfo.streakname + "_teamleader_timeout");
    turret notify("kill_turret", 0);
    function_a226c5202cb23d6();
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f92
// Size: 0x3a
function function_cfb4701398c755b5(turret) {
    turret endon("kill_turret");
    turret endon("carried");
    waittill_any_3("disconnect", "joined_team", "joined_spectators");
    turret notify("kill_turret", 0);
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fd3
// Size: 0x2c
function function_40906ee89de6f708(turret) {
    turret endon("kill_turret");
    turret endon("carried");
    level waittill("game_ended");
    turret notify("kill_turret", 0);
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4006
// Size: 0xa4
function function_20db11c0f7f046c1(type) {
    turretmodel = undefined;
    if (type == "placed") {
        turretmodel = level.sentrysettings[self.turrettype].modelbaseground;
    } else {
        turretmodel = level.sentrysettings[self.turrettype].modeldestroyedground;
    }
    /#
        var_d8943d63ec472996 = getdvarint(@"hash_e19e5d308effeda3", 1);
        if (!var_d8943d63ec472996) {
            turretmodel = "<unknown string>";
        }
    #/
    /#
        assertex(isdefined(turretmodel), "For some reason turretModel is not defined, this should never happen");
    #/
    self setmodel(turretmodel);
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40b1
// Size: 0xf2
function function_3bb43305bf56bfec(var_630af5192659dd3b, player) {
    /#
        self.owner endon("<unknown string>");
    #/
    self endon("kill_turret");
    self endon("carried");
    self endon("enterRemote");
    self.owner endon("stopSentryFire");
    level endon("game_ended");
    self.momentum = 0;
    self.heatlevel = 0;
    self.overheated = 0;
    thread turret_heatmonitor();
    thread turret_coolmonitor();
    while (1) {
        self waittill("turretstatechange");
        if (self isfiringturret()) {
            player thread function_57bec1aaf3404bf6();
            thread function_f38fae4f6dd4b035(player);
            thread function_da96aa677b43fd18(var_630af5192659dd3b);
        } else {
            self.heatlevel = 0;
            function_361d73970f697d6a();
            thread function_b7ffbe66f2c448fc();
            thread function_13a319439a116d2(player);
            player thread function_ca5bd9a5609d8ba3();
            self setscriptablepartstate("turret_target_found", "off");
        }
    }
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x41aa
// Size: 0x267
function function_1223f321ae6ff9a5(var_630af5192659dd3b) {
    /#
        self endon("<unknown string>");
        self endon("<unknown string>");
        level endon("etype_ai");
        self.turrettarget = spawn("<unknown string>", self gettagorigin("<unknown string>") + anglestoforward(self gettagangles("<unknown string>") * 300));
        self.turrettarget.var_f7db994d1c467c4d = 0;
        self.turrettarget dontinterpolate();
        self.turrettarget thread function_8ffe5560e2df8a72(self);
        self.turrettarget thread function_818d215a79eecafe(self);
        var_50651df7c1ef6241 = undefined;
        if (isdefined(var_630af5192659dd3b)) {
            var_50651df7c1ef6241 = var_630af5192659dd3b;
        } else {
            var_50651df7c1ef6241 = level.sentrysettings[self.turrettype];
        }
        var_754dacbb98d14a25 = var_50651df7c1ef6241.sentrymodeon;
        var_a8c76bd81d18ce18 = "<unknown string>";
        var_8fb00db7001a2c8c = var_754dacbb98d14a25;
        var_c962b800eea5e761 = 0;
        while (1) {
            if (getdvarint(@"hash_c9bd691ce96079ac", 0) == 1) {
                if (!istrue(var_c962b800eea5e761)) {
                    self.owner notifyonplayercommand("<unknown string>", "<unknown string>");
                    var_c962b800eea5e761 = 1;
                }
                self.owner waittill("<unknown string>");
                if (var_8fb00db7001a2c8c != var_a8c76bd81d18ce18) {
                    self setmode(var_a8c76bd81d18ce18);
                    var_8fb00db7001a2c8c = var_a8c76bd81d18ce18;
                    starttrace = self.owner getvieworigin();
                    endtrace = starttrace + anglestoforward(self.owner getplayerangles()) * 50000;
                    trace = namespace_2a184fc4902783dc::ray_trace(starttrace, endtrace, self.owner);
                    endpos = undefined;
                    if (isdefined(trace["<unknown string>"]) && trace["<unknown string>"] != "<unknown string>") {
                        endpos = trace["<unknown string>"];
                    }
                    if (isdefined(endpos)) {
                        thread function_ee5cbfd60227d0b8(endpos);
                    }
                } else {
                    function_c151e4a17d929b78();
                    var_8fb00db7001a2c8c = var_754dacbb98d14a25;
                    self setmode(var_8fb00db7001a2c8c);
                    thread function_3bb43305bf56bfec();
                }
            } else {
                var_c962b800eea5e761 = 0;
                if (var_8fb00db7001a2c8c != var_754dacbb98d14a25) {
                    self.owner notifyonplayercommandremove("<unknown string>", "<unknown string>");
                    function_c151e4a17d929b78();
                    var_8fb00db7001a2c8c = var_754dacbb98d14a25;
                    self setmode(var_8fb00db7001a2c8c);
                    thread function_3bb43305bf56bfec();
                }
                waitframe();
            }
        }
    #/
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4418
// Size: 0x1a6
function function_ee5cbfd60227d0b8(var_49f486c39f38b9d9) {
    /#
        self.owner endon("<unknown string>");
        self.owner endon("<unknown string>");
        self endon("<unknown string>");
        self endon("<unknown string>");
        level endon("etype_ai");
        thread function_b7ffbe66f2c448fc();
        self.turrettarget.origin = var_49f486c39f38b9d9;
        self settargetentity(self.turrettarget);
        self.turrettarget.var_f7db994d1c467c4d = 1;
        var_77453585aac4fd21 = "<unknown string>";
        if (self.streakinfo.streakname == "<unknown string>") {
            var_77453585aac4fd21 = "<unknown string>";
        }
        var_6ce4b7d1920d2206 = "<unknown string>";
        wait(1);
        while (1) {
            var_30c9c9336ef2caaf = self gettagorigin(var_77453585aac4fd21);
            var_831cc1b8f4225351 = self gettagangles(var_77453585aac4fd21);
            thread drawsphere(var_30c9c9336ef2caaf, 2, 1, (0, 1, 1));
            thread drawline(var_30c9c9336ef2caaf, var_30c9c9336ef2caaf + anglestoforward(var_831cc1b8f4225351) * 1800, 1, (0, 1, 1));
            var_9f813873731478c5 = self gettagorigin(var_6ce4b7d1920d2206);
            var_e0416d7c3c03c91b = self gettagangles(var_6ce4b7d1920d2206);
            thread drawsphere(var_9f813873731478c5, 2, 1, (1, 1, 0));
            thread drawline(var_9f813873731478c5, var_9f813873731478c5 + anglestoforward(var_e0416d7c3c03c91b) * 1800, 1, (1, 1, 0));
            function_da96aa677b43fd18(undefined, undefined, 1);
            wait(1);
        }
    #/
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x45c5
// Size: 0x3a
function function_c151e4a17d929b78() {
    /#
        self cleartargetentity();
        thread function_b7ffbe66f2c448fc();
        self.turrettarget.var_f7db994d1c467c4d = 0;
        self.owner notify("<unknown string>");
    #/
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4606
// Size: 0x62
function function_8ffe5560e2df8a72(turret) {
    /#
        turret endon("<unknown string>");
        turret endon("<unknown string>");
        self endon("ui_remote_turret_status");
        level endon("etype_ai");
        while (1) {
            if (istrue(self.var_f7db994d1c467c4d)) {
                sphere(self.origin, 20, (1, 1, 0), 0, 1);
            }
            waitframe();
        }
    #/
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x466f
// Size: 0x3a
function function_818d215a79eecafe(turret) {
    /#
        turret endon("<unknown string>");
        turret endon("<unknown string>");
        self endon("ui_remote_turret_status");
        level endon("etype_ai");
        turret waittill("ui_remote_turret_status");
        self delete();
    #/
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46b0
// Size: 0x1b
function function_7e11984961aa0adb() {
    self endon("death");
    self setscriptablepartstate("turret_target_found", "target_found");
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x46d2
// Size: 0x6c
function function_7a41af7e47221e8f(var_630af5192659dd3b) {
    if (!istrue(self.var_e42f0fcd6e0c1153)) {
        self startbarrelspin();
        self.var_e42f0fcd6e0c1153 = 1;
    }
    while (self.momentum < var_630af5192659dd3b.spinuptime) {
        self.momentum = self.momentum + 0.1;
        wait(0.1);
    }
    thread function_7e11984961aa0adb();
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4745
// Size: 0x2b
function function_361d73970f697d6a() {
    self.momentum = 0;
    if (istrue(self.var_e42f0fcd6e0c1153)) {
        self stopbarrelspin();
        self.var_e42f0fcd6e0c1153 = undefined;
    }
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4777
// Size: 0x18a
function function_da96aa677b43fd18(var_630af5192659dd3b, var_ebed6e83eb956d18, var_7a4f7bd11952e7bc) {
    self endon("death");
    self endon("kill_turret");
    self endon("carried");
    self endon("enterRemote");
    self endon("stop_shooting");
    self.owner endon("stopSentryFire");
    level endon("game_ended");
    var_50651df7c1ef6241 = undefined;
    if (isdefined(var_630af5192659dd3b)) {
        var_50651df7c1ef6241 = var_630af5192659dd3b;
    } else {
        var_50651df7c1ef6241 = level.sentrysettings[self.turrettype];
    }
    function_7a41af7e47221e8f(var_50651df7c1ef6241);
    firetime = weaponfiretime(var_50651df7c1ef6241.weaponinfo);
    var_3746ec1befd86ae8 = var_50651df7c1ef6241.burstmin;
    var_3e92cd336a99ce02 = var_50651df7c1ef6241.burstmax;
    var_5f622c39d6661b23 = var_50651df7c1ef6241.pausemin;
    var_42ae243cd994c3bd = var_50651df7c1ef6241.pausemax;
    lockstrength = var_50651df7c1ef6241.lockstrength;
    while (1) {
        numshots = randomintrange(var_3746ec1befd86ae8, var_3e92cd336a99ce02 + 1);
        if (isdefined(var_ebed6e83eb956d18)) {
            numshots = var_ebed6e83eb956d18;
        }
        for (i = 0; i < numshots; i++) {
            self shootturret("tag_flash", lockstrength);
            self.streakinfo.shots_fired++;
            wait(firetime);
        }
        if (istrue(var_7a4f7bd11952e7bc)) {
            break;
        }
        wait(randomfloatrange(var_5f622c39d6661b23, var_42ae243cd994c3bd));
    }
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4908
// Size: 0xb
function function_b7ffbe66f2c448fc() {
    self notify("stop_shooting");
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x491a
// Size: 0x4b
function function_7bd876f944b5caf3() {
    self endon("death");
    self endon("kill_turret");
    self endon("carried");
    level endon("game_ended");
    while (1) {
        if (istrue(self.overheated)) {
            goto LOC_00000040;
        }
        if (self.heatlevel > 0) {
        LOC_00000040:
        }
    LOC_00000040:
        wait(0.1);
    }
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x496c
// Size: 0xa0
function turret_heatmonitor() {
    /#
        self.owner endon("<unknown string>");
    #/
    self endon("kill_turret");
    self endon("carried");
    level endon("game_ended");
    overheattime = level.sentrysettings[self.turrettype].overheattime;
    while (1) {
        if (self.heatlevel > overheattime) {
            self.overheated = 1;
            while (self.heatlevel) {
                wait(0.1);
            }
            self.overheated = 0;
            self notify("not_overheated");
        }
        wait(0.05);
    }
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4a13
// Size: 0x5f
function playheatfx() {
    self endon("death");
    self endon("not_overheated");
    level endon("game_ended");
    self notify("playing_heat_fx");
    self endon("playing_heat_fx");
    for (;;) {
        playfxontag(getfx("sentry_overheat_mp"), self, "tag_flash");
        wait(level.sentrysettings[self.turrettype].fxtime);
    }
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a79
// Size: 0x93
function turret_coolmonitor() {
    /#
        self.owner endon("<unknown string>");
    #/
    self endon("kill_turret");
    self endon("carried");
    level endon("game_ended");
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

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b13
// Size: 0x3a
function function_2c51e186f21ecfae() {
    self endon("death");
    self endon("carried");
    self endon("kill_turret");
    level endon("game_ended");
    while (1) {
        wait(3);
        if (self isfiringturret()) {
            waitframe();
            continue;
        }
    }
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4b54
// Size: 0x20c
function function_1baea357653599af() {
    level endon("game_ended");
    self.owner endon("disconnect");
    self endon("death");
    self endon("entering");
    var_4f35a480b277acb6 = function_869ccb4e3451b8c6([0:"etype_player", 1:"etype_ai"]);
    while (1) {
        targetarray = function_b1eef70090b5b7b5(self.origin, 1575, var_4f35a480b277acb6);
        foreach (ent in targetarray) {
            if (!isdefined(ent)) {
                continue;
            }
            if (isplayer(ent) || isbot(ent)) {
                jumpiffalse(issharedfuncdefined("player", "isReallyAlive")) LOC_000000f7;
                jumpiftrue([[ getsharedfunc("player", "isReallyAlive") ]](ent)) LOC_000000f7;
            } else {
            LOC_000000f7:
                if (isagent(ent) && !isalive(ent)) {
                    continue;
                }
                if (level.teambased) {
                    if (isdefined(ent.team) && ent.team == self.ownerteam) {
                        continue;
                    }
                } else if (ent == self.owner) {
                    continue;
                }
                if (namespace_5a51aa78ea0b1b9f::is_empd()) {
                    continue;
                }
                var_368ae33cb19f91f8 = function_a8c3018671379cee(ent);
                if (!var_368ae33cb19f91f8.isinrange || !var_368ae33cb19f91f8.isvisible || !var_368ae33cb19f91f8.isindetectrange || !var_368ae33cb19f91f8.var_9ae205c4c40af967) {
                    continue;
                }
                if (self.owner function_d326d254331ad16b(ent)) {
                    continue;
                }
                if (istrue(self.markingtarget)) {
                    continue;
                }
                params = function_1a5c1f370962e7bc(self.var_8862825a0618bda);
                function_b25c3111cbbcee44(ent, 3, "super_tac_camera");
            }
        }
    }
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d67
// Size: 0x76
function function_a8c3018671379cee(target) {
    info = spawnstruct();
    info.isvisible = function_a13b737dd0cea460(target);
    info.var_9ae205c4c40af967 = function_f232be2b19471805(target);
    info.isinrange = function_84c67e2797c250e9(target);
    info.isindetectrange = function_7bf16f569dc33813(target);
    if (isdefined(self.pilot)) {
    }
    return info;
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x4de5
// Size: 0x233
function private function_3456f1755f48358c(var_d89f028a5c8db805, var_c6cfd7be26d2c7df, var_5e43b44751d01b1a) {
    if (!isdefined(var_d89f028a5c8db805)) {
        return 0;
    }
    var_9b96536b85a38bc6 = 0;
    targetorigin = var_d89f028a5c8db805.origin;
    var_4e95fb5ddda03a33 = [0:targetorigin];
    var_c3d9e0b30c6f14a4 = distancesquared(self getvieworigin(), var_d89f028a5c8db805.origin);
    var_251f6ff6684a460c = 0;
    if (var_c3d9e0b30c6f14a4 <= 2) {
        var_5e43b44751d01b1a = var_5e43b44751d01b1a * getdvarfloat(@"hash_20c9852b3129de04", 2.5);
        var_251f6ff6684a460c = 1;
    }
    if (isplayer(var_d89f028a5c8db805)) {
        var_40e2f5706584505c = var_d89f028a5c8db805 function_415fe9eeca7b2e2b();
        headpos = var_d89f028a5c8db805 namespace_f8065cafc523dba5::getstancetop();
        centerpos = var_d89f028a5c8db805 namespace_f8065cafc523dba5::getstancecenter();
        var_4e95fb5ddda03a33 = [0:headpos, 1:centerpos];
        if (!var_40e2f5706584505c) {
            var_4e95fb5ddda03a33 = array_add(var_4e95fb5ddda03a33, targetorigin);
        }
        if (var_251f6ff6684a460c) {
            var_102502c44898b35c = (headpos + centerpos) / 2;
            extrapoints = [0:var_102502c44898b35c];
            if (!var_40e2f5706584505c) {
                var_264b006395220d6 = (centerpos + targetorigin) / 2;
                extrapoints = array_add(extrapoints, var_264b006395220d6);
            }
            var_4e95fb5ddda03a33 = array_combine(var_4e95fb5ddda03a33, extrapoints);
        }
    } else if (isagent(var_d89f028a5c8db805)) {
        centerpos = var_d89f028a5c8db805 namespace_f8065cafc523dba5::getstancecenter();
        headpos = var_d89f028a5c8db805 namespace_f8065cafc523dba5::getstancetop();
        var_4e95fb5ddda03a33 = [0:targetorigin + (0, 0, 1), 1:centerpos, 2:headpos];
        if (var_251f6ff6684a460c) {
            var_264b006395220d6 = (centerpos + targetorigin) / 2;
            var_102502c44898b35c = (headpos + centerpos) / 2;
            extrapoints = [0:var_264b006395220d6, 1:var_102502c44898b35c];
            var_4e95fb5ddda03a33 = array_combine(var_4e95fb5ddda03a33, extrapoints);
        }
    }
    foreach (point in var_4e95fb5ddda03a33) {
        if (self worldpointinreticle_circle(point, var_c6cfd7be26d2c7df, var_5e43b44751d01b1a)) {
            var_9b96536b85a38bc6 = 1;
            break;
        }
    }
    return var_9b96536b85a38bc6;
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5020
// Size: 0x78
function function_84c67e2797c250e9(target) {
    if (!isdefined(target)) {
        return 0;
    }
    params = function_1a5c1f370962e7bc(self.var_8862825a0618bda);
    var_7e2345a74ee18a53 = 2480625;
    if (istrue(self.isunderwater) || istrue(target function_988138367c74b1f5())) {
        var_7e2345a74ee18a53 = 619369;
    }
    return distancesquared(self.origin, target.origin) < var_7e2345a74ee18a53;
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50a0
// Size: 0x78
function function_7bf16f569dc33813(target) {
    if (!isdefined(target)) {
        return 0;
    }
    params = function_1a5c1f370962e7bc(self.var_8862825a0618bda);
    var_7e2345a74ee18a53 = 2480625;
    if (istrue(self.isunderwater) || istrue(target function_988138367c74b1f5())) {
        var_7e2345a74ee18a53 = 619369;
    }
    return distancesquared(self.origin, target.origin) < var_7e2345a74ee18a53;
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5120
// Size: 0x276
function function_a13b737dd0cea460(target) {
    if (!isdefined(target)) {
        return 0;
    }
    var_27b697504d9397d = 0;
    var_fbcabd62b8f66eb8 = physics_createcontents([0:"physicscontents_itemclip", 1:"physicscontents_item", 2:"physicscontents_clipshot", 3:"physicscontents_missileclip", 4:"physicscontents_vehicle", 5:"physicscontents_ainosight"]);
    var_eb381492a5db110a = undefined;
    if (isdefined(self.pilot)) {
        var_eb381492a5db110a = self.pilot getvieworigin();
    } else {
        var_eb381492a5db110a = self.origin;
    }
    var_8a4ea3a3baa22e4 = target.origin;
    tracepoints = [0:var_8a4ea3a3baa22e4];
    if (isplayer(target)) {
        headpos = (0, 0, 0);
        if (issharedfuncdefined("player", "isReallyAlive")) {
            headpos = target [[ getsharedfunc("player", "getStanceTop") ]]();
        }
        centerpos = (0, 0, 0);
        if (issharedfuncdefined("player", "isReallyAlive")) {
            centerpos = target [[ getsharedfunc("player", "getStanceCenter") ]]();
        }
        tracepoints = [0:headpos, 1:centerpos, 2:var_8a4ea3a3baa22e4];
    } else if (isagent(target)) {
        tracepoints = [0:var_8a4ea3a3baa22e4 + (0, 0, 1)];
    }
    ignorelist = [0:self, 1:target];
    vehicle = target getvehicle();
    if (isdefined(vehicle)) {
        ignorelist[ignorelist.size] = vehicle;
        var_bb7ac665413117fc = vehicle getlinkedchildren(1);
        foreach (child in var_bb7ac665413117fc) {
            ignorelist[ignorelist.size] = vehicle;
        }
    }
    var_27b697504d9397d = 0;
    for (i = 0; i < tracepoints.size; i++) {
        trace = namespace_2a184fc4902783dc::ray_trace(var_eb381492a5db110a, tracepoints[i], ignorelist, var_fbcabd62b8f66eb8, 1);
        if (trace["hittype"] == "hittype_none") {
            var_27b697504d9397d = 1;
            break;
        }
    }
    return var_27b697504d9397d;
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x539e
// Size: 0x256
function function_f232be2b19471805(target) {
    if (!isdefined(target)) {
        return 0;
    }
    var_efb14e53541b5b48 = self gettagangles("tag_player");
    var_51743d62f4cf524e = self gettagorigin("tag_player");
    if (isdefined(self.pilot)) {
        var_efb14e53541b5b48 = self.pilot getplayerangles();
        var_51743d62f4cf524e = self.pilot getvieworigin();
    }
    var_b5837ee451eabc71 = anglestoforward(var_efb14e53541b5b48);
    var_8a4ea3a3baa22e4 = target.origin;
    headpos = (0, 0, 0);
    if (issharedfuncdefined("player", "isReallyAlive")) {
        headpos = target [[ getsharedfunc("player", "getStanceTop") ]]();
    }
    centerpos = (0, 0, 0);
    if (issharedfuncdefined("player", "isReallyAlive")) {
        centerpos = target [[ getsharedfunc("player", "getStanceCenter") ]]();
    }
    tracepoints = [0:headpos, 1:centerpos, 2:var_8a4ea3a3baa22e4];
    var_9ae205c4c40af967 = 0;
    foreach (point in tracepoints) {
        var_f4a43e5290bce44b = point - var_51743d62f4cf524e;
        var_56699f8802baa8e7 = namespace_d3f3cb0a543667c1::anglebetweenvectors(var_b5837ee451eabc71, var_f4a43e5290bce44b);
        var_878f0eb51ab6a646 = namespace_d3f3cb0a543667c1::anglebetweenvectors(var_b5837ee451eabc71, (0, 0, 1));
        var_cea5805c08f245d2 = namespace_d3f3cb0a543667c1::anglebetweenvectors(var_f4a43e5290bce44b, (0, 0, 1));
        if (isdefined(self.pilot)) {
            var_e077f4a68ed9a464 = distancesquared(var_51743d62f4cf524e, point);
            if (var_e077f4a68ed9a464 > 10) {
                if (abs(abs(var_878f0eb51ab6a646) - abs(var_cea5805c08f245d2)) > getdvarfloat(@"hash_77f60c1216fca977", 19)) {
                    return var_9ae205c4c40af967;
                }
            }
        }
        if (var_56699f8802baa8e7 <= getdvarfloat(@"hash_a20d9fbeab627f6", 31)) {
            var_9ae205c4c40af967 = 1;
        }
    }
    return var_9ae205c4c40af967;
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x55fc
// Size: 0x52
function private function_d326d254331ad16b(target) {
    if (!isdefined(target)) {
        return 0;
    }
    var_7305a0e8014e47be = function_bcc24554453f6d67(self);
    if (!isdefined(var_7305a0e8014e47be)) {
        return 0;
    }
    var_161e86c260d6864c = var_7305a0e8014e47be[target getentitynumber()];
    if (!isdefined(var_161e86c260d6864c)) {
        return 0;
    }
    return istrue(var_161e86c260d6864c.reconmarked);
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5656
// Size: 0xc3
function function_bcc24554453f6d67(player) {
    if (!isdefined(player)) {
        return;
    }
    if (level.teambased) {
        if (!isdefined(level.var_7d17467eca3737aa) || !isdefined(level.var_7d17467eca3737aa[player.team])) {
            return;
        }
        if (shouldmodesetsquads()) {
            if (isdefined(level.var_7d17467eca3737aa[player.team][player.var_ff97225579de16a])) {
                return level.var_7d17467eca3737aa[player.team][player.var_ff97225579de16a];
            } else {
                return;
            }
        } else {
            return level.var_7d17467eca3737aa[player.team];
        }
    } else {
        return player.markedents;
    }
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5720
// Size: 0x35
function function_1a5c1f370962e7bc(var_8862825a0618bda) {
    params = level.var_bb0266f422d9afa3[var_8862825a0618bda];
    /#
        assertex(isdefined(params), "level.dCamSettings does not have an entry for " + var_8862825a0618bda);
    #/
    return params;
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x575d
// Size: 0x80
function private function_b25c3111cbbcee44(target, var_57b8f3bcfca33a4b, var_5237a188ccda4d7b) {
    var_7150dff45b6d6577 = function_cb0d2df7f050aa8e(target);
    if (!isdefined(var_7150dff45b6d6577)) {
        return;
    }
    self playsoundtoplayer("ui_camera_proximity_alert", self.owner, self);
    function_487185d4893d5f85(var_5237a188ccda4d7b);
    self.owner thread function_e793fcf03710f124(self, self.var_defbeed1a2c29c34, 2, undefined, 3.25);
    thread function_2a98f46d2b757869(var_7150dff45b6d6577, var_57b8f3bcfca33a4b, var_5237a188ccda4d7b);
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x57e4
// Size: 0x7e
function private function_cb0d2df7f050aa8e(target) {
    if (!isdefined(self.var_dae7e92e87a31e4)) {
        self.var_dae7e92e87a31e4 = [];
    }
    if (isdefined(self.var_dae7e92e87a31e4[target getentitynumber()])) {
        return;
    } else {
        var_7150dff45b6d6577 = spawnstruct();
        var_7150dff45b6d6577.target = target;
        var_7150dff45b6d6577.entnum = target getentitynumber();
        self.var_dae7e92e87a31e4[target getentitynumber()] = var_7150dff45b6d6577;
        return var_7150dff45b6d6577;
    }
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5869
// Size: 0x69
function private function_487185d4893d5f85(var_5237a188ccda4d7b) {
    foreach (player in level.players) {
        if (!isdefined(player)) {
            return;
        }
        function_768370d8be2da2d2(player, undefined, var_5237a188ccda4d7b);
    }
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x58d9
// Size: 0x7f
function function_9553839f6b149375() {
    params = function_1a5c1f370962e7bc("tacCam");
    self.headiconbox = namespace_7bdde15c3500a23f::setheadicon_singleimage([], "jup_hud_icon_killstreaks_remote_turret", 5, 1, 1000, 100, undefined, 1);
    self.headiconfaction = namespace_7bdde15c3500a23f::setheadicon_factionimage(0, 5, undefined, undefined, undefined, undefined, 1);
    self.var_654dfe33aae5b35c = namespace_7bdde15c3500a23f::setheadicon_singleimage([], "icon_ping_warning", 5, 1, 1000, 100, undefined, 1);
    function_487185d4893d5f85("tacCam");
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x595f
// Size: 0x127
function function_768370d8be2da2d2(player, unset, var_5237a188ccda4d7b) {
    if (!isdefined(self)) {
        return;
    }
    if (!isdefined(self.owner)) {
        return;
    }
    if (!isdefined(player)) {
        return;
    }
    var_e8333833a81b6f0d = self.headiconbox;
    if (!isdefined(var_e8333833a81b6f0d)) {
        return;
    }
    var_d39dea1586e13c6c = self.headiconfaction;
    if (!isdefined(var_d39dea1586e13c6c)) {
        return;
    }
    var_d1c9d3655a4f3302 = self.var_654dfe33aae5b35c;
    if (!isdefined(var_d1c9d3655a4f3302)) {
        return;
    }
    isfriendly = namespace_f8065cafc523dba5::isfriendly(self.owner.team, player);
    var_7295a6a7d7aafad7 = function_10aa38d58090b230(player, var_5237a188ccda4d7b);
    if (isfriendly) {
        if (istrue(unset)) {
            function_58672d602d2120d3(player);
            return;
        }
        if (function_9b936bec0466b8b5()) {
            function_f38fae4f6dd4b035(player);
            return;
        }
        if (var_7295a6a7d7aafad7) {
            if (istrue(player.isusingcamera)) {
                function_9cc5ca1b073338ab(player);
            } else {
                function_13a319439a116d2(player);
            }
            return;
        } else {
            function_58672d602d2120d3(player);
        }
    } else {
        function_9cc5ca1b073338ab(player);
    }
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5a8d
// Size: 0x50
function private function_10aa38d58090b230(player, var_5237a188ccda4d7b) {
    if (isdefined(player.super) && player.super.staticdata.ref == var_5237a188ccda4d7b) {
        return 1;
    } else {
        return 0;
    }
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5ae4
// Size: 0x25
function private function_9b936bec0466b8b5() {
    if (!isdefined(self.var_dae7e92e87a31e4)) {
        return 0;
    }
    if (self.var_dae7e92e87a31e4.size > 0) {
        return 1;
    }
    return 0;
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5b11
// Size: 0x3f
function private function_f38fae4f6dd4b035(player) {
    namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(self.headiconbox, player);
    namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(self.headiconfaction, player);
    namespace_7bdde15c3500a23f::setheadicon_addclienttomask(self.var_654dfe33aae5b35c, player);
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5b57
// Size: 0x3f
function private function_9cc5ca1b073338ab(player) {
    namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(self.headiconbox, player);
    namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(self.headiconfaction, player);
    namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(self.var_654dfe33aae5b35c, player);
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5b9d
// Size: 0x3f
function private function_13a319439a116d2(player) {
    namespace_7bdde15c3500a23f::setheadicon_addclienttomask(self.headiconbox, player);
    namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(self.headiconfaction, player);
    namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(self.var_654dfe33aae5b35c, player);
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5be3
// Size: 0x3f
function private function_58672d602d2120d3(player) {
    namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(self.headiconbox, player);
    namespace_7bdde15c3500a23f::setheadicon_addclienttomask(self.headiconfaction, player);
    namespace_7bdde15c3500a23f::setheadicon_removeclientfrommask(self.var_654dfe33aae5b35c, player);
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5c29
// Size: 0xc0
function function_e793fcf03710f124(camera, index, status, var_bf15527477b41565, var_be632e8c9259a360) {
    if (!isdefined(self.var_2d5baa13a621c5eb)) {
        self.var_2d5baa13a621c5eb = [];
    }
    struct = spawnstruct();
    struct.camera = camera;
    struct.index = index;
    struct.status = status;
    struct.var_bf15527477b41565 = istrue(var_bf15527477b41565);
    struct.var_be632e8c9259a360 = ter_op(isdefined(var_be632e8c9259a360), var_be632e8c9259a360, 0);
    self.var_2d5baa13a621c5eb[self.var_2d5baa13a621c5eb.size] = struct;
    thread function_d094908c5788a3e9();
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5cf0
// Size: 0xce
function function_d094908c5788a3e9() {
    level endon("game_ended");
    self endon("disconnect");
    self endon("tacticalCamera_allCamerasRemoved");
    self notify("sentryTurret_statusQueue");
    self endon("sentryTurret_statusQueue");
    if (istrue(level.gameended) || !isdefined(self)) {
        return;
    }
    while (isdefined(self.var_2d5baa13a621c5eb) && self.var_2d5baa13a621c5eb.size > 0) {
        waitframe();
        struct = array_get_first_item(self.var_2d5baa13a621c5eb);
        self notify("personal_camera_status_updated", struct.camera);
        self.var_2d5baa13a621c5eb = array_remove(self.var_2d5baa13a621c5eb, struct);
    }
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5dc5
// Size: 0x4b
function private function_2a98f46d2b757869(var_7150dff45b6d6577, var_57b8f3bcfca33a4b, var_5237a188ccda4d7b) {
    level endon("game_ended");
    self.owner endon("disconnect");
    self endon("death");
    wait(var_57b8f3bcfca33a4b);
    function_d27569772a3ad7d7(var_7150dff45b6d6577);
    function_487185d4893d5f85(var_5237a188ccda4d7b);
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5e17
// Size: 0x3a
function private function_d27569772a3ad7d7(var_7150dff45b6d6577) {
    if (isdefined(self.var_dae7e92e87a31e4[var_7150dff45b6d6577.entnum])) {
        self.var_dae7e92e87a31e4[var_7150dff45b6d6577.entnum] = undefined;
    }
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e58
// Size: 0x11
function function_57bec1aaf3404bf6() {
    self setclientomnvar("ui_remote_turret_status", 2);
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e70
// Size: 0x11
function function_ca5bd9a5609d8ba3() {
    self setclientomnvar("ui_remote_turret_status", 1);
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e88
// Size: 0x39
function function_392e60623411ef42(player) {
    player _setvisibiilityomnvarforkillstreak(self.streakinfo.streakname, "on");
    player setclientomnvar("ui_killstreak_health", 0);
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ec8
// Size: 0x2c
function function_911cde43e0f3c6b6(player) {
    player _setvisibiilityomnvarforkillstreak(self.streakinfo.streakname, "off");
}

// Namespace remote_turret/namespace_2f1467074a1bbe09
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5efb
// Size: 0x31
function function_45456bb78fa8eb2d(var_61bc7aaf0696d215) {
    /#
        if (getdvarint(@"hash_2da6e96d161f55bc", 0) == 1) {
            print("<unknown string>" + var_61bc7aaf0696d215);
        }
    #/
}

