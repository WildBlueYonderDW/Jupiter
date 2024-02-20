// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_58f20490049af6ac;
#using script_371b4c2ab5861e62;
#using scripts\mp\gametypes\br_circle.gsc;
#using script_48814951e916af89;
#using script_5def7af2a9f04234;
#using script_2bc0b0102f9b7751;
#using script_640cf1641c03e2a0;
#using script_120270bd0a747a35;

#namespace namespace_f3c963e429e76c8d;

// Namespace namespace_f3c963e429e76c8d/namespace_8d9453d94dd4f401
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x101
// Size: 0xa
function function_fa326688eafcb0e5() {
    function_5efe196c4c230159();
}

// Namespace namespace_f3c963e429e76c8d/namespace_8d9453d94dd4f401
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x112
// Size: 0x23
function function_a8c998f28b4865b4(circle_origin, circle_radius, var_371cf8c2296a023f) {
    function_5efe196c4c230159();
}

// Namespace namespace_f3c963e429e76c8d/namespace_8d9453d94dd4f401
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13c
// Size: 0x15e
function function_5efe196c4c230159() {
    foreach (category in level.var_93e65c79243ea01a) {
        agents = function_b4b9401715cf98ea(category);
        foreach (agent in agents) {
            if (isint(agent)) {
                var_7d2909fdc2b71387 = level.var_879053468f168806[agent];
                if (!namespace_bbc79db4c3949a5c::function_778a4c3d053ed0a9(var_7d2909fdc2b71387.origin)) {
                    namespace_14d36171baccf528::function_4e065f1747aadd51(agent, category);
                }
            } else {
                if (isdefined(agent.chute) || isdefined(agent.ridingvehicle)) {
                    continue;
                }
                if (isdefined(agent.birthtime) && gettime() < agent.birthtime + 10000) {
                    continue;
                }
                if (!namespace_bbc79db4c3949a5c::function_778a4c3d053ed0a9(agent.origin)) {
                    namespace_14d36171baccf528::function_350cf0db9f5e0cbe(agent, "killedByGas", 1);
                    agent kill();
                }
            }
        }
    }
}

// Namespace namespace_f3c963e429e76c8d/namespace_8d9453d94dd4f401
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a1
// Size: 0x4f
function function_b146e2b40516b668(category) {
    if (!isdefined(level.var_93e65c79243ea01a)) {
        level.var_93e65c79243ea01a = [];
        namespace_c5622898120e827f::function_eca79fa0f341ee08(11, &function_a8c998f28b4865b4, &function_fa326688eafcb0e5);
    }
    level.var_93e65c79243ea01a = function_6d6af8144a5131f1(level.var_93e65c79243ea01a, category);
}

// Namespace namespace_f3c963e429e76c8d/namespace_8d9453d94dd4f401
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2f7
// Size: 0x33
function function_91eeda4f6ea1daf(category) {
    if (!isdefined(level.var_93e65c79243ea01a)) {
        return;
    }
    level.var_93e65c79243ea01a = array_remove(level.var_93e65c79243ea01a, category);
}

// Namespace namespace_f3c963e429e76c8d/namespace_8d9453d94dd4f401
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x331
// Size: 0x337
function function_4e0244f0c1ab5067(location, var_dd4f509b9c56c76f, var_461b8c89eb0f0715, params) {
    /#
        /#
            assertex(isdefined(var_461b8c89eb0f0715) && var_461b8c89eb0f0715.size > 0, "<unknown string>");
        #/
    #/
    /#
        /#
            assertex(isdefined(var_dd4f509b9c56c76f) && var_dd4f509b9c56c76f.size > 0, "<unknown string>");
        #/
    #/
    var_aac993a0c1361744 = "everyone";
    var_49e3c22608848bd6 = undefined;
    var_6adbaf8d10937e14 = "high";
    var_15d6c88336debdf4 = 0;
    var_8fb0afec6ee6a75 = 10000;
    if (isdefined(params)) {
        if (isdefined(params.var_aac993a0c1361744)) {
            var_aac993a0c1361744 = params.var_aac993a0c1361744;
        }
        if (isdefined(params.var_49e3c22608848bd6)) {
            var_49e3c22608848bd6 = params.var_49e3c22608848bd6;
        }
        if (isdefined(params.var_6adbaf8d10937e14)) {
            var_6adbaf8d10937e14 = params.var_6adbaf8d10937e14;
        }
        if (isdefined(params.var_15d6c88336debdf4)) {
            var_15d6c88336debdf4 = params.var_15d6c88336debdf4;
        }
        if (isdefined(params.var_8fb0afec6ee6a75)) {
            var_8fb0afec6ee6a75 = params.var_8fb0afec6ee6a75;
        }
    }
    agents = [];
    var_2984a3a7b3c051a7 = getclosestpointonnavmesh(location);
    group_name = namespace_bfef6903bca5845d::function_78759441c259f58a();
    var_f96e9372bf4d85eb = namespace_37f0fb6355a4618a::function_6cc445c02b5effac(var_2984a3a7b3c051a7);
    foreach (type in var_461b8c89eb0f0715) {
        if (issubstr(type, "heli") && istrue(level.var_425df8e23aaef18c)) {
            var_9a5a0701386ac693 = namespace_bfef6903bca5845d::function_b9d78fce07834c95(var_dd4f509b9c56c76f);
            var_51900af8e34c7d04 = namespace_7ae25d9e5d5a28ef::function_3779deb97b61a65(var_dd4f509b9c56c76f.size, var_2984a3a7b3c051a7, var_6adbaf8d10937e14, var_aac993a0c1361744, var_49e3c22608848bd6, group_name, "team_hundred_ninety_five", var_15d6c88336debdf4, var_f96e9372bf4d85eb, 256, 512, var_9a5a0701386ac693, 1, 0);
            if (isdefined(var_51900af8e34c7d04)) {
                agents = var_51900af8e34c7d04;
            }
        } else if (issubstr(type, "para") && isdefined(level.var_e578a787b54ad109)) {
            var_9a5a0701386ac693 = namespace_bfef6903bca5845d::function_b9d78fce07834c95(var_dd4f509b9c56c76f);
            var_63f6f0241fc2a71e = namespace_885300a47c2b51e6::function_55ab9c6da96226e7(var_dd4f509b9c56c76f.size, var_2984a3a7b3c051a7, var_8fb0afec6ee6a75, var_9a5a0701386ac693, var_6adbaf8d10937e14, var_aac993a0c1361744, var_49e3c22608848bd6, "team_hundred_ninety_five", var_15d6c88336debdf4, var_f96e9372bf4d85eb, undefined, undefined, 1, 1, 1, 256);
            if (isdefined(var_63f6f0241fc2a71e)) {
                agents = var_63f6f0241fc2a71e;
            }
        } else if (issubstr(type, "closet")) {
            var_9a5a0701386ac693 = namespace_bfef6903bca5845d::function_b9d78fce07834c95(var_dd4f509b9c56c76f);
            var_586efc1d3caf3644 = namespace_bfef6903bca5845d::function_9ea6eddb437eaca5(var_dd4f509b9c56c76f.size, var_2984a3a7b3c051a7, var_6adbaf8d10937e14, var_aac993a0c1361744, var_49e3c22608848bd6, group_name, "team_hundred_ninety_five", var_15d6c88336debdf4, var_f96e9372bf4d85eb, undefined, undefined, 256);
            if (isdefined(var_586efc1d3caf3644)) {
                agents = var_586efc1d3caf3644;
            }
        } else if (issubstr(type, "safe")) {
            agents = function_3c4b94287bc8e5f9(var_2984a3a7b3c051a7, var_dd4f509b9c56c76f, var_f96e9372bf4d85eb, group_name, params);
        } else {
            /#
                println("<unknown string>" + type);
            #/
        }
        if (agents.size > 0) {
            break;
        }
    }
    if (agents.size <= 0) {
        /#
            println("<unknown string>");
        #/
    }
    return agents;
}

