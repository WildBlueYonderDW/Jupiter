#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\hud_util.gsc;
#using scripts\mp\utility\game.gsc;
#using scripts\mp\utility\outline.gsc;
#using scripts\mp\utility\killstreak.gsc;
#using scripts\mp\utility\weapon.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\mp\utility\stats.gsc;
#using script_646d60ff2fbd4ff2;
#using scripts\cp_mp\killstreaks\chopper_support.gsc;
#using scripts\mp\poi.gsc;
#using script_48814951e916af89;
#using scripts\mp\sentientpoolmanager.gsc;
#using scripts\mp\vehicles\damage.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;
#using scripts\mp\outofbounds.gsc;
#using scripts\mp\gametypes\br_gametype_dmz.gsc;
#using script_1f97a44d1761c919;
#using scripts\cp_mp\killstreaks\airdrop.gsc;
#using scripts\mp\gametypes\br_pickups.gsc;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;

#namespace dmz_ai_chopper;

/#

    // Namespace dmz_ai_chopper / namespace_8c3daeeca6bd42c0
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x3bc
    // Size: 0x4f
    function debug() {
        while (true) {
            waitframe();
            if (getdvarint(@"hash_75b3234f60e90b47", 0) == 1) {
                namespace_fd5db9939c683aa4::function_6aa2e7131056a6a2(level.players[0].origin);
                setdvar(@"hash_75b3234f60e90b47", 0);
            }
        }
    }

#/

// Namespace dmz_ai_chopper / namespace_8c3daeeca6bd42c0
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x413
// Size: 0x445
function function_4c4df9aeb773709a(pos, vehicle, model, patrolradius, name) {
    patrollocation = pos;
    if (!isdefined(patrolradius)) {
        patrolradius = 4000;
    }
    startingposition = scripts\cp_mp\killstreaks\chopper_support::getpathstart(patrollocation);
    startingangles = vectortoangles(patrollocation - startingposition);
    startingposition = drop_to_ground(startingposition);
    startingposition += (0, 0, level.var_103b912267715093);
    chopper = spawnvehicle(model, "dmz_ai_chopper", vehicle, startingposition, startingangles);
    if (!isdefined(chopper)) {
        return;
    }
    chopper.poi = scripts\mp\poi::function_6cc445c02b5effac(pos);
    chopper.speed = 60;
    chopper.originalspeed = chopper.speed;
    chopper.accel = 50;
    chopper.var_5424df833ac6a6f2 = chopper.accel;
    chopper.lifetime = 9999;
    chopper.team = "team_hundred_ninety_five";
    fakeowner = namespace_bfef6903bca5845d::function_af3034a7c69d7edb("team_hundred_ninety_five");
    chopper.owner = fakeowner;
    chopper.angles = startingangles;
    chopper.flaresreservecount = 2;
    chopper.pathstart = startingposition;
    chopper.pathgoal = patrollocation;
    chopper.currentaction = "patrol";
    chopper.currenttarget = undefined;
    chopper.heightoffset = (0, 0, 1500);
    chopper.ignoreengagedist = getdvarint(@"hash_db1f71003929b40e", 1) == 1;
    chopper.fpatrol = 1;
    chopper.handleeventcallback = &function_9910a6cd29958a7f;
    chopper setmaxpitchroll(15, 15);
    chopper vehicle_setspeed(chopper.speed, chopper.accel);
    chopper sethoverparams(50, 5, 2.5);
    chopper setturningability(0.5);
    chopper setyawspeed(100, 25, 25, 0.1);
    chopper setcandamage(1);
    chopper setneargoalnotifydist(768);
    chopper setvehicleteam(chopper.team);
    chopper.ignorelist = [chopper];
    chopper.stage3accradius = 35;
    chopper.crashoffset = chopper.heightoffset[2] - 250;
    chopper.currenthealth = level.var_426503bd899fe79d;
    chopper.health = level.var_426503bd899fe79d;
    chopper.maxhealth = level.var_426503bd899fe79d;
    chopper.damagestate = 0;
    chopper scripts\mp\sentientpoolmanager::registersentient("Level_Vehicle", chopper.team);
    chopper.threatlist = [];
    chopper.patrolwaittime = 0;
    chopper.var_31a7627753153dae = 6;
    chopper.currentstate = "patrol";
    chopper.patrollocation = patrollocation;
    chopper.patrolradius = patrolradius;
    chopper.var_445449fe0511cad6 = 0;
    chopper.funcs["patrol"] = &chopper_patrol;
    chopper.funcs["idle"] = &chopper_idle;
    chopper.funcs["attack"] = &chopper_attack;
    chopper thread chopper_think();
    chopper thread function_5159bd9771a61868();
    chopper thread function_a4f67639da6c8a7d();
    chopper vehicleshowonminimap(0);
    chopper.vehiclename = name;
    scripts\mp\vehicles\damage::set_post_mod_damage_callback(chopper.vehiclename, &function_c23bf5e680c0b0fc);
    scripts\mp\vehicles\damage::set_death_callback(chopper.vehiclename, &function_31529a6224103b1a);
    if (issharedfuncdefined("flares", "handleIncomingStinger")) {
        chopper thread [[ getsharedfunc("flares", "handleIncomingStinger") ]](&scripts\cp_mp\killstreaks\chopper_support::choppersupport_handlemissiledetection);
    }
    /#
        chopper thread function_6ccd7cebb1144062();
    #/
    return chopper;
}

