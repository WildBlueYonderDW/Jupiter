// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\common\values.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\killstreaks\killstreaks.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;

#namespace remotemissile;

// Namespace remotemissile / scripts/mp/killstreaks/remotemissile
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x273
// Size: 0x59
function init() {
    level.missileremotelaunchvert = 14000;
    level.missileremotelaunchhorz = 7000;
    level.missileremotelaunchtargetdist = 1500;
    level.rockets = [];
    /#
        assertmsg("If this killstreak is used in the future, it needs to be updated to do it's own deployment.");
    #/
    level.remotemissile_fx["explode"] = loadfx("vfx/core/expl/aerial_explosion");
}

// Namespace remotemissile / scripts/mp/killstreaks/remotemissile
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2d3
// Size: 0x75
function tryusepredatormissile(lifeid, streakname) {
    setusingremote("remotemissile");
    result = scripts/mp/killstreaks/killstreaks::initridekillstreak();
    if (result != "success") {
        if (result != "disconnect") {
            clearusingremote();
        }
        val::reset_all("ride_killstreak");
        return false;
    }
    self setclientomnvar("ui_predator_missile", 1);
    level thread _fire(lifeid, self);
    return true;
}

// Namespace remotemissile / scripts/mp/killstreaks/remotemissile
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x350
// Size: 0x32c
function getbestspawnpoint(remotemissilespawnpoints) {
    validenemies = [];
    foreach (spawnpoint in remotemissilespawnpoints) {
        spawnpoint.validplayers = [];
        spawnpoint.spawnscore = 0;
    }
    foreach (player in level.players) {
        if (!isreallyalive(player)) {
            continue;
        }
        if (player.team == self.team) {
            continue;
        }
        if (player.team == "spectator") {
            continue;
        }
        bestdistance = 999999999;
        bestspawnpoint = undefined;
        foreach (spawnpoint in remotemissilespawnpoints) {
            spawnpoint.validplayers[spawnpoint.validplayers.size] = player;
            potentialbestdistance = distance2d(spawnpoint.targetent.origin, player.origin);
            if (potentialbestdistance <= bestdistance) {
                bestdistance = potentialbestdistance;
                bestspawnpoint = spawnpoint;
            }
        }
        /#
            assertex(isdefined(bestspawnpoint), "Closest remote-missile spawnpoint undefined for player: " + player.name);
        #/
        bestspawnpoint.spawnscore = bestspawnpoint.spawnscore + 2;
    }
    bestspawn = remotemissilespawnpoints[0];
    foreach (spawnpoint in remotemissilespawnpoints) {
        foreach (player in spawnpoint.validplayers) {
            spawnpoint.spawnscore = spawnpoint.spawnscore + 1;
            if (scripts/engine/trace::_bullet_trace_passed(player.origin + (0, 0, 32), spawnpoint.origin, 0, player)) {
                spawnpoint.spawnscore = spawnpoint.spawnscore + 3;
            }
            if (spawnpoint.spawnscore > bestspawn.spawnscore) {
                bestspawn = spawnpoint;
                continue;
            }
            if (spawnpoint.spawnscore == bestspawn.spawnscore) {
                if (cointoss()) {
                    bestspawn = spawnpoint;
                }
            }
        }
    }
    return bestspawn;
}

// Namespace remotemissile / scripts/mp/killstreaks/remotemissile
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x684
// Size: 0x242
function _fire(lifeid, player) {
    remotemissilespawnarray = getentarray("remoteMissileSpawn", "targetname");
    foreach (spawn in remotemissilespawnarray) {
        if (isdefined(spawn.target)) {
            spawn.targetent = getent(spawn.target, "targetname");
        }
    }
    if (remotemissilespawnarray.size > 0) {
        remotemissilespawn = player getbestspawnpoint(remotemissilespawnarray);
    } else {
        remotemissilespawn = undefined;
    }
    if (isdefined(remotemissilespawn)) {
        startpos = remotemissilespawn.origin;
        targetpos = remotemissilespawn.targetent.origin;
        vector = vectornormalize(startpos - targetpos);
        startpos = vector * 14000 + targetpos;
        rocket = scripts/cp_mp/utility/weapon_utility::_magicbullet(makeweapon("remotemissile_projectile_mp"), startpos, targetpos, player);
    } else {
        upvector = (0, 0, level.missileremotelaunchvert);
        backdist = level.missileremotelaunchhorz;
        targetdist = level.missileremotelaunchtargetdist;
        forward = anglestoforward(player.angles);
        startpos = player.origin + upvector + forward * backdist * -1;
        targetpos = player.origin + forward * targetdist;
        rocket = scripts/cp_mp/utility/weapon_utility::_magicbullet(makeweapon("remotemissile_projectile_mp"), startpos, targetpos, player);
    }
    if (!isdefined(rocket)) {
        player clearusingremote();
        return;
    }
    rocket.team = player.team;
    rocket thread handledamage();
    rocket.lifeid = lifeid;
    rocket.type = "remote";
    level.remotemissileinprogress = 1;
    missileeyes(player, rocket);
}

