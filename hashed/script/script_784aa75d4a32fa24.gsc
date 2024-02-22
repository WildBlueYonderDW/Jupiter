// mwiii decomp prototype
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
#using script_5def7af2a9f04234;
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

// Namespace dmz_ai_chopper/namespace_8c3daeeca6bd42c0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3bc
// Size: 0x50
function debug() {
    /#
        while (1) {
            waitframe();
            if (getdvarint(@"hash_75b3234f60e90b47", 0) == 1) {
                namespace_fd5db9939c683aa4::function_6aa2e7131056a6a2(level.players[0].origin);
                setdvar(@"hash_75b3234f60e90b47", 0);
            }
        }
    #/
}

// Namespace dmz_ai_chopper/namespace_8c3daeeca6bd42c0
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x413
// Size: 0x446
function function_4c4df9aeb773709a(pos, vehicle, model, patrolradius, name) {
    patrollocation = pos;
    if (!isdefined(patrolradius)) {
        patrolradius = 4000;
    }
    var_a5639d6f3f95033a = namespace_343543689c1d8859::getpathstart(patrollocation);
    startingangles = vectortoangles(patrollocation - var_a5639d6f3f95033a);
    var_a5639d6f3f95033a = drop_to_ground(var_a5639d6f3f95033a);
    var_a5639d6f3f95033a = var_a5639d6f3f95033a + (0, 0, level.var_103b912267715093);
    chopper = spawnvehicle(model, "dmz_ai_chopper", vehicle, var_a5639d6f3f95033a, startingangles);
    if (!isdefined(chopper)) {
        return;
    }
    chopper.poi = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(pos);
    chopper.speed = 60;
    chopper.var_494fe868127e6381 = chopper.speed;
    chopper.accel = 50;
    chopper.var_5424df833ac6a6f2 = chopper.accel;
    chopper.lifetime = 9999;
    chopper.team = "team_hundred_ninety_five";
    var_2884adc8d320f897 = namespace_bfef6903bca5845d::function_af3034a7c69d7edb("team_hundred_ninety_five");
    chopper.owner = var_2884adc8d320f897;
    chopper.angles = startingangles;
    chopper.flaresreservecount = 2;
    chopper.pathstart = var_a5639d6f3f95033a;
    chopper.pathgoal = patrollocation;
    chopper.currentaction = "patrol";
    chopper.currenttarget = undefined;
    chopper.heightoffset = (0, 0, 1500);
    chopper.var_bf8fea4ec55967bc = getdvarint(@"hash_db1f71003929b40e", 1) == 1;
    chopper.var_dcae6d029a10c90b = 1;
    chopper.handleeventcallback = &function_9910a6cd29958a7f;
    chopper setmaxpitchroll(15, 15);
    chopper vehicle_setspeed(chopper.speed, chopper.accel);
    chopper sethoverparams(50, 5, 2.5);
    chopper setturningability(0.5);
    chopper setyawspeed(100, 25, 25, 0.1);
    chopper setcandamage(1);
    chopper setneargoalnotifydist(768);
    chopper setvehicleteam(chopper.team);
    chopper.ignorelist = [0:chopper];
    chopper.stage3accradius = 35;
    chopper.crashoffset = chopper.heightoffset[2] - 250;
    chopper.currenthealth = level.var_426503bd899fe79d;
    chopper.health = level.var_426503bd899fe79d;
    chopper.maxhealth = level.var_426503bd899fe79d;
    chopper.damagestate = 0;
    chopper namespace_6d9917c3dc05dbe9::registersentient("Level_Vehicle", chopper.team);
    chopper.var_23cb38899cba861 = [];
    chopper.var_f4ef1df1e627ad5f = 0;
    chopper.var_31a7627753153dae = 6;
    chopper.currentstate = "patrol";
    chopper.patrollocation = patrollocation;
    chopper.patrolradius = patrolradius;
    chopper.var_445449fe0511cad6 = 0;
    chopper.funcs["patrol"] = &function_b74d3da9a50aef87;
    chopper.funcs["idle"] = &function_185ca586f9b7f14f;
    chopper.funcs["attack"] = &chopper_attack;
    chopper thread function_677b91b5a72db277();
    chopper thread function_5159bd9771a61868();
    chopper thread function_a4f67639da6c8a7d();
    chopper vehicleshowonminimap(0);
    chopper.vehiclename = name;
    namespace_ad22b9cf6a2b30d::set_post_mod_damage_callback(chopper.vehiclename, &function_c23bf5e680c0b0fc);
    namespace_ad22b9cf6a2b30d::set_death_callback(chopper.vehiclename, &function_31529a6224103b1a);
    if (issharedfuncdefined("flares", "handleIncomingStinger")) {
        chopper thread [[ getsharedfunc("flares", "handleIncomingStinger") ]](&namespace_343543689c1d8859::choppersupport_handlemissiledetection);
    }
    /#
        chopper thread function_6ccd7cebb1144062();
    #/
    return chopper;
}

