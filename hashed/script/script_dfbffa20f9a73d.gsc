// mwiii decomp prototype
#using script_59ff79d681bb860c;
#using script_3d2770dc09c1243;
#using scripts\engine\utility.gsc;
#using scripts\mp\bots\bots_util.gsc;

#namespace namespace_63bf3f1fa5dc2ff7;

// Namespace namespace_63bf3f1fa5dc2ff7/namespace_47a22a8f9dbdb88d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f2
// Size: 0x1a8
function init() {
    var_36effc06510c1738 = spawnstruct();
    var_36effc06510c1738.doors = [];
    var_36effc06510c1738.total = 0;
    var_36effc06510c1738.var_bb9730f6ce13f387 = 0;
    var_36effc06510c1738.var_baace84a7c08f5dd = [];
    level.var_367c15041e69a2a9.door = var_36effc06510c1738;
    doors = getentitylessscriptablearray(undefined, undefined, undefined, undefined, "door");
    foreach (door in doors) {
        state = door getscriptablepartstate("door", 1);
        islocked = door function_fac544c98a3d9eb4();
        /#
            assert(!islocked);
        #/
        if (!isdefined(state) || state != "closed") {
            continue;
        }
        var_646b88b6b0468f9 = door function_d90515f5e17dbc6f();
        if (!ispointonnavmesh(var_646b88b6b0468f9)) {
            continue;
        }
        door.var_66b972304c7460ce = 0;
        level.var_367c15041e69a2a9.door.doors[level.var_367c15041e69a2a9.door.doors.size] = door;
    }
    level.var_367c15041e69a2a9.door.total = level.var_367c15041e69a2a9.door.doors.size;
}

// Namespace namespace_63bf3f1fa5dc2ff7/namespace_47a22a8f9dbdb88d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a1
// Size: 0x231
function function_ffd4129f1032e796() {
    self botsetdifficultysetting("slideChance", 0);
    self.var_367c15041e69a2a9.onplayerkilled = &onplayerkilled;
    if (level.var_367c15041e69a2a9.door.doors.size <= 0) {
        return;
    }
    door = function_8563e304ebeb864e();
    self.var_367c15041e69a2a9.var_97dd4f64f6425eaa = door;
    if (!function_72a26ae8088df617(door)) {
        function_b2c0521b89512ba9(door);
        return;
    }
    var_d65b2fb0b79bd54d = function_5e5bd9a8b8896f3a(door);
    self.var_367c15041e69a2a9.var_97dd4f64f6425eaa.var_d65b2fb0b79bd54d = var_d65b2fb0b79bd54d;
    if (!isdefined(var_d65b2fb0b79bd54d)) {
        function_3ea375eb460f79a4("can't find test pos", self, undefined, door, undefined, undefined, 0);
        self.var_367c15041e69a2a9.var_97dd4f64f6425eaa.var_21583d839c04452e = 0;
        return;
    }
    var_d22fdca158e266e = 20;
    var_fc77e2b383d17ec9 = function_721588ae374756b5(var_d65b2fb0b79bd54d.var_5394fc468396843c, var_d22fdca158e266e);
    if (isdefined(var_fc77e2b383d17ec9)) {
        function_3ea375eb460f79a4("teleport failed/" + var_fc77e2b383d17ec9, self, self.origin, door, var_d65b2fb0b79bd54d.var_5394fc468396843c, var_d65b2fb0b79bd54d.var_518a4e9f2d3b108d, 0);
        self.var_367c15041e69a2a9.var_97dd4f64f6425eaa.var_21583d839c04452e = 0;
        return;
    }
    self.var_367c15041e69a2a9.var_97dd4f64f6425eaa.var_21583d839c04452e = 0;
    var_8be25b38b6cc08ec = [0:var_d65b2fb0b79bd54d.var_518a4e9f2d3b108d, 1:var_d65b2fb0b79bd54d.var_5394fc468396843c];
    while (var_8be25b38b6cc08ec.size > 0) {
        nextpos = var_8be25b38b6cc08ec[0];
        if (!function_41eeb1b4bf5b7790(self, var_d65b2fb0b79bd54d, nextpos)) {
            break;
        }
        var_8be25b38b6cc08ec = array_remove(var_8be25b38b6cc08ec, nextpos);
    }
    door scriptabledoorclose();
    if (isdefined(self.var_367c15041e69a2a9.var_97dd4f64f6425eaa.var_21583d839c04452e)) {
        self.var_367c15041e69a2a9.var_97dd4f64f6425eaa.var_21583d839c04452e = var_8be25b38b6cc08ec.size <= 0;
    }
}