// Namespace dmz_ai_chopper / namespace_8c3daeeca6bd42c0
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x861
// Size: 0x6d
function function_9910a6cd29958a7f(vehicle, ent, position, normal, normalspeed) {
    driver = scripts\cp_mp\vehicles\vehicle_occupancy::vehicle_occupancy_getdriver(vehicle);
    if (isdefined(driver)) {
        function_3be784d69cc30a0(driver, 500, 1);
        if (self.currentstate != "attack") {
            function_7743aeff79a08975("idle");
        }
    }
}

// Namespace dmz_ai_chopper / namespace_8c3daeeca6bd42c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d6
// Size: 0x91
function function_c23bf5e680c0b0fc(data) {
    scripts\cp_mp\killstreaks\chopper_support::function_400022dabdb64055(data);
    if (isdefined(self.var_c6c4017b9f56bff4)) {
        self thread [[ self.var_c6c4017b9f56bff4 ]](data);
    }
    if (isdefined(data.attacker) && isplayer(data.attacker)) {
        function_3be784d69cc30a0(data.attacker, data.damage, 1);
        if (self.currentstate != "attack") {
            function_7743aeff79a08975("idle");
        }
    }
    return true;
}

// Namespace dmz_ai_chopper / namespace_8c3daeeca6bd42c0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x970
// Size: 0x2f
function chopper_think() {
    self endon("death");
    self endon("explode");
    while (true) {
        [[ self.funcs[self.currentstate] ]]();
        waitframe();
    }
}

// Namespace dmz_ai_chopper / namespace_8c3daeeca6bd42c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9a7
// Size: 0x1d
function function_31529a6224103b1a(data) {
    scripts\cp_mp\killstreaks\chopper_support::choppersupport_handledeathdamage(data);
    self notify("death");
    return true;
}

// Namespace dmz_ai_chopper / namespace_8c3daeeca6bd42c0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9cd
// Size: 0x88
function function_5159bd9771a61868() {
    self endon("death");
    while (true) {
        if (isdefined(self.poi)) {
            foreach (player in level.poi[self.poi]["players"]) {
                function_3be784d69cc30a0(player, 10);
            }
        }
        wait 10;
    }
}

// Namespace dmz_ai_chopper / namespace_8c3daeeca6bd42c0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa5d
// Size: 0x108
function chopper_patrol() {
    self endon("death");
    self endon("state_change");
    self clearlookatent();
    self setneargoalnotifydist(300);
    if (!istrue(self.fpatrol)) {
        self vehicle_setspeed(20, 20);
    }
    self.fpatrol = 0;
    newgoal = self.patrollocation + anglestoforward((0, self.var_445449fe0511cad6, 0)) * int(self.patrolradius / 1.2);
    self.var_445449fe0511cad6 += 360 / self.var_31a7627753153dae;
    if (self.var_445449fe0511cad6 >= 360) {
        self.var_445449fe0511cad6 -= 360;
    }
    function_276c4659222d7c6a(newgoal, self.patrolwaittime > 0);
    wait self.patrolwaittime;
    self vehicle_setspeed(self.originalspeed, self.var_5424df833ac6a6f2);
    self.currentstate = "idle";
}

// Namespace dmz_ai_chopper / namespace_8c3daeeca6bd42c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb6d
// Size: 0x36
function function_7743aeff79a08975(state) {
    self.currentstate = state;
    self vehicle_setspeed(self.originalspeed, self.var_5424df833ac6a6f2);
    self notify("state_change");
}

