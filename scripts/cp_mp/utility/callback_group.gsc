// mwiii decomp prototype
#using scripts\engine\utility.gsc;

#namespace namespace_e23d6eb3062a75be;

// Namespace namespace_e23d6eb3062a75be/namespace_28d99e416d285f00
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc8
// Size: 0x21
function callback_create() {
    group = spawnstruct();
    group.subscriptions = [];
    return group;
}

// Namespace namespace_e23d6eb3062a75be/namespace_28d99e416d285f00
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xf1
// Size: 0x129
function callback_subscribe(callback, target) {
    /#
        assertex(isdefined(callback), "Called without a callback.");
    #/
    /#
        assertex(isdefined(target), "Called without a target.");
    #/
    /#
        foreach (var_be66e5030b255ff1 in self.subscriptions) {
            if (var_be66e5030b255ff1.callback == callback) {
                if (isdefined(var_be66e5030b255ff1.target) && var_be66e5030b255ff1.target == target) {
                    if (var_be66e5030b255ff1.target == target) {
                        /#
                            assertex("<unknown string>" + target + "<unknown string>");
                        #/
                    }
                }
            }
        }
    #/
    var_be66e5030b255ff1 = spawnstruct();
    var_be66e5030b255ff1.target = target;
    var_be66e5030b255ff1.callback = callback;
    self.subscriptions = array_removeundefined(self.subscriptions);
    self.subscriptions[self.subscriptions.size] = var_be66e5030b255ff1;
}

// Namespace namespace_e23d6eb3062a75be/namespace_28d99e416d285f00
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x221
// Size: 0xcf
function callback_unsubscribe(callback, target) {
    /#
        assertex(isdefined(callback), "Called without a callback.");
    #/
    /#
        assertex(isdefined(target), "Called without a target.");
    #/
    var_9b1824b62fc47baf = 0;
    foreach (index, var_be66e5030b255ff1 in self.subscriptions) {
        if (var_be66e5030b255ff1.callback == callback) {
            if (var_be66e5030b255ff1.target == target) {
                self.subscriptions[index] = undefined;
                return;
            }
        }
    }
    /#
        assertmsg("Target "" + target + "" has not been subscribed.");
    #/
}

// Namespace namespace_e23d6eb3062a75be/namespace_28d99e416d285f00
// Params 4, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2f7
// Size: 0x286
function callback_trigger(param1, param2, param3, param4) {
    foreach (index, var_be66e5030b255ff1 in self.subscriptions) {
        if (!isdefined(var_be66e5030b255ff1.target)) {
            self.subscriptions[index] = undefined;
        }
    }
    subscriptions = self.subscriptions;
    if (isdefined(param4)) {
        foreach (var_be66e5030b255ff1 in subscriptions) {
            var_be66e5030b255ff1.target [[ var_be66e5030b255ff1.callback ]](param1, param2, param3, param4);
        }
    } else if (isdefined(param3)) {
        foreach (var_be66e5030b255ff1 in subscriptions) {
            var_be66e5030b255ff1.target [[ var_be66e5030b255ff1.callback ]](param1, param2, param3);
        }
    } else if (isdefined(param2)) {
        foreach (var_be66e5030b255ff1 in subscriptions) {
            var_be66e5030b255ff1.target [[ var_be66e5030b255ff1.callback ]](param1, param2);
        }
    } else if (isdefined(param1)) {
        foreach (var_be66e5030b255ff1 in subscriptions) {
            var_be66e5030b255ff1.target [[ var_be66e5030b255ff1.callback ]](param1);
        }
    } else {
        foreach (var_be66e5030b255ff1 in subscriptions) {
            var_be66e5030b255ff1.target [[ var_be66e5030b255ff1.callback ]]();
        }
    }
}

// Namespace namespace_e23d6eb3062a75be/namespace_28d99e416d285f00
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x584
// Size: 0x22
function function_379894fc81663ac3() {
    /#
        function_9c4673bb50e9f9af();
        function_63620b8d0b5c4b58();
        function_c1ab3afb487441e9();
        function_9523fb0936127d3b();
    #/
}

