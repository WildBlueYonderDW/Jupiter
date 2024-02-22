// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;

#namespace vehicle_mines;

// Namespace vehicle_mines/namespace_739a1beacdad3457
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x18a
// Size: 0x73
function vehicle_mines_init() {
    /#
        assertex(isdefined(level.vehicle), "vehicle_mines_init() called before vehicle_init().");
    #/
    leveldata = spawnstruct();
    leveldata.minedata = [];
    level.vehicle.minetriggerdata = leveldata;
    if (issharedfuncdefined("vehicle_mines", "init")) {
        [[ getsharedfunc("vehicle_mines", "init") ]]();
    }
}

// Namespace vehicle_mines/namespace_739a1beacdad3457
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x204
// Size: 0x38
function vehicle_mines_getleveldata() {
    /#
        assertex(isdefined(level.vehicle.minetriggerdata), "vehicle_mines_getLevelData() called before vehicle_mines_init().");
    #/
    return level.vehicle.minetriggerdata;
}

// Namespace vehicle_mines/namespace_739a1beacdad3457
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x244
// Size: 0xd0
function vehicle_mines_getleveldataforvehicle(vehicleref, create) {
    var_e2818ad39a3341b4 = namespace_5a0f3ca265d3a4c8::vehicle_damage_getleveldataforvehicle(vehicleref, create);
    if ((!isdefined(var_e2818ad39a3341b4) || !isdefined(var_e2818ad39a3341b4.frontextents)) && istrue(create)) {
        if (!isdefined(var_e2818ad39a3341b4)) {
            var_e2818ad39a3341b4 = spawnstruct();
        }
        var_e2818ad39a3341b4.frontextents = 90;
        var_e2818ad39a3341b4.backextents = 115;
        var_e2818ad39a3341b4.leftextents = 38;
        var_e2818ad39a3341b4.rightextents = 38;
        var_e2818ad39a3341b4.bottomextents = 20;
        var_e2818ad39a3341b4.distancetobottom = 35;
        var_e2818ad39a3341b4.loscheckoffset = (0, 0, 37);
        namespace_1f188a13f7e79610::function_29b4292c92443328(vehicleref).damage = var_e2818ad39a3341b4;
    }
    return var_e2818ad39a3341b4;
}

// Namespace vehicle_mines/namespace_739a1beacdad3457
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x31c
// Size: 0x79
function vehicle_mines_getleveldataformine(var_1189bd7fbe2861f8, create) {
    leveldata = vehicle_mines_getleveldata();
    var_574564c86203493f = leveldata.minedata[var_1189bd7fbe2861f8];
    if (!isdefined(var_574564c86203493f) && istrue(create)) {
        var_574564c86203493f = spawnstruct();
        var_574564c86203493f.radius = 10;
        var_574564c86203493f.triggercallback = undefined;
        leveldata.minedata[var_1189bd7fbe2861f8] = var_574564c86203493f;
    }
    return var_574564c86203493f;
}

