#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\poi.gsc;
#using scripts\common\anim.gsc;
#using scripts\mp\anim.gsc;
#using script_5c118165d3e98a42;
#using script_48814951e916af89;
#using scripts\mp\ai_behavior.gsc;
#using script_41ba451876d0900c;
#using scripts\stealth\enemy.gsc;
#using scripts\mp\utility\lower_message.gsc;

#namespace namespace_f44f6fccbcedc09c;

// Namespace namespace_f44f6fccbcedc09c / namespace_ab6776a0c2e19905
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x492
// Size: 0x65
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

// Namespace namespace_f44f6fccbcedc09c / namespace_ab6776a0c2e19905
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4ff
// Size: 0x5c
function function_fa4b99570c140545() {
    level endon("game_ended");
    while (!istrue(level.var_b212a36bec6cf8da)) {
        waitframe();
    }
    namespace_2067e9d40332bfec::function_ba13d98dab57ca7e("elevator_group_reinforcement_pop", "pop_wait_spawn", &function_bd1c3703fc1e9ff7);
    namespace_2067e9d40332bfec::function_ba13d98dab57ca7e("elevator_group_reinforcement_pop", "pop_doors_open", &function_ec009a967d1d5eb9);
    namespace_2067e9d40332bfec::function_ba13d98dab57ca7e("elevator_group_reinforcement_pop", "pop_doors_closing", &function_8b680b3ef155fc34);
}

// Namespace namespace_f44f6fccbcedc09c / namespace_ab6776a0c2e19905
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x563
// Size: 0x15e
function function_84ffc1f1220ca72b() {
    mainnodes = getstructarray("reinforcementPackage_mainNode", "script_noteworthy");
    packages = [];
    foreach (mainnode in mainnodes) {
        package = spawnstruct();
        package.origin = mainnode.origin;
        package.spawnnodes = getstructarray(mainnode.target, "targetname");
        package.floor = 0;
        if (isdefined(level.var_172e4b629498723c)) {
            package.floor = [[ level.var_172e4b629498723c ]](mainnode.origin);
        }
        assertex(isdefined(package.floor), "setupReinforcementNodes(): the package [" + mainnode.target + "] isn't in any floor volume!");
        assertex(!isdefined(packages[mainnode.target]), "setupReinforcementNodes(): Duplicate target [" + mainnode.target + "] for reinforcementPackage_mainNode!");
        packages[mainnode.target] = package;
    }
    return packages;
}

// Namespace namespace_f44f6fccbcedc09c / namespace_ab6776a0c2e19905
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6ca
// Size: 0x84
function function_d6cc02d264845807() {
    var_aa1fc3193d666f74 = getstructarray("reinforcement_patrolPath", "script_noteworthy");
    pathstructs = [];
    foreach (var_deb16fded9e9e6cf in var_aa1fc3193d666f74) {
        pathstructs[var_deb16fded9e9e6cf.targetname] = namespace_bfef6903bca5845d::function_9edcf99159abb0b(var_deb16fded9e9e6cf);
    }
    return pathstructs;
}

// Namespace namespace_f44f6fccbcedc09c / namespace_ab6776a0c2e19905
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x757
// Size: 0x3b
function function_184496a131fc4014(origin) {
    allpackages = sortbydistance(level.var_fb4c92e328823a89, origin);
    if (allpackages.size > 0) {
        return allpackages[0].spawnnodes;
    }
    return [];
}

