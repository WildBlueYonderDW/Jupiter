// mwiii decomp prototype
#using scripts\mp\utility\teams.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\engine\trace.gsc;
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\debug.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_spawn.gsc;
#using scripts\cp_mp\vehicles\vehicle_interact.gsc;
#using scripts\mp\outofbounds.gsc;
#using script_189b67b2735b981d;
#using scripts\cp_mp\calloutmarkerping.gsc;
#using script_1f97a44d1761c919;
#using script_64acb6ce534155b7;
#using scripts\mp\utility\game.gsc;
#using scripts\common\vehicle_paths.gsc;
#using script_2bc0b0102f9b7751;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using script_5c65d346ac65390c;
#using scripts\common\vehicle.gsc;

#namespace namespace_80d9f81787d5f007;

// Namespace namespace_80d9f81787d5f007/namespace_e8fceb5cf6e8cdf8
// Params 9, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47c
// Size: 0x14b
function function_7d47bded29ed7882(var_92fea9c582fd2caa, heliheight, waittime, minwaittime, var_1a7e969d835799f2, var_716e36e221f60b56, var_abe738473a42706b, var_1e9ed21b5d947d43, var_1869ac124be0cc0b) {
    if (!isdefined(level.var_251923794d7ecf20)) {
        level.var_251923794d7ecf20 = spawnstruct();
    }
    level.var_251923794d7ecf20.var_92fea9c582fd2caa = var_92fea9c582fd2caa;
    level.var_251923794d7ecf20.heliheight = heliheight;
    level.var_251923794d7ecf20.var_7379eae6423b305d = waittime;
    level.var_251923794d7ecf20.var_52bacfc5ca39b6d3 = minwaittime;
    level.var_251923794d7ecf20.var_1a7e969d835799f2 = var_1a7e969d835799f2;
    level.var_251923794d7ecf20.var_716e36e221f60b56 = var_716e36e221f60b56;
    level.var_251923794d7ecf20.var_abe738473a42706b = var_abe738473a42706b;
    level.var_251923794d7ecf20.var_1e9ed21b5d947d43 = var_1e9ed21b5d947d43;
    level.var_251923794d7ecf20.var_1869ac124be0cc0b = var_1869ac124be0cc0b;
    level.var_251923794d7ecf20.var_52c02cddbd6c79d7 = getdvarfloat(@"hash_ce7f3e9f2382e943", 2);
}

// Namespace namespace_80d9f81787d5f007/namespace_e8fceb5cf6e8cdf8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5ce
// Size: 0x40
function function_3c673414d075ebfc(var_1d852e7cce921d79, func) {
    if (isdefined(level.var_251923794d7ecf20)) {
        namespace_3c37cb17ade254d::registersharedfunc("chopper_exfil", var_1d852e7cce921d79, func);
    } else {
        /#
            assertmsg("Tried to add Chopper Exfil Callback without Initializing it first!");
        #/
    }
}