// Namespace dmz_ai_chopper/namespace_8c3daeeca6bd42c0
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x861
// Size: 0x6e
function function_9910a6cd29958a7f(vehicle, ent, position, normal, normalspeed) {
    driver = namespace_1fbd40990ee60ede::vehicle_occupancy_getdriver(vehicle);
    if (isdefined(driver)) {
        function_3be784d69cc30a0(driver, 500, 1);
        if (self.currentstate != "attack") {
            function_7743aeff79a08975("idle");
        }
    }
}

// Namespace dmz_ai_chopper/namespace_8c3daeeca6bd42c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8d6
// Size: 0x92
function function_c23bf5e680c0b0fc(data) {
    namespace_343543689c1d8859::function_400022dabdb64055(data);
    if (isdefined(self.var_c6c4017b9f56bff4)) {
        self thread [[ self.var_c6c4017b9f56bff4 ]](data);
    }
    if (isdefined(data.attacker) && isplayer(data.attacker)) {
        function_3be784d69cc30a0(data.attacker, data.damage, 1);
        if (self.currentstate != "attack") {
            function_7743aeff79a08975("idle");
        }
    }
    return 1;
}

// Namespace dmz_ai_chopper/namespace_8c3daeeca6bd42c0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x970
// Size: 0x30
function function_677b91b5a72db277() {
    self endon("death");
    self endon("explode");
    while (1) {
        [[ self.funcs[self.currentstate] ]]();
        waitframe();
    }
}

// Namespace dmz_ai_chopper/namespace_8c3daeeca6bd42c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9a7
// Size: 0x1e
function function_31529a6224103b1a(data) {
    namespace_343543689c1d8859::choppersupport_handledeathdamage(data);
    self notify("death");
    return 1;
}

// Namespace dmz_ai_chopper/namespace_8c3daeeca6bd42c0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x9cd
// Size: 0x89
function function_5159bd9771a61868() {
    self endon("death");
    while (1) {
        if (isdefined(self.poi)) {
            foreach (player in level.poi[self.poi]["players"]) {
                function_3be784d69cc30a0(player, 10);
            }
        }
        wait(10);
    }
}

// Namespace dmz_ai_chopper/namespace_8c3daeeca6bd42c0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa5d
// Size: 0x109
function function_b74d3da9a50aef87() {
    self endon("death");
    self endon("state_change");
    self clearlookatent();
    self setneargoalnotifydist(300);
    if (!istrue(self.var_dcae6d029a10c90b)) {
        self vehicle_setspeed(20, 20);
    }
    self.var_dcae6d029a10c90b = 0;
    var_6e281dbd69fc980e = self.patrollocation + anglestoforward((0, self.var_445449fe0511cad6, 0)) * int(self.patrolradius / 1.2);
    self.var_445449fe0511cad6 = self.var_445449fe0511cad6 + 360 / self.var_31a7627753153dae;
    if (self.var_445449fe0511cad6 >= 360) {
        self.var_445449fe0511cad6 = self.var_445449fe0511cad6 - 360;
    }
    function_276c4659222d7c6a(var_6e281dbd69fc980e, self.var_f4ef1df1e627ad5f > 0);
    wait(self.var_f4ef1df1e627ad5f);
    self vehicle_setspeed(self.var_494fe868127e6381, self.var_5424df833ac6a6f2);
    self.currentstate = "idle";
}

// Namespace dmz_ai_chopper/namespace_8c3daeeca6bd42c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb6d
// Size: 0x37
function function_7743aeff79a08975(state) {
    self.currentstate = state;
    self vehicle_setspeed(self.var_494fe868127e6381, self.var_5424df833ac6a6f2);
    self notify("state_change");
}

// Namespace dmz_ai_chopper/namespace_8c3daeeca6bd42c0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbab
// Size: 0x50
function function_185ca586f9b7f14f() {
    self endon("death");
    self endon("state_change");
    target = function_ef8a0089f2c25099();
    if (isdefined(target)) {
        self.currenttarget = target;
        self.currentstate = "attack";
    } else {
        self.currentstate = "patrol";
    }
}

// Namespace dmz_ai_chopper/namespace_8c3daeeca6bd42c0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc02
// Size: 0x80
function chopper_attack() {
    self endon("death");
    self endon("state_change");
    self.var_dcae6d029a10c90b = 1;
    if (!isdefined(self.currenttarget)) {
        self.currentstate = "patrol";
        return;
    }
    if (isdefined(self.var_59bcc0ee54cdb593)) {
        self [[ self.var_59bcc0ee54cdb593 ]](self.var_23cb38899cba861[self.currenttarget].player);
    } else {
        self.currentstate = "patrol";
    }
}

