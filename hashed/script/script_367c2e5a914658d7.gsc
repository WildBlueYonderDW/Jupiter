// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\gametypes\br_public.gsc;
#using script_4948cdf739393d2d;
#using scripts\mp\flags.gsc;
#using script_48814951e916af89;
#using scripts\mp\gametypes\br_circle.gsc;
#using script_58f20490049af6ac;
#using scripts\cp_mp\utility\game_utility.gsc;
#using script_371b4c2ab5861e62;
#using script_120270bd0a747a35;

#namespace namespace_6d558624bef88b8;

// Namespace namespace_6d558624bef88b8/namespace_2ffd685c7e2d86a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3f8
// Size: 0x31
function function_36f209b336e4f71b() {
    logstring("ActiveWarzone - Init");
    namespace_bfef6903bca5845d::function_ba4022744dce59f6("activeWarzone");
    namespace_c5622898120e827f::function_eca79fa0f341ee08(10, &function_5684b9a123f38950);
    level thread _watchforcircleclosure();
}

// Namespace namespace_6d558624bef88b8/namespace_2ffd685c7e2d86a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x430
// Size: 0x9f
function function_c4b698ed8dd5c33d() {
    /#
    #/
    agents = function_7eb04ca16d045775("activeWarzone");
    foreach (agent in agents) {
        if (isalive(agent) && !namespace_bbc79db4c3949a5c::function_ee854fdd1e77efc4(agent.origin)) {
            logstring("ActiveWarzone Kill Active AI in gas at " + agent.origin);
            agent kill();
        }
    }
    /#
    #/
}

// Namespace namespace_6d558624bef88b8/namespace_2ffd685c7e2d86a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4d6
// Size: 0xac
function function_974a505e30d0049c() {
    /#
    #/
    agents = function_5508ddea3a84df39("activeWarzone");
    foreach (agent in agents) {
        var_7d2909fdc2b71387 = level.var_879053468f168806[agent];
        if (!namespace_bbc79db4c3949a5c::function_ee854fdd1e77efc4(var_7d2909fdc2b71387.origin)) {
            logstring("ActiveWarzone Delete Dormant AI in gas at " + var_7d2909fdc2b71387.origin);
            function_dc81911388dfa0d3(agent);
        }
    }
    /#
    #/
}

// Namespace namespace_6d558624bef88b8/namespace_2ffd685c7e2d86a3
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x589
// Size: 0x14a
function function_5684b9a123f38950(circleorigin, circleradius, var_5d954f1724092f5a) {
    radiussqr = circleradius * circleradius;
    agents = function_b4b9401715cf98ea("activeWarzone");
    foreach (agent in agents) {
        if (isint(agent)) {
            var_7d2909fdc2b71387 = level.var_879053468f168806[agent];
            distsqr = lengthsquared(var_7d2909fdc2b71387.origin - circleorigin);
            if (distsqr >= radiussqr) {
                logstring("ActiveWarzone Delete Dormant AI in gas at " + var_7d2909fdc2b71387.origin + " - gas center " + circleorigin + " r" + circleradius);
                function_dc81911388dfa0d3(agent);
            }
        } else {
            distsqr = lengthsquared(agent.origin - circleorigin);
            if (distsqr >= radiussqr) {
                logstring("ActiveWarzone Kill Active AI in gas at " + agent.origin + " - gas center " + circleorigin + " r" + circleradius);
                agent kill();
            }
        }
    }
}

