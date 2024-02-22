// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using script_4c770a9a4ad7659c;
#using script_3db04fd1b466bdba;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\shellshock_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;
#using scripts\cp_mp\targetmarkergroups.gsc;
#using scripts\cp_mp\hostmigration.gsc;
#using scripts\cp_mp\emp_debuff.gsc;

#namespace cruise_predator;

// Namespace cruise_predator/namespace_fd47b78f0802e959
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c6
// Size: 0x59
function init() {
    if (issharedfuncdefined("cruise_predator", "init")) {
        [[ getsharedfunc("cruise_predator", "init") ]]();
    }
    level function_eb11a8dfbd2505a0();
    level function_10865a43b7b1243e();
    level function_ce236b9143b76125();
    level function_f0b48909aba12866();
    level function_f06e9c09ab54c2bf();
    level function_328fd4c30cafcce0();
}

// Namespace cruise_predator/namespace_fd47b78f0802e959
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x926
// Size: 0x29
function function_eb11a8dfbd2505a0() {
    registervisibilityomnvarforkillstreak("cruise_predator", "invisible", 7);
    registervisibilityomnvarforkillstreak("cruise_predator", "on", 8);
}

// Namespace cruise_predator/namespace_fd47b78f0802e959
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x956
// Size: 0x61
function function_10865a43b7b1243e() {
    val::function_2d6e7e0b80767910("cruisePredator", [0:"allow_movement", 1:"allow_jump", 2:"fire", 3:"weapon_switch", 4:"melee", 5:"usability", 6:"shellshock", 7:"offhand_weapons", 8:"killstreaks"]);
}

// Namespace cruise_predator/namespace_fd47b78f0802e959
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9be
// Size: 0x3
function function_ce236b9143b76125() {
    
}

// Namespace cruise_predator/namespace_fd47b78f0802e959
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9c8
// Size: 0x29
function function_f0b48909aba12866() {
    if (issharedfuncdefined("cruise_predator", "registerVO")) {
        [[ getsharedfunc("cruise_predator", "registerVO") ]]();
    }
}

// Namespace cruise_predator/namespace_fd47b78f0802e959
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9f8
// Size: 0x1d
function function_f06e9c09ab54c2bf() {
    level._effect["predator_pod_break"] = loadfx("vfx/iw8_mp/killstreak/vfx_cruise_predator_explosion.vfx");
}

// Namespace cruise_predator/namespace_fd47b78f0802e959
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa1c
// Size: 0x5a
function function_328fd4c30cafcce0() {
    if (isdefined(level.var_638c653eda9d1cd3)) {
        function_c0b0a582ff9e4d57(level.var_638c653eda9d1cd3);
    }
    function_c0b0a582ff9e4d57("cruise_color_mp");
    function_c0b0a582ff9e4d57("cruise_color_fog_mp");
    function_c0b0a582ff9e4d57("cruise_intro_shipment");
    function_c0b0a582ff9e4d57(level.mapname + "_cruise_intro");
}

// Namespace cruise_predator/namespace_fd47b78f0802e959
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa7d
// Size: 0xe
function weapongivencruisepredator(streakinfo) {
    return 1;
}

// Namespace cruise_predator/namespace_fd47b78f0802e959
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa93
// Size: 0x21
function tryusecruisepredator() {
    streakinfo = createstreakinfo("cruise_predator", self);
    return tryusecruisepredatorfromstruct(streakinfo);
}

// Namespace cruise_predator/namespace_fd47b78f0802e959
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xabc
// Size: 0xf7
function tryusecruisepredatorfromstruct(streakinfo) {
    if (!namespace_f64231d5b7a2c3c4::reservevehicle()) {
        return 0;
    }
    if (isdefined(level.killstreaktriggeredfunc)) {
        if (!level [[ level.killstreaktriggeredfunc ]](streakinfo)) {
            namespace_f64231d5b7a2c3c4::clearvehiclereservation();
            return 0;
        }
    }
    var_9b1deb5e9d32bbe3 = namespace_b3d24e921998a8b::streakdeploy_doweapontabletdeploy(streakinfo, &weapongivencruisepredator);
    if (!istrue(var_9b1deb5e9d32bbe3)) {
        namespace_f64231d5b7a2c3c4::clearvehiclereservation();
        return 0;
    }
    if (isdefined(level.killstreakbeginusefunc)) {
        if (!level [[ level.killstreakbeginusefunc ]](streakinfo)) {
            streakinfo notify("killstreak_finished_with_deploy_weapon");
            namespace_f64231d5b7a2c3c4::clearvehiclereservation();
            return 0;
        }
    }
    if (level.gameended) {
        streakinfo notify("killstreak_finished_with_deploy_weapon");
        return 0;
    }
    thirdperson = getdvarint(@"hash_b3b0df534800e4d5", 0);
    /#
        if (istrue(thirdperson)) {
            streakinfo notify("logKillstreakEvent");
        }
    #/
    result = runcruisepredator(streakinfo.streakname, streakinfo, thirdperson);
    if (!istrue(result)) {
        return 0;
    }
    return 1;
}

