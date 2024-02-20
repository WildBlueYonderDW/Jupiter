// mwiii decomp prototype
#using script_d74ae0b4aa21186;
#using scripts\engine\utility.gsc;
#using scripts\mp\gameobjects.gsc;

#namespace namespace_746991ada5f529ec;

// Namespace namespace_746991ada5f529ec/namespace_ba8cfebbc70bb00b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x80
// Size: 0x66
function function_69b64f047b0af1db() {
    event = function_c74368899713e7e6();
    event.result = [];
    var_3c91684198954c83 = self.Mind.var_3c91684198954c83;
    var_3c91684198954c83.var_d338b2cc0965fdb3 = event;
    var_3c91684198954c83.events[var_3c91684198954c83.events.size] = event;
}

// Namespace namespace_746991ada5f529ec/namespace_ba8cfebbc70bb00b
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xed
// Size: 0x126
function function_7e7ddfa33eff2c11() {
    event = self.Mind.var_3c91684198954c83.var_d338b2cc0965fdb3;
    if (!event.var_d0942e9d2044d6c6) {
        if (event.result.size > 0) {
            event.result = [];
        }
        if (!isdefined(level.allfobs)) {
            return event.result;
        }
        foreach (fob in level.allfobs) {
            var_b9100d06b4fcec73 = fob.trigger.gameobject;
            if (!var_b9100d06b4fcec73 namespace_19b4203b51d56488::caninteractwith(self.team)) {
                continue;
            }
            event.result[event.result.size] = fob;
        }
        event.var_d0942e9d2044d6c6 = 1;
    }
    return event.result;
}

