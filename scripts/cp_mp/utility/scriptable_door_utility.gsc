// mwiii decomp prototype
#using scripts\engine\utility.gsc;

#namespace namespace_b1fe9349d25d66b8;

// Namespace namespace_b1fe9349d25d66b8/namespace_9c1ec96c80ce894a
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb1
// Size: 0xcf
function scriptable_door_get_in_radius(position, radius, var_88e380f714003a9) {
    doors = getentitylessscriptablearray(undefined, undefined, position, radius, "door");
    var_e4850e5ef9d70a37 = [];
    foreach (door in doors) {
        if (!door scriptableisdoor()) {
            continue;
        }
        if (isdefined(var_88e380f714003a9)) {
            heightdiff = door.origin[2] - position[2];
            if (heightdiff <= var_88e380f714003a9) {
                var_e4850e5ef9d70a37[var_e4850e5ef9d70a37.size] = door;
            }
        } else {
            var_e4850e5ef9d70a37[var_e4850e5ef9d70a37.size] = door;
        }
    }
    return var_e4850e5ef9d70a37;
}

// Namespace namespace_b1fe9349d25d66b8/namespace_9c1ec96c80ce894a
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x188
// Size: 0xd8
function scriptable_door_freeze_open(var_da2d1a382c620732) {
    self notify("scriptable_door_freeze_open");
    self endon("scriptable_door_freeze_open");
    var_e470d9af31c8e97c = undefined;
    targetangles = undefined;
    if (istrue(var_da2d1a382c620732)) {
        var_e470d9af31c8e97c = "bash_left_90";
        targetangles = self function_bacd2d0acdf8559e() + (0, 90, 0);
    } else {
        var_e470d9af31c8e97c = "bash_right_90";
        targetangles = self function_bacd2d0acdf8559e() + (0, -90, 0);
    }
    while (anglesdelta(self.angles, targetangles) > 1) {
        currentstate = self getscriptablepartstate("door");
        if (currentstate != var_e470d9af31c8e97c) {
            self setscriptablepartstate("door", var_e470d9af31c8e97c, 0);
        }
        wait(0.05);
    }
    self setscriptablepartstate("door", "ajar", 0);
    self scriptabledoorfreeze(1);
}

// Namespace namespace_b1fe9349d25d66b8/namespace_9c1ec96c80ce894a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x267
// Size: 0x79
function scriptable_door_is_double_door_pair(otherdoor) {
    if (self == otherdoor) {
        return 0;
    }
    var_149444556d8aa5f3 = self function_d90515f5e17dbc6f();
    var_149445556d8aa826 = otherdoor function_d90515f5e17dbc6f();
    distsqrd = distancesquared(var_149444556d8aa5f3, var_149445556d8aa826);
    if (distsqrd > (26 + 5) * (26 + 5) || distsqrd < (26 - 5) * (26 - 5)) {
        return 0;
    }
    return 1;
}

// Namespace namespace_b1fe9349d25d66b8/namespace_9c1ec96c80ce894a
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e8
// Size: 0xde
function function_8a84bf34f556872d(otherdoor) {
    if (self == otherdoor) {
        return 0;
    }
    var_149444556d8aa5f3 = self function_d90515f5e17dbc6f();
    var_149445556d8aa826 = otherdoor function_d90515f5e17dbc6f();
    var_14a59dec86fbcc4e = distancesquared(var_149444556d8aa5f3, var_149445556d8aa826);
    diff = var_14a59dec86fbcc4e - 52;
    if (var_14a59dec86fbcc4e > (52 + 5) * (52 + 5) || var_14a59dec86fbcc4e < (52 - 5) * (52 - 5)) {
        return 0;
    }
    var_53c5ed210180380b = self.origin;
    var_53c5ee2101803a3e = otherdoor.origin;
    var_40852a54559976c6 = distancesquared(var_53c5ed210180380b, var_53c5ee2101803a3e);
    if (var_40852a54559976c6 > (104 + 5) * (104 + 5) || var_40852a54559976c6 < (104 - 5) * (104 - 5)) {
        return 0;
    }
    return 1;
}