// Namespace namespace_f44f6fccbcedc09c / namespace_ab6776a0c2e19905
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x79b
// Size: 0x148
function function_98fb1ef948f4612b(reinforceorigin) {
    if (level.mapname == "mp_bio_lab" || level.mapname == "mp_biobunker") {
        elevator = namespace_2067e9d40332bfec::function_92beb6591366ab26("reinforcement_pop", "elevator_group_reinforcement_pop", "pop_wait_spawn", reinforceorigin, "elevator_pick_rule_ideal");
        if (isdefined(elevator)) {
            elevator.reinforceorigin = reinforceorigin;
        }
        return elevator;
    }
    if (!isdefined(level.reinforceelevators)) {
        return undefined;
    }
    bestelevator = undefined;
    foreach (elevator in sortbydistance(level.reinforceelevators, reinforceorigin)) {
        if (istrue(elevator.inuse)) {
            continue;
        }
        if (!isdefined(bestelevator) || !isdefined(elevator.endusetime) || isdefined(bestelevator.endusetime) && isdefined(elevator.endusetime) && elevator.endusetime < bestelevator.endusetime) {
            bestelevator = elevator;
        }
    }
    if (isdefined(bestelevator)) {
        bestelevator thread elevator_think();
        return bestelevator;
    }
}

// Namespace namespace_f44f6fccbcedc09c / namespace_ab6776a0c2e19905
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8eb
// Size: 0x1d2
function elevator_think() {
    self.inuse = 1;
    result = waittill_any_return_2("continue", "terminated");
    if (result != "continue") {
        self.inuse = undefined;
        return;
    }
    elevatorfloor = self.floors[self.currentfloor];
    elevatorfloor thread namespace_2067e9d40332bfec::function_88c392696fd02dc4();
    self.car thread anim_single_solo(self.car, "open");
    wait 3;
    for (var_6b1da470fcee5528 = 0; function_dd2d6d3e79c578a8(elevatorfloor); var_6b1da470fcee5528 += 0.2) {
        if (var_6b1da470fcee5528 >= getdvarint(@"hash_934907c8f7add660", 30)) {
            break;
        }
        wait 0.2;
    }
    elevatorfloor thread namespace_2067e9d40332bfec::function_d32c693d3a04f8f8();
    self.car thread anim_single_solo(self.car, "close");
    wait 1;
    agentarray = getaiarrayinradius(elevatorfloor.origin, 250);
    foreach (agent in agentarray) {
        if (!isalive(agent)) {
            continue;
        }
        var_8bdb743b1288e020 = (agent.origin[0], agent.origin[1], agent.origin[2] + 50);
        if (ispointinvolume(var_8bdb743b1288e020, elevatorfloor.var_907e66d3bf42c5a)) {
            agent namespace_bfef6903bca5845d::function_28b90eb2b591003f();
        }
    }
    self.endusetime = gettime();
    wait 5;
    self.inuse = undefined;
}