// Namespace dmz_ai_chopper/namespace_8c3daeeca6bd42c0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc89
// Size: 0x4cf
function function_3be784d69cc30a0(player, value, var_da6145188809dcdf) {
    if (!isdefined(player) || !isdefined(player.guid)) {
        return;
    }
    if (!isdefined(self.var_23cb38899cba861[player.guid])) {
        self.var_23cb38899cba861[player.guid] = spawnstruct();
        self.var_23cb38899cba861[player.guid].player = player;
        self.var_23cb38899cba861[player.guid].threat = 0;
        self.var_23cb38899cba861[player.guid].var_da6145188809dcdf = 0;
    }
    if (istrue(var_da6145188809dcdf)) {
        self.var_23cb38899cba861[player.guid].var_da6145188809dcdf = var_da6145188809dcdf;
    }
    if (!isdefined(self.var_2edb1bbb4ad168ef) || !isdefined(self.var_38076ea016478f2f)) {
        self.var_2edb1bbb4ad168ef = player.guid;
        self.var_38076ea016478f2f = player.guid;
    } else if (!isdefined(self.var_23cb38899cba861[player.guid].up) && !isdefined(self.var_23cb38899cba861[player.guid].down) && self.var_38076ea016478f2f != player.guid) {
        self.var_23cb38899cba861[self.var_2edb1bbb4ad168ef].down = player.guid;
        self.var_23cb38899cba861[player.guid].up = self.var_2edb1bbb4ad168ef;
        self.var_2edb1bbb4ad168ef = player.guid;
    }
    self.var_23cb38899cba861[player.guid].threat = self.var_23cb38899cba861[player.guid].threat + value;
    if (value > 0) {
        if (self.var_38076ea016478f2f == player.guid) {
            return;
        }
        var_a4afcf8a424399e = self.var_23cb38899cba861[player.guid].up;
        var_36413dc99878ed04 = [];
        while (isdefined(var_a4afcf8a424399e) && self.var_23cb38899cba861[var_a4afcf8a424399e].threat < self.var_23cb38899cba861[player.guid].threat) {
            if (array_contains(var_36413dc99878ed04, var_a4afcf8a424399e)) {
                self.var_23cb38899cba861 = [];
                self.var_38076ea016478f2f = undefined;
                self.var_2edb1bbb4ad168ef = undefined;
                return;
            }
            var_36413dc99878ed04[var_36413dc99878ed04.size] = var_a4afcf8a424399e;
            var_a4afcf8a424399e = self.var_23cb38899cba861[var_a4afcf8a424399e].up;
        }
        if (!isdefined(var_a4afcf8a424399e) || var_a4afcf8a424399e != self.var_23cb38899cba861[player.guid].up) {
            function_83388ed388ddbddc(player.guid);
            function_9e2e41a3f8f5ded(player.guid, var_a4afcf8a424399e);
        }
    } else {
        if (self.var_23cb38899cba861[player.guid].threat <= 0) {
            function_83388ed388ddbddc(player.guid);
            return;
        }
        if (self.var_2edb1bbb4ad168ef == player.guid) {
            return;
        }
        var_a4afcf8a424399e = self.var_23cb38899cba861[player.guid].down;
        var_36413dc99878ed04 = [];
        while (isdefined(var_a4afcf8a424399e) && self.var_23cb38899cba861[var_a4afcf8a424399e].threat > self.var_23cb38899cba861[player.guid].threat) {
            if (array_contains(var_36413dc99878ed04, var_a4afcf8a424399e)) {
                self.var_23cb38899cba861 = [];
                self.var_38076ea016478f2f = undefined;
                self.var_2edb1bbb4ad168ef = undefined;
                return;
            }
            var_36413dc99878ed04[var_36413dc99878ed04.size] = var_a4afcf8a424399e;
            var_a4afcf8a424399e = self.var_23cb38899cba861[var_a4afcf8a424399e].down;
        }
        if (!isdefined(var_a4afcf8a424399e) || var_a4afcf8a424399e != self.var_23cb38899cba861[player.guid].down) {
            function_83388ed388ddbddc(player.guid);
            function_9e2e41a3f8f5ded(player.guid, self.var_23cb38899cba861[var_a4afcf8a424399e].up);
        }
    }
}

// Namespace dmz_ai_chopper/namespace_8c3daeeca6bd42c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x115f
// Size: 0x15c
function function_83388ed388ddbddc(guid) {
    if (self.var_38076ea016478f2f == guid && self.var_2edb1bbb4ad168ef == guid) {
        self.var_38076ea016478f2f = undefined;
        self.var_2edb1bbb4ad168ef = undefined;
        return;
    }
    if (isdefined(self.var_23cb38899cba861[guid].down)) {
        if (!isdefined(self.var_23cb38899cba861[guid].up)) {
            self.var_38076ea016478f2f = self.var_23cb38899cba861[guid].down;
        }
        self.var_23cb38899cba861[self.var_23cb38899cba861[guid].down].up = self.var_23cb38899cba861[guid].up;
    }
    if (isdefined(self.var_23cb38899cba861[guid].up)) {
        if (!isdefined(self.var_23cb38899cba861[guid].down)) {
            self.var_2edb1bbb4ad168ef = self.var_23cb38899cba861[guid].up;
        }
        self.var_23cb38899cba861[self.var_23cb38899cba861[guid].up].down = self.var_23cb38899cba861[guid].down;
    }
}