// Namespace remotemissile / scripts/mp/killstreaks/remotemissile
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8cd
// Size: 0x12e
function function_7ffa02c6592145d(lifeid, player) {
    /#
        upvector = (0, 0, level.missileremotelaunchvert);
        backdist = level.missileremotelaunchhorz;
        targetdist = level.missileremotelaunchtargetdist;
        forward = anglestoforward(player.angles);
        startpos = player.origin + upvector + forward * backdist * -1;
        targetpos = player.origin + forward * targetdist;
        rocket = scripts/cp_mp/utility/weapon_utility::_magicbullet(makeweapon("<unknown string>"), startpos, targetpos, player);
        if (!isdefined(rocket)) {
            return;
        }
        rocket thread handledamage();
        rocket.lifeid = lifeid;
        rocket.type = "<unknown string>";
        player cameralinkto(rocket, "<unknown string>");
        player controlslinkto(rocket);
        rocket thread rocket_cleanupondeath();
        wait(2);
        player controlsunlink();
        player cameraunlink();
    #/
}

// Namespace remotemissile / scripts/mp/killstreaks/remotemissile
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xa02
// Size: 0x33
function handledamage() {
    self endon("death");
    self endon("deleted");
    self setcandamage(1);
    /#
        for (;;) {
            self waittill("<unknown string>");
            println("<unknown string>");
        }
    #/
}

// Namespace remotemissile / scripts/mp/killstreaks/remotemissile
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xa3c
// Size: 0x147
function missileeyes(player, rocket) {
    player endon("joined_team");
    player endon("joined_spectators");
    rocket thread rocket_cleanupondeath();
    player thread player_cleanupongameended(rocket);
    player thread player_cleanuponteamchange(rocket);
    player visionsetmissilecamforplayer("black_bw", 0);
    player endon("disconnect");
    if (isdefined(rocket)) {
        player visionsetmissilecamforplayer(game["thermal_vision"], 1);
        player thermalvisionon();
        player thread delayedfofoverlay();
        player cameralinkto(rocket, "tag_origin");
        player controlslinkto(rocket);
        if (getdvarint(@"hash_c00e244ea59d530e")) {
            player setthirdpersondof(0);
        }
        rocket waittill("death");
        player thermalvisionoff();
        if (isdefined(rocket)) {
            player utility::trycall(level.matchdata_logkillstreakevent, "predator_missile", rocket.origin);
        }
        player controlsunlink();
        player _freezecontrols(1);
        if (!level.gameended) {
            player setclientomnvar("ui_predator_missile", 2);
        }
        wait(0.5);
        player cameraunlink();
        if (getdvarint(@"hash_c00e244ea59d530e")) {
            player setthirdpersondof(1);
        }
    }
    player setclientomnvar("ui_predator_missile", 0);
    player clearusingremote();
}

// Namespace remotemissile / scripts/mp/killstreaks/remotemissile
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb8a
// Size: 0x17
function delayedfofoverlay() {
    self endon("death_or_disconnect");
    level endon("game_ended");
    wait(0.15);
}

// Namespace remotemissile / scripts/mp/killstreaks/remotemissile
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xba8
// Size: 0x76
function player_cleanuponteamchange(rocket) {
    rocket endon("death");
    self endon("disconnect");
    waittill_any_2("joined_team", "joined_spectators");
    if (self.team != "spectator") {
        self controlsunlink();
        self cameraunlink();
        if (getdvarint(@"hash_c00e244ea59d530e")) {
            setthirdpersondof(1);
        }
    }
    clearusingremote();
    level.remotemissileinprogress = undefined;
}

// Namespace remotemissile / scripts/mp/killstreaks/remotemissile
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc25
// Size: 0x3e
function rocket_cleanupondeath() {
    entitynumber = self getentitynumber();
    level.rockets[entitynumber] = self;
    self waittill("death");
    level.rockets[entitynumber] = undefined;
    level.remotemissileinprogress = undefined;
}

// Namespace remotemissile / scripts/mp/killstreaks/remotemissile
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xc6a
// Size: 0x4a
function player_cleanupongameended(rocket) {
    rocket endon("death");
    self endon("death");
    level waittill("game_ended");
    self controlsunlink();
    self cameraunlink();
    if (getdvarint(@"hash_c00e244ea59d530e")) {
        setthirdpersondof(1);
    }
}

