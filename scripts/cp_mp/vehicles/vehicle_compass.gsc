// mwiii decomp prototype
#using scripts\engine\utility.gsc;
#using scripts\common\utility.gsc;
#using scripts\cp_mp\vehicles\vehicle_occupancy.gsc;

#namespace vehicle_compass;

// Namespace vehicle_compass/namespace_2a495135d56d95b7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x220
// Size: 0x39
function vehicle_compass_registerinstance(vehicle) {
    leveldata = vehicle_compass_getleveldata();
    leveldata.instances[vehicle getentitynumber()] = vehicle;
    vehicle_compass_show(vehicle);
}

// Namespace vehicle_compass/namespace_2a495135d56d95b7
// Params 1, eflags: 0x0
// Checksum 0x0, Offset: 0x260
// Size: 0x2f
function vehicle_compass_deregisterinstance(vehicle) {
    leveldata = vehicle_compass_getleveldata();
    leveldata.instances[vehicle getentitynumber()] = undefined;
}

// Namespace vehicle_compass/namespace_2a495135d56d95b7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x296
// Size: 0x48
function vehicle_compass_instanceisregistered(vehicle) {
    leveldata = vehicle_compass_getleveldata();
    return isdefined(leveldata.instances[vehicle getentitynumber()]) && leveldata.instances[vehicle getentitynumber()] == vehicle;
}

// Namespace vehicle_compass/namespace_2a495135d56d95b7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x2e6
// Size: 0x81
function vehicle_compass_updatevisibilityforplayer(vehicle, player, var_6ecb77fd1f27c667) {
    leveldata = vehicle_compass_getleveldata();
    if (!leveldata.visibilityisscriptcontrolled) {
        return;
    }
    if (!isdefined(vehicle)) {
        return;
    }
    if (!vehicle_compass_instanceisregistered(vehicle)) {
        if (!istrue(var_6ecb77fd1f27c667)) {
            /#
                assertmsg("vehicle_compass_updateVisibilityForPlayer() called on an unregistered vehicle.");
            #/
        }
        return;
    }
    if (!vehicle_compass_shouldbevisibletoplayer(vehicle, player)) {
        vehicle vehicleshowonminimapforclient(player, 0);
    } else {
        vehicle vehicleshowonminimapforclient(player, 1);
    }
}

// Namespace vehicle_compass/namespace_2a495135d56d95b7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x36e
// Size: 0xa8
function vehicle_compass_updatevisibilityforallplayers(vehicle, var_6ecb77fd1f27c667) {
    leveldata = vehicle_compass_getleveldata();
    if (!leveldata.visibilityisscriptcontrolled) {
        return;
    }
    if (!vehicle_compass_instanceisregistered(vehicle)) {
        if (!istrue(var_6ecb77fd1f27c667)) {
            /#
                assertmsg("vehicle_compass_updateVisibilityForAllPlayers() called on an unregistered vehicle.");
            #/
        }
        return;
    }
    foreach (player in level.players) {
        vehicle_compass_updatevisibilityforplayer(vehicle, player);
    }
}

// Namespace vehicle_compass/namespace_2a495135d56d95b7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x41d
// Size: 0x85
function vehicle_compass_updateallvisibilityforplayer(player) {
    leveldata = vehicle_compass_getleveldata();
    if (!istrue(leveldata.visibilityisscriptcontrolled)) {
        return;
    }
    foreach (instance in leveldata.instances) {
        vehicle_compass_updatevisibilityforplayer(instance, player);
    }
}

// Namespace vehicle_compass/namespace_2a495135d56d95b7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x4a9
// Size: 0x4f
function vehicle_compass_shouldbevisibletoplayer(vehicle, player) {
    if (issharedfuncdefined("vehicle_compass", "shouldBeVisibleToPlayer")) {
        shouldbevisibletoplayer = [[ getsharedfunc("vehicle_compass", "shouldBeVisibleToPlayer") ]](vehicle, player);
        if (isdefined(shouldbevisibletoplayer)) {
            return shouldbevisibletoplayer;
        }
    }
    return 1;
}

// Namespace vehicle_compass/namespace_2a495135d56d95b7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x500
// Size: 0x81
function vehicle_compass_show(vehicle) {
    leveldata = vehicle_compass_getleveldata();
    if (leveldata.visibilityisscriptcontrolled) {
        vehicle vehicleshowonminimap(1);
    }
    if (isdefined(leveldata.instances[vehicle getentitynumber()])) {
        if (level.teambased) {
            vehicle_compass_setteamfriendlyto(vehicle, namespace_1fbd40990ee60ede::vehicle_occupancy_getteamfriendlyto(vehicle));
        } else {
            vehicle_compass_setplayerfriendlyto(vehicle, namespace_1fbd40990ee60ede::vehicle_occupancy_getplayerfriendlyto(vehicle));
        }
        vehicle_compass_updatevisibilityforallplayers(vehicle, 1);
    }
}

