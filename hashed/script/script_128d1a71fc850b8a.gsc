// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using script_120270bd0a747a35;
#using scripts\mp\flags.gsc;
#using script_48814951e916af89;
#using script_15074130da8a935c;
#using scripts\mp\objidpoolmanager.gsc;
#using scripts\mp\gametypes\br_circle.gsc;

#namespace namespace_550d8f4896d02349;

// Namespace namespace_550d8f4896d02349/namespace_fc28fc5402338af6
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x291
// Size: 0x30d
function init() {
    level.brgametype.var_d5c773afd22da0c5 = getdvarint(@"hash_158f6c01ccefb107", 0) == 1;
    if (!istrue(level.brgametype.var_d5c773afd22da0c5)) {
        return;
    }
    level.brgametype.var_d03527ff0e6315 = getdvarint(@"hash_beef8246b709c849", 5);
    level.brgametype.var_3f4c679970c59455 = getdvarint(@"hash_ec1144da8d0ebb36", 4);
    level.brgametype.var_4b58204f3c5987d8 = getdvarint(@"hash_ba144c4a820cd8f9", 1);
    level.brgametype.var_cc07ca7d5aeb1f87 = getdvarint(@"hash_e2660ec466d23bf9", 100);
    level.brgametype.var_6d7eb4b39f6fea2d = pow(getdvarint(@"hash_7000264c08e7ac45", 500), 2);
    level.brgametype.var_d0adfb51398bdf71 = getdvarint(@"hash_3a8f51b0eaa8b895", 3);
    level.brgametype.var_5fca7073368d1eeb = getdvarint(@"hash_22c52597541ec14c", 100);
    var_6269246106806189 = getstructarray("racket", "targetname");
    if (var_6269246106806189.size == 0 || level.brgametype.var_d03527ff0e6315 == 0) {
        /#
            assertmsg("No racket core nodes found or rackets number set to 0.");
        #/
        return;
    }
    if (var_6269246106806189.size < level.brgametype.var_d03527ff0e6315) {
        /#
            assertmsg("Not enough racket nodes on the map to activate");
        #/
        level.brgametype.var_d03527ff0e6315 = var_6269246106806189.size;
    }
    var_6269246106806189 = array_randomize(var_6269246106806189);
    foreach (racket in var_6269246106806189) {
        function_719e6e9e78eec15f(racket);
    }
    level.brgametype.var_74cbed034a36dbaa = [];
    for (i = 0; i < level.brgametype.var_d03527ff0e6315; i++) {
        racket = var_6269246106806189[i];
        level.brgametype.var_74cbed034a36dbaa[level.brgametype.var_74cbed034a36dbaa.size] = racket;
        thread function_eb74659878a99a6c(racket);
    }
    namespace_4b0406965e556711::gameflagwait("prematch_fade_done");
    namespace_bfef6903bca5845d::function_ba4022744dce59f6("racket");
    foreach (racket in level.brgametype.var_74cbed034a36dbaa) {
        thread function_73572d13bc47f601(racket);
    }
}

// Namespace namespace_550d8f4896d02349/namespace_fc28fc5402338af6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5a5
// Size: 0x159
function function_719e6e9e78eec15f(racket) {
    racket.var_2ef873e30a270bcf = [];
    racket.var_4cc04c6a9dbfd0ee = [];
    racket.var_f5d30f51ab09b3f8 = [];
    var_b5c3a12c64229f24 = getstructarray(racket.target, "targetname");
    foreach (node in var_b5c3a12c64229f24) {
        if (!isdefined(node.script_noteworthy)) {
            continue;
        }
        script_noteworthy = tolower(node.script_noteworthy);
        switch (script_noteworthy) {
        case #"hash_7df245010bdec44e":
            racket.var_2ef873e30a270bcf[racket.var_2ef873e30a270bcf.size] = node;
            break;
        case #"hash_dc0a55772fe305c5":
            racket.var_4cc04c6a9dbfd0ee[racket.var_4cc04c6a9dbfd0ee.size] = node;
            break;
        case #"hash_f4cfb31523436f37":
            racket.var_f5d30f51ab09b3f8[racket.var_f5d30f51ab09b3f8.size] = node;
            break;
        default:
            break;
        }
    }
}

