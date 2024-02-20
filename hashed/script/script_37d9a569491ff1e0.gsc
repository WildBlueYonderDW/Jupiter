// mwiii decomp prototype
#using script_d74ae0b4aa21186;
#using script_59ff79d681bb860c;
#using scripts\mp\utility\game.gsc;
#using scripts\engine\utility.gsc;
#using script_26ccbfe3954cacf4;
#using scripts\mp\gametypes\br_public.gsc;

#namespace namespace_c203c3fef8e900a7;

// Namespace namespace_c203c3fef8e900a7/namespace_5524884c16a95af2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb3
// Size: 0xd2
function function_69b64f047b0af1db(radius) {
    event = function_c74368899713e7e6();
    event.radius = radius;
    event.var_8fa87d2c8780e014 = radius * radius;
    event.result = [];
    if (getsubgametype() == "ob" || getdvarint(@"hash_484a3169a5caef10", 0)) {
        event.var_5a7fa93735ceec62 = 4294967295;
    } else {
        event.var_5a7fa93735ceec62 = 1 | 2;
    }
    var_3c91684198954c83 = self.Mind.var_3c91684198954c83;
    var_3c91684198954c83.var_bc19a29ed084d79c = event;
    var_3c91684198954c83.events[var_3c91684198954c83.events.size] = event;
}

// Namespace namespace_c203c3fef8e900a7/namespace_5524884c16a95af2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18c
// Size: 0x2a0
function function_7e7ddfa33eff2c11(var_5a7fa93735ceec62) {
    event = self.Mind.var_3c91684198954c83.var_bc19a29ed084d79c;
    if (!event.var_d0942e9d2044d6c6) {
        if (event.result.size > 0) {
            event.result = [];
        }
        var_5a7fa93735ceec62 = function_53c4c53197386572(var_5a7fa93735ceec62, event.var_5a7fa93735ceec62);
        if (var_5a7fa93735ceec62 & (1 | 2)) {
            foreach (player in level.players) {
                if (self == player || !isdefined(player) || distancesquared(self.origin, player.origin) > event.var_8fa87d2c8780e014 || !function_ded80385ea7471db(player) || player namespace_95d8d8ec67e3e074::function_6ecc7cd453466014() || player namespace_d3d40f75bb4e4c32::isplayerinorgoingtogulag()) {
                    continue;
                }
                var_5ee7711499bf12c4 = ter_op(isbot(player), 2, 1);
                if ((var_5ee7711499bf12c4 & var_5a7fa93735ceec62) == 0) {
                    continue;
                }
                event.result[event.result.size] = player;
            }
        }
        if (var_5a7fa93735ceec62 & 4) {
            foreach (agent in level.agentarray) {
                if (function_f309740bc6350c0e(agent) && distancesquared(self.origin, agent.origin) <= event.var_8fa87d2c8780e014) {
                    event.result[event.result.size] = agent;
                }
            }
        }
        if (event.result.size > 1) {
            event.result = sortbydistance(event.result, self.origin);
        }
        event.origin = self.origin;
        event.var_d0942e9d2044d6c6 = 1;
    }
    filter = spawnstruct();
    filter.event = event;
    filter.result = event.result;
    return filter;
}

// Namespace namespace_c203c3fef8e900a7/namespace_5524884c16a95af2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x434
// Size: 0xb9
function function_8500e6ae452b1e19(distance) {
    /#
        assert(distance <= self.event.radius);
    #/
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

// Namespace namespace_c203c3fef8e900a7/namespace_5524884c16a95af2
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4f4
// Size: 0x7f
function function_12203d401cb8332a(var_180f6abe6571c69f, var_4951c8537d45134f) {
    result = [];
    for (i = 0; i < self.result.size; i++) {
        target = self.result[i];
        var_4e2f45f5b1dfd822 = isalliedsentient(var_180f6abe6571c69f, target);
        if (var_4951c8537d45134f == var_4e2f45f5b1dfd822) {
            result[result.size] = target;
        }
    }
    self.result = result;
}

// Namespace namespace_c203c3fef8e900a7/namespace_5524884c16a95af2
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x57a
// Size: 0x15
function function_2f1735d1cb737a0c(target) {
    function_12203d401cb8332a(target, 0);
}

// Namespace namespace_c203c3fef8e900a7/namespace_5524884c16a95af2
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x596
// Size: 0x16
function function_3e53d600c1f31122(target) {
    function_12203d401cb8332a(target, 1);
}

// Namespace namespace_c203c3fef8e900a7/namespace_5524884c16a95af2
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5b3
// Size: 0x36
function getradius() {
    event = self.Mind.var_3c91684198954c83.var_bc19a29ed084d79c;
    return event.radius;
}