// Namespace namespace_63bf3f1fa5dc2ff7/namespace_47a22a8f9dbdb88d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d9
// Size: 0x28a
function function_60524de5341e2666() {
    if (isdefined(self)) {
        if (isdefined(self.var_367c15041e69a2a9.var_97dd4f64f6425eaa) && isdefined(self.var_367c15041e69a2a9.var_97dd4f64f6425eaa.var_21583d839c04452e)) {
            if (istrue(self.var_367c15041e69a2a9.var_97dd4f64f6425eaa.var_21583d839c04452e)) {
                level.var_367c15041e69a2a9.door.var_bb9730f6ce13f387++;
            } else {
                door = self.var_367c15041e69a2a9.var_97dd4f64f6425eaa;
                door.var_66b972304c7460ce++;
                if (door.var_66b972304c7460ce >= 3) {
                    level.var_367c15041e69a2a9.door.var_baace84a7c08f5dd[level.var_367c15041e69a2a9.door.var_baace84a7c08f5dd.size] = door.var_d65b2fb0b79bd54d;
                    var_5122f73574af9ea1 = door.var_b5968e1bb5f3a13d;
                    report(var_5122f73574af9ea1.var_889f3d7e1c1ea6b, var_5122f73574af9ea1.bot, var_5122f73574af9ea1.lastposition, door, var_5122f73574af9ea1.var_5394fc468396843c, var_5122f73574af9ea1.var_518a4e9f2d3b108d, var_5122f73574af9ea1.var_ea742470751d2e85);
                } else {
                    function_b2c0521b89512ba9(self.var_367c15041e69a2a9.var_97dd4f64f6425eaa);
                }
            }
            if (level.var_367c15041e69a2a9.door.var_bb9730f6ce13f387 + level.var_367c15041e69a2a9.door.var_baace84a7c08f5dd.size >= level.var_367c15041e69a2a9.door.total) {
                var_444a5451f436094a = "test result: " + level.var_367c15041e69a2a9.door.total + " doors " + level.var_367c15041e69a2a9.door.var_bb9730f6ce13f387 + " succeed " + level.var_367c15041e69a2a9.door.var_baace84a7c08f5dd.size + " failed";
                function_9a0a24de119b078a("Door", var_444a5451f436094a);
            }
        }
        self botsetflag("disable_movement", 0);
        self.var_367c15041e69a2a9.var_97dd4f64f6425eaa = undefined;
    }
}

// Namespace namespace_63bf3f1fa5dc2ff7/namespace_47a22a8f9dbdb88d
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x86a
// Size: 0xc5
function private function_8563e304ebeb864e() {
    /#
        assert(level.var_367c15041e69a2a9.door.doors.size > 0);
    #/
    lastindex = level.var_367c15041e69a2a9.door.doors.size - 1;
    door = level.var_367c15041e69a2a9.door.doors[lastindex];
    level.var_367c15041e69a2a9.door.doors = array_remove_index(level.var_367c15041e69a2a9.door.doors, lastindex);
    return door;
}

// Namespace namespace_63bf3f1fa5dc2ff7/namespace_47a22a8f9dbdb88d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x937
// Size: 0x4f
function private function_b2c0521b89512ba9(door) {
    level.var_367c15041e69a2a9.door.doors = array_insert(level.var_367c15041e69a2a9.door.doors, door, 0);
}

// Namespace namespace_63bf3f1fa5dc2ff7/namespace_47a22a8f9dbdb88d
// Params 7, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x98d
// Size: 0xa9
function private function_3ea375eb460f79a4(var_889f3d7e1c1ea6b, bot, lastposition, door, var_5394fc468396843c, var_518a4e9f2d3b108d, var_ea742470751d2e85) {
    var_5122f73574af9ea1 = spawnstruct();
    var_5122f73574af9ea1.var_889f3d7e1c1ea6b = var_889f3d7e1c1ea6b;
    var_5122f73574af9ea1.bot = bot;
    var_5122f73574af9ea1.lastposition = lastposition;
    var_5122f73574af9ea1.var_5394fc468396843c = var_5394fc468396843c;
    var_5122f73574af9ea1.var_518a4e9f2d3b108d = var_518a4e9f2d3b108d;
    var_5122f73574af9ea1.var_ea742470751d2e85 = var_ea742470751d2e85;
    door.var_b5968e1bb5f3a13d = var_5122f73574af9ea1;
}

