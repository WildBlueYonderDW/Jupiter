// mwiii decomp prototype
#using scripts\mp\hud_util.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\debug.gsc;
#using scripts\mp\utility\print.gsc;
#using scripts\cp_mp\utility\weapon_utility.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\killstreaks\killstreakdeploy.gsc;
#using scripts\engine\trace.gsc;
#using scripts\mp\hostmigration.gsc;

#namespace namespace_c440e9e4e88cbbf3;

// Namespace namespace_c440e9e4e88cbbf3/namespace_f29716796519b4c2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3c4
// Size: 0x97
function init() {
    /#
        assertmsg("If this killstreak is used in the future, it needs to be updated to do it's own deployment.");
    #/
    level.dronemissilespawnarray = getentarray("remoteMissileSpawn", "targetname");
    foreach (var_f17f773b25d8c46a in level.dronemissilespawnarray) {
        var_f17f773b25d8c46a.targetent = getent(var_f17f773b25d8c46a.target, "targetname");
    }
}

// Namespace namespace_c440e9e4e88cbbf3/namespace_f29716796519b4c2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x462
// Size: 0xe
function weapongivendronehive(streakinfo) {
    return 1;
}

// Namespace namespace_c440e9e4e88cbbf3/namespace_f29716796519b4c2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x478
// Size: 0x4c
function tryusedronehive(streakinfo) {
    /#
        if (!isdefined(level.dronemissilespawnarray) || !level.dronemissilespawnarray.size) {
            /#
                assertmsg("spectator");
            #/
        }
    #/
    return usedronehive(self, streakinfo.lifeid, streakinfo);
}

// Namespace namespace_c440e9e4e88cbbf3/namespace_f29716796519b4c2
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x4cc
// Size: 0x9b
function usedronehive(player, lifeid, streakinfo) {
    if (isdefined(self.underwater) && self.underwater) {
        return 0;
    }
    result = player namespace_b3d24e921998a8b::streakdeploy_doweapontabletdeploy(streakinfo);
    if (!result) {
        return 0;
    }
    player val::set("use_drone_hive", "weapon_switch", 0);
    level thread monitordisownkillstreaks(player);
    level thread monitorgameend(player);
    level thread monitorobjectivecamera(player);
    level thread rundronehive(player, lifeid, streakinfo.streakname, streakinfo);
    return 1;
}

// Namespace namespace_c440e9e4e88cbbf3/namespace_f29716796519b4c2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x56f
// Size: 0x49
function watchhostmigrationstartedinit(player) {
    player endon("disconnect");
    level endon("game_ended");
    self endon("death");
    for (;;) {
        level waittill("host_migration_begin");
        if (isdefined(self)) {
            player thermalvisionon();
        } else {
            player setclientomnvar("ui_predator_missile", 2);
        }
    }
}

// Namespace namespace_c440e9e4e88cbbf3/namespace_f29716796519b4c2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5bf
// Size: 0x65
function watchhostmigrationfinishedinit(player) {
    player endon("disconnect");
    level endon("game_ended");
    self endon("death");
    for (;;) {
        level waittill("host_migration_end");
        if (isdefined(self)) {
            player setclientomnvar("ui_predator_missile", 1);
            player setclientomnvar("ui_predator_missiles_left", self.missilesleft);
        } else {
            player setclientomnvar("ui_predator_missile", 2);
        }
    }
}

// Namespace namespace_c440e9e4e88cbbf3/namespace_f29716796519b4c2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x62b
// Size: 0xc6
function watchclosetogoal(player) {
    player endon("disconnect");
    level endon("game_ended");
    contentoverride = namespace_2a184fc4902783dc::create_contents(1, 1, 1, 1, 1, 1, 1);
    while (isdefined(self)) {
        trace = namespace_2a184fc4902783dc::ray_trace(self.origin, self.origin - (0, 0, 1000), level.characters, contentoverride);
        if (isdefined(trace["position"]) && distancesquared(self.origin, trace["position"]) < 5000) {
            break;
        }
        waitframe();
    }
    /#
        assertmsg("stopRemoteSequence was updated to take a streakInfo. If you use this script, you need to update this.");
    #/
    self.streakinfo notify("killstreak_finished_with_deploy_weapon");
}

