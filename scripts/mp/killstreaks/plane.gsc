// mwiii decomp prototype
#using scripts\mp\hud_util.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\damage.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;

#namespace plane;

// Namespace plane / scripts/mp/killstreaks/plane
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e9
// Size: 0x90
function init() {
    if (!isdefined(level.planes)) {
        level.planes = [];
    }
    if (!isdefined(level.planeconfigs)) {
        level.planeconfigs = [];
    }
    level.fighter_deathfx = loadfx("vfx/iw7/_requests/mp/vfx_debug_warning.vfx");
    level.fx_airstrike_afterburner = loadfx("vfx/iw7/_requests/mp/vfx_debug_warning.vfx");
    level.fx_airstrike_contrail = loadfx("vfx/iw7/_requests/mp/vfx_debug_warning.vfx");
    level.fx_airstrike_wingtip_light_green = loadfx("vfx/iw7/_requests/mp/vfx_debug_warning.vfx");
    level.fx_airstrike_wingtip_light_red = loadfx("vfx/iw7/_requests/mp/vfx_debug_warning.vfx");
}

// Namespace plane / scripts/mp/killstreaks/plane
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x280
// Size: 0x122
function getflightpath(coord, directionvector, planehalfdistance, absoluteheight, planeflyheight, planeflyspeed, attackdistance, streakname) {
    startpoint = coord + directionvector * -1 * planehalfdistance;
    endpoint = coord + directionvector * planehalfdistance;
    if (absoluteheight) {
        startpoint = startpoint * (1, 1, 0);
        endpoint = endpoint * (1, 1, 0);
    }
    startpoint = startpoint + (0, 0, planeflyheight);
    endpoint = endpoint + (0, 0, planeflyheight);
    d = length(startpoint - endpoint);
    flytime = d / planeflyspeed;
    d = abs(0.5 * d + attackdistance);
    attackTime = d / planeflyspeed;
    /#
        assert(flytime > attackTime);
    #/
    flightpath["startPoint"] = startpoint;
    flightpath["endPoint"] = endpoint;
    flightpath["attackTime"] = attackTime;
    flightpath["flyTime"] = flytime;
    return flightpath;
}

// Namespace plane / scripts/mp/killstreaks/plane
// Params 9, eflags: 0x0
// Checksum 0x0, Offset: 0x3aa
// Size: 0xb6
function doflyby(lifeid, owner, requireddeathcount, startpoint, endpoint, attackTime, flytime, directionvector, streakname) {
    plane = planespawn(lifeid, owner, startpoint, directionvector, streakname);
    plane endon("death");
    endpathrandomness = 150;
    pathend = endpoint + ((randomfloat(2) - 1) * endpathrandomness, (randomfloat(2) - 1) * endpathrandomness, 0);
    plane planemove(pathend, flytime, attackTime, streakname);
    plane planecleanup();
}

// Namespace plane / scripts/mp/killstreaks/plane
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x467
// Size: 0x18f
function planespawn(lifeid, owner, startpoint, directionvector, streakname) {
    if (!isdefined(owner)) {
        return;
    }
    startpathrandomness = 100;
    pathstart = startpoint + ((randomfloat(2) - 1) * startpathrandomness, (randomfloat(2) - 1) * startpathrandomness, 0);
    var_6c46b9c8f713361b = level.planeconfigs[streakname];
    plane = undefined;
    plane = spawn("script_model", pathstart);
    plane.team = owner.team;
    plane.origin = pathstart;
    plane.angles = vectortoangles(directionvector);
    plane.lifeid = lifeid;
    plane.streakname = streakname;
    plane.owner = owner;
    plane setmodel(var_6c46b9c8f713361b.modelnames[owner.team]);
    if (isdefined(var_6c46b9c8f713361b.compassiconfriendly)) {
        plane setobjectiveicons(var_6c46b9c8f713361b.compassiconfriendly, var_6c46b9c8f713361b.compassiconenemy);
    }
    plane thread handledamage();
    plane thread handledeath();
    starttrackingplane(plane);
    if (!isdefined(var_6c46b9c8f713361b.nolightfx)) {
        plane thread playplanefx();
    }
    plane playloopsound(var_6c46b9c8f713361b.inboundsfx);
    plane createkillcam(streakname);
    return plane;
}