// Namespace namespace_f3c963e429e76c8d/namespace_8d9453d94dd4f401
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x670
// Size: 0x16c
function function_3c4b94287bc8e5f9(location, var_dd4f509b9c56c76f, var_f96e9372bf4d85eb, group_name, params) {
    var_d7ac817d738940da = [];
    agents = [];
    var_d7ac817d738940da = function_f94be34470ee3bad(location, var_dd4f509b9c56c76f.size, params.var_a78daf96b4bdf866, params.var_1b20f5fb6aee28f7, params.var_cf0b51ba5e529a7);
    if (var_d7ac817d738940da.size < var_dd4f509b9c56c76f.size) {
        /#
            println("<unknown string>");
        #/
        return agents;
    }
    foreach (index, request in var_dd4f509b9c56c76f) {
        ai_type = namespace_bfef6903bca5845d::function_7f1a2e2ebe0c1693(request.type, request.tier, request.nationality);
        agent = namespace_bfef6903bca5845d::function_ea94a8bf24d3c5ef(ai_type, var_d7ac817d738940da[index], (0, 0, 0), params.var_6adbaf8d10937e14, params.var_aac993a0c1361744, undefined, group_name, "team_hundred_ninety_five", undefined, var_f96e9372bf4d85eb, 1, 0, 0, undefined, 0);
        if (isdefined(agent)) {
            agents[agents.size] = agent;
            agent thread namespace_2000a83505151e5b::function_9bbf1713a14fa580(agent, 256, 256, location);
        }
        waitframe();
    }
    return agents;
}

// Namespace namespace_f3c963e429e76c8d/namespace_8d9453d94dd4f401
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e4
// Size: 0x151
function function_f94be34470ee3bad(location, spawn_count, var_2459ccc8942d8b86, var_139b059f5ddea817, var_1ee216df0796db1f) {
    var_d7ac817d738940da = [];
    var_48fcd52a851c7579 = squared(var_2459ccc8942d8b86 - var_139b059f5ddea817);
    if (!isdefined(var_2459ccc8942d8b86)) {
        var_2459ccc8942d8b86 = 1500;
    }
    if (!isdefined(var_139b059f5ddea817)) {
        var_139b059f5ddea817 = 500;
    }
    for (i = 0; i < 15; i++) {
        var_aedd7371f20a2b9 = location + vectornormalize(function_6174330574a2a273()) * var_2459ccc8942d8b86;
        spawnpoints = getrandomnavpoints(getclosestpointonnavmesh(var_aedd7371f20a2b9), var_139b059f5ddea817, var_1ee216df0796db1f);
        foreach (point in spawnpoints) {
            if (abs(point[2] - location[2]) > 60) {
                continue;
            }
            distsq = distance2dsquared(point, location);
            if (distsq >= var_48fcd52a851c7579 && namespace_2000a83505151e5b::function_5867290fda7a1ac1(point, 64, 1000, 128)) {
                var_d7ac817d738940da[var_d7ac817d738940da.size] = point;
            }
            if (var_d7ac817d738940da.size >= spawn_count) {
                return var_d7ac817d738940da;
            }
        }
        waitframe();
    }
    return var_d7ac817d738940da;
}