// Namespace namespace_c440e9e4e88cbbf3/namespace_f29716796519b4c2
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x6f8
// Size: 0x430
function rundronehive(player, lifeid, streakname, streakinfo) {
    player endon("disconnect");
    level endon("game_ended");
    var_ef41235a89500ad8 = "used_drone_hive";
    var_89653d637e0a2a78 = "drone_hive_projectile_mp";
    var_d8face27a0d9305d = "switch_blade_child_mp";
    level thread teamplayercardsplash(var_ef41235a89500ad8, player);
    player notifyonplayercommand("missileTargetSet", "+attack");
    player notifyonplayercommand("missileTargetSet", "+attack_akimbo_accessible");
    remotemissilespawn = getbestmissilespawnpoint(player, level.dronemissilespawnarray);
    startpos = remotemissilespawn.origin * (1, 1, 0) + (0, 0, level.mapcenter[2] + 10000);
    targetpos = remotemissilespawn.targetent.origin;
    /#
        if (0) {
            level thread drawline(startpos, targetpos, 15, (1, 0, 0));
        }
    #/
    rocket = _magicbullet(makeweapon(var_89653d637e0a2a78), startpos, targetpos, player);
    rocket setcandamage(1);
    rocket disablemissileboosting();
    rocket setmissileminimapvisible(1);
    rocket.team = player.team;
    rocket.lifeid = lifeid;
    rocket.type = "remote";
    rocket.owner = player;
    rocket.entitynumber = rocket getentitynumber();
    rocket.streakinfo = streakinfo;
    rocket.weapon_name = "drone_hive_projectile_mp";
    level.rockets[rocket.entitynumber] = rocket;
    level.remotemissileinprogress = 1;
    level thread monitordeath(rocket, 1);
    level thread monitorboost(rocket);
    missileeyes(player, rocket);
    player setclientomnvar("ui_predator_missile", 1);
    rocket thread watchhostmigrationstartedinit(player);
    rocket thread watchhostmigrationfinishedinit(player);
    rocket thread watchsupertrophynotify(player);
    player utility::trycall(level.matchdata_logkillstreakevent, streakname, rocket.origin);
    var_c8cc9e14cbc6c616 = 0;
    rocket.missilesleft = 2;
    reloadtime = 2;
    player setclientomnvar("ui_predator_missiles_left", rocket.missilesleft);
    while (1) {
        result = rocket waittill_any_return_2("death", "missileTargetSet");
        namespace_e323c8674b44c8f4::waittillhostmigrationdone();
        if (result == "death") {
            break;
        }
        if (!isdefined(rocket)) {
            break;
        }
        if (istrue(rocket.unlimitedammo)) {
            if (istrue(rocket.lasttimefired)) {
                if (gettime() < rocket.lasttimefired + reloadtime * 1000 && var_c8cc9e14cbc6c616 == 0) {
                    continue;
                }
            }
            level thread firerapidmissiles(rocket, var_c8cc9e14cbc6c616, streakinfo, var_d8face27a0d9305d);
            var_c8cc9e14cbc6c616++;
            rocket.lasttimefired = gettime();
            rocket.missilesleft = 2 - var_c8cc9e14cbc6c616;
            var_5c9ddcf56d36f133 = rocket.missilesleft;
            if (rocket.missilesleft == 0) {
                var_5c9ddcf56d36f133 = -1;
            }
            player setclientomnvar("ui_predator_missiles_left", var_5c9ddcf56d36f133);
            if (var_c8cc9e14cbc6c616 == 2) {
                var_c8cc9e14cbc6c616 = 0;
                rocket.missilesleft = 2;
                player thread resetmissiles(rocket, reloadtime);
            }
        } else if (var_c8cc9e14cbc6c616 < 2) {
            if (!istrue(rocket.singlefire)) {
                level thread spawnswitchblade(rocket, var_c8cc9e14cbc6c616, streakinfo, var_d8face27a0d9305d);
                var_c8cc9e14cbc6c616++;
                rocket.missilesleft = 2 - var_c8cc9e14cbc6c616;
                player setclientomnvar("ui_predator_missiles_left", rocket.missilesleft);
                if (var_c8cc9e14cbc6c616 == 2) {
                    rocket enablemissileboosting();
                }
            }
        }
    }
    level thread returnplayer(player);
    printgameaction("killstreak ended - drone_hive", player);
}

// Namespace namespace_c440e9e4e88cbbf3/namespace_f29716796519b4c2
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xb2f
// Size: 0x69
function firerapidmissiles(rocket, var_c8cc9e14cbc6c616, streakinfo, var_d8face27a0d9305d) {
    var_4888f4f947a820ee = var_c8cc9e14cbc6c616;
    for (i = 0; i < 2; i++) {
        level thread spawnswitchblade(rocket, var_4888f4f947a820ee, streakinfo, var_d8face27a0d9305d);
        var_4888f4f947a820ee++;
        if (var_4888f4f947a820ee > 1) {
            var_4888f4f947a820ee = 0;
        }
        wait(0.1);
    }
}

