#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\vehicles\vehicle.gsc;
#using scripts\cp_mp\vehicles\vehicle_damage.gsc;

#namespace vehicle_mines;

// Namespace vehicle_mines / scripts\cp_mp\vehicles\vehicle_mines
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x14e
// Size: 0x73
function vehicle_mines_init() {
    assertex(isdefined(level.vehicle), "<dev string:x1c>");
    leveldata = spawnstruct();
    leveldata.minedata = [];
    level.vehicle.minetriggerdata = leveldata;
    if (issharedfuncdefined("vehicle_mines", "init")) {
        [[ getsharedfunc("vehicle_mines", "init") ]]();
    }
}

// Namespace vehicle_mines / scripts\cp_mp\vehicles\vehicle_mines
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x1c9
// Size: 0x37
function vehicle_mines_getleveldata() {
    assertex(isdefined(level.vehicle.minetriggerdata), "<dev string:x52>");
    return level.vehicle.minetriggerdata;
}

// Namespace vehicle_mines / scripts\cp_mp\vehicles\vehicle_mines
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x209
// Size: 0xd0
function vehicle_mines_getleveldataforvehicle(vehicleref, create) {
    var_e2818ad39a3341b4 = scripts\cp_mp\vehicles\vehicle_damage::vehicle_damage_getleveldataforvehicle(vehicleref, create);
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
        scripts\cp_mp\vehicles\vehicle::function_29b4292c92443328(vehicleref).damage = var_e2818ad39a3341b4;
    }
    return var_e2818ad39a3341b4;
}

// Namespace vehicle_mines / scripts\cp_mp\vehicles\vehicle_mines
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x2e2
// Size: 0x78
function vehicle_mines_getleveldataformine(equipref, create) {
    leveldata = vehicle_mines_getleveldata();
    var_574564c86203493f = leveldata.minedata[equipref];
    if (!isdefined(var_574564c86203493f) && istrue(create)) {
        var_574564c86203493f = spawnstruct();
        var_574564c86203493f.radius = 10;
        var_574564c86203493f.triggercallback = undefined;
        leveldata.minedata[equipref] = var_574564c86203493f;
    }
    return var_574564c86203493f;
}

