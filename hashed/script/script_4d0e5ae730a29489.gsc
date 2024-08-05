#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\callbacks.gsc;
#using script_439fa02b5251fa5b;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\shellshock_utility.gsc;
#using scripts\cp_mp\utility\inventory_utility.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using script_608c50392df8c7d1;
#using script_3db04fd1b466bdba;
#using script_16ea1b94f0f381b3;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;
#using scripts\cp_mp\killstreaks\manual_turret.gsc;
#using script_736dec95a49487a6;
#using scripts\cp_mp\hostmigration.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\engine\trace.gsc;

#namespace missile_turret;

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 0, eflags: 0x1
// Checksum 0x0, Offset: 0xb07
// Size: 0x18
function autoexec main() {
    function_df7ab5b0f898e8bc(function_1823ff50bb28148d("missile_turret"), &init);
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0xb27
// Size: 0xd6
function private init() {
    if (issharedfuncdefined("killstreak", "registerKillstreak")) {
        [[ getsharedfunc("killstreak", "registerKillstreak") ]]("missile_turret", &function_7b0acdb995efbcd0);
    }
    bundle = level.streakglobals.streakbundles["missile_turret"];
    if (isdefined(bundle) && isdefined(bundle.var_661e446067d68053) && issharedfuncdefined("killstreak", "registerKillstreak")) {
        [[ getsharedfunc("killstreak", "registerKillstreakDamageDealingWeapon") ]]("missile_turret", bundle.var_661e446067d68053, #"large");
    }
    scripts\engine\utility::registersharedfunc("missile_turret", "missile_turret_Hack", &missileturret_hack);
    function_f93272c662d381d2();
    function_a0a5114bb65fcecd();
    function_f42f083e1874b55a();
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc05
// Size: 0x36
function function_f93272c662d381d2() {
    /#
        setdevdvarifuninitialized(@"hash_c9bd691ce96079ac", 0);
        setdevdvarifuninitialized(@"hash_8339cedf7d2c80b9", 0);
        setdvarifuninitialized(@"hash_a42516bfaeb6df0f", 10);
    #/
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xc43
// Size: 0x28
function function_b750543c3bf3d80f(streakinfo, switchresult, weaponobj) {
    if (!istrue(switchresult)) {
        scripts\cp_mp\killstreaks\killstreakdeploy::getridofkillstreakdeployweapon(weaponobj);
    }
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc73
// Size: 0x25
function function_463f566c8cfddea5(streakname) {
    streakinfo = createstreakinfo(streakname, self);
    return function_7b0acdb995efbcd0(streakinfo);
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xca1
// Size: 0x62e
function function_7b0acdb995efbcd0(streakinfo) {
    level endon("game_ended");
    self endon("disconnect");
    bundle = level.streakglobals.streakbundles["missile_turret"];
    var_85815f97c619c58d = default_to(bundle.var_85815f97c619c58d, 5);
    level.var_2d077aafa2380de7++;
    if (islargemap()) {
        var_85815f97c619c58d = default_to(bundle.var_72680e06cb64591c, 8);
    }
    if (level.missileturrets.size >= var_85815f97c619c58d || level.missileturrets.size + level.var_2d077aafa2380de7 > var_85815f97c619c58d) {
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            self [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/TOO_MANY_MISSILE_TURRETS");
        }
        level.var_2d077aafa2380de7--;
        streakinfo notify("killstreak_finished_with_deploy_weapon");
        return false;
    }
    if (level.teambased) {
        var_c3f98d4efe0c03f6 = default_to(bundle.var_c3f98d4efe0c03f6, 2);
        if (islargemap()) {
            var_c3f98d4efe0c03f6 = default_to(bundle.var_e062971842dc231, 4);
        }
        level.incomingmissileturrets[self.team]++;
        if (getnumactivekillstreakperteam(self.team, level.missileturrets) + level.incomingmissileturrets[self.team] > var_c3f98d4efe0c03f6) {
            level.var_2d077aafa2380de7--;
            level.incomingmissileturrets[self.team]--;
            if (issharedfuncdefined("hud", "showErrorMessage")) {
                self [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/TOO_MANY_MISSILE_TURRETS");
            }
            streakinfo notify("killstreak_finished_with_deploy_weapon");
            return false;
        }
    }
    var_86c9d6faba954226 = default_to(bundle.var_86c9d6faba954226, 1);
    if (!isdefined(self.var_9c4245f683e3e800)) {
        self.var_9c4245f683e3e800 = 0;
    }
    self.var_9c4245f683e3e800++;
    thread function_d9c942a7e9df8c38();
    if (self.var_9c4245f683e3e800 > var_86c9d6faba954226) {
        self.var_9c4245f683e3e800--;
        level.var_2d077aafa2380de7--;
        if (level.teambased) {
            level.incomingmissileturrets[self.team]--;
        }
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            self [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/TOO_MANY_MISSILE_TURRETS_PLAYER");
        }
        streakinfo notify("killstreak_finished_with_deploy_weapon");
        return false;
    }
    if (isdefined(level.killstreaktriggeredfunc)) {
        if (!level [[ level.killstreaktriggeredfunc ]](streakinfo)) {
            self.var_35cb2404e29573ce = 0;
            self.var_9c4245f683e3e800--;
            level.var_2d077aafa2380de7--;
            if (level.teambased) {
                level.incomingmissileturrets[self.team]--;
            }
            return false;
        }
    }
    scripts\cp_mp\utility\weapon_utility::saveweaponstates();
    endonnotify = "sentry_placement_failed";
    if (issharedfuncdefined("weapons", "watchForPlacementFireState")) {
        self thread [[ getsharedfunc("weapons", "watchForPlacementFireState") ]](streakinfo, endonnotify);
    }
    bundle = level.streakglobals.streakbundles["missile_turret"];
    deployresult = scripts\cp_mp\killstreaks\killstreakdeploy::streakdeploy_doweaponswitchdeploy(streakinfo, makeweapon(bundle.deployweapon), 1, undefined, undefined, &function_b750543c3bf3d80f);
    if (!istrue(deployresult)) {
        self notify(endonnotify);
        self.var_35cb2404e29573ce = 0;
        self.var_9c4245f683e3e800--;
        level.var_2d077aafa2380de7--;
        if (level.teambased) {
            level.incomingmissileturrets[self.team]--;
        }
        return false;
    }
    if (isdefined(level.killstreakbeginusefunc)) {
        if (!level [[ level.killstreakbeginusefunc ]](streakinfo)) {
            self.var_35cb2404e29573ce = 0;
            self.var_9c4245f683e3e800--;
            level.var_2d077aafa2380de7--;
            if (level.teambased) {
                level.incomingmissileturrets[self.team]--;
            }
            return false;
        }
    }
    scripts\cp_mp\killstreaks\manual_turret::manualturret_toggleallowplacementactions(0);
    turret = function_993008ef9f603aa6("missile_turret", streakinfo);
    if (!isdefined(turret)) {
        scripts\cp_mp\killstreaks\manual_turret::manualturret_toggleallowplacementactions(1);
        self.var_35cb2404e29573ce = 0;
        self.var_9c4245f683e3e800--;
        level.var_2d077aafa2380de7--;
        if (level.teambased) {
            level.incomingmissileturrets[self.team]--;
        }
        return false;
    }
    turret function_6e48da87d4a6706(bundle);
    marker = function_159a8e5fa750161c(turret, streakinfo, 0, 1.25);
    if (!isdefined(marker)) {
        scripts\cp_mp\killstreaks\manual_turret::manualturret_toggleallowplacementactions(1);
        turret delete();
        self.var_35cb2404e29573ce = 0;
        self.var_9c4245f683e3e800--;
        level.var_2d077aafa2380de7--;
        if (level.teambased) {
            level.incomingmissileturrets[self.team]--;
        }
        return false;
    }
    turret function_641996b5e113c5c6(turret, &function_eb7530e3d6daf2d, &function_bfdcec13005413a5, &function_4d4513e6afb21e9c);
    if (issharedfuncdefined("emp", "setEMP_Started_Callback")) {
        turret [[ getsharedfunc("emp", "setEMP_Started_Callback") ]](&function_bfdcec13005413a5);
    }
    if (issharedfuncdefined("emp", "setEMP_Applied_Callback")) {
        turret [[ getsharedfunc("emp", "setEMP_Applied_Callback") ]](&function_eb7530e3d6daf2d);
    }
    if (issharedfuncdefined("emp", "setEMP_Cleared_Callback")) {
        turret [[ getsharedfunc("emp", "setEMP_Cleared_Callback") ]](&function_97f5e7cad79b5ad2);
    }
    turret namespace_b6b4a3ac458ab6e2::function_172d848d58051fdf(&function_1a2bbdf7944594d6);
    turret namespace_b6b4a3ac458ab6e2::function_aa823a31304ed981(&function_9b7dfb6fd0cb0bb7);
    scripts\cp_mp\killstreaks\manual_turret::manualturret_toggleallowplacementactions(1);
    function_56d5f8c1988c64eb(turret, marker);
    if (issharedfuncdefined("missile_turret", "munitionUsed")) {
        self [[ getsharedfunc("missile_turret", "munitionUsed") ]]();
    }
    self notify("munitions_used", "missile_turret");
    level.var_2d077aafa2380de7--;
    if (level.teambased) {
        level.incomingmissileturrets[self.team]--;
    }
    return true;
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x12d8
// Size: 0x9d
function function_6e48da87d4a6706(bundle) {
    var_2eca6d053cb3e049 = istrue(bundle.var_fa645b2a1b308dac);
    if (var_2eca6d053cb3e049) {
        self.shootingpositions = [1, 2, 3, 4, 5, 6, 7, 8];
        return;
    }
    self.shootingpositions = [1, 5, 2, 6, 3, 7, 4, 8];
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x137d
// Size: 0x12f
function function_159a8e5fa750161c(turret, streakinfo, ignorecancel, var_290b1442271ab369) {
    self.var_35cb2404e29573ce = 1;
    turret laseroff();
    thread function_3133daa58b56fb69(var_290b1442271ab369);
    marker = undefined;
    if (issharedfuncdefined("missile_turret", "watchForPlayerEnteringLastStand")) {
        self thread [[ getsharedfunc("missile_turret", "watchForPlayerEnteringLastStand") ]]();
    }
    marker = function_98c72b3604b1124d(streakinfo, ignorecancel);
    self notify("turret_placement_finished");
    bundle = level.streakglobals.streakbundles["missile_turret"];
    if (!isdefined(marker) || !isdefined(marker.location)) {
        if (scripts\cp_mp\utility\player_utility::_isalive()) {
            function_8608f39517786dab(bundle.deployweapon);
        }
        return undefined;
    }
    turret thread scripts\cp_mp\killstreaks\manual_turret::manualturret_disablefire(self, 1, 1);
    if (self hasweapon(bundle.deployweapon)) {
        thread function_8608f39517786dab(bundle.deployweapon, 1, 1);
    }
    delayspawntime = 0.85;
    scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause(delayspawntime);
    return marker;
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14b5
// Size: 0x50
function function_3133daa58b56fb69(delaytime) {
    self endon("death_or_disconnect");
    self endon("turret_placement_finished");
    level endon("game_ended");
    scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause(delaytime);
    self setclientomnvar("ui_turret_placement", 1);
    thread scripts\cp_mp\killstreaks\manual_turret::manualturret_clearplacementinstructions("death");
    thread scripts\cp_mp\killstreaks\manual_turret::manualturret_clearplacementinstructions("turret_placement_finished");
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x150d
// Size: 0x454
function function_993008ef9f603aa6(turrettype, streakinfo) {
    config = level.missilesettings[turrettype];
    verticalspawnoffset = getdvarint(@"hash_a42516bfaeb6df0f");
    turret = spawnturret("misc_turret", self.origin + (0, 0, verticalspawnoffset), level.missilesettings[turrettype].weaponinfo);
    turret.owner = self;
    turret.team = self.team;
    /#
        forceenemyteam = getdvarint(@"hash_8339cedf7d2c80b9", 0);
        if (forceenemyteam) {
            turret.team = ter_op(self.team == "<dev string:x1c>", "<dev string:x23>", "<dev string:x1c>");
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
    turret.var_8f7ba18bc776be33 = config.nummissiles;
    turret.var_e9da564de0d3ae0a = config.nummissiles;
    turret.var_54085e2c71f12344 = config.var_54085e2c71f12344;
    turret.var_ab491918db8f34a = 0;
    /#
        var_2a98d1683cf44153 = getdvarint(@"hash_2c01d701bac5d9d3", 0);
        if (var_2a98d1683cf44153) {
            turret.timeout = 9999;
        }
    #/
    turret.carriedby = self;
    turret function_70c8684c2c29bf59("placed");
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
    case #"hash_b571a6187bf67f9e":
    default: 
        turret maketurretinoperable();
        turret setleftarc(180);
        turret setrightarc(180);
        turret setbottomarc(50);
        turret settoparc(120);
        turret setconvergencetime(0.2, "pitch");
        turret setconvergencetime(0.2, "yaw");
        turret setconvergenceheightpercent(0.65);
        turret setdefaultdroppitch(-89);
        break;
    }
    turret setturretmodechangewait(1);
    turret scripts\cp_mp\emp_debuff::allow_emp(0);
    killcamforward = anglestoforward(turret.angles);
    killcampos = turret gettagorigin("tag_laser") + (0, 0, 10);
    killcampos -= killcamforward * 20;
    killcament = spawn("script_model", killcampos);
    killcament linkto(turret);
    turret.killcament = killcament;
    turret.colmodel = spawn("script_model", turret.origin);
    turret.colmodel.team = turret.team;
    turret.colmodel.owner = turret.owner;
    turret.colmodel setmodel("vm_jup_2h_sam_turret_00_ivisi_base");
    turret.colmodel dontinterpolate();
    turret.colmodel hide();
    thread function_e9e318bcbce1eff0(turret);
    return turret;
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x196a
// Size: 0x24
function function_e9e318bcbce1eff0(turret) {
    turret endon("turret_place_successful");
    self waittill("weapon_change");
    self.var_9c4245f683e3e800--;
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1996
// Size: 0x1b
function function_d9c942a7e9df8c38() {
    self endon("weapon_change");
    self waittill("death_or_disconnect");
    self.var_9c4245f683e3e800--;
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x19b9
// Size: 0x683
function function_56d5f8c1988c64eb(turret, marker) {
    bundle = level.streakglobals.streakbundles["missile_turret"];
    config = level.missilesettings[turret.turrettype];
    level.missileturrets[level.missileturrets.size] = turret;
    turret function_70c8684c2c29bf59("placed");
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
        if (issharedfuncdefined("hud", "teamPlayerCardSplash") && isdefined(splashname)) {
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
    self.var_35cb2404e29573ce = 0;
    turret.origin = marker.location;
    turret setscriptablepartstate("turret_carry_state", "turret_plant");
    turret.colmodel show();
    turret.colmodel.angles = turret.angles;
    turret.colmodel.origin = turret.origin;
    turret.colmodel linkto(turret, "tag_aim_pivot");
    turreticon = bundle.minimapicon;
    if (issharedfuncdefined("game", "createObjective")) {
        turret.minimapid = turret.colmodel [[ getsharedfunc("game", "createObjective") ]](turreticon, turret.team, undefined, 1, 1);
    }
    turretcount = self.placedsentries[turret.turrettype].size;
    self.placedsentries[turret.turrettype][turretcount] = turret;
    if (turretcount + 1 > 2) {
        self.placedsentries[turret.turrettype][0] notify("kill_turret", 0, 0);
    }
    headiconoffset = 70;
    if (isdefined(level.missilesettings[turret.turrettype].modelbasecover)) {
        if (turret.model == level.missilesettings[turret.turrettype].modelbasecover) {
            headiconoffset = 35;
        }
    }
    if (issharedfuncdefined("killstreak", "addToActiveKillstreakList")) {
        turret [[ getsharedfunc("killstreak", "addToActiveKillstreakList") ]](turret.turrettype, "Killstreak_Ground", self, 0, 1, headiconoffset, "carried");
    }
    turret setmode(level.missilesettings[turret.turrettype].sentrymodeon);
    hinttag = "bi_base";
    var_803338ee7c91a3e6 = anglestoup(turret gettagangles(hinttag)) * 20;
    hintpos = turret gettagorigin(hinttag) + var_803338ee7c91a3e6;
    if (!isdefined(turret.useownerobj)) {
        turret.useownerobj = function_f43b6a78213dbae8(hintpos, "HINT_BUTTON", undefined, config.ownerusehintstring, undefined, undefined, "show");
    } else {
        turret.useownerobj function_dfb78b3e724ad620(1);
        turret.useownerobj dontinterpolate();
        turret.useownerobj.origin = hintpos;
    }
    turret.useownerobj linkto(turret, hinttag);
    foreach (guy in level.players) {
        if (guy != turret.owner) {
            turret.useownerobj disableplayeruse(guy);
        }
    }
    if (issharedfuncdefined("killstreak", "handleMovingPlatform")) {
        [[ getsharedfunc("killstreak", "handleMovingPlatform") ]](turret);
    }
    turret scripts\cp_mp\emp_debuff::allow_emp(1);
    if (issharedfuncdefined("game", "registerSentient")) {
        turret [[ getsharedfunc("game", "registerSentient") ]]("Killstreak_Static", self);
    }
    turret function_e0abe4175b72981c(turret);
    turret thread function_973e8bbeddc12392(undefined, self);
    /#
        turret thread function_9ca3664d52343397();
    #/
    turret thread function_c27484ca7994b7d0();
    thread function_755aebb2552f8720(turret, marker);
    thread function_d02d69714fbaffc1(turret);
    thread function_389ebc5025c28934(turret);
    thread function_14aa40ae092fe7b1(turret);
    thread function_7f22f5f0ae012bd4(turret);
    thread function_35a05b3758e712cd(turret);
    thread function_abae0285afe8aa60(turret);
    turret notify("turret_place_successful");
    thread function_a3afddcd4aa1ebf8(turret);
    if (issharedfuncdefined(#"hash_d8976e21a6adafba", #"hash_ca0042e3cac99672")) {
        turret [[ getsharedfunc(#"hash_d8976e21a6adafba", #"hash_ca0042e3cac99672") ]](turret, &function_e0abe4175b72981c, &function_e0abe4175b72981c);
    }
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2044
// Size: 0x52c
function function_a3afddcd4aa1ebf8(turret) {
    turret endon("kill_turret");
    turret endon("carried");
    level endon("game_ended");
    bundle = level.streakglobals.streakbundles["missile_turret"];
    vehicletargetscategory = [];
    if (!isdefined(bundle) || !istrue(bundle.var_ef14fc78cac39a77)) {
        vehicletargetscategory = ["chopper_gunner", "counter_uav", "scrambler_drone_guard", "uav", "directional_uav", "valkyrie_rocket", "switchblade_drone", "loitering_munition", "hover_jet", "gunship", "airdrop_escort"];
    } else {
        foreach (vehicleentry in bundle.vehicleentries) {
            if (isdefined(vehicleentry.name)) {
                vehicletargetscategory[vehicletargetscategory.size] = vehicleentry.name;
            }
        }
    }
    while (true) {
        wait 1;
        if (istrue(turret.isdisabled)) {
            turret cleartargetentity();
            turret.targetentityref = undefined;
            continue;
        }
        targetent = turret gettargetentity();
        if (!isdefined(targetent)) {
            entitiesfound = [];
            var_6d3e2e28d8d8c23f = [];
            targetcategory = undefined;
            if (isdefined(level.activekillstreaks)) {
                foreach (ent in level.activekillstreaks) {
                    var_7dde76cb29a121b7 = isdefined(ent.team) && ent.team != turret.team;
                    if (!var_7dde76cb29a121b7) {
                        continue;
                    }
                    isvalidtarget = 0;
                    foreach (category in vehicletargetscategory) {
                        if (isdefined(ent.streakname) && ent.streakname == category || isdefined(ent.vehiclename) && ent.vehiclename == category) {
                            isvalidtarget = 1;
                            targetcategory = category;
                            break;
                        }
                    }
                    if (var_7dde76cb29a121b7 && isvalidtarget) {
                        var_6d3e2e28d8d8c23f[var_6d3e2e28d8d8c23f.size] = ent;
                    }
                }
            }
            if (isdefined(level.vehicle.instances)) {
                foreach (category in vehicletargetscategory) {
                    if (isdefined(level.vehicle.instances[category])) {
                        foreach (vehicle in level.vehicle.instances[category]) {
                            if (isdefined(vehicle.ownerteam) && isenemyteam(vehicle.ownerteam, turret.team)) {
                                var_6d3e2e28d8d8c23f[var_6d3e2e28d8d8c23f.size] = vehicle;
                                targetcategory = category;
                                continue;
                            }
                            if (vehicle.team != "neutral" && isenemyteam(vehicle.team, turret.team)) {
                                var_6d3e2e28d8d8c23f[var_6d3e2e28d8d8c23f.size] = vehicle;
                                targetcategory = category;
                            }
                        }
                    }
                }
            }
            targetent = undefined;
            foreach (ent in var_6d3e2e28d8d8c23f) {
                if (isdefined(ent) && function_3bed722fed1cd528(turret, ent)) {
                    targetent = ent;
                    break;
                }
                waitframe();
            }
            if (isdefined(targetent)) {
                turret setmode(level.missilesettings[turret.turrettype].sentrymodeon);
                wait 0.5;
                turret settargetentity(targetent);
                turret.var_ab491918db8f34a = 1;
                turret.var_5e4c393ce44a423e = targetent.health;
                turret.var_8438670ee6829534 = targetent.maxhealth;
                turret.var_b5df436f25658cbc = function_163e8e495678ee10(targetcategory);
                turret.var_5da08662e2b1cff6 = turret.var_b5df436f25658cbc;
            }
            turret.targetentityref = targetent;
        }
    }
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2578
// Size: 0x1b2
function function_163e8e495678ee10(targetcategory) {
    bundle = level.streakglobals.streakbundles["missile_turret"];
    nummissiles = 0;
    if (!isdefined(bundle) || !istrue(bundle.var_ef14fc78cac39a77)) {
        switch (targetcategory) {
        case #"hash_349713b5ad494dda": 
            nummissiles = 3;
            break;
        case #"hash_10e585c25e7e9f60":
        case #"hash_27002778019fb447": 
            nummissiles = 1;
            break;
        case #"hash_634b246c3da5c56f": 
            nummissiles = 1;
            break;
        case #"hash_e171e5b86ef0a4cc": 
            nummissiles = 1;
            break;
        case #"hash_1fd582647e25c2c1": 
            nummissiles = 1;
            break;
        case #"hash_7a687f6a4d685110": 
            nummissiles = 1;
            break;
        case #"hash_a1031216158c7882": 
            nummissiles = 3;
            break;
        case #"hash_bf2f9adbd2b41d5": 
            nummissiles = 3;
            break;
        case #"hash_413c38e72fe8b5bf": 
            nummissiles = 3;
            break;
        case #"hash_887ad77192b9c4fb": 
            nummissiles = 3;
            break;
        }
    } else {
        foreach (vehicleentry in bundle.vehicleentries) {
            if (isdefined(vehicleentry.name) && isdefined(vehicleentry.nummissiles)) {
                if (vehicleentry.name == targetcategory) {
                    nummissiles = vehicleentry.nummissiles;
                    break;
                }
            }
        }
    }
    return nummissiles;
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2733
// Size: 0x1af
function function_3bed722fed1cd528(turret, ent) {
    bundle = level.streakglobals.streakbundles["missile_turret"];
    contentoverride = scripts\engine\trace::create_contents(0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    flashid = (turret.var_e9da564de0d3ae0a - turret.var_8f7ba18bc776be33) % bundle.var_b870b20baede47ae;
    muzzletag = "tag_fx_0" + turret.shootingpositions[flashid];
    var_d2007693a45b2567 = turret gettagorigin(muzzletag);
    radius = 16;
    height = 64;
    heightvector = (0, 0, height);
    getsurfacetype = 0;
    trace = scripts\engine\trace::capsule_trace(var_d2007693a45b2567, ent.origin, radius, height, (0, 0, 0), [], contentoverride, getsurfacetype);
    /#
        if (getdvarint(@"hash_c9bd691ce96079ac", 0) == 1) {
            var_34fb5f21bc6e423d = var_d2007693a45b2567;
            var_3292b1174fe87384 = ent.origin;
            var_bc8dc8693bdfd6f5 = var_34fb5f21bc6e423d + heightvector;
            var_db689ed52d5f374c = var_3292b1174fe87384 + heightvector;
            function_6269f6a8c1c151dc(var_34fb5f21bc6e423d, var_3292b1174fe87384, radius);
            function_6269f6a8c1c151dc(var_bc8dc8693bdfd6f5, var_db689ed52d5f374c, radius);
        }
    #/
    result = 0;
    if (trace["hittype"] != "hittype_world") {
        result = 1;
    }
    return result;
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x28eb
// Size: 0x302
function function_74ce833622f356f8(turret, player) {
    var_b8bcdc58b18df00d = 0;
    if (isdefined(turret) && isdefined(turret.targetentityref) && isdefined(turret.canshootmissile) && istrue(turret.canshootmissile)) {
        distancetotarget = distance(turret.origin, turret.targetentityref.origin);
        if (distancetotarget <= level.missilesettings[turret.turrettype].attackrange) {
            bundle = level.streakglobals.streakbundles["missile_turret"];
            flashid = (turret.var_e9da564de0d3ae0a - turret.var_8f7ba18bc776be33) % bundle.var_b870b20baede47ae;
            muzzletag = "tag_fx_0" + turret.shootingpositions[flashid];
            var_d2007693a45b2567 = turret gettagorigin(muzzletag);
            missilestart = var_d2007693a45b2567;
            missileend = turret.targetentityref.origin;
            missileweapon = "chopper_gunner_proj_mp";
            if (isdefined(bundle) && isdefined(bundle.var_dbfc786f395886e7)) {
                missileweapon = bundle.var_dbfc786f395886e7;
            }
            missile = _magicbullet(makeweapon(missileweapon), missilestart, missileend, player, turret.targetentityref);
            offsetlocal = (0, 0, 0);
            targettag = turret.targetentityref.var_e54550e04b65ef78;
            targettag = ter_op(!isdefined(targettag), "tag_deathfx", targettag);
            tagvalue = undefined;
            hastag = turret.targetentityref tagexists(targettag);
            if (hastag) {
                tagvalue = turret.targetentityref gettagorigin(targettag);
            }
            if (isdefined(tagvalue)) {
                offsetwc = tagvalue - turret.targetentityref.origin;
                offsetlocal = rotatevectorinverted(offsetwc, turret.targetentityref.angles);
            }
            missile missile_settargetent(turret.targetentityref, offsetlocal);
            turret.var_ab491918db8f34a = 0;
            turret.var_8f7ba18bc776be33--;
            turret.var_5da08662e2b1cff6--;
            level notify("stinger_fired", player, missile, turret.targetentityref);
            var_b8bcdc58b18df00d = 1;
            turret setscriptablepartstate("turret_firing_state", "turret_firing");
            wait 0.05;
            turret setscriptablepartstate("turret_firing_state", "off");
        }
    }
    return var_b8bcdc58b18df00d;
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2bf6
// Size: 0x3b2
function function_ad3bcd8ec77ba7a0(turret) {
    turret endon("kill_turret");
    self endon("death_or_disconnect");
    level endon("game_ended");
    if (issharedfuncdefined(#"hash_d8976e21a6adafba", #"hash_c33ceb91d0ca7a9d")) {
        turret [[ getsharedfunc(#"hash_d8976e21a6adafba", #"hash_c33ceb91d0ca7a9d") ]](turret);
    }
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
    turret scripts\cp_mp\emp_debuff::allow_emp(0);
    if (issharedfuncdefined("game", "unregisterSentient")) {
        turret [[ getsharedfunc("game", "unregisterSentient") ]](turret.sentientpool, turret.sentientpoolindex);
    }
    linkedchildren = turret getlinkedchildren();
    foreach (child in linkedchildren) {
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
    function_2239198274531067(turret);
    turret hide();
    turret.carriedby = self;
    turret notify("carried");
    turret playsound("kls_sam_turret_pickup");
    scripts\cp_mp\utility\weapon_utility::saveweaponstates();
    endonnotify = "sentry_placement_failed";
    if (issharedfuncdefined("weapons", "watchForPlacementFireState")) {
        self thread [[ getsharedfunc("weapons", "watchForPlacementFireState") ]](turret.streakinfo, endonnotify);
    }
    bundle = level.streakglobals.streakbundles["missile_turret"];
    switchresult = scripts\cp_mp\killstreaks\killstreakdeploy::streakdeploy_doweaponswitchdeploy(turret.streakinfo, makeweapon(bundle.deployweapon), 1, undefined, undefined, &function_b750543c3bf3d80f);
    if (!istrue(switchresult)) {
        self notify(endonnotify);
        level.missileturrets = array_remove(level.missileturrets, turret);
        self.var_9c4245f683e3e800--;
        turret delete();
        self.var_35cb2404e29573ce = 0;
        function_f3bb4f4911a1beb2("killstreak", "refundKillstreak", "missile_turret", 1, 0, 0, 1);
        return 0;
    }
    scripts\cp_mp\killstreaks\manual_turret::manualturret_toggleallowplacementactions(0);
    marker = function_159a8e5fa750161c(turret, turret.streakinfo, 1, 2);
    if (!isdefined(marker)) {
        scripts\cp_mp\killstreaks\manual_turret::manualturret_toggleallowplacementactions(1);
        level.missileturrets = array_remove(level.missileturrets, turret);
        self.var_9c4245f683e3e800--;
        turret delete();
        self.var_35cb2404e29573ce = 0;
        function_f3bb4f4911a1beb2("killstreak", "refundKillstreak", "missile_turret", 1, 0, 0, 1);
        return 0;
    }
    scripts\cp_mp\killstreaks\manual_turret::manualturret_toggleallowplacementactions(1);
    function_56d5f8c1988c64eb(turret, marker);
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2fb0
// Size: 0x69
function function_6b113bca399df0c9(immediateswitch) {
    if (istrue(immediateswitch)) {
        _switchtoweaponimmediate(self.lastdroppableweaponobj);
    } else {
        _switchtoweapon(self.lastdroppableweaponobj);
    }
    bundle = level.streakglobals.streakbundles["missile_turret"];
    _takeweapon(bundle.deployweapon);
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3021
// Size: 0x5d
function function_2239198274531067(turret) {
    turret setdefaultdroppitch(30);
    turret setmode(level.missilesettings[turret.turrettype].sentrymodeoff);
    turret.useownerobj function_dfb78b3e724ad620(0);
    turret.useownerobj unlink();
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3086
// Size: 0x47
function function_755aebb2552f8720(turret, marker) {
    turret endon("kill_turret");
    level endon("game_ended");
    wait 0.25;
    if (isdefined(marker.visual)) {
        marker.visual delete();
    }
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x30d5
// Size: 0x57
function function_c118279c97ae457f(turret, useobj) {
    if (isdefined(turret)) {
        turret endon("kill_turret");
        turret endon("carried");
    }
    self endon("disconnect");
    level endon("game_ended");
    while (true) {
        player = level waittill("connected");
        useobj disableplayeruse(player);
    }
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3134
// Size: 0x11a
function function_d02d69714fbaffc1(turret) {
    turret endon("kill_turret");
    turret endon("carried");
    turret endon("missile_turret_hacked");
    self endon("disconnect");
    level endon("game_ended");
    while (true) {
        player = turret.useownerobj waittill("trigger");
        if (player != self) {
            continue;
        }
        if (!player function_aabcea95d6584154()) {
            continue;
        }
        if (istrue(player.isjuggernaut)) {
            if (issharedfuncdefined("hud", "showErrorMessage")) {
                player [[ getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/JUGG_CANNOT_BE_PICKED_UP");
            }
            continue;
        }
        turret.useownerobj function_dfb78b3e724ad620(0);
        turret setmode(level.missilesettings[turret.turrettype].sentrymodeoff);
        self.placedsentries[turret.turrettype] = array_remove(self.placedsentries[turret.turrettype], turret);
        thread function_ad3bcd8ec77ba7a0(turret);
    }
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3256
// Size: 0x5c
function function_cd59a28cbd743b74(turret) {
    turret endon("kill_turret");
    turret endon("carried");
    self endon("disconnect");
    level endon("game_ended");
    while (true) {
        player = level waittill("connected");
        player waittill("spawned_player");
        turret.useownerobj disableplayeruse(player);
    }
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x32ba
// Size: 0xd6
function function_919c2cb7cf831eb8(turret) {
    turret endon("kill_turret");
    turret endon("carried");
    self endon("disconnect");
    level endon("game_ended");
    foreach (player in level.players) {
        if (level.teambased) {
            if (player.team != self.team) {
                continue;
            }
            continue;
        }
        if (player != self) {
        }
    }
    thread function_b78b342431eef863(turret);
    while (true) {
        player = turret.dismantleobj waittill("trigger");
        turret notify("kill_turret", 0, 1);
        break;
    }
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3398
// Size: 0x2f
function function_389ebc5025c28934(turret) {
    turret endon("kill_turret");
    turret endon("carried");
    self endon("disconnect");
    level endon("game_ended");
    function_3073d3141c30bbe5(turret);
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x33cf
// Size: 0x71
function function_b78b342431eef863(turret) {
    turret endon("kill_turret");
    turret endon("carried");
    self endon("disconnect");
    level endon("game_ended");
    while (true) {
        player = level waittill("connected");
        player waittill("spawned_player");
        if (level.teambased) {
            if (player.team != self.team) {
                continue;
            }
        }
    }
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x3448
// Size: 0x39
function private function_eb7530e3d6daf2d(data) {
    if (scripts\cp_mp\emp_debuff::emp_debuff_get_emp_count() >= 2) {
        turret = data.victim;
        turret notify("kill_turret", 1, 1);
    }
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3489
// Size: 0x72
function function_bfdcec13005413a5(data) {
    if (isdefined(data.attacker)) {
        data.attacker thread function_f3bb4f4911a1beb2("player", "doScoreEvent", #"emp_disable");
    }
    self turretfiredisable();
    self setmode(level.missilesettings[self.turrettype].sentrymodeoff);
    self laseroff();
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3503
// Size: 0x18
function function_4d4513e6afb21e9c(isdeath) {
    if (isdeath) {
        return;
    }
    function_e0abe4175b72981c(self);
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3523
// Size: 0x36
function function_97f5e7cad79b5ad2(data) {
    self turretfireenable();
    self setmode(level.missilesettings[self.turrettype].sentrymodeon);
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3561
// Size: 0xb0
function function_e0abe4175b72981c(turret) {
    turret.isdisabled = turret scripts\cp_mp\emp_debuff::is_empd() || istrue(turret.isjammed) || istrue(turret.ishaywire);
    if (turret.isdisabled) {
        turret turretfiredisable();
        turret setmode(level.missilesettings[turret.turrettype].sentrymodeoff);
        turret laseroff();
        return;
    }
    turret turretfireenable();
    turret setmode(level.missilesettings[turret.turrettype].sentrymodeon);
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3619
// Size: 0x69
function function_1a2bbdf7944594d6(data) {
    attacker = data.attacker;
    if (!isdefined(self.ishaywire) || !istrue(self.ishaywire)) {
        if (istrue(scripts\cp_mp\utility\player_utility::playersareenemies(self.owner, attacker))) {
            self.ishaywire = 1;
            if (isdefined(attacker)) {
            }
            function_e0abe4175b72981c(self);
        }
    }
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x368a
// Size: 0x1d
function function_9b7dfb6fd0cb0bb7(data) {
    self.ishaywire = 0;
    function_e0abe4175b72981c(self);
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x36af
// Size: 0x3ab
function missileturret_hack(newowner, oldowner) {
    if (isdefined(newowner)) {
        self notify("missile_turret_hacked");
        self setturretowner(newowner);
        self setturretteam(newowner.team);
        self.owner = newowner;
        self.team = newowner.team;
        bundle = level.streakglobals.streakbundles["missile_turret"];
        if (isdefined(oldowner)) {
            oldowner.placedsentries[self.turrettype] = array_remove(oldowner.placedsentries[self.turrettype], self);
        }
        if (!isdefined(newowner.placedsentries)) {
            newowner.placedsentries = [];
        }
        if (!isdefined(newowner.placedsentries[self.turrettype])) {
            newowner.placedsentries[self.turrettype] = [];
        }
        turretcount = newowner.placedsentries[self.turrettype].size;
        newowner.placedsentries[self.turrettype][turretcount] = self;
        if (turretcount + 1 > 2) {
            newowner.placedsentries[self.turrettype][0] notify("kill_turret", 0, 0);
        }
        if (issharedfuncdefined("sound", "playKillstreakDeployDialog")) {
            [[ getsharedfunc("sound", "playKillstreakDeployDialog") ]](newowner, self.streakinfo.streakname);
        }
        killstreak_dangernotifyplayersinrange(newowner, newowner.team, 2000, self.streakinfo.streakname);
        hinttag = "bi_base";
        config = level.missilesettings[self.turrettype];
        var_803338ee7c91a3e6 = anglestoup(self gettagangles(hinttag)) * 20;
        hintpos = self gettagorigin(hinttag) + var_803338ee7c91a3e6;
        if (!isdefined(self.useownerobj)) {
            self.useownerobj = function_f43b6a78213dbae8(hintpos, "HINT_BUTTON", undefined, config.ownerusehintstring, undefined, undefined, "show");
        } else {
            self.useownerobj function_dfb78b3e724ad620(1);
            self.useownerobj dontinterpolate();
            self.useownerobj.origin = hintpos;
        }
        self.useownerobj linkto(self, hinttag);
        foreach (guy in level.players) {
            if (guy != self.owner) {
                self.useownerobj disableplayeruse(guy);
                continue;
            }
            self.useownerobj enableplayeruse(guy);
        }
        newowner thread function_d02d69714fbaffc1(self);
        namespace_37987c2865e1a627::function_2eff4cd94c3243e8();
        if (issharedfuncdefined("game", "createObjective")) {
            self.minimapid = self [[ getsharedfunc("game", "createObjective") ]](bundle.minimapicon, newowner.team, undefined, 1, 1);
        }
        if (level.teambased) {
            self filteroutplayermarks(newowner.team);
            return;
        }
        self filteroutplayermarks(newowner);
    }
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3a62
// Size: 0x28e
function function_14aa40ae092fe7b1(turret) {
    turret endon("carried");
    skipshutdown, wasdestroyed = turret waittill("kill_turret");
    if (issharedfuncdefined(#"hash_d8976e21a6adafba", #"hash_c33ceb91d0ca7a9d")) {
        turret [[ getsharedfunc(#"hash_d8976e21a6adafba", #"hash_c33ceb91d0ca7a9d") ]](turret);
    }
    turret function_83cebe0ae5318a7f(turret);
    level.missileturrets = array_remove(level.missileturrets, turret);
    if (isdefined(self)) {
        self.placedsentries[turret.turrettype] = array_remove(self.placedsentries[turret.turrettype], turret);
        function_2239198274531067(turret);
        if (issharedfuncdefined("player", "printGameAction")) {
            self [[ getsharedfunc("player", "printGameAction") ]]("killstreak ended - manual_turret", self);
        }
        self.var_9c4245f683e3e800--;
        turret.streakinfo.expiredbydeath = istrue(wasdestroyed);
        scripts\cp_mp\utility\killstreak_utility::recordkillstreakendstats(turret.streakinfo);
    }
    turret function_70c8684c2c29bf59("destroyed");
    turret setturretowner(undefined);
    if (!istrue(skipshutdown)) {
        turret setscriptablepartstate("shutdown", "on");
        turret setscriptablepartstate("turret_carry_state", "off");
        scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause(2);
        turret setscriptablepartstate("explode", "regular");
    } else {
        turret setscriptablepartstate("explode", "violent");
    }
    level callback::callback("killstreak_finish_use", {#streakinfo:turret.streakinfo});
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
    wait 0.2;
    turret delete();
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3cf8
// Size: 0x111
function function_7f22f5f0ae012bd4(turret) {
    turret endon("kill_turret");
    turret endon("carried");
    self endon("disconnect");
    level endon("game_ended");
    while (turret.var_8f7ba18bc776be33 > 0 && turret.timeout > 0) {
        turret.timeout -= 0.5;
        scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause(0.5);
    }
    scripts\cp_mp\hostmigration::hostmigration_waitlongdurationwithpause(turret.var_54085e2c71f12344);
    if (turret.timeout > 0) {
        function_8959c1606f65e65(turret.streakinfo.streakname, "destroyed_" + turret.streakinfo.streakname);
    } else {
        function_8959c1606f65e65(turret.streakinfo.streakname, turret.streakinfo.streakname + "_teamleader_timeout");
    }
    turret notify("kill_turret", 0, 0);
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3e11
// Size: 0x39
function function_35a05b3758e712cd(turret) {
    turret endon("kill_turret");
    turret endon("carried");
    waittill_any_3("disconnect", "joined_team", "joined_spectators");
    turret notify("kill_turret", 0, 0);
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3e52
// Size: 0x2b
function function_abae0285afe8aa60(turret) {
    turret endon("kill_turret");
    turret endon("carried");
    level waittill("game_ended");
    turret notify("kill_turret", 0, 0);
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3e85
// Size: 0x7a
function function_70c8684c2c29bf59(type) {
    turretmodel = undefined;
    if (type == "placed") {
        turretmodel = level.missilesettings[self.turrettype].modelbaseground;
    } else {
        turretmodel = level.missilesettings[self.turrettype].modeldestroyedground;
    }
    assertex(isdefined(turretmodel), "For some reason turretModel is not defined, this should never happen");
    self setmodel(turretmodel);
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3f07
// Size: 0x87
function function_973e8bbeddc12392(var_630af5192659dd3b, player) {
    /#
        self.owner endon("<dev string:x28>");
    #/
    self endon("kill_turret");
    self endon("carried");
    level endon("game_ended");
    self.momentum = 0;
    while (true) {
        self waittill("turretstatechange");
        if (self isfiringturret()) {
            self laseron();
            thread function_d335a0d787014372(var_630af5192659dd3b, player);
            continue;
        }
        self laseroff();
        function_bb2747086c8be5e4();
        thread function_471af36224e1ceb2();
    }
}

/#

    // Namespace missile_turret / namespace_6420d3dce7f35553
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x3f96
    // Size: 0x266
    function function_9ca3664d52343397(var_630af5192659dd3b) {
        self endon("<dev string:x3f>");
        self endon("<dev string:x4b>");
        level endon("<dev string:x53>");
        self.turrettarget = spawn("<dev string:x5e>", self gettagorigin("<dev string:x6b>") + anglestoforward(self gettagangles("<dev string:x6b>") * 300));
        self.turrettarget.targeton = 0;
        self.turrettarget dontinterpolate();
        self.turrettarget thread function_f77183de0101e64(self);
        self.turrettarget thread function_150429e3a1a34f4c(self);
        var_50651df7c1ef6241 = undefined;
        if (isdefined(var_630af5192659dd3b)) {
            var_50651df7c1ef6241 = var_630af5192659dd3b;
        } else {
            var_50651df7c1ef6241 = level.missilesettings[self.turrettype];
        }
        sentrymode = var_50651df7c1ef6241.sentrymodeon;
        manualmode = "<dev string:x75>";
        turretmode = sentrymode;
        notifyon = 0;
        while (true) {
            if (getdvarint(@"hash_c9bd691ce96079ac", 0) == 1) {
                if (!istrue(notifyon)) {
                    self.owner notifyonplayercommand("<dev string:x28>", "<dev string:x83>");
                    notifyon = 1;
                }
                self.owner waittill("<dev string:x28>");
                if (turretmode != manualmode) {
                    self setmode(manualmode);
                    turretmode = manualmode;
                    starttrace = self.owner getvieworigin();
                    endtrace = starttrace + anglestoforward(self.owner getplayerangles()) * 50000;
                    trace = scripts\engine\trace::ray_trace(starttrace, endtrace, self.owner);
                    endpos = undefined;
                    if (isdefined(trace["<dev string:x90>"]) && trace["<dev string:x90>"] != "<dev string:x98>") {
                        endpos = trace["<dev string:xa5>"];
                    }
                    if (isdefined(endpos)) {
                        thread function_295d25dc7b9680be(endpos);
                    }
                } else {
                    function_12e1880e082f372a();
                    turretmode = sentrymode;
                    self setmode(turretmode);
                    thread function_973e8bbeddc12392();
                }
                continue;
            }
            notifyon = 0;
            if (turretmode != sentrymode) {
                self.owner notifyonplayercommandremove("<dev string:x28>", "<dev string:x83>");
                function_12e1880e082f372a();
                turretmode = sentrymode;
                self setmode(turretmode);
                thread function_973e8bbeddc12392();
            }
            waitframe();
        }
    }

    // Namespace missile_turret / namespace_6420d3dce7f35553
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x4204
    // Size: 0x1a8
    function function_295d25dc7b9680be(firepos) {
        self.owner endon("<dev string:xae>");
        self.owner endon("<dev string:x28>");
        self endon("<dev string:x3f>");
        self endon("<dev string:x4b>");
        level endon("<dev string:x53>");
        self laseroff();
        thread function_471af36224e1ceb2();
        self.turrettarget.origin = firepos;
        self settargetentity(self.turrettarget);
        self.turrettarget.targeton = 1;
        starttag = "<dev string:xc1>";
        if (self.streakinfo.streakname == "<dev string:xd2>") {
            starttag = "<dev string:xdd>";
        }
        endtag = "<dev string:x6b>";
        wait 1;
        self laseron();
        while (true) {
            var_30c9c9336ef2caaf = self gettagorigin(starttag);
            var_831cc1b8f4225351 = self gettagangles(starttag);
            thread drawsphere(var_30c9c9336ef2caaf, 2, 1, (0, 1, 1));
            thread drawline(var_30c9c9336ef2caaf, var_30c9c9336ef2caaf + anglestoforward(var_831cc1b8f4225351) * 1800, 1, (0, 1, 1));
            flashtagorigin = self gettagorigin(endtag);
            var_e0416d7c3c03c91b = self gettagangles(endtag);
            thread drawsphere(flashtagorigin, 2, 1, (1, 1, 0));
            thread drawline(flashtagorigin, flashtagorigin + anglestoforward(var_e0416d7c3c03c91b) * 1800, 1, (1, 1, 0));
            wait 1;
        }
    }

    // Namespace missile_turret / namespace_6420d3dce7f35553
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x43b4
    // Size: 0x40
    function function_12e1880e082f372a() {
        self cleartargetentity();
        self laseroff();
        thread function_471af36224e1ceb2();
        self.turrettarget.targeton = 0;
        self.owner notify("<dev string:xae>");
    }

    // Namespace missile_turret / namespace_6420d3dce7f35553
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x43fc
    // Size: 0x61
    function function_f77183de0101e64(turret) {
        turret endon("<dev string:x3f>");
        turret endon("<dev string:x4b>");
        self endon("<dev string:xf0>");
        level endon("<dev string:x53>");
        while (true) {
            if (istrue(self.targeton)) {
                sphere(self.origin, 20, (1, 1, 0), 0, 1);
            }
            waitframe();
        }
    }

    // Namespace missile_turret / namespace_6420d3dce7f35553
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x4465
    // Size: 0x39
    function function_150429e3a1a34f4c(turret) {
        turret endon("<dev string:x3f>");
        turret endon("<dev string:x4b>");
        self endon("<dev string:xf0>");
        level endon("<dev string:x53>");
        turret waittill("<dev string:xf0>");
        self delete();
    }

#/

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x44a6
// Size: 0x1a
function function_d60ffc368c740a5() {
    self endon("death");
    self setscriptablepartstate("turret_target_found", "target_found");
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x44c8
// Size: 0x4c
function missile_spinup(var_630af5192659dd3b) {
    thread function_d60ffc368c740a5();
    while (self.momentum < var_630af5192659dd3b.spinuptime) {
        self.momentum += 0.1;
        wait 0.1;
    }
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x451c
// Size: 0x1d
function function_bb2747086c8be5e4() {
    self.momentum = 0;
    self setscriptablepartstate("turret_target_found", "off");
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x4541
// Size: 0x166
function function_d335a0d787014372(var_630af5192659dd3b, player) {
    self endon("death");
    self endon("stop_shooting");
    level endon("game_ended");
    var_50651df7c1ef6241 = undefined;
    if (isdefined(var_630af5192659dd3b)) {
        var_50651df7c1ef6241 = var_630af5192659dd3b;
    } else {
        var_50651df7c1ef6241 = level.missilesettings[self.turrettype];
    }
    missile_spinup(var_50651df7c1ef6241);
    firetime = weaponfiretime(var_50651df7c1ef6241.weaponinfo);
    while (true) {
        if (self.var_8f7ba18bc776be33 == var_50651df7c1ef6241.nummissiles) {
            wait var_50651df7c1ef6241.lockontime;
        }
        if (self.var_8f7ba18bc776be33 > 0 && isdefined(self.targetentityref)) {
            diffhealth = self.var_5e4c393ce44a423e - self.targetentityref.health;
            if (diffhealth < self.targetentityref.maxhealth) {
                if (self.var_ab491918db8f34a || self.var_5da08662e2b1cff6 <= 0) {
                    wait var_50651df7c1ef6241.lockontime;
                }
                if (self.var_5da08662e2b1cff6 <= 0) {
                    self.var_5da08662e2b1cff6 = self.var_b5df436f25658cbc;
                }
                self.canshootmissile = 1;
                function_74ce833622f356f8(self, player);
            }
        }
        wait var_50651df7c1ef6241.cooldowntime;
    }
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x46af
// Size: 0x14
function function_471af36224e1ceb2() {
    self.canshootmissile = 0;
    self notify("stop_shooting");
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x46cb
// Size: 0x9f
function turret_heatmonitor() {
    /#
        self.owner endon("<dev string:x28>");
    #/
    self endon("kill_turret");
    self endon("carried");
    level endon("game_ended");
    overheattime = level.missilesettings[self.turrettype].overheattime;
    while (true) {
        if (self.heatlevel > overheattime) {
            self.overheated = 1;
            while (self.heatlevel) {
                wait 0.1;
            }
            self.overheated = 0;
            self notify("not_overheated");
        }
        wait 0.05;
    }
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4772
// Size: 0x63
function playheatfx() {
    self endon("death");
    self endon("not_overheated");
    level endon("game_ended");
    self notify("playing_heat_fx");
    self endon("playing_heat_fx");
    while (true) {
        playfxontag(getfx("sentry_overheat_mp"), self, "tag_flash");
        wait level.missilesettings[self.turrettype].fxtime;
    }
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x47dd
// Size: 0x92
function turret_coolmonitor() {
    /#
        self.owner endon("<dev string:x28>");
    #/
    self endon("kill_turret");
    self endon("carried");
    level endon("game_ended");
    while (true) {
        if (self.heatlevel > 0) {
            if (self.cooldownwaittime <= 0) {
                self.heatlevel = max(0, self.heatlevel - 0.05);
            } else {
                self.cooldownwaittime = max(0, self.cooldownwaittime - 0.05);
            }
        }
        wait 0.05;
    }
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4877
// Size: 0x61
function function_c27484ca7994b7d0() {
    self endon("death");
    self endon("carried");
    self endon("kill_turret");
    level endon("game_ended");
    while (true) {
        wait 3;
        if (self isfiringturret()) {
            waitframe();
            continue;
        }
        self setscriptablepartstate("turret_target_search", "target_search");
        wait 0.05;
        self setscriptablepartstate("turret_target_search", "off");
    }
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x48e0
// Size: 0x50
function function_98c72b3604b1124d(streakinfo, ignorecancel) {
    assertex(isplayer(self), "this function needs to be called on a player Entity");
    if (issharedfuncdefined("killstreak", "getTargetMarker")) {
        return self [[ getsharedfunc("killstreak", "getTargetMarker") ]](streakinfo, ignorecancel);
    }
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 11, eflags: 0x0
// Checksum 0x0, Offset: 0x4939
// Size: 0x91
function function_f43b6a78213dbae8(hintpos, hinttype, hinticon, hintstring, priority, duration, onobstruction, hintdist, hintfov, usedist, usefov) {
    if (issharedfuncdefined("game", "createHintObject")) {
        return [[ getsharedfunc("game", "createHintObject") ]](hintpos, hinttype, hinticon, hintstring, priority, duration, onobstruction, hintdist, hintfov, usedist, usefov);
    }
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x49d2
// Size: 0x63
function function_3073d3141c30bbe5(turret) {
    assertex(isplayer(self), "this function needs to be called on a player Entity");
    if (issharedfuncdefined("damage", "monitorDamage")) {
        turret thread [[ getsharedfunc("damage", "monitorDamage") ]](turret.maxhealth, "hitequip", &function_242ded3cfe2e5d3b, &function_6886c78f9664c089, 1);
    }
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4a3d
// Size: 0x15a
function function_242ded3cfe2e5d3b(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    idflags = data.idflags;
    config = level.missilesettings[self.turrettype];
    var_3737240cefe2c793 = 0;
    if (issharedfuncdefined("damage", "onKillstreakKilled")) {
        var_3737240cefe2c793 = self [[ getsharedfunc("damage", "onKillstreakKilled") ]](config.streakname, attacker, objweapon, type, damage, config.scorepopup, config.vodestroyed, config.destroyedsplash);
    }
    if (var_3737240cefe2c793) {
        attacker notify("destroyed_equipment");
    }
    explosivedamage = 0;
    if (type == "MOD_EXPLOSIVE" || type == "MOD_PROJECTILE" || type == "MOD_PROJECTILE_SPLASH" || type == "MOD_GRENADE_SPLASH") {
        explosivedamage = 1;
    }
    self notify("enemy_destroyed_equipment", attacker);
    self notify("kill_turret", explosivedamage, 1);
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4b9f
// Size: 0x11c
function function_6886c78f9664c089(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    idflags = data.idflags;
    modifieddamage = damage;
    if (istrue(level.var_be6a42242be00b66)) {
        bundle = level.streakglobals.streakbundles["missile_turret"];
        modifieddamage = getmodifieddamageusingdamagetuning(attacker, objweapon, type, modifieddamage, self.maxhealth, bundle.var_e913079a5ffda56d);
    } else if (issharedfuncdefined("killstreak", "getModifiedAntiKillstreakDamage")) {
        modifieddamage = self [[ getsharedfunc("killstreak", "getModifiedAntiKillstreakDamage") ]](attacker, objweapon, type, modifieddamage, self.maxhealth, 2, 3, 4, 12, 400);
    }
    return modifieddamage;
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x4cc4
// Size: 0x60a
function function_a0a5114bb65fcecd() {
    bundle = level.streakglobals.streakbundles["missile_turret"];
    assertex(isdefined(bundle), "Bundle for Missile Turret not defined");
    if (!isdefined(bundle)) {
        bundle = spawnstruct();
    }
    level.missilesettings["missile_turret"] = spawnstruct();
    level.missilesettings["missile_turret"].health = 999999;
    level.missilesettings["missile_turret"].maxhealth = isdefined(bundle.maxhealth) ? bundle.maxhealth : 650;
    level.missilesettings["missile_turret"].burstmin = 10;
    level.missilesettings["missile_turret"].burstmax = 20;
    level.missilesettings["missile_turret"].pausemin = 1;
    level.missilesettings["missile_turret"].pausemax = 1.25;
    level.missilesettings["missile_turret"].lockstrength = 6;
    level.missilesettings["missile_turret"].sentrymodeon = "sentryManual";
    level.missilesettings["missile_turret"].sentrymodeoff = "sentry_offline";
    level.missilesettings["missile_turret"].timeout = 75;
    level.missilesettings["missile_turret"].spinuptime = 0.65;
    level.missilesettings["missile_turret"].overheattime = 8;
    level.missilesettings["missile_turret"].cooldowntime = default_to(bundle.var_1d3aef3fc310dff4, 1.25);
    level.missilesettings["missile_turret"].fxtime = 0.3;
    level.missilesettings["missile_turret"].streakname = "missile_turret";
    level.missilesettings["missile_turret"].weaponinfo = bundle.var_661e446067d68053;
    level.missilesettings["missile_turret"].playerweaponinfo = bundle.var_661e446067d68053;
    level.missilesettings["missile_turret"].scriptable = "ks_sentry_turret_mp";
    level.missilesettings["missile_turret"].modelbaseground = bundle.var_5a6fd584b4611973;
    level.missilesettings["missile_turret"].modeldestroyedground = bundle.var_d5a88876b95fb971;
    level.missilesettings["missile_turret"].placementhintstring = %KILLSTREAKS_HINTS/SENTRY_GUN_PLACE;
    level.missilesettings["missile_turret"].ownerusehintstring = %KILLSTREAKS_HINTS/MISSILE_TURRET_USE;
    level.missilesettings["missile_turret"].otherusehintstring = %KILLSTREAKS_HINTS/SENTRY_OTHER_USE;
    level.missilesettings["missile_turret"].dismantlehintstring = %KILLSTREAKS_HINTS/SENTRY_DISMANTLE;
    level.missilesettings["missile_turret"].headicon = 1;
    if (!isdefined(bundle.var_c9456bf1b15d2038)) {
        level.missilesettings["missile_turret"].teamsplash = "used_missile_turret";
    } else {
        level.missilesettings["missile_turret"].teamsplash = bundle.var_c9456bf1b15d2038;
    }
    level.missilesettings["missile_turret"].destroyedsplash = "callout_destroyed_sentry_gun";
    level.missilesettings["missile_turret"].shouldsplash = 1;
    level.missilesettings["missile_turret"].votimeout = "missile_turret_teamleader_destroyed";
    level.missilesettings["missile_turret"].vodestroyed = "missile_turret_teamleader_destroyed";
    level.missilesettings["missile_turret"].scorepopup = "destroyed_sentry";
    level.missilesettings["missile_turret"].lightfxtag = "tag_fx";
    level.missilesettings["missile_turret"].iskillstreak = 1;
    level.missilesettings["missile_turret"].headiconoffset = (0, 0, 75);
    level.missilesettings["missile_turret"].nummissiles = default_to(bundle.var_b870b20baede47ae, 3);
    level.missilesettings["missile_turret"].attackrange = default_to(bundle.var_fabd4037e21eaae, 100000);
    level.missilesettings["missile_turret"].lockontime = default_to(bundle.var_ba2ce898bfb0a9e, 3);
    level.missilesettings["missile_turret"].var_54085e2c71f12344 = default_to(bundle.var_5db04d284952849c, 10);
    level.var_2d077aafa2380de7 = 0;
    foreach (teamname in level.teamnamelist) {
        level.incomingmissileturrets[teamname] = 0;
    }
    level.missileturrets = [];
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x52d6
// Size: 0x1c0
function function_f42f083e1874b55a() {
    bundle = level.streakglobals.streakbundles["missile_turret"];
    if (!isdefined(bundle) || !issharedfuncdefined("vehicle", "get_weapon_hit_damage_data") || !issharedfuncdefined("vehicle", "get_vehicle_hit_damage_data") || !issharedfuncdefined("vehicle", "set_vehicle_hit_damage_data_for_weapon")) {
        return;
    }
    foreach (vehicleentry in bundle.vehicleentries) {
        if (istrue(vehicleentry.isvehicle) && isdefined(vehicleentry.name) && isdefined(vehicleentry.nummissiles) && isdefined(bundle.var_dbfc786f395886e7)) {
            weapondata = [[ getsharedfunc("vehicle", "get_weapon_hit_damage_data") ]](bundle.var_dbfc786f395886e7);
            vehicledata = [[ getsharedfunc("vehicle", "get_vehicle_hit_damage_data") ]](vehicleentry.name);
            var_71a662cd1563bca2 = undefined;
            if (isdefined(weapondata) && isdefined(vehicledata) && weapondata.hitsperattack > 0 && vehicledata.hitstokill > 0) {
                var_71a662cd1563bca2 = weapondata.hitsperattack * vehicleentry.nummissiles;
                [[ getsharedfunc("vehicle", "set_vehicle_hit_damage_data_for_weapon") ]](vehicleentry.name, var_71a662cd1563bca2, bundle.var_dbfc786f395886e7);
            }
        }
    }
}

// Namespace missile_turret / namespace_6420d3dce7f35553
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x549e
// Size: 0x20
function function_aabcea95d6584154() {
    if (scripts\cp_mp\utility\inventory_utility::isanymonitoredweaponswitchinprogress()) {
        return false;
    }
    if (scripts\cp_mp\utility\killstreak_utility::iskillstreakdeployweapon(self getcurrentweapon())) {
        return false;
    }
    return true;
}

/#

    // Namespace missile_turret / namespace_6420d3dce7f35553
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x54c7
    // Size: 0x98
    function function_6269f6a8c1c151dc(raycaststart, raycastend, radius) {
        duration = 100;
        red = (255, 0, 0);
        green = (0, 255, 0);
        blue = (0, 0, 255);
        sphere(raycaststart, radius, red, 0, duration);
        sphere(raycastend, radius, blue, 0, duration);
        line(raycaststart, raycastend, green, 1, 0, duration);
    }

#/