// Namespace namespace_c440e9e4e88cbbf3/namespace_f29716796519b4c2
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xb9f
// Size: 0x3b
function resetmissiles(rocket, reloadtime) {
    rocket endon("death");
    self endon("disconnect");
    wait(reloadtime);
    self setclientomnvar("ui_predator_missiles_left", rocket.missilesleft);
}

// Namespace namespace_c440e9e4e88cbbf3/namespace_f29716796519b4c2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xbe1
// Size: 0x127
function monitorlockedtarget() {
    level endon("game_ended");
    self endon("death");
    enemytargets = [];
    sortedtargets = [];
    for (;;) {
        var_9c999503835471df = [];
        enemytargets = getenemytargets();
        foreach (targ in enemytargets) {
            var_def090ecbc180b02 = self.owner worldpointinreticle_circle(targ.origin, 65, 90);
            if (var_def090ecbc180b02) {
                self.owner thread drawline(self.origin, targ.origin, 10, (0, 0, 1));
                var_9c999503835471df[var_9c999503835471df.size] = targ;
            }
        }
        if (var_9c999503835471df.size) {
            sortedtargets = sortbydistance(var_9c999503835471df, self.origin);
            self.lasttargetlocked = sortedtargets[0];
            namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(0.25);
        }
        wait(0.05);
        namespace_e323c8674b44c8f4::waittillhostmigrationdone();
    }
}

// Namespace namespace_c440e9e4e88cbbf3/namespace_f29716796519b4c2
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0xd0f
// Size: 0x234
function spawnswitchblade(rocket, var_ccfd286d34b473a0, streakinfo, var_d8face27a0d9305d) {
    rocket.owner playlocalsound("ammo_crate_use");
    var_a66fd1b124c32f51 = rocket gettagangles("tag_origin");
    forwarddir = anglestoforward(var_a66fd1b124c32f51);
    rightdir = anglestoright(var_a66fd1b124c32f51);
    spawnoffset = (100, 100, 100);
    targetoffset = (15000, 15000, 15000);
    if (var_ccfd286d34b473a0) {
        spawnoffset = spawnoffset * -1;
    }
    result = namespace_2a184fc4902783dc::_bullet_trace(rocket.origin, rocket.origin + forwarddir * targetoffset, 0, rocket);
    targetoffset = targetoffset * result["fraction"];
    startposition = rocket.origin + rightdir * spawnoffset;
    var_7b59b41b01684053 = rocket.origin + forwarddir * targetoffset;
    missile = _magicbullet(makeweapon(var_d8face27a0d9305d), startposition, var_7b59b41b01684053, rocket.owner);
    var_1f027877f9775ab8 = rocket getclosesttargetinview(rocket.owner, var_7b59b41b01684053);
    if (isdefined(var_1f027877f9775ab8)) {
        missile missile_settargetent(var_1f027877f9775ab8);
    }
    missile setcandamage(1);
    missile setmissileminimapvisible(1);
    missile.team = rocket.team;
    missile.lifeid = rocket.lifeid;
    missile.type = rocket.type;
    missile.owner = rocket.owner;
    missile.entitynumber = missile getentitynumber();
    missile.streakinfo = streakinfo;
    missile.weapon_name = "switch_blade_child_mp";
    level.rockets[missile.entitynumber] = missile;
    level thread monitordeath(missile, 0);
}

// Namespace namespace_c440e9e4e88cbbf3/namespace_f29716796519b4c2
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0xf4a
// Size: 0x10e
function getclosesttargetinview(owner, var_7b59b41b01684053) {
    targets = getenemytargets(owner);
    closesttarget = undefined;
    var_bd41fc0707addf42 = undefined;
    foreach (targ in targets) {
        if (!isdefined(targ) || !isreallyalive(targ)) {
            continue;
        }
        if (istrue(targ.trinityrocketlocked)) {
            continue;
        }
        distancecheck = distance2dsquared(targ.origin, var_7b59b41b01684053);
        if (distancecheck < 262144 && istrue(canseetarget(targ))) {
            if (!isdefined(var_bd41fc0707addf42) || distancecheck < var_bd41fc0707addf42) {
                closesttarget = targ;
                var_bd41fc0707addf42 = distancecheck;
            }
        }
    }
    if (isdefined(closesttarget)) {
        closesttarget.trinityrocketlocked = 1;
        closesttarget thread watchtarget();
    }
    return closesttarget;
}

