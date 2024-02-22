// mwiii decomp prototype
#using script_4c770a9a4ad7659c;
#using scripts\common\utility.gsc;
#using scripts\common\vehicle_paths.gsc;
#using script_3214e6fcdce468a7;
#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using scripts\mp\sentientpoolmanager.gsc;
#using script_371b4c2ab5861e62;
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using scripts\cp_mp\killstreaks\chopper_support.gsc;
#using scripts\common\vehicle_code.gsc;
#using scripts\common\vehicle_aianim.gsc;
#using script_2d05e472a90adb1d;

#namespace namespace_d595138a91ee4a1d;

// Namespace namespace_d595138a91ee4a1d/namespace_5d57e6b81b105f5d
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x328
// Size: 0x116
function function_f1620ddb70094ea9(var_20511bb18fa92fde, var_f1b55da19f091702, var_5cd509db6b15e83, var_fa78bf82ddd9f37c, heli_team) {
    heli = undefined;
    var_f1b55da19f091702 = function_53c4c53197386572(var_f1b55da19f091702, 0);
    var_fa78bf82ddd9f37c = function_53c4c53197386572(var_fa78bf82ddd9f37c, 1);
    spawndata = spawnstruct();
    spawndata.origin = var_20511bb18fa92fde.origin + (0, 0, 128);
    spawndata.angles = (0, 0, 0);
    if (isdefined(var_20511bb18fa92fde.angles)) {
        spawndata.angles = (0, var_20511bb18fa92fde.angles[1], 0);
    }
    spawndata.team = heli_team;
    heli = vehicle_spawn(var_5cd509db6b15e83, spawndata);
    /#
        assertex(isdefined(heli), "Did not spawn a valid heli!");
    #/
    if (isdefined(heli)) {
        heli.var_f1b55da19f091702 = var_f1b55da19f091702;
        heli.vehiclename = var_5cd509db6b15e83;
        heli function_1719f58673bf5508();
    }
    return heli;
}

// Namespace namespace_d595138a91ee4a1d/namespace_5d57e6b81b105f5d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x446
// Size: 0x174
function function_1719f58673bf5508() {
    self.speed = 100;
    if (iscp()) {
        self.speed = 50;
    }
    self.usedpositions = [];
    self.var_494fe868127e6381 = self.speed;
    self.accel = 50;
    self.heightoffset = (0, 0, 1280);
    self setmaxpitchroll(15, 15);
    self vehicle_setspeed(self.speed, self.accel);
    if (self.var_f1b55da19f091702) {
        self sethoverparams(0, 0, 0);
    } else {
        self sethoverparams(50, 5, 2.5);
    }
    self setturningability(0.5);
    self setyawspeed(100, 25, 25, 0.1);
    self setcandamage(1);
    self setneargoalnotifydist(512);
    self setvehicleteam(self.team);
    self.ignorelist = [0:self];
    self.crashoffset = 1030;
    self.currenthealth = 2500;
    self.health = 2500;
    self.maxhealth = 2500;
    self.damagestate = 0;
    namespace_6d9917c3dc05dbe9::registersentient("Level_Vehicle", self.team);
    self.attackers = [];
    thread function_214472d69776db78();
    if (!isdefined(level.averagealliesz)) {
        level.averagealliesz = 0;
    }
}

// Namespace namespace_d595138a91ee4a1d/namespace_5d57e6b81b105f5d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x5c1
// Size: 0x8e
function function_19139560550e356e(target_location) {
    self notify("new_orders");
    self endon("new_orders");
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    if (!isdefined(target_location)) {
        target_location = self.origin;
    }
    self sethoverparams(50, 5, 2.5);
    self vehicle_setspeed(40, 15);
    wait(2);
    function_3c2a39b0d7da4e01(target_location, 1);
    self.var_f1b55da19f091702 = 0;
    self vehicle_setspeed(self.var_494fe868127e6381, self.accel);
}