// Namespace namespace_f44f6fccbcedc09c / namespace_ab6776a0c2e19905
// Params 15, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xac5
// Size: 0x53c
function function_892161ab9ad430e3(numagents, var_ec862c2c00c7ab5d, reinforceorigin, priority, category, subcategory, groupname, team, var_93390a6953905fef, poiname, var_180734f7c2a9866f, var_f03b10101d704759, var_fb59c1ab2600d2f6, nationality, overridetier) {
    reinforceorigin = scripts\mp\ai_behavior::function_d378cc95abab583b(reinforceorigin, poiname);
    reinforceorigin = scripts\mp\ai_behavior::function_61cbc488b27a6e61(reinforceorigin);
    if (!isdefined(poiname)) {
        poiname = scripts\mp\poi::function_6cc445c02b5effac(reinforceorigin);
    }
    if (isdefined(level.var_d32282f99e9d01b8)) {
        if (!istrue([[ level.var_d32282f99e9d01b8 ]](reinforceorigin))) {
            return undefined;
        }
    }
    elevator = function_98fb1ef948f4612b(reinforceorigin);
    if (!isdefined(elevator)) {
        if (istrue(level.var_ba36989c7e24e4ff)) {
            println("<dev string:x1c>" + reinforceorigin);
        }
        return undefined;
    }
    if (isdefined(elevator.spawnlocs)) {
        spawnlocs = elevator.spawnlocs;
    } else {
        spawnlocs = function_184496a131fc4014(elevator.car.origin);
    }
    assertex(spawnlocs.size > 0, "Reinforce Request: No available spawnLocs around:  " + elevator.id);
    if (istrue(level.var_ba36989c7e24e4ff)) {
        println("<dev string:x4d>" + elevator.id);
    }
    agents = [];
    i = 0;
    foreach (loc in spawnlocs) {
        tier = undefined;
        if (isdefined(level.var_8209a75b03499110)) {
            tier = [[ level.var_8209a75b03499110 ]](poiname);
        } else {
            tier = namespace_bfef6903bca5845d::function_aa34a142b7664dd1(namespace_6a3f8c14894f44be::function_5cc0c507e92f7b47(poiname));
        }
        type = undefined;
        overridenationality = undefined;
        if (isdefined(var_ec862c2c00c7ab5d) && isdefined(var_ec862c2c00c7ab5d.requests) && isdefined(var_ec862c2c00c7ab5d.requests[i])) {
            if (isdefined(var_ec862c2c00c7ab5d.requests[i].type)) {
                type = var_ec862c2c00c7ab5d.requests[i].type;
            }
            if (isdefined(var_ec862c2c00c7ab5d.requests[i].tier)) {
                tier = var_ec862c2c00c7ab5d.requests[i].tier;
            }
            if (isdefined(var_ec862c2c00c7ab5d.requests[i].nationality)) {
                overridenationality = var_ec862c2c00c7ab5d.requests[i].nationality;
            }
        }
        i += 1;
        if (tier != 1 && tier != 2 && tier != 3) {
            tier = 1;
        }
        tier = default_to(overridetier, tier);
        aitype = namespace_bfef6903bca5845d::function_d5bc07eabf352abb(loc, undefined, "guard", type, tier, default_to(overridenationality, nationality));
        agent = namespace_bfef6903bca5845d::ai_mp_requestspawnagent(aitype, loc.origin, loc.angles, "medium", "reinforcements", "elevatorSpawn", undefined, team, undefined, poiname);
        if (isdefined(agent)) {
            agents[agents.size] = agent;
        } else if (istrue(level.var_ba36989c7e24e4ff)) {
            println("<dev string:x78>" + poiname);
        }
        if (agents.size >= numagents) {
            break;
        }
    }
    if (istrue(level.var_ba36989c7e24e4ff)) {
        println("<dev string:xa5>" + elevator.id);
    }
    if (isdefined(level.var_d5078bbad0790ae7)) {
        [[ level.var_d5078bbad0790ae7 ]](agents, poiname);
    }
    if (agents.size > 0) {
        elevator notify("continue");
        elevatorextbutton = elevator.floors[elevator.currentfloor];
        if (isdefined(elevator.exitposition)) {
            var_2bd923437ecc04bd = [elevator.exitposition, reinforceorigin];
        } else {
            var_2bd923437ecc04bd = [elevatorextbutton.frontposition, reinforceorigin];
        }
        var_fae1573b43b85605 = [32, level.var_e006c96f4eb13b4f];
        foreach (agent in agents) {
            agent thread function_a2500a5266b0321a(agent, var_2bd923437ecc04bd, 0, var_fae1573b43b85605, undefined, undefined, undefined, level.var_1c8cbd78af4920d0);
        }
    } else {
        elevator notify("terminated");
        if (istrue(level.var_ba36989c7e24e4ff)) {
            println("<dev string:xd1>" + elevator.id);
        }
    }
    return agents;
}