// Namespace dmz_ai_chopper / namespace_8c3daeeca6bd42c0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbab
// Size: 0x4f
function chopper_idle() {
    self endon("death");
    self endon("state_change");
    target = function_ef8a0089f2c25099();
    if (isdefined(target)) {
        self.currenttarget = target;
        self.currentstate = "attack";
        return;
    }
    self.currentstate = "patrol";
}

// Namespace dmz_ai_chopper / namespace_8c3daeeca6bd42c0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc02
// Size: 0x7f
function chopper_attack() {
    self endon("death");
    self endon("state_change");
    self.fpatrol = 1;
    if (!isdefined(self.currenttarget)) {
        self.currentstate = "patrol";
        return;
    }
    if (isdefined(self.attackfunc)) {
        self [[ self.attackfunc ]](self.threatlist[self.currenttarget].player);
        return;
    }
    self.currentstate = "patrol";
}

// Namespace dmz_ai_chopper / namespace_8c3daeeca6bd42c0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc89
// Size: 0x4ce
function function_3be784d69cc30a0(player, value, ignoredist) {
    if (!isdefined(player) || !isdefined(player.guid)) {
        return;
    }
    if (!isdefined(self.threatlist[player.guid])) {
        self.threatlist[player.guid] = spawnstruct();
        self.threatlist[player.guid].player = player;
        self.threatlist[player.guid].threat = 0;
        self.threatlist[player.guid].ignoredist = 0;
    }
    if (istrue(ignoredist)) {
        self.threatlist[player.guid].ignoredist = ignoredist;
    }
    if (!isdefined(self.var_2edb1bbb4ad168ef) || !isdefined(self.var_38076ea016478f2f)) {
        self.var_2edb1bbb4ad168ef = player.guid;
        self.var_38076ea016478f2f = player.guid;
    } else if (!isdefined(self.threatlist[player.guid].up) && !isdefined(self.threatlist[player.guid].down) && self.var_38076ea016478f2f != player.guid) {
        self.threatlist[self.var_2edb1bbb4ad168ef].down = player.guid;
        self.threatlist[player.guid].up = self.var_2edb1bbb4ad168ef;
        self.var_2edb1bbb4ad168ef = player.guid;
    }
    self.threatlist[player.guid].threat = self.threatlist[player.guid].threat + value;
    if (value > 0) {
        if (self.var_38076ea016478f2f == player.guid) {
            return;
        }
        checkid = self.threatlist[player.guid].up;
        checkedids = [];
        while (isdefined(checkid) && self.threatlist[checkid].threat < self.threatlist[player.guid].threat) {
            if (array_contains(checkedids, checkid)) {
                self.threatlist = [];
                self.var_38076ea016478f2f = undefined;
                self.var_2edb1bbb4ad168ef = undefined;
                return;
            }
            checkedids[checkedids.size] = checkid;
            checkid = self.threatlist[checkid].up;
        }
        if (!isdefined(checkid) || checkid != self.threatlist[player.guid].up) {
            function_83388ed388ddbddc(player.guid);
            function_9e2e41a3f8f5ded(player.guid, checkid);
        }
        return;
    }
    if (self.threatlist[player.guid].threat <= 0) {
        function_83388ed388ddbddc(player.guid);
        return;
    }
    if (self.var_2edb1bbb4ad168ef == player.guid) {
        return;
    }
    checkid = self.threatlist[player.guid].down;
    checkedids = [];
    while (isdefined(checkid) && self.threatlist[checkid].threat > self.threatlist[player.guid].threat) {
        if (array_contains(checkedids, checkid)) {
            self.threatlist = [];
            self.var_38076ea016478f2f = undefined;
            self.var_2edb1bbb4ad168ef = undefined;
            return;
        }
        checkedids[checkedids.size] = checkid;
        checkid = self.threatlist[checkid].down;
    }
    if (!isdefined(checkid) || checkid != self.threatlist[player.guid].down) {
        function_83388ed388ddbddc(player.guid);
        function_9e2e41a3f8f5ded(player.guid, self.threatlist[checkid].up);
    }
}