// Namespace namespace_d595138a91ee4a1d/namespace_5d57e6b81b105f5d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x656
// Size: 0x12c
function function_5cf894c96d44c40b(target_location) {
    self notify("new_orders");
    self endon("new_orders");
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    if (iscp()) {
        var_6901d21f69488e0a = self.origin + (0, 0, 1000);
        self setvehgoalpos(var_6901d21f69488e0a, 1);
        while (distance(self.origin, var_6901d21f69488e0a) > 50) {
            waitframe();
        }
    }
    if (!isdefined(target_location)) {
        target_location = self.origin;
    }
    if (!isvector(target_location)) {
        target_location = target_location.origin;
    }
    var_48418ebe2fd4a86a = 10000;
    if (iscp()) {
        var_48418ebe2fd4a86a = 3000;
    }
    function_3c2a39b0d7da4e01(target_location, 1, var_48418ebe2fd4a86a);
    while (distance2dsquared(self.origin, target_location) > 65536) {
        waitframe();
    }
    if (iscp()) {
        self notify("started_landing");
    }
    self vehicle_setspeed(40, 15);
    function_3c2a39b0d7da4e01(target_location, 1, 128);
    self.var_f1b55da19f091702 = 1;
    self notify("ai_spawn_director_heli_landed");
    self sethoverparams(0, 0, 0);
}

// Namespace namespace_d595138a91ee4a1d/namespace_5d57e6b81b105f5d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x789
// Size: 0xe7
function function_ff4065536bad7017(start_node, var_e6013eac45290cab) {
    self notify("new_orders");
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    self endon("new_orders");
    self.var_b3ad7bc0c890232c = start_node;
    path_end = 0;
    while (!path_end) {
        if (!isdefined(self.var_b3ad7bc0c890232c.target)) {
            path_end = 1;
            self notify("ai_spawn_director_heli_reached_end_path");
        }
        function_3c2a39b0d7da4e01(self.var_b3ad7bc0c890232c, path_end);
        if (!path_end) {
            var_6ba7370057392ca1 = self.var_b3ad7bc0c890232c.target;
            self.var_b3ad7bc0c890232c = getvehiclenode(var_6ba7370057392ca1, "targetname");
            if (!isdefined(self.var_b3ad7bc0c890232c)) {
                /#
                    assertmsg("A vehicle path has a bad next node. Unable to find vehicle node with targetname: " + var_6ba7370057392ca1 + ".");
                #/
                path_end = 1;
            }
        }
        waitframe();
    }
}

