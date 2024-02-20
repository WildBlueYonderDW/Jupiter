// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using script_5def7af2a9f04234;
#using scripts\common\anim.gsc;
#using scripts\mp\anim.gsc;
#using script_5c118165d3e98a42;
#using script_48814951e916af89;
#using script_120270bd0a747a35;
#using script_41ba451876d0900c;
#using scripts\stealth\enemy.gsc;
#using scripts\mp\utility\lower_message.gsc;

#namespace namespace_f44f6fccbcedc09c;

// Namespace namespace_f44f6fccbcedc09c/namespace_ab6776a0c2e19905
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x492
// Size: 0x66
function function_48e19aa598e95954() {
    level endon("game_ended");
    while (!isdefined(level.struct_class_names)) {
        waitframe();
    }
    level.var_fb4c92e328823a89 = function_84ffc1f1220ca72b();
    level.var_c5233088f09b986a = function_d6cc02d264845807();
    level.var_e006c96f4eb13b4f = getdvarint(@"hash_3b04cd01c62e849e", 128);
    level thread function_fa4b99570c140545();
    level.var_fc7e9cf9d867765e = 1;
}

// Namespace namespace_f44f6fccbcedc09c/namespace_ab6776a0c2e19905
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ff
// Size: 0x5d
function function_fa4b99570c140545() {
    level endon("game_ended");
    while (!istrue(level.var_b212a36bec6cf8da)) {
        waitframe();
    }
    namespace_2067e9d40332bfec::function_ba13d98dab57ca7e("elevator_group_reinforcement_pop", "pop_wait_spawn", &function_bd1c3703fc1e9ff7);
    namespace_2067e9d40332bfec::function_ba13d98dab57ca7e("elevator_group_reinforcement_pop", "pop_doors_open", &function_ec009a967d1d5eb9);
    namespace_2067e9d40332bfec::function_ba13d98dab57ca7e("elevator_group_reinforcement_pop", "pop_doors_closing", &function_8b680b3ef155fc34);
}

// Namespace namespace_f44f6fccbcedc09c/namespace_ab6776a0c2e19905
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x563
// Size: 0x15f
function function_84ffc1f1220ca72b() {
    var_5d71d807f3d89419 = getstructarray("reinforcementPackage_mainNode", "script_noteworthy");
    var_1dace216d1a32d14 = [];
    foreach (var_11f568bbcedebcf0 in var_5d71d807f3d89419) {
        package = spawnstruct();
        package.origin = var_11f568bbcedebcf0.origin;
        package.var_b7015a0dbefebce1 = getstructarray(var_11f568bbcedebcf0.target, "targetname");
        package.floor = 0;
        if (isdefined(level.var_172e4b629498723c)) {
            package.floor = [[ level.var_172e4b629498723c ]](var_11f568bbcedebcf0.origin);
        }
        /#
            assertex(isdefined(package.floor), "setupReinforcementNodes(): the package [" + var_11f568bbcedebcf0.target + "] isn't in any floor volume!");
        #/
        /#
            assertex(!isdefined(var_1dace216d1a32d14[var_11f568bbcedebcf0.target]), "setupReinforcementNodes(): Duplicate target [" + var_11f568bbcedebcf0.target + "] for reinforcementPackage_mainNode!");
        #/
        var_1dace216d1a32d14[var_11f568bbcedebcf0.target] = package;
    }
    return var_1dace216d1a32d14;
}

// Namespace namespace_f44f6fccbcedc09c/namespace_ab6776a0c2e19905
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ca
// Size: 0x85
function function_d6cc02d264845807() {
    var_aa1fc3193d666f74 = getstructarray("reinforcement_patrolPath", "script_noteworthy");
    var_d7baafc9b07f5094 = [];
    foreach (var_deb16fded9e9e6cf in var_aa1fc3193d666f74) {
        var_d7baafc9b07f5094[var_deb16fded9e9e6cf.targetname] = namespace_bfef6903bca5845d::function_9edcf99159abb0b(var_deb16fded9e9e6cf);
    }
    return var_d7baafc9b07f5094;
}

