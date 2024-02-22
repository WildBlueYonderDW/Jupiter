// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using script_5def7af2a9f04234;
#using scripts\mp\equipment\molotov.gsc;
#using scripts\mp\utility\debug.gsc;
#using scripts\mp\flags.gsc;
#using scripts\stealth\enemy.gsc;
#using scripts\cp_mp\utility\debug_utility.gsc;
#using script_120270bd0a747a35;
#using scripts\stealth\group.gsc;
#using script_48814951e916af89;
#using scripts\asm\asm_bb.gsc;
#using script_371b4c2ab5861e62;
#using script_4948cdf739393d2d;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace namespace_7a13d4762231d63e;

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5e7
// Size: 0x19
function function_2585b1944b7884c0() {
    registersharedfunc("pyro", "molotov_used", &namespace_df478cc572a311d3::molotov_used);
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x607
// Size: 0x34
function function_304da84d9a815c01(origin, goalradius, var_3a21f8213541aec5) {
    _setgoalpos(origin, goalradius);
    if (istrue(var_3a21f8213541aec5)) {
        level thread function_5d96b05a065564e(self);
    }
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x642
// Size: 0x146
function _setgoalpos(origin, goalradius, var_1b6352ceb9bbc1d) {
    if (istrue(self.fixednode) || !isalive(self) || isdefined(self.vehicle)) {
        return;
    }
    if (!istrue(var_1b6352ceb9bbc1d)) {
        function_c6930ac29fe6ff53(goalradius);
    }
    safeorigin = self getclosestreachablepointonnavmesh(origin, 0);
    if (!isdefined(safeorigin)) {
        /#
            println("behavior_combatRushOrigin: combat rush reinforceOrigin (" + origin);
        #/
        return;
    }
    if (!isdefined(self.origin)) {
        /#
            assertmsg("_setGoalPos: agent.origin is undefined. Agent has died?");
        #/
        return;
    }
    dist = distance(self.origin, safeorigin);
    if (dist < 12500 && dist > 20) {
        if (0) {
            thread namespace_d028276791d9cff6::drawsphere(safeorigin, 32, 10, (0, 1, 0));
        }
        self setgoalpos(safeorigin);
    } else if (dist >= 12500 && !istrue(self.var_9dfc77ce3cd9e879)) {
        /#
            assertmsg("_setGoalPos: goal pos is too far from agent origin - dist: " + dist + " goalpos: " + safeorigin + " agent origin:" + self.origin + " origin: " + origin + " EntityNumber:" + self getentitynumber());
        #/
        thread function_9bbf1713a14fa580(self, 1024);
    }
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x78f
// Size: 0x2e
function function_c6930ac29fe6ff53(goalradius) {
    if (!isdefined(goalradius)) {
        goalradius = 128;
    }
    self.goalradius = int(goalradius);
    self.var_9ff99cfc426066a2 = goalradius;
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x7c4
// Size: 0x1c
function function_b91038b6725a259a(agent, targetent) {
    agent setgoalentity(targetent);
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e7
// Size: 0x14
function function_aa8f023c16fc448d(node) {
    self setgoalnode(node);
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x802
// Size: 0x32
function function_61cbc488b27a6e61(origin) {
    var_b2fa71142f056491 = getclosestpointonnavmesh(origin);
    groundorigin = drop_to_ground(var_b2fa71142f056491, 64);
    return groundorigin;
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x83c
// Size: 0x21
function function_1670c315976c767b() {
    while (!namespace_4b0406965e556711::gameflagexists("prematch_done")) {
        waitframe();
    }
    namespace_4b0406965e556711::gameflagwait("prematch_done");
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x864
// Size: 0xf0
function function_b11c1964f528574b(agent, var_ba8b04eb4b683e67, origin) {
    var_2ae805b43221a762 = origin;
    if (isagent(agent) && !isdefined(origin)) {
        var_2ae805b43221a762 = agent.origin;
    }
    if (istrue(var_ba8b04eb4b683e67)) {
        function_d1e130608e4f8487(agent, var_2ae805b43221a762, var_ba8b04eb4b683e67);
    } else {
        function_e786aa52b93833eb(agent, var_2ae805b43221a762, 25, 10);
    }
    if (isint(agent)) {
        return;
    }
    agent endon("death");
    agent endon("stealth_investigate");
    agent endon("stealth_hunt");
    agent endon("stealth_combat");
    agent endon("startCombatRush");
    function_1670c315976c767b();
    wait(1);
    if (isdefined(origin) && distance2dsquared(origin, agent.origin) > 4096) {
        agent function_304da84d9a815c01(origin, 32, 1);
        agent waittill("goal");
    } else if (!isdefined(origin)) {
        origin = agent.origin;
    }
    if (!istrue(var_ba8b04eb4b683e67)) {
        agent behavior_executebehaviorpackage(agent);
    }
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x95b
// Size: 0x22b
function function_9bbf1713a14fa580(agent, radius, var_c154e6e386654a30, origin) {
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
    function_e786aa52b93833eb(agent, var_2ae805b43221a762, radius, var_c154e6e386654a30);
    if (isint(agent)) {
        return;
    }
    agent endon("death");
    agent endon("stealth_investigate");
    agent endon("stealth_hunt");
    agent endon("stealth_combat");
    agent endon("startCombatRush");
    agent notify("guardWander");
    agent endon("guardWander");
    function_1670c315976c767b();
    wait(1);
    if (isdefined(origin) && distance2dsquared(origin, agent.origin) > 4096) {
        agent function_304da84d9a815c01(origin, 32, 1);
        agent waittill("goal");
    }
    originalorigin = agent.origin;
    min = radius - var_c154e6e386654a30;
    max = radius + var_c154e6e386654a30;
    agent.var_9dfc77ce3cd9e879 = 1;
    while (!isdefined(agent.enemy)) {
        var_bcfec646853a95c1 = randomfloatrange(min, max) * namespace_3c37cb17ade254d::ter_op(randomint(100) > 50, 1, -1);
        var_bcfec546853a938e = randomfloatrange(min, max) * namespace_3c37cb17ade254d::ter_op(randomint(100) > 50, 1, -1);
        var_b30a6c38cd4fe517 = (originalorigin[0] + var_bcfec646853a95c1, originalorigin[1] + var_bcfec546853a938e, originalorigin[2]);
        if (distance2d(agent.origin, var_b30a6c38cd4fe517) > 20) {
            agent _setgoalpos(var_b30a6c38cd4fe517, 8);
            agent thread function_bf182f1600fec92a(agent);
            agent waittill_any_2("goal", "refreshGoalPos");
        }
        wait(randomfloatrange(7.5, 10.5));
    }
    agent _setgoalpos(var_2ae805b43221a762, 768);
    agent.var_9dfc77ce3cd9e879 = undefined;
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb8d
// Size: 0x1ea
function function_a057ee9adc9547d5(agent, radius, var_c154e6e386654a30, origin) {
    var_2ae805b43221a762 = origin;
    if (isagent(agent) && !isdefined(origin)) {
        var_2ae805b43221a762 = agent.origin;
    }
    if (!isdefined(radius)) {
        radius = 1000;
    }
    if (!isdefined(var_c154e6e386654a30) || var_c154e6e386654a30 <= 0) {
        var_c154e6e386654a30 = 200;
    }
    function_fe5620595915170f(agent, var_2ae805b43221a762, radius, var_c154e6e386654a30);
    if (isint(agent)) {
        return;
    }
    agent endon("death");
    agent endon("stealth_investigate");
    agent endon("stealth_hunt");
    agent endon("stealth_combat");
    agent endon("startCombatRush");
    function_1670c315976c767b();
    wait(1);
    if (isdefined(origin) && distance2dsquared(origin, agent.origin) > 4096) {
        agent function_304da84d9a815c01(origin, 32, 1);
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
            agent thread function_bf182f1600fec92a(agent);
            agent waittill_any_2("goal", "refreshGoalPos");
        }
        wait(randomfloatrange(7.5, 10.5));
    }
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd7e
// Size: 0x41
function function_bf182f1600fec92a(agent, time) {
    agent endon("goal");
    agent endon("death");
    waittime = 5;
    if (isdefined(time)) {
        waittime = time;
    }
    wait(waittime);
    agent notify("refreshGoalPos");
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdc6
// Size: 0x323
function function_25cc93d439c3033a(var_886dfa499937a071, pathstruct, startindex, var_87d4c4075f48ec58, var_c75025a5b8eb8d36) {
    if (!isdefined(var_886dfa499937a071[0])) {
        return;
    }
    level endon("game_ended");
    var_a1d5907e01730345 = 0;
    foreach (agent in var_886dfa499937a071) {
        var_f8bc7ecdd324dd79 = function_f0c78111ce0cdc0a(agent);
        if (!isdefined(var_f8bc7ecdd324dd79) || var_f8bc7ecdd324dd79.behavior != "patrol") {
            if (level.var_fe093e9b2b6c3751) {
                function_4561fe6bfc76f8ec(agent, [0:agent], pathstruct);
            } else {
                function_4561fe6bfc76f8ec(agent, var_886dfa499937a071, pathstruct);
            }
        }
        if (isagent(agent)) {
            agent notify("patrolStart");
            agent endon("patrolStart");
            agent endon("death");
            agent endon("stealth_investigate");
            agent endon("stealth_hunt");
            agent endon("stealth_combat");
            agent endon("startCombatRush");
            var_a1d5907e01730345 = 1;
        }
    }
    if (!var_a1d5907e01730345) {
        return;
    }
    level thread function_b4fd9f6bd59a64f0(var_886dfa499937a071);
    path = pathstruct.path;
    pathstruct.claimed = 1;
    index = 1;
    var_47ea45f5bcf10fc3 = 1;
    if (isdefined(startindex)) {
        index = startindex;
        index = int(min(index, path.size - 1));
        index = int(max(index, 0));
    }
    function_1670c315976c767b();
    wait(1);
    while (1) {
        if (isvector(path[index])) {
            point = path[index];
        } else {
            point = path[index].origin;
        }
        foreach (var_6843d82ed42ea7de, agent in var_886dfa499937a071) {
            if (var_6843d82ed42ea7de != 0) {
                var_bcfec646853a95c1 = randomfloatrange(30, 31) * namespace_3c37cb17ade254d::ter_op(cointoss(), 1, -1);
                var_bcfec546853a938e = randomfloatrange(30, 31) * namespace_3c37cb17ade254d::ter_op(cointoss(), 1, -1);
                point = (point[0] + var_bcfec646853a95c1, point[1] + var_bcfec546853a938e, point[2]);
            }
            agent _setgoalpos(point, function_53c4c53197386572(var_87d4c4075f48ec58, 128));
            wait(randomfloatrange(1.5, 2.5));
        }
        waitframe();
        var_886dfa499937a071[0] waittill("goal");
        if (istrue(var_886dfa499937a071[0].var_cf430336d17e3afe)) {
            wait(0.5);
        } else {
            wait(function_53c4c53197386572(var_c75025a5b8eb8d36, 8));
        }
        if (var_47ea45f5bcf10fc3) {
            index++;
        } else {
            index--;
        }
        if (!isdefined(path[index])) {
            if (!pathstruct.var_4437e81f60b6b5a0) {
                index = 0;
            } else if (var_47ea45f5bcf10fc3) {
                index = path.size - 2;
                var_47ea45f5bcf10fc3 = 0;
            } else {
                index = 1;
                var_47ea45f5bcf10fc3 = 1;
            }
        }
    }
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x10f0
// Size: 0x19c
function function_b4fd9f6bd59a64f0(var_886dfa499937a071) {
    level endon("game_ended");
    foreach (agent in var_886dfa499937a071) {
        agent endon("stealth_investigate");
        agent endon("stealth_hunt");
        agent endon("stealth_combat");
    }
    var_37cbbc36d167b305 = 0;
    while (!var_37cbbc36d167b305) {
        foreach (agent in var_886dfa499937a071) {
            if (isdefined(agent) && !isalive(agent)) {
                var_37cbbc36d167b305 = 1;
            }
        }
        wait(1);
    }
    wait(2.5);
    foreach (agent in var_886dfa499937a071) {
        if (isdefined(agent) && isalive(agent)) {
            event = spawnstruct();
            event.type = "investigate";
            event.typeorig = "found_corpse";
            event.origin = agent.origin;
            event.investigate_pos = agent.origin;
            agent namespace_6db9b2dcda758664::bt_set_stealth_state("investigate", event);
        }
    }
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1293
// Size: 0xe8
function function_21014e3c42bcc249(event) {
    agent = self;
    if (isdefined(agent.var_f8bc7ecdd324dd79) && isdefined(agent.var_f8bc7ecdd324dd79.var_39e3177c55f34e64) && isdefined(agent.var_f8bc7ecdd324dd79.var_a34f6fb5917d2093)) {
        self setgoalpos(self.var_f8bc7ecdd324dd79.var_39e3177c55f34e64, self.var_f8bc7ecdd324dd79.var_a34f6fb5917d2093);
        if (isdefined(agent.var_14c360ebec241178)) {
            agent.maxsightdistsqrd = agent.var_14c360ebec241178;
        }
    } else if (event.type == "combat" && !istrue(agent.var_b43f6cad28078a05)) {
        self.goalradius = level.var_8912ccad342445f7;
    }
    return 0;
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1383
// Size: 0x77
function function_1a2e58ffaafb1d40(var_db585b8134eed64c) {
    foreach (pathstruct in var_db585b8134eed64c) {
        if (istrue(pathstruct.claimed)) {
            continue;
        } else {
            pathstruct.claimed = 1;
            return pathstruct;
        }
    }
    return undefined;
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1402
// Size: 0x19f
function function_7e69553f058c867b(agent) {
    agent endon("death");
    var_8bb792d43ecd8d1e = getdvarint(@"hash_401ebd6ca7f17d87", 0);
    while (1) {
        if ([[ agent.fnisinstealthidle ]]()) {
            if (istrue(agent.var_39f1cf3b225fefa6)) {
                agent.var_39f1cf3b225fefa6 = 0;
                function_447a25af0131832e(agent);
            }
        } else if ([[ agent.fnisinstealthinvestigate ]]()) {
            agent.var_39f1cf3b225fefa6 = 1;
        } else if ([[ agent.fnisinstealthcombat ]]()) {
            agent.var_39f1cf3b225fefa6 = 1;
            if (var_8bb792d43ecd8d1e <= 0) {
                wait(5);
                continue;
            }
            if (isdefined(agent.var_f8bc7ecdd324dd79) && agent.var_f8bc7ecdd324dd79.behavior == "guard") {
                wait(5);
                continue;
            }
            if (isdefined(agent.enemy)) {
                agent getenemyinfo(agent.enemy);
                if (issubstr(agent.script_stealthgroup, "fortress")) {
                    wait(10);
                    continue;
                }
                roll = randomint(100);
                if (roll > var_8bb792d43ecd8d1e) {
                    _setgoalpos(agent.enemy.origin, 1000);
                }
                wait(10);
            }
        } else if ([[ agent.fnisinstealthhunt ]]()) {
            agent.var_39f1cf3b225fefa6 = 1;
            if (istrue(level.var_69173c5e957cccff)) {
                agent thread function_67ddae411c6c353e(agent);
            }
        }
        wait(5);
    }
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x15a8
// Size: 0x70
function function_67ddae411c6c353e(agent) {
    agent endon("death");
    agent endon("stealth_combat");
    agent endon("startCombatRush");
    interval = 1;
    curtime = 0;
    while (curtime < level.var_ec80e35c609c1533) {
        wait(interval);
        curtime = curtime + interval;
        if (istrue(agent.var_b43f6cad28078a05)) {
            return;
        }
    }
    agent namespace_6db9b2dcda758664::bt_set_stealth_state("idle", undefined);
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x161f
// Size: 0x143
function function_447a25af0131832e(agent) {
    if (!isdefined(agent.var_f8bc7ecdd324dd79)) {
        function_d1e130608e4f8487(agent);
    }
    if (agent.var_f8bc7ecdd324dd79.behavior == "patrol") {
        agentarray = [];
        foreach (var_a49f3e62ba7c6d8a in agent.var_f8bc7ecdd324dd79.var_886dfa499937a071) {
            if (isdefined(var_a49f3e62ba7c6d8a) && isalive(var_a49f3e62ba7c6d8a) && isdefined(agent.var_f8bc7ecdd324dd79) && isdefined(var_a49f3e62ba7c6d8a.var_f8bc7ecdd324dd79) && isdefined(var_a49f3e62ba7c6d8a.var_f8bc7ecdd324dd79.pathstruct) && agent.var_f8bc7ecdd324dd79.pathstruct == var_a49f3e62ba7c6d8a.var_f8bc7ecdd324dd79.pathstruct) {
                agentarray[agentarray.size] = var_a49f3e62ba7c6d8a;
            }
        }
        agent.var_f8bc7ecdd324dd79.var_886dfa499937a071 = agentarray;
    }
    behavior_executebehaviorpackage(agent);
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1769
// Size: 0x11d
function function_65f6a39e1083fb6b(agent, var_2bd923437ecc04bd, var_e298cec41261345c, var_87d4c4075f48ec58, var_21f24aecb313e479, var_3e332762c9138001, var_69565040c77112ce, var_1b3d1c2f22b62206) {
    agent endon("death");
    var_913774985c12c245 = var_2bd923437ecc04bd;
    function_6e3dd46c3475cd2d(agent, var_913774985c12c245, var_e298cec41261345c, var_87d4c4075f48ec58, var_21f24aecb313e479, var_3e332762c9138001, var_69565040c77112ce, var_1b3d1c2f22b62206);
    foreach (index, var_c5e7fce963586ec0 in var_2bd923437ecc04bd) {
        agent thread function_a5117518725da028(agent, var_c5e7fce963586ec0, var_e298cec41261345c, var_87d4c4075f48ec58, var_21f24aecb313e479, var_3e332762c9138001, var_69565040c77112ce, 1, var_1b3d1c2f22b62206);
        agent waittill("combatRushComplete");
        var_913774985c12c245 = array_remove(var_913774985c12c245, var_c5e7fce963586ec0);
        function_6e3dd46c3475cd2d(agent, var_913774985c12c245, var_e298cec41261345c, var_87d4c4075f48ec58, var_21f24aecb313e479, var_3e332762c9138001, var_69565040c77112ce, var_1b3d1c2f22b62206);
        waitframe();
        if (!isdefined(var_2bd923437ecc04bd[index + 1])) {
            if (isdefined(var_1b3d1c2f22b62206)) {
                [[ var_1b3d1c2f22b62206 ]](agent);
            } else {
                agent thread function_9bbf1713a14fa580(agent, var_21f24aecb313e479, var_e298cec41261345c, var_c5e7fce963586ec0);
            }
        }
    }
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 10, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x188d
// Size: 0x4ca
function function_a5117518725da028(agent, var_c5e7fce963586ec0, var_e298cec41261345c, var_87d4c4075f48ec58, var_21f24aecb313e479, var_3e332762c9138001, var_69565040c77112ce, var_66db74486a8f804, var_1b3d1c2f22b62206, targetent) {
    if (!isdefined(agent) || !isalive(agent) || !isdefined(var_c5e7fce963586ec0)) {
        return;
    }
    if (isdefined(var_c5e7fce963586ec0) && !isvector(var_c5e7fce963586ec0)) {
        return;
    }
    if (issubstr(agent.agent_type, "jugg")) {
        return;
    }
    if (!isdefined(var_e298cec41261345c)) {
        var_e298cec41261345c = 128;
    }
    if (!isdefined(var_87d4c4075f48ec58)) {
        var_87d4c4075f48ec58 = 256;
    }
    if (!isdefined(var_21f24aecb313e479)) {
        var_21f24aecb313e479 = 768;
    }
    if (!isdefined(var_3e332762c9138001)) {
        var_3e332762c9138001 = 1;
    }
    if (isagent(agent) && distance(agent.origin, var_c5e7fce963586ec0) > 12500) {
        /#
            assertmsg("behavior_combatRushOrigin: combat rush reinforceOrigin (" + var_c5e7fce963586ec0 + ") is too far from where agent is at (" + agent.origin + ")");
        #/
        /#
            print3d(agent.origin, "<unknown string>", (1, 0, 0), 1, 5, 60, 1);
            level thread namespace_f2ffc0540883e1ad::drawsphere(agent.origin, 256, 60, (0, 1, 0));
            level thread namespace_f2ffc0540883e1ad::drawsphere(var_c5e7fce963586ec0, 256, 60, (1, 1, 0));
            level thread namespace_f2ffc0540883e1ad::drawline(agent.origin, var_c5e7fce963586ec0, 60, (1, 1, 0));
        #/
        agent thread function_9bbf1713a14fa580(agent, 1024);
        return;
    }
    if (!istrue(var_66db74486a8f804)) {
        function_bd9acc7c99ad884(agent, var_c5e7fce963586ec0, var_e298cec41261345c, var_87d4c4075f48ec58, var_21f24aecb313e479, var_3e332762c9138001, var_69565040c77112ce, var_1b3d1c2f22b62206);
    }
    if (isint(agent)) {
        return;
    }
    agent endon("death");
    agent endon("cancelCombatRush");
    agent notify("startCombatRush");
    agent notify("endCQB");
    agent.var_b43f6cad28078a05 = 1;
    var_95f125b69bd6e39e = var_c5e7fce963586ec0;
    if (var_e298cec41261345c > 0) {
        var_95f125b69bd6e39e = var_95f125b69bd6e39e + (randomfloatrange(-1 * var_e298cec41261345c, var_e298cec41261345c), randomfloatrange(-1 * var_e298cec41261345c, var_e298cec41261345c), 0);
    }
    var_95f125b69bd6e39e = function_61cbc488b27a6e61(var_95f125b69bd6e39e);
    self.var_5323a94889eff1de = 1;
    if (isdefined(agent.script_stealthgroup)) {
        agent.var_9a04c6cfe15e92a7 = var_95f125b69bd6e39e;
    }
    agent namespace_6db9b2dcda758664::bt_event_combat();
    agent setbtgoalpos(0, var_95f125b69bd6e39e);
    agent setbtgoalpos(1, var_95f125b69bd6e39e);
    agent setbtgoalradius(0, var_87d4c4075f48ec58);
    agent setbtgoalradius(1, var_87d4c4075f48ec58);
    agent function_304da84d9a815c01(var_95f125b69bd6e39e, var_87d4c4075f48ec58, !var_3e332762c9138001);
    agent childthread function_547dc153b092906d(agent, 1024, undefined, var_95f125b69bd6e39e, var_3e332762c9138001, var_66db74486a8f804);
    while (1) {
        dist = distance2d(agent.origin, var_95f125b69bd6e39e);
        time = max(dist / 50, 10);
        msg = "badMessage";
        while (agent pathdisttogoal() == 0) {
            waitframe();
        }
        if (istrue(var_3e332762c9138001)) {
            msg = agent waittill_any_timeout_3(time, "goal", "goal_reached", "bt_goal");
        } else {
            msg = agent waittill_any_timeout_5(time, "goal", "goal_reached", "bad_path", "endBadPathHandler", "bt_goal");
            agent notify("endBadPathHandler");
        }
        if (msg != "bt_goal" || distance2d(agent.origin, var_95f125b69bd6e39e) < var_87d4c4075f48ec58) {
            break;
        }
    }
    self.var_5323a94889eff1de = 0;
    if (isdefined(agent.script_stealthgroup)) {
        function_467f737adf6aeee4(agent.script_stealthgroup);
        groupmembers = function_ba90928315aa754d(agent.script_stealthgroup);
        if (groupmembers.size == 0) {
            groupmembers = [0:agent];
        }
    } else {
        groupmembers = [0:agent];
    }
    if (isdefined(var_69565040c77112ce)) {
        groupmembers = array_combine_unique(groupmembers, var_69565040c77112ce);
    }
    foreach (member in groupmembers) {
        var_2bc30fcff884b1ba = 0;
        if (member == agent) {
            var_2bc30fcff884b1ba = 1;
        }
        member thread function_490ff4d545e089bc(member, var_2bc30fcff884b1ba, var_21f24aecb313e479);
    }
    if (!istrue(var_66db74486a8f804)) {
        if (isdefined(var_1b3d1c2f22b62206)) {
            [[ var_1b3d1c2f22b62206 ]](agent, targetent);
        } else {
            agent thread function_9bbf1713a14fa580(agent, var_21f24aecb313e479, var_e298cec41261345c, var_c5e7fce963586ec0);
        }
    }
    agent notify("combatRushComplete");
    agent.var_9f78b0c726e807ff = 0;
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d5e
// Size: 0xe7
function function_490ff4d545e089bc(agent, var_2bc30fcff884b1ba, var_145bc4a8e47c0991, var_34ed52869f44afbb, var_1e6879f36e59bea5) {
    agent endon("death");
    agent notify("end_combat_rush_early_target_think");
    agent clearbtgoal(0);
    agent clearbtgoal(1);
    agent function_c6930ac29fe6ff53(var_145bc4a8e47c0991);
    agent.var_b43f6cad28078a05 = 0;
    if (!istrue(var_2bc30fcff884b1ba)) {
        agent notify("cancelCombatRush");
        agent notify("combatRushComplete");
        namespace_2000a83505151e5b::function_d1e130608e4f8487(agent);
        if (!isdefined(var_34ed52869f44afbb)) {
            var_34ed52869f44afbb = 2;
        }
        if (!isdefined(var_1e6879f36e59bea5)) {
            var_1e6879f36e59bea5 = 8;
        }
        wait(randomintrange(var_34ed52869f44afbb, var_1e6879f36e59bea5));
    }
    agent notify("endBadPathHandler");
    if (isdefined(agent.script_stealthgroup)) {
        function_467f737adf6aeee4(agent.script_stealthgroup);
    }
    if (isalive(agent) && isdefined(self.fnsetstealthstate)) {
        agent namespace_6db9b2dcda758664::bt_set_stealth_state("idle", undefined);
    }
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1e4c
// Size: 0xd4
function function_547dc153b092906d(agent, var_996e8fd3b531dc2a, var_709abaa772d0d110, var_95f125b69bd6e39e, var_3e332762c9138001, var_66db74486a8f804) {
    agent notify("end_combat_rush_early_target_think");
    agent endon("end_combat_rush_early_target_think");
    if (!isdefined(var_709abaa772d0d110)) {
        var_709abaa772d0d110 = 1024;
    }
    while (agent pathdisttogoal() == 0) {
        waitframe();
    }
    waitframe();
    while (agent pathdisttogoal() > min(128, var_996e8fd3b531dc2a) || istrue(agent.var_b43f6cad28078a05)) {
        if (agent isknownenemyinradius(agent.origin, var_709abaa772d0d110) && istrue(agent.var_b43f6cad28078a05)) {
            agent thread function_55149707e1d77b1e(var_709abaa772d0d110, agent.scriptgoalpos, var_3e332762c9138001, var_66db74486a8f804);
            agent.var_b43f6cad28078a05 = 0;
            agent notify("cancelCombatRush");
        }
        waitframe();
    }
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1f27
// Size: 0xf5
function function_55149707e1d77b1e(var_709abaa772d0d110, var_95f125b69bd6e39e, var_3e332762c9138001, var_66db74486a8f804) {
    self notify("engaging_nearby");
    self endon("engaging_nearby");
    self endon("death");
    self setbtgoalpos(1, self.origin);
    self setbtgoalradius(1, var_709abaa772d0d110);
    anchor = self.origin;
    self requestcoverfind(0, 0);
    var_340723983982aa94 = 3;
    has_enemy = 1;
    while (has_enemy) {
        while (self isknownenemyinradius(anchor, var_709abaa772d0d110)) {
            wait(2);
        }
        curtime = 0;
        has_enemy = 0;
        while (curtime <= var_340723983982aa94 && !has_enemy) {
            wait(1);
            curtime++;
            if (self isknownenemyinradius(anchor, var_709abaa772d0d110)) {
                has_enemy = 1;
            }
        }
    }
    self clearbtgoal(1);
    waitframe();
    thread namespace_2000a83505151e5b::function_a5117518725da028(self, var_95f125b69bd6e39e, 0, undefined, undefined, var_3e332762c9138001, undefined, var_66db74486a8f804);
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2023
// Size: 0x93
function function_9af4d877e8bb0ac1(groupname) {
    group = namespace_e5c9a7258a3d79cb::getgroup(groupname);
    if (!isdefined(group)) {
        return;
    } else {
        group.var_a0d0ac92fcf29af0 = 1;
    }
    waitframe();
    foreach (pod in group.pods) {
        pod.var_dff7984130ece673 = 1;
    }
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x20bd
// Size: 0xdf
function function_467f737adf6aeee4(groupname) {
    group = namespace_e5c9a7258a3d79cb::getgroup(groupname);
    foreach (pod in group.pods) {
        pod.var_dff7984130ece673 = 0;
        foreach (member in pod.members) {
            member notify("endBadPathHandler");
        }
    }
    group.var_a0d0ac92fcf29af0 = 0;
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21a3
// Size: 0xd2
function function_ba90928315aa754d(groupname) {
    group = namespace_e5c9a7258a3d79cb::getgroup(groupname);
    members = [];
    foreach (pod in group.pods) {
        foreach (member in pod.members) {
            members[members.size] = member;
        }
    }
    return members;
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x227d
// Size: 0x52
function function_5d96b05a065564e(agent) {
    level endon("game_ended");
    agent endon("death");
    agent endon("endBadPathHandler");
    while (1) {
        var_772edbdcfe906c73 = agent waittill("bad_path");
        [[ level.var_9d28d5b70aa9f5e4 ]](agent, var_772edbdcfe906c73);
        agent notify("endBadPathHandler");
    }
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x22d6
// Size: 0x163
function function_9d28d5b70aa9f5e4(agent, var_772edbdcfe906c73) {
    agent notify("cancelCombatRush");
    if (isdefined(agent.vehicle)) {
        return;
    }
    var_21a106fa806846d1 = level.var_f79746dab56dca8c;
    origin = undefined;
    if (isdefined(var_21a106fa806846d1) && var_21a106fa806846d1.size > 0) {
        var_21a106fa806846d1 = sortbydistance(var_21a106fa806846d1, var_772edbdcfe906c73);
        origin = var_21a106fa806846d1[0].origin;
    } else {
        origin = agent.origin;
    }
    dist = distance(agent.origin, origin);
    if (dist >= 12500) {
        /#
            assertmsg("ai_badPathHandler: goal pos is too far from agent origin - dist: " + dist + " goalpos: " + origin + " agent origin:" + agent.origin);
        #/
        agent thread function_9bbf1713a14fa580(agent, 1024);
    } else {
        agent function_304da84d9a815c01(origin, 2048);
        agent setbtgoalpos(0, origin);
        agent setbtgoalpos(1, origin);
    }
    if (0) {
        thread namespace_d028276791d9cff6::drawsphere(agent.origin, 32, 15, (1, 0, 1));
        thread namespace_d028276791d9cff6::drawsphere(origin, 32, 15, (1, 0, 1));
        thread namespace_f2ffc0540883e1ad::drawline(agent.origin, origin, 15, (1, 1, 0));
    }
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2440
// Size: 0x2e2
function function_5867290fda7a1ac1(spawnpos, var_5078a08cc4ec9d12, var_1bfa1d374486da61, spawnheight) {
    if (!isdefined(var_1bfa1d374486da61)) {
        var_1bfa1d374486da61 = 1000;
    }
    var_4f4704d728a0eb78 = getdvarfloat(@"hash_7cea12faaeb9d47");
    var_f77fb43ed7ec5bd2 = 0;
    if (isdefined(var_4f4704d728a0eb78) && var_4f4704d728a0eb78 > 0) {
        var_f77fb43ed7ec5bd2 = (var_4f4704d728a0eb78 - var_1bfa1d374486da61) / var_4f4704d728a0eb78;
    }
    var_4e333f60b3b1f754 = function_7c093aaec980131b(spawnpos, 0);
    if (isdefined(var_4e333f60b3b1f754) && var_4e333f60b3b1f754 > var_f77fb43ed7ec5bd2) {
        if (isdefined(spawnheight) && spawnheight > 0) {
            var_3d2e1a01edb70022 = (0, 0, spawnheight);
        } else {
            var_3d2e1a01edb70022 = (0, 0, 60);
        }
        players = utility::playersincylinder(spawnpos, var_1bfa1d374486da61);
        if (players.size >= 9) {
            return 0;
        }
        foreach (player in players) {
            visibility = 0;
            playereyepos = player geteye();
            if (isdefined(var_5078a08cc4ec9d12) && var_5078a08cc4ec9d12 > 100) {
                var_612d65b2bea1caa0 = player.origin - spawnpos;
                if (length(var_612d65b2bea1caa0) < var_5078a08cc4ec9d12 + 20) {
                    return 0;
                }
                var_9e7c1f93b9df1f01 = var_5078a08cc4ec9d12 * vectornormalize(rotatevector(var_612d65b2bea1caa0, (0, 90, 0)));
                var_13a4573340b58dc0 = var_5078a08cc4ec9d12 * vectornormalize(rotatevector(var_612d65b2bea1caa0, (0, -90, 0)));
                var_9e7c1f93b9df1f01 = getclosestpointonnavmesh(spawnpos + var_9e7c1f93b9df1f01);
                var_13a4573340b58dc0 = getclosestpointonnavmesh(spawnpos + var_13a4573340b58dc0);
                var_f4dc0469c31c4cb0 = 0;
                var_6e4343a0dd67e8d1 = 0;
                var_42a1b87e920e3a70 = 0;
                if (within_fov(player.origin, player.angles, var_9e7c1f93b9df1f01, 0)) {
                    var_f4dc0469c31c4cb0 = spawnsighttrace(undefined, var_9e7c1f93b9df1f01 + var_3d2e1a01edb70022, playereyepos);
                }
                if (within_fov(player.origin, player.angles, var_13a4573340b58dc0, 0)) {
                    var_6e4343a0dd67e8d1 = spawnsighttrace(undefined, var_13a4573340b58dc0 + var_3d2e1a01edb70022, playereyepos);
                }
                if (within_fov(player.origin, player.angles, spawnpos, 0)) {
                    var_42a1b87e920e3a70 = spawnsighttrace(undefined, spawnpos + var_3d2e1a01edb70022, playereyepos);
                }
                visibility = max(max(var_f4dc0469c31c4cb0, var_6e4343a0dd67e8d1), var_42a1b87e920e3a70);
            } else if (within_fov(player.origin, player.angles, spawnpos, 0)) {
                visibility = spawnsighttrace(undefined, spawnpos + var_3d2e1a01edb70022, playereyepos);
            }
            if (visibility > 0.1) {
                return 0;
            }
        }
    }
    return 1;
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x272a
// Size: 0x257
function function_d378cc95abab583b(origin, poiname) {
    if (isdefined(origin)) {
        return origin;
    }
    level.var_1b4461e4447da676++;
    if (level.var_1b4461e4447da676 % level.var_3e6588e7a225a933 == 0) {
        var_2f28b3b3b8359e4b = [];
        var_e5bf5fac2822316 = level.agentarray;
        if (namespace_37f0fb6355a4618a::function_47d356083884f913()) {
            var_e5bf5fac2822316 = function_7e3f22e620f3f71e(poiname, "everybody");
        }
        foreach (agent in var_e5bf5fac2822316) {
            if (isdefined(agent.enemy) && isalive(agent.enemy) && isplayer(agent.enemy)) {
                var_2f28b3b3b8359e4b[var_2f28b3b3b8359e4b.size] = agent.enemy;
            }
        }
        if (var_2f28b3b3b8359e4b.size > 0) {
            player = random(var_2f28b3b3b8359e4b);
            return player.origin;
        }
    }
    var_9b3bb378db91cf83 = [];
    if (function_47d356083884f913()) {
        if (!isdefined(poiname)) {
            poiname = function_6cc445c02b5effac(origin);
        }
        var_9b3bb378db91cf83 = array_combine(level.poi[poiname]["heliReinforceStruct"].var_4f922af45d0cac6c, level.poi[poiname]["heliReinforceStruct"].var_c9464c89a69010e2);
        if (isdefined(level.var_f1073fbd45b59a06.var_1d7353058ea3a9f1)) {
            foreach (fortress in level.var_f1073fbd45b59a06.var_1d7353058ea3a9f1) {
                if (fortress.poi == poiname) {
                    var_9b3bb378db91cf83[var_9b3bb378db91cf83.size] = fortress;
                }
            }
        }
    } else {
        var_9b3bb378db91cf83 = array_combine(level.helireinforcestruct.var_4f922af45d0cac6c, level.helireinforcestruct.var_c9464c89a69010e2);
    }
    return random(var_9b3bb378db91cf83).origin;
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2989
// Size: 0x37
function function_e4275ec4ec5dcdd0(agent, origin, radius) {
    agent endon("death");
    while (1) {
        wait(4);
        function_304da84d9a815c01(origin, radius);
    }
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x29c7
// Size: 0xd5
function function_38eeb3c2a1b3bd14(agent) {
    level endon("game_ended");
    agent endon("death");
    agent endon("alerted_to_player");
    while (1) {
        foreach (player in level.players) {
            if (isdefined(player) && isalive(player)) {
                if (function_59565896f06f1220(agent, player)) {
                    agent.goalradius = 1024;
                    agent.dont_enter_combat = 0;
                    agent.combatmode = "cover";
                    agent function_9f82c74eb1b7caf9(1);
                    agent notify("alerted_to_player");
                    return;
                }
            }
        }
        wait(0.1);
    }
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2aa3
// Size: 0x6a
function function_a0e63fe5c7a71428(agent) {
    level endon("game_ended");
    agent endon("death");
    agent endon("alerted_to_player");
    eattacker = idamage = agent waittill("damage");
    agent.goalradius = 250;
    agent.dont_enter_combat = 0;
    agent function_9f82c74eb1b7caf9(0);
    agent notify("alerted_to_player");
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2b14
// Size: 0x56
function function_59565896f06f1220(agent, player) {
    incloserange = distance(agent.origin, player.origin) <= 256;
    var_30068470264cde43 = agent cansee(player);
    return incloserange && var_30068470264cde43;
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2b72
// Size: 0x104
function function_a80e7e8f2c9d73c(event) {
    agent = self;
    level endon("game_ended");
    agent endon("death");
    if (!namespace_4b0406965e556711::gameflagexists("prematch_done") || namespace_4b0406965e556711::gameflagexists("prematch_done") && !namespace_4b0406965e556711::gameflag("prematch_done")) {
        return;
    }
    if (randomint(100) < 50) {
        agent namespace_6db9b2dcda758664::bt_set_stealth_state("combat", undefined);
    }
    wait(randomintrange(8, 11));
    agent namespace_6db9b2dcda758664::bt_set_stealth_state("combat", undefined);
    if (level.var_58ac9ebcf7b87b73 + level.var_d362d0481275de02 > gettime() && randomint(100) < level.var_2ef1c744d35b6312) {
        level thread namespace_bfef6903bca5845d::function_77acc10c4823dd8a(3, event.origin, "medium", "reinforcements", "foundCorpse", undefined, agent.team, 1, agent.poi);
        level.var_58ac9ebcf7b87b73 = gettime();
    }
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x2c7d
// Size: 0xb4
function function_810a6443bde30366(origin, radius, var_68ca75f051e913a) {
    agents = utility::function_2d7fd59d039fa69b(origin, radius, 0);
    if (!isdefined(var_68ca75f051e913a)) {
        var_68ca75f051e913a = origin;
    }
    foreach (agent in agents) {
        if (isdefined(agent.unittype) && agent.unittype == "civilian") {
            continue;
        }
        agent aieventlistenerevent("gunshot", self, var_68ca75f051e913a);
    }
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d38
// Size: 0xe2
function function_4c61a6fd42fa58(nodes, optional_arrived_at_node_func, var_5e38f20c9628ae25) {
    /#
        assert(isdefined(nodes));
    #/
    if (isarray(nodes) && nodes.size < 1) {
        nodes = self.spawnpoint function_9abbce4b66ee25d4();
        if (nodes.size == 0) {
            self notify("reached_path_end");
            if (isdefined(optional_arrived_at_node_func)) {
                [[ optional_arrived_at_node_func ]]();
            }
            return;
        }
    } else if (!isarray(nodes)) {
        nodes = [0:nodes];
    }
    for (i = 0; i < nodes.size; i++) {
        if (isvector(nodes[i])) {
            struct = spawnstruct();
            struct.origin = nodes[i];
            struct.angles = (0, 0, 0);
            nodes[i] = struct;
        }
    }
    function_db64d1e0f2b06482(nodes, optional_arrived_at_node_func, var_5e38f20c9628ae25);
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e21
// Size: 0x3b
function function_9abbce4b66ee25d4() {
    var_764bdb6fe546dacc = function_ee9a5bcd6b164ce2();
    if (var_764bdb6fe546dacc.size < 1) {
        if (isdefined(self.target)) {
            var_764bdb6fe546dacc = function_697e9bf539bed8b6(self.target);
        }
    }
    return var_764bdb6fe546dacc;
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e64
// Size: 0xc6
function function_697e9bf539bed8b6(target) {
    goals = getnodearray(target, "targetname");
    var_889be5a52999435e = getstructarray(target, "targetname");
    foreach (new in var_889be5a52999435e) {
        goals[goals.size] = new;
    }
    var_889be5a52999435e = getentarray(target, "targetname");
    for (i = 0; i < var_889be5a52999435e.size; i++) {
        new = var_889be5a52999435e[i];
        if (!function_f2d40d9b75cbc023(new)) {
            continue;
        }
        goals[goals.size] = new;
    }
    return goals;
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f32
// Size: 0x5e
function function_f2d40d9b75cbc023(object) {
    if (isspawner(object)) {
        return 0;
    }
    switch (object.code_classname) {
    case #"hash_1b79c5d9e0f9886a":
    case #"hash_5e0756fcd4e0adcd":
    case #"hash_8040aa10d9cac1e8":
    case #"hash_81903cb95a447b8c":
        return 0;
        break;
    }
    return 1;
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f98
// Size: 0x5b
function function_ee9a5bcd6b164ce2() {
    goals = [];
    if (isdefined(self.script_linkto)) {
        linked_ents = get_linked_ents();
        var_3d938a1343d65fed = get_linked_structs();
        var_789069f44709f226 = get_linked_nodes();
        goals = array_combine(linked_ents, var_3d938a1343d65fed, var_789069f44709f226);
    }
    return goals;
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2ffb
// Size: 0x64
function _behavior_gotonodeend() {
    self notify("_behavior_gotoNodeEnd");
    self endon("_behavior_gotoNodeEnd");
    self endon("death");
    level endon("game_ended");
    self.using_goto_node = 1;
    result = waittill_any_return_2("reached_path_end", "stop_going_to_node");
    self.using_goto_node = undefined;
    self.patharray = undefined;
    self.patharrayindex = undefined;
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3066
// Size: 0xbd
function function_95419b47267b7dea(array) {
    if (array.size == 1) {
        return array[0];
    }
    array = array_randomize(array);
    var_ad98b0b8ce2a6fde = array[0];
    if (!isdefined(var_ad98b0b8ce2a6fde.used_time)) {
        var_ad98b0b8ce2a6fde.used_time = 0;
    }
    for (i = 0; i < array.size; i++) {
        node = array[i];
        if (!isdefined(node.used_time)) {
            node.used_time = 0;
        }
        if (node.used_time < var_ad98b0b8ce2a6fde.used_time) {
            var_ad98b0b8ce2a6fde = node;
        }
    }
    var_ad98b0b8ce2a6fde.used_time = gettime();
    return var_ad98b0b8ce2a6fde;
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x312b
// Size: 0xa4
function function_db4ad034e4606091(node, startnode) {
    array = [];
    count = 0;
    while (1) {
        array[array.size] = node;
        count++;
        if (count == 16) {
            break;
        }
        if (function_91dff8e3ec6780c3(node)) {
            break;
        }
        if (!isdefined(node.target) && !isdefined(node.script_linkto)) {
            break;
        }
        nextnode_array = node function_9abbce4b66ee25d4();
        if (!nextnode_array.size) {
            break;
        }
        node = function_95419b47267b7dea(nextnode_array);
        if (node == startnode) {
            break;
        }
    }
    return array;
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31d7
// Size: 0xb5
function function_d0ea0bd3d1a6c928(patharray, optional_arrived_at_node_func, var_5e38f20c9628ae25) {
    self setgoalpath(patharray);
    for (i = 0; i < patharray.size; i++) {
        index = i;
        var_e0386cbfbccbbc5b = patharray[i];
        self.currentnode = var_e0386cbfbccbbc5b;
        function_4dea69a8c26a5378(var_e0386cbfbccbbc5b);
        patharrayindex = waittill_subgoal();
        if (index == patharray.size - 1) {
            self waittill("goal");
            break;
        }
        var_e0386cbfbccbbc5b notify("trigger", self);
        function_8d1fd30657566aea(var_e0386cbfbccbbc5b, optional_arrived_at_node_func);
        function_ef3a20cdb3c82b48(var_e0386cbfbccbbc5b);
        function_5dcbed48df675e1(var_e0386cbfbccbbc5b, var_5e38f20c9628ae25);
    }
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3293
// Size: 0x25
function is_specified_unittype(unittype) {
    return isdefined(self.unittype) && self.unittype == unittype;
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x32c0
// Size: 0x44
function function_43c2f1d3946e3ea8(demeanor) {
    demeanor = function_cd64ed2eddf5cb1c(demeanor);
    if (is_specified_unittype("civilian")) {
        namespace_28edc79fcf2fe234::bb_setcivilianstate(demeanor);
    } else if (!is_specified_unittype("juggernaut")) {
        utility::demeanor_override(demeanor);
    }
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x330b
// Size: 0x41
function function_cd64ed2eddf5cb1c(demeanor) {
    switch (demeanor) {
    case #"hash_46fdaf04e9be63e4":
    case #"hash_d320ccf96c495f71":
        return "patrol";
    default:
        return demeanor;
        break;
    }
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3353
// Size: 0xc
function function_4dea69a8c26a5378(node) {
    
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3366
// Size: 0x81
function function_8d1fd30657566aea(node, optional_arrived_at_node_func) {
    if (isdefined(optional_arrived_at_node_func)) {
        [[ optional_arrived_at_node_func ]](node);
    }
    if (isdefined(node.script_flag_set)) {
        flag_set(node.script_flag_set);
    }
    if (isdefined(node.script_ent_flag_set)) {
        ent_flag_set(node.script_ent_flag_set);
    }
    if (isdefined(node.script_flag_clear)) {
        flag_clear(node.script_flag_clear);
    }
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x33ee
// Size: 0x124
function function_ef3a20cdb3c82b48(node) {
    level endon("game_ended");
    self endon("death");
    if (!istrue(level.global_stealth_broken) && !istrue(self.entered_combat) && isdefined(node.script_animation_type)) {
        var_dd1921916c4e99c7 = undefined;
        var_4b7479ae0df07570 = strtok(node.script_animation_type, ",");
        var_dd1921916c4e99c7 = random(var_4b7479ae0df07570);
        if (isdefined(var_dd1921916c4e99c7)) {
            if (!istrue(node.script_looping)) {
                self.single_loop = 1;
            } else {
                self.single_loop = undefined;
            }
            /#
                print3d(self.origin + (0, 0, 64), "<unknown string>" + node.script_animation_type, (1, 1, 0), 1, 0.5, 60, 1);
            #/
            self.playing_skit = 1;
            function_fde914f2364973e2(node, var_dd1921916c4e99c7);
            self.playing_skit = undefined;
            while (istrue(self.playing_skit)) {
                wait(0.05);
            }
        }
    }
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3519
// Size: 0x7c
function function_fde914f2364973e2(node, var_dd1921916c4e99c7) {
    self endon("death");
    if (istrue(self.single_loop)) {
        self endon("patrol_" + var_dd1921916c4e99c7 + "_loop");
    }
    _setgoalpos(node.origin, undefined, 1);
    self thread [[ level.spawn_skits[var_dd1921916c4e99c7].skit_func ]]();
    while (istrue(self.playing_skit)) {
        wait(0.05);
    }
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x359c
// Size: 0x15f
function function_5dcbed48df675e1(node, var_5e38f20c9628ae25) {
    if (isdefined(node.script_soundalias)) {
        if (soundexists(node.script_soundalias)) {
            self playsound(node.script_soundalias);
        }
    }
    if (isdefined(node.script_forcegoal)) {
        function_c6930ac29fe6ff53(node.script_forcegoal);
    }
    if (isdefined(self.post_wait_func)) {
        [[ self.post_wait_func ]]();
    }
    if (isdefined(node.script_delay_post)) {
        wait(node.script_delay_post);
    }
    while (isdefined(node.script_requires_player)) {
        node.script_requires_player = 0;
        if (function_557601291bb22faa(node, &function_9abbce4b66ee25d4)) {
            node.script_requires_player = 1;
            node notify("script_requires_player");
            break;
        }
        wait(0.25);
    }
    if (isdefined(node.script_demeanor_post)) {
        function_43c2f1d3946e3ea8(node.script_demeanor_post);
    }
    if (isdefined(var_5e38f20c9628ae25)) {
        [[ var_5e38f20c9628ae25 ]](node);
    }
    if (isdefined(node.script_death) && node.script_death) {
        namespace_14d36171baccf528::despawnagent();
    }
    if (isdefined(node.script_delete) && node.script_delete) {
        self delete();
    }
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3702
// Size: 0x21e
function function_557601291bb22faa(node, get_target_func) {
    for (i = 0; i < level.players.size; i++) {
        player = level.players[i];
        if (distancesquared(player.origin, node.origin) < distancesquared(self.origin, node.origin)) {
            return 1;
        }
        if (!isdefined(node.script_dist_only)) {
            vec = anglestoforward(self.angles);
            if (isdefined(node.target)) {
                temp = node [[ get_target_func ]](node.target);
                if (temp.size == 1) {
                    vec = vectornormalize(temp[0].origin - node.origin);
                } else if (isdefined(node.angles)) {
                    vec = anglestoforward(node.angles);
                }
            } else if (isdefined(node.angles)) {
                vec = anglestoforward(node.angles);
            }
            vec2 = [];
            vec2[vec2.size] = vectornormalize(player.origin - self.origin);
            foreach (value in vec2) {
                if (vectordot(vec, value) > 0) {
                    return 1;
                }
            }
        }
        dist = 300;
        if (node.script_requires_player > dist) {
            dist = node.script_requires_player;
        }
        if (distancesquared(player.origin, self.origin) < squared(dist)) {
            return 1;
        }
        return 0;
    }
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3927
// Size: 0x1e
function waittill_subgoal() {
    self endon("goal");
    index = self waittill("subgoal");
    return index;
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x394d
// Size: 0x111
function function_91dff8e3ec6780c3(var_9da7dd4834e89d17) {
    if (!isdefined(var_9da7dd4834e89d17)) {
        return 1;
    }
    if (!isdefined(var_9da7dd4834e89d17.target)) {
        return 1;
    }
    if (isdefined(var_9da7dd4834e89d17.script_delay)) {
        return 1;
    }
    if (isdefined(var_9da7dd4834e89d17.script_delay_min)) {
        return 1;
    }
    if (isdefined(var_9da7dd4834e89d17.script_delay_max)) {
        return 1;
    }
    if (isdefined(var_9da7dd4834e89d17.script_wait)) {
        return 1;
    }
    if (isdefined(var_9da7dd4834e89d17.script_wait_add)) {
        return 1;
    }
    if (isdefined(var_9da7dd4834e89d17.script_wait_min)) {
        return 1;
    }
    if (isdefined(var_9da7dd4834e89d17.script_wait_max)) {
        return 1;
    }
    if (isdefined(var_9da7dd4834e89d17.script_flag_wait)) {
        return 1;
    }
    if (isdefined(var_9da7dd4834e89d17.script_ent_flag_wait)) {
        return 1;
    }
    if (isdefined(var_9da7dd4834e89d17.script_delay_post)) {
        return 1;
    }
    if (isdefined(var_9da7dd4834e89d17.script_requires_player)) {
        return 1;
    }
    if (isdefined(var_9da7dd4834e89d17.script_idle)) {
        return 1;
    }
    if (isdefined(var_9da7dd4834e89d17.script_stopnode)) {
        return 1;
    }
    return 0;
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3a66
// Size: 0x1ee
function function_db64d1e0f2b06482(node, optional_arrived_at_node_func, var_5e38f20c9628ae25) {
    self notify("stop_going_to_node");
    self endon("stop_going_to_node");
    self endon("death");
    level endon("game_ended");
    if (!isarray(node)) {
        node = [0:node];
    }
    thread _behavior_gotonodeend();
    var_a749ce9b52022669 = 0;
    patharrayindex = 0;
    patharray = undefined;
    startnode = node[0];
    for (;;) {
        for (;;) {
            if (!var_a749ce9b52022669) {
                node = function_95419b47267b7dea(node);
                patharray = function_db4ad034e4606091(node, startnode);
                if (patharray.size > 1) {
                    var_a749ce9b52022669 = 1;
                }
            }
            self.currentnode = node;
            if (var_a749ce9b52022669) {
                node = patharray[patharray.size - 1];
                function_d0ea0bd3d1a6c928(patharray, optional_arrived_at_node_func, var_5e38f20c9628ae25);
                patharray = undefined;
                var_a749ce9b52022669 = 0;
            } else {
                function_4dea69a8c26a5378(node);
                function_e04e9f343593bf4e(node);
                self waittill("goal");
            }
            node notify("trigger", self);
            function_8d1fd30657566aea(node, optional_arrived_at_node_func);
            function_ef3a20cdb3c82b48(node);
            node script_delay();
            if (isdefined(node.script_flag_wait)) {
                flag_wait(node.script_flag_wait);
            }
            if (isdefined(node.script_ent_flag_wait)) {
                ent_flag_wait(node.script_ent_flag_wait);
            }
            node script_wait();
            function_5dcbed48df675e1(node, var_5e38f20c9628ae25);
            if (!isdefined(node.target) && !isdefined(node.script_linkto)) {
                break;
            }
            nextnode_array = node function_9abbce4b66ee25d4();
            if (!nextnode_array.size) {
                break;
            }
        }
    }
    self notify("reached_path_end");
    if (isdefined(self.script_forcegoal)) {
        return;
    }
    volume = self getgoalvolume();
    if (isdefined(volume)) {
        self setgoalvolumeauto(volume, volume function_4b6a41e8b3ee5932());
    }
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c5b
// Size: 0x27
function function_4b6a41e8b3ee5932() {
    if (isdefined(self.goalvolumecoveryaw)) {
        return anglestoforward((0, self.goalvolumecoveryaw, 0));
    } else {
        return undefined;
    }
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c89
// Size: 0x1c
function function_a2ffe923e7d0a34c(node) {
    function_aa8f023c16fc448d(node);
    self notify("go_to_node_new_goal");
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3cac
// Size: 0x6b
function function_e04e9f343593bf4e(ent) {
    if (isnode(ent)) {
        function_a2ffe923e7d0a34c(ent);
    } else if (isstruct(ent)) {
        function_dae5fd9c1e198e1a(ent);
    } else if (isent(ent)) {
        function_3cfe299baaf790b5(ent);
    }
    if (isstruct(ent) || isnode(ent)) {
        ent.patrol_stop = function_91dff8e3ec6780c3(ent);
    }
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d1e
// Size: 0x40
function function_3cfe299baaf790b5(ent) {
    if (ent.code_classname == "info_volume") {
        self setgoalvolumeauto(ent, ent function_4b6a41e8b3ee5932());
        self notify("go_to_node_new_goal");
        return;
    }
    function_dae5fd9c1e198e1a(ent);
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d65
// Size: 0x26
function function_dae5fd9c1e198e1a(ent) {
    _setgoalpos(ent.origin);
    self notify("go_to_node_new_goal");
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3d92
// Size: 0x5d
function function_37e5a190e3c946d5(agent, var_f8bc7ecdd324dd79) {
    if (isagent(agent)) {
        agent.var_f8bc7ecdd324dd79 = var_f8bc7ecdd324dd79;
    } else if (isint(agent) && isdefined(level.var_879053468f168806[agent])) {
        level.var_879053468f168806[agent].var_f8bc7ecdd324dd79 = var_f8bc7ecdd324dd79;
    }
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3df6
// Size: 0x4a
function function_d1e130608e4f8487(agent, origin, var_ba8b04eb4b683e67, var_39e3177c55f34e64, var_a34f6fb5917d2093) {
    var_f8bc7ecdd324dd79 = function_2f254cf573da1a36(origin, var_ba8b04eb4b683e67, var_39e3177c55f34e64, var_a34f6fb5917d2093);
    function_37e5a190e3c946d5(agent, var_f8bc7ecdd324dd79);
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3e47
// Size: 0x85
function function_2f254cf573da1a36(origin, var_ba8b04eb4b683e67, var_39e3177c55f34e64, var_a34f6fb5917d2093) {
    var_f8bc7ecdd324dd79 = spawnstruct();
    var_f8bc7ecdd324dd79.behavior = "guard";
    var_f8bc7ecdd324dd79.origin = origin;
    var_f8bc7ecdd324dd79.var_ba8b04eb4b683e67 = var_ba8b04eb4b683e67;
    if (isdefined(var_39e3177c55f34e64) && isdefined(var_a34f6fb5917d2093)) {
        var_f8bc7ecdd324dd79.var_39e3177c55f34e64 = var_39e3177c55f34e64;
        var_f8bc7ecdd324dd79.var_a34f6fb5917d2093 = var_a34f6fb5917d2093;
    }
    return var_f8bc7ecdd324dd79;
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3ed4
// Size: 0x41
function function_e786aa52b93833eb(agent, origin, radius, var_c154e6e386654a30) {
    var_f8bc7ecdd324dd79 = function_f592b31e1a9c245c(origin, radius, var_c154e6e386654a30);
    function_37e5a190e3c946d5(agent, var_f8bc7ecdd324dd79);
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f1c
// Size: 0x65
function function_f592b31e1a9c245c(origin, radius, var_c154e6e386654a30) {
    var_f8bc7ecdd324dd79 = spawnstruct();
    var_f8bc7ecdd324dd79.behavior = "wander";
    var_f8bc7ecdd324dd79.origin = origin;
    var_f8bc7ecdd324dd79.radius = radius;
    var_f8bc7ecdd324dd79.var_c154e6e386654a30 = var_c154e6e386654a30;
    return var_f8bc7ecdd324dd79;
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f89
// Size: 0x41
function function_fe5620595915170f(agent, origin, radius, var_c154e6e386654a30) {
    var_f8bc7ecdd324dd79 = function_f9a6beb9ce9044e8(origin, radius, var_c154e6e386654a30);
    function_37e5a190e3c946d5(agent, var_f8bc7ecdd324dd79);
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3fd1
// Size: 0x65
function function_f9a6beb9ce9044e8(origin, radius, var_c154e6e386654a30) {
    var_f8bc7ecdd324dd79 = spawnstruct();
    var_f8bc7ecdd324dd79.behavior = "combatwander";
    var_f8bc7ecdd324dd79.origin = origin;
    var_f8bc7ecdd324dd79.radius = radius;
    var_f8bc7ecdd324dd79.var_c154e6e386654a30 = var_c154e6e386654a30;
    return var_f8bc7ecdd324dd79;
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x403e
// Size: 0x4a
function function_4561fe6bfc76f8ec(agent, var_886dfa499937a071, pathstruct, var_39e3177c55f34e64, var_a34f6fb5917d2093) {
    var_f8bc7ecdd324dd79 = function_57d602c47bb19473(var_886dfa499937a071, pathstruct, var_39e3177c55f34e64, var_a34f6fb5917d2093);
    function_37e5a190e3c946d5(agent, var_f8bc7ecdd324dd79);
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x408f
// Size: 0x85
function function_57d602c47bb19473(var_886dfa499937a071, pathstruct, var_39e3177c55f34e64, var_a34f6fb5917d2093) {
    var_f8bc7ecdd324dd79 = spawnstruct();
    var_f8bc7ecdd324dd79.behavior = "patrol";
    var_f8bc7ecdd324dd79.pathstruct = pathstruct;
    var_f8bc7ecdd324dd79.var_886dfa499937a071 = var_886dfa499937a071;
    if (isdefined(var_39e3177c55f34e64) && isdefined(var_a34f6fb5917d2093)) {
        var_f8bc7ecdd324dd79.var_39e3177c55f34e64 = var_39e3177c55f34e64;
        var_f8bc7ecdd324dd79.var_a34f6fb5917d2093 = var_a34f6fb5917d2093;
    }
    return var_f8bc7ecdd324dd79;
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x411c
// Size: 0x68
function function_bd9acc7c99ad884(agent, var_c5e7fce963586ec0, var_e298cec41261345c, var_87d4c4075f48ec58, var_21f24aecb313e479, var_3e332762c9138001, var_69565040c77112ce, var_1b3d1c2f22b62206) {
    var_f8bc7ecdd324dd79 = function_4b8038fe29027d5f(var_c5e7fce963586ec0, var_e298cec41261345c, var_87d4c4075f48ec58, var_21f24aecb313e479, var_3e332762c9138001, var_69565040c77112ce, var_1b3d1c2f22b62206);
    function_37e5a190e3c946d5(agent, var_f8bc7ecdd324dd79);
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x418b
// Size: 0xbb
function function_4b8038fe29027d5f(var_c5e7fce963586ec0, var_e298cec41261345c, var_87d4c4075f48ec58, var_21f24aecb313e479, var_3e332762c9138001, var_69565040c77112ce, var_1b3d1c2f22b62206) {
    var_f8bc7ecdd324dd79 = spawnstruct();
    var_f8bc7ecdd324dd79.behavior = "combatRush";
    var_f8bc7ecdd324dd79.var_c5e7fce963586ec0 = var_c5e7fce963586ec0;
    var_f8bc7ecdd324dd79.var_e298cec41261345c = var_e298cec41261345c;
    var_f8bc7ecdd324dd79.var_87d4c4075f48ec58 = var_87d4c4075f48ec58;
    var_f8bc7ecdd324dd79.var_21f24aecb313e479 = var_21f24aecb313e479;
    var_f8bc7ecdd324dd79.var_3e332762c9138001 = var_3e332762c9138001;
    var_f8bc7ecdd324dd79.var_69565040c77112ce = var_69565040c77112ce;
    var_f8bc7ecdd324dd79.var_1b3d1c2f22b62206 = var_1b3d1c2f22b62206;
    return var_f8bc7ecdd324dd79;
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 8, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x424e
// Size: 0x68
function function_6e3dd46c3475cd2d(agent, var_2bd923437ecc04bd, var_e298cec41261345c, var_87d4c4075f48ec58, var_21f24aecb313e479, var_3e332762c9138001, var_69565040c77112ce, var_1b3d1c2f22b62206) {
    var_f8bc7ecdd324dd79 = function_4b8735c04ece8334(var_2bd923437ecc04bd, var_e298cec41261345c, var_87d4c4075f48ec58, var_21f24aecb313e479, var_3e332762c9138001, var_69565040c77112ce, var_1b3d1c2f22b62206);
    function_37e5a190e3c946d5(agent, var_f8bc7ecdd324dd79);
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 7, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x42bd
// Size: 0xbb
function function_4b8735c04ece8334(var_2bd923437ecc04bd, var_e298cec41261345c, var_87d4c4075f48ec58, var_21f24aecb313e479, var_3e332762c9138001, var_69565040c77112ce, var_1b3d1c2f22b62206) {
    var_f8bc7ecdd324dd79 = spawnstruct();
    var_f8bc7ecdd324dd79.behavior = "combatRushChain";
    var_f8bc7ecdd324dd79.var_2bd923437ecc04bd = var_2bd923437ecc04bd;
    var_f8bc7ecdd324dd79.var_e298cec41261345c = var_e298cec41261345c;
    var_f8bc7ecdd324dd79.var_87d4c4075f48ec58 = var_87d4c4075f48ec58;
    var_f8bc7ecdd324dd79.var_21f24aecb313e479 = var_21f24aecb313e479;
    var_f8bc7ecdd324dd79.var_3e332762c9138001 = var_3e332762c9138001;
    var_f8bc7ecdd324dd79.var_69565040c77112ce = var_69565040c77112ce;
    var_f8bc7ecdd324dd79.var_1b3d1c2f22b62206 = var_1b3d1c2f22b62206;
    return var_f8bc7ecdd324dd79;
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4380
// Size: 0x4a
function function_29b1f7f88b879860(agent, var_f1548c57038e1b7a, var_bc0d4c6360efc237, var_c7988fd0b09710bc, var_3431921fac306239) {
    var_f8bc7ecdd324dd79 = function_d9b313747ecdf8a9(var_f1548c57038e1b7a, var_bc0d4c6360efc237, var_c7988fd0b09710bc, var_3431921fac306239);
    function_37e5a190e3c946d5(agent, var_f8bc7ecdd324dd79);
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x43d1
// Size: 0x7a
function function_d9b313747ecdf8a9(var_f1548c57038e1b7a, var_bc0d4c6360efc237, var_c7988fd0b09710bc, var_3431921fac306239) {
    var_f8bc7ecdd324dd79 = spawnstruct();
    var_f8bc7ecdd324dd79.behavior = "cqb";
    var_f8bc7ecdd324dd79.var_f1548c57038e1b7a = var_f1548c57038e1b7a;
    var_f8bc7ecdd324dd79.var_bc0d4c6360efc237 = var_bc0d4c6360efc237;
    var_f8bc7ecdd324dd79.var_c7988fd0b09710bc = var_c7988fd0b09710bc;
    var_f8bc7ecdd324dd79.var_3431921fac306239 = var_3431921fac306239;
    return var_f8bc7ecdd324dd79;
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4453
// Size: 0x62
function function_f0c78111ce0cdc0a(agent) {
    if (isagent(agent)) {
        return agent.var_f8bc7ecdd324dd79;
    } else if (isint(agent) && isdefined(level.var_879053468f168806) && isdefined(level.var_879053468f168806[agent])) {
        return level.var_879053468f168806[agent].var_f8bc7ecdd324dd79;
    }
    return undefined;
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x44bd
// Size: 0x31c
function behavior_executebehaviorpackage(agent) {
    agent endon("death");
    if (!isdefined(agent.var_f8bc7ecdd324dd79)) {
        return;
    }
    switch (agent.var_f8bc7ecdd324dd79.behavior) {
    case #"hash_7df245010bdec44e":
        agent thread function_b11c1964f528574b(agent, agent.var_f8bc7ecdd324dd79.var_ba8b04eb4b683e67, agent.var_f8bc7ecdd324dd79.origin);
        break;
    case #"hash_4e0c042fa0220574":
        if (isdefined(level.var_1c8cbd78af4920d0)) {
            agent thread [[ level.var_1c8cbd78af4920d0 ]](agent, agent.var_f8bc7ecdd324dd79.radius, agent.var_f8bc7ecdd324dd79.var_c154e6e386654a30, agent.var_f8bc7ecdd324dd79.origin);
        } else {
            agent thread function_9bbf1713a14fa580(agent, agent.var_f8bc7ecdd324dd79.radius, agent.var_f8bc7ecdd324dd79.var_c154e6e386654a30, agent.var_f8bc7ecdd324dd79.origin);
        }
        break;
    case #"hash_f18555ca1d8ebdc0":
        agent thread function_a057ee9adc9547d5(agent, agent.var_f8bc7ecdd324dd79.radius, agent.var_f8bc7ecdd324dd79.var_c154e6e386654a30, agent.var_f8bc7ecdd324dd79.origin);
        break;
    case #"hash_9128327eb51e0b7b":
        level thread function_25cc93d439c3033a([0:agent], agent.var_f8bc7ecdd324dd79.pathstruct);
        break;
    case #"hash_10c1fbec939bdcf7":
        bp = agent.var_f8bc7ecdd324dd79;
        /#
            assertex(distance(agent.origin, bp.var_c5e7fce963586ec0) < 12500, "behavior_executeBehaviorPackage: trying to combat rush with a goal too far away");
        #/
        agent thread function_a5117518725da028(agent, bp.var_c5e7fce963586ec0, bp.var_e298cec41261345c, bp.var_87d4c4075f48ec58, bp.var_21f24aecb313e479, bp.var_3e332762c9138001, bp.var_69565040c77112ce);
        break;
    case #"hash_baf8d28f880e18c":
        bp = agent.var_f8bc7ecdd324dd79;
        agent thread function_65f6a39e1083fb6b(agent, bp.var_2bd923437ecc04bd, bp.var_e298cec41261345c, bp.var_87d4c4075f48ec58, bp.var_21f24aecb313e479, bp.var_3e332762c9138001, bp.var_69565040c77112ce);
        break;
    case #"hash_1a53266c17b7d481":
        bp = agent.var_f8bc7ecdd324dd79;
        agent thread function_c7307d56a1a61172(agent, bp.var_f1548c57038e1b7a, bp.var_bc0d4c6360efc237, bp.var_c7988fd0b09710bc, bp.var_3431921fac306239);
        break;
    }
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x47e0
// Size: 0x7a
function function_8dad0c97c82fb52f(agent, targetent) {
    node = agent findbestcovernode(undefined, 0, agent.origin);
    if (isdefined(node)) {
        if (!isdefined(agent.node) || agent.node != node) {
            agent.keepclaimednode = 0;
            agent.keepclaimednodeifvalid = 0;
            agent usecovernode(node);
        }
    }
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4861
// Size: 0x167
function function_c7307d56a1a61172(agent, var_f1548c57038e1b7a, var_bc0d4c6360efc237, var_c7988fd0b09710bc, var_3431921fac306239) {
    function_29b1f7f88b879860(agent, var_f1548c57038e1b7a, var_bc0d4c6360efc237, var_c7988fd0b09710bc, var_3431921fac306239);
    if (isint(agent)) {
        return;
    }
    if (!isdefined(var_f1548c57038e1b7a) || var_f1548c57038e1b7a.size == 0) {
        var_9815fce1944a6ae0 = function_2e33f8e46f95167c(agent.origin, 512, 1);
        var_f1548c57038e1b7a = array_combine(var_9815fce1944a6ae0.var_e67f0b2ea7ae69ed, var_9815fce1944a6ae0.var_8a055a821dda7da0);
        if (var_f1548c57038e1b7a.size < 2) {
            var_f1548c57038e1b7a = array_combine(var_f1548c57038e1b7a, var_9815fce1944a6ae0.var_3288c473e8336ab4);
        }
        if (var_f1548c57038e1b7a.size == 0) {
            return;
        }
        var_f1548c57038e1b7a = function_3a17f0ccddc999b4(agent.origin, var_f1548c57038e1b7a, 2);
        if (var_f1548c57038e1b7a.size == 0) {
            return;
        }
        var_f1548c57038e1b7a = array_randomize(var_f1548c57038e1b7a);
    }
    agent.balwayscoverexposed = 1;
    function_2b26d000f2ccfc11(agent, var_f1548c57038e1b7a[0]);
    agent thread function_64045ea3246c7b09(agent, var_f1548c57038e1b7a[0].origin, var_bc0d4c6360efc237, var_c7988fd0b09710bc, var_3431921fac306239);
    if (!isdefined(var_f1548c57038e1b7a[0].script_noteworthy) || isdefined(var_f1548c57038e1b7a[0].script_noteworthy) && !issubstr(var_f1548c57038e1b7a[0].script_noteworthy, "dont_move")) {
        agent thread function_c78dddf4b72b2bb8(agent, var_f1548c57038e1b7a);
    } else {
        agent thread namespace_2000a83505151e5b::function_a1d0e5ea1a887436(agent, var_f1548c57038e1b7a[0]);
    }
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x49cf
// Size: 0x16e
function function_2e33f8e46f95167c(origin, searchradius, var_d0e8277402331171) {
    while (!isdefined(level.struct_class_names)) {
        waitframe();
    }
    var_e67f0b2ea7ae69ed = [];
    var_8a055a821dda7da0 = [];
    var_3288c473e8336ab4 = [];
    var_ea8744dfdf5a7fd3 = getnodesinradius(origin, searchradius, 0, searchradius);
    foreach (node in var_ea8744dfdf5a7fd3) {
        if (isdefined(node.script_noteworthy) && issubstr(node.script_noteworthy, "cqb_node")) {
            if (issubstr(node.script_noteworthy, "dont_move")) {
                var_8a055a821dda7da0[var_8a055a821dda7da0.size] = node;
            } else {
                var_e67f0b2ea7ae69ed[var_e67f0b2ea7ae69ed.size] = node;
            }
        } else if (istrue(var_d0e8277402331171) && node.type != "path") {
            var_3288c473e8336ab4[var_3288c473e8336ab4.size] = node;
        }
    }
    struct = spawnstruct();
    struct.var_e67f0b2ea7ae69ed = array_randomize(var_e67f0b2ea7ae69ed);
    struct.var_8a055a821dda7da0 = array_randomize(var_8a055a821dda7da0);
    struct.var_3288c473e8336ab4 = array_randomize(var_3288c473e8336ab4);
    return struct;
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4b45
// Size: 0x1f1
function function_b60b5affd510926c(fortress, var_d0e8277402331171) {
    searchradius = 1024;
    if (isdefined(fortress.var_1a4d8a1df4da9847)) {
        searchradius = fortress.var_1a4d8a1df4da9847;
    } else if (fortress.var_c8c070d7375ef1e == "hero") {
        searchradius = 2560;
    }
    struct = function_2e33f8e46f95167c(fortress.origin, searchradius, var_d0e8277402331171);
    var_50f783a5617f8940 = [];
    foreach (node in struct.var_e67f0b2ea7ae69ed) {
        if (namespace_9823ee6035594d67::function_20f6e9317b1baf3d(node.origin, fortress)) {
            var_50f783a5617f8940[var_50f783a5617f8940.size] = node;
        }
    }
    fortress.var_e67f0b2ea7ae69ed = var_50f783a5617f8940;
    var_50f783a5617f8940 = [];
    foreach (node in struct.var_8a055a821dda7da0) {
        if (namespace_9823ee6035594d67::function_20f6e9317b1baf3d(node.origin, fortress)) {
            var_50f783a5617f8940[var_50f783a5617f8940.size] = node;
        }
    }
    fortress.var_8a055a821dda7da0 = var_50f783a5617f8940;
    var_50f783a5617f8940 = [];
    if (istrue(var_d0e8277402331171)) {
        foreach (node in struct.var_3288c473e8336ab4) {
            if (namespace_9823ee6035594d67::function_20f6e9317b1baf3d(node.origin, fortress)) {
                var_50f783a5617f8940[var_50f783a5617f8940.size] = node;
            }
        }
    }
    fortress.var_3288c473e8336ab4 = var_50f783a5617f8940;
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d3d
// Size: 0x6c
function function_984e27d6c139a63d(var_f1548c57038e1b7a) {
    var_f1548c57038e1b7a = array_randomize(var_f1548c57038e1b7a);
    foreach (node in var_f1548c57038e1b7a) {
        if (!istrue(node.claimed)) {
            return node;
        }
    }
    return undefined;
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4db1
// Size: 0x319
function function_3a17f0ccddc999b4(origin, var_f1548c57038e1b7a, var_76045cf7c0669684, maxheightdifference, var_d557a0584f34f219) {
    var_6bc750307ef572f = sortbydistance(var_f1548c57038e1b7a, origin);
    selectednodes = [];
    var_5ad587bdaec2c87a = 16384;
    if (!isdefined(var_76045cf7c0669684)) {
        var_76045cf7c0669684 = 1;
    }
    if (!isdefined(maxheightdifference)) {
        maxheightdifference = 75;
    }
    foreach (node in var_6bc750307ef572f) {
        if (selectednodes.size == var_76045cf7c0669684) {
            return selectednodes;
        }
        if (istrue(node.reserved)) {
            continue;
        }
        if (!istrue(var_d557a0584f34f219) && istrue(node.claimed)) {
            continue;
        }
        if (abs(origin[2] - node.origin[2]) >= maxheightdifference) {
            continue;
        }
        var_cb63b425c600b043 = 0;
        foreach (var_3da66f9be4e79ecc in selectednodes) {
            if (distance2dsquared(var_3da66f9be4e79ecc.origin, node.origin) < var_5ad587bdaec2c87a) {
                var_cb63b425c600b043 = 1;
                break;
            }
        }
        if (var_cb63b425c600b043) {
            continue;
        }
        var_5dee42277bb33b87 = isdefined(node.script_noteworthy) && issubstr(node.script_noteworthy, "dont_move");
        if (var_5dee42277bb33b87 && selectednodes.size > 0) {
            continue;
        }
        node.reserved = 1;
        selectednodes[selectednodes.size] = node;
        if (var_5dee42277bb33b87) {
            return selectednodes;
        }
    }
    foreach (node in var_6bc750307ef572f) {
        if (selectednodes.size == var_76045cf7c0669684) {
            return selectednodes;
        }
        if (!istrue(var_d557a0584f34f219) && istrue(node.claimed)) {
            continue;
        }
        if (abs(origin[2] - node.origin[2]) >= maxheightdifference) {
            continue;
        }
        foreach (var_3da66f9be4e79ecc in selectednodes) {
            if (distance2dsquared(var_3da66f9be4e79ecc.origin, node.origin) < var_5ad587bdaec2c87a) {
                continue;
            }
        }
        var_5dee42277bb33b87 = isdefined(node.script_noteworthy) && issubstr(node.script_noteworthy, "dont_move");
        if (var_5dee42277bb33b87 && selectednodes.size > 0) {
            continue;
        }
        selectednodes[selectednodes.size] = node;
        if (var_5dee42277bb33b87) {
            return selectednodes;
        }
    }
    return selectednodes;
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50d2
// Size: 0x1f
function function_93ec69284851c54e(node) {
    if (isdefined(node)) {
        node.claimed = 1;
    }
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x50f8
// Size: 0x1e
function function_25190883a02fdef7(node) {
    if (isdefined(node)) {
        node.claimed = 0;
    }
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x511d
// Size: 0x89
function function_2b26d000f2ccfc11(agent, node) {
    if (!isdefined(node) || istrue(node.claimed)) {
        return 0;
    }
    self.keepclaimednode = 0;
    agent.keepclaimednode = 0;
    function_93ec69284851c54e(node);
    namespace_14d36171baccf528::agentpers_setagentpersdata(agent, "cqbNode", node);
    agent usecovernode(node);
    agent function_304da84d9a815c01(node.origin, 32);
    agent.alertlevel = "combat";
    return 1;
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x51ae
// Size: 0x129
function function_c78dddf4b72b2bb8(agent, nodes, var_30f2848645468450, var_30cf7a864520269a) {
    agent endon("death");
    agent endon("endCQB");
    if (!isdefined(nodes) || nodes.size <= 1) {
        return;
    }
    if (!isdefined(var_30f2848645468450)) {
        var_30f2848645468450 = 8;
    }
    if (!isdefined(var_30cf7a864520269a)) {
        var_30cf7a864520269a = 12;
    }
    var_aa2c4b3d41b3e85c = randomintrange(var_30f2848645468450, var_30cf7a864520269a);
    currenttime = 0;
    interval = 1;
    var_8c36129f39216b9a = 0;
    node = namespace_14d36171baccf528::agentpers_getagentpersdata(agent, "cqbNode");
    if (!isdefined(node)) {
        node = function_984e27d6c139a63d(nodes);
        var_8c36129f39216b9a = function_2b26d000f2ccfc11(agent, node);
        thread function_a1d0e5ea1a887436(agent, node, var_aa2c4b3d41b3e85c);
    }
    while (1) {
        if (currenttime >= var_aa2c4b3d41b3e85c) {
            var_aa2c4b3d41b3e85c = randomintrange(var_30f2848645468450, var_30cf7a864520269a);
            currenttime = 0;
            if (!agent isinscriptedstate()) {
                if (var_8c36129f39216b9a) {
                    function_25190883a02fdef7(node);
                }
                node = function_984e27d6c139a63d(nodes);
                var_8c36129f39216b9a = function_2b26d000f2ccfc11(agent, node);
                thread function_a1d0e5ea1a887436(agent, node, var_aa2c4b3d41b3e85c);
            }
        }
        wait(1);
        currenttime = currenttime + interval;
    }
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x52de
// Size: 0x239
function function_64045ea3246c7b09(agent, origin, var_bc0d4c6360efc237, var_c7988fd0b09710bc, var_3431921fac306239) {
    agent endon("death");
    interval = 1;
    lastshoottime = agent._blackboard.var_60dcaa3d3be97ab;
    lastenemy = agent.enemy;
    var_4fd41aadc35b28e0 = 0;
    var_509b688b66616418 = 1;
    enemylist = [];
    var_149518f76f493448 = 0;
    var_15864b7b1533b47d = 0;
    var_7d91e6095747f0b2 = 2;
    while (var_509b688b66616418) {
        foreach (enemy in enemylist) {
            var_31ca5dbbe353500 = isalive(enemy);
            canseeenemy = undefined;
            if (var_31ca5dbbe353500) {
                canseeenemy = agent cansee(enemy);
            }
            if (!istrue(var_31ca5dbbe353500) || !istrue(canseeenemy) || istrue(canseeenemy) && (istrue(enemy.inlaststand) || !isalive(enemy))) {
                enemylist = array_remove(enemylist, enemy);
            }
        }
        enemy = agent.enemy;
        if (isdefined(enemy) && !array_contains(enemylist, enemy)) {
            enemylist[enemylist.size] = enemy;
        }
        foreach (enemy in enemylist) {
            canseeenemy = agent cansee(enemy);
            if (istrue(canseeenemy) && !var_149518f76f493448) {
                var_149518f76f493448 = 1;
                var_15864b7b1533b47d = 0;
                break;
            }
        }
        if (istrue(var_149518f76f493448)) {
            if (var_15864b7b1533b47d >= var_7d91e6095747f0b2) {
                var_509b688b66616418 = 0;
                continue;
            } else if (enemylist.size == 0) {
                var_149518f76f493448 = 0;
            } else {
                var_15864b7b1533b47d = var_15864b7b1533b47d + interval;
            }
        }
        wait(interval);
    }
    agent notify("endCQB");
    agent function_304da84d9a815c01(origin, 1024);
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x551e
// Size: 0x2c2
function function_9bcf6b76ea52ee4c() {
    while (!isdefined(level.struct_class_names)) {
        waitframe();
    }
    var_31ec5c74ebb7ef91 = getstructarray("ambush_spawn", "script_noteworthy");
    var_c229d93c0bb4f8e8 = random(var_31ec5c74ebb7ef91);
    var_e67f0b2ea7ae69ed = [];
    var_8a055a821dda7da0 = [];
    var_ea8744dfdf5a7fd3 = getnodesinradius(var_c229d93c0bb4f8e8.origin, 512, 0, 512);
    foreach (node in var_ea8744dfdf5a7fd3) {
        if (isdefined(node.script_noteworthy) && issubstr(node.script_noteworthy, "cqb_node")) {
            if (issubstr(node.script_noteworthy, "dont_move")) {
                node.var_8d756f0d1b8f56f7 = 1;
                var_8a055a821dda7da0[var_8a055a821dda7da0.size] = node;
            } else {
                var_e67f0b2ea7ae69ed[var_e67f0b2ea7ae69ed.size] = node;
            }
        }
    }
    wait(10);
    covernode = var_e67f0b2ea7ae69ed[0];
    aitype = namespace_bfef6903bca5845d::function_7f1a2e2ebe0c1693("ar");
    level.var_7ce9081bcf4af5a6 = namespace_bfef6903bca5845d::ai_mp_requestspawnagent(aitype, covernode.origin, var_c229d93c0bb4f8e8.angles, "high", "reinforcements", "debug");
    if (isdefined(level.var_7ce9081bcf4af5a6)) {
        level thread function_249321aebdee5ddc(level.var_7ce9081bcf4af5a6, var_e67f0b2ea7ae69ed);
        level thread function_64045ea3246c7b09(level.var_7ce9081bcf4af5a6, covernode.origin);
    }
    covernode = var_e67f0b2ea7ae69ed[1];
    aitype = namespace_bfef6903bca5845d::function_7f1a2e2ebe0c1693("ar");
    level.var_7ce9081bcf4af5a6 = namespace_bfef6903bca5845d::ai_mp_requestspawnagent(aitype, covernode.origin, var_c229d93c0bb4f8e8.angles, "high", "reinforcements", "debug");
    if (isdefined(level.var_7ce9081bcf4af5a6)) {
        level thread function_249321aebdee5ddc(level.var_7ce9081bcf4af5a6, var_e67f0b2ea7ae69ed);
        level thread function_64045ea3246c7b09(level.var_7ce9081bcf4af5a6, covernode.origin);
    }
    covernode = var_8a055a821dda7da0[0];
    aitype = namespace_bfef6903bca5845d::function_7f1a2e2ebe0c1693("shotgun");
    level.var_7ce9081bcf4af5a6 = namespace_bfef6903bca5845d::ai_mp_requestspawnagent(aitype, covernode.origin, var_c229d93c0bb4f8e8.angles, "high", "reinforcements", "debug");
    if (isdefined(level.var_7ce9081bcf4af5a6)) {
        function_2b26d000f2ccfc11(level.var_7ce9081bcf4af5a6, covernode);
        level thread function_64045ea3246c7b09(level.var_7ce9081bcf4af5a6, covernode.origin);
    }
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57e7
// Size: 0x92
function function_249321aebdee5ddc(agent, nodes) {
    agent endon("death");
    agent endon("endCQB");
    var_aa2c4b3d41b3e85c = 5;
    currenttime = 0;
    interval = 1;
    node = undefined;
    while (1) {
        if (currenttime >= var_aa2c4b3d41b3e85c) {
            currenttime = 0;
            function_25190883a02fdef7(node);
            node = function_984e27d6c139a63d(nodes);
            function_2b26d000f2ccfc11(agent, node);
            thread function_a1d0e5ea1a887436(agent, node, var_aa2c4b3d41b3e85c);
        }
        wait(1);
        currenttime = currenttime + interval;
    }
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5880
// Size: 0xc4
function function_a1d0e5ea1a887436(agent, node, time) {
    if (1) {
        return;
    }
    if (!isdefined(node) || istrue(node.claimed)) {
        return;
    }
    agent endon("death");
    interval = 0.05;
    currenttime = 0;
    while (!isdefined(time) || currenttime < time) {
        agent thread namespace_d028276791d9cff6::drawsphere(node.origin, 32, interval, (1, 0, 1));
        agent thread namespace_f2ffc0540883e1ad::drawline(node.origin, agent.origin, interval, (0, 1, 0));
        wait(interval);
        currenttime = currenttime + interval;
    }
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x594b
// Size: 0xcf
function function_b8687f27cfc0719c(agent, nodes) {
    agent endon("death");
    interval = 0.05;
    while (1) {
        foreach (node in nodes) {
            agent thread namespace_d028276791d9cff6::drawsphere(agent.origin, 16, 0.05, (0, 0, 1));
            agent thread namespace_f2ffc0540883e1ad::drawline(node.origin, agent.origin, interval, (0, 1, 0));
        }
        wait(interval);
    }
}

// Namespace namespace_7a13d4762231d63e/namespace_2000a83505151e5b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5a21
// Size: 0x2f9
function function_1efa739f9e55871f() {
    /#
        level endon("<unknown string>");
        agents = [];
        interval = 0.05;
        while (1) {
            if (getdvarint(@"hash_b85b66dbdc0853f9", 0) == 1) {
                foreach (agent in agents) {
                    agent kill();
                }
                waitframe();
                poiname = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(level.players[0].origin);
                team = level.players[0].team;
                if (namespace_36f464722d326bbe::isbrstylegametype()) {
                    team = "<unknown string>";
                }
                agents = namespace_bfef6903bca5845d::function_6214774e8e021663(1, level.players[0].origin, "<unknown string>", "<unknown string>", "<unknown string>", undefined, team, poiname, 256, 257);
                setdevdvar(@"hash_b85b66dbdc0853f9", 0);
            }
            if (getdvarint(@"hash_b85b66dbdc0853f9", 0) == 2) {
                foreach (agent in agents) {
                    agent thread namespace_2000a83505151e5b::function_a5117518725da028(agent, level.players[0].origin);
                }
                setdevdvar(@"hash_b85b66dbdc0853f9", 0);
            }
            if (getdvarint(@"hash_b85b66dbdc0853f9", 0) == 3) {
                agents = namespace_bfef6903bca5845d::function_353fecd1549f5f42(level.players[0].origin, 50000, level.players[0].team, 100, "<unknown string>", undefined, undefined, 1);
                setdevdvar(@"hash_b85b66dbdc0853f9", 0);
            }
            if (getdvarint(@"hash_b85b66dbdc0853f9", 0) == 4) {
                foreach (agent in agents) {
                    agent thread namespace_2000a83505151e5b::function_65f6a39e1083fb6b(agent, level.var_32988d8b3d823f40);
                }
                setdevdvar(@"hash_b85b66dbdc0853f9", 0);
            }
            foreach (agent in agents) {
                agent thread namespace_d028276791d9cff6::drawsphere(agent.origin, 32, interval, (1, 0, 1));
            }
            wait(interval);
        }
    #/
}

