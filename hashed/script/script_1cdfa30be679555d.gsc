// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\gamelogic.gsc;
#using scripts\mp\bots\bots_util.gsc;
#using scripts\mp\bots\bots_strategy.gsc;
#using scripts\mp\bots\bots_gametype_common.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\gametypes\wm_objectives.gsc;

#namespace namespace_b45f3c1ccdc3ec83;

// Namespace namespace_b45f3c1ccdc3ec83 / namespace_a3bd727bb638dffb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1f0
// Size: 0xd9
function main() {
    function_96811b18496ea942(1, &function_d4299bd3cefff9f2);
    function_96811b18496ea942(2, &function_2023c59812a1896a);
    function_96811b18496ea942(3, &function_80669a2cc4016fb3);
    function_96811b18496ea942(4, &function_d4299bd3cefff9f2);
    function_96811b18496ea942(5, &function_bebf9ca11875f590);
    function_96811b18496ea942(6, &function_b72835f420d36cab);
    function_96811b18496ea942(7, &function_d4299bd3cefff9f2);
    function_96811b18496ea942(8, &function_d4299bd3cefff9f2);
    function_96811b18496ea942(9, &function_9ec814ba389bdf89);
    function_96811b18496ea942(10, &function_a329958947b1be20);
    function_96811b18496ea942(11, &function_47f50aa0634c3b02);
    function_96811b18496ea942(12, &function_c62f2faf741f9a21);
    level.var_350e53e094ac2a9f = game["attackers"];
    level.var_765b019e692c1beb = game["defenders"];
    setup_callbacks();
    function_a8c5e56892775215();
}

// Namespace namespace_b45f3c1ccdc3ec83 / namespace_a3bd727bb638dffb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2d0
// Size: 0x6
function function_e45e46b7c35deadb() {
    /#
    #/
}

// Namespace namespace_b45f3c1ccdc3ec83 / namespace_a3bd727bb638dffb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2dd
// Size: 0x18
function setup_callbacks() {
    level.bot_funcs["gametype_think"] = &bot_wm_think;
}

// Namespace namespace_b45f3c1ccdc3ec83 / namespace_a3bd727bb638dffb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2fc
// Size: 0x3
function function_a8c5e56892775215() {
    
}

// Namespace namespace_b45f3c1ccdc3ec83 / namespace_a3bd727bb638dffb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x306
// Size: 0x109
function bot_wm_think() {
    self notify("bot_wm_think");
    self endon("bot_wm_think");
    self endon("death_or_disconnect");
    level endon("game_ended");
    self botsetflag("separation", 0);
    self botsetflag("use_obj_path_style", 1);
    self botsetflag("enable_deploy_parachute", 1);
    while (true) {
        /#
            if (getdvarint(@"hash_c2de8ca6dc8512c1")) {
                wait(0.05);
                continue;
            }
        #/
        if (self.health <= 0 || istrue(self.liveragdoll)) {
            wait(0.05);
            continue;
        }
        if (!isdefined(level.zone)) {
            wait(0.05);
            continue;
        }
        objectivetype = level.zone.objectivetype;
        if (isdefined(objectivetype)) {
            if (!isdefined(level.var_395a230826837426[objectivetype]) || !istrue(self [[ level.var_395a230826837426[objectivetype] ]]())) {
                self botclearscriptgoal();
            }
        }
        self [[ self.personality_update_function ]]();
        wait(0.05);
    }
}

