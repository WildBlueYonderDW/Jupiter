// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;

#namespace namespace_cfae3bfa0fa8d1dd;

// Namespace namespace_cfae3bfa0fa8d1dd/namespace_f64231d5b7a2c3c4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x710
// Size: 0x15a
function _spawnvehicle(spawndata, var_ee8da5624236dc89) {
    /#
        function_3a040ff591c32b5c(spawndata);
    #/
    if (!istrue(spawndata.startsuspended)) {
        if (!canspawnvehicle()) {
            if (isdefined(var_ee8da5624236dc89)) {
                var_ee8da5624236dc89.fail = "total_limit_exceeded";
            }
            /#
                if (istrue(level.var_4e89ea3291f12198)) {
                    println("vehicle_tracking_init() called before vehicle_init()." + spawndata.modelname + "<unknown string>" + level.vehiclecount + "<unknown string>" + level.maxvehiclecount);
                }
            #/
            return undefined;
        }
    }
    vehicle = spawnvehicle(spawndata.modelname, spawndata.targetname, spawndata.vehicletype, spawndata.origin, spawndata.angles, spawndata.owner, spawndata.initialvelocity, spawndata.var_131ea86b569e731);
    if (!isdefined(vehicle)) {
        if (isdefined(var_ee8da5624236dc89)) {
            var_ee8da5624236dc89.fail = "code";
        }
        /#
            if (istrue(level.var_4e89ea3291f12198)) {
                println("<unknown string>" + spawndata.modelname);
            }
        #/
        return undefined;
    }
    vehicle.spawndata = spawndata;
    level.vehiclecount++;
    return vehicle;
}

// Namespace namespace_cfae3bfa0fa8d1dd/namespace_f64231d5b7a2c3c4
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x872
// Size: 0x11f
function _spawnhelicopter(owner, origin, angles, type, modelname) {
    var_ee8da5624236dc89 = spawnstruct();
    spawndata = spawnstruct();
    spawndata.modelname = modelname;
    spawndata.vehicletype = type;
    spawndata.origin = origin;
    spawndata.angles = angles;
    spawndata.owner = owner;
    if (!canspawnvehicle()) {
        if (isdefined(var_ee8da5624236dc89)) {
            var_ee8da5624236dc89.fail = "total_limit_exceeded";
        }
        return undefined;
    }
    vehicle = spawnhelicopter(spawndata.owner, spawndata.origin, spawndata.angles, spawndata.vehicletype, spawndata.modelname);
    if (!isdefined(vehicle)) {
        if (isdefined(var_ee8da5624236dc89)) {
            var_ee8da5624236dc89.fail = "code";
        }
        return undefined;
    }
    level.vehiclecount++;
    return vehicle;
}

// Namespace namespace_cfae3bfa0fa8d1dd/namespace_f64231d5b7a2c3c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x999
// Size: 0xa3
function _deletevehicle(vehicle) {
    if (!isdefined(vehicle)) {
        return;
    }
    vehicle notify("vehicle_deleted");
    level.vehiclecount--;
    if (isdefined(level.vehicle.instances) && isdefined(level.vehicle.instances[vehicle.vehiclename]) && isdefined(level.vehicle.instances[vehicle.vehiclename][vehicle getentitynumber()])) {
        vehicle_tracking_deregisterinstance(vehicle);
    }
    function_d21abb198361e610(vehicle);
    vehicle delete();
    return 1;
}

// Namespace namespace_cfae3bfa0fa8d1dd/namespace_f64231d5b7a2c3c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xa44
// Size: 0x111
function function_d21abb198361e610(vehicle) {
    if (!isdefined(vehicle.var_e478ac91af0e92cb)) {
        return;
    }
    foreach (scriptable in vehicle.var_e478ac91af0e92cb) {
        if (!isdefined(scriptable)) {
            continue;
        }
        if (isdefined(scriptable.type) && namespace_3c37cb17ade254d::issharedfuncdefined(scriptable.type, "delete") && scriptable [[ namespace_3c37cb17ade254d::getsharedfunc(scriptable.type, "delete") ]]()) {
            continue;
        }
        scriptable notify("death");
        scriptable script_func("deregisterScriptable");
        if (scriptable getscriptableisreserved()) {
            scriptable freescriptable();
        } else {
            part = scriptable function_ec5f4851431f3382();
            if (scriptable getscriptableparthasstate(part, "hidden")) {
                scriptable setscriptablepartstate(part, "hidden");
            }
        }
    }
}