// Namespace plane / scripts/mp/killstreaks/plane
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x5fe
// Size: 0xf3
function planemove(destination, flytime, attackTime, streakname) {
    var_6c46b9c8f713361b = level.planeconfigs[streakname];
    self moveto(destination, flytime, 0, 0);
    if (isdefined(var_6c46b9c8f713361b.onattackdelegate)) {
        self thread [[ var_6c46b9c8f713361b.onattackdelegate ]](destination, flytime, attackTime, self.owner, streakname);
    }
    if (isdefined(var_6c46b9c8f713361b.sonicboomsfx)) {
        thread playsonicboom(var_6c46b9c8f713361b.sonicboomsfx, 0.5 * flytime);
    }
    wait(0.65 * flytime);
    if (isdefined(var_6c46b9c8f713361b.outboundsfx)) {
        self stoploopsound();
        self playloopsound(var_6c46b9c8f713361b.outboundsfx);
    }
    if (isdefined(var_6c46b9c8f713361b.outboundflightanim)) {
        self scriptmodelplayanimdeltamotion(var_6c46b9c8f713361b.outboundflightanim);
    }
    wait(0.35 * flytime);
}

// Namespace plane / scripts/mp/killstreaks/plane
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6f8
// Size: 0xb2
function planecleanup() {
    var_6c46b9c8f713361b = level.planeconfigs[self.streakname];
    if (isdefined(var_6c46b9c8f713361b.onflybycompletedelegate)) {
        thread [[ var_6c46b9c8f713361b.onflybycompletedelegate ]](self.owner, self, self.streakname);
    }
    if (isdefined(self.friendlyteamid)) {
        scripts/mp/objidpoolmanager::returnobjectiveid(self.friendlyteamid);
        scripts/mp/objidpoolmanager::returnobjectiveid(self.enemyteamid);
    }
    if (isdefined(self.killcament)) {
        self.killcament delete();
    }
    stoptrackingplane(self);
    self notify("delete");
    self delete();
}

// Namespace plane / scripts/mp/killstreaks/plane
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7b1
// Size: 0x56
function handledeath() {
    level endon("game_ended");
    self endon("delete");
    self waittill("death");
    forward = anglestoforward(self.angles) * 200;
    playfx(level.fighter_deathfx, self.origin, forward);
    thread planecleanup();
}

// Namespace plane / scripts/mp/killstreaks/plane
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x80e
// Size: 0x25
function handledamage() {
    self endon("end_remote");
    scripts/mp/damage::monitordamage(800, "helicopter", &handledeathdamage, &modifydamage, 1);
}

// Namespace plane / scripts/mp/killstreaks/plane
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x83a
// Size: 0x9e
function modifydamage(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    idflags = data.idflags;
    modifieddamage = damage;
    modifieddamage = scripts/mp/damage::handlemissiledamage(objweapon, type, modifieddamage);
    modifieddamage = scripts/mp/damage::handleapdamage(objweapon, type, modifieddamage, attacker);
    return modifieddamage;
}

// Namespace plane / scripts/mp/killstreaks/plane
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8e0
// Size: 0xb7
function handledeathdamage(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    config = level.planeconfigs[self.streakname];
    scripts/mp/damage::onkillstreakkilled(self.streakname, attacker, objweapon, type, damage, config.scorepopup, config.destroyedvo, config.callout);
}

// Namespace plane / scripts/mp/killstreaks/plane
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x99e
// Size: 0xac
function playplanefx() {
    self endon("death");
    wait(0.5);
    playfxontag(level.fx_airstrike_afterburner, self, "tag_engine_right");
    wait(0.5);
    playfxontag(level.fx_airstrike_afterburner, self, "tag_engine_left");
    wait(0.5);
    playfxontag(level.fx_airstrike_contrail, self, "tag_right_wingtip");
    wait(0.5);
    playfxontag(level.fx_airstrike_contrail, self, "tag_left_wingtip");
    wait(0.5);
    playfxontag(level.fx_airstrike_wingtip_light_red, self, "tag_right_wingtip");
    wait(0.5);
    playfxontag(level.fx_airstrike_wingtip_light_green, self, "tag_left_wingtip");
}

// Namespace plane / scripts/mp/killstreaks/plane
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa51
// Size: 0x49
function getplaneflyheight() {
    heightent = scripts/cp_mp/utility/killstreak_utility::getkillstreakairstrikeheightent();
    if (isdefined(heightent)) {
        return heightent.origin[2];
    }
    /#
        println("<unknown string>");
    #/
    planeflyheight = 950;
    return planeflyheight;
}

// Namespace plane / scripts/mp/killstreaks/plane
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaa1
// Size: 0x121
function getplaneflightplan(distfromplayer) {
    result = spawnstruct();
    result.height = getplaneflyheight();
    heightent = scripts/cp_mp/utility/killstreak_utility::getkillstreakairstrikeheightent();
    if (isdefined(heightent) && isdefined(heightent.script_noteworthy) && heightent.script_noteworthy == "fixedposition") {
        result.targetpos = heightent.origin;
        result.flightdir = anglestoforward(heightent.angles);
        if (randomint(2) == 0) {
            result.flightdir = result.flightdir * -1;
        }
    } else {
        forwardvec = anglestoforward(self.angles);
        rightvec = anglestoright(self.angles);
        result.targetpos = self.origin + distfromplayer * forwardvec;
        result.flightdir = -1 * rightvec;
    }
    return result;
}

