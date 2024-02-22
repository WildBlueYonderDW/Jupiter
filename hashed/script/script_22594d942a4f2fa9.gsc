// mwiii decomp prototype
#using script_d74ae0b4aa21186;
#using scripts\engine\utility.gsc;

#namespace namespace_cd1f26d31e0fc552;

// Namespace namespace_cd1f26d31e0fc552/namespace_e3ef90d32ac66277
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x94
// Size: 0x93
function function_69b64f047b0af1db(radius, duration) {
    event = function_c74368899713e7e6();
    event.var_8fa87d2c8780e014 = radius * radius;
    event.duration = duration;
    event.result = [];
    var_3c91684198954c83 = self.mind.var_3c91684198954c83;
    var_3c91684198954c83.var_b726268175e85134 = event;
    var_3c91684198954c83.events[var_3c91684198954c83.events.size] = event;
}

// Namespace namespace_cd1f26d31e0fc552/namespace_e3ef90d32ac66277
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x12e
// Size: 0x2ab
function function_7e7ddfa33eff2c11() {
    event = self.mind.var_3c91684198954c83.var_b726268175e85134;
    if (!event.var_d0942e9d2044d6c6) {
        if (event.result.size > 0) {
            foreach (entnum, var_855eb1686e661658 in event.result) {
                var_23818fd0489c7005 = function_3eeaf0541f4883fe(var_855eb1686e661658.time, var_855eb1686e661658.origin);
                if (var_23818fd0489c7005) {
                    event.result[entnum] = undefined;
                }
            }
        }
        foreach (player in level.players) {
            skip = !isdefined(player) || self.team == player.team;
            if (skip) {
                continue;
            }
            lasttime = self lastknowntime(player);
            lastpos = self lastknownpos(player);
            var_dfc26e2288ab07cb = lasttime <= 0;
            var_b9f15fe7c92886c0 = !isvector(lastpos);
            entitynumber = player getentitynumber();
            shoulddelete = var_dfc26e2288ab07cb || var_b9f15fe7c92886c0 || function_3eeaf0541f4883fe(lasttime, lastpos);
            if (shoulddelete) {
                if (isdefined(event.result[entitynumber])) {
                    event.result[entitynumber] = undefined;
                }
            } else {
                entry = event.result[entitynumber];
                if (!isdefined(entry)) {
                    entry = spawnstruct();
                    entry.entnum = entitynumber;
                    entry.valid = 1;
                    entry.time = lasttime;
                    entry.origin = lastpos;
                    event.result[entitynumber] = entry;
                } else if (lasttime != entry.time) {
                    entry.valid = 1;
                    entry.time = lasttime;
                    entry.origin = lastpos;
                }
            }
        }
        event.var_d0942e9d2044d6c6 = 1;
    }
    return event.result;
}

// Namespace namespace_cd1f26d31e0fc552/namespace_e3ef90d32ac66277
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x3e1
// Size: 0x36
function function_fbb2d5e09e58db7() {
    event = self.mind.var_3c91684198954c83.var_b726268175e85134;
    return event.duration;
}

// Namespace namespace_cd1f26d31e0fc552/namespace_e3ef90d32ac66277
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41f
// Size: 0x5e
function function_6ecf7023ef123ba0(entitynumber) {
    event = self.mind.var_3c91684198954c83.var_b726268175e85134;
    entry = event.result[entitynumber];
    if (isdefined(entry)) {
        entry.valid = 0;
    }
}

// Namespace namespace_cd1f26d31e0fc552/namespace_e3ef90d32ac66277
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x484
// Size: 0x72
function function_3eeaf0541f4883fe(time, position) {
    event = self.mind.var_3c91684198954c83.var_b726268175e85134;
    return (gettime() - time) / 1000 > event.duration || distancesquared(self.origin, position) > event.var_8fa87d2c8780e014;
}

