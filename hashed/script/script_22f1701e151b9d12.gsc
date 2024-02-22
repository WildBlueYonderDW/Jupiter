// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_4c770a9a4ad7659c;
#using script_2669878cf5a1b6bc;
#using scripts\asm\shared\mp\utility.gsc;
#using scripts\common\vehicle_aianim.gsc;
#using scripts\stealth\enemy.gsc;
#using script_7caebc5d4875185;
#using script_6fba7df440c493c4;
#using scripts\common\ai.gsc;
#using script_371b4c2ab5861e62;
#using scripts\asm\asm.gsc;
#using scripts\common\vehicle_code.gsc;
#using scripts\common\vehicle_paths.gsc;
#using script_2d05e472a90adb1d;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using script_30fbbeb9a6251e9a;

#namespace namespace_1c689dd3986a841c;

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xc4d
// Size: 0x512
function private function_eea40a1b6180f90a(requestid, data) {
    agent = data.agent;
    if (!isdefined(agent)) {
        return;
    }
    agent.var_f872dca9d5da2743 = istrue(data.ambient);
    agent.var_ad46aadd4e3290d7 = requestid;
    agent.var_4430054bc89ecef8 = data;
    var_3dfbdc6f9aeb8197 = function_8c8ae740367137ba("OnSpawned", requestid);
    if (isdefined(var_3dfbdc6f9aeb8197)) {
        thread [[ var_3dfbdc6f9aeb8197.var_fa2c135047e3da22 ]](requestid, var_3dfbdc6f9aeb8197.userdata, agent, data);
    }
    foreach (entry in level.var_49918a00761930d4) {
        thread [[ entry ]](agent, requestid, data);
    }
    if (isdefined(data.script_stealthgroup)) {
        agent thread function_6ecf133b1d8dee02(data);
    }
    agent.var_af27b6a3d3a2f6af = data.var_af27b6a3d3a2f6af;
    var_640d9d915416506 = 0;
    if (isdefined(data.var_626b450de0b734e7)) {
        var_640d9d915416506 = 1;
        agent.var_f327ed481efe4857 = 1;
        data.var_626b450de0b734e7 thread namespace_4ff41449ab14a3a0::guy_enter(agent);
        agent thread function_fe875eadc4fcf2c2(requestid);
        agent thread function_2d3a114748311c18();
    } else if (isdefined(data.vehicle_index)) {
        /#
            assertex(agent.behaviortreeasset != "riotshield_cp", "Riot shield enemies cannot use vehicle spawns");
        #/
        agent.var_f327ed481efe4857 = 1;
        var_640d9d915416506 = 1;
        if (!isdefined(level.var_8cd784cab6ecbb43[requestid])) {
            var_4fa5a11c5388ace6 = spawnstruct();
            var_4fa5a11c5388ace6.vehicle = data.vehicle;
            var_4fa5a11c5388ace6.vehicle_index = data.vehicle_index;
            var_4fa5a11c5388ace6.riders = [];
            var_4fa5a11c5388ace6.riders[0] = agent;
            var_4fa5a11c5388ace6.var_cf41a8a0e5c72c2b = data.var_273ee8fdc64cf9aa;
            var_4fa5a11c5388ace6.var_891e2bd59c71ae44 = data.var_891e2bd59c71ae44;
            level.var_8cd784cab6ecbb43[requestid] = var_4fa5a11c5388ace6;
        } else {
            var_38ef45353bfc1025 = level.var_8cd784cab6ecbb43[requestid].riders;
            level.var_8cd784cab6ecbb43[requestid].riders = function_6d6af8144a5131f1(var_38ef45353bfc1025, agent);
        }
    }
    if (isdefined(data.var_35b7f8cbbef2653a)) {
        var_640d9d915416506 = 1;
        agent thread function_77b24ac305d25629(data);
    }
    if (!var_640d9d915416506) {
        if (istrue(data.var_4de8f2b4d81bbb10)) {
            agent thread function_94e87cabbe0c24af(agent.origin);
        }
        agent function_afe6d55c6ab3cd13(data);
    }
    if (getdvarint(@"hash_bf14cfde8e249160", 0) == 1 && agent.type == "zombie" && data.ambient) {
        agent thread function_6710855bea599a1f(data.var_14746953cdb49874);
    }
    if (data.var_d6efea6cb4660747 != 2) {
        var_7c62cb453a76a50d = ter_op(istrue(data.alert) || data.var_d6efea6cb4660747 == 1, "spawn_fast", "spawn");
        var_5bb577a0f2f9e0d3 = function_53c4c53197386572(data.var_5ec625eecd27c095, var_7c62cb453a76a50d);
        if (agent function_8fa69650e33c84ef(var_5bb577a0f2f9e0d3)) {
            if (istrue(data.var_324052602cf96b90)) {
                var_111d3f28b61a4075 = data.origin;
                var_5f41de053ae1fe72 = 10;
                if (abs(agent function_8efc1cbdaa97f95e(var_5bb577a0f2f9e0d3)[2]) > var_5f41de053ae1fe72) {
                    var_111d3f28b61a4075 = data.var_111d3f28b61a4075;
                }
                agent thread function_577d8abff6067c23(var_5bb577a0f2f9e0d3, "spawn_end", var_111d3f28b61a4075, data.angles, "spawn_animating");
            } else {
                movedelta = agent function_8efc1cbdaa97f95e(var_5bb577a0f2f9e0d3);
                angledelta = agent function_5173aedda202662(var_5bb577a0f2f9e0d3);
                movedelta = rotatevector(movedelta, data.angles);
                startorigin = data.origin - movedelta;
                startangles = (data.angles[0], angleclamp(data.angles[1] - angledelta), data.angles[2]);
                agent thread function_577d8abff6067c23(var_5bb577a0f2f9e0d3, "spawn_end", startorigin, startangles, "spawn_animating");
            }
        }
    }
    /#
        if (getdvarint(@"hash_fe20797ad12b2dbe", 0) == 1) {
            agent thread function_66be042996360501();
        }
    #/
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1166
// Size: 0x231
function private function_94e87cabbe0c24af(var_ab46c5fef0832d49) {
    self hide();
    delaycall(0.5, &show);
    if (!isdefined(level.var_ec14cbfd51136cd4[self.var_ad46aadd4e3290d7])) {
        level.var_ec14cbfd51136cd4[self.var_ad46aadd4e3290d7] = [];
    }
    var_ee1736139b7098d3 = [];
    foreach (var_3b73d837cbd90e13 in level.var_ec14cbfd51136cd4[self.var_ad46aadd4e3290d7]) {
        if (gettime() < var_3b73d837cbd90e13.endtime) {
            var_ee1736139b7098d3[var_ee1736139b7098d3.size] = var_3b73d837cbd90e13;
        }
    }
    level.var_ec14cbfd51136cd4[self.var_ad46aadd4e3290d7] = var_ee1736139b7098d3;
    foreach (var_3b73d837cbd90e13 in level.var_ec14cbfd51136cd4[self.var_ad46aadd4e3290d7]) {
        if (distancesquared(var_ab46c5fef0832d49, var_3b73d837cbd90e13.origin) < 30625) {
            return;
        }
    }
    /#
        if (getdvarint(@"hash_876ad02b2995d446", 0) == 1) {
            sphere(var_ab46c5fef0832d49, sqrt(30625), (1, 0, 0), 1, int(160));
        }
    #/
    var_f5e8adcec5f0a46d = magicgrenademanual("smoke_grenade_reinforcement_cover", var_ab46c5fef0832d49, (0, 0, -10), 0);
    thread play_sound_in_space("smoke_grenade_expl_trans", var_f5e8adcec5f0a46d.origin);
    var_3b73d837cbd90e13 = spawnstruct();
    var_3b73d837cbd90e13.origin = var_f5e8adcec5f0a46d.origin;
    var_3b73d837cbd90e13.endtime = gettime() + 8000;
    level.var_ec14cbfd51136cd4[self.var_ad46aadd4e3290d7] = array_add(level.var_ec14cbfd51136cd4[self.var_ad46aadd4e3290d7], var_3b73d837cbd90e13);
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x139e
// Size: 0x245
function private function_afe6d55c6ab3cd13(data) {
    self endon("death");
    if (self.unittype == "soldier") {
        if (isdefined(data.var_ef5a3d5534030add)) {
            var_abd2c73b4b1bf9a3 = spawnstruct();
            var_abd2c73b4b1bf9a3.script_delay = data.script_delay;
            var_abd2c73b4b1bf9a3.script_delay_min = data.script_delay_min;
            var_abd2c73b4b1bf9a3.script_delay_max = data.script_delay_max;
            if (data.script_delay_min == data.script_delay_max) {
                if (data.script_delay_min != 0) {
                    var_abd2c73b4b1bf9a3.script_delay = data.script_delay_min;
                }
                var_abd2c73b4b1bf9a3.script_delay_min = undefined;
                var_abd2c73b4b1bf9a3.script_delay_max = undefined;
            }
            if (isdefined(data.var_803f2bf203326f29) && istrue(int(data.var_803f2bf203326f29))) {
                var_abd2c73b4b1bf9a3.var_803f2bf203326f29 = 1;
            }
            if (istrue(data.script_faceangles)) {
                var_abd2c73b4b1bf9a3.script_faceangles = 1;
            }
            if (istrue(data.var_bfd4dba913c52168)) {
                var_abd2c73b4b1bf9a3.var_bfd4dba913c52168 = 1;
            }
            self._blackboard.idlenode = var_abd2c73b4b1bf9a3;
            _setgoalpos(function_bbfc94714c82788b(data.var_ef5a3d5534030add), 64, 1);
            self function_76b3cfb91ef40b3b(data.var_ef5a3d5534030add);
            if (isdefined(data.var_764bdb6fe546dacc)) {
                thread function_93ae2d91d511dad8(data.var_764bdb6fe546dacc);
            }
        } else if (isdefined(data.var_764bdb6fe546dacc)) {
            function_618cf23700c29e56(data.var_764bdb6fe546dacc);
        } else if (isdefined(data.var_c748de49f7d61671)) {
            node = getnode(data.var_c748de49f7d61671, "targetname");
            if (isdefined(node)) {
                if (self usecovernodeifpossible(node)) {
                    self setgoalnode(node);
                }
            }
        } else if (istrue(data.ambient)) {
            thread function_73c107f115e49567(self, 500, 0, self.origin);
        }
    }
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x15ea
// Size: 0xba
function private function_6ecf133b1d8dee02(data) {
    self endon("death");
    if (isdefined(data.script_stealthgroup) && level.gametype != "dungeons") {
        self.script_stealthgroup = data.script_stealthgroup;
        thread namespace_6db9b2dcda758664::main();
        thread namespace_42207369e7a21b21::monitor_death_thread(level.stealth.damage_auto_range, level.stealth.damage_sight_range);
        self.var_ba67494935b9726b = 1;
        waitframe();
        if (istrue(data.alert) && isdefined(self.fnsetstealthstate)) {
            self [[ self.fnsetstealthstate ]]("combat");
        }
    }
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16ab
// Size: 0x4c
function private function_5ce6b6b9de3e6cff(requestid) {
    var_3dfbdc6f9aeb8197 = function_8c8ae740367137ba("ReadyToSpawn", requestid);
    if (isdefined(var_3dfbdc6f9aeb8197)) {
        [[ var_3dfbdc6f9aeb8197.var_fa2c135047e3da22 ]](requestid, var_3dfbdc6f9aeb8197.userdata);
    } else {
        function_a39e9894083f4513(requestid);
    }
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x16fe
// Size: 0x53
function private function_e4fcd78809372c57(requestid, data) {
    var_3dfbdc6f9aeb8197 = function_8c8ae740367137ba("FinishedSpawningBucket", requestid);
    if (isdefined(var_3dfbdc6f9aeb8197)) {
        [[ var_3dfbdc6f9aeb8197.var_fa2c135047e3da22 ]](requestid, var_3dfbdc6f9aeb8197.userdata);
    }
    function_d6b83c4fb86ed414(requestid, data);
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1758
// Size: 0x81
function private function_13aa577f00697db2(requestid, data) {
    /#
        assertex(isdefined(level.var_f3a4ecd257a6ca36[requestid]), "ai_encounter: Ambient encounter using script should reinforce callback, this is not supported.");
    #/
    var_3dfbdc6f9aeb8197 = function_8c8ae740367137ba("ShouldReinforce", requestid);
    if (isdefined(var_3dfbdc6f9aeb8197)) {
        return [[ var_3dfbdc6f9aeb8197.var_fa2c135047e3da22 ]](requestid, var_3dfbdc6f9aeb8197.userdata, data.var_dcff5961635938a9);
    }
    /#
        assertmsg("ai_encounter: Missing script should reinforce callback for requestID: " + requestid);
    #/
    return 1;
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x17e1
// Size: 0x67
function private function_386e7fd540012e1f(requestid, data) {
    var_3dfbdc6f9aeb8197 = function_8c8ae740367137ba("SpawnReinforcements", requestid);
    if (isdefined(var_3dfbdc6f9aeb8197)) {
        return [[ var_3dfbdc6f9aeb8197.var_fa2c135047e3da22 ]](requestid, var_3dfbdc6f9aeb8197.userdata, data.var_dcff5961635938a9);
    }
    /#
        assertmsg("Missing script spawn reinforcements callback for requestID: " + requestid);
    #/
    return 1;
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1850
// Size: 0x89
function private function_8516dd2443304f7d(requestid) {
    level notify("ai_encounter_floodfill_shutdown_thread_" + requestid);
    level endon("ai_encounter_floodfill_shutdown_thread_" + requestid);
    level endon("ai_encounter_shutdown_" + requestid);
    while (1) {
        var_3dfbdc6f9aeb8197 = function_8c8ae740367137ba("ShouldShutdownFloodFill", requestid);
        if (isdefined(var_3dfbdc6f9aeb8197)) {
            if ([[ var_3dfbdc6f9aeb8197.var_fa2c135047e3da22 ]](requestid, var_3dfbdc6f9aeb8197.userdata)) {
                break;
            }
        } else {
            /#
                assertmsg("Missing script should shutdown flood fill callback for requestID: " + requestid);
            #/
            break;
        }
        waitframe();
    }
    function_776bdb2810e99635(requestid);
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x18e0
// Size: 0x16
function private function_ecf64a7ab670fff0(requestid) {
    level thread function_8516dd2443304f7d(requestid);
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x18fd
// Size: 0xc6
function private function_9abe578fe2af1212(requestid) {
    level notify("ai_encounter_floodfill_spawn_thread_" + requestid);
    level endon("ai_encounter_floodfill_spawn_thread_" + requestid);
    level endon("ai_encounter_shutdown_" + requestid);
    while (1) {
        var_3dfbdc6f9aeb8197 = function_8c8ae740367137ba("ShouldSpawnFloodFill", requestid);
        if (isdefined(var_3dfbdc6f9aeb8197)) {
            /#
                var_59c3e231ca6f0f36 = function_9a39e23c3c52c2af(requestid);
                /#
                    assert(var_59c3e231ca6f0f36.status == 1 || var_59c3e231ca6f0f36.status == 6);
                #/
            #/
            if ([[ var_3dfbdc6f9aeb8197.var_fa2c135047e3da22 ]](requestid, var_3dfbdc6f9aeb8197.userdata)) {
                break;
            }
        } else {
            /#
                assertmsg("Missing script should spawn flood fill callback for requestID: " + requestid);
            #/
            break;
        }
        waitframe();
    }
    function_6f642674e19ebc2a(requestid);
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x19ca
// Size: 0x2f
function private function_d3ba5d80eea20f95(requestid, ready) {
    if (ready) {
        level thread function_9abe578fe2af1212(requestid);
    } else {
        level notify("ai_encounter_floodfill_spawn_thread_" + requestid);
    }
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a00
// Size: 0x2b
function function_3248cab79849207(requestid, var_fa2c135047e3da22, userdata) {
    function_42d34b1d7f4a3f2d("Shutdown", requestid, var_fa2c135047e3da22, userdata);
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a32
// Size: 0x2b
function function_bc5315dc37ae4cf(requestid, var_fa2c135047e3da22, userdata) {
    function_42d34b1d7f4a3f2d("ShouldSpawnFloodFill", requestid, var_fa2c135047e3da22, userdata);
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a64
// Size: 0x2b
function function_73147cdf5c28d10c(requestid, var_fa2c135047e3da22, userdata) {
    function_42d34b1d7f4a3f2d("ShouldShutdownFloodFill", requestid, var_fa2c135047e3da22, userdata);
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1a96
// Size: 0xb4
function private function_9c54bda96991b25c(requestid, data) {
    var_3dfbdc6f9aeb8197 = function_8c8ae740367137ba("Shutdown", requestid);
    if (istrue(data.iscomplete)) {
        level.var_f3a4ecd257a6ca36[requestid] = undefined;
        if (istrue(data.var_6f81756d42f8195)) {
            level.var_f3a4ecd257a6ca36[requestid] = [];
        }
        if (isdefined(level.var_ec14cbfd51136cd4[requestid])) {
            level.var_ec14cbfd51136cd4[requestid] = undefined;
        }
    }
    if (isdefined(var_3dfbdc6f9aeb8197)) {
        thread [[ var_3dfbdc6f9aeb8197.var_fa2c135047e3da22 ]](requestid, var_3dfbdc6f9aeb8197.userdata);
    }
    if (istrue(data.iscomplete)) {
        level notify("ai_encounter_shutdown_" + requestid);
    }
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1b51
// Size: 0xbd
function private function_e0d368c66df8c67(requestid, data) {
    if (getdvarint(@"hash_5f66eab541a1a1b4", 0) == 1) {
        foreach (guy in data) {
            /#
                assert(!istrue(guy.var_f6d0fd2d574e820c));
            #/
            guy.var_f6d0fd2d574e820c = 1;
            level.var_817d6578a64e573a = array_add(level.var_817d6578a64e573a, guy);
        }
    }
    level notify("ai_encounter_despawning_" + requestid);
    level notify("ai_spawn_director_despawn_ai");
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1c15
// Size: 0x99
function private function_241474007dc5c94a() {
    while (1) {
        level waittill("ai_spawn_director_despawn_ai");
        var_9e01e4947f20cabc = 0;
        while (level.var_817d6578a64e573a.size > 0) {
            guy = level.var_817d6578a64e573a[0];
            level.var_817d6578a64e573a = array_remove_index(level.var_817d6578a64e573a, 0);
            if (isalive(guy)) {
                guy thread function_57d486c472b67a38(guy.var_ad46aadd4e3290d7);
                var_9e01e4947f20cabc++;
            }
            if (var_9e01e4947f20cabc >= getdvarint(@"hash_54dc66a37e679beb", 5)) {
                var_9e01e4947f20cabc = 0;
                waitframe();
            }
        }
    }
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1cb5
// Size: 0x144
function private function_cf12cd77ab7cdc78(callbackname, requestid, data) {
    switch (callbackname) {
    case #"hash_9e98220b6f353a3f":
        return function_eea40a1b6180f90a(requestid, data);
    case #"hash_58235f15856f6160":
        data function_940ac86068aa76eb();
    case #"hash_d88f6ad5755dfe30":
    case #"hash_eb099bd287e41597":
        function_5ce6b6b9de3e6cff(requestid);
        break;
    case #"hash_b9a32efd84fd32d0":
        function_e4fcd78809372c57(requestid, data);
        break;
    case #"hash_9667ea6cd44b8ec8":
        return function_13aa577f00697db2(requestid, data);
    case #"hash_d255c0e81e69573b":
        function_386e7fd540012e1f(requestid, data);
        break;
    case #"hash_95c6a6d49e8ed085":
        function_d3ba5d80eea20f95(requestid, data);
        break;
    case #"hash_79765d0de58f935c":
        function_ecf64a7ab670fff0(requestid);
        break;
    case #"hash_45fc965fd1793461":
        function_e0d368c66df8c67(requestid, data);
        break;
    case #"hash_d432f1ec297228ab":
        function_9c54bda96991b25c(requestid, data);
        break;
    case #"hash_f955cea142173b3d":
        function_af598d8abc9720f0(requestid);
        break;
    case #"hash_7c1d8e0a9e3c904f":
        function_4d45fa39ae828d50(requestid);
        break;
    }
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1e00
// Size: 0x2b
function function_ac1550e1d32916bb(requestid, var_fa2c135047e3da22, userdata) {
    function_42d34b1d7f4a3f2d("Restored", requestid, var_fa2c135047e3da22, userdata);
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1e32
// Size: 0x43
function private function_4d45fa39ae828d50(requestid) {
    var_3dfbdc6f9aeb8197 = function_8c8ae740367137ba("Restored", requestid);
    if (isdefined(var_3dfbdc6f9aeb8197)) {
        thread [[ var_3dfbdc6f9aeb8197.var_fa2c135047e3da22 ]](requestid, var_3dfbdc6f9aeb8197.userdata);
    }
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1e7c
// Size: 0xd2
function private function_af598d8abc9720f0(zoneindex) {
    var_b1896ddca0a71358 = function_77d0cd5fdd5e6ba7(zoneindex);
    foreach (var_9dd1fe3f989cb73b in var_b1896ddca0a71358) {
        checkpoint = var_9dd1fe3f989cb73b.midpoint + (0, 0, 100);
        if (isdefined(level.var_8241e0d86017df29)) {
            difficulty = [[ level.var_8241e0d86017df29 ]](checkpoint);
        } else {
            difficulty = "difficulty_easy";
        }
        function_7aea2e7a0f6e31d7(zoneindex, var_9dd1fe3f989cb73b.var_6a8f12dbbc271cb1, difficulty, level.outofboundstriggers);
    }
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1f55
// Size: 0x95
function private function_42d34b1d7f4a3f2d(callbackname, requestid, var_fa2c135047e3da22, userdata) {
    if (!isdefined(requestid) || !isdefined(level.var_f3a4ecd257a6ca36[requestid])) {
        /#
            assertmsg("AI Spawn Director: Invalid spawn request ID specified adding callback: " + callbackname);
        #/
        return;
    }
    if (isdefined(var_fa2c135047e3da22)) {
        level.var_f3a4ecd257a6ca36[requestid][callbackname] = spawnstruct();
        level.var_f3a4ecd257a6ca36[requestid][callbackname].var_fa2c135047e3da22 = var_fa2c135047e3da22;
        level.var_f3a4ecd257a6ca36[requestid][callbackname].userdata = userdata;
    }
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x1ff1
// Size: 0x44
function private function_8c8ae740367137ba(callbackname, requestid) {
    if (isdefined(level.var_f3a4ecd257a6ca36[requestid]) && isdefined(level.var_f3a4ecd257a6ca36[requestid][callbackname])) {
        return level.var_f3a4ecd257a6ca36[requestid][callbackname];
    }
    return undefined;
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x203d
// Size: 0x78
function function_930897c0d1a7eb24(targetname) {
    /#
        assertex(getdvarint(@"hash_2e4907ccd20a8761", 0) == 1, "Dvar sv_ai_spawn_director_enabled must be set to 1 to use AI Spawn Director.");
    #/
    /#
        assertex(isdefined(level.var_3ae5f7de11d142f), "ai_spawn_director::director_init must be called before using the AISpawnDirector.");
    #/
    requestid = function_941528a2553e5d82(targetname);
    if (isdefined(requestid) && !isdefined(level.var_f3a4ecd257a6ca36[requestid])) {
        level.var_f3a4ecd257a6ca36[requestid] = [];
    }
    return requestid;
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x20bd
// Size: 0xbd
function function_1ceed24d075a0981(targetname) {
    /#
        assertex(getdvarint(@"hash_2e4907ccd20a8761", 0) == 1, "Dvar sv_ai_spawn_director_enabled must be set to 1 to use AI Spawn Director.");
    #/
    /#
        assertex(isdefined(level.var_3ae5f7de11d142f), "ai_spawn_director::director_init must be called before using the AISpawnDirector.");
    #/
    var_5c22fbf7730e5ad8 = function_567f58cf5188db4a(targetname);
    foreach (requestid in var_5c22fbf7730e5ad8) {
        if (isdefined(requestid) && !isdefined(level.var_f3a4ecd257a6ca36[requestid])) {
            level.var_f3a4ecd257a6ca36[requestid] = [];
        }
    }
    return var_5c22fbf7730e5ad8;
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2182
// Size: 0x30
function function_e4a440552e4cf1f4(var_fa2c135047e3da22) {
    /#
        assert(isdefined(var_fa2c135047e3da22));
    #/
    level.var_49918a00761930d4 = function_6d6af8144a5131f1(level.var_49918a00761930d4, var_fa2c135047e3da22);
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x21b9
// Size: 0x30
function function_3b0c50c1a94a9d77(var_fa2c135047e3da22) {
    /#
        assert(isdefined(var_fa2c135047e3da22));
    #/
    level.var_49918a00761930d4 = array_remove(level.var_49918a00761930d4, var_fa2c135047e3da22);
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21f0
// Size: 0x2b
function function_f0cc0f2e6e1d085e(requestid, var_fa2c135047e3da22, userdata) {
    function_42d34b1d7f4a3f2d("ReadyToSpawn", requestid, var_fa2c135047e3da22, userdata);
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2222
// Size: 0x2b
function function_e4a67fe4ddca7ed5(requestid, var_fa2c135047e3da22, userdata) {
    function_42d34b1d7f4a3f2d("OnSpawned", requestid, var_fa2c135047e3da22, userdata);
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2254
// Size: 0x2b
function function_9aa732b22b08a6dc(requestid, var_fa2c135047e3da22, userdata) {
    function_42d34b1d7f4a3f2d("OnVehicleSpawned", requestid, var_fa2c135047e3da22, userdata);
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2286
// Size: 0x2b
function function_11f03fd3165d148f(requestid, var_fa2c135047e3da22, userdata) {
    function_42d34b1d7f4a3f2d("OnUnloaded", requestid, var_fa2c135047e3da22, userdata);
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22b8
// Size: 0x2b
function function_7a2920be35f4386(requestid, var_fa2c135047e3da22, userdata) {
    function_42d34b1d7f4a3f2d("ShouldReinforce", requestid, var_fa2c135047e3da22, userdata);
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22ea
// Size: 0x2b
function function_6e43cc397b953a97(requestid, var_fa2c135047e3da22, userdata) {
    function_42d34b1d7f4a3f2d("SpawnReinforcements", requestid, var_fa2c135047e3da22, userdata);
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x231c
// Size: 0x2b
function function_f81b7c3f18ef98be(requestid, var_fa2c135047e3da22, userdata) {
    function_42d34b1d7f4a3f2d("FinishedSpawningBucket", requestid, var_fa2c135047e3da22, userdata);
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x234e
// Size: 0x96
function function_54da428ad4a96f2e(var_52acc86bf2482c55, origin, radius, enabled, readytospawn, var_56698d2cf6041d4f) {
    /#
        assert(level.var_4fe0c43951f6ce37);
    #/
    /#
        assertex(isdefined(getscriptbundle(var_52acc86bf2482c55)), "Encounter script bundle not loaded: " + function_3c8848a3a11b2553(var_52acc86bf2482c55));
    #/
    if (!isdefined(var_56698d2cf6041d4f)) {
        var_56698d2cf6041d4f = 0;
    }
    requestid = function_148fd200d203457a(var_52acc86bf2482c55, origin, radius, enabled, readytospawn, var_56698d2cf6041d4f);
    if (isdefined(requestid)) {
        level.var_f3a4ecd257a6ca36[requestid] = [];
    }
    return requestid;
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x23ec
// Size: 0x2e
function function_9950e6e485bf5261(requestid, shouldrespawn) {
    /#
        assert(level.var_4fe0c43951f6ce37);
    #/
    function_22993fe73b6d16f4(requestid, shouldrespawn);
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2421
// Size: 0x2e
function function_f8c9e05192380dab(requestid, var_b887664bfe3024ad) {
    /#
        assert(level.var_4fe0c43951f6ce37);
    #/
    function_772b9990dd5ce643(requestid, var_b887664bfe3024ad);
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2456
// Size: 0x4b
function function_d1403c6bc24e9f90(var_ec40db8a0681e260) {
    if (!isdefined(level.var_15808c6e81c877bb)) {
        level.var_15808c6e81c877bb = [];
    }
    numflags = level.var_15808c6e81c877bb.size;
    level.var_15808c6e81c877bb[numflags] = var_ec40db8a0681e260 + "_completed";
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x24a8
// Size: 0x67d
function function_b1fa4578ef08136f() {
    if (isdefined(level.var_15808c6e81c877bb)) {
        foreach (var_ec40db8a0681e260 in level.var_15808c6e81c877bb) {
            flag_wait(var_ec40db8a0681e260);
        }
        level.var_15808c6e81c877bb = [];
    }
    interactions = getstructarray("info_act", "script_noteworthy");
    var_e5e18a333155aa27 = [];
    foreach (interaction in interactions) {
        if (!isdefined(interaction.var_a08a688d1bb7102c)) {
            continue;
        }
        var_f8d4ed108521e632 = function_72066aa981916ecc(interaction.var_a08a688d1bb7102c, interaction.origin, interaction.angles);
        if (isdefined(interaction.targetname)) {
            var_e5e18a333155aa27[interaction.targetname] = var_f8d4ed108521e632;
        }
        function_c300d48d8ca0ef3e(var_f8d4ed108521e632, interaction.origin);
    }
    var_3b8327736f213d0c = getstructarray("ai_encounter_patrol_point", "script_noteworthy");
    foreach (point in var_3b8327736f213d0c) {
        if (isdefined(point.move_speed)) {
            point.move_speed = float(point.move_speed);
        }
        if (isdefined(point.var_acaed5eee748b3f)) {
            point.var_acaed5eee748b3f = float(point.var_acaed5eee748b3f);
        }
        if (isdefined(point.max_wait_time)) {
            point.max_wait_time = float(point.max_wait_time);
        }
        point.start_point = isdefined(point.start_point) && point.start_point == "1";
        point.var_559d06b2b63ab973 = isdefined(point.var_559d06b2b63ab973) && point.var_559d06b2b63ab973 == "1";
        point.var_15ad302a46e35b2d = isdefined(point.var_15ad302a46e35b2d) && point.var_15ad302a46e35b2d == "1";
        if (isdefined(point.var_8e71cc2e3851e67c) && isdefined(var_e5e18a333155aa27[point.var_8e71cc2e3851e67c])) {
            point.var_8e71cc2e3851e67c = var_e5e18a333155aa27[point.var_8e71cc2e3851e67c];
        } else {
            point.var_8e71cc2e3851e67c = undefined;
        }
        if (isdefined(point.var_912df596f9f4417f)) {
            point.var_912df596f9f4417f = int(point.var_912df596f9f4417f);
        }
        function_e90fe6b075bfaa6d(point);
    }
    var_cb06c3bd5d85b28b = getstructarray("ai_encounter_parachute_start", "script_noteworthy");
    spawnpoints = getstructarray("ai_encounter_spawnpoint", "script_noteworthy");
    foreach (point in spawnpoints) {
        if (isdefined(point.var_e5decd57d2e1579)) {
            point.var_e5decd57d2e1579 = float(point.var_e5decd57d2e1579);
        } else {
            point.var_e5decd57d2e1579 = 5000;
        }
        point.var_5b343bb05d2d705c = isdefined(point.var_5b343bb05d2d705c) && point.var_5b343bb05d2d705c == "1";
        point.var_b7e219e11a65284e = isdefined(point.var_b7e219e11a65284e) && point.var_b7e219e11a65284e == "1";
        point.var_8e1f9e34e23e8a5c = isdefined(point.var_8e1f9e34e23e8a5c) && point.var_8e1f9e34e23e8a5c == "1";
        if (isdefined(point.script_stealthgroup) && point.script_stealthgroup == "-1") {
            point.script_stealthgroup = undefined;
        }
        point.var_f0b3e079ef68d755 = isdefined(point.var_f0b3e079ef68d755) && point.var_f0b3e079ef68d755 == "1";
        if (point.var_f0b3e079ef68d755 && isdefined(point.targetname)) {
            foreach (var_b1c398736a7d5d4e in var_cb06c3bd5d85b28b) {
                if (isdefined(var_b1c398736a7d5d4e.target) && var_b1c398736a7d5d4e.target == point.targetname) {
                    point.var_35b7f8cbbef2653a = (var_b1c398736a7d5d4e.origin[0], var_b1c398736a7d5d4e.origin[1], var_b1c398736a7d5d4e.origin[2] + point.var_e5decd57d2e1579);
                }
            }
        }
        if (isdefined(point.var_8e71cc2e3851e67c) && isdefined(var_e5e18a333155aa27[point.var_8e71cc2e3851e67c])) {
            point.var_8e71cc2e3851e67c = var_e5e18a333155aa27[point.var_8e71cc2e3851e67c];
        } else {
            point.var_8e71cc2e3851e67c = undefined;
        }
        function_ff46e79c8c7a21c8(point);
    }
    if (getdvarint(@"hash_6c2c138ca17a4631", 1) == 1) {
        thread function_ee6aae70a767d1ea();
    }
    if (getdvarint(@"hash_2f3e35c3ad3a0cf7", 0)) {
        thread function_7d9366588f25dd69();
    } else {
        function_9b8829ab4092a7d7("ob_zombie_encounter_dense", 1);
    }
    if (getdvarint(@"hash_4ccbbd355da5f0d", 0) == 1) {
        function_9b8829ab4092a7d7("ob_zombie_ambient_waves", 1);
    }
    if (getdvarint(@"hash_f18d38bec046c7d1", 1) == 1) {
        function_9b8829ab4092a7d7("ai_spawn_director_dynamic_ambient_specials", 1);
    }
    function_6473f11b4d8d79e0();
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2b2c
// Size: 0x54
function private function_ee6aae70a767d1ea() {
    var_95ef962d90c4d920 = getdvarint(@"hash_59839a5de33b3ef6", 50);
    function_57345744ffb049e9("script_noteworthy", "ai_encounter_patrol_point", var_95ef962d90c4d920);
    function_57345744ffb049e9("script_noteworthy", "ai_encounter_parachute_start", var_95ef962d90c4d920);
    function_57345744ffb049e9("script_noteworthy", "ai_encounter_spawnpoint", var_95ef962d90c4d920);
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x2b87
// Size: 0x182
function private function_57345744ffb049e9(type, var_3a436bd812a2b86, var_98cfcdbee7100d1) {
    waitframe();
    structs = level.struct_class_names[type][var_3a436bd812a2b86];
    if (!isdefined(structs) || !isarray(structs)) {
        return;
    }
    var_ddde51424987b5fc = 0;
    foreach (struct in structs) {
        if (isdefined(struct.targetname)) {
            level.struct_class_names["targetname"][struct.targetname] = [];
        }
        if (isdefined(struct.target)) {
            level.struct_class_names["target"][struct.target] = [];
        }
        if (isdefined(struct.script_noteworthy)) {
            level.struct_class_names["script_noteworthy"][struct.script_noteworthy] = [];
        }
        if (isdefined(struct.script_linkname)) {
            level.struct_class_names["script_linkname"][struct.script_linkname] = [];
        }
        if (isdefined(struct.variantname)) {
            level.struct_class_names["variantname"][struct.variantname] = [];
        }
        var_ddde51424987b5fc++;
        if (var_ddde51424987b5fc >= var_98cfcdbee7100d1) {
            waitframe();
            var_ddde51424987b5fc = 0;
        }
    }
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x2d10
// Size: 0xa72
function private function_8f2b1c474a144a75() {
    /#
        wait(3);
        function_c5b8afd6e0f364ee("Missing script should spawn flood fill callback for requestID: ", "script_noteworthy");
        waitframe();
        function_c5b8afd6e0f364ee("log_on_despawn", "automaticFastTopspeedFraction");
        waitframe();
        adddebugcommand("<unknown string>");
        waitframe();
        adddebugcommand("<unknown string>");
        waitframe();
        adddebugcommand("<unknown string>");
        waitframe();
        adddebugcommand("<unknown string>");
        waitframe();
        adddebugcommand("<unknown string>");
        waitframe();
        adddebugcommand("<unknown string>");
        waitframe();
        adddebugcommand("<unknown string>");
        waitframe();
        adddebugcommand("<unknown string>");
        waitframe();
        adddebugcommand("<unknown string>");
        waitframe();
        var_9b6c6ae0837e6cae = [0:[0:"<unknown string>", 1:"<unknown string>", 2:"<unknown string>"], 1:[0:"<unknown string>", 1:"<unknown string>", 2:"<unknown string>"], 2:[0:"<unknown string>", 1:"<unknown string>", 2:"<unknown string>"], 3:[0:"<unknown string>", 1:"<unknown string>", 2:"<unknown string>"], 4:[0:"<unknown string>", 1:"<unknown string>", 2:"<unknown string>"], 5:[0:"<unknown string>", 1:"<unknown string>", 2:"<unknown string>"], 6:[0:"<unknown string>", 1:"<unknown string>", 2:"<unknown string>"], 7:[0:"<unknown string>", 1:"<unknown string>", 2:"<unknown string>"], 8:[0:"<unknown string>", 1:"<unknown string>", 2:"<unknown string>"], 9:[0:"<unknown string>", 1:"<unknown string>", 2:"<unknown string>"], 10:[0:"<unknown string>", 1:"<unknown string>", 2:"<unknown string>"], 11:[0:"<unknown string>", 1:"<unknown string>", 2:"<unknown string>"], 12:[0:"<unknown string>", 1:"<unknown string>", 2:"<unknown string>"], 13:[0:"<unknown string>", 1:"<unknown string>", 2:"<unknown string>"], 14:[0:"<unknown string>", 1:"<unknown string>", 2:"<unknown string>"], 15:[0:"<unknown string>", 1:"<unknown string>", 2:"<unknown string>"], 16:[0:"<unknown string>", 1:"<unknown string>", 2:"<unknown string>"], 17:[0:"<unknown string>", 1:"<unknown string>", 2:"<unknown string>"], 18:[0:"<unknown string>", 1:"<unknown string>", 2:"<unknown string>"], 19:[0:"<unknown string>", 1:"<unknown string>", 2:"<unknown string>"]];
        foreach (test_name in var_9b6c6ae0837e6cae) {
            var_6874af4f6c91c92f = "<unknown string>" + test_name[0] + "<unknown string>" + test_name[1] + "<unknown string>" + test_name[2] + "<unknown string>";
            adddebugcommand(var_6874af4f6c91c92f);
        }
        var_4144abe894cedd9d = [];
        while (1) {
            if (getdvarint(@"hash_c2967f1425f47dcf", 0) == 1) {
                foreach (requestid in var_4144abe894cedd9d) {
                    function_9950e6e485bf5261(requestid);
                }
                var_4144abe894cedd9d = [];
                setdvar(@"hash_c2967f1425f47dcf", 0);
            }
            bundlename = getdvar(@"hash_338fd6962a58ef94", "<unknown string>");
            if (isdefined(bundlename) && bundlename != "<unknown string>" && isalive(level.players[0])) {
                var_477e0ae988a1a893 = function_2ef675c13ca1c4af(%"ai_encounter:", bundlename);
                requestid = function_54da428ad4a96f2e(var_477e0ae988a1a893, level.players[0].origin, 1000, 1, 1);
                var_4144abe894cedd9d = array_add(var_4144abe894cedd9d, requestid);
            }
            setdvar(@"hash_338fd6962a58ef94", "<unknown string>");
            bundlename = getdvar(@"hash_92614d6e09af2f0", "<unknown string>");
            if (isdefined(bundlename) && bundlename != "<unknown string>" && isalive(level.players[0])) {
                var_477e0ae988a1a893 = function_2ef675c13ca1c4af(%"ai_flood_fill_encounter:", bundlename);
                requestid = function_54da428ad4a96f2e(var_477e0ae988a1a893, level.players[0].origin, 1000, 1, 1);
                var_4144abe894cedd9d = array_add(var_4144abe894cedd9d, requestid);
            }
            setdvar(@"hash_92614d6e09af2f0", "<unknown string>");
            tagname = getdvar(@"hash_cb77d3c82e353f1d", "<unknown string>");
            if (isdefined(tagname) && tagname != "<unknown string>") {
                function_9b8829ab4092a7d7(tagname, 1);
                setdvar(@"hash_cb77d3c82e353f1d", "<unknown string>");
            }
            tagname = getdvar(@"hash_648b265962adac34", "<unknown string>");
            if (isdefined(tagname) && tagname != "<unknown string>") {
                function_9b8829ab4092a7d7(tagname, 0);
                setdvar(@"hash_648b265962adac34", "<unknown string>");
            }
            if (getdvarint(@"hash_7560a9c3d8fb8030", 0) == 1) {
                if (isdefined(level.players[0])) {
                    function_606642b946a01237("<unknown string>", level.players[0].origin, 2000);
                }
                setdvar(@"hash_7560a9c3d8fb8030", 0);
            }
            if (getdvarint(@"hash_a9bfe570a4470e77", 0) == 1) {
                if (isdefined(level.players[0])) {
                    function_c7311cb3f768f21e("<unknown string>");
                }
                setdvar(@"hash_a9bfe570a4470e77", 0);
            }
            if (getdvarint(@"hash_b887180c55479401", 0) == 1) {
                var_998be083dda4ba35 = 0;
                encounters = function_46ded7ce925b0c64(0, 1);
                foreach (encounter in encounters) {
                    data = function_9a39e23c3c52c2af(encounter);
                    if (data.status != 1) {
                        function_2169641d6a403864(encounter);
                        iprintlnbold("<unknown string>" + encounter + "<unknown string>");
                    }
                }
                if (!var_998be083dda4ba35) {
                    iprintlnbold("<unknown string>");
                }
                setdvar(@"hash_b887180c55479401", 0);
            }
            if (getdvarint(@"hash_5052dcf9e0cb4ce1", 0) == 1) {
                if (isdefined(level.players[0])) {
                    zoneindex = function_b439f805f07ff50(level.players[0].origin);
                    function_df12bc7ed6efed1f(zoneindex);
                }
                setdvar(@"hash_5052dcf9e0cb4ce1", 0);
            }
            if (getdvarint(@"hash_e1ca0daaa71ada82", 0) == 1) {
                if (isdefined(level.players[0])) {
                    var_9dd1fe3f989cb73b = function_2ee25a0fa15c04ce(level.players[0].origin);
                    if (isdefined(var_9dd1fe3f989cb73b)) {
                        function_1d5039979534caef(var_9dd1fe3f989cb73b.zoneindex, var_9dd1fe3f989cb73b.var_6a8f12dbbc271cb1, !var_9dd1fe3f989cb73b.enabled);
                    }
                }
                setdvar(@"hash_e1ca0daaa71ada82", 0);
            }
            settag = getdvar(@"hash_6c37cbeecb7d7215", "<unknown string>");
            if (isdefined(settag) && settag != "<unknown string>") {
                var_9dd1fe3f989cb73b = function_2ee25a0fa15c04ce(level.players[0].origin);
                if (isdefined(var_9dd1fe3f989cb73b)) {
                    function_811e2ea8528614ba(var_9dd1fe3f989cb73b.zoneindex, var_9dd1fe3f989cb73b.var_6a8f12dbbc271cb1, settag, 1);
                }
                setdvar(@"hash_6c37cbeecb7d7215", "<unknown string>");
            }
            var_2f6ddfa562ab0b96 = getdvar(@"hash_226b7063f48ab77a", "<unknown string>");
            if (isdefined(var_2f6ddfa562ab0b96) && var_2f6ddfa562ab0b96 != "<unknown string>") {
                var_9dd1fe3f989cb73b = function_2ee25a0fa15c04ce(level.players[0].origin);
                if (isdefined(var_9dd1fe3f989cb73b)) {
                    function_811e2ea8528614ba(var_9dd1fe3f989cb73b.zoneindex, var_9dd1fe3f989cb73b.var_6a8f12dbbc271cb1, var_2f6ddfa562ab0b96, 0);
                }
                setdvar(@"hash_226b7063f48ab77a", "<unknown string>");
            }
            test_name = getdvar(@"hash_25688c988df289c3", "<unknown string>");
            if (test_name != "<unknown string>") {
                thread function_697246e491b82b(test_name);
                setdvar(@"hash_25688c988df289c3", "<unknown string>");
            }
            var_90284334e00894ac = getdvar(@"hash_76a02dcfeaf85e8a", "<unknown string>");
            if (var_90284334e00894ac != "<unknown string>") {
                thread function_b6206c1c64860991(var_90284334e00894ac);
                setdvar(@"hash_76a02dcfeaf85e8a", "<unknown string>");
            }
            if (getdvarint(@"hash_b8cb86dbb04715e2", 0) == 1) {
                function_9b8829ab4092a7d7("<unknown string>", 1);
                function_9b8829ab4092a7d7("<unknown string>", 0);
                setdvar(@"hash_19f0eb1fd6a2f87d", 1);
                setdvar(@"hash_b8cb86dbb04715e2", 0);
            }
            if (getdvarint(@"hash_48e36b0fa33ce48f", 0) == 1) {
                function_9b8829ab4092a7d7("<unknown string>", 0);
                function_9b8829ab4092a7d7("<unknown string>", 1);
                setdvar(@"hash_19f0eb1fd6a2f87d", 1);
                setdvar(@"hash_48e36b0fa33ce48f", 0);
            }
            waitframe();
        }
    #/
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x3789
// Size: 0x55
function private function_c4ab5ef0be46aef4() {
    /#
        var_97eb69973188dca6 = getdvarint(@"hash_37edd5a66bd29f3d", 0);
        while (1) {
            wait(2);
            var_e981678024e3f605 = getdvarint(@"hash_37edd5a66bd29f3d", 0);
            if (var_e981678024e3f605 != var_97eb69973188dca6) {
                var_97eb69973188dca6 = var_e981678024e3f605;
                function_ed0e325da04fc842();
            }
        }
    #/
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x37e5
// Size: 0xdf
function private function_c5b8afd6e0f364ee(var_2cd4ce4a1e0c3ad9, dvarname) {
    /#
        var_2fb2947eb2d22b23 = getscriptbundlenames(var_2cd4ce4a1e0c3ad9);
        foreach (bundlename in var_2fb2947eb2d22b23) {
            var_44b100824c8ff25b = function_3c8848a3a11b2553(bundlename);
            array = strtok(var_44b100824c8ff25b, "<unknown string>");
            if (!isdefined(array) || !isdefined(array[1])) {
                continue;
            }
            var_821d5f6c8c98786a = "<unknown string>" + array[1] + "<unknown string>" + dvarname + "<unknown string>" + array[1] + "<unknown string>";
            adddebugcommand(var_821d5f6c8c98786a);
            waitframe();
        }
    #/
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x38cb
// Size: 0x28
function function_9711795c6c786e25(var_4e13896873e39749, var_6a0af22f6522e5ff) {
    level.var_cc820bcf92b48c63 = var_4e13896873e39749;
    level.var_286c41fbbcdf9443 = var_6a0af22f6522e5ff;
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x38fa
// Size: 0x33b
function private function_7d9366588f25dd69() {
    flag_wait("ai_spawn_director_initialized");
    waitframe();
    var_7fa76ef2f579a26e = getstructarray("ai_biome_struct", "targetname");
    if (!isdefined(level.var_cc820bcf92b48c63)) {
        level.var_cc820bcf92b48c63 = "";
    }
    if (!isdefined(level.var_286c41fbbcdf9443)) {
        level.var_286c41fbbcdf9443 = "";
    }
    zones = function_5f65de24f04894e5();
    foreach (var_eb5b2cc7fed27ecf in var_7fa76ef2f579a26e) {
        if (isdefined(var_eb5b2cc7fed27ecf.radius) && isdefined(var_eb5b2cc7fed27ecf.script_noteworthy)) {
            var_8c191d2295692b81 = function_edaf361096c5af0c(var_eb5b2cc7fed27ecf.origin, var_eb5b2cc7fed27ecf.radius);
            foreach (zone in var_8c191d2295692b81) {
                function_17ab0ca84f195c18(zone.zoneindex, level.var_cc820bcf92b48c63 + var_eb5b2cc7fed27ecf.script_noteworthy, 1);
            }
            var_962cdfb453fc2a21 = function_6aa08c3e29cd1452(var_eb5b2cc7fed27ecf.origin, var_eb5b2cc7fed27ecf.radius);
            foreach (var_9dd1fe3f989cb73b in var_962cdfb453fc2a21) {
                function_811e2ea8528614ba(var_9dd1fe3f989cb73b.zoneindex, var_9dd1fe3f989cb73b.var_6a8f12dbbc271cb1, level.var_286c41fbbcdf9443 + var_eb5b2cc7fed27ecf.script_noteworthy, 1);
            }
        }
    }
    foreach (zone in zones) {
        if (!function_e099a75eb1edfe00(zone.zoneindex, level.var_cc820bcf92b48c63 + "dense")) {
            function_17ab0ca84f195c18(zone.zoneindex, level.var_cc820bcf92b48c63 + "light", 1);
        }
        var_f5b3d155392eb79 = function_77d0cd5fdd5e6ba7(zone.zoneindex);
        foreach (var_9dd1fe3f989cb73b in var_f5b3d155392eb79) {
            if (!function_3f99c64efa5996b2(var_9dd1fe3f989cb73b.zoneindex, var_9dd1fe3f989cb73b.var_6a8f12dbbc271cb1, level.var_286c41fbbcdf9443 + "dense")) {
                function_811e2ea8528614ba(var_9dd1fe3f989cb73b.zoneindex, var_9dd1fe3f989cb73b.var_6a8f12dbbc271cb1, level.var_286c41fbbcdf9443 + "light", 1);
            }
        }
    }
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c3c
// Size: 0x17d
function function_ed0e325da04fc842(params) {
    flag_wait("ai_spawn_director_initialized");
    if (isdefined(level.var_8241e0d86017df29)) {
        zones = function_5f65de24f04894e5();
        foreach (zone in zones) {
            checkpoint = zone.midpoint + (0, 0, 100);
            difficulty = [[ level.var_8241e0d86017df29 ]](checkpoint);
            function_83f909d5406f69(zone.zoneindex, difficulty);
            if (getdvarint(@"hash_3e3abf5eda87eba6", 0) == 1) {
                /#
                    assert(isdefined(level.var_c092c207acdfa48));
                #/
                region = [[ level.var_c092c207acdfa48 ]](checkpoint);
                if (isdefined(region)) {
                    function_17ab0ca84f195c18(zone.zoneindex, region, 1);
                }
            }
        }
    } else {
        zones = function_5f65de24f04894e5();
        foreach (zone in zones) {
            function_83f909d5406f69(zone.zoneindex, "difficulty_easy");
        }
    }
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3dc0
// Size: 0x35
function private function_fd97a081c69bff85() {
    if (getdvarint(@"hash_72e4d77ae8f73875", 0) == 1 && isdefined(level.outofboundstriggers)) {
        function_861eb379dee38144(level.outofboundstriggers);
    }
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3dfc
// Size: 0xac
function private function_eae524b041923b20() {
    wait(1);
    while (1) {
        settag = getdvar(@"hash_c1b168fb1d959c2f", "");
        if (isdefined(settag) && settag != "") {
            function_9b8829ab4092a7d7(settag, 1);
            setdvar(@"hash_c1b168fb1d959c2f", "");
        }
        var_2f6ddfa562ab0b96 = getdvar(@"hash_91f3192aa5d2ec6c", "");
        if (isdefined(var_2f6ddfa562ab0b96) && var_2f6ddfa562ab0b96 != "") {
            function_9b8829ab4092a7d7(var_2f6ddfa562ab0b96, 0);
            setdvar(@"hash_91f3192aa5d2ec6c", "");
        }
        wait(1);
    }
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3eaf
// Size: 0x115
function private function_c7864239c3106370() {
    if (isdefined(level.var_3ae5f7de11d142f)) {
        return;
    }
    /#
        assertex(getdvarint(@"hash_2e4907ccd20a8761", 0) == 1, "Dvar sv_ai_spawn_director_enabled must be set to 1 to use AI Spawn Director.");
    #/
    level.var_3ae5f7de11d142f = &function_cf12cd77ab7cdc78;
    level.var_4fe0c43951f6ce37 = getdvarint(@"hash_2e4907ccd20a8761", 0);
    level.var_f3a4ecd257a6ca36 = [];
    level.var_bb30af111a46c7a3 = [];
    if (!isdefined(level.var_49918a00761930d4)) {
        level.var_49918a00761930d4 = [];
    }
    level.var_8cd784cab6ecbb43 = [];
    level.var_817d6578a64e573a = [];
    level.var_ec14cbfd51136cd4 = [];
    level callback::add("region_difficulties_registered", &function_ed0e325da04fc842);
    thread function_241474007dc5c94a();
    thread function_eae524b041923b20();
    thread function_ed0e325da04fc842();
    function_fd97a081c69bff85();
    namespace_68d1bc1bac7da538::init_vehicles();
    /#
        if (getdvarint(@"hash_c86f4f2f2cea3cdc", 1) == 1) {
            level thread function_8f2b1c474a144a75();
        }
        level thread function_c4ab5ef0be46aef4();
    #/
    function_cf029a96f28eb230();
    flag_set("ai_spawn_director_initialized");
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fcb
// Size: 0xb
function function_daa39d0822248e1c() {
    thread function_c7864239c3106370();
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x3fdd
// Size: 0x1c6
function private function_73c107f115e49567(agent, radius, var_c154e6e386654a30, origin) {
    var_2ae805b43221a762 = origin;
    if (isagent(agent) && !isdefined(origin)) {
        var_2ae805b43221a762 = agent.origin;
    }
    if (!isdefined(radius)) {
        radius = 100;
    }
    if (!isdefined(var_c154e6e386654a30) || var_c154e6e386654a30 <= 0) {
        var_c154e6e386654a30 = 50;
    }
    agent endon("death");
    agent endon("stealth_investigate");
    agent endon("stealth_hunt");
    agent endon("stealth_combat");
    agent endon("startCombatRush");
    wait(1);
    if (isdefined(origin) && distance2dsquared(origin, agent.origin) > 4096) {
        _setgoalpos(origin, 32, 1);
        agent waittill("goal");
    }
    originalorigin = agent.origin;
    min = radius - var_c154e6e386654a30;
    max = radius + var_c154e6e386654a30;
    while (1) {
        var_bcfec646853a95c1 = randomfloatrange(min, max) * namespace_3c37cb17ade254d::ter_op(randomint(100) > 50, 1, -1);
        var_bcfec546853a938e = randomfloatrange(min, max) * namespace_3c37cb17ade254d::ter_op(randomint(100) > 50, 1, -1);
        var_b30a6c38cd4fe517 = (originalorigin[0] + var_bcfec646853a95c1, originalorigin[1] + var_bcfec546853a938e, originalorigin[2]);
        if (distance2d(agent.origin, var_b30a6c38cd4fe517) > 20) {
            agent _setgoalpos(var_b30a6c38cd4fe517, 8);
            agent thread function_d3ef6a4415f8a5e4(agent);
            agent waittill_any_2("goal", "refreshGoalPos");
        }
        wait(randomfloatrange(4.5, 5.5));
    }
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x41aa
// Size: 0xb4
function private _setgoalpos(origin, goalradius, var_1b6352ceb9bbc1d, var_ae3b556b0d3cd2a7) {
    if (!isdefined(var_ae3b556b0d3cd2a7)) {
        var_ae3b556b0d3cd2a7 = 0;
    }
    if (istrue(self.fixednode) || !isalive(self)) {
        return;
    }
    if (!istrue(var_1b6352ceb9bbc1d)) {
        function_c6930ac29fe6ff53(goalradius);
    }
    safeorigin = self getclosestreachablepointonnavmesh(origin, var_ae3b556b0d3cd2a7);
    if (!isdefined(safeorigin)) {
        /#
            println("<unknown string>" + origin);
        #/
        return;
    }
    if (!isdefined(self.origin)) {
        /#
            assertmsg("_SetGoalPos: agent.origin is undefined. Agent has died?");
        #/
        return;
    }
    if (distance2d(self.origin, safeorigin) > 20) {
        self setgoalpos(safeorigin);
    }
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4265
// Size: 0x41
function private function_d3ef6a4415f8a5e4(agent, time) {
    agent endon("goal");
    agent endon("death");
    waittime = 5;
    if (isdefined(time)) {
        waittime = time;
    }
    wait(waittime);
    agent notify("refreshGoalPos");
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x42ad
// Size: 0x31
function private function_c6930ac29fe6ff53(goalradius) {
    if (!isdefined(goalradius)) {
        goalradius = 128;
    }
    self.goalradius = int(goalradius);
    self.var_9ff99cfc426066a2 = goalradius;
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42e5
// Size: 0x19c
function function_618cf23700c29e56(var_764bdb6fe546dacc) {
    if (!isdefined(level.var_bb30af111a46c7a3[var_764bdb6fe546dacc[0].id])) {
        pathstruct = spawnstruct();
        pathstruct.var_765da0dc0411dbbd = [];
        pathstruct.var_765da0dc0411dbbd[pathstruct.var_765da0dc0411dbbd.size] = self;
        pathstruct.patrolpath = var_764bdb6fe546dacc;
        pathstruct.var_508557c68a1cdf96 = var_764bdb6fe546dacc[0].var_508557c68a1cdf96;
        pathstruct.var_60482e24fa2925e8 = var_764bdb6fe546dacc[0].var_60482e24fa2925e8;
        level.var_bb30af111a46c7a3[var_764bdb6fe546dacc[0].id] = pathstruct;
        level thread function_a5c643ecfde39fa(var_764bdb6fe546dacc[0].id, pathstruct);
    } else if (isdefined(level.var_bb30af111a46c7a3[var_764bdb6fe546dacc[0].id]) && level.var_bb30af111a46c7a3[var_764bdb6fe546dacc[0].id].var_765da0dc0411dbbd.size == 0) {
        patrolpath = level.var_bb30af111a46c7a3[var_764bdb6fe546dacc[0].id];
        patrolpath.var_765da0dc0411dbbd[patrolpath.var_765da0dc0411dbbd.size] = self;
        level thread function_a5c643ecfde39fa(var_764bdb6fe546dacc[0].id, patrolpath);
    } else {
        patrolpath = level.var_bb30af111a46c7a3[var_764bdb6fe546dacc[0].id];
        patrolpath.var_765da0dc0411dbbd[patrolpath.var_765da0dc0411dbbd.size] = self;
    }
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4488
// Size: 0x46
function private function_93ae2d91d511dad8(var_764bdb6fe546dacc) {
    level endon("game_ended");
    self endon("death");
    self endon("stealth_investigate");
    self endon("stealth_hunt");
    self endon("stealth_combat");
    self endon("startCombatRush");
    self waittill("bseq_user_deleted");
    function_618cf23700c29e56(var_764bdb6fe546dacc);
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x44d5
// Size: 0x506
function private function_a5c643ecfde39fa(pathindex, pathstruct) {
    level endon("game_ended");
    var_a48cd860f6f87e26 = [];
    patrolpath = pathstruct.patrolpath;
    pathstruct.claimed = 1;
    index = 0;
    var_47ea45f5bcf10fc3 = 1;
    while (1) {
        var_886dfa499937a071 = level.var_bb30af111a46c7a3[pathindex].var_765da0dc0411dbbd;
        point = patrolpath[index].origin;
        foreach (var_6843d82ed42ea7de, agent in var_886dfa499937a071) {
            if (istrue(agent.var_9accf436d7b4c4bc)) {
                continue;
            }
            if (!isdefined(var_a48cd860f6f87e26[var_6843d82ed42ea7de])) {
                agent endon("death");
                agent endon("stealth_investigate");
                agent endon("stealth_hunt");
                agent endon("stealth_combat");
                agent endon("startCombatRush");
                var_a48cd860f6f87e26[var_6843d82ed42ea7de] = agent;
                agent thread function_c2b8e94711be96d9(pathindex);
                agent thread function_78c1585cd1815dac();
            }
            if (var_6843d82ed42ea7de != 0) {
                var_bcfec646853a95c1 = randomfloatrange(30, 31) * namespace_3c37cb17ade254d::ter_op(cointoss(), 1, -1);
                var_bcfec546853a938e = randomfloatrange(30, 31) * namespace_3c37cb17ade254d::ter_op(cointoss(), 1, -1);
                point = (point[0] + var_bcfec646853a95c1, point[1] + var_bcfec546853a938e, point[2]);
            }
            if (isdefined(patrolpath[index].var_ef5a3d5534030add) && patrolpath[index].var_ef5a3d5534030add != -1) {
                if (isdefined(patrolpath[index].script_delay_min) && patrolpath[index].script_delay_min == patrolpath[index].script_delay_max) {
                    if (patrolpath[index].script_delay_min != 0) {
                        patrolpath[index].script_delay = patrolpath[index].script_delay_min;
                    }
                    patrolpath[index].script_delay_min = undefined;
                    patrolpath[index].script_delay_max = undefined;
                }
                agent._blackboard.idlenode = patrolpath[index];
                agent function_ea63241a4d3092c4();
                agent _setgoalpos(function_bbfc94714c82788b(patrolpath[index].var_ef5a3d5534030add), 64);
                agent function_76b3cfb91ef40b3b(patrolpath[index].var_ef5a3d5534030add);
                if (isdefined(patrolpath[index].var_803f2bf203326f29) && istrue(int(patrolpath[index].var_803f2bf203326f29))) {
                    agent.var_9accf436d7b4c4bc = 1;
                }
            } else {
                agent function_ea63241a4d3092c4();
                agent _setgoalpos(point, 64);
            }
            if (istrue(patrolpath[index].var_60cb49eb02dc0850)) {
                agent.var_a41edf45bb0ff97 = patrolpath[index].angles;
            }
            if (var_886dfa499937a071.size > 1 && var_6843d82ed42ea7de == 0) {
                wait(3);
            }
            if (var_886dfa499937a071.size > 1 && var_6843d82ed42ea7de != 0) {
                wait(randomfloatrange(1.5, 2.5));
            }
        }
        var_35ab2dabe0210d0f = 0;
        foreach (var_6843d82ed42ea7de, agent in var_886dfa499937a071) {
            if (!istrue(agent.var_9accf436d7b4c4bc)) {
                var_35ab2dabe0210d0f = 1;
                break;
            }
        }
        if (!var_35ab2dabe0210d0f) {
            break;
        }
        waitframe();
        var_886dfa499937a071[0] waittill_any_2("goal", "bt_goal");
        if (isdefined(var_886dfa499937a071[0] function_92435c7a6ae85c3c())) {
            var_886dfa499937a071[0] waittill("bseq_user_deleted");
        }
        if (patrolpath[index].var_3dc216f2a253c048 < patrolpath[index].var_f042ba4e1f3de84e) {
            wait(randomfloatrange(patrolpath[index].var_3dc216f2a253c048, patrolpath[index].var_f042ba4e1f3de84e));
        } else {
            wait(patrolpath[index].var_3dc216f2a253c048);
        }
        if (var_47ea45f5bcf10fc3) {
            index++;
        } else {
            index--;
        }
        foreach (agent in var_886dfa499937a071) {
            agent.var_a41edf45bb0ff97 = undefined;
        }
        if (!isdefined(patrolpath[index])) {
            if (!pathstruct.var_508557c68a1cdf96 && !pathstruct.var_60482e24fa2925e8) {
                break;
            } else if (pathstruct.var_60482e24fa2925e8) {
                index = 0;
            } else if (var_47ea45f5bcf10fc3) {
                index = int(max(patrolpath.size - 2, 0));
                var_47ea45f5bcf10fc3 = 0;
            } else {
                index = int(min(1, patrolpath.size - 1));
                var_47ea45f5bcf10fc3 = 1;
            }
        }
    }
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x49e2
// Size: 0x36
function private function_78c1585cd1815dac() {
    level endon("game_ended");
    self endon("death");
    waittill_any_4("stealth_investigate", "stealth_hunt", "stealth_combat", "startCombatRush");
    self.var_a41edf45bb0ff97 = undefined;
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4a1f
// Size: 0xd9
function private function_c2b8e94711be96d9(pathindex) {
    self waittill("death");
    foreach (var_6843d82ed42ea7de, agent in level.var_bb30af111a46c7a3[pathindex].var_765da0dc0411dbbd) {
        if (agent == self) {
            level.var_bb30af111a46c7a3[pathindex].var_765da0dc0411dbbd[var_6843d82ed42ea7de] = undefined;
            break;
        }
    }
    if (istrue(level.var_bb30af111a46c7a3[pathindex].claimed) && level.var_bb30af111a46c7a3[pathindex].var_765da0dc0411dbbd.size == 0) {
        level.var_bb30af111a46c7a3[pathindex].claimed = 0;
    }
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4aff
// Size: 0x3d
function private function_57d486c472b67a38(requestid) {
    level endon("game_ended");
    self endon("death");
    if (self.unittype == "soldier") {
        function_7737f4fab89cb380();
    } else {
        function_cdc13899cf352216();
    }
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4b43
// Size: 0x17f
function private function_7737f4fab89cb380() {
    self endon("death");
    /#
        assert(self.unittype == "soldier");
    #/
    while (!function_6183ffe70d4c7348(self)) {
        var_37932bbc0e2fb65a = 0;
        while (isdefined(self.enemy) && isalive(self.enemy) && isplayer(self.enemy) && distancesquared(self.origin, self.enemy.origin) <= 262144) {
            var_37932bbc0e2fb65a = 1;
            self.pathenemyfightdist = 0;
            self.pathenemylookahead = 0;
            self.var_6c18812ecbd3b6ae = 0;
            self setbtgoalradius(2, 256);
            self setbtgoalpos(2, self.enemy.origin);
            wait(5);
        }
        if (var_37932bbc0e2fb65a) {
            continue;
        }
        var_ee52dd34853cc801 = function_f9786c2470082369(self);
        starttime = gettime();
        if (isdefined(var_ee52dd34853cc801)) {
            self setbtgoalpos(2, var_ee52dd34853cc801);
            self setbtgoalradius(2, 256);
            self waittill("bt_goal");
        }
        waittime = getdvarfloat(@"hash_273a7f3e61e64e35", 10);
        var_e22b7ffae3cf831c = (gettime() - starttime) / 1000;
        if (var_e22b7ffae3cf831c < waittime) {
            wait(waittime - var_e22b7ffae3cf831c);
        }
    }
    function_c72639c94e050034();
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4cc9
// Size: 0x43
function private function_1be071105e1ef2a3() {
    self endon("death");
    var_57618c1db32998bc = randomfloatrange(getdvarint(@"hash_96955f67517b7611", 5), getdvarint(@"hash_96b8716751a1e55f", 10));
    wait(var_57618c1db32998bc);
    function_940ac86068aa76eb();
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4d13
// Size: 0x3f
function private function_940ac86068aa76eb() {
    if (isdefined(level.var_4caf3ce302e3487a)) {
        [[ level.var_4caf3ce302e3487a ]]();
    }
    if (self.type == "zombie") {
        function_102e13027f954c28();
    } else {
        function_c72639c94e050034();
    }
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4d59
// Size: 0x56
function private function_c72639c94e050034() {
    /#
        assert(self.type != "zombie");
    #/
    self.nocorpse = 1;
    self.var_7e4b076a06c6df27 = 1;
    self.dropweapon = 0;
    if (istrue(self.magic_bullet_shield)) {
        namespace_6205bc7c5e394598::stop_magic_bullet_shield();
    }
    namespace_14d36171baccf528::despawnagent();
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4db6
// Size: 0xa8
function private function_6710855bea599a1f(var_14746953cdb49874) {
    self endon("death");
    spawnpoint = self.origin;
    maxdistance = var_14746953cdb49874 * getdvarfloat(@"hash_a99b215bdc4d8f7d", 5);
    var_eb88696dc9d8bf3c = maxdistance * maxdistance;
    while (1) {
        wait(randomfloatrange(5, 7));
        if (distancesquared(self.origin, spawnpoint) > var_eb88696dc9d8bf3c) {
            /#
                function_b569203d69d8e9d9("<unknown string>" + self getentitynumber() + "<unknown string>" + self.var_ad46aadd4e3290d7);
            #/
            function_cdc13899cf352216();
        }
    }
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x4e65
// Size: 0x5f
function private function_400c2ac378ef0646() {
    self endon("death");
    if (istrue(self.var_4cbb43e1b94c780e)) {
        return;
    }
    self.var_4cbb43e1b94c780e = 1;
    var_c83686653e74aaa3 = getdvarfloat(@"hash_d31bf82a85c7351", 0);
    while (function_7c093aaec980131b(self.origin) > var_c83686653e74aaa3) {
        waitframe();
    }
    function_102e13027f954c28();
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4ecb
// Size: 0x7e
function private function_cdc13899cf352216() {
    if (function_7c093aaec980131b(self.origin) > getdvarfloat(@"hash_d31bf82a85c7351", 0)) {
        if (istrue(self._blackboard.var_10cd2abcd916837e)) {
            return;
        }
        self notify("despawn");
        if (self asmhasstate(self.asmname, "despawn_in")) {
            self.nocorpse = 1;
            namespace_bf5a1761a8d1bb07::asm_setstate("despawn_in");
            return;
        }
    }
    function_102e13027f954c28();
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4f50
// Size: 0x60
function private function_102e13027f954c28() {
    if (istrue(self.magic_bullet_shield)) {
        namespace_6205bc7c5e394598::stop_magic_bullet_shield();
    }
    if (ent_flag("log_on_despawn")) {
        logstring("AI Director attempting to despawn ent [" + string(self getentitynumber()) + "]");
    }
    self.nocorpse = 1;
    self.var_7e4b076a06c6df27 = 1;
    self kill();
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x4fb7
// Size: 0x147
function private function_2d225c8fbea7ed93(requestid, var_cf41a8a0e5c72c2b) {
    level endon("game_ended");
    self endon("death");
    self waittill("reached_end_node");
    self function_65aa053c077c003a(1);
    self function_77320e794d35465a("p2p", "manualSpeed", mph_to_ips(0));
    self vehicle_setspeedimmediate(0, 1, 1);
    self vehicle_cleardrivingstate();
    riders = self.riders;
    foreach (rider in self.riders) {
        rider thread function_fe875eadc4fcf2c2(requestid, var_cf41a8a0e5c72c2b);
    }
    namespace_b479ac682b93cd92::_vehicle_unload("default");
    if (namespace_4ff41449ab14a3a0::riders_unloadable("default")) {
        self waittill("unloaded");
    }
    if (self function_1e8542a707a8002("p2p")) {
        self function_6a325f91941ed47c("p2p");
    }
    if (self function_1e8542a707a8002("path")) {
        self function_6a325f91941ed47c("path");
    }
    self function_65aa053c077c003a(0);
    self function_9cab25983e27246();
    self setscriptablepartstate("single", "vehicle_use");
    function_ad0d4e47324849b3(requestid);
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5105
// Size: 0x4a
function private function_718e622bef6f4a9c(requestid) {
    level endon("game_ended");
    entnum = self getentitynumber();
    meansofdeath = attacker = self waittill("death");
    function_ef3a0e9600008e7e(requestid, entnum);
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5156
// Size: 0x2f
function private function_63a4b48c6e425420(requestid) {
    level endon("game_ended");
    self endon("death");
    self waittill("vehicle_owner_update");
    function_ef3a0e9600008e7e(requestid, self getentitynumber());
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x518c
// Size: 0x8d
function private function_fe875eadc4fcf2c2(requestid, var_cf41a8a0e5c72c2b) {
    self endon("death");
    self waittill("unload");
    if (flag("stealth_enabled") && isdefined(self.stealth) && istrue(self.stealth_enabled)) {
        self setstealthstate("combat");
    }
    if (!isdefined(var_cf41a8a0e5c72c2b)) {
        var_cf41a8a0e5c72c2b = self.origin;
    }
    _setgoalpos(var_cf41a8a0e5c72c2b, 512);
    function_2d85286f9e48645b(requestid);
    thread function_afe6d55c6ab3cd13(self.var_4430054bc89ecef8);
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5220
// Size: 0x1c
function private function_2d3a114748311c18() {
    self endon("death");
    self waittill("loaded");
    self.var_f327ed481efe4857 = undefined;
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5243
// Size: 0xb1
function private function_233f4ebb97f71baa(var_9db895413571de79) {
    result = undefined;
    var_63476d6ba4054b11 = getvehiclenode(var_9db895413571de79);
    if (isdefined(var_63476d6ba4054b11)) {
        pathnodes = [];
        pathnodes[pathnodes.size] = var_63476d6ba4054b11;
        while (1) {
            currentnode = pathnodes[pathnodes.size - 1];
            if (!isdefined(currentnode.target)) {
                break;
            }
            nextnode = getvehiclenode(currentnode.target, "targetname");
            if (!isdefined(nextnode) || array_contains(pathnodes, nextnode)) {
                break;
            }
            pathnodes[pathnodes.size] = nextnode;
        }
        result = pathnodes[pathnodes.size - 1];
    }
    return result;
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x52fc
// Size: 0x362
function private function_1a92c62e989f69c2(var_439771656c72f507, goalpoint, pathindex, vehspeed) {
    if (!var_439771656c72f507 function_1e8542a707a8002("p2p")) {
        var_439771656c72f507 function_d2e41c7603ba7697("p2p");
    }
    if (!var_439771656c72f507 function_1e8542a707a8002("path")) {
        var_439771656c72f507 function_d2e41c7603ba7697("path");
    }
    if (!var_439771656c72f507 function_1e8542a707a8002("animator")) {
        var_439771656c72f507 function_d2e41c7603ba7697("animator");
    }
    var_439771656c72f507 function_77320e794d35465a("p2p", "checkStuck", 0);
    var_439771656c72f507 function_77320e794d35465a("p2p", "brakeAtGoal", 1);
    var_439771656c72f507 function_77320e794d35465a("p2p", "automaticNormal", 1);
    var_439771656c72f507 function_77320e794d35465a("p2p", "brakeOnGoalGasbrake", 1);
    var_439771656c72f507 function_77320e794d35465a("p2p", "goalPoint", goalpoint);
    var_439771656c72f507 function_77320e794d35465a("p2p", "goalThreshold", 200);
    var_439771656c72f507 function_77320e794d35465a("p2p", "throttleSpeedClose", 1);
    var_439771656c72f507 function_77320e794d35465a("p2p", "throttleSpeedThreshold", 1);
    var_439771656c72f507 function_77320e794d35465a("p2p", "automaticFastTopspeedFraction", 1);
    var_439771656c72f507 function_77320e794d35465a("p2p", "throttleSpeedFarBelow", 1);
    var_439771656c72f507 function_77320e794d35465a("p2p", "throttleSpeedFarAbove", 4);
    var_439771656c72f507 function_77320e794d35465a("p2p", "throttleSpeedClose", 2);
    var_439771656c72f507 function_77320e794d35465a("p2p", "gasToStopMovement", 0.9);
    var_439771656c72f507 function_77320e794d35465a("p2p", "steeringMultiplier", 2);
    var_439771656c72f507 function_77320e794d35465a("path", "radiusToStep", 300);
    var_439771656c72f507 function_77320e794d35465a("p2p", "manualSpeed", vehspeed);
    var_427b2431f2aa8461 = 0;
    if (getdvarint(@"hash_46c9c4287e87fcfd", 0)) {
        var_3d16380ecb1175b2 = function_233f4ebb97f71baa(pathindex);
        if (isdefined(var_3d16380ecb1175b2)) {
            /#
                adddebugcommand("<unknown string>");
                adddebugcommand("<unknown string>");
            #/
            var_439771656c72f507 namespace_b479ac682b93cd92::vehicle_disable_navobstacles();
            startlocation = var_439771656c72f507.origin;
            var_2804c4cc3533f9b9 = var_3d16380ecb1175b2.origin;
            var_efaa9ab3c88c72d8 = anglestoforward(var_439771656c72f507.angles);
            var_34bb55fbc59c2e1d = isnavmeshloaded("vehicle_large");
            var_a8c9b5fffa6387d = isnavmeshloaded("zombie_large");
            var_eefdc14dd5275fd0 = ter_op(var_34bb55fbc59c2e1d, "vehicle_large", ter_op(var_a8c9b5fffa6387d, "zombie_large", undefined));
            var_7db6235a7408e42f = var_439771656c72f507 function_187aaba5fbba21d0(startlocation, var_2804c4cc3533f9b9, 50, 200, 100, var_efaa9ab3c88c72d8, (0, 0, 0), 300, 0.4, 0, 1, var_eefdc14dd5275fd0, 0, 1);
            if (isdefined(var_7db6235a7408e42f) && var_7db6235a7408e42f.size > 0) {
                var_427b2431f2aa8461 = 1;
                var_439771656c72f507 thread namespace_3bb9da687f15383d::checkvehiclenavsplinestuck();
                var_439771656c72f507 thread namespace_3bb9da687f15383d::checkvehiclenavsplineinterrupted();
            }
            /#
                var_439771656c72f507 thread namespace_3bb9da687f15383d::function_68d5232181fec390(var_7db6235a7408e42f, ter_op(isdefined(var_eefdc14dd5275fd0), (1, 1, 1), (1, 0, 0)));
                var_439771656c72f507 thread namespace_3bb9da687f15383d::function_2a708e9755fc798b(var_eefdc14dd5275fd0, ips_to_mph(vehspeed));
            #/
        }
    }
    if (!var_427b2431f2aa8461) {
        var_439771656c72f507 function_77320e794d35465a("path", "radiantId", pathindex);
    }
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5665
// Size: 0x71
function private function_d6b83c4fb86ed414(requestid, data) {
    if (isdefined(level.var_8cd784cab6ecbb43[requestid])) {
        if (level.var_8cd784cab6ecbb43[requestid].var_891e2bd59c71ae44 == 0) {
            level thread function_6a4f830ea5453937(requestid, data);
        } else if (level.var_8cd784cab6ecbb43[requestid].var_891e2bd59c71ae44 == 2) {
            level thread function_26ab78a96eb9a2da(requestid, data);
        }
    }
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x56dd
// Size: 0x192
function private function_8b8837c923841d4e(riders) {
    var_fb6a3e631f70c08a = [];
    riders = function_fdc9d5557c53078e(riders);
    foreach (rider in riders) {
        if (isdefined(rider.var_af27b6a3d3a2f6af) && rider.var_af27b6a3d3a2f6af != -1) {
            if (!self.usedpositions[rider.var_af27b6a3d3a2f6af]) {
                rider.script_startingposition = rider.var_af27b6a3d3a2f6af;
                self.usedpositions[rider.var_af27b6a3d3a2f6af] = 1;
            } else {
                /#
                    assertmsg("Multiple AIs are assigned at the same vehicle seat in APE. Seat number: " + rider.var_af27b6a3d3a2f6af);
                #/
            }
        } else {
            var_fb6a3e631f70c08a[var_fb6a3e631f70c08a.size] = rider;
        }
    }
    var_db8f88e584cb157a = namespace_4ff41449ab14a3a0::get_availablepositions();
    var_62b794e76a36f44b = 0;
    foreach (rider in var_fb6a3e631f70c08a) {
        var_7ee36c8f63d5be05 = var_db8f88e584cb157a.availablepositions[var_62b794e76a36f44b].vehicle_position;
        rider.script_startingposition = var_7ee36c8f63d5be05;
        self.usedpositions[var_7ee36c8f63d5be05] = 1;
        var_62b794e76a36f44b++;
    }
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5876
// Size: 0x357
function private function_26ab78a96eb9a2da(requestid, team) {
    level endon("game_ended");
    if (isdefined(level.var_8cd784cab6ecbb43[requestid])) {
        vehicle = level.var_8cd784cab6ecbb43[requestid].vehicle;
        vehicle_index = level.var_8cd784cab6ecbb43[requestid].vehicle_index;
        riders = level.var_8cd784cab6ecbb43[requestid].riders;
        var_cf41a8a0e5c72c2b = level.var_8cd784cab6ecbb43[requestid].var_cf41a8a0e5c72c2b;
        level.var_8cd784cab6ecbb43[requestid] = undefined;
        if (isdefined(level.var_c05a13fa777eefd3)) {
            elapsed = gettime() - level.var_c05a13fa777eefd3;
            if (function_c89ed1840c8d0f0f(elapsed) < 1) {
                wait(randomfloatrange(1, 3));
            }
        }
        var_63476d6ba4054b11 = getvehiclenode(vehicle_index);
        if (!isdefined(var_63476d6ba4054b11)) {
            var_280ab764114c5fb6 = function_9a39e23c3c52c2af(requestid);
            /#
                assertmsg("Bad vehicle start node for encounter: " + var_280ab764114c5fb6.var_6093c29675253b36 + " at position: " + var_280ab764114c5fb6.origin + ".");
            #/
        }
        var_bd437e647db702f9 = undefined;
        var_9ef41e2c046ad906 = undefined;
        animalias = undefined;
        foreach (vehicleref in level.var_a0b2c978ca57ffc5) {
            if (isdefined(vehicleref.vehicle) && vehicleref.vehicle == vehicle) {
                var_bd437e647db702f9 = vehicleref.ref;
                var_9ef41e2c046ad906 = vehicleref.ai.classname;
                animalias = vehicleref.ai.vehicleanimalias;
                break;
            }
        }
        /#
            assertex(isdefined(var_bd437e647db702f9), "Invalid vehicle name: " + vehicle);
        #/
        if (!isdefined(team)) {
            team = "team_hundred_ninety";
        }
        heli = namespace_5d57e6b81b105f5d::function_f1620ddb70094ea9(var_63476d6ba4054b11, 0, var_bd437e647db702f9, 0, team);
        heli.var_ad46aadd4e3290d7 = requestid;
        function_b321d5942c63e7fd(requestid, heli);
        level.var_c05a13fa777eefd3 = gettime();
        var_3dfbdc6f9aeb8197 = function_8c8ae740367137ba("OnVehicleSpawned", requestid);
        if (isdefined(var_3dfbdc6f9aeb8197)) {
            thread [[ var_3dfbdc6f9aeb8197.var_fa2c135047e3da22 ]](requestid, var_3dfbdc6f9aeb8197.userdata, heli);
        }
        heli namespace_5d57e6b81b105f5d::function_35c699c709e24b69(riders);
        foreach (rider in riders) {
            rider.var_f327ed481efe4857 = undefined;
        }
        if (vehicle == "veh_jup_mil_air_heli_blima_physics_anim_infil_mp") {
            heli thread function_14c40311c151a17b(requestid, var_63476d6ba4054b11, var_cf41a8a0e5c72c2b);
        } else {
            heli thread function_157996d822cefeaf(requestid, var_cf41a8a0e5c72c2b, var_63476d6ba4054b11);
        }
        heli thread function_718e622bef6f4a9c(requestid);
    }
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5bd4
// Size: 0x3dd
function private function_6a4f830ea5453937(requestid, team) {
    level endon("game_ended");
    if (isdefined(level.var_8cd784cab6ecbb43[requestid])) {
        vehicle = level.var_8cd784cab6ecbb43[requestid].vehicle;
        vehicle_index = level.var_8cd784cab6ecbb43[requestid].vehicle_index;
        riders = level.var_8cd784cab6ecbb43[requestid].riders;
        var_cf41a8a0e5c72c2b = level.var_8cd784cab6ecbb43[requestid].var_cf41a8a0e5c72c2b;
        level.var_8cd784cab6ecbb43[requestid] = undefined;
        if (isdefined(level.var_c05a13fa777eefd3) && !iscp()) {
            elapsed = gettime() - level.var_c05a13fa777eefd3;
            if (function_c89ed1840c8d0f0f(elapsed) < 1) {
                wait(randomfloatrange(1, 3));
            }
        }
        var_63476d6ba4054b11 = getvehiclenode(vehicle_index);
        var_cceaf2e8bb865496 = spawnstruct();
        var_cceaf2e8bb865496.origin = var_63476d6ba4054b11.origin + (0, 0, 128);
        var_cceaf2e8bb865496.angles = var_63476d6ba4054b11.angles;
        if (iscp()) {
            var_cceaf2e8bb865496.var_f16652e1462a3739 = 1;
        }
        var_bd437e647db702f9 = undefined;
        var_9ef41e2c046ad906 = undefined;
        animalias = undefined;
        foreach (vehicleref in level.var_a0b2c978ca57ffc5) {
            if (isdefined(vehicleref.vehicle) && vehicleref.vehicle == vehicle) {
                var_bd437e647db702f9 = vehicleref.ref;
                var_9ef41e2c046ad906 = vehicleref.ai.classname;
                animalias = vehicleref.ai.vehicleanimalias;
                break;
            }
        }
        if (isdefined(var_bd437e647db702f9)) {
            var_439771656c72f507 = namespace_1f188a13f7e79610::vehicle_spawn(var_bd437e647db702f9, var_cceaf2e8bb865496);
            if (isdefined(var_439771656c72f507)) {
                function_b321d5942c63e7fd(requestid, var_439771656c72f507);
                level.var_c05a13fa777eefd3 = gettime();
                var_3dfbdc6f9aeb8197 = function_8c8ae740367137ba("OnVehicleSpawned", requestid);
                if (isdefined(var_3dfbdc6f9aeb8197)) {
                    thread [[ var_3dfbdc6f9aeb8197.var_fa2c135047e3da22 ]](requestid, var_3dfbdc6f9aeb8197.userdata, var_439771656c72f507);
                }
                var_439771656c72f507.riders = [];
                var_439771656c72f507.unloadque = [];
                var_439771656c72f507.unload_group = "all";
                var_439771656c72f507.classname_mp = var_9ef41e2c046ad906;
                var_439771656c72f507.vehicleanimalias = animalias;
                var_439771656c72f507 namespace_4ff41449ab14a3a0::handle_attached_guys();
                var_439771656c72f507 setscriptablepartstate("single", "vehicle_unusable");
                var_439771656c72f507 function_8b8837c923841d4e(riders);
                foreach (guy in riders) {
                    var_439771656c72f507 namespace_4ff41449ab14a3a0::guy_enter(guy);
                    waitframe();
                    guy.var_f327ed481efe4857 = undefined;
                }
                var_439771656c72f507 function_1a92c62e989f69c2(var_439771656c72f507, var_439771656c72f507.origin, vehicle_index, var_63476d6ba4054b11.speed);
                var_439771656c72f507 thread function_2d225c8fbea7ed93(requestid, var_cf41a8a0e5c72c2b);
                var_439771656c72f507 thread function_718e622bef6f4a9c(requestid);
                var_439771656c72f507 thread function_63a4b48c6e425420(requestid);
            }
        } else {
            /#
                assertmsg("AI Spawn Director: Vehicle asset not found " + vehicle);
            #/
        }
    }
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x5fb8
// Size: 0x72
function private function_157996d822cefeaf(requestid, var_cf41a8a0e5c72c2b, var_63476d6ba4054b11) {
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    thread namespace_5d57e6b81b105f5d::function_ff4065536bad7017(var_63476d6ba4054b11, undefined);
    self waittill("ai_spawn_director_heli_reached_end_path");
    var_cf41a8a0e5c72c2b = namespace_5d57e6b81b105f5d::function_10ff61ea7267cf0b(var_cf41a8a0e5c72c2b);
    var_23c7137b7d74fee2 = namespace_5d57e6b81b105f5d::function_9e55d8680a23ec64(var_cf41a8a0e5c72c2b);
    function_7d5afc41a709dbc9(requestid, var_63476d6ba4054b11.origin, var_23c7137b7d74fee2);
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6031
// Size: 0x51
function private function_14c40311c151a17b(requestid, var_63476d6ba4054b11, var_d5f7b3700d04322c) {
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    namespace_5d57e6b81b105f5d::function_9514a9690c80864a(var_63476d6ba4054b11, var_63476d6ba4054b11.origin, var_d5f7b3700d04322c, &function_9af81499f0fdd6c8);
    namespace_5d57e6b81b105f5d::function_fe282a6dc1e0d0fa();
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6089
// Size: 0xd2
function function_9af81499f0fdd6c8(heli, var_23c7137b7d74fee2) {
    /#
        assertex(isdefined(heli.var_ad46aadd4e3290d7), "Calling on_heli_unload_finished with an invalid request ID!");
    #/
    if (isdefined(var_23c7137b7d74fee2) && var_23c7137b7d74fee2.size > 0) {
        foreach (agent in var_23c7137b7d74fee2) {
            if (isdefined(agent) && agent.isactive) {
                /#
                    assertex(isdefined(agent.var_ad46aadd4e3290d7), "An agent has an invalid request ID!");
                #/
                agent function_2d85286f9e48645b(agent.var_ad46aadd4e3290d7);
            }
        }
    }
    function_ad0d4e47324849b3(heli.var_ad46aadd4e3290d7);
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6162
// Size: 0x52
function private function_7d5afc41a709dbc9(requestid, var_2c2390497cfcfc4, var_23c7137b7d74fee2) {
    self endon("death");
    self endon("leaving");
    self endon("crashing");
    function_9af81499f0fdd6c8(self, var_23c7137b7d74fee2);
    thread namespace_5d57e6b81b105f5d::function_5cf894c96d44c40b(var_2c2390497cfcfc4);
    self waittill("ai_spawn_director_heli_landed");
    namespace_5d57e6b81b105f5d::function_fe282a6dc1e0d0fa();
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x61bb
// Size: 0x44
function private function_2d85286f9e48645b(requestid) {
    var_3dfbdc6f9aeb8197 = function_8c8ae740367137ba("OnUnloaded", requestid);
    if (isdefined(var_3dfbdc6f9aeb8197)) {
        thread [[ var_3dfbdc6f9aeb8197.var_fa2c135047e3da22 ]](requestid, var_3dfbdc6f9aeb8197.userdata, self);
    }
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6206
// Size: 0x76
function private function_77b24ac305d25629(data) {
    level endon("game_ended");
    self endon("death");
    self hide();
    delaycall(0.5, &show);
    waitframe();
    if (istrue(data.var_4de8f2b4d81bbb10)) {
        thread function_ddfc7d96a73dafce(data);
    }
    namespace_30bebe2c8fdd4f94::function_c789cc0bd60384c2(data.var_35b7f8cbbef2653a, data.var_45e72621955fd7cf, undefined, 0, 3);
    function_afe6d55c6ab3cd13(data);
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x6283
// Size: 0x2b
function private function_ddfc7d96a73dafce(data) {
    self endon("death");
    self waittill("parachute_prepare_to_land");
    function_94e87cabbe0c24af(self.landing_spot);
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x62b5
// Size: 0x75
function function_e64438bcaad08d5c() {
    level endon("game_ended");
    self endon("death");
    if (!isdefined(self.var_ad46aadd4e3290d7)) {
        return;
    }
    waittill_any_4("stealth_investigate", "stealth_hunt", "stealth_combat", "startCombatRush");
    var_dd271c02249f77a6 = function_9a39e23c3c52c2af(self.var_ad46aadd4e3290d7);
    if (isdefined(var_dd271c02249f77a6)) {
        self setgoalpos(var_dd271c02249f77a6.origin, var_dd271c02249f77a6.radius);
    }
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x6331
// Size: 0x63
function private function_b569203d69d8e9d9(text) {
    /#
        var_a814ad7efd8815fc = getdvar(@"hash_25de39eff9804a88", 0);
        if (isdefined(var_a814ad7efd8815fc) && (isstring(var_a814ad7efd8815fc) && var_a814ad7efd8815fc == "<unknown string>" || !isstring(var_a814ad7efd8815fc) && var_a814ad7efd8815fc == 1)) {
            println("<unknown string>" + text);
        }
    #/
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 0, eflags: 0x4
// Checksum 0x0, Offset: 0x639b
// Size: 0xbd
function private function_66be042996360501() {
    /#
        self endon("<unknown string>");
        var_9c674c674a7845e7 = function_7c093aaec980131b(self.origin, 1);
        var_1fe0f3e2db431c78 = randomfloatrange(0, 0.5);
        var_142afb8d7e72b5d = clamp(var_9c674c674a7845e7 / 4, 0, 1) * 0.5;
        weight = var_1fe0f3e2db431c78 + var_142afb8d7e72b5d;
        a = 60;
        b = 10;
        waittime = a * (1 - weight) + b * weight;
        waittime = clamp(waittime, b, a);
        wait(waittime);
        self kill();
    #/
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x645f
// Size: 0x1a6
function private function_697246e491b82b(var_393151fed6c0229b) {
    /#
        level notify("<unknown string>");
        level endon("<unknown string>");
        var_f5d58a9101252de0 = strtok(var_393151fed6c0229b, "<unknown string>");
        var_5835128602b740f3 = [];
        var_66371bce9826ed92 = 0;
        var_a3090a44d1eef38b = 0;
        run_all = 0;
        foreach (param in var_f5d58a9101252de0) {
            switch (param) {
            case #"hash_5f937e1deca2a44f":
            case #"hash_8b3de9dcd39c0dc6":
            case #"hash_b8b717134133c2d8":
                var_5835128602b740f3 = array_add(var_5835128602b740f3, param);
                break;
            case #"hash_20cd76d83c2f7487":
                var_66371bce9826ed92 = 1;
                break;
            case #"hash_b5868715305a78a7":
                var_a3090a44d1eef38b = 1;
                break;
            case #"hash_c482c6c109150a4":
                run_all = 1;
                break;
            }
        }
        foreach (var_1f71fcbc08308632 in var_5835128602b740f3) {
            if (istrue(run_all)) {
                function_455f6a83239d2c9f(var_1f71fcbc08308632, 0, 0);
                function_455f6a83239d2c9f(var_1f71fcbc08308632, 0, 1);
                function_455f6a83239d2c9f(var_1f71fcbc08308632, 1, 0);
                function_455f6a83239d2c9f(var_1f71fcbc08308632, 1, 1);
            } else {
                function_455f6a83239d2c9f(var_1f71fcbc08308632, var_66371bce9826ed92, var_a3090a44d1eef38b);
            }
        }
    #/
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 3, eflags: 0x4
// Checksum 0x0, Offset: 0x660c
// Size: 0xc6
function private function_455f6a83239d2c9f(test_name, var_66371bce9826ed92, var_a3090a44d1eef38b) {
    /#
        setdvar(@"hash_19f0eb1fd6a2f87d", 1);
        setdvar(@"hash_fe20797ad12b2dbe", var_a3090a44d1eef38b);
        thread function_5ca76cbc5c022acd(test_name, var_66371bce9826ed92);
        wait(5);
        var_4435be27f3e1110d = test_name;
        var_4435be27f3e1110d = var_4435be27f3e1110d + ter_op(var_66371bce9826ed92, "<unknown string>", "<unknown string>");
        var_4435be27f3e1110d = var_4435be27f3e1110d + ter_op(var_a3090a44d1eef38b, "<unknown string>", "<unknown string>");
        iprintlnbold("<unknown string>" + var_4435be27f3e1110d);
        if (var_a3090a44d1eef38b) {
            wait(240);
        } else {
            wait(60);
        }
        setdvar(@"hash_53043691f4ede34", var_4435be27f3e1110d);
        iprintlnbold("<unknown string>" + var_4435be27f3e1110d);
        waitframe();
        adddebugcommand("<unknown string>");
    #/
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x66d9
// Size: 0x48
function private function_5ca76cbc5c022acd(test_name, var_66371bce9826ed92) {
    /#
        level notify("<unknown string>");
        level endon("<unknown string>");
        function_ecfc4d9f34d1ff28(test_name, var_66371bce9826ed92);
        wait(24);
        while (var_66371bce9826ed92) {
            wait(0.5);
            function_ecfc4d9f34d1ff28(test_name, var_66371bce9826ed92);
        }
    #/
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x6728
// Size: 0x100
function private function_ecfc4d9f34d1ff28(test_name, var_66371bce9826ed92) {
    /#
        function_c7f30c19a0e960af();
        var_f209d74ee9498a17 = function_acbf36bd373730ad();
        var_f209d74ee9498a17.halfsize = var_f209d74ee9498a17.halfsize * 0.8;
        var_ec1b4799db52d6c1 = var_f209d74ee9498a17.midpoint - var_f209d74ee9498a17.halfsize;
        var_ec3e3999db78ffaf = var_f209d74ee9498a17.midpoint + var_f209d74ee9498a17.halfsize;
        player_count = getdvarint(@"hash_818c699a5caaee4f", 48);
        switch (test_name) {
        case #"hash_8b3de9dcd39c0dc6":
            function_f681aebd2ee59625(player_count, var_66371bce9826ed92, var_ec1b4799db52d6c1, var_ec3e3999db78ffaf);
            break;
        case #"hash_5f937e1deca2a44f":
            function_9e6faf8741817672(player_count, var_66371bce9826ed92, var_ec1b4799db52d6c1, var_ec3e3999db78ffaf);
            break;
        case #"hash_b8b717134133c2d8":
            function_dd49eb1db10445ad(player_count, var_66371bce9826ed92, var_ec1b4799db52d6c1, var_ec3e3999db78ffaf);
            break;
        }
    #/
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x682f
// Size: 0x1c4
function private function_f681aebd2ee59625(player_count, var_66371bce9826ed92, var_ec1b4799db52d6c1, var_ec3e3999db78ffaf) {
    /#
        var_d77fccc50c2acefd = int(player_count / 4);
        var_b3ffe4a8d5074a29 = int(floor(sqrt(var_d77fccc50c2acefd)));
        var_fd2e7bcb3d1af898 = int(var_d77fccc50c2acefd / var_b3ffe4a8d5074a29);
        var_f77b805c2452218a = var_ec3e3999db78ffaf[0] - var_ec1b4799db52d6c1[0];
        var_c2e5ddd5c3fe2389 = var_ec3e3999db78ffaf[1] - var_ec1b4799db52d6c1[1];
        var_b0217f9f9085d6a8 = var_f77b805c2452218a / var_b3ffe4a8d5074a29;
        var_8ed64ca319c67c25 = var_c2e5ddd5c3fe2389 / var_fd2e7bcb3d1af898;
        var_7734f7004975af18 = [0:(0, 0, 0), 1:(500, 0, 0), 2:(0, 500, 0), 3:(500, 500, 0)];
        for (var_efde2fd4503e0c61 = 0; var_efde2fd4503e0c61 < var_b3ffe4a8d5074a29; var_efde2fd4503e0c61++) {
            xpos = var_ec1b4799db52d6c1[0] + var_efde2fd4503e0c61 * var_b0217f9f9085d6a8;
            for (var_ad18f35cbb261a94 = 0; var_ad18f35cbb261a94 < var_fd2e7bcb3d1af898; var_ad18f35cbb261a94++) {
                ypos = var_ec1b4799db52d6c1[1] + var_ad18f35cbb261a94 * var_8ed64ca319c67c25;
                var_7597ede1b3e40a8e = (xpos, ypos, 1172);
                foreach (var_d8f0e55e945d6cfb in var_7734f7004975af18) {
                    function_7a6ef66132ad3f88(var_7597ede1b3e40a8e + var_d8f0e55e945d6cfb, var_66371bce9826ed92);
                }
            }
        }
    #/
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x69fa
// Size: 0x113
function private function_9e6faf8741817672(player_count, var_66371bce9826ed92, var_ec1b4799db52d6c1, var_ec3e3999db78ffaf) {
    /#
        var_b3ffe4a8d5074a29 = int(floor(sqrt(player_count)));
        var_fd2e7bcb3d1af898 = int(player_count / var_b3ffe4a8d5074a29);
        var_f77b805c2452218a = var_ec3e3999db78ffaf[0] - var_ec1b4799db52d6c1[0];
        var_c2e5ddd5c3fe2389 = var_ec3e3999db78ffaf[1] - var_ec1b4799db52d6c1[1];
        var_b0217f9f9085d6a8 = var_f77b805c2452218a / var_b3ffe4a8d5074a29;
        var_8ed64ca319c67c25 = var_c2e5ddd5c3fe2389 / var_fd2e7bcb3d1af898;
        for (var_efde2fd4503e0c61 = 0; var_efde2fd4503e0c61 < var_b3ffe4a8d5074a29; var_efde2fd4503e0c61++) {
            xpos = var_ec1b4799db52d6c1[0] + var_efde2fd4503e0c61 * var_b0217f9f9085d6a8;
            for (var_ad18f35cbb261a94 = 0; var_ad18f35cbb261a94 < var_fd2e7bcb3d1af898; var_ad18f35cbb261a94++) {
                ypos = var_ec1b4799db52d6c1[1] + var_ad18f35cbb261a94 * var_8ed64ca319c67c25;
                var_7597ede1b3e40a8e = (xpos, ypos, 1172);
                function_7a6ef66132ad3f88(var_7597ede1b3e40a8e, var_66371bce9826ed92);
            }
        }
    #/
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 4, eflags: 0x4
// Checksum 0x0, Offset: 0x6b14
// Size: 0x43
function private function_dd49eb1db10445ad(player_count, var_66371bce9826ed92, var_ec1b4799db52d6c1, var_ec3e3999db78ffaf) {
    /#
        function_9e6faf8741817672(player_count / 2, var_66371bce9826ed92, var_ec1b4799db52d6c1, var_ec3e3999db78ffaf);
        function_f681aebd2ee59625(player_count / 2, var_66371bce9826ed92, var_ec1b4799db52d6c1, var_ec3e3999db78ffaf);
    #/
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x6b5e
// Size: 0x95
function private function_bcc679805784c317(var_7597ede1b3e40a8e, timeoffset) {
    /#
        var_b4469da4bc031c17 = 57.2958;
        x = (gettime() + timeoffset) / 1000;
        x = x / getdvarfloat(@"hash_f1961fe2a6c4855b", 10);
        x = x * var_b4469da4bc031c17;
        var_30cdc51d707e976 = getdvarfloat(@"hash_de5359935bb10538", 5000);
        var_7597ede1b3e40a8e = var_7597ede1b3e40a8e + (sin(x) * var_30cdc51d707e976, cos(x) * var_30cdc51d707e976, 0);
        return var_7597ede1b3e40a8e;
    #/
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 2, eflags: 0x4
// Checksum 0x0, Offset: 0x6bfa
// Size: 0xb5
function private function_7a6ef66132ad3f88(var_7597ede1b3e40a8e, var_66371bce9826ed92) {
    /#
        closesttacpoint = function_f0ef5d175747f19f(var_7597ede1b3e40a8e, 0);
        if (isdefined(closesttacpoint)) {
            var_7597ede1b3e40a8e = closesttacpoint.origin;
        }
        var_e0392858d8615d65 = var_7597ede1b3e40a8e;
        if (var_66371bce9826ed92) {
            var_7597ede1b3e40a8e = function_bcc679805784c317(var_7597ede1b3e40a8e, 0);
            var_8cb12d1e1a540bb1 = function_bcc679805784c317(var_e0392858d8615d65, 3000);
            orientedbox(var_8cb12d1e1a540bb1, (1000, 1000, 1000), (0, 0, 0), (1, 0, 1), 0, 20);
        }
        var_7597ede1b3e40a8e = getclosestpointonnavmesh(var_7597ede1b3e40a8e, "<unknown string>", 0, 0, 1);
        function_e8998001a61385c6(var_7597ede1b3e40a8e, 3);
    #/
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6cb6
// Size: 0x35c
function function_b6206c1c64860991(tablename) {
    /#
        level notify("<unknown string>");
        level notify("<unknown string>");
        level endon("<unknown string>");
        level.var_23f1eadfcec14e18 = [];
        childthread function_21c84a22c509b5ce();
        iprintlnbold("<unknown string>" + tablename);
        numrows = tablelookupgetnumrows(tablename);
        var_d0caf0cd49324747 = undefined;
        playbackstarttime = undefined;
        for (rowindex = 3; rowindex < numrows; rowindex++) {
            event = tablelookupbyrow(tablename, rowindex, 0);
            entnum = int(tablelookupbyrow(tablename, rowindex, 2));
            eventtype = tablelookupbyrow(tablename, rowindex, 3);
            timestamp = int(tablelookupbyrow(tablename, rowindex, 1));
            if (event != "<unknown string>") {
                rowindex++;
                continue;
            }
            if (!isdefined(var_d0caf0cd49324747)) {
                var_d0caf0cd49324747 = timestamp;
                playbackstarttime = gettime();
            }
            var_881f6510d2c16c5a = getdvarint(@"hash_4d697dbebbd5e599", 10);
            if (var_881f6510d2c16c5a <= 0) {
                var_881f6510d2c16c5a = 1;
            }
            timedelta = timestamp - var_d0caf0cd49324747;
            timedelta = timedelta / var_881f6510d2c16c5a;
            var_6dd0219c68240756 = playbackstarttime + timedelta;
            if (var_6dd0219c68240756 > gettime()) {
                wait(float(var_6dd0219c68240756 - gettime()) / 1000);
            }
            switch (eventtype) {
            case #"hash_cbfb23135a2db9a1":
                pos_x = float(tablelookupbyrow(tablename, rowindex, 4));
                pos_y = float(tablelookupbyrow(tablename, rowindex, 5));
                level.var_23f1eadfcec14e18[entnum] = spawnstruct();
                level.var_23f1eadfcec14e18[entnum].startpos = (pos_x, pos_y, 0);
                level.var_23f1eadfcec14e18[entnum].startpos = getclosestpointonnavmesh(level.var_23f1eadfcec14e18[entnum].startpos, "<unknown string>", 0, 0, 1);
                level.var_23f1eadfcec14e18[entnum].endpos = level.var_23f1eadfcec14e18[entnum].startpos;
                level.var_23f1eadfcec14e18[entnum].starttime = gettime();
                level.var_23f1eadfcec14e18[entnum].name = tablelookupbyrow(tablename, rowindex, 7);
                continue;
            case #"hash_82b3bcf2299864ac":
                if (isdefined(level.var_23f1eadfcec14e18[entnum])) {
                    pos_x = float(tablelookupbyrow(tablename, rowindex, 4));
                    pos_y = float(tablelookupbyrow(tablename, rowindex, 5));
                    level.var_23f1eadfcec14e18[entnum].startpos = level.var_23f1eadfcec14e18[entnum].endpos;
                    level.var_23f1eadfcec14e18[entnum].endpos = getclosestpointonnavmesh((pos_x, pos_y, 0), "<unknown string>", 0, 0, 1);
                    level.var_23f1eadfcec14e18[entnum].starttime = gettime();
                }
                continue;
            }
        }
        iprintlnbold("<unknown string>");
    #/
}

// Namespace namespace_1c689dd3986a841c/namespace_614554f86e52695c
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x7019
// Size: 0x14d
function function_21c84a22c509b5ce() {
    /#
        while (isdefined(level.var_23f1eadfcec14e18)) {
            var_881f6510d2c16c5a = getdvarint(@"hash_4d697dbebbd5e599", 10);
            var_661a636dbc7d54b5 = 30 / var_881f6510d2c16c5a;
            function_c7f30c19a0e960af();
            foreach (var_13aaab0ee500428d in level.var_23f1eadfcec14e18) {
                timediff = (gettime() - var_13aaab0ee500428d.starttime) / 1000;
                lerptime = clamp(timediff / var_661a636dbc7d54b5, 0, 1);
                var_7597ede1b3e40a8e = vectorlerp(var_13aaab0ee500428d.startpos, var_13aaab0ee500428d.endpos, lerptime);
                function_e8998001a61385c6(var_7597ede1b3e40a8e, 3);
                print3d(var_7597ede1b3e40a8e, var_13aaab0ee500428d.name, (1, 1, 1), 1, 10, 20, 1);
                sphere(var_7597ede1b3e40a8e, 100, (0.88, 0.44, 0.88), 0, 20);
            }
            wait(1);
        }
    #/
}