// Namespace namespace_f44f6fccbcedc09c/namespace_ab6776a0c2e19905
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x757
// Size: 0x3c
function function_184496a131fc4014(origin) {
    var_f8bbdcb816b01611 = sortbydistance(level.var_fb4c92e328823a89, origin);
    if (var_f8bbdcb816b01611.size > 0) {
        return var_f8bbdcb816b01611[0].var_b7015a0dbefebce1;
    }
    return [];
}

// Namespace namespace_f44f6fccbcedc09c/namespace_ab6776a0c2e19905
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x79b
// Size: 0x149
function function_98fb1ef948f4612b(var_c5e7fce963586ec0) {
    if (level.mapname == "mp_bio_lab" || level.mapname == "mp_biobunker") {
        elevator = namespace_2067e9d40332bfec::function_92beb6591366ab26("reinforcement_pop", "elevator_group_reinforcement_pop", "pop_wait_spawn", var_c5e7fce963586ec0, "elevator_pick_rule_ideal");
        if (isdefined(elevator)) {
            elevator.var_c5e7fce963586ec0 = var_c5e7fce963586ec0;
        }
        return elevator;
    } else {
        if (!isdefined(level.var_265fd51ba245adfd)) {
            return undefined;
        }
        var_167dbd5c394d0c31 = undefined;
        foreach (elevator in sortbydistance(level.var_265fd51ba245adfd, var_c5e7fce963586ec0)) {
            if (istrue(elevator.inuse)) {
                continue;
            }
            if (!isdefined(var_167dbd5c394d0c31) || !isdefined(elevator.var_6ec188424f7a3018) || isdefined(var_167dbd5c394d0c31.var_6ec188424f7a3018) && isdefined(elevator.var_6ec188424f7a3018) && elevator.var_6ec188424f7a3018 < var_167dbd5c394d0c31.var_6ec188424f7a3018) {
                var_167dbd5c394d0c31 = elevator;
            }
        }
        if (isdefined(var_167dbd5c394d0c31)) {
            var_167dbd5c394d0c31 thread elevator_think();
            return var_167dbd5c394d0c31;
        }
    }
}

// Namespace namespace_f44f6fccbcedc09c/namespace_ab6776a0c2e19905
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8eb
// Size: 0x1d3
function elevator_think() {
    self.inuse = 1;
    result = waittill_any_return_2("continue", "terminated");
    if (result != "continue") {
        self.inuse = undefined;
        return;
    }
    var_7cc3355412e6a85f = self.floors[self.var_33de00df8a9fbbe0];
    var_7cc3355412e6a85f thread namespace_2067e9d40332bfec::function_88c392696fd02dc4();
    self.car thread anim_single_solo(self.car, "open");
    wait(3);
    var_6b1da470fcee5528 = 0;
    while (function_dd2d6d3e79c578a8(var_7cc3355412e6a85f)) {
        if (var_6b1da470fcee5528 >= getdvarint(@"hash_934907c8f7add660", 30)) {
            break;
        }
        wait(0.2);
        var_6b1da470fcee5528 = var_6b1da470fcee5528 + 0.2;
    }
    var_7cc3355412e6a85f thread namespace_2067e9d40332bfec::function_d32c693d3a04f8f8();
    self.car thread anim_single_solo(self.car, "close");
    wait(1);
    agentarray = getaiarrayinradius(var_7cc3355412e6a85f.origin, 250);
    foreach (agent in agentarray) {
        if (!isalive(agent)) {
            continue;
        }
        var_8bdb743b1288e020 = (agent.origin[0], agent.origin[1], agent.origin[2] + 50);
        if (ispointinvolume(var_8bdb743b1288e020, var_7cc3355412e6a85f.var_907e66d3bf42c5a)) {
            agent namespace_bfef6903bca5845d::function_28b90eb2b591003f();
        }
    }
    self.var_6ec188424f7a3018 = gettime();
    wait(5);
    self.inuse = undefined;
}

