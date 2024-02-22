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
#using scripts\cp_mp\vehicles\vehicle_tracking.gsc;
#using script_48814951e916af89;
#using script_371b4c2ab5861e62;
#using scripts\mp\sentientpoolmanager.gsc;
#using scripts\cp_mp\emp_debuff.gsc;
#using scripts\mp\killstreaks\remotetank.gsc;
#using script_4bac13d511590220;
#using scripts\cp_mp\killstreaks\sentry_gun.gsc;
#using scripts\mp\utility\player.gsc;
#using script_5323b44ee395058;

#namespace namespace_d952f9ac311401b4;

// Namespace namespace_d952f9ac311401b4/namespace_adc82618e9ef9897
// Params 7, eflags: 0x0
// Checksum 0x0, Offset: 0x3b8
// Size: 0x36c
function function_906e0becc84c065b(pos, var_e0c08758eb0006be, vehicle, model, patrolradius, name, var_26ebc4ab45d7e908) {
    spawndata = spawnstruct();
    spawndata.origin = pos;
    spawndata.angles = (0, 0, 0);
    spawndata.spawntype = "veh_pac_sentry_amphibious_mp_biolab";
    spawndata.owner = undefined;
    spawndata.team = "team_hundred_ninety_five";
    spawndata.modelname = "veh9_mil_lnd_whotel_v2_composite_mp";
    spawndata.vehicletype = "veh_pac_sentry_amphibious_mp_biolab";
    spawndata.targetname = "remote_tank";
    spawndata.cancapture = 0;
    spawndata.cancaptureimmediately = 0;
    spawndata.activateimmediately = 1;
    remotetank = namespace_f64231d5b7a2c3c4::_spawnvehicle(spawndata);
    if (isdefined(var_26ebc4ab45d7e908)) {
        remotetank.owner = var_26ebc4ab45d7e908;
        remotetank setentityowner(var_26ebc4ab45d7e908);
    } else {
        var_2884adc8d320f897 = namespace_bfef6903bca5845d::function_af3034a7c69d7edb(namespace_14d36171baccf528::function_30a0d7ca3fae40cc("merc"));
        remotetank.owner = var_2884adc8d320f897;
        remotetank namespace_6d9917c3dc05dbe9::registersentient("Killstreak_Ground", spawndata.team);
    }
    remotetank.team = "team_hundred_ninety_five";
    remotetank.tanktype = "remote_tank";
    remotetank.maxhealth = 6000;
    remotetank.health = 6000;
    remotetank.currenthealth = 6000;
    remotetank.pathstruct = var_e0c08758eb0006be;
    remotetank.var_e0c08758eb0006be = var_e0c08758eb0006be;
    remotetank.vehiclename = "pac_sentry";
    remotetank.spinuptime = 1;
    remotetank laseron();
    remotetank function_d2e41c7603ba7697("p2p");
    remotetank function_77320e794d35465a("p2p", "reverseGasNormal", 1.5);
    remotetank function_77320e794d35465a("p2p", "steeringMultiplier", 15);
    remotetank function_77320e794d35465a("p2p", "manualSpeed", 10);
    remotetank function_77320e794d35465a("p2p", "reverseForBehindGoal", 1);
    remotetank function_77320e794d35465a("p2p", "stuckTime", 4);
    remotetank function_77320e794d35465a("p2p", "goalThreshold", 10);
    remotetank namespace_5a51aa78ea0b1b9f::set_start_emp_callback(&empstarted);
    remotetank namespace_5a51aa78ea0b1b9f::set_clear_emp_callback(&empcleared);
    remotetank.var_8ffa366ec68f0c8b = 10000;
    remotetank namespace_6ca1587edcca0018::function_89445073f3e86e5c(remotetank.vehiclename);
    function_45c8ebe59275b96e(remotetank.vehiclename);
    playfxontag(getfx("vfx_dmz_Wheelson_flashlight"), remotetank, "tag_flash");
    remotetank.currentstate = "patrol";
    remotetank vehicleshowonminimap(0);
    remotetank.damagecallback = &function_96b758d589365ef6;
    remotetank thread function_a51eaffdb54130b2(var_e0c08758eb0006be);
    remotetank thread function_42bc36af24a342e();
    remotetank thread function_93dccf3096384da0();
    remotetank.damagestate = 0;
    remotetank.var_1329597b4278afe9 = [];
    namespace_f64231d5b7a2c3c4::vehicle_tracking_registerinstance(remotetank, remotetank.owner, remotetank.owner.team);
    return remotetank;
}