// Namespace namespace_63bf3f1fa5dc2ff7/namespace_47a22a8f9dbdb88d
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa3d
// Size: 0x3b
function function_3113f44ebafe71b1() {
    return level.var_367c15041e69a2a9.door.doors.size > 0 || isdefined(self.var_367c15041e69a2a9.var_97dd4f64f6425eaa);
}

// Namespace namespace_63bf3f1fa5dc2ff7/namespace_47a22a8f9dbdb88d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa80
// Size: 0x28
function private function_72a26ae8088df617(door) {
    if (door scriptabledoorisclosed()) {
        return 1;
    }
    door scriptabledoorclose();
    wait(1);
    return door scriptabledoorisclosed();
}

// Namespace namespace_63bf3f1fa5dc2ff7/namespace_47a22a8f9dbdb88d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xab0
// Size: 0x18f
function private function_5e5bd9a8b8896f3a(door) {
    var_dd4626b0fa4445e2 = [0:50, 1:70, 2:100];
    var_a53088f1b67dde16 = 50;
    var_29e0b716037acbd9 = 1.25;
    var_646b88b6b0468f9 = door function_d90515f5e17dbc6f();
    foreach (dis in var_dd4626b0fa4445e2) {
        var_5394fc468396843c = function_f8350ab882cc2439(var_646b88b6b0468f9 + anglestoforward(door.angles + (0, -90, 0)) * dis);
        var_5394fc468396843c = drop_to_ground(var_5394fc468396843c, var_a53088f1b67dde16);
        var_518a4e9f2d3b108d = function_f8350ab882cc2439(var_646b88b6b0468f9 + anglestoforward(door.angles + (0, 90, 0)) * dis);
        var_518a4e9f2d3b108d = drop_to_ground(var_518a4e9f2d3b108d, var_a53088f1b67dde16);
        if (distance(var_5394fc468396843c, var_518a4e9f2d3b108d) <= 2 * dis * var_29e0b716037acbd9) {
            var_d65b2fb0b79bd54d = spawnstruct();
            var_d65b2fb0b79bd54d.door = door;
            var_d65b2fb0b79bd54d.var_1cdf5229a7b795e2 = door.angles;
            var_d65b2fb0b79bd54d.var_5394fc468396843c = var_5394fc468396843c;
            var_d65b2fb0b79bd54d.var_518a4e9f2d3b108d = var_518a4e9f2d3b108d;
            var_d65b2fb0b79bd54d.midpoint = var_646b88b6b0468f9;
            return var_d65b2fb0b79bd54d;
        }
    }
    return undefined;
}