// Namespace namespace_f44f6fccbcedc09c/namespace_ab6776a0c2e19905
// Params 15, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac5
// Size: 0x53d
function function_892161ab9ad430e3(numagents, var_ec862c2c00c7ab5d, var_c5e7fce963586ec0, priority, category, subcategory, groupname, team, var_93390a6953905fef, poiName, var_180734f7c2a9866f, var_f03b10101d704759, var_fb59c1ab2600d2f6, nationality, var_96e335eae30651e5) {
    var_c5e7fce963586ec0 = namespace_2000a83505151e5b::function_d378cc95abab583b(var_c5e7fce963586ec0, poiName);
    var_c5e7fce963586ec0 = namespace_2000a83505151e5b::function_61cbc488b27a6e61(var_c5e7fce963586ec0);
    if (!isdefined(poiName)) {
        poiName = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(var_c5e7fce963586ec0);
    }
    if (isdefined(level.var_d32282f99e9d01b8)) {
        if (!istrue([[ level.var_d32282f99e9d01b8 ]](var_c5e7fce963586ec0))) {
            return undefined;
        }
    }
    elevator = function_98fb1ef948f4612b(var_c5e7fce963586ec0);
    if (!isdefined(elevator)) {
        if (istrue(level.var_ba36989c7e24e4ff)) {
            /#
                println("combatRushComplete" + var_c5e7fce963586ec0);
            #/
        }
        return undefined;
    }
    if (isdefined(elevator.var_b586c70b173dd02b)) {
        var_b586c70b173dd02b = elevator.var_b586c70b173dd02b;
    } else {
        var_b586c70b173dd02b = function_184496a131fc4014(elevator.car.origin);
    }
    /#
        assertex(var_b586c70b173dd02b.size > 0, "Reinforce Request: No available spawnLocs around:  " + elevator.id);
    #/
    if (istrue(level.var_ba36989c7e24e4ff)) {
        /#
            println("<unknown string>" + elevator.id);
        #/
    }
    agents = [];
    i = 0;
    foreach (loc in var_b586c70b173dd02b) {
        tier = undefined;
        if (isdefined(level.var_8209a75b03499110)) {
            tier = [[ level.var_8209a75b03499110 ]](poiName);
        } else {
            tier = namespace_bfef6903bca5845d::function_aa34a142b7664dd1(namespace_6a3f8c14894f44be::function_5cc0c507e92f7b47(poiName));
        }
        type = undefined;
        var_177db62b63710f5d = undefined;
        if (isdefined(var_ec862c2c00c7ab5d) && isdefined(var_ec862c2c00c7ab5d.var_dd4f509b9c56c76f) && isdefined(var_ec862c2c00c7ab5d.var_dd4f509b9c56c76f[i])) {
            if (isdefined(var_ec862c2c00c7ab5d.var_dd4f509b9c56c76f[i].type)) {
                type = var_ec862c2c00c7ab5d.var_dd4f509b9c56c76f[i].type;
            }
            if (isdefined(var_ec862c2c00c7ab5d.var_dd4f509b9c56c76f[i].tier)) {
                tier = var_ec862c2c00c7ab5d.var_dd4f509b9c56c76f[i].tier;
            }
            if (isdefined(var_ec862c2c00c7ab5d.var_dd4f509b9c56c76f[i].nationality)) {
                var_177db62b63710f5d = var_ec862c2c00c7ab5d.var_dd4f509b9c56c76f[i].nationality;
            }
        }
        i = i + 1;
        if (tier != 1 && tier != 2 && tier != 3) {
            tier = 1;
        }
        tier = function_53c4c53197386572(var_96e335eae30651e5, tier);
        aitype = namespace_bfef6903bca5845d::function_d5bc07eabf352abb(loc, undefined, "guard", type, tier, function_53c4c53197386572(var_177db62b63710f5d, nationality));
        agent = namespace_bfef6903bca5845d::ai_mp_requestSpawnAgent(aitype, loc.origin, loc.angles, "medium", "reinforcements", "elevatorSpawn", undefined, team, undefined, poiName);
        if (isdefined(agent)) {
            agents[agents.size] = agent;
        } else if (istrue(level.var_ba36989c7e24e4ff)) {
            /#
                println("<unknown string>" + poiName);
            #/
        }
        if (agents.size >= numagents) {
            break;
        }
    }
    if (istrue(level.var_ba36989c7e24e4ff)) {
        /#
            println("<unknown string>" + elevator.id);
        #/
    }
    if (isdefined(level.var_d5078bbad0790ae7)) {
        [[ level.var_d5078bbad0790ae7 ]](agents, poiName);
    }
    if (agents.size > 0) {
        elevator notify("continue");
        var_db76c4bb596d090e = elevator.floors[elevator.var_33de00df8a9fbbe0];
        if (isdefined(elevator.exitposition)) {
            var_2bd923437ecc04bd = [0:elevator.exitposition, 1:var_c5e7fce963586ec0];
        } else {
            var_2bd923437ecc04bd = [0:var_db76c4bb596d090e.var_bd440a13487263ef, 1:var_c5e7fce963586ec0];
        }
        var_fae1573b43b85605 = [0:32, 1:level.var_e006c96f4eb13b4f];
        foreach (agent in agents) {
            agent thread function_a2500a5266b0321a(agent, var_2bd923437ecc04bd, 0, var_fae1573b43b85605, undefined, undefined, undefined, level.var_1c8cbd78af4920d0);
        }
    } else {
        elevator notify("terminated");
        if (istrue(level.var_ba36989c7e24e4ff)) {
            /#
                println("<unknown string>" + elevator.id);
            #/
        }
    }
    return agents;
}