// Namespace namespace_cfae3bfa0fa8d1dd/namespace_f64231d5b7a2c3c4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb5c
// Size: 0x16
function canspawnvehicle() {
    return level.vehiclecount < level.maxvehiclecount;
}

// Namespace namespace_cfae3bfa0fa8d1dd/namespace_f64231d5b7a2c3c4
// Params 0, eflags: 0x0
// Checksum 0x0, Offset: 0xb7a
// Size: 0xc
function getvehiclecount() {
    return level.vehiclecount;
}

// Namespace namespace_cfae3bfa0fa8d1dd/namespace_f64231d5b7a2c3c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xb8e
// Size: 0x63
function reservevehicle(count) {
    if (canspawnvehicle()) {
        if (!isdefined(count)) {
            level.vehiclecount++;
            return 1;
        }
        var_2505ba0eb2a7b5d5 = level.maxvehiclecount - level.vehiclecount;
        if (count <= var_2505ba0eb2a7b5d5) {
            level.vehiclecount = level.vehiclecount + count;
            return 1;
        }
    }
    return 0;
}

// Namespace namespace_cfae3bfa0fa8d1dd/namespace_f64231d5b7a2c3c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xbf9
// Size: 0x63
function clearvehiclereservation(count) {
    if (!isdefined(count)) {
        count = 1;
    }
    level.vehiclecount = level.vehiclecount - count;
    /#
        if (level.vehiclecount < 0) {
            namespace_3c37cb17ade254d::error("<unknown string>");
        }
    #/
    level.vehiclecount = int(max(0, level.vehiclecount));
}

// Namespace namespace_cfae3bfa0fa8d1dd/namespace_f64231d5b7a2c3c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc63
// Size: 0x17
function getvehiclespawndata(vehicle) {
    return vehicle.spawndata;
}

// Namespace namespace_cfae3bfa0fa8d1dd/namespace_f64231d5b7a2c3c4
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xc82
// Size: 0x16d
function copyvehiclespawndata(from, to) {
    to.modelname = from.modelname;
    to.var_14cde247ac3313a4 = from.var_14cde247ac3313a4;
    to.targetname = from.targetname;
    to.vehicletype = from.vehicletype;
    to.origin = from.origin;
    to.angles = from.angles;
    to.originalorigin = from.originalorigin;
    to.originalangles = from.originalangles;
    to.owner = from.owner;
    to.initialvelocity = from.initialvelocity;
    to.cannotbesuspended = from.cannotbesuspended;
    to.startsuspended = from.startsuspended;
    to.spawntype = from.spawntype;
    to.team = from.team;
    to.ref = from.ref;
}

// Namespace namespace_cfae3bfa0fa8d1dd/namespace_f64231d5b7a2c3c4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xdf6
// Size: 0xba
function vehicle_tracking_registerinstance(vehicle, owner, team) {
    /#
        assertex(isdefined(level.vehicle), "vehicle_tracking_registerInstance() called before vehicle_init().");
    #/
    /#
        assertex(isdefined(level.vehicle.instances), "vehicle_tracking_registerInstance() called before vehicle_tracking_init().");
    #/
    /#
        assertex(isdefined(vehicle.vehiclename), "vehicle_tracking_registerInstance() called with an invalid vehicle.");
    #/
    vehicle_tracking_deregisterinstance(vehicle);
    level.vehicle.instances[vehicle.vehiclename][vehicle getentitynumber()] = vehicle;
    vehicle.vehicleowner = owner;
    vehicle.vehicleteam = team;
}

// Namespace namespace_cfae3bfa0fa8d1dd/namespace_f64231d5b7a2c3c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xeb7
// Size: 0xf0
function vehicle_tracking_deregisterinstance(vehicle) {
    /#
        assertex(isdefined(vehicle.vehiclename), "vehicle_tracking_deregisterInstance() called with an invalid vehicle.");
    #/
    if (!isdefined(level.vehicle)) {
        return;
    }
    if (!isdefined(level.vehicle.instances)) {
        return;
    }
    if (!isdefined(level.vehicle.instances[vehicle.vehiclename])) {
        return;
    }
    level.vehicle.instances[vehicle.vehiclename][vehicle getentitynumber()] = undefined;
    if (level.vehicle.instances[vehicle.vehiclename].size <= 0) {
        level.vehicle.instances[vehicle.vehiclename] = undefined;
    }
    vehicle.vehicleowner = undefined;
    vehicle.vehicleteam = undefined;
}