// Namespace namespace_b45f3c1ccdc3ec83 / namespace_a3bd727bb638dffb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x416
// Size: 0x248
function function_b72835f420d36cab() {
    var_144da732d85f9cb9 = 512;
    if (!isdefined(self.vehicle_target)) {
        self.vehicle_target = random(level.escortvehicles);
    }
    if (!isdefined(self.vehicle_target)) {
        return false;
    }
    var_4baf4f8316b6450a = getrandomnavpoint(self.vehicle_target.origin, var_144da732d85f9cb9);
    if (!isdefined(var_4baf4f8316b6450a)) {
        return false;
    }
    if (!self botsetscriptgoal(var_4baf4f8316b6450a, 64, "critical")) {
        return false;
    }
    result = bot_waittill_goal_or_fail();
    if (result == "bad_path" && scripts/cp_mp/utility/game_utility::getmapname() == "mp_jup_launchfacility") {
        if (isdefined(self.vehicle_target.var_6bb0ab1fe092bd5d) && self.vehicle_target.var_6bb0ab1fe092bd5d <= 1) {
            for (nodeid = self.vehicle_target.var_6bb0ab1fe092bd5d; nodeid < self.vehicle_target.pathnodes.size; nodeid++) {
                nodepos = self.vehicle_target.pathnodes[nodeid];
                var_4baf4f8316b6450a = getrandomnavpoint(nodepos.origin, var_144da732d85f9cb9);
                if (!self botsetscriptgoal(var_4baf4f8316b6450a, 64, "critical")) {
                    return false;
                }
                result = bot_waittill_goal_or_fail();
                if (result == "goal") {
                    break;
                }
            }
        }
    }
    if (result == "goal") {
        /#
            botrepair = getdvarint(@"hash_8d0535c35be2b9c0", 0);
            if (botrepair != 0 && is_equal(self.pers["<unknown string>"], game["<unknown string>"])) {
                self botpressbutton("<unknown string>", 1);
                if (isdefined(self.vehicle_target.repairtrigger.progress) && self.vehicle_target.repairtrigger.progress > 0.5) {
                    self.vehicle_target.repairtrigger.progress = 0.1;
                }
            }
        #/
        self botclearscriptgoal();
        return true;
    }
    return false;
}

// Namespace namespace_b45f3c1ccdc3ec83 / namespace_a3bd727bb638dffb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x666
// Size: 0x1c0
function function_d4299bd3cefff9f2() {
    if (!isdefined(level.var_261c48ef4ff3d77a)) {
        return 0;
    }
    var_4dac0fb6eca3c18f = [];
    foreach (zone in level.var_261c48ef4ff3d77a) {
        if (!isdefined(zone.complete)) {
            var_4dac0fb6eca3c18f[var_4dac0fb6eca3c18f.size] = zone;
            continue;
        }
    }
    var_e6065833510c1c0c = random(var_4dac0fb6eca3c18f);
    level.var_261c48ef4ff3d77a = var_4dac0fb6eca3c18f;
    if (!isdefined(var_e6065833510c1c0c)) {
        return 0;
    }
    if (!isdefined(var_e6065833510c1c0c.nodes)) {
        var_e6065833510c1c0c.nodes = bot_get_valid_nodes_in_trigger(var_e6065833510c1c0c.trigger);
    }
    if (!isdefined(var_e6065833510c1c0c.entrance_indices)) {
        bot_cache_entrances_to_zones([var_e6065833510c1c0c]);
    }
    if (scripts/cp_mp/utility/game_utility::getmapname() == "mp_jup_launchfacility") {
        return function_1631df751543c615(var_e6065833510c1c0c);
    }
    if (is_equal(self.pers["team"], game["attackers"])) {
        if (!self botsetscriptgoal((-24616.4, 42112.4, -160), 256, "critical")) {
            return 0;
        }
        result = bot_waittill_goal_or_fail();
        if (result != "goal") {
            return 0;
        }
    }
    node = random(var_e6065833510c1c0c.nodes);
    if (!self botsetscriptgoal(node.origin, 16, "critical")) {
        return 0;
    }
    result = bot_waittill_goal_or_fail();
    if (result != "goal") {
        return 0;
    } else {
        self botclearscriptgoal();
    }
    return 1;
}