// Namespace namespace_d952f9ac311401b4/namespace_adc82618e9ef9897
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x72c
// Size: 0x1b5
function function_45c8ebe59275b96e(streakname) {
    weaponname = "thermite_bolt_mp";
    weaponhitsperattack = 1;
    var_8b4500d6a881b7b2 = 18;
    if (issharedfuncdefined("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon")) {
        [[ getsharedfunc("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon") ]](weaponname, weaponhitsperattack, var_8b4500d6a881b7b2, streakname);
    }
    weaponname = "thermite_xmike109_mp";
    weaponhitsperattack = 1;
    var_8b4500d6a881b7b2 = 25;
    if (issharedfuncdefined("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon")) {
        [[ getsharedfunc("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon") ]](weaponname, weaponhitsperattack, var_8b4500d6a881b7b2, streakname);
    }
    weaponname = "semtex_bolt_mp";
    weaponhitsperattack = 1;
    var_8b4500d6a881b7b2 = 7;
    if (issharedfuncdefined("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon")) {
        [[ getsharedfunc("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon") ]](weaponname, weaponhitsperattack, var_8b4500d6a881b7b2, streakname);
    }
    weaponname = "semtex_xmike109_mp";
    weaponhitsperattack = 1;
    var_8b4500d6a881b7b2 = 8;
    if (issharedfuncdefined("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon")) {
        [[ getsharedfunc("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon") ]](weaponname, weaponhitsperattack, var_8b4500d6a881b7b2, streakname);
    }
    weaponname = "c4_mp";
    weaponhitsperattack = 5;
    var_8b4500d6a881b7b2 = undefined;
    if (issharedfuncdefined("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon")) {
        [[ getsharedfunc("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon") ]](weaponname, weaponhitsperattack, var_8b4500d6a881b7b2, streakname);
    }
    weaponname = "at_mine_mp";
    weaponhitsperattack = 1;
    var_8b4500d6a881b7b2 = 4;
    if (issharedfuncdefined("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon")) {
        [[ getsharedfunc("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon") ]](weaponname, weaponhitsperattack, var_8b4500d6a881b7b2, streakname);
    }
    weaponname = "thermite_mp";
    weaponhitsperattack = 1;
    var_8b4500d6a881b7b2 = 50;
    if (issharedfuncdefined("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon")) {
        [[ getsharedfunc("vehicle_damage", "vehicle_setupHitDamageOverrideForWeapon") ]](weaponname, weaponhitsperattack, var_8b4500d6a881b7b2, streakname);
    }
}

// Namespace namespace_d952f9ac311401b4/namespace_adc82618e9ef9897
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8e8
// Size: 0x18d
function function_45d2e44c40437351(startnode, var_10592ac32d1e5a3d, var_cffdaa458d12ab7d) {
    pathstruct = spawnstruct();
    pathstruct.path = [0:startnode];
    pathstruct.var_7d8884f5400e2fca = [];
    pathstruct.speed = 10;
    pathstruct.direction = 1;
    pathstruct.index = 0;
    var_c80eaeac6487d3b9 = startnode;
    while (isdefined(var_c80eaeac6487d3b9.target)) {
        curindex = pathstruct.path.size - 1;
        pathstruct.var_7d8884f5400e2fca[curindex] = [];
        var_a942ae9112cd6bde = getstructarray(var_c80eaeac6487d3b9.target, "targetname");
        foreach (node in var_a942ae9112cd6bde) {
            if (node.script_noteworthy == var_10592ac32d1e5a3d) {
                var_c80eaeac6487d3b9 = node;
                pathstruct.path[pathstruct.path.size] = node;
            } else if (node.script_noteworthy == var_cffdaa458d12ab7d) {
                pathstruct.var_7d8884f5400e2fca[curindex][pathstruct.var_7d8884f5400e2fca[curindex].size] = function_49b628ec7b6247bd(node, var_cffdaa458d12ab7d);
            }
        }
    }
    return pathstruct;
}

// Namespace namespace_d952f9ac311401b4/namespace_adc82618e9ef9897
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa7d
// Size: 0xb2
function private function_49b628ec7b6247bd(startnode, nodenames) {
    pathstruct = spawnstruct();
    pathstruct.path = [0:startnode];
    pathstruct.speed = 10;
    pathstruct.direction = 1;
    pathstruct.index = 0;
    var_c80eaeac6487d3b9 = startnode;
    while (isdefined(var_c80eaeac6487d3b9.target)) {
        var_c80eaeac6487d3b9 = getstructarray(var_c80eaeac6487d3b9.target, "targetname")[0];
        pathstruct.path[pathstruct.path.size] = var_c80eaeac6487d3b9;
    }
    return pathstruct;
}

// Namespace namespace_d952f9ac311401b4/namespace_adc82618e9ef9897
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb37
// Size: 0x51
function function_a51eaffdb54130b2(pathstruct) {
    if (isdefined(pathstruct.path) && pathstruct.path.size > 0) {
        self.var_13ccb567671deb18 = undefined;
        thread namespace_9246f10206f50768::function_c3889abf5cd6abbf(pathstruct, pathstruct.speed, undefined, "soldier");
    }
}

// Namespace namespace_d952f9ac311401b4/namespace_adc82618e9ef9897
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb8f
// Size: 0x89
function function_b0bcd78019fa3f75() {
    if (isdefined(self.var_13ccb567671deb18)) {
        var_59f1425515d37e2a = function_bb51d7fa820f19ae(0, self.var_46496c542d347ba8, self.var_13ccb567671deb18);
        namespace_9246f10206f50768::function_aa85eb39828a4d80(var_59f1425515d37e2a, 10, 1, 0);
        self.var_f0f726adafb8c51a = undefined;
        self.var_13ccb567671deb18 = undefined;
        self.var_46496c542d347ba8 = undefined;
    }
    thread namespace_9246f10206f50768::function_c3889abf5cd6abbf(self.var_e0c08758eb0006be, self.var_e0c08758eb0006be.speed, undefined, "soldier");
}

