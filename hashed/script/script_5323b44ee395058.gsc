// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\engine\math.gsc;
#using scripts\common\utility.gsc;
#using scripts\engine\trace.gsc;
#using scripts\cp_mp\utility\killstreak_utility.gsc;
#using scripts\cp_mp\utility\player_utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_371b4c2ab5861e62;
#using scripts\cp_mp\parachute.gsc;

#namespace namespace_94f504280206b84;

// Namespace namespace_94f504280206b84/namespace_6e1510c5f3f599a2
// Params 11, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x16a
// Size: 0x28d
function function_770a14e56b03b067(turret, var_8826c6bc694729c5, var_f537b27c366f06c9, var_9c8dd41525b291d5, var_693b7b6938cb597e, var_9a5ffe4775714312, var_da50ab9753c3ae26, var_4a44b8ef4d9cba92, var_1833609413f67de7, var_1c58dd8c5ca65897, var_a4bf19053a661fc5) {
    if (!isdefined(turret)) {
        /#
            /#
                assertmsg("<unknown string>");
            #/
        #/
        return undefined;
    }
    var_d6fba8ed3d4c1219 = function_e1424ac9314fd672(turret, var_8826c6bc694729c5, var_f537b27c366f06c9, var_9c8dd41525b291d5, var_693b7b6938cb597e, var_da50ab9753c3ae26, var_4a44b8ef4d9cba92, var_1c58dd8c5ca65897, var_a4bf19053a661fc5);
    var_88c2b48ba3714b8e = undefined;
    var_97e45ab250562d16 = undefined;
    foreach (targetdata in var_d6fba8ed3d4c1219) {
        targetplayer = function_70b8756e9fc03c44(targetdata);
        if (!function_10f997ed68f4fcef(turret, targetplayer, var_8826c6bc694729c5, var_f537b27c366f06c9, var_9c8dd41525b291d5, var_693b7b6938cb597e, var_da50ab9753c3ae26, var_4a44b8ef4d9cba92, var_1c58dd8c5ca65897, var_a4bf19053a661fc5)) {
            continue;
        }
        targetvehicle = function_effebb9076efbdb(targetdata);
        var_75d604bcb71dddd1 = turret;
        var_4bacd07ac9b43431 = turret getlinkedparent();
        if (isdefined(var_4bacd07ac9b43431)) {
            var_75d604bcb71dddd1 = var_4bacd07ac9b43431;
        }
        angle = abs(vectortoangles(targetplayer.origin - var_75d604bcb71dddd1.origin)[1]);
        var_5859f08fc82143f7 = abs(var_75d604bcb71dddd1 gettagangles("tag_origin")[1]);
        angle = abs(angle - var_5859f08fc82143f7);
        if (!istrue(var_1833609413f67de7)) {
            var_d6e9347c3618a5bb = targetplayer getweaponslistitems();
            foreach (weapon in var_d6e9347c3618a5bb) {
                var_c0b9c9a4fa4eef84 = weaponclass(weapon);
                if (var_c0b9c9a4fa4eef84 == "rocketlauncher") {
                    angle = angle - 40;
                }
            }
        }
        if (isdefined(targetvehicle)) {
            var_9e6b52e2227b1d6b = 1;
            angle = angle + 20;
        }
        if (!isdefined(var_88c2b48ba3714b8e) || var_88c2b48ba3714b8e > angle) {
            var_88c2b48ba3714b8e = angle;
            var_97e45ab250562d16 = targetdata;
        }
    }
    if (isdefined(var_97e45ab250562d16) && isdefined(var_9a5ffe4775714312)) {
        turret thread function_9598d2dcfc423f60(var_97e45ab250562d16, var_9a5ffe4775714312);
    }
    return var_97e45ab250562d16;
}

// Namespace namespace_94f504280206b84/namespace_6e1510c5f3f599a2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ff
// Size: 0x3e
function function_e59541944f1a4fe5(turret, targetdata) {
    if (!isdefined(turret)) {
        /#
            /#
                assertmsg("<unknown string>");
            #/
        #/
        return;
    }
    turret.currenttarget = function_70b8756e9fc03c44(targetdata);
}