// Namespace cruise_predator/namespace_fd47b78f0802e959
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbbb
// Size: 0x45c
function runcruisepredator(streakname, streakinfo, thirdperson) {
    if (isdefined(level.var_b67b5f9dfe488c2f)) {
        thread [[ level.var_b67b5f9dfe488c2f ]](streakinfo);
    }
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["cruise_predator"];
    self disablephysicaldepthoffieldscripting();
    var_5fa1e1697a302583 = namespace_9abe40d2af041eb2::getkillstreakairstrikeheightent();
    heightoffset = bundle.var_3d67ec8c5eb61306;
    if (isdefined(var_5fa1e1697a302583)) {
        heightoffset = var_5fa1e1697a302583.origin[2] + bundle.var_c96b6fecdc57b792;
    }
    var_d38145343175dde9 = level.mapcenter;
    var_82a6786725452f17 = getdvarint(@"hash_a2e7d8fdf5d91dd9", bundle.var_8e37beb3647ea7d9);
    if (islargemap() || utility::iscp() || istrue(var_82a6786725452f17)) {
        var_d38145343175dde9 = self.origin;
    }
    allenemies = [];
    var_5e57c125ba3e9b8 = (0, 0, 0);
    forwardvector = undefined;
    var_72b9f31491f124aa = level.players;
    if (utility::iscp()) {
        var_72b9f31491f124aa = level.characters;
        if (issharedfuncdefined("player", "disable_backpack_inventory")) {
            self [[ getsharedfunc("player", "disable_backpack_inventory") ]](1);
        }
    }
    foreach (player in var_72b9f31491f124aa) {
        if (player == self) {
            continue;
        }
        if (level.teambased && player.team == self.team) {
            continue;
        }
        var_5e57c125ba3e9b8 = var_5e57c125ba3e9b8 + player.origin - var_d38145343175dde9;
        allenemies[allenemies.size] = player;
    }
    if (isdefined(var_5e57c125ba3e9b8) && allenemies.size > 0) {
        forwardvector = vectornormalize(var_5e57c125ba3e9b8 / allenemies.size);
        forwardvector = forwardvector * (1, 1, 0);
    } else {
        var_308da9b1fed33701 = randomint(360);
        forwardvector = anglestoforward((0, var_308da9b1fed33701, 0));
    }
    if (issharedfuncdefined("cruise_predator", "directionOverride")) {
        forwardvector = self [[ getsharedfunc("cruise_predator", "directionOverride") ]](forwardvector);
    }
    var_9806e3c29658cc34 = var_d38145343175dde9 + (0, 0, heightoffset);
    startpos = var_9806e3c29658cc34 - forwardvector * 3000;
    targetpos = var_d38145343175dde9 + (0, 0, int(heightoffset * 0.5));
    var_b8ee7ddd93755f86 = spawn("script_model", startpos);
    var_b8ee7ddd93755f86 setmodel(bundle.var_2ed8b1bc1fe90ef5);
    var_b8ee7ddd93755f86.owner = self;
    var_b8ee7ddd93755f86.origin = startpos;
    var_b8ee7ddd93755f86.angles = vectortoangles(targetpos - startpos);
    var_b8ee7ddd93755f86.type = "remote";
    var_b8ee7ddd93755f86.team = self.team;
    var_b8ee7ddd93755f86.entitynumber = var_b8ee7ddd93755f86 getentitynumber();
    var_b8ee7ddd93755f86.streakinfo = streakinfo;
    var_b8ee7ddd93755f86.duration = 30;
    var_b8ee7ddd93755f86.animstate = "pod_flying";
    self.restoreangles = self.angles;
    if (issharedfuncdefined("killstreak", "logKillstreakEvent")) {
        self [[ getsharedfunc("killstreak", "logKillstreakEvent") ]](streakname, var_b8ee7ddd93755f86.origin);
    }
    level.rockets[var_b8ee7ddd93755f86.entitynumber] = var_b8ee7ddd93755f86;
    level.remotemissileinprogress = 1;
    thread playkillstreakoperatordialog(streakname, streakname + "_use", 1, 1.5);
    if (issharedfuncdefined("hud", "teamPlayerCardSplash")) {
        [[ getsharedfunc("hud", "teamPlayerCardSplash") ]]("used_cruise_predator", self);
    }
    result = cruisepredator_followmissilepod(var_b8ee7ddd93755f86, targetpos, thirdperson, streakinfo, bundle);
    return result;
}

// Namespace cruise_predator/namespace_fd47b78f0802e959
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x101f
// Size: 0x48
function cruisepredator_watchintropoddisown(streakinfo, enemytargetmarkergroup, friendlytargetmarkergroup) {
    self endon("death");
    level endon("game_ended");
    self waittill("disowned");
    if (isdefined(self)) {
        cruisepredator_detachplayerfromintro(streakinfo, enemytargetmarkergroup, friendlytargetmarkergroup);
        self delete();
    }
}

