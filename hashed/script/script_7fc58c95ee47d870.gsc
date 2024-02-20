// mwiii decomp prototype
#using script_d74ae0b4aa21186;
#using scripts\engine\utility.gsc;

#namespace namespace_a8c188143ce759d3;

// Namespace namespace_a8c188143ce759d3/namespace_a88fd88e39d4308
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb8
// Size: 0x15b
function function_69b64f047b0af1db(radius) {
    event = function_c74368899713e7e6();
    event.radius = radius;
    event.var_8fa87d2c8780e014 = radius * radius;
    event.result = [];
    var_3c91684198954c83 = self.Mind.var_3c91684198954c83;
    var_3c91684198954c83.var_61c0bf2e5d0b72d1 = event;
    var_3c91684198954c83.events[var_3c91684198954c83.events.size] = event;
    if (!isdefined(level.Mind.events.var_cce0bdb14ad78af5)) {
        result = [];
        for (i = 0; i < getlootspawnscriptableindexfirst(); i++) {
            var_db376ee90688810d = getscriptableinstancefromindex(i);
            if (!isdefined(var_db376ee90688810d)) {
                continue;
            }
            if (var_db376ee90688810d.type == "military_ammo_restock") {
                idx = result.size;
                result[idx] = spawnstruct();
                result[idx].entity = var_db376ee90688810d;
                result[idx].type = "ammo_restock";
            }
        }
        level.Mind.events.var_cce0bdb14ad78af5 = result;
    }
}

// Namespace namespace_a8c188143ce759d3/namespace_a88fd88e39d4308
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x21a
// Size: 0x12f
function function_7e7ddfa33eff2c11() {
    event = self.Mind.var_3c91684198954c83.var_61c0bf2e5d0b72d1;
    if (!event.var_d0942e9d2044d6c6) {
        if (event.result.size > 0) {
            event.result = [];
        }
        foreach (ammorestock in level.Mind.events.var_cce0bdb14ad78af5) {
            if (istrue(ammorestock.var_2a6f82a735950253)) {
                continue;
            }
            if (distancesquared(ammorestock.entity.origin, self.origin) < event.var_8fa87d2c8780e014) {
                event.result[event.result.size] = ammorestock;
            }
        }
        event.var_d0942e9d2044d6c6 = 1;
    }
    return event.result;
}

