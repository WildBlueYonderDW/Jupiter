// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using script_3b64eb40368c1450;
#using scripts\mp\utility\player.gsc;
#using scripts\mp\utility\entity.gsc;
#using scripts\mp\gameobjects.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;
#using scripts\mp\spawnlogic.gsc;

#namespace namespace_cb97214c768c4dbd;

// Namespace namespace_cb97214c768c4dbd/namespace_86b52005c685dfb9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x162
// Size: 0xdf
function agentfunc(func_name) {
    /#
        assert(isagent(self));
    #/
    /#
        assert(isdefined(func_name));
    #/
    /#
        assert(isdefined(self.agent_type));
    #/
    /#
        assert(isdefined(level.agent_funcs[self.agent_type]));
    #/
    /#
        assert(isdefined(level.agent_funcs[self.agent_type][func_name]));
    #/
    if (isdefined(self.unittype) && isdefined(level.agent_funcs[self.unittype]) && isdefined(level.agent_funcs[self.unittype][func_name])) {
        return level.agent_funcs[self.unittype][func_name];
    }
    return level.agent_funcs[self.agent_type][func_name];
}

// Namespace namespace_cb97214c768c4dbd/namespace_86b52005c685dfb9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x249
// Size: 0x53
function set_agent_team(team, var_123f05cf9530a069) {
    self.team = team;
    self.agentteam = team;
    self.pers["team"] = team;
    self.owner = var_123f05cf9530a069;
    self setotherent(var_123f05cf9530a069);
    self setentityowner(var_123f05cf9530a069);
}

// Namespace namespace_cb97214c768c4dbd/namespace_86b52005c685dfb9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a3
// Size: 0x9d
function initagentscriptvariables() {
    self.agent_type = "player";
    self.pers = [];
    self.hasdied = 0;
    self.isactive = 0;
    self.isagent = 1;
    self.wasti = 0;
    self.entity_number = self getentitynumber();
    self.agent_teamparticipant = 0;
    self.agent_gameparticipant = 0;
    self.agentname = undefined;
    self.ignoreall = istrue(level.var_bdb4d0cd41b1c39d);
    self.ignoreme = 0;
    self detachall();
    initplayerscriptvariables(0);
}

// Namespace namespace_cb97214c768c4dbd/namespace_86b52005c685dfb9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x347
// Size: 0x17f
function initplayerscriptvariables(var_fd0b76eb4612b2a4) {
    if (!var_fd0b76eb4612b2a4) {
        self.class = undefined;
        self.lastclass = undefined;
        self.movespeedscaler = undefined;
        self.avoidkillstreakonspawntimer = undefined;
        self.guid = undefined;
        self.name = undefined;
        self.perks = undefined;
        self.weaponlist = undefined;
        self.objectivescaler = undefined;
        self.touchtriggers = undefined;
        self.carryobject = undefined;
        self.canpickupobject = undefined;
        self.sessionteam = undefined;
        self.sessionstate = undefined;
        self.lastspawntime = undefined;
        self.lastspawnpoint = undefined;
        val::nuke("weapon");
        val::nuke("weapon_switch");
        val::nuke("offhand_weapons");
        val::nuke("usability");
        self.shieldbullethits = undefined;
        self.recentshieldxp = undefined;
    } else {
        self.movespeedscaler = 1;
        self.avoidkillstreakonspawntimer = 5;
        self.guid = getuniqueid();
        self.name = self.guid;
        self.sessionteam = self.team;
        self.sessionstate = "playing";
        self.shieldbullethits = 0;
        self.recentshieldxp = 0;
        self.agent_gameparticipant = 1;
        self.objectivescaler = 1;
        namespace_19b4203b51d56488::init_player_gameobjects();
    }
}

// Namespace namespace_cb97214c768c4dbd/namespace_86b52005c685dfb9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4cd
// Size: 0x4c
function getfreeagent(agent_type) {
    var_7818398cdd97fe84 = undefined;
    if (isdefined(level.agentarray)) {
        var_7818398cdd97fe84 = function_76b285b4bae7356c();
        if (isdefined(var_7818398cdd97fe84)) {
            var_7818398cdd97fe84 initagentscriptvariables();
            if (isdefined(agent_type)) {
                var_7818398cdd97fe84.agent_type = agent_type;
            }
        }
    }
    return var_7818398cdd97fe84;
}

// Namespace namespace_cb97214c768c4dbd/namespace_86b52005c685dfb9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x521
// Size: 0x3a
function activateagent() {
    /#
        if (!self.isactive) {
            /#
                assertex(self.connecttime == gettime(), "<unknown string>");
            #/
        }
    #/
    self.isactive = 1;
}

// Namespace namespace_cb97214c768c4dbd/namespace_86b52005c685dfb9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x562
// Size: 0xb
function deactivateagent() {
    thread deactivateagentdelayed();
}