// Namespace namespace_f44f6fccbcedc09c / namespace_ab6776a0c2e19905
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x100a
// Size: 0x23b
function function_a2500a5266b0321a(agent, var_2bd923437ecc04bd, var_e298cec41261345c, var_446dcc73fa900995, var_21f24aecb313e479, var_3e332762c9138001, rushgroup, var_1b3d1c2f22b62206) {
    agent endon("death");
    var_913774985c12c245 = var_2bd923437ecc04bd;
    scripts\mp\ai_behavior::function_bd9acc7c99ad884(agent, var_913774985c12c245, var_e298cec41261345c, var_446dcc73fa900995, var_21f24aecb313e479, var_3e332762c9138001, rushgroup, var_1b3d1c2f22b62206);
    /#
        agent thread function_8e8bcc406e7ce286(var_2bd923437ecc04bd, var_446dcc73fa900995, var_21f24aecb313e479);
    #/
    foreach (index, reinforceorigin in var_2bd923437ecc04bd) {
        /#
            logstring("<dev string:xfb>" + agent getentitynumber() + "<dev string:x101>" + agent.origin + "<dev string:x114>" + reinforceorigin);
            agent.var_918cca4fbce14da9 = index;
        #/
        agent thread scripts\mp\ai_behavior::function_a5117518725da028(agent, reinforceorigin, var_e298cec41261345c, var_446dcc73fa900995[index], var_21f24aecb313e479, var_3e332762c9138001, rushgroup, 1, var_1b3d1c2f22b62206);
        msg = agent waittill_any_return_2("combatRushComplete", "bad_path");
        if (msg == "bad_path") {
            agent notify("cancelCombatRush");
            agent clearbtgoal(0);
            agent clearbtgoal(1);
            self.goalradius = 1000;
            self.script_goalradius = self.goalradius;
            agent.var_b43f6cad28078a05 = 0;
            if (isalive(agent) && isdefined(self.fnsetstealthstate)) {
                agent scripts\stealth\enemy::bt_set_stealth_state("idle", undefined);
            }
            agent.var_5db03b1bf90d04ee = 1;
            /#
                logstring("<dev string:xfb>" + agent getentitynumber() + "<dev string:x11b>" + agent.origin + "<dev string:x114>" + reinforceorigin);
            #/
        }
        var_913774985c12c245 = array_remove(var_913774985c12c245, reinforceorigin);
        scripts\mp\ai_behavior::function_6e3dd46c3475cd2d(agent, var_913774985c12c245, var_e298cec41261345c, var_446dcc73fa900995[index], var_21f24aecb313e479, var_3e332762c9138001, rushgroup, var_1b3d1c2f22b62206);
        waitframe();
        if (!isdefined(var_2bd923437ecc04bd[index + 1])) {
            if (isdefined(var_1b3d1c2f22b62206)) {
                [[ var_1b3d1c2f22b62206 ]](agent);
                continue;
            }
            agent thread scripts\mp\ai_behavior::function_9bbf1713a14fa580(agent, var_21f24aecb313e479, var_e298cec41261345c, reinforceorigin);
        }
    }
}

// Namespace namespace_f44f6fccbcedc09c / namespace_ab6776a0c2e19905
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x124d
// Size: 0x49
function function_bd1c3703fc1e9ff7() {
    result = waittill_any_return_2("continue", "terminated");
    if (result == "continue") {
        self.state = "pop_doors_open";
        return;
    }
    if (result == "terminated") {
        namespace_2067e9d40332bfec::releaseelevator();
    }
}