// Namespace namespace_f44f6fccbcedc09c/namespace_ab6776a0c2e19905
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x100a
// Size: 0x23c
function function_a2500a5266b0321a(agent, var_2bd923437ecc04bd, var_e298cec41261345c, var_446dcc73fa900995, var_21f24aecb313e479, var_3e332762c9138001, var_69565040c77112ce, var_1b3d1c2f22b62206) {
    agent endon("death");
    var_913774985c12c245 = var_2bd923437ecc04bd;
    namespace_2000a83505151e5b::function_bd9acc7c99ad884(agent, var_913774985c12c245, var_e298cec41261345c, var_446dcc73fa900995, var_21f24aecb313e479, var_3e332762c9138001, var_69565040c77112ce, var_1b3d1c2f22b62206);
    /#
        agent thread function_8e8bcc406e7ce286(var_2bd923437ecc04bd, var_446dcc73fa900995, var_21f24aecb313e479);
    #/
    foreach (index, var_c5e7fce963586ec0 in var_2bd923437ecc04bd) {
        /#
            logstring("<unknown string>" + agent getentitynumber() + "<unknown string>" + agent.origin + "<unknown string>" + var_c5e7fce963586ec0);
            agent.var_918cca4fbce14da9 = index;
        #/
        agent thread namespace_2000a83505151e5b::function_a5117518725da028(agent, var_c5e7fce963586ec0, var_e298cec41261345c, var_446dcc73fa900995[index], var_21f24aecb313e479, var_3e332762c9138001, var_69565040c77112ce, 1, var_1b3d1c2f22b62206);
        msg = agent waittill_any_return_2("combatRushComplete", "bad_path");
        if (msg == "bad_path") {
            agent notify("cancelCombatRush");
            agent clearbtgoal(0);
            agent clearbtgoal(1);
            self.goalradius = 1000;
            self.var_9ff99cfc426066a2 = self.goalradius;
            agent.var_b43f6cad28078a05 = 0;
            if (isalive(agent) && isdefined(self.fnsetstealthstate)) {
                agent namespace_6db9b2dcda758664::bt_set_stealth_state("idle", undefined);
            }
            agent.var_5db03b1bf90d04ee = 1;
            /#
                logstring("<unknown string>" + agent getentitynumber() + "<unknown string>" + agent.origin + "<unknown string>" + var_c5e7fce963586ec0);
            #/
        }
        var_913774985c12c245 = array_remove(var_913774985c12c245, var_c5e7fce963586ec0);
        namespace_2000a83505151e5b::function_6e3dd46c3475cd2d(agent, var_913774985c12c245, var_e298cec41261345c, var_446dcc73fa900995[index], var_21f24aecb313e479, var_3e332762c9138001, var_69565040c77112ce, var_1b3d1c2f22b62206);
        waitframe();
        if (!isdefined(var_2bd923437ecc04bd[index + 1])) {
            if (isdefined(var_1b3d1c2f22b62206)) {
                [[ var_1b3d1c2f22b62206 ]](agent);
            } else {
                agent thread namespace_2000a83505151e5b::function_9bbf1713a14fa580(agent, var_21f24aecb313e479, var_e298cec41261345c, var_c5e7fce963586ec0);
            }
        }
    }
}