// Namespace cruise_predator/namespace_fd47b78f0802e959
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x106e
// Size: 0xd8
function cruisepredator_detachplayerfromintro(streakinfo, enemytargetmarkergroup, friendlytargetmarkergroup) {
    var_4084c95c19c7937a = self.owner;
    if (isdefined(var_4084c95c19c7937a)) {
        var_4084c95c19c7937a disablephysicaldepthoffieldscripting();
        var_4084c95c19c7937a visionsetnakedforplayer("", 0);
        var_4084c95c19c7937a cameraunlink();
        var_4084c95c19c7937a val::function_c9d0b43701bdba00("cruisePredator");
        var_4084c95c19c7937a _setvisibiilityomnvarforkillstreak(streakinfo.streakname, "off");
        var_4084c95c19c7937a setclientomnvar("ui_predator_missile", 0);
        var_4084c95c19c7937a painvisionon();
        var_4084c95c19c7937a killstreak_restorenvgstate();
        var_4084c95c19c7937a killstreak_setmainvision("");
        var_4084c95c19c7937a function_8b676f496920e2ab();
        level thread namespace_36f464722d326bbe::fadetoblackforplayer(var_4084c95c19c7937a, 0, 0);
    }
    streakinfo notify("killstreak_finished_with_deploy_weapon");
    if (isdefined(enemytargetmarkergroup)) {
        namespace_f48c22429667eba9::targetmarkergroup_off(enemytargetmarkergroup);
    }
    if (isdefined(friendlytargetmarkergroup)) {
        namespace_f48c22429667eba9::targetmarkergroup_off(friendlytargetmarkergroup);
    }
}

// Namespace cruise_predator/namespace_fd47b78f0802e959
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x114d
// Size: 0x423
function cruisepredator_followmissilepod(pod, var_8929d2c10beb2fde, thirdperson, streakinfo, bundle) {
    var_7b7bc27e7e8b05e2 = get_notetrack_time(script_model%mp_cruise_missile_move_intro, "wingtrails");
    var_2cf1418bd3474069 = get_notetrack_time(script_model%mp_cruise_missile_move_intro, "shell_break");
    var_9e0fa77c44b24bf9 = get_notetrack_time(script_model%mp_cruise_missile_move_intro, "second_missile_thruster");
    var_6431d9c900610f5b = get_notetrack_time(script_model%mp_cruise_missile_move_intro, "anim_end");
    var_3b5e0765d72be907 = var_7b7bc27e7e8b05e2;
    var_421e2f527a382fb4 = var_2cf1418bd3474069 - var_7b7bc27e7e8b05e2;
    var_169c111fab319da1 = var_9e0fa77c44b24bf9 - var_2cf1418bd3474069;
    var_a2f273df08e79256 = var_6431d9c900610f5b - var_9e0fa77c44b24bf9;
    enemytargetmarkergroup = undefined;
    friendlytargetmarkergroup = undefined;
    if (!istrue(thirdperson)) {
        _stopshellshock();
        val::function_3633b947164be4f3("cruisePredator", 0);
        _setvisibiilityomnvarforkillstreak(streakinfo.streakname, "invisible");
        self setclientomnvar("ui_predator_missile", 1);
        var_2cd52bbc2a67b7cf = [];
        var_ff93381949523976 = [];
        var_2af53266405cd5bc = undefined;
        if (issharedfuncdefined("cruise_predator", "assignTargetMarkers")) {
            var_2af53266405cd5bc = self thread [[ getsharedfunc("cruise_predator", "assignTargetMarkers") ]](self);
        }
        if (isdefined(var_2af53266405cd5bc.enemytargetmarkergroup)) {
            var_2cd52bbc2a67b7cf = var_2af53266405cd5bc.enemytargetmarkergroup;
        }
        if (isdefined(var_2af53266405cd5bc.friendlytargetmarkergroup)) {
            var_ff93381949523976 = var_2af53266405cd5bc.friendlytargetmarkergroup;
        }
        enemytargetmarkergroup = namespace_f48c22429667eba9::targetmarkergroup_on("overlaytargetmarkerenemy", self, var_2cd52bbc2a67b7cf, self, 0, 1, 1);
        friendlytargetmarkergroup = namespace_f48c22429667eba9::targetmarkergroup_on("overlaytargetmarkerfriendly", self, var_ff93381949523976, self, 1, 1);
        thread function_d13d2a81214fbfb8("80_instant_noscale", 1);
        if (isdefined(level.mapname) && issubstr(level.mapname, "_shipment")) {
            self visionsetnakedforplayer("cruise_intro_shipment", 0);
        }
        if (function_b039d607d9f90f1a(level.mapname + "_cruise_intro")) {
            self visionsetnakedforplayer(level.mapname + "_cruise_intro", 0);
        }
        self cameralinkto(pod, "tag_player", 1, 1);
        pod thread cruisepredator_playdofsequence(var_9e0fa77c44b24bf9);
        self painvisionoff();
        killstreak_savenvgstate();
        pod thread cruisepredator_watchintropoddisown(streakinfo, enemytargetmarkergroup, friendlytargetmarkergroup);
        pod thread cruisepredator_watchownerdisownaction("disconnect");
        pod thread cruisepredator_watchownerdisownaction("joined_team");
        pod thread cruisepredator_watchownerdisownaction("joined_spectators");
        pod thread cruisepredator_watchownerdisownaction("player_fatal_death");
    }
    var_620f959ec25a2c58 = "mp_cruise_missile_move_intro";
    pod scriptmodelplayanimdeltamotion(var_620f959ec25a2c58);
    pod setscriptablepartstate("main_thruster", "on", 0);
    if (!istrue(thirdperson)) {
        pod playsoundtoplayer("iw9_cruise_missile_plr_intro", self);
    }
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(var_3b5e0765d72be907);
    if (!isdefined(pod)) {
        return 0;
    }
    pod setscriptablepartstate("wing_trails", "on");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(var_421e2f527a382fb4);
    if (!isdefined(pod)) {
        return 0;
    }
    pod.animstate = "pod_break";
    pod setscriptablepartstate("wing_trails", "off");
    pod setscriptablepartstate("main_thruster", "off", 0);
    playfxontag(getfx("predator_pod_break"), pod, "tag_missile");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(var_169c111fab319da1);
    if (!isdefined(pod)) {
        return 0;
    }
    pod.animstate = "missile_thrusters";
    pod setscriptablepartstate("sub_thruster", "on", 0);
    if (!isdefined(pod) || !isdefined(self)) {
        return 0;
    }
    thread cruisepredator_delayplayslamzoom(pod, var_a2f273df08e79256 - 0.15, thirdperson);
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(var_a2f273df08e79256 - 0.05);
    if (!isdefined(pod) || !isdefined(self)) {
        return 0;
    }
    thread cruisepredator_takecontrol(pod, streakinfo, thirdperson, enemytargetmarkergroup, friendlytargetmarkergroup, bundle);
    return 1;
}

