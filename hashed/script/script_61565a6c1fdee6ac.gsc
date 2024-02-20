// mwiii decomp prototype
#using scripts\mp\gametypes\br_pickups.gsc;

#namespace namespace_27e634277336b001;

// Namespace namespace_27e634277336b001/namespace_86a7acb508545234
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xc3
// Size: 0xc
function function_e1b062a375b4a629() {
    return self.plundercount;
}

// Namespace namespace_27e634277336b001/namespace_86a7acb508545234
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xd7
// Size: 0x12
function function_91b0046262bd8519() {
    return getdvarint(@"hash_611d72c9417ee39e", 0);
}

// Namespace namespace_27e634277336b001/namespace_86a7acb508545234
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0xf1
// Size: 0x80
function function_e22745f1660c79de(var_e318e240dd21247, position, var_ab57e86ca58b81f2) {
    var_cb4fad49263e20c4 = namespace_cb965d2f71fefddc::getitemdropinfo(position);
    if (!isdefined(var_ab57e86ca58b81f2) && isdefined(level.br_pickups.counts[var_e318e240dd21247])) {
        var_ab57e86ca58b81f2 = level.br_pickups.counts[var_e318e240dd21247];
    }
    item = namespace_cb965d2f71fefddc::spawnpickup(var_e318e240dd21247, var_cb4fad49263e20c4, var_ab57e86ca58b81f2);
    if (!isdefined(item)) {
        return;
    }
    return item;
}

// Namespace namespace_27e634277336b001/namespace_86a7acb508545234
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x179
// Size: 0x56
function function_72c1ec67d589d251(callback, var_88ad0e9a7561ea8d) {
    self endon("death_or_disconnect");
    if (isdefined(var_88ad0e9a7561ea8d)) {
        level waittill("pickedupweapon_kill_callout_" + var_88ad0e9a7561ea8d.type + var_88ad0e9a7561ea8d.origin);
    } else {
        self waittill("self_pickedupitem_" + "plunder");
    }
    self [[ callback ]]();
}

// Namespace namespace_27e634277336b001/namespace_86a7acb508545234
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1d6
// Size: 0x42
function function_ad5378568b077260(var_88ad0e9a7561ea8d) {
    if (!isdefined(var_88ad0e9a7561ea8d)) {
        return 0;
    }
    itemtype = var_88ad0e9a7561ea8d.type;
    var_88cf5d42344516ff = var_88ad0e9a7561ea8d getscriptablepartstate(itemtype);
    return var_88cf5d42344516ff != "hidden";
}

// Namespace namespace_27e634277336b001/namespace_86a7acb508545234
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x220
// Size: 0x3d
function function_a380cf8dd38a32ee(params) {
    /#
        assert(isdefined(params));
    #/
    /#
        assert(isdefined(params.amount));
    #/
    return function_8635d35b49720a75(params.amount);
}

// Namespace namespace_27e634277336b001/namespace_86a7acb508545234
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x265
// Size: 0x1a
function function_8635d35b49720a75(amount) {
    return self.plundercount * 10 >= amount;
}