// Namespace dmz_ai_chopper / namespace_8c3daeeca6bd42c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x115f
// Size: 0x15b
function function_83388ed388ddbddc(guid) {
    if (self.var_38076ea016478f2f == guid && self.var_2edb1bbb4ad168ef == guid) {
        self.var_38076ea016478f2f = undefined;
        self.var_2edb1bbb4ad168ef = undefined;
        return;
    }
    if (isdefined(self.threatlist[guid].down)) {
        if (!isdefined(self.threatlist[guid].up)) {
            self.var_38076ea016478f2f = self.threatlist[guid].down;
        }
        self.threatlist[self.threatlist[guid].down].up = self.threatlist[guid].up;
    }
    if (isdefined(self.threatlist[guid].up)) {
        if (!isdefined(self.threatlist[guid].down)) {
            self.var_2edb1bbb4ad168ef = self.threatlist[guid].up;
        }
        self.threatlist[self.threatlist[guid].up].down = self.threatlist[guid].down;
    }
}

// Namespace dmz_ai_chopper / namespace_8c3daeeca6bd42c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12c2
// Size: 0x138
function function_9e2e41a3f8f5ded(guid, guidbefore) {
    if (!isdefined(guidbefore)) {
        self.threatlist[self.var_38076ea016478f2f].up = guid;
        self.threatlist[guid].down = self.var_38076ea016478f2f;
        self.threatlist[guid].up = undefined;
        self.var_38076ea016478f2f = guid;
        return;
    }
    if (isdefined(self.threatlist[guidbefore].down)) {
        self.threatlist[self.threatlist[guidbefore].down].up = guid;
    }
    self.threatlist[guid].down = self.threatlist[guidbefore].down;
    self.threatlist[guidbefore].down = guid;
    self.threatlist[guid].up = guidbefore;
    if (!isdefined(self.threatlist[guid].down)) {
        self.var_2edb1bbb4ad168ef = guid;
    }
}

/#

    // Namespace dmz_ai_chopper / namespace_8c3daeeca6bd42c0
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1402
    // Size: 0x8a
    function function_204882e766bf721d() {
        while (true) {
            foreach (agent in level.agentarray) {
                if (!isdefined(agent.guid)) {
                    continue;
                }
                if (percent_chance(50)) {
                    function_3be784d69cc30a0(agent, randomint(400));
                }
            }
            wait 1;
        }
    }

    // Namespace dmz_ai_chopper / namespace_8c3daeeca6bd42c0
    // Params 0, eflags: 0x0
    // Checksum 0x0, Offset: 0x1494
    // Size: 0x5b
    function function_6ccd7cebb1144062() {
        while (true) {
            if (getdvarint(@"hash_9fea139a8dd1eaae", 0) == 1) {
                self notify("<dev string:x1c>");
                choppersupport_crash(100, level.players[0].origin);
                setdvar(@"hash_9fea139a8dd1eaae", 0);
            }
            wait 1;
        }
    }

#/

// Namespace dmz_ai_chopper / namespace_8c3daeeca6bd42c0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14f7
// Size: 0xc5
function function_ef8a0089f2c25099() {
    checkedids = [];
    for (checktargetid = self.var_38076ea016478f2f; isdefined(checktargetid) && isdefined(self.threatlist[checktargetid]); checktargetid = self.threatlist[checktargetid].down) {
        if (array_contains(checkedids, checktargetid)) {
            self.threatlist = [];
            self.var_38076ea016478f2f = undefined;
            self.var_2edb1bbb4ad168ef = undefined;
            return undefined;
        }
        checkedids[checkedids.size] = checktargetid;
        threatinfo = self.threatlist[checktargetid];
        if (function_9eda5834c2fa3898(threatinfo)) {
            canseetarget = chopper_canseetarget(threatinfo.player);
            if (canseetarget) {
                return checktargetid;
            }
        }
    }
    return undefined;
}

// Namespace dmz_ai_chopper / namespace_8c3daeeca6bd42c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15c5
// Size: 0x154
function chopper_canseetarget(targetplayer, overridetestpoint) {
    if (targetplayer.notarget) {
        return 0;
    }
    contentsoverride = create_contents(0, 1, 0, 1, 0, 0, 0, 1, 1, 0);
    ignorelist = self.ignorelist;
    if (isdefined(targetplayer.externalvehicle)) {
        ignorelist[ignorelist.size] = targetplayer.externalvehicle;
        if (isdefined(targetplayer.externalvehicle.turrets)) {
            ignorelist = array_combine(ignorelist, targetplayer.externalvehicle.turrets);
        }
    }
    linkedchildren = self getlinkedchildren();
    if (isdefined(linkedchildren)) {
        foreach (child in linkedchildren) {
            ignorelist[ignorelist.size] = child;
        }
    }
    if (isdefined(targetplayer.vehicle)) {
        ignorelist[ignorelist.size] = targetplayer.vehicle;
    }
    return ray_trace_passed(ter_op(isdefined(overridetestpoint), overridetestpoint, self.origin), targetplayer gettagorigin("j_head"), ignorelist, contentsoverride);
}