// Namespace namespace_550d8f4896d02349/namespace_fc28fc5402338af6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x705
// Size: 0x38
function function_eb74659878a99a6c(racket) {
    var_b006c818269d9e9c = function_a33799270d64c339(racket);
    if (isdefined(var_b006c818269d9e9c)) {
        var_b006c818269d9e9c = "brstageditems:" + var_b006c818269d9e9c;
        thread namespace_76ebb832f1cbeaa::init(var_b006c818269d9e9c, undefined, 1);
    }
}

// Namespace namespace_550d8f4896d02349/namespace_fc28fc5402338af6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x744
// Size: 0xbd
function function_73572d13bc47f601(racket) {
    level endon("game_ended");
    racket.agents = [];
    racket.var_2ef873e30a270bcf = array_randomize(racket.var_2ef873e30a270bcf);
    function_675517b7c4c0de3d(racket, level.brgametype.var_3f4c679970c59455, 1);
    function_675517b7c4c0de3d(racket, level.brgametype.var_4b58204f3c5987d8, 2);
    namespace_bfef6903bca5845d::function_35bae74232ff8b77(0);
    racket.var_4cc04c6a9dbfd0ee = array_randomize(racket.var_4cc04c6a9dbfd0ee);
    function_625fd0eb153c43b0(racket);
    function_c851837194379726(racket);
    function_d34497ae5051ab11(racket);
    thread function_3d9918f00f98b775(racket);
}

// Namespace namespace_550d8f4896d02349/namespace_fc28fc5402338af6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x808
// Size: 0x73
function function_a33799270d64c339(racket) {
    var_44e91535f06b130d = racket.script_noteworthy;
    if (!isdefined(var_44e91535f06b130d)) {
        return;
    }
    mapname = level.mapname;
    var_d7eaba8bf8ff0b00 = strtok(mapname, "_");
    var_f3bbd3be79c0316e = var_d7eaba8bf8ff0b00[var_d7eaba8bf8ff0b00.size - 1];
    return "wz2_" + var_f3bbd3be79c0316e + "_staged_" + var_44e91535f06b130d;
}

// Namespace namespace_550d8f4896d02349/namespace_fc28fc5402338af6
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x883
// Size: 0xde
function function_675517b7c4c0de3d(racket, number, tier) {
    if (racket.var_2ef873e30a270bcf.size < number) {
        msg = "Not enough guard nodes with target : " + racket.target;
        /#
            assertmsg(msg);
        #/
        number = racket.var_2ef873e30a270bcf.size;
    }
    for (i = 0; i < number; i++) {
        var_7d5acb0650804b86 = racket.var_2ef873e30a270bcf[0];
        agent = function_e7ef87a1bf538dbc(racket, var_7d5acb0650804b86, tier);
        racket.agents[racket.agents.size] = agent;
        racket.var_2ef873e30a270bcf = array_remove_index(racket.var_2ef873e30a270bcf, 0);
    }
}

// Namespace namespace_550d8f4896d02349/namespace_fc28fc5402338af6
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x968
// Size: 0x118
function function_e7ef87a1bf538dbc(racket, var_7d5acb0650804b86, tier) {
    var_1439f86640d42e34 = namespace_bfef6903bca5845d::function_6d1e55c48e2c12f();
    aitype = namespace_bfef6903bca5845d::function_7f1a2e2ebe0c1693(var_1439f86640d42e34, tier);
    spawnlocation = getclosestpointonnavmesh(var_7d5acb0650804b86.origin + (0, 0, 30));
    agent = namespace_bfef6903bca5845d::function_ea94a8bf24d3c5ef(aitype, spawnlocation, undefined, "absolute", "racket");
    if (isagent(agent)) {
        agent.health = level.brgametype.var_cc07ca7d5aeb1f87;
        agent.maxhealth = level.brgametype.var_cc07ca7d5aeb1f87;
        agent.combatmode = "cover";
        agent.maxsightdistsqrd = level.brgametype.var_6d7eb4b39f6fea2d;
        agent thread function_b11c1964f528574b(agent, 0, spawnlocation);
        agent thread function_4986e54ba19de354(racket);
        return agent;
    }
    return undefined;
}