// Namespace namespace_80d9f81787d5f007/namespace_e8fceb5cf6e8cdf8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x615
// Size: 0x4a0
function function_ed11ae9fe1abdeb(ent, endpos) {
    if (!isdefined(ent)) {
        return undefined;
    }
    if (!isdefined(level.var_251923794d7ecf20.var_12d84b367009674d)) {
        level.var_251923794d7ecf20.var_12d84b367009674d = [];
    }
    if (isent(ent) && isdefined(level.var_251923794d7ecf20.var_12d84b367009674d[ent getentitynumber()])) {
        return level.var_251923794d7ecf20.var_12d84b367009674d[ent getentitynumber()];
    }
    var_2f58e7950b321302 = function_8fb6efc069bf4ef8(ent, level.var_251923794d7ecf20.heliheight, 1);
    var_d30d83160adfa539 = var_2f58e7950b321302 - ent.origin;
    var_d30d83160adfa539 = vectornormalize((var_d30d83160adfa539[0], var_d30d83160adfa539[1], 0));
    exitangles = vectortoangles(var_d30d83160adfa539 * -1);
    startstruct = spawnstruct();
    startstruct.angles = ent.angles;
    if (isdefined(ent.info.var_b44c269ea13f56ae)) {
        endpos = ent.info.var_b44c269ea13f56ae;
        startstruct.angles = ent.info.var_a55fa332b1255e04;
    }
    startstruct.origin = endpos + (0, 0, level.var_251923794d7ecf20.var_716e36e221f60b56);
    startstruct.radius = 500;
    startstruct.speed = 10;
    if (isent(ent)) {
        startstruct.targetname = "exfil" + ent getentitynumber();
    }
    startstruct.script_anglevehicle = "1";
    if (istrue(ent.info.land)) {
        startstruct.script_land = "1";
    }
    var_9e4e5282cb41521f = function_38e2d21d6f6e393b(startstruct.origin + var_d30d83160adfa539 * 100 + (0, 0, level.var_251923794d7ecf20.heliheight), startstruct, startstruct.targetname, 10, 1, ent.angles);
    var_9e4e5382cb415452 = function_38e2d21d6f6e393b(var_9e4e5282cb41521f.origin + var_d30d83160adfa539 * 5000, var_9e4e5282cb41521f, startstruct.targetname, 20, 2, exitangles);
    var_9e4e5482cb415685 = function_38e2d21d6f6e393b(var_9e4e5282cb41521f.origin + var_d30d83160adfa539 * 10000, var_9e4e5382cb415452, startstruct.targetname, 85, 3, exitangles);
    /#
        if (getdvarint(@"hash_57fea5b439641c39", 0) == 1) {
            level thread namespace_d028276791d9cff6::drawsphere(startstruct.origin, 64, 25, (0, 0, 60));
            level thread namespace_d028276791d9cff6::drawline(startstruct.origin, anglestoforward(startstruct.angles) * 100 + startstruct.origin, 25, (0, 0, 60));
            level thread namespace_d028276791d9cff6::drawsphere(var_9e4e5282cb41521f.origin, 64, 25, (0, 0, 60));
            level thread namespace_d028276791d9cff6::drawline(var_9e4e5282cb41521f.origin, anglestoforward(var_9e4e5282cb41521f.angles) * 100 + var_9e4e5282cb41521f.origin, 25, (0, 0, 60));
            level thread namespace_d028276791d9cff6::drawsphere(var_9e4e5382cb415452.origin, 64, 25, (0, 0, 60));
            level thread namespace_d028276791d9cff6::drawline(var_9e4e5382cb415452.origin, anglestoforward(var_9e4e5382cb415452.angles) * 100 + var_9e4e5382cb415452.origin, 25, (0, 0, 60));
            level thread namespace_d028276791d9cff6::drawsphere(var_9e4e5482cb415685.origin, 64, 25, (0, 0, 60));
            level thread namespace_d028276791d9cff6::drawline(var_9e4e5482cb415685.origin, anglestoforward(var_9e4e5482cb415685.angles) * 100 + var_9e4e5482cb415685.origin, 25, (0, 0, 60));
        }
    #/
    if (isent(ent)) {
        level.var_251923794d7ecf20.var_12d84b367009674d[ent getentitynumber()] = var_9e4e5482cb415685;
    }
    return var_9e4e5482cb415685;
}

// Namespace namespace_80d9f81787d5f007/namespace_e8fceb5cf6e8cdf8
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xabd
// Size: 0x26e
function function_1093b8f392744e3b(ent, endpos, var_dcea0339d68fe36a, var_b092096c70bcc8e4, var_c4df87d140c3e8d3) {
    if (istrue(var_b092096c70bcc8e4)) {
        var_a011729d000a28d2 = ent.origin - level.radiation.origin;
        toangles = vectortoangles(var_a011729d000a28d2);
        var_2f58e7950b321302 = function_8fb6efc069bf4ef8(ent, var_dcea0339d68fe36a, 0, toangles[1]);
    } else {
        var_2f58e7950b321302 = function_8fb6efc069bf4ef8(ent, var_dcea0339d68fe36a, 0);
    }
    var_d30d83160adfa539 = var_2f58e7950b321302 - endpos;
    var_d30d83160adfa539 = vectornormalize((var_d30d83160adfa539[0], var_d30d83160adfa539[1], 0));
    exitangles = vectortoangles(var_d30d83160adfa539);
    startstruct = spawnstruct();
    startstruct.origin = var_2f58e7950b321302;
    startstruct.angles = ent.angles;
    startstruct.radius = 500;
    startstruct.speed = 80;
    if (isent(ent)) {
        startstruct.targetname = "exfilExit" + ent getentitynumber();
    }
    var_b9fc106959c06c4f = endpos + (0, 0, 900);
    var_9f481255f2c41d46 = var_b9fc106959c06c4f + (0, 0, var_dcea0339d68fe36a);
    startangles = function_53c4c53197386572(var_c4df87d140c3e8d3, ent.angles);
    var_9e4e5182cb414fec = function_38e2d21d6f6e393b(var_9f481255f2c41d46 + var_d30d83160adfa539 * 9000 + (0, 0, 9000), startstruct, startstruct.targetname, 40, 1, exitangles);
    var_9e4e5282cb41521f = function_38e2d21d6f6e393b(var_9f481255f2c41d46 + var_d30d83160adfa539 * 5000, var_9e4e5182cb414fec, startstruct.targetname, 20, 2, exitangles);
    var_9e4e5382cb415452 = function_38e2d21d6f6e393b(var_9f481255f2c41d46, var_9e4e5282cb41521f, startstruct.targetname, 40, 3, exitangles);
    var_9e4e5482cb415685 = function_38e2d21d6f6e393b(var_9f481255f2c41d46 - (0, 0, 300), var_9e4e5382cb415452, startstruct.targetname, 10, 4, startangles);
    var_9e4e4d82cb414720 = function_38e2d21d6f6e393b(var_b9fc106959c06c4f, var_9e4e5482cb415685, startstruct.targetname, 10, 5, startangles);
    return var_9e4e4d82cb414720;
}

