// mwiii decomp prototype
#using scripts\engine\utility.gsc;

#namespace callback;

// Namespace callback/namespace_7f0bcee5d45a1dea
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d2
// Size: 0xb2
function callback(event, params) {
    if (!isdefined(params)) {
        params = spawnstruct();
    }
    /#
        assertex(isstruct(params), "Callbacks should always use a struct to pass parameters.");
    #/
    function_f3847410a67a3098(level, event, params);
    if (self != level) {
        function_f3847410a67a3098(self, event, params);
        if (isdefined(self.var_8d44c0f367e8d9c0)) {
            foreach (var_58ea2dd09081c395 in self.var_8d44c0f367e8d9c0) {
                function_f3847410a67a3098(var_58ea2dd09081c395, event, params);
            }
        }
    }
}

// Namespace callback/namespace_7f0bcee5d45a1dea
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x28b
// Size: 0x74
function function_1ad95d714a56c8fa(event, params) {
    ais = getaiarray();
    foreach (ai in ais) {
        ai function_f3847410a67a3098(ai, event, params);
    }
}

// Namespace callback/namespace_7f0bcee5d45a1dea
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x306
// Size: 0x83
function function_ca1462b402444dd6(event, params) {
    players = level.players;
    foreach (player in players) {
        player function_f3847410a67a3098(level, event, params);
        player function_f3847410a67a3098(player, event, params);
    }
}

// Namespace callback/namespace_7f0bcee5d45a1dea
// Params 3, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x390
// Size: 0x154
function private function_f3847410a67a3098(ent, event, params) {
    callbacks = undefined;
    if (isdefined(ent.callbacks)) {
        callbacks = ent.callbacks[event];
    }
    if (isdefined(callbacks)) {
        for (i = 0; i < callbacks.size; i++) {
            var_ac99309fba88094e = callbacks[i];
            if (!isarray(var_ac99309fba88094e)) {
                continue;
            }
            callback = var_ac99309fba88094e[0];
            /#
                assert(isfunction(callback));
            #/
            if (!isfunction(callback)) {
                return;
            }
            var_732ad454c46f92fd = var_ac99309fba88094e[1];
            if (isdefined(var_732ad454c46f92fd)) {
                self thread [[ callback ]](params, var_732ad454c46f92fd);
            } else {
                self thread [[ callback ]](params);
            }
        }
        if (isdefined(ent.callbacks)) {
            if (isdefined(ent.var_fab0247ea0a3a375) && isdefined(ent.var_fab0247ea0a3a375[event])) {
                ent.callbacks[event] = function_816601f7d8ca5b92(ent.callbacks[event]);
                ent.var_fab0247ea0a3a375[event] = undefined;
            }
            /#
                /#
                    assertex(function_c2791ffb5f62cc92(ent.callbacks[event]) == 0, "<unknown string>");
                #/
            #/
        }
    }
}

// Namespace callback/namespace_7f0bcee5d45a1dea
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4eb
// Size: 0x145
function add(event, func, var_732ad454c46f92fd) {
    /#
        assertex(isfunction(func), "Parameter for event '" + (function_d03495fe6418377b(event) ? function_3c8848a3a11b2553(event) : event) + "' is not a function pointer.");
    #/
    if (!isfunction(func)) {
        return;
    }
    /#
        assertex(isdefined(event), "Trying to set a callback on an undefined event.");
    #/
    if (!isdefined(self.callbacks) || !isdefined(self.callbacks[event])) {
        self.callbacks[event] = [];
    }
    /#
        foreach (callback in self.callbacks[event]) {
            if (isarray(callback) && callback[0] == func) {
                if (!isdefined(callback[1]) && !isdefined(var_732ad454c46f92fd) || is_equal(callback[1], var_732ad454c46f92fd)) {
                    /#
                        assertmsg("<unknown string>" + event);
                    #/
                }
            }
        }
    #/
    self.callbacks[event][self.callbacks[event].size] = [0:func, 1:var_732ad454c46f92fd];
}