// Namespace dmz_ai_chopper/namespace_8c3daeeca6bd42c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12c2
// Size: 0x139
function function_9e2e41a3f8f5ded(guid, var_29917471d8f3f42b) {
    if (!isdefined(var_29917471d8f3f42b)) {
        self.var_23cb38899cba861[self.var_38076ea016478f2f].up = guid;
        self.var_23cb38899cba861[guid].down = self.var_38076ea016478f2f;
        self.var_23cb38899cba861[guid].up = undefined;
        self.var_38076ea016478f2f = guid;
    } else {
        if (isdefined(self.var_23cb38899cba861[var_29917471d8f3f42b].down)) {
            self.var_23cb38899cba861[self.var_23cb38899cba861[var_29917471d8f3f42b].down].up = guid;
        }
        self.var_23cb38899cba861[guid].down = self.var_23cb38899cba861[var_29917471d8f3f42b].down;
        self.var_23cb38899cba861[var_29917471d8f3f42b].down = guid;
        self.var_23cb38899cba861[guid].up = var_29917471d8f3f42b;
        if (!isdefined(self.var_23cb38899cba861[guid].down)) {
            self.var_2edb1bbb4ad168ef = guid;
        }
    }
}

// Namespace dmz_ai_chopper/namespace_8c3daeeca6bd42c0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1402
// Size: 0x8b
function function_204882e766bf721d() {
    /#
        while (1) {
            foreach (agent in level.agentarray) {
                if (!isdefined(agent.guid)) {
                    continue;
                }
                if (function_51d76700600cebe3(50)) {
                    function_3be784d69cc30a0(agent, randomint(400));
                }
            }
            wait(1);
        }
    #/
}

// Namespace dmz_ai_chopper/namespace_8c3daeeca6bd42c0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1494
// Size: 0x5c
function function_6ccd7cebb1144062() {
    /#
        while (1) {
            if (getdvarint(@"hash_9fea139a8dd1eaae", 0) == 1) {
                self notify("chopper_support_turret_mp");
                choppersupport_crash(100, level.players[0].origin);
                setdvar(@"hash_9fea139a8dd1eaae", 0);
            }
            wait(1);
        }
    #/
}

// Namespace dmz_ai_chopper/namespace_8c3daeeca6bd42c0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14f7
// Size: 0xc6
function function_ef8a0089f2c25099() {
    var_36413dc99878ed04 = [];
    var_935d39b44c51f3cb = self.var_38076ea016478f2f;
    while (isdefined(var_935d39b44c51f3cb) && isdefined(self.var_23cb38899cba861[var_935d39b44c51f3cb])) {
        if (array_contains(var_36413dc99878ed04, var_935d39b44c51f3cb)) {
            self.var_23cb38899cba861 = [];
            self.var_38076ea016478f2f = undefined;
            self.var_2edb1bbb4ad168ef = undefined;
            return undefined;
        }
        var_36413dc99878ed04[var_36413dc99878ed04.size] = var_935d39b44c51f3cb;
        var_dd9fc1ccbc50fd25 = self.var_23cb38899cba861[var_935d39b44c51f3cb];
        if (function_9eda5834c2fa3898(var_dd9fc1ccbc50fd25)) {
            canseetarget = function_1098bd14cae74365(var_dd9fc1ccbc50fd25.player);
            if (canseetarget) {
                return var_935d39b44c51f3cb;
            }
        }
        var_935d39b44c51f3cb = self.var_23cb38899cba861[var_935d39b44c51f3cb].down;
    }
    return undefined;
}

// Namespace dmz_ai_chopper/namespace_8c3daeeca6bd42c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15c5
// Size: 0x155
function function_1098bd14cae74365(targetplayer, var_e02fbffd43632e35) {
    if (targetplayer.notarget) {
        return 0;
    }
    var_c3fbb6661b91750f = create_contents(0, 1, 0, 1, 0, 0, 0, 1, 1, 0);
    ignorelist = self.ignorelist;
    if (isdefined(targetplayer.var_abd157413ac4e022)) {
        ignorelist[ignorelist.size] = targetplayer.var_abd157413ac4e022;
        if (isdefined(targetplayer.var_abd157413ac4e022.turrets)) {
            ignorelist = array_combine(ignorelist, targetplayer.var_abd157413ac4e022.turrets);
        }
    }
    var_e478ac91af0e92cb = self getlinkedchildren();
    if (isdefined(var_e478ac91af0e92cb)) {
        foreach (child in var_e478ac91af0e92cb) {
            ignorelist[ignorelist.size] = child;
        }
    }
    if (isdefined(targetplayer.vehicle)) {
        ignorelist[ignorelist.size] = targetplayer.vehicle;
    }
    return ray_trace_passed(ter_op(isdefined(var_e02fbffd43632e35), var_e02fbffd43632e35, self.origin), targetplayer gettagorigin("j_head"), ignorelist, var_c3fbb6661b91750f);
}