// Namespace namespace_80d9f81787d5f007/namespace_e8fceb5cf6e8cdf8
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd33
// Size: 0x189
function function_8fb6efc069bf4ef8(startnode, heliheight, reverse, var_b092096c70bcc8e4) {
    if (!isdefined(reverse)) {
        reverse = 0;
    }
    var_3fb4a86293ed25a6 = 10;
    contents = create_contents(0, 1, 1, 1, 1, 0, 1, 1, 0);
    startpos = startnode.origin + (0, 0, heliheight + 600);
    yaw = ter_op(isdefined(var_b092096c70bcc8e4), var_b092096c70bcc8e4, startnode.angles[1]);
    var_3674d96c61e2dd0d = ter_op(reverse, yaw + 180, yaw);
    ignoreents = undefined;
    if (isdefined(level.vehicle) && isdefined(level.vehicle.instances)) {
        ignoreents = level.vehicle.instances["little_bird"];
    }
    yaw = 0;
    while (yaw < 360) {
        var_3674d96c61e2dd0d = var_3674d96c61e2dd0d + yaw;
        testangles = (0, var_3674d96c61e2dd0d, 0);
        var_29006f80487a7787 = startpos;
        var_dd77d0a6d708ac18 = startpos + anglestoforward(testangles) * 18000;
        var_d4eb961f60968a16 = sphere_trace(var_29006f80487a7787, var_dd77d0a6d708ac18, 100, ignoreents, contents, 1);
        if (var_d4eb961f60968a16["fraction"] == 1) {
            return var_dd77d0a6d708ac18;
        }
        if (yaw % 3 == 0) {
            waitframe();
        }
        yaw = yaw + var_3fb4a86293ed25a6;
    }
    return undefined;
}

// Namespace namespace_80d9f81787d5f007/namespace_e8fceb5cf6e8cdf8
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xec4
// Size: 0xad
function private function_38e2d21d6f6e393b(pos, var_c013cfd919a1a62d, triggername, speed, num, var_b092096c70bcc8e4) {
    struct = spawnstruct();
    struct.speed = speed;
    struct.origin = pos;
    struct.angles = ter_op(isdefined(var_b092096c70bcc8e4), var_b092096c70bcc8e4, var_c013cfd919a1a62d.angles);
    struct.radius = 500;
    struct.target = var_c013cfd919a1a62d;
    struct.script_anglevehicle = "1";
    return struct;
}

// Namespace namespace_80d9f81787d5f007/namespace_e8fceb5cf6e8cdf8
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf79
// Size: 0x2a7
function function_d05f47d864f18196(owner, pos, angles, var_4fffc035c8679b98, var_7e6513b2ae0d5c1d, var_14cde247ac3313a4) {
    if (!isdefined(var_4fffc035c8679b98)) {
        var_4fffc035c8679b98 = 1;
    }
    if (!isdefined(var_7e6513b2ae0d5c1d)) {
        var_7e6513b2ae0d5c1d = 0;
    }
    spawndata = spawnstruct();
    spawndata.origin = pos;
    spawndata.angles = angles;
    spawndata.spawntype = "GAME_MODE";
    if (isdefined(var_14cde247ac3313a4)) {
        spawndata.var_14cde247ac3313a4 = var_14cde247ac3313a4;
    } else if (!var_4fffc035c8679b98) {
        spawndata.var_14cde247ac3313a4 = "dmzwhite";
    }
    if (istrue(level.var_291b51c7af8d1204)) {
        spawndata.team = "axis";
        spawndata.mtx = "v013";
    }
    heli = undefined;
    while (!isdefined(heli)) {
        heli = namespace_1f188a13f7e79610::vehicle_spawn("veh9_palfa", spawndata);
        if (!isdefined(heli)) {
            wait(1);
        }
    }
    namespace_dace9d390bc4a290::vehicle_spawn_preventrespawn(heli);
    namespace_141c4634b6ea7b27::vehicle_interact_makeunusable(heli);
    heli.var_135a33623c519457 = 1;
    heli.health = ter_op(isdefined(level.var_251923794d7ecf20.var_1e9ed21b5d947d43), level.var_251923794d7ecf20.var_1e9ed21b5d947d43, 1000);
    heli.maxhealth = heli.health;
    heli.var_902a7ffcff8aa65 = [];
    heli.var_75adb7f3cbe5d522 = level.var_251923794d7ecf20.var_7379eae6423b305d + level.var_251923794d7ecf20.var_52bacfc5ca39b6d3;
    if (istrue(var_4fffc035c8679b98)) {
        heli.var_1e897ae1c018b2c2 = owner.team;
    }
    heli.var_878914b0358bc7b5 = [];
    heli.onStartRiding = &function_1e04f8a9053512a4;
    heli.onEndRiding = &function_6519494290b58824;
    heli.var_c547488f80d3eb28 = 1;
    heli.unload_land_offset = 255;
    heli.script_disconnectpaths = 1;
    heli.var_746334c2ac85aacc = 10000;
    heli.handleeventcallback = &function_ad65ea51ce655f42;
    heli.var_a2ba7043631b3392 = 1;
    heli function_264031b20e04a07c();
    heli function_247ad6a91f6a4ffe(1);
    if (namespace_3c37cb17ade254d::issharedfuncdefined("chopper_exfil", "setup_gas_masks")) {
        [[ namespace_3c37cb17ade254d::getsharedfunc("chopper_exfil", "setup_gas_masks") ]](heli);
    }
    heli namespace_3c37cb17ade254d::function_f3bb4f4911a1beb2("pmc_missions", "onSpawnExfilHeli", var_7e6513b2ae0d5c1d);
    return heli;
}

