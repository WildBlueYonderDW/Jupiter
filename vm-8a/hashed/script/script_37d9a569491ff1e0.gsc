#using script_d74ae0b4aa21186;
#using script_59ff79d681bb860c;
#using scripts\mp\utility\game.gsc;
#using scripts\engine\utility.gsc;
#using script_26ccbfe3954cacf4;
#using scripts\mp\gametypes\br_public.gsc;

#namespace nearby_targets;

// Namespace nearby_targets / namespace_5524884c16a95af2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb3
// Size: 0xd1
function createevent(radius) {
    event = function_c74368899713e7e6();
    event.radius = radius;
    event.radiussquared = radius * radius;
    event.result = [];
    if (getsubgametype() == "ob" || getdvarint(@"hash_484a3169a5caef10", 0)) {
        event.searchtypes = 4294967295;
    } else {
        event.searchtypes = 1 | 2;
    }
    eventstream = self.mind.eventstream;
    eventstream.nearbytargets = event;
    eventstream.events[eventstream.events.size] = event;
}

// Namespace nearby_targets / namespace_5524884c16a95af2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18c
// Size: 0x29f
function getevent(searchtypes) {
    event = self.mind.eventstream.nearbytargets;
    if (!event.evaluated) {
        if (event.result.size > 0) {
            event.result = [];
        }
        searchtypes = default_to(searchtypes, event.searchtypes);
        if (searchtypes & (1 | 2)) {
            foreach (player in level.players) {
                if (self == player || !isdefined(player) || distancesquared(self.origin, player.origin) > event.radiussquared || !isaliveplayer(player) || player namespace_95d8d8ec67e3e074::isuibot() || player scripts\mp\gametypes\br_public::isplayerinorgoingtogulag()) {
                    continue;
                }
                typebit = ter_op(isbot(player), 2, 1);
                if ((typebit & searchtypes) == 0) {
                    continue;
                }
                event.result[event.result.size] = player;
            }
        }
        if (searchtypes & 4) {
            foreach (agent in level.agentarray) {
                if (function_f309740bc6350c0e(agent) && distancesquared(self.origin, agent.origin) <= event.radiussquared) {
                    event.result[event.result.size] = agent;
                }
            }
        }
        if (event.result.size > 1) {
            event.result = sortbydistance(event.result, self.origin);
        }
        event.origin = self.origin;
        event.evaluated = 1;
    }
    filter = spawnstruct();
    filter.event = event;
    filter.result = event.result;
    return filter;
}

// Namespace nearby_targets / namespace_5524884c16a95af2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x434
// Size: 0xb8
function indistance(distance) {
    assert(distance <= self.event.radius);
    distsq = squared(distance);
    result = [];
    for (i = 0; i < self.result.size; i++) {
        target = self.result[i];
        if (distancesquared(target.origin, self.event.origin) > distsq) {
            break;
        }
        result[result.size] = target;
    }
    self.result = result;
}

// Namespace nearby_targets / namespace_5524884c16a95af2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f4
// Size: 0x7e
function function_12203d401cb8332a(var_180f6abe6571c69f, var_4951c8537d45134f) {
    result = [];
    for (i = 0; i < self.result.size; i++) {
        target = self.result[i];
        isallied = isalliedsentient(var_180f6abe6571c69f, target);
        if (var_4951c8537d45134f == isallied) {
            result[result.size] = target;
        }
    }
    self.result = result;
}

// Namespace nearby_targets / namespace_5524884c16a95af2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57a
// Size: 0x14
function keepenemies(target) {
    function_12203d401cb8332a(target, 0);
}

// Namespace nearby_targets / namespace_5524884c16a95af2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x596
// Size: 0x15
function function_3e53d600c1f31122(target) {
    function_12203d401cb8332a(target, 1);
}

// Namespace nearby_targets / namespace_5524884c16a95af2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5b3
// Size: 0x35
function getradius() {
    event = self.mind.eventstream.nearbytargets;
    return event.radius;
}