// Namespace namespace_b45f3c1ccdc3ec83 / namespace_a3bd727bb638dffb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x82e
// Size: 0x6e
function function_1631df751543c615(var_e6065833510c1c0c) {
    node = random(var_e6065833510c1c0c.nodes);
    if (!self botsetscriptgoal(node.origin, 128, "critical")) {
        return false;
    }
    result = bot_waittill_goal_or_fail();
    if (result != "goal") {
        return false;
    } else {
        self botclearscriptgoal();
    }
    return true;
}

// Namespace namespace_b45f3c1ccdc3ec83 / namespace_a3bd727bb638dffb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x8a4
// Size: 0x139
function function_2023c59812a1896a() {
    if (!isdefined(level.var_be550dbbd45701ee)) {
        return false;
    }
    if (is_equal(self.pers["team"], game["attackers"])) {
        foreach (bombzone in array_randomize(level.var_be550dbbd45701ee)) {
            if (!istrue(bombzone.complete)) {
                var_a199db824f7b26c8 = bombzone;
                self botclearbutton("use");
            }
        }
        point = getclosestpointonnavmesh(var_a199db824f7b26c8.curorigin);
        self botsetscriptgoal(point, 16, "critical");
        /#
            sphere(point, 16, (1, 1, 1), 0, 4000);
        #/
        result = bot_waittill_goal_or_fail();
        if (result == "goal") {
            self botpressbutton("use", 100);
            result = bot_usebutton_wait(100);
            self botclearscriptgoal();
        }
    } else {
        return false;
    }
    return true;
}

// Namespace namespace_b45f3c1ccdc3ec83 / namespace_a3bd727bb638dffb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x9e5
// Size: 0x1a1
function function_bebf9ca11875f590() {
    if (!isdefined(level.var_f55e20c194c117f4)) {
        return false;
    }
    var_63a51796b1077bee = undefined;
    if (is_equal(self.pers["team"], game["attackers"])) {
        foreach (aasite in array_randomize(level.var_f55e20c194c117f4)) {
            if (!isdefined(aasite)) {
                continue;
            }
            objective = level.objectives[aasite.objectivekey];
            if (!istrue(objective.complete)) {
                var_63a51796b1077bee = aasite;
                self botclearbutton("use");
            }
        }
        if (!isdefined(var_63a51796b1077bee)) {
            return false;
        }
        point = var_63a51796b1077bee.origin - 64 * vectornormalize(anglestoforward(var_63a51796b1077bee.angles)) + 64 * vectornormalize(anglestoright(var_63a51796b1077bee.angles));
        point = getclosestpointonnavmesh(point);
        self botsetscriptgoal(point, 16, "critical");
        /#
            sphere(point, 16, (1, 1, 1), 0, 4000);
        #/
        result = bot_waittill_goal_or_fail();
        if (result == "goal") {
            self botpressbutton("use", 100);
            result = bot_usebutton_wait(100);
            self botclearscriptgoal();
        }
    } else {
        return false;
    }
    return true;
}

// Namespace namespace_b45f3c1ccdc3ec83 / namespace_a3bd727bb638dffb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xb8e
// Size: 0xb6
function bot_get_valid_nodes_in_trigger(trigger) {
    nodes = getnodesintrigger(trigger, 1);
    valid_nodes = [];
    foreach (node in nodes) {
        if (!node nodeisdisconnected() && !isnode3d(node) && node.type != "Begin" && node.type != "End") {
            valid_nodes[valid_nodes.size] = node;
        }
    }
    return valid_nodes;
}