// Namespace namespace_63bf3f1fa5dc2ff7/namespace_47a22a8f9dbdb88d
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc47
// Size: 0x1ee
function private function_41eeb1b4bf5b7790(bot, var_d65b2fb0b79bd54d, targetpos) {
    var_e68c4bb8093910b8 = 4.5;
    var_3961ee7d4ad90424 = 0.25;
    var_ea742470751d2e85 = 0;
    var_ecbd358979c06c94 = function_71b519a5e0525acc();
    lastposition = bot.origin;
    while (1) {
        bot function_9e400058ef021b03(targetpos, 16);
        result = function_b564050a363f08ec(bot, var_3961ee7d4ad90424);
        if (!var_ea742470751d2e85) {
            var_ea742470751d2e85 = function_d750fac76a6017c9(var_d65b2fb0b79bd54d, lastposition, bot.origin);
            lastposition = bot.origin;
        }
        if (result == "goal") {
            if (!var_ea742470751d2e85) {
                function_3ea375eb460f79a4("bypass the door", bot, lastposition, var_d65b2fb0b79bd54d.door, var_d65b2fb0b79bd54d.var_5394fc468396843c, var_d65b2fb0b79bd54d.var_518a4e9f2d3b108d, var_ea742470751d2e85);
                return 0;
            }
            break;
        } else {
            if (gettimescale() == 4) {
                var_769dcc5659a2d870 = var_e68c4bb8093910b8 * 2.125 / var_e68c4bb8093910b8 / 4;
            } else {
                var_769dcc5659a2d870 = var_e68c4bb8093910b8;
            }
            if ((result == "timeout" || result == "bad_path_stuck") && function_71b519a5e0525acc() - var_ecbd358979c06c94 < var_769dcc5659a2d870 * 1000) {
                continue;
            } else if (result == "bad_path_door_blocker_door_owner" || result == "bad_path_door_blocker_invalid_client") {
                var_d65b2fb0b79bd54d.door scriptabledoorclose();
                function_b2c0521b89512ba9(var_d65b2fb0b79bd54d.door);
                bot.var_367c15041e69a2a9.var_97dd4f64f6425eaa.var_21583d839c04452e = undefined;
                return 0;
            }
            function_3ea375eb460f79a4(result, bot, lastposition, var_d65b2fb0b79bd54d.door, var_d65b2fb0b79bd54d.var_5394fc468396843c, var_d65b2fb0b79bd54d.var_518a4e9f2d3b108d, var_ea742470751d2e85);
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_63bf3f1fa5dc2ff7/namespace_47a22a8f9dbdb88d
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe3d
// Size: 0x72
function private function_d750fac76a6017c9(var_d65b2fb0b79bd54d, startpos, endpos) {
    var_1e35e50e4b93eab6 = 64;
    var_11855ac71db6dc0d = var_d65b2fb0b79bd54d.door.origin;
    var_1a2dfa0e910c8a94 = var_11855ac71db6dc0d + anglestoforward(var_d65b2fb0b79bd54d.var_1cdf5229a7b795e2) * var_1e35e50e4b93eab6;
    return function_3c55380b5e177254(startpos, endpos, var_11855ac71db6dc0d, var_1a2dfa0e910c8a94);
}

// Namespace namespace_63bf3f1fa5dc2ff7/namespace_47a22a8f9dbdb88d
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xeb7
// Size: 0x42
function private onplayerkilled(var_642470e1abc1bbf9) {
    if (!isbot(self)) {
        return;
    }
    report("death", self, self.lastdeathpos, self.var_367c15041e69a2a9.var_97dd4f64f6425eaa, undefined, undefined, 0);
}

// Namespace namespace_63bf3f1fa5dc2ff7/namespace_47a22a8f9dbdb88d
// Params 7, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf00
// Size: 0x296
function private report(var_889f3d7e1c1ea6b, bot, lastposition, door, var_5394fc468396843c, var_518a4e9f2d3b108d, var_ea742470751d2e85) {
    if (!istrue(level.var_367c15041e69a2a9.door.var_95c5f763c7b38e9c)) {
        header = "#time; #situation; #bot; #lastPosition; #doorIndex; #doorOrigin; #beforeDoorPos; #afterDoorPos; #isPassed";
        function_9a0a24de119b078a("Door", header);
        level.var_367c15041e69a2a9.door.var_95c5f763c7b38e9c = 1;
    }
    unknownpos = "unknownPos";
    lastposition = ter_op(isdefined(lastposition), lastposition, unknownpos);
    var_5394fc468396843c = ter_op(isdefined(var_5394fc468396843c), var_5394fc468396843c, unknownpos);
    var_518a4e9f2d3b108d = ter_op(isdefined(var_518a4e9f2d3b108d), var_518a4e9f2d3b108d, unknownpos);
    doorindex = -1;
    var_20510600314fe827 = (0, 0, 0);
    if (isdefined(door)) {
        doorindex = door.index;
        var_20510600314fe827 = door.origin;
    }
    var_444a5451f436094a = gettime() + ";" + var_889f3d7e1c1ea6b + ";" + bot getentitynumber() + ";" + lastposition + ";" + doorindex + ";" + var_20510600314fe827 + ";" + var_5394fc468396843c + ";" + var_518a4e9f2d3b108d + ";" + var_ea742470751d2e85;
    function_9a0a24de119b078a("Door", var_444a5451f436094a);
    /#
        if (isdefined(level.var_367c15041e69a2a9.door.var_31e45429b9998458)) {
            level.var_367c15041e69a2a9.door.var_31e45429b9998458 = level.var_367c15041e69a2a9.door.var_31e45429b9998458 + 1;
        } else {
            level.var_367c15041e69a2a9.door.var_31e45429b9998458 = 1;
        }
        var_646b88b6b0468f9 = door function_d90515f5e17dbc6f();
        camerapos = function_f8350ab882cc2439(var_646b88b6b0468f9 + anglestoforward(door.angles + (0, 90, 0)) * 170);
        camerapos = drop_to_ground(camerapos, 50);
        camerapos = (camerapos[0], camerapos[1], camerapos[2] - 40);
        function_f2bc01a7b0321f52("<unknown string>", var_646b88b6b0468f9, camerapos, door, level.var_367c15041e69a2a9.door.var_31e45429b9998458);
    #/
}