// Namespace namespace_d952f9ac311401b4/namespace_adc82618e9ef9897
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc1f
// Size: 0x313
function function_42bc36af24a342e() {
    self endon("death");
    thread function_2325f7cc87d0684();
    childthread function_5fa5baec6e8f8d91();
    while (1) {
        while (istrue(self.emp) || istrue(self.var_12bfb031c0a0efd8)) {
            wait(0.2);
        }
        closesttarget = undefined;
        closestdistsq = undefined;
        var_7408ed52662703d3 = utility::playersinsphere(self.origin, 2048);
        foreach (target in var_7408ed52662703d3) {
            if (!function_79e58f587efe9e1f(target)) {
                continue;
            }
            totarget = target.origin - self.origin;
            var_922c3bf422e322f5 = vectordot(anglestoforward(self gettagangles("tag_flash")), totarget);
            if (var_922c3bf422e322f5 < 90) {
                continue;
            }
            distsq = distancesquared(target.origin, self.origin);
            if (!isdefined(closesttarget) || distsq < closestdistsq) {
                closesttarget = target;
                closestdistsq = distsq;
            }
        }
        if (isdefined(self.var_8e7d46146a9cf2eb)) {
            closesttarget = self.var_8e7d46146a9cf2eb;
        }
        if (isdefined(closesttarget)) {
            function_a3955f7116f3753();
            function_f3c822808e8cc579(closesttarget);
            thread function_2325f7cc87d0684();
            self.var_8e7d46146a9cf2eb = undefined;
        } else {
            var_d379fc1174b381dd = getaiarrayinradius(self.origin, 500);
            validtargets = [];
            foreach (agent in var_d379fc1174b381dd) {
                if (isenemyteam(self.team, agent.team) && function_79e58f587efe9e1f(agent)) {
                    validtargets[validtargets.size] = agent;
                }
            }
            closesttarget = undefined;
            closestdistsq = undefined;
            foreach (agent in validtargets) {
                totarget = agent.origin - self.origin;
                var_922c3bf422e322f5 = vectordot(anglestoforward(self gettagangles("tag_flash")), totarget);
                if (var_922c3bf422e322f5 < 90) {
                    continue;
                }
                distsq = distancesquared(agent.origin, self.origin);
                if (!isdefined(closesttarget) || distsq < closestdistsq) {
                    closesttarget = agent;
                    closestdistsq = distsq;
                }
                if (isdefined(closesttarget)) {
                    function_a3955f7116f3753();
                    function_f3c822808e8cc579(closesttarget);
                    thread function_2325f7cc87d0684();
                    self.var_c6dfdd9743149226 = undefined;
                }
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_d952f9ac311401b4/namespace_adc82618e9ef9897
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf39
// Size: 0x186
function function_5fa5baec6e8f8d91() {
    while (1) {
        while (istrue(self.emp) || istrue(self.var_12bfb031c0a0efd8)) {
            wait(0.2);
        }
        if (isdefined(self.var_c6dfdd9743149226) && isagent(self.var_c6dfdd9743149226)) {
            closesttarget = undefined;
            closestdistsq = undefined;
            var_7408ed52662703d3 = utility::playersinsphere(self.origin, 2048);
            foreach (target in var_7408ed52662703d3) {
                if (!function_79e58f587efe9e1f(target)) {
                    continue;
                }
                totarget = target.origin - self.origin;
                var_922c3bf422e322f5 = vectordot(anglestoforward(self gettagangles("tag_flash")), totarget);
                if (var_922c3bf422e322f5 < 90) {
                    continue;
                }
                distsq = distancesquared(target.origin, self.origin);
                if (!isdefined(closesttarget) || distsq < closestdistsq) {
                    closesttarget = target;
                    closestdistsq = distsq;
                }
            }
            if (isdefined(self.var_8e7d46146a9cf2eb)) {
                closesttarget = self.var_8e7d46146a9cf2eb;
            }
            if (isdefined(closesttarget)) {
                self notify("target_lost");
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_d952f9ac311401b4/namespace_adc82618e9ef9897
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10c6
// Size: 0x136
function function_2325f7cc87d0684() {
    self endon("death");
    self endon("dmz_ai_vehicle_enterCombatState");
    self.currentstate = "patrol";
    var_fbdad214ee6c3307 = 0;
    direction = 1;
    while (1) {
        if (istrue(self.emp)) {
            var_db78384599e4b42 = anglestoforward(self gettagangles("tag_flash"));
            self setturrettargetvec(var_db78384599e4b42 * 500 + (0, -800, 0));
        }
        while (istrue(self.emp) || istrue(self.var_12bfb031c0a0efd8)) {
            wait(0.2);
        }
        var_fbdad214ee6c3307 = var_fbdad214ee6c3307 + 90 * direction;
        if (var_fbdad214ee6c3307 >= 360 || var_fbdad214ee6c3307 <= 0) {
            direction = direction * -1;
        }
        targetangles = (0, var_fbdad214ee6c3307, 0);
        var_c0686995758526de = anglestoforward(targetangles);
        start = self.origin + (0, 0, 16);
        end = start + 6000 * var_c0686995758526de;
        self setturrettargetvec(end);
        waittill_any_timeout_1(2, "turret_on_target");
    }
}

// Namespace namespace_d952f9ac311401b4/namespace_adc82618e9ef9897
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1203
// Size: 0x25
function function_a3955f7116f3753() {
    self.var_3258be7f1d1b7c7a = self.origin;
    self notify("newFollowPath");
    self notify("dmz_ai_vehicle_enterCombatState");
}

// Namespace namespace_d952f9ac311401b4/namespace_adc82618e9ef9897
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x122f
// Size: 0x1c6
function function_f3c822808e8cc579(target) {
    self endon("death");
    self endon("enter_patrol");
    self endon("target_lost");
    self.var_c6dfdd9743149226 = target;
    childthread function_66ef3bd97ce18687();
    var_a84cfd847dc1f677 = level.tanksettings[self.tanktype];
    while (1) {
        if (!isalive(target)) {
            break;
        }
        var_5768d16c6697b59e = undefined;
        if (istrue(target.hasriotshieldequipped)) {
            var_5768d16c6697b59e = target;
        }
        if (!function_79e58f587efe9e1f(target) || istrue(target.hasriotshieldequipped) || isdefined(self.var_8e7d46146a9cf2eb) && self.var_8e7d46146a9cf2eb != target) {
            if (isdefined(self.var_8e7d46146a9cf2eb) && self.var_8e7d46146a9cf2eb != target) {
                target = self.var_8e7d46146a9cf2eb;
            } else {
                var_7408ed52662703d3 = utility::playersinsphere(self.origin, 2048);
                var_7408ed52662703d3 = sortbydistance(var_7408ed52662703d3, self.origin);
                foreach (var_331304db73694587 in var_7408ed52662703d3) {
                    if (!function_79e58f587efe9e1f(var_331304db73694587)) {
                        continue;
                    }
                    if (istrue(var_331304db73694587.hasriotshieldequipped) && !isdefined(var_5768d16c6697b59e)) {
                        var_5768d16c6697b59e = var_331304db73694587;
                    } else {
                        target = var_331304db73694587;
                        break;
                    }
                }
            }
            if (!function_79e58f587efe9e1f(target) && isdefined(var_5768d16c6697b59e)) {
                target = var_5768d16c6697b59e;
            }
        }
        self.currentstate = "attack";
        function_1457a29ddb8b55dc(target, var_a84cfd847dc1f677);
        function_55f73871378d7cea();
        wait(0.2);
    }
}

// Namespace namespace_d952f9ac311401b4/namespace_adc82618e9ef9897
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13fc
// Size: 0x5b
function function_6a5482361557e17b(var_a84cfd847dc1f677) {
    self endon("death");
    spinuptime = self.spinuptime;
    thread namespace_c5e4bf96a5150e88::sentry_targetlocksound();
    self function_ee85446afc7cb0a8(1);
    self.var_4863a1b39f3e20f5 = 1;
    while (spinuptime > 0) {
        spinuptime = spinuptime - 0.05;
        wait(0.05);
    }
}

// Namespace namespace_d952f9ac311401b4/namespace_adc82618e9ef9897
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x145e
// Size: 0x4e
function function_55f73871378d7cea() {
    if (istrue(self.var_4863a1b39f3e20f5)) {
        spinuptime = self.spinuptime;
        self function_ee85446afc7cb0a8(0);
        self.var_4863a1b39f3e20f5 = undefined;
        while (spinuptime > 0) {
            spinuptime = spinuptime - 0.05;
            wait(0.05);
        }
    }
}

// Namespace namespace_d952f9ac311401b4/namespace_adc82618e9ef9897
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x14b3
// Size: 0xb5
function function_66ef3bd97ce18687() {
    var_bcf69f5a7053fab1 = 0;
    maxfails = 4;
    if (isdefined(self.var_d04bb72230a5a308)) {
        maxfails = self.var_d04bb72230a5a308;
    }
    while (1) {
        if (!function_8e9091d778558441(self.var_c6dfdd9743149226)) {
            thread function_b0bcd78019fa3f75();
            self notify("target_lost");
            waitframe();
        }
        if (function_c17cf83f13647859(self.var_c6dfdd9743149226)) {
            var_bcf69f5a7053fab1 = 0;
            wait(0.5);
        } else if (function_a1618f0c0bc81103(self.var_c6dfdd9743149226)) {
            var_bcf69f5a7053fab1 = 0;
            waitframe();
        } else {
            var_bcf69f5a7053fab1 = var_bcf69f5a7053fab1 + 1;
            if (var_bcf69f5a7053fab1 > maxfails) {
                thread function_b0bcd78019fa3f75();
                self notify("target_lost");
            }
            wait(1);
        }
    }
}

// Namespace namespace_d952f9ac311401b4/namespace_adc82618e9ef9897
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x156f
// Size: 0xc2
function private function_8e9091d778558441(target) {
    if (!isdefined(target)) {
        return 0;
    }
    if (isplayer(target)) {
        if (isdefined(self.var_1329597b4278afe9) && array_contains(self.var_1329597b4278afe9, target.team)) {
            return 0;
        }
        if (!target namespace_f8065cafc523dba5::_isalive() || target.sessionstate != "playing") {
            return 0;
        }
        if (namespace_7e17181d03156026::isinlaststand(target)) {
            return 0;
        }
        if (istrue(target.notarget)) {
            return 0;
        }
        if (target == self.owner) {
            return 0;
        }
    } else if (isagent(target)) {
        if (!isalive(target)) {
            return 0;
        }
        if (istrue(target.ignoreme)) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_d952f9ac311401b4/namespace_adc82618e9ef9897
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1639
// Size: 0x4e
function private function_c17cf83f13647859(target) {
    if (!isdefined(target)) {
        return 0;
    }
    if (isplayer(target)) {
        return self vehicle_canturrettargetpoint(target gettagorigin("j_mainroot"), 1, self);
    } else if (isagent(target)) {
        return self vehicle_canturrettargetpoint(target getcentroid(), 1, self);
    }
    return 0;
}

// Namespace namespace_d952f9ac311401b4/namespace_adc82618e9ef9897
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x168f
// Size: 0x1f
function function_79e58f587efe9e1f(target) {
    if (!function_8e9091d778558441(target)) {
        return 0;
    }
    return function_c17cf83f13647859(target);
}

// Namespace namespace_d952f9ac311401b4/namespace_adc82618e9ef9897
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16b6
// Size: 0x3c
function function_a7f393dd1e9a679b(target) {
    if (!isdefined(target)) {
        return undefined;
    }
    if (isplayer(target)) {
        return target gettagorigin("j_mainroot");
    } else if (isagent(target)) {
        return target getcentroid();
    }
    return undefined;
}

// Namespace namespace_d952f9ac311401b4/namespace_adc82618e9ef9897
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16fa
// Size: 0x555
function function_a1618f0c0bc81103(target) {
    newpath = undefined;
    var_c80eaeac6487d3b9 = self.var_e0c08758eb0006be.path[self.var_e0c08758eb0006be.index];
    for (i = 0; i < 4; i++) {
        var_973024ee97de3062 = self.var_e0c08758eb0006be.index + i;
        var_973024ee97de3062 = ter_op(var_973024ee97de3062 >= self.var_e0c08758eb0006be.path.size, var_973024ee97de3062 - self.var_e0c08758eb0006be.path.size, var_973024ee97de3062);
        if (function_3e8010501de305fa(self.var_e0c08758eb0006be.path[var_973024ee97de3062], target)) {
            newpath = function_b4908dc2cbec66a6(var_973024ee97de3062, 1);
            self.var_f0f726adafb8c51a = undefined;
            self.var_13ccb567671deb18 = undefined;
            self.var_46496c542d347ba8 = undefined;
            self.var_e0c08758eb0006be.index = var_973024ee97de3062;
            /#
                function_d0cd695cd85915ad(newpath.path);
            #/
            namespace_9246f10206f50768::function_aa85eb39828a4d80(newpath.path, newpath.speed, 1, 0);
            return 1;
        }
        if (isdefined(self.var_e0c08758eb0006be.var_7d8884f5400e2fca[var_973024ee97de3062]) && self.var_e0c08758eb0006be.var_7d8884f5400e2fca[var_973024ee97de3062].size > 0) {
            foreach (parentindex, parentnode in self.var_e0c08758eb0006be.var_7d8884f5400e2fca[var_973024ee97de3062]) {
                foreach (index, node in parentnode.path) {
                    if (function_3e8010501de305fa(node, target)) {
                        if (i != 0) {
                            newpath = function_b4908dc2cbec66a6(var_973024ee97de3062, 1, index, parentindex);
                            self.var_f0f726adafb8c51a = index;
                            self.var_13ccb567671deb18 = parentindex;
                            self.var_46496c542d347ba8 = var_973024ee97de3062;
                            self.var_e0c08758eb0006be.index = var_973024ee97de3062;
                            /#
                                function_d0cd695cd85915ad(newpath.path);
                            #/
                            namespace_9246f10206f50768::function_aa85eb39828a4d80(newpath.path, newpath.speed, 1, 0);
                        } else {
                            var_59f1425515d37e2a = function_bb51d7fa820f19ae(index, var_973024ee97de3062, parentindex);
                            self.var_f0f726adafb8c51a = index;
                            self.var_13ccb567671deb18 = parentindex;
                            self.var_46496c542d347ba8 = var_973024ee97de3062;
                            self.var_e0c08758eb0006be.index = var_973024ee97de3062;
                            /#
                                function_d0cd695cd85915ad(var_59f1425515d37e2a);
                            #/
                            namespace_9246f10206f50768::function_aa85eb39828a4d80(var_59f1425515d37e2a, 10, 1, 0);
                        }
                        return 1;
                    }
                }
            }
        }
        if (i == 0) {
            continue;
        }
        var_710537d2607c471f = self.var_e0c08758eb0006be.index - i;
        var_710537d2607c471f = ter_op(var_710537d2607c471f < 0, var_710537d2607c471f + self.var_e0c08758eb0006be.path.size, var_710537d2607c471f);
        if (function_3e8010501de305fa(self.var_e0c08758eb0006be.path[var_710537d2607c471f], target)) {
            newpath = function_b4908dc2cbec66a6(var_710537d2607c471f, 0);
            self.var_f0f726adafb8c51a = undefined;
            self.var_13ccb567671deb18 = undefined;
            self.var_46496c542d347ba8 = undefined;
            self.var_e0c08758eb0006be.index = var_710537d2607c471f;
            /#
                function_d0cd695cd85915ad(newpath.path);
            #/
            namespace_9246f10206f50768::function_aa85eb39828a4d80(newpath.path, newpath.speed, 1, 0);
            return 1;
        }
        if (isdefined(self.var_e0c08758eb0006be.var_7d8884f5400e2fca[var_710537d2607c471f]) && self.var_e0c08758eb0006be.var_7d8884f5400e2fca[var_710537d2607c471f].size > 0) {
            foreach (parentindex, parentnode in self.var_e0c08758eb0006be.var_7d8884f5400e2fca[var_710537d2607c471f]) {
                foreach (index, node in parentnode.path) {
                    if (function_3e8010501de305fa(node, target)) {
                        newpath = function_b4908dc2cbec66a6(var_710537d2607c471f, 1, index, parentindex);
                        self.var_f0f726adafb8c51a = index;
                        self.var_13ccb567671deb18 = parentindex;
                        self.var_46496c542d347ba8 = var_710537d2607c471f;
                        self.var_e0c08758eb0006be.index = var_710537d2607c471f;
                        /#
                            function_d0cd695cd85915ad(newpath.path);
                        #/
                        namespace_9246f10206f50768::function_aa85eb39828a4d80(newpath.path, newpath.speed, 1, 0);
                        return 1;
                    }
                }
            }
        }
    }
    return 0;
}

// Namespace namespace_d952f9ac311401b4/namespace_adc82618e9ef9897
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1c57
// Size: 0x76
function function_d0cd695cd85915ad(newpath) {
    for (i = 0; i <= newpath.size - 1; i++) {
        if (i == newpath.size - 1) {
            draw_arrow_time(self.origin, newpath[i], (255, 0, 0), 10);
        } else {
            draw_arrow_time(newpath[i], newpath[i + 1], (255, 0, 0), 10);
        }
    }
}

// Namespace namespace_d952f9ac311401b4/namespace_adc82618e9ef9897
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1cd4
// Size: 0x195
function function_b4908dc2cbec66a6(index, forward, var_4a72697044d23367, var_ad1e1e856375b447) {
    pathstruct = spawnstruct();
    pathstruct.path = function_bb51d7fa820f19ae(0, self.var_46496c542d347ba8, self.var_13ccb567671deb18);
    pathstruct.speed = 10;
    pathstruct.index = 0;
    curindex = self.var_e0c08758eb0006be.index;
    if (istrue(forward)) {
        while (index >= curindex) {
            pathstruct.path[pathstruct.path.size] = self.var_e0c08758eb0006be.path[curindex].origin;
            curindex = curindex + 1;
        }
    } else {
        curindex = curindex - 1;
        while (curindex >= index) {
            pathstruct.path[pathstruct.path.size] = self.var_e0c08758eb0006be.path[curindex].origin;
            curindex = curindex - 1;
        }
    }
    if (isdefined(var_ad1e1e856375b447)) {
        for (i = 0; i < var_4a72697044d23367; i++) {
            pathstruct.path[pathstruct.path.size] = self.var_e0c08758eb0006be.var_7d8884f5400e2fca[index][var_ad1e1e856375b447].path[i].origin;
        }
    }
    return pathstruct;
}

// Namespace namespace_d952f9ac311401b4/namespace_adc82618e9ef9897
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e71
// Size: 0x1c5
function function_bb51d7fa820f19ae(index, parentindex, var_ad1e1e856375b447) {
    newpath = [];
    if (isdefined(self.var_13ccb567671deb18)) {
        if (var_ad1e1e856375b447 == self.var_13ccb567671deb18) {
            direction = ter_op(self.var_f0f726adafb8c51a > index, -1, 1);
            i = self.var_f0f726adafb8c51a;
            while (i != index + direction) {
                newpath[newpath.size] = self.var_e0c08758eb0006be.var_7d8884f5400e2fca[parentindex][var_ad1e1e856375b447].path[i].origin;
                i = i + direction;
            }
        } else {
            for (i = self.var_f0f726adafb8c51a; i >= 0; i--) {
                newpath[newpath.size] = self.var_e0c08758eb0006be.var_7d8884f5400e2fca[parentindex][self.var_13ccb567671deb18].path[i].origin;
            }
            newpath[newpath.size] = self.var_e0c08758eb0006be.path[self.var_e0c08758eb0006be.index].origin;
            for (i = 0; i < index; i++) {
                newpath[newpath.size] = self.var_e0c08758eb0006be.var_7d8884f5400e2fca[parentindex][var_ad1e1e856375b447].path[i].origin;
            }
        }
    } else if (isdefined(parentindex) && isdefined(var_ad1e1e856375b447)) {
        newpath[newpath.size] = self.var_e0c08758eb0006be.var_7d8884f5400e2fca[parentindex][var_ad1e1e856375b447].path[0].origin;
    }
    return newpath;
}

// Namespace namespace_d952f9ac311401b4/namespace_adc82618e9ef9897
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x203e
// Size: 0x12e
function function_3e8010501de305fa(node, target) {
    if (isdefined(self.var_8ffa366ec68f0c8b)) {
        var_8ffa366ec68f0c8b = self.var_8ffa366ec68f0c8b;
    }
    if (distancesquared(self.origin, node.origin) < var_8ffa366ec68f0c8b) {
        return 0;
    }
    var_c3fbb6661b91750f = create_contents(0, 1, 0, 1, 0, 0, 0, 1, 1);
    canseetarget = ray_trace_passed(target.origin, node.origin + (0, 0, 50), [0:self], var_c3fbb6661b91750f);
    /#
        if (canseetarget) {
            draw_arrow_time(node.origin + (0, 0, 50), target.origin, (0, 255, 0), 2);
        } else {
            draw_arrow_time(node.origin + (0, 0, 50), target.origin, (255, 0, 0), 2);
        }
    #/
    return canseetarget;
}

// Namespace namespace_d952f9ac311401b4/namespace_adc82618e9ef9897
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2174
// Size: 0x1fc
function function_1457a29ddb8b55dc(target, cfg) {
    self endon("death");
    self endon("enter_patrol");
    self endon("target_lost");
    firetime = weaponfiretime(cfg.weaponinfo);
    var_3746ec1befd86ae8 = 50;
    var_3e92cd336a99ce02 = 65;
    var_5f622c39d6661b23 = cfg.pausemin;
    var_42ae243cd994c3bd = cfg.pausemax;
    numshots = randomintrange(var_3746ec1befd86ae8, var_3e92cd336a99ce02 + 1);
    if (!function_79e58f587efe9e1f(target)) {
        return;
    }
    self setturrettargetent(target, function_a7f393dd1e9a679b(target) - target.origin);
    var_a84cfd847dc1f677 = level.tanksettings[self.tanktype];
    if (!istrue(self.var_4863a1b39f3e20f5)) {
        function_6a5482361557e17b();
    }
    while (function_79e58f587efe9e1f(target) && !namespace_6e1510c5f3f599a2::function_bb61346fda4278e5(self, target, "j_mainroot", 5)) {
        waitframe();
    }
    var_bb0adda1f09bc49 = 0;
    while (numshots > 0) {
        if (!isdefined(target) || !isdefined(target.origin)) {
            return;
        }
        if (isdefined(self.var_c02eea4b304a5921) && function_79e58f587efe9e1f(target)) {
            var_bb0adda1f09bc49 = 0;
            self.var_c02eea4b304a5921 = undefined;
            self setturrettargetent(target, function_a7f393dd1e9a679b(target) - target.origin);
        } else if (!isdefined(self.var_c02eea4b304a5921) && !function_79e58f587efe9e1f(target)) {
            var_bb0adda1f09bc49 = var_bb0adda1f09bc49 + 1;
            self.var_c02eea4b304a5921 = function_a7f393dd1e9a679b(target);
            self setturrettargetvec(self.var_c02eea4b304a5921);
            if (isdefined(self.var_7cfe1b189bcf3cad) && var_bb0adda1f09bc49 > self.var_7cfe1b189bcf3cad) {
                return;
            }
        }
        self fireweapon();
        numshots--;
        wait(firetime);
    }
}

// Namespace namespace_d952f9ac311401b4/namespace_adc82618e9ef9897
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2377
// Size: 0x49
function empstarted(data) {
    namespace_6ca1587edcca0018::function_db443c859c55e450(1);
    function_55f73871378d7cea();
    self.emp = 1;
    self notify("target_lost");
    if (isdefined(self.var_f973d23cb4cfc1a7)) {
        self [[ self.var_f973d23cb4cfc1a7 ]]();
    }
}

// Namespace namespace_d952f9ac311401b4/namespace_adc82618e9ef9897
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23c7
// Size: 0x3f
function empcleared(isdeath) {
    namespace_6ca1587edcca0018::function_db443c859c55e450(0);
    self.emp = 0;
    function_b0bcd78019fa3f75();
    if (isdefined(self.var_5b07ef3c411c7013)) {
        self [[ self.var_5b07ef3c411c7013 ]]();
    }
}

// Namespace namespace_d952f9ac311401b4/namespace_adc82618e9ef9897
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x240d
// Size: 0x7e
function function_f149e9383f183cf0(data) {
    var_8a28fd9df2f03764 = data.victim;
    if (!isdefined(var_8a28fd9df2f03764)) {
        return;
    }
    if (istrue(var_8a28fd9df2f03764.var_12bfb031c0a0efd8)) {
        return;
    }
    var_8a28fd9df2f03764.var_12bfb031c0a0efd8 = 1;
    var_8a28fd9df2f03764 thread function_e6cbf8131b64e6db();
    var_8a28fd9df2f03764 function_77320e794d35465a("p2p", "manualSpeed", mph_to_ips(var_8a28fd9df2f03764.pathstruct.speed / 3));
}

// Namespace namespace_d952f9ac311401b4/namespace_adc82618e9ef9897
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2492
// Size: 0x61
function function_5c67fa91fe5b79(data) {
    var_8a28fd9df2f03764 = data.victim;
    if (!isdefined(var_8a28fd9df2f03764)) {
        return;
    }
    var_8a28fd9df2f03764 function_77320e794d35465a("p2p", "manualSpeed", mph_to_ips(var_8a28fd9df2f03764.pathstruct.speed));
    var_8a28fd9df2f03764.var_12bfb031c0a0efd8 = 0;
}

// Namespace namespace_d952f9ac311401b4/namespace_adc82618e9ef9897
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24fa
// Size: 0xa3
function function_e6cbf8131b64e6db() {
    level endon("game_ended");
    var_a84cfd847dc1f677 = level.tanksettings[self.tanktype];
    firetime = randomfloatrange(0.2, 0.4);
    childthread function_4973f20495f7d1ff(firetime);
    self.var_158f2fb396c0cccb = 1;
    if (!isdefined(self.driver)) {
        self.var_c6dfdd9743149226 = undefined;
        self clearturrettarget();
        self.currentenemy = undefined;
    }
    msg = waittill_any_return_2("death", "haywire_cleared");
    self.var_158f2fb396c0cccb = undefined;
}

// Namespace namespace_d952f9ac311401b4/namespace_adc82618e9ef9897
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25a4
// Size: 0x2b
function function_4973f20495f7d1ff(firetime) {
    self endon("death");
    self endon("haywire_cleared");
    while (1) {
        self fireweapon();
        wait(firetime);
    }
}

// Namespace namespace_d952f9ac311401b4/namespace_adc82618e9ef9897
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x25d6
// Size: 0xba
function function_aa6f0c2c4f3559c0(var_2f58e7950b321302) {
    self endon("death");
    self notify("dmz_ai_vehicle_check_stuck");
    self endon("dmz_ai_vehicle_check_stuck");
    var_547fe4c1dd5e2c2a = self.origin;
    var_3f46a394e6cf82de = 0;
    while (1) {
        wait(1);
        if (istrue(self.isemped) || istrue(self.var_12bfb031c0a0efd8) || isdefined(self.var_c6dfdd9743149226)) {
            wait(0.25);
            continue;
        }
        var_6e3257dcba2c4998 = self.origin;
        if (distancesquared(var_6e3257dcba2c4998, var_547fe4c1dd5e2c2a) < 100) {
            var_3f46a394e6cf82de = var_3f46a394e6cf82de + 1;
            if (var_3f46a394e6cf82de > 3) {
                var_3f46a394e6cf82de = 0;
                function_b0bcd78019fa3f75();
            }
        }
        var_547fe4c1dd5e2c2a = var_6e3257dcba2c4998;
    }
}

// Namespace namespace_d952f9ac311401b4/namespace_adc82618e9ef9897
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x2697
// Size: 0x226
function function_602b08f8ddab1906() {
    self notify("target_lost");
    namespace_9246f10206f50768::function_aa85eb39828a4d80([0:self.var_2f63cc785dacc8a3], 10, 1, 0);
    mindist = 100000000;
    var_306cb412722a32d9 = undefined;
    var_8f51101f14c01979 = undefined;
    pathindex = undefined;
    foreach (index, node in self.var_e0c08758eb0006be.path) {
        dist = distancesquared(node.origin, self.origin);
        if (dist < mindist) {
            mindist = dist;
            pathindex = index;
        }
    }
    foreach (index, var_c2fbb71a3a796005 in self.var_e0c08758eb0006be.var_7d8884f5400e2fca) {
        foreach (var_4a72697044d23367, var_be64712b6ece7aa5 in var_c2fbb71a3a796005) {
            foreach (var_908f3939d47bd887, node in var_be64712b6ece7aa5.path) {
                dist = distancesquared(node.origin, self.origin);
                if (dist < mindist) {
                    mindist = dist;
                    var_306cb412722a32d9 = var_4a72697044d23367;
                    var_8f51101f14c01979 = var_908f3939d47bd887;
                    pathindex = index;
                }
            }
        }
    }
    self.var_f0f726adafb8c51a = var_8f51101f14c01979;
    self.var_13ccb567671deb18 = var_306cb412722a32d9;
    self.var_46496c542d347ba8 = pathindex;
    self.var_e0c08758eb0006be.index = pathindex;
}

// Namespace namespace_d952f9ac311401b4/namespace_adc82618e9ef9897
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28c4
// Size: 0x43
function function_93dccf3096384da0() {
    self endon("death");
    while (1) {
        self waittill("near_goal");
        self.var_2f63cc785dacc8a3 = self.origin;
        wait(0.1);
        thread function_aa6f0c2c4f3559c0(self.goalpoint);
    }
}

// Namespace namespace_d952f9ac311401b4/namespace_adc82618e9ef9897
// Params 14, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x290e
// Size: 0x201
function private function_96b758d589365ef6(inflictor, attacker, damage, dflags, meansofdeath, objweapon, point, dir, hitloc, timeoffset, modelindex, var_799f234362adb813, partname, eventid) {
    if (isagent(attacker)) {
        return;
    }
    if (isplayer(attacker)) {
        self.var_8e7d46146a9cf2eb = attacker;
    }
    if (isdefined(level.vehicles) && isdefined(level.vehicles.damagecallback)) {
        self [[ level.vehicles.damagecallback ]](inflictor, attacker, damage, dflags, meansofdeath, objweapon, point, dir, hitloc, timeoffset, modelindex, var_799f234362adb813, partname, eventid);
    } else {
        self vehicle_finishdamage(inflictor, attacker, damage, dflags, meansofdeath, objweapon, point, dir, hitloc, timeoffset, modelindex, var_799f234362adb813, partname);
    }
    if (self.damagestate == 0 && self.health / self.maxhealth < 0.6) {
        self setscriptablepartstate("body_damage_light", "on", 0);
        if (isdefined(self.interact)) {
            self.interact setscriptablepartstate("body_damage_light", "on", 0);
        }
        self.damagestate = 1;
    } else if (self.damagestate == 1 && self.health / self.maxhealth < 0.3) {
        self setscriptablepartstate("body_damage_medium", "on", 0);
        if (isdefined(self.interact)) {
            self.interact setscriptablepartstate("body_damage_light", "off", 0);
            self.interact setscriptablepartstate("body_damage_medium", "on", 0);
        }
        self.damagestate = 2;
    }
}