// Namespace namespace_b45f3c1ccdc3ec83 / namespace_a3bd727bb638dffb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc4c
// Size: 0x12a
function function_80669a2cc4016fb3() {
    if (!isdefined(self.var_1131c442fdb61642)) {
        self.var_1131c442fdb61642 = random(level.hostages);
    }
    if (!isdefined(self.var_1131c442fdb61642)) {
        return false;
    }
    if (function_7eeb6264cce0f89f()) {
        self botsetscriptgoal(level.var_c8bf3a4374d235bf.curorigin, 16, "critical");
        result = bot_waittill_goal_or_fail();
        if (result == "goal") {
            self botpressbutton("use", 1);
            result = bot_usebutton_wait(1);
        }
    } else if (is_equal(self.pers["team"], level.var_350e53e094ac2a9f)) {
        if (!isdefined(self.var_1131c442fdb61642.curorigin)) {
            return false;
        }
        self botsetscriptgoal(self.var_1131c442fdb61642.curorigin, 16, "critical");
        result = bot_waittill_goal_or_fail();
        if (result == "goal") {
            self botpressbutton("use", 1);
            result = bot_usebutton_wait(1);
        }
    }
    return true;
}

// Namespace namespace_b45f3c1ccdc3ec83 / namespace_a3bd727bb638dffb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd7e
// Size: 0x419
function function_9ec814ba389bdf89() {
    if (!isdefined(level.zone.hackzones)) {
        return false;
    }
    var_726a9696890786c2 = getdvarint(@"hash_ed44a08b9b3977b4", 1000);
    teammates = scripts/mp/utility/teams::getteamdata(self.team, "alivePlayers");
    teammates = array_remove(teammates, self);
    var_1eb88dc02a294370 = undefined;
    bestscore = 0;
    isattacker = is_equal(self.pers["team"], game["attackers"]);
    foreach (zone in level.zone.hackzones) {
        if (!isdefined(zone) || istrue(zone.complete)) {
            continue;
        }
        score = 0;
        if (isattacker) {
            if (!zone.hacked) {
                if (istrue(zone.ishacking)) {
                    score = score + 200;
                } else {
                    score = score + 300;
                }
            } else {
                score = score + 100;
                score = score - zone.var_256648199aa47753 * 100;
            }
        } else if (zone.hacked) {
            if (istrue(zone.var_9832d5270deb1889)) {
                score = score + 200;
            } else {
                score = score + 300;
                score = score + zone.var_256648199aa47753 * 100;
            }
        } else {
            score = score + 100;
        }
        nearbyteammates = sortbydistancecullbyradius(teammates, zone.curorigin, var_726a9696890786c2);
        score = score - nearbyteammates.size * 1;
        if (bestscore < score) {
            bestscore = score;
            var_1eb88dc02a294370 = zone;
            continue;
        }
        if (bestscore == score) {
            if (distance2dsquared(zone.curorigin, self.origin) < distance2dsquared(var_1eb88dc02a294370.curorigin, self.origin)) {
                var_1eb88dc02a294370 = zone;
            }
        }
    }
    if (!isdefined(var_1eb88dc02a294370)) {
        return false;
    }
    shouldusebutton = isattacker && !var_1eb88dc02a294370.hacked && !istrue(var_1eb88dc02a294370.ishacking) || !isattacker && var_1eb88dc02a294370.hacked && !istrue(var_1eb88dc02a294370.var_9832d5270deb1889);
    if (shouldusebutton) {
        var_3a7e29744dcf854e = 16;
        point = getclosestpointonnavmesh(var_1eb88dc02a294370.curorigin);
        self botclearscriptgoal();
        waitframe();
        success = self botsetscriptgoal(point, var_3a7e29744dcf854e, "critical");
        if (!success) {
            return false;
        }
        /#
            sphere(point, var_3a7e29744dcf854e, (1, 0, 0), 0, 120);
        #/
        result = bot_waittill_goal_or_fail(2);
        if (result != "goal") {
            return false;
        }
        var_440b40d0c6eeb8d2 = getdvarint(@"hash_cf260feea44f2491", 5);
        if (isdefined(self.lastdamagedtime) && gettime() - self.lastdamagedtime < var_440b40d0c6eeb8d2) {
            return true;
        }
        holdtime = getdvarint(@"hash_20b6c6b984cdc05b", 3);
        self botpressbutton("use", holdtime);
        result = bot_usebutton_wait(holdtime, "damage");
        self botclearscriptgoal();
        return true;
    } else {
        var_1ea0f0660989cffb = 32;
        point = function_864ee9f5b187fb0a(var_1eb88dc02a294370.curorigin, 256, 1024);
        self botclearscriptenemy();
        success = self botsetscriptgoal(point, var_1ea0f0660989cffb, "critical");
        if (!success) {
            return false;
        }
        /#
            sphere(point, var_1ea0f0660989cffb, (1, 1, 1), 0, 120);
        #/
        result = bot_waittill_goal_or_fail(5);
        return (result == "goal");
    }
    return false;
}