// Namespace namespace_c440e9e4e88cbbf3/namespace_f29716796519b4c2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1060
// Size: 0xa9
function canseetarget(target) {
    var_27b697504d9397d = 0;
    contentoverride = namespace_2a184fc4902783dc::create_contents(0, 1, 1, 1, 1, 1, 0);
    tracepoints = [0:target gettagorigin("j_head"), 1:target gettagorigin("j_mainroot"), 2:target gettagorigin("tag_origin")];
    for (i = 0; i < tracepoints.size; i++) {
        if (!namespace_2a184fc4902783dc::ray_trace_passed(self.origin, tracepoints[i], self, contentoverride)) {
            continue;
        }
        var_27b697504d9397d = 1;
        break;
    }
    return var_27b697504d9397d;
}

// Namespace namespace_c440e9e4e88cbbf3/namespace_f29716796519b4c2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1111
// Size: 0x1c
function watchtarget() {
    self endon("disconnect");
    self waittill("death");
    self.trinityrocketlocked = undefined;
}

// Namespace namespace_c440e9e4e88cbbf3/namespace_f29716796519b4c2
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1134
// Size: 0x39
function looptriggeredeffect(effect, missile) {
    missile endon("death");
    level endon("game_ended");
    self endon("death");
    for (;;) {
        triggerfx(effect);
        wait(0.25);
    }
}

// Namespace namespace_c440e9e4e88cbbf3/namespace_f29716796519b4c2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1174
// Size: 0x2e
function getnextmissilespawnindex(oldindex) {
    index = oldindex + 1;
    if (index == level.dronemissilespawnarray.size) {
        index = 0;
    }
    return index;
}

// Namespace namespace_c440e9e4e88cbbf3/namespace_f29716796519b4c2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x11aa
// Size: 0x35
function monitorboost(rocket) {
    rocket endon("death");
    while (1) {
        rocket.owner waittill("missileTargetSet");
        rocket notify("missileTargetSet");
    }
}

// Namespace namespace_c440e9e4e88cbbf3/namespace_f29716796519b4c2
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x11e6
// Size: 0x213
function getbestmissilespawnpoint(owner, remotemissilespawnpoints) {
    validenemies = [];
    foreach (player in level.players) {
        if (!isreallyalive(player)) {
            continue;
        }
        if (player.team == owner.team) {
            continue;
        }
        if (player.team == "spectator") {
            continue;
        }
        validenemies[validenemies.size] = player;
    }
    if (!validenemies.size) {
        return remotemissilespawnpoints[randomint(remotemissilespawnpoints.size)];
    }
    var_4eb0036df55013de = array_randomize(remotemissilespawnpoints);
    var_1a2450b2561e9908 = var_4eb0036df55013de[0];
    foreach (var_f17f773b25d8c46a in var_4eb0036df55013de) {
        var_f17f773b25d8c46a.sightedenemies = 0;
        for (i = 0; i < validenemies.size; i++) {
            enemy = validenemies[i];
            if (!isreallyalive(enemy)) {
                validenemies[i] = validenemies[validenemies.size - 1];
                validenemies[validenemies.size - 1] = undefined;
                i--;
            } else {
                if (namespace_2a184fc4902783dc::_bullet_trace_passed(enemy.origin + (0, 0, 32), var_f17f773b25d8c46a.origin, 0, enemy)) {
                    var_f17f773b25d8c46a.sightedenemies = var_f17f773b25d8c46a.sightedenemies + 1;
                    return var_f17f773b25d8c46a;
                }
                wait(0.05);
                namespace_e323c8674b44c8f4::waittillhostmigrationdone();
            }
        }
        if (var_f17f773b25d8c46a.sightedenemies == validenemies.size) {
            return var_f17f773b25d8c46a;
        }
        if (var_f17f773b25d8c46a.sightedenemies > var_1a2450b2561e9908.sightedenemies) {
            var_1a2450b2561e9908 = var_f17f773b25d8c46a;
        }
    }
    return var_1a2450b2561e9908;
}

// Namespace namespace_c440e9e4e88cbbf3/namespace_f29716796519b4c2
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1401
// Size: 0x7d
function missileeyes(player, rocket) {
    delaytime = 0.5;
    player _freezecontrols(1);
    player cameralinkto(rocket, "tag_origin");
    player controlslinkto(rocket);
    player thermalvisionon();
    player setclientomnvar("ui_killstreak_health", 1);
    player setclientomnvar("ui_killstreak_countdown", gettime() + int(15000));
    level thread unfreezecontrols(player, delaytime);
}