// Namespace namespace_94f504280206b84/namespace_6e1510c5f3f599a2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x444
// Size: 0x2e
function function_dfae8a6885a8537c(turret) {
    if (!isdefined(turret)) {
        /#
            /#
                assertmsg("<unknown string>");
            #/
        #/
        return;
    }
    turret.currenttarget = undefined;
}

// Namespace namespace_94f504280206b84/namespace_6e1510c5f3f599a2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x479
// Size: 0x38
function function_46c1ea4a69ad33d6(turret, targetstate) {
    if (!isdefined(turret)) {
        /#
            /#
                assertmsg("<unknown string>");
            #/
        #/
        return;
    }
    turret.targetstate = targetstate;
}

// Namespace namespace_94f504280206b84/namespace_6e1510c5f3f599a2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4b8
// Size: 0x4e
function function_7e4458965893599a(turret) {
    if (!isdefined(turret)) {
        /#
            /#
                assertmsg("<unknown string>");
            #/
        #/
        return;
    }
    if (!isdefined(turret.targetstate)) {
        /#
            /#
                assertmsg("<unknown string>");
            #/
        #/
    }
    return turret.targetstate;
}

// Namespace namespace_94f504280206b84/namespace_6e1510c5f3f599a2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50e
// Size: 0x1e
function function_20e6f4d27c8040bd(turret) {
    return isdefined(turret) && isdefined(turret.currenttarget);
}

// Namespace namespace_94f504280206b84/namespace_6e1510c5f3f599a2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x534
// Size: 0x4a
function function_bc2021c62b0d43cc(turret, target) {
    var_9acd3989a7189886 = 0;
    if (!isdefined(target)) {
        return 0;
    }
    currenttarget = function_2adff40b591b5758(turret);
    if (isdefined(currenttarget) && currenttarget == target) {
        var_9acd3989a7189886 = 1;
    }
    return var_9acd3989a7189886;
}

// Namespace namespace_94f504280206b84/namespace_6e1510c5f3f599a2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x586
// Size: 0x25
function function_2adff40b591b5758(turret) {
    return ter_op(function_20e6f4d27c8040bd(turret), turret.currenttarget, undefined);
}

// Namespace namespace_94f504280206b84/namespace_6e1510c5f3f599a2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5b3
// Size: 0x2e
function function_70b8756e9fc03c44(targetdata) {
    if (!isdefined(targetdata)) {
        /#
            /#
                assertmsg("<unknown string>");
            #/
        #/
        return;
    }
    return targetdata.targetplayer;
}

// Namespace namespace_94f504280206b84/namespace_6e1510c5f3f599a2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e9
// Size: 0x2e
function function_effebb9076efbdb(targetdata) {
    if (!isdefined(targetdata)) {
        /#
            /#
                assertmsg("<unknown string>");
            #/
        #/
        return;
    }
    return targetdata.targetvehicle;
}

// Namespace namespace_94f504280206b84/namespace_6e1510c5f3f599a2
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x61f
// Size: 0x1a9
function function_f6f04fc4e42cf2c4(turret, potentialtarget, var_935ba61e1c5c6320) {
    var_c3fbb6661b91750f = function_72017fc448d5c9a0();
    var_b9d5783a4f34efbc = [0:turret];
    var_15c3c1d963654f89 = 0;
    if (istrue(var_935ba61e1c5c6320)) {
        var_15c3c1d963654f89 = potentialtarget isinvehicle();
        if (istrue(var_15c3c1d963654f89)) {
            var_281dedd57c723e4f = potentialtarget getvehicle();
            var_b9d5783a4f34efbc[var_b9d5783a4f34efbc.size] = var_281dedd57c723e4f;
            var_53023fda76fa64fe = var_281dedd57c723e4f getlinkedchildren();
            if (isdefined(var_53023fda76fa64fe) && var_53023fda76fa64fe.size > 0) {
                var_b9d5783a4f34efbc = array_combine(var_b9d5783a4f34efbc, var_53023fda76fa64fe);
            }
        }
    }
    var_8bc64c989ae0d63e = [];
    if (isplayer(potentialtarget) || isagent(potentialtarget)) {
        headpos = potentialtarget gettagorigin("j_head");
        if (isdefined(headpos)) {
            var_8bc64c989ae0d63e[var_8bc64c989ae0d63e.size] = headpos;
        }
        midpos = potentialtarget gettagorigin("j_mainroot");
        if (isdefined(midpos)) {
            var_8bc64c989ae0d63e[var_8bc64c989ae0d63e.size] = midpos;
        }
    }
    var_8bc64c989ae0d63e[var_8bc64c989ae0d63e.size] = potentialtarget.origin;
    canseetarget = 0;
    tracestartpos = turret gettagorigin("tag_barrel");
    foreach (traceendpos in var_8bc64c989ae0d63e) {
        canseetarget = ray_trace_passed(tracestartpos, traceendpos, var_b9d5783a4f34efbc, var_c3fbb6661b91750f);
        if (istrue(canseetarget)) {
            break;
        }
        wait(0.05);
    }
    return canseetarget;
}