// Namespace namespace_6d558624bef88b8/namespace_2ffd685c7e2d86a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6da
// Size: 0x2ae
function function_a9eaf2243763094d() {
    if (namespace_36f464722d326bbe::function_e21746abaaaf8414()) {
        return;
    }
    var_af9632efdcfad62b = 0;
    var_79e560a0ce3c1f2b = 0;
    var_f861c48005312253 = 0;
    var_9a1c1b5c5cb9c1e = 0;
    volumes = function_f159c10d5cf8f0b4("building_bounds", "script_noteworthy");
    for (i = 0; i < volumes.size; i++) {
        aitype = namespace_bfef6903bca5845d::function_7f1a2e2ebe0c1693("pistol", 1);
        agent = function_8f1b9042d7fdfcda(aitype, volumes[i], volumes[i].origin, (0, 0, 0));
        if (isint(agent)) {
            var_af9632efdcfad62b++;
            var_9a1c1b5c5cb9c1e++;
            if (var_af9632efdcfad62b % 100 == 0) {
                waitframe();
            }
        } else {
            var_79e560a0ce3c1f2b++;
        }
    }
    logstring("ActiveWarzone - Living World Only Spawns " + var_9a1c1b5c5cb9c1e + "/" + volumes.size);
    level.var_6db1fc6674f5c81d = undefined;
    level.var_35a97ceb54818616 = undefined;
    level.var_ba2aa87e33811b32 = undefined;
    waitframe();
    waitframe();
    waitframe();
    foreach (fortress in level.var_f1073fbd45b59a06.var_1d7353058ea3a9f1) {
        if (!isdefined(fortress.var_52914617670842a1) || fortress.var_52914617670842a1.size == 0) {
            logstring("Skipping unused fortresses for no guard nodes at " + fortress.origin);
            var_f861c48005312253++;
        } else {
            aitype = namespace_bfef6903bca5845d::function_7f1a2e2ebe0c1693("pistol", 1);
            var_8c7cd2b569611279 = function_59d68c7b901fc998(fortress.var_c8c070d7375ef1e);
            for (i = 0; i < var_8c7cd2b569611279; i++) {
                var_c229d93c0bb4f8e8 = fortress.var_52914617670842a1[randomint(fortress.var_52914617670842a1.size)];
                agent = function_1dd6dd044fd43e09(aitype, var_c229d93c0bb4f8e8.origin, var_c229d93c0bb4f8e8.angles, fortress.origin, 120);
                if (isint(agent)) {
                    var_af9632efdcfad62b++;
                    if (var_af9632efdcfad62b % 100 == 0) {
                        waitframe();
                    }
                } else {
                    var_79e560a0ce3c1f2b++;
                }
            }
        }
    }
    logstring("ActiveWarzone - World AI Spawned Dormant " + var_af9632efdcfad62b);
    logstring("ActiveWarzone - World AI Denied Spawned " + var_79e560a0ce3c1f2b);
    logstring("ActiveWarzone - Total Unused fortresses " + level.var_f1073fbd45b59a06.var_1d7353058ea3a9f1.size);
    logstring("ActiveWarzone - Unused Fortresses skipped from no Guard Nodes " + var_f861c48005312253);
    /#
        level thread function_71111773fd81f5d2();
    #/
}

// Namespace namespace_6d558624bef88b8/namespace_2ffd685c7e2d86a3
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x98f
// Size: 0x62
function function_7b7f58778d9d6990(agent) {
    agent = self;
    agent.var_14c360ebec241178 = agent.maxsightdistsqrd;
    agent.maxsightdistsqrd = 230400;
    agent.accuracy = 0.4;
    agent function_d493e7fe15e5eaf4("star_4");
    agent.var_cf430336d17e3afe = 1;
}

// Namespace namespace_6d558624bef88b8/namespace_2ffd685c7e2d86a3
// Params 4, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x9f8
// Size: 0x199
function private function_8f1b9042d7fdfcda(aitype, volume, spawnorigin, spawnangles) {
    agent = namespace_bfef6903bca5845d::function_ea94a8bf24d3c5ef(aitype, spawnorigin, spawnangles, "low", "activeWarzone", undefined, undefined, undefined, undefined, undefined, undefined, 0, 1, undefined, 1);
    if (isint(agent)) {
        namespace_14d36171baccf528::function_58aab2edaec2599f(agent, "active", &function_7b7f58778d9d6990);
        var_9632417ec6055a75 = undefined;
        bounds = volume getboundshalfsize();
        var_978098481752dc72 = min(max(bounds[0], bounds[1]), 360);
        nodes = getnodesinradius(volume.origin, var_978098481752dc72, 0, 120, "Cover");
        if (nodes.size > 0) {
            for (i = 0; i < nodes.size; i++) {
                if (ispointinvolume(nodes[i].origin, volume)) {
                    var_9632417ec6055a75 = nodes[i].origin;
                    break;
                }
            }
        }
        if (isdefined(var_9632417ec6055a75)) {
            pathstruct = spawnstruct();
            pathstruct.path = [0:spawnorigin, 1:var_9632417ec6055a75];
            pathstruct.claimed = 0;
            pathstruct.var_4437e81f60b6b5a0 = 1;
            namespace_2000a83505151e5b::function_4561fe6bfc76f8ec(agent, [0:agent], pathstruct, volume.origin, var_978098481752dc72);
        } else {
            namespace_2000a83505151e5b::function_e786aa52b93833eb(agent, volume.origin, 120, 0);
        }
    }
    return agent;
}