// Namespace namespace_d595138a91ee4a1d/namespace_5d57e6b81b105f5d
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x877
// Size: 0x288
function function_3c2a39b0d7da4e01(target, var_6c814cee8d2bd65e, var_7403e5e436347d6b, var_d37d6f45a6bae8f9, goalyaw) {
    self notify("state_change");
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    self endon("state_change");
    newpos = undefined;
    var_4e6df96d95bf50bc = target;
    if (!isvector(target)) {
        var_4e6df96d95bf50bc = target.origin;
    }
    while (!isdefined(self.ignorelist)) {
        waitframe();
    }
    while (1) {
        currentpos = self.origin;
        var_2eca7b12d2ee27ba = var_4e6df96d95bf50bc * (1, 1, 0) + (0, 0, self.origin[2]);
        var_158f8e4d0e511638 = 0;
        xpos = var_4e6df96d95bf50bc[0];
        ypos = var_4e6df96d95bf50bc[1];
        if (istrue(var_d37d6f45a6bae8f9)) {
            var_691aa1d5da533612 = sphere_trace(currentpos, var_2eca7b12d2ee27ba, 256, self.ignorelist);
            if (isdefined(var_691aa1d5da533612)) {
                if (var_691aa1d5da533612["hittype"] != "hittype_none") {
                    xpos = var_691aa1d5da533612["position"][0];
                    ypos = var_691aa1d5da533612["position"][1];
                    var_158f8e4d0e511638 = 1;
                }
            }
        }
        if (isdefined(var_7403e5e436347d6b)) {
            newpos = (var_4e6df96d95bf50bc[0], var_4e6df96d95bf50bc[1], var_7403e5e436347d6b);
        } else if (iscp()) {
            newpos = (var_4e6df96d95bf50bc[0], var_4e6df96d95bf50bc[1], var_4e6df96d95bf50bc[2]);
        } else {
            var_7504c8791e34dc73 = function_7c904b96baa6d5fb(xpos, ypos, 20);
            newpos = (xpos, ypos, var_7504c8791e34dc73);
        }
        stopatgoal = 0;
        if (istrue(var_6c814cee8d2bd65e) && !istrue(var_158f8e4d0e511638)) {
            stopatgoal = var_6c814cee8d2bd65e;
        }
        self setvehgoalpos(newpos, stopatgoal);
        if (isdefined(goalyaw)) {
            self setgoalyaw(goalyaw);
        }
        waittill_any_3("goal", "near_goal", "begin_evasive_maneuvers");
        if (iscp() && !isvector(target) && isdefined(target.script_delay)) {
            self sethoverparams(200, 5, 2.5);
            self vehicle_setspeed(2, 30, 30);
            self setyawspeed(0, 25, 25, 0.1);
            wait(target.script_delay);
            self sethoverparams(0, 0, 0);
            self vehicle_setspeed(self.speed, self.accel);
            self setyawspeed(100, 25, 25, 0.1);
        }
        if (!istrue(var_158f8e4d0e511638)) {
            break;
        }
    }
}

// Namespace namespace_d595138a91ee4a1d/namespace_5d57e6b81b105f5d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb06
// Size: 0x56
function function_7c904b96baa6d5fb(x, y, rand) {
    var_dc8bb6300463cf1e = 1280;
    var_e7a7d619f927d791 = function_aca7615e8bddce42(x, y);
    var_1dc672cfe0f0128e = var_e7a7d619f927d791 + var_dc8bb6300463cf1e;
    var_1dc672cfe0f0128e = var_1dc672cfe0f0128e + randomint(rand);
    return var_1dc672cfe0f0128e;
}

// Namespace namespace_d595138a91ee4a1d/namespace_5d57e6b81b105f5d
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb64
// Size: 0x12c
function function_aca7615e8bddce42(x, y) {
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
    var_e96577032a7740fc = sphere_trace((x, y, var_e531afbe1391f499), (x, y, z), 800, ignorelist, undefined, 1);
    if (var_e96577032a7740fc["position"][2] < minz) {
        var_fa83e3a4c4e6902 = minz;
    } else {
        var_fa83e3a4c4e6902 = var_e96577032a7740fc["position"][2];
    }
    return var_fa83e3a4c4e6902;
}

// Namespace namespace_d595138a91ee4a1d/namespace_5d57e6b81b105f5d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc98
// Size: 0xb3
function function_214472d69776db78() {
    level endon("game_ended");
    self endon("ai_spawn_director_heli_landed");
    while (isdefined(self) && !istrue(self.burningdown)) {
        waitframe();
    }
    if (!isdefined(self)) {
        return;
    }
    if (istrue(self.nocrash) && isdefined(self.var_eae10920b9197a32)) {
        self [[ self.var_eae10920b9197a32 ]]();
        return;
    }
    function_841509516e1e0315(100);
    wait(0.35);
    if (isdefined(self)) {
        self dodamage(self.maxhealth + 100000, self.origin, undefined, undefined, "MOD_SUICIDE");
        self radiusdamage(self.origin, 1000, 200, 200, undefined, "MOD_EXPLOSIVE", "chopper_support_turret_mp");
    }
}