// Namespace namespace_94f504280206b84/namespace_6e1510c5f3f599a2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d0
// Size: 0x18
function function_f6926785e402b9fe(targetdata) {
    return istrue(targetdata.var_9e6b52e2227b1d6b);
}

// Namespace namespace_94f504280206b84/namespace_6e1510c5f3f599a2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7f0
// Size: 0x18
function function_d463678ccf4beeda(targetdata) {
    return istrue(targetdata.var_ef401b2016b3518b);
}

// Namespace namespace_94f504280206b84/namespace_6e1510c5f3f599a2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x810
// Size: 0x18
function function_bebd2d48ca6c8a31(targetdata) {
    return istrue(targetdata.var_ebd7809caf7cf3b0);
}

// Namespace namespace_94f504280206b84/namespace_6e1510c5f3f599a2
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x830
// Size: 0xd7
function function_bb61346fda4278e5(turret, target, var_a545c521308d6b1e, var_918144aecea97537) {
    if (!function_20e6f4d27c8040bd(turret) && !isdefined(target)) {
        return 0;
    }
    currenttarget = function_2adff40b591b5758(turret);
    if (isdefined(target)) {
        currenttarget = target;
    }
    var_7b59b41b01684053 = currenttarget.origin;
    if (isdefined(var_a545c521308d6b1e)) {
        var_7b59b41b01684053 = currenttarget gettagorigin(var_a545c521308d6b1e);
    }
    if (!isdefined(var_918144aecea97537)) {
        var_918144aecea97537 = 10;
    }
    var_929ad65d451ffc68 = anglestoforward(turret gettagangles("tag_flash"));
    var_efa57adc48838f9b = var_7b59b41b01684053 - turret gettagorigin("tag_flash");
    anglediff = math::anglebetweenvectors(var_929ad65d451ffc68, var_efa57adc48838f9b);
    if (anglediff <= var_918144aecea97537) {
        return 1;
    }
    return 0;
}

// Namespace namespace_94f504280206b84/namespace_6e1510c5f3f599a2
// Params 9, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x90f
// Size: 0xdc
function private function_e1424ac9314fd672(turret, var_8826c6bc694729c5, var_f537b27c366f06c9, var_9c8dd41525b291d5, var_693b7b6938cb597e, var_da50ab9753c3ae26, var_4a44b8ef4d9cba92, var_1c58dd8c5ca65897, var_a4bf19053a661fc5) {
    turret endon("death");
    level endon("game_ended");
    if (!isdefined(var_8826c6bc694729c5)) {
        var_8826c6bc694729c5 = 5000;
    }
    alltargets = function_f28fd019a7657543(turret, var_8826c6bc694729c5);
    var_244e4fc365dbd24f = [];
    for (i = 0; i < alltargets.size; i++) {
        targetdata = function_c836479731703b1b(turret, alltargets[i], var_8826c6bc694729c5, var_f537b27c366f06c9, var_9c8dd41525b291d5, var_693b7b6938cb597e, var_da50ab9753c3ae26, var_4a44b8ef4d9cba92, var_1c58dd8c5ca65897, var_a4bf19053a661fc5);
        if (isdefined(targetdata)) {
            var_244e4fc365dbd24f[var_244e4fc365dbd24f.size] = targetdata;
        } else {
            continue;
        }
        wait(0.05);
    }
    return var_244e4fc365dbd24f;
}