// Namespace namespace_cfae3bfa0fa8d1dd/namespace_f64231d5b7a2c3c4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0xfae
// Size: 0x84
function vehicle_tracking_limitgameinstances(vehiclename, limit, message) {
    /#
        assertex(isdefined(level.vehicle), "vehicle_tracking_limitGameInstances() called before vehicle_init().");
    #/
    /#
        assertex(isdefined(level.vehicle.instances), "vehicle_tracking_limitGameInstances() called before vehicle_tracking_init().");
    #/
    level.vehicle.instancelimits[vehiclename] = limit;
    level.vehicle.instancelimitmessages[vehiclename] = message;
}

// Namespace namespace_cfae3bfa0fa8d1dd/namespace_f64231d5b7a2c3c4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1039
// Size: 0x9f
function function_5c8408cb68649308(vehiclename, spawntype, limit) {
    /#
        assertex(isdefined(level.vehicle), "vehicle_tracking_limitGameInstances() called before vehicle_init().");
    #/
    /#
        assertex(isdefined(level.vehicle.instances), "vehicle_tracking_limitGameInstances() called before vehicle_tracking_init().");
    #/
    if (!isdefined(level.vehicle.var_eb26b962268635b[vehiclename])) {
        level.vehicle.var_eb26b962268635b[vehiclename] = [];
    }
    level.vehicle.var_eb26b962268635b[vehiclename][spawntype] = limit;
}

// Namespace namespace_cfae3bfa0fa8d1dd/namespace_f64231d5b7a2c3c4
// Params 3, eflags: 0x0
// Checksum 0x0, Offset: 0x10df
// Size: 0x84
function vehicle_tracking_limitownerinstances(vehiclename, limit, message) {
    /#
        assertex(isdefined(level.vehicle), "vehicle_tracking_limitOwnerInstances() called before vehicle_init().");
    #/
    /#
        assertex(isdefined(level.vehicle.instances), "vehicle_tracking_limitOwnerInstances() called before vehicle_tracking_init().");
    #/
    level.vehicle.ownerinstancelimits[vehiclename] = limit;
    level.vehicle.ownerinstancelimitmessages[vehiclename] = message;
}

// Namespace namespace_cfae3bfa0fa8d1dd/namespace_f64231d5b7a2c3c4
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x116a
// Size: 0x84
function vehicle_tracking_limitteaminstances(vehiclename, limit, message) {
    /#
        assertex(isdefined(level.vehicle), "vehicle_tracking_limitTeamInstances() called before vehicle_init().");
    #/
    /#
        assertex(isdefined(level.vehicle.instances), "vehicle_tracking_limitTeamInstances() called before vehicle_tracking_init().");
    #/
    level.vehicle.teaminstancelimits[vehiclename] = limit;
    level.vehicle.teaminstancelimitmessages[vehiclename] = message;
}