// Namespace cruise_predator/namespace_fd47b78f0802e959
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1578
// Size: 0x7d
function cruisepredator_playdofsequence(var_c21a2b0040f7613c) {
    self endon("death");
    self.owner endon("disconnect");
    level endon("game_ended");
    wait(0.05);
    self.owner enablephysicaldepthoffieldscripting();
    self.owner setphysicaldepthoffield(1.4, 85, 1000, 1000);
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(var_c21a2b0040f7613c);
    self.owner setphysicaldepthoffield(0.5, 1024, 50, 50);
}

// Namespace cruise_predator/namespace_fd47b78f0802e959
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15fc
// Size: 0x70b
function cruisepredator_takecontrol(pod, streakinfo, thirdperson, enemytargetmarkergroup, friendlytargetmarkergroup, bundle) {
    pod endon("death");
    self endon("disconnect");
    level endon("game_ended");
    pod setscriptablepartstate("sub_thruster", "off", 0);
    val::set("cruisePredatorUse", "allow_movement", 1);
    val::set("cruisePredatorUse", "fire", 1);
    namespace_f64231d5b7a2c3c4::clearvehiclereservation();
    spawndata = spawnstruct();
    spawndata.origin = pod gettagorigin("tag_missile");
    spawndata.angles = pod.angles;
    spawndata.modelname = bundle.var_7d0d5f441724f854;
    spawndata.vehicletype = bundle.var_98a5091f588a7d79;
    spawndata.targetname = "rcplane";
    spawndata.cannotbesuspended = 1;
    if (iscp()) {
        var_b904048b1d6b6803 = self usinggamepad();
        spawndata.vehicletype = ter_op(var_b904048b1d6b6803, "veh_cruise_predator_cp_jup", "veh_cruise_predator_cp_jup_kbm");
    }
    var_ee8da5624236dc89 = spawnstruct();
    missile = namespace_f64231d5b7a2c3c4::_spawnvehicle(spawndata, var_ee8da5624236dc89);
    if (!isdefined(missile)) {
        /#
            thread namespace_3c37cb17ade254d::error("warhead_thruster");
        #/
        return;
    }
    if (issharedfuncdefined("killstreak", "killstreakMakeVehicle")) {
        missile [[ getsharedfunc("killstreak", "killstreakMakeVehicle") ]](streakinfo.streakname);
    }
    namespace_f64231d5b7a2c3c4::vehicle_tracking_registerinstance(missile);
    streakinfo.shots_fired++;
    missile setcandamage(0);
    missile setotherent(self);
    missile setentityowner(self);
    missile.angles = spawndata.angles;
    missile.team = self.team;
    missile.owner = self;
    missile.streakinfo = streakinfo;
    missile.lifetime = bundle.var_9c82b96f3edb0742;
    missile.weapon_name = bundle.projectileweapon;
    missile.enemytargetmarkergroup = enemytargetmarkergroup;
    missile.friendlytargetmarkergroup = friendlytargetmarkergroup;
    missile setscriptablepartstate("warhead_thruster", "on", 0);
    level thread function_ee93617532d8a679(missile, self, undefined, undefined, 1);
    missile setvehicleteam(missile.team);
    if (issharedfuncdefined("killstreak", "addToActiveKillstreakList")) {
        missile [[ getsharedfunc("killstreak", "addToActiveKillstreakList") ]](streakinfo.streakname, "Killstreak_Air", self, 0, 1, 50);
    }
    missile.killcament = spawn("script_model", missile gettagorigin("tag_player"));
    missile.killcament setmodel("tag_origin");
    missile.killcament linkto(missile, "tag_player");
    missile endon("death");
    missile namespace_5a51aa78ea0b1b9f::set_apply_emp_callback(&cruisepredator_empapplied);
    if (issharedfuncdefined("emp", "setEMP_Applied_Callback")) {
        missile [[ getsharedfunc("emp", "setEMP_Applied_Callback") ]](&cruisepredator_empapplied);
    }
    fxent = spawn("script_model", missile gettagorigin("tag_fx"));
    fxent setmodel(bundle.var_41977faa6601cc3c);
    fxent.angles = missile gettagangles("tag_fx");
    fxent.team = missile.team;
    fxent.owner = missile.owner;
    fxent.streakinfo = missile.streakinfo;
    fxent linkto(missile, "tag_fx");
    fxent setscriptablepartstate("fake_trail", "on", 0);
    fxent setotherent(self);
    fxent thread cruisepredator_watchgameend(missile, thirdperson, streakinfo);
    fxent thread cruisepredator_watchmissileinfo(missile);
    fxent thread cruisepredator_watchmissileexplosion(missile, self, missile.killcament, thirdperson, enemytargetmarkergroup, friendlytargetmarkergroup, bundle);
    missile thread cruisepredator_watchownerdisownaction("disconnect");
    missile thread cruisepredator_watchownerdisownaction("joined_team");
    missile thread cruisepredator_watchownerdisownaction("joined_spectators");
    missile thread cruisepredator_watchownerdisownaction("player_fatal_death");
    if (!istrue(thirdperson)) {
        self visionsetnakedforplayer("", 0);
        killstreak_setmainvision("");
    }
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(0.05);
    if (!istrue(thirdperson)) {
        self disablephysicaldepthoffieldscripting();
        self cameraunlink();
        thread function_d13d2a81214fbfb8("default");
        self cameralinkto(missile, "tag_player", 1);
        self usevehicle(missile, 0);
        var_fce69f389fc06869 = "cruise_color_mp";
        if (isdefined(level.mapname) && (issubstr(level.mapname, "_shipment") || issubstr(level.mapname, "mp_skerries"))) {
            var_fce69f389fc06869 = "cruise_color_fog_mp";
        }
        killstreak_setmainvision(var_fce69f389fc06869);
        if (isdefined(level.var_638c653eda9d1cd3)) {
            self.currentvisionset = level.var_638c653eda9d1cd3;
        } else {
            self.currentvisionset = "cruise_color_mp";
        }
        killstreak_setmainvision(self.currentvisionset);
        self.soundent = spawn("script_origin", missile.origin);
        self.soundent showonlytoplayer(self);
        self.soundent playloopsound("iw9_cruise_missile_plr");
        _shellshock("killstreak_veh_camera_mp", "top", missile.lifetime, 0);
        _setvisibiilityomnvarforkillstreak(streakinfo.streakname, "on");
        self setclientomnvar("ui_predator_missile", 2);
        self setclientomnvar("ui_killstreak_health", 1);
        self setclientomnvar("ui_killstreak_countdown", gettime() + int(10000));
        self setclientomnvar("ui_predator_missiles_left", -1);
        if (function_ecc973ad47944e1e()) {
            var_e8bedfce1e0c7d2 = function_44e0bd95b98288ab();
            killstreak_setmainvision(var_e8bedfce1e0c7d2);
            setthermalvision(1, 12, 1500);
            _shellshock("killstreak_veh_camera_flir_mp", "top", missile.lifetime, 0);
        }
    }
    missile thread cruisepredator_delaymissilecollision();
    randomindex = randomintrange(1, 3);
    missile thread cruisepredator_watchtimer(self, bundle.var_9c82b96f3edb0742);
    if (issharedfuncdefined("killstreak", "makePlayerVulnerableOnCruisePredatorDetonate")) {
        self thread [[ getsharedfunc("killstreak", "makePlayerVulnerableOnCruisePredatorDetonate") ]](missile);
    }
    waitframe();
    if (isdefined(pod)) {
        pod delete();
    }
}

