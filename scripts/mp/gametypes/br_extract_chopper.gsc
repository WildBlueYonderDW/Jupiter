// mwiii decomp prototype
#using scripts\mp\utility\print.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\engine\trace.gsc;
#using script_5762ac2f22202ba2;
#using scripts\mp\gametypes\br_extract_chopper.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\killstreaks\flares.gsc;
#using scripts\mp\hostmigration.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\mp\damage.gsc;

#namespace namespace_d8abcde19b9d5e63;

// Namespace namespace_d8abcde19b9d5e63/namespace_3a5b7dd73e67921c
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x33a
// Size: 0x20b
function spawnextractchopper(zone, var_ef9046be372b8ad6, onhelikilled, var_c65d01ec565399b) {
    var_26a6f862062e4340 = zone.origin;
    var_6e7c70b904418daa = var_26a6f862062e4340;
    direction = (0, 0, 0);
    planehalfdistance = 24000;
    var_5fa1e1697a302583 = getent("airstrikeheight", "targetname");
    planeflyheight = var_5fa1e1697a302583.origin[2];
    streakname = "jackal";
    var_beab222529512a99 = level.mapcenter - zone.origin;
    var_beab222529512a99 = (var_beab222529512a99[0], var_beab222529512a99[1], 0);
    var_8bef6f25c0930f60 = vectornormalize(var_beab222529512a99);
    var_f5849136e133a8b = var_8bef6f25c0930f60 * -10000 + (0, 0, 1) * planeflyheight;
    exitpoint = (var_26a6f862062e4340[0], var_26a6f862062e4340[1], planeflyheight);
    streakinfo = fakestreakinfo();
    var_bf2637570246c7bb = spawn("trigger_radius", var_26a6f862062e4340, 0, 90, 128);
    var_bf2637570246c7bb.angles = (0, 0, 0);
    var_bf2637570246c7bb.team = self.team;
    var_bf2637570246c7bb.ownerteam = self.team;
    var_bf2637570246c7bb.visibleteam = "any";
    var_bf2637570246c7bb.offset3d = (0, 0, 16);
    var_bf2637570246c7bb.location = var_26a6f862062e4340;
    bird = namespace_3a5b7dd73e67921c::beginlittlebird(0, var_f5849136e133a8b, exitpoint, streakinfo, var_bf2637570246c7bb, var_ef9046be372b8ad6, self.team, var_c65d01ec565399b);
    bird.onhelikilled = onhelikilled;
    bird.zone = zone;
    return bird;
}

// Namespace namespace_d8abcde19b9d5e63/namespace_3a5b7dd73e67921c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x54d
// Size: 0xd5
function fakestreakinfo() {
    streakinfo = spawnstruct();
    streakinfo.available = 1;
    streakinfo.firednotify = "offhand_fired";
    streakinfo.isgimme = 1;
    streakinfo.kid = 5;
    streakinfo.lifeid = 0;
    streakinfo.madeavailabletime = gettime();
    streakinfo.scriptuseagetype = "gesture_script_weapon";
    streakinfo.streakname = "jackal";
    streakinfo.streaksetupinfo = undefined;
    streakinfo.variantid = -1;
    streakinfo.weaponname = "ks_gesture_generic_mp";
    streakinfo.objweapon = makeweapon(streakinfo.weaponname);
    return streakinfo;
}

// Namespace namespace_d8abcde19b9d5e63/namespace_3a5b7dd73e67921c
// Params 8, eflags: 0x0
// Checksum 0x0, Offset: 0x62a
// Size: 0x232
function beginlittlebird(lifeid, startpoint, endpoint, streakinfo, lz, var_ef9046be372b8ad6, team, var_c65d01ec565399b) {
    marker = undefined;
    if (isdefined(lz)) {
        marker = lz.marker;
        if (!isdefined(marker)) {
            marker = spawnstruct();
            if (isdefined(var_ef9046be372b8ad6)) {
                marker.location = var_ef9046be372b8ad6;
            } else if (isdefined(lz.location)) {
                marker.location = lz.location;
            } else {
                marker.location = lz.trigger.origin;
            }
            marker.angles = (0, 0, 0);
            marker.string = "equip_deploy_succeeded";
            marker.visual = spawn("script_model", marker.location);
            marker.visual setmodel("ks_marker_mp");
            marker.visual setotherent(self);
        }
        if (!isdefined(marker.location)) {
            self notify("cancel_littlebird");
            return 0;
        }
    }
    self notify("called_in_littlebird");
    var_5fa1e1697a302583 = getent("airstrikeheight", "targetname");
    if (isdefined(var_5fa1e1697a302583)) {
        var_1dc672cfe0f0128e = var_5fa1e1697a302583.origin[2] + 500;
    } else {
        var_1dc672cfe0f0128e = 1300;
    }
    if (isdefined(marker) && isdefined(marker.location)) {
        endpoint = marker.location;
    }
    endpoint = endpoint * (1, 1, 0);
    pathgoal = endpoint + (0, 0, var_1dc672cfe0f0128e);
    bird = spawnlittlebird(lifeid, self, startpoint, pathgoal, streakinfo, lz);
    bird.lz = lz;
    bird.pathgoal = pathgoal;
    thread monitorarriveoverdestination(bird, marker, team, var_c65d01ec565399b);
    return bird;
}