// Namespace namespace_80d9f81787d5f007/namespace_e8fceb5cf6e8cdf8
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1228
// Size: 0xbe
function private function_264031b20e04a07c() {
    var_2a94a31f5c16a229 = [0:"body_sp_ally_pilot_western_vm_fullbody", 1:"body_sp_ally_pilot_western_vm_fullbody"];
    var_30f2bdd1710c71fb = [0:"iw9_mp_heli_palfa_seat_0_idle", 1:"iw9_heli_palfa_seat_1_idle"];
    var_a6fe8ce5d2c31d36 = [0:"tag_seat_0", 1:"tag_seat_1"];
    var_c2a106d998c9f3be = 2;
    self.var_b23e608ef55db7fa = [];
    for (i = 0; i < var_c2a106d998c9f3be; i++) {
        var_514d9e806d48b808 = function_8c5dd82b28a2c584(i, var_a6fe8ce5d2c31d36[i], var_30f2bdd1710c71fb[i], var_2a94a31f5c16a229[i], undefined);
        self.var_b23e608ef55db7fa[self.var_b23e608ef55db7fa.size] = var_514d9e806d48b808;
    }
}

// Namespace namespace_80d9f81787d5f007/namespace_e8fceb5cf6e8cdf8
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x12ed
// Size: 0x120
function private function_8c5dd82b28a2c584(var_dcef536353ea980b, tag, animname, model, headmodel) {
    var_2626560098d08682 = self gettagorigin(tag);
    var_b7850001037aa074 = self gettagangles(tag);
    spawned = spawn("script_model", var_2626560098d08682);
    spawned.angles = var_b7850001037aa074;
    spawned setmodel(model);
    var_2626560098d08682 = spawned gettagorigin("j_spine4");
    var_b7850001037aa074 = spawned gettagangles("j_spine4");
    spawned.linkedents = [];
    if (isdefined(headmodel)) {
        head = spawn("script_model", var_2626560098d08682);
        head.angles = var_b7850001037aa074;
        head setmodel(headmodel);
        head linkto(spawned, "j_spine4");
        spawned.linkedents[spawned.linkedents.size] = head;
        spawned.head = head;
    }
    spawned linkto(self);
    if (isdefined(animname)) {
        spawned scriptmodelplayanim(animname);
    }
    return spawned;
}

// Namespace namespace_80d9f81787d5f007/namespace_e8fceb5cf6e8cdf8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1415
// Size: 0x1a
function function_423f49e2512a5f53() {
    if (istrue(self.var_a09b2cb47a28054a)) {
        self.var_a09b2cb47a28054a = undefined;
    }
}