// Namespace dmz_ai_chopper/namespace_8c3daeeca6bd42c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1722
// Size: 0x12c
function tracegroundpoint(x, y) {
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

// Namespace dmz_ai_chopper/namespace_8c3daeeca6bd42c0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1856
// Size: 0x5f
function getcorrectheight(x, y, rand) {
    var_dc8bb6300463cf1e = self.heightoffset[2];
    var_e7a7d619f927d791 = tracegroundpoint(x, y);
    var_1dc672cfe0f0128e = var_e7a7d619f927d791 + var_dc8bb6300463cf1e;
    var_1dc672cfe0f0128e = var_1dc672cfe0f0128e + randomint(rand);
    return var_1dc672cfe0f0128e;
}

// Namespace dmz_ai_chopper/namespace_8c3daeeca6bd42c0
// Params 4, eflags: 0x0
// Checksum 0x0, Offset: 0x18bd
// Size: 0x11f
function function_e9cb677b6ba63162(target, dist, checks, var_217c1c856c59a550) {
    self endon("death");
    self endon("crashing");
    self endon("state_change");
    if (!isdefined(var_217c1c856c59a550)) {
        var_217c1c856c59a550 = 0;
    }
    var_2d2cd3507681938 = self.origin - target.origin;
    var_2d2cd3507681938 = vectornormalize((var_2d2cd3507681938[0], var_2d2cd3507681938[1], 0)) * dist;
    rot = var_217c1c856c59a550;
    while (rot < var_217c1c856c59a550 + 360) {
        testpos = rotatevector(var_2d2cd3507681938, (0, rot, 0));
        testpos = testpos + target.origin + self.heightoffset;
        if (namespace_d9c77dc2a6fe29c6::ispointinoutofbounds(testpos)) {
            goto LOC_0000010f;
        }
        var_c3fbb6661b91750f = create_contents(0, 1, 0, 1, 0, 0, 0, 1, 1);
        canseetarget = function_1098bd14cae74365(target, testpos);
        if (canseetarget) {
            self setlookatent(target);
            function_276c4659222d7c6a(testpos, 1);
            return 1;
        LOC_0000010f:
        }
    LOC_0000010f:
        rot = rot + 360 / checks;
    }
    return 0;
}

// Namespace dmz_ai_chopper/namespace_8c3daeeca6bd42c0
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x19e4
// Size: 0x27c
function function_9f656e924a854c1b(target, dist, checks, var_217c1c856c59a550, var_f9a785628f97eec6, var_4f4c3a288df043c0, var_5f1f469d27d6af1a) {
    self endon("death");
    self endon("crashing");
    self endon("state_change");
    if (!isdefined(target) || !isreallyalive(target)) {
        return 0;
    }
    var_2d2cd3507681938 = self.origin - target.origin;
    var_2d2cd3507681938 = vectornormalize((var_2d2cd3507681938[0], var_2d2cd3507681938[1], 0)) * dist;
    if (!isdefined(var_4f4c3a288df043c0)) {
        var_4f4c3a288df043c0 = 2;
    }
    if (!isdefined(var_217c1c856c59a550)) {
        var_217c1c856c59a550 = 0;
    }
    rot = var_217c1c856c59a550;
    while (rot < var_217c1c856c59a550 + 360) {
        if (!isdefined(target) || !isreallyalive(target)) {
            return 0;
        }
        var_e1189805b90af398 = rotatevector(var_2d2cd3507681938, (0, rot, 0));
        testpos = var_e1189805b90af398 + target.origin + ter_op(isdefined(var_f9a785628f97eec6), (0, 0, var_f9a785628f97eec6), self.heightoffset);
        var_c3fbb6661b91750f = create_contents(0, 1, 0, 1, 0, 0, 0, 1, 1);
        canseetarget = function_1098bd14cae74365(target);
        var_f8fb21e45f9f9a37 = ray_trace_passed(testpos, testpos - var_e1189805b90af398 * var_4f4c3a288df043c0, self.ignorelist, var_c3fbb6661b91750f);
        if (canseetarget && var_f8fb21e45f9f9a37) {
            self.strafing = 1;
            function_276c4659222d7c6a(testpos, 1, (0, 0, 0), 1);
            self vehicle_setspeed(self.var_494fe868127e6381 * 2, self.accel);
            wait(1.5);
            self clearlookatent();
            if (!isdefined(target) || !isreallyalive(target)) {
                return 0;
            }
            self notify("strafe_start");
            if (isdefined(self.funcs["strafe"])) {
                self thread [[ self.funcs["strafe"] ]](target);
            }
            function_276c4659222d7c6a(testpos - var_e1189805b90af398 * var_4f4c3a288df043c0, !isdefined(var_5f1f469d27d6af1a), undefined, 1);
            self notify("strafe_end");
            self vehicle_setspeed(self.var_494fe868127e6381, self.accel);
            if (!isdefined(target) || !isreallyalive(target)) {
                return 0;
            }
            self setlookatent(target);
            self.strafing = 0;
            return 1;
        }
        rot = rot + 360 / checks;
    }
    return 0;
}

// Namespace dmz_ai_chopper/namespace_8c3daeeca6bd42c0
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c68
// Size: 0x26b
function function_276c4659222d7c6a(target, var_6c814cee8d2bd65e, var_7403e5e436347d6b, var_d37d6f45a6bae8f9) {
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    self endon("state_change");
    newpos = undefined;
    var_4e6df96d95bf50bc = target;
    if (!isvector(target)) {
        var_4e6df96d95bf50bc = target.origin;
    }
    ignorelist = self.ignorelist;
    var_e478ac91af0e92cb = self getlinkedchildren();
    if (isdefined(var_e478ac91af0e92cb)) {
        foreach (child in var_e478ac91af0e92cb) {
            ignorelist[ignorelist.size] = child;
        }
    }
    while (1) {
        currentpos = self.origin;
        var_2eca7b12d2ee27ba = var_4e6df96d95bf50bc * (1, 1, 0) + (0, 0, self.origin[2]);
        var_158f8e4d0e511638 = 0;
        xpos = var_4e6df96d95bf50bc[0];
        ypos = var_4e6df96d95bf50bc[1];
        if (istrue(var_d37d6f45a6bae8f9)) {
            var_691aa1d5da533612 = sphere_trace(currentpos, var_2eca7b12d2ee27ba, 512, ignorelist);
            if (isdefined(var_691aa1d5da533612)) {
                if (var_691aa1d5da533612["hittype"] != "hittype_none") {
                    xpos = var_691aa1d5da533612["position"][0];
                    ypos = var_691aa1d5da533612["position"][1];
                    var_158f8e4d0e511638 = 1;
                }
            }
        }
        if (isdefined(var_7403e5e436347d6b)) {
            newpos = var_4e6df96d95bf50bc + var_7403e5e436347d6b;
        } else if (istrue(self.evasivemaneuvers)) {
            newx = xpos + randomintrange(-500, 500);
            newy = ypos + randomintrange(-500, 500);
            var_7504c8791e34dc73 = getcorrectheight(newx, newy, 350);
            newpos = (newx, newy, var_7504c8791e34dc73);
        } else {
            var_7504c8791e34dc73 = getcorrectheight(xpos, ypos, 20);
            newpos = (xpos, ypos, var_7504c8791e34dc73);
        }
        stopatgoal = 0;
        if (istrue(var_6c814cee8d2bd65e) && !istrue(var_158f8e4d0e511638)) {
            stopatgoal = var_6c814cee8d2bd65e;
        }
        self setvehgoalpos(newpos, stopatgoal);
        waittill_any_2("near_goal", "begin_evasive_maneuvers");
        if (!istrue(var_158f8e4d0e511638)) {
            break;
        }
    }
}

// Namespace dmz_ai_chopper/namespace_8c3daeeca6bd42c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1eda
// Size: 0xda
function function_9eda5834c2fa3898(var_368ae33cb19f91f8) {
    var_2d3e5b97dd28a8f = !isdefined(self.var_f09811d8bb92df96) || self [[ self.var_f09811d8bb92df96 ]](var_368ae33cb19f91f8.player);
    var_2d3e5b97dd28a8f = var_2d3e5b97dd28a8f & (var_368ae33cb19f91f8.var_da6145188809dcdf || isreallyalive(var_368ae33cb19f91f8.player) && distance2dsquared(self.origin, var_368ae33cb19f91f8.player.origin) < 36000000);
    var_368ae33cb19f91f8.var_da6145188809dcdf = 0;
    return isdefined(var_368ae33cb19f91f8.player) && !var_368ae33cb19f91f8.player.notarget && isreallyalive(var_368ae33cb19f91f8.player) && var_2d3e5b97dd28a8f;
}

// Namespace dmz_ai_chopper/namespace_8c3daeeca6bd42c0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1fbc
// Size: 0x74
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
    function_87f0993e8f0fbe6a();
}