// Namespace namespace_cfae3bfa0fa8d1dd/namespace_f64231d5b7a2c3c4
// Params 5, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x11f5
// Size: 0x316
function vehicle_tracking_atinstancelimit(vehiclename, owner, team, spawntype, var_5ba9af6abae862ca) {
    /#
        assertex(isdefined(level.vehicle), "vehicle_tracking_atInstanceLimit() called before vehicle_init().");
    #/
    /#
        assertex(isdefined(level.vehicle.instances), "vehicle_tracking_atInstanceLimit() called before vehicle_tracking_init().");
    #/
    if (!isdefined(level.vehicle.instances[vehiclename])) {
        return 0;
    }
    gamelimit = level.vehicle.instancelimits[vehiclename];
    if (isdefined(gamelimit)) {
        if (isdefined(level.vehicle.instances[vehiclename]) && level.vehicle.instances[vehiclename].size >= gamelimit) {
            return 1;
        }
    }
    var_8fe403544e073db7 = undefined;
    var_6536066694c661fb = undefined;
    if (isdefined(spawntype) && isdefined(level.vehicle.var_eb26b962268635b) && isdefined(level.vehicle.var_eb26b962268635b[vehiclename]) && isdefined(level.vehicle.var_eb26b962268635b[vehiclename][spawntype])) {
        var_8fe403544e073db7 = level.vehicle.var_eb26b962268635b[vehiclename][spawntype];
        var_6536066694c661fb = 0;
    }
    var_7493f9697366d2b = undefined;
    var_a79d78866ac25c77 = undefined;
    if (isdefined(owner)) {
        var_7493f9697366d2b = level.vehicle.ownerinstancelimits[vehiclename];
        var_a79d78866ac25c77 = 0;
    }
    var_3287dcccc68557b3 = undefined;
    teamcount = undefined;
    if (isdefined(team)) {
        var_3287dcccc68557b3 = level.vehicle.teaminstancelimits[vehiclename];
        teamcount = 0;
    }
    if (!isdefined(var_7493f9697366d2b) && !isdefined(var_3287dcccc68557b3) && !isdefined(var_8fe403544e073db7)) {
        return 0;
    }
    foreach (instance in level.vehicle.instances[vehiclename]) {
        if (isdefined(var_7493f9697366d2b) && isdefined(instance.vehicleowner) && instance.vehicleowner == owner) {
            var_a79d78866ac25c77++;
            if (var_a79d78866ac25c77 >= var_7493f9697366d2b) {
                return 1;
            }
        }
        if (isdefined(var_3287dcccc68557b3) && isdefined(instance.vehicleteam) && instance.vehicleteam == team) {
            teamcount++;
            if (teamcount >= var_3287dcccc68557b3) {
                return 1;
            }
        }
        if (isdefined(var_8fe403544e073db7) && isdefined(instance.spawndata) && isdefined(instance.spawndata.spawntype) && instance.spawndata.spawntype == spawntype) {
            var_6536066694c661fb++;
            if (var_6536066694c661fb >= var_8fe403544e073db7) {
                return 1;
            }
        }
    }
    return 0;
}

// Namespace namespace_cfae3bfa0fa8d1dd/namespace_f64231d5b7a2c3c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1513
// Size: 0x76
function vehicle_tracking_getgameinstances(vehiclename) {
    /#
        assertex(isdefined(level.vehicle), "vehicle_tracking_getGameInstances() called before vehicle_init().");
    #/
    /#
        assertex(isdefined(level.vehicle.instances), "vehicle_tracking_getGameInstances() called before vehicle_tracking_init().");
    #/
    if (!isdefined(level.vehicle.instances[vehiclename])) {
        return [];
    }
    return level.vehicle.instances[vehiclename];
}

// Namespace namespace_cfae3bfa0fa8d1dd/namespace_f64231d5b7a2c3c4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x1591
// Size: 0xf5
function vehicle_tracking_getownerinstances(vehiclename, owner) {
    /#
        assertex(isdefined(level.vehicle), "vehicle_tracking_getOwnerInstances() called before vehicle_init().");
    #/
    /#
        assertex(isdefined(level.vehicle.instances), "vehicle_tracking_getOwnerInstances() called before vehicle_tracking_init().");
    #/
    if (!isdefined(level.vehicle.instances[vehiclename])) {
        return [];
    }
    instances = [];
    foreach (instance in level.vehicle.instances[vehiclename]) {
        if (isdefined(instance.vehicleowner) && instance.vehicleowner == owner) {
            instances[instances.size] = instance;
        }
    }
    return instances;
}

// Namespace namespace_cfae3bfa0fa8d1dd/namespace_f64231d5b7a2c3c4
// Params 2, eflags: 0x0
// Checksum 0x0, Offset: 0x168e
// Size: 0xf5
function vehicle_tracking_getteaminstances(vehiclename, team) {
    /#
        assertex(isdefined(level.vehicle), "vehicle_tracking_getTeamInstances() called before vehicle_init().");
    #/
    /#
        assertex(isdefined(level.vehicle.instances), "vehicle_tracking_getTeamInstances() called before vehicle_tracking_init().");
    #/
    if (!isdefined(level.vehicle.instances[vehiclename])) {
        return [];
    }
    instances = [];
    foreach (instance in level.vehicle.instances[vehiclename]) {
        if (isdefined(instance.vehicleteam) && instance.vehicleteam == team) {
            instances[instances.size] = instance;
        }
    }
    return instances;
}