// Namespace namespace_f44f6fccbcedc09c/namespace_ab6776a0c2e19905
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x124d
// Size: 0x4a
function function_bd1c3703fc1e9ff7() {
    result = waittill_any_return_2("continue", "terminated");
    if (result == "continue") {
        self.state = "pop_doors_open";
    } else if (result == "terminated") {
        namespace_2067e9d40332bfec::function_1526944ef1762358();
    }
}

// Namespace namespace_f44f6fccbcedc09c/namespace_ab6776a0c2e19905
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x129e
// Size: 0x279
function function_ec009a967d1d5eb9() {
    var_db76c4bb596d090e = self.floors[self.var_33de00df8a9fbbe0];
    var_db76c4bb596d090e.aiclip connectpaths();
    var_db76c4bb596d090e.aiclip.origin = var_db76c4bb596d090e.aiclip.origin + (0, 0, 2000);
    var_db76c4bb596d090e thread namespace_2067e9d40332bfec::function_88c392696fd02dc4();
    self.car thread anim_single_solo(self.car, "open");
    doors = var_db76c4bb596d090e.doors;
    foreach (door in doors) {
        if (isdefined(door.bulletclip)) {
            door.bulletclip.origin = door.clip.var_c2fac7a209524732;
        }
    }
    wait(3);
    var_3d5f0a2bbd7c908c = 1;
    var_6b1da470fcee5528 = 0;
    self.var_3d2410757012b419 = [];
    self.var_7a27c9558344447a = [];
    while (var_3d5f0a2bbd7c908c) {
        var_3d5f0a2bbd7c908c = function_dd2d6d3e79c578a8(var_db76c4bb596d090e);
        if (!var_3d5f0a2bbd7c908c) {
            function_d0f6f9e250eb7ca4();
            break;
        } else {
            function_30d8131dc6519a0a(var_db76c4bb596d090e);
        }
        if (var_6b1da470fcee5528 >= getdvarint(@"hash_934907c8f7add660", 30)) {
            agentarray = getaiarrayinradius(var_db76c4bb596d090e.origin, 250);
            foreach (agent in agentarray) {
                if (isalive(agent) && agent istouching(var_db76c4bb596d090e.var_90dabe3606074803)) {
                    var_95f125b69bd6e39e = getclosestpointonnavmesh(self.var_c5e7fce963586ec0);
                    agent.var_a417fdce20c4d0d7 = var_95f125b69bd6e39e;
                    agent.var_1339ff53060f729 = agent.goalpos;
                }
            }
            break;
        }
        wait(0.2);
        var_6b1da470fcee5528 = var_6b1da470fcee5528 + 0.2;
    }
    self.state = "pop_doors_closing";
}