// Namespace namespace_b45f3c1ccdc3ec83 / namespace_a3bd727bb638dffb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x119f
// Size: 0x497
function function_a329958947b1be20() {
    if (!isdefined(level.zone.currentphase)) {
        return 0;
    }
    if (level.zone.currentphase == "hack") {
        return function_9ec814ba389bdf89();
    } else if (level.zone.currentphase == "bomb") {
        if (!isdefined(level.zone.bombzones)) {
            return 0;
        }
        var_726a9696890786c2 = getdvarint(@"hash_8da3d5284a0b0c3d", 1000);
        teammates = scripts/mp/utility/teams::getteamdata(self.team, "alivePlayers");
        teammates = array_remove(teammates, self);
        var_1eb88dc02a294370 = undefined;
        bestscore = 0;
        isattacker = is_equal(self.pers["team"], game["attackers"]);
        foreach (zone in level.zone.bombzones) {
            if (!isdefined(zone) || istrue(zone.complete)) {
                continue;
            }
            score = 0;
            if (isattacker) {
                if (!zone.robbed) {
                    if (istrue(zone.var_b7c18e4654e6881a)) {
                        score = score + 200;
                    } else {
                        score = score + 300;
                    }
                } else {
                    score = score + 100;
                    score = score - zone.var_256648199aa47753 * 100;
                }
            } else if (zone.robbed) {
                if (istrue(zone.var_9832d5270deb1889)) {
                    score = score + 200;
                } else {
                    score = score + 300;
                    score = score + zone.var_256648199aa47753 * 100;
                }
            } else {
                score = score + 100;
            }
            nearbyteammates = sortbydistancecullbyradius(teammates, zone.curorigin, var_726a9696890786c2);
            score = score - nearbyteammates.size * 1;
            if (bestscore < score) {
                bestscore = score;
                var_1eb88dc02a294370 = zone;
                continue;
            }
            if (bestscore == score) {
                if (distance2dsquared(zone.curorigin, self.origin) < distance2dsquared(var_1eb88dc02a294370.curorigin, self.origin)) {
                    var_1eb88dc02a294370 = zone;
                }
            }
        }
        if (!isdefined(var_1eb88dc02a294370)) {
            return 0;
        }
        shouldusebutton = isattacker && !var_1eb88dc02a294370.robbed && !istrue(var_1eb88dc02a294370.var_b7c18e4654e6881a) || !isattacker && var_1eb88dc02a294370.robbed && !istrue(var_1eb88dc02a294370.var_9832d5270deb1889);
        if (shouldusebutton) {
            var_3a7e29744dcf854e = 16;
            point = getclosestpointonnavmesh(var_1eb88dc02a294370.curorigin);
            self botclearscriptgoal();
            waitframe();
            success = self botsetscriptgoal(point, var_3a7e29744dcf854e, "critical");
            if (!success) {
                return 0;
            }
            /#
                sphere(point, var_3a7e29744dcf854e, (1, 0, 0), 0, 120);
            #/
            result = bot_waittill_goal_or_fail(2);
            if (result != "goal") {
                return 0;
            }
            var_927bef94aaecef83 = getdvarint(@"hash_4108174fc6fa9fbf", 5);
            if (isdefined(self.lastdamagedtime) && gettime() - self.lastdamagedtime < var_927bef94aaecef83) {
                return 1;
            }
            if (zone.robbed) {
                holdtime = getdvarint(@"hash_a1aaf3a8323384a2", 5);
            } else {
                holdtime = getdvarint(@"hash_dd35cc4eb6279867", 5);
            }
            self botpressbutton("use", holdtime);
            result = bot_usebutton_wait(holdtime, "damage");
            self botclearscriptgoal();
            return 1;
        } else {
            var_1ea0f0660989cffb = 32;
            point = function_864ee9f5b187fb0a(var_1eb88dc02a294370.curorigin, 256, 1024);
            self botclearscriptenemy();
            success = self botsetscriptgoal(point, var_1ea0f0660989cffb, "critical");
            if (!success) {
                return 0;
            }
            /#
                sphere(point, var_1ea0f0660989cffb, (1, 1, 1), 0, 120);
            #/
            result = bot_waittill_goal_or_fail(5);
            return (result == "goal");
        }
    }
    return 0;
}