// Namespace namespace_d8abcde19b9d5e63/namespace_3a5b7dd73e67921c
// Params 6, eflags: 0x0
// Checksum 0x0, Offset: 0x864
// Size: 0x2f6
function spawnlittlebird(lifeid, owner, pathstart, pathgoal, streakinfo, lz) {
    forward = vectortoangles(pathgoal - pathstart);
    if (namespace_cd0b2d039510b38d::getgametype() == "arm" || namespace_cd0b2d039510b38d::getgametype() == "conflict") {
        numflares = 99;
        maxhealth = 10000;
    } else if (namespace_cd0b2d039510b38d::getgametype() == "btm") {
        numflares = 99;
        maxhealth = 99999;
    } else {
        numflares = 1;
        maxhealth = 10000;
    }
    var_1abfbb19b71bccf8 = "veh9_mil_air_heli_medium";
    jackal = spawnhelicopter(owner, pathstart, forward, "lbravo_infil_mp", var_1abfbb19b71bccf8);
    if (!isdefined(jackal)) {
        return;
    }
    if (isdefined(lz)) {
        jackal.lz = lz;
    }
    jackal thread handledestroydamage();
    jackal.damagecallback = &callback_vehicledamage;
    jackal.speed = 50;
    jackal.accel = 125;
    jackal.health = maxhealth;
    jackal.maxhealth = jackal.health;
    jackal.team = owner.team;
    jackal.owner = owner;
    jackal setcandamage(1);
    jackal.defendloc = pathgoal;
    jackal.lifeid = lifeid;
    jackal.jackal = 1;
    jackal.streakinfo = streakinfo;
    jackal.streakname = streakinfo.streakname;
    jackal.streakinfo = streakinfo;
    jackal.flaresreservecount = numflares;
    jackal addtoactivekillstreaklist(streakinfo.streakname, "Killstreak_Air", owner, 0, 1, 100);
    jackal setmaxpitchroll(0, 90);
    jackal vehicle_setspeed(jackal.speed, jackal.accel);
    jackal sethoverparams(50, 100, 50);
    jackal setturningability(0.05);
    jackal setyawspeed(45, 25, 25, 0.5);
    jackal setotherent(owner);
    jackal.useobj = spawn("script_model", jackal gettagorigin("tag_origin"));
    jackal.useobj linkto(jackal, "tag_origin");
    if (!isdefined(level.jackals)) {
        level.jackals = [];
    }
    level.jackals[level.jackals.size] = jackal;
    level.jackals = array_removeundefined(level.jackals);
    jackal thread namespace_dc0d47ddf0ead8a3::flares_handleincomingstinger(undefined, undefined);
    jackal thread littlebirddestroyed();
    jackal thread delay_jackal_arrive_sfx();
    return jackal;
}

// Namespace namespace_d8abcde19b9d5e63/namespace_3a5b7dd73e67921c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb62
// Size: 0x13
function delay_jackal_arrive_sfx() {
    self endon("death");
    namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(6);
}

// Namespace namespace_d8abcde19b9d5e63/namespace_3a5b7dd73e67921c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb7c
// Size: 0x2b
function delayjackalloopsfx(delaytime, alias) {
    self endon("death");
    namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(delaytime);
    self playloopsound(alias);
}