// Namespace dmz_ai_chopper / namespace_8c3daeeca6bd42c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1722
// Size: 0x12b
function tracegroundpoint(x, y) {
    self endon("death");
    self endon("acquiringTarget");
    self endon("leaving");
    z = -99999;
    currz = self.origin[2] + 2000;
    minz = level.averagealliesz;
    ignorelist = [self];
    if (isdefined(self.dropcrates)) {
        foreach (crate in self.dropcrates) {
            ignorelist[ignorelist.size] = crate;
        }
    }
    trc = sphere_trace((x, y, currz), (x, y, z), 800, ignorelist, undefined, 1);
    if (trc["position"][2] < minz) {
        hightrace = minz;
    } else {
        hightrace = trc["position"][2];
    }
    return hightrace;
}

// Namespace dmz_ai_chopper / namespace_8c3daeeca6bd42c0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1856
// Size: 0x5e
function getcorrectheight(x, y, rand) {
    var_dc8bb6300463cf1e = self.heightoffset[2];
    groundheight = tracegroundpoint(x, y);
    trueheight = groundheight + var_dc8bb6300463cf1e;
    trueheight += randomint(rand);
    return trueheight;
}

// Namespace dmz_ai_chopper / namespace_8c3daeeca6bd42c0
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x18bd
// Size: 0x11e
function function_e9cb677b6ba63162(target, dist, checks, startrot) {
    self endon("death");
    self endon("crashing");
    self endon("state_change");
    if (!isdefined(startrot)) {
        startrot = 0;
    }
    toheli = self.origin - target.origin;
    toheli = vectornormalize((toheli[0], toheli[1], 0)) * dist;
    for (rot = startrot; rot < startrot + 360; rot += 360 / checks) {
        testpos = rotatevector(toheli, (0, rot, 0));
        testpos += target.origin + self.heightoffset;
        if (scripts\mp\outofbounds::ispointinoutofbounds(testpos)) {
            continue;
        }
        contentsoverride = create_contents(0, 1, 0, 1, 0, 0, 0, 1, 1);
        canseetarget = chopper_canseetarget(target, testpos);
        if (canseetarget) {
            self setlookatent(target);
            function_276c4659222d7c6a(testpos, 1);
            return true;
        }
    }
    return false;
}

// Namespace dmz_ai_chopper / namespace_8c3daeeca6bd42c0
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19e4
// Size: 0x27b
function function_9f656e924a854c1b(target, dist, checks, startrot, overrideheight, var_4f4c3a288df043c0, var_5f1f469d27d6af1a) {
    self endon("death");
    self endon("crashing");
    self endon("state_change");
    if (!isdefined(target) || !isreallyalive(target)) {
        return false;
    }
    toheli = self.origin - target.origin;
    toheli = vectornormalize((toheli[0], toheli[1], 0)) * dist;
    if (!isdefined(var_4f4c3a288df043c0)) {
        var_4f4c3a288df043c0 = 2;
    }
    if (!isdefined(startrot)) {
        startrot = 0;
    }
    for (rot = startrot; rot < startrot + 360; rot += 360 / checks) {
        if (!isdefined(target) || !isreallyalive(target)) {
            return false;
        }
        testdir = rotatevector(toheli, (0, rot, 0));
        testpos = testdir + target.origin + ter_op(isdefined(overrideheight), (0, 0, overrideheight), self.heightoffset);
        contentsoverride = create_contents(0, 1, 0, 1, 0, 0, 0, 1, 1);
        canseetarget = chopper_canseetarget(target);
        canpathforward = ray_trace_passed(testpos, testpos - testdir * var_4f4c3a288df043c0, self.ignorelist, contentsoverride);
        if (canseetarget && canpathforward) {
            self.strafing = 1;
            function_276c4659222d7c6a(testpos, 1, (0, 0, 0), 1);
            self vehicle_setspeed(self.originalspeed * 2, self.accel);
            wait 1.5;
            self clearlookatent();
            if (!isdefined(target) || !isreallyalive(target)) {
                return false;
            }
            self notify("strafe_start");
            if (isdefined(self.funcs["strafe"])) {
                self thread [[ self.funcs["strafe"] ]](target);
            }
            function_276c4659222d7c6a(testpos - testdir * var_4f4c3a288df043c0, !isdefined(var_5f1f469d27d6af1a), undefined, 1);
            self notify("strafe_end");
            self vehicle_setspeed(self.originalspeed, self.accel);
            if (!isdefined(target) || !isreallyalive(target)) {
                return false;
            }
            self setlookatent(target);
            self.strafing = 0;
            return true;
        }
    }
    return false;
}