// Namespace namespace_80d9f81787d5f007/namespace_e8fceb5cf6e8cdf8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1436
// Size: 0x32d
function function_1e04f8a9053512a4(player) {
    if (!array_contains_key(self.var_878914b0358bc7b5, player.guid)) {
        self.var_878914b0358bc7b5[player.guid] = player;
        namespace_d9c77dc2a6fe29c6::enableoobimmunity(player);
        if (!istrue(self.var_7c9d9334f407b6df) || self.var_75adb7f3cbe5d522 < 1) {
            return;
        }
        if (!isdefined(player.var_a09b2cb47a28054a)) {
            self.var_902a7ffcff8aa65[self.var_902a7ffcff8aa65.size] = player;
            player.var_a09b2cb47a28054a = 1;
            var_48f1dbf87dd99400 = self.var_75adb7f3cbe5d522 + level.var_251923794d7ecf20.var_52bacfc5ca39b6d3;
            if (isdefined(self.var_6881781e87586753) && isdefined(level.var_251923794d7ecf20.var_52bacfc5ca39b6d3) && self.var_6881781e87586753 < level.var_251923794d7ecf20.var_52bacfc5ca39b6d3) {
                var_48f1dbf87dd99400 = self.var_6881781e87586753;
            }
            if (namespace_3c37cb17ade254d::issharedfuncdefined("chopper_exfil", "player_exfil_timer")) {
                player thread [[ namespace_3c37cb17ade254d::getsharedfunc("chopper_exfil", "player_exfil_timer") ]](self, var_48f1dbf87dd99400, 2000);
            }
        }
        namespace_27c74152ccb91331::function_55b08d6d71b41402(player, "enter_exfil_heli");
    }
    var_3995ec6a46bd14df = 0;
    if (isdefined(self.var_1e897ae1c018b2c2) && player.team == self.var_1e897ae1c018b2c2) {
        if (isdefined(self.var_6881781e87586753) && isdefined(level.var_251923794d7ecf20.var_52bacfc5ca39b6d3) && self.var_6881781e87586753 < level.var_251923794d7ecf20.var_52bacfc5ca39b6d3) {
            return;
        }
        players = getteamdata(self.var_1e897ae1c018b2c2, "players");
        foreach (teammember in players) {
            if (isreallyalive(teammember) && !isdefined(self.var_878914b0358bc7b5[teammember.guid]) && !istrue(teammember.extracted)) {
                return;
            }
        }
        foreach (player in self.var_902a7ffcff8aa65) {
            if (istrue(player.var_a09b2cb47a28054a)) {
                if (namespace_3c37cb17ade254d::issharedfuncdefined("chopper_exfil", "player_exfil_timer")) {
                    player thread [[ namespace_3c37cb17ade254d::getsharedfunc("chopper_exfil", "player_exfil_timer") ]](self, level.var_251923794d7ecf20.var_52bacfc5ca39b6d3, 2000);
                }
            }
        }
    } else {
        return;
    }
    if (namespace_3c37cb17ade254d::issharedfuncdefined("chopper_exfil", "dialog_shortcut")) {
        player thread [[ namespace_3c37cb17ade254d::getsharedfunc("chopper_exfil", "dialog_shortcut") ]]();
    }
    self notify("chopper_exfil_team_ready");
}

// Namespace namespace_80d9f81787d5f007/namespace_e8fceb5cf6e8cdf8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x176a
// Size: 0x65
function function_6519494290b58824(player) {
    self.var_878914b0358bc7b5[player.guid] = undefined;
    player notify("exited_chopper");
    player.var_8a38603863a78b8e = undefined;
    if (isdefined(player) && isint(player.oobimmunity) && !istrue(player.extracted)) {
        namespace_d9c77dc2a6fe29c6::disableoobimmunity(player);
    }
}

// Namespace namespace_80d9f81787d5f007/namespace_e8fceb5cf6e8cdf8
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17d6
// Size: 0xfc
function function_a5fc6e8f9df1ccea(heli, endpoint, ent) {
    heli endon("death");
    if (isdefined(ent)) {
        ent endon("disable");
    }
    while (distance(heli.origin, endpoint) > 2500) {
        wait(0.1);
    }
    heli setscriptablepartstate("dmz_exfil_dust_sounds", "landing");
    while (distance(heli.origin, endpoint) > 1500) {
        wait(0.1);
    }
    if (isdefined(ent)) {
        ent setscriptablepartstate("dmz_exfil_smoke", "dissipate");
    }
    heli function_247ad6a91f6a4ffe(0);
    while (distance(heli.origin, endpoint) > 800) {
        wait(0.1);
    }
    heli setscriptablepartstate("dmz_exfil_turbine_sounds", "landing");
    while (distance(heli.origin, endpoint) < 1500) {
        wait(0.1);
    }
    heli function_247ad6a91f6a4ffe(1);
}

// Namespace namespace_80d9f81787d5f007/namespace_e8fceb5cf6e8cdf8
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18d9
// Size: 0x5b
function function_72d275d574bd23dd(heli, endpoint) {
    heli endon("death");
    while (distance2d(heli.origin, endpoint) > 500) {
        wait(0.1);
    }
    if (isdefined(self)) {
        namespace_ede58c1e66c2c280::function_ffd6eed18c767472(self, heli, 6, 21, (0, 0, 72));
    }
}