// Namespace namespace_c440e9e4e88cbbf3/namespace_f29716796519b4c2
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1485
// Size: 0x3a
function unfreezecontrols(player, delaytime, i) {
    player endon("disconnect");
    namespace_e323c8674b44c8f4::waitlongdurationwithhostmigrationpause(delaytime - 0.35);
    player _freezecontrols(0);
}

// Namespace namespace_c440e9e4e88cbbf3/namespace_f29716796519b4c2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x14c6
// Size: 0x36
function monitordisownkillstreaks(player) {
    player endon("disconnect");
    player endon("end_kill_streak");
    player childthread monitorownerstatus("joined_team");
    player childthread monitorownerstatus("joined_spectators");
}

// Namespace namespace_c440e9e4e88cbbf3/namespace_f29716796519b4c2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1503
// Size: 0x1a
function monitorownerstatus(var_70687e0cc558a009) {
    self waittill(var_70687e0cc558a009);
    level thread returnplayer(self);
}

// Namespace namespace_c440e9e4e88cbbf3/namespace_f29716796519b4c2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1524
// Size: 0x3b
function monitorgameend(player) {
    player endon("disconnect");
    player endon("end_kill_streak");
    level waittill("game_ended");
    gameended = 1;
    level thread returnplayer(player, 0, gameended);
}

// Namespace namespace_c440e9e4e88cbbf3/namespace_f29716796519b4c2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1566
// Size: 0x2e
function monitorobjectivecamera(player) {
    player endon("end_kill_streak");
    player endon("disconnect");
    level waittill("objective_cam");
    level thread returnplayer(player, 1);
}

// Namespace namespace_c440e9e4e88cbbf3/namespace_f29716796519b4c2
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x159b
// Size: 0x75
function monitordeath(var_d7eea22a14a52fd0, var_561c9d45d1c37eac) {
    var_d7eea22a14a52fd0 waittill("death");
    namespace_e323c8674b44c8f4::waittillhostmigrationdone();
    if (isdefined(var_d7eea22a14a52fd0.targeffect)) {
        var_d7eea22a14a52fd0.targeffect delete();
    }
    if (isdefined(var_d7eea22a14a52fd0.entitynumber)) {
        level.rockets[var_d7eea22a14a52fd0.entitynumber] = undefined;
    }
    if (var_561c9d45d1c37eac) {
        level.remotemissileinprogress = undefined;
    }
}

// Namespace namespace_c440e9e4e88cbbf3/namespace_f29716796519b4c2
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1617
// Size: 0x8a
function returnplayer(player, instant, gameended) {
    if (!isdefined(player)) {
        return;
    }
    if (!istrue(gameended)) {
        /#
            assertmsg("stopRemoteSequence was updated to take a streakInfo. If you use this script, you need to update this.");
        #/
        self.streakinfo notify("killstreak_finished_with_deploy_weapon");
    }
    player setclientomnvar("ui_predator_missile", 2);
    player notify("end_kill_streak");
    player thermalvisionoff();
    player controlsunlink();
    player cameraunlink();
    player setclientomnvar("ui_predator_missile", 0);
    player val::function_c9d0b43701bdba00("use_drone_hive");
}

// Namespace namespace_c440e9e4e88cbbf3/namespace_f29716796519b4c2
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x16a8
// Size: 0x90
function watchgastrigger(var_4084c95c19c7937a, weaponname) {
    self endon("death");
    while (1) {
        ent = self waittill("trigger");
        if (!isplayer(ent)) {
            continue;
        }
        if (level.teambased && ent.team == var_4084c95c19c7937a.team && ent != var_4084c95c19c7937a) {
            continue;
        }
        if (istrue(ent.gettinggassed)) {
            continue;
        }
        thread applygasdamageovertime(var_4084c95c19c7937a, weaponname, ent);
    }
}

// Namespace namespace_c440e9e4e88cbbf3/namespace_f29716796519b4c2
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x173f
// Size: 0x9a
function applygasdamageovertime(var_4084c95c19c7937a, missileweapon, victim) {
    victim endon("disconnect");
    victim.gettinggassed = 1;
    while (victim istouching(self)) {
        victim dodamage(20, self.origin, var_4084c95c19c7937a, self, "MOD_EXPLOSIVE", missileweapon);
        result = waittill_any_timeout_1(0.5, "death");
        if (result == "death") {
            break;
        }
    }
    if (istrue(victim.gettinggassed)) {
        victim.gettinggassed = undefined;
    }
}