// Namespace namespace_94f504280206b84/namespace_6e1510c5f3f599a2
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9f3
// Size: 0x83
function private function_f28fd019a7657543(turret, var_8826c6bc694729c5) {
    var_f6eb2388ba101e7c = [];
    if (utility::iscp()) {
        allplayers = level.players;
        var_cd207438e3e764e6 = [];
        if (isdefined(level.agentarray)) {
            var_cd207438e3e764e6 = level.agentarray;
        }
        var_f6eb2388ba101e7c = array_combine(var_cd207438e3e764e6, allplayers);
    } else {
        var_f6eb2388ba101e7c = utility::function_2d7fd59d039fa69b(turret.origin, var_8826c6bc694729c5);
    }
    return var_f6eb2388ba101e7c;
}

// Namespace namespace_94f504280206b84/namespace_6e1510c5f3f599a2
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xa7e
// Size: 0x86
function private function_72017fc448d5c9a0() {
    character = 0;
    world = 1;
    glass = 0;
    var_97d66cb843a8ec8f = 1;
    item = 0;
    vehicle = 1;
    playerclip = 0;
    ainosight = 1;
    itemclip = 1;
    return create_contents(character, world, glass, var_97d66cb843a8ec8f, item, vehicle, playerclip, ainosight, itemclip);
}

// Namespace namespace_94f504280206b84/namespace_6e1510c5f3f599a2
// Params 10, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb0c
// Size: 0x13b
function private function_c836479731703b1b(turret, potentialtarget, var_8826c6bc694729c5, var_f537b27c366f06c9, var_9c8dd41525b291d5, var_693b7b6938cb597e, var_da50ab9753c3ae26, var_4a44b8ef4d9cba92, var_1c58dd8c5ca65897, var_a4bf19053a661fc5) {
    turret endon("death");
    if (!function_10f997ed68f4fcef(turret, potentialtarget, var_8826c6bc694729c5, var_f537b27c366f06c9, var_9c8dd41525b291d5, var_693b7b6938cb597e, var_da50ab9753c3ae26, var_4a44b8ef4d9cba92, var_1c58dd8c5ca65897, var_a4bf19053a661fc5)) {
        return undefined;
    }
    targetdata = function_371b6c83926ff36();
    canseetarget = function_f6f04fc4e42cf2c4(turret, potentialtarget, var_f537b27c366f06c9);
    var_15c3c1d963654f89 = undefined;
    var_281dedd57c723e4f = undefined;
    if (istrue(var_f537b27c366f06c9)) {
        var_15c3c1d963654f89 = potentialtarget isinvehicle();
        if (istrue(var_15c3c1d963654f89)) {
            var_281dedd57c723e4f = potentialtarget getvehicle();
        }
    }
    if (istrue(canseetarget)) {
        targetdata.targetplayer = potentialtarget;
        targetdata.targetvehicle = ter_op(isdefined(var_281dedd57c723e4f), var_281dedd57c723e4f, undefined);
        targetdata.var_9e6b52e2227b1d6b = istrue(var_f537b27c366f06c9) && istrue(var_15c3c1d963654f89) && isdefined(var_281dedd57c723e4f);
        targetdata.var_ef401b2016b3518b = istrue(var_9c8dd41525b291d5);
        targetdata.var_ebd7809caf7cf3b0 = istrue(var_693b7b6938cb597e);
    }
    return targetdata;
}