// Namespace namespace_b45f3c1ccdc3ec83 / namespace_a3bd727bb638dffb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x163e
// Size: 0x312
function function_47f50aa0634c3b02() {
    var_144da732d85f9cb9 = 512;
    var_3ed6540cb9f94f5c = 20;
    var_3613882be77daf1d = var_144da732d85f9cb9;
    if (!isdefined(self.vehicle_target)) {
        self.vehicle_target = level.escortvehicles[0];
    }
    isattacker = is_equal(self.pers["team"], game["attackers"]);
    if (!isdefined(self.vehicle_target) || !istrue(self.vehicle_target.var_29a4616e42091783)) {
        if (isattacker) {
            if (isdefined(level.retreatend) && istrue(level.retreatend["zone_2"])) {
                var_1604f1383b5b8325 = getent("wheelson_airdrop", "script_noteworthy");
                if (isdefined(var_1604f1383b5b8325)) {
                    var_4baf4f8316b6450a = getclosestpointonnavmesh(var_1604f1383b5b8325.origin);
                    if (isdefined(var_4baf4f8316b6450a)) {
                        self botsetscriptgoal(var_4baf4f8316b6450a, var_3ed6540cb9f94f5c, "critical");
                        bot_waittill_goal_or_fail();
                        self botpressbutton("use", 10);
                        self botclearscriptgoal();
                        return true;
                    }
                }
            }
        }
        return false;
    }
    if (!istrue(self.var_3a9ae1fe9210a5b7) && isdefined(self.vehicle_target.tanknearbyrange)) {
        var_3613882be77daf1d = self.vehicle_target.tanknearbyrange;
    }
    var_4baf4f8316b6450a = undefined;
    if (istrue(self.vehicle_target.var_65ab8f532ca7195)) {
        if (!isdefined(self.vehicle_target.var_bd58ba3741947988.nodes)) {
            self.vehicle_target.var_bd58ba3741947988.nodes = bot_get_valid_nodes_in_trigger(self.vehicle_target.var_bd58ba3741947988.trigger);
        }
        if (self.vehicle_target.var_bd58ba3741947988.nodes.size > 0) {
            nodetogo = random(self.vehicle_target.var_bd58ba3741947988.nodes);
            var_4baf4f8316b6450a = nodetogo.origin;
        }
    } else if (!isattacker) {
        if (isdefined(self.vehicle_target.var_bd58ba3741947988) && function_286ec19da44b5f3(self.vehicle_target, self.pers["team"])) {
            var_4baf4f8316b6450a = getrandomnavpoint(self.vehicle_target.var_bd58ba3741947988.trigger.origin, var_144da732d85f9cb9);
        }
    }
    if (!isdefined(var_4baf4f8316b6450a)) {
        var_4baf4f8316b6450a = getrandomnavpoint(self.vehicle_target.origin, var_3613882be77daf1d);
    }
    if (!isdefined(var_4baf4f8316b6450a)) {
        return false;
    }
    if (!self botsetscriptgoal(var_4baf4f8316b6450a, 64, "critical")) {
        return false;
    }
    result = bot_waittill_goal_or_fail();
    if (result == "goal") {
        self botclearscriptgoal();
        return true;
    }
    return false;
}