// Namespace namespace_d8abcde19b9d5e63/namespace_3a5b7dd73e67921c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbae
// Size: 0xb2
function littlebirddestroyed() {
    self endon("jackal_gone");
    owner = self.owner;
    self waittill("death");
    if (isdefined(self.turrettarget) && isdefined(self.targetoutline)) {
        outlinedisable(self.targetoutline, self.turrettarget);
    }
    if (!isdefined(self)) {
        return;
    }
    if (!isdefined(self.largeprojectiledamage)) {
        self vehicle_setspeed(25, 5);
        thread littlebirdcrash(75);
        namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(2.7);
    }
    if (isdefined(self.lz)) {
        self.lz notify("extraction_destroyed");
    }
    littlebirdexplode();
}

// Namespace namespace_d8abcde19b9d5e63/namespace_3a5b7dd73e67921c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc67
// Size: 0x60
function littlebirdexplode() {
    self playsound("dropship_explode_mp");
    level.jackals[level.jackals.size - 1] = undefined;
    self notify("explode");
    if (isdefined(self.lz)) {
        playfxontag(getfx("jackal_explosion"), self, "tag_origin");
    }
    wait(0.35);
    thread littlebirddelete();
}

// Namespace namespace_d8abcde19b9d5e63/namespace_3a5b7dd73e67921c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xcce
// Size: 0xcb
function littlebirddelete() {
    printgameaction("killstreak ended - jackal", self.owner);
    if (isdefined(self.turret)) {
        self.turret delete();
    }
    if (isdefined(self.cannon)) {
        self.cannon delete();
    }
    if (isdefined(self.useobj)) {
        self.useobj delete();
    }
    foreach (loc in level.carepackagedropnodes) {
        loc.free = undefined;
    }
    self delete();
}

// Namespace namespace_d8abcde19b9d5e63/namespace_3a5b7dd73e67921c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xda0
// Size: 0x73
function littlebirdcrash(speed) {
    self endon("explode");
    self clearlookatent();
    self notify("jackal_crashing");
    self setvehgoalpos(self.origin + (0, 0, 100), 1);
    namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(1.5);
    self setyawspeed(speed, speed, speed);
    self settargetyaw(self.angles[1] + speed * 2.5);
}

// Namespace namespace_d8abcde19b9d5e63/namespace_3a5b7dd73e67921c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe1a
// Size: 0x148
function handledestroydamage() {
    self endon("death");
    self endon("leaving");
    while (1) {
        inflictor = normal = angles = origin = objweapon = idflags = partname = tagname = modelname = meansofdeath = point = direction_vec = attacker = damage = self waittill("damage");
        objweapon = mapweapon(objweapon, inflictor);
        if ((objweapon.basename == "aamissile_projectile_mp" || objweapon.basename == "nuke_mp") && meansofdeath == "MOD_EXPLOSIVE" && damage >= self.health) {
            if (isdefined(self.onhelikilled)) {
                [[ self.onhelikilled ]](self.team);
            }
            callback_vehicledamage(attacker, attacker, 9001, 0, meansofdeath, objweapon, point, direction_vec, point, 0, 0, partname);
        }
    }
}

// Namespace namespace_d8abcde19b9d5e63/namespace_3a5b7dd73e67921c
// Params 13, eflags: 0x0
// Checksum 0x0, Offset: 0xf69
// Size: 0x207
function callback_vehicledamage(inflictor, attacker, damage, dflags, meansofdeath, objweapon, point, dir, hitloc, timeoffset, modelindex, partname, eventid) {
    if (isdefined(attacker)) {
        if (isdefined(attacker.owner)) {
            attacker = attacker.owner;
        }
    }
    if ((attacker == self || isdefined(attacker.pers) && attacker.pers["team"] == self.team && !level.friendlyfire && level.teambased) && attacker != self.owner) {
        return;
    }
    if (self.health <= 0) {
        return;
    }
    damage = getmodifiedantikillstreakdamage(attacker, objweapon, meansofdeath, damage, self.maxhealth, 3, 4, 5);
    namespace_58a74e7d54b56e8d::killstreakhit(attacker, objweapon, self, meansofdeath, damage);
    attacker updatedamagefeedback("");
    namespace_3e725f3cc58bddd3::logattackerkillstreak(self, damage, attacker, dir, point, meansofdeath, modelindex, undefined, partname, dflags, getcompleteweaponname(objweapon));
    if (self.health <= damage) {
        if (isplayer(attacker) && (!isdefined(self.owner) || attacker != self.owner)) {
            namespace_3e725f3cc58bddd3::onkillstreakkilled("jackal", attacker, objweapon, meansofdeath, damage, "destroyed_jackal", "jackal_destroyed", "callout_destroyed_harrier");
        }
    }
    if (self.health - damage <= 900 && (!isdefined(self.smoking) || !self.smoking)) {
        self.smoking = 1;
    }
    self vehicle_finishdamage(inflictor, attacker, damage, dflags, meansofdeath, objweapon, point, dir, hitloc, timeoffset, modelindex, partname);
}