// Namespace namespace_94f504280206b84/namespace_6e1510c5f3f599a2
// Params 10, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc4f
// Size: 0x23f
function private function_10f997ed68f4fcef(turret, potentialtarget, var_8826c6bc694729c5, var_f537b27c366f06c9, var_9c8dd41525b291d5, var_693b7b6938cb597e, var_da50ab9753c3ae26, var_4a44b8ef4d9cba92, var_1c58dd8c5ca65897, var_a4bf19053a661fc5) {
    if (!isdefined(potentialtarget)) {
        return 0;
    }
    var_39fea08436a97e8a = turret.team;
    if (isdefined(var_4a44b8ef4d9cba92)) {
        var_39fea08436a97e8a = var_4a44b8ef4d9cba92;
    }
    if (isplayer(potentialtarget)) {
        if (!function_52cda0abb7f78d63(potentialtarget)) {
            return 0;
        }
        if (isdefined(self.owner) && potentialtarget == self.owner) {
            /#
                if (isdefined(var_da50ab9753c3ae26) && istrue(getdvarint(var_da50ab9753c3ae26, 0))) {
                    return 1;
                }
            #/
            return 0;
        }
        var_da8cec9bce12f9cb = potentialtarget.pers["team"];
        if (var_da8cec9bce12f9cb == "spectator") {
            return 0;
        }
        if (isdefined(level.teambased)) {
            if (!isdefined(var_da8cec9bce12f9cb)) {
                return 0;
            }
            if (isdefined(var_39fea08436a97e8a) && !istrue(var_1c58dd8c5ca65897)) {
                if (level.teambased && var_da8cec9bce12f9cb == var_39fea08436a97e8a) {
                    return 0;
                }
            }
        }
    }
    if (isagent(potentialtarget)) {
        if (!isalive(potentialtarget)) {
            return 0;
        }
        if (isdefined(potentialtarget.agent_type) && issubstr(potentialtarget.agent_type, "civilian")) {
            return 0;
        }
        var_da8cec9bce12f9cb = namespace_14d36171baccf528::agentPers_getAgentPersData(potentialtarget, "team");
        if (isdefined(var_39fea08436a97e8a) && !istrue(var_a4bf19053a661fc5)) {
            if (isdefined(var_da8cec9bce12f9cb) && var_da8cec9bce12f9cb == var_39fea08436a97e8a) {
                return 0;
            }
        }
    }
    if (issharedfuncdefined("perk", "hasPerk")) {
        if (potentialtarget [[ getsharedfunc("perk", "hasPerk") ]]("specialty_blindeye")) {
            return 0;
        }
    }
    if (isdefined(var_8826c6bc694729c5)) {
        if (distancesquared(turret.origin, potentialtarget.origin) > var_8826c6bc694729c5 * var_8826c6bc694729c5) {
            return 0;
        }
    }
    if (istrue(potentialtarget isinvehicle()) && !istrue(var_f537b27c366f06c9)) {
        return 0;
    }
    if (istrue(potentialtarget.inlaststand) && !istrue(var_9c8dd41525b291d5)) {
        return 0;
    }
    if (namespace_5078ee98abb32db9::isparachutegametype() && (potentialtarget isparachuting() || potentialtarget isskydiving()) && !istrue(var_693b7b6938cb597e)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_94f504280206b84/namespace_6e1510c5f3f599a2
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe96
// Size: 0x2e
function private function_52cda0abb7f78d63(player) {
    return isdefined(player) && player _isalive() && player.sessionstate == "playing";
}

// Namespace namespace_94f504280206b84/namespace_6e1510c5f3f599a2
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xecc
// Size: 0x51
function private function_371b6c83926ff36() {
    targetdata = spawnstruct();
    targetdata.targetplayer = undefined;
    targetdata.targetvehicle = undefined;
    targetdata.var_9e6b52e2227b1d6b = 0;
    targetdata.var_ef401b2016b3518b = 0;
    targetdata.var_ebd7809caf7cf3b0 = 0;
    return targetdata;
}

// Namespace namespace_94f504280206b84/namespace_6e1510c5f3f599a2
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf25
// Size: 0x57
function private function_9598d2dcfc423f60(targetdata, var_9a5ffe4775714312) {
    self endon("death");
    function_e59541944f1a4fe5(self, targetdata);
    thread function_7826e8e1bd494568(function_70b8756e9fc03c44(targetdata), "death_or_disconnect");
    if (isdefined(var_9a5ffe4775714312)) {
        thread function_7826e8e1bd494568(self, var_9a5ffe4775714312);
    }
    self waittill("clear_turret_target");
    function_dfae8a6885a8537c(self);
}

// Namespace namespace_94f504280206b84/namespace_6e1510c5f3f599a2
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xf83
// Size: 0x2e
function private function_7826e8e1bd494568(ent, var_70687e0cc558a009) {
    self endon("death");
    self endon("clear_turret_target");
    ent waittill(var_70687e0cc558a009);
    self notify("clear_turret_target");
}

