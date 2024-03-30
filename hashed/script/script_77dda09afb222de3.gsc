// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\mp\agents\agent_utility.gsc;
#using scripts\mp\poi.gsc;
#using script_48814951e916af89;
#using script_41ba451876d0900c;

#namespace namespace_729da2159f5f554c;

// Namespace namespace_729da2159f5f554c / namespace_6a47e8e8daf7b06b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x123
// Size: 0x1a8
function function_93a03eb03bc2c8ae(var_e2a66792e953b612) {
    if (getdvarint(@"hash_c98dc370c6dfbf22", 1) == 0) {
        return;
    }
    if (!isdefined(var_e2a66792e953b612)) {
        var_e2a66792e953b612 = 0;
    }
    level.var_b66460f12e76861e = getdvarint(@"hash_55589a53ff290c2c", var_e2a66792e953b612);
    triggername = "brightZone";
    if (level.var_b66460f12e76861e == 1) {
        triggername = "darkZone";
    }
    triggers = function_f159c10d5cf8f0b4(triggername, "targetname");
    if (!isdefined(triggers)) {
        return;
    }
    if (triggers.size == 0) {
        return;
    }
    if (scripts/mp/poi::function_47d356083884f913()) {
        function_44739fe1cf82e29a("lightZones");
        foreach (trigger in triggers) {
            poiname = function_6cc445c02b5effac(trigger.origin, 1, 1);
            function_d0e7647e5538eb9d(poiname, "lightZones", trigger);
        }
        foreach (poi in level.poi) {
            level thread function_db690b3317074f2c(poi["name"]);
        }
        return;
    }
    level.var_729da2159f5f554c = spawnstruct();
    level.var_729da2159f5f554c.triggers = triggers;
    level thread function_23c3fb7201561442();
}

// Namespace namespace_729da2159f5f554c / namespace_6a47e8e8daf7b06b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x2d2
// Size: 0xe1
function function_db690b3317074f2c(poiname) {
    level endon("game_ended");
    triggers = function_1af8a41e4c1252c7(poiname, "lightZones");
    while (true) {
        if (isdefined(level.poi[poiname]["players"])) {
            foreach (player in level.poi[poiname]["players"]) {
                obscured = !level.var_b66460f12e76861e;
                intrigger = function_bb16bd2ba27883ca(player, triggers);
                if (intrigger) {
                    obscured = level.var_b66460f12e76861e;
                }
                function_3b992a66c2e901bb(player, obscured);
            }
        }
        wait(1);
    }
}

// Namespace namespace_729da2159f5f554c / namespace_6a47e8e8daf7b06b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3ba
// Size: 0xb3
function function_23c3fb7201561442() {
    level endon("game_ended");
    while (true) {
        foreach (player in level.players) {
            obscured = !level.var_b66460f12e76861e;
            intrigger = function_bb16bd2ba27883ca(player, level.var_729da2159f5f554c.triggers);
            if (intrigger) {
                obscured = level.var_b66460f12e76861e;
            }
            function_3b992a66c2e901bb(player, obscured);
        }
        wait(1);
    }
}