// Namespace dmz_ai_chopper/namespace_8c3daeeca6bd42c0
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2037
// Size: 0x70
function function_87f0993e8f0fbe6a() {
    self notify("explode");
    self notify("state_change");
    self radiusdamage(self.origin, 1000, 200, 200, undefined, "MOD_EXPLOSIVE", "chopper_support_turret_mp");
    self setscriptablepartstate("explode", "on", 0);
    if (isdefined(self.lootfunc)) {
        self [[ self.lootfunc ]]();
    }
    wait(0.35);
    function_fa93c6002da144f(1);
}

// Namespace dmz_ai_chopper/namespace_8c3daeeca6bd42c0
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20ae
// Size: 0xf7
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
    thread function_9c97ce445dfde3af(speed);
    self vehicle_turnengineoff();
    waittill_any_timeout_2(5, "collision", "near_goal");
}

// Namespace dmz_ai_chopper/namespace_8c3daeeca6bd42c0
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21ac
// Size: 0x21c
function function_e2c4e07ce9823056(var_6f8d59f68bd2b46c, var_6c56ff5ecc704c48, var_6c7af55ecc98b102) {
    var_b2b5f5510c5d94e0 = self.origin;
    crashoffset = self.crashoffset;
    var_543f2191dde2b7f6 = undefined;
    var_6c5ceed9b00eb7d5 = anglestoforward(self.angles);
    var_5cc1d6dd55c49e3a = anglestoright(self.angles);
    var_428a3d9115f72081 = var_b2b5f5510c5d94e0 + var_6c5ceed9b00eb7d5 * var_6f8d59f68bd2b46c - (0, 0, crashoffset);
    if (ray_trace_passed(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self) && !namespace_d9c77dc2a6fe29c6::ispointinoutofbounds(var_428a3d9115f72081)) {
        var_543f2191dde2b7f6 = var_428a3d9115f72081;
        return var_543f2191dde2b7f6;
    }
    var_428a3d9115f72081 = var_b2b5f5510c5d94e0 - var_6c5ceed9b00eb7d5 * var_6f8d59f68bd2b46c - (0, 0, crashoffset);
    if (ray_trace_passed(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self) && !namespace_d9c77dc2a6fe29c6::ispointinoutofbounds(var_428a3d9115f72081)) {
        var_543f2191dde2b7f6 = var_428a3d9115f72081;
        return var_543f2191dde2b7f6;
    }
    var_428a3d9115f72081 = var_b2b5f5510c5d94e0 + var_5cc1d6dd55c49e3a * var_6f8d59f68bd2b46c - (0, 0, crashoffset);
    if (ray_trace_passed(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self) && !namespace_d9c77dc2a6fe29c6::ispointinoutofbounds(var_428a3d9115f72081)) {
        var_543f2191dde2b7f6 = var_428a3d9115f72081;
        return var_543f2191dde2b7f6;
    }
    var_428a3d9115f72081 = var_b2b5f5510c5d94e0 - var_5cc1d6dd55c49e3a * var_6f8d59f68bd2b46c - (0, 0, crashoffset);
    if (ray_trace_passed(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self) && !namespace_d9c77dc2a6fe29c6::ispointinoutofbounds(var_428a3d9115f72081)) {
        var_543f2191dde2b7f6 = var_428a3d9115f72081;
        return var_543f2191dde2b7f6;
    }
    var_428a3d9115f72081 = var_b2b5f5510c5d94e0 + 0.707 * var_6f8d59f68bd2b46c * (var_6c5ceed9b00eb7d5 + var_5cc1d6dd55c49e3a) - (0, 0, crashoffset);
    if (ray_trace_passed(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self) && !namespace_d9c77dc2a6fe29c6::ispointinoutofbounds(var_428a3d9115f72081)) {
        var_543f2191dde2b7f6 = var_428a3d9115f72081;
        return var_543f2191dde2b7f6;
    }
    var_428a3d9115f72081 = var_b2b5f5510c5d94e0 + 0.707 * var_6f8d59f68bd2b46c * (var_6c5ceed9b00eb7d5 - var_5cc1d6dd55c49e3a) - (0, 0, crashoffset);
    if (ray_trace_passed(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self) && !namespace_d9c77dc2a6fe29c6::ispointinoutofbounds(var_428a3d9115f72081)) {
        var_543f2191dde2b7f6 = var_428a3d9115f72081;
        return var_543f2191dde2b7f6;
    }
    var_428a3d9115f72081 = var_b2b5f5510c5d94e0 + 0.707 * var_6f8d59f68bd2b46c * (var_5cc1d6dd55c49e3a - var_6c5ceed9b00eb7d5) - (0, 0, crashoffset);
    var_4720f54e3eff6e8d = ray_trace(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self);
    if (ray_trace_passed(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self) && !namespace_d9c77dc2a6fe29c6::ispointinoutofbounds(var_428a3d9115f72081)) {
        var_543f2191dde2b7f6 = var_428a3d9115f72081;
        return var_543f2191dde2b7f6;
    }
    var_428a3d9115f72081 = var_b2b5f5510c5d94e0 + 0.707 * var_6f8d59f68bd2b46c * (-1 * var_6c5ceed9b00eb7d5 - var_5cc1d6dd55c49e3a) - (0, 0, crashoffset);
    if (ray_trace_passed(var_b2b5f5510c5d94e0, var_428a3d9115f72081, self) && !namespace_d9c77dc2a6fe29c6::ispointinoutofbounds(var_428a3d9115f72081)) {
        var_543f2191dde2b7f6 = var_428a3d9115f72081;
        return var_543f2191dde2b7f6;
    }
    return var_543f2191dde2b7f6;
}

