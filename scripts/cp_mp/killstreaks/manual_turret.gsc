// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using script_4c770a9a4ad7659c;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\hostmigration.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\mp\sentientpoolmanager.gsc;
#using scripts\cp_mp\utility\train_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace manual_turret;

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8ca
// Size: 0x3c
function init() {
    if (issharedfuncdefined("manual_turret", "init")) {
        [[ getsharedfunc("manual_turret", "init") ]]();
    }
    registervisibilityomnvarforkillstreak("manual_turret", "on", 10);
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x90d
// Size: 0x29
function weaponcleanupmanualturret(streakinfo, var_41bf9bf4918115ac, weaponobj) {
    if (!istrue(var_41bf9bf4918115ac)) {
        namespace_b3d24e921998a8b::getridofkillstreakdeployweapon(weaponobj);
    }
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x93d
// Size: 0x26
function tryusemanualturret(streakname) {
    streakinfo = createstreakinfo(streakname, self);
    return tryusemanualturretfromstruct(streakinfo);
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x96b
// Size: 0x125
function tryusemanualturretfromstruct(streakinfo) {
    level endon("game_ended");
    self endon("disconnect");
    if (isdefined(level.killstreaktriggeredfunc)) {
        if (!level [[ level.killstreaktriggeredfunc ]](streakinfo)) {
            return 0;
        }
    }
    namespace_d325722f2754c2c4::saveweaponstates();
    var_9b1deb5e9d32bbe3 = namespace_b3d24e921998a8b::streakdeploy_doweaponswitchdeploy(streakinfo, makeweapon("deploy_manual_turret_mp"), 1, undefined, undefined, &weaponcleanupmanualturret);
    if (!istrue(var_9b1deb5e9d32bbe3)) {
        return 0;
    }
    if (isdefined(level.killstreakbeginusefunc)) {
        if (!level [[ level.killstreakbeginusefunc ]](streakinfo)) {
            return 0;
        }
    }
    manualturret_toggleallowplacementactions(0);
    turret = manualturret_create("manual_turret", streakinfo);
    if (!isdefined(turret)) {
        manualturret_toggleallowplacementactions(1);
        return 0;
    }
    marker = manualturret_watchplacement(turret, streakinfo, 0, 1.25);
    if (!isdefined(marker)) {
        manualturret_toggleallowplacementactions(1);
        turret delete();
        return 0;
    }
    manualturret_toggleallowplacementactions(1);
    manualturret_setplaced(turret, marker);
    if (issharedfuncdefined("manual_turret", "munitionUsed")) {
        self [[ getsharedfunc("manual_turret", "munitionUsed") ]]();
    }
    return 1;
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa98
// Size: 0x122
function manualturret_watchplacement(turret, streakinfo, var_6152d24062d26039, var_290b1442271ab369) {
    thread manualturret_delayplacementinstructions(var_290b1442271ab369);
    marker = undefined;
    if (issharedfuncdefined("manual_turret", "watchForPlayerEnteringLastStand")) {
        self thread [[ getsharedfunc("manual_turret", "watchForPlayerEnteringLastStand") ]]();
    }
    if (namespace_3c37cb17ade254d::issharedfuncdefined("manual_turret", "getTargetMarker")) {
        marker = self [[ namespace_3c37cb17ade254d::getsharedfunc("manual_turret", "getTargetMarker") ]](streakinfo, var_6152d24062d26039);
    }
    self notify("turret_placement_finished");
    if (!isdefined(marker) || !isdefined(marker.location)) {
        if (istrue(self.inlaststand)) {
            _takeweapon("deploy_manual_turret_mp");
        } else if (namespace_f8065cafc523dba5::_isalive()) {
            function_8608f39517786dab("deploy_manual_turret_mp");
        }
        return undefined;
    }
    turret thread manualturret_disablefire(self, 1, 1);
    if (self hasweapon("deploy_manual_turret_mp")) {
        thread function_8608f39517786dab("deploy_manual_turret_mp", 1, 1);
    }
    var_85cda42514dc11d2 = 0.85;
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(var_85cda42514dc11d2);
    return marker;
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbc2
// Size: 0x51
function manualturret_delayplacementinstructions(delaytime) {
    self endon("death_or_disconnect");
    self endon("turret_placement_finished");
    level endon("game_ended");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(delaytime);
    self setclientomnvar("ui_turret_placement", 1);
    thread manualturret_clearplacementinstructions("death");
    thread manualturret_clearplacementinstructions("turret_placement_finished");
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc1a
// Size: 0x3a
function manualturret_clearplacementinstructions(var_c1948d1eedabf26c) {
    self endon("cleared_placement");
    self endon("disconnect");
    level endon("game_ended");
    self waittill(var_c1948d1eedabf26c);
    self setclientomnvar("ui_turret_placement", 0);
    self notify("cleared_placement");
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc5b
// Size: 0x2d4
function manualturret_create(turrettype, streakinfo) {
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
    turret.reticlestate = "reticle_on";
    turret.timeout = config.timeout;
    /#
        var_2a98d1683cf44153 = getdvarint(@"hash_2c01d701bac5d9d3", 0);
        if (var_2a98d1683cf44153) {
            turret.timeout = 9999;
        }
    #/
    turret.carriedby = self;
    turret manualturret_setturretmodel("placed");
    turret makeunusable();
    turret setnodeploy(1);
    turret setdefaultdroppitch(0);
    turret hide();
    turret namespace_5a51aa78ea0b1b9f::allow_emp(0);
    var_d3dc97c59992d51 = anglestoforward(turret.angles);
    var_a8ae5e047a5b6cb6 = turret gettagorigin("tag_laser") + (0, 0, 10);
    var_a8ae5e047a5b6cb6 = var_a8ae5e047a5b6cb6 - var_d3dc97c59992d51 * 20;
    killcament = spawn("script_model", var_a8ae5e047a5b6cb6);
    killcament linkto(turret);
    turret.killcament = killcament;
    turret.colmodel = spawn("script_model", turret.origin);
    turret.colmodel.team = turret.team;
    turret.colmodel.owner = turret.owner;
    turret.colmodel setmodel("weapon_vm_mg_sentry_turret_invis_base");
    turret.colmodel dontinterpolate();
    turret.colmodel hide();
    turret.colmodel.moverdoesnotkill = 1;
    turret.colmodel.turretparent = turret;
    return turret;
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf37
// Size: 0x782
function manualturret_setplaced(turret, marker) {
    config = level.sentrysettings[turret.turrettype];
    turret manualturret_setturretmodel("placed");
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
    if (isdefined(self.hideammoindex)) {
        for (var_af6fa51a19e513fc = self.hideammoindex; var_af6fa51a19e513fc >= 1; var_af6fa51a19e513fc--) {
            turret setscriptablepartstate("hide_ammo_" + var_af6fa51a19e513fc, "on", 0);
        }
    }
    var_aa127492f0104d8c = "off";
    if (turret.reticlestate == "reticle_off") {
        var_aa127492f0104d8c = "on";
    }
    turret setscriptablepartstate("hide_reticle", var_aa127492f0104d8c, 0);
    turret.origin = marker.location;
    turret playsound("sentry_gun_plant");
    turret.colmodel show();
    turret.colmodel.angles = turret.angles;
    turret.colmodel.origin = turret.origin;
    turret.colmodel linkto(turret, "tag_aim_pivot");
    var_e005d4b70d6f2611 = issharedfuncdefined("game", "isBRStyleGameType") && [[ getsharedfunc("game", "isBRStyleGameType") ]]();
    if (!var_e005d4b70d6f2611) {
        var_f96e4256f03c5f42 = "icon_minimap_mobileturret";
        if (issharedfuncdefined("game", "createObjective")) {
            turret.minimapid = turret.colmodel [[ getsharedfunc("game", "createObjective") ]](var_f96e4256f03c5f42, turret.team, undefined, 1, 1);
        }
    }
    var_11d7f05662df0482 = self.placedsentries[turret.turrettype].size;
    self.placedsentries[turret.turrettype][var_11d7f05662df0482] = turret;
    if (var_11d7f05662df0482 + 1 > 1) {
        self.placedsentries[turret.turrettype][0] notify("kill_turret", 0);
    }
    headiconoffset = 70;
    if (turret.model == level.sentrysettings[turret.turrettype].modelbasecover) {
        headiconoffset = 35;
    }
    if (issharedfuncdefined("killstreak", "addToActiveKillstreakList")) {
        turret [[ getsharedfunc("killstreak", "addToActiveKillstreakList") ]](turret.turrettype, "Killstreak_Ground", self, 0, 1, headiconoffset, "carried_turret");
    }
    turret setmode(level.sentrysettings[turret.turrettype].sentrymodeon);
    var_7613cdeef31be333 = getdvarint(@"hash_475bdcf02a7c5c6e", 17);
    hintfov = getdvarint(@"hash_1faf82c0894746bc", 160);
    usefov = getdvarint(@"hash_955590189adc87c8", 120);
    var_5e8eb3c31f9c265c = "j_trigger";
    if (!isdefined(turret.useownerobj)) {
        var_963953c3478bf4fe = turret gettagorigin(var_5e8eb3c31f9c265c);
        var_efe526bf6a23d275 = undefined;
        if (self function_c6cb3e654225077a()) {
            var_efe526bf6a23d275 = "hud_icon_killstreak_turret";
        }
        if (namespace_3c37cb17ade254d::issharedfuncdefined("manual_turret", "createHintObject")) {
            turret.useownerobj = [[ namespace_3c37cb17ade254d::getsharedfunc("manual_turret", "createHintObject") ]](var_963953c3478bf4fe, "HINT_BUTTON", var_efe526bf6a23d275, config.ownerusehintstring, -1, "duration_none", undefined, var_7613cdeef31be333, hintfov, var_7613cdeef31be333, usefov);
        }
    } else {
        var_963953c3478bf4fe = turret gettagorigin(var_5e8eb3c31f9c265c);
        turret.useownerobj function_dfb78b3e724ad620(1);
        turret.useownerobj dontinterpolate();
        turret.useownerobj.origin = var_963953c3478bf4fe;
    }
    turret.useownerobj linkto(turret, var_5e8eb3c31f9c265c);
    if (!isdefined(turret.useotherobj)) {
        var_963953c3478bf4fe = turret gettagorigin(var_5e8eb3c31f9c265c);
        if (namespace_3c37cb17ade254d::issharedfuncdefined("manual_turret", "createHintObject")) {
            turret.useotherobj = [[ namespace_3c37cb17ade254d::getsharedfunc("manual_turret", "createHintObject") ]](var_963953c3478bf4fe, "HINT_BUTTON", undefined, config.otherusehintstring, -1, "duration_none", undefined, var_7613cdeef31be333, hintfov, var_7613cdeef31be333, usefov);
        }
    } else {
        var_963953c3478bf4fe = turret gettagorigin(var_5e8eb3c31f9c265c);
        turret.useotherobj function_dfb78b3e724ad620(1);
        turret.useotherobj dontinterpolate();
        turret.useotherobj.origin = var_963953c3478bf4fe;
    }
    turret.useotherobj linkto(turret, var_5e8eb3c31f9c265c);
    if (namespace_3c37cb17ade254d::issharedfuncdefined("manual_turret", "handleMovingPlatform")) {
        [[ namespace_3c37cb17ade254d::getsharedfunc("manual_turret", "handleMovingPlatform") ]](turret);
    }
    turret namespace_5a51aa78ea0b1b9f::allow_emp(1);
    turret namespace_6d9917c3dc05dbe9::registersentient("Killstreak_Static", self);
    turret thread manualturret_delaydeletemarker(self, marker);
    turret thread manualturret_watchuse(self, turret.useownerobj);
    turret thread manualturret_watchuse(self, turret.useotherobj);
    turret thread manualturret_watchpickup(self);
    turret thread manualturret_watchdamage(self);
    turret thread manualturret_watchdeath(self);
    turret thread manualturret_watchdeathongameend();
    turret thread manualturret_watchtimeout(self);
    turret thread manualturret_watchdisown(self);
    if (isdefined(level.wztrain_info) && issharedfuncdefined("game", "handlemovingplatforms")) {
        data = spawnstruct();
        data.deathoverridecallback = &function_2a4ebbd9d0e941a2;
        turret thread [[ getsharedfunc("game", "handlemovingplatforms") ]](data);
    }
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16c0
// Size: 0x7e
function function_2a4ebbd9d0e941a2(data) {
    engine = namespace_9db09f982acd35b4::function_d6b0a591ac99bd();
    /#
        assert(isdefined(engine));
    #/
    if (!isdefined(engine)) {
        return;
    }
    if (is_equal(data.lasttouchedplatform, engine)) {
        self notify("kill_turret", 1);
    } else {
        data = spawnstruct();
        data.deathoverridecallback = &function_2a4ebbd9d0e941a2;
        self thread [[ getsharedfunc("game", "handlemovingplatforms") ]](data);
    }
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1745
// Size: 0x1f1
function manualturret_setcarried(owner) {
    self endon("kill_turret");
    owner endon("death_or_disconnect");
    owner endon("start_turret_use");
    level endon("game_ended");
    if (istrue(self.inuse)) {
        self.inuse = undefined;
        owner manualturret_toggleallowuseactions(1);
    }
    if (isdefined(self.moving_platform)) {
        self.moving_platform = undefined;
        self.moving_platform_offset = undefined;
        self.moving_platform_angles_offset = undefined;
        self unlink();
    }
    namespace_5a51aa78ea0b1b9f::allow_emp(0);
    namespace_6d9917c3dc05dbe9::unregistersentient(self.sentientpool, self.sentientpoolindex);
    var_e478ac91af0e92cb = self getlinkedchildren();
    foreach (child in var_e478ac91af0e92cb) {
        if (isdefined(child)) {
            child unlink();
        }
    }
    if (isdefined(self.minimapid)) {
        if (issharedfuncdefined("game", "returnObjectiveID")) {
            [[ getsharedfunc("game", "returnObjectiveID") ]](self.minimapid);
        }
        self.minimapid = undefined;
    }
    self.colmodel hide();
    owner manualturret_setinactive(self);
    self hide();
    self.carriedby = owner;
    self notify("carried_turret");
    self playsound("sentry_pickup");
    owner namespace_d325722f2754c2c4::saveweaponstates();
    owner _giveweapon("deploy_manual_turret_mp");
    owner _switchtoweapon("deploy_manual_turret_mp");
    owner manualturret_toggleallowplacementactions(0);
    marker = owner manualturret_watchplacement(self, self.streakinfo, 1, 2);
    if (!isdefined(marker)) {
        owner manualturret_toggleallowplacementactions(1);
        return 0;
    }
    owner manualturret_toggleallowplacementactions(1);
    owner manualturret_setplaced(self, marker);
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x193d
// Size: 0x65
function manualturret_setinactive(turret) {
    turret setmode(level.sentrysettings[turret.turrettype].sentrymodeoff);
    turret setturretminimapvisible(0);
    turret manualturret_makealltriggersusable(0);
    turret.useownerobj unlink();
    turret.useotherobj unlink();
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19a9
// Size: 0x48
function manualturret_delaydeletemarker(owner, marker) {
    self endon("kill_turret");
    level endon("game_ended");
    wait(0.25);
    if (isdefined(marker.visual)) {
        marker.visual delete();
    }
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19f8
// Size: 0x455
function manualturret_watchuse(owner, var_c0a76805ffb5d8fc) {
    self endon("kill_turret");
    self endon("carried_turret");
    owner endon("disconnect");
    level endon("game_ended");
    foreach (player in level.players) {
        var_c0a76805ffb5d8fc enableplayeruse(player);
        if (var_c0a76805ffb5d8fc == self.useownerobj) {
            if (player == owner) {
                continue;
            }
        } else if (level.teambased && player.team == owner.team && player != owner) {
            continue;
        }
        var_c0a76805ffb5d8fc disableplayeruse(player);
    }
    thread manualturret_disableplayeruseonconnect(owner, var_c0a76805ffb5d8fc);
    while (1) {
        player = var_c0a76805ffb5d8fc waittill("trigger");
        if (istrue(self.inuse)) {
            continue;
        }
        if (istrue(self.stopinteract)) {
            if (issharedfuncdefined("hud", "showErrorMessage")) {
                player [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/TURRET_DYING");
            }
            continue;
        }
        if (player isonladder() || !player isonground() || player ismantling()) {
            if (issharedfuncdefined("hud", "showErrorMessage")) {
                player [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/CANNOT_BE_USED");
            }
            continue;
        }
        if (istrue(player.isjuggernaut)) {
            if (issharedfuncdefined("hud", "showErrorMessage")) {
                player [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/JUGG_CANNOT_BE_USED");
            }
            continue;
        }
        if (issharedfuncdefined("manual_turret", "allowPickupOfTurret")) {
            if (!player [[ getsharedfunc("manual_turret", "allowPickupOfTurret") ]]()) {
                continue;
            }
        }
        self.inuse = 1;
        player manualturret_toggleallowuseactions(0);
        player disableturretdismount();
        if (player == owner) {
            buttontime = 0;
            while (player usebuttonpressed() && buttontime < 0.25) {
                waitframe();
                buttontime = buttontime + level.framedurationseconds;
            }
            if (buttontime >= 0.25) {
                player enableturretdismount();
                continue;
            }
        }
        player notify("start_turret_use");
        self.playerusingturret = player;
        manualturret_makealltriggersusable(0);
        player namespace_d325722f2754c2c4::saveweaponstates();
        player.useweapon = level.sentrysettings[self.turrettype].playerweaponinfo;
        player _giveweapon(player.useweapon, undefined, undefined, 1);
        var_b80592d1b570a193 = gettime();
        result = undefined;
        while (gettime() - var_b80592d1b570a193 < 1000) {
            result = manualturret_domonitoredweaponswitch(player, player.useweapon);
            if (!isdefined(result) || istrue(result)) {
                break;
            }
            waitframe();
        }
        if (!istrue(result)) {
            self.inuse = undefined;
            self.playerusingturret = undefined;
            manualturret_makealltriggersusable(1);
            if (isdefined(player)) {
                if (player _isalive()) {
                    player manualturret_toggleallowuseactions(1);
                    lastweaponobj = player namespace_d325722f2754c2c4::restoreweaponstates(player.lastdroppableweaponobj);
                    player switchtoweaponimmediate(lastweaponobj);
                }
                player clearhighpriorityweapon(player.useweapon);
                player _takeweapon(player.useweapon);
            }
            continue;
        }
        player.currentturret = self;
        player controlturreton(self);
        if (namespace_36f464722d326bbe::function_d2d2b803a7b741a4()) {
            player val::set("nightmap_check", "nvg", 0);
        }
        manualturret_applyoverlay(player);
        /#
            thread function_7af27da684141f1e(player);
        #/
        thread manualturret_disablefire(player, 0.5, 1);
        thread manualturret_watchammotracker(player);
        thread manualturret_endturretuseonexecution(player);
        thread manualturret_endturretuseonpush(player);
        thread manualturret_endturretusewatch(player);
        thread manualturret_endturretonplayer(player);
        thread manualturret_watchplayerangles(player);
    }
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e54
// Size: 0x5b
function manualturret_domonitoredweaponswitch(var_7f214a58689204e8, var_d5e9925a20479492) {
    self endon("kill_turret");
    self endon("turret_switch_weapon_timeout");
    var_7f214a58689204e8 endon("death_or_disconnect");
    level endon("game_ended");
    thread manualturret_watchturretusetimeout(1);
    result = var_7f214a58689204e8 domonitoredweaponswitch(var_d5e9925a20479492, 1);
    self notify("turret_switch_weapon_ended");
    return result;
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eb7
// Size: 0x31
function manualturret_watchturretusetimeout(timeout) {
    self endon("kill_turret");
    self endon("turret_switch_weapon_ended");
    level endon("game_ended");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(timeout);
    self notify("turret_switch_weapon_timeout");
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1eef
// Size: 0xf8
function manualturret_watchdismantle(owner, dismantleobj) {
    self endon("kill_turret");
    self endon("carried_turret");
    owner endon("disconnect");
    level endon("game_ended");
    foreach (player in level.players) {
        dismantleobj enableplayeruse(player);
        if (level.teambased && player.team != owner.team) {
            continue;
        } else if (!level.teambased) {
            if (player != owner) {
                continue;
            }
        }
        dismantleobj disableplayeruse(player);
    }
    thread manualturret_disableplayerdismantleonconnect(owner);
    while (1) {
        player = dismantleobj waittill("trigger");
        self notify("kill_turret", 0);
        break;
    }
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fee
// Size: 0x4f
function manualturret_applyoverlay(user) {
    user _setvisibiilityomnvarforkillstreak(self.streakinfo.streakname, "on");
    user setclientomnvar("ui_mobile_turret_controls", 1);
    user setclientomnvar("ui_killstreak_weapon_1_ammo", self.ammocount);
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2044
// Size: 0x39
function manualturret_removeoverlay(user) {
    user _setvisibiilityomnvarforkillstreak(self.streakinfo.streakname, "off");
    user setclientomnvar("ui_mobile_turret_controls", 0);
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2084
// Size: 0xc0
function function_7af27da684141f1e(user) {
    /#
        self endon("sentry_gun_plant");
        self endon("hud_icon_killstreak_turret");
        user endon("allowPickupOfTurret");
        user endon("removed_spawn_perks");
        level endon("monitorDamage");
        user notifyonplayercommand("player", "joined_spectators");
        while (1) {
            user waittill("player");
            if (self.reticlestate == "manual_turret_use") {
                user iprintlnbold("<unknown string>");
                self setscriptablepartstate("<unknown string>", "<unknown string>", 0);
                self.reticlestate = "<unknown string>";
            } else {
                user iprintlnbold("<unknown string>");
                self setscriptablepartstate("<unknown string>", "<unknown string>", 0);
                self.reticlestate = "manual_turret_use";
            }
        }
    #/
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x214b
// Size: 0x74
function manualturret_disablefire(user, var_c3c4590965030e9e, var_fdb0c27120ddef03) {
    if (istrue(var_fdb0c27120ddef03)) {
        user endon("death_or_disconnect");
        level endon("game_ended");
    }
    if (isdefined(user) && namespace_f8065cafc523dba5::_isalive()) {
        user freezecontrols(1);
    } else {
        return;
    }
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(var_c3c4590965030e9e);
    if (!isdefined(self)) {
        return;
    }
    if (isdefined(user) && namespace_f8065cafc523dba5::_isalive()) {
        user freezecontrols(0);
    } else {
        return;
    }
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x21c6
// Size: 0x11d
function manualturret_enableenemyoutlines(user) {
    if (!isdefined(self.enemyoutlineinfos)) {
        self.enemyoutlineinfos = [];
    }
    thread manualturret_enableenemyoutlinesonconnect(user);
    if (issharedfuncdefined("manual_turret", "getEnemyPlayers")) {
        foreach (enemy in [[ getsharedfunc("manual_turret", "getEnemyPlayers") ]](user.team)) {
            if (issharedfuncdefined("perk", "hasPerk")) {
                jumpiffalse(enemy [[ getsharedfunc("perk", "hasPerk") ]]("specialty_noscopeoutline")) LOC_00000100;
                if (!enemy namespace_f8065cafc523dba5::_isalive()) {
                    thread manualturret_enableenemyoutlineafterprotection(user, enemy, 1);
                } else if (isdefined(enemy.avoidkillstreakonspawntimer) && enemy.avoidkillstreakonspawntimer > 0) {
                    thread manualturret_enableenemyoutlineafterprotection(user, enemy);
                }
            } else {
            LOC_00000100:
                manualturret_addtooutlinelist(user, enemy);
            }
        }
    }
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22ea
// Size: 0x41
function manualturret_enableenemyoutlinesonconnect(user) {
    self endon("kill_turret");
    user endon("end_turret_use");
    while (1) {
        player = level waittill("connected");
        thread manualturret_enableenemyoutlineafterprotection(user, player, 1);
    }
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2332
// Size: 0x4a
function manualturret_removeoutlineondeath(user, var_990e778233dc8cf4, outlineid) {
    self endon("kill_turret");
    user endon("end_turret_use");
    var_990e778233dc8cf4 waittill("death_or_disconnect");
    manualturret_removefromoutlinelist(var_990e778233dc8cf4, outlineid);
    if (isdefined(var_990e778233dc8cf4)) {
        thread manualturret_restoreoutlineonspawn(user, var_990e778233dc8cf4);
    }
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2383
// Size: 0x57
function manualturret_restoreoutlineonspawn(user, var_990e778233dc8cf4) {
    self endon("kill_turret");
    user endon("end_turret_use");
    var_990e778233dc8cf4 endon("disconnect");
    while (1) {
        player = level waittill("player_spawned");
        if (player != var_990e778233dc8cf4) {
            continue;
        }
        thread manualturret_enableenemyoutlineafterprotection(user, player);
    }
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23e1
// Size: 0xbf
function manualturret_enableenemyoutlineafterprotection(user, var_990e778233dc8cf4, waitforspawn) {
    self endon("kill_turret");
    user endon("end_turret_use");
    if (istrue(waitforspawn)) {
        var_990e778233dc8cf4 waittill("spawned_player");
    }
    if (isdefined(var_990e778233dc8cf4.avoidkillstreakonspawntimer) && var_990e778233dc8cf4.avoidkillstreakonspawntimer > 0) {
        var_990e778233dc8cf4 waittill("removed_spawn_perks");
    }
    if (level.teambased && var_990e778233dc8cf4.team == user.team) {
        return;
    }
    if (issharedfuncdefined("perk", "hasPerk")) {
        if (var_990e778233dc8cf4 [[ getsharedfunc("perk", "hasPerk") ]]("specialty_noscopeoutline")) {
            return;
        }
    }
    manualturret_addtooutlinelist(user, var_990e778233dc8cf4);
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24a7
// Size: 0x9a
function manualturret_addtooutlinelist(var_c9a4579b227233f3, var_e69b22a24070ec44) {
    var_6e7692abf5f96ad9 = spawnstruct();
    var_6e7692abf5f96ad9.ent = var_e69b22a24070ec44;
    if (namespace_3c37cb17ade254d::issharedfuncdefined("outline", "outlineEnableForPlayer")) {
        var_6e7692abf5f96ad9.entoutlineid = [[ namespace_3c37cb17ade254d::getsharedfunc("outline", "outlineEnableForPlayer") ]](var_e69b22a24070ec44, var_c9a4579b227233f3, "outline_nodepth_orange", "level_script");
    }
    self.enemyoutlineinfos[self.enemyoutlineinfos.size] = var_6e7692abf5f96ad9;
    thread manualturret_removeoutlineondeath(var_c9a4579b227233f3, var_e69b22a24070ec44, var_6e7692abf5f96ad9.entoutlineid);
    return var_6e7692abf5f96ad9;
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2549
// Size: 0xc6
function manualturret_removefromoutlinelist(var_9d90c26327e3eacd, outlineid) {
    if (!isdefined(self.enemyoutlineinfos)) {
        return;
    }
    if (namespace_3c37cb17ade254d::issharedfuncdefined("outline", "outlineDisable")) {
        [[ namespace_3c37cb17ade254d::getsharedfunc("outline", "outlineDisable") ]](outlineid, var_9d90c26327e3eacd);
    }
    var_4f484c103c832786 = [];
    foreach (var_6e7692abf5f96ad9 in self.enemyoutlineinfos) {
        if (var_6e7692abf5f96ad9.ent == var_9d90c26327e3eacd) {
            continue;
        }
        var_4f484c103c832786[var_4f484c103c832786.size] = var_6e7692abf5f96ad9;
    }
    self.enemyoutlineinfos = var_4f484c103c832786;
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2616
// Size: 0xad
function manualturret_disableenemyoutlines(user) {
    if (!isdefined(self.enemyoutlineinfos)) {
        return;
    }
    foreach (var_6e7692abf5f96ad9 in self.enemyoutlineinfos) {
        if (namespace_3c37cb17ade254d::issharedfuncdefined("outline", "outlineDisable")) {
            [[ namespace_3c37cb17ade254d::getsharedfunc("outline", "outlineDisable") ]](var_6e7692abf5f96ad9.entoutlineid, var_6e7692abf5f96ad9.ent);
        }
    }
    self.enemyoutlineinfos = undefined;
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x26ca
// Size: 0x157
function manualturret_endplayeruse(turret) {
    if (isdefined(turret)) {
        turret.inuse = undefined;
        turret.playerusingturret = undefined;
        turret manualturret_makealltriggersusable(1);
    }
    if (isdefined(self)) {
        if (!self usinggamepad()) {
            self enableturretdismount();
        }
        if (isdefined(turret)) {
            if (isdefined(self.currentturret) && self.currentturret != turret) {
                return;
            }
            self controlturretoff(turret);
            turret manualturret_removeoverlay(self);
            if (!istrue(turret.isshuttingdown)) {
                turret thread manualturret_watchpickup(turret.owner);
            }
        }
        self.currentturret = undefined;
        manualturret_toggleallowuseactions(1);
        if (namespace_36f464722d326bbe::function_d2d2b803a7b741a4()) {
            val::function_c9d0b43701bdba00("nightmap_check");
        }
        if (!namespace_36f464722d326bbe::isbrstylegametype() || namespace_36f464722d326bbe::isbrstylegametype() && !istrue(self.inlaststand)) {
            lastweaponobj = namespace_d325722f2754c2c4::restoreweaponstates(self.lastdroppableweaponobj);
            self switchtoweaponimmediate(lastweaponobj);
        }
        _takeweapon(self.useweapon);
        thread manualturret_disablecrouchpronemantle();
        if (_isalive()) {
            self setorigin(turret.lastuserpos, 1);
            self setplayerangles(turret.lastuserangles);
        }
        self notify("end_turret_use");
    }
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2828
// Size: 0x55
function manualturret_disablecrouchpronemantle() {
    self endon("death_or_disconnect");
    val::set("manual_turret", "crouch", 0);
    val::set("manual_turret", "prone", 0);
    val::set("manual_turret", "mantle", 0);
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(1);
    val::function_c9d0b43701bdba00("manual_turret");
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2884
// Size: 0x58
function manualturret_disableplayeruseonconnect(owner, useobj) {
    if (isdefined(self)) {
        self endon("kill_turret");
        self endon("carried_turret");
    }
    owner endon("disconnect");
    level endon("game_ended");
    while (1) {
        player = level waittill("connected");
        useobj disableplayeruse(player);
    }
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28e3
// Size: 0x4d
function manualturret_endturretuseonexecution(user) {
    self endon("kill_turret");
    self endon("carried_turret");
    user endon("end_turret_use");
    user endon("disconnect");
    level endon("game_ended");
    while (1) {
        if (user isinexecutionvictim()) {
            user manualturret_endplayeruse(self);
            break;
        }
        waitframe();
    }
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2937
// Size: 0x82
function manualturret_endturretuseonpush(user) {
    self endon("kill_turret");
    self endon("carried_turret");
    user endon("end_turret_use");
    user endon("disconnect");
    level endon("game_ended");
    var_71982e9b7e15c211 = 2500;
    if (isdefined(self.moving_platform)) {
        var_71982e9b7e15c211 = 10000;
    }
    while (1) {
        if (distancesquared(self.origin, user.origin) >= var_71982e9b7e15c211) {
            user manualturret_endplayeruse(self);
            break;
        }
        waitframe();
    }
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x29c0
// Size: 0x5a
function manualturret_endturretusewatch(user) {
    self endon("kill_turret");
    self endon("carried_turret");
    user endon("end_turret_use");
    user endon("disconnect");
    level endon("game_ended");
    while (user usebuttonpressed()) {
        waitframe();
    }
    while (1) {
        if (user usebuttonpressed()) {
            user manualturret_endplayeruse(self);
            break;
        }
        waitframe();
    }
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a21
// Size: 0x35
function manualturret_endturretonplayer(user) {
    user endon("end_turret_use");
    level endon("game_ended");
    user waittill_any_2("death_or_disconnect", "last_stand_start");
    user manualturret_endplayeruse(self);
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a5d
// Size: 0x54
function manualturret_watchplayerangles(user) {
    self endon("kill_turret");
    user endon("end_turret_use");
    user endon("death_or_disconnect");
    level endon("game_ended");
    while (1) {
        self.lastuserpos = user.origin;
        self.lastuserangles = user getplayerangles();
        waitframe();
    }
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ab8
// Size: 0x1b9
function manualturret_watchpickup(owner) {
    if (!isdefined(owner)) {
        return;
    }
    self endon("kill_turret");
    self endon("carried_turret");
    owner endon("disconnect");
    owner endon("start_turret_use");
    level endon("game_ended");
    while (isdefined(self) && isdefined(self.useownerobj)) {
        player = self.useownerobj waittill("trigger_progress");
        buttontime = 0;
        while (owner usebuttonpressed() && buttontime < 0.25) {
            waitframe();
            buttontime = buttontime + level.framedurationseconds;
        }
        if (!isdefined(player)) {
            continue;
        }
        if (buttontime < 0.25) {
            continue;
        }
        if (istrue(self.stopinteract)) {
            if (issharedfuncdefined("hud", "showErrorMessage")) {
                player [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/TURRET_DYING");
            }
            continue;
        }
        if (istrue(player.isjuggernaut)) {
            if (issharedfuncdefined("hud", "showErrorMessage")) {
                player [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/JUGG_CANNOT_BE_USED");
            }
            continue;
        }
        if (issharedfuncdefined("manual_turret", "allowPickupOfTurret")) {
            if (!player [[ getsharedfunc("manual_turret", "allowPickupOfTurret") ]]()) {
                continue;
            }
        }
        manualturret_makealltriggersusable(0);
        self setmode(level.sentrysettings[self.turrettype].sentrymodeoff);
        owner.placedsentries[self.turrettype] = array_remove(owner.placedsentries[self.turrettype], self);
        thread manualturret_setcarried(owner);
    }
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2c78
// Size: 0x36
function manualturret_watchdelayedpickup(owner) {
    self endon("kill_turret");
    owner endon("disconnect");
    level endon("game_ended");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(0.5);
    thread manualturret_watchpickup(owner);
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2cb5
// Size: 0x55
function manualturret_disableplayerpickuponconnect(turret) {
    turret endon("kill_turret");
    turret endon("carried_turret");
    self endon("disconnect");
    level endon("game_ended");
    while (1) {
        player = level waittill("connected");
        turret.useownerobj disableplayeruse(player);
    }
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d11
// Size: 0x4d
function manualturret_watchdamage(owner) {
    if (namespace_3c37cb17ade254d::issharedfuncdefined("manual_turret", "monitorDamage")) {
        self [[ namespace_3c37cb17ade254d::getsharedfunc("manual_turret", "monitorDamage") ]](self.maxhealth, "hitequip", &manualturret_handledeathdamage, &manualturret_modifydamage, 1);
    }
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d65
// Size: 0x150
function manualturret_handledeathdamage(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    idflags = data.idflags;
    config = level.sentrysettings[self.turrettype];
    var_3737240cefe2c793 = 0;
    if (namespace_3c37cb17ade254d::issharedfuncdefined("damage", "onKillstreakKilled")) {
        var_3737240cefe2c793 = [[ namespace_3c37cb17ade254d::getsharedfunc("damage", "onKillstreakKilled") ]](config.streakname, attacker, objweapon, type, damage, config.scorepopup, config.vodestroyed, config.destroyedsplash);
    }
    if (var_3737240cefe2c793) {
        attacker notify("destroyed_equipment");
    }
    explosivedamage = 0;
    if (type == "MOD_EXPLOSIVE" || type == "MOD_PROJECTILE" || type == "MOD_PROJECTILE_SPLASH" || type == "MOD_GRENADE_SPLASH") {
        explosivedamage = 1;
    }
    self notify("kill_turret", explosivedamage);
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ebc
// Size: 0xc6
function manualturret_modifydamage(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    idflags = data.idflags;
    modifieddamage = damage;
    if (issharedfuncdefined("killstreak", "getModifiedAntiKillstreakDamage")) {
        modifieddamage = self [[ getsharedfunc("killstreak", "getModifiedAntiKillstreakDamage") ]](attacker, objweapon, type, modifieddamage, self.maxhealth, 1, 1, 2, 7, 5);
    }
    return modifieddamage;
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f8a
// Size: 0x84
function manualturret_disableplayerdismantleonconnect(owner) {
    self endon("kill_turret");
    self endon("carried_turret");
    owner endon("disconnect");
    level endon("game_ended");
    while (1) {
        player = level waittill("connected");
        player waittill("spawned_player");
        if (level.teambased) {
            if (player.team != owner.team) {
                continue;
            }
        }
        self.dismantleobj disableplayeruse(player);
    }
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3015
// Size: 0x235
function manualturret_watchdeath(owner) {
    self endon("carried_turret");
    var_4fac8b8ce36e09f1 = var_b2797481a55c620 = self waittill("kill_turret");
    self.isshuttingdown = 1;
    if (isdefined(owner)) {
        owner.placedsentries[self.turrettype] = array_remove(owner.placedsentries[self.turrettype], self);
        owner manualturret_setinactive(self);
        manualturret_disableenemyoutlines(owner);
        if (issharedfuncdefined("player", "printGameAction")) {
            owner [[ getsharedfunc("player", "printGameAction") ]]("killstreak ended - manual_turret", owner);
        }
        self.streakinfo.expiredbydeath = istrue(var_4fac8b8ce36e09f1);
        owner namespace_9abe40d2af041eb2::recordkillstreakendstats(self.streakinfo);
    }
    if (isdefined(self.playerusingturret)) {
        self.playerusingturret manualturret_endplayeruse(self);
    }
    if (isdefined(self.useownerobj)) {
        self.useownerobj delete();
    }
    if (isdefined(self.useotherobj)) {
        self.useotherobj delete();
    }
    if (!istrue(var_b2797481a55c620)) {
        self playsound("sentry_explode_smoke");
        self setscriptablepartstate("shutdown", "on");
        namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(2);
        self setscriptablepartstate("explode", "regular");
    } else {
        self setscriptablepartstate("explode", "violent");
    }
    self playsound("mp_equip_destroyed");
    level callback::callback("killstreak_finish_use", {streakinfo:self.streakinfo});
    if (isdefined(self.killcament)) {
        self.killcament delete();
    }
    if (isdefined(self.colmodel)) {
        self.colmodel delete();
    }
    if (isdefined(self.minimapid)) {
        if (issharedfuncdefined("game", "returnObjectiveID")) {
            [[ getsharedfunc("game", "returnObjectiveID") ]](self.minimapid);
        }
        self.minimapid = undefined;
    }
    wait(0.2);
    self delete();
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3251
// Size: 0x23
function manualturret_watchdeathongameend() {
    self endon("kill_turret");
    self endon("carried_turret");
    level waittill("game_ended");
    self notify("kill_turret", 0);
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x327b
// Size: 0x1a
function manualturret_delayscriptabledelete() {
    level endon("game_ended");
    namespace_a05a5ef469174798::hostmigration_waitlongdurationwithpause(5);
    self delete();
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x329c
// Size: 0x137
function manualturret_watchtimeout(owner) {
    self endon("kill_turret");
    self endon("carried_turret");
    owner endon("disconnect");
    level endon("game_ended");
    var_38e63990bd3d9ed4 = self.timeout;
    if (!isdefined(self.timeelapsed)) {
        self.timeelapsed = 0;
    }
    while (self.timeelapsed < var_38e63990bd3d9ed4) {
        var_77b3f0514a25c019 = (var_38e63990bd3d9ed4 - self.timeelapsed) / var_38e63990bd3d9ed4;
        var_77b3f0514a25c019 = int(ceil(clamp(var_77b3f0514a25c019, 0, 1) * 100));
        if (isdefined(self.playerusingturret)) {
            self.playerusingturret setclientomnvar("ui_killstreak_countdown", int(var_77b3f0514a25c019));
        }
        self.timeelapsed = self.timeelapsed + level.framedurationseconds;
        if (self.timeelapsed >= var_38e63990bd3d9ed4 - 1.5 && !istrue(self.stopinteract)) {
            self.stopinteract = 1;
        }
        waitframe();
    }
    owner playkillstreakoperatordialog("manual_turret", "timeout_" + self.streakinfo.streakname, 1);
    self notify("kill_turret", 0);
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33da
// Size: 0x193
function manualturret_watchammotracker(user) {
    self endon("kill_turret");
    self endon("carried_turret");
    user endon("end_turret_use");
    user endon("disconnect");
    level endon("game_ended");
    config = level.sentrysettings[self.turrettype];
    var_83fb464c27e79a0e = weaponfiretime(config.weaponinfo);
    if (!isdefined(self.hideammoindex)) {
        self.hideammoindex = 1;
    }
    /#
        assertex(isdefined(var_83fb464c27e79a0e) && var_83fb464c27e79a0e > 0, "turretFireDelay is either not defined or less than 0, make sure your turret weapon has a valid fire time");
    #/
    while (user isusingturret()) {
        while (user attackbuttonpressed()) {
            self.streakinfo.shots_fired++;
            self.ammocount--;
            user setclientomnvar("ui_killstreak_weapon_1_ammo", self.ammocount);
            if (self.ammocount <= 12) {
                self setscriptablepartstate("hide_ammo_" + self.hideammoindex, "on", 0);
                self.hideammoindex++;
            }
            if (self.ammocount == 100) {
                user playkillstreakoperatordialog("manual_turret", self.streakinfo.streakname + "_low_ammo");
            } else if (self.ammocount <= 0) {
                user playkillstreakoperatordialog("manual_turret", self.streakinfo.streakname + "_no_ammo");
                self notify("kill_turret", 0);
                break;
            }
            wait(var_83fb464c27e79a0e);
        }
        waitframe();
    }
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3574
// Size: 0x47
function manualturret_watchdisown(owner) {
    self endon("kill_turret");
    self endon("carried_turret");
    owner thread manualturret_disownonaction(self, "disconnect");
    owner thread manualturret_disownonaction(self, "joined_team");
    owner thread manualturret_disownonaction(self, "joined_spectators");
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x35c2
// Size: 0x46
function manualturret_disownonaction(turret, action) {
    turret endon("kill_turret");
    self endon("carried_turret");
    self endon("disowned_turret");
    level endon("game_ended");
    self waittill(action);
    turret notify("kill_turret", 0);
    self notify("disowned_turret");
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x360f
// Size: 0x7b
function manualturret_setturretmodel(type) {
    turretmodel = undefined;
    if (type == "placed") {
        turretmodel = level.sentrysettings[self.turrettype].modelbaseground;
    } else {
        turretmodel = level.sentrysettings[self.turrettype].modeldestroyedground;
    }
    /#
        assertex(isdefined(turretmodel), "For some reason turretModel is not defined, this should never happen");
    #/
    self setmodel(turretmodel);
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3691
// Size: 0x56
function manualturret_makealltriggersusable(bool) {
    if (!istrue(bool)) {
        self.useownerobj function_dfb78b3e724ad620(0);
        self.useotherobj function_dfb78b3e724ad620(0);
    } else {
        self.useownerobj function_dfb78b3e724ad620(1);
        self.useotherobj function_dfb78b3e724ad620(1);
    }
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36ee
// Size: 0x94
function manualturret_toggleallowplacementactions(bool) {
    if (namespace_f8065cafc523dba5::_isalive()) {
        if (!bool) {
            val::set("manual_turret_placement", "sprint", 0);
            val::set("manual_turret_placement", "weapon_switch", 0);
            val::set("manual_turret_placement", "offhand_weapons", 0);
            val::set("manual_turret_placement", "melee", 0);
            val::set("manual_turret_placement", "execution_attack", 0);
            val::set("manual_turret_placement", "ladder_placement", 0);
        } else {
            val::function_c9d0b43701bdba00("manual_turret_placement");
        }
    }
}

// Namespace manual_turret/namespace_ac45d22648d4adff
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3789
// Size: 0x70
function manualturret_toggleallowuseactions(bool) {
    if (namespace_f8065cafc523dba5::_isalive()) {
        if (!bool) {
            val::set("manual_turret_use", "offhand_weapons", 0);
            val::set("manual_turret_use", "melee", 0);
            val::set("manual_turret_use", "supers", 0);
            val::set("manual_turret_use", "allow_movement", 0);
        } else {
            val::function_c9d0b43701bdba00("manual_turret_use");
        }
    }
}