// Namespace namespace_d595138a91ee4a1d/namespace_5d57e6b81b105f5d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd52
// Size: 0xeb
function function_841509516e1e0315(speed) {
    self endon("explode");
    self function_247ad6a91f6a4ffe(0);
    self vehphys_setdefaultmotion();
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
    var_6847739e80fb4e81 = function_1427dabcab7068cb(2000, 500, 1000);
    if (!isdefined(var_6847739e80fb4e81)) {
        return;
    }
    self setvehgoalpos(var_6847739e80fb4e81, 0);
    thread function_acc5857fbb90a8be(speed);
    self vehicle_turnengineoff();
    self waittill("near_goal");
}

// Namespace namespace_d595138a91ee4a1d/namespace_5d57e6b81b105f5d
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe44
// Size: 0x1c4
function function_1427dabcab7068cb(var_6f8d59f68bd2b46c, var_6c56ff5ecc704c48, var_6c7af55ecc98b102) {
    var_b2b5f5510c5d94e0 = self.origin;
    crashoffset = self.crashoffset;
    var_543f2191dde2b7f6 = undefined;
    var_6c5ceed9b00eb7d5 = anglestoforward(self.angles);
    var_5cc1d6dd55c49e3a = anglestoright(self.angles);
    var_428a3d9115f72081 = var_b2b5f5510c5d94e0 + var_6c5ceed9b00eb7d5 * var_6f8d59f68bd2b46c - (0, 0, crashoffset);
    if (ray_trace_passed(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self)) {
        var_543f2191dde2b7f6 = var_428a3d9115f72081;
        return var_543f2191dde2b7f6;
    }
    var_428a3d9115f72081 = var_b2b5f5510c5d94e0 - var_6c5ceed9b00eb7d5 * var_6f8d59f68bd2b46c - (0, 0, crashoffset);
    if (ray_trace_passed(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self)) {
        var_543f2191dde2b7f6 = var_428a3d9115f72081;
        return var_543f2191dde2b7f6;
    }
    var_428a3d9115f72081 = var_b2b5f5510c5d94e0 + var_5cc1d6dd55c49e3a * var_6f8d59f68bd2b46c - (0, 0, crashoffset);
    if (ray_trace_passed(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self)) {
        var_543f2191dde2b7f6 = var_428a3d9115f72081;
        return var_543f2191dde2b7f6;
    }
    var_428a3d9115f72081 = var_b2b5f5510c5d94e0 - var_5cc1d6dd55c49e3a * var_6f8d59f68bd2b46c - (0, 0, crashoffset);
    if (ray_trace_passed(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self)) {
        var_543f2191dde2b7f6 = var_428a3d9115f72081;
        return var_543f2191dde2b7f6;
    }
    var_428a3d9115f72081 = var_b2b5f5510c5d94e0 + 0.707 * var_6f8d59f68bd2b46c * (var_6c5ceed9b00eb7d5 + var_5cc1d6dd55c49e3a) - (0, 0, crashoffset);
    if (ray_trace_passed(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self)) {
        var_543f2191dde2b7f6 = var_428a3d9115f72081;
        return var_543f2191dde2b7f6;
    }
    var_428a3d9115f72081 = var_b2b5f5510c5d94e0 + 0.707 * var_6f8d59f68bd2b46c * (var_6c5ceed9b00eb7d5 - var_5cc1d6dd55c49e3a) - (0, 0, crashoffset);
    if (ray_trace_passed(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self)) {
        var_543f2191dde2b7f6 = var_428a3d9115f72081;
        return var_543f2191dde2b7f6;
    }
    var_428a3d9115f72081 = var_b2b5f5510c5d94e0 + 0.707 * var_6f8d59f68bd2b46c * (var_5cc1d6dd55c49e3a - var_6c5ceed9b00eb7d5) - (0, 0, crashoffset);
    var_4720f54e3eff6e8d = ray_trace(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self);
    if (ray_trace_passed(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self)) {
        var_543f2191dde2b7f6 = var_428a3d9115f72081;
        return var_543f2191dde2b7f6;
    }
    var_428a3d9115f72081 = var_b2b5f5510c5d94e0 + 0.707 * var_6f8d59f68bd2b46c * (-1 * var_6c5ceed9b00eb7d5 - var_5cc1d6dd55c49e3a) - (0, 0, crashoffset);
    if (ray_trace_passed(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self)) {
        var_543f2191dde2b7f6 = var_428a3d9115f72081;
        return var_543f2191dde2b7f6;
    }
    return var_543f2191dde2b7f6;
}

