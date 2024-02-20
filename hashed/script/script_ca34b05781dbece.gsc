// mwiii decomp prototype
#using script_d74ae0b4aa21186;
#using scripts\engine\utility.gsc;

#namespace namespace_f0be73a95f76c7ed;

// Namespace namespace_f0be73a95f76c7ed/namespace_9d48dceb90164d92
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb5
// Size: 0x7e
function function_69b64f047b0af1db(radius) {
    event = function_c74368899713e7e6();
    event.result = [];
    event.radiussq = radius * radius;
    var_3c91684198954c83 = self.Mind.var_3c91684198954c83;
    var_3c91684198954c83.var_ec10c084410e83fc = event;
    var_3c91684198954c83.events[var_3c91684198954c83.events.size] = event;
}

// Namespace namespace_f0be73a95f76c7ed/namespace_9d48dceb90164d92
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x13a
// Size: 0x1b9
function function_7e7ddfa33eff2c11() {
    event = self.Mind.var_3c91684198954c83.var_ec10c084410e83fc;
    if (!event.var_d0942e9d2044d6c6) {
        if (event.result.size > 0) {
            event.result = [];
        }
        entarray = getentarray("script_model", "classname");
        foreach (ent in entarray) {
            if (isdefined(ent.cratetype) && ent.cratetype == "battle_royale_loadout" && ent.team == self.team && istrue(ent.isusable) && !istrue(ent.var_2a6f82a735950253) && distancesquared(self.origin, ent.origin) < event.radiussq) {
                entry = spawnstruct();
                entry.type = "airdrop_loadout";
                entry.entity = ent;
                entry.entity.index = ent getentitynumber();
                event.result[event.result.size] = entry;
            }
        }
        event.var_d0942e9d2044d6c6 = 1;
    }
    return event.result;
}