// Namespace namespace_6d558624bef88b8/namespace_2ffd685c7e2d86a3
// Params 5, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xb99
// Size: 0x18e
function private function_1dd6dd044fd43e09(aitype, spawnorigin, spawnangles, var_e9e8fca7d95d12a, var_978098481752dc72) {
    agent = namespace_bfef6903bca5845d::function_ea94a8bf24d3c5ef(aitype, spawnorigin, spawnangles, "low", "activeWarzone", undefined, undefined, undefined, undefined, undefined, undefined, 0, 1, undefined, 1);
    if (isint(agent)) {
        namespace_14d36171baccf528::function_58aab2edaec2599f(agent, "active", &function_7b7f58778d9d6990);
        var_9632417ec6055a75 = undefined;
        var_58194b37523adc95 = (var_e9e8fca7d95d12a[0], var_e9e8fca7d95d12a[1], spawnorigin[2]);
        nodes = getnodesinradius(var_58194b37523adc95, var_978098481752dc72, 0, 60, "Cover");
        if (nodes.size > 0) {
            for (i = 0; i < nodes.size; i++) {
                if (distance2dsquared(spawnorigin, nodes[i].origin) >= 9216) {
                    var_9632417ec6055a75 = nodes[i].origin;
                    break;
                }
            }
        }
        if (!isdefined(var_9632417ec6055a75)) {
            if (distance2dsquared(spawnorigin, var_58194b37523adc95) >= 9216) {
                var_9632417ec6055a75 = var_58194b37523adc95;
            }
        }
        if (isdefined(var_9632417ec6055a75)) {
            pathstruct = spawnstruct();
            pathstruct.path = [0:spawnorigin, 1:var_9632417ec6055a75];
            pathstruct.claimed = 0;
            pathstruct.var_4437e81f60b6b5a0 = 1;
            namespace_2000a83505151e5b::function_4561fe6bfc76f8ec(agent, [0:agent], pathstruct, var_58194b37523adc95, var_978098481752dc72);
        } else {
            var_58194b37523adc95 = (var_e9e8fca7d95d12a[0], var_e9e8fca7d95d12a[1], spawnorigin[2]);
            namespace_2000a83505151e5b::function_e786aa52b93833eb(agent, var_58194b37523adc95, 120, 0);
        }
    }
    return agent;
}

// Namespace namespace_6d558624bef88b8/namespace_2ffd685c7e2d86a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd2f
// Size: 0x49
function function_276d8f79560a28f8() {
    level endon("game_ended");
    level waittill("infils_ready");
    var_f501d4e6074a9d91 = getdvarint(@"hash_1f417cb6adc43c30", 240);
    wait(var_f501d4e6074a9d91);
    logstring("ActiveWarzone - Updating AI weapons at " + var_f501d4e6074a9d91 + " seconds");
    function_a3e821eb4249f933();
}

// Namespace namespace_6d558624bef88b8/namespace_2ffd685c7e2d86a3
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd7f
// Size: 0x68
function _watchforcircleclosure() {
    level endon("game_ended");
    var_dff50030f50c58ea = getdvarint(@"hash_4dc5c5741b807bae", 5);
    if (var_dff50030f50c58ea) {
        while (1) {
            level waittill("br_circle_set");
            circleindex = level.br_circle.circleindex + 1;
            if (circleindex >= var_dff50030f50c58ea) {
                function_a92ff5cdced1873e();
                return;
            }
        }
    }
}