// Namespace namespace_f44f6fccbcedc09c/namespace_ab6776a0c2e19905
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x151e
// Size: 0x46c
function function_8b680b3ef155fc34() {
    var_db76c4bb596d090e = self.floors[self.var_33de00df8a9fbbe0];
    var_4b1e414172fec3a8 = var_db76c4bb596d090e.indicator;
    var_db76c4bb596d090e thread namespace_2067e9d40332bfec::function_d32c693d3a04f8f8();
    self.car thread anim_single_solo(self.car, "close");
    var_db76c4bb596d090e.aiclip.origin = var_db76c4bb596d090e.aiclip.origin + (0, 0, -2000);
    var_db76c4bb596d090e.aiclip disconnectpaths();
    doors = var_db76c4bb596d090e.doors;
    foreach (door in doors) {
        if (isdefined(door.bulletclip)) {
            door.bulletclip.origin = door.clip.var_f16d407674809f11;
        }
    }
    wait(1);
    agentarray = getaiarrayinradius(var_db76c4bb596d090e.origin, 250);
    foreach (agent in agentarray) {
        if (isalive(agent)) {
            var_8bdb743b1288e020 = (agent.origin[0], agent.origin[1], agent.origin[2] + 50);
            if (ispointinvolume(var_8bdb743b1288e020, var_db76c4bb596d090e.var_907e66d3bf42c5a)) {
                self.var_7a27c9558344447a[self.var_7a27c9558344447a.size] = agent;
            }
        }
    }
    if (self.var_7a27c9558344447a.size > 0) {
        logstring("=============== Kill agents in Elevator  ===============");
        if (!isdefined(self.notification)) {
            self.notification = "Reinforcement pop";
        }
        logstring("Event notification: " + self.notification);
        logstring("Elevator Id: " + self.id);
        logstring("Elevator Front Position: " + var_db76c4bb596d090e.var_bd440a13487263ef);
        foreach (agent in self.var_7a27c9558344447a) {
            var_8eb298b7c41c360 = "[ Kill agent ]" + " Orign: " + agent.origin + " agent_type: " + agent.agent_type;
            if (isdefined(agent.var_a417fdce20c4d0d7)) {
                var_8eb298b7c41c360 = var_8eb298b7c41c360 + " NavAdjustedCombatRushOrigin: " + agent.var_a417fdce20c4d0d7;
            } else {
                var_95f125b69bd6e39e = getclosestpointonnavmesh(self.var_c5e7fce963586ec0);
                var_8eb298b7c41c360 = var_8eb298b7c41c360 + "NavAdjustedCombatRushOrigin: " + var_95f125b69bd6e39e;
            }
            if (isdefined(agent.var_1339ff53060f729)) {
                var_8eb298b7c41c360 = var_8eb298b7c41c360 + " GoalPos: " + agent.var_1339ff53060f729;
            } else {
                var_8eb298b7c41c360 = var_8eb298b7c41c360 + " GoalPos: " + agent.goalpos;
            }
            logstring(var_8eb298b7c41c360);
            /#
                level thread function_17fa0b0f3fced1c5(agent);
            #/
            agent setorigin((agent.origin[0], agent.origin[1], -2000));
        }
        waitframe();
        foreach (agent in self.var_7a27c9558344447a) {
            agent kill();
        }
        /#
            if (self.var_7a27c9558344447a.size != 0) {
                /#
                    assertmsg(self.var_7a27c9558344447a.size + "<unknown string>" + self.id);
                #/
            }
        #/
        logstring("=============== Kill agents in Elevator End ===============");
    }
    var_4b1e414172fec3a8 setscriptablepartstate("model", "off", 0);
    namespace_2067e9d40332bfec::function_1526944ef1762358();
}