// Namespace cruise_predator/namespace_fd47b78f0802e959
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d0e
// Size: 0x5c
function cruisepredator_watchkillborder() {
    if (!isdefined(level.kill_border_triggers)) {
        /#
            self.owner iprintln("<unknown string>");
        #/
        return;
    }
    self endon("death");
    self endon("cruise_missile_explode");
    while (1) {
        if (cruisepredator_istouchingkillborder(level.kill_border_triggers)) {
            self notify("explode");
            break;
        }
        waitframe();
    }
}

// Namespace cruise_predator/namespace_fd47b78f0802e959
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d71
// Size: 0x6f
function cruisepredator_istouchingkillborder(triggerlist) {
    var_5bef4d0c7c1d06a8 = 0;
    foreach (trigger in triggerlist) {
        if (self istouching(trigger)) {
            var_5bef4d0c7c1d06a8 = 1;
            break;
        }
    }
    return var_5bef4d0c7c1d06a8;
}

// Namespace cruise_predator/namespace_fd47b78f0802e959
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1de8
// Size: 0x3a
function cruisepredator_delaymissilecollision() {
    self endon("death");
    self endon("cruise_missile_explode");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(0.75);
    self vehphys_enablecollisioncallback(1);
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(1.25);
    thread cruisepredator_watchkillborder();
}

