// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;
#using scripts\cp_mp\hostmigration.gsc;
#using scripts\cp_mp\killstreaks\airstrike.gsc;

#namespace white_phosphorus;

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x916
// Size: 0x99
function init() {
    if (issharedfuncdefined("white_phosphorus", "init")) {
        [[ getsharedfunc("white_phosphorus", "init") ]]();
    }
    level.activewpzones = [];
    level.activewpinnerzones = [];
    level.white_phosphorus_damage_area = getent("white_phosphorus_damage", "targetname");
    /#
        setdevdvarifuninitialized(@"hash_b72a0bb47130fb8e", 0);
        setdevdvarifuninitialized(@"hash_e33914719b665fca", 30);
        setdevdvarifuninitialized(@"hash_51c63714caa01867", 0);
        setdevdvarifuninitialized(@"hash_1aff95d5bc69c60f", 0);
    #/
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9b6
// Size: 0x78
function weapongivenwp(streakinfo) {
    if (istrue(level.wpinprogress)) {
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            self [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/WP_ACTIVE");
        }
        return 0;
    }
    if (issharedfuncdefined("white_phosphorus", "startMapSelectSequence")) {
        self [[ getsharedfunc("white_phosphorus", "startMapSelectSequence") ]](0, 1, "long_arrow");
    }
    return 1;
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa36
// Size: 0x21
function tryusewp() {
    streakinfo = createstreakinfo("white_phosphorus", self);
    return tryusewpfromstruct(streakinfo);
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa5f
// Size: 0x180
function tryusewpfromstruct(streakinfo) {
    level endon("game_ended");
    self endon("disconnect");
    if (isdefined(level.killstreaktriggeredfunc)) {
        if (!level [[ level.killstreaktriggeredfunc ]](streakinfo)) {
            return 0;
        }
    }
    deployweaponobj = makeweapon("ks_remote_map_mp");
    var_9b1deb5e9d32bbe3 = namespace_b3d24e921998a8b::streakdeploy_doweaponswitchdeploy(streakinfo, deployweaponobj, 1, &weapongivenwp);
    if (!istrue(var_9b1deb5e9d32bbe3)) {
        return 0;
    }
    if (isdefined(level.killstreakbeginusefunc)) {
        if (!level [[ level.killstreakbeginusefunc ]](streakinfo)) {
            return 0;
        }
    }
    mappointinfo = wp_getmapselectioninfo(streakinfo, 1, 1);
    if (!isdefined(mappointinfo)) {
        return 0;
    }
    thread wp_startdeploy(mappointinfo, streakinfo);
    var_52a5be2e2f91d710 = undefined;
    if (issharedfuncdefined("sound", "playKillstreakDeployDialog")) {
        [[ getsharedfunc("sound", "playKillstreakDeployDialog") ]](self, streakinfo.streakname);
        var_52a5be2e2f91d710 = 2;
    }
    thread playkillstreakoperatordialog("white_phosphorus", "use_" + streakinfo.streakname, 1, var_52a5be2e2f91d710);
    if (issharedfuncdefined("killstreak", "logKillstreakEvent")) {
        self [[ getsharedfunc("killstreak", "logKillstreakEvent") ]]("white_phosphorus", self.origin);
    }
    if (issharedfuncdefined("hud", "teamPlayerCardSplash")) {
        self thread [[ getsharedfunc("hud", "teamPlayerCardSplash") ]]("used_white_phosphorus", self);
    }
    return 1;
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbe7
// Size: 0xa9
function wp_getmapselectioninfo(streakinfo, var_9857725b52cce14b, var_edc5bb5a4b3dd2ff) {
    val::set("map_selection", "weapon_switch", 0);
    self setsoundsubmix("mp_killstreak_overlay");
    mappointinfo = undefined;
    if (issharedfuncdefined("white_phosphorus", "getSelectMapPoint")) {
        mappointinfo = self [[ getsharedfunc("white_phosphorus", "getSelectMapPoint") ]](streakinfo, var_9857725b52cce14b, var_edc5bb5a4b3dd2ff);
    }
    if (!isdefined(mappointinfo)) {
        val::function_c9d0b43701bdba00("map_selection");
        self clearsoundsubmix("mp_killstreak_overlay");
        return undefined;
    }
    val::function_c9d0b43701bdba00("map_selection");
    self clearsoundsubmix("mp_killstreak_overlay");
    return mappointinfo;
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc98
// Size: 0x106
function wp_startdeploy(mappointinfo, streakinfo) {
    self endon("disconnect");
    level endon("game_ended");
    if (istrue(level.wpinprogress)) {
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            self [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/WP_ACTIVE");
        }
        return 0;
    }
    level.wpinprogress = 1;
    foreach (var_47b05a700340406e, var_470c049a636db53d in mappointinfo) {
        var_b21e2e887c161b9 = var_470c049a636db53d.location;
        directionyaw = var_470c049a636db53d.angles;
        wp_finishdeployment(var_b21e2e887c161b9, directionyaw, streakinfo);
        if (mappointinfo.size > 1 && var_47b05a700340406e < mappointinfo.size - 1) {
            wait(randomfloatrange(1, 3));
        }
    }
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xda5
// Size: 0x96
function wp_finishdeployment(droplocation, var_ae3d7191a8c7cba9, streakinfo) {
    level endon("white_phosphorus_end");
    level endon("game_ended");
    thread wp_watchdisownaction("disconnect");
    thread wp_watchdisownaction("joined_team");
    thread wp_watchdisownaction("joined_spectator");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(3);
    var_83c2ab15f0a8b72c = wp_createplane(droplocation, var_ae3d7191a8c7cba9, streakinfo);
    if (!isdefined(var_83c2ab15f0a8b72c)) {
        /#
            assertmsg("White Phosphorus ( wp_finishDeployment ): Could not create plane.  This should not happen!");
        #/
        return 0;
    }
    var_83c2ab15f0a8b72c thread wp_watchplanedisowned();
    var_83c2ab15f0a8b72c thread wp_deliverpayloads(streakinfo);
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe42
// Size: 0x21b
function wp_createplane(var_c29d6830464cad8, var_373a9c97cc32a2f9, streakinfo) {
    var_5fa1e1697a302583 = namespace_9abe40d2af041eb2::getkillstreakairstrikeheightent();
    planehalfdistance = 28000;
    var_23122e7b902f2ea9 = 5000;
    planeflyheight = 2500;
    var_361663d437db22f5 = 1500;
    var_22dc3a1e20682bb6 = (0, var_373a9c97cc32a2f9, 0);
    if (!isdefined(var_5fa1e1697a302583)) {
        /#
            assertmsg("NO DEFINED AIRSTRIKE HEIGHT SCRIPT_ORIGIN IN LEVEL");
        #/
        planeflyheight = planeflyheight + 3000;
    } else {
        planeflyheight = var_5fa1e1697a302583.origin[2] + 3000;
        var_361663d437db22f5 = namespace_203b58a09d020a50::getexplodedistance(planeflyheight);
    }
    flightpath = namespace_203b58a09d020a50::getflightpath(var_c29d6830464cad8, var_22dc3a1e20682bb6, planehalfdistance, var_5fa1e1697a302583, planeflyheight, var_23122e7b902f2ea9, var_361663d437db22f5);
    plane = spawn("script_model", flightpath["startPoint"]);
    plane.angles = var_22dc3a1e20682bb6;
    plane.flightpath = flightpath;
    plane.owner = self;
    plane.team = self.team;
    plane.streakinfo = streakinfo;
    plane.speed = var_23122e7b902f2ea9;
    planemodel = "veh9_mil_air_suniform25_mp";
    if (namespace_f8065cafc523dba5::getplayersuperfaction(self)) {
        planemodel = "veh9_mil_air_suniform25_mp";
    }
    plane setmodel(planemodel);
    minimapid = undefined;
    createfunc = undefined;
    if (namespace_3c37cb17ade254d::issharedfuncdefined("game", "createObjective")) {
        createfunc = namespace_3c37cb17ade254d::getsharedfunc("game", "createObjective");
    }
    if (isdefined(createfunc)) {
        minimapid = plane [[ createfunc ]]("icon_minimap_wp", plane.team, 1, 1, 1);
        plane.minimapid = minimapid;
    }
    if (issharedfuncdefined("killstreak", "addToActiveKillstreakList")) {
        plane [[ getsharedfunc("killstreak", "addToActiveKillstreakList") ]](plane.streakinfo.streakname, "Killstreak_Air", self);
    }
    return plane;
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1065
// Size: 0x38
function wp_watchdisownaction(action, var_83c2ab15f0a8b72c) {
    level endon("white_phosphorus_end");
    level endon("game_ended");
    self waittill(action);
    level.wpinprogress = undefined;
    level notify("white_phosphorus_end");
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10a4
// Size: 0x1a
function wp_watchplanedisowned() {
    self endon("death");
    level waittill("white_phosphorus_end");
    wp_removeplane(self);
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10c5
// Size: 0x67
function wp_watchforsmokedisowned() {
    self endon("death");
    level waittill("white_phosphorus_end");
    if (wp_isactivewpzone("smoke", self)) {
        level wp_removefromactivewplist("smoke", self);
    } else {
        var_58a24e382101896d = 0;
        /#
            var_58a24e382101896d = getdvarint(@"hash_1aff95d5bc69c60f", 0);
        #/
        if (var_58a24e382101896d) {
            self freescriptable();
        } else {
            self delete();
        }
    }
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1133
// Size: 0x94
function wp_watchforflaredisowned(effecttype) {
    self endon("death");
    level waittill("white_phosphorus_end");
    if (isdefined(self.killcament)) {
        self.killcament delete();
    }
    if (wp_isactivewpzone("inner", self)) {
        level wp_removefromactivewplist("inner", self, effecttype, 1);
    }
    self notify("stop_wp_status_effect");
    var_58a24e382101896d = 0;
    /#
        var_58a24e382101896d = getdvarint(@"hash_1aff95d5bc69c60f", 0);
    #/
    if (var_58a24e382101896d) {
        self freescriptable();
    } else {
        self delete();
    }
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11ce
// Size: 0x22a
function wp_deliverpayloads(streakinfo) {
    level endon("white_phosphorus_end");
    level endon("game_ended");
    var_c12314b8b47f7c35 = self.flightpath["startPoint"];
    var_bea66d09411db20 = self.flightpath["endPoint"];
    flighttime = self.flightpath["flyTime"];
    var_924d800be62c4e51 = var_c12314b8b47f7c35 + anglestoforward(self.angles) * 12500;
    var_aad5bb2395b29d70 = var_bea66d09411db20 - anglestoforward(self.angles) * 12500;
    var_c2deffe4aba8fa7c = length(var_924d800be62c4e51 - var_aad5bb2395b29d70);
    var_30a3f1579ca0253a = 30;
    /#
        var_30a3f1579ca0253a = getdvarint(@"hash_e33914719b665fca", 30);
        var_12e35e098f9c7baa = getdvarint(@"hash_b72a0bb47130fb8e", 0);
        if (var_12e35e098f9c7baa) {
            line(var_c12314b8b47f7c35, var_bea66d09411db20, (1, 1, 1), 1, 0, var_30a3f1579ca0253a * 30);
        }
    #/
    self.owner thread wp_watchend(streakinfo, var_30a3f1579ca0253a);
    self.owner thread wp_watchgameend(streakinfo);
    self moveto(var_bea66d09411db20, flighttime);
    self setscriptablepartstate("bodyFX", "on", 0);
    self scriptmodelplayanim("mp_suniform25_flyin");
    thread wp_enterpayloadaudio();
    thread wp_exitpayloadaudio(var_bea66d09411db20, flighttime);
    var_e9727e658ca8dfd2 = 3;
    /#
        var_d37001da25f53f68 = getdvarint(@"hash_51c63714caa01867", 0);
        if (var_d37001da25f53f68) {
            var_e9727e658ca8dfd2 = 1;
        }
    #/
    wp_handlepayloadtyperelease(&wp_fireairburst, var_c12314b8b47f7c35, var_924d800be62c4e51, var_c2deffe4aba8fa7c, var_30a3f1579ca0253a, 4000, var_e9727e658ca8dfd2, 1);
    wp_handlepayloadtyperelease(&wp_firesmoke, var_c12314b8b47f7c35, var_924d800be62c4e51, var_c2deffe4aba8fa7c, var_30a3f1579ca0253a, 4000, 3, 1);
    wp_handlepayloadtyperelease(&wp_fireflaregroup, var_c12314b8b47f7c35, var_924d800be62c4e51, var_c2deffe4aba8fa7c, var_30a3f1579ca0253a, 2000, 6, 2);
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(flighttime);
    self stopsounds();
    self scriptmodelplayanimdeltamotion("mp_suniform25_exit");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(5.33);
    wp_removeplane(self);
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13ff
// Size: 0x41
function wp_watchend(streakinfo, var_30a3f1579ca0253a) {
    self endon("disconnect");
    level endon("white_phosphorus_end");
    level endon("game_ended");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(var_30a3f1579ca0253a);
    self notify("white_phosphorus_finished");
    namespace_9abe40d2af041eb2::recordkillstreakendstats(streakinfo);
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1447
// Size: 0x31
function wp_watchgameend(streakinfo) {
    self endon("disconnect");
    self endon("white_phosphorus_finished");
    level endon("white_phosphorus_end");
    level waittill("game_ended");
    namespace_9abe40d2af041eb2::recordkillstreakendstats(streakinfo);
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x147f
// Size: 0x1e
function wp_enterpayloadaudio() {
    self endon("death");
    level endon("white_phosphorus_end");
    waitframe();
    self playsoundonmovingent("iw8_mp_white_phos_su25_flyby");
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14a4
// Size: 0x36
function wp_exitpayloadaudio(var_bea66d09411db20, flighttime) {
    self endon("death");
    level endon("white_phosphorus_end");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(flighttime);
    playsoundatpos(var_bea66d09411db20, "iw8_mp_white_phos_su25_exit");
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14e1
// Size: 0x44
function wp_watchunsuccessfulzones(var_eb34677262fed134) {
    level endon("wp_zone_succeeded");
    level endon("game_ended");
    for (var_cf6d87d10fa26355 = 0; var_cf6d87d10fa26355 < var_eb34677262fed134; var_cf6d87d10fa26355++) {
        level waittill("wp_zone_failed");
    }
    level.wpinprogress = undefined;
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x152c
// Size: 0x1ba
function wp_handlepayloadtyperelease(var_fab341cde0f5a8a4, var_3e69f8d86497745d, var_ec975df40affb201, var_985ed30dff21f18c, var_30a3f1579ca0253a, var_624c6f581e3a3784, var_f5c59be7baf53b36, var_3c6798c87677a9c3) {
    var_bebe0d78a71db256 = int(var_985ed30dff21f18c / var_624c6f581e3a3784);
    var_d0bb190b577957f4 = 0;
    if (!isdefined(var_f5c59be7baf53b36)) {
        var_f5c59be7baf53b36 = var_bebe0d78a71db256;
    } else {
        var_2dbc68179e13ea9e = var_bebe0d78a71db256 - var_f5c59be7baf53b36;
        var_d0bb190b577957f4 = int(var_2dbc68179e13ea9e / 2);
    }
    if (isdefined(var_3c6798c87677a9c3)) {
        var_d0bb190b577957f4 = var_d0bb190b577957f4 + var_3c6798c87677a9c3;
    }
    var_67b9ab39704d906e = anglestoforward(self.angles);
    var_6622bf241e83cb33 = var_ec975df40affb201;
    var_b75ca07ccc1468b5 = 0;
    for (i = 0; i < var_bebe0d78a71db256; i++) {
        var_b540fedd1d9812f4 = length(var_3e69f8d86497745d - var_6622bf241e83cb33) / self.speed;
        if (i < var_d0bb190b577957f4) {
            var_6622bf241e83cb33 = var_6622bf241e83cb33 + var_67b9ab39704d906e * var_624c6f581e3a3784;
        } else {
            var_5e4b11a3dbe28124 = var_6622bf241e83cb33 - (0, 0, 2000);
            if (var_fab341cde0f5a8a4 == &wp_fireflaregroup) {
                killcament = spawn("script_model", var_3e69f8d86497745d + (0, 0, 1500));
                killcament thread wp_movekillcam(var_b540fedd1d9812f4, var_5e4b11a3dbe28124, var_67b9ab39704d906e, var_30a3f1579ca0253a);
                self thread [[ var_fab341cde0f5a8a4 ]](var_5e4b11a3dbe28124, var_67b9ab39704d906e, var_b540fedd1d9812f4, killcament);
            } else if (var_fab341cde0f5a8a4 == &wp_firesmoke) {
                self thread [[ var_fab341cde0f5a8a4 ]](var_5e4b11a3dbe28124, var_67b9ab39704d906e, var_b540fedd1d9812f4, i);
            } else {
                self thread [[ var_fab341cde0f5a8a4 ]](var_5e4b11a3dbe28124, var_67b9ab39704d906e, var_b540fedd1d9812f4);
            }
            var_6622bf241e83cb33 = var_6622bf241e83cb33 + var_67b9ab39704d906e * var_624c6f581e3a3784;
            var_b75ca07ccc1468b5++;
            if (var_b75ca07ccc1468b5 == var_f5c59be7baf53b36) {
                break;
            }
        }
    }
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16ed
// Size: 0x76
function wp_movekillcam(movetime, endpos, var_d3dc97c59992d51, var_30a3f1579ca0253a) {
    self endon("death");
    endpos = endpos - var_d3dc97c59992d51 * 3500;
    var_1f67f5e7a912ee6d = endpos - var_d3dc97c59992d51 * 1000;
    self moveto(endpos, movetime + 3);
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(movetime + 2);
    self moveto(var_1f67f5e7a912ee6d, 3);
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(var_30a3f1579ca0253a);
    self delete();
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x176a
// Size: 0xa4
function wp_testpayloads(testpos, testangles, var_c64748f70e85140d) {
    self endon("death");
    /#
        var_30a3f1579ca0253a = getdvarint(@"hash_e33914719b665fca", 30);
        var_12e35e098f9c7baa = getdvarint(@"hash_b72a0bb47130fb8e", 0);
        if (var_12e35e098f9c7baa) {
            sphere(testpos, 50, (1, 1, 1), 0, var_30a3f1579ca0253a * 30);
            line(testpos, testpos - (0, 0, 5000), (1, 1, 1), 1, 0, var_30a3f1579ca0253a * 30);
        }
    #/
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1815
// Size: 0xd2
function wp_fireairburst(var_2d7a2733c414e4df, var_db855e6ae67f1a7f, var_854bddfcc12bbc97) {
    level endon("white_phosphorus_end");
    level endon("game_ended");
    var_89c07a70b638fdd = var_2d7a2733c414e4df - var_db855e6ae67f1a7f * 3000;
    soundorigin = var_2d7a2733c414e4df - var_db855e6ae67f1a7f * 2000;
    var_30a3f1579ca0253a = 30;
    /#
        var_30a3f1579ca0253a = getdvarint(@"hash_e33914719b665fca", 30);
        var_12e35e098f9c7baa = getdvarint(@"hash_b72a0bb47130fb8e", 0);
        if (var_12e35e098f9c7baa) {
            sphere(var_89c07a70b638fdd, 100, (0, 1, 1), 0, var_30a3f1579ca0253a * 30);
        }
    #/
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(var_854bddfcc12bbc97);
    playfx(getfx("white_phosphorus_inair_explosion"), var_89c07a70b638fdd, var_db855e6ae67f1a7f);
    playsoundatpos(soundorigin, "iw8_mp_white_phos_midair_explo");
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18ee
// Size: 0x3a7
function wp_firesmoke(var_1ef6e5290287fb69, var_29c782c334f31ff1, var_ba62a61666563104, var_3624ce7e27390368) {
    level endon("white_phosphorus_end");
    level endon("game_ended");
    if (!isdefined(self.playersininitialsmokerange)) {
        self.playersininitialsmokerange = [];
    }
    if (!isdefined(self.playersoutsideinitialsmokerange)) {
        self.playersoutsideinitialsmokerange = [];
    }
    var_d1e8f547be452b54 = 1;
    if (islargemap() && level.gametype != "arm" && level.gametype != "conflict") {
        var_d1e8f547be452b54 = 0;
    }
    if (issharedfuncdefined("white_phosphorus", "fullMapCoverageOverride")) {
        var_d1e8f547be452b54 = [[ getsharedfunc("white_phosphorus", "fullMapCoverageOverride") ]]();
    }
    var_9f48ddebdb600442 = ray_trace(var_1ef6e5290287fb69, var_1ef6e5290287fb69 - (0, 0, 10000));
    var_34d5e8b89a1586d3 = var_9f48ddebdb600442["position"];
    var_30a3f1579ca0253a = 30;
    /#
        var_30a3f1579ca0253a = getdvarint(@"hash_e33914719b665fca", 30);
        var_12e35e098f9c7baa = getdvarint(@"hash_b72a0bb47130fb8e", 0);
        if (var_12e35e098f9c7baa) {
            sphere(var_1ef6e5290287fb69, 200, (1, 1, 0), 0, var_30a3f1579ca0253a * 30);
        }
    #/
    if (issharedfuncdefined("white_phosphorus", "getPayloadLifetimeOverride")) {
        var_30a3f1579ca0253a = [[ getsharedfunc("white_phosphorus", "getPayloadLifetimeOverride") ]]();
    }
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(var_ba62a61666563104);
    var_58a24e382101896d = 0;
    /#
        var_58a24e382101896d = getdvarint(@"hash_1aff95d5bc69c60f", 0);
    #/
    if (issharedfuncdefined("white_phosphorus", "getWpSpawnType")) {
        var_58a24e382101896d = [[ getsharedfunc("white_phosphorus", "getWpSpawnTypeOverride") ]]();
    }
    if (var_58a24e382101896d) {
        var_6b5d366f98ba252b = spawnscriptable("ks_white_phosphorus_mp_p", var_34d5e8b89a1586d3, self.angles);
    } else {
        var_6b5d366f98ba252b = spawn("script_model", var_34d5e8b89a1586d3);
        var_6b5d366f98ba252b setmodel("ks_white_phosphorus_mp");
        var_6b5d366f98ba252b setentityowner(self.owner);
    }
    var_6b5d366f98ba252b.team = self.team;
    var_6b5d366f98ba252b.owner = self.owner;
    var_6b5d366f98ba252b.streakinfo = self.streakinfo;
    var_6b5d366f98ba252b thread wp_watchforsmokedisowned();
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(1);
    level thread wp_playimpactsound(var_6b5d366f98ba252b);
    if (istrue(var_d1e8f547be452b54)) {
        var_f43a453571b50e3d = isdefined(var_3624ce7e27390368) && var_3624ce7e27390368 == 3;
        if (istrue(var_f43a453571b50e3d)) {
            namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(3.5);
            self.playersininitialsmokerange = utility::playersincylinder(var_34d5e8b89a1586d3, 2000);
            self.playersoutsideinitialsmokerange = array_difference(level.players, self.playersininitialsmokerange);
            var_6b5d366f98ba252b thread wp_watchdisorienteffect(2000, self.playersininitialsmokerange, self.playersoutsideinitialsmokerange);
        }
    } else {
        if (isnightmap()) {
            var_6b5d366f98ba252b setscriptablepartstate("smoke_night", "on", 0);
        } else {
            var_6b5d366f98ba252b setscriptablepartstate("smoke", "on", 0);
        }
        namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(3.5);
        var_6b5d366f98ba252b thread wp_watchdisorienteffect(2000, var_d1e8f547be452b54);
        /#
            var_12e35e098f9c7baa = getdvarint(@"hash_b72a0bb47130fb8e", 0);
            if (var_12e35e098f9c7baa) {
                sphere(var_6b5d366f98ba252b.origin, 2000, (1, 1, 0), 0, var_30a3f1579ca0253a * 24);
            }
        #/
    }
    level wp_addtoactivewplist("smoke", var_6b5d366f98ba252b);
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(var_30a3f1579ca0253a);
    level wp_removefromactivewplist("smoke", var_6b5d366f98ba252b);
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c9c
// Size: 0x2f6
function wp_fireflaregroup(var_ccb4bc85e1f59f16, var_47aae5e47f9b546c, var_cf7bc521ec91e2b3, killcament) {
    level endon("white_phosphorus_end");
    level endon("game_ended");
    var_a97f1d7e9a99e8f6 = self.owner;
    var_59a0861125fdcd0a = self.team;
    var_d2ddc5d6ab4565e2 = self.angles;
    var_9f48ddebdb600442 = ray_trace(var_ccb4bc85e1f59f16, var_ccb4bc85e1f59f16 - (0, 0, 10000), self, undefined, 1, 1);
    var_34d5e8b89a1586d3 = var_9f48ddebdb600442["position"];
    var_86d82c4a83032a88 = var_9f48ddebdb600442["surfacetype"];
    var_fecf0ccf76f88985 = isdefined(level.white_phosphorus_damage_area);
    if (istrue(var_fecf0ccf76f88985)) {
        level.white_phosphorus_damage_area dontinterpolate();
        level.white_phosphorus_damage_area.owner = var_a97f1d7e9a99e8f6;
        level.white_phosphorus_damage_area.team = var_59a0861125fdcd0a;
        level.white_phosphorus_damage_area.streakinfo = self.streakinfo;
    }
    var_30a3f1579ca0253a = 30;
    /#
        var_30a3f1579ca0253a = getdvarint(@"hash_e33914719b665fca", 30);
    #/
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(var_cf7bc521ec91e2b3);
    var_f03e9d02c0ff2c99 = wp_getflarepositions(var_ccb4bc85e1f59f16, var_34d5e8b89a1586d3, 4, int(250));
    foreach (struct in var_f03e9d02c0ff2c99) {
        var_58a24e382101896d = 0;
        /#
            var_58a24e382101896d = getdvarint(@"hash_1aff95d5bc69c60f", 0);
        #/
        if (var_58a24e382101896d) {
            flare = spawnscriptable("ks_white_phosphorus_mp_p", struct.flareorigin, var_d2ddc5d6ab4565e2);
        } else {
            flare = spawn("script_model", struct.flareorigin);
            flare setmodel("ks_white_phosphorus_mp");
            flare setentityowner(var_a97f1d7e9a99e8f6);
            flare.angles = var_d2ddc5d6ab4565e2;
        }
        flare.owner = var_a97f1d7e9a99e8f6;
        flare.team = var_59a0861125fdcd0a;
        flare.streakinfo = self.streakinfo;
        flare.struct = struct;
        flare.weapon_name = "white_phosphorus_proj_mp";
        flare.killcament = killcament;
        flare thread wp_watchforflaredisowned("burn");
        flare thread wp_projwatchimpact(var_30a3f1579ca0253a, "burn", var_86d82c4a83032a88);
        wait(randomfloatrange(0.1, 0.4));
    }
    if (istrue(var_fecf0ccf76f88985)) {
        level.white_phosphorus_damage_area.origin = (0, 0, 50000);
    }
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f99
// Size: 0x1d3
function wp_getflarepositions(launchpos, var_70a67134926de6dc, numpoints, var_fcdcc201ce6e652e) {
    var_60e5d173cfb587a8 = [];
    var_6f680ee249f67b0d = self.angles * (0, 1, 0);
    var_4b52f031a2cbef8e = anglestoforward(var_6f680ee249f67b0d);
    var_d8bb89f41ae3d919 = anglestoright(var_6f680ee249f67b0d);
    contents = [0:"physicscontents_clipshot", 1:"physicscontents_missileclip", 2:"physicscontents_vehicle"];
    contentoverride = physics_createcontents(contents);
    var_7ba409015d76660f = -2000;
    var_bca221bd88841350 = 0;
    for (i = 0; i < numpoints; i++) {
        var_5b91512983a7dbae = var_4b52f031a2cbef8e * var_7ba409015d76660f + var_d8bb89f41ae3d919 * var_bca221bd88841350;
        var_11c8174cf2c79029 = var_70a67134926de6dc + var_4b52f031a2cbef8e * var_7ba409015d76660f;
        var_a18d8b24190a4ad7 = var_70a67134926de6dc + var_5b91512983a7dbae;
        var_cede89de9d142b28 = namespace_2a184fc4902783dc::ray_trace(var_a18d8b24190a4ad7 + (0, 0, launchpos[2]), var_a18d8b24190a4ad7 - (0, 0, 10000), level.characters, contentoverride);
        flareorigin = var_cede89de9d142b28["position"];
        damageorigin = var_70a67134926de6dc * (1, 1, 0) + (0, 0, flareorigin[2]) + var_4b52f031a2cbef8e * var_7ba409015d76660f;
        var_5d9ff3e35698ceb7 = spawnstruct();
        var_5d9ff3e35698ceb7.damageorigin = damageorigin;
        var_5d9ff3e35698ceb7.flareorigin = flareorigin;
        var_60e5d173cfb587a8[var_60e5d173cfb587a8.size] = var_5d9ff3e35698ceb7;
        var_7ba409015d76660f = var_7ba409015d76660f + 500;
        var_bca221bd88841350 = randomintrange(-750, 750);
    }
    return var_60e5d173cfb587a8;
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2174
// Size: 0x240
function wp_projwatchimpact(var_30a3f1579ca0253a, effecttype, var_86d82c4a83032a88) {
    self endon("death");
    level endon("white_phosphorus_end");
    level endon("game_ended");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(2.5);
    self.projimpacted = 1;
    level wp_addtoactivewplist("inner", self);
    self setscriptablepartstate("impact", "on", 0);
    if (isdefined(var_86d82c4a83032a88) && var_86d82c4a83032a88 == "surftype_water") {
        self setscriptablepartstate("flare_death_water", "on", 0);
    } else {
        self setscriptablepartstate("flare", "on", 0);
    }
    var_420dc592a2640a78 = self.struct.damageorigin + (0, 0, 10);
    if (isdefined(self.owner)) {
        self radiusdamage(var_420dc592a2640a78, 512, 500, 500, self.owner, "MOD_EXPLOSIVE", "white_phosphorus_proj_mp");
        /#
            var_12e35e098f9c7baa = getdvarint(@"hash_b72a0bb47130fb8e", 0);
            if (var_12e35e098f9c7baa) {
                sphere(var_420dc592a2640a78, 512, (1, 1, 0), 0, var_30a3f1579ca0253a * 30);
            }
        #/
    }
    if (isdefined(var_86d82c4a83032a88) && var_86d82c4a83032a88 != "surftype_water") {
        if (isdefined(effecttype)) {
            self.killcament = spawn("script_model", self.origin + (0, 0, 100));
            if (effecttype == "burn") {
                thread wp_watchburneffect(300);
            } else {
                thread wp_watchblindeffect(300);
            }
            if (!iscp()) {
                killstreak_createdangerzone(self.origin, 300, 300, var_30a3f1579ca0253a, self.owner, self.team);
                thread wp_deletedangerzoneondeath();
            }
        }
        namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(var_30a3f1579ca0253a);
        level wp_removefromactivewplist("inner", self, effecttype, 1);
        self notify("stop_wp_status_effect");
        self setscriptablepartstate("flare", "off", 0);
        self setscriptablepartstate("flare_death", "on", 0);
    }
    if (isdefined(self.killcament)) {
        self.killcament delete();
    }
    thread wp_delayzonedelete(15);
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23bb
// Size: 0x2e
function wp_deletedangerzoneondeath() {
    level endon("game_ended");
    dangerzoneid = self.dangerzoneid;
    self waittill("death");
    killstreak_destroydangerzone(dangerzoneid);
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23f0
// Size: 0x5e
function wp_delayzonedelete(timedelay) {
    self endon("death");
    level endon("white_phosphorus_end");
    level endon("game_ended");
    var_58a24e382101896d = 0;
    /#
        var_58a24e382101896d = getdvarint(@"hash_1aff95d5bc69c60f", 0);
    #/
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(timedelay);
    if (var_58a24e382101896d) {
        self freescriptable();
    } else {
        self delete();
    }
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2455
// Size: 0x19c
function wp_watchdisorienteffect(var_2064c9035e8fddd4, var_73798c47bd1e4e64, var_1f86b15faeb68186) {
    self endon("death");
    self.playersindisorientradius = [];
    if (isdefined(var_73798c47bd1e4e64) && isdefined(var_1f86b15faeb68186)) {
        thread wp_delaydisorientplayersinrange(0.15, 2000, var_73798c47bd1e4e64);
        thread wp_delaydisorientplayersinrange(0.25, undefined, var_1f86b15faeb68186);
    } else {
        while (1) {
            var_9eab05d07992eb78 = utility::playersincylinder(self.origin, var_2064c9035e8fddd4);
            var_75837944482f9ece = array_difference(level.players, var_9eab05d07992eb78);
            foreach (player in var_9eab05d07992eb78) {
                if (!player namespace_f8065cafc523dba5::_isalive()) {
                    continue;
                }
                if (!wp_isinwpzone("smoke", player, self)) {
                    wp_addplayertostatusradiuslist("smoke", player);
                }
                if (!istrue(player.wpdisorient)) {
                    player thread wp_startdisorientplayer(self);
                }
            }
            foreach (player in var_75837944482f9ece) {
                if (!player namespace_f8065cafc523dba5::_isalive()) {
                    continue;
                }
                if (istrue(player.wpdisorient) && wp_isinwpzone("smoke", player, self)) {
                    player thread wp_stopdisorientplayer(self);
                }
            }
            waitframe();
        }
    }
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25f8
// Size: 0x8c
function wp_getplayerswithinrange(var_fe16f116477f0084, range) {
    playersinrange = [];
    foreach (player in var_fe16f116477f0084) {
        if (distance2dsquared(self.origin, player.origin) <= range * range) {
            playersinrange[playersinrange.size] = player;
        }
    }
    return playersinrange;
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x268c
// Size: 0xdb
function wp_delaydisorientplayersinrange(delaytime, range, var_d64f8bee3f6893e3) {
    self endon("death");
    if (isdefined(delaytime) && delaytime > 0) {
        namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(delaytime);
    }
    var_f1c102cd6fd079fb = var_d64f8bee3f6893e3;
    if (isdefined(range) && range > 0) {
        var_f1c102cd6fd079fb = wp_getplayerswithinrange(var_d64f8bee3f6893e3, range);
    }
    foreach (player in var_f1c102cd6fd079fb) {
        if (player namespace_f8065cafc523dba5::_isalive()) {
            wp_addplayertostatusradiuslist("smoke", player);
            if (!istrue(player.wpdisorient)) {
                player thread wp_startdisorientplayer(self);
            }
        }
        player thread wp_startdisorientplayeronspawn(self);
    }
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x276e
// Size: 0x11b
function wp_watchburneffect(var_5d889fd269dfb5ca) {
    self endon("stop_wp_status_effect");
    self endon("death");
    self.playersininnerradius = [];
    while (1) {
        foreach (player in level.players) {
            if (!player namespace_f8065cafc523dba5::_isalive()) {
                continue;
            }
            if (distance2d(self.origin, player.origin) <= var_5d889fd269dfb5ca && namespace_2a184fc4902783dc::ray_trace_passed(player geteye(), self.origin + (0, 0, 30), player)) {
                if (!istrue(player.wpburning)) {
                    player thread wp_startburnplayer(self, self.owner);
                }
            } else if (istrue(player.wpburning) && wp_isinwpzone("inner", player, self)) {
                player wp_stopburnplayer(self);
            }
        }
        waitframe();
    }
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2890
// Size: 0x111
function wp_watchblindeffect(var_36f2e76bc9e35ac6) {
    self endon("stop_wp_status_effect");
    self endon("death");
    self.playersininnerradius = [];
    while (1) {
        foreach (player in level.players) {
            if (!player namespace_f8065cafc523dba5::_isalive()) {
                continue;
            }
            if (distance2d(self.origin, player.origin) <= var_36f2e76bc9e35ac6 && namespace_2a184fc4902783dc::ray_trace_passed(player geteye(), self.origin + (0, 0, 30), player)) {
                if (!istrue(player.wpblinding)) {
                    player wp_startblindplayer(self);
                }
            } else if (istrue(player.wpblinding) && wp_isinwpzone("inner", player, self)) {
                player wp_stopblindplayer(self);
            }
        }
        waitframe();
    }
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29a8
// Size: 0x4d
function wp_addtoactivewplist(type, var_fa00ab9d021cd558) {
    if (type == "smoke") {
        level.activewpzones[level.activewpzones.size] = var_fa00ab9d021cd558;
    } else {
        level.activewpinnerzones[level.activewpinnerzones.size] = var_fa00ab9d021cd558;
    }
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29fc
// Size: 0xdc
function wp_isactivewpzone(type, var_d0edab7a45b12083) {
    var_ec4bae72adf2bc39 = 0;
    if (type == "smoke") {
        foreach (zone in level.activewpzones) {
            if (zone == var_d0edab7a45b12083) {
                var_ec4bae72adf2bc39 = 1;
                break;
            }
        }
    } else {
        foreach (zone in level.activewpinnerzones) {
            if (zone == var_d0edab7a45b12083) {
                var_ec4bae72adf2bc39 = 1;
                break;
            }
        }
    }
    return var_ec4bae72adf2bc39;
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ae0
// Size: 0x27c
function wp_removefromactivewplist(type, var_e259cf0d8dcfa751, var_cc9d6ab1bdf32fc0, var_662efe6105e9f585) {
    if (!isdefined(var_e259cf0d8dcfa751)) {
        return;
    }
    var_e5dab4f107f3a279 = [];
    if (type == "smoke") {
        foreach (var_b16682794bb72308 in level.activewpzones) {
            if (var_b16682794bb72308 == var_e259cf0d8dcfa751) {
                continue;
            }
            var_e5dab4f107f3a279[var_e5dab4f107f3a279.size] = var_b16682794bb72308;
        }
        level.activewpzones = var_e5dab4f107f3a279;
        if (isdefined(var_e259cf0d8dcfa751.playersindisorientradius)) {
            foreach (player in var_e259cf0d8dcfa751.playersindisorientradius) {
                if (isdefined(player) && !wp_isinanywpzone("smoke", player)) {
                    player thread wp_stopdisorientplayer(var_e259cf0d8dcfa751);
                }
            }
        }
        if (level.activewpzones.size <= 0) {
            level.wpinprogress = undefined;
        }
    } else {
        foreach (var_b16682794bb72308 in level.activewpinnerzones) {
            if (var_b16682794bb72308 == var_e259cf0d8dcfa751) {
                continue;
            }
            var_e5dab4f107f3a279[var_e5dab4f107f3a279.size] = var_b16682794bb72308;
        }
        level.activewpinnerzones = var_e5dab4f107f3a279;
        if (isdefined(var_e259cf0d8dcfa751.playersininnerradius)) {
            foreach (player in var_e259cf0d8dcfa751.playersininnerradius) {
                if (isdefined(player) && !wp_isinanywpzone("inner", player)) {
                    if (var_cc9d6ab1bdf32fc0 == "burn") {
                        player thread wp_stopburnplayer(var_e259cf0d8dcfa751);
                    } else {
                        player thread wp_stopblindplayer(var_e259cf0d8dcfa751);
                    }
                }
            }
        }
    }
    if (istrue(var_662efe6105e9f585)) {
        return;
    }
    var_58a24e382101896d = 0;
    /#
        var_58a24e382101896d = getdvarint(@"hash_1aff95d5bc69c60f", 0);
    #/
    if (var_58a24e382101896d) {
        var_e259cf0d8dcfa751 freescriptable();
    } else {
        var_e259cf0d8dcfa751 delete();
    }
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d63
// Size: 0xea
function wp_isinanywpzone(type, var_c4b81997f0120a97) {
    var_83ebb8884bb96f82 = 0;
    if (type == "smoke") {
        foreach (var_b16682794bb72308 in level.activewpzones) {
            if (wp_isinwpzone(type, var_c4b81997f0120a97, var_b16682794bb72308)) {
                var_83ebb8884bb96f82 = 1;
                break;
            }
        }
    } else {
        foreach (var_b16682794bb72308 in level.activewpinnerzones) {
            if (wp_isinwpzone(type, var_c4b81997f0120a97, var_b16682794bb72308)) {
                var_83ebb8884bb96f82 = 1;
                break;
            }
        }
    }
    return var_83ebb8884bb96f82;
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e55
// Size: 0xb5
function wp_isinwpzone(type, var_c4b81997f0120a97, var_b16682794bb72308) {
    isinzone = 0;
    var_2b3d4f72cf8ef276 = undefined;
    if (type == "smoke") {
        var_2b3d4f72cf8ef276 = var_b16682794bb72308.playersindisorientradius;
    } else {
        var_2b3d4f72cf8ef276 = var_b16682794bb72308.playersininnerradius;
    }
    if (isdefined(var_2b3d4f72cf8ef276)) {
        foreach (player in var_2b3d4f72cf8ef276) {
            if (player == var_c4b81997f0120a97) {
                isinzone = 1;
                break;
            }
        }
    }
    return isinzone;
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f12
// Size: 0x4d
function wp_addplayertostatusradiuslist(type, var_e69b22a24070ec44) {
    if (type == "smoke") {
        self.playersindisorientradius[self.playersindisorientradius.size] = var_e69b22a24070ec44;
    } else {
        self.playersininnerradius[self.playersininnerradius.size] = var_e69b22a24070ec44;
    }
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f66
// Size: 0xf6
function wp_removeplayerfromstatusradiuslist(type, var_9d90c26327e3eacd) {
    if (type == "smoke") {
        var_e5dab4f107f3a279 = [];
        foreach (player in self.playersindisorientradius) {
            if (player == var_9d90c26327e3eacd) {
                continue;
            }
            var_e5dab4f107f3a279[var_e5dab4f107f3a279.size] = player;
        }
        self.playersindisorientradius = var_e5dab4f107f3a279;
    } else {
        var_e5dab4f107f3a279 = [];
        foreach (player in self.playersininnerradius) {
            if (player == var_9d90c26327e3eacd) {
                continue;
            }
            var_e5dab4f107f3a279[var_e5dab4f107f3a279.size] = player;
        }
        self.playersininnerradius = var_e5dab4f107f3a279;
    }
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3063
// Size: 0xe3
function wp_removeplayerfromallstatusradiuslists(type, var_9d90c26327e3eacd) {
    if (type == "smoke") {
        foreach (var_b16682794bb72308 in level.activewpzones) {
            if (wp_isinwpzone(type, var_9d90c26327e3eacd, var_b16682794bb72308)) {
                var_b16682794bb72308 wp_removeplayerfromstatusradiuslist(type, var_9d90c26327e3eacd);
            }
        }
    } else {
        foreach (var_b16682794bb72308 in level.activewpinnerzones) {
            if (wp_isinwpzone(type, var_9d90c26327e3eacd, var_b16682794bb72308)) {
                var_b16682794bb72308 wp_removeplayerfromstatusradiuslist(type, var_9d90c26327e3eacd);
            }
        }
    }
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x314d
// Size: 0x4d
function wp_startdisorientplayeronspawn(var_b16682794bb72308) {
    var_b16682794bb72308 endon("death");
    level endon("game_ended");
    while (1) {
        self waittill("spawned_player");
        namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(0.1);
        var_b16682794bb72308 wp_addplayertostatusradiuslist("smoke", self);
        thread wp_startdisorientplayer(var_b16682794bb72308);
    }
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31a1
// Size: 0x15f
function wp_startdisorientplayer(var_b16682794bb72308) {
    var_b16682794bb72308 endon("death");
    self endon("death_or_disconnect");
    self endon("stop_disorient");
    level endon("game_ended");
    self.wpdisorient = 1;
    while (isdefined(self.sessionstate) && self.sessionstate != "playing") {
        waitframe();
    }
    thread wp_stopdisorientonplayerdeath(var_b16682794bb72308);
    thread wp_monitorsmokevisionset(var_b16682794bb72308);
    playfxontagforclients(getfx("white_phosphorus_screen"), self, "tag_eye", self);
    if (level.teambased && self.team == var_b16682794bb72308.team || self == var_b16682794bb72308.owner) {
        var_13e20722a28d1047 = 1;
        /#
            var_12e35e098f9c7baa = getdvarint(@"hash_b72a0bb47130fb8e", 0);
            if (var_12e35e098f9c7baa) {
                var_13e20722a28d1047 = 0;
            }
        #/
        if (istrue(var_13e20722a28d1047)) {
            return;
        }
    }
    self.wphealthblock = 1;
    if (issharedfuncdefined("perk", "givePerk")) {
        self [[ getsharedfunc("perk", "givePerk") ]]("specialty_block_health_regen");
    }
    if (self.health > 10) {
        var_feab9fa3a5844d2d = wp_gethealthdebuffamount();
        wp_degenhealth(var_feab9fa3a5844d2d, var_b16682794bb72308);
    }
    if (!wp_hasresistperk()) {
        enableloopingcoughaudio(var_b16682794bb72308);
    }
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3307
// Size: 0x8d
function wp_degenhealth(var_c3770dc539016800, var_b16682794bb72308) {
    if (istrue(self.gasmaskequipped)) {
        return;
    }
    if (!isdefined(self.wphealthblock)) {
        self.wphealthblock = 1;
        if (issharedfuncdefined("perk", "givePerk")) {
            self [[ getsharedfunc("perk", "givePerk") ]]("specialty_block_health_regen");
        }
    }
    self dodamage(var_c3770dc539016800, self.origin, var_b16682794bb72308.owner, var_b16682794bb72308, "MOD_EXPLOSIVE", "white_phosphorus_proj_mp");
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x339b
// Size: 0x3b
function wp_startdofshiftforplayer(var_b16682794bb72308) {
    var_b16682794bb72308 endon("death");
    self endon("death");
    level endon("game_ended");
    while (istrue(self.wpdisorient)) {
        wait(randomfloatrange(1, 3));
    }
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33dd
// Size: 0x33
function wp_stopdisorientonplayerdeath(var_b16682794bb72308) {
    var_b16682794bb72308 endon("death");
    self endon("stop_disorient");
    level endon("game_ended");
    self waittill("death");
    wp_stopdisorientplayer(var_b16682794bb72308, 1);
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3417
// Size: 0xed
function wp_stopdisorientplayer(var_b16682794bb72308, var_fb8011c41299d291) {
    level endon("game_ended");
    if (istrue(var_fb8011c41299d291)) {
        level wp_removeplayerfromallstatusradiuslists("smoke", self);
    } else {
        var_b16682794bb72308 wp_removeplayerfromstatusradiuslist("smoke", self);
    }
    if (!wp_isinanywpzone("smoke", self) || istrue(var_fb8011c41299d291)) {
        if (istrue(self.wpdisorient)) {
            self.wpdisorient = undefined;
            if (namespace_f8065cafc523dba5::_isalive()) {
                self visionsetnakedforplayer("", 2);
            }
            stopfxontagforclients(getfx("white_phosphorus_screen"), self, "tag_eye", self);
            if (istrue(self.wphealthblock)) {
                if (issharedfuncdefined("perk", "removePerk")) {
                    self [[ getsharedfunc("perk", "removePerk") ]]("specialty_block_health_regen");
                }
                self.wphealthblock = undefined;
            }
            disableloopingcoughaudio();
            self notify("stop_disorient");
        }
    }
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x350b
// Size: 0x18c
function wp_startburnplayer(var_b16682794bb72308, attacker) {
    var_b16682794bb72308 endon("death");
    self endon("stop_wp_burn");
    self endon("death");
    level endon("game_ended");
    if (level.teambased && self.team == var_b16682794bb72308.team && self != var_b16682794bb72308.owner) {
        var_13e20722a28d1047 = 1;
        /#
            var_12e35e098f9c7baa = getdvarint(@"hash_b72a0bb47130fb8e", 0);
            if (var_12e35e098f9c7baa) {
                var_13e20722a28d1047 = 0;
            }
        #/
        if (istrue(var_13e20722a28d1047)) {
            return;
        }
    }
    var_b16682794bb72308 wp_addplayertostatusradiuslist("inner", self);
    self.wpburning = 1;
    if (issharedfuncdefined("weapons", "enableBurnFX")) {
        self [[ getsharedfunc("weapons", "enableBurnFX") ]](undefined, "wp_active");
    }
    if (issharedfuncdefined("damage", "enqueueCorpsetableFunc")) {
        [[ getsharedfunc("damage", "enqueueCorpsetableFunc") ]]("white_phosphorus_burning", &wp_playcorpsetableburningfx);
    }
    thread wp_stopstatuseffectondeath(var_b16682794bb72308);
    damage = 10;
    while (1) {
        if (self.health <= damage) {
            self notify("stop_degen");
        }
        self dodamage(damage, self.origin, attacker, var_b16682794bb72308, "MOD_FIRE", var_b16682794bb72308.weapon_name);
        wait(0.5);
        damage++;
        if (damage >= 20) {
            damage = 20;
        }
        self.lastburntime = gettime();
    }
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x369e
// Size: 0x38
function wp_stopburnplayer(var_b16682794bb72308) {
    var_b16682794bb72308 wp_removeplayerfromstatusradiuslist("inner", self);
    if (!wp_isinanywpzone("inner", self)) {
        wp_resetstatuseffect();
        self notify("stop_wp_burn");
    }
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36dd
// Size: 0xa9
function wp_startblindplayer(var_b16682794bb72308) {
    if (level.teambased && self.team == var_b16682794bb72308.team || self == var_b16682794bb72308.owner) {
        var_13e20722a28d1047 = 1;
        /#
            var_12e35e098f9c7baa = getdvarint(@"hash_b72a0bb47130fb8e", 0);
            if (var_12e35e098f9c7baa) {
                var_13e20722a28d1047 = 0;
            }
        #/
        if (istrue(var_13e20722a28d1047)) {
            return;
        }
    }
    var_b16682794bb72308 wp_addplayertostatusradiuslist("inner", self);
    self.wpblinding = 1;
    thread wp_stopstatuseffectondeath(var_b16682794bb72308);
    self visionsetnakedforplayer("wp_flare", 1);
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x378d
// Size: 0x30
function wp_stopblindplayer(var_b16682794bb72308) {
    var_b16682794bb72308 wp_removeplayerfromstatusradiuslist("inner", self);
    if (!wp_isinanywpzone("inner", self)) {
        wp_resetstatuseffect();
    }
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37c4
// Size: 0x32
function wp_stopstatuseffectondeath(var_b16682794bb72308) {
    var_b16682794bb72308 endon("death");
    self endon("disconnect");
    level endon("game_ended");
    self waittill("death");
    wp_resetstatuseffect(1);
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37fd
// Size: 0xde
function wp_resetstatuseffect(var_2e501fc7d257ce57) {
    if (istrue(self.wpburning)) {
        if (issharedfuncdefined("weapons", "disableBurnFX")) {
            self [[ getsharedfunc("weapons", "disableBurnFX") ]](undefined, "wp_active");
        }
        if (namespace_f8065cafc523dba5::_isalive()) {
            if (issharedfuncdefined("damage", "dequeueCorpsetableFunc")) {
                self [[ getsharedfunc("damage", "dequeueCorpsetableFunc") ]]("white_phosphorus_burning");
            }
        }
        self.wpburning = undefined;
    }
    if (istrue(self.wpblinding)) {
        self.wpblinding = undefined;
        if (wp_isinanywpzone("smoke", self)) {
            self visionsetnakedforplayer(wp_getsmokevisionset(), 1);
        } else {
            self visionsetnakedforplayer("", 1);
        }
    }
    if (istrue(var_2e501fc7d257ce57)) {
        level wp_removeplayerfromallstatusradiuslists("inner", self);
    }
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38e2
// Size: 0x6e
function wp_removeplane(plane) {
    /#
        assertex(isdefined(plane), "wp_removePlane - Plane was removed unexpectedly; this should never happen!");
    #/
    if (isdefined(plane.minimapid)) {
        if (namespace_3c37cb17ade254d::issharedfuncdefined("game", "returnObjectiveID")) {
            [[ namespace_3c37cb17ade254d::getsharedfunc("game", "returnObjectiveID") ]](plane.minimapid);
        }
        plane.minimapid = undefined;
    }
    plane delete();
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3957
// Size: 0x3c
function wp_getsmokevisionset() {
    var_6d2b74cde33b53f3 = "wp_smoke";
    var_ed475fca5ff8e567 = "wp_smoke_night";
    var_aa76958057a61022 = var_6d2b74cde33b53f3;
    if (isnightmap()) {
        var_aa76958057a61022 = var_ed475fca5ff8e567;
    }
    return var_aa76958057a61022;
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x399b
// Size: 0x7c
function wp_monitorsmokevisionset(var_b16682794bb72308) {
    var_b16682794bb72308 endon("death");
    self endon("disconnect");
    self endon("stop_disorient");
    self endon("death");
    level endon("game_ended");
    var_98e6b3f49203eb6c = undefined;
    while (1) {
        if (istrue(self.wpdisorient)) {
            var_878793df599f2f06 = wp_getsmokevisionset();
            if (!isdefined(var_98e6b3f49203eb6c) || var_878793df599f2f06 != var_98e6b3f49203eb6c) {
                var_98e6b3f49203eb6c = var_878793df599f2f06;
                self visionsetnakedforplayer(var_878793df599f2f06, 2);
            }
        }
        waitframe();
    }
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a1e
// Size: 0x54
function wp_gethealthdebuffamount() {
    var_feab9fa3a5844d2d = 50;
    if (wp_hasresistperk()) {
        var_feab9fa3a5844d2d = var_feab9fa3a5844d2d * 0.5;
    }
    var_a51512c2048ab572 = self.health;
    var_d6c240915742c3a9 = var_a51512c2048ab572 - var_feab9fa3a5844d2d;
    if (var_d6c240915742c3a9 < 10) {
        var_feab9fa3a5844d2d = var_feab9fa3a5844d2d - 10 - var_d6c240915742c3a9;
    }
    return var_feab9fa3a5844d2d;
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a7a
// Size: 0x1e
function wp_playcorpsetableburningfx(var_3741ea5b9fb53ec3) {
    var_3741ea5b9fb53ec3 setscriptablepartstate("wp_burning", "flareUp", 0);
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a9f
// Size: 0x21
function wp_hasresistperk() {
    return isdefined(self.perks) && isdefined(self.perks["specialty_tac_resist"]);
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ac8
// Size: 0x45
function enableloopingcoughaudio(var_b16682794bb72308) {
    if (!isdefined(self.loopingcoughaudio)) {
        self.loopingcoughaudio = 0;
    }
    self.loopingcoughaudio++;
    if (self.loopingcoughaudio == 1) {
        thread startloopingcoughaudio(var_b16682794bb72308);
    }
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b14
// Size: 0x54
function disableloopingcoughaudio() {
    if (!isdefined(self.loopingcoughaudio)) {
        return;
    }
    self.loopingcoughaudio--;
    /#
        assertex(self.loopingcoughaudio >= 0, "disableLoopingCoughAudio called more times than enableLoopingCoughAudio.");
    #/
    if (self.loopingcoughaudio == 0) {
        thread stoploopingcoughaudio();
        self.loopingcoughaudio = undefined;
    }
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3b6f
// Size: 0x309
function startloopingcoughaudio(var_b16682794bb72308) {
    self endon("death_or_disconnect");
    self endon("clearLoopingCoughAudio");
    level endon("game_ended");
    while (1) {
        waittime = randomfloatrange(5, 7);
        if (!loopingcoughaudioissupressed()) {
            soundalias = "generic_cough_3_enemy_1";
            if (isdefined(self.operatorcustomization)) {
                if (isdefined(var_b16682794bb72308)) {
                    var_16a1ab6dfeb8d692 = var_b16682794bb72308.team;
                } else {
                    var_16a1ab6dfeb8d692 = "allies";
                }
                if (is_equal(self.team, var_16a1ab6dfeb8d692)) {
                    if (isdefined(self.operatorcustomization.gender) && self.operatorcustomization.gender == "female") {
                        var_bf9336bf707fa7ca = game["dialogue"]["allies_female_cough"].size;
                        var_d337caa5f4d5a1bf = randomint(var_bf9336bf707fa7ca);
                        soundalias = game["dialogue"]["allies_female_cough"][var_d337caa5f4d5a1bf];
                    } else {
                        var_bf9336bf707fa7ca = game["dialogue"]["allies_male_cough"].size;
                        var_d337caa5f4d5a1bf = randomint(var_bf9336bf707fa7ca);
                        soundalias = game["dialogue"]["allies_male_cough"][var_d337caa5f4d5a1bf];
                    }
                } else if (isdefined(self.operatorcustomization.gender) && self.operatorcustomization.gender == "female") {
                    var_bf9336bf707fa7ca = game["dialogue"]["axis_female_cough"].size;
                    var_d337caa5f4d5a1bf = randomint(var_bf9336bf707fa7ca);
                    soundalias = game["dialogue"]["axis_female_cough"][var_d337caa5f4d5a1bf];
                } else {
                    var_bf9336bf707fa7ca = game["dialogue"]["axis_male_cough"].size;
                    var_d337caa5f4d5a1bf = randomint(var_bf9336bf707fa7ca);
                    soundalias = game["dialogue"]["axis_male_cough"][var_d337caa5f4d5a1bf];
                }
            } else {
                var_bf9336bf707fa7ca = game["dialogue"]["axis_male_cough"].size;
                var_d337caa5f4d5a1bf = randomint(var_bf9336bf707fa7ca);
                soundalias = game["dialogue"]["axis_male_cough"][var_d337caa5f4d5a1bf];
            }
            if (!isai(self)) {
                self playlocalsound("gas_player_cough");
            }
            if (ismp() && !istrue(getgametype() == "ob")) {
                var_b0c33d224b825287 = array_remove(level.teamnamelist, self.team);
                self playsoundtoteam(soundalias, self.team, self, self);
                self playsoundtoteam(soundalias, var_b0c33d224b825287[0], self, self);
                if (isdefined(var_b0c33d224b825287[1])) {
                    self playsoundtoteam(soundalias, var_b0c33d224b825287[1], self, self);
                }
            } else if (iscp()) {
                if (isai(self)) {
                    self playsoundonmovingent(soundalias);
                }
            } else if (getgametype() == "ob") {
                if (isplayer(self)) {
                    var_b0c33d224b825287 = array_remove(level.teamnamelist, self.team);
                    self playsoundtoteam(soundalias, self.team, self, self);
                    if (isdefined(var_b0c33d224b825287[0])) {
                        self playsoundtoteam(soundalias, var_b0c33d224b825287[0], self, self);
                    }
                } else {
                    self playsoundonmovingent(soundalias);
                }
                goto LOC_000002f9;
            }
        LOC_000002f9:
            wait(waittime);
        } else {
            wait(1);
        }
    }
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e7f
// Size: 0xb
function stoploopingcoughaudio() {
    self notify("clearLoopingCoughAudio");
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e91
// Size: 0x24
function enableloopingcoughaudiosupression() {
    if (!isdefined(self.loopingcoughaudiosupression)) {
        self.loopingcoughaudiosupression = 0;
    }
    self.loopingcoughaudiosupression++;
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ebc
// Size: 0x34
function disableloopingcoughaudiosupression() {
    if (!isdefined(self.loopingcoughaudiosupression)) {
        return;
    }
    self.loopingcoughaudiosupression--;
    /#
        assertex(self.loopingcoughaudiosupression >= 0, "disableLoopingCoughAudioSupression called more times than enableLoopingCoughAudioSupression.");
    #/
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ef7
// Size: 0x1c
function loopingcoughaudioissupressed() {
    return isdefined(self.loopingcoughaudiosupression) && self.loopingcoughaudiosupression > 0;
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f1b
// Size: 0x1f
function clearloopingcoughaudio() {
    self notify("clearLoopingCoughAudio");
    self.loopingcoughaudio = undefined;
    self.loopingcoughaudiosupression = undefined;
}

// Namespace white_phosphorus/namespace_e765f0aad2368473
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f41
// Size: 0x31
function wp_playimpactsound(var_6b5d366f98ba252b) {
    var_6b5d366f98ba252b setscriptablepartstate("impact_center", "on", 0);
    waitframe();
    var_6b5d366f98ba252b setscriptablepartstate("impact_center", "off", 0);
}