// Namespace callback/namespace_7f0bcee5d45a1dea
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x637
// Size: 0x17c
function remove(event, func, instant) {
    if (!isdefined(self.callbacks)) {
        return;
    }
    /#
        assertex(isdefined(event), "Trying to remove a callback on an undefined event.");
    #/
    if (isdefined(func) && function_d03495fe6418377b(func) && func == #"all") {
        self.callbacks[event] = [];
        if (isdefined(self.var_fab0247ea0a3a375)) {
            self.var_fab0247ea0a3a375[event] = undefined;
        }
        return;
    }
    if (!isdefined(self.callbacks[event])) {
        return;
    }
    foreach (index, func_group in self.callbacks[event]) {
        if (isarray(func_group) && func_group[0] == func) {
            self.callbacks[event][index] = 0;
            self.var_fab0247ea0a3a375[event] = 1;
            break;
        }
    }
    if (istrue(instant)) {
        if (isdefined(self.var_fab0247ea0a3a375) && isdefined(self.var_fab0247ea0a3a375[event])) {
            self.callbacks[event] = function_816601f7d8ca5b92(self.callbacks[event]);
            self.var_fab0247ea0a3a375[event] = undefined;
        }
        /#
            /#
                assertex(function_c2791ffb5f62cc92(self.callbacks[event]) == 0, "<unknown string>");
            #/
        #/
    }
}

// Namespace callback/namespace_7f0bcee5d45a1dea
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7ba
// Size: 0x4e
function function_e7fddda1f0b46b5e(var_fdf147e36d51ad1b) {
    if (!isdefined(level.var_cc6a7adcd61d2d2)) {
        level.var_cc6a7adcd61d2d2 = [];
    }
    if (!isdefined(level.var_cc6a7adcd61d2d2[var_fdf147e36d51ad1b])) {
        level.var_cc6a7adcd61d2d2[var_fdf147e36d51ad1b] = spawnstruct();
    }
    return level.var_cc6a7adcd61d2d2[var_fdf147e36d51ad1b];
}

// Namespace callback/namespace_7f0bcee5d45a1dea
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x810
// Size: 0x5d
function function_d4f1fdfa332469ec(var_fdf147e36d51ad1b) {
    /#
        /#
            assertex(self != level, "<unknown string>");
        #/
    #/
    var_78db940d2989f211 = function_e7fddda1f0b46b5e(var_fdf147e36d51ad1b);
    if (!isdefined(self.var_8d44c0f367e8d9c0) || !isdefined(self.var_8d44c0f367e8d9c0[var_fdf147e36d51ad1b])) {
        self.var_8d44c0f367e8d9c0[var_fdf147e36d51ad1b] = var_78db940d2989f211;
    }
}

// Namespace callback/namespace_7f0bcee5d45a1dea
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x874
// Size: 0x6c
function function_75a459cce09d9f29(var_fdf147e36d51ad1b) {
    return self != level && isdefined(var_fdf147e36d51ad1b) && isdefined(level.var_cc6a7adcd61d2d2) && isdefined(level.var_cc6a7adcd61d2d2[var_fdf147e36d51ad1b]) && isdefined(self.var_8d44c0f367e8d9c0) && isdefined(self.var_8d44c0f367e8d9c0[var_fdf147e36d51ad1b]) && self.var_8d44c0f367e8d9c0[var_fdf147e36d51ad1b] == level.var_cc6a7adcd61d2d2[var_fdf147e36d51ad1b];
}

// Namespace callback/namespace_7f0bcee5d45a1dea
// Params 1, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x8e8
// Size: 0x8a
function private function_816601f7d8ca5b92(callbacks) {
    result = [];
    foreach (var_ce174178f5680dfc in callbacks) {
        if (isint(var_ce174178f5680dfc) && var_ce174178f5680dfc == 0) {
            continue;
        }
        result[result.size] = var_ce174178f5680dfc;
    }
    /#
        assertex(result.size < callbacks.size, "_purge_removed didn't actually purge anything! We should have checked the 'hasRemovedCallbacksToPurge' array first to avoid doing unnecessary work");
    #/
    return result;
}

// Namespace callback/namespace_7f0bcee5d45a1dea
// Params 1, eflags: 0x4
// Checksum 0x0, Offset: 0x97a
// Size: 0x65
function private function_c2791ffb5f62cc92(callbacks) {
    foreach (var_ce174178f5680dfc in callbacks) {
        if (isint(var_ce174178f5680dfc) && var_ce174178f5680dfc == 0) {
            return 1;
        }
    }
    return 0;
}