// Namespace dmz_ai_chopper / namespace_8c3daeeca6bd42c0
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c68
// Size: 0x26a
function function_276c4659222d7c6a(target, forcestopatgoal, forceheight, ignoreblocks) {
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    self endon("state_change");
    newpos = undefined;
    testtarget = target;
    if (!isvector(target)) {
        testtarget = target.origin;
    }
    ignorelist = self.ignorelist;
    linkedchildren = self getlinkedchildren();
    if (isdefined(linkedchildren)) {
        foreach (child in linkedchildren) {
            ignorelist[ignorelist.size] = child;
        }
    }
    while (true) {
        currentpos = self.origin;
        initialgoalpos = testtarget * (1, 1, 0) + (0, 0, self.origin[2]);
        obstructed = 0;
        xpos = testtarget[0];
        ypos = testtarget[1];
        if (istrue(ignoreblocks)) {
            obstructiontrace = sphere_trace(currentpos, initialgoalpos, 512, ignorelist);
            if (isdefined(obstructiontrace)) {
                if (obstructiontrace["hittype"] != "hittype_none") {
                    xpos = obstructiontrace["position"][0];
                    ypos = obstructiontrace["position"][1];
                    obstructed = 1;
                }
            }
        }
        if (isdefined(forceheight)) {
            newpos = testtarget + forceheight;
        } else if (istrue(self.evasivemaneuvers)) {
            newx = xpos + randomintrange(-500, 500);
            newy = ypos + randomintrange(-500, 500);
            properz = getcorrectheight(newx, newy, 350);
            newpos = (newx, newy, properz);
        } else {
            properz = getcorrectheight(xpos, ypos, 20);
            newpos = (xpos, ypos, properz);
        }
        stopatgoal = 0;
        if (istrue(forcestopatgoal) && !istrue(obstructed)) {
            stopatgoal = forcestopatgoal;
        }
        self setvehgoalpos(newpos, stopatgoal);
        waittill_any_2("near_goal", "begin_evasive_maneuvers");
        if (!istrue(obstructed)) {
            break;
        }
    }
}

// Namespace dmz_ai_chopper / namespace_8c3daeeca6bd42c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eda
// Size: 0xd9
function function_9eda5834c2fa3898(targetinfo) {
    extracheck = !isdefined(self.var_f09811d8bb92df96) || self [[ self.var_f09811d8bb92df96 ]](targetinfo.player);
    extracheck &= targetinfo.ignoredist || isreallyalive(targetinfo.player) && distance2dsquared(self.origin, targetinfo.player.origin) < 36000000;
    targetinfo.ignoredist = 0;
    return isdefined(targetinfo.player) && !targetinfo.player.notarget && isreallyalive(targetinfo.player) && extracheck;
}

// Namespace dmz_ai_chopper / namespace_8c3daeeca6bd42c0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fbc
// Size: 0x73
function function_a4f67639da6c8a7d() {
    level endon("game_ended");
    self endon("chopperSupport_gone");
    owner = self.owner;
    self waittill("death");
    if (!isdefined(self)) {
        return;
    }
    if (issharedfuncdefined("killstreak", "isKillstreakWeapon")) {
        if (![[ getsharedfunc("killstreak", "isKillstreakWeapon") ]](self.killedbyweapon)) {
            choppersupport_crash(100);
        }
    }
    chopper_explode();
}

// Namespace dmz_ai_chopper / namespace_8c3daeeca6bd42c0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2037
// Size: 0x6f
function chopper_explode() {
    self notify("explode");
    self notify("state_change");
    self radiusdamage(self.origin, 1000, 200, 200, undefined, "MOD_EXPLOSIVE", "chopper_support_turret_mp");
    self setscriptablepartstate("explode", "on", 0);
    if (isdefined(self.lootfunc)) {
        self [[ self.lootfunc ]]();
    }
    wait 0.35;
    chopper_cleanup(1);
}

