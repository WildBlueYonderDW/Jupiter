// mwiii decomp prototype
#using script_d74ae0b4aa21186;
#using scripts\engine\utility.gsc;
#using scripts\mp\gameobjects.gsc;

#namespace namespace_4b022bbde284cec1;

// Namespace namespace_4b022bbde284cec1/namespace_45524b6bc7f1f3ac
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb2
// Size: 0x66
function function_69b64f047b0af1db() {
    event = function_c74368899713e7e6();
    event.result = [];
    var_3c91684198954c83 = self.Mind.var_3c91684198954c83;
    var_3c91684198954c83.var_c0f0c13703c22359 = event;
    var_3c91684198954c83.events[var_3c91684198954c83.events.size] = event;
}

// Namespace namespace_4b022bbde284cec1/namespace_45524b6bc7f1f3ac
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11f
// Size: 0x194
function function_7e7ddfa33eff2c11() {
    event = self.Mind.var_3c91684198954c83.var_c0f0c13703c22359;
    if (!event.var_d0942e9d2044d6c6) {
        if (event.result.size > 0) {
            event.result = [];
        }
        if (!isdefined(level.objectives)) {
            return event.result;
        }
        foreach (obj in level.objectives) {
            switch (level.gametype) {
            case #"hash_ca6516c10db2c95":
            case #"hash_f4a9126c03d3385b":
                if (self.team == obj namespace_19b4203b51d56488::getownerteam()) {
                    goto LOC_00000133;
                }
                break;
            case #"hash_6efb0f59a62300fb":
            case #"hash_ec72fd25bbbac99e":
                if (!istrue(obj.active)) {
                    goto LOC_00000133;
                }
                break;
            }
            event.result[event.result.size] = obj;
        LOC_00000133:
        }
        if (event.result.size > 1) {
            event.result = array_sort_with_func(event.result, &function_cb083b117c783af);
        }
        event.var_d0942e9d2044d6c6 = 1;
    }
    return event.result;
}

// Namespace namespace_4b022bbde284cec1/namespace_45524b6bc7f1f3ac
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2bb
// Size: 0x47
function function_cb083b117c783af(var_52283a0a1cf75c1e, var_5228390a1cf759eb) {
    return distancesquared(var_52283a0a1cf75c1e.curorigin, self.origin) < distancesquared(var_5228390a1cf759eb.curorigin, self.origin);
}

// Namespace namespace_4b022bbde284cec1/namespace_45524b6bc7f1f3ac
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x30a
// Size: 0x61
function function_b4e30a9548aa351b() {
    /#
        assert(level.gametype == "koth" || level.gametype == "koth_horde");
    #/
    var_10887ef2f24a6c0d = level.prevzoneindex % level.objectives.size + 1;
    return level.objectives[string(var_10887ef2f24a6c0d)];
}