// Namespace cruise_predator/namespace_fd47b78f0802e959
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e29
// Size: 0x18b
function cruisepredator_watchgameend(missile, thirdperson, streakinfo) {
    missile endon("death");
    missile endon("cruise_missile_explode");
    self endon("death");
    self.owner endon("disconnect");
    level waittill_any_2("start_game_ended", "game_ended");
    missile notify("cruise_missile_force_eject");
    rider = self.owner;
    if (isdefined(missile.enemytargetmarkergroup)) {
        namespace_f48c22429667eba9::targetmarkergroup_off(missile.enemytargetmarkergroup);
    }
    if (isdefined(missile.friendlytargetmarkergroup)) {
        namespace_f48c22429667eba9::targetmarkergroup_off(missile.friendlytargetmarkergroup);
    }
    if (issharedfuncdefined("cruise_predator", "CPUnMarkEnemies")) {
        [[ getsharedfunc("cruise_predator", "CPUnMarkEnemies") ]](rider);
    }
    if (isdefined(rider)) {
        if (!istrue(thirdperson)) {
            rider cameraunlink();
            rider function_c0505f05660d120c();
            if (isdefined(rider.soundent)) {
                rider.soundent stoploopsound("iw9_cruise_missile_plr");
                rider.soundent delete();
            }
        }
        rider _setvisibiilityomnvarforkillstreak(streakinfo.streakname, "off");
        rider setclientomnvar("ui_predator_missile", 0);
        rider thread cruisepredator_returnplayer(streakinfo);
        if (issharedfuncdefined("cruise_predator", "removeItemFromSlot")) {
            [[ getsharedfunc("cruise_predator", "removeItemFromSlot") ]](rider);
        }
    }
    namespace_f64231d5b7a2c3c4::vehicle_tracking_deregisterinstance(missile);
    namespace_f64231d5b7a2c3c4::_deletevehicle(missile);
}

// Namespace cruise_predator/namespace_fd47b78f0802e959
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fbb
// Size: 0x44
function cruisepredator_watchmissileinfo(missile) {
    self endon("death");
    while (1) {
        self.missilelastpos = missile.origin;
        self.missilelastangle = missile.angles;
        waitframe();
    }
}