// Namespace namespace_e23d6eb3062a75be/namespace_28d99e416d285f00
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x5ad
// Size: 0xad
function function_9c4673bb50e9f9af() {
    /#
        var_6db09a05328fc74c = spawnstruct();
        var_6db09a05328fc74c.num = 0;
        var_a5329a03b3d5f047 = callback_create();
        var_a5329a03b3d5f047 callback_subscribe(&function_d343abc5b21ce372, var_6db09a05328fc74c);
        var_a5329a03b3d5f047 callback_trigger(1);
        /#
            assertex(var_6db09a05328fc74c.num == 1, "<unknown string>");
        #/
        var_a5329b03b3d5f27a = callback_create();
        var_a5329b03b3d5f27a callback_subscribe(&function_d343abc5b21ce372, var_6db09a05328fc74c);
        var_a5329b03b3d5f27a callback_trigger(1);
        /#
            assertex(var_6db09a05328fc74c.num == 2, "<unknown string>");
        #/
    #/
}

// Namespace namespace_e23d6eb3062a75be/namespace_28d99e416d285f00
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x661
// Size: 0x68
function function_63620b8d0b5c4b58() {
    /#
        var_6db09a05328fc74c = spawnstruct();
        var_6db09a05328fc74c.num = 0;
        var_ce174178f5680dfc = callback_create();
        var_ce174178f5680dfc callback_subscribe(&function_d343abc5b21ce372, var_6db09a05328fc74c);
        var_ce174178f5680dfc callback_trigger(2);
        /#
            assertex(var_6db09a05328fc74c.num == 2, "<unknown string>");
        #/
    #/
}

// Namespace namespace_e23d6eb3062a75be/namespace_28d99e416d285f00
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x6d0
// Size: 0x172
function function_c1ab3afb487441e9() {
    /#
        var_6db09a05328fc74c = spawnstruct();
        var_6db09a05328fc74c.num = 0;
        var_a5329a03b3d5f047 = callback_create();
        var_a5329a03b3d5f047 callback_subscribe(&function_d343abc5b21ce372, var_6db09a05328fc74c);
        var_a5329a03b3d5f047 callback_unsubscribe(&function_d343abc5b21ce372, var_6db09a05328fc74c);
        var_a5329a03b3d5f047 callback_trigger(1);
        /#
            assertex(var_6db09a05328fc74c.num == 0, "<unknown string>");
        #/
        var_cb2a366e3233b7e7 = spawnstruct();
        var_cb2a366e3233b7e7.num = 0;
        var_cb2a376e3233ba1a = spawnstruct();
        var_cb2a376e3233ba1a.num = 0;
        var_cb2a386e3233bc4d = spawnstruct();
        var_cb2a386e3233bc4d.num = 0;
        var_a5329b03b3d5f27a = callback_create();
        var_a5329b03b3d5f27a callback_subscribe(&function_d343abc5b21ce372, var_cb2a366e3233b7e7);
        var_a5329b03b3d5f27a callback_subscribe(&function_d343abc5b21ce372, var_cb2a376e3233ba1a);
        var_a5329b03b3d5f27a callback_unsubscribe(&function_d343abc5b21ce372, var_cb2a366e3233b7e7);
        var_a5329b03b3d5f27a callback_subscribe(&function_d343abc5b21ce372, var_cb2a386e3233bc4d);
        var_a5329b03b3d5f27a callback_trigger(1);
        /#
            assertex(var_cb2a366e3233b7e7.num == 0, "<unknown string>");
        #/
        /#
            assertex(var_cb2a376e3233ba1a.num == 1, "<unknown string>");
        #/
        /#
            assertex(var_cb2a386e3233bc4d.num == 1, "<unknown string>");
        #/
    #/
}

// Namespace namespace_e23d6eb3062a75be/namespace_28d99e416d285f00
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x849
// Size: 0x85
function function_9523fb0936127d3b() {
    /#
        var_d3ab7505af9933de = spawn("<unknown string>", (0, 0, 0));
        level.var_1c31a95f0eba8516 = 0;
        var_ce174178f5680dfc = callback_create();
        var_ce174178f5680dfc callback_subscribe(&function_94a324eb8b53ec6d, var_d3ab7505af9933de);
        var_d3ab7505af9933de delete();
        var_ce174178f5680dfc callback_trigger(1);
        /#
            assertex(level.var_1c31a95f0eba8516 == 0, "<unknown string>");
        #/
        level.var_1c31a95f0eba8516 = undefined;
    #/
}

// Namespace namespace_e23d6eb3062a75be/namespace_28d99e416d285f00
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8d5
// Size: 0x23
function function_d343abc5b21ce372(increment) {
    /#
        self.num = self.num + increment;
    #/
}

// Namespace namespace_e23d6eb3062a75be/namespace_28d99e416d285f00
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x8ff
// Size: 0x23
function function_94a324eb8b53ec6d(increment) {
    /#
        level.var_1c31a95f0eba8516 = level.var_1c31a95f0eba8516 + increment;
    #/
}

