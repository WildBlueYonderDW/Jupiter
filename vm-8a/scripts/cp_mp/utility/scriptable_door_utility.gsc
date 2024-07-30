#using scripts\engine\utility.gsc;

#namespace namespace_b1fe9349d25d66b8;

// Namespace namespace_b1fe9349d25d66b8 / scripts\cp_mp\utility\scriptable_door_utility
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb1
// Size: 0xce
function scriptable_door_get_in_radius(position, radius, maxheightdiff) {
    doors = getentitylessscriptablearray(undefined, undefined, position, radius, "door");
    filtereddoors = [];
    foreach (door in doors) {
        if (!door scriptableisdoor()) {
            continue;
        }
        if (isdefined(maxheightdiff)) {
            heightdiff = door.origin[2] - position[2];
            if (heightdiff <= maxheightdiff) {
                filtereddoors[filtereddoors.size] = door;
            }
            continue;
        }
        filtereddoors[filtereddoors.size] = door;
    }
    return filtereddoors;
}

// Namespace namespace_b1fe9349d25d66b8 / scripts\cp_mp\utility\scriptable_door_utility
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x188
// Size: 0xd7
function scriptable_door_freeze_open(var_da2d1a382c620732) {
    self notify("scriptable_door_freeze_open");
    self endon("scriptable_door_freeze_open");
    bashstate = undefined;
    targetangles = undefined;
    if (istrue(var_da2d1a382c620732)) {
        bashstate = "bash_left_90";
        targetangles = self function_bacd2d0acdf8559e() + (0, 90, 0);
    } else {
        bashstate = "bash_right_90";
        targetangles = self function_bacd2d0acdf8559e() + (0, -90, 0);
    }
    while (anglesdelta(self.angles, targetangles) > 1) {
        currentstate = self getscriptablepartstate("door");
        if (currentstate != bashstate) {
            self setscriptablepartstate("door", bashstate, 0);
        }
        wait 0.05;
    }
    self setscriptablepartstate("door", "ajar", 0);
    self scriptabledoorfreeze(1);
}

// Namespace namespace_b1fe9349d25d66b8 / scripts\cp_mp\utility\scriptable_door_utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x267
// Size: 0x78
function scriptable_door_is_double_door_pair(otherdoor) {
    if (self == otherdoor) {
        return false;
    }
    centera = self function_d90515f5e17dbc6f();
    centerb = otherdoor function_d90515f5e17dbc6f();
    distsqrd = distancesquared(centera, centerb);
    if (distsqrd > (26 + 5) * (26 + 5) || distsqrd < (26 - 5) * (26 - 5)) {
        return false;
    }
    return true;
}

// Namespace namespace_b1fe9349d25d66b8 / scripts\cp_mp\utility\scriptable_door_utility
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e8
// Size: 0xdd
function function_8a84bf34f556872d(otherdoor) {
    if (self == otherdoor) {
        return false;
    }
    centera = self function_d90515f5e17dbc6f();
    centerb = otherdoor function_d90515f5e17dbc6f();
    centerdistsqrd = distancesquared(centera, centerb);
    diff = centerdistsqrd - 52;
    if (centerdistsqrd > (52 + 5) * (52 + 5) || centerdistsqrd < (52 - 5) * (52 - 5)) {
        return false;
    }
    hingea = self.origin;
    hingeb = otherdoor.origin;
    hingedistsqrd = distancesquared(hingea, hingeb);
    if (hingedistsqrd > (104 + 5) * (104 + 5) || hingedistsqrd < (104 - 5) * (104 - 5)) {
        return false;
    }
    return true;
}