// Namespace namespace_d595138a91ee4a1d/namespace_5d57e6b81b105f5d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1010
// Size: 0x4d
function function_acc5857fbb90a8be(speed) {
    self endon("death");
    self setyawspeed(speed, 50, 50, 0.5);
    while (isdefined(self)) {
        self settargetyaw(self.angles[1] + speed * 0.4);
        wait(0.5);
    }
}

// Namespace namespace_d595138a91ee4a1d/namespace_5d57e6b81b105f5d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1064
// Size: 0x68
function function_fe282a6dc1e0d0fa() {
    foreach (rider in self.riders) {
        rider namespace_14d36171baccf528::despawnagent();
    }
    namespace_f64231d5b7a2c3c4::vehicle_tracking_deregisterinstance(self);
    namespace_f64231d5b7a2c3c4::_deletevehicle(self);
}

// Namespace namespace_d595138a91ee4a1d/namespace_5d57e6b81b105f5d
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x10d3
// Size: 0x1e
function function_1cbf90dc463c0d0b(data) {
    namespace_343543689c1d8859::choppersupport_handledeathdamage(data);
    self notify("death");
    return 1;
}

// Namespace namespace_d595138a91ee4a1d/namespace_5d57e6b81b105f5d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10f9
// Size: 0x84
function function_10ff61ea7267cf0b(droplocation) {
    endtrace = droplocation - (0, 0, 20000);
    starttrace = droplocation + (0, 0, 200);
    ignorelist = [0:self];
    trace = namespace_2a184fc4902783dc::ray_trace(starttrace, endtrace, ignorelist);
    if (isdefined(trace) && trace["hittype"] != "hittype_none") {
        return trace["position"];
    }
    return droplocation;
}

// Namespace namespace_d595138a91ee4a1d/namespace_5d57e6b81b105f5d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1185
// Size: 0x23a
function function_35c699c709e24b69(var_865d5ecd4057429f) {
    var_b5424ebe989b94b4 = 0;
    var_977851763cf38e9e = [];
    usedpositions = [];
    foreach (rider in var_865d5ecd4057429f) {
        if (isdefined(rider.var_af27b6a3d3a2f6af) && rider.var_af27b6a3d3a2f6af != -1) {
            if (!isdefined(usedpositions[rider.var_af27b6a3d3a2f6af])) {
                if (rider.var_af27b6a3d3a2f6af == 5) {
                    var_b5424ebe989b94b4 = 1;
                }
                usedpositions[rider.var_af27b6a3d3a2f6af] = 1;
                rider.script_startingposition = rider.var_af27b6a3d3a2f6af;
                rider.vehicle_position = rider.script_startingposition;
                rider thread function_e7d3411db935e99b(int(rider.var_af27b6a3d3a2f6af));
            } else {
                /#
                    assertmsg("Multiple AIs are assigned at the same vehicle seat in APE. Seat number: " + rider.var_af27b6a3d3a2f6af);
                #/
            }
        } else {
            var_977851763cf38e9e[var_977851763cf38e9e.size] = rider;
        }
    }
    seatindex = 2;
    var_d686c2bf0f2c7e39 = 10;
    foreach (rider in var_977851763cf38e9e) {
        if (!var_b5424ebe989b94b4) {
            usedpositions[5] = 1;
            var_b5424ebe989b94b4 = 1;
            rider.script_startingposition = 5;
            rider.vehicle_position = rider.script_startingposition;
            rider thread function_e7d3411db935e99b(int(5));
        } else {
            while (seatindex < var_d686c2bf0f2c7e39) {
                if (!isdefined(usedpositions[seatindex])) {
                    usedpositions[seatindex] = 1;
                    rider.script_startingposition = seatindex;
                    rider.vehicle_position = rider.script_startingposition;
                    rider thread function_e7d3411db935e99b(int(seatindex));
                    break;
                }
                seatindex++;
            }
        }
    }
    function_f92faaaf5c5077c6(var_865d5ecd4057429f, 1, 1);
}