// Namespace dmz_ai_chopper/namespace_8c3daeeca6bd42c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23d0
// Size: 0x4d
function function_9c97ce445dfde3af(speed) {
    self endon("death");
    self setyawspeed(speed, 50, 50, 0.5);
    while (isdefined(self)) {
        self settargetyaw(self.angles[1] + speed * 0.4);
        wait(0.5);
    }
}

// Namespace dmz_ai_chopper/namespace_8c3daeeca6bd42c0
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2424
// Size: 0xd7
function function_67fe145bde788912(var_eb4d81fd840007e2, poiname) {
    if (level.var_eda461803cdadc2c < 0) {
        return;
    }
    if (level.var_eda461803cdadc2c > 0) {
        playerlist = [];
        foreach (player in level.players) {
            if (distance2dsquared(player.origin, var_eb4d81fd840007e2) < level.var_eda461803cdadc2c) {
                playerlist[playerlist.size] = player;
            }
        }
    } else {
        playerlist = level.players;
    }
    namespace_d696adde758cbe79::showdmzsplash("dmz_boss_chopper_inbound", playerlist, poiname);
    namespace_446fc987a980892f::function_d87d5deb069bf8e5("boss_near", playerlist);
}

// Namespace dmz_ai_chopper/namespace_8c3daeeca6bd42c0
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2502
// Size: 0x6b
function function_4ad380a5e1b9c51a() {
    droplocation = function_3f0075ed8069575c(self.origin + (0, 0, 500));
    if (isdefined(droplocation)) {
        var_e38f5ec33ed2cb0 = namespace_6c578d6ef48f10ef::dropbrlootchoppercrate(self.origin, droplocation);
        var_ef5d5141fdb51174 = namespace_6c578d6ef48f10ef::gettriggerobject(var_e38f5ec33ed2cb0);
        var_ef5d5141fdb51174.usetimeoverride = 10;
    }
}

