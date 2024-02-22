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

// Namespace plane/namespace_fe31ea32aded85e4
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

// Namespace plane/namespace_fe31ea32aded85e4
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x280
// Size: 0x122
function getflightpath(var_6e7c70b904418daa, var_cebe2632e00d0e2d, planehalfdistance, var_31a3ffce4c03ab3b, planeflyheight, var_23122e7b902f2ea9, var_3d05b2dd8e6fd146, streakname) {
    startpoint = var_6e7c70b904418daa + var_cebe2632e00d0e2d * -1 * planehalfdistance;
    endpoint = var_6e7c70b904418daa + var_cebe2632e00d0e2d * planehalfdistance;
    if (var_31a3ffce4c03ab3b) {
        startpoint = startpoint * (1, 1, 0);
        endpoint = endpoint * (1, 1, 0);
    }
    startpoint = startpoint + (0, 0, planeflyheight);
    endpoint = endpoint + (0, 0, planeflyheight);
    d = length(startpoint - endpoint);
    flytime = d / var_23122e7b902f2ea9;
    d = abs(0.5 * d + var_3d05b2dd8e6fd146);
    attacktime = d / var_23122e7b902f2ea9;
    /#
        assert(flytime > attacktime);
    #/
    flightpath["startPoint"] = startpoint;
    flightpath["endPoint"] = endpoint;
    flightpath["attackTime"] = attacktime;
    flightpath["flyTime"] = flytime;
    return flightpath;
}

// Namespace plane/namespace_fe31ea32aded85e4
// Params 9, eflags: 0x0
// Checksum 0x0, Offset: 0x3aa
// Size: 0xb6
function doflyby(lifeid, owner, requireddeathcount, startpoint, endpoint, attacktime, flytime, var_cebe2632e00d0e2d, streakname) {
    plane = planespawn(lifeid, owner, startpoint, var_cebe2632e00d0e2d, streakname);
    plane endon("death");
    var_b81987c3aca12361 = 150;
    pathend = endpoint + ((randomfloat(2) - 1) * var_b81987c3aca12361, (randomfloat(2) - 1) * var_b81987c3aca12361, 0);
    plane planemove(pathend, flytime, attacktime, streakname);
    plane planecleanup();
}