// Namespace namespace_cb97214c768c4dbd/namespace_86b52005c685dfb9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x574
// Size: 0x145
function deactivateagentdelayed() {
    self notify("deactivateAgentDelayed");
    self endon("deactivateAgentDelayed");
    if (namespace_36f464722d326bbe::isgameparticipant(self)) {
        namespace_36f464722d326bbe::removefromparticipantsarray();
    }
    namespace_36f464722d326bbe::removefromcharactersarray();
    wait(0.05);
    self.isactive = 0;
    self.hasdied = 0;
    self.owner = undefined;
    self.connecttime = undefined;
    foreach (character in level.characters) {
        if (isdefined(character.attackers)) {
            foreach (index, attacker in character.attackers) {
                if (attacker == self) {
                    character.attackers[index] = undefined;
                }
            }
        }
    }
    if (isdefined(self.headmodel)) {
        self detach(self.headmodel);
        self.headmodel = undefined;
    }
    self notify("disconnect");
}

// Namespace namespace_cb97214c768c4dbd/namespace_86b52005c685dfb9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x6c0
// Size: 0x2c
function getnumactiveagents(type) {
    if (!isdefined(type)) {
        type = "all";
    }
    agents = getactiveagentsoftype(type);
    return agents.size;
}

// Namespace namespace_cb97214c768c4dbd/namespace_86b52005c685dfb9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6f4
// Size: 0xbf
function getactiveagentsoftype(type) {
    /#
        assert(isdefined(type));
    #/
    agents = [];
    if (!isdefined(level.agentarray)) {
        return agents;
    }
    foreach (agent in level.agentarray) {
        if (isdefined(agent.isactive) && agent.isactive) {
            if (type == "all" || agent.agent_type == type) {
                agents[agents.size] = agent;
            }
        }
    }
    return agents;
}

// Namespace namespace_cb97214c768c4dbd/namespace_86b52005c685dfb9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7bb
// Size: 0x18
function getnumownedactiveagents(player) {
    return getnumownedactiveagentsbytype(player, "all");
}

// Namespace namespace_cb97214c768c4dbd/namespace_86b52005c685dfb9
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7db
// Size: 0xf9
function getnumownedactiveagentsbytype(player, type) {
    /#
        assert(isdefined(type));
    #/
    var_b766e199310ed9ac = 0;
    if (!isdefined(level.agentarray)) {
        return var_b766e199310ed9ac;
    }
    foreach (agent in level.agentarray) {
        if (isdefined(agent.isactive) && agent.isactive) {
            if (isdefined(agent.owner) && agent.owner == player) {
                if (type == "all" && agent.agent_type != "alien" || agent.agent_type == type) {
                    var_b766e199310ed9ac++;
                }
            }
        }
    }
    return var_b766e199310ed9ac;
}

// Namespace namespace_cb97214c768c4dbd/namespace_86b52005c685dfb9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x8dc
// Size: 0xff
function getnumownedagentsonteambytype(team, type) {
    /#
        assert(isdefined(team) && isdefined(type));
    #/
    var_b766e199310ed9ac = 0;
    if (!isdefined(level.agentarray)) {
        return var_b766e199310ed9ac;
    }
    foreach (agent in level.agentarray) {
        if (isdefined(agent.isactive) && agent.isactive) {
            if (isdefined(agent.team) && agent.team == team) {
                if (type == "all" && agent.agent_type != "alien" || agent.agent_type == type) {
                    var_b766e199310ed9ac++;
                }
            }
        }
    }
    return var_b766e199310ed9ac;
}

