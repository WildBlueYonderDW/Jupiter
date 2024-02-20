// mwiii decomp prototype
#namespace namespace_80d06b984eaaa7a9;

// Namespace namespace_80d06b984eaaa7a9/namespace_8e96ae2f715116d8
// Params 9, eflags: 0x0
// Checksum 0x0, Offset: 0xb6
// Size: 0x103
function function_fbc045e84cf575ae(name, var_162af5b0d79b716b, var_d283d2eecbab27c0, var_47f82a4d9a77876f, var_c4356a88633f476d, var_65d0778d90ececae, var_86af96fe008c96ee, usefunc, var_bbb2e04b1f7dce40) {
    if (!isdefined(level.var_634b074c62f96cd3)) {
        level.var_634b074c62f96cd3 = [];
    }
    /#
        assert(!isdefined(level.var_634b074c62f96cd3[name]));
    #/
    var_7b92a81604ca9034 = spawnstruct();
    var_7b92a81604ca9034.var_162af5b0d79b716b = var_162af5b0d79b716b;
    var_7b92a81604ca9034.var_d283d2eecbab27c0 = var_d283d2eecbab27c0;
    var_7b92a81604ca9034.var_47f82a4d9a77876f = var_47f82a4d9a77876f;
    var_7b92a81604ca9034.var_c4356a88633f476d = var_c4356a88633f476d;
    var_7b92a81604ca9034.var_65d0778d90ececae = var_65d0778d90ececae;
    var_7b92a81604ca9034.var_86af96fe008c96ee = var_86af96fe008c96ee;
    var_7b92a81604ca9034.usefunc = usefunc;
    var_7b92a81604ca9034.var_bbb2e04b1f7dce40 = var_bbb2e04b1f7dce40;
    level.var_634b074c62f96cd3[name] = var_7b92a81604ca9034;
}

// Namespace namespace_80d06b984eaaa7a9/namespace_8e96ae2f715116d8
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1c0
// Size: 0x21
function function_7bf8496cb1c4eee8(ent) {
    return level.var_634b074c62f96cd3[ent.var_447891d63f8a9e28];
}

// Namespace namespace_80d06b984eaaa7a9/namespace_8e96ae2f715116d8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1e9
// Size: 0x4a
function function_cb0d4933a6762cf9(var_c0dd242ffcb18bd2) {
    self.var_447891d63f8a9e28 = var_c0dd242ffcb18bd2;
    var_910f3f6c8b8693e0 = function_7bf8496cb1c4eee8(self);
    /#
        assertex(isdefined(var_910f3f6c8b8693e0), "Pickup def needs to be defined for this pickupName before pickup can be added");
    #/
    function_45e8de724a35faf2(self, var_910f3f6c8b8693e0.var_162af5b0d79b716b);
}

// Namespace namespace_80d06b984eaaa7a9/namespace_8e96ae2f715116d8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x23a
// Size: 0xc7
function function_48eefcb82b853c11(taskid) {
    pickups = function_53d57c112257ea8a();
    var_38dc9ccee3b4b86f = sortbydistance(pickups, self.origin);
    foreach (pickup in var_38dc9ccee3b4b86f) {
        var_910f3f6c8b8693e0 = function_7bf8496cb1c4eee8(pickup);
        if ([[ var_910f3f6c8b8693e0.var_47f82a4d9a77876f ]](self, pickup)) {
            self.bt.pickupitem = pickup;
            return anim.success;
        }
    }
    return anim.failure;
}

// Namespace namespace_80d06b984eaaa7a9/namespace_8e96ae2f715116d8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x309
// Size: 0xc2
function function_a686ba7a3ef1cefa(taskid) {
    if (!isdefined(self.bt.pickupitem)) {
        return anim.failure;
    }
    var_910f3f6c8b8693e0 = function_7bf8496cb1c4eee8(self.bt.pickupitem);
    self setbtgoalpos(3, self.bt.pickupitem.origin);
    self setbtgoalradius(3, var_910f3f6c8b8693e0.var_d283d2eecbab27c0);
    var_c4356a88633f476d = var_910f3f6c8b8693e0.var_c4356a88633f476d;
    [[ var_c4356a88633f476d ]](self, self.bt.pickupitem);
    return anim.success;
}

// Namespace namespace_80d06b984eaaa7a9/namespace_8e96ae2f715116d8
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x3d3
// Size: 0x105
function function_edc6e91837522e22(taskid) {
    if (!isdefined(self.bt.pickupitem)) {
        return anim.failure;
    }
    var_910f3f6c8b8693e0 = function_7bf8496cb1c4eee8(self.bt.pickupitem);
    var_65d0778d90ececae = var_910f3f6c8b8693e0.var_65d0778d90ececae;
    if ([[ var_65d0778d90ececae ]](self, self.bt.pickupitem)) {
        return anim.failure;
    }
    var_86af96fe008c96ee = var_910f3f6c8b8693e0.var_86af96fe008c96ee;
    if ([[ var_86af96fe008c96ee ]](self, self.bt.pickupitem)) {
        usefunc = var_910f3f6c8b8693e0.usefunc;
        [[ usefunc ]](self, self.bt.pickupitem);
        self clearbtgoal(3);
        return anim.success;
    }
    return anim.running;
}

