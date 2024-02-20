// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_16ea1b94f0f381b3;
#using script_4c770a9a4ad7659c;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using script_608c50392df8c7d1;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\shellshock_utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using script_439fa02b5251fa5b;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;
#using script_3b64eb40368c1450;
#using scripts\cp_mp\killstreaks\manual_turret.gsc;
#using scripts\cp_mp\hostmigration.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using script_5f903436642211af;
#using scripts\mp\sentientpoolmanager.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\engine\trace.gsc;

#namespace sentry_gun;

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x785
// Size: 0xdc
function init() {
    if (issharedfuncdefined("sentry_gun", "init")) {
        [[ getsharedfunc("sentry_gun", "init") ]]();
    }
    if (issharedfuncdefined("sentry_gun", "initSentrySettings")) {
        [[ getsharedfunc("sentry_gun", "initSentrySettings") ]]();
    }
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["sentry_gun"];
    if (isdefined(bundle) && isdefined(bundle.spawnweapon)) {
        function_a41e3a211a9e37a4("sentry_gun", bundle.spawnweapon, #"large");
    }
    /#
        setdevdvarifuninitialized(@"hash_c9bd691ce96079ac", 0);
        setdevdvarifuninitialized(@"hash_e19e5d308effeda3", 1);
        setdevdvarifuninitialized(@"hash_8b57c69d6f7ca720", 0);
    #/
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x868
// Size: 0x29
function weaponcleanupsentryturret(streakinfo, var_41bf9bf4918115ac, weaponobj) {
    if (!istrue(var_41bf9bf4918115ac)) {
        namespace_b3d24e921998a8b::getridofkillstreakdeployweapon(weaponobj);
    }
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x898
// Size: 0x26
function tryusesentryturret(streakname) {
    streakinfo = createstreakinfo(streakname, self);
    return tryusesentryturretfromstruct(streakinfo);
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8c6
// Size: 0x22e
function tryusesentryturretfromstruct(streakinfo) {
    level endon("game_ended");
    self endon("disconnect");
    if (isdefined(level.killstreaktriggeredfunc)) {
        if (!level [[ level.killstreaktriggeredfunc ]](streakinfo)) {
            self.bgivensentry = 0;
            return 0;
        }
    }
    namespace_d325722f2754c2c4::saveweaponstates();
    if (!istrue(function_8fbbc6a868621dd5())) {
        return 0;
    }
    /#
        var_95260516625d5c96 = getdvarint(@"hash_8b57c69d6f7ca720", 0);
        if (var_95260516625d5c96) {
            if (level.teambased) {
                var_39fea08436a97e8a = ter_op(self.team == "tag_laser", "movingPlatformOnPlaced", "tag_laser");
                if (level.teamdata[var_39fea08436a97e8a]["script_vehicle"].size == 0) {
                    /#
                        assertmsg("handleMovingPlatform");
                    #/
                    return 0;
                }
            } else if (level.teamdata[self.team]["script_vehicle"].size == 1) {
                /#
                    assertmsg("handleMovingPlatform");
                #/
                return 0;
            }
        }
    #/
    var_41bf9bf4918115ac = function_6633c7714fc94777(streakinfo);
    if (!istrue(var_41bf9bf4918115ac)) {
        return 0;
    }
    if (isdefined(level.killstreakbeginusefunc)) {
        if (!level [[ level.killstreakbeginusefunc ]](streakinfo)) {
            self.bgivensentry = 0;
            return 0;
        }
    }
    turret = sentryturret_create("sentry_turret", streakinfo);
    if (!isdefined(turret)) {
        self.bgivensentry = 0;
        return 0;
    }
    marker = sentryturret_watchplacement(turret, streakinfo, 0, 1.25);
    if (!isdefined(marker)) {
        turret delete();
        self.bgivensentry = 0;
        return 0;
    }
    turret function_641996b5e113c5c6(turret, &function_764a9f25a1a15a4a, &sentryturret_empstarted, &sentryturret_empcleared);
    if (issharedfuncdefined(#"hash_d8976e21a6adafba", #"hash_ca0042e3cac99672")) {
        turret [[ getsharedfunc(#"hash_d8976e21a6adafba", #"hash_ca0042e3cac99672") ]](turret, &function_4b9ae5f8bf842050, &function_4b9ae5f8bf842050);
    }
    sentryturret_setplaced(turret, marker);
    if (issharedfuncdefined("sentry_gun", "munitionUsed")) {
        self [[ getsharedfunc("sentry_gun", "munitionUsed") ]]();
    }
    return 1;
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xafc
// Size: 0x20a
function sentryturret_watchplacement(turret, streakinfo, var_6152d24062d26039, var_290b1442271ab369) {
    self.bgivensentry = 1;
    turret laseroff();
    thread sentryturret_delayplacementinstructions(var_290b1442271ab369);
    var_498a2226e5aa47ee = 0;
    if (namespace_3c37cb17ade254d::issharedfuncdefined("game", "getGameType")) {
        var_498a2226e5aa47ee = [[ namespace_3c37cb17ade254d::getsharedfunc("game", "getGameType") ]]() == "br";
    }
    if (var_498a2226e5aa47ee) {
        thread function_5c005d2b1101bc78();
    }
    marker = undefined;
    if (issharedfuncdefined("sentry_gun", "watchForPlayerEnteringLastStand")) {
        self thread [[ getsharedfunc("sentry_gun", "watchForPlayerEnteringLastStand") ]]();
    }
    if (issharedfuncdefined("sentry_gun", "getTargetMarker")) {
        marker = self [[ getsharedfunc("sentry_gun", "getTargetMarker") ]](streakinfo, var_6152d24062d26039);
    }
    self notify("turret_placement_finished");
    self playsound("sentry_gun_plant_foley");
    namespace_1cd9f6896754adb0::set("sentry", "armor", 1);
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["sentry_gun"];
    deployweaponname = function_53c4c53197386572(bundle.var_8881166e57766e3a, "deploy_sentry_mp");
    if (!isdefined(marker) || !isdefined(marker.location)) {
        if (namespace_f8065cafc523dba5::_isalive()) {
            function_8608f39517786dab(deployweaponname);
        }
        return undefined;
    }
    turret thread namespace_ac45d22648d4adff::manualturret_disablefire(self, 1, 1);
    if (self hasweapon(deployweaponname)) {
        thread function_8608f39517786dab(deployweaponname, 1, 1);
    }
    if (issharedfuncdefined("sentry_gun", "setActionSets")) {
        self [[ getsharedfunc("sentry_gun", "setActionSets") ]](0);
    }
    var_85cda42514dc11d2 = 0.85;
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(var_85cda42514dc11d2);
    if (issharedfuncdefined("sentry_gun", "setActionSets")) {
        self [[ getsharedfunc("sentry_gun", "setActionSets") ]](1);
    }
    return marker;
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd0e
// Size: 0x34
function function_5c005d2b1101bc78() {
    self endon("turret_placement_finished");
    self endon("death_or_disconnect");
    self waittill("last_stand_start");
    namespace_1cd9f6896754adb0::set("sentry", "armor", 1);
    self notify("equip_deploy_cancel");
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd49
// Size: 0x51
function sentryturret_delayplacementinstructions(delaytime) {
    self endon("death_or_disconnect");
    self endon("turret_placement_finished");
    level endon("game_ended");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(delaytime);
    self setclientomnvar("ui_turret_placement", 2);
    thread namespace_ac45d22648d4adff::manualturret_clearplacementinstructions("death");
    thread namespace_ac45d22648d4adff::manualturret_clearplacementinstructions("turret_placement_finished");
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xda1
// Size: 0x5df
function sentryturret_create(turrettype, streakinfo) {
    config = level.sentrysettings[turrettype];
    turret = spawnturret("misc_turret", self.origin, level.sentrysettings[turrettype].weaponinfo);
    turret.owner = self;
    turret.team = self.team;
    turret.isdisabled = 0;
    /#
        var_39adce8276c7049d = getdvarint(@"hash_8b57c69d6f7ca720", 0);
        if (var_39adce8276c7049d) {
            if (level.teambased) {
                turret.team = ter_op(self.team == "tag_laser", "movingPlatformOnPlaced", "tag_laser");
                turret.owner = level.teamdata[turret.team]["script_vehicle"][0];
            } else {
                foreach (player in level.players) {
                    if (player != self) {
                        turret.owner = player;
                        turret.team = player.team;
                        break;
                    }
                }
            }
        }
    #/
    turret.angles = self.angles;
    turret.health = 9999;
    turret.maxhealth = config.maxhealth;
    turret.streakinfo = streakinfo;
    turret.turrettype = turrettype;
    turret.shouldsplash = 1;
    turret.ammocount = config.ammo;
    turret.timeout = config.timeout;
    if (issharedfuncdefined("sentry_gun", "attachXRays")) {
        turret = [[ getsharedfunc("sentry_gun", "attachXRays") ]](turret);
    }
    /#
        var_2a98d1683cf44153 = getdvarint(@"hash_2c01d701bac5d9d3", 0);
        if (var_2a98d1683cf44153) {
            turret.timeout = 9999;
        }
    #/
    if (!isdefined(turret.timeout)) {
        turret.timeout = 120;
    }
    turret.carriedby = self;
    turret sentryturret_setturretmodel("placed");
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
    case #"hash_fa4536bde6f7ad9":
    default:
        turret maketurretinoperable();
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
    turret function_49197cd063a740ea(&function_3267046817e6a131);
    if (isdefined(level.elevators)) {
        foreach (elevators in level.elevators) {
            elevators thread namespace_272931699e2fe8e9::function_5c07037726ae5001(turret);
        }
    }
    if (iscp()) {
        turret makeentitysentient(turret.team);
    }
    var_d3dc97c59992d51 = anglestoforward(turret.angles);
    var_a8ae5e047a5b6cb6 = turret gettagorigin("tag_laser") + (0, 0, 10);
    var_a8ae5e047a5b6cb6 = var_a8ae5e047a5b6cb6 - var_d3dc97c59992d51 * 20;
    killcament = spawn("script_model", var_a8ae5e047a5b6cb6);
    killcament linkto(turret);
    turret.killcament = killcament;
    turret.colmodel = spawn("script_model", turret.origin);
    turret.colmodel.team = turret.team;
    turret.colmodel.owner = turret.owner;
    turret.colmodel.var_c424c88c44314576 = turret;
    turret.colmodel.var_2ee93f095dc416f8 = 1;
    turret.colmodel setmodel("weapon_vm_mg_sentry_turret_invis_base");
    turret.colmodel dontinterpolate();
    turret.colmodel hide();
    if (isdefined(config.var_34d24162c014a897)) {
        turret.var_34d24162c014a897 = config.var_34d24162c014a897;
    }
    return turret;
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1388
// Size: 0x75
function function_5be2524e8daf7546(turret) {
    if (!isdefined(self.placedsentries)) {
        self.placedsentries = [];
    }
    if (!isdefined(self.placedsentries[turret.turrettype])) {
        self.placedsentries[turret.turrettype] = [];
    }
    self.placedsentries[turret.turrettype][self.placedsentries.size] = turret;
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1404
// Size: 0x3e
function function_a06fbf5fc1e4a4ef(turret) {
    self.placedsentries[turret.turrettype] = array_remove(self.placedsentries[turret.turrettype], turret);
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1449
// Size: 0x510
function sentryturret_setplaced(turret, marker) {
    config = level.sentrysettings[turret.turrettype];
    turret sentryturret_setturretmodel("placed");
    if (istrue(level.var_9696753a29908c90)) {
        function_5be2524e8daf7546(turret);
    }
    if (istrue(turret.shouldsplash)) {
        if (issharedfuncdefined("sound", "playKillstreakDeployDialog")) {
            [[ getsharedfunc("sound", "playKillstreakDeployDialog") ]](self, turret.streakinfo.streakname);
        }
        killstreak_dangerNotifyPlayersInRange(self, self.team, 2000, turret.streakinfo.streakname);
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
        if (issharedfuncdefined("turret", "movingPlatformOnPlaced")) {
            level thread [[ getsharedfunc("turret", "movingPlatformOnPlaced") ]](turret, marker);
        }
    }
    self.bgivensentry = 0;
    turret.origin = marker.location;
    turret playsound("sentry_gun_plant");
    turret setscriptablepartstate("lights", "daytime", 0);
    var_13b6736eaafaa9e4 = getdvarint(@"hash_6f41bda368c6075f", 0);
    if (isdefined(marker.moving_platform) && var_13b6736eaafaa9e4) {
        if (marker.moving_platform.classname == "script_vehicle") {
            turret linkto(marker.moving_platform, "", marker.moving_platform_offset, marker.moving_platform_angles_offset);
            if (!isdefined(marker.moving_platform.var_5bc44078588a197f)) {
                marker.moving_platform.var_5bc44078588a197f = [];
            }
            marker.moving_platform.var_5bc44078588a197f[marker.moving_platform.var_5bc44078588a197f.size] = turret;
        }
    }
    turret.colmodel show();
    turret.colmodel.angles = turret.angles;
    turret.colmodel.origin = turret.origin;
    turret.colmodel linkto(turret);
    var_f96e4256f03c5f42 = "hud_icon_minimap_killstreak_sentry";
    if (issharedfuncdefined("game", "createObjective")) {
        turret.minimapid = turret.colmodel [[ getsharedfunc("game", "createObjective") ]](var_f96e4256f03c5f42, turret.team, undefined, 1, 1);
    }
    headiconoffset = 70;
    if (issharedfuncdefined("killstreak", "addToActiveKillstreakList")) {
        turret [[ getsharedfunc("killstreak", "addToActiveKillstreakList") ]](turret.turrettype, "Killstreak_Ground", self, 0, 1, headiconoffset, "carried");
    }
    turret setmode(level.sentrysettings[turret.turrettype].sentrymodeon);
    function_5c49802fcf1a63ed(turret, config);
    if (namespace_3c37cb17ade254d::issharedfuncdefined("sentry_gun", "handleMovingPlatform")) {
        [[ namespace_3c37cb17ade254d::getsharedfunc("sentry_gun", "handleMovingPlatform") ]](turret);
    }
    turret namespace_5a51aa78ea0b1b9f::allow_emp(1);
    turret namespace_6d9917c3dc05dbe9::registersentient("Killstreak_Static", self);
    turret function_4b9ae5f8bf842050(turret, 1);
    turret thread sentry_attacktargets();
    /#
        turret thread function_c057f52574c94670();
    #/
    thread sentryturret_delaydeletemarker(turret, marker);
    thread sentryturret_watchpickup(turret);
    thread sentryturret_watchdamage(turret);
    thread sentryturret_watchdeath(turret);
    thread sentryturret_watchtimeout(turret);
    thread sentryturret_watchdisown(turret);
    thread sentryturret_watchgameend(turret);
    if (namespace_3c37cb17ade254d::issharedfuncdefined("entity", "trackEntityLimit")) {
        [[ namespace_3c37cb17ade254d::getsharedfunc("entity", "trackEntityLimit") ]](turret, self);
        thread function_1bf664fbd06fe1b8(turret);
    }
    turret notify("turret_place_successful");
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1960
// Size: 0x1be
function function_5c49802fcf1a63ed(turret, config) {
    var_5e8eb3c31f9c265c = "tag_aim_pivot";
    var_963953c3478bf4fe = turret gettagorigin(var_5e8eb3c31f9c265c);
    if (!isdefined(turret.useownerobj)) {
        var_efe526bf6a23d275 = undefined;
        var_7d52b05c966f0d1c = undefined;
        hintdist = undefined;
        usedist = undefined;
        if (namespace_36f464722d326bbe::function_ba5574c7f287c587()) {
            var_efe526bf6a23d275 = "hud_icon_killstreak_sentry";
            var_7d52b05c966f0d1c = "duration_none";
            hintdist = 50;
            usedist = 50;
        }
        if (namespace_3c37cb17ade254d::issharedfuncdefined("sentry_gun", "createHintObject")) {
            turret.useownerobj = [[ namespace_3c37cb17ade254d::getsharedfunc("sentry_gun", "createHintObject") ]](var_963953c3478bf4fe, "HINT_BUTTON", var_efe526bf6a23d275, config.ownerusehintstring, undefined, var_7d52b05c966f0d1c, "show", hintdist, undefined, usedist, undefined);
        }
    } else {
        turret.useownerobj function_dfb78b3e724ad620(1);
        turret.useownerobj dontinterpolate();
        turret.useownerobj.origin = var_963953c3478bf4fe;
    }
    foreach (guy in level.players) {
        if (guy != turret.owner) {
            turret.useownerobj disableplayeruse(guy);
        } else {
            turret.useownerobj enableplayeruse(guy);
        }
    }
    turret.useownerobj linkto(turret, var_5e8eb3c31f9c265c);
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b25
// Size: 0x28f
function sentryturret_setcarried(turret) {
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
    turret namespace_6d9917c3dc05dbe9::unregistersentient(turret.sentientpool, turret.sentientpoolindex);
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
    sentryturret_setinactive(turret);
    turret hide();
    turret.carriedby = self;
    turret notify("carried");
    if (istrue(self.var_81fcf56aaed3e005)) {
        if (isdefined(level.var_b67b5f9dfe488c2f)) {
            thread [[ level.var_f56a88761038798b ]](self.streakinfo);
            self.var_81fcf56aaed3e005 = 0;
        }
    }
    namespace_d325722f2754c2c4::saveweaponstates();
    var_41bf9bf4918115ac = function_6633c7714fc94777(turret.streakinfo, turret);
    if (!istrue(var_41bf9bf4918115ac)) {
        function_f3bb4f4911a1beb2("killstreak", "refundKillstreak", "sentry", 1, 0, 0, 1);
        return;
    }
    marker = sentryturret_watchplacement(turret, turret.streakinfo, 1, 2);
    if (!isdefined(marker)) {
        turret delete();
        self.bgivensentry = 0;
        function_f3bb4f4911a1beb2("killstreak", "refundKillstreak", "sentry", 1, 0, 0, 1);
        return;
    }
    sentryturret_setplaced(turret, marker);
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1dbb
// Size: 0x81
function sentryturret_switchbacklastweapon(var_eaf9953fb1b05ac6) {
    if (istrue(var_eaf9953fb1b05ac6)) {
        _switchtoweaponimmediate(self.lastdroppableweaponobj);
    } else {
        _switchtoweapon(self.lastdroppableweaponobj);
    }
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["sentry_gun"];
    deployweaponname = function_53c4c53197386572(bundle.var_8881166e57766e3a, "deploy_sentry_mp");
    _takeweapon(deployweaponname);
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e43
// Size: 0x5e
function sentryturret_setinactive(turret) {
    turret setdefaultdroppitch(30);
    turret setmode(level.sentrysettings[turret.turrettype].sentrymodeoff);
    turret.useownerobj function_dfb78b3e724ad620(0);
    turret.useownerobj unlink();
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ea8
// Size: 0x48
function sentryturret_delaydeletemarker(turret, marker) {
    turret endon("kill_turret");
    level endon("game_ended");
    wait(0.25);
    if (isdefined(marker.visual)) {
        marker.visual delete();
    }
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1ef7
// Size: 0x58
function sentryturret_disableplayeruseonconnect(turret, useobj) {
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

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f56
// Size: 0x1b1
function sentryturret_watchpickup(turret) {
    turret endon("kill_turret");
    turret endon("carried");
    turret endon("turret_hacked");
    self endon("disconnect");
    level endon("game_ended");
    while (1) {
        player = turret.useownerobj waittill("trigger");
        if (player != self) {
            continue;
        }
        if (issharedfuncdefined("sentry_gun", "allowPickupOfTurret")) {
            if (!player [[ getsharedfunc("sentry_gun", "allowPickupOfTurret") ]]()) {
                continue;
            }
        }
        if (!istrue(function_8fbbc6a868621dd5(turret))) {
            continue;
        }
        turret.useownerobj function_dfb78b3e724ad620(0);
        turret setmode(level.sentrysettings[turret.turrettype].sentrymodeoff);
        var_13b6736eaafaa9e4 = getdvarint(@"hash_6f41bda368c6075f", 0);
        if (isdefined(turret.moving_platform) && isdefined(turret.moving_platform.var_5bc44078588a197f) && var_13b6736eaafaa9e4) {
            for (index = 0; index < turret.moving_platform.var_5bc44078588a197f.size; index++) {
                var_bf4b28b9d6d59137 = turret.moving_platform.var_5bc44078588a197f[index];
                if (isdefined(var_bf4b28b9d6d59137) && var_bf4b28b9d6d59137 == turret) {
                    turret.moving_platform.var_5bc44078588a197f[index] = undefined;
                    turret unlink();
                    break;
                }
            }
        }
        if (istrue(level.var_9696753a29908c90)) {
            function_a06fbf5fc1e4a4ef(turret);
        }
        thread sentryturret_setcarried(turret);
    }
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x210e
// Size: 0x5d
function sentryturret_disableplayerpickuponconnect(turret) {
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

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2172
// Size: 0xdb
function sentryturret_watchdismantle(turret) {
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
    thread sentryturret_disableplayerdismantleonconnect(turret);
    while (1) {
        player = turret.dismantleobj waittill("trigger");
        turret notify("kill_turret", 0);
        break;
    }
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2254
// Size: 0x50
function sentryturret_watchdamage(turret) {
    turret endon("kill_turret");
    turret endon("carried");
    self endon("disconnect");
    level endon("game_ended");
    if (namespace_3c37cb17ade254d::issharedfuncdefined("sentry_gun", "monitorDamage")) {
        self [[ namespace_3c37cb17ade254d::getsharedfunc("sentry_gun", "monitorDamage") ]](turret);
    }
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22ab
// Size: 0x72
function sentryturret_disableplayerdismantleonconnect(turret) {
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

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2324
// Size: 0x8e
function function_764a9f25a1a15a4a(data) {
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["sentry_gun"];
    var_e913079a5ffda56d = bundle.var_e913079a5ffda56d;
    if (function_8e610f938a53a07d() < function_4a2ecb33b6adeb85(data, var_e913079a5ffda56d)) {
        return;
    }
    turret = data.victim;
    turret notify("kill_turret", 1);
    self notify("enemy_destroyed_equipment", data.attacker);
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23b9
// Size: 0x70
function sentryturret_empstarted(data) {
    if (isdefined(data.attacker)) {
        data.attacker thread function_f3bb4f4911a1beb2("player", "doScoreEvent", #"hash_76439a72cda87566");
        if (issharedfuncdefined("sentry_gun", "empStarted")) {
            self [[ getsharedfunc("sentry_gun", "empStarted") ]]();
        }
    }
    function_4b9ae5f8bf842050(self);
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2430
// Size: 0x40
function sentryturret_empcleared(isdeath) {
    if (isdeath) {
        return;
    }
    if (issharedfuncdefined("sentry_gun", "empStarted")) {
        self [[ getsharedfunc("sentry_gun", "empCleared") ]]();
    }
    function_4b9ae5f8bf842050(self);
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2477
// Size: 0xc6
function private function_4b9ae5f8bf842050(turret, forceupdate) {
    isemped = isdefined(turret.empcount) && turret.empcount > 0;
    isjammed = istrue(turret.isjammed);
    var_3f49de7972a16b2b = isemped || isjammed;
    if (var_3f49de7972a16b2b && (!turret.isdisabled || istrue(forceupdate))) {
        turret.isdisabled = 1;
        function_60b382eee27f4f91(turret);
    } else if (!var_3f49de7972a16b2b && (turret.isdisabled || istrue(forceupdate))) {
        turret.isdisabled = 0;
        function_46b8598cc2ff1a03(turret);
    }
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2544
// Size: 0x3e
function private function_60b382eee27f4f91(turret) {
    self turretfiredisable();
    self setmode(level.sentrysettings[self.turrettype].sentrymodeoff);
    self laseroff();
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2589
// Size: 0x3e
function private function_46b8598cc2ff1a03(turret) {
    self turretfireenable();
    self setmode(level.sentrysettings[self.turrettype].sentrymodeon);
    self laseron();
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25ce
// Size: 0x2b8
function sentryturret_watchdeath(turret) {
    turret endon("carried");
    var_4fac8b8ce36e09f1 = var_b2797481a55c620 = turret waittill("kill_turret");
    if (isdefined(self)) {
        if (istrue(level.var_9696753a29908c90)) {
            function_a06fbf5fc1e4a4ef(turret);
        }
        sentryturret_setinactive(turret);
        if (issharedfuncdefined("player", "printGameAction")) {
            self [[ getsharedfunc("player", "printGameAction") ]]("killstreak ended - manual_turret", self);
        }
        turret.streakinfo.expiredbydeath = istrue(var_4fac8b8ce36e09f1);
        namespace_9abe40d2af041eb2::recordkillstreakendstats(turret.streakinfo);
        if (istrue(turret.var_81fcf56aaed3e005)) {
            if (isdefined(level.var_b67b5f9dfe488c2f)) {
                thread [[ level.var_f56a88761038798b ]](turret.streakinfo);
                self.var_81fcf56aaed3e005 = 0;
            }
        }
    }
    if (istrue(var_4fac8b8ce36e09f1)) {
        function_8959c1606f65e65(turret.streakinfo.streakname, turret.streakinfo.streakname + "_teamleader_destroyed");
    }
    turret sentryturret_setturretmodel("destroyed");
    turret setturretowner(undefined);
    if (!istrue(var_b2797481a55c620)) {
        turret setscriptablepartstate("shutdown", "on");
        namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(2);
        turret setscriptablepartstate("explode", "regular");
    } else {
        turret setscriptablepartstate("explode", "violent");
    }
    level callback::callback("killstreak_finish_use", {streakinfo:turret.streakinfo});
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
    turret function_83cebe0ae5318a7f(turret);
    if (issharedfuncdefined(#"hash_d8976e21a6adafba", #"hash_c33ceb91d0ca7a9d")) {
        turret [[ getsharedfunc(#"hash_d8976e21a6adafba", #"hash_c33ceb91d0ca7a9d") ]](turret);
    }
    wait(0.2);
    turret delete();
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x288d
// Size: 0x1a
function sentryturret_delayscriptabledelete() {
    level endon("game_ended");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(5);
    self delete();
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28ae
// Size: 0xa5
function sentryturret_watchtimeout(turret) {
    turret endon("kill_turret");
    turret endon("carried");
    self endon("disconnect");
    level endon("game_ended");
    while (turret.timeout > 0) {
        turret.timeout = turret.timeout - 0.05;
        namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(0.05);
    }
    function_8959c1606f65e65(turret.streakinfo.streakname, turret.streakinfo.streakname + "_teamleader_timeout");
    turret notify("kill_turret", 0);
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x295a
// Size: 0x3a
function sentryturret_watchdisown(turret) {
    turret endon("kill_turret");
    turret endon("carried");
    waittill_any_3("disconnect", "joined_team", "joined_spectators");
    turret notify("kill_turret", 0);
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x299b
// Size: 0x2c
function sentryturret_watchgameend(turret) {
    turret endon("kill_turret");
    turret endon("carried");
    level waittill("game_ended");
    turret notify("kill_turret", 0);
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29ce
// Size: 0x3a
function function_1bf664fbd06fe1b8(turret) {
    turret endon("kill_turret");
    turret endon("carried");
    self endon("disconnect");
    level endon("game_ended");
    turret waittill("entity_limit_destroy");
    turret notify("kill_turret", 0);
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a0f
// Size: 0xa4
function sentryturret_setturretmodel(type) {
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

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2aba
// Size: 0xf7
function function_6633c7714fc94777(streakinfo, var_3389369df8bf82d2) {
    self endon("death_or_disconnect");
    level endon("game_ended");
    endonnotify = "sentry_placement_failed";
    if (issharedfuncdefined("weapons", "watchForPlacementFireState")) {
        self thread [[ getsharedfunc("weapons", "watchForPlacementFireState") ]](streakinfo, endonnotify);
    }
    bundle = level.var_b23156d776b1d85.var_38f2a11237246ac["sentry_gun"];
    deployweaponname = function_53c4c53197386572(bundle.var_8881166e57766e3a, "deploy_sentry_mp");
    var_9b1deb5e9d32bbe3 = namespace_b3d24e921998a8b::streakdeploy_doweaponswitchdeploy(streakinfo, makeweapon(deployweaponname), 1, undefined, undefined, &weaponcleanupsentryturret);
    if (!istrue(var_9b1deb5e9d32bbe3)) {
        self notify(endonnotify);
        self.bgivensentry = 0;
        return 0;
    }
    self playsound("sentry_pickup");
    namespace_1cd9f6896754adb0::set("sentry", "armor", 0);
    return 1;
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bb9
// Size: 0xa5
function function_8fbbc6a868621dd5(var_3389369df8bf82d2) {
    currentstance = self getstance();
    if (currentstance == "stand" || currentstance == "crouch") {
        return 1;
    }
    var_1c0ae1d2606cb0cc = self function_29c14c6e321b9789("crouch");
    if (istrue(var_1c0ae1d2606cb0cc)) {
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            if (iscp()) {
                self [[ getsharedfunc("hud", "showErrorMessage") ]]("EQUIPMENT/ARMAMENT_CANNOT_BE_USED");
            } else {
                self [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/CANNOT_BE_USED");
            }
        }
        return 0;
    }
    return 1;
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c66
// Size: 0xe4
function sentry_attacktargets(var_630af5192659dd3b) {
    /#
        self.owner endon("<unknown string>");
    #/
    self endon("kill_turret");
    self endon("carried");
    level endon("game_ended");
    self.momentum = 0;
    self.var_81fcf56aaed3e005 = 0;
    while (1) {
        self waittill("turretstatechange");
        if (self isfiringturret()) {
            self laseron();
            thread sentry_burstfirestart(var_630af5192659dd3b);
            if (isdefined(level.var_b67b5f9dfe488c2f)) {
                thread [[ level.var_b67b5f9dfe488c2f ]](self.streakinfo);
                self.var_81fcf56aaed3e005 = 1;
            }
        } else {
            self laseroff();
            sentry_spindown();
            thread sentry_burstfirestop();
            if (isdefined(level.var_b67b5f9dfe488c2f)) {
                thread [[ level.var_f56a88761038798b ]](self.streakinfo);
                self.var_81fcf56aaed3e005 = 0;
            }
        }
    }
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d51
// Size: 0x267
function function_c057f52574c94670(var_630af5192659dd3b) {
    /#
        self endon("<unknown string>");
        self endon("<unknown string>");
        level endon("<unknown string>");
        self.turrettarget = spawn("<unknown string>", self gettagorigin("<unknown string>") + anglestoforward(self gettagangles("<unknown string>") * 300));
        self.turrettarget.var_f7db994d1c467c4d = 0;
        self.turrettarget dontinterpolate();
        self.turrettarget thread function_e2a098b6c28a80cb(self);
        self.turrettarget thread function_2937914e0c4fb627(self);
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
                        thread function_9004e9c694f0db7b(endpos);
                    }
                } else {
                    function_c44bb0461339a1f1();
                    var_8fb00db7001a2c8c = var_754dacbb98d14a25;
                    self setmode(var_8fb00db7001a2c8c);
                    thread sentry_attacktargets();
                }
            } else {
                var_c962b800eea5e761 = 0;
                if (var_8fb00db7001a2c8c != var_754dacbb98d14a25) {
                    self.owner notifyonplayercommandremove("<unknown string>", "<unknown string>");
                    function_c44bb0461339a1f1();
                    var_8fb00db7001a2c8c = var_754dacbb98d14a25;
                    self setmode(var_8fb00db7001a2c8c);
                    thread sentry_attacktargets();
                }
                waitframe();
            }
        }
    #/
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2fbf
// Size: 0x1b4
function function_9004e9c694f0db7b(var_49f486c39f38b9d9) {
    /#
        self.owner endon("<unknown string>");
        self.owner endon("<unknown string>");
        self endon("<unknown string>");
        self endon("<unknown string>");
        level endon("<unknown string>");
        self laseroff();
        thread sentry_burstfirestop();
        self.turrettarget.origin = var_49f486c39f38b9d9;
        self settargetentity(self.turrettarget);
        self.turrettarget.var_f7db994d1c467c4d = 1;
        var_77453585aac4fd21 = "<unknown string>";
        if (self.streakinfo.streakname == "<unknown string>") {
            var_77453585aac4fd21 = "<unknown string>";
        }
        var_6ce4b7d1920d2206 = "<unknown string>";
        wait(1);
        self laseron();
        while (1) {
            var_30c9c9336ef2caaf = self gettagorigin(var_77453585aac4fd21);
            var_831cc1b8f4225351 = self gettagangles(var_77453585aac4fd21);
            thread drawsphere(var_30c9c9336ef2caaf, 2, 1, (0, 1, 1));
            thread drawline(var_30c9c9336ef2caaf, var_30c9c9336ef2caaf + anglestoforward(var_831cc1b8f4225351) * 1800, 1, (0, 1, 1));
            var_9f813873731478c5 = self gettagorigin(var_6ce4b7d1920d2206);
            var_e0416d7c3c03c91b = self gettagangles(var_6ce4b7d1920d2206);
            thread drawsphere(var_9f813873731478c5, 2, 1, (1, 1, 0));
            thread drawline(var_9f813873731478c5, var_9f813873731478c5 + anglestoforward(var_e0416d7c3c03c91b) * 1800, 1, (1, 1, 0));
            sentry_burstfirestart(undefined, undefined, 1);
            wait(1);
        }
    #/
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x317a
// Size: 0x41
function function_c44bb0461339a1f1() {
    /#
        self cleartargetentity();
        self laseroff();
        thread sentry_burstfirestop();
        self.turrettarget.var_f7db994d1c467c4d = 0;
        self.owner notify("<unknown string>");
    #/
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x31c2
// Size: 0x62
function function_e2a098b6c28a80cb(turret) {
    /#
        turret endon("<unknown string>");
        turret endon("<unknown string>");
        self endon("<unknown string>");
        level endon("<unknown string>");
        while (1) {
            if (istrue(self.var_f7db994d1c467c4d)) {
                sphere(self.origin, 20, (1, 1, 0), 0, 1);
            }
            waitframe();
        }
    #/
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x322b
// Size: 0x3a
function function_2937914e0c4fb627(turret) {
    /#
        turret endon("<unknown string>");
        turret endon("<unknown string>");
        self endon("<unknown string>");
        level endon("<unknown string>");
        turret waittill("<unknown string>");
        self delete();
    #/
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x326c
// Size: 0x16
function sentry_targetlocksound() {
    self endon("death");
    self playsound("sentry_gun_target_lock_beep");
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3289
// Size: 0x4d
function sentry_spinup(var_630af5192659dd3b) {
    thread sentry_targetlocksound();
    while (self.momentum < var_630af5192659dd3b.spinuptime) {
        self.momentum = self.momentum + 0.1;
        wait(0.1);
    }
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32dd
// Size: 0xd
function sentry_spindown() {
    self.momentum = 0;
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32f1
// Size: 0x19b
function sentry_burstfirestart(var_630af5192659dd3b, var_ebed6e83eb956d18, var_7a4f7bd11952e7bc) {
    self endon("death");
    self endon("kill_turret");
    self endon("carried");
    self endon("stop_shooting");
    level endon("game_ended");
    var_50651df7c1ef6241 = undefined;
    if (isdefined(var_630af5192659dd3b)) {
        var_50651df7c1ef6241 = var_630af5192659dd3b;
    } else {
        var_50651df7c1ef6241 = level.sentrysettings[self.turrettype];
    }
    sentry_spinup(var_50651df7c1ef6241);
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
        var_7bfd8851dd6393ef = self function_bfe38f2fb8999e70();
        if (var_7bfd8851dd6393ef > 0) {
            wait(var_7bfd8851dd6393ef);
        }
        for (i = 0; i < numshots && !self.overheated; i++) {
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

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3493
// Size: 0xb
function sentry_burstfirestop() {
    self notify("stop_shooting");
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x34a5
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

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x354c
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

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x35b2
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

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x364c
// Size: 0x17a
function function_ffbb592bde7cbca8(newowner, var_c0f9139ffd72e62d) {
    if (isdefined(newowner)) {
        self notify("turret_hacked");
        self setturretowner(newowner);
        self setturretteam(newowner.team);
        self.owner = newowner;
        self.team = newowner.team;
        if (isdefined(var_c0f9139ffd72e62d)) {
            var_c0f9139ffd72e62d.placedsentries[self.turrettype] = array_remove(var_c0f9139ffd72e62d.placedsentries[self.turrettype], self);
        }
        if (issharedfuncdefined("sound", "playKillstreakDeployDialog")) {
            [[ getsharedfunc("sound", "playKillstreakDeployDialog") ]](newowner, self.streakinfo.streakname);
        }
        killstreak_dangerNotifyPlayersInRange(newowner, newowner.team, 2000, self.streakinfo.streakname);
        newowner function_5c49802fcf1a63ed(self);
        newowner thread sentryturret_watchpickup(self);
        namespace_37987c2865e1a627::function_2eff4cd94c3243e8();
        if (issharedfuncdefined("game", "createObjective")) {
            self.minimapid = self [[ getsharedfunc("game", "createObjective") ]]("hud_icon_minimap_killstreak_sentry", newowner.team, undefined, 1, 1);
        }
        if (level.teambased) {
            self filteroutplayermarks(newowner.team);
        } else {
            self filteroutplayermarks(newowner);
        }
    }
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37cd
// Size: 0x16
function function_49197cd063a740ea(callbackfunction) {
    self.var_d1659ed0a33bf98f = callbackfunction;
}

// Namespace sentry_gun/namespace_c5e4bf96a5150e88
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37ea
// Size: 0xe
function function_3267046817e6a131() {
    self notify("kill_turret", 1);
}