// Namespace vehicle_mines/namespace_739a1beacdad3457
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x39d
// Size: 0x375
function vehicle_mines_shouldvehicletriggermine(vehicle, mine) {
    if (!vehicle namespace_1f188a13f7e79610::isvehicle()) {
        return 0;
    }
    var_e2818ad39a3341b4 = vehicle_mines_getleveldataforvehicle(vehicle.vehiclename);
    if (!isdefined(var_e2818ad39a3341b4)) {
        return 0;
    }
    var_574564c86203493f = vehicle_mines_getleveldataformine(mine.equipmentref);
    if (!isdefined(var_574564c86203493f)) {
        return 0;
    }
    if (istrue(mine.exploding)) {
        return 0;
    }
    if (lengthsquared(vehicle vehicle_getvelocity()) < 100) {
        if (lengthsquared(vehicle vehicle_getangularvelocity()) < 400) {
            return 0;
        }
    }
    if (vehicle namespace_1f188a13f7e79610::isvehicledestroyed()) {
        return 0;
    }
    if (istrue(vehicle.var_547a08a57461960d)) {
        return 0;
    }
    var_582ea6264b9bea73 = anglestoforward(vehicle.angles) * var_e2818ad39a3341b4.frontextents;
    var_9a6186f76e294501 = anglestoforward(vehicle.angles) * -1 * var_e2818ad39a3341b4.frontextents;
    var_3cd550b17ae64a43 = anglestoright(vehicle.angles) * -1 * var_e2818ad39a3341b4.leftextents;
    var_eb1154e05304e3d4 = anglestoright(vehicle.angles) * var_e2818ad39a3341b4.rightextents;
    var_6f3a90a6b2b8799d = vehicle.origin + var_e2818ad39a3341b4.loscheckoffset;
    frontleft = var_6f3a90a6b2b8799d + var_582ea6264b9bea73 + var_3cd550b17ae64a43;
    frontright = var_6f3a90a6b2b8799d + var_582ea6264b9bea73 + var_eb1154e05304e3d4;
    backleft = var_6f3a90a6b2b8799d + var_9a6186f76e294501 + var_3cd550b17ae64a43;
    backright = var_6f3a90a6b2b8799d + var_9a6186f76e294501 + var_eb1154e05304e3d4;
    var_6bd8d3846ab52bf3 = (frontright - frontleft) * (1, 1, 0);
    var_29c1906132100543 = (frontleft - backleft) * (1, 1, 0);
    var_8423818ecf85a883 = frontleft - mine.origin;
    var_572b697257cde81e = vectordot(vectornormalize(vehicle_mines_getnormal2d(var_6bd8d3846ab52bf3)), var_8423818ecf85a883);
    if (var_572b697257cde81e > var_574564c86203493f.radius) {
        return 0;
    }
    var_572b697257cde81e = vectordot(vectornormalize(vehicle_mines_getnormal2d(var_29c1906132100543)), var_8423818ecf85a883);
    if (var_572b697257cde81e > var_574564c86203493f.radius) {
        return 0;
    }
    var_15701247fdeed7f1 = (backleft - backright) * (1, 1, 0);
    var_430a35006e71a02c = (backright - frontright) * (1, 1, 0);
    var_8423818ecf85a883 = backright - mine.origin;
    var_572b697257cde81e = vectordot(vectornormalize(vehicle_mines_getnormal2d(var_15701247fdeed7f1)), var_8423818ecf85a883);
    if (var_572b697257cde81e > var_574564c86203493f.radius) {
        return 0;
    }
    var_572b697257cde81e = vectordot(vectornormalize(vehicle_mines_getnormal2d(var_430a35006e71a02c)), var_8423818ecf85a883);
    if (var_572b697257cde81e > var_574564c86203493f.radius) {
        return 0;
    }
    var_8423818ecf85a883 = var_6f3a90a6b2b8799d + anglestoup(vehicle.angles) * var_e2818ad39a3341b4.bottomextents - mine.origin;
    var_572b697257cde81e = vectordot(var_8423818ecf85a883, anglestoup(vehicle.angles));
    if (var_572b697257cde81e > var_e2818ad39a3341b4.distancetobottom) {
        return 0;
    } else if (var_572b697257cde81e < 0) {
        return 0;
    }
    return 1;
}

// Namespace vehicle_mines/namespace_739a1beacdad3457
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x71a
// Size: 0xb5
function vehicle_mines_minetrigger(vehicle, mine) {
    var_574564c86203493f = vehicle_mines_getleveldataformine(mine.equipmentref);
    if (isdefined(var_574564c86203493f.triggercallback)) {
        thread [[ var_574564c86203493f.triggercallback ]](vehicle, mine);
    }
    var_e2818ad39a3341b4 = vehicle_mines_getleveldataforvehicle(vehicle.vehiclename);
    if (isdefined(var_e2818ad39a3341b4.triggercallback)) {
        thread [[ var_e2818ad39a3341b4.triggercallback ]](vehicle, mine);
    }
    if (issharedfuncdefined("vehicle_mines", "trigger")) {
        thread [[ getsharedfunc("vehicle_mines", "trigger") ]](vehicle, mine);
    }
}

// Namespace vehicle_mines/namespace_739a1beacdad3457
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7d6
// Size: 0x11e
function vehicle_mines_isfriendlytomine(mine) {
    var_c665c37b6477e11c = 0;
    if (level.teambased) {
        var_97b6e63a45f782ab = mine.team;
        if (!isdefined(var_97b6e63a45f782ab)) {
            if (isdefined(mine.owner)) {
                var_97b6e63a45f782ab = mine.owner.team;
            }
        }
        if (isdefined(var_97b6e63a45f782ab)) {
            var_c665c37b6477e11c = namespace_1f188a13f7e79610::vehicle_isfriendlytoteam(self, var_97b6e63a45f782ab);
        }
    } else if (isdefined(mine.owner)) {
        var_c665c37b6477e11c = namespace_1f188a13f7e79610::vehicle_isfriendlytoplayer(self, mine.owner);
    }
    if (!istrue(var_c665c37b6477e11c)) {
        if (isdefined(self.owner)) {
            if (level.teambased) {
                if (isdefined(mine.team) && self.owner.team == mine.team) {
                    var_c665c37b6477e11c = 1;
                }
            } else if (isdefined(mine.owner) && self.owner == mine.owner) {
                var_c665c37b6477e11c = 1;
            }
        }
    }
    return var_c665c37b6477e11c;
}

// Namespace vehicle_mines/namespace_739a1beacdad3457
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8fc
// Size: 0x18
function vehicle_mines_getnormal2d(vector) {
    return (vector[1], vector[0] * -1, 0);
}

// Namespace vehicle_mines/namespace_739a1beacdad3457
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x91c
// Size: 0x36
function vehicle_mines_getloscheckcontents() {
    return physics_createcontents([0:"physicscontents_water", 1:"physicscontents_glass", 2:"physicscontents_item", 3:"physicscontents_vehicle", 4:"physicscontents_ainosight"]);
}