// Namespace namespace_d595138a91ee4a1d/namespace_5d57e6b81b105f5d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13c6
// Size: 0xbe
function function_9e55d8680a23ec64(var_c690b5b36d8cd7dc) {
    var_ce9af1b7ad0dae24 = 650;
    if (iscp()) {
        var_d8fdb2b88f2194c8 = 150;
    }
    function_3c2a39b0d7da4e01(var_c690b5b36d8cd7dc, 1, var_c690b5b36d8cd7dc[2] + var_d8fdb2b88f2194c8);
    if (!iscp()) {
        thread function_2335f0235dab16e3(var_c690b5b36d8cd7dc);
    }
    var_b3941e6a151cf4d2 = namespace_b479ac682b93cd92::_vehicle_unload();
    self waittill("unloaded");
    foreach (guy in var_b3941e6a151cf4d2) {
        guy.var_f327ed481efe4857 = undefined;
    }
    return var_b3941e6a151cf4d2;
}

// Namespace namespace_d595138a91ee4a1d/namespace_5d57e6b81b105f5d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x148c
// Size: 0x2a
function function_e7d3411db935e99b(pos) {
    self endon("death");
    wait(2);
    self.vehicle_position = pos;
    self.script_startingposition = pos;
}

// Namespace namespace_d595138a91ee4a1d/namespace_5d57e6b81b105f5d
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14bd
// Size: 0x1ba
function function_2335f0235dab16e3(var_9d33fb21f8c1abb2) {
    self endon("death");
    var_ce621a37edde9cb9 = undefined;
    if (isdefined(var_9d33fb21f8c1abb2)) {
        if (!isvector(var_9d33fb21f8c1abb2)) {
            var_4583939a603f7170 = var_9d33fb21f8c1abb2.origin;
            var_ce621a37edde9cb9 = var_9d33fb21f8c1abb2.script_unload;
        } else {
            var_4583939a603f7170 = var_9d33fb21f8c1abb2;
        }
    }
    drop_height = 1000;
    var_544cb2e6005f5d27 = 100;
    pos = getgroundposition(var_4583939a603f7170, 1, drop_height, var_544cb2e6005f5d27);
    pos = pos + (0, 0, 50);
    /#
        if (getdvarint(@"hash_f05c6973eb39f532", 0) == 1) {
            var_e880af5898ec6fd1 = var_4583939a603f7170 + (0, 0, var_544cb2e6005f5d27);
            var_4e18bf6f5eeee2f0 = var_4583939a603f7170 + (0, 0, drop_height * -1);
            level thread namespace_c10c97d19621a21b::drawline(var_e880af5898ec6fd1, var_4e18bf6f5eeee2f0, 9999, game["unloaded"]["<unknown string>"]);
            level thread namespace_c10c97d19621a21b::drawsphere(pos, 6, 9999, game["unloaded"]["<unknown string>"]);
            print3d(pos, "<unknown string>", undefined, undefined, undefined, 9999);
        }
    #/
    dist = 500;
    dist_sq = dist * dist;
    while (distance2dsquared(var_4583939a603f7170, self.origin) > dist_sq) {
        wait(0.1);
    }
    if (istrue(self.var_7b349dc60a25d9fe)) {
        wait(8);
    } else {
        wait(10);
    }
    if (namespace_4ff41449ab14a3a0::riders_unloadable(var_ce621a37edde9cb9)) {
        magicgrenademanual("smoke_grenade_reinforcement_cover", pos, (0, 0, -10), 0.5);
        thread play_sound_in_space("smoke_grenade_expl_trans", self.origin);
    }
}