// Namespace namespace_b45f3c1ccdc3ec83 / namespace_a3bd727bb638dffb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1958
// Size: 0x440
function function_c62f2faf741f9a21() {
    if (scripts/mp/gametypes/wm_objectives::function_88cb5e18754f7caf(level.zone)) {
        var_d1b2eaa0e8a848cb = undefined;
        bestscore = 0;
        isattacker = is_equal(self.pers["team"], game["attackers"]);
        attackers = scripts/mp/utility/teams::getteamdata(game["attackers"], "players");
        var_fc29bd54654586f3 = getdvarint(@"hash_ed44a08b9b3977b4", 400);
        if (isdefined(self.carryingflag)) {
            var_d1b2eaa0e8a848cb = level.zone.flagzone;
        } else {
            foreach (flag in level.zone.captureflags) {
                if (!isdefined(flag) || istrue(flag.complete)) {
                    continue;
                }
                score = 0;
                if (isattacker) {
                    if (istrue(flag.iscarrying)) {
                        score = score + 200;
                    } else {
                        score = score + 300;
                    }
                    var_61e70cb9d6a225fd = distance2d(flag.curorigin, self.origin);
                    score = score + 80000 / var_61e70cb9d6a225fd;
                } else {
                    if (istrue(flag.iscarrying)) {
                        score = score + 300;
                    } else {
                        score = score + 200;
                    }
                    var_95f2a51e7b487eb2 = sortbydistancecullbyradius(attackers, flag.curorigin, var_fc29bd54654586f3);
                    score = score + var_95f2a51e7b487eb2.size * 50;
                }
                var_ed581a61684ae7ef = distance2d(flag.curorigin, level.zone.flagzone.curorigin);
                score = score + 160000 / var_ed581a61684ae7ef;
                if (bestscore < score) {
                    bestscore = score;
                    var_d1b2eaa0e8a848cb = flag;
                }
            }
        }
        if (!isdefined(var_d1b2eaa0e8a848cb)) {
            return 0;
        }
        shouldusebutton = isattacker && (!istrue(var_d1b2eaa0e8a848cb.iscarrying) || isdefined(self.carryingflag));
        if (shouldusebutton) {
            var_3a7e29744dcf854e = 16;
            point = getclosestpointonnavmesh(var_d1b2eaa0e8a848cb.curorigin);
            self botclearscriptgoal();
            waitframe();
            success = self botsetscriptgoal(point, var_3a7e29744dcf854e, "critical");
            if (!success) {
                return 0;
            }
            /#
                sphere(point, var_3a7e29744dcf854e, (1, 0, 0), 0, 120);
            #/
            result = bot_waittill_goal_or_fail(2);
            if (result != "goal") {
                return 0;
            }
            var_440b40d0c6eeb8d2 = getdvarint(@"hash_cf260feea44f2491", 5);
            if (isdefined(self.lastdamagedtime) && gettime() - self.lastdamagedtime < var_440b40d0c6eeb8d2) {
                return 1;
            }
            self botpressbutton("use", 1);
            result = bot_usebutton_wait(1);
            self botclearscriptgoal();
            return 1;
        } else {
            var_1ea0f0660989cffb = 32;
            point = function_864ee9f5b187fb0a(var_d1b2eaa0e8a848cb.curorigin, 256, 1024);
            self botclearscriptenemy();
            success = self botsetscriptgoal(point, var_1ea0f0660989cffb, "critical");
            if (!success) {
                return 0;
            }
            /#
                sphere(point, var_1ea0f0660989cffb, (1, 1, 1), 0, 120);
            #/
            result = bot_waittill_goal_or_fail(5);
            return (result == "goal");
        }
        return 0;
    }
    var_e6065833510c1c0c = level.zone.var_d731642d971f0c49;
    if (!isdefined(var_e6065833510c1c0c)) {
        return 0;
    }
    if (!isdefined(var_e6065833510c1c0c.nodes)) {
        var_e6065833510c1c0c.nodes = bot_get_valid_nodes_in_trigger(var_e6065833510c1c0c.trigger);
    }
    if (!isdefined(var_e6065833510c1c0c.entrance_indices)) {
        bot_cache_entrances_to_zones([var_e6065833510c1c0c]);
    }
    return function_1631df751543c615(var_e6065833510c1c0c);
}