// Namespace plane / scripts/mp/killstreaks/plane
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbca
// Size: 0x45
function getexplodedistance(height) {
    standardheight = 850;
    standarddistance = 1500;
    distancefrac = standardheight / height;
    newdistance = distancefrac * standarddistance;
    return newdistance;
}

// Namespace plane / scripts/mp/killstreaks/plane
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc17
// Size: 0x2a
function starttrackingplane(obj) {
    entnum = obj getentitynumber();
    level.planes[entnum] = obj;
}

// Namespace plane / scripts/mp/killstreaks/plane
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc48
// Size: 0x28
function stoptrackingplane(obj) {
    entnum = obj getentitynumber();
    level.planes[entnum] = undefined;
}

// Namespace plane / scripts/mp/killstreaks/plane
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xc77
// Size: 0x137
function selectairstrikelocation(lifeid, streakname, var_9dd357e6fee9854e) {
    targetsize = level.mapsize / 6.46875;
    if (level.splitscreen) {
        targetsize = targetsize * 1.5;
    }
    config = level.planeconfigs[streakname];
    if (isdefined(config.selectlocationvo)) {
        self playlocalsound(game["voice"][self.team] + config.selectlocationvo);
    }
    _beginlocationselection(streakname, "map_artillery_selector", config.choosedirection, targetsize);
    self endon("stop_location_selection");
    location, directionyaw = self waittill("confirm_location");
    if (!config.choosedirection) {
        directionyaw = randomint(360);
    }
    self setblurforplayer(0, 0.3);
    if (isdefined(config.inboundvo)) {
        self playlocalsound(game["voice"][self.team] + config.inboundvo);
    }
    self thread [[ var_9dd357e6fee9854e ]](lifeid, location, directionyaw, streakname);
    return true;
}

// Namespace plane / scripts/mp/killstreaks/plane
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xdb6
// Size: 0x11b
function setobjectiveicons(friendlyicon, enemyicon) {
    friendlyteamid = scripts/mp/objidpoolmanager::requestobjectiveid(1);
    if (friendlyteamid != -1) {
        scripts/mp/objidpoolmanager::objective_add_objective(friendlyteamid, "active", (0, 0, 0), friendlyicon);
        scripts/mp/objidpoolmanager::update_objective_onentitywithrotation(friendlyteamid, self);
    }
    self.friendlyteamid = friendlyteamid;
    enemyteamid = scripts/mp/objidpoolmanager::requestobjectiveid(1);
    if (enemyteamid != -1) {
        scripts/mp/objidpoolmanager::objective_add_objective(enemyteamid, "active", (0, 0, 0), enemyicon);
        scripts/mp/objidpoolmanager::update_objective_onentitywithrotation(enemyteamid, self);
    }
    self.enemyteamid = enemyteamid;
    if (level.teambased) {
        if (friendlyteamid != -1) {
            scripts/mp/objidpoolmanager::objective_teammask_single(friendlyteamid, self.team);
        }
        if (enemyteamid != -1) {
            scripts/mp/objidpoolmanager::objective_teammask_single(enemyteamid, getotherteam(self.team)[0]);
        }
        return;
    }
    if (friendlyteamid != -1) {
        scripts/mp/objidpoolmanager::objective_mask_showtoplayerteam(friendlyteamid, self.owner);
    }
    if (enemyteamid != -1) {
        scripts/mp/objidpoolmanager::objective_mask_showtoplayerteam(enemyteamid, self.owner);
    }
}

// Namespace plane / scripts/mp/killstreaks/plane
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xed8
// Size: 0x25
function playsonicboom(soundname, delay) {
    self endon("death");
    wait(delay);
    self playsoundonmovingent(soundname);
}

// Namespace plane / scripts/mp/killstreaks/plane
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf04
// Size: 0xc7
function createkillcam(streakname) {
    var_6c46b9c8f713361b = level.planeconfigs[streakname];
    if (isdefined(var_6c46b9c8f713361b.killcamoffset)) {
        planedir = anglestoforward(self.angles);
        killcament = spawn("script_model", self.origin + (0, 0, 100) - planedir * 200);
        killcament.starttime = gettime();
        killcament setscriptmoverkillcam("airstrike");
        killcament linkto(self, "tag_origin", var_6c46b9c8f713361b.killcamoffset, (0, 0, 0));
        self.killcament = killcament;
    }
}