// Namespace namespace_f44f6fccbcedc09c / namespace_ab6776a0c2e19905
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x129e
// Size: 0x278
function function_ec009a967d1d5eb9() {
    elevatorextbutton = self.floors[self.currentfloor];
    elevatorextbutton.aiclip connectpaths();
    elevatorextbutton.aiclip.origin += (0, 0, 2000);
    elevatorextbutton thread namespace_2067e9d40332bfec::function_88c392696fd02dc4();
    self.car thread anim_single_solo(self.car, "open");
    doors = elevatorextbutton.doors;
    foreach (door in doors) {
        if (isdefined(door.bulletclip)) {
            door.bulletclip.origin = door.clip.openposition;
        }
    }
    wait 3;
    var_3d5f0a2bbd7c908c = 1;
    var_6b1da470fcee5528 = 0;
    self.var_3d2410757012b419 = [];
    self.var_7a27c9558344447a = [];
    while (var_3d5f0a2bbd7c908c) {
        var_3d5f0a2bbd7c908c = function_dd2d6d3e79c578a8(elevatorextbutton);
        if (!var_3d5f0a2bbd7c908c) {
            function_d0f6f9e250eb7ca4();
            break;
        } else {
            function_30d8131dc6519a0a(elevatorextbutton);
        }
        if (var_6b1da470fcee5528 >= getdvarint(@"hash_934907c8f7add660", 30)) {
            agentarray = getaiarrayinradius(elevatorextbutton.origin, 250);
            foreach (agent in agentarray) {
                if (isalive(agent) && agent istouching(elevatorextbutton.var_90dabe3606074803)) {
                    var_95f125b69bd6e39e = getclosestpointonnavmesh(self.reinforceorigin);
                    agent.var_a417fdce20c4d0d7 = var_95f125b69bd6e39e;
                    agent.var_1339ff53060f729 = agent.goalpos;
                }
            }
            break;
        }
        wait 0.2;
        var_6b1da470fcee5528 += 0.2;
    }
    self.state = "pop_doors_closing";
}

