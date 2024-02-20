// mwiii decomp prototype
#using script_d74ae0b4aa21186;
#using scripts\engine\utility.gsc;

#namespace namespace_3606b64785f08163;

// Namespace namespace_3606b64785f08163/namespace_1bebff3a2e9afaca
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb5
// Size: 0xbe
function function_69b64f047b0af1db(radius) {
    event = function_c74368899713e7e6();
    event.var_8fa87d2c8780e014 = radius * radius;
    event.result = [];
    var_3c91684198954c83 = self.var_3c59090ee220ab3d.var_3c91684198954c83;
    var_3c91684198954c83.var_9b7e812b9d289bbf = event;
    var_3c91684198954c83.events[var_3c91684198954c83.events.size] = event;
    if (!isdefined(level.var_3c59090ee220ab3d.events.var_39dae4a0e7ee4d47)) {
        level.var_3c59090ee220ab3d.events.var_39dae4a0e7ee4d47 = [];
    }
}

// Namespace namespace_3606b64785f08163/namespace_1bebff3a2e9afaca
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x17a
// Size: 0x122
function function_7e7ddfa33eff2c11() {
    event = self.var_3c59090ee220ab3d.var_3c91684198954c83.var_9b7e812b9d289bbf;
    if (!event.var_d0942e9d2044d6c6) {
        if (event.result.size > 0) {
            event.result = [];
        }
        groups = getstructarray("bot_camp_group", "script_noteworthy");
        foreach (group in groups) {
            if (distancesquared(group.origin, self.origin) > event.var_8fa87d2c8780e014) {
                continue;
            }
            if (function_5a45d11a570a19c5(group)) {
                continue;
            }
            event.result[event.result.size] = group;
        }
        event.var_d0942e9d2044d6c6 = 1;
    }
    return event.result;
}

// Namespace namespace_3606b64785f08163/namespace_1bebff3a2e9afaca
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2a4
// Size: 0x6f
function function_5a45d11a570a19c5(var_200c8f755e8f626b) {
    var_4d163d658ac0c416 = level.var_3c59090ee220ab3d.events.var_39dae4a0e7ee4d47[var_200c8f755e8f626b.target];
    if (!isdefined(var_4d163d658ac0c416)) {
        return 0;
    }
    var_4a681d08b83b6920 = var_4d163d658ac0c416[self.team];
    if (!isdefined(var_4a681d08b83b6920)) {
        return 0;
    }
    return var_4a681d08b83b6920 != self.entity_number;
}

// Namespace namespace_3606b64785f08163/namespace_1bebff3a2e9afaca
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31b
// Size: 0xa1
function function_7dbe596500a2e27c(var_200c8f755e8f626b) {
    if (!isdefined(level.var_3c59090ee220ab3d.events.var_39dae4a0e7ee4d47[var_200c8f755e8f626b.target])) {
        level.var_3c59090ee220ab3d.events.var_39dae4a0e7ee4d47[var_200c8f755e8f626b.target] = [];
    }
    level.var_3c59090ee220ab3d.events.var_39dae4a0e7ee4d47[var_200c8f755e8f626b.target][self.team] = self.entity_number;
}

// Namespace namespace_3606b64785f08163/namespace_1bebff3a2e9afaca
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x3c3
// Size: 0xa3
function function_5f6e68b080316fcf(var_200c8f755e8f626b) {
    var_4d163d658ac0c416 = level.var_3c59090ee220ab3d.events.var_39dae4a0e7ee4d47[var_200c8f755e8f626b.target];
    if (!isdefined(var_4d163d658ac0c416)) {
        return;
    }
    var_4a681d08b83b6920 = var_4d163d658ac0c416[self.team];
    if (isdefined(var_4a681d08b83b6920) && var_4a681d08b83b6920 == self.entity_number) {
        level.var_3c59090ee220ab3d.events.var_39dae4a0e7ee4d47[var_200c8f755e8f626b.target][self.team] = undefined;
    }
}

