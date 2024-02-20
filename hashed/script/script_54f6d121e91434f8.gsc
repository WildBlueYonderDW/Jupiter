// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace namespace_2ad63d7d28d317d7;

// Namespace namespace_2ad63d7d28d317d7/namespace_8d0d5743d0799922
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x101
// Size: 0x18
function function_a1f71337a6844055() {
    self.conditions = [];
    self.var_cb7d9fafcbb7a3da = 1;
}

// Namespace namespace_2ad63d7d28d317d7/namespace_8d0d5743d0799922
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x120
// Size: 0xd
function function_cb7d9fafcbb7a3da() {
    return istrue(self.var_cb7d9fafcbb7a3da);
}

// Namespace namespace_2ad63d7d28d317d7/namespace_8d0d5743d0799922
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x135
// Size: 0xb5
function function_45945c0e6cfb54cd(var_21a51c1826b9a6aa, var_92e7ff758311df4f, var_a5bcfea80579d73d, var_d389f1191e609479, description) {
    if (!isdefined(var_d389f1191e609479)) {
        var_d389f1191e609479 = undefined;
    }
    if (!isdefined(description)) {
        description = "No Description Given.";
    }
    /#
        assertex(var_21a51c1826b9a6aa function_cb7d9fafcbb7a3da(), "You can only call this function on Conditional Containers. Did you forget to call SetupAsConditionalContainer() ? ");
    #/
    var_adfbf55b59c513a = spawnstruct();
    var_adfbf55b59c513a.function = var_92e7ff758311df4f;
    var_adfbf55b59c513a.params = var_a5bcfea80579d73d;
    var_adfbf55b59c513a.var_d389f1191e609479 = var_d389f1191e609479;
    var_adfbf55b59c513a.description = description;
    var_21a51c1826b9a6aa.conditions[var_21a51c1826b9a6aa.conditions.size] = var_adfbf55b59c513a;
}

// Namespace namespace_2ad63d7d28d317d7/namespace_8d0d5743d0799922
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1f1
// Size: 0xa5
function function_945454f4d582ddd2(var_21a51c1826b9a6aa, var_d389f1191e609479) {
    /#
        assertex(var_21a51c1826b9a6aa function_cb7d9fafcbb7a3da(), "You can only call this function on Conditional Containers. Did you forget to call SetupAsConditionalContainer() ? ");
    #/
    for (index = 0; index < var_21a51c1826b9a6aa.conditions.size; index++) {
        var_adfbf55b59c513a = var_21a51c1826b9a6aa.conditions[index];
        if (isdefined(var_adfbf55b59c513a.var_d389f1191e609479) && var_adfbf55b59c513a.var_d389f1191e609479 == var_d389f1191e609479) {
            var_21a51c1826b9a6aa.conditions = array_remove_index(var_21a51c1826b9a6aa.conditions, index);
            break;
        }
    }
}

// Namespace namespace_2ad63d7d28d317d7/namespace_8d0d5743d0799922
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x29d
// Size: 0x2e
function function_ff70694fdb2c244a(var_21a51c1826b9a6aa) {
    /#
        assertex(var_21a51c1826b9a6aa function_cb7d9fafcbb7a3da(), "You can only call this function on Conditional Containers. Did you forget to call SetupAsConditionalContainer() ? ");
    #/
    var_21a51c1826b9a6aa.conditions = [];
}

// Namespace namespace_2ad63d7d28d317d7/namespace_8d0d5743d0799922
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2d2
// Size: 0xa4
function function_93587d5ba6247f36(var_21a51c1826b9a6aa, object) {
    /#
        assertex(var_21a51c1826b9a6aa function_cb7d9fafcbb7a3da(), "You can only call this function on Conditional Containers. Did you forget to call SetupAsConditionalContainer() ? ");
    #/
    foreach (condition in var_21a51c1826b9a6aa.conditions) {
        result = [[ condition.function ]](object, condition.params);
        if (!result) {
            return 0;
        }
    }
    return 1;
}