// Namespace dmz_ai_chopper/namespace_8c3daeeca6bd42c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2574
// Size: 0x84
function function_3f0075ed8069575c(starttrace) {
    droplocation = undefined;
    endtrace = starttrace - (0, 0, 20000);
    ignorelist = [0:self, 1:self.frontturret];
    trace = namespace_2a184fc4902783dc::ray_trace(starttrace, endtrace, ignorelist);
    if (isdefined(trace) && trace["hittype"] != "hittype_none") {
        droplocation = trace["position"];
    }
    return droplocation;
}

// Namespace dmz_ai_chopper/namespace_8c3daeeca6bd42c0
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2600
// Size: 0x28a
function function_2c83d3d61191e88e(player) {
    self.itemsdropped = 0;
    pickups = [];
    for (i = 0; i < 3; i++) {
        pos = drop_to_ground(self.origin + rotatepointaroundvector((0, 0, 1), (20, 0, 0), 120 * i));
        var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(pos);
        streak = ter_op(function_51d76700600cebe3(50), "brloot_killstreak_clusterstrike", "brloot_killstreak_precision_airstrike");
        pickup = namespace_cb965d2f71fefddc::spawnpickup(streak, var_cb4fad49263e20c4, 1);
        self.itemsdropped++;
    }
    for (i = 0; i < 8; i++) {
        pos = drop_to_ground(self.origin + rotatepointaroundvector((0, 0, 1), (40, 0, 0), 45 * i));
        var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(pos);
        var_8a3a7194e96ea2c = ter_op(i % 2 == 0, "brloot_valuable_goldbar", "brloot_plunder_cash_rare_1");
        pickup = namespace_cb965d2f71fefddc::spawnpickup(var_8a3a7194e96ea2c, var_cb4fad49263e20c4, 1);
        self.itemsdropped++;
    }
    for (i = 0; i < 6; i++) {
        var_1e251ffd71396d15 = random([0:"brloot_weapon_sm_papa90_rare", 1:"brloot_weapon_sh_romeo870_rare", 2:"brloot_weapon_sn_sbeta_lege"]);
        itemname = ter_op(i % 3 == 0, "brloot_armor_plate", var_1e251ffd71396d15);
        var_144769f518d71226 = ter_op(i % 3 == 0, 8, 1);
        pos = drop_to_ground(self.origin + rotatepointaroundvector((0, 0, 1), (30, 0, 0), 60 * i));
        var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(pos);
        pickup = namespace_cb965d2f71fefddc::spawnpickup(itemname, var_cb4fad49263e20c4, var_144769f518d71226);
        pickups[pickups.size] = pickup;
        self.itemsdropped++;
    }
    foreach (ent in pickups) {
        ent.lootsource = "loot_chopper";
    }
}

// Namespace dmz_ai_chopper/namespace_8c3daeeca6bd42c0
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2891
// Size: 0xa6
function function_fa93c6002da144f(var_4fac8b8ce36e09f1) {
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
    namespace_f64231d5b7a2c3c4::vehicle_tracking_deregisterinstance(self);
    namespace_f64231d5b7a2c3c4::_deletevehicle(self);
}