// Namespace namespace_80d9f81787d5f007/namespace_e8fceb5cf6e8cdf8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x193b
// Size: 0x1e7
function function_55d37b18154a058e(waittime) {
    self endon("chopper_exfil_team_ready");
    self.var_7c9d9334f407b6df = 1;
    var_940a3890ac273220 = int(waittime);
    players = level.players;
    if (isdefined(self.var_1e897ae1c018b2c2)) {
        players = getteamdata(self.var_1e897ae1c018b2c2, "players");
    }
    if (self.var_878914b0358bc7b5.size > 0) {
        players = array_combine(players, self.var_878914b0358bc7b5);
    }
    foreach (member in players) {
        if (!isdefined(member.var_a09b2cb47a28054a) && isreallyalive(member)) {
            self.var_902a7ffcff8aa65[self.var_902a7ffcff8aa65.size] = member;
            member.var_a09b2cb47a28054a = 1;
            if (namespace_3c37cb17ade254d::issharedfuncdefined("chopper_exfil", "player_exfil_timer")) {
                member thread [[ namespace_3c37cb17ade254d::getsharedfunc("chopper_exfil", "player_exfil_timer") ]](self, var_940a3890ac273220 + level.var_251923794d7ecf20.var_52bacfc5ca39b6d3, undefined);
            }
        }
    }
    self.var_75adb7f3cbe5d522 = var_940a3890ac273220;
    self.var_6881781e87586753 = level.var_251923794d7ecf20.var_52bacfc5ca39b6d3;
    while (self.var_75adb7f3cbe5d522 > 0) {
        self.var_75adb7f3cbe5d522--;
        if (!isdefined(self.var_1e897ae1c018b2c2) && self.var_75adb7f3cbe5d522 == 60 - level.var_251923794d7ecf20.var_52bacfc5ca39b6d3) {
            if (namespace_3c37cb17ade254d::issharedfuncdefined("chopper_exfil", "dialog_final_warning")) {
                [[ namespace_3c37cb17ade254d::getsharedfunc("chopper_exfil", "dialog_final_warning") ]](players);
            }
        }
        wait(1);
    }
}

// Namespace namespace_80d9f81787d5f007/namespace_e8fceb5cf6e8cdf8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b29
// Size: 0x6c
function function_18d68b06fa34264b(heli) {
    heli setscriptablepartstate("dmz_exfil_dust_sounds", "landing");
    if (!isdefined(heli.var_6881781e87586753)) {
        heli.var_6881781e87586753 = level.var_251923794d7ecf20.var_52bacfc5ca39b6d3;
    }
    heli function_2b68fd672b6b021();
    heli function_c05648d95863318a();
    heli setscriptablepartstate("dmz_exfil_dust_sounds", "liftoff");
}

// Namespace namespace_80d9f81787d5f007/namespace_e8fceb5cf6e8cdf8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b9c
// Size: 0x24
function function_2b68fd672b6b021() {
    wait(self.var_6881781e87586753 * 0.75);
    self setscriptablepartstate("dmz_exfil_turbine_sounds", "liftoff");
}

// Namespace namespace_80d9f81787d5f007/namespace_e8fceb5cf6e8cdf8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bc7
// Size: 0x21
function function_c05648d95863318a() {
    while (self.var_6881781e87586753 > 0) {
        self.var_6881781e87586753--;
        wait(1);
    }
}

// Namespace namespace_80d9f81787d5f007/namespace_e8fceb5cf6e8cdf8
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1bef
// Size: 0xc2
function function_ed686fcbc5363b3() {
    if (isdefined(self.var_b23e608ef55db7fa)) {
        foreach (pilot in self.var_b23e608ef55db7fa) {
            foreach (ent in pilot.linkedents) {
                ent delete();
            }
            pilot delete();
        }
    }
    namespace_1f188a13f7e79610::vehicle_death(self);
}