// Namespace vehicle_compass/namespace_2a495135d56d95b7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x588
// Size: 0x45
function vehicle_compass_hide(vehicle) {
    leveldata = vehicle_compass_getleveldata();
    leveldata.instances[vehicle getentitynumber()] = undefined;
    if (leveldata.visibilityisscriptcontrolled) {
        vehicle vehicleshowonminimap(0);
    }
}

// Namespace vehicle_compass/namespace_2a495135d56d95b7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x5d4
// Size: 0xb8
function vehicle_compass_setteamfriendlyto(vehicle, team) {
    if (iscp()) {
        var_1e5f7ff00358bc18 = isdefined(vehicle.riders) && vehicle.riders.size > 0 || isdefined(vehicle.runningtovehicle) && vehicle.runningtovehicle.size > 0;
        if (!isdefined(team) || team == "neutral" || istrue(vehicle.isempty) && !var_1e5f7ff00358bc18) {
            team = "none";
        }
    } else if (!isdefined(team) || team == "neutral") {
        team = "none";
    }
    vehicle setvehicleteam(team);
}

// Namespace vehicle_compass/namespace_2a495135d56d95b7
// Params 2, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x693
// Size: 0x1c
function vehicle_compass_setplayerfriendlyto(vehicle, player) {
    vehicle setentityowner(undefined);
}

// Namespace vehicle_compass/namespace_2a495135d56d95b7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x6b6
// Size: 0xec
function vehicle_compass_init() {
    /#
        assertex(isdefined(level.vehicle), "vehicle_compass_init() called before vehicle_init().");
    #/
    /#
        assertex(!isdefined(level.vehicle.compass), "vehicle_compass_init() should only be called once.");
    #/
    leveldata = spawnstruct();
    level.vehicle.compass = leveldata;
    leveldata.instances = [];
    runleanthreadmode = 0;
    if (issharedfuncdefined("game", "runLeanThreadMode")) {
        runleanthreadmode = [[ getsharedfunc("game", "runLeanThreadMode") ]]();
    }
    leveldata.visibilityisscriptcontrolled = !runleanthreadmode || getdvarint(@"hash_61d6ab22f59b15a6", 0) > 0;
    if (issharedfuncdefined("vehicle_compass", "init")) {
        [[ getsharedfunc("vehicle_compass", "init") ]]();
    }
}

// Namespace vehicle_compass/namespace_2a495135d56d95b7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7a9
// Size: 0x38
function vehicle_compass_getleveldata() {
    /#
        assertex(isdefined(level.vehicle.compass), "vehicle_compass_getLevelData() called before vehicle_compass_init().");
    #/
    return level.vehicle.compass;
}

// Namespace vehicle_compass/namespace_2a495135d56d95b7
// Params 3, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x7e9
// Size: 0x91
function vehicle_compass_friendlystatuschangedcallback(vehicle, var_965ea26e6eb230b9, var_52312180ef1940be) {
    leveldata = vehicle_compass_getleveldata();
    isregistered = isdefined(leveldata.instances[vehicle getentitynumber()]) && leveldata.instances[vehicle getentitynumber()] == vehicle;
    if (!isregistered) {
        return;
    }
    if (level.teambased) {
        vehicle_compass_setteamfriendlyto(vehicle, var_52312180ef1940be);
    } else {
        vehicle_compass_setplayerfriendlyto(vehicle, var_52312180ef1940be);
    }
    vehicle_compass_updatevisibilityforallplayers(vehicle);
}

// Namespace vehicle_compass/namespace_2a495135d56d95b7
// Params 1, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x881
// Size: 0x21
function vehicle_compass_playerjoinedteamcallback(player) {
    if (!level.teambased) {
        return;
    }
    vehicle_compass_updateallvisibilityforplayer(player);
}

// Namespace vehicle_compass/namespace_2a495135d56d95b7
// Params 0, eflags: 0x2 linked
// Checksum 0x0, Offset: 0x8a9
// Size: 0xb
function vehicle_compass_playerspawnedcallback() {
    vehicle_compass_updateallvisibilityforplayer(self);
}

