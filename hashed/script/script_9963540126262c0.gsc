// mwiii decomp prototype
#using script_d74ae0b4aa21186;
#using scripts\engine\utility.gsc;
#using scripts\cp_mp\utility\game_utility.gsc;

#namespace namespace_4cfb97b54bb76867;

// Namespace namespace_4cfb97b54bb76867/namespace_bfa2898056f8354
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xe4
// Size: 0xb5
function function_69b64f047b0af1db(radius) {
    event = function_c74368899713e7e6();
    event.radius = radius;
    event.var_8fa87d2c8780e014 = radius * radius;
    event.result = [];
    var_3c91684198954c83 = self.mind.var_3c91684198954c83;
    var_3c91684198954c83.var_c821041ce9f4100b = event;
    var_3c91684198954c83.events[var_3c91684198954c83.events.size] = event;
    if (!isdefined(level.mind.events.var_5b25e7620e424cb2)) {
        level thread function_f1f01b106bb7bd95();
    }
}

// Namespace namespace_4cfb97b54bb76867/namespace_bfa2898056f8354
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1a0
// Size: 0xe6
function function_f1f01b106bb7bd95() {
    level endon("game_ended");
    level.mind.events.var_5b25e7620e424cb2 = [];
    if (namespace_36f464722d326bbe::isbrstylegametype() && !istrue(level.skipprematch)) {
        level waittill("prematch_cleanup");
    }
    result = [];
    var_b252afb1c6d8213c = getentitylessscriptablearray(undefined, undefined, undefined, undefined, "br_plunder_box");
    foreach (station in var_b252afb1c6d8213c) {
        if (istrue(station.visible)) {
            result[result.size] = station;
        }
    }
    level.mind.events.var_5b25e7620e424cb2 = result;
}

// Namespace namespace_4cfb97b54bb76867/namespace_bfa2898056f8354
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x28d
// Size: 0x113
function function_7e7ddfa33eff2c11() {
    event = self.mind.var_3c91684198954c83.var_c821041ce9f4100b;
    if (!event.var_d0942e9d2044d6c6) {
        if (event.result.size > 0) {
            event.result = [];
        }
        foreach (station in level.mind.events.var_5b25e7620e424cb2) {
            if (distancesquared(station.origin, self.origin) <= event.var_8fa87d2c8780e014) {
                event.result[event.result.size] = station;
            }
        }
        event.var_d0942e9d2044d6c6 = 1;
    }
    return event.result;
}