// Namespace namespace_cfae3bfa0fa8d1dd/namespace_f64231d5b7a2c3c4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x178b
// Size: 0xe5
function vehicle_tracking_getgameinstancesforall() {
    /#
        assertex(isdefined(level.vehicle), "vehicle_tracking_getGameInstancesForAll() called before vehicle_init().");
    #/
    if (!isdefined(level.vehicle.instances)) {
        return [];
    }
    instances = [];
    foreach (var_e705b089592c075d in level.vehicle.instances) {
        foreach (instance in var_e705b089592c075d) {
            instances[instances.size] = instance;
        }
    }
    return instances;
}

// Namespace namespace_cfae3bfa0fa8d1dd/namespace_f64231d5b7a2c3c4
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1878
// Size: 0xb7
function vehicle_tracking_instancesarelimited(vehiclename) {
    /#
        assertex(isdefined(level.vehicle), "vehicle_tracking_instancesAreLimited() called before vehicle_init().");
    #/
    /#
        assertex(isdefined(level.vehicle.instances), "vehicle_tracking_instancesAreLimited() called before vehicle_tracking_init().");
    #/
    if (isdefined(level.vehicle.instancelimits[vehiclename])) {
        return 1;
    }
    if (isdefined(level.vehicle.ownerinstancelimits[vehiclename])) {
        return 1;
    }
    if (isdefined(level.vehicle.teaminstancelimits[vehiclename])) {
        return 1;
    }
    if (isdefined(level.vehicle.var_eb26b962268635b[vehiclename])) {
        return 1;
    }
    return 0;
}

// Namespace namespace_cfae3bfa0fa8d1dd/namespace_f64231d5b7a2c3c4
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x1937
// Size: 0x109
function vehicle_tracking_init() {
    /#
        assertex(isdefined(level.vehicle), "vehicle_tracking_init() called before vehicle_init().");
    #/
    /#
        assertex(!isdefined(level.vehicle.instances), "vehicle_tracking_init() should only be called once.");
    #/
    level.vehicle.instances = [];
    level.vehicle.instancelimits = [];
    level.vehicle.ownerinstancelimits = [];
    level.vehicle.teaminstancelimits = [];
    level.vehicle.var_eb26b962268635b = [];
    level.vehicle.instancelimitmessages = [];
    level.vehicle.ownerinstancelimitmessages = [];
    level.vehicle.teaminstancelimitmessages = [];
    level.vehiclecount = 0;
    level.maxvehiclecount = getdvarint(@"hash_a473574b4e4333d0", 128);
}

// Namespace namespace_cfae3bfa0fa8d1dd/namespace_f64231d5b7a2c3c4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1a47
// Size: 0x62
function function_756a8f3f002a11aa(spawndata) {
    /#
        if (!isdefined(spawndata)) {
            thread error("<unknown string>");
            return 0;
        }
        if (!isdefined(spawndata.origin)) {
            thread error("<unknown string>");
            return 0;
        }
        if (!isdefined(spawndata.angles)) {
            thread error("<unknown string>");
            return 0;
        }
        return 1;
    #/
}

// Namespace namespace_cfae3bfa0fa8d1dd/namespace_f64231d5b7a2c3c4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1ab0
// Size: 0x5a
function function_3a040ff591c32b5c(spawndata) {
    /#
        if (!function_756a8f3f002a11aa(spawndata)) {
            return 0;
        }
        if (!isdefined(spawndata.vehicletype)) {
            thread error("<unknown string>");
            return 0;
        }
        if (!isdefined(spawndata.targetname)) {
            thread error("<unknown string>");
            return 0;
        }
        return 1;
    #/
}

// Namespace namespace_cfae3bfa0fa8d1dd/namespace_f64231d5b7a2c3c4
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x1b11
// Size: 0x78
function function_298430b99bada795(spawndata) {
    /#
        if (!function_756a8f3f002a11aa(spawndata)) {
            return 0;
        }
        if (!isdefined(spawndata.owner)) {
            thread error("<unknown string>");
            return 0;
        }
        if (!isdefined(spawndata.vehicletype)) {
            thread error("<unknown string>");
            return 0;
        }
        if (!isdefined(spawndata.modelname)) {
            thread error("<unknown string>");
            return 0;
        }
        return 1;
    #/
}