// Namespace namespace_f44f6fccbcedc09c/namespace_ab6776a0c2e19905
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1991
// Size: 0x10c
function function_30d8131dc6519a0a(var_c8f6f1542970369c) {
    foreach (player in level.players) {
        if (isalive(player)) {
            if (distancesquared(player.origin, var_c8f6f1542970369c.doors[0].clip.origin) < 10000) {
                if (!array_contains(self.var_3d2410757012b419, player)) {
                    player namespace_58fb4f2e73fd41a0::setlowermessageomnvar("br_dmz_biolab_reinforcement_door");
                    self.var_3d2410757012b419[self.var_3d2410757012b419.size] = player;
                }
            } else if (array_contains(self.var_3d2410757012b419, player)) {
                player namespace_58fb4f2e73fd41a0::setlowermessageomnvar("clear_lower_msg");
                self.var_3d2410757012b419 = array_remove(self.var_3d2410757012b419, player);
            }
        }
    }
}

// Namespace namespace_f44f6fccbcedc09c/namespace_ab6776a0c2e19905
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aa4
// Size: 0x66
function function_d0f6f9e250eb7ca4() {
    foreach (player in self.var_3d2410757012b419) {
        if (isalive(player)) {
            player namespace_58fb4f2e73fd41a0::setlowermessageomnvar("clear_lower_msg");
        }
    }
}

// Namespace namespace_f44f6fccbcedc09c/namespace_ab6776a0c2e19905
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b11
// Size: 0xac
function function_dd2d6d3e79c578a8(var_c8f6f1542970369c) {
    aiarray = getaiarrayinradius(var_c8f6f1542970369c.origin, 250);
    foreach (ai in aiarray) {
        if (!isalive(ai)) {
            continue;
        }
        if (ai.agent_type == "actor_enemy_mp_boss_velikan") {
            return 1;
        } else if (ai istouching(var_c8f6f1542970369c.var_90dabe3606074803)) {
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_f44f6fccbcedc09c/namespace_ab6776a0c2e19905
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1bc5
// Size: 0x90
function function_17fa0b0f3fced1c5(agent) {
    /#
        level endon("<unknown string>");
        if (!isdefined(agent)) {
            return;
        }
        origin = agent.origin;
        entnumber = agent getentitynumber();
        var_f010e552f292a480 = (0, 1, 0);
        var_58e7b7390381f53b = 64;
        while (1) {
            sphere(origin, var_58e7b7390381f53b, var_f010e552f292a480);
            print3d(origin, "<unknown string>" + entnumber + "<unknown string>" + origin);
            waitframe();
        }
    #/
}

// Namespace namespace_f44f6fccbcedc09c/namespace_ab6776a0c2e19905
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x1c5c
// Size: 0x192
function function_8e8bcc406e7ce286(var_2bd923437ecc04bd, var_446dcc73fa900995, var_21f24aecb313e479) {
    /#
        level endon("<unknown string>");
        self endon("<unknown string>");
        setdevdvarifuninitialized(@"hash_ba0f92d8d4dac63c", 0);
        while (1) {
            if (getdvarint(@"hash_ba0f92d8d4dac63c", 0)) {
                if (isdefined(self.var_918cca4fbce14da9)) {
                    line(self.origin, var_2bd923437ecc04bd[self.var_918cca4fbce14da9], (1, 0, 0), 1, 0, 1);
                }
                start = undefined;
                for (i = 0; i < var_2bd923437ecc04bd.size; i++) {
                    end = var_2bd923437ecc04bd[i];
                    if (isdefined(start)) {
                        line(start, end, (1, 0, 0), 1, 0, 1);
                    }
                    sphere(var_2bd923437ecc04bd[i], var_446dcc73fa900995[i], (1, 0, 0), 0, 1);
                    debugstar(var_2bd923437ecc04bd[i], (1, 0, 0), 1, "<unknown string>" + i);
                    start = end;
                }
                if (istrue(self.var_5db03b1bf90d04ee)) {
                    debugstar(self.origin + (0, 0, 40), (1, 0, 0), 1, "<unknown string>");
                }
                if (isdefined(var_21f24aecb313e479)) {
                    debugstar(var_2bd923437ecc04bd[var_2bd923437ecc04bd.size] + (0, 0, 30), (0, 0, 1), 1, "<unknown string>" + var_21f24aecb313e479);
                }
            }
            waitframe();
        }
    #/
}