// Namespace plane/namespace_fe31ea32aded85e4
// Params 5, eflags: 0x0
// Checksum 0x0, Offset: 0x467
// Size: 0x18f
function planespawn(lifeid, owner, startpoint, var_cebe2632e00d0e2d, streakname) {
    if (!isdefined(owner)) {
        return;
    }
    var_a1f40e475badbbdc = 100;
    pathstart = startpoint + ((randomfloat(2) - 1) * var_a1f40e475badbbdc, (randomfloat(2) - 1) * var_a1f40e475badbbdc, 0);
    var_6c46b9c8f713361b = level.planeconfigs[streakname];
    plane = undefined;
    plane = spawn("script_model", pathstart);
    plane.team = owner.team;
    plane.origin = pathstart;
    plane.angles = vectortoangles(var_cebe2632e00d0e2d);
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

// Namespace plane/namespace_fe31ea32aded85e4
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x5fe
// Size: 0xf3
function planemove(destination, flytime, attacktime, streakname) {
    var_6c46b9c8f713361b = level.planeconfigs[streakname];
    self moveto(destination, flytime, 0, 0);
    if (isdefined(var_6c46b9c8f713361b.onattackdelegate)) {
        self thread [[ var_6c46b9c8f713361b.onattackdelegate ]](destination, flytime, attacktime, self.owner, streakname);
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

// Namespace plane/namespace_fe31ea32aded85e4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6f8
// Size: 0xb2
function planecleanup() {
    var_6c46b9c8f713361b = level.planeconfigs[self.streakname];
    if (isdefined(var_6c46b9c8f713361b.onflybycompletedelegate)) {
        thread [[ var_6c46b9c8f713361b.onflybycompletedelegate ]](self.owner, self, self.streakname);
    }
    if (isdefined(self.friendlyteamid)) {
        namespace_5a22b6f3a56f7e9b::returnobjectiveid(self.friendlyteamid);
        namespace_5a22b6f3a56f7e9b::returnobjectiveid(self.enemyteamid);
    }
    if (isdefined(self.killcament)) {
        self.killcament delete();
    }
    stoptrackingplane(self);
    self notify("delete");
    self delete();
}

// Namespace plane/namespace_fe31ea32aded85e4
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

// Namespace plane/namespace_fe31ea32aded85e4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x80e
// Size: 0x25
function handledamage() {
    self endon("end_remote");
    namespace_3e725f3cc58bddd3::monitordamage(800, "helicopter", &handledeathdamage, &modifydamage, 1);
}

// Namespace plane/namespace_fe31ea32aded85e4
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
    modifieddamage = namespace_3e725f3cc58bddd3::handlemissiledamage(objweapon, type, modifieddamage);
    modifieddamage = namespace_3e725f3cc58bddd3::handleapdamage(objweapon, type, modifieddamage, attacker);
    return modifieddamage;
}

// Namespace plane/namespace_fe31ea32aded85e4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8e0
// Size: 0xb7
function handledeathdamage(data) {
    attacker = data.attacker;
    objweapon = data.objweapon;
    type = data.meansofdeath;
    damage = data.damage;
    config = level.planeconfigs[self.streakname];
    namespace_3e725f3cc58bddd3::onkillstreakkilled(self.streakname, attacker, objweapon, type, damage, config.scorepopup, config.destroyedvo, config.callout);
}

// Namespace plane/namespace_fe31ea32aded85e4
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

// Namespace plane/namespace_fe31ea32aded85e4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa51
// Size: 0x49
function getplaneflyheight() {
    var_5fa1e1697a302583 = namespace_9abe40d2af041eb2::getkillstreakairstrikeheightent();
    if (isdefined(var_5fa1e1697a302583)) {
        return var_5fa1e1697a302583.origin[2];
    } else {
        /#
            println("<unknown string>");
        #/
        planeflyheight = 950;
        return planeflyheight;
    }
}

// Namespace plane/namespace_fe31ea32aded85e4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xaa1
// Size: 0x121
function getplaneflightplan(distfromplayer) {
    result = spawnstruct();
    result.height = getplaneflyheight();
    var_5fa1e1697a302583 = namespace_9abe40d2af041eb2::getkillstreakairstrikeheightent();
    if (isdefined(var_5fa1e1697a302583) && isdefined(var_5fa1e1697a302583.script_noteworthy) && var_5fa1e1697a302583.script_noteworthy == "fixedposition") {
        result.targetpos = var_5fa1e1697a302583.origin;
        result.flightdir = anglestoforward(var_5fa1e1697a302583.angles);
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

// Namespace plane/namespace_fe31ea32aded85e4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xbca
// Size: 0x45
function getexplodedistance(height) {
    var_e5dc9ecdad877027 = 850;
    var_17bca7ab954cc95f = 1500;
    var_3369989e4aab456a = var_e5dc9ecdad877027 / height;
    var_1003b817e555135a = var_3369989e4aab456a * var_17bca7ab954cc95f;
    return var_1003b817e555135a;
}

// Namespace plane/namespace_fe31ea32aded85e4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc17
// Size: 0x2a
function starttrackingplane(obj) {
    entnum = obj getentitynumber();
    level.planes[entnum] = obj;
}

// Namespace plane/namespace_fe31ea32aded85e4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc48
// Size: 0x28
function stoptrackingplane(obj) {
    entnum = obj getentitynumber();
    level.planes[entnum] = undefined;
}

// Namespace plane/namespace_fe31ea32aded85e4
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
    directionyaw = location = self waittill("confirm_location");
    if (!config.choosedirection) {
        directionyaw = randomint(360);
    }
    self setblurforplayer(0, 0.3);
    if (isdefined(config.inboundvo)) {
        self playlocalsound(game["voice"][self.team] + config.inboundvo);
    }
    self thread [[ var_9dd357e6fee9854e ]](lifeid, location, directionyaw, streakname);
    return 1;
}

// Namespace plane/namespace_fe31ea32aded85e4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xdb6
// Size: 0x11b
function setobjectiveicons(friendlyicon, var_30f120a1efc1dcbe) {
    friendlyteamid = namespace_5a22b6f3a56f7e9b::requestobjectiveid(1);
    if (friendlyteamid != -1) {
        namespace_5a22b6f3a56f7e9b::objective_add_objective(friendlyteamid, "active", (0, 0, 0), friendlyicon);
        namespace_5a22b6f3a56f7e9b::update_objective_onentitywithrotation(friendlyteamid, self);
    }
    self.friendlyteamid = friendlyteamid;
    enemyteamid = namespace_5a22b6f3a56f7e9b::requestobjectiveid(1);
    if (enemyteamid != -1) {
        namespace_5a22b6f3a56f7e9b::objective_add_objective(enemyteamid, "active", (0, 0, 0), var_30f120a1efc1dcbe);
        namespace_5a22b6f3a56f7e9b::update_objective_onentitywithrotation(enemyteamid, self);
    }
    self.enemyteamid = enemyteamid;
    if (level.teambased) {
        if (friendlyteamid != -1) {
            namespace_5a22b6f3a56f7e9b::objective_teammask_single(friendlyteamid, self.team);
        }
        if (enemyteamid != -1) {
            namespace_5a22b6f3a56f7e9b::objective_teammask_single(enemyteamid, getotherteam(self.team)[0]);
        }
    } else {
        if (friendlyteamid != -1) {
            namespace_5a22b6f3a56f7e9b::objective_mask_showtoplayerteam(friendlyteamid, self.owner);
        }
        if (enemyteamid != -1) {
            namespace_5a22b6f3a56f7e9b::objective_mask_showtoplayerteam(enemyteamid, self.owner);
        }
    }
}

// Namespace plane/namespace_fe31ea32aded85e4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xed8
// Size: 0x25
function playsonicboom(var_cb3339ece72dbdeb, delay) {
    self endon("death");
    wait(delay);
    self playsoundonmovingent(var_cb3339ece72dbdeb);
}

// Namespace plane/namespace_fe31ea32aded85e4
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