// Namespace namespace_cb97214c768c4dbd/namespace_86b52005c685dfb9
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x9e3
// Size: 0x35f
function getvalidspawnpathnodenearplayer(var_17bb852304a6478e, var_dd84cf0c92913cb9) {
    /#
        assert(isplayer(self));
    #/
    var_5836c6d53a5f99a2 = getnodesinradius(self.origin, 350, 64, 128, "Path");
    if (!isdefined(var_5836c6d53a5f99a2) || var_5836c6d53a5f99a2.size == 0) {
        return undefined;
    }
    if (isdefined(level.waterdeletez) && isdefined(level.trigunderwater)) {
        var_22a832c83ea6f75f = var_5836c6d53a5f99a2;
        var_5836c6d53a5f99a2 = [];
        foreach (node in var_22a832c83ea6f75f) {
            if (node.origin[2] > level.waterdeletez || !ispointinvolume(node.origin, level.trigunderwater)) {
                var_5836c6d53a5f99a2[var_5836c6d53a5f99a2.size] = node;
            }
        }
    }
    playerdirection = anglestoforward(self.angles);
    bestdot = -10;
    var_41cdd7fc4a85331f = namespace_b2d5aa2baf2b5701::getplayertraceheight(self);
    zoffset = (0, 0, var_41cdd7fc4a85331f);
    if (!isdefined(var_17bb852304a6478e)) {
        var_17bb852304a6478e = 0;
    }
    if (!isdefined(var_dd84cf0c92913cb9)) {
        var_dd84cf0c92913cb9 = 0;
    }
    var_154744dc373ef9 = [];
    var_4236cf84c1c222b3 = [];
    foreach (pathnode in var_5836c6d53a5f99a2) {
        if (!pathnode doesnodeallowstance("stand") || isdefined(pathnode.no_agent_spawn)) {
            continue;
        }
        var_644ab9fda129b92b = vectornormalize(pathnode.origin - self.origin);
        dot = vectordot(playerdirection, var_644ab9fda129b92b);
        for (i = 0; i < var_4236cf84c1c222b3.size; i++) {
            if (dot > var_4236cf84c1c222b3[i]) {
                for (j = var_4236cf84c1c222b3.size; j > i; j--) {
                    var_4236cf84c1c222b3[j] = var_4236cf84c1c222b3[j - 1];
                    var_154744dc373ef9[j] = var_154744dc373ef9[j - 1];
                }
                break;
            }
        }
        var_154744dc373ef9[i] = pathnode;
        var_4236cf84c1c222b3[i] = dot;
    }
    for (i = 0; i < var_154744dc373ef9.size; i++) {
        pathnode = var_154744dc373ef9[i];
        tracestart = self.origin + zoffset;
        traceend = pathnode.origin + zoffset;
        if (i > 0) {
            wait(0.05);
        }
        if (!sighttracepassed(tracestart, traceend, 0, self)) {
            continue;
        }
        if (var_dd84cf0c92913cb9) {
            if (i > 0) {
                wait(0.05);
            }
            hitpos = playerphysicstrace(pathnode.origin + zoffset, pathnode.origin);
            jumpiffalse(distancesquared(hitpos, pathnode.origin) > 1) LOC_0000032a;
        } else if (var_17bb852304a6478e) {
            if (i > 0) {
                wait(0.05);
            }
            hitpos = physicstrace(tracestart, traceend);
            jumpiffalse(distancesquared(hitpos, traceend) > 1) LOC_00000354;
        } else {
        LOC_00000354:
            return pathnode;
        }
    }
}

// Namespace namespace_cb97214c768c4dbd/namespace_86b52005c685dfb9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xd49
// Size: 0x8e
function function_b071e509c0fb69b0() {
    if (self getstance() == "crouch") {
        center = self.origin + 0.5 * (0, 0, 50);
    } else if (self getstance() == "prone") {
        center = self.origin + 0.5 * (0, 0, 48);
    } else {
        center = self.origin + 0.5 * (0, 0, 72);
    }
    return center;
}

// Namespace namespace_cb97214c768c4dbd/namespace_86b52005c685dfb9
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xddf
// Size: 0x7c
function function_2e1b23386b967c10() {
    if (self getstance() == "crouch") {
        center = self.origin + (0, 0, 50);
    } else if (self getstance() == "prone") {
        center = self.origin + (0, 0, 48);
    } else {
        center = self.origin + (0, 0, 72);
    }
    return center;
}

// Namespace namespace_cb97214c768c4dbd/namespace_86b52005c685dfb9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe63
// Size: 0x2f
function killagent(agent) {
    agent dodamage(agent.health + 500000, agent.origin);
}

// Namespace namespace_cb97214c768c4dbd/namespace_86b52005c685dfb9
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xe99
// Size: 0x4b
function killdog() {
    self [[ agentfunc("on_damaged") ]](level, undefined, self.health + 1, 0, "MOD_CRUSH", "none", (0, 0, 0), (0, 0, 0), "none", 0);
}

// Namespace namespace_cb97214c768c4dbd/namespace_86b52005c685dfb9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xeeb
// Size: 0x25
function function_7956dfd1302cddff(unittype) {
    return isdefined(self.unittype) && self.unittype == unittype;
}

// Namespace namespace_cb97214c768c4dbd/namespace_86b52005c685dfb9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf18
// Size: 0x2f
function iscivilian(agent) {
    var_d2664652fb0cb884 = agent.category;
    return isdefined(var_d2664652fb0cb884) && var_d2664652fb0cb884 == "civilian";
}

// Namespace namespace_cb97214c768c4dbd/namespace_86b52005c685dfb9
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0xf4f
// Size: 0x39
function function_86df29145c484d9c(agent) {
    if (!isdefined(agent) || !isdefined(agent.agent_type)) {
        return 0;
    }
    return issubstr(agent.agent_type, "_merc");
}

// Namespace namespace_cb97214c768c4dbd/namespace_86b52005c685dfb9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf90
// Size: 0x39
function function_17b2ecdae3a795f6(agent) {
    if (!isdefined(agent) || !isdefined(agent.agent_type)) {
        return 0;
    }
    return issubstr(agent.agent_type, "_ru");
}

// Namespace namespace_cb97214c768c4dbd/namespace_86b52005c685dfb9
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfd1
// Size: 0x39
function function_35cc816aceeeb402(agent) {
    if (!isdefined(agent) || !isdefined(agent.agent_type)) {
        return 0;
    }
    return issubstr(agent.agent_type, "tier3");
}

