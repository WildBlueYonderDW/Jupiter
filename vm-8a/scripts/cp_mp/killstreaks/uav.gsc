#using scripts\engine\utility.gsc;
#using scripts\engine\throttle.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\callbacks.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using script_509a782dd5b89cf1;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;
#using scripts\cp_mp\hostmigration.gsc;
#using script_16ea1b94f0f381b3;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\engine\trace.gsc;

#namespace uav;

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x86e
// Size: 0x7e
function init() {
    if (issharedfuncdefined("uav", "init")) {
        [[ getsharedfunc("uav", "init") ]]();
    }
    level thread function_83bbd4aad5a34b6b();
    level function_ac005e67449bfdf8();
    level function_d4fc9b64ffec9e4e();
    level thread onplayerconnect();
    level thread uav_tracker();
    /#
        setdevdvarifuninitialized(@"hash_fe0a46289ab091e1", level.radarviewtime);
        setdevdvarifuninitialized(@"hash_ac7f6a636682c52f", 0);
    #/
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8f4
// Size: 0x4d
function function_83bbd4aad5a34b6b() {
    level endon("game_ended");
    flag_wait("onStartGameTypeFinished");
    if (isdefined(level.mapcenter)) {
        level.uavrotationorigin = level.mapcenter;
        return;
    }
    level.uavrotationorigin = (0, 0, 0);
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x949
// Size: 0x17c
function function_ac005e67449bfdf8() {
    level.uavworstid = getuavstrengthmin();
    level.uavbestid = getuavstrengthmax();
    level.uavdirectionalid = getuavstrengthlevelshowenemydirectional();
    level.uavnoneid = getuavstrengthlevelneutral();
    level.uavfastsweepid = getuavstrengthlevelshowenemyfastsweep();
    if (level.teambased) {
        for (i = 0; i < level.teamnamelist.size; i++) {
            level.radarmode[level.teamnamelist[i]] = "normal_radar";
            level.activeuavs[level.teamnamelist[i]] = 0;
            level.activecounteruavs[level.teamnamelist[i]] = 0;
            level.activeadvanceduavs[level.teamnamelist[i]] = 0;
            level.uavmodels[level.teamnamelist[i]] = [];
            if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
                level.var_48c4edf71e075321[level.teamnamelist[i]] = 0;
            }
        }
    } else {
        level.radarmode = [];
        level.activeuavs = [];
        level.activecounteruavs = [];
        level.activeadvanceduavs = [];
        level.uavmodels = [];
        if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
            level.var_48c4edf71e075321 = [];
        }
    }
    level.uavrigs = [];
    level.totalactiveuavs = 0;
    level.totalactivecounteruavs = 0;
    level.activeadvanceduavcount = 0;
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xacd
// Size: 0xa5
function function_d4fc9b64ffec9e4e() {
    game["dialog"]["uav_use"] = "killstreak_remote_operator" + "_request_response";
    game["dialog"]["uav_use_friendly_br"] = "frns_grav_uav1";
    game["dialog"]["uav_use_enemy_br"] = "nmys_grav_uav1";
    game["dialog"]["uav_leave"] = "killstreak_remote_operator" + "_leave";
    game["dialog"]["uav_destroyed"] = "killstreak_remote_operator" + "_crash";
    game["dialog"]["directional_uav_use"] = "killstreak_remote_operator" + "_request_response";
    game["dialog"]["directional_uav_leave"] = "killstreak_remote_operator" + "_leave";
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb7a
// Size: 0xa0
function onplayerconnect() {
    var_f0d1eb8b608ecb81 = getuavstrengthlevelneutral();
    while (true) {
        player = level waittill("connected");
        level.activeuavs[player.guid] = 0;
        level.activeuavs[player.guid + "_radarStrength"] = var_f0d1eb8b608ecb81;
        level.activecounteruavs[player.guid] = 0;
        level.radarmode[player.guid] = "normal_radar";
        player.radarstrength = var_f0d1eb8b608ecb81;
    }
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc22
// Size: 0xa
function onplayerspawned() {
    level notify("uav_update");
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc34
// Size: 0x8c
function function_3166f86d25686055() {
    level endon("uav_update");
    uav_throttle = throttle::function_af33edfaf05fc572("uav", getdvarint(@"hash_533830ccd327d251", 16));
    foreach (entry in level.teamnamelist) {
        throttle::function_6f7b33660ae155ef(uav_throttle);
        uav_updateteamstatus(entry);
    }
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcc8
// Size: 0x38
function uav_tracker() {
    level endon("game_ended");
    while (true) {
        level waittill("uav_update");
        if (level.teambased) {
            level thread function_3166f86d25686055();
            continue;
        }
        function_f9caa46aa98b7c6b();
    }
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xd08
// Size: 0x25
function tryuseuav(streakname) {
    streakinfo = createstreakinfo(streakname, self);
    return tryuseuavfromstruct(streakinfo);
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd36
// Size: 0x279
function tryuseuavfromstruct(streakinfo) {
    level endon("game_ended");
    self endon("disconnect");
    if (streakinfo.streakname == "uav" && isbrstylegametype() && getdvarint(@"hash_970be8db72985238", 0)) {
        return namespace_2c99f682179581bf::function_e5931b9f76ed6cda(streakinfo);
    }
    if (isdefined(level.killstreaktriggeredfunc)) {
        if (!level [[ level.killstreaktriggeredfunc ]](streakinfo)) {
            return 0;
        }
    }
    var_300a4922baa10548 = 0;
    if (level.teambased && isdefined(level.teamdata) && isdefined(level.teamdata[self.team]) && isdefined(level.teamdata[self.team]["activeSupplySweeps"])) {
        activeSupplySweeps = level.teamdata[self.team]["activeSupplySweeps"].size;
        var_300a4922baa10548 = activeSupplySweeps > 0;
    }
    if (var_300a4922baa10548) {
        useresult = "KILLSTREAKS/SUPPLY_SWEEP_IN_PROGRESS";
        if (issharedfuncdefined("hud", "showErrorMessage")) {
            self [[ getsharedfunc("hud", "showErrorMessage") ]](useresult);
        }
        return 0;
    }
    bundle = level.streakglobals.streakbundles["uav"];
    id = function_2336488258354fbc(#"scriptbundle_killstreak", bundle.var_19fb085453713468);
    self setclientomnvar("uav_radar_ping", id);
    subgametype = scripts\cp_mp\utility\game_utility::function_6c1fce6f6b8779d5();
    if (isdefined(bundle) && isdefined(bundle.deployweaponname)) {
        var_dd21567fdd9a3a6a = bundle.deployweaponname;
    } else if (subgametype == "vanilla" || subgametype == "mini_mgl") {
        var_dd21567fdd9a3a6a = "ks_gesture_generic_mp";
    } else {
        var_dd21567fdd9a3a6a = "ks_gesture_phone_mp";
    }
    var_32cd77f7f836e8e4 = 1;
    if (isdefined(streakinfo.var_32cd77f7f836e8e4)) {
        var_32cd77f7f836e8e4 = streakinfo.var_32cd77f7f836e8e4;
    }
    if (var_32cd77f7f836e8e4) {
        deployresult = scripts\cp_mp\killstreaks\killstreakdeploy::streakdeploy_dogesturedeploy(streakinfo, makeweapon(var_dd21567fdd9a3a6a));
        if (!istrue(deployresult)) {
            return 0;
        }
    }
    if (isdefined(level.killstreakbeginusefunc)) {
        if (!level [[ level.killstreakbeginusefunc ]](streakinfo)) {
            return 0;
        }
    }
    useresult = uav_use(streakinfo.streakname, streakinfo);
    return istrue(useresult);
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfb8
// Size: 0x25b
function uav_use(uavtype, streakinfo) {
    if (issharedfuncdefined("killstreak", "logKillstreakEvent")) {
        self [[ getsharedfunc("killstreak", "logKillstreakEvent") ]](uavtype, self.origin);
    }
    team = self.pers["team"];
    usetime = level.uavsettings[uavtype].timeout;
    var_da662696203dc431 = 0;
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        var_da662696203dc431 = 1;
    }
    launchresult = uav_launch(self, uavtype, streakinfo, var_da662696203dc431);
    if (!istrue(launchresult)) {
        if (scripts\engine\utility::issharedfuncdefined("hud", "showErrorMessage")) {
            self [[ scripts\engine\utility::getsharedfunc("hud", "showErrorMessage") ]]("KILLSTREAKS/AIR_SPACE_TOO_CROWDED");
        }
        return false;
    }
    uaveventname = "uavUsed";
    bundle = level.streakglobals.streakbundles[uavtype];
    var_eaa4be49ac36f006 = istrue(bundle.var_8cfb8995372b9fea);
    self.var_7daf8331a040c860 = var_eaa4be49ac36f006;
    switch (uavtype) {
    case #"hash_e171e5b86ef0a4cc": 
        self.radarshowenemydirection = 1;
        if (level.teambased) {
            foreach (player in level.players) {
                if (player.pers["team"] == team) {
                    player.radarshowenemydirection = 1;
                    player.var_7daf8331a040c860 = var_eaa4be49ac36f006;
                }
            }
        }
        uaveventname = "directionalUavUsed";
        break;
    case #"hash_10e585c25e7e9f60": 
        uaveventname = "counterUavUsed";
    default: 
        if (level.teambased) {
            radarstrength = function_5ec24d236512fd7a(team);
        }
        break;
    }
    if (issharedfuncdefined("player", "doOnActionScoreEvent")) {
        self [[ getsharedfunc("player", "doOnActionScoreEvent") ]](2, uaveventname);
    }
    return true;
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x121c
// Size: 0xe1
function function_8e9a430c17ddcd55(uavtype) {
    if (!scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        return false;
    }
    if (uavtype != "uav") {
        return false;
    }
    index = undefined;
    if (level.teambased) {
        index = self.team;
        if (istrue(level.var_7c5a2787ed20ac77)) {
            index = self.team + self.squadindex;
        }
    } else {
        index = self.guid;
    }
    assert(isdefined(index));
    var_f19f07f386cd9119 = level.activeadvanceduavs[index];
    if (isdefined(var_f19f07f386cd9119) && var_f19f07f386cd9119 > 0) {
        return false;
    }
    var_a23be9fd896cb2ca = level.activeuavs[index];
    var_990d56bda9bcdf66 = function_933df49e9a291165(var_a23be9fd896cb2ca, 0, 0);
    directionalstrength = getuavstrengthlevelshowenemydirectional();
    return var_990d56bda9bcdf66 >= directionalstrength;
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1306
// Size: 0x162
function uav_launch(owner, uavtype, streakinfo, var_da662696203dc431) {
    team = owner.team;
    launchorigin = level.uavrotationorigin;
    if (islargemap()) {
        if (level.gametype == "arm" || level.gametype == "conflict" || level.gametype == "gwtdm") {
            if (isdefined(level.hqmidpoint)) {
                launchorigin = level.hqmidpoint;
            }
        } else {
            launchorigin = owner.origin;
        }
    }
    if (isdefined(streakinfo.overridetime)) {
        uavmodel = uav_create(launchorigin, owner, uavtype, streakinfo, var_da662696203dc431, streakinfo.overridetime);
    } else {
        uavmodel = uav_create(launchorigin, owner, uavtype, streakinfo, var_da662696203dc431);
    }
    if (!isdefined(uavmodel)) {
        return false;
    }
    if (issharedfuncdefined("emp", "setEMP_Applied_Callback")) {
        uavmodel [[ getsharedfunc("emp", "setEMP_Applied_Callback") ]](&function_b9f0ee21053d4057);
    }
    if (issharedfuncdefined("emp", "setEMP_Cleared_Callback")) {
        uavmodel [[ getsharedfunc("emp", "setEMP_Cleared_Callback") ]](&function_669abde8621d826e);
    }
    uavmodel thread function_fd8473db50408aa8();
    return true;
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1471
// Size: 0x867
function uav_create(launchorigin, owner, uavtype, streakinfo, var_da662696203dc431, lifetimeOverride) {
    uavmodel = undefined;
    var_88d3d00bf003f331 = undefined;
    if (istrue(var_da662696203dc431)) {
        uavmodel = spawnstruct();
        uavmodel.damagetaken = 0;
    } else {
        uavmodel = spawn("script_model", launchorigin + (0, 0, 5000));
        var_88d3d00bf003f331 = uavmodel function_972967e0c0a0fa8(uavtype, launchorigin);
        if (!isdefined(var_88d3d00bf003f331)) {
            uavmodel delete();
            return undefined;
        }
    }
    /#
        if (getdvarint(@"hash_da4afb1bdf19df26")) {
            uavmodel thread function_6467f4a6c5a005d4();
            uavmodel thread function_e6d0ffaec6506528();
        }
    #/
    model = level.uavsettings[uavtype].modelbase;
    if (scripts\cp_mp\utility\player_utility::getplayersuperfaction(owner) && isdefined(level.uavsettings[uavtype].modelbasealt)) {
        model = level.uavsettings[uavtype].modelbasealt;
    }
    maxhealth = level.uavsettings[uavtype].maxhealth;
    calloutsplash = level.uavsettings[uavtype].teamsplash;
    if (isent(uavmodel)) {
        uavmodel setmodel(model);
    }
    uavmodel.team = owner.team;
    uavmodel.owner = owner;
    uavmodel.timetoadd = 0;
    uavmodel.uavtype = uavtype;
    uavmodel.health = level.uavsettings[uavtype].health;
    uavmodel.maxhealth = maxhealth;
    uavmodel.currenthealth = maxhealth;
    uavmodel.streakinfo = streakinfo;
    uavmodel thread function_c926982ff07fdea5();
    uavmodel thread function_d45f5cf5bfce96df();
    uavmodel thread function_e58c525d5d3a7482();
    uavmodel thread function_225e3594843d2ac(uavtype, lifetimeOverride, owner);
    if (isent(uavmodel)) {
        uavmodel setotherent(owner);
        uavmodel scriptmoveroutline();
        uavmodel scriptmoverthermal();
        if (issharedfuncdefined("uav", "attachXRays")) {
            uavmodel = [[ getsharedfunc("uav", "attachXRays") ]](uavmodel);
        }
        if (issharedfuncdefined("killstreak", "addToActiveKillstreakList")) {
            uavmodel [[ getsharedfunc("killstreak", "addToActiveKillstreakList") ]](uavtype, "Killstreak_Air", owner);
        }
        uavmodel thread uav_watchdamage();
        uavmodel thread function_f53de0e99cb013e8();
        uavmodel thread uav_trackvelocity();
        bundle = level.streakglobals.streakbundles[uavmodel.uavtype];
        uavmodel thread scripts\cp_mp\utility\killstreak_utility::killstreak_registerMinimapInfo(bundle, function_1823ff50bb28148d(uavmodel.uavtype));
        uavmodel setscriptablepartstate("lights", "on", 0);
        if (uavmodel.uavtype == "counter_uav") {
            uavmodel setscriptablepartstate("rotors", "on", 0);
        }
        range_min = default_to(bundle.var_a0dba1d8d8484cea, 6000);
        range_max = default_to(bundle.var_a0feabd8d86eaaa0, 6500);
        zoffset = randomintrange(range_min, range_max);
        if (uavmodel.uavtype == "counter_uav") {
            range_min = default_to(bundle.var_5aabe3dc355c0975, 2000);
            range_max = default_to(bundle.var_5acecddc358220cb, 2500);
            zoffset = randomintrange(range_min, range_max);
        } else if (uavmodel.uavtype == "directional_uav") {
            zoffset = randomintrange(30000, 31000);
        }
        if (issubstr(level.mapname, "mp_catedral")) {
            zoffset += 5000;
        }
        angle = randomint(360);
        range_min = default_to(bundle.var_fe6c5d5f5bb37316, 0);
        range_max = default_to(bundle.var_fe904f5f5bdbcf04, 1000);
        baseradiusoffset = randomintrange(range_min, range_max);
        if (uavmodel.uavtype == "counter_uav") {
            range_min = default_to(bundle.var_6261e0ab618b4ff5, 300);
            range_max = default_to(bundle.var_6284caab61b1674b, 550);
            baseradiusoffset = randomintrange(range_min, range_max);
        } else if (uavmodel.uavtype == "directional_uav") {
            baseradiusoffset = randomintrange(20000, 22000);
        }
        radiusoffset = baseradiusoffset + 4000;
        xoffset = cos(angle) * radiusoffset;
        yoffset = sin(angle) * radiusoffset;
        anglevector = vectornormalize((xoffset, yoffset, zoffset));
        anglevector *= zoffset;
        isbr = issharedfuncdefined("game", "isBRStyleGameType") && [[ getsharedfunc("game", "isBRStyleGameType") ]]();
        if (isbr) {
            var_d00af7864022039c = (0, 0, 3000);
            anglevector += var_d00af7864022039c;
        }
        uavmodel linkto(var_88d3d00bf003f331, "tag_origin", anglevector, (0, angle - 90, 0));
        uavmodel thread function_48e2105afd534b62();
        uavmodel function_cfc5e3633ef950fd(1, uavmodel.maxhealth * 0.75, &function_1c832b851ca3a96a);
        uavmodel function_cfc5e3633ef950fd(2, uavmodel.maxhealth * 0.5, &function_4db3b85258da27bf);
        uavmodel function_cfc5e3633ef950fd(3, uavmodel.maxhealth * 0.25, &function_aece0522af7087ef);
    }
    uavmodel [[ level.uavsettings[uavtype].addfunc ]]();
    if (uavtype == "uav" || uavtype == "directional_uav") {
        uavmodel function_172c4412dde1696(1);
        uavmodel thread function_e9a20f47c6b49bd7();
    }
    if (isdefined(level.activeuavs[uavmodel.team]) && level.activeuavs[uavmodel.team] > 0) {
        if (isent(uavmodel)) {
            foreach (uav in level.uavmodels[uavmodel.team]) {
                if (uav == uavmodel) {
                    continue;
                }
                if (isdefined(uav.timetoadd)) {
                    uav.timetoadd += 5;
                }
            }
        } else {
            uavmodel.timetoadd = 5 * (level.activeuavs[uavmodel.team] - 1);
        }
    }
    vostreakname = streakinfo.streakname;
    if (owner function_8e9a430c17ddcd55(uavtype)) {
        vostreakname = "directional_uav";
    }
    var_52a5be2e2f91d710 = undefined;
    if (issharedfuncdefined("sound", "playKillstreakDeployDialog")) {
        [[ getsharedfunc("sound", "playKillstreakDeployDialog") ]](owner, vostreakname);
        var_52a5be2e2f91d710 = 2;
    }
    isbr = issharedfuncdefined("game", "isBRStyleGameType") && [[ getsharedfunc("game", "isBRStyleGameType") ]]();
    if (isbr) {
        killstreak_dangernotifyplayersinrange(owner, uavmodel.team, 15000, vostreakname);
    } else {
        owner thread playkillstreakoperatordialog(vostreakname, vostreakname + "_use", 1, var_52a5be2e2f91d710);
    }
    if (issharedfuncdefined("hud", "teamPlayerCardSplash")) {
        level thread [[ getsharedfunc("hud", "teamPlayerCardSplash") ]](calloutsplash, owner);
    }
    level notify("uav_update");
    level notify("uav_started", owner, uavtype);
    return uavmodel;
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1ce1
// Size: 0x4e2
function function_fd8473db50408aa8(worldspawned) {
    level endon("game_ended");
    uavtype = self.uavtype;
    uavowner = self.owner;
    uavteam = self.team;
    result = waittill_any_return_2("explode", "timeout");
    bundle = level.streakglobals.streakbundles[self.uavtype];
    if (isdefined(result) && result == "timeout") {
        if (isent(self)) {
            self unlink();
            exitdistance = default_to(bundle.var_d4db4bfbc99f31f6, 50000);
            self.destpoint = self.origin + anglestoforward(self.angles) * exitdistance;
            var_e811fd5fd6bf8823 = default_to(bundle.var_d4ed8cc7cbb67b7d, exitdistance / 50);
            var_1d80fd99cdd64eb4 = exitdistance / var_e811fd5fd6bf8823;
            self moveto(self.destpoint, var_1d80fd99cdd64eb4);
        }
        if (isdefined(uavowner) && !istrue(level.gameended)) {
            uavowner playkillstreakoperatordialog(self.uavtype, self.uavtype + "_leave", 1);
        }
        exitdelay = default_to(bundle.var_7a74314e075c8cc6, 3);
        scripts\cp_mp\hostmigration::hostmigration_waittillnotifyortimeoutpause("death", exitdelay);
        if (isdefined(self) && self.damagetaken < self.maxhealth) {
            self notify("leaving");
            self.isleaving = 1;
            if (isent(self)) {
                var_d9e9b47f09bf90bb = distance2d(self.destpoint, self.origin);
                var_aa2e3b2f5723b73c = default_to(bundle.var_3b51b0350f3922b2, var_d9e9b47f09bf90bb / 15);
                var_f088dfbe58063db9 = var_d9e9b47f09bf90bb / var_aa2e3b2f5723b73c;
                self moveto(self.destpoint, var_f088dfbe58063db9);
            }
            var_35f4d8db65386407 = default_to(bundle.var_9c8bdfefbb219413, 4);
            scripts\cp_mp\hostmigration::hostmigration_waittillnotifyortimeoutpause("death", var_35f4d8db65386407 + self.timetoadd);
            if (isdefined(self) && self.damagetaken < self.maxhealth) {
                self.leftplayspace = 1;
            }
        }
    }
    if (isdefined(self)) {
        if (isdefined(uavowner)) {
            uavowner notify("uav_finished");
        }
        if (uavtype == "uav" || uavtype == "directional_uav") {
            function_172c4412dde1696(level.minimaponbydefault);
        }
        self [[ level.uavsettings[uavtype].removefunc ]]();
        if (!istrue(worldspawned)) {
            level callback::callback("killstreak_finish_use", {#streakinfo:self.streakinfo});
        }
        if (isdefined(self.enemyobjid)) {
            if (scripts\engine\utility::issharedfuncdefined("game", "returnObjectiveID")) {
                [[ scripts\engine\utility::getsharedfunc("game", "returnObjectiveID") ]](self.enemyobjid);
            }
            self notify("uav_deleteObjective");
        }
        self.streakinfo.expiredbydeath = !istrue(self.leftplayspace);
        if (!istrue(self.recordedgameendstats) && isdefined(uavowner)) {
            uavowner scripts\cp_mp\utility\killstreak_utility::recordkillstreakendstats(self.streakinfo);
        }
        if (isent(self)) {
            thread function_e2fce5a833321770();
        } else {
            self notify("death");
        }
    }
    if (uavtype == "directional_uav") {
        if (isdefined(uavowner) && !(uavowner player_hasperk("specialty_overwatch") || uavowner player_hasperk("specialty_pc_comms"))) {
            uavowner.radarshowenemydirection = 0;
        }
        if (level.teambased) {
            foreach (player in level.players) {
                if (isdefined(player) && player.pers["team"] == uavteam && !(player player_hasperk("specialty_overwatch") || player player_hasperk("specialty_pc_comms"))) {
                    player.radarshowenemydirection = 0;
                }
            }
        }
    }
    if (issharedfuncdefined("player", "printGameAction")) {
        [[ getsharedfunc("player", "printGameAction") ]]("killstreak ended - " + uavtype, uavowner);
    }
    level notify("uav_update");
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        level notify("uav_finished", uavowner);
    }
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21cb
// Size: 0x18
function function_e2fce5a833321770() {
    level endon("game_ended");
    wait 1;
    if (isdefined(self)) {
        self delete();
    }
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21eb
// Size: 0xa6
function function_c926982ff07fdea5() {
    self endon("death");
    self endon("explode");
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype() && isdefined(self.uavtype) && self.uavtype != "directional_uav") {
        self.owner waittill_any_2("death_or_disconnect", "joined_team");
    } else {
        self.owner waittill_any_2("disconnect", "joined_team");
    }
    if (isent(self)) {
        self setscriptablepartstate("explode", "on", 0);
        self.damagetaken = self.maxhealth;
    }
    self notify("explode");
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2299
// Size: 0x94
function function_d45f5cf5bfce96df() {
    self endon("death");
    self endon("explode");
    while (true) {
        level waittill("host_migration_end");
        if (level.teambased) {
            foreach (entry in level.teamnamelist) {
                currentradar = function_5ec24d236512fd7a(entry);
                function_484d86ce003c2526(entry, currentradar);
            }
        }
    }
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2335
// Size: 0xf6
function function_48e2105afd534b62() {
    self endon("death");
    self endon("explode");
    while (true) {
        level waittill_either("joined_team", "uav_update");
        /#
            if (getdvarint(@"hash_ac7f6a636682c52f", 0) == 1) {
                self show();
                continue;
            }
        #/
        self hide();
        foreach (player in level.players) {
            if (level.teambased) {
                if (player.team != self.team) {
                    self showtoplayer(player);
                }
                continue;
            }
            if (isdefined(self.owner) && player == self.owner) {
                continue;
            }
            self showtoplayer(player);
        }
    }
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2433
// Size: 0x5f1
function uav_watchdamage() {
    self endon("death");
    self endon("explode");
    level endon("game_ended");
    self setcandamage(1);
    self.damagetaken = 0;
    while (true) {
        damage, attacker, direction_vec, point, meansofdeath, modelname, tagname, partname, idflags, objweapon, origin, angles, normal, inflictor = self waittill("damage");
        debugdamage = undefined;
        /#
            debugdamage = istrue(self.debugdamage);
        #/
        if (issharedfuncdefined("weapons", "mapWeapon")) {
            objweapon = [[ getsharedfunc("weapons", "mapWeapon") ]](objweapon, inflictor);
        }
        if (!isplayer(attacker)) {
            if (!isdefined(self)) {
                return;
            }
            continue;
        }
        if (self.uavtype == "directional_uav" && (meansofdeath == "MOD_RIFLE_BULLET" || meansofdeath == "MOD_PISTOL_BULLET" || meansofdeath == "MOD_EXPLOSIVE_BULLET")) {
            continue;
        }
        if (isdefined(idflags) && idflags & 8) {
            self.wasdamagedfrombulletpenetration = 1;
        }
        if (isdefined(idflags) && idflags & 256) {
            self.wasdamagedfrombulletricochet = 1;
        }
        self.wasdamaged = 1;
        modifieddamage = damage;
        if (isplayer(attacker)) {
            if (issharedfuncdefined("damage", "updateDamageFeedback")) {
                attacker [[ getsharedfunc("damage", "updateDamageFeedback") ]]("hitequip");
            }
        }
        var_cb15fa5174e71840 = 1;
        var_be7c04516c5d9ccd = 1;
        var_ca960a517459fe15 = 1;
        var_8aceb016baaf67af = 0;
        var_64103c6b531d18f0 = 3;
        if (self.uavtype == "counter_uav") {
            var_cb15fa5174e71840 = 1;
            var_be7c04516c5d9ccd = 2;
            var_ca960a517459fe15 = 3;
            var_8aceb016baaf67af = 0;
            var_64103c6b531d18f0 = 0;
        } else if (self.uavtype == "directional_uav") {
            var_cb15fa5174e71840 = 5;
            var_be7c04516c5d9ccd = 6;
            var_ca960a517459fe15 = 7;
            var_8aceb016baaf67af = 0;
            var_64103c6b531d18f0 = 0;
        }
        if (isdefined(objweapon)) {
            if (istrue(debugdamage)) {
                modifieddamage = damage;
            } else if (istrue(level.var_be6a42242be00b66) && issharedfuncdefined("killstreak", "getModifiedDamageUsingDamageTuning")) {
                bundle = level.streakglobals.streakbundles[self.uavtype];
                modifieddamage = self [[ getsharedfunc("killstreak", "getModifiedDamageUsingDamageTuning") ]](attacker, objweapon, meansofdeath, modifieddamage, self.maxhealth, bundle.var_e913079a5ffda56d);
            } else if (issharedfuncdefined("killstreak", "getModifiedAntiKillstreakDamage")) {
                modifieddamage = self [[ getsharedfunc("killstreak", "getModifiedAntiKillstreakDamage") ]](attacker, objweapon, meansofdeath, modifieddamage, self.maxhealth, var_cb15fa5174e71840, var_be7c04516c5d9ccd, var_ca960a517459fe15, var_8aceb016baaf67af, var_64103c6b531d18f0);
            }
            if (issharedfuncdefined("killstreak", "killstreakHit")) {
                [[ getsharedfunc("killstreak", "killstreakHit") ]](attacker, objweapon, self, meansofdeath, modifieddamage);
            }
            if (issharedfuncdefined("damage", "logAttackerKillstreak")) {
                self [[ getsharedfunc("damage", "logAttackerKillstreak") ]](self, damage, attacker, direction_vec, point, meansofdeath, modelname, tagname, partname, idflags, getcompleteweaponname(objweapon));
            }
        }
        self.damagetaken += modifieddamage;
        /#
            if (isdefined(self) && getdvarint(@"hash_f42eefd3e1b79376")) {
                println("<dev string:x1c>" + self getentitynumber() + "<dev string:x21>" + self.health - self.damagetaken + "<dev string:x2a>" + attacker.clientid + "<dev string:x35>" + isplayer(attacker) + "<dev string:x4b>" + modifieddamage + "<dev string:x54>" + distance(attacker.origin, self.origin));
            }
        #/
        self.currenthealth -= modifieddamage;
        killstreak_updateDamageState(self.currenthealth);
        if (self.damagetaken >= self.maxhealth) {
            if (isplayer(attacker) && (!isdefined(self.owner) || attacker != self.owner)) {
                var_75b67453a730bb0d = level.uavsettings[self.uavtype].calloutdestroyed;
                var_f444e68339293717 = "destroyed_" + self.uavtype;
                if (self.uavtype == "uav") {
                    var_f444e68339293717 = undefined;
                    self.owner playkillstreakoperatordialog(self.uavtype, self.uavtype + "_destroyed", 1);
                }
                if (issharedfuncdefined("damage", "onKillstreakKilled")) {
                    self [[ getsharedfunc("damage", "onKillstreakKilled") ]](self.uavtype, attacker, objweapon, meansofdeath, damage, "destroyed_" + self.uavtype, var_f444e68339293717, var_75b67453a730bb0d, 1);
                }
                if (isdefined(self.uavremotemarkedby) && self.uavremotemarkedby != attacker) {
                    if (issharedfuncdefined("uav", "remoteUAV_processTaggedAssist")) {
                        self.uavremotemarkedby thread [[ getsharedfunc("uav", "remoteUAV_processTaggedAssist") ]]();
                    }
                }
            }
            self setscriptablepartstate("explode", "on", 0);
            self notify("explode");
            return;
        }
    }
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a2c
// Size: 0x9d
function uav_destroy() {
    var_75b67453a730bb0d = level.uavsettings[self.uavtype].calloutdestroyed;
    var_f444e68339293717 = "destroyed_" + self.uavtype;
    if (self.uavtype == "uav") {
        var_f444e68339293717 = undefined;
        self.owner playkillstreakoperatordialog(self.uavtype, self.uavtype + "_destroyed", 1);
    }
    self setscriptablepartstate("explode", "on", 0);
    self notify("explode");
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ad1
// Size: 0x13
function function_1c832b851ca3a96a() {
    self setscriptablepartstate("body_damage_light", "on");
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2aec
// Size: 0x13
function function_4db3b85258da27bf() {
    self setscriptablepartstate("body_damage_medium", "on");
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b07
// Size: 0x13
function function_aece0522af7087ef() {
    self setscriptablepartstate("body_damage_heavy", "on");
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2b22
// Size: 0xd8
function function_709bafcc745fa088() {
    foreach (player in level.players) {
        if (isdefined(self.streakname) && (self.streakname == "directional_uav" || self.streakname == "counter_uav")) {
            return;
        }
        if (issharedfuncdefined("perk", "hasPerk")) {
            if (!player [[ getsharedfunc("perk", "hasPerk") ]]("specialty_expanded_minimap")) {
                continue;
            }
        }
        if (player.team == self.team) {
            continue;
        }
        thread function_dc407442aceae01e(player);
    }
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c02
// Size: 0x2f
function function_dc407442aceae01e(enemyaffected) {
    level endon("game_ended");
    enemyaffected endon("disconnect");
    triggeroneoffradarsweep(enemyaffected);
    self waittill("death");
    triggeroneoffradarsweep(enemyaffected);
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2c39
// Size: 0x84
function function_5ec24d236512fd7a(team) {
    forcedradar = getdvarint(@"hash_f16ba8db72f34fc3", 0);
    if (forcedradar) {
        return forcedradar;
    }
    activeuavs = level.activeuavs[team];
    var_6f923ce59f2dba50 = level.activeadvanceduavs[team];
    activecounteruavs = level.totalactivecounteruavs - level.activecounteruavs[team];
    return function_933df49e9a291165(activeuavs, var_6f923ce59f2dba50, activecounteruavs);
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2cc5
// Size: 0x15c
function function_933df49e9a291165(activeuavs, var_6f923ce59f2dba50, activecounteruavs) {
    /#
        uavowner = undefined;
        foreach (player in level.players) {
            if (isdefined(player)) {
                uavowner = player;
                break;
            }
        }
        if (isdefined(uavowner) && istrue(uavowner.var_f39d717b31ec5af9)) {
            activecounteruavs = 1;
        }
    #/
    strengthmin = getuavstrengthmin();
    strengthmax = getuavstrengthmax();
    if (var_6f923ce59f2dba50) {
        activeuavs = strengthmax - getuavstrengthlevelneutral();
    }
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        if (scripts\cp_mp\utility\game_utility::function_fa7bfcc1d68b7b73() && activecounteruavs > 0) {
            radarstrength = strengthmin;
        } else {
            radarstrength = int(clamp(activeuavs + getuavstrengthlevelneutral(), getuavstrengthlevelneutral(), getuavstrengthlevelshowenemydirectional()));
        }
    } else if (activecounteruavs > 0) {
        radarstrength = strengthmin;
    } else if (var_6f923ce59f2dba50 > 0) {
        radarstrength = strengthmax;
    } else {
        radarstrength = int(clamp(activeuavs + getuavstrengthlevelneutral(), getuavstrengthlevelneutral(), getuavstrengthlevelshowenemyfastsweep()));
    }
    radarstrength = int(clamp(radarstrength, strengthmin, strengthmax));
    return radarstrength;
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e2a
// Size: 0x1c
function function_484d86ce003c2526(team, override) {
    uav_updateteamstatus(team, override);
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e4e
// Size: 0x12e
function function_8abf717874ce81d4(radarstrength, var_70d48b6b51ff2964) {
    isradarblocked = radarstrength == level.uavworstid;
    hasradar = !isradarblocked;
    radarshowenemydirection = radarstrength >= level.uavdirectionalid;
    showconstant = radarstrength >= level.uavbestid || radarshowenemydirection || radarstrength == 1;
    if (radarstrength == level.uavnoneid) {
        radarmode = "normal_radar";
        hasradar = 0;
    } else if (showconstant) {
        radarmode = "constant_radar";
    } else if (radarstrength == level.uavfastsweepid || var_70d48b6b51ff2964 && getdvarint(@"hash_61964e46cab20802", 1) == 1) {
        radarmode = "fast_radar";
    } else {
        radarmode = "normal_radar";
    }
    radardata = {#var_70d48b6b51ff2964:var_70d48b6b51ff2964, #radarmode:radarmode, #radarshowenemydirection:radarshowenemydirection, #hasradar:hasradar, #isradarblocked:isradarblocked, #radarstrength:radarstrength};
    return radardata;
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f85
// Size: 0x64
function function_ddcbf96c5ef69597(team, override) {
    if (isdefined(override)) {
        radarstrength = override;
    } else {
        radarstrength = function_5ec24d236512fd7a(team);
    }
    var_70d48b6b51ff2964 = scripts\cp_mp\utility\game_utility::isbrstylegametype() && level.var_48c4edf71e075321[team];
    radardata = function_8abf717874ce81d4(radarstrength, var_70d48b6b51ff2964);
    return radardata;
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ff2
// Size: 0x169
function function_13b8682b55619852(player, radardata) {
    if (player function_a237aba99cf26050() && getdvarint(@"hash_c06ce4e11c644c9b", 0) == 1) {
        strengthmin = getuavstrengthmin();
        strengthmax = getuavstrengthmax();
        radarstrength = int(clamp(radardata.radarstrength + 1, strengthmin, strengthmax));
        radardata = function_8abf717874ce81d4(radarstrength, radardata.var_70d48b6b51ff2964);
    }
    player.radarstrength = radardata.radarstrength;
    player.isradarblocked = radardata.isradarblocked;
    player.hasradar = radardata.hasradar;
    player.radarshowenemydirection = radardata.radarshowenemydirection;
    player.radarmode = radardata.radarmode;
    player setclientomnvar("ui_radar_blocked", !istrue(player.hasradar));
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype()) {
        if (radardata.var_70d48b6b51ff2964 || player player_hasperk("specialty_pc_comms")) {
            player.radarshowenemydirection = 1;
        }
    }
    if (player player_hasperk("specialty_overwatch")) {
        player.radarshowenemydirection = 1;
    }
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3163
// Size: 0xf5
function uav_updateteamstatus(team, override) {
    radardata = function_ddcbf96c5ef69597(team, override);
    players = level.players;
    if (issharedfuncdefined("game", "getTeamData")) {
        players = [[ getsharedfunc("game", "getTeamData") ]](team, "players");
    }
    foreach (player in players) {
        if (!isdefined(player)) {
            continue;
        }
        if (istrue(player.insidecuavbunker)) {
            continue;
        }
        if (istrue(player.skipuavupdate)) {
            continue;
        }
        if (istrue(player.var_8fee5ee1de16c41f)) {
            continue;
        }
        function_13b8682b55619852(player, radardata);
    }
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x3260
// Size: 0xb4
function function_1cd3cd7ad2b1a683(team, override) {
    teamplayers = level.players;
    if (issharedfuncdefined("game", "getTeamData")) {
        teamplayers = [[ getsharedfunc("game", "getTeamData") ]](team, "players");
    }
    foreach (player in teamplayers) {
        player.hasradar = 0;
        player setclientomnvar("ui_radar_blocked", 1);
    }
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x331c
// Size: 0xb4
function function_96d4526d5886ee74(team, override) {
    teamplayers = level.players;
    if (issharedfuncdefined("game", "getTeamData")) {
        teamplayers = [[ getsharedfunc("game", "getTeamData") ]](team, "players");
    }
    foreach (player in teamplayers) {
        player.hasradar = 1;
        player setclientomnvar("ui_radar_blocked", 0);
    }
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33d8
// Size: 0x13
function function_b9f0ee21053d4057(data) {
    thread uav_destroy();
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33f3
// Size: 0xb
function function_669abde8621d826e(data) {
    
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3406
// Size: 0x2b8
function function_f9caa46aa98b7c6b() {
    foreach (player in level.players) {
        if (istrue(player.insidecuavbunker)) {
            continue;
        }
        radarstrength = level.activeuavs[player.guid + "_radarStrength"];
        var_9983d3aba5d16152 = level.totalactivecounteruavs - level.activecounteruavs[player.guid];
        /#
            if (istrue(player.var_f39d717b31ec5af9)) {
                var_9983d3aba5d16152 = 1;
            }
        #/
        if (var_9983d3aba5d16152 > 0) {
            radarstrength = level.uavworstid;
        }
        radarstrength = int(max(min(radarstrength, level.uavbestid), level.uavworstid));
        player.radarstrength = radarstrength;
        teamhidden = player.team == "spectator" || player.team == "codcaster" || player.team == "free";
        if (radarstrength <= level.uavnoneid || teamhidden) {
            player.hasradar = 0;
            player.radarshowenemydirection = 0;
            player setclientomnvar("ui_radar_blocked", !istrue(player.hasradar));
            if (isdefined(player.radarmode) && player.radarmode == "constant_radar" && player.radarstrength != 1) {
                player.radarmode = "normal_radar";
            }
            continue;
        }
        if (radarstrength >= level.uavfastsweepid) {
            player.radarmode = "fast_radar";
        } else if (radarstrength == 1) {
            player.radarmode = "constant_radar";
        } else {
            player.radarmode = "normal_radar";
        }
        player.radarshowenemydirection = radarstrength >= level.uavdirectionalid;
        if (istrue(player.radarshowenemydirection)) {
            player.radarmode = "constant_radar";
        }
        player.hasradar = 1;
        player setclientomnvar("ui_radar_blocked", !istrue(player.hasradar));
        if (player player_hasperk("specialty_overwatch") || player player_hasperk("specialty_pc_comms")) {
            player.radarshowenemydirection = 1;
        }
    }
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36c6
// Size: 0x63
function function_f53de0e99cb013e8() {
    level endon("game_ended");
    self endon("death");
    self endon("explode");
    while (true) {
        player, missile, locktarget = level waittill("stinger_fired");
        if (!isdefined(locktarget) || locktarget != self) {
            continue;
        }
        missile thread function_247294e52128e3e7(locktarget, player);
    }
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3731
// Size: 0x6f
function uav_trackvelocity() {
    level endon("game_ended");
    self endon("death");
    self endon("explode");
    self.velocity = (0, 0, 0);
    while (true) {
        self.lastorigin = self.origin;
        wait 0.05;
        self.velocity = (self.origin - self.lastorigin) / 0.05;
    }
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37a8
// Size: 0x4b
function function_e58c525d5d3a7482() {
    self endon("death");
    self endon("explode");
    self.owner endon("uav_finished");
    level waittill("game_ended");
    self.recordedgameendstats = 1;
    self.owner scripts\cp_mp\utility\killstreak_utility::recordkillstreakendstats(self.streakinfo);
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37fb
// Size: 0xb8
function function_225e3594843d2ac(uavtype, lifetimeOverride, owner) {
    duration = level.uavsettings[uavtype].timeout;
    /#
        var_2a98d1683cf44153 = getdvarint(@"hash_2c01d701bac5d9d3", 0);
        if (var_2a98d1683cf44153) {
            duration = 9999;
        }
    #/
    if (isdefined(lifetimeOverride)) {
        duration = lifetimeOverride;
    } else if (isdefined(owner) && owner namespace_53fc9ddbb516e6e1::function_87072b42853a9c58("specialty_uav_buff")) {
        duration *= ter_op(isdefined(level.var_1408c77a4f773854), level.var_1408c77a4f773854, 1);
    }
    self endon("death");
    self endon("explode");
    wait duration;
    self notify("timeout");
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38bb
// Size: 0xef
function function_247294e52128e3e7(targetent, player) {
    self endon("death");
    mindist = distance(self.origin, targetent getpointinbounds(0, 0, 0));
    lastcenter = targetent getpointinbounds(0, 0, 0);
    while (true) {
        if (!isdefined(targetent)) {
            center = lastcenter;
        } else {
            center = targetent getpointinbounds(0, 0, 0);
        }
        lastcenter = center;
        curdist = distance(self.origin, center);
        if (curdist < mindist) {
            mindist = curdist;
        }
        if (curdist > mindist) {
            if (curdist > 1536) {
                return;
            }
            radiusdamage(self.origin, 1536, 600, 600, player, "MOD_EXPLOSIVE", "iw9_la_gromeo_mp");
            self hide();
            self notify("deleted");
            waitframe();
            self delete();
            player notify("killstreak_destroyed");
        }
        waitframe();
    }
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39b2
// Size: 0x1e6
function function_a4d3120487c90203() {
    level.totalactiveuavs++;
    if (level.teambased) {
        level.activeuavs[self.team]++;
        if (function_456cd43a5602eaab()) {
            level.var_48c4edf71e075321[self.team]++;
            self.var_90a35439909226ce = 1;
        }
        if (self.uavtype == "directional_uav") {
            level.activeadvanceduavs[self.team]++;
            level.activeadvanceduavcount++;
        }
        return;
    }
    level.activeuavs[self.owner.guid]++;
    level.activeuavs[self.owner.guid + "_radarStrength"]++;
    if (function_456cd43a5602eaab()) {
        level.var_48c4edf71e075321[self.owner.guid] = default_to(level.var_48c4edf71e075321[self.owner.guid], 0) + 1;
        self.var_90a35439909226ce = 1;
    }
    if (self.uavtype == "directional_uav") {
        level.activeuavs[self.owner.guid + "_radarStrength"] = level.activeuavs[self.owner.guid + "_radarStrength"] + 2;
        if (!isdefined(level.activeadvanceduavs[self.owner.guid])) {
            level.activeadvanceduavs[self.owner.guid] = 0;
        }
        level.activeadvanceduavs[self.owner.guid]++;
        level.activeadvanceduavcount++;
    }
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ba0
// Size: 0xb9
function function_24d8b56676d4d3d1() {
    if (level.teambased) {
        if (!isdefined(level.activecounteruavs[self.team])) {
            level.activecounteruavs[self.team] = 0;
        }
        level.activecounteruavs[self.team]++;
    } else {
        if (!isdefined(level.activecounteruavs[self.owner.guid])) {
            level.activecounteruavs[self.owner.guid] = 0;
        }
        level.activecounteruavs[self.owner.guid]++;
    }
    level.totalactivecounteruavs++;
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c61
// Size: 0x188
function uav_removeactiveuav() {
    if (level.teambased) {
        level.activeuavs[self.team]--;
        level.totalactiveuavs--;
        if (istrue(self.var_90a35439909226ce)) {
            level.var_48c4edf71e075321[self.team]--;
        }
        if (self.uavtype == "directional_uav") {
            level.activeadvanceduavs[self.team]--;
            level.activeadvanceduavcount--;
        }
        return;
    }
    if (isdefined(self.owner)) {
        level.activeuavs[self.owner.guid]--;
        level.totalactiveuavs--;
        level.activeuavs[self.owner.guid + "_radarStrength"]--;
        if (istrue(self.var_90a35439909226ce)) {
            level.var_48c4edf71e075321[self.owner.guid]--;
        }
        if (self.uavtype == "directional_uav") {
            level.activeuavs[self.owner.guid + "_radarStrength"] = level.activeuavs[self.owner.guid + "_radarStrength"] - 2;
            level.activeadvanceduavs[self.owner.guid]--;
            level.activeadvanceduavcount--;
        }
    }
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3df1
// Size: 0x5a
function uav_removeactivecounteruav() {
    if (level.teambased) {
        level.activecounteruavs[self.team]--;
    } else if (isdefined(self.owner)) {
        level.activecounteruavs[self.owner.guid]--;
    }
    level.totalactivecounteruavs--;
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e53
// Size: 0x65
function function_456cd43a5602eaab() {
    if (scripts\cp_mp\utility\game_utility::isbrstylegametype() && isdefined(self.owner) && isplayer(self.owner)) {
        if (issharedfuncdefined("perk", "hasPerk")) {
            if (self.owner [[ getsharedfunc("perk", "hasPerk") ]]("specialty_overwatch")) {
                return true;
            }
        }
    }
    return false;
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ec1
// Size: 0x1cb
function function_972967e0c0a0fa8(uavtype, launchorigin) {
    uavrig = undefined;
    if (!islargemap()) {
        foreach (rig in level.uavrigs) {
            if (uavtype == rig.uavtype) {
                uavrig = rig;
                break;
            }
        }
    } else if (isdefined(level.uavrigs) && level.uavrigs.size >= 30) {
        return undefined;
    }
    if (!isdefined(uavrig)) {
        uavrig = spawn("script_model", launchorigin);
        uavrig setmodel("tag_origin");
        uavrig.angles = (0, 115, 0);
        uavrig.uavtype = uavtype;
        uavrig hide();
        bundle = level.streakglobals.streakbundles[uavtype];
        rotatetime = default_to(bundle.var_d61b6a0bbde40dce, 70);
        switch (uavtype) {
        case #"hash_10e585c25e7e9f60": 
            rotatetime = default_to(bundle.var_903eeb7b9aee843b, 125);
            break;
        case #"hash_e171e5b86ef0a4cc": 
            rotatetime = 200;
            break;
        case #"hash_7038dec66d8275be": 
            break;
        }
        level.uavrigs[level.uavrigs.size] = uavrig;
        uavrig thread uav_rotaterig(rotatetime);
        if (islargemap()) {
            uavrig thread function_f30469aca36707f(self);
        } else {
            uavrig thread function_6d00913d6f8c862e();
        }
    }
    return uavrig;
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4095
// Size: 0x27
function uav_rotaterig(rotatetime) {
    self endon("death");
    while (true) {
        self rotateyaw(-360, rotatetime);
        wait rotatetime;
    }
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x40c4
// Size: 0x49
function function_f30469aca36707f(ent) {
    self endon("death");
    ent waittill_any_3("leaving", "explode", "death");
    level.uavrigs = array_remove(level.uavrigs, self);
    self delete();
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4115
// Size: 0x31
function function_6d00913d6f8c862e() {
    self endon("death");
    level waittill("game_ended");
    level.uavrigs = array_remove(level.uavrigs, self);
    self delete();
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x414e
// Size: 0x1c3
function function_f54b6539dc6a4a1c() {
    self.owner endon("disconnect");
    self endon("uav_deleteObjective");
    self endon("death");
    switch (self.uavtype) {
    case #"hash_634b246c3da5c56f": 
        enemyicon = "hud_icon_minimap_killstreak_uav";
        break;
    case #"hash_10e585c25e7e9f60": 
        enemyicon = "hud_icon_minimap_killstreak_cuav";
        break;
    case #"hash_e171e5b86ef0a4cc": 
        enemyicon = "hud_icon_minimap_killstreak_auav";
        break;
    default: 
        enemyicon = "hud_icon_minimap_killstreak_uav";
        break;
    }
    createfunc = undefined;
    if (scripts\engine\utility::issharedfuncdefined("game", "createObjective")) {
        createfunc = scripts\engine\utility::getsharedfunc("game", "createObjectiveEngineer");
    }
    if (isdefined(createfunc)) {
        self.enemyobjid = self [[ createfunc ]](enemyicon, 1, 1);
    }
    var_67c48e4d4e56afec = 0;
    while (true) {
        playercount = level.players.size;
        for (i = 0; i < 10; i++) {
            if (var_67c48e4d4e56afec >= level.players.size) {
                var_67c48e4d4e56afec = 0;
            }
            player = level.players[var_67c48e4d4e56afec];
            var_67c48e4d4e56afec++;
            if (!isdefined(player)) {
                continue;
            }
            if (self.enemyobjid != -1) {
                if (issharedfuncdefined("perk", "hasPerk")) {
                    if (player [[ getsharedfunc("perk", "hasPerk") ]]("specialty_engineer") && istrue(scripts\cp_mp\utility\player_utility::playersareenemies(player, self.owner))) {
                        scripts\mp\objidpoolmanager::objective_playermask_addshowplayer(self.enemyobjid, player);
                        continue;
                    }
                    scripts\mp\objidpoolmanager::objective_playermask_hidefrom(self.enemyobjid, player);
                }
            }
        }
        waitframe();
    }
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4319
// Size: 0x159
function function_172c4412dde1696(reveal) {
    assertex(isdefined(reveal), "Missing bool to toggle minimap in revealMiniMapForAll()");
    index = undefined;
    if (level.teambased) {
        index = self.team;
    } else {
        index = self.owner.guid;
    }
    foreach (player in level.players) {
        if (isai(player)) {
            continue;
        }
        if (level.teambased && self.team != player.team) {
            continue;
        }
        if (!level.teambased && self.owner != player) {
            continue;
        }
        if (!player _isalive()) {
            continue;
        }
        if (istrue(reveal)) {
            if (issharedfuncdefined("player", "showMiniMap")) {
                player [[ getsharedfunc("player", "showMiniMap") ]]();
            }
            continue;
        }
        if (issharedfuncdefined("player", "hideMiniMap")) {
            player [[ getsharedfunc("player", "hideMiniMap") ]]();
        }
    }
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x447a
// Size: 0xd7
function function_e9a20f47c6b49bd7() {
    self.owner endon("disconnect");
    self endon("death");
    self endon("explode");
    level endon("game_ended");
    if (istrue(level.istacops)) {
        return;
    }
    while (true) {
        player = level waittill("player_spawned");
        if (isai(player)) {
            continue;
        }
        if (level.teambased && self.team != player.team) {
            continue;
        }
        if (!level.teambased && self.owner != player) {
            continue;
        }
        if (issharedfuncdefined("player", "showMiniMap")) {
            player [[ getsharedfunc("player", "showMiniMap") ]]();
        }
        player.showuavminimaponspawn = 1;
    }
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4559
// Size: 0x1ed
function function_c11936b9c6c3a076(player, waittime) {
    if (isdefined(waittime)) {
        wait waittime;
    }
    forceradarstrength = getdvarint(@"hash_f16ba8db72f34fc3");
    radartype = "normal_radar";
    activeuav = 1;
    activeadvanceduavs = 0;
    switch (forceradarstrength) {
    case 1: 
        radartype = "constant_radar";
        break;
    case 3: 
        radartype = "normal_radar";
        break;
    case 5: 
        radartype = "fast_radar";
        activeuav = 2;
        break;
    case 6: 
        radartype = "constant_radar";
        activeadvanceduavs = 1;
        break;
    default: 
        break;
    }
    if (level.teambased) {
        foreach (entry in level.teamnamelist) {
            level.radarmode[entry] = radartype;
            level.activeuavs[entry] = activeuav;
            level.activeadvanceduavs[entry] = activeadvanceduavs;
            level.activeadvanceduavcount = level.teamnamelist.size;
            function_484d86ce003c2526(entry, forceradarstrength);
        }
        return;
    }
    activeuav = forceradarstrength;
    level.radarmode[player.guid] = radartype;
    player.radarstrength = activeuav;
    level.activeuavs[player.guid + "_radarStrength"] = activeuav;
    level.activeadvanceduavs[player.guid] = activeadvanceduavs;
    level.activeadvanceduavcount = level.teamnamelist.size;
    function_f9caa46aa98b7c6b();
}

// Namespace uav / scripts\cp_mp\killstreaks\uav
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x474e
// Size: 0x7d
function function_6394127938ed8257(sweeptime) {
    level endon("game_ended");
    while (true) {
        if (isdefined(level.players)) {
            foreach (player in level.players) {
                triggeroneoffradarsweep(player);
            }
        }
        wait sweeptime;
    }
}

/#

    // Namespace uav / scripts\cp_mp\killstreaks\uav
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x47d3
    // Size: 0x24e
    function function_6467f4a6c5a005d4() {
        self endon("<dev string:x5c>");
        while (true) {
            print3d(self.origin, "<dev string:x62>", (1, 0, 0));
            print3d(self.origin, "<dev string:x66>" + self.origin[0] + "<dev string:x73>" + self.origin[1] + "<dev string:x73>" + self.origin[2], (1, 0, 0));
            print3d(level.uavrig.origin, "<dev string:x76>", (1, 0, 0));
            print3d(level.uavrig.origin, "<dev string:x7e>" + level.uavrig.origin[0] + "<dev string:x73>" + level.uavrig.origin[1] + "<dev string:x73>" + level.uavrig.origin[2], (1, 0, 0));
            print3d(level.uavrig.origin - (0, 0, 50), "<dev string:x8f>" + distance(level.uavrig.origin, self.origin), (1, 0, 0));
            line(level.uavrig.origin, self.origin, (0, 0, 1));
            anglesforward = anglestoforward(level.players[0].angles);
            scalar = (anglesforward[0] * 200, anglesforward[1] * 200, anglesforward[2]);
            print3d(level.players[0].origin + scalar, "<dev string:x8f>" + distance(level.players[0].origin, self.origin), (1, 0, 0));
            waitframe();
        }
    }

    // Namespace uav / scripts\cp_mp\killstreaks\uav
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x4a29
    // Size: 0x6f
    function function_e6d0ffaec6506528() {
        self endon("<dev string:x5c>");
        while (true) {
            result = scripts\engine\trace::_bullet_trace(level.players[0].origin, self.origin, 0, undefined);
            if (isdefined(result) && isdefined(result["<dev string:x9a>"])) {
                println("<dev string:xa6>" + result["<dev string:x9a>"]);
            }
            wait 1;
        }
    }

#/