// Namespace namespace_80d9f81787d5f007/namespace_e8fceb5cf6e8cdf8
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cb8
// Size: 0x843
function function_d1478474b036b87f(ent, part, state, player, waittime, var_4fffc035c8679b98, var_27144879b0c7beed, var_14cde247ac3313a4) {
    if (!isdefined(var_4fffc035c8679b98)) {
        var_4fffc035c8679b98 = 1;
    }
    if (!isdefined(ent) || istrue(ent.disabled)) {
        return;
    }
    if (isdefined(ent.heli)) {
        if (namespace_3c37cb17ade254d::issharedfuncdefined("chopper_exfil", "airspace_too_crowded")) {
            [[ namespace_3c37cb17ade254d::getsharedfunc("chopper_exfil", "airspace_too_crowded") ]](player);
            return;
        }
    }
    var_bedb769cc0e5e018 = 0;
    var_1230ea36a300368 = getgroundposition(ent.origin, 1) + (0, 0, 2);
    ent.inuse = 1;
    players = level.players;
    team = undefined;
    if (!istrue(var_27144879b0c7beed)) {
        team = player.team;
        players = getteamdata(player.team, "players");
        exfilstruct = function_730c660d9fc6808e(players, var_27144879b0c7beed, 0, istrue(ent.info.personal), 0);
        ent namespace_3c37cb17ade254d::function_f3bb4f4911a1beb2("pmc_missions", "onSignalExfil", player);
    }
    namespace_446fc987a980892f::function_d87d5deb069bf8e5("match_exfil_inbound", players);
    if (namespace_3c37cb17ade254d::issharedfuncdefined("chopper_exfil", "initial_splash")) {
        [[ namespace_3c37cb17ade254d::getsharedfunc("chopper_exfil", "initial_splash") ]](players, ent.info.poi, istrue(var_27144879b0c7beed));
    }
    namespace_1eb3c4e0e28fac71::utilflare_shootflare(ent.origin, "dmz_exfil");
    wait(3.75);
    if (namespace_3c37cb17ade254d::issharedfuncdefined("chopper_exfil", "music_start")) {
        [[ namespace_3c37cb17ade254d::getsharedfunc("chopper_exfil", "music_start") ]](players, var_27144879b0c7beed);
    }
    wait(1.25);
    var_2c728460e4c9349d = level.var_251923794d7ecf20.var_92fea9c582fd2caa;
    if (isdefined(player) && !istrue(var_27144879b0c7beed)) {
        var_5332cda4054641da = function_53c4c53197386572(namespace_3c37cb17ade254d::function_f3bb4f4911a1beb2("instanceInventory", "getUpgradeCount", player, 27), 0);
        var_2c728460e4c9349d = var_2c728460e4c9349d - var_5332cda4054641da * getdvarfloat(@"hash_32085370522fbf3f", 30);
        var_2c728460e4c9349d = max(0, var_2c728460e4c9349d);
    }
    if (!isdefined(var_2c728460e4c9349d)) {
        var_2c728460e4c9349d = 60;
    }
    if (namespace_cd0b2d039510b38d::getsubgametype() == "dmz" && isdefined(level.var_6fc3398b5a13400) && istrue(var_27144879b0c7beed)) {
        remainingtime = (level.var_6fc3398b5a13400 - gettime()) / 1000;
        if (remainingtime > var_2c728460e4c9349d * 2) {
            thread namespace_3c37cb17ade254d::function_f3bb4f4911a1beb2("chopper_exfil", "dialog_start_exfil", players, team, var_27144879b0c7beed, ent, var_2c728460e4c9349d);
            wait(var_2c728460e4c9349d);
        }
    } else {
        if (namespace_3c37cb17ade254d::issharedfuncdefined("chopper_exfil", "dialog_start_exfil")) {
            thread [[ namespace_3c37cb17ade254d::getsharedfunc("chopper_exfil", "dialog_start_exfil") ]](players, team, var_27144879b0c7beed, ent, var_2c728460e4c9349d);
        }
        wait(var_2c728460e4c9349d);
    }
    path = function_ed11ae9fe1abdeb(ent, var_1230ea36a300368);
    if (!isdefined(path)) {
        return;
    }
    var_a3010f9814a40c8d = player;
    for (i = 0; i < players.size && !isdefined(var_a3010f9814a40c8d); i++) {
        var_a3010f9814a40c8d = players[i];
    }
    if (!isdefined(var_a3010f9814a40c8d)) {
        return;
    }
    heli = function_d05f47d864f18196(var_a3010f9814a40c8d, path.origin, ent.angles, var_4fffc035c8679b98, var_27144879b0c7beed, var_14cde247ac3313a4);
    heli.var_27144879b0c7beed = var_27144879b0c7beed;
    thread function_a5fc6e8f9df1ccea(heli, var_1230ea36a300368, ent);
    ent thread function_72d275d574bd23dd(heli, var_1230ea36a300368);
    heli namespace_3bb9da687f15383d::vehicle_paths_helicopter(path);
    if (!istrue(ent.info.land)) {
        heli sethoverparams(isdefined(level.var_251923794d7ecf20.var_52c02cddbd6c79d7) ? 2 : level.var_251923794d7ecf20.var_52c02cddbd6c79d7, 1, 1);
    }
    if (namespace_3c37cb17ade254d::issharedfuncdefined("chopper_exfil", "dialog_handle_touchdown")) {
        thread [[ namespace_3c37cb17ade254d::getsharedfunc("chopper_exfil", "dialog_handle_touchdown") ]](players, heli);
    }
    if (!istrue(var_4fffc035c8679b98) && isdefined(level.var_251923794d7ecf20.var_1a7e969d835799f2)) {
        waittime = (level.var_251923794d7ecf20.var_1a7e969d835799f2 - gettime()) / 1000 - level.var_251923794d7ecf20.var_6881781e87586753 - level.var_251923794d7ecf20.var_abe738473a42706b;
    }
    if (namespace_cd0b2d039510b38d::getsubgametype() == "dmz" && isdefined(level.var_6fc3398b5a13400) && istrue(var_27144879b0c7beed)) {
        remainingtime = (level.var_6fc3398b5a13400 - gettime()) / 1000;
        waittime = remainingtime - level.var_251923794d7ecf20.var_52bacfc5ca39b6d3 - 1;
        var_eea954761967701f = round(remainingtime % 1, level.framedurationseconds);
        if (var_eea954761967701f >= level.framedurationseconds) {
            waittime = waittime - var_eea954761967701f;
            wait(var_eea954761967701f);
        }
    }
    heli function_55d37b18154a058e(ter_op(isdefined(waittime), waittime, level.var_251923794d7ecf20.var_7379eae6423b305d));
    function_18d68b06fa34264b(heli);
    if (namespace_3c37cb17ade254d::issharedfuncdefined("chopper_exfil", "music_stop")) {
        thread [[ namespace_3c37cb17ade254d::getsharedfunc("chopper_exfil", "music_stop") ]](heli.var_878914b0358bc7b5, var_27144879b0c7beed);
    }
    if (namespace_3c37cb17ade254d::issharedfuncdefined("chopper_exfil", "dialog_final_leaving")) {
        thread [[ namespace_3c37cb17ade254d::getsharedfunc("chopper_exfil", "dialog_final_leaving") ]](players, var_27144879b0c7beed);
    }
    heli.var_94cf3a68b99ae841 = 1;
    heli notify("exfil_path_started");
    if (istrue(level.var_251923794d7ecf20.var_1869ac124be0cc0b)) {
        heli namespace_7ae25d9e5d5a28ef::function_fc805ec1e7b08264(heli.currentnode);
    } else {
        path = function_1093b8f392744e3b(ent, var_1230ea36a300368, level.var_251923794d7ecf20.heliheight, !istrue(var_4fffc035c8679b98));
        heli thread namespace_3bb9da687f15383d::vehicle_paths_helicopter(path);
        wait(10);
    }
    namespace_ede58c1e66c2c280::function_c068efdf0abd5258(ent);
    wait(1.5);
    if (namespace_3c37cb17ade254d::issharedfuncdefined("chopper_exfil", "music_exfil_end")) {
        thread [[ namespace_3c37cb17ade254d::getsharedfunc("chopper_exfil", "music_exfil_end") ]](heli.var_878914b0358bc7b5);
    }
    wait(6.5);
    heli.var_9ab1b62a59f15de7 = [];
    foreach (player in heli.var_878914b0358bc7b5) {
        if (!isdefined(player)) {
            continue;
        }
        if (namespace_36f464722d326bbe::isBRStyleGameType()) {
            player namespace_d3d40f75bb4e4c32::function_c2afa687bc871d71(1);
        }
        heli.var_9ab1b62a59f15de7[heli.var_9ab1b62a59f15de7.size] = player;
        var_bedb769cc0e5e018 = 1;
    }
    info = namespace_e8fceb5cf6e8cdf8::function_730c660d9fc6808e(heli.var_9ab1b62a59f15de7, var_27144879b0c7beed, 0, istrue(ent.info.personal), 0);
    info.var_394aebba88e4e8c2 = ent.var_394aebba88e4e8c2;
    namespace_3c37cb17ade254d::function_f3bb4f4911a1beb2("chopper_exfil", "exfil_players", heli.var_9ab1b62a59f15de7, info);
    if (namespace_3c37cb17ade254d::issharedfuncdefined("chopper_exfil", "music_reset")) {
        [[ namespace_3c37cb17ade254d::getsharedfunc("chopper_exfil", "music_reset") ]](players);
    }
    wait(15);
    heli function_ed686fcbc5363b3();
    if (namespace_3c37cb17ade254d::issharedfuncdefined("chopper_exfil", "remove_exfil")) {
        ent thread [[ namespace_3c37cb17ade254d::getsharedfunc("chopper_exfil", "remove_exfil") ]](ent, var_bedb769cc0e5e018);
    }
    if (isdefined(ent) && !istrue(ent.disabled) && isdefined(team)) {
        ent.inuse = 0;
        if (namespace_3c37cb17ade254d::issharedfuncdefined("chopper_exfil", "reset_exfil")) {
            ent thread [[ namespace_3c37cb17ade254d::getsharedfunc("chopper_exfil", "reset_exfil") ]](team);
        }
    }
}