// Namespace vehicle_mines / scripts\cp_mp\vehicles\vehicle_mines
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x363
// Size: 0x396
function vehicle_mines_shouldvehicletriggermine(vehicle, mine) {
    if (!vehicle scripts\cp_mp\vehicles\vehicle::isvehicle()) {
        return false;
    }
    var_e2818ad39a3341b4 = vehicle_mines_getleveldataforvehicle(vehicle.vehiclename);
    if (!isdefined(var_e2818ad39a3341b4)) {
        return false;
    }
    var_c3f020620e873c83 = isdefined(mine.equipmentref) ? mine.equipmentref : mine.killstreakref;
    if (!isdefined(var_c3f020620e873c83)) {
        return false;
    }
    var_574564c86203493f = vehicle_mines_getleveldataformine(var_c3f020620e873c83);
    if (!isdefined(var_574564c86203493f)) {
        return false;
    }
    if (istrue(mine.exploding)) {
        return false;
    }
    if (lengthsquared(vehicle vehicle_getvelocity()) < 100) {
        if (lengthsquared(vehicle vehicle_getangularvelocity()) < 400) {
            return false;
        }
    }
    if (vehicle scripts\cp_mp\vehicles\vehicle::isvehicledestroyed()) {
        return false;
    }
    if (istrue(vehicle.var_547a08a57461960d)) {
        return false;
    }
    frontoffsetvec = anglestoforward(vehicle.angles) * var_e2818ad39a3341b4.frontextents;
    backoffsetvec = anglestoforward(vehicle.angles) * -1 * var_e2818ad39a3341b4.frontextents;
    leftoffsetvec = anglestoright(vehicle.angles) * -1 * var_e2818ad39a3341b4.leftextents;
    rightoffsetvec = anglestoright(vehicle.angles) * var_e2818ad39a3341b4.rightextents;
    vehicleorigin = vehicle.origin + var_e2818ad39a3341b4.loscheckoffset;
    frontleft = vehicleorigin + frontoffsetvec + leftoffsetvec;
    frontright = vehicleorigin + frontoffsetvec + rightoffsetvec;
    backleft = vehicleorigin + backoffsetvec + leftoffsetvec;
    backright = vehicleorigin + backoffsetvec + rightoffsetvec;
    var_6bd8d3846ab52bf3 = (frontright - frontleft) * (1, 1, 0);
    var_29c1906132100543 = (frontleft - backleft) * (1, 1, 0);
    between = frontleft - mine.origin;
    betweendot = vectordot(vectornormalize(vehicle_mines_getnormal2d(var_6bd8d3846ab52bf3)), between);
    if (betweendot > var_574564c86203493f.radius) {
        return false;
    }
    betweendot = vectordot(vectornormalize(vehicle_mines_getnormal2d(var_29c1906132100543)), between);
    if (betweendot > var_574564c86203493f.radius) {
        return false;
    }
    var_15701247fdeed7f1 = (backleft - backright) * (1, 1, 0);
    var_430a35006e71a02c = (backright - frontright) * (1, 1, 0);
    between = backright - mine.origin;
    betweendot = vectordot(vectornormalize(vehicle_mines_getnormal2d(var_15701247fdeed7f1)), between);
    if (betweendot > var_574564c86203493f.radius) {
        return false;
    }
    betweendot = vectordot(vectornormalize(vehicle_mines_getnormal2d(var_430a35006e71a02c)), between);
    if (betweendot > var_574564c86203493f.radius) {
        return false;
    }
    between = vehicleorigin + anglestoup(vehicle.angles) * var_e2818ad39a3341b4.bottomextents - mine.origin;
    betweendot = vectordot(between, anglestoup(vehicle.angles));
    if (betweendot > var_e2818ad39a3341b4.distancetobottom) {
        return false;
    } else if (betweendot < 0) {
        return false;
    }
    return true;
}

// Namespace vehicle_mines / scripts\cp_mp\vehicles\vehicle_mines
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x702
// Size: 0xe8
function vehicle_mines_minetrigger(vehicle, mine) {
    var_c3f020620e873c83 = isdefined(mine.equipmentref) ? mine.equipmentref : mine.killstreakref;
    if (!isdefined(var_c3f020620e873c83)) {
        return;
    }
    var_574564c86203493f = vehicle_mines_getleveldataformine(var_c3f020620e873c83);
    if (!isdefined(var_574564c86203493f)) {
        return;
    }
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

// Namespace vehicle_mines / scripts\cp_mp\vehicles\vehicle_mines
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x7f2
// Size: 0x11d
function vehicle_mines_isfriendlytomine(mine) {
    var_c665c37b6477e11c = 0;
    if (level.teambased) {
        mineteam = mine.team;
        if (!isdefined(mineteam)) {
            if (isdefined(mine.owner)) {
                mineteam = mine.owner.team;
            }
        }
        if (isdefined(mineteam)) {
            var_c665c37b6477e11c = scripts\cp_mp\vehicles\vehicle::vehicle_isfriendlytoteam(self, mineteam);
        }
    } else if (isdefined(mine.owner)) {
        var_c665c37b6477e11c = scripts\cp_mp\vehicles\vehicle::vehicle_isfriendlytoplayer(self, mine.owner);
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

// Namespace vehicle_mines / scripts\cp_mp\vehicles\vehicle_mines
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x918
// Size: 0x17
function vehicle_mines_getnormal2d(vector) {
    return (vector[1], vector[0] * -1, 0);
}

// Namespace vehicle_mines / scripts\cp_mp\vehicles\vehicle_mines
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0x938
// Size: 0x35
function vehicle_mines_getloscheckcontents() {
    return physics_createcontents(["physicscontents_water", "physicscontents_glass", "physicscontents_item", "physicscontents_vehicle", "physicscontents_ainosight"]);
}