// Namespace namespace_b45f3c1ccdc3ec83 / namespace_a3bd727bb638dffb
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1d9f
// Size: 0x80
function function_864ee9f5b187fb0a(origin, radius_min, radius_max) {
    r = randomfloatrange(radius_min, radius_max);
    angle = randomfloat(360);
    offset = (r * cos(angle), r * sin(angle), 0);
    pos = origin + offset;
    navpos = getclosestpointonnavmesh(pos);
    return navpos;
}

// Namespace namespace_b45f3c1ccdc3ec83 / namespace_a3bd727bb638dffb
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1e27
// Size: 0x38
function function_96811b18496ea942(objectivetype, func) {
    if (!isdefined(level.var_395a230826837426)) {
        level.var_395a230826837426 = [];
    }
    level.var_395a230826837426[objectivetype] = func;
}

// Namespace namespace_b45f3c1ccdc3ec83 / namespace_a3bd727bb638dffb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e66
// Size: 0xd
function function_7eeb6264cce0f89f() {
    return istrue(self.var_5b3c77e2eafab370);
}

// Namespace namespace_b45f3c1ccdc3ec83 / namespace_a3bd727bb638dffb
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1e7b
// Size: 0x13
function clear_defend() {
    if (bot_is_defending()) {
        bot_defend_stop();
    }
}

// Namespace namespace_b45f3c1ccdc3ec83 / namespace_a3bd727bb638dffb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e95
// Size: 0x22
function bot_is_capturing_zone(zone) {
    if (!bot_is_capturing()) {
        return false;
    }
    return self.current_zone == zone;
}

// Namespace namespace_b45f3c1ccdc3ec83 / namespace_a3bd727bb638dffb
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ebf
// Size: 0x78
function bot_capture_koth_zone(zone) {
    self.current_zone = zone;
    optional_params["entrance_points_index"] = zone.entrance_indices;
    optional_params["override_origin_node"] = zone.center_node;
    bot_capture_zone(zone.trigger.origin, zone.nodes, zone.trigger, optional_params);
}

// Namespace namespace_b45f3c1ccdc3ec83 / namespace_a3bd727bb638dffb
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1f3e
// Size: 0x6f
function function_83f5124a532560e(origin, radius) {
    if (is_equal(self.pers["team"], game["attackers"])) {
        enemies = scripts/mp/utility/teams::getteamdata(game["defenders"], "alivePlayers");
    } else {
        enemies = scripts/mp/utility/teams::getteamdata(game["attackers"], "alivePlayers");
    }
    return sortbydistancecullbyradius(enemies, origin, radius);
}

// Namespace namespace_b45f3c1ccdc3ec83 / namespace_a3bd727bb638dffb
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1fb5
// Size: 0xc4
function function_286ec19da44b5f3(ent, team) {
    volumes = level.zone.subzones;
    if (isdefined(level.var_354c397f5458af46)) {
        volumes = level.var_354c397f5458af46;
    }
    foreach (volume in volumes) {
        volumeteam = game[volume.side];
        if (is_equal(team, volumeteam)) {
            continue;
        }
        if (ent istouching(volume)) {
            return true;
        }
    }
    return false;
}