// Namespace namespace_729da2159f5f554c / namespace_6a47e8e8daf7b06b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x474
// Size: 0x71
function function_bb16bd2ba27883ca(player, triggers) {
    foreach (trigger in triggers) {
        if (ispointinvolume(player.origin, trigger)) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_729da2159f5f554c / namespace_6a47e8e8daf7b06b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x4ed
// Size: 0x163
function function_3d7298d1b868205b(defaultsetting) {
    if (getdvarint(@"hash_d1a4ff4bc746059a", 1) == 0) {
        return;
    }
    triggers = function_f159c10d5cf8f0b4("sandstormZone", "targetname");
    if (!isdefined(triggers)) {
        return;
    }
    if (triggers.size == 0) {
        return;
    }
    if (scripts/mp/poi::function_47d356083884f913()) {
        function_44739fe1cf82e29a("sandstormZones");
        foreach (trigger in triggers) {
            poiname = function_6cc445c02b5effac(trigger.origin, 1, 1);
            function_d0e7647e5538eb9d(poiname, "sandstormZones", trigger);
        }
        foreach (poi in level.poi) {
            level thread function_89ccee52f247d9a3(poi["name"]);
        }
        return;
    }
    level.var_6a7c968accf74c57 = spawnstruct();
    level.var_6a7c968accf74c57.triggers = triggers;
    level thread function_3798fe70f2134791();
}

// Namespace namespace_729da2159f5f554c / namespace_6a47e8e8daf7b06b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x657
// Size: 0x1bb
function function_89ccee52f247d9a3(poiname) {
    level endon("game_ended");
    triggers = function_1af8a41e4c1252c7(poiname, "sandstormZones");
    if (!isdefined(triggers) || triggers.size == 0) {
        return;
    }
    while (true) {
        if (isdefined(level.poi[poiname]["players"])) {
            foreach (player in level.poi[poiname]["players"]) {
                insandstorm = function_491d53f82feb781b(player, triggers);
                function_3b992a66c2e901bb(player, insandstorm);
            }
            foreach (agent in function_7e3f22e620f3f71e(poiname, "everybody")) {
                if (!isalive(agent) || isint(agent)) {
                    continue;
                }
                insandstorm = function_491d53f82feb781b(agent, triggers);
                if (!isdefined(agent.insandstorm) || agent.insandstorm != insandstorm) {
                    agent.insandstorm = insandstorm;
                    if (insandstorm) {
                        if (false) {
                            agent thread function_7f12b9fec2560c48(agent);
                        }
                        namespace_bfef6903bca5845d::function_c9dad3876b9d8755(agent, "in_sandstorm");
                        continue;
                    }
                    if (false) {
                        agent notify("left_sandstorm");
                    }
                    starlevel = namespace_6a3f8c14894f44be::function_5cc0c507e92f7b47(poiname);
                    namespace_6a3f8c14894f44be::function_e04dbe0bd8a25be7(agent, starlevel);
                }
            }
        }
        wait(1);
    }
}

// Namespace namespace_729da2159f5f554c / namespace_6a47e8e8daf7b06b
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x819
// Size: 0x1af
function function_3798fe70f2134791() {
    level endon("game_ended");
    if (!isdefined(level.var_6a7c968accf74c57.triggers) || level.var_6a7c968accf74c57.triggers.size == 0) {
        return;
    }
    while (true) {
        foreach (player in level.players) {
            insandstorm = function_491d53f82feb781b(player, level.var_6a7c968accf74c57.triggers);
            function_3b992a66c2e901bb(player, insandstorm);
        }
        foreach (agent in level.agentarray) {
            if (!isalive(agent)) {
                continue;
            }
            insandstorm = function_491d53f82feb781b(agent, level.var_6a7c968accf74c57.triggers);
            if (!isdefined(agent.insandstorm) || agent.insandstorm != insandstorm) {
                agent.insandstorm = insandstorm;
                if (insandstorm) {
                    if (false) {
                        agent thread function_7f12b9fec2560c48(agent);
                    }
                    namespace_bfef6903bca5845d::function_c9dad3876b9d8755(agent, "in_sandstorm");
                    continue;
                }
                if (false) {
                    agent notify("left_sandstorm");
                }
                starlevel = namespace_6a3f8c14894f44be::function_5cc0c507e92f7b47();
                namespace_6a3f8c14894f44be::function_e04dbe0bd8a25be7(agent, starlevel);
            }
        }
        wait(1);
    }
}

// Namespace namespace_729da2159f5f554c / namespace_6a47e8e8daf7b06b
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9cf
// Size: 0x71
function function_491d53f82feb781b(ent, triggers) {
    foreach (trigger in triggers) {
        if (ispointinvolume(ent.origin, trigger)) {
            return true;
        }
    }
    return false;
}

// Namespace namespace_729da2159f5f554c / namespace_6a47e8e8daf7b06b
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xa48
// Size: 0x46
function function_7f12b9fec2560c48(agent) {
    agent endon("left_sandstorm");
    agent endon("death");
    while (true) {
        /#
            sphere(agent.origin, 64, (1, 1, 0));
        #/
        waitframe();
    }
}