// Namespace dmz_ai_chopper / namespace_8c3daeeca6bd42c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20ae
// Size: 0xf6
function choppersupport_crash(speed, var_1f1fbcef1d9b080a) {
    self endon("explode");
    self setscriptablepartstate("crash", "on", 0);
    if (isdefined(self.killcament)) {
        self.killcament unlink();
        self.killcament.origin = self.origin + (0, 0, 100);
    }
    self clearlookatent();
    self notify("crashing");
    self.iscrashing = 1;
    self vehicle_setspeed(speed, 20, 20);
    self setneargoalnotifydist(100);
    var_6847739e80fb4e81 = function_e2c4e07ce9823056(3500, 500, 1000);
    if (isdefined(var_1f1fbcef1d9b080a)) {
        var_6847739e80fb4e81 = var_1f1fbcef1d9b080a;
    }
    if (!isdefined(var_6847739e80fb4e81)) {
        return;
    }
    self setvehgoalpos(var_6847739e80fb4e81, 0);
    thread chopper_spinout(speed);
    self vehicle_turnengineoff();
    waittill_any_timeout_2(5, "collision", "near_goal");
}

// Namespace dmz_ai_chopper / namespace_8c3daeeca6bd42c0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21ac
// Size: 0x21b
function function_e2c4e07ce9823056(crashdist, var_6c56ff5ecc704c48, var_6c7af55ecc98b102) {
    crashstart = self.origin;
    crashoffset = self.crashoffset;
    crashpos = undefined;
    jetforward = anglestoforward(self.angles);
    jetright = anglestoright(self.angles);
    crashend = crashstart + jetforward * crashdist - (0, 0, crashoffset);
    if (ray_trace_passed(crashstart, crashend, self) && !scripts\mp\outofbounds::ispointinoutofbounds(crashend)) {
        crashpos = crashend;
        return crashpos;
    }
    crashend = crashstart - jetforward * crashdist - (0, 0, crashoffset);
    if (ray_trace_passed(crashstart, crashend, self) && !scripts\mp\outofbounds::ispointinoutofbounds(crashend)) {
        crashpos = crashend;
        return crashpos;
    }
    crashend = crashstart + jetright * crashdist - (0, 0, crashoffset);
    if (ray_trace_passed(crashstart, crashend, self) && !scripts\mp\outofbounds::ispointinoutofbounds(crashend)) {
        crashpos = crashend;
        return crashpos;
    }
    crashend = crashstart - jetright * crashdist - (0, 0, crashoffset);
    if (ray_trace_passed(crashstart, crashend, self) && !scripts\mp\outofbounds::ispointinoutofbounds(crashend)) {
        crashpos = crashend;
        return crashpos;
    }
    crashend = crashstart + 0.707 * crashdist * (jetforward + jetright) - (0, 0, crashoffset);
    if (ray_trace_passed(crashstart, crashend, self) && !scripts\mp\outofbounds::ispointinoutofbounds(crashend)) {
        crashpos = crashend;
        return crashpos;
    }
    crashend = crashstart + 0.707 * crashdist * (jetforward - jetright) - (0, 0, crashoffset);
    if (ray_trace_passed(crashstart, crashend, self) && !scripts\mp\outofbounds::ispointinoutofbounds(crashend)) {
        crashpos = crashend;
        return crashpos;
    }
    crashend = crashstart + 0.707 * crashdist * (jetright - jetforward) - (0, 0, crashoffset);
    crashtrace = ray_trace(crashstart, crashend, self);
    if (ray_trace_passed(crashstart, crashend, self) && !scripts\mp\outofbounds::ispointinoutofbounds(crashend)) {
        crashpos = crashend;
        return crashpos;
    }
    crashend = crashstart + 0.707 * crashdist * (-1 * jetforward - jetright) - (0, 0, crashoffset);
    if (ray_trace_passed(crashstart, crashend, self) && !scripts\mp\outofbounds::ispointinoutofbounds(crashend)) {
        crashpos = crashend;
        return crashpos;
    }
    return crashpos;
}

// Namespace dmz_ai_chopper / namespace_8c3daeeca6bd42c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23d0
// Size: 0x4c
function chopper_spinout(speed) {
    self endon("death");
    self setyawspeed(speed, 50, 50, 0.5);
    while (isdefined(self)) {
        self settargetyaw(self.angles[1] + speed * 0.4);
        wait 0.5;
    }
}

// Namespace dmz_ai_chopper / namespace_8c3daeeca6bd42c0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2424
// Size: 0xd6
function chopper_splash(bossorigin, poiname) {
    if (level.var_eda461803cdadc2c < 0) {
        return;
    }
    if (level.var_eda461803cdadc2c > 0) {
        playerlist = [];
        foreach (player in level.players) {
            if (distance2dsquared(player.origin, bossorigin) < level.var_eda461803cdadc2c) {
                playerlist[playerlist.size] = player;
            }
        }
    } else {
        playerlist = level.players;
    }
    scripts\mp\gametypes\br_gametype_dmz::showdmzsplash("dmz_boss_chopper_inbound", playerlist, poiname);
    namespace_446fc987a980892f::playevent("boss_near", playerlist);
}