// Namespace namespace_d8abcde19b9d5e63/namespace_3a5b7dd73e67921c
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x1177
// Size: 0xf2
function monitorarriveoverdestination(littlebird, marker, team, var_c65d01ec565399b) {
    littlebird endon("death");
    littlebird endon("leaving");
    /#
        assert(isdefined(littlebird));
    #/
    littlebird setvehgoalpos(littlebird.pathgoal, 1);
    littlebird thread changemaxpitchrollwhenclosetogoal(littlebird.pathgoal);
    littlebird waittill("goal");
    littlebird thread watchgameendleave();
    if (isdefined(var_c65d01ec565399b)) {
        setspeed = littlebird.speed;
        acceleration = littlebird.accel;
    } else {
        setspeed = littlebird.speed / 4;
        acceleration = littlebird.accel / 6;
    }
    littlebird vehicle_setspeed(setspeed, acceleration);
    littlebird littlebirddescendtoextraction(marker.location, littlebird.zone, team);
}

// Namespace namespace_d8abcde19b9d5e63/namespace_3a5b7dd73e67921c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1270
// Size: 0x1bc
function littlebirdleave() {
    self endon("death");
    var_cddc894ccdf6de54 = self.speed;
    var_af4a339e05408e87 = self.accel;
    self setmaxpitchroll(0, 0);
    self notify("leaving");
    self.leaving = 1;
    self clearlookatent();
    if (isdefined(self.turrettarget) && isdefined(self.targetoutline)) {
        outlinedisable(self.targetoutline, self.turrettarget);
    }
    var_f751b396e9b232e6 = int(self.speed / 14);
    var_a001268025a19c55 = int(self.accel / 16);
    if (isdefined(var_cddc894ccdf6de54)) {
        var_f751b396e9b232e6 = var_cddc894ccdf6de54;
    }
    if (isdefined(var_af4a339e05408e87)) {
        var_a001268025a19c55 = var_af4a339e05408e87;
    }
    self vehicle_setspeed(var_f751b396e9b232e6, var_a001268025a19c55);
    pathgoal = self.origin + anglestoforward((0, randomint(360), 0)) * 500;
    pathgoal = pathgoal + (0, 0, 1000);
    self setvehgoalpos(pathgoal, 1);
    if (isdefined(self.useobj)) {
        self.useobj delete();
    }
    self waittill("goal");
    pathend = getpathend();
    self vehicle_setspeed(250, 75);
    self setvehgoalpos(pathend, 1);
    self waittill("goal");
    self stoploopsound();
    level.jackals[level.jackals.size - 1] = undefined;
    self notify("jackal_gone");
    if (namespace_cd0b2d039510b38d::getgametype() != "arm" && namespace_cd0b2d039510b38d::getgametype() != "conflict") {
        littlebirddelete();
    }
}

// Namespace namespace_d8abcde19b9d5e63/namespace_3a5b7dd73e67921c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1433
// Size: 0x62
function getpathend() {
    pathrandomness = 150;
    halfdistance = 15000;
    yaw = self.angles[1];
    direction = (0, yaw, 0);
    endpoint = self.origin + anglestoforward(direction) * halfdistance;
    return endpoint;
}

// Namespace namespace_d8abcde19b9d5e63/namespace_3a5b7dd73e67921c
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x149d
// Size: 0x94
function littlebirddescendtoextraction(location, zone, team) {
    descend(location, zone);
    if (namespace_cd0b2d039510b38d::getgametype() != "vip" && namespace_cd0b2d039510b38d::getgametype() != "arm" && namespace_cd0b2d039510b38d::getgametype() != "conflict" && namespace_cd0b2d039510b38d::getgametype() != "btm") {
        zone.teamsextracting = array_remove(zone.teamsextracting, team + self.var_ff97225579de16a);
        thread littlebirdleave();
    }
}