// Namespace namespace_6d558624bef88b8/namespace_2ffd685c7e2d86a3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xdee
// Size: 0x19
function private function_dc81911388dfa0d3(id) {
    namespace_14d36171baccf528::function_4e065f1747aadd51(id, "activeWarzone");
}

// Namespace namespace_6d558624bef88b8/namespace_2ffd685c7e2d86a3
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xe0e
// Size: 0x8e
function private function_a92ff5cdced1873e() {
    logstring("ActiveWarzone - Deleting All " + level.var_879053468f168806.size + " dormant AI");
    var_af9632efdcfad62b = function_5508ddea3a84df39("activeWarzone");
    foreach (id in var_af9632efdcfad62b) {
        logstring("ActiveWarzone - Deleting dormant id #" + id);
        function_dc81911388dfa0d3(id);
    }
}

// Namespace namespace_6d558624bef88b8/namespace_2ffd685c7e2d86a3
// Params 0, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xea3
// Size: 0xf8
function private function_a3e821eb4249f933() {
    var_af9632efdcfad62b = function_5508ddea3a84df39("activeWarzone");
    logstring("ActiveWarzone - Upgrading " + var_af9632efdcfad62b.size + " dormant AI");
    foreach (id in var_af9632efdcfad62b) {
        if (isdefined(level.var_879053468f168806[id])) {
            if (randomint(5) == 0) {
                aitype = namespace_bfef6903bca5845d::function_7f1a2e2ebe0c1693("shotgun", 1);
            } else {
                aitype = namespace_bfef6903bca5845d::function_7f1a2e2ebe0c1693("smg", 1);
            }
            logstring("ActiveWarzone - Upgrading dormant id #" + id + " to " + aitype);
            level.var_879053468f168806[id].aitype = aitype;
        } else {
            logstring("ActiveWarzone - Cant Find Dormant AI " + id + " - This should never happen");
        }
    }
}

// Namespace namespace_6d558624bef88b8/namespace_2ffd685c7e2d86a3
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0xfa2
// Size: 0x60
function private function_59d68c7b901fc998(var_c8c070d7375ef1e) {
    if (var_c8c070d7375ef1e == "large" || var_c8c070d7375ef1e == "hero") {
        return getdvarint(@"hash_3a990161316ef42c", 2);
    } else if (var_c8c070d7375ef1e == "medium") {
        return getdvarint(@"hash_264c33ce5715aa10", 1);
    }
    return getdvarint(@"hash_d4b060e8da9b92c0", 1);
}

// Namespace namespace_6d558624bef88b8/namespace_2ffd685c7e2d86a3
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x100a
// Size: 0x2a7
function function_71111773fd81f5d2() {
    /#
        level endon("<unknown string>");
        color = (1, 0, 0);
        while (1) {
            if (getdvarint(@"hash_7d784e3984c4b5b1", 0)) {
                foreach (dormant in level.var_879053468f168806) {
                    top = dormant.origin + (0, 0, 72);
                    cylinder(dormant.origin, top, 30, color, 0, 60);
                    print3d(top, "<unknown string>" + dormant.aitype, color, 1, 1, 60);
                    if (isdefined(dormant.var_f8bc7ecdd324dd79.pathstruct) && dormant.var_f8bc7ecdd324dd79.pathstruct.path.size > 1) {
                        if (isvector(dormant.var_f8bc7ecdd324dd79.pathstruct.path[0]) && isvector(dormant.var_f8bc7ecdd324dd79.pathstruct.path[1])) {
                            cylinder(dormant.var_f8bc7ecdd324dd79.pathstruct.path[0], dormant.var_f8bc7ecdd324dd79.pathstruct.path[0] + (0, 0, 12), 15, (0, 1, 0), 0, 60);
                            cylinder(dormant.var_f8bc7ecdd324dd79.pathstruct.path[1], dormant.var_f8bc7ecdd324dd79.pathstruct.path[1] + (0, 0, 12), 15, (0, 1, 0), 0, 60);
                            line(dormant.var_f8bc7ecdd324dd79.pathstruct.path[0], dormant.var_f8bc7ecdd324dd79.pathstruct.path[1], color, 0, 0, 60);
                        }
                    }
                }
            }
            wait(1);
        }
    #/
}