// Namespace namespace_f44f6fccbcedc09c / namespace_ab6776a0c2e19905
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x151e
// Size: 0x46b
function function_8b680b3ef155fc34() {
    elevatorextbutton = self.floors[self.currentfloor];
    elevatorindicator = elevatorextbutton.indicator;
    elevatorextbutton thread namespace_2067e9d40332bfec::function_d32c693d3a04f8f8();
    self.car thread anim_single_solo(self.car, "close");
    elevatorextbutton.aiclip.origin += (0, 0, -2000);
    elevatorextbutton.aiclip disconnectpaths();
    doors = elevatorextbutton.doors;
    foreach (door in doors) {
        if (isdefined(door.bulletclip)) {
            door.bulletclip.origin = door.clip.initialorigin;
        }
    }
    wait 1;
    agentarray = getaiarrayinradius(elevatorextbutton.origin, 250);
    foreach (agent in agentarray) {
        if (isalive(agent)) {
            var_8bdb743b1288e020 = (agent.origin[0], agent.origin[1], agent.origin[2] + 50);
            if (ispointinvolume(var_8bdb743b1288e020, elevatorextbutton.var_907e66d3bf42c5a)) {
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
        logstring("Elevator Front Position: " + elevatorextbutton.frontposition);
        foreach (agent in self.var_7a27c9558344447a) {
            printedstring = "[ Kill agent ]" + " Orign: " + agent.origin + " agent_type: " + agent.agent_type;
            if (isdefined(agent.var_a417fdce20c4d0d7)) {
                printedstring = printedstring + " NavAdjustedCombatRushOrigin: " + agent.var_a417fdce20c4d0d7;
            } else {
                var_95f125b69bd6e39e = getclosestpointonnavmesh(self.reinforceorigin);
                printedstring = printedstring + "NavAdjustedCombatRushOrigin: " + var_95f125b69bd6e39e;
            }
            if (isdefined(agent.var_1339ff53060f729)) {
                printedstring = printedstring + " GoalPos: " + agent.var_1339ff53060f729;
            } else {
                printedstring = printedstring + " GoalPos: " + agent.goalpos;
            }
            logstring(printedstring);
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
                assertmsg(self.var_7a27c9558344447a.size + "<dev string:x13a>" + self.id);
            }
        #/
        logstring("=============== Kill agents in Elevator End ===============");
    }
    elevatorindicator setscriptablepartstate("model", "off", 0);
    namespace_2067e9d40332bfec::releaseelevator();
}

// Namespace namespace_f44f6fccbcedc09c / namespace_ab6776a0c2e19905
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1991
// Size: 0x10b
function function_30d8131dc6519a0a(extbutton) {
    foreach (player in level.players) {
        if (isalive(player)) {
            if (distancesquared(player.origin, extbutton.doors[0].clip.origin) < 10000) {
                if (!array_contains(self.var_3d2410757012b419, player)) {
                    player scripts\mp\utility\lower_message::setlowermessageomnvar("br_dmz_biolab_reinforcement_door");
                    self.var_3d2410757012b419[self.var_3d2410757012b419.size] = player;
                }
                continue;
            }
            if (array_contains(self.var_3d2410757012b419, player)) {
                player scripts\mp\utility\lower_message::setlowermessageomnvar("clear_lower_msg");
                self.var_3d2410757012b419 = array_remove(self.var_3d2410757012b419, player);
            }
        }
    }
}

// Namespace namespace_f44f6fccbcedc09c / namespace_ab6776a0c2e19905
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1aa4
// Size: 0x65
function function_d0f6f9e250eb7ca4() {
    foreach (player in self.var_3d2410757012b419) {
        if (isalive(player)) {
            player scripts\mp\utility\lower_message::setlowermessageomnvar("clear_lower_msg");
        }
    }
}

// Namespace namespace_f44f6fccbcedc09c / namespace_ab6776a0c2e19905
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1b11
// Size: 0xab
function function_dd2d6d3e79c578a8(extbutton) {
    aiarray = getaiarrayinradius(extbutton.origin, 250);
    foreach (ai in aiarray) {
        if (!isalive(ai)) {
            continue;
        }
        if (ai.agent_type == "actor_enemy_mp_boss_velikan") {
            return true;
        }
        if (ai istouching(extbutton.var_90dabe3606074803)) {
            return true;
        }
    }
    return false;
}

/#

    // Namespace namespace_f44f6fccbcedc09c / namespace_ab6776a0c2e19905
    // Params 1, eflags: 0x0
    // Checksum 0x0, Offset: 0x1bc5
    // Size: 0x8f
    function function_17fa0b0f3fced1c5(agent) {
        level endon("<dev string:x17e>");
        if (!isdefined(agent)) {
            return;
        }
        origin = agent.origin;
        entnumber = agent getentitynumber();
        var_f010e552f292a480 = (0, 1, 0);
        var_58e7b7390381f53b = 64;
        while (true) {
            sphere(origin, var_58e7b7390381f53b, var_f010e552f292a480);
            print3d(origin, "<dev string:x189>" + entnumber + "<dev string:x191>" + origin);
            waitframe();
        }
    }

    // Namespace namespace_f44f6fccbcedc09c / namespace_ab6776a0c2e19905
    // Params 3, eflags: 0x0
    // Checksum 0x0, Offset: 0x1c5c
    // Size: 0x191
    function function_8e8bcc406e7ce286(var_2bd923437ecc04bd, var_446dcc73fa900995, var_21f24aecb313e479) {
        level endon("<dev string:x17e>");
        self endon("<dev string:x1a0>");
        setdevdvarifuninitialized(@"hash_ba0f92d8d4dac63c", 0);
        while (true) {
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
                    debugstar(var_2bd923437ecc04bd[i], (1, 0, 0), 1, "<dev string:x1a6>" + i);
                    start = end;
                }
                if (istrue(self.var_5db03b1bf90d04ee)) {
                    debugstar(self.origin + (0, 0, 40), (1, 0, 0), 1, "<dev string:x1b8>");
                }
                if (isdefined(var_21f24aecb313e479)) {
                    debugstar(var_2bd923437ecc04bd[var_2bd923437ecc04bd.size] + (0, 0, 30), (0, 0, 1), 1, "<dev string:x1cc>" + var_21f24aecb313e479);
                }
            }
            waitframe();
        }
    }

#/