// Namespace namespace_550d8f4896d02349/namespace_fc28fc5402338af6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa88
// Size: 0x11a
function function_625fd0eb153c43b0(racket) {
    number = level.brgametype.var_d0adfb51398bdf71;
    if (racket.var_4cc04c6a9dbfd0ee.size < number) {
        msg = "Not enough cache nodes with target : " + racket.target;
        /#
            assertmsg(msg);
        #/
        number = racket.var_4cc04c6a9dbfd0ee.size;
    }
    for (i = 0; i < number; i++) {
        node = racket.var_4cc04c6a9dbfd0ee[i];
        roll = randomint(100);
        var_2b48101ca8ad8249 = "br_loot_cache";
        if (roll < level.brgametype.var_5fca7073368d1eeb) {
            var_2b48101ca8ad8249 = "br_loot_cache_lege";
        }
        scriptable = spawnscriptable(var_2b48101ca8ad8249, node.origin, node.angles);
        scriptable setscriptablepartstate("body", "closed_usable");
    }
}

// Namespace namespace_550d8f4896d02349/namespace_fc28fc5402338af6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xba9
// Size: 0xb4
function function_c851837194379726(racket) {
    if (racket.var_f5d30f51ab09b3f8.size < 0) {
        msg = "No flag node found with target : " + racket.target;
        /#
            assertmsg(msg);
        #/
    }
    foreach (node in racket.var_f5d30f51ab09b3f8) {
        spawn_model("fabric_rectangular_aq_flag_windlevel_2_konni", node.origin, node.angles);
    }
}

// Namespace namespace_550d8f4896d02349/namespace_fc28fc5402338af6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc64
// Size: 0x71
function function_d34497ae5051ab11(racket) {
    objidnum = namespace_5a22b6f3a56f7e9b::requestobjectiveid(99);
    namespace_5a22b6f3a56f7e9b::objective_add(objidnum, "active", racket.origin, "hud_icon_objective_rackets", "icon_regular");
    objective_setbackground(objidnum, 1);
    objective_setrotateonminimap(objidnum, 1);
    objective_sethideelevation(objidnum, 1);
    namespace_5a22b6f3a56f7e9b::objective_playermask_showtoall(objidnum);
    racket.objidnum = objidnum;
}

// Namespace namespace_550d8f4896d02349/namespace_fc28fc5402338af6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xcdc
// Size: 0x37
function function_2ccbd153c93aade1(racket) {
    objective_delete(racket.objidnum);
    namespace_5a22b6f3a56f7e9b::returnobjectiveid(racket.objidnum);
    racket notify("cleared");
}

// Namespace namespace_550d8f4896d02349/namespace_fc28fc5402338af6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd1a
// Size: 0xa1
function function_3d9918f00f98b775(racket) {
    level endon("game_ended");
    racket endon("cleared");
    while (1) {
        if (namespace_c5622898120e827f::function_24c5a8d31ae262f(racket.origin)) {
            if (racket.agents.size != 0) {
                foreach (agent in racket.agents) {
                    killagent(agent);
                }
            }
        }
        wait(1);
    }
}

// Namespace namespace_550d8f4896d02349/namespace_fc28fc5402338af6
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdc2
// Size: 0x52
function function_4986e54ba19de354(racket) {
    level endon("game_ended");
    self waittill("death");
    racket.agents = array_remove(racket.agents, self);
    if (racket.agents.size == 0) {
        function_2ccbd153c93aade1(racket);
    }
}