// Namespace namespace_80d9f81787d5f007/namespace_e8fceb5cf6e8cdf8
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2502
// Size: 0x7e
function function_730c660d9fc6808e(players, var_27144879b0c7beed, var_6086028a8dfde29e, var_5fda164731e59c13, var_21584999ab948530) {
    info = spawnstruct();
    info.players = players;
    info.var_27144879b0c7beed = var_27144879b0c7beed;
    info.var_6086028a8dfde29e = var_6086028a8dfde29e;
    info.var_5fda164731e59c13 = var_5fda164731e59c13;
    info.var_21584999ab948530 = var_21584999ab948530;
    return info;
}

// Namespace namespace_80d9f81787d5f007/namespace_e8fceb5cf6e8cdf8
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2588
// Size: 0x34
function entisalivevehicle() {
    return isalive(self) && (namespace_dbbb37eb352edf96::isvehicle() || isdefined(self.classname) && self.classname == "script_vehicle");
}

// Namespace namespace_80d9f81787d5f007/namespace_e8fceb5cf6e8cdf8
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x25c4
// Size: 0x6d
function private function_ad65ea51ce655f42(vehicle, ent, position, normal, normalspeed) {
    if (self vehicle_getspeed() == 0) {
        return;
    }
    if (istrue(vehicle.var_496a5e00d32af675)) {
        return;
    }
    vehicle.var_496a5e00d32af675 = 1;
    vehicle.var_a8f4bb03b366aa80 = 1;
    vehicle thread namespace_1f188a13f7e79610::vehicle_explode();
}