// Namespace cruise_predator/namespace_fd47b78f0802e959
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2006
// Size: 0x58d
function cruisepredator_watchmissileexplosion(missile, rider, killcament, thirdperson, enemytargetmarkergroup, friendlytargetmarkergroup, bundle) {
    missile endon("cruise_missile_force_eject");
    var_2846210d509edcf3 = killcament;
    explodepos = undefined;
    var_d0b12377bc0ec26f = undefined;
    streakinfo = missile.streakinfo;
    var_df4b15ee230bf93a = undefined;
    while (1) {
        var_df4b15ee230bf93a = missile function_51afe751c1e36723("collision", "explode", "death", "disowned", "emp_defused", "trophy_blocked");
        if (isdefined(var_df4b15ee230bf93a.msg) && var_df4b15ee230bf93a.msg == "collision") {
            surface = physics_getsurfacetypefromflags(var_df4b15ee230bf93a.param4);
            surfacetype = getsubstr(surface["name"], 9);
            var_716d785156e6ffb2 = getdvarint(@"hash_c2491ce0fa8bc62", 0);
            /#
                if (var_716d785156e6ffb2) {
                    iprintln("<unknown string>" + surfacetype);
                    continue;
                }
            #/
            if (surfacetype == "glass_pane") {
                continue;
            }
        }
        break;
    }
    if (isdefined(missile)) {
        missile setscriptablepartstate("warhead_thruster", "off", 0);
        missile notify("cruise_missile_explode");
    }
    if (isdefined(enemytargetmarkergroup)) {
        namespace_f48c22429667eba9::targetmarkergroup_off(enemytargetmarkergroup);
    }
    if (isdefined(friendlytargetmarkergroup)) {
        namespace_f48c22429667eba9::targetmarkergroup_off(friendlytargetmarkergroup);
    }
    if (issharedfuncdefined("cruise_predator", "CPUnMarkEnemies")) {
        [[ getsharedfunc("cruise_predator", "CPUnMarkEnemies") ]](rider);
    }
    if (isdefined(self)) {
        self setscriptablepartstate("fake_trail", "off", 0);
        thread function_1a20d385b2f41e0e();
        explodepos = self.missilelastpos;
        var_d0b12377bc0ec26f = self.missilelastangle;
        if (isdefined(rider) && !istrue(thirdperson)) {
            rider cameraunlink();
            rider function_c0505f05660d120c();
        }
        if (isdefined(missile)) {
            namespace_f64231d5b7a2c3c4::vehicle_tracking_deregisterinstance(missile);
            namespace_f64231d5b7a2c3c4::_deletevehicle(missile);
        }
        if (!isdefined(var_df4b15ee230bf93a) || var_df4b15ee230bf93a.msg != "emp_defused" && var_df4b15ee230bf93a.msg != "trophy_blocked") {
            explosionradius = bundle.var_b62ab6436ce0bb7a;
            var_5d28f39073721e59 = "MOD_EXPLOSIVE";
            var_23f8c678bd9d023e = bundle.projectileweapon;
            if (isdefined(rider)) {
                var_f9fb154dde29912b = isdefined(var_df4b15ee230bf93a) && var_df4b15ee230bf93a.msg == "disowned";
                if (!istrue(var_f9fb154dde29912b)) {
                    self radiusdamage(explodepos, explosionradius, bundle.var_560307d157b4b4f2, bundle.var_55dff1d1578e3cd8, rider, var_5d28f39073721e59, var_23f8c678bd9d023e);
                }
                players = utility::playersinsphere(explodepos, explosionradius);
                foreach (player in players) {
                    if (player _isalive() && playersareenemies(player, rider)) {
                        if (issharedfuncdefined("sound", "trySayLocalSound")) {
                            level thread [[ getsharedfunc("sound", "trySayLocalSound") ]](player, #"hash_2f4fcdb5f53af5ca", undefined, 1);
                        }
                    }
                }
            }
            if (isdefined(level.var_ca1a76fbc0ba0bef)) {
                thread [[ level.var_ca1a76fbc0ba0bef ]](self.streakinfo, self.origin, 0);
            }
        }
        if (issharedfuncdefined("shellshock", "artillery_earthQuake")) {
            [[ getsharedfunc("shellshock", "artillery_earthQuake") ]](explodepos);
        }
        thread cruisepredator_handlevfxstates(var_df4b15ee230bf93a);
    }
    if (issharedfuncdefined("cruise_predator", "eventRecord")) {
        [[ getsharedfunc("cruise_predator", "eventRecord") ]](explodepos);
    }
    if (isdefined(rider)) {
        rider thread cruisepredator_watchkills(var_df4b15ee230bf93a);
        if (!istrue(thirdperson)) {
            /#
                assertex(isdefined(explodepos) && isdefined(var_d0b12377bc0ec26f), "cruisePredator_watchMissileExplosion: Either the explodePos or missileAngles are undefined.  This shouldn't be possible.");
            #/
            if (isdefined(rider.soundent)) {
                rider.soundent stoploopsound("iw9_cruise_missile_plr");
                rider.soundent delete();
            }
            rider _setvisibiilityomnvarforkillstreak(streakinfo.streakname, "off");
            rider setclientomnvar("ui_predator_missile", 0);
            if (function_ecc973ad47944e1e()) {
                rider setthermalvision(0);
            }
            if (isdefined(level.var_f56a88761038798b)) {
                thread [[ level.var_f56a88761038798b ]](streakinfo);
            }
            visionset = "killstreak_static";
            rider thread cruisepredator_startfadecamtransition(0.4, 0.6, 0.05, visionset);
            rider playlocalsound("iw9_cruise_missile_exp_static");
            rider earthquakeforplayer(0.3, 3.5, rider.origin, 100);
            rider setclientomnvar("ui_hud_shake", 1);
            rider playrumbleonpositionforclient("artillery_rumble", rider.origin);
            rider thread cruisepredator_returnplayer(streakinfo, 1);
        }
    }
    if (issharedfuncdefined("cruise_predator", "removeItemFromSlot")) {
        [[ getsharedfunc("cruise_predator", "removeItemFromSlot") ]](rider);
    }
    wait(1.5);
}

// Namespace cruise_predator/namespace_fd47b78f0802e959
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x259a
// Size: 0x7f
function function_1a20d385b2f41e0e() {
    level endon("game_ended");
    minimapid = undefined;
    if (namespace_3c37cb17ade254d::issharedfuncdefined("game", "createObjective")) {
        minimapid = self [[ namespace_3c37cb17ade254d::getsharedfunc("game", "createObjective") ]]("icon_minimap_cruisemissile", self.team, undefined, 1, undefined, "icon_large");
    }
    wait(2);
    if (namespace_3c37cb17ade254d::issharedfuncdefined("game", "returnObjectiveID")) {
        [[ namespace_3c37cb17ade254d::getsharedfunc("game", "returnObjectiveID") ]](minimapid);
    }
}

// Namespace cruise_predator/namespace_fd47b78f0802e959
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2620
// Size: 0x43
function cruisepredator_cameramove(targetpos, startpos) {
    self moveto(targetpos, 0.2, 0, 0.05);
    wait(0.15);
    self moveto(targetpos + vectornormalize(startpos - targetpos) * 24, 2);
}

// Namespace cruise_predator/namespace_fd47b78f0802e959
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x266a
// Size: 0xd5
function cruisepredator_returnplayer(streakinfo, exploded) {
    self endon("disconnect");
    level callback::callback("killstreak_finish_use", {streakinfo:streakinfo});
    if (issharedfuncdefined("player", "disable_backpack_inventory")) {
        self [[ getsharedfunc("player", "disable_backpack_inventory") ]](0);
    }
    if (isdefined(level.killstreakfinishusefunc)) {
        level thread [[ level.killstreakfinishusefunc ]](streakinfo);
    }
    level thread restorekillstreakplayerangles(self);
    if (istrue(exploded)) {
        wait(0.5);
    }
    function_8b676f496920e2ab();
    killstreak_setmainvision("");
    self painvisionon();
    killstreak_restorenvgstate();
    val::function_588f2307a3040610("cruisePredator");
    val::function_c9d0b43701bdba00("cruisePredatorUse");
    streakinfo notify("killstreak_finished_with_deploy_weapon");
    namespace_9abe40d2af041eb2::recordkillstreakendstats(streakinfo);
}

// Namespace cruise_predator/namespace_fd47b78f0802e959
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2746
// Size: 0x34
function cruisepredator_watchtimer(rider, lifetime) {
    self endon("death");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(lifetime);
    self notify("explode", self.origin);
}

// Namespace cruise_predator/namespace_fd47b78f0802e959
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2781
// Size: 0x41
function cruisepredator_watchownerdisownaction(action) {
    self endon("death");
    self endon("disowned");
    level endon("game_ended");
    var_4084c95c19c7937a = self.owner;
    var_4084c95c19c7937a waittill(action);
    self notify("disowned");
}

// Namespace cruise_predator/namespace_fd47b78f0802e959
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x27c9
// Size: 0x21
function cruisepredator_startexplodecamtransition() {
    killstreak_setmainvision("killstreak_slamzoom");
    wait(0.1);
    killstreak_setmainvision("");
}

// Namespace cruise_predator/namespace_fd47b78f0802e959
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x27f1
// Size: 0x88
function cruisepredator_startfadecamtransition(fadeintime, var_6ea9cf1222359e6, fadeouttime, var_2007ede6118d6b9f) {
    self endon("disconnect");
    if (!isdefined(fadeintime)) {
        fadeintime = 0.5;
    }
    if (!isdefined(var_6ea9cf1222359e6)) {
        var_6ea9cf1222359e6 = 0.5;
    }
    if (!isdefined(fadeouttime)) {
        fadeouttime = 0.05;
    }
    if (isdefined(var_2007ede6118d6b9f)) {
        killstreak_setmainvision(var_2007ede6118d6b9f);
        wait(var_6ea9cf1222359e6);
        killstreak_setmainvision("");
    } else {
        level thread namespace_36f464722d326bbe::fadetoblackforplayer(self, 1, fadeintime);
        wait(var_6ea9cf1222359e6);
        level thread namespace_36f464722d326bbe::fadetoblackforplayer(self, 0, fadeouttime);
    }
}

// Namespace cruise_predator/namespace_fd47b78f0802e959
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2880
// Size: 0x4c
function cruisepredator_shakerider(var_23250ac0c394b3c8) {
    self endon("disconnect");
    counter = 0;
    while (counter < var_23250ac0c394b3c8) {
        self playrumbleonpositionforclient("damage_light", self.origin);
        counter = counter + 0.05;
        wait(0.05);
    }
}

// Namespace cruise_predator/namespace_fd47b78f0802e959
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28d3
// Size: 0x129
function cruisepredator_handlevfxstates(var_df4b15ee230bf93a) {
    self endon("death");
    self unlink();
    if (!isdefined(var_df4b15ee230bf93a) || var_df4b15ee230bf93a.msg == "explode" || var_df4b15ee230bf93a.msg == "disowned" || var_df4b15ee230bf93a.msg == "emp_defused" || var_df4b15ee230bf93a.msg == "trophy_blocked") {
        self setscriptablepartstate("air_explosion", "on", 0);
        namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(0.2);
        self delete();
    }
    worldup = (0, 0, 1);
    surfacenormal = var_df4b15ee230bf93a.param6;
    self.angles = vectortoangles(surfacenormal);
    var_75fb158dc4a7d84d = vectordot(surfacenormal, worldup);
    if (var_75fb158dc4a7d84d >= 0.7) {
        self setscriptablepartstate("ground_explosion", "on", 0);
    } else {
        self setscriptablepartstate("air_explosion", "on", 0);
    }
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(1);
    self delete();
}

// Namespace cruise_predator/namespace_fd47b78f0802e959
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a03
// Size: 0x73
function cruisepredator_watchkills(var_df4b15ee230bf93a) {
    self endon("disconnect");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(1);
    if (isdefined(self) && isdefined(self.recentkillcount)) {
        if (self.recentkillcount >= 1) {
            playkillstreakoperatordialog("cruise_predator", "cruise_predator" + "_hit_target", 1);
        } else {
            playkillstreakoperatordialog("cruise_predator", "cruise_predator" + "_miss_target", 1);
        }
    }
}

// Namespace cruise_predator/namespace_fd47b78f0802e959
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a7d
// Size: 0x66
function cruisepredator_delayplayslamzoom(pod, delaytime, thirdperson) {
    self endon("disconnect");
    pod endon("disowned");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(delaytime);
    if (!istrue(thirdperson)) {
        killstreak_setmainvision("killstreak_slamzoom");
        level thread namespace_36f464722d326bbe::fadetoblackforplayer(self, 1, 0.2);
        wait(0.2);
        level thread namespace_36f464722d326bbe::fadetoblackforplayer(self, 0, 0);
    }
}

// Namespace cruise_predator/namespace_fd47b78f0802e959
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2aea
// Size: 0x19
function cruisepredator_empapplied(data) {
    if (isdefined(self)) {
        self notify("emp_defused");
    }
}

// Namespace cruise_predator/namespace_fd47b78f0802e959
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b0a
// Size: 0x1c
function function_ecc973ad47944e1e() {
    return isnightmap() || level.mapname == "mp_jup_grandprix_pm_2";
}