// Namespace dmz_ai_chopper / namespace_8c3daeeca6bd42c0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2502
// Size: 0x6a
function function_4ad380a5e1b9c51a() {
    droplocation = function_3f0075ed8069575c(self.origin + (0, 0, 500));
    if (isdefined(droplocation)) {
        plundercrate = scripts\cp_mp\killstreaks\airdrop::dropbrlootchoppercrate(self.origin, droplocation);
        triggerobject = scripts\cp_mp\killstreaks\airdrop::gettriggerobject(plundercrate);
        triggerobject.usetimeoverride = 10;
    }
}

// Namespace dmz_ai_chopper / namespace_8c3daeeca6bd42c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2574
// Size: 0x83
function function_3f0075ed8069575c(starttrace) {
    droplocation = undefined;
    endtrace = starttrace - (0, 0, 20000);
    ignorelist = [self, self.frontturret];
    trace = scripts\engine\trace::ray_trace(starttrace, endtrace, ignorelist);
    if (isdefined(trace) && trace["hittype"] != "hittype_none") {
        droplocation = trace["position"];
    }
    return droplocation;
}

// Namespace dmz_ai_chopper / namespace_8c3daeeca6bd42c0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2600
// Size: 0x289
function function_2c83d3d61191e88e(player) {
    self.itemsdropped = 0;
    pickups = [];
    for (i = 0; i < 3; i++) {
        pos = drop_to_ground(self.origin + rotatepointaroundvector((0, 0, 1), (20, 0, 0), 120 * i));
        dropinfo = scripts\mp\gametypes\br_pickups::getitemdropinfo(pos);
        streak = ter_op(percent_chance(50), "brloot_killstreak_clusterstrike", "brloot_killstreak_precision_airstrike");
        pickup = scripts\mp\gametypes\br_pickups::spawnpickup(streak, dropinfo, 1);
        self.itemsdropped++;
    }
    for (i = 0; i < 8; i++) {
        pos = drop_to_ground(self.origin + rotatepointaroundvector((0, 0, 1), (40, 0, 0), 45 * i));
        dropinfo = scripts\mp\gametypes\br_pickups::getitemdropinfo(pos);
        var_8a3a7194e96ea2c = ter_op(i % 2 == 0, "brloot_valuable_goldbar", "brloot_plunder_cash_rare_1");
        pickup = scripts\mp\gametypes\br_pickups::spawnpickup(var_8a3a7194e96ea2c, dropinfo, 1);
        self.itemsdropped++;
    }
    for (i = 0; i < 6; i++) {
        var_1e251ffd71396d15 = random(["brloot_weapon_sm_papa90_rare", "brloot_weapon_sh_romeo870_rare", "brloot_weapon_sn_sbeta_lege"]);
        itemname = ter_op(i % 3 == 0, "brloot_armor_plate", var_1e251ffd71396d15);
        var_144769f518d71226 = ter_op(i % 3 == 0, 8, 1);
        pos = drop_to_ground(self.origin + rotatepointaroundvector((0, 0, 1), (30, 0, 0), 60 * i));
        dropinfo = scripts\mp\gametypes\br_pickups::getitemdropinfo(pos);
        pickup = scripts\mp\gametypes\br_pickups::spawnpickup(itemname, dropinfo, var_144769f518d71226);
        pickups[pickups.size] = pickup;
        self.itemsdropped++;
    }
    foreach (ent in pickups) {
        ent.lootsource = "loot_chopper";
    }
}

// Namespace dmz_ai_chopper / namespace_8c3daeeca6bd42c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2891
// Size: 0xa5
function chopper_cleanup(wasdestroyed) {
    if (isdefined(self.frontturret)) {
        self.frontturret setentityowner(undefined);
        self.frontturret.groundtargetent delete();
        self.frontturret delete();
    }
    if (isdefined(self.rearturret)) {
        self.rearturret setentityowner(undefined);
        self.rearturret.groundtargetent delete();
        self.rearturret delete();
    }
    scripts\cp_mp\vehicles\vehicle_tracking::vehicle_tracking_deregisterinstance(self);
    scripts\cp_mp\vehicles\vehicle_tracking::_deletevehicle(self);
}