// Namespace namespace_d595138a91ee4a1d/namespace_5d57e6b81b105f5d
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x167e
// Size: 0x653
function function_9514a9690c80864a(start_node, var_2c2390497cfcfc4, var_cf41a8a0e5c72c2b, var_b3a72f08adebdce1) {
    self notify("new_orders");
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    self endon("new_orders");
    self.var_7b349dc60a25d9fe = 1;
    var_9d33fb21f8c1abb2 = spawnstruct();
    var_9d33fb21f8c1abb2.origin = drop_to_ground(var_cf41a8a0e5c72c2b, 100, -1000);
    var_9d33fb21f8c1abb2.angles = (0, 0, 0);
    var_19c5004cbb9d3a44 = level.vehicle.templates.aianims[namespace_b479ac682b93cd92::get_vehicle_classname()][0].vehicle_getoutanim;
    /#
        if (getdvarint(@"hash_f05c6973eb39f532", 0) == 1) {
            level thread namespace_c10c97d19621a21b::drawsphere(var_9d33fb21f8c1abb2.origin, 20, 9999, game["unloaded"]["<unknown string>"]);
            print3d(var_9d33fb21f8c1abb2.origin, "<unknown string>", undefined, undefined, undefined, 9999);
            level thread namespace_c10c97d19621a21b::drawsphere(start_node.origin, 20, 9999, game["unloaded"]["<unknown string>"]);
            print3d(start_node.origin, "<unknown string>", undefined, undefined, undefined, 9999);
            var_87c6a993191a64f8 = start_node;
            var_1beb7eb06a91cd4c = 0;
            while (isdefined(var_87c6a993191a64f8.target)) {
                var_89f47501ca05c6fb = getvehiclenode(var_87c6a993191a64f8.target, "<unknown string>");
                if (!isdefined(var_89f47501ca05c6fb)) {
                    break;
                }
                var_1beb7eb06a91cd4c++;
                level thread namespace_c10c97d19621a21b::drawline(var_87c6a993191a64f8.origin, var_89f47501ca05c6fb.origin, 9999, game["unloaded"]["<unknown string>"]);
                level thread namespace_c10c97d19621a21b::drawsphere(var_89f47501ca05c6fb.origin, 20, 9999, game["unloaded"]["<unknown string>"]);
                print3d(var_89f47501ca05c6fb.origin, "<unknown string>" + var_1beb7eb06a91cd4c, undefined, undefined, undefined, 9999);
                var_87c6a993191a64f8 = var_89f47501ca05c6fb;
            }
        }
    #/
    currentnode = start_node;
    while (isdefined(currentnode)) {
        var_456b498e5fffa4f = flatten_vector(var_9d33fb21f8c1abb2.origin - currentnode.origin);
        var_9d33fb21f8c1abb2.angles = vectortoangles(var_456b498e5fffa4f);
        var_e80762b1786aebd8 = getstartorigin(var_9d33fb21f8c1abb2.origin, var_9d33fb21f8c1abb2.angles, var_19c5004cbb9d3a44);
        var_f20a4c5a0cb7cd5b = getstartangles(var_9d33fb21f8c1abb2.origin, var_9d33fb21f8c1abb2.angles, var_19c5004cbb9d3a44);
        if (isdefined(currentnode.target)) {
            nextnode = getvehiclenode(currentnode.target, "targetname");
            if (isdefined(nextnode)) {
                var_87d5a37e0b7f419d = flatten_vector(var_e80762b1786aebd8 - currentnode.origin);
                var_1952bd43437f827b = flatten_vector(var_e80762b1786aebd8 - nextnode.origin);
                if (vectordot(var_87d5a37e0b7f419d, var_1952bd43437f827b) < 0) {
                    nextnode = undefined;
                }
            }
        }
        if (isdefined(nextnode)) {
            var_fbbf0d4332cc598a = flatten_vector(nextnode.origin - currentnode.origin);
            var_e1c444e2235ff46d = vectortoangles(var_fbbf0d4332cc598a)[1];
        } else {
            var_443055d80866aa72 = flatten_vector(var_e80762b1786aebd8 - currentnode.origin);
            var_e1c444e2235ff46d = vectortoangles(var_443055d80866aa72)[1];
        }
        /#
            if (getdvarint(@"hash_f05c6973eb39f532", 0) == 1) {
                var_5e3ac85e5357dacf = function_53c4c53197386572(var_5e3ac85e5357dacf, 0);
                var_63f99154b985917f = (currentnode.origin[0], currentnode.origin[1], var_e80762b1786aebd8[2]);
                level thread namespace_c10c97d19621a21b::drawsphere(var_63f99154b985917f, 20, 9999, game["unloaded"]["<unknown string>"]);
                print3d(var_63f99154b985917f, "<unknown string>" + var_5e3ac85e5357dacf, undefined, undefined, undefined, 9999);
                var_5e3ac85e5357dacf++;
            }
        #/
        height = var_e80762b1786aebd8[2];
        if (currentnode == start_node && currentnode.origin[2] > var_e80762b1786aebd8[2]) {
            height = currentnode.origin[2];
        }
        function_3c2a39b0d7da4e01(currentnode, currentnode == start_node, height, undefined, var_e1c444e2235ff46d);
        currentnode = nextnode;
        nextnode = undefined;
    }
    self.scenenode = var_9d33fb21f8c1abb2;
    self.currentnode = var_9d33fb21f8c1abb2;
    /#
        if (getdvarint(@"hash_f05c6973eb39f532", 0) == 1) {
            level thread namespace_c10c97d19621a21b::drawsphere(var_e80762b1786aebd8, 20, 9999, game["unloaded"]["<unknown string>"]);
            print3d(var_e80762b1786aebd8, "<unknown string>", undefined, undefined, undefined, 9999);
        }
    #/
    function_3c2a39b0d7da4e01(var_e80762b1786aebd8, 1, var_e80762b1786aebd8[2], undefined, var_f20a4c5a0cb7cd5b[1]);
    var_80011eafbfff1c63 = 1.25;
    self function_6d14d24a1888c646(var_f20a4c5a0cb7cd5b, 1, var_80011eafbfff1c63, 0.75, 0.25);
    self function_1c952754074bd3a1(var_e80762b1786aebd8, 1, var_80011eafbfff1c63, 0.9, 0.1, 1);
    wait(var_80011eafbfff1c63);
    self vehicle_cleardrivingstate();
    self function_247ad6a91f6a4ffe(1);
    self vehphys_forcekeyframedmotion();
    thread function_2335f0235dab16e3(var_9d33fb21f8c1abb2);
    var_b3941e6a151cf4d2 = namespace_3bb9da687f15383d::unload_node(var_9d33fb21f8c1abb2);
    if (!isdefined(var_b3941e6a151cf4d2)) {
        var_b3941e6a151cf4d2 = [];
    }
    if (isdefined(var_b3a72f08adebdce1)) {
        self thread [[ var_b3a72f08adebdce1 ]](self, var_b3941e6a151cf4d2);
    }
    self function_247ad6a91f6a4ffe(0);
    self vehphys_setdefaultmotion();
    var_c29b34a84cd0839a = 1;
    self function_6d14d24a1888c646(self.angles, 1, var_c29b34a84cd0839a, 0.75, 0.25);
    self function_1c952754074bd3a1(self.origin, 1, var_c29b34a84cd0839a, 0.75, 0.25, 1);
    wait(var_c29b34a84cd0839a);
    thread namespace_5d57e6b81b105f5d::function_3c2a39b0d7da4e01(start_node.origin, 0, 12000);
    waittill_any_timeout_3(45, "goal", "near_goal", "begin_evasive_maneuvers");
    var_95822e3d27d18fbc = 1;
    wait(var_95822e3d27d18fbc);
    self cleargoalyaw();
}