// Namespace namespace_2ad63d7d28d317d7/namespace_8d0d5743d0799922
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x37e
// Size: 0xbb
function function_ff013f3a89dabca4(var_21a51c1826b9a6aa, object) {
    /#
        assertex(var_21a51c1826b9a6aa function_cb7d9fafcbb7a3da(), "You can only call this function on Conditional Containers. Did you forget to call SetupAsConditionalContainer() ? ");
    #/
    foreach (condition in var_21a51c1826b9a6aa.conditions) {
        result = [[ condition.function ]](object, condition.params);
        if (!result) {
            return function_8a34819737ceea8f(0, condition.description);
        }
    }
    return function_8a34819737ceea8f(1);
}

// Namespace namespace_2ad63d7d28d317d7/namespace_8d0d5743d0799922
// Params 6, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x441
// Size: 0x100
function function_21987527fd4733ad(var_21a51c1826b9a6aa, object, var_ef09bb69811327d1, var_5288a299caa0504e, var_717b087350a6df2f, var_3b7ed38c07818629) {
    /#
        var_cb7d9fafcbb7a3da = var_21a51c1826b9a6aa function_cb7d9fafcbb7a3da();
        var_9b2d0131b0dd691b = isdefined(object);
        var_3938d5f50103e0fa = isfunction(var_ef09bb69811327d1);
        var_8105433f3dcf58a = !isdefined(var_5288a299caa0504e) || isstruct(var_5288a299caa0504e);
        var_a28904f7e273e263 = 1;
        if (!var_cb7d9fafcbb7a3da) {
            iprintln("<unknown string>");
            var_a28904f7e273e263 = 0;
        }
        if (!var_9b2d0131b0dd691b) {
            iprintln("<unknown string>");
            var_a28904f7e273e263 = 0;
        }
        if (!var_3938d5f50103e0fa) {
            iprintln("<unknown string>");
            var_a28904f7e273e263 = 0;
        }
        if (!var_8105433f3dcf58a) {
            iprintln("<unknown string>");
            var_a28904f7e273e263 = 0;
        }
        if (!var_a28904f7e273e263) {
            /#
                assertmsg("<unknown string>");
            #/
            return;
        }
    #/
    level thread function_1b7df7adf29a85c6(var_21a51c1826b9a6aa, object, var_ef09bb69811327d1, var_5288a299caa0504e, var_717b087350a6df2f, var_3b7ed38c07818629);
}

// Namespace namespace_2ad63d7d28d317d7/namespace_8d0d5743d0799922
// Params 6, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x548
// Size: 0xc3
function private function_1b7df7adf29a85c6(var_21a51c1826b9a6aa, object, var_ef09bb69811327d1, var_5288a299caa0504e, var_717b087350a6df2f, var_3b7ed38c07818629) {
    var_3b7ed38c07818629 = function_53c4c53197386572(var_3b7ed38c07818629, 0.5);
    var_717b087350a6df2f = function_53c4c53197386572(var_717b087350a6df2f, 5);
    var_be685114ee68c2f3 = gettime();
    var_3e0486861622f2e1 = 1;
    while (var_3e0486861622f2e1) {
        var_b7d39a4661f3460 = gettime();
        var_509c83acc10839e4 = (var_b7d39a4661f3460 - var_be685114ee68c2f3) / 1000;
        if (isdefined(object) && function_93587d5ba6247f36(var_21a51c1826b9a6aa, object)) {
            object thread [[ var_ef09bb69811327d1 ]](var_5288a299caa0504e);
            var_3e0486861622f2e1 = 0;
            return;
        }
        if (var_509c83acc10839e4 >= var_717b087350a6df2f) {
            var_3e0486861622f2e1 = 0;
            break;
        }
        wait(var_3b7ed38c07818629);
    }
}

// Namespace namespace_2ad63d7d28d317d7/namespace_8d0d5743d0799922
// Params 2, eflags: 0x6 linked
// Checksum 0x0, Offset: 0x612
// Size: 0x4c
function private function_8a34819737ceea8f(var_f422d25d885419b5, description) {
    if (!isdefined(description)) {
        description = "No Description Given.";
    }
    var_2e1dd56cac3d3e71 = spawnstruct();
    var_2e1dd56cac3d3e71.var_3cae69b2d0f4ae72 = var_f422d25d885419b5;
    var_2e1dd56cac3d3e71.var_4b6d8587438ed9aa = description;
    return var_2e1dd56cac3d3e71;
}