// Namespace namespace_d8abcde19b9d5e63/namespace_3a5b7dd73e67921c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1538
// Size: 0x1ad
function descend(location, zone) {
    self endon("bugOut");
    newpos = undefined;
    locationx = location[0];
    locationy = location[1];
    var_7504c8791e34dc73 = tracegroundheight(locationx, locationy, 20);
    newpos = (locationx, locationy, var_7504c8791e34dc73);
    if (namespace_cd0b2d039510b38d::getgametype() == "arm" || namespace_cd0b2d039510b38d::getgametype() == "conflict") {
        var_7504c8791e34dc73 = tracegroundheight(locationx, locationy, 5, 1);
        newpos = (locationx, locationy, var_7504c8791e34dc73 + 200);
    }
    self clearlookatent();
    self setvehgoalpos(newpos, 1);
    /#
        line(self.origin, newpos, (0, 1, 0), 1, 0, 250);
        sphere(newpos, 100, (0, 1, 0), 0, 250);
    #/
    self waittill("goal");
    if (namespace_cd0b2d039510b38d::getgametype() == "vip") {
        self notify("esc_littlebird_arrive");
    } else if (namespace_cd0b2d039510b38d::getgametype() == "arm" || namespace_cd0b2d039510b38d::getgametype() == "conflict") {
        self vehicle_setspeed(self.speed / 8, self.accel / 12);
        var_7504c8791e34dc73 = tracegroundheight(locationx, locationy, undefined, 1);
        newpos = (locationx, locationy, var_7504c8791e34dc73 + 120);
        self setvehgoalpos(newpos, 1);
        self notify("esc_littlebird_arrive");
        self waittill("goal");
        self vehicle_setspeed(self.speed / 3, self.accel / 4);
    } else if (namespace_cd0b2d039510b38d::getgametype() == "btm") {
        self notify("esc_littlebird_arrive");
    }
}

// Namespace namespace_d8abcde19b9d5e63/namespace_3a5b7dd73e67921c
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x16ec
// Size: 0x64
function tracegroundheight(x, y, rand, var_ffa2f7672c0c1531) {
    var_dc8bb6300463cf1e = 30;
    var_e7a7d619f927d791 = tracegroundpoint(x, y, var_ffa2f7672c0c1531);
    var_1dc672cfe0f0128e = var_e7a7d619f927d791 + var_dc8bb6300463cf1e;
    if (isdefined(rand)) {
        var_1dc672cfe0f0128e = var_1dc672cfe0f0128e + randomint(rand);
    }
    return var_1dc672cfe0f0128e;
}

// Namespace namespace_d8abcde19b9d5e63/namespace_3a5b7dd73e67921c
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1758
// Size: 0x169
function tracegroundpoint(x, y, var_ffa2f7672c0c1531) {
    self endon("death");
    self endon("acquiringTarget");
    self endon("leaving");
    z = -99999;
    var_e531afbe1391f499 = self.origin[2] + 2000;
    minz = level.averagealliesz;
    ignorelist = [0:self];
    if (isdefined(self.dropcrates)) {
        foreach (crate in self.dropcrates) {
            ignorelist[ignorelist.size] = crate;
        }
    }
    var_8bc8bdb284860e7e = 256;
    if (isdefined(var_ffa2f7672c0c1531)) {
        var_e96577032a7740fc = ray_trace((x, y, var_e531afbe1391f499), (x, y, z), ignorelist, undefined, undefined, 1);
    } else {
        var_e96577032a7740fc = sphere_trace((x, y, var_e531afbe1391f499), (x, y, z), 256, ignorelist, undefined, 1);
    }
    if (var_e96577032a7740fc["position"][2] < minz) {
        var_fa83e3a4c4e6902 = minz;
    } else {
        var_fa83e3a4c4e6902 = var_e96577032a7740fc["position"][2];
    }
    return var_fa83e3a4c4e6902;
}

// Namespace namespace_d8abcde19b9d5e63/namespace_3a5b7dd73e67921c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x18c9
// Size: 0x21
function watchgameendleave() {
    self endon("death");
    self endon("leaving");
    level waittill("game_ended");
    thread littlebirdleave();
}

// Namespace namespace_d8abcde19b9d5e63/namespace_3a5b7dd73e67921c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x18f1
// Size: 0x4e
function changemaxpitchrollwhenclosetogoal(pathgoal) {
    self endon("goal");
    self endon("death");
    self endon("leaving");
    for (;;) {
        for (;;) {
            if (distance2d(self.origin, pathgoal) < 768) {
                self setmaxpitchroll(10, 25);
                break;
            }
        }
    }
}

// Namespace namespace_d8abcde19b9d5e63/namespace_3a5b7dd73e67921c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1946
// Size: 0xb
function abortextractpickup() {
    thread littlebirdleave();
}

